Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED168B46843
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 04:03:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113011.1461126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiHD-0005D5-Pz; Sat, 06 Sep 2025 02:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113011.1461126; Sat, 06 Sep 2025 02:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiHD-0005BV-N8; Sat, 06 Sep 2025 02:03:39 +0000
Received: by outflank-mailman (input) for mailman id 1113011;
 Sat, 06 Sep 2025 02:03:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuiHC-0003fo-Di
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 02:03:38 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b34e2eed-8ac5-11f0-9d12-b5c5bf9af7f9;
 Sat, 06 Sep 2025 04:03:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D105E602AA;
 Sat,  6 Sep 2025 02:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E80C4CEF1;
 Sat,  6 Sep 2025 02:03:35 +0000 (UTC)
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
X-Inumbo-ID: b34e2eed-8ac5-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757124216;
	bh=u7jvCHtjfqjeHz50dxl7gey5SAHRExQB7ApX8Uwy3yw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MtFpfAR0mQMCI8jHBRVpeYeUyb1KG4+mjGGlIi2OZ0wzsKIm9M1K1jnzku6VSqWQW
	 voVq77jNEIzjXO6ldpY0JiNCrAsuO3RKjC9v3M2gflxhwKdVFPDe7zlbg02Tx2cAQE
	 szDrDw9so4hfCL26dS2DFHtoU2+vXo+RPACv5ZSHx2yJRspIF6GZnKODXFt2qCrGsr
	 5OEj/K8PLNcH0lpym0CYP9d/rhopfSd0ZWeMqGjNJpZxRCQwisJIKaAZqwC3WHvrBq
	 UzbA7MDyZxxF/GAFJgfGLzXuYH4iy7o1A+wMV+zmMPBWkhQ3a558y7zJ8cPWur+KjZ
	 wrWkln/u3FRkA==
Date: Fri, 5 Sep 2025 19:03:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 04/15] emul/ns16x50: implement DLL/DLM registers
In-Reply-To: <20250905232715.440758-5-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051903270.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-5-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add DLL/DLM registers emulation.
> 
> DLL/DLM registers report hardcoded 115200 baud rate to the guest OS.
> 
> Add stub for ns16x50_dlab_get() helper.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

