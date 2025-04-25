Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA0A9D59C
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 00:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.968744.1358220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Re2-0005Y6-Pc; Fri, 25 Apr 2025 22:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 968744.1358220; Fri, 25 Apr 2025 22:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8Re2-0005Vf-Mi; Fri, 25 Apr 2025 22:35:42 +0000
Received: by outflank-mailman (input) for mailman id 968744;
 Fri, 25 Apr 2025 22:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kyFG=XL=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u8Re1-0005VZ-Cy
 for xen-devel@lists.xenproject.org; Fri, 25 Apr 2025 22:35:41 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c4f4d4c-2225-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 00:35:39 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E0544ABFD;
 Fri, 25 Apr 2025 22:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7C4BC4CEE4;
 Fri, 25 Apr 2025 22:35:35 +0000 (UTC)
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
X-Inumbo-ID: 9c4f4d4c-2225-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745620537;
	bh=tuFWF+wkyAEf9ZS8PAUsWNEXafKzkNBvQx2bEzM70ks=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TWpPeaRl9OU9QKbkeyPDgvvoOOeZFKKCvzTZ6mVruvN9eZPbTitYaeBhXnB25WaA4
	 nOw5Wek6A5vw6GkB2R3xNPHhj/6Q4aH0PNmn3tgmWVOc/f5q5TA4qma/DQXg2b7DNd
	 rluZElFLCIpjByJCWReMdYPXDT+4mj5BAXlxx5N6UGz2535MBmk3HxAdgCbSJ4o6IK
	 2PxNav+rbKtIKYbSHWJUkfDnzyrLgZgfdWliEc8ppmpMqWlWUsrYq+QknnM2wIUpHp
	 KZY6HFCVliS5H6u/qIKKXOSNcuN3TzRtVg56ox4k7/YaNYRQwLYCkpHwIeix+jHVB6
	 dTHZzZm8x5uEg==
Date: Fri, 25 Apr 2025 15:35:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmkhn@proton.me
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v1 2/3] xen/console: introduce console_puts()
In-Reply-To: <20250403000604.169619-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2504251535230.785180@ubuntu-linux-20-04-desktop>
References: <20250403000604.169619-1-dmukhin@ford.com> <20250403000604.169619-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Apr 2025, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> guest_console_write() duplicates the code from __putstr(), eliminate code
> duplication.
> 
> Introduce console_puts() for writing a buffer to console devices.
> 
> Also, introduce internal console flags to control which console devices
> should be used.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



