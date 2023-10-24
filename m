Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A317B7D5682
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 17:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622121.969351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJPa-0004aR-GR; Tue, 24 Oct 2023 15:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622121.969351; Tue, 24 Oct 2023 15:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvJPa-0004Xy-DF; Tue, 24 Oct 2023 15:33:42 +0000
Received: by outflank-mailman (input) for mailman id 622121;
 Tue, 24 Oct 2023 15:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oRW6=GG=linaro.org=alex.bennee@srs-se1.protection.inumbo.net>)
 id 1qvJPY-0004Xm-60
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 15:33:40 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2ea32ab-7282-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 17:33:36 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-507a98517f3so6453450e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 08:33:36 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s3-20020adfea83000000b0031980783d78sm10119502wrm.54.2023.10.24.08.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 08:33:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E4B91FFBB;
 Tue, 24 Oct 2023 16:33:35 +0100 (BST)
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
X-Inumbo-ID: b2ea32ab-7282-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698161616; x=1698766416; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pgn7DZOjqiLKpDeJIAWXRIPQaKWXfmUlyU40rW5Vul0=;
        b=lZTAuIRGi2zwNvQ2gPVdbAwAJXKjf9lnSpyfysRVnLqU/GipPZWCGsUL1iTyTU5Qgj
         wVuzoHmgL3j06vxoVrOLsP6C9+XPAuh8U2zNdjHO3anrQ9YrLtehS8WVN2g0ncvqU8Ro
         OKAawuOue5uvSrsgZik37yLrkq6vHOo6JNr9SLlrFu/kU4y4gKCr1p0kQ1JNTCiCghjV
         OmBeOo56r2sL8IISeT9mMI3Tssj96JjG6/jqvUdn6Ug2R1wNJ5NV2K7WN+6Dnw7W8ob3
         kvJLrKAMNV6T+54S2yiPc2HNwjtrwOY4j34pD3SgBHSXtUisyPROuS2mokJxcHJutb3B
         Vk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698161616; x=1698766416;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pgn7DZOjqiLKpDeJIAWXRIPQaKWXfmUlyU40rW5Vul0=;
        b=V1P34hwdg1Zl8Klo3tL8WnpB6VclRceQ/AJJd9Cl6xPqAa7U26XGKWU1iOP5nG8Kju
         Q1ossX3AK3ODXloyavaBsJuwI/CPHgmGi41p4n2euby7YL2qBa1t5dSshe6pJ5QJ7p2h
         Eg2/QBGm0uFANzfFK8yDXO5jpijP9Vd+4IEJeI7uO3UEKhRpksD63iOC8TQ2CpZjWOgt
         20JLCwpC7L1FkabzJJY+dnpLvPQCGUpiulpXODadmlGhkqXMAkloG2M5SqYp6OWzkW5u
         gBgSgMEZw5djMcI70UqESlIQtlyE3JNG1Px+BlW7abDt2x2X07mXWLWglFnbhRPtBRNN
         ocaA==
X-Gm-Message-State: AOJu0YyLHCQ37sgykU1XTu7820g4RN1rCRxZngfJODOYt5SKg7pnpYY/
	nNQvDcY5Mj4eyaQ0wMTa7R2sGg==
X-Google-Smtp-Source: AGHT+IERaAXJZu/NEaGGq5i9CuYFrG2wQ65+x8yTDScZaEY7DCl2PsKOOkex2LHV25CK2hUsLxDFYA==
X-Received: by 2002:a05:6512:3156:b0:507:a3ae:3252 with SMTP id s22-20020a056512315600b00507a3ae3252mr8565102lfi.27.1698161616310;
        Tue, 24 Oct 2023 08:33:36 -0700 (PDT)
References: <20231016151909.22133-1-dwmw2@infradead.org>
User-agent: mu4e 1.11.22; emacs 29.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
 <hreitz@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>, Paolo
 Bonzini
 <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH 0/12] Get Xen PV shim running in qemu
Date: Tue, 24 Oct 2023 16:24:48 +0100
In-reply-to: <20231016151909.22133-1-dwmw2@infradead.org>
Message-ID: <877cnc2fxs.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


David Woodhouse <dwmw2@infradead.org> writes:

> I hadn't got round to getting the PV shim running yet; I thought it would
> need work on the multiboot loader. Turns out it doesn't. I *did* need to
> fix a couple of brown-paper-bag bugs in the per-vCPU upcall vector suppor=
t,
> and implement Xen console support though. Now I can test PV guests:
>
>  $ qemu-system-x86_64 --accel kvm,xen-version=3D0x40011,kernel-irqchip=3D=
split \
>    -chardev stdio,mux=3Don,id=3Dchar0 -device xen-console,chardev=3Dchar0=
 \
>    -drive file=3D${GUEST_IMAGE},if=3Dxen -display none -m 1G \
>    -kernel ~/git/xen/xen/xen -initrd ~/git/linux/arch/x86/boot/bzImage
>  \

So this is a KVM guest running the Xen hypervisor (via -kernel) and a
Dom0 Linux guest (via -initrd)?

Should this work for any Xen architecture or is this x86 specific? Does
the -M machine model matter?

Would it be possible to have some sort of overview document in our
manual for how Xen guests are supported under KVM?

>    -append "loglvl=3Dall -- console=3Dhvc0 root=3D/dev/xvda1"
>
<snip>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

