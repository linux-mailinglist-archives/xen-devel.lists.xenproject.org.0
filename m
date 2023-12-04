Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A649802F2A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646707.1009265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5YG-00007e-5G; Mon, 04 Dec 2023 09:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646707.1009265; Mon, 04 Dec 2023 09:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5YG-00005F-1l; Mon, 04 Dec 2023 09:47:44 +0000
Received: by outflank-mailman (input) for mailman id 646707;
 Mon, 04 Dec 2023 09:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZlsO=HP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rA5YE-00004s-I8
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:47:42 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a33a309-928a-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 10:47:40 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9f751663bso15154551fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 01:47:40 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a2e3608000000b002c9fe11efe4sm416405lja.28.2023.12.04.01.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:47:39 -0800 (PST)
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
X-Inumbo-ID: 2a33a309-928a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701683260; x=1702288060; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vfCxh42SAIcexuottZDoVAumfzPxOM0PeiylIayO29Q=;
        b=W3XEwFwwSRbjRLVj5jp+Ly6TccdvJWUl8Py5GNZOc45zFDGzf67IZBH5K7Z+r0eFkO
         /CbaLvDwGHft4TVuX34zX3p8qigN4VsO84Ka16Pj95a6JdRENfbNjWFFjCfdbgRDoUHJ
         PKwE+0ahmOL5bPGTPwmbKrlsrgZClL9x+XkV3vNezPftGOwY/y9X3xNs6lVWfJBeI7kI
         0coSmuKpOXFqXTlHI/m8i00wBaVVjo0FC+UxAT1I74vbiOz9vueGQ6CKzWJ4dkAgxHc6
         BJ7MwPrqFhdH1n2gsbXe71XHp/hnZXDQ77R/GSTa1fqSQGs/G7uBlu/qdGx4PV3eb/Kr
         VZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701683260; x=1702288060;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vfCxh42SAIcexuottZDoVAumfzPxOM0PeiylIayO29Q=;
        b=VSDVQLSFSJyyRmkL2IjsfiNkAiT/faMlADiGfSxW8LQwe68ZQsKMJYxJt+lG4Hybdm
         mjEQKoenq1YkDCq1J4dKGqdMKSMG02heU7RtEmvG/tL5cSi4kbWYRFzE/3V7xLWAXSF3
         8CtKH6sFpg8QR0YEIyLDm2OmxbiWTufN6iu0Jrnm931hZlJApP1R0rAmuzjs2v4nZcTr
         9rehd7OvT4fGKt1+ct3mL5ibjvtUV6QqbFjvUp6Wt+rybC7M+m28UXM/Z2ylXTlL/46Z
         8NRf6+ZBmn90rtLS9hXtBnlrkIsl9Bey//K66oaB7yXTbeb55yJxsNrl3u3KIHATbS7l
         zDJQ==
X-Gm-Message-State: AOJu0YxUwNAuYMF7p9tk7xFa8alyMbA3cwW+0z7p6JzW9GqYE0dds//V
	ySbjk7XplQHKjlhztLadLMQ=
X-Google-Smtp-Source: AGHT+IF3gAv3lmESjEykrFt+Sy3AQ0iEpRMpbucl+o75HSOfaJ48do0SoQzitS7U5bqlaN7//4IGPA==
X-Received: by 2002:a2e:9b01:0:b0:2c9:ebe8:e648 with SMTP id u1-20020a2e9b01000000b002c9ebe8e648mr706299lji.130.1701683259957;
        Mon, 04 Dec 2023 01:47:39 -0800 (PST)
Message-ID: <8dfbea602fe5192cdc9342d2850350214bb5e9ef.camel@gmail.com>
Subject: Re: [PATCH 1/3] xen/ppc: Enable Boot Allocator
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Shawn Anastasio
	 <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>, Jan Beulich
 <jbeulich@suse.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Date: Mon, 04 Dec 2023 11:47:39 +0200
In-Reply-To: <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
	 <5ed3351f7824a5d0a1ff29c17cb55b2608f28109.1701384928.git.sanastasio@raptorengineering.com>
	 <938b9bfe-fba0-4c77-b2e5-fb79fb316ab4@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

Hi Julien and Shawn,

On Fri, 2023-12-01 at 20:56 +0000, Julien Grall wrote:
> (+ Arm and RISC-V folks)
>=20
> Hi Shawn,
>=20
> On 01/12/2023 20:59, Shawn Anastasio wrote:
> > Adapt arm's earlyfdt parsing code to ppc64 and enable Xen's early
> > boot
> > allocator. Routines for parsing arm-specific devicetree nodes (e.g.
> > multiboot) were excluded, reducing the overall footprint of code
> > that
> > was copied.
>=20
> I expect RISC-V to want similar code. I am not really thrilled in the
> idea of having 3 similar copy of the parsing. So can we extract the=20
> common bits (or harmonize it) so it can be shared?
>=20
> Maybe Oleksii has already a version doing that.
On RISC-V side I introduced the common bootfdt but probably it should
be aligned with the latest version ( my plan was to do that before
sending a patch to upstream ) of ARM's bootfdt.c.

https://gitlab.com/xen-project/people/olkur/xen/-/commit/ad2c8766a7d0886df8=
4f6c60823275816c2115f5

I can re-work it this week and send it to the ML but I'll be happy if
Shawn can do it or his version as common so I'll be able to reuse it
soon.

~ Oleksii

