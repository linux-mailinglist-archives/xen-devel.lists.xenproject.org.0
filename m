Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFF696B7D3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 12:07:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790001.1199698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmuo-0006pV-Jq; Wed, 04 Sep 2024 10:07:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790001.1199698; Wed, 04 Sep 2024 10:07:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slmuo-0006mR-GS; Wed, 04 Sep 2024 10:07:06 +0000
Received: by outflank-mailman (input) for mailman id 790001;
 Wed, 04 Sep 2024 10:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+MPF=QC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1slmun-0006mL-2x
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 10:07:05 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e8d7cdb-6aa5-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 12:07:03 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a86acbaddb4so765253966b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 03:07:03 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989221c63sm780060066b.201.2024.09.04.03.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:07:01 -0700 (PDT)
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
X-Inumbo-ID: 6e8d7cdb-6aa5-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725444422; x=1726049222; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lVovp51O74XXRrCXSt1KD650t0A+yO+VaQJVr5nL3lM=;
        b=auzR2NptjUJ1d4BiwG7RoJLWJ1gSwIucvgFIdZoc6KtHhS2IFUCwSdFtCTUkjRxfj/
         eLSrQWI5zbdJc/9jN2gsgLZEZBoNSjLVbYpZ05FNiHxioTB08aOCVuuI7eRn+Onjlz4o
         yggWrD61eqBvDShKT3tEsMtDpZphWczjClS9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725444422; x=1726049222;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVovp51O74XXRrCXSt1KD650t0A+yO+VaQJVr5nL3lM=;
        b=hLJAfnoNbYn/Rj1OXt6e2jCleSSSUL0xDvXOgfCpP38Oez36Hz+wsNwCHUdSfcKDvl
         ZzHw2UjTFp4bRvpUE0pproX+zzWd+er7WpvOc9pQHmU1g2JycV8dFuaha50MpUmFIxnz
         55d0Tk8eLcvLlRaNJJeggRJKq+MPCvOu13qAghbn8ZT/qGUeJupxcK6AarPkltZXHMpF
         qjAsJ9gCT5kit3qWUmOYIpeotJePsyAAarUPRaW3cdjvFYUv5Z+jbKB+x9PDhdjtFoBx
         MfslR8dHmuverqq2xok7fxj+3lDrCi47LB0DWIw6vF/mdfbmmX8MgenedS2e7Zqel8Xp
         jNVA==
X-Forwarded-Encrypted: i=1; AJvYcCUR11TbrAFemVd0/2gcIQlxc/WM444Iu23QqtvVxXKeY9hAR/UbA+qHrxogvluQTPxbvVdUHen+aQM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxR8DoPvOqqS3a0mIIhvwniAlHw6VuHdk6R4JQMPrHF3cKsxIqN
	o1MSGnPznhKJxRSIAvQNe3Ra3g76ynthDiNUqxHNqhfmB6DZeLUQR7nNJJFoKnM=
X-Google-Smtp-Source: AGHT+IHUqxRlbTwp1lbp+c6WHkqPRR19c2OEAsDRMMee+WxMrw5XCVwkFVZDCkKMnEMW3QPMzduZsQ==
X-Received: by 2002:a17:907:7b9f:b0:a86:820e:2ac6 with SMTP id a640c23a62f3a-a897f84d6a9mr1420217366b.22.1725444421333;
        Wed, 04 Sep 2024 03:07:01 -0700 (PDT)
Date: Wed, 4 Sep 2024 12:07:00 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>,
	Mark Syms <mark.syms@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: Re: [PATCH] blkif: reconcile protocol specification with in-use
 implementations
Message-ID: <ZtgxRC2bJ-J3rBIe@macbook.local>
References: <20240903141923.72241-1-roger.pau@citrix.com>
 <99b15fe5-34e0-44e4-a351-d510ae67b5a4@suse.com>
 <ZtgYnAeXSamlGKgC@macbook.local>
 <ce9fea63-c618-4825-b30c-dfd3e1818a9c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce9fea63-c618-4825-b30c-dfd3e1818a9c@suse.com>

On Wed, Sep 04, 2024 at 11:31:08AM +0200, Jan Beulich wrote:
> On 04.09.2024 10:21, Roger Pau Monné wrote:
> > On Tue, Sep 03, 2024 at 04:36:37PM +0200, Jan Beulich wrote:
> >> On 03.09.2024 16:19, Roger Pau Monne wrote:
> >>> Current blkif implementations (both backends and frontends) have all slight
> >>> differences about how they handle the 'sector-size' xenstore node, and how
> >>> other fields are derived from this value or hardcoded to be expressed in units
> >>> of 512 bytes.
> >>>
> >>> To give some context, this is an excerpt of how different implementations use
> >>> the value in 'sector-size' as the base unit for to other fields rather than
> >>> just to set the logical sector size of the block device:
> >>>
> >>>                         │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
> >>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> >>> FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
> >>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> >>> Linux blk{front,back}   │         512         │          512           │           512
> >>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> >>> QEMU blkback            │     sector-size     │      sector-size       │       sector-size
> >>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> >>> Windows blkfront        │     sector-size     │      sector-size       │       sector-size
> >>> ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> >>> MiniOS                  │     sector-size     │          512           │           512
> >>>
> >>> An attempt was made by 67e1c050e36b in order to change the base units of the
> >>> request fields and the xenstore 'sectors' node.  That however only lead to more
> >>> confusion, as the specification now clearly diverged from the reference
> >>> implementation in Linux.  Such change was only implemented for QEMU Qdisk
> >>> and Windows PV blkfront.
> >>>
> >>> Partially revert to the state before 67e1c050e36b:
> >>>
> >>>  * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
> >>>    the node, backends should not make decisions based on its presence.
> >>>
> >>>  * Clarify that 'sectors' xenstore node and the requests fields are always in
> >>>    512-byte units, like it was previous to 67e1c050e36b.
> >>>
> >>> All base units for the fields used in the protocol are 512-byte based, the
> >>> xenbus 'sector-size' field is only used to signal the logic block size.  When
> >>> 'sector-size' is greater than 512, blkfront implementations must make sure that
> >>> the offsets and sizes (even when expressed in 512-byte units) are aligned to
> >>> the logical block size specified in 'sector-size', otherwise the backend will
> >>> fail to process the requests.
> >>>
> >>> This will require changes to some of the frontends and backends in order to
> >>> properly support 'sector-size' nodes greater than 512.
> >>>
> >>> Fixes: 67e1c050e36b ('public/io/blkif.h: try to fix the semantics of sector based quantities')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Following the earlier discussion, I was kind of hoping that there would be
> >> at least an outline of some plan here as to (efficiently) dealing with 4k-
> >> sector disks.
> > 
> > What do you mean with efficiently?
> > 
> > 4K disks will set 'sector-size' to 4096, so the segments setup by the
> > frontends in the requests will all be 4K aligned (both address and
> > size).
> 
> Will they, despite granularity then being 512b?

The added text to blkif.h states:

"However the value in those fields must be properly aligned to the logical
sector size reported by the 'sector-size' xenstore node, see 'Backend Device
Properties' section."

'those fields' in the text above refers to the sector based offsets
and sizes in blkif_request & other ring structs.  So while the base
units of the fields are 512-byte based, the resulting offsets and
sizes should be aligned to the value in 'sector-size'.

> Perhaps I misunderstood the proposal then, and you're retaining the
> ability to have "sector-size" != 512, just that any I/O done is not
> supposed to consider that setting.

No, I/O is supposed to consider that setting, is just that the base
unit in the ring structures will always be 512-byte based, regardless
of what 'sector-size' contains.

> I guess I mis-read the 2nd to last
> paragraph of the description; I'm sorry. "even when expressed in 512-
> byte units" reads to me as if other units are permissible. Maybe it
> was really meant to be "despite being expressed in 512-byte units"?

Sure, I will adjust the commit message.

Thanks, Roger.

