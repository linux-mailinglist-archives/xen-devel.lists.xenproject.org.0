Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C9D7E9FAD
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631652.985235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Ycd-0000ho-Jg; Mon, 13 Nov 2023 15:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631652.985235; Mon, 13 Nov 2023 15:13:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Ycd-0000fL-Gr; Mon, 13 Nov 2023 15:13:07 +0000
Received: by outflank-mailman (input) for mailman id 631652;
 Mon, 13 Nov 2023 15:13:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofAX=G2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r2Ycc-0000fF-MB
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:13:06 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24b4e86b-8237-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 16:13:04 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c54c8934abso61828381fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:13:04 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a2e99d8000000b002bcbae4c21fsm1011378ljj.50.2023.11.13.07.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 07:13:03 -0800 (PST)
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
X-Inumbo-ID: 24b4e86b-8237-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699888384; x=1700493184; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EIIxNRtz1qm9x1ub3vaHJS3QbS43xwcBjN83JwwhX0w=;
        b=Hxo3HhStFlwu/m45R2biIYDGEsD1q9YKZKNAYHY1cUHaenNtOK88ZrOqjvRzceteev
         iv/I+Qa+qaUl85JwarzlkQHlhaLqI+a+NbYp7ACbj/upZig7t4n3NVT5FKhoCcvh5eCZ
         p4QikW1WBxr9BbxIea0n+Uu6BOw6G0Xo1J4bo9LfHq+x5a/HFyk+Zy5nAVLa7yYn39Z8
         psaRJC2XcBubAQnCpZx6Tu5Zi2M1+Kb5usMoqrYKa4pALkd94GABDgAGwPqrImfBJqKG
         N7hFq8oTiv766cHKcOJcG6YADTNgW3MJA26xTgZW/Q2byxHU5Lpxcxm1n0ER2clCGGxI
         OyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699888384; x=1700493184;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EIIxNRtz1qm9x1ub3vaHJS3QbS43xwcBjN83JwwhX0w=;
        b=htq4Sbuy19g//TBF50vOOzsvvoiBrskyoZ+bNS2FSCe5ZbEHLdwlFAxprq9AGlHgGA
         cdFSUDy4nLP5TDJOkRNQ/mQG4WQyFIY+rbrh8Nespfql7Gd+qBvAxB5D2/x66HbL75pu
         yuPr2CIBoRsxKt1kDqo4+T0zObr4opYVTmqSRu1Y5REVZJgmuNEa0hVSVOerznBZ9Nig
         WKEb0PFADmNfOVrL0m0lUNkaIhG9YmZWAi2QPz2Txdprzfqhu0KNL1LJJcVcVv4qYGsF
         PoV+KM9iiz5MjHNUntKZJO5qDfJPMB7LHRMAnAM8T0uTUnRxpdBDUENkW1NYqJQ3NZXA
         TK+w==
X-Gm-Message-State: AOJu0YwOefRgkV7J1cD4nUmtM3RoA4KyMq677we4P5BTERGYigm+Cy97
	l22ykKy2pWumkXmENiftDJ8=
X-Google-Smtp-Source: AGHT+IE/kUnf2bmTulkragWE6JT5hijyF9M/m1m4JBtvPFxySrxdjOlZAP1Y67D2t9TpaeerGYHE/w==
X-Received: by 2002:a2e:91c8:0:b0:2c7:1ae6:e6ac with SMTP id u8-20020a2e91c8000000b002c71ae6e6acmr4991890ljg.6.1699888383913;
        Mon, 13 Nov 2023 07:13:03 -0800 (PST)
Message-ID: <0573d8847caa9f28c8f69ebec0bacf325dd8c521.camel@gmail.com>
Subject: Re: [PATCH v2 03/15] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Mon, 13 Nov 2023 17:13:02 +0200
In-Reply-To: <b4ae921b-b2c0-5eff-bf81-ab97a909b562@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <cd1341ae337fc9a1619d747b3db1a7a5cd6ad2fb.1699633310.git.oleksii.kurochko@gmail.com>
	 <928557f8d62941a2524fc67b7067a777e2180db2.camel@gmail.com>
	 <4421cbf44ea8b434c68a7ed218d007d049c08e6d.camel@gmail.com>
	 <b4ae921b-b2c0-5eff-bf81-ab97a909b562@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-11-13 at 14:29 +0100, Jan Beulich wrote:
> On 13.11.2023 14:13, Oleksii wrote:
> > On Sat, 2023-11-11 at 12:25 +0200, Oleksii wrote:
> > > I missed to check the patch properly.
> > >=20
> > > The patch fails for Arm randconfigs:
> > > https://gitlab.com/xen-project/people/olkur/xen/-/pipelines/106886567=
4
> > >=20
> > > I need to do an additional investigation.
> > So the only one macro cause compile issue if move it to
> > xen/grant_table.h compilation will pass:
> >=20
> > --- a/xen/include/xen/grant_table.h
> > +++ b/xen/include/xen/grant_table.h
> > @@ -23,10 +23,14 @@
> > =C2=A0#ifndef __XEN_GRANT_TABLE_H__
> > =C2=A0#define __XEN_GRANT_TABLE_H__
> > =C2=A0
> > +#include <xen/kernel.h>
> > =C2=A0#include <xen/mm-frame.h>
> > =C2=A0#include <xen/rwlock.h>
> > =C2=A0#include <public/grant_table.h>
> > +
> > +#ifdef CONFIG_GRANT_TABLE
> > =C2=A0#include <asm/grant_table.h>
> > +#endif
> > =C2=A0
> > =C2=A0struct grant_table;
> > =C2=A0
> > @@ -112,6 +116,16 @@ static inline int gnttab_acquire_resource(
> > =C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > =C2=A0}
> > =C2=A0
> > +/*
> > + * The region used by Xen on the memory will never be mapped in
> > DOM0
> > + * memory layout. Therefore it can be used for the grant table.
> > + *
> > + * Only use the text section as it's always present and will
> > contain
> > + * enough space for a large grant table
> > + */
> > +#define
> > gnttab_dom0_frames()=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > \
> > +=C2=A0=C2=A0=C2=A0 min_t(unsigned int, opt_max_grant_frames, PFN_DOWN(=
_etext -
> > _stext))
> > +
> > =C2=A0#endif /* CONFIG_GRANT_TABLE */
> > =C2=A0
> > =C2=A0#endif /* __XEN_GRANT_TABLE_H__ */
> >=20
> >=20
> > But gnttab_dom0_frames() is used only for ARM, so probably moving
> > it to
> > <xen/grant_table.h> is not a good idea.
>=20
> Indeed. But wouldn't dealing with this again be a matter of having
> Arm's domain_build.c simply include asm/grant_table.h explicitly, if
> need
> be alongside xen/grant_table.h?
It can be a solution. Then I'll send a separate patch.

Thanks.

~ Oleksii



