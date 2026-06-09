Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0RXQCXLfJ2oQ3wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:40:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA41D65E6C6
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 11:40:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=a5tBzURn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1332569.1595037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsw0-0001eX-4h; Tue, 09 Jun 2026 09:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332569.1595037; Tue, 09 Jun 2026 09:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWsw0-0001ck-1y; Tue, 09 Jun 2026 09:39:48 +0000
Received: by outflank-mailman (input) for mailman id 1332569;
 Tue, 09 Jun 2026 09:39:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wWsvx-0001Oa-PI
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:39:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWsvx-00Fksd-5R
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 11:39:45 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27df60-2eae-0a2a0a5409dd-0a2a4504d37e-6
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:39:45 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a27df5f-1dec-0a2a45040019-d15580acbde9-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 11:39:44 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-7dc67a5e102so55083427b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 02:39:44 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1780997983; cv=none;
        d=google.com; s=arc-20240605;
        b=RUwvEXhwf0uRe9/LOeinJi23noz1hbuee2tq8T6HM+vVWQnjjRYF1yDcqyPP9lPEOS
         NFBmgC7Bs1ztrtnQNBpFINfaJFUvUqHMMhDN5ZzFrE3fkHEcCRMsqQQ9sriqCQN4nTi3
         0otdJscLwpDW4aHIwU1nkDNqP7uITywbGOQ321gvbQHFFY1L0uuu8/5+AeZXCWobp675
         O7BptzBtQZzE2/NXlcoYJ490Ed8yZItW+qQHm2TiPoBfEROCEoZ+AVjU3KN6T6n8fSpj
         Y4fGhI9+47jtMLu2pIwDLTIFjOHCxx2Z+2zFrreU4sBGTK335PFI7xfxrlhSJ2veFU+u
         1YoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qtpgEoT0seO/HmrH1pfkLOu7AtTLRaIlQWkia+WVbb8=;
        fh=Maj2tFXzf7hkAbNBLtIEwFqhP6OQ+of5Ct/9bp51RJY=;
        b=fBrmdra4GQo8cqqdHOAhlcFm0xZZt9Vw61rgHc6VV5/Kf5noj9PxBEXGX/RcfRIVt+
         1zgoTz4+kKXQkKYAuetvBeTK0qA8FrvBa4pCBy/7z+bV3aYMhyzLKVZfnVqNIUSRwkjQ
         E4TVCVEIfjRM2YXqaCcnGoWwsP8e4gtZ9VksnD3rn4mWvPCg9uIE5yM6xsaPv4Pc3p7o
         feL+JfysZetPTsrf/7Vy6lt1O8mW16uOsXJsVE9/9TVi7UUh1oWa+7Qe2hZZsGsy7jsv
         JAabS56Au4oj4/nJ1CsGhlAVLDW/OCR6dBnayX01SiVr6lDH6u0Jo2QVt1kS9Mb6/nDs
         NSJw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780997983; x=1781602783; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtpgEoT0seO/HmrH1pfkLOu7AtTLRaIlQWkia+WVbb8=;
        b=a5tBzURnWeBgGwfyZ7BVr7Qw/pl+qoQzhArDcPGX8WDZYC5MPUqeVzqsP80zAiI2/+
         ntE1wlnH/NQxyRASBGOt6EN1XNpga7+K7/LUXsBw7QacvuXFgYiY+9hz4s9y3X0cIkFL
         q/FUvwVXajYkXyYfng6vggVwLAzqrxfJVFPaL85wgXfHNr5jC1lGSSRN2/eue7B+3cjQ
         WMA7NuXIB8uPoBifJbMd2nKm/36UYIczja+JgPuCdaKxGIHXyoaNwBlXNXzctQA9Dumi
         /24k4sTqisL97UCpHSACTkcZHsrD08M49tVBSTq1tFqKycvr3Dm0BvIujBLkrEA3MLSr
         FXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997983; x=1781602783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qtpgEoT0seO/HmrH1pfkLOu7AtTLRaIlQWkia+WVbb8=;
        b=WVk+/0vQcefNME20Z42v9HuwIm2M8yfp0cg0dVbutgjyV1Fj7ijbawuQadFOHardFJ
         50NpqTykOANu5qBOutM9OicFyEhs5cvNa5R/YYRF/GLZDzzOTFz37qS9LHRX2nBt/aD9
         ZmrqYZQedobx/hCsjkwnhCmflnrpKYtVFolvZ00c2QLdvJ2PgKIYXb+oXsATMYOGe98f
         b6SjS41QDZ+I7+iqOiB2sH5ei2/w6rehsjaJN58UQP/PToJSfILDkUf6QqR0J9DoQ2kf
         JT5fkRWfrIazWzjrGZy7aQFr5qPxw31sZHr8yeOYh8a4kAbvsY2zcdsFzNMHLOgSAdYj
         Dkbw==
X-Gm-Message-State: AOJu0YyZSEKDhxP0Nx2FjlQYfQomTb8E9ivSZ2OM5Oqvl6Ry2lwShaG/
	GWBylRlz6imtPGCjrClIaHFidn0B0QSd5ksEUmCyRPMaGeqfXdd60MSqnXWAKEOCi8N+CRGcidh
	pGwgynVh5zgeI0goZSJq3os7M7bDd8pI=
X-Gm-Gg: Acq92OGmWp8OvheShaQr133c9HqnQRA8nWux5PVnnNljJ793ciq4ovW5iObsHGKyU0G
	mSUN0PRsyfCJnnU3PqpHM/vhlPdH0ny1/fGljKBMCn5TKtAMEYfyCydPpAWiHIL2Eq+W78JrGYU
	V7zmRfgv+sKwnpDLTmlKGv73HU1cVs/howgUjUjuADKN1Rccx/QOAWe0IUZjhWLgqnc9LrhhYuv
	noclFQU+rS02BFgTsFV0IMDwN9/CiR6rY+ROuJrJL2FeSiKouIVOjlIdyp/1OrpZcBmgy/NoyTC
	n67Wmh0Gg5LW73PzQXQ+iveussMbg7SVHP4UANF5mEr7xbDJ
X-Received: by 2002:a53:d845:0:b0:660:56ee:ec03 with SMTP id
 956f58d0204a3-66106e5b480mr13556421d50.21.1780997983156; Tue, 09 Jun 2026
 02:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260603130603.776452-1-frediano.ziglio@cloud.com>
 <20260603130603.776452-6-frediano.ziglio@cloud.com> <aibkcDCjyeK_0lMK@macbook.local>
In-Reply-To: <aibkcDCjyeK_0lMK@macbook.local>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 9 Jun 2026 10:39:32 +0100
X-Gm-Features: AVVi8CfP-7f2FMbqGQimolonw83x7Lg9h8l45gU05P7-lt8wz4AsJQSUluXRdWc
Message-ID: <CAHt6W4dOQAvEKBH1auotU8+f+NBc8sQmJOgU+0N13=6MHrhHLQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] libs/guest: allocate various migration arrays
 just once
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, Frediano Ziglio <frediano.ziglio@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1780997984-2AD643FF-ADDF39B6/0/0
X-purgate-type: clean
X-purgate-size: 7367
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:edwin.torok@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,citrix.com:email];
	FORGED_SENDER(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[freddy77@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA41D65E6C6

On Mon, 8 Jun 2026 at 16:49, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> wr=
ote:
>
> On Wed, Jun 03, 2026 at 02:05:52PM +0100, Frediano Ziglio wrote:
> > From: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
> >
> > Allocate these array just once at the start of migration,
> > using the maximum batch size, and free them at the end.
> >
> > Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin.torok@citrix.com>
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>
> Jan made a comment about this patch (and how it related to a still
> pending patch of his):
>
> https://lore.kernel.org/xen-devel/e3f22fa6-c497-4afc-9498-12449548acfd@su=
se.com/
>
> That is still unresolved AFAICT.
>
> > --
> > Changes since v2:
> > - change prefix in subject.
> >
> > Changes since v3:
> > - fix comment style
> > ---
> >  tools/libs/guest/xg_sr_common.h | 13 +++++++
> >  tools/libs/guest/xg_sr_save.c   | 66 +++++++++++++--------------------
> >  2 files changed, 39 insertions(+), 40 deletions(-)
> >
> > diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_c=
ommon.h
> > index f1573aefcb..82549b5589 100644
> > --- a/tools/libs/guest/xg_sr_common.h
> > +++ b/tools/libs/guest/xg_sr_common.h
> > @@ -209,6 +209,18 @@ static inline int update_blob(struct xc_sr_blob *b=
lob,
> >      return 0;
> >  }
> >
> > +struct xc_sr_context_save_buffers
> > +{
> > +    xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
> > +    xen_pfn_t mfns[MAX_BATCH_SIZE];
> > +    xen_pfn_t types[MAX_BATCH_SIZE];
> > +    int errors[MAX_BATCH_SIZE];
>
> FWIW: I would possibly place errors at the end of the structure.  It
> seems more natural and is the only array that has 4 byte alignment
> instead of 8 (on 64bits at least).
>

Moved. It disappears later in "libs/guest: finalize PoC" but won't hurt.

> > +    void *guest_data[MAX_BATCH_SIZE];
> > +    void *local_pages[MAX_BATCH_SIZE];
> > +    struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
> > +    uint64_t rec_pfns[MAX_BATCH_SIZE];
> > +};
> > +
> >  struct xc_sr_context
> >  {
> >      xc_interface *xch;
> > @@ -244,6 +256,7 @@ struct xc_sr_context
> >              unsigned long *deferred_pages;
> >              unsigned long nr_deferred_pages;
> >              xc_hypercall_buffer_t dirty_bitmap_hbuf;
> > +            struct xc_sr_context_save_buffers *buffers;
> >          } save;
> >
> >          struct /* Restore data. */
> > diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_sav=
e.c
> > index 8c4e760f8d..7d8055a3f9 100644
> > --- a/tools/libs/guest/xg_sr_save.c
> > +++ b/tools/libs/guest/xg_sr_save.c
> > @@ -86,16 +86,16 @@ static int write_checkpoint_record(struct xc_sr_con=
text *ctx)
> >  static int write_batch(struct xc_sr_context *ctx)
> >  {
> >      xc_interface *xch =3D ctx->xch;
> > -    xen_pfn_t *mfns =3D NULL, *types =3D NULL;
> > +    xen_pfn_t *mfns, *types;
> >      void *guest_mapping =3D NULL;
> > -    void **guest_data =3D NULL;
> > -    void **local_pages =3D NULL;
> > -    int *errors =3D NULL, rc =3D -1;
> > +    void **guest_data;
> > +    void **local_pages;
> > +    int *errors, rc =3D -1;
> >      unsigned int i, p, nr_pages =3D 0, nr_pages_mapped =3D 0;
> >      unsigned int nr_pfns =3D ctx->save.nr_batch_pfns;
> >      void *page, *orig_page;
> > -    uint64_t *rec_pfns =3D NULL;
> > -    struct iovec *iov =3D NULL; int iovcnt =3D 0;
> > +    uint64_t *rec_pfns;
> > +    struct iovec *iov; int iovcnt =3D 0;
> >      struct {
> >          struct xc_sr_rhdr rec;
> >          struct xc_sr_rec_page_data_header page_data;
> > @@ -105,26 +105,24 @@ static int write_batch(struct xc_sr_context *ctx)
> >      };
> >
> >      assert(nr_pfns !=3D 0);
> > +    assert(nr_pfns <=3D MAX_BATCH_SIZE);
> > +    assert(ctx->save.buffers);
> >
> >      /* Mfns of the batch pfns. */
> > -    mfns =3D malloc(nr_pfns * sizeof(*mfns));
> > +    mfns =3D ctx->save.buffers->mfns;
> >      /* Types of the batch pfns. */
> > -    types =3D malloc(nr_pfns * sizeof(*types));
> > +    types =3D ctx->save.buffers->types;
> >      /* Errors from attempting to map the gfns. */
> > -    errors =3D malloc(nr_pfns * sizeof(*errors));
> > +    errors =3D ctx->save.buffers->errors;
> >      /* Pointers to page data to send.  Mapped gfns or local allocation=
s. */
> > -    guest_data =3D calloc(nr_pfns, sizeof(*guest_data));
> > +    guest_data =3D ctx->save.buffers->guest_data;
> > +    memset(guest_data, 0, sizeof(*guest_data) * nr_pfns);
> >      /* Pointers to locally allocated pages.  Need freeing. */
> > -    local_pages =3D calloc(nr_pfns, sizeof(*local_pages));
> > +    local_pages =3D ctx->save.buffers->local_pages;
> > +    memset(local_pages, 0, sizeof(*local_pages) * nr_pfns);
>
> See below - I think it's possible to avoid the memset() and keep the
> same guarantees.
>

What's the issue with memset?
It's more consistent with the old "calloc" in the code and in the
compilers we use (gcc/clang) memset is a builtin that's optimized
better than setting as single fields.
Note that "guest_data" disappears in "libs/guest: fill directly iov
structure" commit.

> >      /* iovec[] for writev(). */
> > -    iov =3D malloc((nr_pfns + 2) * sizeof(*iov));
> > -
> > -    if ( !mfns || !types || !errors || !guest_data || !local_pages || =
!iov )
> > -    {
> > -        ERROR("Unable to allocate arrays for a batch of %u pages",
> > -              nr_pfns);
> > -        goto err;
> > -    }
> > +    iov =3D ctx->save.buffers->iov;
> > +    rec_pfns =3D ctx->save.buffers->rec_pfns;
> >
> >      for ( i =3D 0; i < nr_pfns; ++i )
> >      {
> > @@ -210,14 +208,6 @@ static int write_batch(struct xc_sr_context *ctx)
> >          }
> >      }
> >
> > -    rec_pfns =3D malloc(nr_pfns * sizeof(*rec_pfns));
> > -    if ( !rec_pfns )
> > -    {
> > -        ERROR("Unable to allocate %zu bytes of memory for page data pf=
n list",
> > -              nr_pfns * sizeof(*rec_pfns));
> > -        goto err;
> > -    }
> > -
> >      hdrs.rec.length =3D sizeof(hdrs.page_data);
> >      hdrs.rec.length +=3D nr_pfns * sizeof(*rec_pfns);
> >      hdrs.rec.length +=3D nr_pages * PAGE_SIZE;
> > @@ -267,17 +257,13 @@ static int write_batch(struct xc_sr_context *ctx)
> >      rc =3D ctx->save.nr_batch_pfns =3D 0;
> >
> >   err:
> > -    free(rec_pfns);
> >      if ( guest_mapping )
> >          xenforeignmemory_unmap(xch->fmem, guest_mapping, nr_pages_mapp=
ed);
> >      for ( i =3D 0; local_pages && i < nr_pfns; ++i )
> > +    {
> >          free(local_pages[i]);
> > -    free(iov);
> > -    free(local_pages);
> > -    free(guest_data);
> > -    free(errors);
> > -    free(types);
> > -    free(mfns);
> > +        local_pages[i] =3D NULL;
>
> If you are doing this cleanup here, you could also do guest_data[i] =3D
> NULL and avoid the memset, since at the start of each write_batch()
> the arrays will already be zeroed (either because they are allocated
> with calloc() on the first call, and always cleaned up in
> write_batch() after usage.
>

Given that there's a patch removing "guest_data" entirely, maybe I
would remove the "memset" for "local_pages" in another commit, maybe
"libs/guest: finalize PoC".

> Thanks, Roger.

Frediano

