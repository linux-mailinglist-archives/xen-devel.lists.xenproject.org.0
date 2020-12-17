Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBC62DDC07
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 00:48:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56251.98377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2zq-00063J-3g; Thu, 17 Dec 2020 23:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56251.98377; Thu, 17 Dec 2020 23:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq2zq-00062x-0V; Thu, 17 Dec 2020 23:47:46 +0000
Received: by outflank-mailman (input) for mailman id 56251;
 Thu, 17 Dec 2020 23:47:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kq2zp-00062s-4w
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 23:47:45 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1a5dd61-f216-4f35-aedf-2fa9143bca69;
 Thu, 17 Dec 2020 23:47:44 +0000 (UTC)
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
X-Inumbo-ID: b1a5dd61-f216-4f35-aedf-2fa9143bca69
Date: Thu, 17 Dec 2020 15:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608248863;
	bh=vOzdZE9XyJP/KeenoI3EJVv3hMBrAU5BOh0GAA0xRbM=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=NnTsz2fITusKiNngWMwt2xr4/GWQIMo/NGaezasQCObLy/9RQwRVkJC8GKkFii1PP
	 +oIaEaPViVjqRjGxkq4ylZdRgrQuTp/1yDq/6wur9OQLH0CTyo2eVS9UTT18gcJr/c
	 q7IcRziP045BOoxXU4/6u1hi2FaYpQyh66yL89LNp242MqhY6ccYCwdB6USmqXfohq
	 71VkzSP4KvUvOglYOnco0Q8vUbmwyb4ujTxcc1U2hEN/f03FYA53fpkfdiqXnFtLt1
	 SS3zs3f8qRaz5NClJ8jnxXqFLj5sE+I8twuHMgp78sR7YOd274gR8U+zFo//RtxWlK
	 X+VTT0nb3RMPw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, andrew.cooper3@citrix.com, 
    george.dunlap@citrix.com, iwj@xenproject.org, wl@xen.org
Subject: Re: [PATCH v4 0/8] xen/arm: Emulate ID registers
In-Reply-To: <cover.1608214355.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2012171543290.4040@sstabellini-ThinkPad-T480s>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Dec 2020, Bertrand Marquis wrote:
> The goal of this serie is to emulate coprocessor ID registers so that
> Xen only publish to guest features that are supported by Xen and can
> actually be used by guests.
> One practical example where this is required are SVE support which is
> forbidden by Xen as it is not supported, but if Linux is compiled with
> it, it will crash on boot. An other one is AMU which is also forbidden
> by Xen but one Linux compiled with it would crash if the platform
> supports it.
> 
> To be able to emulate the coprocessor registers defining what features
> are supported by the hardware, the TID3 bit of HCR must be disabled and
> Xen must emulated the values of those registers when an exception is
> catched when a guest is accessing it.
> 
> This serie is first creating a guest cpuinfo structure which will
> contain the values that we want to publish to the guests and then
> provides the proper emulationg for those registers when Xen is getting
> an exception due to an access to any of those registers.
> 
> This is a first simple implementation to solve the problem and the way
> to define the values that we provide to guests and which features are
> disabled will be in a future patchset enhance so that we could decide
> per guest what can be used or not and depending on this deduce the bits
> to activate in HCR and the values that we must publish on ID registers.

As per our discussion I think we want to add this to the series.

---

xen/arm: clarify support status for various ARMv8.x CPUs

ARMv8.1+ is not security supported for now, as it would require more
investigation on hardware features that Xen has to hide from the guest.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/SUPPORT.md b/SUPPORT.md
index ab02aca5f4..d95ce3a411 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -37,7 +37,8 @@ supported in this document.
 
 ### ARM v8
 
-    Status: Supported
+    Status, ARMv8.0: Supported
+    Status, ARMv8.1+: Supported, not security supported
     Status, Cortex A57 r0p0-r1p1: Supported, not security supported
 
 For the Cortex A57 r0p0 - r1p1, see Errata 832075.

