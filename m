Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFE2B46848
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 04:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113058.1461166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiOa-0000Ip-AJ; Sat, 06 Sep 2025 02:11:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113058.1461166; Sat, 06 Sep 2025 02:11:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiOa-0000HA-6p; Sat, 06 Sep 2025 02:11:16 +0000
Received: by outflank-mailman (input) for mailman id 1113058;
 Sat, 06 Sep 2025 02:11:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuiHT-0003fo-BX
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 02:03:55 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcd926c6-8ac5-11f0-9d12-b5c5bf9af7f9;
 Sat, 06 Sep 2025 04:03:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D2B3B602AA;
 Sat,  6 Sep 2025 02:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333AAC4CEF1;
 Sat,  6 Sep 2025 02:03:51 +0000 (UTC)
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
X-Inumbo-ID: bcd926c6-8ac5-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757124232;
	bh=Oc6nLx3LZyJ3Vgd1+j9sMVOJun+AvB2Kh2JB/3vy/wc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bVKIRc8M8FZpG+Y4ZTLH2SNQRZTstSnRHNo6jvqsYVrJ3+1BUwY1mXu8Wug1dmHlr
	 27qRobkrwzollhPQJKnmvUXARQ+Nb9vRGREz8NA5XR8nPr8XIyCjGSnn8OwkkUpgX+
	 Ck9Hjy//LJACc5ZK6hx8Gli2fGouCaVA7k6sHGhN9S0KfqcqkoLYGynQW23lC7AqIZ
	 BlYix/gvgidO1/xnPUxQtjPVi3Mc60OD2Oh/TCzmah0CJLfmUiEgffK5cuHeKipxr1
	 ho7sYZ8irXFDyt+YfY0pib/LVpyaeusQj07qDAfDVjtu9rGJ15Rl0pL6iGwCAL3rNo
	 8EtHzTzTC9/1A==
Date: Fri, 5 Sep 2025 19:03:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 05/15] emul/ns16x50: implement SCR register
In-Reply-To: <20250905232715.440758-6-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051903440.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-6-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add SCR register emulation to the I/O port handler.
> Firmware (e.g. OVMF) may use SCR during the guest OS boot.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

