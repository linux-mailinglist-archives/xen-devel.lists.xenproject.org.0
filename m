Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0219DAAF
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 17:56:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKOfd-0005mp-B3; Fri, 03 Apr 2020 15:55:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DmfO=5T=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jKOfb-0005me-Pv
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 15:55:47 +0000
X-Inumbo-ID: 9494c1cc-75c3-11ea-b58d-bc764e2007e4
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9494c1cc-75c3-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 15:55:46 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id s8so6988459wrt.7
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2020 08:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=kAK5KeGfSYohh9CF6RBLw/ib08zMtUz/ZOXCfdxUIW0=;
 b=RCeIsUrz/6zBYEDVgBtqAJhdKNtMBeovkf7iun//HG1iq/mPy0v578gTCsUuZkKm2x
 tVxAbi9gejh82tjNjHUEDpdEsSUIOmSxiWcOEDQ9MEQprrb7qha1A7Mpe9QyTe/JumSu
 P+adZbSGiFaqM9gtz7vaeYvAe/pW31OaAavW7jWzx7rbB8bewqz16ZDtxFlH8rwom073
 1GcFpTe2OkAkP+HTkU5kHtyrlCXhMfVcye1H0W7kcIvygJvWk3h+0IeN38FXptqZRT+Y
 t3op7ZP47647HSDeYzYe777FyxkGsvfca6AGtTz2yWNIXZGDvlEAw9Nq6X8ZU9lt61oh
 15uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=kAK5KeGfSYohh9CF6RBLw/ib08zMtUz/ZOXCfdxUIW0=;
 b=iHWLbNVv1g3tof5XQvZsL6IIBRi6x23y8i06vyl9avpwhlpzfr2QRNthPPaBbMsw45
 5OoAmAF9hCl1dRHVIAtjFOPBfw3izB2NfuXwpeQbXGCt5unmpvaE0Nk8pSXYizREEne9
 3mbPROIPINRqnTX4zexg8WSazTCSyOakRCWJm8bQtzuncw4nqdgb99ojKIucdYPJBTR8
 UJ0e4PpU8QqzgFOasU4sKMHMX5nqnJOsJKG9IaFtSdt08ScGYYN6yYftDK+Pqozi8L0H
 nShPJHb2jy+LMLnjYL6YyOTvp7+6xlo2acrxaHaIgzcnOiWOu7i5Q4wU6OoVAXsy08Ct
 jqZQ==
X-Gm-Message-State: AGi0PuZoyaIfYHWlbLkVfCoVblDNMEzOm48loyaUPbwbODVC1xJZIlIB
 r2AmPqXr0c+tGWeZQ2Zewmc=
X-Google-Smtp-Source: APiQypLjc0R1uBlIXWdEBnBitrykVgB1gnqCsV3emhtzTPpb+8jKZotRabmW49FI+TTeosIwqWXM6w==
X-Received: by 2002:adf:edcf:: with SMTP id v15mr9538603wro.309.1585929345575; 
 Fri, 03 Apr 2020 08:55:45 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id v186sm11919849wme.24.2020.04.03.08.55.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Apr 2020 08:55:44 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200327185012.1795-1-paul@xen.org>
 <20200327185012.1795-2-paul@xen.org>
 <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
In-Reply-To: <5a26a89a-6422-b41d-daac-8f33a48ae23b@xen.org>
Subject: RE: [PATCH 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Fri, 3 Apr 2020 16:55:43 +0100
Message-ID: <002201d609d0$55a76690$00f633b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG3I8TZM/MLMEc/e2It3WEXPZVs8AC9qttvAt7KY/2oiG08cA==
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
[snip]
> > +
> > +#include <xen/save.h>
> > +
> > +struct domain_context {
> > +    bool log;
> > +    struct domain_save_descriptor desc;
> > +    domain_copy_entry copy;
>=20
> As your new framework is technically an extension of existing one, it
> would be good to explain why we diverge in the definitions.
>=20

I don't follow. What is diverging? I explain in the commit comment that =
this is a parallel framework. Do I need to justify why it is not a =
carbon copy of the HVM one?

> > +    void *priv;
> > +};
> > +
> > +static struct {
> > +    const char *name;
> > +    bool per_vcpu;
> > +    domain_save_handler save;
> > +    domain_load_handler load;
> > +} handlers[DOMAIN_SAVE_CODE_MAX + 1];
> > +
> > +void __init domain_register_save_type(unsigned int tc, const char =
*name,
> > +                                      bool per_vcpu,
> > +                                      domain_save_handler save,
> > +                                      domain_load_handler load)
> > +{
> > +    BUG_ON(tc > ARRAY_SIZE(handlers));
> > +
> > +    ASSERT(!handlers[tc].save);
> > +    ASSERT(!handlers[tc].load);
> > +
> > +    handlers[tc].name =3D name;
> > +    handlers[tc].per_vcpu =3D per_vcpu;
> > +    handlers[tc].save =3D save;
> > +    handlers[tc].load =3D load;
> > +}
> > +
> > +int domain_save_entry(struct domain_context *c, unsigned int tc,
> > +                      const char *name, const struct vcpu *v, void =
*src,
>=20
> I realize that 'src' is not const because how you define copy, however =
I
> would rather prefer if we rework the interface to avoid to keep the
> const in the definition. This may mean to have to define two callback
> rather than one.

That seems a bit ugly for the sake of a const but I guess I could create =
a union with a copy_in and copy_out. I'll see how that looks.

>=20
> > +                      size_t src_len)
>=20
> On 64-bit architecture, size_t would be 64-bit. But the record is only
> storing 32-bit. Would it make sense to add some sanity check in the =
code?
>=20

True. Given this is new I think I'll just bump the length to 64-bits.

> > +{
> > +    int rc;
> > +
> > +    if ( c->log && tc !=3D DOMAIN_SAVE_CODE(HEADER) &&
> > +         tc !=3D DOMAIN_SAVE_CODE(END) )
> > +        gdprintk(XENLOG_INFO, "%pv save: %s (%lu)\n", v, name, =
src_len);
> > +
> > +    if ( !IS_ALIGNED(src_len, 8) )
>=20
> Why not adding an implicit padding? This would avoid to chase error
> during saving because the len wasn't a multiple of 8.
>=20

I don't think implicit padding is worth it. This error should only =
happen if a badly defined save record type is added to the code so =
perhaps I ought to add an ASSERT here as well as deal with the error.

> > +        return -EINVAL;
> > +
> > +    BUG_ON(tc !=3D c->desc.typecode);
> > +    BUG_ON(v->vcpu_id !=3D c->desc.instance);
>=20
> Does the descriptor really need to be filled by domain_save()? Can't =
it
> be done here, so we can avoid the two BUG_ON()s?
>=20

Yes it can but this serves as a sanity check that the save code is =
actually doing what it should. Hence why these are BUG_ON()s and not =
error exits.

> > +    c->desc.length =3D src_len;
> > +
> > +    rc =3D c->copy(c->priv, &c->desc, sizeof(c->desc));
> > +    if ( rc )
> > +        return rc;
> > +
> > +    return c->copy(c->priv, src, src_len);
> > +}
> > +
> > +int domain_save(struct domain *d, domain_copy_entry copy, void =
*priv,
> > +                unsigned long mask, bool dry_run)
> > +{
> > +    struct domain_context c =3D {
> > +        .copy =3D copy,
> > +        .priv =3D priv,
> > +        .log =3D !dry_run,
> > +    };
> > +    struct domain_save_header h =3D {
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
> > +
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
>=20
> AFAIU, with this solution, if there are dependency between records, =
the
> dependencies will have to a lower "index". I think we may have some
> dependency with guest transparent migration such as we need to restore
> the event ABI before restoring the event channels.
>=20

Is that just a downstream implementation detail though? I would hope =
that there are no ordering dependencies between records.

> Should we rely on the index for the dependency?
>

If we do need ordering dependencies then I guess it would need to be =
explicit.
=20
> In any case, I think we want to document it.
>

I can certainly document that save handlers are invoked in code order.

> > +    {
> > +        domain_save_handler save =3D handlers[i].save;
> > +
> > +        if ( (mask && !test_bit(i, &mask)) || !save )
>=20
> The type of mask suggests it is not possible to have more than 32
> different types of record if we wanted to be arch agnostic. Even if we
> focus on 64-bit arch, this is only 64 records.
>=20
> This is not very future proof, but might be ok if this is not exposed
> outside of the hypervisor (I haven't looked at the rest of the series
> yet). However, we at least need a BUILD_BUG_ON() in place. So please
> make sure  DOMAIN_SAVE_CODE_MAX is always less than 64.
>=20
> Also what if there is a bit set in the mask and the record is not
> existing? Shouldn't we return an error?
>=20

TBH I think 32 will be enough... I would not expect this context space =
to grow very much, if at all, once transparent migration is working. I =
think I'll just drop the mask for now; it's not actually clear to me =
we'll make use of it... just seemed like a nice-to-have.

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
> > +                c.desc.instance =3D v->vcpu_id;
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
> > +
> > + out:
> > +    domain_unpause(d);
> > +
> > +    return rc;
> > +}
> > +
> > +int domain_load_entry(struct domain_context *c, unsigned int tc,
> > +                      const char *name, const struct vcpu *v, void =
*dst,
> > +                      size_t dst_len, bool exact)
> > +{
> > +    int rc;
> > +
> > +    if ( c->log && tc !=3D DOMAIN_SAVE_CODE(HEADER) &&
> > +         tc !=3D DOMAIN_SAVE_CODE(END) )
> > +        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name, =
dst_len);
> > +
> > +    BUG_ON(tc !=3D c->desc.typecode);
> > +    BUG_ON(v->vcpu_id !=3D c->desc.instance);
>=20
> Is it really warrant to crash the host? What would happen if the =
values
> were wrong?
>=20

It would mean the code is fairly seriously buggy in that the load =
handler is trying to load a record other than the type it registered =
for, or for a vcpu other than the one it was passed.

> > +
> > +    if ( (exact ?
> > +          (dst_len !=3D c->desc.length) : (dst_len < =
c->desc.length)) ||
>=20
> Using ternary in if is really confusing. How about:
>=20
> dst_len < c->desc.length || (exact && dst_len !=3D c->desc.length) ||
>=20
> I understand that there would be two check for the exact case but I
> think it is better than a ternary.

I'm going to re-work this I think.

>=20
> However what is the purpose of the param 'exact'? If you set it to =
false
> how do you know the size you read?

The point of the exact parameter is that whether the caller can only =
consume a record of the correct length, or whether it can handle an =
undersize one which gets zero-padded. (It's the same as the zeroextend =
option in HVM records).

>=20
> > +         !IS_ALIGNED(c->desc.length, 8) )
> > +        return -EINVAL;
> > +
> > +    rc =3D c->copy(c->priv, dst, c->desc.length);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( !exact )
> > +    {
> > +        dst +=3D c->desc.length;
> > +        memset(dst, 0, dst_len - c->desc.length);
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +int domain_load(struct domain *d,  domain_copy_entry copy, void =
*priv,
> > +                unsigned long mask)
> > +{
> > +    struct domain_context c =3D {
> > +        .copy =3D copy,
> > +        .priv =3D priv,
> > +        .log =3D true,
> > +    };
> > +    struct domain_save_header h, e;
> > +    int rc;
> > +
> > +    ASSERT(d !=3D current->domain);
> > +
> > +    if ( d->is_dying )
> > +        return -EINVAL;
>=20
> What does protect you against the doing dying right after this check?
>=20

Nothing. It's just to avoid doing pointless work if we can.

> > +
> > +    rc =3D c.copy(c.priv, &c.desc, sizeof(c.desc));
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( c.desc.typecode !=3D DOMAIN_SAVE_CODE(HEADER) ||
> > +         c.desc.instance !=3D 0 )
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
> > +        domain_load_handler load;
> > +        struct vcpu *v;
> > +
> > +        rc =3D c.copy(c.priv, &c.desc, sizeof(c.desc));
> > +        if ( rc )
> > +            break;
> > +
> > +        if ( c.desc.typecode =3D=3D DOMAIN_SAVE_CODE(END) ) {
> > +            rc =3D DOMAIN_LOAD_ENTRY(END, &c, d->vcpu[0], &e, 0, =
true);
> > +            break;
> > +        }
> > +
> > +        rc =3D -EINVAL;
> > +        if ( c.desc.typecode >=3D ARRAY_SIZE(handlers) ||
> > +             c.desc.instance >=3D d->max_vcpus )
>=20
> Nothing in the documention suggests that c.desc.instance should be 0
> when the record is for the domain.
>=20

Ok. I'll put a comment somewhere.

> > +            break;
> > +
> > +        i =3D c.desc.typecode;
> > +        load =3D handlers[i].load;
> > +        v =3D d->vcpu[c.desc.instance];
> > +
> > +        if ( mask && !test_bit(i, &mask) )
> > +        {
> > +            /* Sink the data */
> > +            rc =3D c.copy(c.priv, NULL, c.desc.length);
> > +            if ( rc )
> > +                break;
> > +
> > +            continue;
> > +        }
> > +
> > +        rc =3D load ? load(v, &c) : -EOPNOTSUPP;
> > +        if ( rc )
> > +            break;
> > +    }
> > +
> > +    domain_unpause(d);
> > +
> > +    return rc;
> > +}
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> > new file mode 100644
> > index 0000000000..84981cd0f6
> > --- /dev/null
> > +++ b/xen/include/public/save.h
> > @@ -0,0 +1,74 @@
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
> > +    uint16_t typecode;
> > +    uint16_t instance;
> > +    /*
> > +     * Entry length not including this descriptor. Entries must be =
padded
> > +     * to a multiple of 8 bytes to make sure descriptors remain =
correctly
> > +     * aligned.
> > +     */
> > +    uint32_t length;
> > +};
> > +
> > +/*
> > + * Each entry has a type associated with it. =
DECLARE_DOMAIN_SAVE_TYPE
> > + * binds these things together.
> > + */
> > +#define DECLARE_DOMAIN_SAVE_TYPE(_x, _code, _type) \
> > +    struct __DOMAIN_SAVE_TYPE_##_x { _type t; char c[_code]; };
> > +
> > +#define DOMAIN_SAVE_TYPE(_x) \
> > +    typeof (((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->t)
> > +#define DOMAIN_SAVE_CODE(_x) \
> > +    (sizeof (((struct __DOMAIN_SAVE_TYPE_##_x *)(0))->c))
> > +#define DOMAIN_SAVE_MASK(_x) (1u << DOMAIN_SAVE_CODE(_x))
> > +
> > +/* Terminating entry */
> > +struct domain_save_end {};
> > +DECLARE_DOMAIN_SAVE_TYPE(END, 0, struct domain_save_end);
> > +
> > +#define DOMAIN_SAVE_MAGIC   0x53415645
> > +#define DOMAIN_SAVE_VERSION 0x00000001
> > +
> > +/* Initial entry */
> > +struct domain_save_header {
> > +    uint32_t magic;             /* Must be DOMAIN_SAVE_MAGIC */
> > +    uint32_t version;           /* Save format version */
>=20
> Would it make sense to have the version of Xen in the stream?
>=20

Why? How would it help?

  Paul


