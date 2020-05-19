Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3901D98E6
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 16:06:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb2ri-0000m4-0v; Tue, 19 May 2020 14:05:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FgAx=7B=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jb2rg-0000lz-AQ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 14:05:04 +0000
X-Inumbo-ID: bba42412-99d9-11ea-b07b-bc764e2007e4
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bba42412-99d9-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 14:05:02 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l18so16073412wrn.6
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 07:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=mzsuszs7g+FSF1DaIiHQwcq2ir70+uMpmZMBvtVzG64=;
 b=hmmY/GMsRIka7etjd5OU0d0CfnGWqFHOGmIBFIvniXFlJXlAOpl7dGYWBVp/vCmD4/
 aN4IFMALHn5bnc7rLlVBqGm4Y/qX5RM7z8dbJdP6/4NOnMjcDoWqscz1jV5VeNxMfF+B
 kKChkIQ2NiJ+Q4dsUo3xM+/zusrHfqs7W7FZD6F7SvTN3FkL3v0oUNbUo0bRn6FGIlmu
 89YVVHGcu8wGGVtaewz31rBbZui11dEi+fD35tpRd6UvFzdjVvbLT5A5+611SPgXWz3D
 lYrqgpee5jKR1BX9+ffstkjQw20+otJ4CY9jKFIZlN/v8ofjXnZzZJNN81/je/NnGO+n
 WcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=mzsuszs7g+FSF1DaIiHQwcq2ir70+uMpmZMBvtVzG64=;
 b=knwEQ/b1ea19NX2Pbj3p9EGlcbCIF1xcson4+0BDWy/j4b3Gnc9/Us2mnLCoRR2R2i
 i1DuxynZJZ29C5lISNO8VvDe4FjzFep+2/aim6Awx3UjbgiUDUuxwnNON5VCddmHYQjI
 xjPFMSbKZVCPav9cLcdEz8jBdW5Wu0CGAE1FWdbJJiPhCQnnITnboxKvcvLRMp4b7erM
 RGNbPlNA347AoZUG8/rkpVHvcbi0lf5VLJGY4J5au1rQ+550fBMbJ1KU2h1kEWw4F6Wm
 qkwvVhbGbNUVJCIK+m1lTpoDioqU+YteJr8tubZ3phA1nkH8fL4BXWKG4JmDU49ob/8J
 d1YQ==
X-Gm-Message-State: AOAM532kkZvgBcLEc/ncp1LBF9kMhS+4ZOqsBhYLAo6o+6evIf55BZ1j
 fFJoejLa9fLq+/IgH4//yXI=
X-Google-Smtp-Source: ABdhPJwHMsjjGZveH+YO9QansC3pNp/VvazRpRyoDudSqigjBb+N71fnkFxOCglfTy2XBJJtnlM+bw==
X-Received: by 2002:adf:fb0f:: with SMTP id c15mr27421298wrr.410.1589897101872; 
 Tue, 19 May 2020 07:05:01 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id v5sm20995010wrr.93.2020.05.19.07.05.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 07:05:01 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-2-paul@xen.org>
 <c1da7ff1-2c3a-02d1-cfa1-18840db37566@suse.com>
In-Reply-To: <c1da7ff1-2c3a-02d1-cfa1-18840db37566@suse.com>
Subject: RE: [PATCH v3 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Tue, 19 May 2020 15:04:59 +0100
Message-ID: <000401d62de6$7cb6efa0$7624cee0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH3ss8UVmWNzdPcdrMljFFlRuFHxQJ5sln4ApsafleoQ7loAA==
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
> Sent: 19 May 2020 14:04
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
> Subject: Re: [PATCH v3 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> On 14.05.2020 12:44, Paul Durrant wrote:
> > --- /dev/null
> > +++ b/xen/common/save.c
> > @@ -0,0 +1,313 @@
> > +/*
> > + * save.c: Save and restore PV guest state common to all domain =
types.
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
> > +#include <xen/compile.h>
> > +#include <xen/save.h>
> > +
> > +struct domain_context {
> > +    struct domain *domain;
> > +    const char *name; /* for logging purposes */
>=20
> With this comment, why ...
>=20
> > +    struct domain_save_descriptor desc;
> > +    size_t len; /* for internal accounting */
> > +    union {
> > +        struct domain_save_ops *save;
> > +        struct domain_load_ops *load;
> > +    } ops;
> > +    void *priv;
> > +    bool log;
>=20
> ... this separate field? Couldn't "no logging" simply be expressed by
> name being NULL?
>=20

Ok. The log bool predated the name pointer so, yes these could be =
combined.

> > +int domain_save_end(struct domain_context *c)
> > +{
> > +    struct domain *d =3D c->domain;
> > +    uint8_t pad[DOMAIN_SAVE_ALIGN] =3D {};
>=20
> Preferably moved into the more narrow scope, and probably wants making
> "static const".
>=20

Ok.

> > +    size_t len =3D ROUNDUP(c->len, DOMAIN_SAVE_ALIGN) - c->len; /* =
padding */
> > +    int rc;
> > +
> > +    if ( len )
> > +    {
> > +        rc =3D domain_save_data(c, pad, len);
> > +
> > +        if ( rc )
> > +            return rc;
> > +    }
> > +    ASSERT(IS_ALIGNED(c->len, DOMAIN_SAVE_ALIGN));
>=20
> While you mention the auto-padding as a change in v3, it's not really
> clear to me why it was introduced. Could you add half a sentence to
> the description clarifying the motivation?
>=20

Julien favoured it and it does seem like a good idea as it avoids the =
need to put explicit trailing 'pad' fields in entries. I'll add to the =
commit comment to explain.

> > +int domain_save(struct domain *d, struct domain_save_ops *ops, void =
*priv,
> > +                bool dry_run)
> > +{
> > +    struct domain_context c =3D {
> > +        .domain =3D d,
> > +        .ops.save =3D ops,
> > +        .priv =3D priv,
> > +        .log =3D !dry_run,
> > +    };
> > +    static struct domain_save_header h =3D {
>=20
> const?
>=20

Yes, it can be.

> > +        .magic =3D DOMAIN_SAVE_MAGIC,
> > +        .xen_major =3D XEN_VERSION,
> > +        .xen_minor =3D XEN_SUBVERSION,
> > +        .version =3D DOMAIN_SAVE_VERSION,
> > +    };
> > +    struct domain_save_end e =3D {};
>=20
> const? (static would likely be quite pointless here)
>=20

Ok.

> > +int domain_load(struct domain *d, struct domain_load_ops *ops, void =
*priv)
> > +{
> > +    struct domain_context c =3D {
> > +        .domain =3D d,
> > +        .ops.load =3D ops,
> > +        .priv =3D priv,
> > +        .log =3D true,
> > +    };
> > +    unsigned int instance;
> > +    struct domain_save_header h;
> > +    int rc;
> > +
> > +    ASSERT(d !=3D current->domain);
> > +
> > +    rc =3D c.ops.load->read(c.priv, &c.desc, sizeof(c.desc));
> > +    if ( rc )
> > +        return rc;
> > +
> > +    rc =3D DOMAIN_LOAD_ENTRY(HEADER, &c, &instance, &h, sizeof(h));
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( instance || h.magic !=3D DOMAIN_SAVE_MAGIC ||
> > +         h.version !=3D DOMAIN_SAVE_VERSION )
> > +        return -EINVAL;
> > +
> > +    domain_pause(d);
> > +
> > +    for (;;)
> > +    {
> > +        unsigned int i;
> > +        domain_load_handler load;
> > +
> > +        rc =3D c.ops.load->read(c.priv, &c.desc, sizeof(c.desc));
> > +        if ( rc )
> > +            return rc;
> > +
> > +        rc =3D -EINVAL;
> > +
> > +        if ( c.desc.typecode =3D=3D DOMAIN_SAVE_CODE(END) )
> > +        {
> > +            struct domain_save_end e;
> > +
> > +            rc =3D DOMAIN_LOAD_ENTRY(END, &c, &instance, NULL, =
sizeof(e));
>=20
> Without using &e here I don't see how you can get away without an
> "unused variable" warning.

Hmm. I definitely don't get a warning, but yes this ought to be changed.

>=20
> > --- /dev/null
> > +++ b/xen/include/public/save.h
> > @@ -0,0 +1,80 @@
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
> > +#ifndef XEN_PUBLIC_SAVE_H
> > +#define XEN_PUBLIC_SAVE_H
> > +
> > +#include "xen.h"
> > +
> > +#if defined(__XEN__) || defined(__XEN_TOOLS__)
>=20
> Move #include down below here?
>=20

Sure.

> > +/* Entry data is preceded by a descriptor */
> > +struct domain_save_descriptor {
> > +    uint16_t typecode;
> > +
> > +    /*
> > +     * Instance number of the entry (since there may by multiple of =
some
> > +     * types of entry).
>=20
> With a German bias I'm inclined to ask: "entries"?
>=20

Not sure. Still understandable so I'm happy to change. Also s/by/be.

> > +     */
> > +    uint16_t instance;
> > +
> > +    /* Entry length not including this descriptor */
> > +    uint32_t length;
> > +};
> > +
> > +/*
> > + * Each entry has a type associated with it. =
DECLARE_DOMAIN_SAVE_TYPE
> > + * binds these things together.
> > + */
> > +#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
> > +    struct DOMAIN_SAVE_TYPE_##_x { char c[_code]; _type t; };
>=20
> Perhaps point out in the comment that this type is not meant to
> have instantiations?

Ok.

>=20
> > +#define DOMAIN_SAVE_CODE(_x) \
> > +    (sizeof(((struct DOMAIN_SAVE_TYPE_##_x *)(0))->c))
> > +#define DOMAIN_SAVE_TYPE(_x) \
> > +    typeof(((struct DOMAIN_SAVE_TYPE_##_x *)(0))->t)
>=20
> Feels like I already mentioned the oddity of having parentheses
> around a single token that's not a macro parameter name.
>=20

Ok. Missed that.

> > --- /dev/null
> > +++ b/xen/include/xen/save.h
> > @@ -0,0 +1,165 @@
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
> > +#ifndef XEN_SAVE_H
> > +#define XEN_SAVE_H
> > +
> > +#include <xen/init.h>
> > +#include <xen/sched.h>
> > +#include <xen/types.h>
> > +
> > +#include <public/save.h>
> > +
> > +struct domain_context;
> > +
> > +int domain_save_begin(struct domain_context *c, unsigned int =
typecode,
> > +                      const char *name, unsigned int instance);
> > +
> > +#define DOMAIN_SAVE_BEGIN(_x, _c, _instance) \
> > +    domain_save_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, (_instance))
>=20
> As per prior conversation I would have expected no leading underscores
> here anymore, and no parenthesization of what is still _c. More of
> these further down.

What's wrong with leading underscores in macro arguments? They can't =
pollute any namespace. Also, I prefer to keep the parentheses for =
arguments.

>=20
> > +static inline int domain_load_entry(struct domain_context *c,
> > +                                    unsigned int typecode, const =
char *name,
> > +                                    unsigned int *instance, void =
*dst,
> > +                                    size_t len)
> > +{
> > +    int rc;
> > +
> > +    rc =3D domain_load_begin(c, typecode, name, instance);
>=20
> For some reason I've spotted this only here: Why is instance a pointer
> parameter of the function, when typecode is a value? Both live next to
> one another in struct domain_save_descriptor, and hence instance could
> be retrieved at the same time as typecode.
>=20

Because the typecode is known a priori. It has to be known for the =
correct handler to be invoked. It is only provided here for verification =
purposes. I could have provided the instance as an argument to the load =
handler but I prefer making the interactions for save and load more =
symmetric.

> > +/*
> > + * Register save and restore handlers. Save handlers will be =
invoked
> > + * in order of DOMAIN_SAVE_CODE().
> > + */
> > +#define DOMAIN_REGISTER_SAVE_RESTORE(_x, _save, _load)            \
> > +    static int __init __domain_register_##_x##_save_restore(void) \
> > +    {                                                             \
> > +        domain_register_save_type(                                \
> > +            DOMAIN_SAVE_CODE(_x),                                 \
> > +            #_x,                                                  \
> > +            &(_save),                                             \
> > +            &(_load));                                            \
> > +                                                                  \
> > +        return 0;                                                 \
> > +    }                                                             \
> > +    __initcall(__domain_register_##_x##_save_restore);
>=20
> I'm puzzled by part of the comment: Invoking by save code looks
> reasonable for the saving side (albeit END doesn't match this rule
> afaics), but is this going to be good enough for the consuming side?

No, this only relates to the save side which is why the comment says =
'Save handlers'. I do note that it would be more consistent to use =
'load' rather than 'restore' here though.

> There may be dependencies between types, and with fixed ordering
> there may be no way to insert a depended upon type ahead of an
> already defined one (at least as long as the codes are meant to be
> stable).
>=20

The ordering of load handlers is determined by the stream. I'll add a =
sentence saying that.

> > +/*
> > + * Entry points:
> > + *
> > + * ops:     These are callback functions provided by the caller =
that will
> > + *          be used to write to (in the save case) or read from (in =
the
> > + *          load case) the context buffer. See above for more =
detail.
> > + * priv:    This is a pointer that will be passed to the copy =
function to
> > + *          allow it to identify the context buffer and the current =
state
> > + *          of the save or load operation.
> > + * dry_run: If this is set then the caller of domain_save() is only =
trying
> > + *          to acquire the total size of the data, not the data =
itself.
> > + *          In this case the caller may supply different ops to =
avoid doing
> > + *          unnecessary work.
> > + */
> > +int domain_save(struct domain *d, struct domain_save_ops *ops, void =
*priv,
> > +                bool dry_run);
> > +int domain_load(struct domain *d, struct domain_load_ops *ops, void =
*priv);
>=20
> I guess ops want to be pointer to const in both cases?
>=20

Yes, it can be.

  Paul

> Jan


