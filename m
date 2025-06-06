Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3532CACFD87
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 09:33:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008040.1387262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRZR-0004bE-Mg; Fri, 06 Jun 2025 07:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008040.1387262; Fri, 06 Jun 2025 07:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNRZR-0004aD-Js; Fri, 06 Jun 2025 07:32:57 +0000
Received: by outflank-mailman (input) for mailman id 1008040;
 Fri, 06 Jun 2025 07:32:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fiyi=YV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uNRZP-0004a7-So
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 07:32:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74c796d8-42a8-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 09:32:53 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 9C5024EE7C3E;
 Fri,  6 Jun 2025 09:32:52 +0200 (CEST)
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
X-Inumbo-ID: 74c796d8-42a8-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1749195172;
	b=OjcHRYvUB2s1PuOMSOma4wzlzxwgkam1pXi3/uhpybt/wG3KIU6cWC9Ey0blJYeJ4zw3
	 HtZk72AzWvsBozyrkHO8aN8fkb4d3GY5xCrEeAK+omqu2/5tc8qgc/G+lW/EDhlcVCD8D
	 ZO6NoconcRMJNDO/vnhy8IIsBAXw2fDqn7H2MwgRFTdGt6zRxrL7hRXa0xX0wS7lVMD+U
	 qOpHS2gfikqm9y69+puBT5Hl4Deo9BcVz5SFA1EqTe5eJqDt79pfFn3Nl6lItEtwlglKM
	 qtvGIJP2hpwrYjL8bKV5e+LAUw5n9o4RUdP7dGJVuHlL2oSBexxtIV32nnE6WsMZ5H9wq
	 ct8l23CADPQT82WoJLa6T6kg3e4zCEZULfbZoMbj7KeBGS41drnTJhDvClfgppJW1OL/5
	 gmB/jzVaKOz8/x4nG2JpAOm1FlGiRCUck7585Bh7AcJCoOqfALiYbF/bUvQcoDIPxnNmW
	 k29ThVtDDj8V2A8mfWED5QItZbcI6nWlDUQGzu4zLPUfBCO7dsH9hZUJ+12REwYL3xOv9
	 lTTbsDTbRM3oCB2DXqAKonsMsMYeqpoi1DgpoP3PeKCnuj1PHOPhcn3dawRVjz0dYkAtQ
	 F1j6XlwvyFcr/UhtCscDDvA9tUWYbK2FVAhhtFmvmdLQC8VL9jv3ZHxXyR/GIRw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1749195172;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=HgPNedsYlwbOc7cUQmy6ljCINsFGRyE9RhUOFRSvwDE=;
	b=rayagchkWZa5wJp/ziT8Wd069P2HYSBQdZzEUwyzUDmHcYLvne/jYeXUE4SepzCzzQlC
	 /g2WH5KDgCTiuXUkpXajOa108jQ0Q/CDwKRfxXsn/BIotPEazE5cV4JIA/BsffWcSKNzT
	 14//7y2IzyafGMNPUJyKMxRotxjp8TgPkwP6SoVG4AAnsAYN/q2CVkGO3me3TpoDMeHsQ
	 Q9Ms6sKlkgLSbcqaTZphB5NMYg/sANp9k9cvpqCbsJeyaeoyS0pUOb4iEo7mgslnXZOuL
	 HV3f49izBXYcRlivPGUFW00TWQssMiEyp1VqkIdIfyqNzimwQMwLGUaEQq6K319Cs132n
	 DBIrLSZrpLkPVU2aDJt+NNX/wezL5yahKOHuyFK1HVKFT4Z91NP7R0M/8tLyvObse+oaM
	 rlTeDXFZFTx0/Qf3gwAw+l1EkrPrf6c4hJfqiJXOxtFYVmYrXXXOLMxieNXeUu7MClGW1
	 e0HFTXRZgOs1smRY3vyzNoIPa9OciDuQhw6Jx67t92IvhdkuIdNpqv1rxXu4NHncLvVTs
	 TjCqqRBU7BD0t1A7A0Ci/RJkQKxO3wsg+BWwLccjAr8ZkyL0ihOQWmrMxwGOUot2xrovo
	 LRwDK0J4o9nO5JTYtcY3UUpGNM0zoNAkAVIKCX8oFoAWd5H1qp6Jki+5sgwyJcQ=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1749195172; bh=rEhwkFNAQFk8bQpiUn8z+pVnKBcVmNgI04eY5APAy4M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZyZ587RkIWBZX0/gGmdSmoF3xEFjLRfhvtTezJq7KLQGrWQ2dmvCiRvfygDB81GhT
	 FY2Gj0AtNtvMIWM65Wt7AN5IzdiMSyL40ZEhxZMCZYs4XpIOBj5DcWowY4DJAJXRnJ
	 fOfoBChlZnNPncv0gVhiHsLDYGUBNv14lY0ckCcqrIlMOBXlHWZrnYi4OJvkRkBHHW
	 7Ms2S2NyW2ewaQvl0yr1CWPa86lzGzsnbQQPA5Il9yt8C+blc/GCgKlJQFdE26mu0Y
	 i0nkxh8Plnh+mBl4bglD/YuPfKHS1VRs5cWyqacEEyUVNU01xrhxY71VEcJ+0s2ZEU
	 GxeLU1AfG6WgQ==
MIME-Version: 1.0
Date: Fri, 06 Jun 2025 09:32:52 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Stefano Stabellini
 <stefano.stabellini@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Alessandro
 Zucchelli <alessandro.zucchelli@bugseng.com>,
 xen-devel@lists.xenproject.org, federico.serafini@bugseng.com
Subject: Re: [PATCH] x86: remove memcmp calls non-compliant with Rule 21.16.
In-Reply-To: <20badf36-f103-48af-ac9b-7e6f331cc0ac@suse.com>
References: <20250604233537.2892206-1-stefano.stabellini@amd.com>
 <c252a43a-4e00-4584-bbb1-05347aa9b49f@suse.com>
 <alpine.DEB.2.22.394.2506051624050.2495561@ubuntu-linux-20-04-desktop>
 <13ad335c1868bcc02e2dc0a8da521f6d@bugseng.com>
 <20badf36-f103-48af-ac9b-7e6f331cc0ac@suse.com>
Message-ID: <95e51c4d5b6b016972a2198aa10b6cfc@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-06 09:26, Jan Beulich wrote:
> On 06.06.2025 09:12, Nicola Vetrini wrote:
>> On 2025-06-06 01:39, Stefano Stabellini wrote:
>>> On Thu, 5 Jun 2025, Jan Beulich wrote:
>>>> On 05.06.2025 01:35, Stefano Stabellini wrote:
>>>>> From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
>>>>> 
>>>>> MISRA C Rule 21.16 states the following: "The pointer arguments to
>>>>> the Standard Library function `memcmp' shall point to either a 
>>>>> pointer
>>>>> type, an essentially signed type, an essentially unsigned type, an
>>>>> essentially Boolean type or an essentially enum type".
>>>>> 
>>>>> Comparing string literals with char arrays is more appropriately
>>>>> done via strncmp.
>>>> 
>>>> More appropriately - maybe. Yet less efficiently. IOW I view ...
>>>> 
>>>>> No functional change.
>>>> 
>>>> ... this as at the edge of not being true.
>>>> 
>> 
>> Then our views of what constitutes a functional change clearly differ.
>> If you are concerned about performance the patch may be dropped, but
>> then does it make sense to apply the rule at all? An alternative
>> suggestion might be that of deviating the rule for memcmp applied to
>> string literals in either the first or second argument, or both).
> 
> FTAOD (since Stefano also said it like this) - it's not just "string
> literal". The additional requirement is that the last argument passed
> must equal sizeof(<string literal>) for the comparison to work
> correctly.
> 
> Jan
> 

That is due to another (mandatory) rule to prevent UB: Rule 21.18 "The 
size_t argument passed to any function in <string.h> shall have an 
appropriate value", which is also true for memcmp

>>>>> Signed-off-by: Alessandro Zucchelli 
>>>>> <alessandro.zucchelli@bugseng.com>
>>>> 
>>>> Missing your own S-o-b.
>>>> 
>>>> Also (nit) may I ask that you drop the full stop from the patch
>>>> subject?
>>> 
>>> I'll add the S-o-B and fix the subject
>>> 
>>> 
>>>>> --- a/xen/arch/x86/dmi_scan.c
>>>>> +++ b/xen/arch/x86/dmi_scan.c
>>>>> @@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void 
>>>>> *smbios, const void *smbios3)
>>>>>  	const struct smbios_eps *eps = smbios;
>>>>>  	const struct smbios3_eps *eps3 = smbios3;
>>>>> 
>>>>> -	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
>>>>> +	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&
>>>> 
>>>> Unlike the last example given in the doc, this does not pose the 
>>>> risk
>>>> of
>>>> false "not equal" returns. Considering there's no example there
>>>> exactly
>>>> matching this situation, I'm not convinced a change is actually
>>>> needed.
>>>> (Applies to all other changes here, too.)
>>> 
>>> If we consider string literals "pointer types", then I think you are
>>> right that this would fall under what is permitted by 21.16. Nicola,
>>> what do you think?
>>> 
>> 
>> While I agree that the result of the comparison is correct either way 
>> in
>> these cases, the rule is written to be simple to apply (i.e., not
>> limited only to those cases that may differ), and in particular in the
>> rationale it is indicated that using memcmp to compare string *may*
>> indicate a mistake. As written above, deviating the string literal
>> comparisons is an option, which can be justified with efficiency
>> concerns, but it goes a bit against the rationale of the rule itself.
>> 
>>> 
>>>>> @@ -302,7 +302,7 @@ const char *__init dmi_get_table(paddr_t *base, 
>>>>> u32 *len)
>>>>>  				continue;
>>>>>  			memcpy_fromio(&eps.dmi + 1, q + sizeof(eps.dmi),
>>>>>  			              sizeof(eps.smbios3) - sizeof(eps.dmi));
>>>>> -			if (!memcmp(eps.smbios3.anchor, "_SM3_", 5) &&
>>>>> +			if (strncmp(eps.smbios3.anchor, "_SM3_", 5) == 0 &&
>>>> 
>>>> Here and below there's a further (style) change, moving from ! to 
>>>> "==
>>>> 0"
>>>> (or from implicit boolean to "!= 0"). As we use the original style 
>>>> in
>>>> many
>>>> other places, some justification for this extra change would be 
>>>> needed
>>>> in
>>>> the description (or these extra adjustments be dropped).
>>> 
>>> The adjustments can be dropped
>>> 
>>> 
>>>>> @@ -720,10 +720,10 @@ static void __init efi_check_config(void)
>>>>>  	__set_fixmap(FIX_EFI_MPF, PFN_DOWN(efi.mps), __PAGE_HYPERVISOR);
>>>>>  	mpf = fix_to_virt(FIX_EFI_MPF) + ((long)efi.mps & (PAGE_SIZE-1));
>>>>> 
>>>>> -	if (memcmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
>>>>> -	    mpf->mpf_length == 1 &&
>>>>> -	    mpf_checksum((void *)mpf, 16) &&
>>>>> -	    (mpf->mpf_specification == 1 || mpf->mpf_specification == 4)) 
>>>>> {
>>>>> +	if (strncmp(mpf->mpf_signature, "_MP_", 4) == 0 &&
>>>>> +            mpf->mpf_length == 1 &&
>>>>> +            mpf_checksum((void *)mpf, 16) &&
>>>>> +            (mpf->mpf_specification == 1 || mpf->mpf_specification 
>>>>> == 4)) {
>>>>>  		smp_found_config = true;
>>>>>  		printk(KERN_INFO "SMP MP-table at %08lx\n", efi.mps);
>>>>>  		mpf_found = mpf;
>>>> 
>>>> There are extra (indentation) changes here which ought to be 
>>>> dropped.
>>> 
>>> Yes
>> 

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

