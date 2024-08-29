Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D966B964277
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 13:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785652.1195135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjcsW-0002Ov-Rl; Thu, 29 Aug 2024 10:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785652.1195135; Thu, 29 Aug 2024 10:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjcsW-0002NQ-Ok; Thu, 29 Aug 2024 10:59:48 +0000
Received: by outflank-mailman (input) for mailman id 785652;
 Thu, 29 Aug 2024 10:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9f7=P4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjcsU-0002NI-UH
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 10:59:46 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd3ce7a2-65f5-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 12:59:45 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a86933829dcso57158066b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 03:59:45 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f612sm64569666b.71.2024.08.29.03.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:59:44 -0700 (PDT)
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
X-Inumbo-ID: cd3ce7a2-65f5-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724929185; x=1725533985; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgXKstaAqWTNUSiEc4ABlxl59g3dFOxxAOyfDM5fp/Y=;
        b=S3xbgTJKZf2fPuQQS2yq2tLZdLZacKKNHjHNenXBfDeESnMA1T5ITbMgY1tJoVl1Yv
         EvO3zcr6tuiNRpNiPgV8jG5b3txe5DfngPGTtxT/ea0Jit5yFbwu7zxLBoZjryavU67B
         FoMRPOMvENjNdzZHvwJEB/Gl/ZDJj3mtgknWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929185; x=1725533985;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WgXKstaAqWTNUSiEc4ABlxl59g3dFOxxAOyfDM5fp/Y=;
        b=fW7N1yInRp61rJc5s1EszXuslETvCQzP4U4B3q1CEj89oa47+f9WFbpuclnDNk2Ybq
         cSj1gBn2qU3e+bIrS79JMyUVgGUiS1SefwgekRm7VVUVppExSTZVv+Dg+/qwCDQGPIX2
         kv86yXFz1RQ+vWOhYDv1aqIQGBim+ftIGc8/harBph0Yz9sH/nvFlOcd3qvjX/FRE6F1
         HfG34MGO4j4PqfePnrVp9Cpbl0ciHsY5KcIOP8mjRvx6w5wvGSR6ghPsoM26dlydB5Cc
         doasICUaJGhsfkqO/fbwnOXL57P9HEkrrQ4emWkpECNL2gDP+IJnC7JkUEVtXAp9cX1b
         1NyA==
X-Gm-Message-State: AOJu0YyTWIBUf4Svn8TFLytOSZmyhJZZXlmBM4PnfiXCIVhPbIUiMypp
	49aomWvvlh2VAkbX7ae3hz05Qm7/Jc2kczcbQvbuCP1bWVZgYszzlTLn9C225rbkO/iLTpBtAcA
	k
X-Google-Smtp-Source: AGHT+IH78T8MzzWY84T8oRuoa9W3JaKb3WBKdUy2RTpJRejBho/SVdUFL0qoBWz+vkt7nlhJs/aYpw==
X-Received: by 2002:a17:907:3daa:b0:a7a:9144:e256 with SMTP id a640c23a62f3a-a897f778b9amr202392166b.6.1724929184385;
        Thu, 29 Aug 2024 03:59:44 -0700 (PDT)
Date: Thu, 29 Aug 2024 12:59:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>,
	Mark Syms <mark.syms@citrix.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Block protocol incompatibilities with 4K logical sector size disks
Message-ID: <ZtBUnzH4sIrFAo0f@macbook.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello,

To give some context, this started as a bug report against FreeBSD failing to
work with PV blkif attached disks with 4K logical sectors when the backend is
Linux kernel blkback:

https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=280884

Further investigation has lead me to discover that the protocol described in
the public blkif.h header is not implemented uniformly, and there are major
inconsistencies between implementations regarding the meaning of the `sectors`
and `sector-size` xenstore nodes, and the sector_number and {first,last}_sect
struct request fields.  Below is a summary of the findings on the
implementation I've analyzed.

Linux blk{front,back} always assumes the `sectors` xenstore node to be in 512b
units, regardless of the value of the `sector-size` node.  Equally the ring
request sector_number and the segments {first,last}_sect fields are always
assumed to be in units of 512b regardless of the value of `sector-size`.  The
`feature-large-sector-size` node is neither exposed by blkfront, neither
checked by blkback before exposing a `sector-size` node different than 512b.

FreeBSD blk{front,back} calculates (and for blkback exposes) the disk size as
`sectors` * `sector-size` based on the values in the xenstore nodes (as
described in blkif.h).  The ring sector_number is filled with the sector number
based on the `sector-size` value, however the {first,last}_sect fields are
always calculated as 512b units.   The `feature-large-sector-size` node is
neither exposed by blkfront, neither checked by blkback before exposing a
`sector-size` node different than 512b.

QEMU qdisk blkback implementation exposes the `sectors` disk size in units of
`sector-size` (as FreeBSD blkback).  The ring structure fields sector_number
and {first,last}_sect are assumed to be in units of `sector-size`.  This
implementation will not expose a `sector-size` node with a value different than
512 unless the frontend xenstore path has the `feature-large-sector-size` node
present.

Windows blkfront calculates the disk size as `sectors` * `sector-size` from the
xenstore nodes exposed by blkback.   The ring structure fields sector_number
and {first,last}_sect are assumed to be in units of `sector-size`.  This
frontend implementation exposes `feature-large-sector-size`.

When using a disk with a logical sector size different than 512b, Linux is only
compatible with itself, same for FreeBSD.  QEMU blkback implementation is also
only compatible with the Windows blkfront implementation.  The
`feature-large-sector-size` seems to only be implemented for the QEMU/Windows
combination, both Linux and FreeBSD don't implement any support for it neither
in the backend or the frontend.

The following table attempts to summarize in which units the following fields
are defined for the analyzed implementations (please correct me if I got some
of this wrong):

                        │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
Linux blk{front,back}   │         512         │          512           │           512
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
QEMU blkback            │     sector-size     │      sector-size       │       sector-size
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
Windows blkfront        │     sector-size     │      sector-size       │       sector-size
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
MiniOS                  │     sector-size     │          512           │           512
────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
tapdisk blkback         │         512         │      sector-size       │           512

It's all a mess, I'm surprised we didn't get more reports about brokenness when
using disks with 4K logical sectors.

Overall I think the in-kernel backends are more difficult to update (as it
might require a kernel rebuild), compared to QEMU or blktap.  Hence my slight
preference would be to adjust the public interface to match the behavior of
Linux blkback, and then adjust the implementation in the rest of the backends
and frontends.

There was an attempt in 2019 to introduce a new frontend feature flag to signal
whether the frontend supported `sector-size` xenstore nodes different than 512 [0].
However that was only ever implemented for QEMU blkback and Windows blkfront,
all the other backends will expose `sector-size` different than 512 without
checking if `feature-large-sector-size` is exposed by the frontend.  I'm afraid
it's now too late to retrofit that feature into existing backends, seeing as
they already expose `sector-size` nodes greater than 512 without checking if
`feature-large-sector-size` is reported by the frontend.

My proposal would be to adjust the public interface with:

 * Disk size is calculated as: `sectors` * 512 (`sectors` being the contents of
   such xenstore backend node).

 * All the sector related fields in blkif ring requests use a 512b base sector
   size, regardless of the value in the `sector-size` xenstore node.

 * The `sector-size` contains the disk logical sector size.  The frontend must
   ensure that all request segments addresses are aligned and it's length is
   a multiple of such size.  Otherwise the backend will refuse to process the
   request.

Regards, Roger.

[0] https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=67e1c050e36b2c9900cca83618e56189effbad98

