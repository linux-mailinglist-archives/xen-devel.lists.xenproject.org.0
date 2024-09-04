Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6303596B45B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 10:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789900.1199567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sllGz-00040K-EO; Wed, 04 Sep 2024 08:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789900.1199567; Wed, 04 Sep 2024 08:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sllGz-0003xv-Bj; Wed, 04 Sep 2024 08:21:53 +0000
Received: by outflank-mailman (input) for mailman id 789900;
 Wed, 04 Sep 2024 08:21:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sllGy-0003xp-0F
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 08:21:52 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc208483-6a96-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 10:21:50 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a868b8bb0feso754633666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 01:21:50 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989022481sm774335866b.86.2024.09.04.01.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 01:21:49 -0700 (PDT)
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
X-Inumbo-ID: bc208483-6a96-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725438110; x=1726042910; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWMGsOdiAnlrwhR9aAo2YUHbM7wmzPcGcjQ8EclcVf0=;
        b=Ow2gtUciW7vGVHLHtMJmvNoo1zGkDG4mH/fmGGBjEP0CLE0zEMS0Qn+XwVsL5DDjtw
         YHVtHUWOaXw9IDwMHpPWgT4k162kpr4XFonvQ+tkREUbheKZSImZTlhLkg4vFbjYDfmr
         momU0zmY7h4OlqHAgJC3N0cKUp1lodlQhR0qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725438110; x=1726042910;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWMGsOdiAnlrwhR9aAo2YUHbM7wmzPcGcjQ8EclcVf0=;
        b=cdnPAF+HVD+Bx9W9QwFC0vQ1sDub2hwjCV1Rwnby/9djYaHPdovEIkJkrGtyIxr0g6
         pAZKcFrzqgck7xY8bUWj5szhErmMzRP0zYxrFKAqqgon/oXjC0WhTKLdITLZw6grfp8W
         IFGp/sYlSzhF6CHXMNRc1n5+yWULsVHdjF+hAFfXrvXQvtfeAh3mAtV6fgY40p9R3nDO
         wLdSAHz30nkUw5Nq7PV5kDVempN16twxVW2za72x1Ro3slFjw3cdzsOFzkR1Tp7R0ms9
         lltiWzh93YE7/kyOURWR/QBE0tw/rVzYDfivnLJ0pz3X5PZtiuf3J06/XC4YR90eSuJQ
         hOHA==
X-Forwarded-Encrypted: i=1; AJvYcCV7UfSJ6YzFWJn7/i7/A/f2RD6gKOKz9EAmQrczShcY8xe/Ec05D0zaNTvpVTtE6kqKiY+JpoWFyPk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxx5Q0H3D/81OSrX7TA083rpDpMB01mqk6koJOIoBU9ZS+t8HZF
	zrqAsbY7BPIdy4RMypMxAMM/Aa6KGzFNlEby/nR4cEM32AH1TrUxLg88PrAPFVM=
X-Google-Smtp-Source: AGHT+IGsUb427F+M49i5cBJp0kJwAdThrSOAGr4LNMWaZxamY/id4366Kk2vNmM7AdMIJz64PHlDIQ==
X-Received: by 2002:a17:907:720f:b0:a7a:9144:e24c with SMTP id a640c23a62f3a-a89a3500b22mr1167969466b.9.1725438109752;
        Wed, 04 Sep 2024 01:21:49 -0700 (PDT)
Date: Wed, 4 Sep 2024 10:21:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>,
	Mark Syms <mark.syms@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] blkif: reconcile protocol specification with in-use
 implementations
Message-ID: <ZtgYnAeXSamlGKgC@macbook.local>
References: <20240903141923.72241-1-roger.pau@citrix.com>
 <99b15fe5-34e0-44e4-a351-d510ae67b5a4@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99b15fe5-34e0-44e4-a351-d510ae67b5a4@suse.com>

On Tue, Sep 03, 2024 at 04:36:37PM +0200, Jan Beulich wrote:
> On 03.09.2024 16:19, Roger Pau Monne wrote:
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
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Following the earlier discussion, I was kind of hoping that there would be
> at least an outline of some plan here as to (efficiently) dealing with 4k-
> sector disks.

What do you mean with efficiently?

4K disks will set 'sector-size' to 4096, so the segments setup by the
frontends in the requests will all be 4K aligned (both address and
size).  Every segment will fill a full blkif_request_segment (making
the last_sect field kind of pointless).

> In the absence of that I'm afraid it is a little harder to
> judge whether the proposal here is the best we can do at this point.

While I don't mind looking at what we can do to better handle 4K
sector disks, we need IMO to revert to the specification before
67e1c050e36b, as that change switched the hardcoded sector based units
from 512 to 'sector-size', thus breaking the existing ABI.

Thanks, Roger.

