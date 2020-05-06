Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4141C76D1
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 18:44:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWN9i-00036z-Ea; Wed, 06 May 2020 16:44:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hl2=6U=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jWN9g-00036t-J4
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 16:44:20 +0000
X-Inumbo-ID: d4250d42-8fb8-11ea-9887-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4250d42-8fb8-11ea-9887-bc764e2007e4;
 Wed, 06 May 2020 16:44:18 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x4so3316973wmj.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=JGb1EsNymSTckzPGaVVggD9lhdcR4lnc1L48Drw2mgM=;
 b=DyHpAYZxEvQ5y5kC1bVmLOnoT9PgUaokBGT1e4r1SJSpT/TXad/liqZwgxFwPnUl2b
 BItJDamG23d+NU9hJDa9D3uoxfAvg71GAF0K44I0pptcmd4rCx/luOSad+WnSeTH2S7d
 2Oea3ttvCan/7U8UtV4Wjtq2OulMgJuVTnpH1UYD6NomXnwWZVbmEdrrzpdRBkGeLVtT
 xigpKQ11za/j3r6Tlxppa9hWReDTp2NomzSPoqQIR5UPVSsXbddPIdHEm90E3I6qoBpD
 cosM4M7FWoYK5amKLKma+xegkAc1KGlVMRA4DgBVaweHsxdhvTTYU/lEkCuK8oUL0Unu
 gfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=JGb1EsNymSTckzPGaVVggD9lhdcR4lnc1L48Drw2mgM=;
 b=KLemtokeBzqMnWJiNjQDAzgtPniVhly1RjBImZwfX3m/OLxmwDGXZiIEoScy8189JO
 z2ULKVAVhXtFz7JVucPkmL9v8uMVQsA/XkvrHtvkIwQol+SX42L9+mZQqZMtRIJDBC/p
 Hhz7Kf8TJYVNasntYET9ti7AMv9QO5tUaboe9rNM2kQlwy0hvpb7Mrg05lZbGMQvzvm6
 2dtzVJXfBtv/hk9evvzwhiLv5FNOG7kc7752HxFj8SUSJbVQ3uqMkU7AM2indyTEhdKN
 siaHWjEVyUC36fHqdiRLUEmDK7nqOLUh6YkV4YyAwa6lOazUUIOsF7+GJBI5TCVsNVym
 vGrg==
X-Gm-Message-State: AGi0PuammGfBcRXKuUJGndEpHJ3Z3OyYaoFhrKTfFLNffh+SZku1G52B
 +Ju4942iCeGXpJjz12CNEQU=
X-Google-Smtp-Source: APiQypL2bpf6GgoTago2PS59p5RSm/g5IiKgKZokh8uecB2Xv5CAltshveOwdC5JOKUD96m1HogACQ==
X-Received: by 2002:a1c:e906:: with SMTP id q6mr5287419wmc.62.1588783457916;
 Wed, 06 May 2020 09:44:17 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id u16sm1084130wrq.17.2020.05.06.09.44.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 May 2020 09:44:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
 <d5013c9d-b1a9-6139-a120-741332d6e086@suse.com>
In-Reply-To: <d5013c9d-b1a9-6139-a120-741332d6e086@suse.com>
Subject: RE: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Wed, 6 May 2020 17:44:15 +0100
Message-ID: <009601d623c5$9547abc0$bfd70340$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIOC3/NwyZzJjhdRz0oBcI7Is/lxwF9QIbqAnK/qAyoC/QOkA==
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 29 April 2020 12:02
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; George Dunlap <george.dunlap@citrix.com>; =
Ian Jackson
> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano =
Stabellini
> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Volodymyr Babchuk =
<Volodymyr_Babchuk@epam.com>; Roger
> Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> On 07.04.2020 19:38, Paul Durrant wrote:
> > +void __init domain_register_save_type(unsigned int tc, const char =
*name,
> > +                                      bool per_vcpu,
> > +                                      domain_save_handler save,
> > +                                      domain_load_handler load)
> > +{
> > +    BUG_ON(tc > ARRAY_SIZE(handlers));
>=20
> >=3D

Yes.

>=20
> > +    ASSERT(!handlers[tc].save);
> > +    ASSERT(!handlers[tc].load);
> > +
> > +    handlers[tc].name =3D name;
> > +    handlers[tc].per_vcpu =3D per_vcpu;
> > +    handlers[tc].save =3D save;
> > +    handlers[tc].load =3D load;
> > +}
> > +
> > +int domain_save_begin(struct domain_context *c, unsigned int tc,
> > +                      const char *name, const struct vcpu *v, =
size_t len)
>=20
> I find it quite odd for a function like this one to take a
> struct vcpu * rather than a struct domain *. See also below
> comment on the vcpu_id field in the public header.

I guess struct domain + vcpu_id can be used.

>=20
> > +{
> > +    int rc;
> > +
> > +    if ( c->log )
> > +        gdprintk(XENLOG_INFO, "%pv save: %s (%lu)\n", v, name,
> > +                 (unsigned long)len);
> > +
> > +    BUG_ON(tc !=3D c->desc.typecode);
> > +    BUG_ON(v->vcpu_id !=3D c->desc.vcpu_id);
> > +
> > +    ASSERT(!c->data_len);
> > +    c->data_len =3D c->desc.length =3D len;
> > +
> > +    rc =3D c->copy.write(c->priv, &c->desc, sizeof(c->desc));
> > +    if ( rc )
> > +        return rc;
> > +
> > +    c->desc.length =3D 0;
> > +
> > +    return 0;
> > +}
> > +
> > +int domain_save_data(struct domain_context *c, const void *src, =
size_t len)
> > +{
> > +    if ( c->desc.length + len > c->data_len )
> > +        return -ENOSPC;
> > +
> > +    c->desc.length +=3D len;
> > +
> > +    return c->copy.write(c->priv, src, len);
> > +}
> > +
> > +int domain_save_end(struct domain_context *c)
>=20
> I'm sure there is a reason for the split into three load/save
> functions (begin/data/end), but I can't figure it and the
> description also doesn't explain it. They're all used together
> only afaics, in domain_{save,load}_entry(). Or wait, there are
> DOMAIN_{SAVE,LOAD}_BEGIN() macros apparently allowing separate
> use of ..._begin(), but then it's still not clear why ..._end()
> need to be separate from ..._data().

The split is to avoid the need to double-buffer in the save code, shared =
info being a case in point. If the entire save record needs to be =
written in one call then the shared info content would need to be copied =
into a newly allocated save record and then copied again into the =
aggregate context buffer.

>=20
> > +int domain_save(struct domain *d, domain_write_entry write, void =
*priv,
> > +                bool dry_run)
> > +{
> > +    struct domain_context c =3D {
> > +        .copy.write =3D write,
> > +        .priv =3D priv,
> > +        .log =3D !dry_run,
> > +    };
> > +    struct domain_save_header h =3D {
>=20
> const? Perhaps even static?
>=20

Ok, static is a good idea.

> > +        .magic =3D DOMAIN_SAVE_MAGIC,
> > +        .version =3D DOMAIN_SAVE_VERSION,
> > +    };
> > +    struct domain_save_header e;
> > +    unsigned int i;
> > +    int rc;
> > +
> > +    ASSERT(d !=3D current->domain);
> > +
> > +    if ( d->is_dying )
> > +        return -EINVAL;
>=20
> Could I talk you into using less generic an error code here, e.g.
> -ESRCH or -ENXIO? There look to be further uses of EINVAL that
> may want replacing.
>=20

I'm going to drop this check as it creates a problem for live update, =
where we actually do need to extract and restore state for dying =
domains.

> > +    domain_pause(d);
> > +
> > +    c.desc.typecode =3D DOMAIN_SAVE_CODE(HEADER);
> > +
> > +    rc =3D DOMAIN_SAVE_ENTRY(HEADER, &c, d->vcpu[0], &h, =
sizeof(h));
> > +    if ( rc )
> > +        goto out;
> > +
> > +    for ( i =3D 0; i < ARRAY_SIZE(handlers); i++ )
> > +    {
> > +        domain_save_handler save =3D handlers[i].save;
> > +
> > +        if ( !save )
> > +            continue;
> > +
> > +        memset(&c.desc, 0, sizeof(c.desc));
> > +        c.desc.typecode =3D i;
> > +
> > +        if ( handlers[i].per_vcpu )
> > +        {
> > +            struct vcpu *v;
> > +
> > +            for_each_vcpu ( d, v )
> > +            {
> > +                c.desc.vcpu_id =3D v->vcpu_id;
> > +
> > +                rc =3D save(v, &c, dry_run);
> > +                if ( rc )
> > +                    goto out;
> > +            }
> > +        }
> > +        else
> > +        {
> > +            rc =3D save(d->vcpu[0], &c, dry_run);
> > +            if ( rc )
> > +                goto out;
> > +        }
> > +    }
> > +
> > +    memset(&c.desc, 0, sizeof(c.desc));
> > +    c.desc.typecode =3D DOMAIN_SAVE_CODE(END);
> > +
> > +    rc =3D DOMAIN_SAVE_ENTRY(END, &c, d->vcpu[0], &e, 0);
>=20
> By the looks of it you're passing uninitialized e here; it's just
> that the struct has no members. It would look less odd if you used
> NULL here. Otherwise please don't use literal 0, but sizeof() for
> the last parameter.

I'll init the 'e'.

>=20
> > +int domain_load_begin(struct domain_context *c, unsigned int tc,
> > +                      const char *name, const struct vcpu *v, =
size_t len,
> > +                      bool exact)
> > +{
> > +    if ( c->log )
> > +        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name,
> > +                 (unsigned long)len);
> > +
> > +    BUG_ON(tc !=3D c->desc.typecode);
> > +    BUG_ON(v->vcpu_id !=3D c->desc.vcpu_id);
> > +
> > +    if ( (exact && (len !=3D c->desc.length)) ||
> > +         (len < c->desc.length) )
> > +        return -EINVAL;
>=20
> How about
>=20
>     if ( exact ? len !=3D c->desc.length
>                : len < c->desc.length )
>=20

Yes, that doesn't look too bad.

> ? I'm also unsure about the < - don't you mean > instead? Too
> little data would be compensated by zero padding, but too
> much data can't be dealt with. But maybe I'm getting the sense
> of len wrong ...

I think the < is correct. The caller needs to have at least enough space =
to accommodate the context record.

> > +int domain_load(struct domain *d, domain_read_entry read, void =
*priv)
> > +{
> > +    struct domain_context c =3D {
> > +        .copy.read =3D read,
> > +        .priv =3D priv,
> > +        .log =3D true,
> > +    };
> > +    struct domain_save_header h;
> > +    int rc;
> > +
> > +    ASSERT(d !=3D current->domain);
> > +
> > +    if ( d->is_dying )
> > +        return -EINVAL;
> > +
> > +    rc =3D c.copy.read(c.priv, &c.desc, sizeof(c.desc));
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( c.desc.typecode !=3D DOMAIN_SAVE_CODE(HEADER) || =
c.desc.vcpu_id ||
> > +         c.desc.flags )
> > +        return -EINVAL;
> > +
> > +    rc =3D DOMAIN_LOAD_ENTRY(HEADER, &c, d->vcpu[0], &h, sizeof(h), =
true);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( h.magic !=3D DOMAIN_SAVE_MAGIC || h.version !=3D =
DOMAIN_SAVE_VERSION )
> > +        return -EINVAL;
> > +
> > +    domain_pause(d);
> > +
> > +    for (;;)
> > +    {
> > +        unsigned int i;
> > +        unsigned int flags;
> > +        domain_load_handler load;
> > +        struct vcpu *v;
> > +
> > +        rc =3D c.copy.read(c.priv, &c.desc, sizeof(c.desc));
> > +        if ( rc )
> > +            break;
> > +
> > +        rc =3D -EINVAL;
> > +
> > +        flags =3D c.desc.flags;
> > +        if ( flags & ~DOMAIN_SAVE_FLAG_IGNORE )
> > +            break;
> > +
> > +        if ( c.desc.typecode =3D=3D DOMAIN_SAVE_CODE(END) ) {
>=20
> Brace placement.
>=20

Oops, yes.

> > +            if ( !(flags & DOMAIN_SAVE_FLAG_IGNORE) )
> > +                rc =3D DOMAIN_LOAD_ENTRY(END, &c, d->vcpu[0], NULL, =
0, true);
>=20
> The public header says DOMAIN_SAVE_FLAG_IGNORE is invalid for
> END.
>=20

Indeed, and it should be... don't know why I put that in there.

> > +            break;
> > +        }
> > +
> > +        i =3D c.desc.typecode;
> > +        if ( i >=3D ARRAY_SIZE(handlers) )
> > +            break;
> > +
> > +        if ( (!handlers[i].per_vcpu && c.desc.vcpu_id) ||
> > +             (c.desc.vcpu_id >=3D d->max_vcpus) )
> > +            break;
> > +
> > +        v =3D d->vcpu[c.desc.vcpu_id];
> > +
> > +        if ( flags & DOMAIN_SAVE_FLAG_IGNORE )
> > +        {
> > +            /* Sink the data */
> > +            rc =3D domain_load_entry(&c, c.desc.typecode, =
"IGNORED",
> > +                                   v, NULL, c.desc.length, true);
>=20
> IOW the read handlers need to be able to deal with a NULL dst?
> Sounds a little fragile to me. Is there a reason
> domain_load_data() can't skip the call to read()?

Something has to move the cursor so sinking the data using a NULL dst =
seemed like the best way to avoid the need for a separate callback =
function.

>=20
> > --- /dev/null
> > +++ b/xen/include/public/save.h
> > @@ -0,0 +1,84 @@
> > +/*
> > + * save.h
> > + *
> > + * Structure definitions for common PV/HVM domain state that is =
held by
> > + * Xen and must be saved along with the domain's memory.
> > + *
> > + * Copyright Amazon.com Inc. or its affiliates.
> > + *
> > + * Permission is hereby granted, free of charge, to any person =
obtaining a copy
> > + * of this software and associated documentation files (the =
"Software"), to
> > + * deal in the Software without restriction, including without =
limitation the
> > + * rights to use, copy, modify, merge, publish, distribute, =
sublicense, and/or
> > + * sell copies of the Software, and to permit persons to whom the =
Software is
> > + * furnished to do so, subject to the following conditions:
> > + *
> > + * The above copyright notice and this permission notice shall be =
included in
> > + * all copies or substantial portions of the Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, =
EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF =
MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO =
EVENT SHALL THE
> > + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, =
ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
> > + * DEALINGS IN THE SOFTWARE.
> > + */
> > +
> > +#ifndef __XEN_PUBLIC_SAVE_H__
> > +#define __XEN_PUBLIC_SAVE_H__
> > +
> > +#include "xen.h"
> > +
> > +/* Each entry is preceded by a descriptor */
> > +struct domain_save_descriptor {
>=20
> Throughout this new public header, let's please play nice in name
> space terms: Prefix global scope items with xen_ / XEN_
> respectively, and don't introduce violations of the standard's
> rules (e.g. _DOMAIN_SAVE_FLAG_IGNORE below). The latter point also
> goes for naming outside of the public header, of course.

Sorry, I just didn't pay enough attention to the cut'n'paste from the =
hvm save.h; I'll fix these up.

>=20
> > +    uint16_t typecode;
> > +    /*
> > +     * Each entry will contain either to global or per-vcpu domain =
state.
>=20
> s/contain/apply/ or drop "to"?

Yes, 'to' should be dropped.

>=20
> > +     * Entries relating to global state should have zero in this =
field.
>=20
> Is there a reason to specify zero?
>=20

Not particularly but I thought it best to at least specify a value in =
all cases.

> > +     */
> > +    uint16_t vcpu_id;
>=20
> Seeing (possibly) multi-instance records in HVM state (PIC, IO-APIC, =
HPET),
> wouldn't it be better to generalize this to ID, meaning "vCPU ID" just =
for
> per-vCPU state?
>=20

True, a generic 'instance' would be needed for such records. I'll so as =
you suggest.

> > +    uint32_t flags;
> > +    /*
> > +     * When restoring state this flag can be set in a descriptor to =
cause
> > +     * its content to be ignored.
> > +     *
> > +     * NOTE: It is invalid to set this flag for HEADER or END =
records (see
> > +     *       below).
> > +     */
> > +#define _DOMAIN_SAVE_FLAG_IGNORE 0
> > +#define DOMAIN_SAVE_FLAG_IGNORE (1u << _DOMAIN_SAVE_FLAG_IGNORE)
>=20
> As per your reply to Julien I think this wants further clarification =
on
> the intentions with this flag. I'm also uncertain it is a good idea to
> allow such partial restores - there may be dependencies between =
records,
> and hence things can easily go wrong in perhaps non-obvious ways.
>=20

OK, I'll drop this for now. It could be added later if it is needed.

> > +    /* Entry length not including this descriptor */
> > +    uint64_t length;
>=20
> Do you really envision descriptors with more than 4Gb of data? If so,
> for 32-bit purposes wouldn't this want to be uint64_aligned_t?
>=20

I don't think we'll ever see a single record that big. I'll drop to 32 =
bits.

> > +};
> > +
> > +/*
> > + * Each entry has a type associated with it. =
DECLARE_DOMAIN_SAVE_TYPE
> > + * binds these things together.
> > + */
> > +#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
> > +    struct __DOMAIN_SAVE_TYPE_##_x { char c[_code]; _type t; };
> > +
> > +#define DOMAIN_SAVE_CODE(_x) \
> > +    (sizeof(((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->c))
> > +#define DOMAIN_SAVE_TYPE(_x) \
> > +    typeof(((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->t)
>=20
> Just like the typeof() I dont think the sizeof() needs an outer
> pair of parentheses. I also don't see why 0 gets parenthesized.
>=20

Cut'n'paste... I'll fix it.

> > +/* Terminating entry */
> > +struct domain_save_end {};
> > +DECLARE_DOMAIN_SAVE_TYPE(END, 0, struct domain_save_end);
>=20
> If the header gets a __XEN__ || __XEN_TOOLS__ restriction, as
> suggested by Julien, using 0 here may be fine. If not, char[0]
> and typeof() aren't legal plain C and hence would need to be
> avoided.
>=20

I'll restrict to tools.

> > --- /dev/null
> > +++ b/xen/include/xen/save.h
> > @@ -0,0 +1,152 @@
> > +/*
> > + * save.h: support routines for save/restore
> > + *
> > + * Copyright Amazon.com Inc. or its affiliates.
> > + *
> > + * This program is free software; you can redistribute it and/or =
modify it
> > + * under the terms and conditions of the GNU General Public =
License,
> > + * version 2, as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope it will be useful, but =
WITHOUT
> > + * ANY WARRANTY; without even the implied warranty of =
MERCHANTABILITY or
> > + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License for
> > + * more details.
> > + *
> > + * You should have received a copy of the GNU General Public =
License along with
> > + * this program; If not, see <http://www.gnu.org/licenses/>.
> > + */
> > +
> > +#ifndef __XEN_SAVE_H__
> > +#define __XEN_SAVE_H__
> > +
> > +#include <xen/sched.h>
> > +#include <xen/types.h>
> > +#include <xen/init.h>
>=20
> Please sort these.
>=20

Ok.

> > +#include <public/xen.h>
> > +#include <public/save.h>
>=20
> The latter includes the former anyway - is the former necessary
> for some reason nevertheless?
>=20

No. I suspect it was at one point, but it can be dropped.

> > +struct domain_context;
> > +
> > +int domain_save_begin(struct domain_context *c, unsigned int tc,
> > +                      const char *name, const struct vcpu *v, =
size_t len);
> > +
> > +#define DOMAIN_SAVE_BEGIN(_x, _c, _v, _len) \
> > +        domain_save_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), =
(_len))
>=20
> In new code I'd like to ask for no leading underscores on macro
> parameters as well as no unnecessary parenthesization of macro
> parameters (e.g. when they simply get passed on to another macro
> or function without being part of a larger expression).

Personally I think it is generally good practice to parenthesize but I =
can drop if you prefer.

>=20
> > +int domain_save_data(struct domain_context *c, const void *data, =
size_t len);
> > +int domain_save_end(struct domain_context *c);
> > +
> > +static inline int domain_save_entry(struct domain_context *c,
> > +                                    unsigned int tc, const char =
*name,
> > +                                    const struct vcpu *v, const =
void *src,
> > +                                    size_t len)
> > +{
> > +    int rc;
> > +
> > +    rc =3D domain_save_begin(c, tc, name, v, len);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    rc =3D domain_save_data(c, src, len);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    return domain_save_end(c);
> > +}
> > +
> > +#define DOMAIN_SAVE_ENTRY(_x, _c, _v, _src, _len) \
> > +    domain_save_entry((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), =
(_src), (_len))
> > +
> > +int domain_load_begin(struct domain_context *c, unsigned int tc,
> > +                      const char *name, const struct vcpu *v, =
size_t len,
> > +                      bool exact);
> > +
> > +#define DOMAIN_LOAD_BEGIN(_x, _c, _v, _len, _exact) \
> > +        domain_load_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), =
(_len), \
> > +                          (_exact));
> > +
> > +int domain_load_data(struct domain_context *c, void *data, size_t =
len);
> > +int domain_load_end(struct domain_context *c);
> > +
> > +static inline int domain_load_entry(struct domain_context *c,
> > +                                    unsigned int tc, const char =
*name,
> > +                                    const struct vcpu *v, void =
*dst,
> > +                                    size_t len, bool exact)
> > +{
> > +    int rc;
> > +
> > +    rc =3D domain_load_begin(c, tc, name, v, len, exact);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    rc =3D domain_load_data(c, dst, len);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    return domain_load_end(c);
> > +}
> > +
> > +#define DOMAIN_LOAD_ENTRY(_x, _c, _v, _dst, _len, _exact) \
> > +    domain_load_entry((_c), DOMAIN_SAVE_CODE(_x), #_x, (_v), =
(_dst), (_len), \
> > +                          (_exact))
> > +
> > +/*
> > + * The 'dry_run' flag indicates that the caller of domain_save() =
(see
> > + * below) is not trying to actually acquire the data, only the size
> > + * of the data. The save handler can therefore limit work to only =
that
> > + * which is necessary to call DOMAIN_SAVE_BEGIN/ENTRY() with an =
accurate
> > + * value for '_len'.
> > + */
> > +typedef int (*domain_save_handler)(const struct vcpu *v,
> > +                                   struct domain_context *h,
> > +                                   bool dry_run);
> > +typedef int (*domain_load_handler)(struct vcpu *v,
> > +                                   struct domain_context *h);
>=20
> Does a load handler have a need to modify struct domain_context?
>=20

Not sure. I'll try const-ing.

  Paul

> Jan


