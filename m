Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE68244EB5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 21:15:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6fA6-0000xZ-4R; Fri, 14 Aug 2020 19:14:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=osIB=BY=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k6fA5-0000xU-9V
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 19:14:45 +0000
X-Inumbo-ID: 9008d7f4-3ff1-4554-9d46-10332a8bcb08
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9008d7f4-3ff1-4554-9d46-10332a8bcb08;
 Fri, 14 Aug 2020 19:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=d7UCQrvO7D9DoLD3bgQzFhBcOYJ5ZhVaOhl+/fr0P+8=; b=6SKf6EKhZhYYt/BRemYcH6E3fL
 MLlfDpknKqPWPuVsxDr7a/xNDPSZ+Bzy/IDTqEfvapZKKC0WwLT6313msOkaVZZcnVhaavsFoA2E1
 uDNAn2cAAKjkUzVLru8LXptDZkrOlFDcWe2ZuemZm4UlUaDUKnFvd7nQ9YQzXfqh5b34=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6fA0-0004v8-Vz; Fri, 14 Aug 2020 19:14:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k6fA0-0002Bz-N4; Fri, 14 Aug 2020 19:14:40 +0000
Subject: Re: [RESEND][PATCH v2 6/7] xen/guest_access: Consolidate guest access
 helpers in xen/guest_access.h
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-7-julien@xen.org>
 <17a7da1c-78eb-a86b-85f1-2372af93476e@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9850d74b-7ec1-7c11-7093-2cc0b69ec2af@xen.org>
Date: Fri, 14 Aug 2020 20:14:38 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <17a7da1c-78eb-a86b-85f1-2372af93476e@suse.com>
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

Hi Jan,

On 31/07/2020 12:45, Jan Beulich wrote:
> On 30.07.2020 20:18, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Most of the helpers to access guest memory are implemented the same way
>> on Arm and x86. The only differences are:
>>      - guest_handle_{from, to}_param(): while on x86 XEN_GUEST_HANDLE()
>>        and XEN_GUEST_HANDLE_PARAM() are the same, they are not on Arm. It
>>        is still fine to use the Arm implementation on x86.
> 
> Is the description stale? I don't think there's any guest_handle_from_param()
> anymore.

Yes, I forgot you removed it. I will update the commit message.

> 
>>      - __clear_guest_offset(): Interestingly the prototype does not match
>>        between the x86 and Arm. However, the Arm one is bogus. So the x86
>>        implementation can be used.
>>      - guest_handle{,_subrange}_okay(): They are validly differing
>>        because Arm is only supporting auto-translated guest and therefore
>>        handles are always valid.
>>
>> In the past, the ia64 and ppc64 port use a different model to access
>> guest parameter. They have been long gone now.
>>
>> Given Xen currently only support 2 archictures, it is too soon to have a
>> directory asm-generic as it is not possible to differentiate it with the
>> existing directory xen/. If/When there is a 3rd port, we can decide to
>> create the new directory if that new port decide to use a different way
>> to access guest parameter.
>>
>> For now, consolidate it in xen/guest_access.h.
>>
>> While it would be possible to adjust the coding style at the same, this
>> is left for a follow-up patch so 'diff' can be used to check the
>> consolidation was done correctly.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Apart from the above
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks!

Cheers,

-- 
Julien Grall

