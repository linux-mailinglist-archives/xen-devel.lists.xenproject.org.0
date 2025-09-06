Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E5B46844
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 04:05:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1113023.1461135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiI7-0005vV-2Z; Sat, 06 Sep 2025 02:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1113023.1461135; Sat, 06 Sep 2025 02:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuiI6-0005tM-W7; Sat, 06 Sep 2025 02:04:34 +0000
Received: by outflank-mailman (input) for mailman id 1113023;
 Sat, 06 Sep 2025 02:04:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wK8U=3R=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uuiI6-0005tC-1J
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 02:04:34 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3d25beb-8ac5-11f0-9809-7dc792cee155;
 Sat, 06 Sep 2025 04:04:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4EE52602AB;
 Sat,  6 Sep 2025 02:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7B34C4CEF1;
 Sat,  6 Sep 2025 02:04:29 +0000 (UTC)
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
X-Inumbo-ID: d3d25beb-8ac5-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757124271;
	bh=MN9iE+ACriliq8eOvUZtL3YrcpXe2K/Fab03rvBg17I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q7K8NgFv5rFTjdJbx70j2CeQI2AEYNW97k3CD5+iEhBBLOsT0xE7jMjwgoFrVqb/m
	 9Y6pqz9dQhU6sgj+opo9FpzD7dC/w2eG3HheugGwCvJQlToeoEee5g6xeMvdy0IJtf
	 JZskLSD/9rF7MXL5LVmkDw0mE55D8yar6WrL5VgXtkte6rjkUntfAkfharSIwyG1ek
	 VeFLq76DpsC/fuzHSmUV1tVNLOa09VEPr188Xc68dL9PuJBEn2s76gzXx9Zn5PX6nG
	 1Dbui20XYCvAexB0Jfgro+ETCwBgBrWag9UdmdWx4KMAVf+SVnsmCuuJLKubysy2qJ
	 7+fG/pLotWI1g==
Date: Fri, 5 Sep 2025 19:04:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v6 09/15] emul/ns16x50: implement RBR register
In-Reply-To: <20250905232715.440758-10-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2509051904220.1405870@ubuntu-linux-20-04-desktop>
References: <20250905232715.440758-1-dmukhin@ford.com> <20250905232715.440758-10-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 5 Sep 2025, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Add RBR register emulation to the I/O port handlder.
> 
> Add RX FIFO management code since RBR depends on RX FIFO.
> 
> RX FIFO is not emulated as per UART specs for simplicity (not need to emulate
> baud rate). Emulator does not emulate NS8250 (no FIFO), NS16550a (16 bytes) or
> NS16750 (64 bytes).
> 
> RX FIFO is emulated by means of using xencons_interface which conveniently
> provides primitives for buffer management and later can be used for
> inter-domain communication similarly to vpl011.
> 
> Add UART_LSR_DR handling since it depends on RBR register access.
> 
> Finally, implement put_rx() vUART hook for placing a character into the
> emulated RX FIFO from console driver. That implements physical console
> forwarding to the guest OS over emulated NS16550.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

