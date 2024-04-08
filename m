Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E489CF18
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 01:59:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702078.1096860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtytM-0004no-92; Mon, 08 Apr 2024 23:59:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702078.1096860; Mon, 08 Apr 2024 23:59:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtytM-0004l6-61; Mon, 08 Apr 2024 23:59:12 +0000
Received: by outflank-mailman (input) for mailman id 702078;
 Mon, 08 Apr 2024 23:59:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oN3c=LN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rtytK-0004l0-VJ
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 23:59:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbe1e608-f603-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 01:59:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D0CEA61474;
 Mon,  8 Apr 2024 23:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D936BC433F1;
 Mon,  8 Apr 2024 23:59:03 +0000 (UTC)
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
X-Inumbo-ID: fbe1e608-f603-11ee-843a-3f19d20e7db6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712620745;
	bh=b4P/8kEm3T0cO0Q1DOBe8QGXkAGmug3AHnY8632IcTE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lh6O5ZU+ZT3eXq+haM8qSJMEGcy3jek6T4IbbHy0F8gdU0detOPS4wcVg2YLj3/kH
	 9nUul1DqhDtsGAqwyr+HpY9zBSRP5zQ1PJcWpTjxgAL1Jbbd2zOKwszOxAjKVupWut
	 k0fj8UO2585d3xRP1gLF/oepEMO+8eY7FAvy9w9Pv/aBCdF3qFAX8m4o1enzni7EWC
	 uL7KTqW0bI6M5pJuMqeoVEX64ZqeJQMkia/3sTyVoE5GE5e+yeAp4WKmxhRxTq4oUb
	 vJ/VVmQofqiZhgUNstxGbOteDWkd5MKnf+hamVZwY9kKOSo3vYlY03GAzjOiMEQepz
	 QrNSDDbV965LQ==
Date: Mon, 8 Apr 2024 16:59:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v2 9/9] eclair_analysis: deviate x86 emulator for
 Rule 16.2
In-Reply-To: <31647df45bf37e56ab81e1c8830211e60765d5c9.1712305581.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2404081658550.2245130@ubuntu-linux-20-04-desktop>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com> <31647df45bf37e56ab81e1c8830211e60765d5c9.1712305581.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Apr 2024, Nicola Vetrini wrote:
> MISRA C Rule 16.2 states:
> "A switch label shall only be used when the most closely-enclosing
> compound statement is the body of a switch statement".
> 
> Since complying with this rule of the x86 emulator would lead to
> a lot of code duplication, it is deemed better to exempt those
> files for this guideline.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


