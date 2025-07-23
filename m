Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F2FB0F517
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 16:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054216.1422935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaIs-00056h-GF; Wed, 23 Jul 2025 14:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054216.1422935; Wed, 23 Jul 2025 14:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueaIs-00054n-DU; Wed, 23 Jul 2025 14:18:42 +0000
Received: by outflank-mailman (input) for mailman id 1054216;
 Wed, 23 Jul 2025 14:18:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFh9=2E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueaIq-00054h-O4
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 14:18:40 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eca063bb-67cf-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 16:18:37 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso4566054f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jul 2025 07:18:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cbc67a87sm9925544b3a.145.2025.07.23.07.18.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 07:18:36 -0700 (PDT)
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
X-Inumbo-ID: eca063bb-67cf-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753280317; x=1753885117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1c2jx0C/E8IInuv3FN7qzjRwHcZqiaAI+/xcdgy/Svo=;
        b=Gg/Lrd5L8Dz6wg6p+ZYttn0tkmPGkIxqtw1dL8b1x+/OnYYaq22+gYRgxzKnmdJ9eQ
         5b04Dllqj46L3fr3+UCKsWAtwt45eXjziBzYT/l3xhl6pK25sttph1Uu6Z7Z3PLWPw9v
         LjgkYReQin2NeW06OAs8BopR5cFZe61NXrW6bxsNYqgKInW64QM2jH+9f9R53hLzZL55
         j3UXpevxkEe4PUSikA2B1PNdYhHox7ymvmvq/ZfZDz7WgdM2ix+j3yR154xRX853bY1U
         bxga5DosiWqCdLjH5L0u9GnJIzoX9gApXKjo5k3j4wGZxsPzIJkDn1Sgk4ragkNo+cRo
         3nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753280317; x=1753885117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1c2jx0C/E8IInuv3FN7qzjRwHcZqiaAI+/xcdgy/Svo=;
        b=UEjjFzKWl8FxE5yM5dht3vY97SebA+mWgyQMa4RwuOX1qy7Yr9H/nVAmCvU0kGxOSN
         5oPNvlngTTBQuf/SJ8M7G/0wRsE77CLolr+bepBLhGx5wYuvg2oLq3KGcbWuT58rloX4
         4kvkZJ2pbFzPpC0MaPi+aoO/AMTXS3+Z+Rzwnps82JVuSCOHuzIapriFlhMeiF6y+iHN
         NIKw4KFS5oi7h/qPh8mva4mpHEab124AW9scusrGqRXGphGu9qbnXODaRoxTIhZrW3et
         /taGZHK0sNqIYGBLuMAL1V59GiaDyVXOruKcjwouEqcooBweRfs/fE1vzGxxR8/G6RQn
         nfSQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0SzpPFY+f6gKXkv1HomNJ91CMUru05AkjIh6Gm2ipAxemISV5PI45hAmpK5OteaAgCBfRqoty+8w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSAT7+6d41En4P16uVZ9tQPNmKsZ09SIYMxEQ+7BEqbG3CfykV
	oRNiCikJI6iVn+MUWTnpHrGI3fGLI3UoXA60iwM5bj86o8/D8jOU2T2nIDEDmWBpTQ==
X-Gm-Gg: ASbGncvMtz5dytxiQFY9FoKsnp9htJDAALjpVz7WN8COat5aamNczfWQchWwtOLanYU
	RxL3dhfTk60y9lRN+p0T/TZ9am0FOjYzAy+kVuTQhre9ziNxLCa29eJHQiCdtVI6jVE+8RdKHES
	g2GHS7Qd0IiZDWvaiY/kSZPWuclJ+GV4V5ub356w+Nbty3zUxVnL/m7gOhfPi5rNaVLosBFFAfe
	W9DJlHCBmSV+VR33a+0sTAAyGR16JsbxahaD59qk+ku86uUXC+GT6zwkvDBoImXc5Y9o4h0haOF
	oMtEm2iWnZS66qfDQlxaa8iKcQrey9s0KtL1ixT1uB5eHoiUC1uwobKYl3DKO4M7rEvENVPx3IY
	rfVS0IdHmO2M9Q5hBgYRR2QCZAxyrUK/9y/ifqTE+H9zWyL8dF2UacHnw9meGA2RTnctMzDAXAG
	YofmYsnU6YgHckQ6MVZQ==
X-Google-Smtp-Source: AGHT+IH5gIycAFXsVi49y5aKFWkYS5BMWc0UmMzSdpan32My4oZaOj3VrUyPzwZGsU/cgOyGrgw8YQ==
X-Received: by 2002:a05:6000:2508:b0:3a4:dc42:a0ac with SMTP id ffacd0b85a97d-3b768f07c68mr2694747f8f.49.1753280316776;
        Wed, 23 Jul 2025 07:18:36 -0700 (PDT)
Message-ID: <8071bf13-0661-4809-b5f9-ff101d9828b5@suse.com>
Date: Wed, 23 Jul 2025 16:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: fix xen.efi boot crash from some bootloaders
To: Yann Sionneau <yann.sionneau@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250723135620.1327914-1-yann.sionneau@vates.tech>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250723135620.1327914-1-yann.sionneau@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.07.2025 15:56, Yann Sionneau wrote:
> xen.efi PE does not boot when loaded from shim or some patched
> downstream grub2.
> 
> What happens is the bootloader would honour the MEM_DISCARDABLE
> flag of the .reloc section meaning it would not load its content
> into memory.
> 
> But Xen is parsing the .reloc section content twice at boot:
> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/common/efi/boot.c#L1362
> * https://elixir.bootlin.com/xen/v4.20.1/source/xen/arch/x86/efi/efi-boot.h#L237
> 
> Therefore it would crash with the following message:
> "Unsupported relocation type" as reported there:
> 
> * https://github.com/QubesOS/qubes-issues/issues/8206#issuecomment-2619048838
> * https://lore.kernel.org/xen-devel/7e039262-1f54-46e1-8f70-ac3f03607d5a@suse.com/T/#me122b9e6c27cd98db917da2c9f67e74a2c6ad7a5
> 
> This commit adds a small C host tool named keeprelocs
> that is called after xen.efi is produced by the build system
> in order to remove this bit from its .reloc section header.

As indicated on Matrix, giving this tool such a specific name doesn't
lend it to use for further editing later on.

Also such an entirely new tool imo wants to use Xen style, not Linux(?)
one. Unless of course it is taken from somewhere, but nothing is being
said along these line.

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -299,10 +299,13 @@ export XEN_HAS_CHECKPOLICY := $(call success,$(CHECKPOLICY) -h 2>&1 | grep -q xe
>  # ===========================================================================
>  # Rules shared between *config targets and build targets
>  
> -PHONY += tools_fixdep
> +PHONY += tools_fixdep tools_keeprelocs
>  tools_fixdep:
>  	$(Q)$(MAKE) $(build)=tools tools/fixdep
>  
> +tools_keeprelocs:
> +	$(Q)$(MAKE) $(build)=tools tools/keeprelocs

Hmm, recursing twice into the tools/ subdir isn't quite nice. But
perhaps tolerable for the moment.

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -236,6 +236,7 @@ endif
>  	$(NM) -pa --format=sysv $@ \
>  		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
>  		> $@.map
> +	$(objtree)/tools/keeprelocs -q -i $@

Consider the build being interrupted precisely before this command is
executed, and the target file not being removed. A subsequent build would
find it up-to-date, when the earlier build didn't really finish.

> --- a/xen/tools/Makefile
> +++ b/xen/tools/Makefile
> @@ -1,2 +1,5 @@
>  hostprogs-always-y += symbols
>  hostprogs-always-y += fixdep
> +hostprogs-always-$(XEN_BUILD_PE) += keeprelocs
> +# next line is to allow including include/efi/pe.h
> +HOSTCFLAGS_keeprelocs.o := -I ../include
> \ No newline at end of file

Please don't omit newlines at the ends of files.

> --- /dev/null
> +++ b/xen/tools/keeprelocs.c
> @@ -0,0 +1,119 @@
> +#include <stdio.h>
> +#include <fcntl.h>
> +#include <errno.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <sys/stat.h>
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <efi/pe.h>
> +
> +#undef DEBUG
> +
> +static void print_usage(const char *name) {
> +	printf("%s: [-q] [-h] -i xen.efi\n", name);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	char *filename = NULL;
> +	int fd;
> +	char *mem;
> +	struct stat st;
> +	off_t len;
> +	int ret;
> +	struct mz_hdr *mz;
> +	struct pe_hdr *pe;
> +	int opt;
> +	const char *prog_name = argv[0];
> +	int quiet = 0;

bool?

> +	while ((opt = getopt(argc, argv, ":i:qh")) != -1)
> +	{
> +		switch (opt) {
> +		case 'i':
> +			filename = optarg;
> +			break;

Is there a particular reason why -i needs to be used to specify the file name?
Can't the file name be the first (and only) non-option argument, as is commonly
done elsewhere?

> +		case 'q':
> +			quiet = 1;
> +			break;
> +		case 'h':
> +			print_usage(prog_name);
> +			return 0;
> +			break;

"break" after "return"?

> +		case '?':

Why is this not the same as 'h'?

> +		default:
> +			print_usage(prog_name);
> +			return -1;
> +		}
> +	}
> +
> +
> +	if (!filename) {
> +		printf("Error: you must provide a `-i xen.efi` argument\n");
> +		return -1;
> +	}
> +
> +	fd = open(filename, O_RDWR);
> +	if (fd < 0) {
> +		printf("Could not open file %s: %s\n", filename, strerror(errno));
> +		return -1;
> +	}
> +
> +	ret = fstat(fd, &st);
> +	if (ret < 0) {
> +		perror("Error while getting PE file length");
> +		return -1;
> +	}
> +
> +	len = st.st_size;
> +	mem = mmap(NULL, len, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> +
> +	if (mem == MAP_FAILED) {
> +		perror("Failed to mmap PE file");
> +		return -1;
> +	}
> +
> +	mz = (struct mz_hdr *)mem;

If mem was void * you wouldn't need a cast here.

> +	if (mz->magic != MZ_MAGIC) { // "MZ"
> +		printf("file has incorrect MZ header 0x%02x instead of 0x5a4d\n", mz->magic);
> +		return -1;
> +	}
> +
> +	pe = (struct pe_hdr *)(mem + mz->peaddr);

Nor here.

> +	if (strncmp((char *)&pe->magic, "PE\0\0", 4)) {

I don't think strncmp() can be used here, as it'll stop at the first '\0'.

> +		printf("file has incorrect PE header magic %08x instead of 0x00004550\n", pe->magic);

0x%08x

> +		return -1;
> +	}
> +
> +	if (pe->opt_hdr_size == 0) {
> +		printf("file has empty OptionalHeader\n");
> +		return -1;
> +	}

Code further down doesn't really require this check, as it looks. IOW
either this check wants dropping, or it wants to be more strict than
just checking for zero.

> +	struct section_header *section = (struct section_header *)((uint8_t *)pe + sizeof(*pe) + pe->opt_hdr_size);

"(uint8_t *)pe + sizeof(*pe)" can be easier had as "(uint8_t *)(pe + 1)".
But that won't be sufficient to get the line under 80 chars.

> +	for (unsigned int section_id = 0; section_id < pe->sections; section_id++, section++)
> +	{
> +#ifdef DEBUG
> +		printf("section %s\n", section->Name);
> +#endif

This probably is just a leftover?

> +		if (strncmp(section->name, ".reloc", strlen(".reloc")))

strncmp(..., strlen(...)) is slightly odd. In the specific case, strcmp()
will do I think. Otherwise use memcmp()?

Jan

