Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA45280D41A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 18:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652451.1018302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkE3-0003BV-L2; Mon, 11 Dec 2023 17:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652451.1018302; Mon, 11 Dec 2023 17:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCkE3-00039m-IU; Mon, 11 Dec 2023 17:37:51 +0000
Received: by outflank-mailman (input) for mailman id 652451;
 Mon, 11 Dec 2023 17:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+fN=HW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rCkE2-00039g-Ja
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 17:37:50 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00dd0951-984c-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 18:37:49 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50be9e6427dso4942886e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 09:37:49 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a056512312200b0050bfbde3901sm1126283lfd.297.2023.12.11.09.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 09:37:48 -0800 (PST)
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
X-Inumbo-ID: 00dd0951-984c-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702316269; x=1702921069; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+sz2R3yOl3TaIEV06hoIjBNk2KjwKvO1/ewjxP2rZ0s=;
        b=Z+yA5HjJeJFVqm8/YJVPyx6Ur4UYE5H7+tmFkLQfjtJqewNDxx55aRWWQIt8TK6TlV
         Z4vvAUOaEeJDwyVhZJQot6RauhThyap05o/dlc3r/WI255FoNXiZwXacQ8n64KWVzbsT
         jEaXT2PnCW/SlI4918q9ReCEjdTknwzN8ctyDWdn/RQ3IUwlzMZmc3mwHZreOBc4pIqR
         1oI0LYNXpQjjZAnLwFW9Kg/Cb7WPKRYcPcdIkypzWXc2w/3mL8qPa3Sk4hrCVc7DnKVP
         wm8Vkr6RdGWDQjx7N/WUFq7rbrTpdTkBXK++ck9fJvjCiKu3ELIifVuJyDTh6CPE4rl3
         +OAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702316269; x=1702921069;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sz2R3yOl3TaIEV06hoIjBNk2KjwKvO1/ewjxP2rZ0s=;
        b=ryQ/tUgEKwA+TFx/OtxXPqPukffkTPlbfv625BXYaU1kuAAfYyhRo+SdS2JsItoNJk
         wMPv5wpSDA95tHwSEdAlyWIherTAOY9Bzganiq4kMEnO9O+pFmbpjox+jyv9MeHT59Zn
         67bOt1IAe2sv3przfkCVjYJ7DiOMrcyTbbYw/mV83UeoJ6W5Jce8ZszpRUhPOYUIYH16
         czlRPaninpo2halt3vyYozL9wA5WC53XrvJii/4+v7RcuT+0Jzq8N0gP/Q+X227eiNZx
         E0z076FR1o4K3QSNh8g10sm5JCMXJwZIruZIrmcgRwx+/qB0DC16Ty6ALnM9GHae3EH+
         PNdg==
X-Gm-Message-State: AOJu0Yx6w1HRMDEcEFNbLAr/ezTaiVbWsU3NYr4GPoPj0s3PKzeNamuJ
	KWUz1vET/kTqqkCUxmmboCs=
X-Google-Smtp-Source: AGHT+IFOizhsi1uPpJG1vD+yZ1j1sJJHG/QhXg1+CT5a+nQCJeu6UzOD7P97kB865KdgGccLA5jwOA==
X-Received: by 2002:a05:6512:2385:b0:50d:1a7e:ac7d with SMTP id c5-20020a056512238500b0050d1a7eac7dmr2495961lfv.38.1702316268736;
        Mon, 11 Dec 2023 09:37:48 -0800 (PST)
Message-ID: <bad7c686af22aef9124891f5610976687452e784.camel@gmail.com>
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Mon, 11 Dec 2023 19:37:47 +0200
In-Reply-To: <ed29735f-2d2e-4b29-b5d1-efa78480acd6@suse.com>
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
	 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
	 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
	 <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
	 <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
	 <5af2573e588f76b8df3423fd13a1b4275cc18f33.camel@gmail.com>
	 <abb8c26b-4c8c-4fcf-a8c8-4a15a5067fa0@suse.com>
	 <a53707edfac7d8d959cfc858953a1d64c3149596.camel@gmail.com>
	 <ed29735f-2d2e-4b29-b5d1-efa78480acd6@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-12-11 at 17:02 +0100, Jan Beulich wrote:
> On 11.12.2023 15:43, Oleksii wrote:
> > On Mon, 2023-12-04 at 11:39 +0100, Jan Beulich wrote:
> > > On 04.12.2023 11:34, Oleksii wrote:
> > > > If you ( or anyone else ) don't mind, I'll update the patch
> > > > with an
> > > > introduction of HAS_GRANT_TABLE.
> > >=20
> > > I won't NAK such a patch, but unless convincing arguments appear
> > > I
> > > also
> > > won't ACK it.
> > I am going to disable GRANT_TABLE config for RISC-V ( and PPC? ) by
> > providing a separate YAML file ( riscv-fixed-randconfig.yaml ) with
> > the
> > following content:
> > .riscv-fixed-randconfig:
> > =C2=A0 variables:
> > =C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_COVERAGE=3Dn
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_GRANT_TABLE=3Dn
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_MEM_ACCESS=3Dn # this I'll add in=
 the next patch where
> > asm-
> > geneic for mem_access.h is introduced
> >=20
> > And then for riscv*randconfig jobs do the following:
> > archlinux-current-gcc-riscv64-randconfig:
> > =C2=A0 extends:
> > =C2=A0=C2=A0=C2=A0 - .gcc-riscv64-cross-build
> > =C2=A0 variables:
> > =C2=A0=C2=A0=C2=A0 CONTAINER: archlinux:current-riscv64
> > =C2=A0=C2=A0=C2=A0 KBUILD_DEFCONFIG: tiny64_defconfig
> > =C2=A0=C2=A0=C2=A0 RANDCONFIG: y
> > =C2=A0=C2=A0=C2=A0 EXTRA_FIXED_RANDCONFIG: !reference [.riscv-fixed-ran=
dconfig,
> > variables, EXTRA_FIXED_RANDCONFIG]
> >=20
> > For RISC-V, I prefer having a separate file for all the
> > EXTRA_FIXED_RANDCONFIG because in another patch series [1], I'll
> > introduce a large number of disabled configs for randconfig.
> >=20
> > For PPC, I don't think it's necessary to introduce a separate YAML
> > file
> > for EXTRA_FIXED_RANDCONFIG. For the time being, it is only
> > necessary to
> > disable two configs: CONFIG_GRANT_TABLE and CONFIG_MEM_ACCESS (in
> > the
> > next patch of this series).
>=20
> Why would this be different for PPC and RISC-V?
I haven't investigated that. Perhaps Shawn covered more stubs for a larger =
numberof configs, so he didn't encounter issues with some configs.
For example, during my tests with the inclusion of riscv-fixed-
randconfig.yaml,
randconfig jobs for RISC-V failed several times on perf.c.
At least, during the inclusion of #include <asm/perfc.h>, which is not
provided
for RISC-V, so CONFIG_PERFC_COUNTER is disabled for RISC-V.

However, Shawn either provided necessary stubs for
CONFIG_PERF_COUNTERS,
or it is just luck that such an issue didn't occur for PPC."

>=20
> > If this solution is acceptable to you, can I retain your
> > 'Suggested-
> > by'?"
>=20
> No, please don't. I've replied to Andrew on the other thread - I
> don't
> see why helping just gitlab-CI is desirable. I'm actually surprised
Well, now I understand your point better, and it makes sense. I was
more confident in the GitLab-CI solution before you replied on the
other thread.

However, it seems to me that randconfig exists only for testing
purposes and usually doesn't require running locally. Therefore, it
makes sense to perform all these tasks only for GitLab-CI to avoid
complicating things around the Makefile in case anything related to
KCONFIG_ALLCONFIG needs to be in sync with Linux.

In any case, I believe it's a good idea to wait for Andrew's feedback.

> Linux have no solution ready for use, as the underlying problem of
> not
> all settings necessarily being valid to use ought to affect them as
> well. Then again perhaps this really only is a transient issue during
> arch bringup ...
"It is challenging for me, at least, to predict whether all options
mentioned in EXTRA_FIXED_RANDCONFIG will be disabled in the future.
Most of them will likely be implemented, but certainty is difficult to
ascertain."

> =C2=A0In which case the approach taken here may be fine, but
> it still wouldn't be what I suggested. It may then be Stefano or
> Andrew
> who you could consider for such a tag.
I'm a bit confused again. In this case, it seems that both you andStefano o=
r Andrew should be on the suggested list.
You proposed the approach with "#ifdef CONFIG_GRANT_TABLE #include
<asm/grant_table.h> #endif".
Stefano and Andrew suggested how to disable CONFIG_GRANT_TABLE for the
config.

Could you please clarify where my understanding is incorrect?

~ Oleksii

