Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3484E876E7D
	for <lists+xen-devel@lfdr.de>; Sat,  9 Mar 2024 02:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690441.1076434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilRV-0007PK-VO; Sat, 09 Mar 2024 01:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690441.1076434; Sat, 09 Mar 2024 01:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rilRV-0007MU-SD; Sat, 09 Mar 2024 01:24:05 +0000
Received: by outflank-mailman (input) for mailman id 690441;
 Sat, 09 Mar 2024 01:24:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VWqy=KP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rilRU-0007MO-FD
 for xen-devel@lists.xenproject.org; Sat, 09 Mar 2024 01:24:04 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5cf75c7-ddb3-11ee-afdb-a90da7624cb6;
 Sat, 09 Mar 2024 02:24:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 50F6FCE1DF4;
 Sat,  9 Mar 2024 01:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34A5C43390;
 Sat,  9 Mar 2024 01:23:57 +0000 (UTC)
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
X-Inumbo-ID: b5cf75c7-ddb3-11ee-afdb-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709947439;
	bh=N4Zlr2YBEF2Zmj+/2VFqqlC0xz7Y3kl8JtrrJtLq/F4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=H4izAxdRXS45+38iQF7jY/0xjhXFrT7fbRPe9Ho9UjEwQAHEWoMQUlDcrVo2ppsIS
	 uuGJi0TjffJDa5OqzdI//gILNjkllYkh3Cw+4b0GanlELQKuRrw+hHXqmnXp/cF7la
	 ERds2m8B+NvjFstU7vFBRJwQX/iiJfFPIKsuxg+0Tu5V3MO98vuK6EXlbehpuTLdfS
	 R9nAlmt8mFvnRFPzuJLRj5WBY0svBp8GDumqmhYOTuimWROssw8r6D04e+XjxC5ULV
	 hLB0UzuZGbwB2dNHGKcVTxhTtzzoaRVK1QoaGl2ByDzq8uwKe6rwO9ZOaxfJRdsbvS
	 qy7+IEm5SsxBg==
Date: Fri, 8 Mar 2024 17:23:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, bertrand.marquis@arm.com, julien@xen.org, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH v2 1/7] xen/spinlock: address violations of MISRA C
 Rule 20.7
In-Reply-To: <59e9749d3c6a22469bc9fb804b7b7c13850e9e94.1709896401.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403081723440.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com> <59e9749d3c6a22469bc9fb804b7b7c13850e9e94.1709896401.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Mar 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

