Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E55E89909B
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 23:49:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701016.1095011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUxF-0000w0-Pp; Thu, 04 Apr 2024 21:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701016.1095011; Thu, 04 Apr 2024 21:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUxF-0000u1-N9; Thu, 04 Apr 2024 21:49:05 +0000
Received: by outflank-mailman (input) for mailman id 701016;
 Thu, 04 Apr 2024 21:49:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1z08=LJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsUxE-0000Fb-HJ
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 21:49:04 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25c52d74-f2cd-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 23:49:02 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 324B4CE31F6;
 Thu,  4 Apr 2024 21:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CBBC433C7;
 Thu,  4 Apr 2024 21:48:55 +0000 (UTC)
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
X-Inumbo-ID: 25c52d74-f2cd-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712267337;
	bh=nDV9urUlmH1ZG+QioqmwzgNFjCb1avwSH8ue0G99U6k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mFvCejM2xWhrf1COaEQJEtddSk5hr0nNdBTm3fPX1afSKeVSvFGmsNIz5JTtGxIlq
	 ceIvODDYPS6IIiI/Nm1u0v5X30OyY4BjkuJyYvYTikxLlR5uPXx2H92rzozUgSHpDB
	 MyvQ3TqFxBZAkGtVQuNCxG9rEK/NG4y7dpb84m+mywqLdKROt1npn0NoknyKOz76YM
	 wcJdGMoEEgECtfxv4PQzhXyJW8jBnCxx2yZ1blqsmCQyvvGb+x0kCtTtAsrsDik4S6
	 4YWtajggBo+YTNGK6Wt5uFsSsm9jFV9WoM/neo/nMTBMPtcNavlrsPWwBEOPXM/wOO
	 hUYzF3APLgwWQ==
Date: Thu, 4 Apr 2024 14:48:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Michal Orzel <michal.orzel@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 2/2] char: lpuart: Drop useless variables from UART
 structure
In-Reply-To: <20240404075143.25304-3-michal.orzel@amd.com>
Message-ID: <alpine.DEB.2.22.394.2404041448470.2245130@ubuntu-linux-20-04-desktop>
References: <20240404075143.25304-1-michal.orzel@amd.com> <20240404075143.25304-3-michal.orzel@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Apr 2024, Michal Orzel wrote:
> These variables are useless. They are being assigned a value which is
> never used since UART is expected to be pre-configured.
> 
> No functional change.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


