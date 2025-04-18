Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C5A9405F
	for <lists+xen-devel@lfdr.de>; Sat, 19 Apr 2025 01:47:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959673.1351975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vPq-0003O1-Mz; Fri, 18 Apr 2025 23:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959673.1351975; Fri, 18 Apr 2025 23:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5vPq-0003Lp-KJ; Fri, 18 Apr 2025 23:46:38 +0000
Received: by outflank-mailman (input) for mailman id 959673;
 Fri, 18 Apr 2025 23:46:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5vPp-0003Lj-Jd
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 23:46:37 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c766a61-1caf-11f0-9ffb-bf95429c2676;
 Sat, 19 Apr 2025 01:46:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F21D61120;
 Fri, 18 Apr 2025 23:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68FF0C4CEE2;
 Fri, 18 Apr 2025 23:46:32 +0000 (UTC)
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
X-Inumbo-ID: 5c766a61-1caf-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745019993;
	bh=zhQwSCGGyqZvOEkRpK1fbkf99q9VYRWbjps0ZwjydN4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=e+G99QFto6PCmzHQ3F117Gpi0DhG+Riyt2LPc83drxSGBAj8k7nSLnVdUPBzxy14q
	 YR/F9fgFll8BxzVQ34JdcDc/52qWgE/L0PLHltDXmTeSjr3mhFz6EtAutU82wAT8DL
	 uo1fRp7Zea86aeRehE21Ff6EsbmP2jGSWsz/bq9uK8qcsiiFrYjIBFXCiiz6yV4VGA
	 4gxgpuWnEfqfSLY3BRtwTE8zJZ5cATPP9RsPeAiAFnLvRVFWUvoEjQNSy1mLvlmduj
	 oHLfunRCzRVK+NFCKhGRyNHsK8H8R5nF2abtcVLThsX81I+o3wGlK71WTDZt4+oswX
	 01LL2nFRoVhDQ==
Date: Fri, 18 Apr 2025 16:46:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5] xen: debug: gcov: add condition coverage support
In-Reply-To: <20250409101105.2733236-1-volodymyr_babchuk@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504181643380.785180@ubuntu-linux-20-04-desktop>
References: <20250409101105.2733236-1-volodymyr_babchuk@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Apr 2025, Volodymyr Babchuk wrote:
> Condition coverage, also known as MC/DC (modified condition/decision
> coverage) is a coverage metric that tracks separate outcomes in
> boolean expressions.
> 
> This patch adds CONFIG_CONDITION_COVERAGE option to enable MC/DC for
> GCC. Clang is not supported right now because Xen can't emit version
> 10 of LLVM profile data, where MC/DC support was added.
> 
> Also, use the opportunity to convert COV_FLAGS to cov-cflags-y, which
> reduces amount of ifeqs in Rules.mk. Otherwise this patch had to add
> another nesting level with "ifeq ($(CONFIG_CONDITION_COVERAGE),y)".
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v5:
>  - cov-flags-y -> cov-cflags-y
>  - Clarified why Clang is not supported right now
> 
> Changes in v4:
>  - Slight formatting fixes
>  - COV_FLAGS  -> cov-flags-y
> 
> Changes in v3:
>  - Introduced CC_HAS_MCDC that checks if compiler supports
>    required feature
> 
> Changes in v2:
>  - Move gcc version check from .c file to Rules.mk (I can't find
>    an easy way to check GCC version at Kconfig level)
>  - Check for gcc 14, not gcc 14.1
> ---
>  xen/Kconfig       |  4 ++++
>  xen/Kconfig.debug |  9 +++++++++
>  xen/Rules.mk      | 14 +++++++-------
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/Kconfig b/xen/Kconfig
> index 2128f0ccfc..3a723db8ea 100644
> --- a/xen/Kconfig
> +++ b/xen/Kconfig
> @@ -41,6 +41,10 @@ config CC_SPLIT_SECTIONS
>  config CC_HAS_UBSAN
>  	def_bool $(cc-option,-fsanitize=undefined)
>  
> +# Compiler supports -fcondition-coverage aka MC/DC
> +config CC_HAS_MCDC
> +	def_bool $(cc-option,-fcondition-coverage)
> +
>  # Set code alignment.
>  #
>  # Allow setting on a boolean basis, and then convert such selection to an
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index f7cc5ffaab..f89cbd823b 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -44,6 +44,15 @@ config COVERAGE
>  
>  	  If unsure, say N here.
>  
> +config CONDITION_COVERAGE
> +	bool "Condition coverage support"
> +	depends on COVERAGE && CC_HAS_MCDC
> +	help
> +	  Enable condition coverage support. Used for collecting MC/DC
> +	  (Modified Condition/Decision Coverage) metrics.
> +
> +	  If unsure, say N here.
> +
>  config DEBUG_LOCK_PROFILE
>  	bool "Lock Profiling"
>  	select DEBUG_LOCKS
> diff --git a/xen/Rules.mk b/xen/Rules.mk
> index d759cccee3..da21850926 100644
> --- a/xen/Rules.mk
> +++ b/xen/Rules.mk
> @@ -29,6 +29,7 @@ targets :=
>  subdir-y :=
>  CFLAGS-y :=
>  AFLAGS-y :=
> +cov-cflags-y :=
>  nocov-y :=
>  noubsan-y :=
>  
> @@ -133,19 +134,18 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): CFLAGS-y += -DINIT_SECTIONS
>  
>  non-init-objects = $(filter-out %.init.o, $(obj-y) $(obj-bin-y) $(extra-y))
>  
> -ifeq ($(CONFIG_COVERAGE),y)
>  ifeq ($(CONFIG_CC_IS_CLANG),y)
> -    COV_FLAGS := -fprofile-instr-generate -fcoverage-mapping
> +    cov-cflags-$(CONFIG_COVERAGE) := -fprofile-instr-generate -fcoverage-mapping
>  else
> -    COV_FLAGS := -fprofile-arcs -ftest-coverage
> +    cov-cflags-$(CONFIG_COVERAGE) := -fprofile-arcs -ftest-coverage
> +    cov-cflags-$(CONFIG_CONDITION_COVERAGE) += -fcondition-coverage
>  endif
>  
> -# Reset COV_FLAGS in cases where an objects has another one as prerequisite
> +# Reset cov-cflags-y in cases where an objects has another one as prerequisite
>  $(nocov-y) $(filter %.init.o, $(obj-y) $(obj-bin-y) $(extra-y)): \
> -    COV_FLAGS :=
> +    cov-cflags-y :=
>  
> -$(non-init-objects): _c_flags += $(COV_FLAGS)
> -endif
> +$(non-init-objects): _c_flags += $(cov-cflags-y)
>  
>  ifeq ($(CONFIG_UBSAN),y)
>  # Any -fno-sanitize= options need to come after any -fsanitize= options
> -- 
> 2.48.1
> 

