Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F58B46704
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 01:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112596.1460805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufYu-0006PV-04; Fri, 05 Sep 2025 23:09:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112596.1460805; Fri, 05 Sep 2025 23:09:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uufYt-0006O0-TN; Fri, 05 Sep 2025 23:09:43 +0000
Received: by outflank-mailman (input) for mailman id 1112596;
 Fri, 05 Sep 2025 23:09:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uufYs-0006Nu-2p
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 23:09:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufYr-0089q6-1z;
 Fri, 05 Sep 2025 23:09:41 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uufYr-0004XY-1n;
 Fri, 05 Sep 2025 23:09:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=Fg/0JxIYvStP1qtDpSryR7zUxh5KKChKQZ4wWVtdWSc=; b=
	x3gPr8nZoGxhPc8p3YQ2eIxC6CUQCm9alHFQ754HcjeLHScA03XrLsqzj26HMiRil78y6Ovq+PSmK
	RP99/Cvz/kZM1kb+Pl/aJYzwxMSYmDSgTS4BewXHNqs91XZTIc8jbgXFRjAVVVzDdHaqMA3BIuXS7
	uNIGm/lpWfaX96Lkg=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 16:09:40 -0700
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] x86: Fix AMD_SVM and INTEL_VMX dependency
Message-ID: <aLtttIllAoJE2MjK@kraken>
References: <20250902074048.12094-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902074048.12094-1-michal.orzel@amd.com>

On Tue, Sep 02, 2025 at 09:40:48AM +0200, Michal Orzel wrote:
> Commit e3ed540f2e9f was meant to make AMD_SVM dependent on AMD and
> INTEL_VMX on INTEL. This dependency was reflected using 'if' next to a
> prompt which is incorrect as it that deals only with the visibility of the
> given Kconfig option. This makes it impossible to e.g. disable INTEL_VMX
> when INTEL is disabled (option is hidden). Fix it while keeping the
> possibility of e.g. enabling INTEL_VMX when INTEL is disabled.
> 
> Fixes: e3ed540f2e9f ("x86/hvm: add HVM-specific Kconfig")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

