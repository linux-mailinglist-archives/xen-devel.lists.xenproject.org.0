Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7747C7879
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 23:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616055.957757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr33s-0005rg-5W; Thu, 12 Oct 2023 21:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616055.957757; Thu, 12 Oct 2023 21:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr33s-0005oK-2V; Thu, 12 Oct 2023 21:17:40 +0000
Received: by outflank-mailman (input) for mailman id 616055;
 Thu, 12 Oct 2023 21:17:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr33r-0005oE-Ea
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 21:17:39 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c53d7f09-6944-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 23:17:38 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-53db1fbee70so2505042a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 14:17:38 -0700 (PDT)
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
X-Inumbo-ID: c53d7f09-6944-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697145458; x=1697750258; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vq2DHHNgN1ay7Fwdp3I5ZMWfUBUlatwsBWWqlLrDB9s=;
        b=C4yJzk2M2pc4mgcq6liCFnGSOUm3th1eRfG3ixOundmsHNe35LWbBqSZWHqkg77dI4
         CAFQRe3sjEXFQe6J23igxiZkguLvDdF/Ct6OVNzBrwHdsbW9EyZNv642dNNzTPGHNJLm
         OaMMW/6BUKyVzy8VGM83Wn38K/ZjmQs+wIZwvIr7Vmc2gLi3VpKRm0oL0RNDh4lbo4nP
         kPSp56sDzzTvsco2UDTaZYW/ITR78sLHouLXIfrbZbrTGSwnrkF0jTtnwWvMP6J9QmWc
         zFb7NuORqTsufS8y68Zp4AIesTpwPxvtoKFOVyKnGL1R5e8p/Ymh+2z3YdxRUegMDOTW
         a+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697145458; x=1697750258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vq2DHHNgN1ay7Fwdp3I5ZMWfUBUlatwsBWWqlLrDB9s=;
        b=GN4LbdhfjyFuNoCRKelbeWHt6QnRFKbcgItz0Pby6J2R84H6kFC0755/f3G8hi0IoQ
         Q/XaJiqiusrV1g3T9LAPP2i3rkYS3w9CD8QQV04E+gLTgrq1mfnWGx5itGw1/Lof4BnN
         T2pWItfIQazfveUMpu2Ob0B2GymZNBGPIRjAj5smc3cmrbAsqiUOx4kJplQGUCiSeraw
         pPvwf12QKHIz5uHIyCIJZj3HOPMEajWXRUkmN8yPDHmZtJdtM19KqkxYLr+EIO6meDvB
         7pE6NC0zyw8NewkQvKSnqXKoeuWv7W1kXoTOf5u4/DNWoyStdfgVAuYWs9Kp8cGP7SCJ
         ipig==
X-Gm-Message-State: AOJu0YymnAKC4dSSlUodonwAWcn++Dkm1Zen+I6J9OA+dhCkR2sBPJHm
	mteVHBSbevzQnnUL7yhtjbt1b1cVS7GSWkS2k88=
X-Google-Smtp-Source: AGHT+IFkk5bm0z+SbkCdj2ZECqmt8Zf7B2iGxvVYgN8WfLbpYYBKrqqKimZjM9pWxssXaEAMfUi+zM2eBiUJQ12DqNw=
X-Received: by 2002:aa7:c909:0:b0:530:97b5:49ce with SMTP id
 b9-20020aa7c909000000b0053097b549cemr23858410edt.10.1697145457834; Thu, 12
 Oct 2023 14:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20231012201743.292149-1-ubizjak@gmail.com> <3af8dcec-66ec-4bd4-b7bf-4bc6f5f3c70f@intel.com>
 <CAFULd4byzHyoz4xM1gL_T1wFkNE-ab8K4upXfPirxM9PdX5JWg@mail.gmail.com> <5722e74b-6fc6-4d6e-be25-069ea6385990@zytor.com>
In-Reply-To: <5722e74b-6fc6-4d6e-be25-069ea6385990@zytor.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 12 Oct 2023 23:17:26 +0200
Message-ID: <CAFULd4afhj-kJwneh7wz0sExWqOmPicG4fcfF++_fUMHpoNbXA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Introduce %rip-relative addressing to PER_CPU_VAR macro
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dave Hansen <dave.hansen@intel.com>, x86@kernel.org, xen-devel@lists.xenproject.org, 
	linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 11:08=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wro=
te:
>
> On 10/12/23 13:59, Uros Bizjak wrote:
> > On Thu, Oct 12, 2023 at 10:53=E2=80=AFPM Dave Hansen <dave.hansen@intel=
.com> wrote:
> >>
> >> On 10/12/23 13:12, Uros Bizjak wrote:
> >>> The last patch introduces (%rip) suffix and uses it for x86_64 target=
,
> >>> resulting in a small code size decrease: text data bss dec hex filena=
me
> >>> 25510677 4386685 808388 30705750 1d48856 vmlinux-new.o 25510629 43866=
85
> >>> 808388 30705702 1d48826 vmlinux-old.o
> >>
> >> I feel like I'm missing some of the motivation here.
> >>
> >> 50 bytes is great and all, but it isn't without the cost of changing
> >> some rules and introducing potential PER_CPU_ARG() vs. PER_CPU_VAR()
> >> confusion.
> >>
> >> Are there some other side benefits?  What else does this enable?
> >
> > These changes are necessary to build the kernel as Position
> > Independent Executable (PIE) on x86_64 [1]. And since I was working in
> > percpu area I thought that it was worth implementing them.
> >
> > [1] https://lore.kernel.org/lkml/cover.1682673542.git.houwenlong.hwl@an=
tgroup.com/
> >
>
> Are you PIC-adjusting the percpu variables as well?

After this patch (and after fixing percpu_stable_op to use "a" operand
modifier on GCC), the only *one* remaining absolute reference to
percpu variable remain in xen-head.S, where:

    movq    $INIT_PER_CPU_VAR(fixed_percpu_data),%rax

should be changed to use leaq.

All others should then be (%rip)-relative.

Uros.

