Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B810D1BC3CD
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 17:35:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTSGZ-0005jL-5V; Tue, 28 Apr 2020 15:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTSGX-0005jA-N7
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 15:35:21 +0000
X-Inumbo-ID: ddfa6780-8965-11ea-b9cf-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ddfa6780-8965-11ea-b9cf-bc764e2007e4;
 Tue, 28 Apr 2020 15:35:20 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so3276619wmk.5
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=fCjEYnE9PVG8y7Lh3ojI15FhTSU5CvGePZ0rY21bNck=;
 b=kVUyIEYoi+whoLpExbhLNwUvhO56n3/ILSbdLJ+XR+b/cDWAZhqnyIAdosLZZttLWO
 PmX+tO++aiDdV++Uz2UuGU2ouIRdBlPh5l4B64gKqWErj2SHSxij0utFDDbIVW/TIrSw
 Mk26696W3XfUHGh1AZv0FpDjm4MHppqIEnkFGEtF7mBtm7DRGJRVUzEibz2ghW9PSASj
 m5Q98ij8Q0v3H5I1aUH8pJHStSZfZJira+Bk6gLIZsE1bNLhk6LOVmTj9UjxeXjHmVyX
 ZR1lMBIdVI88N3wDKgG76Zor6QIwdYHyjYlewzzVuVWuCb97NADiQVKqHdm3D+/A/TB5
 j6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=fCjEYnE9PVG8y7Lh3ojI15FhTSU5CvGePZ0rY21bNck=;
 b=iJ4eEmJkUhBtcV8Ka7KDnDSi2yxb2LFQT/PQcDEnNb+4uBWMsfJk3uc/9+PjiBiIKT
 KpYeG0PrTwlpahV7doYni/f6/WE3vzc2/obo3FrQBiy4LGMI8ZGpJ0kQ7G1fLX6g4dtr
 K53dzoaMvHw6UJlPBZoRJcrpmwBtSIY95THd10FH9Ixc1v4H07bTXs1SBsIVBIKC73Bt
 S3km15S40AJIj3mVRuP5C2oZTIzZeCSGKUIQFkjFX4mlSyl0oWclzl59+VCtLZ5O27J/
 a5moSJX6nmbrmravmDfPBcaOlFtacusvFzfEWUI0S64CF91xPtXvAwLief9Oq3F91U0s
 O8KQ==
X-Gm-Message-State: AGi0PuYbMuLx2VH8Rtc6MguGaKzVIsc54QM03/p5FOwBk0XSSCE4w6ov
 hn/c7UQDxpCY/eugwlirq6U=
X-Google-Smtp-Source: APiQypIuZKXzZZX8ylJ+u7WQ8tQ/8lfYFC8z0zx8BWhiwEU1K7VgTmUpsy/P5pdJOC4Tzm7TnK5OOg==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr5051546wmj.14.1588088119216; 
 Tue, 28 Apr 2020 08:35:19 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id g69sm4005194wmg.17.2020.04.28.08.35.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 08:35:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
 <2f69484c-d043-bded-0a88-2587241aaa94@xen.org>
In-Reply-To: <2f69484c-d043-bded-0a88-2587241aaa94@xen.org>
Subject: RE: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Tue, 28 Apr 2020 16:35:16 +0100
Message-ID: <001401d61d72$9ef9da20$dced8e60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIOC3/NwyZzJjhdRz0oBcI7Is/lxwF9QIbqAXe2hfeoBx6rIA==
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 20 April 2020 18:21
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
Jan Beulich <jbeulich@suse.com>;
> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; =
Volodymyr Babchuk
> <Volodymyr_Babchuk@epam.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> Hi Paul,
>=20
> On 07/04/2020 18:38, Paul Durrant wrote:
> > To allow enlightened HVM guests (i.e. those that have PV drivers) to =
be
> > migrated without their co-operation it will be necessary to transfer =
'PV'
> > state such as event channel state, grant entry state, etc.
> >
> > Currently there is a framework (entered via the hvm_save/load() =
functions)
> > that allows a domain's 'HVM' (architectural) state to be transferred =
but
> > 'PV' state is also common with pure PV guests and so this framework =
is not
> > really suitable.
> >
> > This patch adds the new public header and low level implementation =
of a new
> > common framework, entered via the domain_save/load() functions. =
Subsequent
> > patches will introduce other parts of the framework, and code that =
will
> > make use of it within the current version of the libxc migration =
stream.
> >
> > This patch also marks the HVM-only framework as deprecated in favour =
of the
> > new framework.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> > ---
> > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: George Dunlap <george.dunlap@citrix.com>
> > Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> > Cc: Jan Beulich <jbeulich@suse.com>
> > Cc: Julien Grall <julien@xen.org>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: Wei Liu <wl@xen.org>
> > Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> > Cc: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> >
> > v2:
> >   - Allow multi-stage save/load to avoid the need to double-buffer
> >   - Get rid of the masks and add an 'ignore' flag instead
> >   - Create copy function union to preserve const save buffer
> >   - Deprecate HVM-only framework
> > ---
> >   xen/common/Makefile                    |   1 +
> >   xen/common/save.c                      | 329 =
+++++++++++++++++++++++++
> >   xen/include/public/arch-arm/hvm/save.h |   5 +
> >   xen/include/public/arch-x86/hvm/save.h |   5 +
> >   xen/include/public/save.h              |  84 +++++++
> >   xen/include/xen/save.h                 | 152 ++++++++++++
> >   6 files changed, 576 insertions(+)
> >   create mode 100644 xen/common/save.c
> >   create mode 100644 xen/include/public/save.h
> >   create mode 100644 xen/include/xen/save.h
> >
> > diff --git a/xen/common/Makefile b/xen/common/Makefile
> > index e8cde65370..90553ba5d7 100644
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -37,6 +37,7 @@ obj-y +=3D radix-tree.o
> >   obj-y +=3D rbtree.o
> >   obj-y +=3D rcupdate.o
> >   obj-y +=3D rwlock.o
> > +obj-y +=3D save.o
> >   obj-y +=3D shutdown.o
> >   obj-y +=3D softirq.o
> >   obj-y +=3D sort.o
> > diff --git a/xen/common/save.c b/xen/common/save.c
> > new file mode 100644
> > index 0000000000..6cdac3785b
> > --- /dev/null
> > +++ b/xen/common/save.c
> > @@ -0,0 +1,329 @@
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
> > +#include <xen/save.h>
> > +
> > +union domain_copy_entry {
> > +    domain_write_entry write;
> > +    domain_read_entry read;
> > +};
> > +
> > +struct domain_context {
> > +    bool log;
> > +    struct domain_save_descriptor desc;
> > +    size_t data_len;
>=20
> What is data_len?
>=20

It=E2=80=99s used for internal accounting.

> > +    union domain_copy_entry copy;
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
> > +int domain_save_begin(struct domain_context *c, unsigned int tc,
> > +                      const char *name, const struct vcpu *v, =
size_t len)
> > +{
> > +    int rc;
> > +
> > +    if ( c->log )
> > +        gdprintk(XENLOG_INFO, "%pv save: %s (%lu)\n", v, name,
> > +                 (unsigned long)len);
>=20
> How about using %zu rather than a cast here?
>=20

Yes, that would be better.

> > +
> > +    BUG_ON(tc !=3D c->desc.typecode);
> > +    BUG_ON(v->vcpu_id !=3D c->desc.vcpu_id);
>=20
> I can't find any answer on my question about this part. I understand =
the
> code would be buggy if this happen, but is it warrant to crash the =
host?
> Couldn't you just return an error and continue to run?
>=20

Since it means buggy code I could ASSERT and error out, yes.

> > +
> > +    ASSERT(!c->data_len);
> > +    c->data_len =3D c->desc.length =3D len;
> > +
> > +    rc =3D c->copy.write(c->priv, &c->desc, sizeof(c->desc));
> > +    if ( rc )
> > +        return rc;
> > +
> > +    c->desc.length =3D 0;
>=20
> This is confusing, why would you need to reset c->desc.length but not
> the rest of the fields?
>=20

Because I use it to accumulate the length of the saved data and then =
cross check it against data_len in domain_save_end() below.

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
> > +{
> > +    /*
> > +     * If desc.length does not match the length specified in
> > +     * domain_save_begin(), there should have been more data.
> > +     */
> > +    if ( c->desc.length !=3D c->data_len )
>=20
> This suggests you know in advance the size of the record.

That depends on what you mean by 'in advance'. I'd expect the caller of =
domain_save_begin() to know exactly.

> I have seen
> some cases where we don't know the size in advance. A good example if
> when saving grants. You know the maximum of grant used by the guest =
but
> you don't know yet the number of grants used. You might need to walk =
the
> "list" twice or allocate a temporary buffer. None of them are ideal.
>=20
> Another example is when saving memory, we may want to compact page
> informations to save space.
>=20
> This problem is going to be more relevant for LiveUpdate where we need
> to be able to create the stream in a very short amount of time.
> Allocating any temporary buffer and/or walking the list twice is going
> to kill the performance.
>=20
> I would suggest to consider a different approach where you update the
> record length at the end.
>=20
> FWIW, this below the current approach for the LU stream (IIRC David =
sent
> a prototype recently). A record is opened using =
lu_stream_open_record(),
> you then have two way to add data:
>      - lu_stream_append() -> This takes a buffer and write to the =
stream.
>      - lu_stream_reserve() -> Pre-allocate space in the stream and
> return a pointer to the beginning of the reserved region.
>      - lu_stream_end_reservation() -> Takes the actual size in =
parameter
> and update the stream size.
>      - lu_stream_close_record() -> Update the header with the total
> length and update the position in the stream.
>=20

That sounds quite LU specific. For LM we still need to know up-front the =
maximal size of the buffer, and I was trying to work on the basis of =
never having to update previously saved data but I guess there's no =
actual harm in doing so, so we could avoid domain_save_begin() =
specifying the length.

> > +        return -EIO;
>=20
> I noticed that all the pasding check have been dropped. I still think =
we
> need implicit padding to harden the code.
>=20

I'd still view that as buggy code.

> > +
> > +    c->data_len =3D 0;
> > +
> > +    return 0;
> > +}
> > +
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
>=20
> I can't find an answer to my question about d->is_dying. What if the
> guest die afterwards? What does protect us against domain_kill()?
>=20
> [...]

As I said in a previous response, nothing protects against =
domain_kill(), this check is just supposed to avoid doing 'unnecessary' =
work for a domain we know is already dying. For LU though I guess we do =
need to save (some) state for even a dying domain, so the individual =
save handlers actually need to make the decision on whether they are =
going to do anything.

>=20
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
>=20
> Same here.
>=20
>=20
> > diff --git a/xen/include/public/save.h b/xen/include/public/save.h
> > new file mode 100644
> > index 0000000000..7e5f8752bd
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
>=20
> Does this header need to be exposed outside of Xen and the tools?
>=20

Probably not.

> > +
> > +#include "xen.h"
> > +
> > +/* Each entry is preceded by a descriptor */
> > +struct domain_save_descriptor {
> > +    uint16_t typecode;
> > +    /*
> > +     * Each entry will contain either to global or per-vcpu domain =
state.
> > +     * Entries relating to global state should have zero in this =
field.
> > +     */
> > +    uint16_t vcpu_id;
> > +    uint32_t flags;
> > +    /*
> > +     * When restoring state this flag can be set in a descriptor to =
cause
> > +     * its content to be ignored.
>=20
> Could you give examples where you would want to ignore a descriptor?
>=20

I was thinking of the case when, e.g. you want to update something in =
the shared_info... You save a context blob, modify the shared_info =
record, and then restore the context blob with all other records marked =
as 'ignore' since they have not been modified.

> > +     *
> > +     * NOTE: It is invalid to set this flag for HEADER or END =
records (see
> > +     *       below).
> > +     */
> > +#define _DOMAIN_SAVE_FLAG_IGNORE 0
> > +#define DOMAIN_SAVE_FLAG_IGNORE (1u << _DOMAIN_SAVE_FLAG_IGNORE)
> > +
> > +    /* Entry length not including this descriptor */
> > +    uint64_t length;
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
>=20
> I haven't seen any answer about xen version here. For the record:
>=20
> "Let's imagine in 4.14 we introduced a bug in the saving part. This is
> solved in 4.15 but somehow the version is not bumped. How would you
> differentiate the streams saved by Xen 4.14 so you can still migrate?

I'd assume testing would at least save and restore on 4.14. If we then =
fixed a bug then why would we not bump the version?

>=20
> If you record the version of Xen in the record automatically, then you
> at least have a way to differentiate the two versions."
>=20

OK, I guess redundant version information is not going to be harmful.

  Paul


