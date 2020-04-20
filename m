Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC3F1B0E2A
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 16:20:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQXH6-0005P1-E5; Mon, 20 Apr 2020 14:19:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AIDV=6E=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jQXH4-0005Ow-Lw
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 14:19:50 +0000
X-Inumbo-ID: fe343332-8311-11ea-b4f4-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe343332-8311-11ea-b4f4-bc764e2007e4;
 Mon, 20 Apr 2020 14:19:49 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p16so2852575edm.10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 07:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=t/kri24haV5L/p/bSs6cCMuZWIexiokG6gR1wAuRqYc=;
 b=iv2jwUO7qFn3rx7A2CX6BtzqiH9FNBs5WpVuXYESSlw+WGPjPLpJFB1hbwkMBUisag
 5zdkFdWzB+nEkBA9il+2AAlhgSvxelnkAVhrNuwnYC+uUaONDBK3sx0MEyU9fwDccrEq
 K794oUIlYbsgrntEuGkKfDnS/DEbflRinax04/1mmPA4w6Nf5cf3MRtylkbXgTp5Imrr
 c4ZFPF86EslxP7fqI6mGGstMH4JYxhPajhlT+sdgmzuLine0rD0rNuQi71QGE+n2SGT/
 0jeK89J9AuX2O5LWx+/EZL9gT96plRXC5guMWtC9y2Alr6g3Rv88Y0xccI+3aUl3I08i
 J7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=t/kri24haV5L/p/bSs6cCMuZWIexiokG6gR1wAuRqYc=;
 b=YWfQzgk/RKHsJZE8tU6z7ZgU8OsoIToSZCtO84GxlLyjaIHyAN24W4IuXaDqsbLptV
 UUhFgz4CiyuIiuQ54qm63deCqRCwf3CqpO8fSWWKIZ9VJemj5TS7sWJE5DJmAfsX+rWb
 KTGdUzv11HX0BvaHUQuri6CdzicnRHLqopRaSDz2PIsDTt0HdSuYDyCWsTlLih9T05BM
 6v00xVUpWwJUsmSSjftaRlHzsaw86p4RUZ+teypE4UNVarJ/H4d15rm6T/YgD6SKCuGm
 JvDm+cvgUFX+JGbJDctbYlo6VAfG2oKSqJxgYgD034fhmJDqOfheYTL8NVlT4Ay6NJV5
 hkHw==
X-Gm-Message-State: AGi0Puay0cpudMH9tsfS6505k/2ey0XqAJ1FNUhkqa0cGMgvn5MUlnKf
 QkshGB5UHBM+Ud3jpGmNzbi+BJq8oyU=
X-Google-Smtp-Source: APiQypIzUYfD0SLF+Ne1E+BT5Y4h9OJamjq+oOFaEM150/1PNC1YbDxOMmouEoofJ74hoOvAvvFWwg==
X-Received: by 2002:a05:6402:3041:: with SMTP id
 bu1mr13920357edb.145.1587392388166; 
 Mon, 20 Apr 2020 07:19:48 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41])
 by smtp.gmail.com with ESMTPSA id o13sm163353ejn.19.2020.04.20.07.19.47
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2020 07:19:47 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id j2so12373379wrs.9
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2020 07:19:47 -0700 (PDT)
X-Received: by 2002:a5d:4ac9:: with SMTP id y9mr8992366wrs.182.1587392387111; 
 Mon, 20 Apr 2020 07:19:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587142844.git.tamas.lengyel@intel.com>
 <0be7501ace42d856b344828755ece18659dabd33.1587142844.git.tamas.lengyel@intel.com>
 <20200420075655.GR28601@Air-de-Roger>
In-Reply-To: <20200420075655.GR28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Apr 2020 08:19:12 -0600
X-Gmail-Original-Message-ID: <CABfawhmWm_KasEPG=4e1V4qF5uh-ErtazsK=O8gS2n80KrqOyA@mail.gmail.com>
Message-ID: <CABfawhmWm_KasEPG=4e1V4qF5uh-ErtazsK=O8gS2n80KrqOyA@mail.gmail.com>
Subject: Re: [PATCH v15 2/3] mem_sharing: allow forking domain with IOMMU
 enabled
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 20, 2020 at 1:57 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Fri, Apr 17, 2020 at 10:06:32AM -0700, Tamas K Lengyel wrote:
> > The memory sharing subsystem by default doesn't allow a domain to share=
 memory
> > if it has an IOMMU active for obvious security reasons. However, when f=
uzzing a
> > VM fork, the same security restrictions don't necessarily apply. While =
it makes
> > no sense to try to create a full fork of a VM that has an IOMMU attache=
d as only
> > one domain can own the pass-through device at a time, creating a shallo=
w fork
> > without a device model is still very useful for fuzzing kernel-mode dri=
vers.
> >
> > By allowing the parent VM to initialize the kernel-mode driver with a r=
eal
> > device that's pass-through, the driver can enter into a state more suit=
able for
>                 ^ passed
> > fuzzing. Some of these initialization steps are quite complex and are e=
asier to
> > perform when a real device is present. After the initialization, shallo=
w forks
> > can be utilized for fuzzing code-segments in the device driver that don=
't
> > directly interact with the device.
>
> If I understand this correctly, the forked VM won't have an IOMMU
> setup, and the only domain allowed to interact with the device would
> be the parent?

Correct, this mode would only be for forks that have no access to
devices at all (--launch-dm no).

>
> >
> > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > ---
> >  xen/arch/x86/mm/mem_sharing.c | 18 ++++++++++++------
> >  xen/include/public/memory.h   |  4 +++-
> >  2 files changed, 15 insertions(+), 7 deletions(-)
> >
> > diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharin=
g.c
> > index 4b31a8b8f6..a5063d5992 100644
> > --- a/xen/arch/x86/mm/mem_sharing.c
> > +++ b/xen/arch/x86/mm/mem_sharing.c
> > @@ -1430,7 +1430,8 @@ static int range_share(struct domain *d, struct d=
omain *cd,
> >      return rc;
> >  }
> >
> > -static inline int mem_sharing_control(struct domain *d, bool enable)
> > +static inline int mem_sharing_control(struct domain *d, bool enable,
> > +                                      bool allow_iommu)
> >  {
> >      if ( enable )
> >      {
> > @@ -1440,7 +1441,7 @@ static inline int mem_sharing_control(struct doma=
in *d, bool enable)
> >          if ( unlikely(!hap_enabled(d)) )
> >              return -ENODEV;
> >
> > -        if ( unlikely(is_iommu_enabled(d)) )
> > +        if (unlikely(!allow_iommu && is_iommu_enabled(d)) )
>
> Coding style (missing space)

Ack

>
> >              return -EXDEV;
> >      }
> >
> > @@ -1827,7 +1828,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_=
mem_sharing_op_t) arg)
> >      if ( rc )
> >          goto out;
> >
> > -    if ( !mem_sharing_enabled(d) && (rc =3D mem_sharing_control(d, tru=
e)) )
> > +    if ( !mem_sharing_enabled(d) &&
> > +         (rc =3D mem_sharing_control(d, true, false)) )
> >          return rc;
> >
> >      switch ( mso.op )
> > @@ -2063,9 +2065,10 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen=
_mem_sharing_op_t) arg)
> >      case XENMEM_sharing_op_fork:
> >      {
> >          struct domain *pd;
> > +        bool allow_iommu;
> >
> >          rc =3D -EINVAL;
> > -        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] || mso.u.fork.pad[=
2] )
> > +        if ( mso.u.fork.pad[0] || mso.u.fork.pad[1] )
> >              goto out;
> >
> >          rc =3D rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_dom=
ain,
> > @@ -2080,7 +2083,10 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen=
_mem_sharing_op_t) arg)
> >              goto out;
> >          }
> >
> > -        if ( !mem_sharing_enabled(pd) && (rc =3D mem_sharing_control(p=
d, true)) )
> > +        allow_iommu =3D mso.u.fork.flags & XENMEM_FORK_WITH_IOMMU_ALLO=
WED;
>
> I'm not sure whether it is worth to extract the flags into booleans at
> this level. As you add more flags it might make sense to just pass the
> whole flags field to mem_sharing_control?

Sure.

>
> mem_sharing_memop itself doesn't need to know which flags are
> specified.
>
> > +
> > +        if ( !mem_sharing_enabled(pd) &&
> > +             (rc =3D mem_sharing_control(pd, true, allow_iommu)) )
> >          {
> >              rcu_unlock_domain(pd);
> >              goto out;
> > @@ -2138,7 +2144,7 @@ int mem_sharing_domctl(struct domain *d, struct x=
en_domctl_mem_sharing_op *mec)
> >      switch ( mec->op )
> >      {
> >      case XEN_DOMCTL_MEM_SHARING_CONTROL:
> > -        rc =3D mem_sharing_control(d, mec->u.enable);
> > +        rc =3D mem_sharing_control(d, mec->u.enable, false);
> >          break;
> >
> >      default:
> > diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> > index d36d64b8dc..1d2149def3 100644
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -536,7 +536,9 @@ struct xen_mem_sharing_op {
> >          } debug;
> >          struct mem_sharing_op_fork {      /* OP_FORK */
> >              domid_t parent_domain;        /* IN: parent's domain id */
> > -            uint16_t pad[3];              /* Must be set to 0 */
> > +#define XENMEM_FORK_WITH_IOMMU_ALLOWED 1  /* Allow forking domain with=
 IOMMU */
>
> Since this is a flags field, can you express this is as: (1u << 0).

I was thinking of doing that then it won't fit into a single line. For
this particular flag it would also make no difference.

>
> > +            uint16_t flags;               /* IN: optional settings */
> > +            uint16_t pad[2];              /* Must be set to 0 */
>
> Nit: padding can be made a uint32_t now instead of an array of two
> uint16_t.
>
> Or add an uint16_t between parent_domain and flags and make flags an
> uint32_t.

True.

Thanks,
Tamas

