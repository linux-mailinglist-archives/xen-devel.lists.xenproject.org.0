Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 593BC7A452C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 10:53:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603834.940932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiA0D-0005Pw-79; Mon, 18 Sep 2023 08:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603834.940932; Mon, 18 Sep 2023 08:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiA0D-0005OA-3a; Mon, 18 Sep 2023 08:53:09 +0000
Received: by outflank-mailman (input) for mailman id 603834;
 Mon, 18 Sep 2023 08:53:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pP1k=FC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qiA0B-0005O2-Fm
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 08:53:07 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8ed05f7-5600-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 10:53:06 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-503012f4e71so1995343e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Sep 2023 01:53:06 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 br41-20020a056512402900b0050300e013f3sm989747lfb.254.2023.09.18.01.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 01:53:05 -0700 (PDT)
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
X-Inumbo-ID: c8ed05f7-5600-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695027186; x=1695631986; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I6U1T/uZh7pijbrW8VCrRr4TRTvrx0CMN4VgjO/iTbQ=;
        b=bB+mDDq8Zi5eLrbmdlIxOU2uiGfd31SV3N12byaExdMZhNU6gNgv4Z7Ky7j1CLjujG
         JM3G3FXaaft/dnbaJwBjzsEfOzLYNI9N7uUJuu7dYLLqU282I0W2skf0ruVbs8P/oThB
         D1tjf2nRKpFKz5MfNrPmCxXRYbb8RYkWSm9l66X08wgamlDofCokaLOeOajv4ZW6U6Hm
         +HrcjaMgq+aMKgUPA6/bUTsnTGo1FAEulHCKMVULD9knTnnbxCPKAG/5T0Fj1+zgJmoS
         +iGWejoEEU7t+V90rgMxYNkWIIfiFDHtISC03Wngp5uK6hVzGZ9zgz+Mn/AnBnmMmTlr
         f0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695027186; x=1695631986;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I6U1T/uZh7pijbrW8VCrRr4TRTvrx0CMN4VgjO/iTbQ=;
        b=U8ZgZ8hVzb1TWr5B9Dpv0xigMhpUhNW9y9+lI0YuglFzDCxrI0+PIXrV5EGJzQra9X
         tm995P7LTIVj3UXsWzn1JWuMs7l+Fy/sx6cq+swvdqC97I6B1p6VSuK/RsAS1iqNnjJD
         w7F05D24BOmpfAr3Thh+zDDKLD3jvtfE6dGjQDLjcaVyvgArIVpO4ldRR1TzA4V9rSoS
         94H/MQgm9Wwn8f8d5XKC4nUXY+tVAKWaJyJ1FFmqXUoU7+l4tOMFBQiyP1YVvQS2yIlf
         Zs+vqhAsQxSWAFLkQdNdfsbNt12/IZfualuwjgSTZObIUzlrI2uzox29CrGW5nQ/9MGh
         P9Wg==
X-Gm-Message-State: AOJu0YzdkzcxBR/OutA0j5rCUF4nIcqyDBMyxUmf4P+l3fiOyowV0Ajk
	pCi7OUbWk8kf1fkVJb/Tw9c=
X-Google-Smtp-Source: AGHT+IEDVW3adIzfE2FWiWUJkyk2WG8jaqTk6zKFNw9+iY3Z8I4bZiMz3UnDzyMrHFX1qe5ZN6t/CA==
X-Received: by 2002:a05:6512:2396:b0:500:bf44:b2b3 with SMTP id c22-20020a056512239600b00500bf44b2b3mr3857129lfv.21.1695027185881;
        Mon, 18 Sep 2023 01:53:05 -0700 (PDT)
Message-ID: <3c577bbe7cbf103092ae951ba2f1494136fbdc99.camel@gmail.com>
Subject: Re: [PATCH v1 00/29] Introduce stub headers necessary for full Xen
 build
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Tamas K Lengyel
 <tamas@tklengyel.com>, Alexandru Isaila <aisaila@bitdefender.com>, Petre
 Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
Date: Mon, 18 Sep 2023 11:53:05 +0300
In-Reply-To: <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
	 <da588ba7-f22f-9aa2-4346-de75783bd65e@suse.com>
	 <9036713e5a5e67199b78b25ad1607be605b4a812.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-09-18 at 11:51 +0300, Oleksii wrote:
> On Thu, 2023-09-14 at 17:08 +0200, Jan Beulich wrote:
> > On 14.09.2023 16:56, Oleksii Kurochko wrote:
> > > Based on two patch series [1] and [2], the idea of which is to
> > > provide minimal
> > > amount of things for a complete Xen build, a large amount of
> > > headers are the same
> > > or almost the same, so it makes sense to move them to asm-
> > > generic.
> > >=20
> > > Also, providing such stub headers should help future
> > > architectures
> > > to add
> > > a full Xen build.
> > >=20
> > > [1]
> > > https://lore.kernel.org/xen-devel/cover.1694543103.git.sanastasio@rap=
torengineering.com/
> > > [2]
> > > https://lore.kernel.org/xen-devel/cover.1692181079.git.oleksii.kuroch=
ko@gmail.com/
> > >=20
> > > Oleksii Kurochko (29):
> > > =C2=A0 xen/asm-generic: introduce stub header spinlock.h
> >=20
> > At the example of this, personally I think this goes too far.
> > Headers
> > in
> > asm-generic should be for the case where an arch elects to not
> > implement
> > certain functionality. Clearly spinlocks are required uniformly.
> It makes sense. Then I will back to the option [2] where I introduced
> all this headers as part of RISC-V architecture.
And I will review the current patch series probably it is still can be
something moved to asm-generic.

>=20
> ~ Oleksii


