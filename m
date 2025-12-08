Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0D1CADC6D
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180986.1504075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeGf-0001FR-AS; Mon, 08 Dec 2025 16:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180986.1504075; Mon, 08 Dec 2025 16:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeGf-0001D4-7V; Mon, 08 Dec 2025 16:39:21 +0000
Received: by outflank-mailman (input) for mailman id 1180986;
 Mon, 08 Dec 2025 16:39:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vSeGd-0001Cy-2Q
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:39:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vSeGc-0009Mz-0X;
 Mon, 08 Dec 2025 16:39:18 +0000
Received: from [2a01:cb15:80df:da00:7079:39df:8b4d:ea79] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vSeGc-005cys-0N;
 Mon, 08 Dec 2025 16:39:18 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=erDQNhPQnli6NK7O5q8fXQsL8fB1DgElrBNi8bTXA6A=; b=epuqHEc88oc3O0cgCQe8DpvDDd
	hs17FhTrovAXyisKXymYVe2icH9Ex1Jx8XPRdqiLG8YMfz38btKLrbFzckRtnuZU1zyrft6OZZrel
	carb5TknSjXUG9W5FSJplKqbCr0wm1gqkbKtoDaHuGvgSJQEFLUdDdjc8tFwegexAqRM=;
Date: Mon, 8 Dec 2025 17:39:15 +0100
From: Anthony PERARD <anthony@xenproject.org>
To: dmukhin@xen.org
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v1 1/2] tests: fixup domid test harness dependencies
Message-ID: <aTb_M48P_nBh73Sc@l14>
References: <20251204123712.721443-1-dmukhin@ford.com>
 <20251204123712.721443-2-dmukhin@ford.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204123712.721443-2-dmukhin@ford.com>

On Thu, Dec 04, 2025 at 04:37:11AM -0800, dmukhin@xen.org wrote:
> diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> index 753129029ed9..1a2129d20655 100644
> --- a/tools/tests/domid/Makefile
> +++ b/tools/tests/domid/Makefile
> @@ -14,16 +14,18 @@ $(shell sed -n \
>      's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
>  endef
>  
> -# NB: $1 cannot be a list
> +# $1 target
> +# $2 list of test harnesses
>  define emit-harness-nested-rule
> -$(1): $(CURDIR)/harness.h
> -	mkdir -p $$(@D);
> -	ln -sf $$< $$@;
> +$(1): $(2)
> +	mkdir -p $$(@D); \
> +	for i in $$<; do ln -sf $$$$i $$@; done

This doesn't work.

First, on the first line, the introduction of the backslash mean that
error from `mkdir` are ignored, Make will execute both line in the same
shell instead of 2 separate shell. You would need to add `set -e` if
executing all lines of the recipe in the same shell is useful.

Second, $< only refer to the first prerequisite. So only a single
symlink is created, even if $(2) list multiple files.

Third, if we fix to loop through all the dependencies, the loop will
still only create a single symlink, the last iteration will overwrite
the previous one.

Thanks,

-- 
Anthony PERARD

