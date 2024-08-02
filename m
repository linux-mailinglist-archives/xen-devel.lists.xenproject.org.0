Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F49945A9F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770773.1181360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoNH-0007BN-J4; Fri, 02 Aug 2024 09:14:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770773.1181360; Fri, 02 Aug 2024 09:14:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZoNH-00078D-Ff; Fri, 02 Aug 2024 09:14:59 +0000
Received: by outflank-mailman (input) for mailman id 770773;
 Fri, 02 Aug 2024 09:14:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=14L3=PB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sZoNG-000787-5a
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:14:58 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afd51aa6-50af-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 11:14:57 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2f0dfdc9e16so98541781fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 02:14:57 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e1864f6sm1134361fa.22.2024.08.02.02.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 02:14:55 -0700 (PDT)
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
X-Inumbo-ID: afd51aa6-50af-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722590097; x=1723194897; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ljm33iZj4asxQNhsPJUQpanGdqbvXy3PgAV3WUbFnbs=;
        b=JX8w3YHKjE2kZ6XGBk8uJ5gQaPsZZtbblvwI5/hxCnc3lcDK7TpYFP6/TELImtCRtL
         3g2n9KmXHD5imFsJEjqKm26CEWTY+b720R7jGBzVbDcA3iC0o0W9iOcnJgYdTfuzszr/
         kO3SO4FrbjOiOzPz8Xops+sMxGgrQF4E1tIzdUzQqzU1/b6DT8RbTLNktwQ8z5qbd35C
         ait0m8zeokxDjcQMhmIiHZyG/NUY8dbvjb/dWQRqJHUWMBsw73F8tpvIxvnaPj032IKq
         WjUcQ1sCc5GP28SCnAj+iOPY2PCWfPCFP0FTfm43OXF+LnX9ml4UoFAZxnhlGytCd89L
         bILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722590097; x=1723194897;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ljm33iZj4asxQNhsPJUQpanGdqbvXy3PgAV3WUbFnbs=;
        b=PDz19rwfD/Ka59CPeTEKNDNK/9TDH3N4dbxpgBceJPySE2vuF9wcBIkJRBGsgBOoO/
         X702ahRjkMvP7o4XA+7bXF+zyWIz3sccaWeLcaUGbhDKI/H+KOf/p5dJjP1Or1JP6Xd5
         WOfd9Z0fBmpBUugvkeq6FasPJracr2VHd8p8sPlfPqW5KTLz/SOedUsFG9ofQP01usgU
         7P4Yew1gvrLXWNtYo6SqJI/4kutfBA+QQ93NryRVSAL+xNzPP4XVjUDfz19x1zJiXmxE
         +w3TogbiA3QoTTKSRSTCa340y5PmYC2mpc8coT44sdvCyuRYJoM6n1GBBopgPS4ZgAJg
         EEhw==
X-Gm-Message-State: AOJu0Yz+BiKXsMk/BEs6kjl+R2w83BwP2dB7+U53CxxOsnV/OVfm6wtz
	4YvrgRHCwS54WhzHnDfPz6dNhO7pzlJ7P0KWPGZe8ytapwK+MEGnHzoX/Q==
X-Google-Smtp-Source: AGHT+IEOxvYvWD+gYATIl4GqGo7DDl0z+FWLWmN2qe96vi8NBYj8ci6JqEDTg00NUu8vDg13kDIISQ==
X-Received: by 2002:a05:651c:148:b0:2ef:20ae:d113 with SMTP id 38308e7fff4ca-2f15ab1a88fmr19698661fa.40.1722590096165;
        Fri, 02 Aug 2024 02:14:56 -0700 (PDT)
Message-ID: <6c379c6a0ac3e046c67647fa63d085a341906224.camel@gmail.com>
Subject: Re: [PATCH v11 4/5] xen/riscv: enable GENERIC_BUG_FRAME
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Date: Fri, 02 Aug 2024 11:14:55 +0200
In-Reply-To: <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
References: <cover.1721731887.git.oleksii.kurochko@gmail.com>
	 <b79bcfb9031564fc8d275af66fa94c1e82e54de2.1721731887.git.oleksii.kurochko@gmail.com>
	 <7c03ed78-7c80-45bf-acf3-a916b7abb7d5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 15:00 +0200, Jan Beulich wrote:
> > To have working BUG(), WARN(), ASSERT, run_in_exception_handler()
> > it is needed to enable GENERIC_BUG_FRAME.
> >=20
> > ebreak is used as BUG_insn so when macros from <xen/bug.h> are
> > used, an exception with BREAKPOINT cause will be generated.
> >=20
> > ebreak triggers a debug trap, which starts in debug mode and is
> > then filtered by every mode. A debugger will first handle the
> > debug trap and check if ebreak was set by it or not. If not,
> > CAUSE_BREAKPOINT will be generated for the mode where the ebreak
> > instruction was executed.
>=20
> Here and in the similar code comment you talk about an external
> debugger, requiring debug mode, which is an optional feature. In
> my earlier comments what I was referring to was pure software
> debugging. I continue to fail to see how properly distinguishing
> ebreak uses for breakpoints from ebreak uses for e.g. BUG() and
> WARN() is going to be feasible.
GDB keeps track of what addresses it has breakpoints at.

And if QEMU is being used, GDB isn't actually inserting ebreak
instructions because QEMU has an infinite amount of "hardware"
breakpoints.

If it answers your original question I could add this to commit
message/code in the next patch version.

~ Oleksii

