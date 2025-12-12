Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF67ECB9937
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 19:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185631.1507675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU7xf-0005NW-Ga; Fri, 12 Dec 2025 18:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185631.1507675; Fri, 12 Dec 2025 18:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU7xf-0005M5-Cs; Fri, 12 Dec 2025 18:33:51 +0000
Received: by outflank-mailman (input) for mailman id 1185631;
 Fri, 12 Dec 2025 18:33:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hjY0=6S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vU7xe-0005Lz-7I
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 18:33:50 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1861b2ba-d789-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 19:33:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 08802401A6;
 Fri, 12 Dec 2025 18:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7BDC4CEF1;
 Fri, 12 Dec 2025 18:33:44 +0000 (UTC)
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
X-Inumbo-ID: 1861b2ba-d789-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765564425;
	bh=XS5oCiBPDCx8tX6GkXq9S00KHdapehlxPEv7bTdgvDc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cpoJMSu5GKVIew++G0K3inCZZvZFIbrlyKd3oIFPuG2H+p34FF9lMwwHML4X57Iwa
	 XHdr8dA/kAZkTIJY2a3xIdmw81JREMIOY0JLPM7p7J1x0Cu0TYd/6bHWtjZeze9Mgo
	 NA9iiRpfhQQ2bbnZKV3FAEDkuDPplgaLyPBVnFR7LxfJfld183GVPC5X8TEt+YT9uR
	 yCV0LCStM+Ilu8rBH8s2gE5KofhR+u6SGLKSGiiGH6+73wLQ6fy2xMil7eqymyG84z
	 dkLMN7qljZ8bA8SaERMtO1h4lvKhGb50bAZvC1gbhY8yViX7vEf0Y/z9Es3GE71cEB
	 z7W2BwxrDFJSQ==
Date: Fri, 12 Dec 2025 10:33:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH] x86/shadow: Move GUEST_PTE_SIZE defines into types.h
In-Reply-To: <20251212160615.2486055-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2512121033340.381016@ubuntu-linux-20-04-desktop>
References: <20251212160615.2486055-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Dec 2025, Andrew Cooper wrote:
> GUEST_PTE_SIZE are only used by multi.c, but private.h gets used by code that
> doesn't have GUEST_PAGING_LEVELS defined.  Eclair notes that this is a
> violation of MISRA Rule 20.9.
> 
> Move it into types.h with the rest of the level-dependent logic lives.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

