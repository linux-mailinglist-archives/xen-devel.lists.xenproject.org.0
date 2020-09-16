Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C45826C023
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 11:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kITPQ-0004a8-QF; Wed, 16 Sep 2020 09:07:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kITPP-0004a3-Co
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 09:07:23 +0000
X-Inumbo-ID: 36b8aa6e-77af-4e8f-93ab-19b751a9e633
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36b8aa6e-77af-4e8f-93ab-19b751a9e633;
 Wed, 16 Sep 2020 09:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=5YX9UtN+XRhEjWtiem57UOjMErkg7d2BctOR2pW3s+Y=; b=gle4Mvk/7quJphKeE/J/GVbE+R
 hIH16EhkURYv7ZEUvBcH2wliZfLA4sO1nfrW8/PEBnGLypmYNi6q62JEXAMPy46d6U+X+Z30XSp0O
 B05eFPl6vaRpwhKKkpz4o6BCDEXcmFSK3L/OaT2BkPUeRuO8roG5HrIhqrL2gBzE3g0o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kITPM-0001RS-QW; Wed, 16 Sep 2020 09:07:20 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kITPM-0002jY-Gd; Wed, 16 Sep 2020 09:07:20 +0000
Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
To: Jan Beulich <jbeulich@suse.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <jgrall@amazon.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
 <44b19ee1-dc34-3a46-0b4b-7196faadcb5c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c87089d5-39d2-55e6-5539-97af32c3d6cd@xen.org>
Date: Wed, 16 Sep 2020 10:07:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <44b19ee1-dc34-3a46-0b4b-7196faadcb5c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 16/09/2020 10:04, Jan Beulich wrote:
> On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
>> @@ -1325,7 +1327,7 @@ static int hvm_send_buffered_ioreq(struct hvm_ioreq_server *s, ioreq_t *p)
>>   
>>           new.read_pointer = old.read_pointer - n * IOREQ_BUFFER_SLOT_NUM;
>>           new.write_pointer = old.write_pointer - n * IOREQ_BUFFER_SLOT_NUM;
>> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
>> +        guest_cmpxchg64(d, &pg->ptrs.full, old.full, new.full);
> 
> But the memory we're updating is shared with s->emulator, not with d,
> if I'm not mistaken.

It is unfortunately shared with both s->emulator and d when using the 
legacy interface.

For Arm, there is no plan to support the legacy interface, so we should 
s->emulator and we should be fully protected.

Cheers,

-- 
Julien Grall

