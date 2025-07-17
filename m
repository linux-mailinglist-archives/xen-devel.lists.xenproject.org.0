Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B7B098AD
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 01:57:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047637.1418042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucYSQ-0008G0-5T; Thu, 17 Jul 2025 23:56:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047637.1418042; Thu, 17 Jul 2025 23:56:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucYSQ-0008DR-2J; Thu, 17 Jul 2025 23:56:10 +0000
Received: by outflank-mailman (input) for mailman id 1047637;
 Thu, 17 Jul 2025 23:56:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R98P=Z6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ucYSO-0008DL-Jb
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 23:56:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a75de06-6369-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 01:56:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B7B365C6CB0;
 Thu, 17 Jul 2025 23:56:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B48C4CEE3;
 Thu, 17 Jul 2025 23:56:04 +0000 (UTC)
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
X-Inumbo-ID: 9a75de06-6369-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752796565;
	bh=r59wWpzYVVtXF/ufXQEUojKsRSK5hP1cEgr/WwopwcY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CZVPjpjEuvX1uuHRReR1i9TG1W3nyCeFaVoVPWnCpn9pi8P99Xj61Aev3B5tYFUxm
	 1u8N7pqocCUbHvuaQQvtCw8w3XzsLcjvew94Phiq3xgQ0xXVx9pYxoh0c70NSg1Qrl
	 5Vi3r+EX9bWOdL3SGmnsAwCCR4eLY4pDeG6McmarxA+2zu2iKM+bf+ADvzPPRSOuvo
	 qIphMGl1vNMsE65fl8pLu2f/bLEVwR9QMFN34ALhYH1JOyNwO1UUQpA7Ge+mA/SfNI
	 sBu7s/kvHUW3TCAPapCdlPlVCO1rSlSeT+sH+UEow2qO/AFUJJyYGw6Hkqj1lHuqnV
	 E6bf5+2llNdaQ==
Date: Thu, 17 Jul 2025 16:56:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 1/2] arm: Remove alloc_dom0_vcpu0()
In-Reply-To: <06280914-1441-4e8e-a446-3d81c50a8933@amd.com>
Message-ID: <alpine.DEB.2.22.394.2507171655580.15546@ubuntu-linux-20-04-desktop>
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com> <20250717175128.462996-2-alejandro.garciavallejo@amd.com> <06280914-1441-4e8e-a446-3d81c50a8933@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Jul 2025, Jason Andryuk wrote:
> On 2025-07-17 13:51, Alejandro Vallejo wrote:
> > It's a straight vcpu_create(), so the alloc_dom0_vcpu0() call is
> > irrelevant.
> > 
> > Not a functional change.
> > 
> > Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

