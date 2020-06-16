Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479461FA9CE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 09:14:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl5mm-0006h1-1l; Tue, 16 Jun 2020 07:13:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl5mk-0006gw-5A
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 07:13:30 +0000
X-Inumbo-ID: df1eb006-afa0-11ea-b88c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df1eb006-afa0-11ea-b88c-12813bfff9fa;
 Tue, 16 Jun 2020 07:13:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 48F85AF28;
 Tue, 16 Jun 2020 07:13:29 +0000 (UTC)
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20200613184132.11880-1-julien@xen.org>
 <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2e46c098-10c2-7978-c403-692528bd92b7@suse.com>
Date: Tue, 16 Jun 2020 09:13:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.06.2020 03:00, Stefano Stabellini wrote:
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
>>     Changes in v3:
>>         - Use __i386__ rather than CONFIG_X86_32
>>
>>     Changes in v2:
>>         - It is not possible to use the same padding for 32-bit x86 and
>>         all the other supported architectures.
>> ---
>>  docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
>>  xen/include/public/io/pvcalls.h | 14 ++++++++++++++
>>  2 files changed, 24 insertions(+), 8 deletions(-)
>>
>> diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
>> index 665dad556c39..caa71b36d78b 100644
>> --- a/docs/misc/pvcalls.pandoc
>> +++ b/docs/misc/pvcalls.pandoc
>> @@ -246,9 +246,9 @@ The format is defined as follows:
>>      			uint32_t domain;
>>      			uint32_t type;
>>      			uint32_t protocol;
>> -    			#ifdef CONFIG_X86_32
>> +			#ifndef __i386__
>>      			uint8_t pad[4];
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
>   #ifdef CONFIG_X86_32
>     uint8_t pad[4];
>   #endif
> 
> in pvcalls.pandoc was to make sure that these structs would be 64bit
> aligned on x86_32 too.
> 
> I realize that the public header doesn't match, but the spec is the
> "master copy". We have been saying it for a while (Andy in particular)
> that the specification documents are the one that define the protocol,
> not the public headers. This is the very first time we get to act on
> that statement. What a special occasion this is :-)
> 
> So I think we should keep the specification as is and fix the public
> header instead. Something like v1 of this patch.

But you've read the communication on v1 and v2? A public header
can't be "fixed" if it may already be in use by anyone. We can
only do as Andrew and you suggest (mandate textual descriptions
to be "the ABI") when we do so for _new_ interfaces from the
very beginning, making clear that the public header (if any)
exists just for reference.

I'm not convinced btw that expressing at least the majority of
an ABI by way of a C reference implementation is a bad or
unsuitable thing. It's just that aspects like underlying type
properties need to be very clear and unambiguous.

Jan

