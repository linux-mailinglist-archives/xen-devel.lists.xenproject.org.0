Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1FDB5264C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119077.1464595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwWjn-0007MJ-2W; Thu, 11 Sep 2025 02:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119077.1464595; Thu, 11 Sep 2025 02:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwWjm-0007Jz-WC; Thu, 11 Sep 2025 02:08:39 +0000
Received: by outflank-mailman (input) for mailman id 1119077;
 Thu, 11 Sep 2025 02:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwWjl-0007Jt-U1
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:08:37 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 387693c2-8eb4-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 04:08:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 29D7D6013D;
 Thu, 11 Sep 2025 02:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E30C4CEEB;
 Thu, 11 Sep 2025 02:08:32 +0000 (UTC)
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
X-Inumbo-ID: 387693c2-8eb4-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757556512;
	bh=FutJm2e+CDFR9L+V04eCu1tWkGjnTq25lBH6bQUg4xo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mhhL0hIrb7mC/+jRo+vboeQ7aS5fOInwBft0ndbJQXUH+SKB939NfBt2w9BfyN3u5
	 HYPLGxxD/0HwpT9ZP5vzI0SiFmFSsjGOl6UofWwjz2IRUDlDI26uplcIrTzd07ZQPl
	 /dc5PtlvbvBgIlg6lRziJfpWKYkDfpcSJQT1r/pSE9QttrpINMOBUxzin3d8n957Cy
	 W+Dipe8iYxJh3GoIEkQMPaTbqDhL6x7BCzhAYOrTOGepkF+/Sf8OZjzDjSWCJC0hBy
	 NU0JWJG3B40fSe3PkxLjZxifeNM9ewYq77ZVf3txE7hGkAFIfAQsO9bj9ZRhzKTX5i
	 dHSbYOstTVX3g==
Date: Wed, 10 Sep 2025 19:08:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, ray.huang@amd.com, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 06/26] xen/xsm: wrap xsm_vm_event_control() with
 CONFIG_VM_EVENT
In-Reply-To: <20250910073827.3622177-7-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101908250.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-7-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Function xsm_vm_event_control() is only invoked under CONFIG_VM_EVENT, so
> it shall be wrapped with it
> 
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

