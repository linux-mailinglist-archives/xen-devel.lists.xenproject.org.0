Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2177EADB4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 11:14:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632303.986549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2qQG-0000wV-Iu; Tue, 14 Nov 2023 10:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632303.986549; Tue, 14 Nov 2023 10:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2qQG-0000tC-GB; Tue, 14 Nov 2023 10:13:32 +0000
Received: by outflank-mailman (input) for mailman id 632303;
 Tue, 14 Nov 2023 10:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJWh=G3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r2qQE-0000t5-NU
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 10:13:30 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 753d5773-82d6-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 11:13:29 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso76265261fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Nov 2023 02:13:29 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 t21-20020a056512069500b0050a71d4e9bcsm1265608lfe.286.2023.11.14.02.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 02:13:28 -0800 (PST)
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
X-Inumbo-ID: 753d5773-82d6-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699956809; x=1700561609; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ITwQjDrSWz3qdi8wxxVPQCcMQz4L5ISFHd4jG39M5s=;
        b=EsDldAsNwaazWPRleHRR37dDFxZ/kD+rr4KuPAhBHsc4OmY6Xhe0BTZoeRbVi5Mdn5
         IXM3YD3RN1Xxa3oLSVO7CdQjuaT1QJWx0FrZuSleMx98RVF1OFXORkcGJLeXayODNmwF
         d+9xuIxQ9eB2lO5kuNolc5Md3Sc2UrK7QKYcwtracDehUPClHocDCVlLODSX4iMfnGat
         WffpRWGf/rCYOrFtUn9Mo+eC5Gcovs2O1vQw2CZwH5LhRYfDdJIfBMmXywwY3iwCbDoO
         OKpynVdpo6+Ys+CcqrFoNltvfKHoBdgvxDs8FCa5gWor+qc8VTjclu/d0I/LeahcQtWN
         Etsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699956809; x=1700561609;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ITwQjDrSWz3qdi8wxxVPQCcMQz4L5ISFHd4jG39M5s=;
        b=f1lX4qg+VT0Vb449WUFYrZfvGL+QlD4R3bffYxy41npzeVWUusF/GbYkH7sRE1o8rY
         VFcf7k2tYim52AfrAVU1dVeEbUdAUR2OT3uQEhUji6UFrRlo56qMak2yTRPghc2sar8y
         Cw/k8JSU3xZ+Ds/4bFyk90t4PetAx3OIGAwmr2rXjKELBwzPXWK3sWt/ejSzxwMOejRl
         1VayiESf1vEFvG26ESQgSrsvCCMKmJhetzitsrKqUMcVTXNzoNKbgJNdCiI3c9wl0h3q
         FJcShsB8AQCaeYWIIQwlgoY3wgQYw//mVyKIDxWxAoWGACb4hQ4lO+ROtnUcxxBOqzZO
         +IdA==
X-Gm-Message-State: AOJu0YzrBVf34ZZdy6ZrgKuZ0GbMpVhbUlkNUBAupgOzmsMyQuvjpHBn
	K4wrIXZcZJbOycl2j74IzRs=
X-Google-Smtp-Source: AGHT+IEL7/rMxLZK5z6ph7f8eLNu6Z2E3X0g+DtD5pl5SlGhCmyi26GM86JDSnujizvW35FXKEATPw==
X-Received: by 2002:a05:6512:4025:b0:50a:763f:ecf1 with SMTP id br37-20020a056512402500b0050a763fecf1mr7765357lfb.12.1699956808909;
        Tue, 14 Nov 2023 02:13:28 -0800 (PST)
Message-ID: <3ee243df009f4f98be938c54d9a1540fd1ddcd3b.camel@gmail.com>
Subject: Re: [PATCH v2 04/15] xen/asm-generic: introduce generic hypercall.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Tue, 14 Nov 2023 12:13:27 +0200
In-Reply-To: <08f5852a-5888-e82f-ca64-fe268f60c949@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <87a6f7a2135361ad231bfc0cfc2d73ca78c357a3.1699633310.git.oleksii.kurochko@gmail.com>
	 <e7cd2613-7af9-bfae-fb75-85d3bc2f3caf@suse.com>
	 <08f5852a-5888-e82f-ca64-fe268f60c949@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-11-13 at 17:50 +0100, Jan Beulich wrote:
> On 13.11.2023 17:45, Jan Beulich wrote:
> > On 10.11.2023 17:30, Oleksii Kurochko wrote:
> > > Introduce an empty generic hypercall.h for archs which don't
> > > implement it.
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >=20
> > Since - judging from Arm's present header - it looks technically
> > possible
> > for an arch to get away with this:
> > Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> Actually - why does this patch not drop PPC's now redundant header
> right
> away, along the lines of what you do in patch 1? This is also why I
> refrained from offering A-b on patch 5.
Missed that. I'll send a new patch series with dropped PPC's redundant
header.

Thanks.

~ Oleksii

