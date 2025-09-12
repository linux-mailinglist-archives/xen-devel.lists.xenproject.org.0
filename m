Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB8FB557A8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 22:31:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122509.1466140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxAQb-00056z-GP; Fri, 12 Sep 2025 20:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122509.1466140; Fri, 12 Sep 2025 20:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxAQb-00054y-Dd; Fri, 12 Sep 2025 20:31:29 +0000
Received: by outflank-mailman (input) for mailman id 1122509;
 Fri, 12 Sep 2025 20:31:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uxAQZ-00054k-Km
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 20:31:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxAQZ-006ckr-0n;
 Fri, 12 Sep 2025 20:31:27 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxAQZ-006866-0x;
 Fri, 12 Sep 2025 20:31:27 +0000
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
	:Subject:Cc:To:Date:From; bh=Z0TPAK7wGgWTPXFEC4jB7daTrq/ACCmRYZv+/448238=; b=
	TWptsiSVv+MyuL9/u24O0BgSRBfhNGYBtrlLQ4Z/AWGd0zdMATNNaUq8IVzXRiy/uqFahG+N7ZJDY
	2ngwnp9gZX/sWK3+HU430/PL1aYLHN57MYdt12U2ekuHOq98E2uOXV0riVZS1FLENRHyY8GdM76j6
	CxjKyn90xRb91zsTw=;
From: dmukhin@xen.org
Date: Fri, 12 Sep 2025 13:31:26 -0700
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v4 5/8] x86/emul: Make condition coverage warning
 non-fatal
Message-ID: <aMSDHubdyk63rYli@kraken>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
 <20250912144427.1905141-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912144427.1905141-6-andrew.cooper3@citrix.com>

On Fri, Sep 12, 2025 at 03:44:24PM +0100, Andrew Cooper wrote:
> Randconfig with GCC-14 (Debian Trixie) found:
> 
>   In file included from arch/x86/x86_emulate/x86_emulate.c:11,
>                    from arch/x86/x86_emulate.c:27:
>   arch/x86/x86_emulate/x86_emulate.c: In function 'x86_emulate':
>   arch/x86/x86_emulate/private.h:482:8: error: Too many conditions (found 826); giving up coverage [-Werror=coverage-too-many-conditions]
>     482 | ({  if ( (p) ) {                                                          \
>         |        ^
>   arch/x86/x86_emulate/x86_emulate.c:1283:5: note: in expansion of macro 'generate_exception_if'
>    1283 |     generate_exception_if((mode_vif() &&
>         |     ^~~~~~~~~~~~~~~~~~~~~
> 
> which is a consequence of having a new enough compiler to allow
> CONFIG_CONDITIONAL_COVERAGE in to the mix.
> 
> In the short term make warning non-fatal.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com> 

