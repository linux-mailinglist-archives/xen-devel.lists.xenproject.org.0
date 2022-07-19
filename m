Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E757A47C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jul 2022 19:03:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370768.602640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDqcW-0008RY-PT; Tue, 19 Jul 2022 17:02:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370768.602640; Tue, 19 Jul 2022 17:02:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDqcW-0008Or-Mq; Tue, 19 Jul 2022 17:02:52 +0000
Received: by outflank-mailman (input) for mailman id 370768;
 Tue, 19 Jul 2022 17:02:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLto=XY=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1oDqcV-0008Oj-Hn
 for xen-devel@lists.xenproject.org; Tue, 19 Jul 2022 17:02:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e0eb89f-0784-11ed-bd2d-47488cf2e6aa;
 Tue, 19 Jul 2022 19:02:50 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1658250165034752.3988518718096;
 Tue, 19 Jul 2022 10:02:45 -0700 (PDT)
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
X-Inumbo-ID: 9e0eb89f-0784-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; t=1658250165; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CFLDJd9Em1jJv336mdg6zkqAoal+0XG/iDEv6+FahkoCwdw8KCn/xt7fiftNYX2pRZMgppKVlpj4JKD1nuzcVrGZs2GVIKLN8o+hlXacIclChrnPxlHoHmjgAtxO7hNgsPyAGA+F3ktxREfQpQQgQHIiQsGFpgv2kIVmj6EHHbA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1658250165; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fnOF9r7CK5QX0xoHgOGE+YFAoCHf4C2TBzNsgNwS9pE=; 
	b=hR7DLx03UXUvk7IhnytKgaWXCJ/w3pEmes+cAivVjwdOIWeYZW6+2h7gquZIS+2yDeKhzl5vZQyDUknd2QSBJoFdi6k69zymNvKpXznecG2ivKoFcCHShrquj0kvfvIx22xf3aVUwo0ryyemDC7KscunBMkflZY5dcfujqhxqOQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658250165;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fnOF9r7CK5QX0xoHgOGE+YFAoCHf4C2TBzNsgNwS9pE=;
	b=MZiNnkEXi/7r+pk6cbY+Zebyr+kzpErHg7GGcWxoPmmV9Lnn6KxKkQbfP8nzyIjn
	d5vjlBr4W4hEWF/D/Tkx/9JPVPBmTRC1pKJQ5MljMNkGPuOY2jl0bmLfZSmd3dltjB9
	z8kYUmSK2jLO3IFgqY6Ys9o/i5o6eZx9tHhjG5cw=
Message-ID: <e6484f17-b79f-35c7-2d1d-d03bae7c0973@apertussolutions.com>
Date: Tue, 19 Jul 2022 13:02:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, christopher.clark@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>
References: <20220706210454.30096-1-dpsmith@apertussolutions.com>
 <20220706210454.30096-2-dpsmith@apertussolutions.com>
 <59114d3a-b9fe-1fb0-fac3-fe14fe4c505f@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v1 01/18] kconfig: allow configuration of maximum modules
In-Reply-To: <59114d3a-b9fe-1fb0-fac3-fe14fe4c505f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/19/22 05:32, Jan Beulich wrote:
> On 06.07.2022 23:04, Daniel P. Smith wrote:
>> --- a/xen/arch/Kconfig
>> +++ b/xen/arch/Kconfig
>> @@ -17,3 +17,15 @@ config NR_CPUS
>>  	  For CPU cores which support Simultaneous Multi-Threading or similar
>>  	  technologies, this the number of logical threads which Xen will
>>  	  support.
>> +
>> +config NR_BOOTMODS
>> +	int "Maximum number of boot modules that a loader can pass"
>> +	range 1 32768
>> +	default "8" if X86
>> +	default "32" if ARM
> 
> Any reason for the larger default on Arm, irrespective of dom0less
> actually being in use? (I'm actually surprised I can't spot a Kconfig
> option controlling inclusion of dom0less. The default here imo isn't
> supposed to depend on the architecture, but on whether dom0less is
> supported. That way if another arch gained dom0less support, the
> higher default would apply to it without needing further adjustment.)

Yes, multidomain construction is always on for Arm and the only
configurable is a commandline parameter to enforce that dom0 is not
created. As for the default, it was selected based on the largest value
used in the locations replaced by the Kconfig variable. Since there was
a significant difference between Arm and x86, I did not feel it was
appropriate to reduce/increase either, since it drives multiple static
array allocations for x86.

I have no attachments to any specific value, so I will freely adjust to
whatever conscience the community might come to.

>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -18,7 +18,7 @@ static multiboot_info_t __initdata mbi = {
>>   * The array size needs to be one larger than the number of modules we
>>   * support - see __start_xen().
>>   */
>> -static module_t __initdata mb_modules[5];
>> +static module_t __initdata mb_modules[CONFIG_NR_BOOTMODS + 1];
> 
> If the build admin selected 1, I'm pretty sure about nothing would work.
> I think you want max(5, CONFIG_NR_BOOTMODS) or
> max(4, CONFIG_NR_BOOTMODS) + 1 here and ...

Actually, I reasoned this out and 1 is in fact a valid value. It would
mean Xen + Dom0 Linux kernel with embedded initramfs with no externally
loaded XSM policy and no boot time microcode patching. This is a working
configuration, but open to debate if it is a desirable configuration.
The question is whether it is desired to block someone from building
such a configuration, or any number between 1 and 4. If the answer is
yes, then why not just set the lower bound of the range in the Kconfig
file instead of having to maintain a hard-coded lower bound in a max
marco across multiple locations?

>> --- a/xen/arch/x86/guest/xen/pvh-boot.c
>> +++ b/xen/arch/x86/guest/xen/pvh-boot.c
>> @@ -32,7 +32,7 @@ bool __initdata pvh_boot;
>>  uint32_t __initdata pvh_start_info_pa;
>>  
>>  static multiboot_info_t __initdata pvh_mbi;
>> -static module_t __initdata pvh_mbi_mods[8];
>> +static module_t __initdata pvh_mbi_mods[CONFIG_NR_BOOTMOD + 1];
> 
> ... max(8, CONFIG_NR_BOOTMODS) here (albeit the 8 may have room for
> lowering - I don't recall why 8 was chosen rather than going with
> the minimum possible value covering all module kinds known at that
> time).

This is what drove the default for x86 in Kconfig to be 8. I thought it
was excessive but assumed there was some reason for the value. And see
my comment above whether it should be max({n},CONFIG_NR_BOOTMOD) vs
range {n}..32768.

