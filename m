Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2459916B5
	for <lists+xen-devel@lfdr.de>; Sat,  5 Oct 2024 14:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810897.1223593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx3pb-0007cb-LH; Sat, 05 Oct 2024 12:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810897.1223593; Sat, 05 Oct 2024 12:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sx3pb-0007av-Hy; Sat, 05 Oct 2024 12:24:19 +0000
Received: by outflank-mailman (input) for mailman id 810897;
 Sat, 05 Oct 2024 12:24:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AzXh=RB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sx3pZ-0007ap-Ov
 for xen-devel@lists.xenproject.org; Sat, 05 Oct 2024 12:24:17 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbc3e99d-8314-11ef-99a2-01e77a169b0f;
 Sat, 05 Oct 2024 14:24:15 +0200 (CEST)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-a9932aa108cso101990566b.2
 for <xen-devel@lists.xenproject.org>; Sat, 05 Oct 2024 05:24:14 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e625a7dsm127386466b.84.2024.10.05.05.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Oct 2024 05:24:13 -0700 (PDT)
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
X-Inumbo-ID: bbc3e99d-8314-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728131054; x=1728735854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YQPr7JPAPGgSMqLg4QQTM2pu4CXyvN1amaL5HLMYaVA=;
        b=YhYgNFDgByrtMJPiFjig/i96Ahkr0daT5cBKyQqOq96FNUv2jgMDYPvy6maneKG5jt
         khnJ9flN8NY+OS2l16PtO2xL8xAx3P90k4Xc6Ow3HrKnO1RASt4rN/4d/ffpmeYnA7XA
         v4LsXY7bIuyuJnRMu02+InQNidrgLaDTGmRkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728131054; x=1728735854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQPr7JPAPGgSMqLg4QQTM2pu4CXyvN1amaL5HLMYaVA=;
        b=QQqj1cbnvWYtU1pTArioKWPedvFUtHgGJn3KbCDBQGhKQcnxoqtviDQ9iEU3azGuPh
         cdqQ8B4JoKJwRTcIWQbK3wukyVeyN1pbCleOJkuSU/BTBZPMPTrA2oPzbHhQWf+xrXeM
         Mrf+Fwf/pFoSVe6fzpR27yWrZbHnUZ+tvTHy7NbSS/0GSwGj0NJuMGeBWvRPTdMTCL3t
         MgFwBQNJRmm/JgL1RegKiDvJbX8YBi2CpjCsIPdmKCGG+eTMiMWEZuIrH5E8Xxk5qn+I
         dZO6x29TTi+S45fZVI43a+UqCOwQvdjMqqF+++DCMScb4KpwFJImn1U5Or1wyu9mpTh2
         wbzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXASHuHI4At03fkERlj97mhMweGpHCpidI0tQe5juxAE+u5x8gMlpiCmQKAfdhUIdDv3gK1gSyVS7w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybnGwEoTSobtW4+9Vw1KRWHht+UwdFkjYK3pFEfd+nFq9/OTNp
	CmGpF11Gvt2AEafl3WREAO3PpwyXsraCegTyhe9rIqj58I+567pzVBGOjRXU6Wc=
X-Google-Smtp-Source: AGHT+IESDsvPQBwB4Gx3eo7jHC/Evj5pCMDwL/ljov9wd2VhLCSG92dQsEMkuiOEHwQ905iQPT5rAA==
X-Received: by 2002:a17:907:3608:b0:a8d:250a:52b2 with SMTP id a640c23a62f3a-a991bcf77e3mr665486266b.6.1728131053894;
        Sat, 05 Oct 2024 05:24:13 -0700 (PDT)
Message-ID: <9a4c9017-f9be-4ebd-9f3d-c7e0b2752438@citrix.com>
Date: Sat, 5 Oct 2024 13:24:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/boot: create a C bundle for 32 bit boot code and
 use it
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-2-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241005080233.1248850-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/10/2024 9:02 am, Frediano Ziglio wrote:
> diff --git a/.gitignore b/.gitignore
> index d88be80b28..d538c6adb1 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -247,11 +247,10 @@ xen/.config
>  xen/.config.old
>  xen/.xen.elf32
>  xen/System.map
> -xen/arch/x86/boot/mkelf32
> +xen/arch/x86/boot/build32.*.lds
>  xen/arch/x86/boot/cmdline.S
> +xen/arch/x86/boot/mkelf32
>  xen/arch/x86/boot/reloc.S
> -xen/arch/x86/boot/*.bin
> -xen/arch/x86/boot/*.lnk

cmdline.S and reloc.S are stale too.  They're from an even older form of
this bodge (c/s 1ab7c128d9d1).

However, we're trying to move away from one global .gitignore file. 
Would you mind deleting all of these entries, and making a new
xen/arch/x86/boot/.gitignore with just the ones that you need.  (c/s
0a15b7695bd98 is an example of cleaning up the tools/ocaml side of things).

Feel free to make it a prep patch if you want.  This one is complicated
enough.

> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index ff0f965876..da87179fef 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -1,4 +1,4 @@
> -obj-bin-y += head.o
> +obj-bin-y += head.o cbundle.o

+obj-bin-y += cbundle.o
 obj-bin-y += head.o

please.  Putting things on a single line is already getting unwieldy by
patch 2.

I have to admit that I'm still not convinced of "cbundle" as a name, but
I can't think of anything better either.

>  
>  head-bin-objs := cmdline.o reloc.o
>  
> @@ -9,7 +9,6 @@ targets   += $(head-bin-objs)
>  head-bin-objs := $(addprefix $(obj)/,$(head-bin-objs))
>  
>  $(obj)/head.o: AFLAGS-y += -Wa$(comma)-I$(obj)
> -$(obj)/head.o: $(head-bin-objs:.o=.bin)
>  
>  CFLAGS_x86_32 := $(subst -m64,-m32 -march=i686,$(XEN_TREEWIDE_CFLAGS))
>  $(call cc-options-add,CFLAGS_x86_32,CC,$(EMBEDDED_EXTRA_CFLAGS))
> @@ -24,10 +23,29 @@ $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
>  LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
>  LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
>  
> -%.bin: %.lnk
> -	$(OBJCOPY) -j .text -O binary $< $@
> -
> -%.lnk: %.o $(src)/build32.lds
> -	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
> -
> -clean-files := *.lnk *.bin
> +$(obj)/build32.final.lds: AFLAGS-y += -DFINAL
> +$(obj)/build32.other.lds $(obj)/build32.final.lds: $(src)/build32.lds.S
> +	$(call if_changed_dep,cpp_lds_S)
> +
> +$(obj)/%.x64.o: $(src)/%.c FORCE
> +	$(call if_changed_rule,cc_o_c)
> +
> +$(obj)/cbundle.o: $(head-bin-objs) $(obj)/build32.other.lds $(obj)/build32.final.lds
> +## link all object files together
> +	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -r -o $(obj)/cbundle.tmp.o $(head-bin-objs)
> +## link twice with 2 different layouts
> +	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) --orphan-handling=error -N -T $(obj)/build32.other.lds -o $@.1.o $(obj)/cbundle.tmp.o
> +	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) --orphan-handling=error -N -T $(obj)/build32.final.lds -Map $(obj)/cbundle.map -o $@.2.o $(obj)/cbundle.tmp.o

Looking at this, I think we want an $(LD32) variable.  Also,
--orphan-handling isn't supported by all supported linkers, so you'll
have to make it conditional.  See how we handle =warn in the general case.


As a tangent, I know we have this form in the main Xen link, but I have
the same complaint there.  This is a serial operation that could be less
serial.

AFAICT, you link everything together into cbundle.tmp, then do two
(parallelisable) relink+obcopy, then run the python script.  Would it be
possible to split it into 4(?) rules.

> +## extract binaries from them
> +	$(OBJCOPY) -j .text -O binary $@.1.o $@.1.bin
> +	$(OBJCOPY) -j .text -O binary $@.2.o $@.2.bin
> +## generate final assembly file combining and checking above binaries
> +	$(PYTHON) $(srctree)/tools/combine_two_binaries \
> +		--script $(obj)/build32.final.lds \
> +		--bin1 $@.1.bin --bin2 $@.2.bin \
> +		--map $(obj)/cbundle.map --exports cmdline_parse_early,reloc \
> +		--section-header '.section .init.text, "ax", @progbits' \
> +		--output $(obj)/cbundle.s
> +	$(CC) -c $(obj)/cbundle.s -o $@.tmp
> +	rm -f $(obj)/cbundle.tmp.o $@.1.o $@.2.o $@.1.bin $@.2.bin $(obj)/cbundle.map $(obj)/cbundle.s $@
> +	mv $@.tmp $@
> diff --git a/xen/arch/x86/boot/build32.lds b/xen/arch/x86/boot/build32.lds.S
> similarity index 63%
> rename from xen/arch/x86/boot/build32.lds
> rename to xen/arch/x86/boot/build32.lds.S
> index 56edaa727b..fe422e3d25 100644
> --- a/xen/arch/x86/boot/build32.lds
> +++ b/xen/arch/x86/boot/build32.lds.S
> @@ -15,22 +15,54 @@
>   * with this program.  If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> -ENTRY(_start)
> +#undef ENTRY

The need for this undef should have gone away with c/s b102c9f1ce29.

> +
> +#ifdef FINAL
> +# define GAP 0
> +# define MULT 0
> +# define TEXT_START
> +#else
> +# define GAP 0x010200
> +# define MULT 1
> +# define TEXT_START 0x408020
> +#endif
> +# define DECLARE_IMPORT(name) name = . + (__LINE__ * MULT)
> +
> +ENTRY(dummy_start)
>  
>  SECTIONS
>  {
> -  /* Merge code and data into one section. */
> -  .text : {
> +  /* Merge code and read-only data into one section. */
> +  .text TEXT_START : {
> +        /* Silence linker warning, we are not going to use it */
> +        dummy_start = .;
> +
> +        /* Declare below any symbol name needed.
> +         * Each symbol should be on its own line.
> +         * It looks like a tedious work but we make sure the things we use.
> +         * Potentially they should be all variables. */
> +        DECLARE_IMPORT(__base_relocs_start);
> +        DECLARE_IMPORT(__base_relocs_end);
> +        . = . + GAP;

I have to admit that I've got lost here trying to follow what's going on.

The linker script is emitting symbols based on line number that are
either adjacent or all the same (depending on MULT), and these names are
also parsed by the python script ?

I also note that running this patch:

$ make -s -j8 build
 __  __            _  _    ____   ___                     _        _    
_      
 \ \/ /___ _ __   | || |  |___ \ / _ \    _   _ _ __  ___| |_ __ _| |__
| | ___
  \  // _ \ '_ \  | || |_   __) | | | |__| | | | '_ \/ __| __/ _` | '_
\| |/ _ \
  /  \  __/ | | | |__   _| / __/| |_| |__| |_| | | | \__ \ || (_| | |_)
| |  __/
 /_/\_\___|_| |_|    |_|(_)_____|\___/    \__,_|_|
|_|___/\__\__,_|_.__/|_|\___|
                                                                              
 
Position 0x70c 50 trampoline_phys
Position 0x87e 51 boot_vid_info
Position 0xade 51 boot_vid_info
Position 0xb92 51 boot_vid_info
Position 0xbae 50 trampoline_phys
Position 0xbb4 46 __trampoline_rel_start
Position 0xbba 47 __trampoline_rel_stop
Position 0xbc6 47 __trampoline_rel_stop
Position 0xbe2 48 __trampoline_seg_start
Position 0xbe8 49 __trampoline_seg_stop
Position 0xbf8 49 __trampoline_seg_stop
$

which looks like debugging leaking out to stderr.

~Andrew

