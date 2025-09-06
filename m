Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2030B46798
	for <lists+xen-devel@lfdr.de>; Sat,  6 Sep 2025 02:35:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112910.1461045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uugtJ-0007uz-3W; Sat, 06 Sep 2025 00:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112910.1461045; Sat, 06 Sep 2025 00:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uugtJ-0007t6-0h; Sat, 06 Sep 2025 00:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1112910;
 Sat, 06 Sep 2025 00:34:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uugtH-0007st-16
 for xen-devel@lists.xenproject.org; Sat, 06 Sep 2025 00:34:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uugtG-008C9V-1V;
 Sat, 06 Sep 2025 00:34:50 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uugtG-00089F-1J;
 Sat, 06 Sep 2025 00:34:50 +0000
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
	:Subject:Cc:To:Date:From; bh=iSm66fenvOChSunebt9Y+9D1XsGDMumnX4/SzFp5LNU=; b=
	rOn/bwSIZYAyCO+QR8/Y+eIDjirCc8ICy/LB+vWYsOl0YBhVBTzyeYPlWvRm9pS447jJkwED/r0VC
	76JGe38Eqk5yk/rkbcmWsLRqpUG2+BOr8+h74FMinHgKTiiuuSoVwStxv9PJ7y3SpGtyd7mKX4vUK
	u0m/PFLr2GeAPi5ZU=;
From: dmukhin@xen.org
Date: Fri, 5 Sep 2025 17:34:49 -0700
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
	julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com,
	sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v6 03/15] emul/ns16x50: implement emulator stub
Message-ID: <aLuBqdfshB4+z6ZX@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-4-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905232715.440758-4-dmukhin@ford.com>

On Fri, Sep 05, 2025 at 04:27:02PM -0700, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
[..]
> --- a/xen/common/emul/vuart/Kconfig
> +++ b/xen/common/emul/vuart/Kconfig
> @@ -3,4 +3,23 @@ config VUART_FRAMEWORK
>  
>  menu "UART Emulation"
>  
> +config VUART_NS16X50
> +	bool "NS16550-compatible UART Emulator" if EXPERT
> +	depends on X86 && HVM
> +	select VUART_FRAMEWORK
> +	default n

Forgot to drop 'default n'

> +	help
> +	  In-hypervisor NS16x50 UART emulation.
> +
> +	  Only legacy PC COM2 port is emulated.
> +
> +	  This is strictly for testing purposes (such as early HVM guest console),
> +	  and not appropriate for use in production.
> +

