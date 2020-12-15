Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D3B2DB0B7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:00:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54353.94386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCkY-0007wb-BA; Tue, 15 Dec 2020 16:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54353.94386; Tue, 15 Dec 2020 16:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCkY-0007wC-7i; Tue, 15 Dec 2020 16:00:30 +0000
Received: by outflank-mailman (input) for mailman id 54353;
 Tue, 15 Dec 2020 16:00:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpCkW-0007vo-Rp
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:00:28 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77496efb-9335-4a90-ab04-9812846fb068;
 Tue, 15 Dec 2020 16:00:28 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a6so17339075wmc.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 08:00:28 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id o13sm35484610wmc.44.2020.12.15.08.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 08:00:26 -0800 (PST)
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
X-Inumbo-ID: 77496efb-9335-4a90-ab04-9812846fb068
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KyopMRbfgwAezlKBm0gOz4p+tD0YFM8rVdny59R6zWU=;
        b=WKFotyJcebdG5C0e4C2FDwUJiblZHjD2NPmiQ39ClQwor50hyzmbqrCYoJVHL8PCad
         sAjsWkLAxF6oUv4vNvPN1uiUgpqPJ6FKNvyzkencbPMp46ZneZ3XaaJHr6+rBnTBpkca
         QNGV+do/66bqQPIWzN5uqd6iiyX5TzWcSaDcO0RmR/+UV9twYqs9tR+XP3iknL8Lkqlf
         5LaTBAkbTjWna1fZqBSCwYjHvl2u/KrJdatt3kd0/M16Hwl/SUaliNpaS5MM8hL6TryL
         C8w+GNnBEvPSnfw6GM1z2Sfi4o22lENvNxebMFnB5oFob8lup59NDZ08mx9qnQLOwzi5
         OBcQ==
X-Gm-Message-State: AOAM5311oiTNaHYYj+YSTE9kg9J9kwgnLPG14zIH0utX7KGEsYmlvyDC
	E6W6LnM1aXdSoHnfiwP0Wik=
X-Google-Smtp-Source: ABdhPJy4myQNC532aK6f0lZnx6f/7kHVrjYCq8q+aor+ciAldauHLl0xpkFipCOImbKJb98jrEXxBw==
X-Received: by 2002:a1c:3cd5:: with SMTP id j204mr32942392wma.53.1608048027450;
        Tue, 15 Dec 2020 08:00:27 -0800 (PST)
Date: Tue, 15 Dec 2020 16:00:25 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v6 02/25] xl: s/pcidev/pci where possible
Message-ID: <20201215160025.hlasdl7yijl43baz@liuwe-devbox-debian-v2>
References: <20201208193033.11306-1-paul@xen.org>
 <20201208193033.11306-3-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208193033.11306-3-paul@xen.org>
User-Agent: NeoMutt/20180716

On Tue, Dec 08, 2020 at 07:30:10PM +0000, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> To improve naming consistency, replaces occurrences of 'pcidev' with 'pci'.
> The only remaining use of the term should be in relation to
> 'libxl_domain_config' where there are fields named 'pcidevs' and 'num_pcidevs'.
> 
> Purely cosmetic. No functional change.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

