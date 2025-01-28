Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8689A20932
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 12:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878393.1288570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjMY-0006t4-Ct; Tue, 28 Jan 2025 11:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878393.1288570; Tue, 28 Jan 2025 11:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcjMY-0006qh-9n; Tue, 28 Jan 2025 11:02:34 +0000
Received: by outflank-mailman (input) for mailman id 878393;
 Tue, 28 Jan 2025 11:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AW3f=UU=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tcjMW-0006qb-Qi
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 11:02:32 +0000
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dfa34e3-dd67-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 12:02:30 +0100 (CET)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-71e2bc5b90fso2931789a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jan 2025 03:02:30 -0800 (PST)
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
X-Inumbo-ID: 5dfa34e3-dd67-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1738062149; x=1738666949; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAPP67iq/fZlFT5QwMZH0FVtr7XinDNZQPhjL/SYDyo=;
        b=QcMM2vqUfcrtLDRw7h/g2QbSj42fCbUXYhXtjP8Mf44alhk3uwrgj8OwJhGJSjRhF1
         gkrpgH9MGvTwShnaGcAgd9UttOH0LKn+Jy/W1fvYmROBkRuXF3COZN+lXdZTw2zQRFXz
         gRMkbfyxKazlSd3x+12SNCvFXE2L2IDdp1+MQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738062149; x=1738666949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAPP67iq/fZlFT5QwMZH0FVtr7XinDNZQPhjL/SYDyo=;
        b=OakXMlweBz9Pa0gIa70GO57Q8Mg2cc1NPQOYu7MIJiLmbcf1HNoiMT4eiQUN4dhfOA
         pJqaFVkbuIHYlaVlgji+RCy/kcRSFXfDxIc9hyLkPPyW8IXWj+K41NEi3uQIMFPJ4gIA
         D5ptEr81HX3Pt6H+S3TtV5qO+zygxBjxDdZYWt6Av5lsHZAznJLd+LaGTz6MCIqsty5/
         W9Z0F/rUj5vDhzEoHeusAUMZvUrDMtw3kFjwsk6BX/2+BwRaDU7CwZ28uwA8ExfnMTjN
         Ywbybo8YolDeQBxswKAj03eQyLWt+rGo+V+IdR8EckFf4AX+3SH70ktBth58VCeoyjJO
         b0Lw==
X-Gm-Message-State: AOJu0YxT13cJRl94srumZawdaCFjPPzdZio1CPMMRSYV7FTR98sqKez+
	wGFLodywrx8Aag8jCWkVG6IBRnuRTEFfQFul1YBy61JCi+4P/wnS90Ie7biGXaS3yM9/5Ji0GUy
	rGaSWo+CJ1hCIuybNPe9m/J2Ztj1O/pEDhh8OoSVMlYXoZXfV7gE=
X-Gm-Gg: ASbGnctoEEDkM8LwTqyzbuNNhAdsombZohjcOOpTiPFiWGUaD+C1EZNSX5CnZ7B+muU
	CN41NECVTkPN1MriP7j5c8lq+I/f9Ju0x+1BLN0cWwmsC0WsxqOj+5UJDLLFqbxtmL52IKxgq7U
	8=
X-Google-Smtp-Source: AGHT+IGoGR17LILmDJyAuvFIrE6eoahMphFFs3jrb79H45NTRlP+3t7BPnU6oQtSav491MANOIpfszF2Eykzvcpp1dY=
X-Received: by 2002:a05:6870:7e89:b0:27c:a414:b907 with SMTP id
 586e51a60fabf-2b1c0c7667amr27172377fac.33.1738062149237; Tue, 28 Jan 2025
 03:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20250114115430.104084-1-frediano.ziglio@cloud.com>
In-Reply-To: <20250114115430.104084-1-frediano.ziglio@cloud.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 28 Jan 2025 11:02:17 +0000
X-Gm-Features: AWEUYZmMzTgbbxw__LmW2sukWOiGlbA7wKpYVfJ0oKMXUJkSbi2BmHkn1V1b5Jo
Message-ID: <CACHz=Zh65aak9T7WQiV9CYDPfJG-KLfJ=rJWFB5y=_XXqNsAaQ@mail.gmail.com>
Subject: Re: [PATCH v2] x86/boot: Handle better alignment for 32 bit code
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

ping

On Tue, Jan 14, 2025 at 11:54=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> Output file didn't have correct alignment.
> Allows alignment into data or code up to 2mb.
> Intermediate object files are kept in order to copy alignment
> from object produced by the linker and final object (produced
> by combine_two_binaries.py script).
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/Makefile        | 12 ++++++++----
>  xen/tools/combine_two_binaries.py |  7 ++++++-
>  2 files changed, 14 insertions(+), 5 deletions(-)
>
> Changes since v1:
> - Improve comments and description.
>
> diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
> index 13d4583173..a56d8a7e0f 100644
> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -40,8 +40,12 @@ LD32 :=3D $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
>  # are affected by both text_diff and text_gap.  Ensure the sum of gap an=
d diff
>  # is greater than 2^16 so that any 16bit relocations if present in the o=
bject
>  # file turns into a build-time error.
> -text_gap :=3D 0x010200
> -text_diff :=3D 0x408020
> +# As gap will affect the output section size it should not be huge to av=
oid the
> +# creation of huge files.
> +# The sum of gap and diff will affect the possible alignment so should b=
e a
> +# multiple of the possible alignment.
> +text_gap :=3D 0x01c240
> +text_diff :=3D 0x7e3dc0
>
>  $(obj)/build32.base.lds: AFLAGS-y +=3D -DGAP=3D$(text_gap) -DTEXT_DIFF=
=3D$(text_diff)
>  $(obj)/build32.offset.lds: AFLAGS-y +=3D -DGAP=3D$(text_gap) -DTEXT_DIFF=
=3D$(text_diff) -DAPPLY_OFFSET
> @@ -69,7 +73,6 @@ $(obj)/built-in-32.%.bin: $(obj)/build32.%.lds $(obj)/b=
uilt-in-32.tmp.o
>         $(LD32) $(orphan-handling-y) -N -T $< -o $(@:bin=3Do) $(filter %.=
o,$^)
>         $(NM) -p --format=3Dbsd $(@:bin=3Do) > $(@:bin=3Dmap)
>         $(OBJCOPY) -j .text -O binary $(@:bin=3Do) $@
> -       rm -f $(@:bin=3Do)
>
>  quiet_cmd_combine =3D GEN     $@
>  cmd_combine =3D \
> @@ -80,6 +83,7 @@ cmd_combine =3D \
>                --bin1      $(obj)/built-in-32.base.bin \
>                --bin2      $(obj)/built-in-32.offset.bin \
>                --map       $(obj)/built-in-32.base.map \
> +              --align     $(shell $(OBJDUMP) -h $(obj)/built-in-32.base.=
o|sed '/text.*2\*\*/ {s/.*2\*\*//;p;}; d') \
>                --exports   cmdline_parse_early,reloc,reloc_trampoline32 \
>                --output    $@
>
> @@ -90,4 +94,4 @@ $(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj=
)/built-in-32.offset.bin
>                        $(srctree)/tools/combine_two_binaries.py FORCE
>         $(call if_changed,combine)
>
> -clean-files :=3D built-in-32.*.bin built-in-32.*.map build32.*.lds
> +clean-files :=3D built-in-32.*.bin built-in-32.*.map built-in-32.*.o bui=
ld32.*.lds
> diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_bi=
naries.py
> index 581e57cbc0..8e587c24fb 100755
> --- a/xen/tools/combine_two_binaries.py
> +++ b/xen/tools/combine_two_binaries.py
> @@ -26,6 +26,10 @@ parser.add_argument('--text-diff', dest=3D'text_diff',
>                      required=3DTrue,
>                      type=3Dauto_int,
>                      help=3D'Difference between code section start')
> +parser.add_argument('--align', dest=3D'align',
> +                    default=3D2,
> +                    type=3Dauto_int,
> +                    help=3D'Alignment in power of 2')
>  parser.add_argument('--output', dest=3D'output',
>                      help=3D'Output file')
>  parser.add_argument('--map', dest=3D'mapfile',
> @@ -93,7 +97,7 @@ if size1 > size2:
>      file1, file2 =3D file2, file1
>      size1, size2 =3D size2, size1
>  if size2 !=3D size1 + gap:
> -    raise Exception('File sizes do not match')
> +    raise Exception('File sizes do not match %d !=3D %d + %d' % (size2, =
size1, gap))
>  del size2
>
>  file1.seek(0, 0)
> @@ -219,6 +223,7 @@ print('''/*
>   * File autogenerated by combine_two_binaries.py DO NOT EDIT
>   */''', file=3Dout)
>  print('\t' + args.section_header, file=3Dout)
> +print('\t.p2align\t' + str(args.align), file=3Dout)
>  print('obj32_start:', file=3Dout)
>  output(out)
>  print('\n\t.section .note.GNU-stack,"",@progbits', file=3Dout)
> --
> 2.34.1
>

