Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310EC972CEC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:08:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795149.1204315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwr0-0006hX-Do; Tue, 10 Sep 2024 09:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795149.1204315; Tue, 10 Sep 2024 09:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snwr0-0006eN-B3; Tue, 10 Sep 2024 09:08:06 +0000
Received: by outflank-mailman (input) for mailman id 795149;
 Tue, 10 Sep 2024 09:08:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1snwqy-0006eH-Ml
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:08:04 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eadbbbd-6f54-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 11:08:02 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d24f98215so403036866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:08:02 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835a76sm453344466b.39.2024.09.10.02.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 02:08:00 -0700 (PDT)
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
X-Inumbo-ID: 2eadbbbd-6f54-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725959282; x=1726564082; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tAFWsKf5/PNsIYwmLRbjn0UGek+/zjF+z1UfKtZFWXE=;
        b=n7qeZleqzDGb3XRtFrb2cqXbdDXSweSPbdZ/Rn3kYzox4Yrh5oUPetaFlCG09ijtgm
         mKDCqSbOqNy9rvz2Gl7kJUnjWRyrJuorP3XjvAJsWJiIlw/R5rAgNpCI+VRzKLI78B8i
         ZH/pHGUgCBTLRXzvo6G8rxT8R/1qr9hi/gslI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725959282; x=1726564082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tAFWsKf5/PNsIYwmLRbjn0UGek+/zjF+z1UfKtZFWXE=;
        b=L2IlQVnoQAUfxT3+/7x9orFtdqcOnsakOoIAoSamTcy/HdMDRe8sNvD5xLIrjCqB7W
         fOs/EpF3qcHcIslcbbqdCkf/nmqGr9LcRnBihz5gme00x/RywXNLdJ+4H/g/Lo4FTHJ8
         1NG2vxhxvBvT8RVyVtUkOz8KHqtCy1QnuJ8iv9lGW/7eaCpdOsl/W3MOh+oxwce3VfdO
         ZM774XplyOFVmx5V5YNn3KX09V4SLIZk4Eb4Eq1UOjKA1+49AAPFTW6WsiD2DRViCK8l
         9PC/iixMpDkglWubtKAQ82udQr83y5uTWSZtD0I2xAObOIcHQ1cr5FXogjWiZ/TcHn5w
         RjvA==
X-Gm-Message-State: AOJu0Yycdn+LjT7b+DxiBc2agmjkTVNflDESWMvY+J6A3TqIwuQx/5an
	m3pVCf42JD7mRB/b6klJBDcjfJgZ2kA9B2MOrUTLaMSCng0tkKxwmwnTX6Evj7M=
X-Google-Smtp-Source: AGHT+IH1exS/7EmSW3T7pZpbIWRIXc2WeIye0/AJQvx7LaPVky9BrHIUYMRcmhlYbnhlahmW9x8AQw==
X-Received: by 2002:a17:907:2d2c:b0:a8d:2b7a:ff44 with SMTP id a640c23a62f3a-a8ffab6da74mr6860466b.32.1725959280987;
        Tue, 10 Sep 2024 02:08:00 -0700 (PDT)
Date: Tue, 10 Sep 2024 11:07:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] blkif: reconcile protocol specification with in-use
 implementations
Message-ID: <ZuAMbm1xC0bV5vnC@macbook.local>
References: <20240903141923.72241-1-roger.pau@citrix.com>
 <Zthf2avsHv7XP4cs@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zthf2avsHv7XP4cs@l14>

On Wed, Sep 04, 2024 at 01:25:46PM +0000, Anthony PERARD wrote:
> On Tue, Sep 03, 2024 at 04:19:23PM +0200, Roger Pau Monne wrote:
> > Current blkif implementations (both backends and frontends) have all slight
> > differences about how they handle the 'sector-size' xenstore node, and how
> > other fields are derived from this value or hardcoded to be expressed in units
> > of 512 bytes.
> >
> > To give some context, this is an excerpt of how different implementations use
> > the value in 'sector-size' as the base unit for to other fields rather than
> > just to set the logical sector size of the block device:
> >
> >                         │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > Linux blk{front,back}   │         512         │          512           │           512
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > QEMU blkback            │     sector-size     │      sector-size       │       sector-size
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > Windows blkfront        │     sector-size     │      sector-size       │       sector-size
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > MiniOS                  │     sector-size     │          512           │           512
> >
> > An attempt was made by 67e1c050e36b in order to change the base units of the
> > request fields and the xenstore 'sectors' node.  That however only lead to more
> > confusion, as the specification now clearly diverged from the reference
> > implementation in Linux.  Such change was only implemented for QEMU Qdisk
> > and Windows PV blkfront.
> >
> > Partially revert to the state before 67e1c050e36b:
> >
> >  * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
> >    the node, backends should not make decisions based on its presence.
> >
> >  * Clarify that 'sectors' xenstore node and the requests fields are always in
> >    512-byte units, like it was previous to 67e1c050e36b.
> >
> > All base units for the fields used in the protocol are 512-byte based, the
> > xenbus 'sector-size' field is only used to signal the logic block size.  When
> > 'sector-size' is greater than 512, blkfront implementations must make sure that
> > the offsets and sizes (even when expressed in 512-byte units) are aligned to
> > the logical block size specified in 'sector-size', otherwise the backend will
> > fail to process the requests.
> >
> > This will require changes to some of the frontends and backends in order to
> > properly support 'sector-size' nodes greater than 512.
> >
> > Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sector based quantities')
> 
> Probably want to add:
> Fixes: 2fa701e5346d ("blkif.h: Provide more complete documentation of the blkif interface")
> 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/include/public/io/blkif.h | 23 ++++++++++++++---------
> >  1 file changed, 14 insertions(+), 9 deletions(-)
> >
> > diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
> > index 22f1eef0c0ca..07708f4d08eb 100644
> > --- a/xen/include/public/io/blkif.h
> > +++ b/xen/include/public/io/blkif.h
> > @@ -240,10 +240,6 @@
> >   *      The logical block size, in bytes, of the underlying storage. This
> >   *      must be a power of two with a minimum value of 512.
> 
> Should we add that "sector-size" is to be used only for request length?

Yes, that would be fine.

What about:

The logical block size, in bytes, of the underlying storage. This must
be a power of two with a minimum value of 512.  The sector size should
only be used for request segment length and alignment.

> 
> > - *      NOTE: Because of implementation bugs in some frontends this must be
> > - *            set to 512, unless the frontend advertizes a non-zero value
> > - *            in its "feature-large-sector-size" xenbus node. (See below).
> > - *
> >   * physical-sector-size
> >   *      Values:         <uint32_t>
> >   *      Default Value:  <"sector-size">
> > @@ -254,8 +250,8 @@
> >   * sectors
> >   *      Values:         <uint64_t>
> >   *
> > - *      The size of the backend device, expressed in units of "sector-size".
> > - *      The product of "sector-size" and "sectors" must also be an integer
> > + *      The size of the backend device, expressed in units of 512b.
> > + *      The product of "sector-size" * 512 must also be an integer
> >   *      multiple of "physical-sector-size", if that node is present.
> >   *
> >   *****************************************************************************
> > @@ -338,6 +334,7 @@
> >   * feature-large-sector-size
> >   *      Values:         0/1 (boolean)
> >   *      Default Value:  0
> > + *      Notes:          DEPRECATED, 12
> >   *
> >   *      A value of "1" indicates that the frontend will correctly supply and
> 
> Could you remove "correctly" from this sentence? It's misleading.

The whole feature is deprecated, so I would rather leave it as-is for
historical reference.  The added note attempts to reflect that it
should not be exposed by frontends, neither should backends make any
decisions based on its presence.

> >   *      interpret all sector-based quantities in terms of the "sector-size"
> > @@ -411,6 +408,11 @@
> >   *(10) The discard-secure property may be present and will be set to 1 if the
> >   *     backing device supports secure discard.
> >   *(11) Only used by Linux and NetBSD.
> > + *(12) Possibly only ever implemented by the QEMU Qdisk backend and the Windows
> > + *     PV block frontend.  Other backends and frontends supported 'sector-size'
> > + *     values greater than 512 before such feature was added.  Frontends should
> > + *     not expose this node, neither should backends make any decisions based
> > + *     on it being exposed by the frontend.
> >   */
> >
> >  /*
> > @@ -621,9 +623,12 @@
> >  /*
> >   * NB. 'first_sect' and 'last_sect' in blkif_request_segment, as well as
> >   * 'sector_number' in blkif_request, blkif_request_discard and
> > - * blkif_request_indirect are sector-based quantities. See the description
> > - * of the "feature-large-sector-size" frontend xenbus node above for
> > - * more information.
> > + * blkif_request_indirect are all in units of 512 bytes, regardless of whether the
> > + * 'sector-size' xenstore node contains a value greater than 512.
> > + *
> > + * However the value in those fields must be properly aligned to the logical
> > + * sector size reported by the 'sector-size' xenstore node, see 'Backend Device
> > + * Properties' section.
> >   */
> >  struct blkif_request_segment {
> 
> Textually (that is without reading it) this comment seems to only apply
> to `struct blkif_request_segment`. There is an other comment that
> separate it from `struct blkif_request` (and it is far away from
> blkif_request_discard and blkif_request_indirect). For `struct
> blkif_request.sector_number`, the only comment is "start sector idx on
> disk" but it's really hard to tell how to interpret it, it could be
> interpreted as a "sector-size" quantity because that the size of a
> sector on the disk, the underlying storage.
> 
> So, I think we need to change the comment of
> `blkif_request.sector_number`.

OK, will trim a bit the comment in blkif_request_segment then sprinkle
comments about the sectors base units in the different structures
defined below.

> 
> Another thing, there's a "type" `blkif_sector_t` defined at the beginning
> of the file, would it be worth it to add a description to it?

IMO it's better to add the description as close as possible to the
field declaration, rather than the declaration of the field type.

Thanks, Roger.

