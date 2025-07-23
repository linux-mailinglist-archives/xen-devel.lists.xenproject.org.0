Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2350B0F73D
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 17:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054416.1423190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebYf-0005RI-Tc; Wed, 23 Jul 2025 15:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054416.1423190; Wed, 23 Jul 2025 15:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uebYf-0005PU-QZ; Wed, 23 Jul 2025 15:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1054416;
 Wed, 23 Jul 2025 15:39:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXHD=2E=bounce.vates.tech=bounce-md_30504962.68810215.v1-e2b45533f78242479b09fa5e1b3a22f8@srs-se1.protection.inumbo.net>)
 id 1uebYf-0005PO-1b
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 15:39:05 +0000
Received: from mail132-21.atl131.mandrillapp.com
 (mail132-21.atl131.mandrillapp.com [198.2.132.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2832da27-67db-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 17:39:02 +0200 (CEST)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4bnJFx0JRWz1bb6vv
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 15:39:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e2b45533f78242479b09fa5e1b3a22f8; Wed, 23 Jul 2025 15:39:01 +0000
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
X-Inumbo-ID: 2832da27-67db-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1753285141; x=1753555141;
	bh=FyoKt7mvhN7hMisKk2HZQEqjLustgfuLGxOxFY85UX4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hogF5Xra+CPnmRI7Sr7lipVavnRNFEKM2CWjaVCWpxwG4PpRJTWBf4TM0HqEA8J0Q
	 OY6Dvjl2VEBPSwa4o1BIsN1kzW4/5qc5U6XPzRjqgOkjnREtE2rhgM/WKcTuA2P/Cn
	 H6rJ8fMWKe5dxjf5kLITjIxbjfXqSOWJ4g6HoxaAPyj4Pnu7NK530J8/qPwKYZhM1l
	 MgdzU5aLezkxtwzY34jUNHxyNsvwg48nEwDl0FwGS+/WoijCAkrmtZgCr4EkRhHPvh
	 FGK47P0EpyIBH14T7+f9mIODCY1meV5VWiNJvORyAntM+rMQ2UcfiheLwC8jFdv4hE
	 MLmVS083dRmhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1753285141; x=1753545641; i=yann.sionneau@vates.tech;
	bh=FyoKt7mvhN7hMisKk2HZQEqjLustgfuLGxOxFY85UX4=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=nPUB7WcqQXTBgOg1tsr6PcP5/e0YIWuvY538JU/L19sMX1xlVKvTeeOgMEqgIf6BI
	 oqdNbAaqru/9PDWxl3Zv2qfRpPxoXwKncIPrFLn+3nQYpZ1c7by2fUos4ZAO3JxJVW
	 +NVle/2UWLSUyCKpvQmlQL++aVzSPeo2TeNVOT2XgjaxFxxRvrxEQsTLRG/LjBuGi2
	 pDqmFX4PFuC+Wo7Cq33/QgvTuddE3Fw/3TjRg3q/Un2mfPwuvdR/F68/6md4m2+XNN
	 SlZd8/0B/hEbjvmO50xOTEvK+xT8ri3XinMj34fCi+iZiljIV4XuRD9yxWXwppyRwg
	 AXlovJqxHE2Cw==
From: "Yann Sionneau" <yann.sionneau@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/x86:=20fix=20xen.efi=20boot=20crash=20from=20some=20bootloaders?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1753285139598
Message-Id: <16d9bf13-d76b-40a9-8f39-d2476ecdf49e@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250723135620.1327914-1-yann.sionneau@vates.tech> <8071bf13-0661-4809-b5f9-ff101d9828b5@suse.com>
In-Reply-To: <8071bf13-0661-4809-b5f9-ff101d9828b5@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e2b45533f78242479b09fa5e1b3a22f8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250723:md
Date: Wed, 23 Jul 2025 15:39:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 7/23/25 16:18, Jan Beulich wrote:
> On 23.07.2025 15:56, Yann Sionneau wrote:
>> xen.efi PE does not boot when loaded from shim or some patched
>> downstream grub2.
>>
>> What happens is the bootloader would honour the MEM_DISCARDABLE
>> flag of the .reloc section meaning it would not load its content
>> into memory.
>>
>> But Xen is parsing the .reloc section content twice at boot:
>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
>> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
>>
>> Therefore it would crash with the following message:
>> "Unsupported relocation type" as reported there:
>>
>> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
>> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
>>
>> This commit adds a small C host tool named keeprelocs
>> that is called after xen.efi is produced by the build system
>> in order to remove this bit from its .reloc section header.
> 
> As indicated on Matrix, giving this tool such a specific name doesn't
> lend it to use for further editing later on.

What would you like to call it?

> 
> Also such an entirely new tool imo wants to use Xen style, not Linux(?)
> one. Unless of course it is taken from somewhere, but nothing is being
> said along these line.

Ah, sorry I didn't know about the coding style, I'll reformat it then.
Is there a correct .clang-format file somewhere or a checkpatch.pl 
equivalent?

> 
>> --- a/xen/Makefile
>> +++ b/xen/Makefile
>> @@ -299,10 +299,13 @@ export XEN_HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xe
>>   # ===========================================================================
>>   # Rules shared between *config targets and build targets
>>   
>> -PHONY += tools_fixdep
>> +PHONY += tools_fixdep tools_keeprelocs
>>   tools_fixdep:
>>   	$(Q)$(MAKE) $(build)=tools tools/fixdep
>>   
>> +tools_keeprelocs:
>> +	$(Q)$(MAKE) $(build)=tools tools/keeprelocs
> 
> Hmm, recursing twice into the tools/ subdir isn't quite nice. But
> perhaps tolerable for the moment.
> 
>> --- a/xen/arch/x86/Makefile
>> +++ b/xen/arch/x86/Makefile
>> @@ -236,6 +236,7 @@ endif
>>   	$(NM) -pa --format=sysv $@ \
>>   		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>>   		> $@.map
>> +	$(objtree)/tools/keeprelocs -q -i $@
> 
> Consider the build being interrupted precisely before this command is
> executed, and the target file not being removed. A subsequent build would
> find it up-to-date, when the earlier build didn't really finish.

Indeed you're right! Thanks!
Note that currently it's already problematic: if you interrupt the build 
and relaunch it, you could end up never generating the xen.efi.map nor 
the xen.efi.elf nor run the check-endbr.sh script.
But yeah, let's do better for my patch, as it impacts the final binary 
generation.

> 
>> --- a/xen/tools/Makefile
>> +++ b/xen/tools/Makefile
>> @@ -1,2 +1,5 @@
>>   hostprogs-always-y += symbols
>>   hostprogs-always-y += fixdep
>> +hostprogs-always-$(XEN_BUILD_PE) += keeprelocs
>> +# next line is to allow including include/efi/pe.h
>> +HOSTCFLAGS_keeprelocs.o := -I ../include
>> \ No newline at end of file
> 
> Please don't omit newlines at the ends of files.

Ok
> 
>> --- /dev/null
>> +++ b/xen/tools/keeprelocs.c
>> @@ -0,0 +1,119 @@
>> +#include <stdio.h>
>> +#include <fcntl.h>
>> +#include <errno.h>
>> +#include <string.h>
>> +#include <sys/mman.h>
>> +#include <sys/stat.h>
>> +#include <stdint.h>
>> +#include <stdlib.h>
>> +#include <unistd.h>
>> +#include <efi/pe.h>
>> +
>> +#undef DEBUG
>> +
>> +static void print_usage(const char *name) {
>> +	printf("%s: [-q] [-h] -i xen.efi\n", name);
>> +}
>> +
>> +int main(int argc, char **argv)
>> +{
>> +	char *filename = NULL;
>> +	int fd;
>> +	char *mem;
>> +	struct stat st;
>> +	off_t len;
>> +	int ret;
>> +	struct mz_hdr *mz;
>> +	struct pe_hdr *pe;
>> +	int opt;
>> +	const char *prog_name = argv[0];
>> +	int quiet = 0;
> 
> bool?

Ok
I can use bool from stdbool.h
> 
>> +	while ((opt = getopt(argc, argv, ":i:qh")) != -1)
>> +	{
>> +		switch (opt) {
>> +		case 'i':
>> +			filename = optarg;
>> +			break;
> 
> Is there a particular reason why -i needs to be used to specify the file name?
> Can't the file name be the first (and only) non-option argument, as is commonly
> done elsewhere?
Ok, let's do that
> 
>> +		case 'q':
>> +			quiet = 1;
>> +			break;
>> +		case 'h':
>> +			print_usage(prog_name);
>> +			return 0;
>> +			break;
> 
> "break" after "return"?
This needs to go.
> 
>> +		case '?':
> 
> Why is this not the same as 'h'?
One returns 0 because help is asked for so it's not an error.
The other one is when using non-existing argument which is an error.
> 
>> +		default:
>> +			print_usage(prog_name);
>> +			return -1;
>> +		}
>> +	}
>> +
>> +
>> +	if (!filename) {
>> +		printf("Error: you must provide a `-i xen.efi` argument\n");
>> +		return -1;
>> +	}
>> +
>> +	fd = open(filename, O_RDWR);
>> +	if (fd < 0) {
>> +		printf("Could not open file %s: %s\n", filename, strerror(errno));
>> +		return -1;
>> +	}
>> +
>> +	ret = fstat(fd, &st);
>> +	if (ret < 0) {
>> +		perror("Error while getting PE file length");
>> +		return -1;
>> +	}
>> +
>> +	len = st.st_size;
>> +	mem = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
>> +
>> +	if (mem == MAP_FAILED) {
>> +		perror("Failed to mmap PE file");
>> +		return -1;
>> +	}
>> +
>> +	mz = (struct mz_hdr *)mem;
> 
> If mem was void * you wouldn't need a cast here.
Ok
> 
>> +	if (mz->magic != MZ_MAGIC) { // "MZ"
>> +		printf("file has incorrect MZ header 0x%02x instead of 0x5a4d\n", mz->magic);
>> +		return -1;
>> +	}
>> +
>> +	pe = (struct pe_hdr *)(mem + mz->peaddr);
> 
> Nor here.
Ok
> 
>> +	if (strncmp((char *)&pe->magic, "PE\0\0", 4)) {
> 
> I don't think strncmp() can be used here, as it'll stop at the first '\0'.
Ah yes, you're right.
> 
>> +		printf("file has incorrect PE header magic %08x instead of 0x00004550\n", pe->magic);
> 
> 0x%08x
Ok
> 
>> +		return -1;
>> +	}
>> +
>> +	if (pe->opt_hdr_size == 0) {
>> +		printf("file has empty OptionalHeader\n");
>> +		return -1;
>> +	}
> 
> Code further down doesn't really require this check, as it looks. IOW
> either this check wants dropping, or it wants to be more strict than
> just checking for zero.

Based on 
https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#coff-file-header-object-and-image
My understanding is that SizeOfOptionalHeader member can be 0, for 
object files.
But we don't want an object file here, we want an image file.
However, the optional header is required for image files (thus the != 0 
check):

"Every image file has an optional header that provides information to 
the loader."

But, we really don't know its size, moreover it's even different for 
PE32 vs PE32+.

> 
>> +	struct section_header *section = (struct section_header *)((uint8_t *)pe + sizeof(*pe) + pe->opt_hdr_size);
> 
> "(uint8_t *)pe + sizeof(*pe)" can be easier had as "(uint8_t *)(pe + 1)".
> But that won't be sufficient to get the line under 80 chars.
Yes I can indeed use pointer arithmetics like pe + 1 to go past the size 
of the pe struct, I just thought it was more readable/obvious in the pe 
+ sizeof(*pe) form.
> 
>> +	for (unsigned int section_id = 0; section_id < pe->sections; section_id++, section++)
>> +	{
>> +#ifdef DEBUG
>> +		printf("section %s\n", section->Name);
>> +#endif
> 
> This probably is just a leftover?
It can be removed yes
> 
>> +		if (strncmp(section->name, ".reloc", strlen(".reloc")))
> 
> strncmp(..., strlen(...)) is slightly odd. In the specific case, strcmp()
> will do I think. Otherwise use memcmp()?
I was trying to protect against section->name maybe not being \0 
terminated (in a broken PE file for instance).
I can switch to using
memcmp(section->name, ".reloc", strlen(".reloc")+1)

> 
> Jan

Thanks for the review :)


Regards,
-- 


Yann Sionneau | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



