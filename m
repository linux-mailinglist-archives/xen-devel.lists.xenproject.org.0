Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF81B6A7FC3
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 11:15:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504827.777241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfxT-0004Yd-Dd; Thu, 02 Mar 2023 10:14:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504827.777241; Thu, 02 Mar 2023 10:14:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXfxT-0004W5-B0; Thu, 02 Mar 2023 10:14:43 +0000
Received: by outflank-mailman (input) for mailman id 504827;
 Thu, 02 Mar 2023 10:14:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5rfr=62=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pXfxS-0004Vz-7c
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 10:14:42 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0add365b-b8e3-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 11:14:39 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id h3so17010564lja.12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Mar 2023 02:14:39 -0800 (PST)
Received: from [192.168.8.114] (46.204.108.203.nat.umts.dynamic.t-mobile.pl.
 [46.204.108.203]) by smtp.gmail.com with ESMTPSA id
 bi36-20020a05651c232400b002934b5c5c67sm2039418ljb.32.2023.03.02.02.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 02:14:38 -0800 (PST)
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
X-Inumbo-ID: 0add365b-b8e3-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677752079;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T8PCUS/2Lgtyx8KlmTKKx3chAx6sf/xCNb4M3wTnjEQ=;
        b=b+OzqTRKB0Rg/sHV7lr4drv7LvOFyTUdnp6UsXiihyRddtDCxJBDfG0fsD7YpJ+AxL
         hHxVXSuh9k7q7Cas6gK7QkQU4JCVcIiXtuPnELMxwzHHSQO2Ch3D9rxTdVzbqvnZnZuq
         xmE97wUFr6nf4ZYclwrJQarq4yAX0zLmeXKNfEv6ln8a2ayrsmXDKpjccpFgp/yAGfJY
         yCTxmgJI1zs7AhYiHLvs0CkhETk4TspgXh9vJmUSCh8EuB+f6bHQ35dQARySAqdsLL47
         7QLhIxXys4DxE/fzAXYPFQqdrM2pbNWdmJ4M+W5cVRrI52txdd9ANlordxDO+SH1ls1n
         XoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677752079;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T8PCUS/2Lgtyx8KlmTKKx3chAx6sf/xCNb4M3wTnjEQ=;
        b=jzlABBjdVowomsnYG99MeF0i82OeS5FBqZeYdvjwUpYEkabeF/kJc7GSSyMVBFRa9h
         Oc6hVz7zd4SWlMlRbvCrrT+S/ttW4KfhMTWH4j+b5vhnR4uMGhurgSTc56wsPa1DRJaG
         SFRN3vycjzqiT1kDA6QDdi1fsXK5ddTAbfar1MrSO4EnBHXjTXwcSasAZi0RAVV/jgKA
         4UsPZfNtO5MaBaddICOorhjfY68jYDAPDrVdIU7Ugwf5fENXY6enr7CLuvCsj6bCTUpL
         Cy+hyXmzjYbfqIKvzQ5y9JzOXzuq0bLNSkaWyTEInXvOqv5eKdF41On7fMs40wApGR+R
         +sDg==
X-Gm-Message-State: AO0yUKVNxYUiRN5CiUlqgjU3FCGPqnfgylySb5RRhTrzHcu9CZph5Ltz
	z3D3DVFP1+lTI02BSolFZiQ=
X-Google-Smtp-Source: AK7set+oksFA7BURn7kRqkDrvG1eAcSBPSG8NreA+XowMzgXnQ/t3sWtwtPcYCvkAejTEoDJ+sn/Ow==
X-Received: by 2002:a05:651c:38c:b0:295:9d32:a653 with SMTP id e12-20020a05651c038c00b002959d32a653mr2766834ljp.35.1677752079166;
        Thu, 02 Mar 2023 02:14:39 -0800 (PST)
Message-ID: <842e420f2a4a023c65d820b352cd97f4b1861986.camel@gmail.com>
Subject: Re: [PATCH v4 3/4] xen/arm: switch ARM to use generic
 implementation of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Thu, 02 Mar 2023 12:14:37 +0200
In-Reply-To: <ee8939d9-3071-b08f-e3f9-9a0611f8f10a@suse.com>
References: <cover.1677747527.git.oleksii.kurochko@gmail.com>
	 <fd0b81101c702b8d082a78507ce081b2fc2bbb41.1677747527.git.oleksii.kurochko@gmail.com>
	 <ee8939d9-3071-b08f-e3f9-9a0611f8f10a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-02 at 10:55 +0100, Jan Beulich wrote:
> On 02.03.2023 10:20, Oleksii Kurochko wrote:
> > The following changes were made:
> > * make GENERIC_BUG_FRAME mandatory for ARM
> > * As do_bug_frame() returns -EINVAL in case something goes wrong
> > =C2=A0 otherwise id of bug frame. Thereby 'if' cases where
> > do_bug_frame() was
> > =C2=A0 updated to check if the returned value is less than 0
> > * Switch ARM's implementation of bug.h macros to generic one
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0* Switch ARM implementation to generic one
> > =C2=A0* Remove BUG_FN_REG from arm{16,32}/bug.h as it isn't needed afte=
r
> > switch to generic implementation
>=20
> In which case why ...
>=20
> > --- a/xen/common/bug.c
> > +++ b/xen/common/bug.c
> > @@ -46,11 +46,7 @@ int do_bug_frame(struct cpu_user_regs *regs,
> > unsigned long pc)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 if ( id =3D=3D BUGFRAME_run_fn )
> > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > -#ifdef BUG_FN_REG
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struct cpu=
_user_regs *) =3D (void *)regs-
> > >BUG_FN_REG;
> > -#else
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void (*fn)(const struc=
t cpu_user_regs *) =3D bug_ptr(bug);
> > -#endif
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fn(regs);
>=20
> ... is what is being removed here again introduced in the first place
> (in an earlier patch)?
Missed that.

I looked again at the current patch and realized that ARM-specific
do_bug_frame() has been removed only in the current patch.

So you are right, there is no any sense to introduce these lines in
first patch of the patch series.
>=20
> Jan

~ Oleksii


