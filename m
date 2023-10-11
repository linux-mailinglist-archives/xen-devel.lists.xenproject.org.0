Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBCE7C56E5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 16:32:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615529.956821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqaFN-0008KC-Cf; Wed, 11 Oct 2023 14:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615529.956821; Wed, 11 Oct 2023 14:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqaFN-0008Gy-9a; Wed, 11 Oct 2023 14:31:37 +0000
Received: by outflank-mailman (input) for mailman id 615529;
 Wed, 11 Oct 2023 14:31:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LxTT=FZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qqaFM-0008Gs-2p
 for xen-devel@lists.xenproject.org; Wed, 11 Oct 2023 14:31:36 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0e0ea12-6842-11ee-98d4-6d05b1d4d9a1;
 Wed, 11 Oct 2023 16:31:34 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c3ca6ff5a7so59162961fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Oct 2023 07:31:34 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a05651c015000b002c129687a0dsm2987067ljd.24.2023.10.11.07.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:31:33 -0700 (PDT)
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
X-Inumbo-ID: e0e0ea12-6842-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697034694; x=1697639494; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Uy+cQGevffhSCu1fHZjFWwnYU61VIhdWG/60Aet6oMA=;
        b=GDNyLWEPNvz1aJFUUjBfin925h3a1eV81vuhPcFtqqsTEmPXAQeYeFQXtoU63HycFO
         Dgp7eNIiPFqrKjl/qjTuueevZ4tfxdRRfEl9HhFr0sRIIfqlP5eZrDGfbATNGhnEvh7d
         Mu9KSbThFBcw1McHNLWiHwsuDMVB9r4dTIBITJ5grGWhtfbRBbHk7qMEesH9y4eS1mN7
         uFZEH17zIgoQfiVOUspQ1vIg/2jaldKnxnQCgJ/ldQRb0uxdc49NBjKQHva4HIuwQndu
         RJltJCAaR4+Dti225ylH+XUQexfx34GIrGdCopaWYPwN0G85YFlFP81Q73/36isjVcce
         0yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697034694; x=1697639494;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uy+cQGevffhSCu1fHZjFWwnYU61VIhdWG/60Aet6oMA=;
        b=Obp62yH69E6yX9zD05bdXnOzyDh+dJpUwno5WwGcCoghBiuZJm34PTt50e5QeqYArR
         dRfCHjlNVKJxqkE6+5LwfwQACwh2zQKMnIOqBnla3bgVy5nWE6oxHiWNR36GqCibG6p+
         w6R01PKlYi6MvXHkdo7bpCG7rtBbqERjT0CZCR5CtKumVrhPxVb7fYpe9xNrp5utp5Ep
         92c3aRnNKALW8t4ORdsIzNAqQs0Z9kYLOUZYM/l/8DDWEkzdQ4DlOUxujQPx3W66dHfU
         RhsUSfRrN2T012gWzlWr58mV4Tg5tbomdIX82R9/8OHhP3AwlaKvjgoghed/L4WROO5R
         E2Rg==
X-Gm-Message-State: AOJu0YxkzLL2tWiziF2IpoP+BtWcyTSs/IEaTWLzElxYLNh5wJnFTKA6
	/dHt4/5XM2NuuKWYbnuXZAw=
X-Google-Smtp-Source: AGHT+IEvAHKd2KB5e4BMk9CReso47upR5We5yviZEr+la92H21ZeP52nWJ6flFi2FP2OHmi68AlDGw==
X-Received: by 2002:a2e:985a:0:b0:2bc:dcc2:b186 with SMTP id e26-20020a2e985a000000b002bcdcc2b186mr17361878ljj.36.1697034693680;
        Wed, 11 Oct 2023 07:31:33 -0700 (PDT)
Message-ID: <678f854879fdebe458dfed4fc3d587a34d159927.camel@gmail.com>
Subject: Re: [PATCH for-4.18 v5] xen/pdx: Make CONFIG_PDX_COMPRESSION a
 common Kconfig option
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Julien Grall
 <jgrall@amazon.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>,  Shawn Anastasio
 <sanastasio@raptorengineering.com>, Henry Wang <Henry.Wang@arm.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien
 Grall <julien@xen.org>
Date: Wed, 11 Oct 2023 17:31:32 +0300
In-Reply-To: <a2ed825d-2bdf-46a5-a1d4-b43a84ad43a5@citrix.com>
References: <20231006144405.1078260-1-andrew.cooper3@citrix.com>
	 <45df1c3a44fcd4ebf87a30ada34141d6ebd9ccab.camel@gmail.com>
	 <a2ed825d-2bdf-46a5-a1d4-b43a84ad43a5@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-10-10 at 16:52 +0800, Andrew Cooper wrote:
> On 10/10/2023 3:58 pm, Oleksii wrote:
> > > Oleksii: I've not touched RISCV yet, because I don't know how the
> > > platforms
> > > typically look.=C2=A0 I'm happy to default it active in RISCV too if
> > > that's the
> > > right thing to do.
> > We are still waiting for a platform with hypervisor extension
> > support
> > but I am using PDX in my Xen's repo.
>=20
> Yes, but are you using that because Xen wouldn't build without it, or
> because it's necessary for RISC-V platforms?
You are right I am using it because before this patch Xen can't be
built without PDX.
This is not necessary for RISC-V. At least platform I know they don't
use sparse RAM banks.

>=20
> This patch fixes the problem where PDX had the illusion of being
> necessary, but was actually mandatory.
>=20
> ~Andrew

~ Oleksii

