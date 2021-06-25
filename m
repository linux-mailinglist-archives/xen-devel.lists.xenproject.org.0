Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536023B3A45
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 02:51:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147026.270725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwa46-0002Cy-58; Fri, 25 Jun 2021 00:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147026.270725; Fri, 25 Jun 2021 00:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwa46-0002B8-20; Fri, 25 Jun 2021 00:51:26 +0000
Received: by outflank-mailman (input) for mailman id 147026;
 Fri, 25 Jun 2021 00:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l36E=LT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lwa45-0002Aq-0u
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 00:51:25 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2871de8-26a2-48b5-9519-997a5fbdb9f7;
 Fri, 25 Jun 2021 00:51:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A84A6137D;
 Fri, 25 Jun 2021 00:51:23 +0000 (UTC)
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
X-Inumbo-ID: c2871de8-26a2-48b5-9519-997a5fbdb9f7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624582283;
	bh=OR4nEQViM+sm5HbT6HHys1OrlU1T0jJ2x631OpR/zDg=;
	h=Date:From:To:cc:Subject:From;
	b=Cm3fEgRDdV/+deUg5UwaUOxlOcDjshTyd41SW3uqbpBiPuCwrxYxggB7m/r875Tkw
	 1ZGQVsOBHH8CNrrPR3INHpOmXOIrsbSbLtWFJrB/fNJFjey3O67KeLMTmnkWTRXgx3
	 l/YhniVNLIdYOrJou+PsbD1dGOWdHoR5RHMdbDAbfOBLwlNkK2+MFHNdu1RSlqmW/S
	 HzVoUBBvWFj6FjLQnl0fqGaNk80SX0vx/7CySIRCqAlZknivBndB59727KeTTt8yBk
	 8NGivtUrJxHKzF/I67+aZSw5i2NVpSSEKzI99VrB+1A6IbiRz4Q1Njbf2ZJrwEEmv+
	 NeL6diOVSSZjw==
Date: Thu, 24 Jun 2021 17:51:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien@xen.org
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    Volodymyr_Babchuk@epam.com
Subject: [PATCH] xen/arm: add forward_smc command line option for debugging
Message-ID: <alpine.DEB.2.21.2106241749310.24906@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

It has become clear that an option to disable trapping SMC calls to Xen
is very useful for debugging user issues. Instead of having to provide a
patch to users every time, it would be great if we could just tell them
to add forward_smc=true to the Xen command line.

This option is obviously unsafe and unsecure and only meant for
debugging. Make clear in the description that if you pass
forward_smc=true then the system is not security supported.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 3ece83a427..0833fe80fc 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2501,6 +2501,16 @@ vwfi to `native` reduces irq latency significantly. It can also lead to
 suboptimal scheduling decisions, but only when the system is
 oversubscribed (i.e., in total there are more vCPUs than pCPUs).
 
+### forward_smc (arm)
+> `= <boolean>`
+
+> Default: `false`
+
+If enabled, instead of trapping firmware SMC calls to Xen, allow SMC
+calls from VMs directly to the firmware. This option is UNSAFE and it is
+only meant for debugging. Systems with forward_smc=true are not security
+supported.
+
 ### watchdog (x86)
 > `= force | <boolean>`
 
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index e7384381cc..0580ac5762 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -95,11 +95,15 @@ static int __init parse_vwfi(const char *s)
 }
 custom_param("vwfi", parse_vwfi);
 
+static bool forward_smc = false;
+boolean_param("forward_smc", forward_smc);
+
 register_t get_default_hcr_flags(void)
 {
     return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
              (vwfi != NATIVE ? (HCR_TWI|HCR_TWE) : 0) |
-             HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
+             (forward_smc ? 0 : HCR_TSC) |
+             HCR_TID3|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
 }
 
 static enum {


