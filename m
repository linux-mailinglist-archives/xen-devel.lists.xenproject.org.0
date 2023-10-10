Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB307BF08B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 03:57:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614572.955759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1zW-0004Fu-LM; Tue, 10 Oct 2023 01:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614572.955759; Tue, 10 Oct 2023 01:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qq1zW-0004Cf-Ho; Tue, 10 Oct 2023 01:56:58 +0000
Received: by outflank-mailman (input) for mailman id 614572;
 Tue, 10 Oct 2023 01:56:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z25Z=FY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qq1zU-0004BM-HD
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 01:56:56 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4914f946-6710-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 03:56:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6ADD761477;
 Tue, 10 Oct 2023 01:56:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F748C433C7;
 Tue, 10 Oct 2023 01:56:51 +0000 (UTC)
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
X-Inumbo-ID: 4914f946-6710-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696903013;
	bh=8Ulxio6D+JHDAmi5hAaNX7bz28rzG/V8egW2RBoMVIQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XIH3DFppAU9NNyYXUG1f1aYZvq9USH4sy4zJ7sBGMcxIrwVi23/uvzOm2KQb9qN0l
	 BFnQKmXHyjaxir+MmSxMxao0HJS7QEKCbHXlX6nBII8DtP9eRknZbrk051XMulmSeK
	 JsLV8g6AC33Hh0jlm1TvisMBrvR1d+S2Ef9G8s2J7lLVaM5myN1ohQu02A5j/P4lGq
	 omBVR+AlPMzgt59UAFXBoyywkJsjkvGdDz1bMP99DFT9EbWDE0+D7CkUCKKyTZd68z
	 r0FbTMQ8Tn6tB8+wC8cpxHMf7HnPvQzGyC5JXWTVVTz1SuUHs1x6OkbYQY3A+tPiDJ
	 fVjf//EdrgQnw==
Date: Mon, 9 Oct 2023 18:56:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    consulting@bugseng.com, roger.pau@citrix.com, dfaggioli@suse.com
Subject: Re: Rule 10.1 violations in perfc_incra and PERFCOUNTER_ARRAY
In-Reply-To: <5cfaaaceb163af3244981b020ed55f3f@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310091838510.3431292@ubuntu-linux-20-04-desktop>
References: <5cfaaaceb163af3244981b020ed55f3f@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Oct 2023, Nicola Vetrini wrote:
> Given the following macros in <xen/perfc.h> and
> 
> #define perfc_incra(x,y)                                                \
>     ( (y) <= PERFC_LAST_ ## x - PERFC_ ## x ?                           \
> 	 ++this_cpu(perfcounters)[PERFC_ ## x + (y)] : 0 )
> 
> and the following violation
> 
> xen/arch/arm/traps.c:1407.5-1407.32:
>   reference to enum constant `PERFC_hypercalls' has essential type `enum
> perfcounter'
>   and standard type `int'
>  <preprocessed xen/arch/arm/traps.c>:11606.29-11606.44: preprocessed tokens
>  <scratch space>:137.1-137.16: expanded from macro `PERFC_'
>  xen/include/xen/perfc.h:69.35-69.45: expanded from macro `perfc_incra'
> xen/arch/arm/traps.c:1407.5-1407.32:
>   `+' addition operator expects a number or a character
>  <preprocessed xen/arch/arm/traps.c>:11606.46: preprocessed tokens
>  xen/include/xen/perfc.h:69.47: expanded from macro `perfc_incra'
> 
> the difference between enumerated values is forbidden by the Rule. In the
> coding standard's
> interpretation, named enums are unordered list of symbols, which can only be
> compared for
> equality.
> There are a few possible paths forward:
> 
> 1. use means different from named enums to generate these constants (such as
> #define-s or
>    constants integers);

This is a viable option


> 2. explicitly deviate subtraction of enums, therefore defining an explicit
> ordering on
>    enumerated values;

I would prefer to avoid a project-wide deviation, because I think in
general it is a good rule to have. If we go with a deviation, I think it
would be better to deviate PERFCOUNTER or perfc.h specifically. This is
a file that changes very rarely. We could make the case that this is
safe with GCC (most probably is) and this case was reviewed carefully
and doesn't change often (3 changes in the last 10 yeas).


> 3. use an unnamed enum, effectively considering the enumerated values as plain
> integers.
>    This does not violate the Rule.

What do you mean by unname enum?

