Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE46302306
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 09:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73922.132849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3xcH-000709-Qe; Mon, 25 Jan 2021 08:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73922.132849; Mon, 25 Jan 2021 08:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3xcH-0006zk-NI; Mon, 25 Jan 2021 08:52:57 +0000
Received: by outflank-mailman (input) for mailman id 73922;
 Mon, 25 Jan 2021 08:52:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dw2F=G4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l3xcG-0006zf-BV
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 08:52:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 799a79b1-5973-482d-bc65-438973b99a4e;
 Mon, 25 Jan 2021 08:52:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 323ECAD6B;
 Mon, 25 Jan 2021 08:52:51 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 799a79b1-5973-482d-bc65-438973b99a4e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611564771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pSGQ6U1yrJo1Ice2oTNmjO96wl9Jtce2vcmxTSXYd/U=;
	b=YRv/CPaNhbupxnCxJs/X509zRAN4ewIs1BgOw5hBWnn+FYjd0OfghvohfNtkikn7QcUSW9
	m2A5784WneH6ABA4N9kKheZo+xqgwdsAfQ1u/zj4hGoYfP9FxbXLg7g/JZd5B4w0VjST3M
	J3mPOStew8H61u5W4xtUVOiuwTcKJSI=
Subject: Re: [PATCH v3 0/5] Support Secure Boot for multiboot2 Xen
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Olivier Lambert <olivier.lambert@vates.fr>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <109ab168-b312-0082-dfd7-d990bab82480@suse.com> <YAtBH/XYrp2Nrfy2@piano>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e5e4b26-d956-976d-f076-27eb0f8f479c@suse.com>
Date: Mon, 25 Jan 2021 09:52:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YAtBH/XYrp2Nrfy2@piano>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.01.2021 22:18, Bobby Eshleman wrote:
> On Fri, Jan 22, 2021 at 10:39:28AM +0100, Jan Beulich wrote:
>> On 22.01.2021 01:51, Bobby Eshleman wrote:
>>> I followed with v2 feedback and attempted to convert the PE/COFF header
>>> into C instead of ASM.  Unfortunately, this was only possible for the
>>> first part (Legacy) of the PE/COFF header.  The other parts required
>>> addresses only available at link time (such as __2M_rwdata_end,
>>> __pe_SizeOfImage, efi_mb_start address, etc...), which effectively ruled
>>> out C.
>>
>> I don't follow the conclusion drawn, so would you mind going into
>> further detail?
>>
> 
> No problem at all, bad explanation on my part.  The core issue is
> actually about the legality of casting 64-bit addresses to 32-bit values
> in constant expressions, which then is sometimes complained about by GCC
> in terms of load-time computability...
> 
> Taking __2M_rwdata_end as an example.  Attempting to use it in
> the PE/COFF optional header in C looks something like:
> 
> extern const char __2M_rwdata_end[];
> extern const char efi_pe_head_end[];
> 
> struct optional_header optional_header = {
> ...
>     .code_size = (uint32_t)((unsigned long)&__2M_rwdata_end) -
>                     (uint32_t)((unsigned long)&efi_pe_head_end,
> ...
> }
> 
> GCC throws "error: initializer element is not constant" because casting
> a 64-bit address to a 32-bit value is not a legal constant expression
> for static storage class objects, even though we know that in practice
> the address wouldn't ever be above 4GB.
> 
> efi_pe_head_end could potentially be calculated by header struct sizes,
> but doing that predictably yields the same error.
> 
> If we drop the explicit casting, GCC throws 'error: initializer element
> is not computable at load time'.

Ah yes, I see now, and I'm aware of the compiler shortcoming.
Even with the not really necessary uint32_t casts dropped the
problem would still be there. So for your description this
means it's not "required addresses only available at link time"
but "required differences of addresses not computable or
expressable at compile time".

Jan

> tl;dr:
> 
> I could not find a way to derive code size (data sections and all)
> without using a symbol location, which is an illegal constant expression
> operand for initializing static storage class objects... and I could not
> find a way to define the header in C without using an object of static
> storage class (global variable or static variable).
> 
> -Bob
> 


