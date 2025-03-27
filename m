Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4CCA731BC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 13:04:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929145.1331759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlxf-0003JX-Oh; Thu, 27 Mar 2025 12:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929145.1331759; Thu, 27 Mar 2025 12:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txlxf-0003HC-Lh; Thu, 27 Mar 2025 12:03:51 +0000
Received: by outflank-mailman (input) for mailman id 929145;
 Thu, 27 Mar 2025 12:03:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiQ9=WO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1txlxd-0003Dm-Ic
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 12:03:49 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a1f9964-0b03-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 13:03:48 +0100 (CET)
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
X-Inumbo-ID: 8a1f9964-0b03-11f0-9ea3-5ba50f476ded
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743077026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5hfLC1YzRrCnSz3zVHN/pjpVelGRCCdNDMqdXleTErQ=;
	b=2CUlHLYmmjHr8fA1hplaYjlX2Rrr8FAqj38qPquIDKCdbe75yEhV35v9E21QpEgQ1Llj4r
	h2L2DKGkRXV1sGbBkGJDMSGVNbSP29d1Bf6voVgtqQQ+fGNRAcMuIY3eDkqqrIXAuSVC0/
	p7EtCd9HTBFb15/sXq1HSnBk+87ARWybYmkZIgoJAk4kBIvu3wnWk271LFVjQNkuYl+fbU
	qY8DPXgkMlE77tRvgwt893msRjv9uc9SlrAa+tPGaWGGYyhmv8KpvzhnElV8sz0G/rStNk
	0exz6iv3SIkSnAGgiey1TUe5Gp3EV0L/nNkU3rbz1g6fVXWDAX8G4g8hTQIbqA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743077026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5hfLC1YzRrCnSz3zVHN/pjpVelGRCCdNDMqdXleTErQ=;
	b=Wmy/qs0NDbZZdF3X/u0ciYSLBcE9k5CgAgiLntMaDI2TaiBSlDSZB+tTcr6ztoP4fqJel6
	e3uYGfvHLgDArOCQ==
To: kernel test robot <oliver.sang@intel.com>, Roger Pau Monne
 <roger.pau@citrix.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Juergen Gross <jgross@suse.com>,
 Bjorn Helgaas <bhelgaas@google.com>, xen-devel@lists.xenproject.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 ltp@lists.linux.it, oliver.sang@intel.com
Subject: Re: [linux-next:master] [PCI/MSI]  d9f2164238:
 Kernel_panic-not_syncing:Fatal_exception
In-Reply-To: <202503271537.b451d717-lkp@intel.com>
References: <202503271537.b451d717-lkp@intel.com>
Date: Thu, 27 Mar 2025 13:03:46 +0100
Message-ID: <87semyy925.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Mar 27 2025 at 16:29, kernel test robot wrote:
> kernel test robot noticed "Kernel_panic-not_syncing:Fatal_exception" on:
>
> commit: d9f2164238d814d119e8c979a3579d1199e271bb ("PCI/MSI: Convert pci_msi_ignore_mask to per MSI domain flag")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

Fixed upstream.

3ece3e8e5976 ("PCI/MSI: Handle the NOMASK flag correctly for all PCI/MSI backends")

