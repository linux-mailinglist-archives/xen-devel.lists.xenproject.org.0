Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D5597393A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 15:59:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795620.1205023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1Oe-0005dF-SA; Tue, 10 Sep 2024 13:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795620.1205023; Tue, 10 Sep 2024 13:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so1Oe-0005bi-PK; Tue, 10 Sep 2024 13:59:08 +0000
Received: by outflank-mailman (input) for mailman id 795620;
 Tue, 10 Sep 2024 13:59:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EW7V=QI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1so1Od-0005bc-Hr
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 13:59:07 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7516b62-6f7c-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 15:59:05 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53653682246so1004378e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 06:59:05 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cf03fcsm482014766b.162.2024.09.10.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 06:59:03 -0700 (PDT)
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
X-Inumbo-ID: d7516b62-6f7c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725976744; x=1726581544; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KLqvFMU5GeXbkdhd5ykmsviJAtUlYaaSpTD/zNcRYXI=;
        b=wVby7P0jAef4L2sDg4zejKnd27x1N2Kn25pOYF/SiWcw6YR4d4+gi7yioRanuWc7oU
         DS6BL4w7rXvhPg2VhGMqzhM1LnsTzJWos542wbM57PnKb2++orFZ1Hwqz95siPxY9GeA
         EDEHQ1duTXev4WeFZrqT7DhrvZl1btKBfqWSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725976745; x=1726581545;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KLqvFMU5GeXbkdhd5ykmsviJAtUlYaaSpTD/zNcRYXI=;
        b=xPmrTyykTgKaEA3Ec11blD1w8qmNauUe5azZJd8bVa6phkSYd2yODYDLkZ3fS5Aa/B
         dL9weldd1SJ0AGXW1NERAQfHWJcZBKyusq7X9WnGbmy74tNqIXTMFsapRzapir7uRzk8
         8hxCOAW17tQhZE1n45+sXYHeoKtj3Hjc9VyiSJvGEzr4mEWV/nvI9zxXmjByUAUMcqS1
         +NZ3LyeD4YSLMRjRSIKLDlhkxJhd6C44FMbq+8Qdq129tzYppxWi2/m+RAGRZNAZ8aNm
         oS+aDX/wucRcsJ9Jp7vtX0eDc9z/YRH6msJnh0uw+/hkM4CHqHCmvSXlK/bShKd6Shk2
         qJyg==
X-Gm-Message-State: AOJu0Yybk/5wqU+q8ZYwcliHrDx6YVTci8zJ7z4dQi/B/Q1svvV60hEl
	3/5bm67IA3bPSI35ND0QrHOhiARC1QsqEyUmTrVsYalYrrhYctxbg6xTiQ7DVEM=
X-Google-Smtp-Source: AGHT+IGvNQWwJHO7Gcayp1Hzo38IoIKMSnt4dl3t87cOIzzfieGB5MVuo9QIcUDyNpdulxOFBNZ1SA==
X-Received: by 2002:a05:6512:ba0:b0:52e:9b92:4990 with SMTP id 2adb3069b0e04-536587b40cdmr10123482e87.32.1725976744246;
        Tue, 10 Sep 2024 06:59:04 -0700 (PDT)
Date: Tue, 10 Sep 2024 15:59:02 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] blkif: reconcile protocol specification with in-use
 implementations
Message-ID: <ZuBQpkcutUgFxfnd@macbook.local>
References: <20240910114604.13194-1-roger.pau@citrix.com>
 <2e7d1bf6-443b-41a3-b97a-072461f71db5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e7d1bf6-443b-41a3-b97a-072461f71db5@suse.com>

On Tue, Sep 10, 2024 at 03:46:00PM +0200, Jürgen Groß wrote:
> On 10.09.24 13:46, Roger Pau Monne wrote:
> > Current blkif implementations (both backends and frontends) have all slight
> > differences about how they handle the 'sector-size' xenstore node, and how
> > other fields are derived from this value or hardcoded to be expressed in units
> > of 512 bytes.
> > 
> > To give some context, this is an excerpt of how different implementations use
> > the value in 'sector-size' as the base unit for to other fields rather than
> > just to set the logical sector size of the block device:
> > 
> >                          │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
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
> > Partially revert to the state before 67e1c050e36b while adjusting the
> > documentation for 'sectors' to match what it used to be previous to
> > 2fa701e5346d:
> > 
> >   * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
> >     the node, backends should not make decisions based on its presence.
> > 
> >   * Clarify that 'sectors' xenstore node and the requests fields are always in
> >     512-byte units, like it was previous to 2fa701e5346d and 67e1c050e36b.
> > 
> > All base units for the fields used in the protocol are 512-byte based, the
> > xenbus 'sector-size' field is only used to signal the logic block size.  When
> > 'sector-size' is greater than 512, blkfront implementations must make sure that
> > the offsets and sizes (despite being expressed in 512-byte units) are aligned
> > to the logical block size specified in 'sector-size', otherwise the backend
> > will fail to process the requests.
> > 
> > This will require changes to some of the frontends and backends in order to
> > properly support 'sector-size' nodes greater than 512.
> > 
> > Fixes: 2fa701e5346d ('blkif.h: Provide more complete documentation of the blkif interface')
> > Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sector based quantities')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > Changes since v1:
> >   - Update commit message.
> >   - Expand comments.
> > ---
> >   xen/include/public/io/blkif.h | 50 ++++++++++++++++++++++++++---------
> >   1 file changed, 38 insertions(+), 12 deletions(-)
> > 
> > diff --git a/xen/include/public/io/blkif.h b/xen/include/public/io/blkif.h
> > index 22f1eef0c0ca..da893eb379db 100644
> > --- a/xen/include/public/io/blkif.h
> > +++ b/xen/include/public/io/blkif.h
> > @@ -237,12 +237,16 @@
> >    * sector-size
> >    *      Values:         <uint32_t>
> >    *
> > - *      The logical block size, in bytes, of the underlying storage. This
> > - *      must be a power of two with a minimum value of 512.
> > + *      The logical block size, in bytes, of the underlying storage. This must
> > + *      be a power of two with a minimum value of 512.  The sector size should
> > + *      only be used for request segment length and alignment.
> >    *
> > - *      NOTE: Because of implementation bugs in some frontends this must be
> > - *            set to 512, unless the frontend advertizes a non-zero value
> > - *            in its "feature-large-sector-size" xenbus node. (See below).
> > + *      When exposing a device that uses 4096 logical sector sizes, the only
> 
> s/uses 4096 logical sector sizes/uses a logical sector size of 4096/

Yes, that's better.

> > + *      difference xenstore wise will be that 'sector-size' (and possibly
> > + *      'physical-sector-size' if supported by the backend) will be 4096, but
> > + *      the 'sectors' node will still be calculated using 512 byte units.  The
> > + *      sector base units in the ring requests fields will all be 512 byte
> > + *      based despite the logical sector size exposed in 'sector-size'.
> >    *
> >    * physical-sector-size
> >    *      Values:         <uint32_t>
> > @@ -254,8 +258,8 @@
> >    * sectors
> >    *      Values:         <uint64_t>
> >    *
> > - *      The size of the backend device, expressed in units of "sector-size".
> > - *      The product of "sector-size" and "sectors" must also be an integer
> > + *      The size of the backend device, expressed in units of 512b.
> > + *      The product of "sector-size" * 512 must also be an integer
> 
> DYM: The product of "sectors" * 512 must also be an integer ... ?

Indeed.

Thanks, Roger.

