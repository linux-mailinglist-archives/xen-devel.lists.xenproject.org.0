Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A097EEE05
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634930.990568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ujR-0005pQ-0U; Fri, 17 Nov 2023 09:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634930.990568; Fri, 17 Nov 2023 09:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3ujQ-0005md-T5; Fri, 17 Nov 2023 09:01:44 +0000
Received: by outflank-mailman (input) for mailman id 634930;
 Fri, 17 Nov 2023 09:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c3wv=G6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3ujP-0005mH-FK
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:01:43 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec886ac6-8527-11ee-9b0e-b553b5be7939;
 Fri, 17 Nov 2023 10:01:41 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53e07db272cso2569904a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 01:01:41 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g25-20020a17090613d900b009de467a25d5sm573715ejc.13.2023.11.17.01.01.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 01:01:40 -0800 (PST)
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
X-Inumbo-ID: ec886ac6-8527-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700211701; x=1700816501; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AOXEmUYDZHJs608GWx6KitmXpE5ko3OVbff2mjwukXE=;
        b=SS0H2+DSwPbTSFgVLjYV+4XtzbB0hD88nRgOCiLw3Bg2Hb11jqIgLyC57eFf2p5Bfe
         GsJgIMdy9K3OCzFLSRScmMPUrEZU0hWVLNt7ChzfJrQRH2cJFzgfYFtkKAd9fbY9wrqO
         FRknIuTNoq/w1Q2PcLYdMmRWkGYfqk1lSO+HAIGS0UZ+TL9v8so3utMWta+yDEwMb4vx
         Zni5qFUxSSo0HSs6bx3dDJXqa0bNEIKSQkIuMs3Akk1m631684rRjzf+TcIKivma3xfR
         gKIynM9fNnLZv3WhPWAFtlfxq5dXfh3k46InKfuTA6HXy0sQu9YfqAu1lZANeR7r/tK7
         T7wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700211701; x=1700816501;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOXEmUYDZHJs608GWx6KitmXpE5ko3OVbff2mjwukXE=;
        b=McrQS16s4XIRKEtWiJXQiMM3HQb9TLsTQStJ3qxrbluBaszWDm78rtd5tq/olasrI9
         0rOnJvBmbFtG3xW6aZN+sKHfCMm7hXoLJQknv55y/NZnFEMy4zfnFK/0ajOC6bX2dZuW
         D/NgPmw7JJFL8tP5opZVfTJqNj656C4yvKqBmS21rHg09FBCWi4ptuc/lp8XQTrpqrPR
         rsAtlGNG4vhV2pzQiYRtzab+Oxo8+PpZXZn4FF8o8N5BeS54c6MBIr32ae5fxop2s1mA
         2Og3NKk1EUYFVUecnw+7SdXsFLR6RgxXNdGl0em0zmY57wB0dVhNPRKIabzbRXiqgc/z
         EZeg==
X-Gm-Message-State: AOJu0Yy4+AubnR0wWSLsEWPY71DjIM1/pxjVUF1rQ0d5ruQvR3+HNAB+
	oux+W0K6WhJ1rqhyYK+Ek/M=
X-Google-Smtp-Source: AGHT+IHpFuYoVwB795hc+8vUG+0aGjQWwBkm6+SQonyVBIpdxVfqTyzqiFm+K7uoR7V/kk4fNHaXVA==
X-Received: by 2002:a17:906:dd0:b0:9d2:20ee:b1c7 with SMTP id p16-20020a1709060dd000b009d220eeb1c7mr13505505eji.45.1700211700753;
        Fri, 17 Nov 2023 01:01:40 -0800 (PST)
Message-ID: <30e9dc5fb77907756c77bb73dd408462ab8df5ff.camel@gmail.com>
Subject: Re: [PATCH v2 08/15] xen/asm-generic: introduce generic header
 percpu.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Fri, 17 Nov 2023 11:01:39 +0200
In-Reply-To: <1e07fdac-f692-4ee1-bae3-1fe563481156@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <d0ecdf04ceea49f57a54e15cc129c165a142a5cb.1699633310.git.oleksii.kurochko@gmail.com>
	 <f7fca726-f4d5-4cdf-981e-2a6fcf5085b0@suse.com>
	 <45623d7e6ca4f9ed34c1818ae304cbf49d82da4a.camel@gmail.com>
	 <1e07fdac-f692-4ee1-bae3-1fe563481156@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-11-16 at 13:28 +0100, Jan Beulich wrote:
> On 16.11.2023 13:04, Oleksii wrote:
> > On Thu, 2023-11-16 at 08:36 +0100, Jan Beulich wrote:
> > > On 10.11.2023 17:30, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/include/asm-generic/percpu.h
> > > > @@ -0,0 +1,35 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +#ifndef __ASM_GENERIC_PERCPU_H__
> > > > +#define __ASM_GENERIC_PERCPU_H__
> > > > +
> > > > +#ifndef __ASSEMBLY__
> > > > +
> > > > +#include <xen/types.h>
> > > > +
> > > > +extern char __per_cpu_start[], __per_cpu_data_end[];
> > >=20
> > > Can we go one tiny step beyond what Arm presently has and make
> > > the
> > > latter of the two const?
> > I am not sure I think we will have compilation issue with the
> > following
> > code in Arm and x86 because of [-Werror=3Ddiscarded-qualifiers]:
> >=20
> > static void cf_check _free_percpu_area(struct rcu_head *head)
> > {
> > =C2=A0=C2=A0=C2=A0 struct free_info *info =3D container_of(head, struct=
 free_info,
> > rcu);
> > =C2=A0=C2=A0=C2=A0 unsigned int cpu =3D info->cpu;
> > =C2=A0=C2=A0=C2=A0 char *p =3D __per_cpu_start + __per_cpu_offset[cpu];
> >=20
> > =C2=A0=C2=A0=C2=A0 free_xenheap_pages(p, PERCPU_ORDER);
> > =C2=A0=C2=A0=C2=A0 __per_cpu_offset[cpu] =3D INVALID_PERCPU_AREA;
> > }
>=20
> There's no use of __per_cpu_data_end here; I specifically didn't ask
> for both
> of the declarations to have const added.
Yes, I misread your comment.

>=20
> > I guess cast can help.
>=20
> There may not be casts casting away constness, except maybe in very
> delicate
> situations.
>=20

~ Oleksii


