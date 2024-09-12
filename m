Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 850B6976991
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 14:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797442.1207393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojHD-0003TZ-NE; Thu, 12 Sep 2024 12:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797442.1207393; Thu, 12 Sep 2024 12:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojHD-0003Rb-KR; Thu, 12 Sep 2024 12:50:23 +0000
Received: by outflank-mailman (input) for mailman id 797442;
 Thu, 12 Sep 2024 12:50:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HbDX=QK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sojHC-0003RQ-Bb
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 12:50:22 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91c0b82d-7105-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 14:50:20 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2f763e9e759so10349501fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 05:50:20 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76dc7sm6420533a12.60.2024.09.12.05.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2024 05:50:18 -0700 (PDT)
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
X-Inumbo-ID: 91c0b82d-7105-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726145420; x=1726750220; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTARn9IpvMg3w/3g/Acpn+vfjDoZXNvmkOYaeyYbUu8=;
        b=tAiV8uRIWXahvehIkFtKM6SfiHAzT6L9nGM7WukG06h40W1HPI38r5XZT+/aDopeC8
         r7iXD9E9vPnyX6vLwpXADLce3h0fo0ugXy43QDvBNTSnom0r2s4q+BM6X7beN3cGBGcj
         tBv6yEGxHTq2EDVGmHIjKTERyNaIieftY6zDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726145420; x=1726750220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTARn9IpvMg3w/3g/Acpn+vfjDoZXNvmkOYaeyYbUu8=;
        b=vBW/m+J78m8S/EGsKLcl/IXegSDD9+z6OgNSwjyy0ARMi194NB2J3MDzMjwRyMk3uP
         211X6ICgvCvqG0+Xpvm1MgdhU0bpffa6NTt1rthcimdXKEyQ1amdsoBUc8lAL4IO1N5U
         /gffFomHSrsE4MksAS9q9h4Zxcier/v+kC/yhAZ0LxSVvMmQXoAGfZ/6Fpw0hYB8B3UF
         sLge64AyWxT0kTQM+ILuTn8UIO5X/UUq2CMw+7XbZq2myRZyPoyTy1atLymMQcXRwTVu
         9IasjGu6XU/Q0tOn+WetZJNZubm5YtcQJHmgiqppnKkEsFPoMr2gGo6m0EZwKSh/z77W
         JSzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1DeqzGE851rc/8zeq0+h3MIJVhlhN5dqDdUm/r4zKzTmReMYNc35U4h70C5nKRCvftzd4uYiKALI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9fWN3xz7koc8eewcaO/ddrhTXTrmwX/FC4wCPbsBEVAr728zU
	4aI0PHdKxL3QphsvDl7S6iBv2AzvnwZFv+v4x9xmh9ytnUzFiN+2JOBhUVcIRDk=
X-Google-Smtp-Source: AGHT+IGIbn5V9j1/2MAHBQEpQ3sAT25qiZ4Xa6nw/+Ntk73CCTaZeqQid9IRuTZc9TafFFMLNjGxnA==
X-Received: by 2002:a2e:bc03:0:b0:2f7:5519:7130 with SMTP id 38308e7fff4ca-2f787f3ba43mr14948621fa.31.1726145419352;
        Thu, 12 Sep 2024 05:50:19 -0700 (PDT)
Date: Thu, 12 Sep 2024 14:50:17 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Paul Durrant <paul@xen.org>, Owen Smith <owen.smith@cloud.com>,
	Mark Syms <mark.syms@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] blkif: reconcile protocol specification with in-use
 implementations
Message-ID: <ZuLjifg2KiKfAZpp@macbook.local>
References: <20240912095729.25927-1-roger.pau@citrix.com>
 <a82d2493-c347-4519-a454-59349df1e62e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a82d2493-c347-4519-a454-59349df1e62e@suse.com>

On Thu, Sep 12, 2024 at 02:06:23PM +0200, Jan Beulich wrote:
> On 12.09.2024 11:57, Roger Pau Monne wrote:
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
> > Partially revert to the state before 67e1c050e36b while adjusting the
> > documentation for 'sectors' to match what it used to be previous to
> > 2fa701e5346d:
> > 
> >  * Declare 'feature-large-sector-size' deprecated.  Frontends should not expose
> >    the node, backends should not make decisions based on its presence.
> > 
> >  * Clarify that 'sectors' xenstore node and the requests fields are always in
> >    512-byte units, like it was previous to 2fa701e5346d and 67e1c050e36b.
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
> > Reviewed-by: Juergen Gross <jgross@suse.com>
> > Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
> 
> The Fixes: tags generally suggest this wants backporting. I'm a little uncertain
> here though, as it won't really affect anything that is built. Opinions?

I would suggest to backport to open release branches, as people
working on protocol implementations might not use the headers from
unstable, but rather from the last release.

Thanks, Roger.

