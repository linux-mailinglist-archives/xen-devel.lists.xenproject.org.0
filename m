Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D58B22D05
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 18:19:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078907.1439934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrhx-0003rF-DN; Tue, 12 Aug 2025 16:18:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078907.1439934; Tue, 12 Aug 2025 16:18:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulrhx-0003oK-9p; Tue, 12 Aug 2025 16:18:41 +0000
Received: by outflank-mailman (input) for mailman id 1078907;
 Tue, 12 Aug 2025 16:18:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x9jM=2Y=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ulrhv-0003oE-Fs
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 16:18:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0118f3d4-7798-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 18:18:38 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-459d4d7c745so51640575e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 09:18:38 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e586ad64sm299497405e9.20.2025.08.12.09.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 09:18:37 -0700 (PDT)
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
X-Inumbo-ID: 0118f3d4-7798-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755015518; x=1755620318; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R/0wVDCBE9QNHDdDCjtZF8Q+2Pd1IE6dPBWQGjz6QIA=;
        b=f/0x/UsGOw7Hkucf/1WU7ieLlTszgKodtmsA581aDan3lk1y58Dtea0PXsBcAS7xoC
         QREKjqPC8PmxhupQHmAoUm8YLmplMou+tTVZpWveJWi6dkvUVbBBjWy3UKUI0j4irdEQ
         YjY2yNgps2/U+/iO4OHbuZlMoSbTYuwe0ujXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755015518; x=1755620318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/0wVDCBE9QNHDdDCjtZF8Q+2Pd1IE6dPBWQGjz6QIA=;
        b=jPdnAMbZGHON0Le4xga5lG8Zejy30odrGeVypFfgX8szzofb/F94oHaujN3j6CEs3G
         y+qONSZwyfxZNCyFhTdrKttcAetFtQUYrPIay5ocJazYbJCEVv2I0xNkEXqc3F4KfFJ7
         SbKPY33BnBnLcN1MxosAm7kzsMGuHjL76SFAfcerPWqpz4nVuGFNnOVysBTpMGuiDnnK
         XwveAjnSkiVGDSIWWnCKbgMMc6016+eSrQ03IHJmkSKryONZxs6lS3yJ9gPziC0HyEyn
         PPJtZeuYZEkXjKowboPXE1+DIpd7AMT4ac4SZ3THNlofsNd22LrvJc84l23EwsV1qTOw
         wDsw==
X-Gm-Message-State: AOJu0YxuQKcl8eI6SeIvXYCUi86Ci3W6pmOuGirTC42v3UKAdT+Ke8Qy
	bkZvbIn2ss3XZfANH30KJxqrDdFmjljgF3QT7iSPfJDs0oBur9gT9yAEHgI1xckBlZs=
X-Gm-Gg: ASbGncu5gdlEuh+2gK2Tc+L3cGFyG+ujh+qLLMF7395CZc/aSaviicc5X9AIcsE+KCx
	aqgkjzUUMjQlno1N8gQu+9IO5MH+Qc9IXBhq+939OU3snXGX1DqKYIDFfNaRHYGdi/J6/l0lIvU
	F98fdQthWmMeW0L2ePllG2EiiPxihsFFv86pXcBXOG6z65xH5bwgPQ5CBf+1BGVNv8tu7XbLby8
	siAYqFerijEAu0ec+pdO2jt5Kv8yU7+3aktZwhDNNf991IYK5EdCSpE11rRLS7vehI0gJ+0lJMb
	vHJiaRJzdi5r6jCzvrJHHpazOWTteoRSl9z0tBG2nsE60pV0I+/nCjtHkN3IrvYUz6wP3blNVto
	huBc/uNMD2PCosf5qK3S+zslUG9p+/9zrjfPho64qZwY1+zsPp9l18f8jtlm+Lki/mw==
X-Google-Smtp-Source: AGHT+IE2lHST6bsZeJTFbbDYLswTp2JMeVABSYnLMu1COZCCFt28y+YvXiaakyWJMitsQH9hVYBSPw==
X-Received: by 2002:a05:600c:45d2:b0:459:df25:b839 with SMTP id 5b1f17b1804b1-45a15b57b85mr3999975e9.33.1755015517978;
        Tue, 12 Aug 2025 09:18:37 -0700 (PDT)
Date: Tue, 12 Aug 2025 18:18:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/mkelf32: pad load segment to 2Mb boundary
Message-ID: <aJtpXOM2AERnOCrH@macbook.local>
References: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
 <6e295921-0432-435e-9efe-51caa106f203@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e295921-0432-435e-9efe-51caa106f203@suse.com>

On Mon, Aug 11, 2025 at 12:49:57PM +0200, Jan Beulich wrote:
> In order to legitimately set up initial mappings past _end[], we need
> to make sure that the entire mapped range is inside a RAM region.
> Therefore we need to inform the bootloader (or alike) that our allocated
> size is larger than just the next SECTION_ALIGN-ed boundary past _end[].
> 
> This allows dropping a command line option from the tool, which was
> introduced to work around a supposed linker bug, when the problem was
> really Xen's.
> 
> While adjusting adjacent code, correct the argc check to also cover the
> case correctly when --notes was passed.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> There's no good Fixes: tag, I don't think, as in theory the issue could
> even have happened when we still required to be loaded at a fixed
> physical address (1Mb originally, later 2Mb), and when we statically
> mapped the low 16Mb. If we assumed such can't happen below 16Mb, these
> two should be added:
> Fixes: e4dd91ea85a3 ("x86: Ensure RAM holes really are not mapped in Xen's ongoing 1:1 physmap")
> Fixes: 7cd7f2f5e116 ("x86/boot: Remove the preconstructed low 16M superpage mappings")
> ---
> v2: New.
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -130,8 +130,7 @@ orphan-handling-$(call ld-option,--orpha
>  
>  $(TARGET): TMP = $(dot-target).elf32
>  $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
> -	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
> -	               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
> +	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET)
>  	od -t x4 -N 8192 $(TMP)  | grep 1badb002 > /dev/null || \
>  		{ echo "No Multiboot1 header found" >&2; false; }
>  	od -t x4 -N 32768 $(TMP) | grep e85250d6 > /dev/null || \
> --- a/xen/arch/x86/boot/mkelf32.c
> +++ b/xen/arch/x86/boot/mkelf32.c
> @@ -248,7 +248,6 @@ static void do_read(int fd, void *data,
>  
>  int main(int argc, char **argv)
>  {
> -    uint64_t   final_exec_addr;
>      uint32_t   loadbase, dat_siz, mem_siz, note_base, note_sz, offset;
>      char      *inimage, *outimage;
>      int        infd, outfd;
> @@ -261,22 +260,24 @@ int main(int argc, char **argv)
>      Elf64_Ehdr in64_ehdr;
>      Elf64_Phdr in64_phdr;
>  
> -    if ( argc < 5 )
> +    if ( argc < 4 )
>      {
> +    help:
>          fprintf(stderr, "Usage: mkelf32 [--notes] <in-image> <out-image> "
> -                "<load-base> <final-exec-addr>\n");
> +                "<load-base>\n");
>          return 1;
>      }
>  
>      if ( !strcmp(argv[1], "--notes") )
>      {
> +        if ( argc < 5 )
> +            goto help;
>          i = 2;
>          num_phdrs = 2;
>      }
>      inimage  = argv[i++];
>      outimage = argv[i++];
>      loadbase = strtoul(argv[i++], NULL, 16);
> -    final_exec_addr = strtoull(argv[i++], NULL, 16);
>  
>      infd = open(inimage, O_RDONLY);
>      if ( infd == -1 )
> @@ -339,9 +340,12 @@ int main(int argc, char **argv)
>      (void)lseek(infd, in64_phdr.p_offset, SEEK_SET);
>      dat_siz = (uint32_t)in64_phdr.p_filesz;
>  
> -    /* Do not use p_memsz: it does not include BSS alignment padding. */
> -    /*mem_siz = (uint32_t)in64_phdr.p_memsz;*/
> -    mem_siz = (uint32_t)(final_exec_addr - in64_phdr.p_vaddr);
> +    /*
> +     * We don't pad .bss in the linker script, but during early boot we map
> +     * the Xen image using 2M pages.  To avoid running into adjacent non-RAM
> +     * regions, pad the segment to the next 2M boundary.

Won't it be easier to pad in the linker script?  We could still have
__bss_end before the padding, so that initialization isn't done to the
extra padding area.  Otherwise it would be helpful to mention why the
padding must be done here (opposed to being done in the linker
script).

Thanks, Roger.

