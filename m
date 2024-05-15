Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE88C69D1
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722526.1126591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Gda-0001RO-S9; Wed, 15 May 2024 15:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722526.1126591; Wed, 15 May 2024 15:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Gda-0001Oi-Oq; Wed, 15 May 2024 15:33:50 +0000
Received: by outflank-mailman (input) for mailman id 722526;
 Wed, 15 May 2024 15:33:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cqhY=MS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s7GdZ-0001Oc-C3
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:33:49 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8526bb73-12d0-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 17:33:47 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-69b6c2e9ed9so33662166d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:33:47 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1797ebsm65188416d6.4.2024.05.15.08.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 08:33:45 -0700 (PDT)
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
X-Inumbo-ID: 8526bb73-12d0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715787226; x=1716392026; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=52F00axdSTxZ9nhEnnOlzDw6Q1ldPywncpLvDK9T3SI=;
        b=TdWLZZRS0mrJDuoyuqe8u011l/QXi1v+WeHMD1gwQ43BsMwTIenjJ3V4f8K9JcEgR+
         Er5cuViE55XaZpr+r9s2HqQNtlFGOECImoBcbjBqlAJi37o88fdAlIW6cDjWjiNkV2pz
         baWH4Nr5xCkEkgeCwOtfaNATtYJ86210ySBaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715787226; x=1716392026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=52F00axdSTxZ9nhEnnOlzDw6Q1ldPywncpLvDK9T3SI=;
        b=MjY91L0ckaBgPKNlfjjx5bWmvITHi4pok9Zz7sLLDJie5V/Cz7awsSSZKH3oxL1Cad
         CTI/A+iuyxvOeFhQdbnkxw/IR7IMlC1wPgFLvy55xFyeJ9wvCAkPr4Ci1rfRK948Yv6l
         GMuAn/+ZRR8qRxENDVJKyNWwJVcHPy/XbKwm2de1Woj7B71UbhAF02yULrC+W+lSP296
         gI5mgIY+Yj+GbQURG46jEGty+MoYaSKIJGKfZvuw3p1XXEhnu2N9YvWsvvXgIV53JcN/
         m/eweYWm3ECpEPTnHcjC/i7yoZa/XcYIGnr4+W9VR2h3HcEUzl6BUw93bSBXpT1gq+De
         DTmA==
X-Gm-Message-State: AOJu0YxMpbgc2f5aIXTRUj++rHbiPnB3JPgaHsJe9OoErAb7QQBkMgfJ
	IEyTqTunifjxbMlLWOA8Mn+vKffPCWZwlBFKXaUS3Vh48LeZz1+RbMWXPa1c44o=
X-Google-Smtp-Source: AGHT+IEBw2r1+DksohsjXZ4YRUULUzuLdfIQ3igz6CNdMJuRft/q2T0JsZb/kKTyw5ZatjZmDDuSWg==
X-Received: by 2002:a05:6214:2e41:b0:6a0:b905:97ab with SMTP id 6a1803df08f44-6a1682349d4mr196213776d6.52.1715787226198;
        Wed, 15 May 2024 08:33:46 -0700 (PDT)
Date: Wed, 15 May 2024 17:33:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Elias El Yandouzi <eliasely@amazon.com>
Subject: Re: [PATCH] x86: respect mapcache_domain_init() failing
Message-ID: <ZkTV1w7B2UyvJSHU@macbook>
References: <dc80cf26-8900-4848-84dd-6f3e47d59f57@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc80cf26-8900-4848-84dd-6f3e47d59f57@suse.com>

On Wed, May 15, 2024 at 03:35:15PM +0200, Jan Beulich wrote:
> The function itself properly handles and hands onwards failure from
> create_perdomain_mapping(). Therefore its caller should respect possible
> failure, too.
> 
> Fixes: 4b28bf6ae90b ("x86: re-introduce map_domain_page() et al")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

