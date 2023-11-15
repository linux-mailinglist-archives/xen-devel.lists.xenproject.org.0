Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B31E7EC4D3
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 15:12:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633691.988738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3GcB-0003h2-VC; Wed, 15 Nov 2023 14:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633691.988738; Wed, 15 Nov 2023 14:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3GcB-0003eg-Qf; Wed, 15 Nov 2023 14:11:35 +0000
Received: by outflank-mailman (input) for mailman id 633691;
 Wed, 15 Nov 2023 14:11:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CM7O=G4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r3Gc9-0003eX-Qn
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 14:11:33 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0fef34a-83c0-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 15:11:32 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507a55302e0so9643468e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 06:11:32 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 kf2-20020a17090776c200b009dda52b1147sm7102150ejc.126.2023.11.15.06.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 06:11:31 -0800 (PST)
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
X-Inumbo-ID: e0fef34a-83c0-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700057492; x=1700662292; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i72p69nvd923fj+/TIRO2Lsps3oYhD101A07PG2Kaf8=;
        b=Tf4LaxtFPULjl9XgXA3eAr2eiTKZcdXxceLFfqZkpp773gIsdKRgPsSbpRZRiPchXa
         lIDMLdPk6if9G47slPv7qm0velsrrHG/j5ax+rbdtqt5hRotyqwwiw45+gM/LQqkze6/
         WCGa+2Ty2Ht8GwmcXhCen4tqN/LVarJUl9aXrzXgBZSWD59z02tGNOFxmPzZV3IL1D8J
         GtozzW4W3EpjtTbUfZp1HR+hEBYr0SC7l1cW4ul3/UcNEhztriLdM1pIrPXEAlT4BbJx
         jAb5miY8IEaLvVDW0Vz9KKcGbLn3VmEiwV0HuBCXQtHMxYT1RHL264Wml3xhD/dhQgxS
         Cbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700057492; x=1700662292;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i72p69nvd923fj+/TIRO2Lsps3oYhD101A07PG2Kaf8=;
        b=GZfjR00P3PtyvnlJ1PYTzsZbgEnt8dTehaZ0ilrSzK8zoRUTu1ZaKbEz2sJkG+Wfao
         vclpGXFNRfat6zSdVYP++ii9a4c0EVvNECUSXIw9+NpEaHu89HPam2qxjFC0+bdTs7RR
         /J6KYoMi7/AKHlPWVXKEbxsp/M8GRrSQDhfZcOtiFYGPQTMt4GqJE32cl2k0qolUPo7i
         4Kwu26clutAG9JRTbJ4W1fFjdDKE8o/bs2Rp2KmDYpduR4ZaQ3UsATlszn2Dp/f/t7bI
         902WNkTEdSqRCTt6lDsjZhgGGVHBp3ArIN9Cb2BvYdmQq/fDmB5TOIh2A32K053HSjB8
         8U4Q==
X-Gm-Message-State: AOJu0YypPiWprQG16fjcm2NFlfCGLpux0a9ep7OMwHr6f3nNOYgttVnM
	Mh7Jc9N0701aUq28spQoZTg=
X-Google-Smtp-Source: AGHT+IHuACqiy87YKPzsrAdI5i4UFBV1PG6F0nA1lRANKr9VuXYaJ+OiBjkCcd/ezSEmTO0OMh4tsQ==
X-Received: by 2002:a19:9107:0:b0:507:a58f:79ad with SMTP id t7-20020a199107000000b00507a58f79admr8196308lfd.61.1700057491980;
        Wed, 15 Nov 2023 06:11:31 -0800 (PST)
Message-ID: <5634e1b953b0b8b1b3ca02b01f84d8093e360237.camel@gmail.com>
Subject: Re: [PATCH v2 14/15] xen/asm-generic: introduce stub header numa.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 15 Nov 2023 16:11:30 +0200
In-Reply-To: <242781b1-9693-47b9-a3f4-bdf5700803db@suse.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
	 <1b50e70d168a1b084ac40711096c38abe44a7b9d.1699633310.git.oleksii.kurochko@gmail.com>
	 <242781b1-9693-47b9-a3f4-bdf5700803db@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Wed, 2023-11-15 at 11:07 +0100, Jan Beulich wrote:
> On 10.11.2023 17:30, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/include/asm-generic/numa.h
> > @@ -0,0 +1,40 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef __ARCH_GENERIC_NUMA_H
> > +#define __ARCH_GENERIC_NUMA_H
> > +
> > +#include <xen/types.h>
> > +#include <xen/mm.h>
>=20
> I'm afraid I can't spot what you need these for here. You clearly
> need
> xen/stdint.h, and you need xen/mm-frame.h for mfn_t. Yes, max_page is
> declared in xen/mm.h, but its questionable whether the header needs
> including here for that reason, as all uses are in macros. (We aren't
> anywhere near consistent in this regard). Plus you don't also include
> xen/cpumask.h to pull in cpu_online_map (which another macro
> references).
I agree with almost you wrote but should <xen/cpumas.h> be included
then? It looks like it is the same situation as with max_page and
<xen/mm.h>.

>=20
> > +typedef uint8_t nodeid_t;
> > +
> > +#ifndef CONFIG_NUMA
>=20
> Isn't it an error to include this header when NUMA=3Dy?
It's still need to define arch_want_default_dmazone() macros which is
used by common code.
All other code is under #ifndef CONFIG_NUMA so it won't conflict with
defintions in <xen/numa.h>.

>=20
> > +/* Fake one node for now. See also node_online_map. */
> > +#define cpu_to_node(cpu) 0
> > +#define node_to_cpumask(node)=C2=A0=C2=A0 (cpu_online_map)
> > +
> > +/*
> > + * TODO: make first_valid_mfn static when NUMA is supported on
> > Arm, this
> > + * is required because the dummy helpers are using it.
> > + */
> > +extern mfn_t first_valid_mfn;
> > +
> > +/* XXX: implement NUMA support */
> > +#define node_spanned_pages(nid) (max_page -
> > mfn_x(first_valid_mfn))
> > +#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
> > +#define __node_distance(a, b) (20)
> > +
> > +#endif
> > +
> > +#define arch_want_default_dmazone() (false)
> > +
> > +#endif /* __ARCH_GENERIC_NUMA_H */
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
>=20

~ Oleksii

