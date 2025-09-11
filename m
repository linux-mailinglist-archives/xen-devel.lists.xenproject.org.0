Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA4EB526FC
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 05:22:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119250.1464725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXsv-0007gR-OE; Thu, 11 Sep 2025 03:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119250.1464725; Thu, 11 Sep 2025 03:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwXsv-0007dm-L4; Thu, 11 Sep 2025 03:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1119250;
 Thu, 11 Sep 2025 03:22:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwXsu-0007dg-0I
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 03:22:08 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e1ed5d5-8ebe-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 05:22:06 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 30AA9449B7;
 Thu, 11 Sep 2025 03:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4299AC4CEEB;
 Thu, 11 Sep 2025 03:22:04 +0000 (UTC)
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
X-Inumbo-ID: 7e1ed5d5-8ebe-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757560925;
	bh=AS4+H2KdwzbWkkB2NyQf4brFuTMePJpc+8hNCB86lgw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SXXuIkVgUArpV7/mG0jQVHk7sIVbAEXs3GdQD3rLN4F0D/Yf61u3m3wXxswhP9u6f
	 Lgax6XmOtPnaWo992Lni3HzWJM43+gx3QdwsJSjU8Fkb8n7Wdmwo/JeF+ewHoWliRF
	 nb/UrmKFv6q6F06PkasIGFEITkR4iAOUn3t4HOD6nL2f17858S9zexcpTp5NlurA8a
	 jlaHO+4AgpDtwaNMY1+GdniskcB9By8pp0EqZZ+bRGcK8vqBc7+qa8Ub+EFDF9Lv/l
	 BK46x1WVV8rkHUVal/9GlF/x2UdylH3eTSsXduOY8r444rm1aVrc+olhKK6+St01Gv
	 2oQjXeIxrjWtg==
Date: Wed, 10 Sep 2025 20:22:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 23/26] xen/x86: make CONFIG_X86_PSR depend on
 CONFIG_MGMT_HYPERCALLS
In-Reply-To: <20250910073827.3622177-24-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509102020240.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-24-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Users control/monitor Intel Platform Shared Resource (PSR) through
> related domctl-op or sysctl-op, so CONFIG_X86_PSR can be put under
> MGMT_HYPERCALLS. With this change, we could remove MGMT_HYPERCALLS-wrapping
> in psr.c
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

