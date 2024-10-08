Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9CD994476
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 11:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812948.1225698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6g0-0008Sh-2s; Tue, 08 Oct 2024 09:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812948.1225698; Tue, 08 Oct 2024 09:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6fz-0008Pq-VI; Tue, 08 Oct 2024 09:38:43 +0000
Received: by outflank-mailman (input) for mailman id 812948;
 Tue, 08 Oct 2024 09:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5fn=RE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sy6fy-0008Pk-85
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 09:38:42 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a067124-8559-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 11:38:40 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a8d43657255so853019166b.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 02:38:40 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a993ab8e75esm430768666b.222.2024.10.08.02.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 02:38:39 -0700 (PDT)
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
X-Inumbo-ID: 1a067124-8559-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728380320; x=1728985120; darn=lists.xenproject.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09lpA4D+P0B1cNowckUFgOKjxnycBsShODd6kGoWQpM=;
        b=lhBEgbUgLutpGnMGUvG/ObtXAcCqG+Da5EFK5rYunCdv/DG/0ScemT3LWNwpo+nCER
         ayZO+5rSdMYx3XpUTyXKKP3jpzAfpMKTby4KJ8j6+2ENMWVFd14fPNF/QQepVi2Pk4IR
         Z4EeUoU5RAZXDAM95m46CeLI7/Cxzj7kA6u1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728380320; x=1728985120;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=09lpA4D+P0B1cNowckUFgOKjxnycBsShODd6kGoWQpM=;
        b=wC+ks0uSRjrITTMajtNcPG/K8oB3uBfrM2Lzg0DXXfWBp6BwWOj94H3Hd7g9CoY17M
         nB4Ep2YZah3dh13gSVoxruBYlhZKwBTQzbvpN84JcN2YXGjupX1fWJLebmhLKVZXm35Q
         oZIAvYx03oiamNUrUps/aGanJvHavlJpUaefTliqluutDHBgDNBqM5PbDpKSyFCRrYjQ
         isbX8GrhfeLlIQCy+0Dzt/tIe+eWMKXkX0RjrlQ5gz4IPIO34mjSv+qEuMEk4amxTPNT
         7qiNdpk9bFmKVwiuy2yynnbfM49cEZIuZkECo63vS1dw6e6nDW3rg5PaS1ZreU9CRs3E
         rr2w==
X-Forwarded-Encrypted: i=1; AJvYcCVIHgE6yOZDk50ky1chgUDmVtI0+f9I/a+DILhyh+BSh7QNUGcCc+7XlqyTKV9UMrKqOLCKI2iwHh0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWZL+EBP+apDjX70Us5m3b74C3zniZrocgVtX1uaWd6p8Sw772
	mAkeEEodi+UUrnV4yjB362i2N1UjuThlyRfSsq+6PBcY3UNT4c1D5KLKWP59rxE=
X-Google-Smtp-Source: AGHT+IF6yvsJAQtvj5aO7KEBTEetVL2qhIA8wXkCQGXNwBvOmfrPwxROIZ+ROBLH68nJaiiQORepuQ==
X-Received: by 2002:a17:907:3f21:b0:a99:76bc:d753 with SMTP id a640c23a62f3a-a9976bcd8c6mr145338566b.45.1728380320242;
        Tue, 08 Oct 2024 02:38:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Oct 2024 10:38:39 +0100
Message-Id: <D4QBOT9OWGK2.1AOPQG6UGK35F@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v4 2/2] x86/fpu: Rework fpu_setup_fpu() uses to split it
 in two
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
X-Mailer: aerc 0.18.2
References: <20241007155240.17186-1-alejandro.vallejo@cloud.com>
 <20241007155240.17186-3-alejandro.vallejo@cloud.com>
 <260d904c-54b0-456e-b4a5-9811f2e62c2c@suse.com>
In-Reply-To: <260d904c-54b0-456e-b4a5-9811f2e62c2c@suse.com>

On Tue Oct 8, 2024 at 7:37 AM BST, Jan Beulich wrote:
> On 07.10.2024 17:52, Alejandro Vallejo wrote:
> > It was trying to do too many things at once and there was no clear way =
of
> > defining what it was meant to do. This commit splits the function in tw=
o.
> >=20
> >   1. A function to return the FPU to power-on reset values.
> >   2. A x87/SSE state loader (equivalent to the old function when it too=
k
> >      a data pointer).
> >=20
> > The old function also had a concept of "default" values that the FPU
> > would be configured for in some cases but not others. This patch remove=
s
> > that 3rd vague initial state and replaces it with power-on reset.
> >=20
> > While doing this make sure the abridged control tag is consistent with =
the
> > manuals and starts as 0xFF
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > --
> > @Jan: The patch changed substantially. Are you still ok with this R-by?
>
> I am. However in such a situation imo you'd better drop the tag, for it t=
o
> be re-offered (if desired). It can very well happen that the person simpl=
y
> doesn't notice the question pointed at them.
>
> Jan

Noted for next time. Thanks for the promptness!

Cheers,
Alejandro

