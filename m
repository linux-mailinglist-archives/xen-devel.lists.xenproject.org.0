Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0539A9F2EBF
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2024 12:02:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857750.1269964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8rx-00062c-0o; Mon, 16 Dec 2024 11:02:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857750.1269964; Mon, 16 Dec 2024 11:02:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tN8rw-0005zy-UB; Mon, 16 Dec 2024 11:02:32 +0000
Received: by outflank-mailman (input) for mailman id 857750;
 Mon, 16 Dec 2024 11:02:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQSc=TJ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tN8rw-0005zs-84
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2024 11:02:32 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e6b7980-bb9d-11ef-99a3-01e77a169b0f;
 Mon, 16 Dec 2024 12:02:30 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so943603766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2024 03:02:30 -0800 (PST)
Received: from localhost ([85.152.134.39]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab96068988sm321921866b.62.2024.12.16.03.02.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2024 03:02:29 -0800 (PST)
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
X-Inumbo-ID: 3e6b7980-bb9d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1734346950; x=1734951750; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqTk6LaWx/Mf1jhvP5yaED2ql1cMoofpvb2Ww4U+a4w=;
        b=BChQck5tcfBYzi/vXrIZjQIOCXlHHqzV4aHd3/9z2yTckUr0bS/N8I6Vw1ayu+ruqr
         sN8/GvMV2LYLZDW0fEMfxD6CyYS90qr9BXV4bwepHhvPxhpiOj4c6S4YDLUpWvvxeZkR
         9S0hEWepqY0589ELfGM0ZSr9Pi8sAysi4RESk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346950; x=1734951750;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NqTk6LaWx/Mf1jhvP5yaED2ql1cMoofpvb2Ww4U+a4w=;
        b=LYWsCT2r5BntJpKuE2CQST90Fo8R7IjBeQSfMGDtBgOPRDvFDavlB8yhdb+a76z6th
         Ec1RvTCLJnq7Q3fmx8F4WOivbbmd6Y9KRPlC8j9xsHrXWz9mhA1E66jEWfJh1WnNPMaf
         pKdJpVu2oGVtVkZJO524XLUptx5L3BJ6esIOM7rneGs1f/caeKp6RKy5kkQJPJ4TgWcg
         BHL/kLKmz7EC3ntcSRy3TZNaGbanmPZ7kOuag4rkXWDA79a7BxJN2dTW+0xnDhHcz/9S
         5ifeZyC+94TXwuLvTJFME8hZ++osfUdZoicU4Edm1JPpX4hRqPyljudshbCrLXwFMaPV
         9Ikg==
X-Forwarded-Encrypted: i=1; AJvYcCVg3FV2RuPUGlYVqvbxbYwquPH/tbhBgGoVZKED7kO7CE4R6E4qSybPQPGJQSH0MimNSahXbbUV0kw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxc/0Fjjnxrt5VP3vU5TAYb2XZI44ebhQqvox4IkZ4J+fiCjDg4
	Y91kFDWkp/uLVBH/4bs6MluiPd/B/TTrnYZ3XIhPiiHsS3KDTveQAq24vcHJBb0=
X-Gm-Gg: ASbGncse4TtB3TUrrFlhuYyTBMrc3N5kmnXcX/ar7vDkxBbYBy9C31QzchKksMg4pJh
	DWnKCA2KzIpXU33gqxt5stqBAXPSrZakcrw6wpBdbtxacG1iGmbVsN5BxONNjPxvDSBTZP5ByNW
	wN0vG+yNXAw1R2bUuDPEwz7voQKUPv+GhN3J7b7h63OwwIurdm3P8CzADDXCO6g7nlKieO3t2ur
	Hlafkqdh0661q8A2aq/TCExEjGnzwgU2mKoOjD3yH1u+ihXNxZWMGOhRuWUK30=
X-Google-Smtp-Source: AGHT+IGzqRnaOunX1RA6exqOJ43/N2AbM1vjDxzv46YjWFfuwuH8aI6ImKpr8kk8c5xFOx1/30/3vg==
X-Received: by 2002:a17:907:9687:b0:aa6:1afe:b0a5 with SMTP id a640c23a62f3a-aa6c40bca07mr1772407266b.2.1734346949829;
        Mon, 16 Dec 2024 03:02:29 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Dec 2024 11:02:26 +0000
Message-Id: <D6D2OJZ8Z7Z6.1I72QX5GESP3@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 05/13] x86/xstate: Map/unmap xsave area in
 xstate_set_init() and handle_setbv()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
 <20241105143310.28301-6-alejandro.vallejo@cloud.com>
 <fb3bafe4-73f3-4aa1-981a-8faff5f92f9f@suse.com>
In-Reply-To: <fb3bafe4-73f3-4aa1-981a-8faff5f92f9f@suse.com>

On Mon Dec 9, 2024 at 4:16 PM GMT, Jan Beulich wrote:
> On 05.11.2024 15:33, Alejandro Vallejo wrote:
> > No functional change.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks (for this one and the others).

> with ...
>
> > --- a/xen/arch/x86/xstate.c
> > +++ b/xen/arch/x86/xstate.c
> > @@ -993,7 +993,13 @@ int handle_xsetbv(u32 index, u64 new_bv)
> > =20
> >          clts();
> >          if ( curr->fpu_dirtied )
> > -            asm ( "stmxcsr %0" : "=3Dm" (curr->arch.xsave_area->fpu_ss=
e.mxcsr) );
> > +        {
> > +            /* has a fastpath for `current`, so there's no actual map =
*/
> > +            struct xsave_struct *xsave_area =3D VCPU_MAP_XSAVE_AREA(cu=
rr);
>
> ... comment style adhered to (capital 'H').
>
> Jan

Ah, yes. All those ought to be capitalized. My bad.

Cheers,
Alejandro

