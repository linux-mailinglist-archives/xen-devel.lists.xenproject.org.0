Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBF11E9F73
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 09:46:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jff8L-0001de-Ga; Mon, 01 Jun 2020 07:45:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L6P3=7O=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jff8K-0001dZ-7R
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 07:45:20 +0000
X-Inumbo-ID: d6b70fce-a3db-11ea-81bc-bc764e2007e4
Received: from mail-ed1-x52d.google.com (unknown [2a00:1450:4864:20::52d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6b70fce-a3db-11ea-81bc-bc764e2007e4;
 Mon, 01 Jun 2020 07:45:18 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id k19so6525115edv.9
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 00:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=TArJAUPaOJGl/dVFKZA/jKFYGj1MPluOHDMaCWjmMmQ=;
 b=DHqB+pW0MAJHqCTA5tVl504adFCc20B1ew7m4sNHss0Xx4CKrfTN8SBA0Oi6Wf7mJQ
 iJkjtr0lZgpaP0URXWUNkGS3uDbzVbEvPy6TZHrGn6l9BTitANSoJBD02NZECp3IhpBP
 4m1p1ByifW+gZ51/EV2fpdCqyXARNTmKvXzGigquFy3YOlOkG0UkDLXsycKUowhKie0P
 oNICSJfgpo4hFYuVQmo35ltz9YryeQEnjgiLdNe2DYevVqBYwVw1HYYQcj6gLMNuJDXs
 FOUfysjHff8aRkw8Ja6DB9BYUPvbt7J5R0aqAFeRjZnQc9ZqIK1fyWiLTfg/R1J6EKB5
 dNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=TArJAUPaOJGl/dVFKZA/jKFYGj1MPluOHDMaCWjmMmQ=;
 b=ZxBxZU4Am2x8qZzTIUJ5C6yxoFgIdygNBZW9hm6iBz2wkCcGz5y1yFxYOxrzlH/eQ/
 Ittm0BmG424xhaOv38mFTEWCoIfxa7QjCFuoNoB4SkHndL2qGeByMKgzqMx+9fnrA/QB
 Tg4FEXaMnsO8oMF1Alxxuzt0TPAv9qWV5HtnpMdFm5yai8lBnR8EVEEZS5I229klDriU
 RosVGYrVMcH4HBZjjqPCI32TPGWGzbewt9FxvSie+FOuOuiQMEgAka9sZcB7/oIx9p5y
 v08pmv0KTtYOY4Lgkz8eU9QEQJQpz2OLyue5YmpA0cswyVfFjL6rTpqGomKJMhwCJE8H
 N89A==
X-Gm-Message-State: AOAM532dQXEsL81iTdYlqmi2jD8rbTa3vbwkKZ7O5CqEsJWZ1VPreOb2
 EveHRCpFV1H1EFxyFoc1si0=
X-Google-Smtp-Source: ABdhPJyMKdqj27H988zXUIKL1s0lArYismBjxHi7mFWpfhkEwPMa9tl8fnyMYN/e4FYAQgCUbZn68g==
X-Received: by 2002:a50:c017:: with SMTP id r23mr1935150edb.120.1590997517889; 
 Mon, 01 Jun 2020 00:45:17 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id qt19sm10070817ejb.14.2020.06.01.00.45.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jun 2020 00:45:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200527173407.1398-1-paul@xen.org>
 <20200527173407.1398-6-paul@xen.org>
 <51f8cd86-9582-4fba-7e67-0c4b227870d1@citrix.com>
In-Reply-To: <51f8cd86-9582-4fba-7e67-0c4b227870d1@citrix.com>
Subject: RE: [PATCH v6 5/5] tools/libxc: make use of domain context
 SHARED_INFO record...
Date: Mon, 1 Jun 2020 08:45:16 +0100
Message-ID: <000301d637e8$97b96ba0$c72c42e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQEXlIoBjHO/WiznBkx41DgoSMmbXAJ+udBDAYjKFSKqIGbNoA==
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
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Andrew Cooper <amc96@hermes.cam.ac.uk> On Behalf Of Andrew =
Cooper
> Sent: 30 May 2020 01:30
> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v6 5/5] tools/libxc: make use of domain context =
SHARED_INFO record...
>=20
> On 27/05/2020 18:34, Paul Durrant wrote:
> > ... in the save/restore code.
> >
> > This patch replaces direct mapping of the shared_info_frame =
(retrieved
> > using XEN_DOMCTL_getdomaininfo) with save/load of the domain context
> > SHARED_INFO record.
> >
> > No modifications are made to the definition of the migration stream =
at
> > this point. Subsequent patches will define a record in the libxc =
domain
> > image format for passing domain context and convert the save/restore =
code
> > to use that.
> >
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>=20
> I was going to fix up the remaining issues and commit this, but there =
is
> a rather major problem in the way.  Therefore, here is a rather more
> full review.
>=20

Thanks, but I have to say that this is quite late, coming in v6.

> > diff --git a/tools/libxc/xc_sr_common.c b/tools/libxc/xc_sr_common.c
> > index dd9a11b4b5..1acb3765aa 100644
> > --- a/tools/libxc/xc_sr_common.c
> > +++ b/tools/libxc/xc_sr_common.c
> > @@ -138,6 +138,73 @@ int read_record(struct xc_sr_context *ctx, int =
fd, struct xc_sr_record *rec)
> >      return 0;
> >  };
> >
> > +int get_domain_context(struct xc_sr_context *ctx)
> > +{
> > +    xc_interface *xch =3D ctx->xch;
> > +    size_t len =3D 0;
> > +    int rc;
> > +
> > +    if ( ctx->domain_context.buffer )
> > +    {
> > +        ERROR("Domain context already present");
> > +        return -1;
> > +    }
> > +
> > +    rc =3D xc_domain_getcontext(xch, ctx->domid, NULL, &len);
> > +    if ( rc < 0 )
> > +    {
> > +        PERROR("Unable to get size of domain context");
> > +        return -1;
> > +    }
> > +
> > +    ctx->domain_context.buffer =3D malloc(len);
> > +    if ( !ctx->domain_context.buffer )
> > +    {
> > +        PERROR("Unable to allocate memory for domain context");
> > +        return -1;
> > +    }
>=20
> There is an xc_sr_blob interface, as this is a common pattern.
>=20

Ok.

> > +
> > +    rc =3D xc_domain_getcontext(xch, ctx->domid, =
ctx->domain_context.buffer,
> > +                              &len);
> > +    if ( rc < 0 )
> > +    {
> > +        PERROR("Unable to get domain context");
> > +        return -1;
> > +    }
> > +
> > +    ctx->domain_context.len =3D len;
> > +
> > +    return 0;
> > +}
> > +
> > +int set_domain_context(struct xc_sr_context *ctx)
> > +{
> > +    xc_interface *xch =3D ctx->xch;
> > +    int rc;
> > +
> > +    if ( !ctx->domain_context.buffer )
> > +    {
> > +        ERROR("Domain context not present");
> > +        return -1;
> > +    }
> > +
> > +    rc =3D xc_domain_setcontext(xch, ctx->domid, =
ctx->domain_context.buffer,
> > +                              ctx->domain_context.len);
> > +
> > +    if ( rc < 0 )
> > +    {
> > +        PERROR("Unable to set domain context");
> > +        return -1;
> > +    }
> > +
> > +    return 0;
> > +}
> > +
> > +void common_cleanup(struct xc_sr_context *ctx)
> > +{
> > +    free(ctx->domain_context.buffer);
>=20
> There is only a single caller to this function, so there is a =
(possibly
> latent) memory leak.
>=20
> > +}
> > +
> >  static void __attribute__((unused)) build_assertions(void)
> >  {
> >      BUILD_BUG_ON(sizeof(struct xc_sr_ihdr) !=3D 24);
> > diff --git a/tools/libxc/xc_sr_common.h b/tools/libxc/xc_sr_common.h
> > index 5dd51ccb15..0d61978b08 100644
> > --- a/tools/libxc/xc_sr_common.h
> > +++ b/tools/libxc/xc_sr_common.h
> > @@ -208,6 +208,11 @@ struct xc_sr_context
> >
> >      xc_dominfo_t dominfo;
> >
> > +    struct {
> > +        void *buffer;
> > +        unsigned int len;
> > +    } domain_context;
>=20
> As noted above, xc_sr_blob domain_context;
>=20
> > diff --git a/tools/libxc/xc_sr_restore_x86_pv.c =
b/tools/libxc/xc_sr_restore_x86_pv.c
> > index 904ccc462a..21982a38ad 100644
> > --- a/tools/libxc/xc_sr_restore_x86_pv.c
> > +++ b/tools/libxc/xc_sr_restore_x86_pv.c
> > @@ -865,7 +865,7 @@ static int handle_shared_info(struct =
xc_sr_context *ctx,
> >      xc_interface *xch =3D ctx->xch;
> >      unsigned int i;
> >      int rc =3D -1;
> > -    shared_info_any_t *guest_shinfo =3D NULL;
> > +    shared_info_any_t *guest_shinfo;
> >      const shared_info_any_t *old_shinfo =3D rec->data;
> >
> >      if ( !ctx->x86.pv.restore.seen_pv_info )
> > @@ -878,18 +878,14 @@ static int handle_shared_info(struct =
xc_sr_context *ctx,
> >      {
> >          ERROR("X86_PV_SHARED_INFO record wrong size: length %u"
> >                ", expected 4096", rec->length);
> > -        goto err;
> > +        return -1;
> >      }
> >
> > -    guest_shinfo =3D xc_map_foreign_range(
> > -        xch, ctx->domid, PAGE_SIZE, PROT_READ | PROT_WRITE,
> > -        ctx->dominfo.shared_info_frame);
> > -    if ( !guest_shinfo )
> > -    {
> > -        PERROR("Failed to map Shared Info at mfn %#lx",
> > -               ctx->dominfo.shared_info_frame);
> > -        goto err;
> > -    }
> > +    rc =3D x86_pv_get_shinfo(ctx);
> > +    if ( rc )
> > +        return rc;
>=20
> If I'm following this logic correctly, we're now in the final throws =
of
> completing migration with data in hand, and we ask the hypervisor to
> gather the entire domain context for this (not-yet-run) guest, copy it
> (twice, even) down into userspace, so we can scan through it to find =
the
> appropriate tag, copy less than a page's worth of data, then pass the
> full buffer back to Xen to unserialise the whole thing over the guest.
>=20

That is the case at the moment yes. I do state quite clearly in the =
commit comment:

"No modifications are made to the definition of the migration stream at
this point. Subsequent patches will define a record in the libxc domain
image format for passing domain context and convert the save/restore =
code
to use that."

> The restore path shouldn't be calling DOMCTL_get* at all.  It is
> conceptually wrong, and a waste of time/effort which would be better
> spent with the guest unpaused.
>=20

I refer to the quoted text above.

> What the restore path should be doing is passing data from the stream,
> straight into DOMCTL_set* (and attempting to do this will probably
> demonstrate why hvmctxt was an especially poor API to copy).  The =
layout
> of existing migration-v2 blocks was designed around blobs which Xen
> produces and consumes directly, specifically to minimise the =
processing
> required.
>=20
> I think it is a layering violation to have libxc pick apart and =
reframe
> the internals of another layers' blob.
>=20

Again, that was a pragmatic choice at this stage. The layering violation =
is already there; I have not added code to pick apart the shared info... =
it was there already. I also don't think picking apart the domain =
context buffer is necessarily a layering violation.

> What is not currently clear is whether the domain context wants =
sending
> as a discrete blob itself (and have a new chunk type allocated for the
> purpose), or each bit of it is going to want picking apart.  This
> largely depends on what else is going in the blob at a Xen level.
>=20
> Also, I'd like to see the plans for the HVM side of this logic before
> deciding on whether the PV side is appropriate.  I know we have a
> dedicated SHARED_INFO record right now, but it would be fine (AFAICT) =
to
> relax the migration spec to state that one of {SHARED_INFO,
> DOMAIN_CONTEXT} must be sent for PV.
>=20

If you object to this interim step then I think I will indeed abstract =
away from SHARED_INFO instead. Very little of it is actually used in PV =
migration anyway and different parts will be needed for guest =
transparent live migration.

> > @@ -854,13 +835,27 @@ static int write_x86_pv_p2m_frames(struct =
xc_sr_context *ctx)
> >   */
> >  static int write_shared_info(struct xc_sr_context *ctx)
> >  {
> > +    xc_interface *xch =3D ctx->xch;
> >      struct xc_sr_record rec =3D {
> >          .type =3D REC_TYPE_SHARED_INFO,
> >          .length =3D PAGE_SIZE,
> > -        .data =3D ctx->x86.pv.shinfo,
> >      };
> > +    int rc;
> >
> > -    return write_record(ctx, &rec);
> > +    if ( !(rec.data =3D calloc(1, PAGE_SIZE)) )
> > +    {
> > +        ERROR("Cannot allocate buffer for SHARED_INFO data");
> > +        return -1;
> > +    }
> > +
> > +    BUILD_BUG_ON(sizeof(*ctx->x86.pv.shinfo) > PAGE_SIZE);
> > +    memcpy(rec.data, ctx->x86.pv.shinfo, =
sizeof(*ctx->x86.pv.shinfo));
>=20
> These are some very contorted hoops to extend the data size sent.
>=20
> write_split_record() is the the tool to use here, although the above
> suggestions may render this change unnecessary.
>=20

Indeed.

> > @@ -1041,7 +1036,7 @@ static int x86_pv_setup(struct xc_sr_context =
*ctx)
> >      if ( rc )
> >          return rc;
> >
> > -    rc =3D map_shinfo(ctx);
> > +    rc =3D x86_pv_get_shinfo(ctx);
> >      if ( rc )
> >          return rc;
> >
> > @@ -1112,12 +1107,11 @@ static int x86_pv_cleanup(struct =
xc_sr_context *ctx)
> >      if ( ctx->x86.pv.p2m )
> >          munmap(ctx->x86.pv.p2m, ctx->x86.pv.p2m_frames * =
PAGE_SIZE);
> >
> > -    if ( ctx->x86.pv.shinfo )
> > -        munmap(ctx->x86.pv.shinfo, PAGE_SIZE);
> > -
> >      if ( ctx->x86.pv.m2p )
> >          munmap(ctx->x86.pv.m2p, ctx->x86.pv.nr_m2p_frames * =
PAGE_SIZE);
> >
> > +    common_cleanup(ctx);
> > +
> >      return 0;
> >  }
>=20
> This pair highlights an asymmetry in the patch, which will need fixing
> by whomever adds a second field to domain_context.  Obtaining the
> context for use should shouldn't be a hidden side effect of getting =
the
> shared info.
>=20

Ok.

  Paul

> ~Andrew


