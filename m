Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BB357E17E
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jul 2022 14:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.373192.605263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oErrg-0005pC-Eh; Fri, 22 Jul 2022 12:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 373192.605263; Fri, 22 Jul 2022 12:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oErrg-0005n1-By; Fri, 22 Jul 2022 12:34:44 +0000
Received: by outflank-mailman (input) for mailman id 373192;
 Fri, 22 Jul 2022 12:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fVTW=X3=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oErrf-0005mv-62
 for xen-devel@lists.xenproject.org; Fri, 22 Jul 2022 12:34:43 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6fd23ac-09ba-11ed-bd2d-47488cf2e6aa;
 Fri, 22 Jul 2022 14:34:41 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658493272370405.0185814564628;
 Fri, 22 Jul 2022 05:34:32 -0700 (PDT)
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
X-Inumbo-ID: a6fd23ac-09ba-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658493273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Eyfs70f3jJJkvzVl2KpgfTQCWrgFkmLGuAqHX3b/2tT/Hb2hWHiW+wrSr78xQtrPIRap1YuuXxwBkrVzHEHfy6zblA4JXpqkjPuo4+p4XvhH0bFzmcuKvn5Xl7HlC2Mw6YjWXRNs9bAt9GR5eZvQbH047d12s2ZkZrrbGpzAnqw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658493273; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=9FY1k4OtkebniC+PPty7n2xQX9sMYMkEdbwDoDPv2cY=; 
	b=IJ8rdap82/PalownHnQbUoejBCRStCx2cIXZbS/F7P3e5s/VUbBtlkFfj/GXiGdfI9OFoNe6aIycqm8nxfvberkO3SP+JyO+QbExbU1ob6qGGTOiS7rwuAwjCkMokyH62ETJIy9RTCB2SFeK2VzWkIvp7MjCMQt7nB/KkD1/Lg0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658493273;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=9FY1k4OtkebniC+PPty7n2xQX9sMYMkEdbwDoDPv2cY=;
	b=VrDcvNmHpx5E5B8Q8b4dJZ61AGF0w64bIIQPqK78UUT1CWYoQOKAOHrEGuO/ScEj
	GmO9dK+ftY1IHACikuWvM0ZcLgP/vRatI5PG1VdxoFjZNtd8LPZ06UnaPyjhq7Z3qQl
	34ifaoOEjkhD4trNXmMqM6SEGKdnYwJXcbWdGIgY=
Message-ID: <57b4d7cc-561c-efbe-43cd-522d0a9d61fa@apertussolutions.com>
Date: Fri, 22 Jul 2022 08:34:08 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-4-dpsmith@apertussolutions.com>
 <e51c7a13-24e8-e07b-445d-4dfad9302c67@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 03/18] x86: adopt new boot info structures
In-Reply-To: <e51c7a13-24e8-e07b-445d-4dfad9302c67@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/19/22 09:19, Jan Beulich wrote:
> On 06.07.2022 23:04, Daniel P. Smith wrote:
>> This commit replaces the use of the multiboot v1 structures starting
>> at __start_xen(). The majority of this commit is converting the fields
>> being accessed for the startup calculations. While adapting the ucode
>> boot module location logic, this code was refactored to reduce some
>> of the unnecessary complexity.
> 
> Things like this or ...
> 
>> --- a/xen/arch/x86/bzimage.c
>> +++ b/xen/arch/x86/bzimage.c
>> @@ -69,10 +69,8 @@ static __init int bzimage_check(struct setup_header *hdr, unsigned long len)
>>      return 1;
>>  }
>>  
>> -static unsigned long __initdata orig_image_len;
>> -
>> -unsigned long __init bzimage_headroom(void *image_start,
>> -                                      unsigned long image_length)
>> +unsigned long __init bzimage_headroom(
>> +    void *image_start, unsigned long image_length)
>>  {
>>      struct setup_header *hdr = (struct setup_header *)image_start;
>>      int err;
>> @@ -91,7 +89,6 @@ unsigned long __init bzimage_headroom(void *image_start,
>>      if ( elf_is_elfbinary(image_start, image_length) )
>>          return 0;
>>  
>> -    orig_image_len = image_length;
>>      headroom = output_length(image_start, image_length);
>>      if (gzip_check(image_start, image_length))
>>      {
>> @@ -104,12 +101,15 @@ unsigned long __init bzimage_headroom(void *image_start,
>>      return headroom;
>>  }
>>  
>> -int __init bzimage_parse(void *image_base, void **image_start,
>> -                         unsigned long *image_len)
>> +int __init bzimage_parse(
>> +    void *image_base, void **image_start, unsigned int headroom,
>> +    unsigned long *image_len)
>>  {
>>      struct setup_header *hdr = (struct setup_header *)(*image_start);
>>      int err = bzimage_check(hdr, *image_len);
>> -    unsigned long output_len;
>> +    unsigned long output_len, orig_image_len;
>> +
>> +    orig_image_len = *image_len - headroom;
>>  
>>      if ( err < 0 )
>>          return err;
>> @@ -125,7 +125,7 @@ int __init bzimage_parse(void *image_base, void **image_start,
>>  
>>      BUG_ON(!(image_base < *image_start));
>>  
>> -    output_len = output_length(*image_start, orig_image_len);
>> +    output_len = output_length(*image_start, *image_len);
>>  
>>      if ( (err = perform_gunzip(image_base, *image_start, orig_image_len)) > 0 )
>>          err = decompress(*image_start, orig_image_len, image_base);
> 
> ... whatever the deal is here want factoring out. Also you want to avoid
> making formatting changes (like in the function headers here) in an
> already large patch, when you don't otherwise touch the functions. I'm
> not even convinced the formatting changes are desirable here, so I'd
> like to ask that even on code you do touch for other reasons you do so
> only if the existing layout ends up really awkward.

Ack. As I mentioned, I tried dropping these based on past reviews. I
will do another pass to try to catch just formatting and drop them.

> I have not looked in any further detail at this patch, sorry. Together
> with my comment on the earlier patch I conclude that it might be best
> if you moved things to the new representation field by field (or set of
> related fields), introducing the new fields in the abstraction struct
> as they are being made use of.

I am not sure whether it is possible to do this field by field. This is
why I was asking on IRC on about dealing with this kind of situation. As
soon as multiboot_info_t/module_t are replaced with struct
boot_info{}/struct boot_module{} a wholesale replacement must be done.

v/r,
dps

