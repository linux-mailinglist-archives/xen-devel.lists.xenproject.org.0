Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94171A753BE
	for <lists+xen-devel@lfdr.de>; Sat, 29 Mar 2025 01:41:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.931404.1333761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyKGY-00006K-H1; Sat, 29 Mar 2025 00:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931404.1333761; Sat, 29 Mar 2025 00:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyKGY-0008VZ-ES; Sat, 29 Mar 2025 00:41:38 +0000
Received: by outflank-mailman (input) for mailman id 931404;
 Sat, 29 Mar 2025 00:41:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oenM=WQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tyKGX-0008VT-9e
 for xen-devel@lists.xenproject.org; Sat, 29 Mar 2025 00:41:37 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e8f1e9d-0c36-11f0-9ffa-bf95429c2676;
 Sat, 29 Mar 2025 01:41:32 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B516043EBE;
 Sat, 29 Mar 2025 00:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC3AC4CEE4;
 Sat, 29 Mar 2025 00:41:29 +0000 (UTC)
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
X-Inumbo-ID: 8e8f1e9d-0c36-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743208890;
	bh=TNf/NyctrKtK/lL1H3makgkiHaUsxBhIpZ8/96xczuA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=pyg5iSGGs3uPTvFhkUp1xFALE6T9iyK6RXc+XTTJjtyDv9uaWS+vUe9pJRCiyMCsk
	 wI34H67KVXLiXaEzetRVr2EGvR1b+dGmKlYXkAl3RS8k411tzOr2QRQvJrDxS/bajd
	 QnbtSKAVFxzQjbM4dRBOS0OCFzlAD1TchBzFhxpXwk7/XQ+M8c9D2tz+GgM5zUJDfb
	 2/jCdJWoMufgYRG+CefSqykM5Z8OObPPI+9jJz7Xj9px8NIcdABFtSqBJi5gvpf7ef
	 J+kZlyqMpT5ggTSzI4DlKJhTIz7E6PAzD8MoobZvNLK0HcHL/rUcaCcmZVu1n84Eem
	 6v7Q4BY9btzag==
Date: Fri, 28 Mar 2025 17:41:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 09/19] xen/pmstat: clean up pmstat.c
In-Reply-To: <20250326055053.3313146-10-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503281741110.563920@ubuntu-linux-20-04-desktop>
References: <20250326055053.3313146-1-Penny.Zheng@amd.com> <20250326055053.3313146-10-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Mar 2025, Penny Zheng wrote:
> We intend to move the following functions into drivers/acpi/pmstat.c, as they
> are all designed for performance statistic:
> - cpufreq_residency_update
> - cpufreq_statistic_reset
> - cpufreq_statistic_update
> - cpufreq_statistic_init
> - cpufreq_statistic_exit
> and moving out acpi_set_pdc_bits(), as it is the handler for sub-hypercall
> XEN_PM_PDC, and shall stay with the other handlers together in
> drivers/cpufreq/cpufreq.c.
> This commit also applies various style corrections while moving these
> functions
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

I checked the diff and everything checks out.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

