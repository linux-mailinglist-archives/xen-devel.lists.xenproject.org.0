Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3911B1C9C70
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 22:33:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWnCZ-0006xF-8y; Thu, 07 May 2020 20:33:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K0Sz=6V=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jWnCY-0006x9-8b
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 20:33:02 +0000
X-Inumbo-ID: f251d90a-90a1-11ea-ae69-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f251d90a-90a1-11ea-ae69-bc764e2007e4;
 Thu, 07 May 2020 20:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bBjs2qmXjdr8iYkSW/QaZAeiIo8xT/zoUOuguI3EQzs=; b=Zqr5Ch9LasTEkftvYbGB0EheSc
 axT6Yhfsx5Zc6xrI+W6kI+qD7wj4qBCU4KnFD8zHjJotxYRtcpQtOXRcWGjXAm0dXRTTjw/3bBY05
 hRa15D4BTrvySaOL3yAz3384t9CPHHqdRqM7Zpd4cCZvT966mkb1zQEklsZaqCPUMrXE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jWnCU-0007FD-UC; Thu, 07 May 2020 20:32:58 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jWnCU-000626-Lq; Thu, 07 May 2020 20:32:58 +0000
Subject: Re: [PATCH for-4.14 1/3] xen/arm: atomic: Allow read_atomic() to be
 used in more cases
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200502160700.19573-1-julien@xen.org>
 <20200502160700.19573-2-julien@xen.org>
 <alpine.DEB.2.21.2005071325210.14706@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <0db53f23-197c-0dcc-b89f-274597ebc32d@xen.org>
Date: Thu, 7 May 2020 21:32:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2005071325210.14706@sstabellini-ThinkPad-T480s>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Julien Grall <jgrall@amazon.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 07/05/2020 21:29, Stefano Stabellini wrote:
>>   #define read_atomic(p) ({                                               \
>> -    typeof(*p) __x;                                                     \
>> -    switch ( sizeof(*p) ) {                                             \
>> -    case 1: __x = (typeof(*p))read_u8_atomic((uint8_t *)p); break;      \
>> -    case 2: __x = (typeof(*p))read_u16_atomic((uint16_t *)p); break;    \
>> -    case 4: __x = (typeof(*p))read_u32_atomic((uint32_t *)p); break;    \
>> -    case 8: __x = (typeof(*p))read_u64_atomic((uint64_t *)p); break;    \
>> -    default: __x = 0; __bad_atomic_size(); break;                       \
>> -    }                                                                   \
>> -    __x;                                                                \
>> +    union { typeof(*p) val; char c[0]; } x_;                            \
>> +    read_atomic_size(p, x_.c, sizeof(*p));                              \
> 
> Wouldn't it be better to pass x_ as follows:
> 
>      read_atomic_size(p, &x_, sizeof(*p));

I am not sure to understand this. Are you suggesting to pass a pointer 
to the union?

Cheers,

-- 
Julien Grall

