Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB90818864
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 14:12:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656786.1025228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZt9-0001Z5-SG; Tue, 19 Dec 2023 13:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656786.1025228; Tue, 19 Dec 2023 13:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFZt9-0001Wm-Pe; Tue, 19 Dec 2023 13:11:59 +0000
Received: by outflank-mailman (input) for mailman id 656786;
 Tue, 19 Dec 2023 13:11:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CCte=H6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rFZt8-0001WR-4e
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 13:11:58 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e676a42-9e70-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 14:11:54 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40c31f18274so57318895e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 05:11:54 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 sn24-20020a170906629800b00a2310f34d0asm6577542ejc.196.2023.12.19.05.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 05:11:53 -0800 (PST)
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
X-Inumbo-ID: 2e676a42-9e70-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702991514; x=1703596314; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=227KkKLBKUhS2GPLm/NtVtU/wkkIdDICY68h27QE3So=;
        b=bf5xLDujI600Dd+HhkkImiaLNFpe2cSjeyWOV5jp7nxla5yo8Wzk/PlyaeFVTYiRvr
         fwGttc8+/YD7jMjz+a0zQJV1c4z5YAa0L3quumpQ2AVJboheEwVFuXv8S4sUUV5fZDZq
         WZLu42AUyyVZ5FJyf9rZkBVYXzNzT+41BTp9iWSX1MZnhhEK1La56CZ7pUZG/RUXkugD
         Ezhgp/lsovw477tI1RL8C1BlwOTqERac5sKhF8GYlP5yIPpfVtPXEuLItn2TAVnWNyKv
         YvWtQoyojGnbfi2F8bDh2JbzJALQtRb3rjoW8eCHY5KJT6qnTUIwD1dunIM/gRQsu+e8
         Qtng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702991514; x=1703596314;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=227KkKLBKUhS2GPLm/NtVtU/wkkIdDICY68h27QE3So=;
        b=uOQyLPNHh0F2BQfvmxdGf7NthD7VTI3Rf1R0TPPpVFQ0KxjJfRq4i1+JYACXUD76OI
         C6H+u6blJpNHkgSy7Tp/nxHncz6xKBNFsAfNDh0B9qF6rqeC8ctMXeSeYuXAB0Lkz6yN
         Q+fXGlYC5avj2A1XajPWqb48xwmLz9eKp63CVvZG9D2N7pwZX4+Uyq6+mTtZoX3AFkhX
         LdKRkVS1HdjkkXUNvXIbLIPG5lxSTieEVe0HgPrhA+BteBsryenyfL33rj60wl50GRYF
         Z1KvJL1uuF3jc0l7tXqLXyX2MGcT0RswNlQa9NM77OzizBhSR8cB+OLGXoj/Q2oarkNq
         oiEg==
X-Gm-Message-State: AOJu0Yz0Jxm4EKzUqN6WcfOyzxTcSwBxATZ92Aq9pYIvq8lmgWxw4ziD
	qTH2oCfcBGg7NW4h4zkD778=
X-Google-Smtp-Source: AGHT+IEWMN8AvKLceqU+lF0BQpp+UX3qE/kW8zUvI6xAp6iXeO3rccYTEtaJUu+Nv/DWVYIRSsDD/w==
X-Received: by 2002:a05:600c:4981:b0:40c:1dd1:295c with SMTP id h1-20020a05600c498100b0040c1dd1295cmr8755713wmp.199.1702991514154;
        Tue, 19 Dec 2023 05:11:54 -0800 (PST)
Message-ID: <a9a0ab135147fb55b124db3b00f714df2758fbca.camel@gmail.com>
Subject: Re: [RFC PATCH v1 1/1] xen/Makefile: introduce ARCH_FIXED_CONFIG
 for randconfig
From: Oleksii <oleksii.kurochko@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>,  Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 19 Dec 2023 15:11:52 +0200
In-Reply-To: <alpine.DEB.2.22.394.2312181753160.3175268@ubuntu-linux-20-04-desktop>
References: <cover.1701966261.git.oleksii.kurochko@gmail.com>
	 <c95959adca794a90465abd10f579dc9159a7697f.1701966261.git.oleksii.kurochko@gmail.com>
	 <f9ceb8f7-a664-452b-8b38-f74b36386e33@citrix.com>
	 <7ec81395-298d-4d50-89af-d54f756ef657@suse.com>
	 <95d3e8e9-66d3-4097-b2ed-c808369a08ac@citrix.com>
	 <d56aa264-41f2-4cff-97dd-1a222750a389@suse.com>
	 <alpine.DEB.2.22.394.2312181753160.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-18 at 18:03 -0800, Stefano Stabellini wrote:
> On Mon, 18 Dec 2023, Jan Beulich wrote:
> > On 18.12.2023 17:07, Andrew Cooper wrote:
> > > On 11/12/2023 3:56 pm, Jan Beulich wrote:
> > > > On 07.12.2023 21:17, Andrew Cooper wrote:
> > > > > On 07/12/2023 5:03 pm, Oleksii Kurochko wrote:
> > > > > > ARCH_FIXED_CONFIG is required in the case of randconfig
> > > > > > and CI for configs that aren't ready or are not
> > > > > > supposed to be implemented for specific architecture.
> > > > > > These configs should always be disabled to prevent
> > > > > > randconfig
> > > > > > related tests from failing.
> > > > > >=20
> > > > > > Signed-off-by: Oleksii Kurochko
> > > > > > <oleksii.kurochko@gmail.com>
> > > > > > ---
> > > > > > =C2=A0xen/Makefile | 5 ++++-
> > > > > > =C2=A01 file changed, 4 insertions(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/xen/Makefile b/xen/Makefile
> > > > > > index ca571103c8..8ae8fe1480 100644
> > > > > > --- a/xen/Makefile
> > > > > > +++ b/xen/Makefile
> > > > > > @@ -336,11 +336,14 @@ ifeq ($(config-build),y)
> > > > > > =C2=A0# *config targets only - make sure prerequisites are
> > > > > > updated, and descend
> > > > > > =C2=A0# in tools/kconfig to make the *config target
> > > > > > =C2=A0
> > > > > > +ARCH_FORCED_CONFIG :=3D
> > > > > > $(srctree)/arch/$(SRCARCH)/configs/randomforced.config
> > > > > > +
> > > > > > =C2=A0# Create a file for KCONFIG_ALLCONFIG which depends on th=
e
> > > > > > environment.
> > > > > > =C2=A0# This will be use by kconfig targets
> > > > > > allyesconfig/allmodconfig/allnoconfig/randconfig
> > > > > > =C2=A0filechk_kconfig_allconfig =3D \
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 $(if $(findstring n,$(XEN_HAS_CHECKPOL=
ICY)), echo
> > > > > > 'CONFIG_XSM_FLASK_POLICY=3Dn';) \
> > > > > > -=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_AL=
LCONFIG);)
> > > > > > \
> > > > > > +=C2=A0=C2=A0=C2=A0 $(if $(KCONFIG_ALLCONFIG), cat $(KCONFIG_AL=
LCONFIG); \
> > > > > > +=C2=A0=C2=A0=C2=A0 $(if $(wildcard $(ARCH_FORCED_CONFIG)), cat
> > > > > > $(ARCH_FORCED_CONFIG);) ) \
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 :
> > > > > > =C2=A0
> > > > > > =C2=A0.allconfig.tmp: FORCE
> > > > > We already have infrastructure for this.=C2=A0 What's wrong with
> > > > > EXTRA_FIXED_RANDCONFIG?
> > > > What I don't understand here is why dealing with the issue
> > > > would want
> > > > limiting to gitlab-CI. Anyone could run randconfig on their
> > > > own, and
> > > > imo it would be helpful if the same issue(s) could be prevented
> > > > there,
> > > > too. Hence my earlier suggestion to have a snippet which can be
> > > > used
> > > > by "interested" parties. And once dealt with in e.g. the
> > > > makefile
> > > > there should not be a need for any overrides in the CI config
> > > > anymore.
> > >=20
> > > This is trying to find a solution to a problem which doesn't
> > > exist.
> > >=20
> > > RISC-V and PPC are experimental in Xen.=C2=A0 Noone else is going to
> > > come and
> > > randconfig them until they're rather more production ready, and a
> > > prerequisite of that is removing this list of exclusions.
> > >=20
> > > Until you can actually find an interested party to comment, I
> > > think this
> > > is just churn for no useful improvement.=C2=A0 If nothing else,
> > > calling it
> > > randomforced.config isn't appropriate given the explanation of
> > > what this
> > > target is used for...
> >=20
> > "random" in the name can't possibly be right anyway. Such
> > collection of
> > fixed settings would also be relevant to e.g. all{yes,no}config.
> > Yet
> > that's still not the same as any kind of "default" config, which
> > the
> > two architectures presently kind of abuse for the purpose of
> > defining
> > required-fixed settings.
>=20
> One thing for sure, I don't think it would be a good idea to add
> extra
> temporary Kconfig changes like these:
>=20
> [1]
> https://lore.kernel.org/xen-devel/cdc20255540a66ba0b6946ac6d48c11029cd338=
5.1701453087.git.oleksii.kurochko@gmail.com/
> [2]
> https://lore.kernel.org/xen-devel/d42a34866edc70a12736b5c6976aa1b44b4ebd8=
a.1701453087.git.oleksii.kurochko@gmail.com/
>=20
>=20
> I agree with Andrew that RISC-V and PPC are experimental so whatever
> works to enable them to make progress on this issue with a small
> effort
> is sufficient. I would be happy with a quick respin of this series
> following the gitlab-ci approach. This is good enough.
>=20
> And I think that having some sort of fixed seed (seed.config?) for
> randconfig would also be fine and potentially more reusable.
>=20
> But I think Oleksii should go forward with whatever approach he
> prefers
> and he is more comfortable with, as long as it is not [1] and [2].
Despite the fact that I am still comfortable with both approaches,
let's stick to the approach that requires minimal effort. For the time
being, let's update patch series [1] with the GitLab CI approach and
revert to the current patch if there are more cases where these changes
are required. Thank you, everyone, for your feedback.

[1]
https://lore.kernel.org/xen-devel/cover.1701453087.git.oleksii.kurochko@gma=
il.com/


