Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA30A89088
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 02:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951648.1347493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4UA6-0004Uq-2l; Tue, 15 Apr 2025 00:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951648.1347493; Tue, 15 Apr 2025 00:28:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4UA6-0004SW-03; Tue, 15 Apr 2025 00:28:26 +0000
Received: by outflank-mailman (input) for mailman id 951648;
 Tue, 15 Apr 2025 00:28:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wZ1T=XB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u4UA5-0004SQ-7G
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 00:28:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89eb5cfa-1990-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 02:28:23 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BF3675C0438;
 Tue, 15 Apr 2025 00:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991C1C4CEEA;
 Tue, 15 Apr 2025 00:28:19 +0000 (UTC)
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
X-Inumbo-ID: 89eb5cfa-1990-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744676901;
	bh=VP3WQcHfbKts9B1V6W3uonouAjbwEcxuS4Gb6j/bm4Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Yqb3nmF9HF61Mori0sen1SW4k2qKtoR/UIlxVDFT1Mgoz57fXapvyHe63eNd0ISTi
	 CEa4GY+iCDX328ebR1KWBWJX2kzkEvnmlxeG/95Go5tlsotGcKv4m+CeFY/QAjyt5k
	 zMEuIeIHg9b9Z5SgBDv74XOk/zU03l+/Xm5g5P+9wEmSj9wNXUfqI1lr2mDYdc82ix
	 50RLzN7PDsmoeY5ATRegQZnGbDyiyMzgeJ8In8agyOUZdWMLTEDbliwJJO3EvmUYvf
	 g67GpIKylDBRreNHLQbGsHfgOUDtU0vINUA2yAfub8CfRGdf9/yy8pgvD2F5Yqzpsd
	 D3B+7aB+4qJWg==
Date: Mon, 14 Apr 2025 17:28:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: Denis Mukhin <dmkhn@proton.me>, xen-devel@lists.xenproject.org, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Jason Andryuk <jason.andryuk@amd.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to domain
 config
In-Reply-To: <D96K8KED132J.3C79EPWZM813D@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504141726250.8008@ubuntu-linux-20-04-desktop>
References: <20250408160802.49870-1-agarciav@amd.com> <20250408160802.49870-13-agarciav@amd.com> <tRYKTDKcoIBHId12LOD4EHCmAF-AN3V3PmkMqmyIjYCqQJ3TS_0ctt3WMCq1Ez3W7oIGxwU3UsAioyP9T9fMCO78_61AI01oYEknYF_h1_I=@proton.me> <D96K8KED132J.3C79EPWZM813D@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Apr 2025, Alejandro Vallejo wrote:
> Though I'm starting to get urges to rewrite many of this error handlers
> as asserts, on the basis that "why do we think it's ok to boot with
> malformed DTBs"? A safe system that doesn't boot is more helpful than an
> unsafe one that boots everything except a critical component for you to
> find later on.

It is totally OK to panic on boot if a malformed DTB was passed.  See
the number of panics in xen/arch/arm/dom0less-build.c.

