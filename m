Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6461C809ECD
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650451.1015993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWpW-00061l-2a; Fri, 08 Dec 2023 09:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650451.1015993; Fri, 08 Dec 2023 09:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBWpV-0005zE-WD; Fri, 08 Dec 2023 09:07:30 +0000
Received: by outflank-mailman (input) for mailman id 650451;
 Fri, 08 Dec 2023 09:07:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBWpU-0005z4-6f
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:07:28 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35214780-95a9-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 10:07:27 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-54d0ae6cf20so2749286a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:07:27 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 ub14-20020a170907c80e00b00a1da5d9a602sm741764ejc.138.2023.12.08.01.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:07:26 -0800 (PST)
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
X-Inumbo-ID: 35214780-95a9-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702026446; x=1702631246; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aAomrijJiYuVri6r3XHjjZD4iDTaA/LRqa6d89jOE9M=;
        b=VOa96bWH6KBUzsAv0+beBSRYbYMHIMNyl6KwAshUkJlnHecO44FTNZXGxSDa63IkvV
         uZ9XYyVJEjRaeG79JU/N0g8U+oTkCs5K0VClFFOp98OQ4FISPOWMYv998eE/NYYFzmE2
         +B9MvsJLqKZ4MZeCGHcsHO7jnE//kVOBjBdClOsvDMNnSeuPilK05Fyo2Iwd2hqYulXm
         ooH24SgyDc/TVi7OYjNdVVU1Ttu0dr/AN5nEZQZbhxonghe32/2hYZ3ZFslhnHFMvIGE
         rgM6pc9VPovwvYWmwZANilkOTdywWpk2vRGY3RLbNTqsecuEZcKJauuyZGuQkHW4EkSj
         Hl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702026446; x=1702631246;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aAomrijJiYuVri6r3XHjjZD4iDTaA/LRqa6d89jOE9M=;
        b=Wz7JdPxOfI9Gtf7voo/Xa5FndKd53v2KnAQEOCSWJMnkPnfL9BB6Xr3y+MNHpiL413
         jhe7syafCLZSrVCJOrCNiUPrJ2nE2Dgrq655XrytymDh50v5lUWY1lpkF0m7e1EKcZuG
         YB/OihknoXZFV1PGULIQv0jBcIplVsQvJR89FiJ5w+vlzvxXAFKMPZhzv1RQXFJkDhQS
         rsXkXona3KEyvqMIX6LLVUkVQZQByuvdJWF1zqX44FbedZBDwlqnUma9Ixzs9vOP0uPw
         OwGWuSgPb7o+bgmBZGrxtBqqTF5UOVpKf+KcTrCgG68n1FgaC2b7RYDYYbfM82gOjgfN
         n3Cw==
X-Gm-Message-State: AOJu0YzPl7+0Hq/YhGTzdxS2O5kgVcHooBDgUrfWF73xy6EOQBxfo45q
	AfewGWZnDVw+OwjC5jekU/w=
X-Google-Smtp-Source: AGHT+IF6I9L19ExUsWlMK22PYmsM0ehUWGmSDYAbjQQfuM6aCxwKKVLJTeiH2evV0dJhOpJPkkoW0w==
X-Received: by 2002:a17:906:1091:b0:a1f:612a:d3b5 with SMTP id u17-20020a170906109100b00a1f612ad3b5mr501085eju.141.1702026446271;
        Fri, 08 Dec 2023 01:07:26 -0800 (PST)
Message-ID: <94dd1111d140b8554d58440e8445f645b3c4097a.camel@gmail.com>
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG
 for randconfig
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,  George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,  Wei Liu
 <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
Date: Fri, 08 Dec 2023 11:07:25 +0200
In-Reply-To: <alpine.DEB.2.22.394.2312071659210.1265976@ubuntu-linux-20-04-desktop>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>
	  <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
	  <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
	 <6e435d2b4772e75544e9201bcfbe00e5cf5eab6e.camel@gmail.com>
	 <alpine.DEB.2.22.394.2312071659210.1265976@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 17:01 -0800, Stefano Stabellini wrote:
> On Thu, 7 Dec 2023, Oleksii wrote:
> > On Thu, 2023-12-07 at 20:17 +0000, Andrew Cooper wrote:
> > > On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
> > > > ARCH_FIXED_CONFIG is required in the case of randconfig
> > > > and CI for configs that aren't ready or are not
> > > > supposed to be implemented for specific architecture.
> > > > These configs should always be disabled to prevent randconfig
> > > > related tests from failing.
> > > >=20
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > =C2=A0xen/Makefile | 5 ++++-
> > > > =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/xen/Makefile b/xen/Makefile
> > > > index ca571103c8..8ae8fe1480 100644
> > > > --- a/xen/Makefile
> > > > +++ b/xen/Makefile
> > > > @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
> > > > =C2=A0# *config targets only - make sure prerequisites are updated,
> > > > and
> > > > descend
> > > > =C2=A0# in tools/kconfig to make the *config target
> > > > =C2=A0
> > > > +ARCH_FORCED_CONFIG :=3D
> > > > $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
> > > > +
> > > > =C2=A0# Create a file for KCONFIG_ALLCONFIG which depends on the
> > > > environment.
> > > > =C2=A0# This will be use by kconfig targets
> > > > allyesconfig/allmodconfig/allnoconfig/randconfig
> > > > =C2=A0filechk_kconfig_allconfig =3D \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 $(if $(findstring n,$(XEN_HAS_CHECKPOLICY)=
), echo
> > > > 'CONFIG_XSM_FLASK_POLICY=3Dn';) \
> > > > -=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCON=
FIG);) \
> > > > +=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_ALLCON=
FIG); \
> > > > +=C2=A0=C2=A0=C2=A0 $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat
> > > > $(ARCH_FORCED_CONFIG);) ) \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 :
> > > > =C2=A0
> > > > =C2=A0.allconfig.tmp: FORCE
> > >=20
> > > We already have infrastructure for this.=C2=A0 What's wrong with
> > > EXTRA_FIXED_RANDCONFIG?
> > Everything is fine; I don't know why there was only an issue with
> > CONFIG_GRANT_TABLE on PPC. On the RISC-V side, there were more
> > configs
> > issues, prompting me to include all the configurations not
> > implemented
> > for RISC-V in EXTRA_FIXED_RANDCONFIG. You can find the added
> > configurations in this commit:
> > https://lore.kernel.org/xen-devel/b4e85f8f58787b4d179022973ce25673d6b56=
e36.1700761381.git.oleksii.kurochko@gmail.com/#Z31automation:gitlab-ci:buil=
d.yaml
> >=20
> > One challenge is that the same configurations need to be added
> > multiple
> > times for each build test using randconfig.
>=20
> That's a lot of extra configs to add. Could you use a yaml anchor or
> a
> .something to include? So that you define the full list only once at
> the
> top of the file and then reuse it everywhere as needed.
I didn't know that it work. If there is such options, I think it can be
a solution.

Thanks. I'll try.

>=20
>=20
> > Another reason for this approach is a suggestion from Jan (probably
> > I
> > misunderstood it), who proposed using a template to instruct
> > randconfig
> > not to modify currently unnecessary configurations. You can find
> > the
> > suggestion and discussion here:
> > https://lore.kernel.org/xen-devel/008d0c66-6816-4d12-9e1f-1878e982f9fc@=
suse.com/
> >=20
> > Perhaps we could enhance the build script to fetch "fixed" configs
> > from
> > the architecture-specific fixed-defconfig instead of modifying the
> > Makefile directly.
>=20
> Sorry I missed the original thread somehow. Please use "automation"
> as
> subject line tag for automation patches.
Sure. I'll do next time.

~ Oleksii


