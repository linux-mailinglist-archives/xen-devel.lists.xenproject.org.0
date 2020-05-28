Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B121E5B64
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 11:04:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeESN-0001x4-Ik; Thu, 28 May 2020 09:04:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eoT6=7K=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jeESM-0001wx-In
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 09:04:06 +0000
X-Inumbo-ID: 2e847100-a0c2-11ea-a7a8-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e847100-a0c2-11ea-a7a8-12813bfff9fa;
 Thu, 28 May 2020 09:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lf1gkKuFmc3/ZRlD1zPwK//yWBW5s9SvQhBMNyi+z2Y=; b=kw3gs5YfL6l5m+3GRVfv1PlJQr
 tgzMy91Bn7IYvZWsEeAggrL6BO008ctsyBPJp7jMfDi6NU0m29IR+zm9tvdRCvzj3+cHISoBfOptY
 e9C21LLjiCORPZIWUKPZUDCtU2H7Woi47MM/fnIaXDjJdCSAEj7/sgwmIAul0C4fPooU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeESI-00075U-R9; Thu, 28 May 2020 09:04:02 +0000
Received: from [93.176.191.173] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeESI-0005E2-BU; Thu, 28 May 2020 09:04:02 +0000
Date: Thu, 28 May 2020 11:03:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v3 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
Message-ID: <20200528090338.GE1195@Air-de-Roger>
References: <a3b3410c707636aa201641e14b1ab43d4b8821e1.1590411162.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3b3410c707636aa201641e14b1ab43d4b8821e1.1590411162.git.tamas.lengyel@intel.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 25, 2020 at 06:00:08AM -0700, Tamas K Lengyel wrote:
> When running shallow forks, ie. VM forks without device models (QEMU), it may
> be undesirable for Xen to inject interrupts. When creating such forks from
> Windows VMs we have observed the kernel trying to process interrupts
> immediately after the fork is executed. However without QEMU running such
> interrupt handling may not be possible because it may attempt to interact with
> devices that are not emulated by a backend. In the best case scenario such
> interrupt handling would only present a detour in the VM forks' execution
> flow, but in the worst case as we actually observed can completely stall it.
> By disabling interrupt injection a fuzzer can exercise the target code without
> interference. For other use-cases this option probably doesn't make sense,
> that's why this is not enabled by default.
> 
> Forks & memory sharing are only available on Intel CPUs so this only applies
> to vmx. Note that this is part of the experimental VM forking feature that's
> completely disabled by default and can only be enabled by using
> XEN_CONFIG_EXPERT during compile time.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

