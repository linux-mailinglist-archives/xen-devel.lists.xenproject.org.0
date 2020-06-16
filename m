Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516441FACE1
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 11:40:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl84T-0003Qs-8k; Tue, 16 Jun 2020 09:39:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOm8=75=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jl84R-0003Qn-Tm
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 09:39:56 +0000
X-Inumbo-ID: 54d85e64-afb5-11ea-b89c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54d85e64-afb5-11ea-b89c-12813bfff9fa;
 Tue, 16 Jun 2020 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dIVZIIj1oHbuogxwyQF6MVp3lZJUeLEuAu2G6vtH048=; b=hkyEwY3gD/D0PVBl13djH3mhJo
 fWkWTjh8Pv4uCSp7qXoPlxSEbMZJgtbYExqdUF1UiOxNWFvj0EnwCYb5QpDXvJ+se0/05zseKHR7x
 1i3lbkR+7j5xv7xWQF3HmKOHxubhQp7/HUO0x3Rc0c8sKGl7pOvcM+k2gMv2n3ca9QQI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl84M-0002DL-QQ; Tue, 16 Jun 2020 09:39:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl84M-0005vR-Je; Tue, 16 Jun 2020 09:39:50 +0000
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200613184132.11880-1-julien@xen.org>
 <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <35c8373f-b691-d95e-17de-021c72faf216@xen.org>
Date: Tue, 16 Jun 2020 10:39:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, paul@xen.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 16/06/2020 02:00, Stefano Stabellini wrote:
> On Sat, 13 Jun 2020, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The documentation of pvcalls suggests there is padding for 32-bit x86
>> at the end of most the structure. However, they are not described in
>> in the public header.
>>
>> Because of that all the structures would be 32-bit aligned and not
>> 64-bit aligned for 32-bit x86.
>>
>> For all the other architectures supported (Arm and 64-bit x86), the
>> structure are aligned to 64-bit because they contain uint64_t field.
>> Therefore all the structures contain implicit padding.
>>
>> The paddings are now corrected for 32-bit x86 and written explicitly for
>> all the architectures.
>>
>> While the structure size between 32-bit and 64-bit x86 is different, it
>> shouldn't cause any incompatibility between a 32-bit and 64-bit
>> frontend/backend because the commands are always 56 bits and the padding
>> are at the end of the structure.
>>
>> As an aside, the padding sadly cannot be mandated to be 0 as they are
>> already present. So it is not going to be possible to use the padding
>> for extending a command in the future.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>      Changes in v3:
>>          - Use __i386__ rather than CONFIG_X86_32
>>
>>      Changes in v2:
>>          - It is not possible to use the same padding for 32-bit x86 and
>>          all the other supported architectures.
>> ---
>>   docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
>>   xen/include/public/io/pvcalls.h | 14 ++++++++++++++
>>   2 files changed, 24 insertions(+), 8 deletions(-)
>>
>> diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
>> index 665dad556c39..caa71b36d78b 100644
>> --- a/docs/misc/pvcalls.pandoc
>> +++ b/docs/misc/pvcalls.pandoc
>> @@ -246,9 +246,9 @@ The format is defined as follows:
>>       			uint32_t domain;
>>       			uint32_t type;
>>       			uint32_t protocol;
>> -    			#ifdef CONFIG_X86_32
>> +			#ifndef __i386__
>>       			uint8_t pad[4];
>> -    			#endif
>> +			#endif
> 
> 
> Hi Julien,
> 
> Thank you for doing this, and sorry for having missed v2 of this patch, I
> should have replied earlier.
> 
> The intention of the #ifdef blocks like:
> 
>    #ifdef CONFIG_X86_32
>      uint8_t pad[4];
>    #endif
> 
> in pvcalls.pandoc was to make sure that these structs would be 64bit
> aligned on x86_32 too.
> 
> I realize that the public header doesn't match, but the spec is the
> "master copy". 

So far, the public headers are the defacto official ABI. So did you mark 
the pvcall header as just a reference?

> We have been saying it for a while (Andy in particular)
> that the specification documents are the one that define the protocol,
> not the public headers. This is the very first time we get to act on
> that statement. What a special occasion this is :-) >
> So I think we should keep the specification as is and fix the public
> header instead. Something like v1 of this patch.

Well, the header is now part of multiple open-source projects (don't 
know about private). So adding padding will result to incompatibility 
between two x86 32-bit entities that may disagree on the ABI if they are 
using the per-command structure.

TBH, I don't think the issue is worth the breakage here. You will never 
be able to use those paddings in any case as they are not reserved as 0.

Cheers,

-- 
Julien Grall

