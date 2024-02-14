Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B916F8546A3
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 10:54:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680328.1058423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raByA-0005ma-OW; Wed, 14 Feb 2024 09:54:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680328.1058423; Wed, 14 Feb 2024 09:54:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raByA-0005kJ-Lb; Wed, 14 Feb 2024 09:54:22 +0000
Received: by outflank-mailman (input) for mailman id 680328;
 Wed, 14 Feb 2024 09:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C2D8=JX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1raBy9-0005kB-Eg
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 09:54:21 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0641b1a7-cb1f-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 10:54:20 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3d002bc6f7so172163766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 01:54:20 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 rp1-20020a170906d96100b00a3d623d1adasm70066ejb.118.2024.02.14.01.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 01:54:19 -0800 (PST)
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
X-Inumbo-ID: 0641b1a7-cb1f-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707904460; x=1708509260; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ciF9uY8fLw9+WCGFP+zSgB0zLXEE1BJOysGzHHC8bH8=;
        b=k5j3TkBmQoyHIghxQUnRbhMIOVCB+S/B4O+sZG9N3yuSxHLhYvvx6J3mVx4ay9Awb+
         V36usUqA5VSze9Abxtbk78aVI1v8EGfRrlsbNU4ffzuJJddKlrV1nxG0GVIleK+W7WEe
         JRdPuHghp7zyCVkeLqIlN29JuTC34AkPMfhH7N1AHVA9uYew1E+BmWmbhHClTMPCgj/E
         MmCmBKZRIe4AvweOVY0mJfBO/HeKlf3GiOGlk7ZpRcbAcP4YL7ZlQP5dyWlYVDijWCPw
         l7VydVVEi4hVcVcmQ7E8K52gLbIKgt+YRjzdquBWYo07zArQq8KEL/bQzcBAnXYHqcxp
         E6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707904460; x=1708509260;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ciF9uY8fLw9+WCGFP+zSgB0zLXEE1BJOysGzHHC8bH8=;
        b=fbVaf+8CmEpGtPvvc+7/vLYpRSPIGwd51YjH2Aq8dKrfJjAXhaZrKwoSJqkTapQQnG
         CWLcfgDGPrb8WuTJPCfT3MlYiiNoEEJ0XQqy2f2AJRwyNke8oOsHxpE5KwoRurHw6Rns
         QVOSPry07tLuZnCG6O7SmlnnSDtPiFadwfTjB6c7JQck9Sc81ib1bPX7LXvGHwtoSrob
         Hqvz2AYqSSo554t1xURKsksmvQSZr96W+iaQOkdXyJ4J1deOU8WK8BH2vvbFarcT0NRT
         bL4O7YgFGMteO8eWZxZISZhESR6BcBWBx0plEFcGAp/8tRcgnDQkqMlZAdOJnTjflR6c
         STnw==
X-Forwarded-Encrypted: i=1; AJvYcCXTGgsergyHlqXwEKQlvBm5tNrYsyNJremzD5xUCSTosZD6htxBwymVghAK9FsD2RUHBiGpmS0UAUV+eLmEGm44mu17H9jYVXzmdDo65ec=
X-Gm-Message-State: AOJu0Yw0T3acv5kH82wrsnu9J3WqH5+nmtUAsv+RxDomCZ06qhbaRz37
	THltt5vJUCbpAQNY1/97qIf5H/9kFgPNrOqnEyNzgHLywH8gRolw
X-Google-Smtp-Source: AGHT+IEGBqEHnWDDVGm61NE7A4JWctMc8w2m6KIKPNa0uGSjqY99sc2Qv9Rl9AYBEyc1wIcqb6CXWQ==
X-Received: by 2002:a17:906:339b:b0:a3c:aa02:3ca9 with SMTP id v27-20020a170906339b00b00a3caa023ca9mr1332642eja.25.1707904459939;
        Wed, 14 Feb 2024 01:54:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCULjTBf2Kahqdje0oeHa4jxD9/x9djAwka9xe5k3AfaWnG+f20SefpImYYjZWacD8lm8IpM5WHELcOI/66ery4fYOutA0I3TnJXf81TReSa2ZiNF21UWHx3uRcZP3cC4wP1dikAzLEo3SdVzIsmktL+1jv6alB/R/nVSn2p3LOC9K7J0HPBsgOeGnuiKRp5V3DOAAtrvgEqFqAoWgmXqxOsm9BJFRwcepgRvQHPKXBOr+zwWE3gJvRd18YTCdRL/OVQm6WXOwqYxVwZS4ZgFyEyh1yFbjkc96dCUVJ/BieCkLnRsmDAt/s=
Message-ID: <d2cc798462de9e0d7a89777ea0743fe6dce4d061.camel@gmail.com>
Subject: Re: [PATCH v4 02/30] xen/riscv: use some asm-generic headers
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 14 Feb 2024 10:54:18 +0100
In-Reply-To: <16baca98-44fe-42ba-b61d-ff1945e0d2b5@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <a721f0c092306b589fae5f44bdaafcd94c60ed14.1707146506.git.oleksii.kurochko@gmail.com>
	 <16baca98-44fe-42ba-b61d-ff1945e0d2b5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-12 at 16:03 +0100, Jan Beulich wrote:
> On 05.02.2024 16:32, Oleksii Kurochko wrote:
> > Some headers are the same as asm-generic verions of them
> > so use them instead of arch-specific headers.
>=20
> Just to mention it (I'll commit this as is, unless asked to do
> otherwise):
> With this description I'd expect those "some headers" to be removed
> by
> this patch. Yet you're not talking about anything that exists;
> instead I
> think you mean "would end up the same". Yet that's precisely what
> asm-generic/ is for. Hence I would have said something along the
> lines of
> "don't need any customization".
Agree that "some headers" isn't the best one option to describe the
changes. Perhaps, it would be better to specify the headers which would
end up the same as asm-generic's version.
Thanks for such notes!

>=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > =C2=A0As [PATCH v6 0/9] Introduce generic headers
> > =C2=A0(
> > https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko=
@gmail.com
> > /)
> > =C2=A0is not stable, the list in asm/Makefile can be changed, but the
> > changes will
> > =C2=A0be easy.
>=20
> Or wait - doesn't this mean the change here can't be committed yet? I
> know the cover letter specifies dependencies, yet I think we need to
> come
> to a point where this large series won't need re-posting again and
> again.
We can't committed it now because asm-generic version of device.h,
which is not commited yet.

We can drop the change " generic-y +=3D device.h ", and commit the
current one patch, but it sill will require to create a new patch for
using of asm-generic/device.h. Or as an option, I can merge "generic-y
+=3D device.h" into PATCH 29/30 xen/riscv: enable full Xen build.

I don't expect that the of asm-generic headers will changed in
riscv/include/asm/Makefile, but it looks to me that it is better to
wait until asm-generic/device.h will be in staging branch.


If you have better ideas, please share it with me.

~ Oleksii

