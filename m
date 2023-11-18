Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8414B7EFD5D
	for <lists+xen-devel@lfdr.de>; Sat, 18 Nov 2023 04:06:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.635515.991506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BfC-0001VT-Es; Sat, 18 Nov 2023 03:06:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 635515.991506; Sat, 18 Nov 2023 03:06:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4BfC-0001SN-BU; Sat, 18 Nov 2023 03:06:30 +0000
Received: by outflank-mailman (input) for mailman id 635515;
 Sat, 18 Nov 2023 03:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+gg=G7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r4BfA-0001Q7-EH
 for xen-devel@lists.xenproject.org; Sat, 18 Nov 2023 03:06:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 756070ef-85bf-11ee-9b0e-b553b5be7939;
 Sat, 18 Nov 2023 04:06:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78F2961DF1;
 Sat, 18 Nov 2023 03:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BEFC433C8;
 Sat, 18 Nov 2023 03:06:22 +0000 (UTC)
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
X-Inumbo-ID: 756070ef-85bf-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700276783;
	bh=W00BR437fiNN2g44kr27gTu/fGrDdVyY3YdmZwS/TQ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MhXwgJ/bQl6pdki+QghzRGqTCFrHL2UH6aI+De03mtQZGi7kFgJyhzXDNEiX+n7VY
	 N3sqYYLFPtongtH3NepWOCZ0ddtHsoCk4t4s0RK0BpL/IzwPxl5SdhecWJQa0rL+YI
	 vzClH/pch18v3hOlRoX5wAFWCg1OWMSyt1jlDWnY9YHca3OkuXhoJlSQojoCgZPG57
	 TlTsF0JlIUEeTAO0vjFHwin7dLjKxQRMDISMWigebihOeBcoipQX3M3BIy9nGTY+ZB
	 nripglNBLBsBsHGofQQJ7Y9WjyCKoDct3sEF1ib9WJ5IthNZYTPX2T12mao01PYvOr
	 3VPXsbQjeCDaQ==
Date: Fri, 17 Nov 2023 19:06:20 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 4/5] xen/vmap: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <d4d67e48298f4b51836c3c5b0a982775f469d74b.1700209834.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311171906150.773207@ubuntu-linux-20-04-desktop>
References: <cover.1700209834.git.federico.serafini@bugseng.com> <d4d67e48298f4b51836c3c5b0a982775f469d74b.1700209834.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 17 Nov 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

