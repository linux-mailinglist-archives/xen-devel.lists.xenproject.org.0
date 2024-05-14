Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6808C4E83
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:14:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721290.1124604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oEm-0000m9-PS; Tue, 14 May 2024 09:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721290.1124604; Tue, 14 May 2024 09:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6oEm-0000jh-Mv; Tue, 14 May 2024 09:14:20 +0000
Received: by outflank-mailman (input) for mailman id 721290;
 Tue, 14 May 2024 09:14:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y506=MR=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s6oEl-0000jZ-DB
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:14:19 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57beca1b-11d2-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 11:14:18 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a59e4136010so1373134166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:14:18 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bed0a99sm7297420a12.52.2024.05.14.02.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 02:14:17 -0700 (PDT)
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
X-Inumbo-ID: 57beca1b-11d2-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715678058; x=1716282858; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jCq1jEEBXsJms2qDxK6Vlb8MjfuVjmFZ2iS1y6IJjSo=;
        b=SoetO/Vwiv/8BAy0U0KdbkrOBT5VHxGx4xsYUUmlwEiUWiia8Pa6Nq8ZisOem8KN/Y
         bSR/e+VjDyMtkkCfYKvRGJj1Zgvl4oSPEffx66VMUSgjUy+t/hB0lOBAd1D96/HFHfkY
         d7AxJTQBSvvNWvlo47f9vxcIdKFEmPThkzPBDY86PGpn7S//KdanQ1zVE1jV0CW6qqn3
         ajTqCCm2Fspd6urgXAW0UUI2uz9SagMyttHQfNHsCdbE6DrpMZSexjuP0sRx+BjKk3+Q
         pRnK8/DGqF0lzdn4Zvd4r3k+cfDy7f2EkxehL6D7HFP5sdgTGI5zLGwEki0zBqiwKuve
         NTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715678058; x=1716282858;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jCq1jEEBXsJms2qDxK6Vlb8MjfuVjmFZ2iS1y6IJjSo=;
        b=mIAfvNNeDo/TyothpXRjv/TCmRWvAxXsZcVzmWgtKPjW3kMGdNp3riqA3nlQek5zyL
         tmE3+ULM0QhYXnrKLWCFzmxwewZup2T/d6hg1IA3Ctyjjwm/7PA83VKQTLc1MWbWdsBA
         tDjij0KRBqOpTUd4Tms504XIEP8+NVt1WGgnJBdHOwlPBhkGXFNk2zhVO181ktI1FKMV
         VAKFEghoHXmKxf3fal68hlhVlNhk4YmlSyhpAwbSfRKJosyrsbROz2iLBAN3Np3bCBFm
         CcPH0zsDbxNrAPzsVeTq49H5waNlOyjD6DwKsN9LsFlfjw9o+AcjTFgU98D/B3xb4UI7
         vR/A==
X-Forwarded-Encrypted: i=1; AJvYcCXQCEcvH093hFWyUldZC7yMnNX3qT6uaagMol7mFnr4BDc0bHYhwUFw+GMUm1vGTggGQr1sz0v2JsUXym/UVZ08zFn5ihaBpbuvkgMinRk=
X-Gm-Message-State: AOJu0Yw+q28GZIW5johLhe47rCIdwpsvKRrZLITeZYv5uP028troHbko
	9S1BlBfjM/T6uUevnVMD+jYAAf9AnGmG76n/CNFdo36Ihn9SGOH2/HJSM5JH
X-Google-Smtp-Source: AGHT+IFAKVkPkjztU1ZccSXidEVHF9vGC/KrT7buxO0OeqNZLP2HHMwjn8vHTnDJjo0xRnVrqMIvQQ==
X-Received: by 2002:a50:9505:0:b0:572:6846:b899 with SMTP id 4fb4d7f45d1cf-5734d6b407dmr7680089a12.41.1715678057968;
        Tue, 14 May 2024 02:14:17 -0700 (PDT)
Message-ID: <7c651429b17c2e65f99d72d0595c07cbb3ef2861.camel@gmail.com>
Subject: Re: [PATCH for-4.19] x86/mtrr: avoid system wide rendezvous when
 setting AP MTRRs
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Date: Tue, 14 May 2024 11:14:17 +0200
In-Reply-To: <20240513085925.59324-1-roger.pau@citrix.com>
References: <20240513085925.59324-1-roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Mon, 2024-05-13 at 10:59 +0200, Roger Pau Monne wrote:
> There's no point in forcing a system wide update of the MTRRs on all
> processors
> when there are no changes to be propagated.=C2=A0 On AP startup it's only
> the AP
> that needs to write the system wide MTRR values in order to match the
> rest of
> the already online CPUs.
>=20
> We have occasionally seen the watchdog trigger during `xen-hptool
> cpu-online`
> in one Intel Cascade Lake box with 448 CPUs due to the re-setting of
> the MTRRs
> on all the CPUs in the system.
>=20
> While there adjust the comment to clarify why the system-wide
> resetting of the
> MTRR registers is not needed for the purposes of mtrr_ap_init().
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
> For consideration for 4.19: it's a bugfix of a rare instance of the
> watchdog
> triggering, but it's also a good performance improvement when
> performing
> cpu-online.
>=20
> Hopefully runtime changes to MTRR will affect a single MSR at a time,
> lowering
> the chance of the watchdog triggering due to the system-wide
> resetting of the
> range.
Considering it as a bugfix it will be good to have it in 4.19 release:
 Release-acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

> ---
> =C2=A0xen/arch/x86/cpu/mtrr/main.c | 15 ++++++++-------
> =C2=A01 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/xen/arch/x86/cpu/mtrr/main.c
> b/xen/arch/x86/cpu/mtrr/main.c
> index 90b235f57e68..0a44ebbcb04f 100644
> --- a/xen/arch/x86/cpu/mtrr/main.c
> +++ b/xen/arch/x86/cpu/mtrr/main.c
> @@ -573,14 +573,15 @@ void mtrr_ap_init(void)
> =C2=A0	if (!mtrr_if || hold_mtrr_updates_on_aps)
> =C2=A0		return;
> =C2=A0	/*
> -	 * Ideally we should hold mtrr_mutex here to avoid mtrr
> entries changed,
> -	 * but this routine will be called in cpu boot time, holding
> the lock
> -	 * breaks it. This routine is called in two cases: 1.very
> earily time
> -	 * of software resume, when there absolutely isn't mtrr
> entry changes;
> -	 * 2.cpu hotadd time. We let mtrr_add/del_page hold
> cpuhotplug lock to
> -	 * prevent mtrr entry changes
> +	 * hold_mtrr_updates_on_aps takes care of preventing
> unnecessary MTRR
> +	 * updates when batch starting the CPUs (see
> +	 * mtrr_aps_sync_{begin,end}()).
> +	 *
> +	 * Otherwise just apply the current system wide MTRR values
> to this AP.
> +	 * Note this doesn't require synchronization with the other
> CPUs, as
> +	 * there are strictly no modifications of the current MTRR
> values.
> =C2=A0	 */
> -	set_mtrr(~0U, 0, 0, 0);
> +	mtrr_set_all();
> =C2=A0}
> =C2=A0
> =C2=A0/**


