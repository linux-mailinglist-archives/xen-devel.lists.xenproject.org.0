Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59B99A3D6D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 13:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821772.1235720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lMK-0008U7-M6; Fri, 18 Oct 2024 11:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821772.1235720; Fri, 18 Oct 2024 11:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lMK-0008S6-IM; Fri, 18 Oct 2024 11:41:32 +0000
Received: by outflank-mailman (input) for mailman id 821772;
 Fri, 18 Oct 2024 11:41:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i1V=RO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t1lMJ-0008Rg-4N
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 11:41:31 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9b54d1e-8d45-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 13:41:28 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c94c4ad9d8so2782177a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 04:41:28 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a68ae54a6sm85628866b.65.2024.10.18.04.41.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 04:41:27 -0700 (PDT)
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
X-Inumbo-ID: e9b54d1e-8d45-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729251688; x=1729856488; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfW/VOltijs/T9SwMBNInKkhvuG6mWcW7+gL38HquWI=;
        b=atOhJBK5LeondEBx2cZm3RYLlIznZMbn9y4ci5h+6awLlVkHHO/YMeBaqr1kfPuMHG
         upK9wVDAIWFGqunkxaFRVbnHmzPn+769KBvFd74iQRPCLbyqnvRSEkrofDCgz3FTUgZu
         owWrU3xSDO/gGy5P05I0K3Uf4brh5mN1Rcs00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729251688; x=1729856488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfW/VOltijs/T9SwMBNInKkhvuG6mWcW7+gL38HquWI=;
        b=mDf9tV8y/45tiUuka0uylmV+PET1SETkQm+sttzEEXpnv4mMANiPCWcdfkTbNh++qA
         uWcbiCcV0F84BwkTQYynBNo8wIHsNKHjlCrJzU1Rue5qbqMZe0uQGhAaogTTcwI99Sbk
         6jMWoXfRIe6+dyy8rmPXDtZ0G1bpFSceiZw5pNGQMLH7bFWqkeBWBUmDZoGYrtPsk0m5
         fNIuSXQGqE2GtWk3CHVhH13uO5JoolcitB9rMiwb/PRSl86wuqiCNdeBXFchuQM3ifPk
         RTbQqGCYi4Z9PiCRphECtnCjnT8YQ4Ct+3OLKmZgCLeIsA+1nA45f4tgXl688gO4ffCl
         +TGQ==
X-Gm-Message-State: AOJu0Yzoo5quK86J1KhR3GrXr71zAvP5z3HAGmQFHStLLTD2r7oACCmt
	ZOM1KA0RH9htGSE39glQ16XRhoYxotXZZN2gfsVQPWsnyX+vWOtimF8NlfP6oJc=
X-Google-Smtp-Source: AGHT+IEcP06vujEQZ12rH/JJtcueprmzuMbkLOokUU5lm8csTbckvWRiMy9MuGOCeXj5+cLY3rUatA==
X-Received: by 2002:a17:907:9693:b0:a9a:3cf:cdb8 with SMTP id a640c23a62f3a-a9a69ba6e93mr161795066b.36.1729251687898;
        Fri, 18 Oct 2024 04:41:27 -0700 (PDT)
Date: Fri, 18 Oct 2024 13:41:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
Message-ID: <ZxJJZvOCQLzU_Q5s@macbook.local>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017133123.1946204-2-frediano.ziglio@cloud.com>

On Thu, Oct 17, 2024 at 02:31:19PM +0100, Frediano Ziglio wrote:
> The current method to include 32 bit C boot code is:
> - compile each function we want to use into a separate object file;
> - each function is compiled with -fpic option;
> - convert these object files to binary files. This operation removes GOP
>   which we don't want in the executable;
> - a small assembly part in each file add the entry point;
> - code can't have external references, all possible variables are passed
>   by value or pointer;
> - include these binary files in head.S.
> 
> There are currently some limitations:
> - code is compiled separately, it's not possible to share a function
>   (like memcpy) between different functions to use;
> - although code is compiled with -fpic there's no certainty there are
>   no relocations, specifically data ones. This can lead into hard to
>   find bugs;
> - it's hard to add a simple function;
> - having to pass external variables makes hard to do multiple things
>   otherwise functions would require a lot of parameters so code would
>   have to be split into multiple functions which is not easy.
> 
> Current change extends the current process:
> - all object files are linked together before getting converted making
>   possible to share code between the function we want to call;
> - a single object file is generated with all functions to use and
>   exported symbols to easily call;
> - variables to use are declared in linker script and easily used inside
>   C code. Declaring them manually could be annoying but makes also
>   easier to check them. Using external pointers can be still an issue if
>   they are not fixed. If an external symbol is not declared this gives a
>   link error.
> 
> Some details of the implementation:
> - C code is compiled with -fpic flags (as before);
> - object files from C code are linked together;
> - the single bundled object file is linked with 2 slightly different
>   script files to generate 2 bundled object files;
> - the 2 bundled object files are converted to binary removing the need
>   for global offset tables;
> - a Python script is used to generate assembly source from the 2
>   binaries;
> - the single assembly file is compiled to generate final bundled object
>   file;
> - to detect possible unwanted relocation in data/code code is generated
>   with different addresses. This is enforced starting .text section at
>   different positions and adding a fixed "gap" at the beginning.
>   This makes sure code and data is position independent;
> - to detect used symbols in data/code symbols are placed in .text
>   section at different offsets (based on the line in the linker script).
>   This is needed as potentially a reference to a symbol is converted to
>   a reference to the containing section so multiple symbols could be
>   converted to reference to same symbol (section name) and we need to
>   distinguish them;
> - --orphan-handling=error option to linker is used to make sure we
>   account for all possible sections from C code;
> 
> Current limitations:
> - the main one is the lack of support for 64 bit code. It would make
>   sure that even the code used for 64 bit (at the moment EFI code) is
>   code and data position independent. We cannot assume that code that
>   came from code compiled for 32 bit and compiled for 64 bit is code and
>   data position independent, different compiler options lead to
>   different code/data.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
> Changes since v2:
> - removed W^X limitation, allowing data;
> - added some comments to python script;
> - added extension to python script;
> - added header to generated assembly code from python script;
> - added starting symbol to generated assembly code from python script
>   to make disassembly more clear;
> - other minor style changes to python script.
> 
> Changes since v4:
> - add build32.final.lds build32.other.lds to targets macro;
> - place some comments over a rule, not inside;
> - simplified linking and producing binary rule;
> - renamed built_in_32 to built-in-32, coding style;
> - fix minor indentation;
> - put magic numbers in Makefile and propagate them;
> - minor variable cleanups in Python script;
> - add dependency to Python script.
> 
> Changes since v5:
> - renamed "other" and "final" phases to "base" and "offset";
> - use if_changed macro to generate built-in-32.S.
> ---
>  xen/arch/x86/boot/.gitignore                  |   5 +-
>  xen/arch/x86/boot/Makefile                    |  47 +++-
>  .../x86/boot/{build32.lds => build32.lds.S}   |  35 ++-
>  xen/arch/x86/boot/cmdline.c                   |  12 -
>  xen/arch/x86/boot/head.S                      |  12 -
>  xen/arch/x86/boot/reloc.c                     |  14 --
>  xen/tools/combine_two_binaries.py             | 220 ++++++++++++++++++
>  7 files changed, 292 insertions(+), 53 deletions(-)
>  rename xen/arch/x86/boot/{build32.lds => build32.lds.S} (70%)
>  create mode 100755 xen/tools/combine_two_binaries.py
> 
> diff --git a/xen/arch/x86/boot/.gitignore b/xen/arch/x86/boot/.gitignore
> index a379db7988..7e85549751 100644
> --- a/xen/arch/x86/boot/.gitignore
> +++ b/xen/arch/x86/boot/.gitignore
> @@ -1,3 +1,4 @@
>  /mkelf32
> -/*.bin
> -/*.lnk
> +/build32.*.lds
> +/built-in-32.*.bin
> +/built-in-32.*.map
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 1199291d2b..5da19501be 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,4 +1,5 @@
>  obj-bin-y += head.o
> +obj-bin-y += built-in-32.o
>  
>  obj32 := cmdline.32.o
>  obj32 += reloc.32.o
> @@ -9,9 +10,6 @@ targets   += $(obj32)
>  
>  obj32 := $(addprefix $(obj)/,$(obj32))
>  
> -$(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
> -$(obj)/head.o: $(obj32:.32.o=.bin)
> -
>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  CFLAGS_x86_32 += -Werror -fno-builtin -g0 -msoft-float -mregparm=3
> @@ -25,14 +23,47 @@ $(obj32): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>  $(obj)/%.32.o: $(src)/%.c FORCE
>  	$(call if_changed_rule,cc_o_c)
>  
> +orphan-handling-$(call ld-option,--orphan-handling=error) := --orphan-handling=error
>  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
>  LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
>  LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
>  
> -%.bin: %.lnk
> -	$(OBJCOPY) -j .text -O binary $< $@
> +text_gap := 0x010200
> +text_diff := 0x408020
> +
> +$(obj)/build32.base.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff)
> +$(obj)/build32.offset.lds: AFLAGS-y += -DGAP=$(text_gap) -DTEXT_DIFF=$(text_diff) -DFINAL
> +$(obj)/build32.base.lds $(obj)/build32.offset.lds: $(src)/build32.lds.S FORCE
> +	$(call if_changed_dep,cpp_lds_S)
> +
> +targets += build32.offset.lds build32.base.lds
> +
> +# link all 32bit objects together
> +$(obj)/built-in-32.tmp.o: $(obj32)
> +	$(LD32) -r -o $@ $^
> +
> +# link bundle with a given layout and extract a binary from it
> +$(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/built-in-32.tmp.o
> +	$(LD32) $(orphan-handling-y) -N -T $< -Map $(@:bin=map) -o $(@:bin=o) $(filter %.o,$^)
> +	$(OBJCOPY) -j .text -O binary $(@:bin=o) $@
> +	rm -f $(@:bin=o)
> +
> +quiet_cmd_combine = GEN     $@
> +cmd_combine = \
> +	$(PYTHON) $(srctree)/tools/combine_two_binaries.py \
> +		--gap=$(text_gap) --text-diff=$(text_diff) \
> +		--script $(obj)/build32.offset.lds \
> +		--bin1 $(obj)/built-in-32.base.bin \
> +		--bin2 $(obj)/built-in-32.offset.bin \
> +		--map $(obj)/built-in-32.offset.map \
> +		--exports cmdline_parse_early,reloc \
> +		--output $@

See xen/Rules.mk, for consistency the indentation should be done with
spaces when defining variables.  That would also allow to align the
options.

> +
> +targets += built-in-32.S
>  
> -%.lnk: %.32.o $(src)/build32.lds
> -	$(LD32) -N -T $(filter %.lds,$^) -o $@ $<
> +# generate final object file combining and checking above binaries
> +$(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj)/built-in-32.offset.bin \
> +		$(srctree)/tools/combine_two_binaries.py FORCE

Can you indent this using spaces also, so it's on the same column as
the ':'?

> +	$(call if_changed,combine)
>  
> -clean-files := *.lnk *.bin
> +clean-files := built-in-32.*.bin built-in-32.*.map build32.*.lds
> diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds.S
> similarity index 70%
> rename from xen/arch/x86/boot/build32.lds
> rename to xen/arch/x86/boot/build32.lds.S
> index 56edaa727b..e3f5e55261 100644
> --- a/xen/arch/x86/boot/build32.lds
> +++ b/xen/arch/x86/boot/build32.lds.S
> @@ -15,22 +15,47 @@
>   * with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -ENTRY(_start)
> +#ifdef FINAL
> +#  undef GAP
> +#  define GAP 0
> +#  define MULT 0
> +#  define TEXT_START
> +#else
> +#  define MULT 1
> +#  define TEXT_START TEXT_DIFF
> +#endif

In other places we use a single space between the hash and the define.

> +#define DECLARE_IMPORT(name) name = . + (__LINE__ * MULT)
> +
> +ENTRY(dummy_start)
>  
>  SECTIONS
>  {
>    /* Merge code and data into one section. */
> -  .text : {
> +  .text TEXT_START : {
> +        /* Silence linker warning, we are not going to use it */
> +        dummy_start = .;
> +
> +        /* Declare below any symbol name needed.
> +         * Each symbol should be on its own line.
> +         * It looks like a tedious work but we make sure the things we use.
> +         * Potentially they should be all variables. */

The style is wrong for the opening and closing comment delimiters.

I think it would be best if this was written in a more natural style.

/*
 * Any symbols used should be declared below, this ensures which
 * symbols are visible to the 32bit C boot code.
 */

I don't think you need to mention that each symbol should be on it's
own line.

Thanks, Roger.

