Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8478D968AF2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 17:27:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788133.1197586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8xA-00026Q-0c; Mon, 02 Sep 2024 15:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788133.1197586; Mon, 02 Sep 2024 15:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8x9-00024W-UF; Mon, 02 Sep 2024 15:26:51 +0000
Received: by outflank-mailman (input) for mailman id 788133;
 Mon, 02 Sep 2024 15:26:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/cM=QA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sl8x8-0001IU-4A
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 15:26:50 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c53a595f-693f-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 17:26:48 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f4f2868710so46785041fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 08:26:48 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a3cdsm5369093a12.12.2024.09.02.08.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 08:26:47 -0700 (PDT)
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
X-Inumbo-ID: c53a595f-693f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725290808; x=1725895608; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mSlnrdFzEfLD31XgHue2gNdDyzNNseJg+zEpZgl5aXc=;
        b=rfIYUAd/WLjI6vp58Srv6wnWOBJ89fDGsmznWYxw8nne5BPOqPwwds2vs512/pp0xw
         nHDUp6nZ7SWZtwbUcAFCL9OoaUw9ng4lwWg3gC/I/+B3Y/v7lt2jn76+ReoPI3CxAWcH
         V+7ewfCPJIVuNOC1ZIANf5dKYIc5I9PcJMds8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290808; x=1725895608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSlnrdFzEfLD31XgHue2gNdDyzNNseJg+zEpZgl5aXc=;
        b=P8xRued5rAp85NJejBXxro3kpDdULgESHWE7dgiVu4l9tonY4bw5a8iA0rpT6yO/gO
         FUUzElkl1om3/ta0stVzv+oIacqUXekTDF2mATsg4KfjfGAzu2mpGoEHLrrQMew6viWx
         XPo5eeKMGVGwG6YPbDNIs87jRH33KvxsD8oJPzsISbYOjb5hOhuffRuaz7MwgKrfUgl6
         C2itZlKenXnelHgv/jF0kOqSUBZaKatKGsEsWuEy5xTYh4feb5SUuqUQSuKa801gxf3x
         2Z+Z4pntWBw8PubSgGJpKmWEkzK8eZIzetQZ43ag8oFgADIm9WyiBs1GReJ9M2uW1ci1
         KbXg==
X-Forwarded-Encrypted: i=1; AJvYcCX9v71gv8vpbHhsolqoy4kQovOfz+VEDgkkrlnRI7LmTREg0Lj3xlvAodEmqGFhOX/4t3PX5W/AyOY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwH1HH8i8nRH4AsdevzZNpd5YUML3q85ylvhpS8EPlk1Et+AM3p
	jilmXW6KK+MrMDNvYBPCPqyXOJUHENG4e/sFW74RsIR74LeUXGaRm0IEhN+gPbVpeC5YwcK3go0
	t
X-Google-Smtp-Source: AGHT+IEh6J9aIZsKrVoYkkgq1PLUen6iGjgFql7YBocAjthaCaCpui/Scil1rwq48GHr2E8DNRvQGQ==
X-Received: by 2002:a2e:a548:0:b0:2f3:f339:e68d with SMTP id 38308e7fff4ca-2f64440e5a9mr2880891fa.15.1725290807433;
        Mon, 02 Sep 2024 08:26:47 -0700 (PDT)
Date: Mon, 2 Sep 2024 17:26:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Mark Syms <mark.syms@cloud.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Owen Smith <owen.smith@cloud.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Block protocol incompatibilities with 4K logical sector size
 disks
Message-ID: <ZtXZNs2iYT5R-KjE@macbook.local>
References: <ZtBUnzH4sIrFAo0f@macbook.local>
 <ZtB0fMRCGajdcfap@l14>
 <ZtCW9Qq9k8UQ-jJC@macbook.local>
 <ZtHus/ytlA1UnHEI@l14>
 <ZtV9hteu_sVyvnih@macbook.local>
 <CAPYKksUiSqakVWFbA68VowxHyt5LR3KXBuOqYQ0zbODz98a5rA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPYKksUiSqakVWFbA68VowxHyt5LR3KXBuOqYQ0zbODz98a5rA@mail.gmail.com>

On Mon, Sep 02, 2024 at 03:50:17PM +0100, Mark Syms wrote:
> On Mon, 2 Sept 2024 at 09:55, Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > > So yes, after more research, having sector in the protocol been a
> > > 512-byte size seems the least bad option. "sector_number" and
> > > "{first,last}_sect" have been described as is for a long while. Only
> > > "sectors" for the size has been described as a "sector-size" quantity.
> >
> > Thanks for your input.  I would also like to hear from the blktap and
> > Windows PV drivers maintainers, as the change that I'm proposing here
> > will require changes to their implementations.
> 
> Well, that's a whole big mess isn't it ;( FWIW, it's tacitly assumed
> that tapdisk is only running on 512 or 512e storage as its primary use
> case is VHD and that driver explodes spectacularly on 4KN. So,
> hardening those implicit conditions into hard explicit ones seems like
> an entirely reasonable thing.

OK, so I take you are fine with the adjustments to the protocol being
suggested here, and will be happy to adjust blktap if/when required to
meet them (if it ever supports exposing 4K sector sized disks).

Thanks for the feedback, will Cc you on the patch to blkif.h for one
extra review if possible.

Roger.

