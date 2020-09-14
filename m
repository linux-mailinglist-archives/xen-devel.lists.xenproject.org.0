Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3B8268FFF
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 17:32:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHqSr-0002gT-FQ; Mon, 14 Sep 2020 15:32:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/hQe=CX=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kHqSp-0002gJ-FI
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 15:32:19 +0000
X-Inumbo-ID: 697ee1fd-008c-4a94-8741-5e35d6ccbb00
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 697ee1fd-008c-4a94-8741-5e35d6ccbb00;
 Mon, 14 Sep 2020 15:32:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x14so71243wrl.12
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2020 08:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mOBGrXahDd4UntnLgu0B3JjjLN7E3e4M12U7iHY+teU=;
 b=HEomWbVlEsZVdYzJr88UGHPeRApN4Be5XJ0JXolE8cpf0L1SLUXQvte5LFbADnrucy
 8b5nzXK4O/jVHaRaCBfJdFrsZ39vVfyc3lAinyq+w/Qg9C6yemaO1DW9FYsmQCOvpe8q
 HD7V1G0KlhuYrx76ivAqnWVsazLrBvZo43RTQ4hqCmlwBy7Ij1Q7dBU8cgFQUz4M+Xu6
 mB12wEym2ROC0FR0eqPoBXP8MLSYvAqsS3qRTEdnix3FfcmWuPIMmKTaNvUoF4NRr2J6
 7mRfPQJKm8QocpI4vGY6FH8Pw/TIuiSs2POgjes1G2C2nQ4cDFcYRQKg8K8kbIs3FPz8
 fV2w==
X-Gm-Message-State: AOAM531IWJnGEM9PfgUNQHbVKjncYxobYBqWMAsRcvDuXmZmn3+BQt2k
 WNaaJPScyUU5jDR2Lin6JCc=
X-Google-Smtp-Source: ABdhPJw2rMvc7EyU/iy/7RfaMbKid4+m58najxqiB3bgEKt1p927tpWUdOe495D289MapsVSp0OCEQ==
X-Received: by 2002:adf:f190:: with SMTP id h16mr16722382wro.202.1600097537310; 
 Mon, 14 Sep 2020 08:32:17 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n4sm20924381wrp.61.2020.09.14.08.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 08:32:16 -0700 (PDT)
Date: Mon, 14 Sep 2020 15:32:15 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] travis: Fix build with newer Qemu
Message-ID: <20200914153215.lwmyps5bansaijs6@liuwe-devbox-debian-v2>
References: <20200914132355.21076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200914132355.21076-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 14, 2020 at 02:23:55PM +0100, Andrew Cooper wrote:
> Qemu requires a bleeding edge version of Python, not found in the current
> travis environment.  Skip building Qemu in that case.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

