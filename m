Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865EC915AFA
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:23:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746999.1154244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLtxP-00028Z-7a; Tue, 25 Jun 2024 00:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746999.1154244; Tue, 25 Jun 2024 00:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLtxP-00026S-46; Tue, 25 Jun 2024 00:22:47 +0000
Received: by outflank-mailman (input) for mailman id 746999;
 Tue, 25 Jun 2024 00:22:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLtxN-00026K-IL
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:22:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08fd6638-3289-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:22:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 239A0CE1714;
 Tue, 25 Jun 2024 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E03EC2BBFC;
 Tue, 25 Jun 2024 00:22:35 +0000 (UTC)
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
X-Inumbo-ID: 08fd6638-3289-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719274956;
	bh=MtJzAN103UKml9zS9D9mBw0ALe9QMyeKjxbf9lqVVHQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F7D1w3CHhtGffmgIq98vfQfZyYGsOQ+D3LgFZgX4jH7bklJecx5q1StxbrGrlPRSr
	 K+bT4rGrOa9KBxwqwThJIwll6qWaMgYWGXZZfI8eH6ILrKQ+iG0JTx3LYiJT2FZrIo
	 CZ/jXjvsFHmBWJ/9460lrnAmeNUELbZXXMGQ1ingDUr/x7R1nwXF9S6SphxWFOYOTO
	 00IUgWm0U9p75tGTcc98bodXTOfVisED94nKQ6joT8eWBcpiGNinJoFGmMwXdEPA5V
	 ESz/9JV1ebt0Fy1YbMoPi8YwKpoeC2VJJPcXAHeD0+aYOCUk91CFiRl0aDnO5SB6nM
	 +OD5VJoHHeQsg==
Date: Mon, 24 Jun 2024 17:22:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, oleksii.kurochko@gmail.com
Subject: Re: [PATCH v3] automation/eclair_analysis: deviate and|or|xor|not
 for MISRA C Rule 21.2
In-Reply-To: <f21ea3734857e0cf26afff00befb179b10d02158.1719213594.git.alessandro.zucchelli@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241721270.3870429@ubuntu-linux-20-04-desktop>
References: <f21ea3734857e0cf26afff00befb179b10d02158.1719213594.git.alessandro.zucchelli@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jun 2024, Alessandro Zucchelli wrote:
> Rule 21.2 reports identifiers reserved for the C and POSIX standard
> libraries: or, and, not and xor are reserved identifiers because they
> constitute alternate spellings for the corresponding operators (they are
> defined as macros by iso646.h); however Xen doesn't use standard library
> headers, so there is no risk of overlap.
> 
> This addresses violations arising from x86_emulate/x86_emulate.c, where
> label statements named as or, and and xor appear.
> 
> No functional change.
> 
> Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Hi Oleksii,

I am asking for a release-ack as this patch adds a deviation, the only
impact is fewer violations from the ECLAIR analysis


> ---
> Changes from v2:
> Fixed patch contents as the changes from v1 and v2 were not squashed together.
> ---
> Changes from v1:
> Added deviation for 'not' identifier.
> Added explanation of where these identifiers are defined, specifically in the
> 'iso646.h' file of the Standard Library.
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 9fa9a7f01c..14c7afb39e 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -498,6 +498,12 @@ still remain available."
>  -config=MC3R1.R21.2,declarations+={safe, "!^__builtin_.*$"}
>  -doc_end
>  
> +-doc_begin="or, and and xor are reserved identifiers because they constitute alternate
> +spellings for the corresponding operators (they are defined as macros by iso646.h).
> +However, Xen doesn't use standard library headers, so there is no risk of overlap."
> +-config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
> +-doc_end
> +
>  -doc_begin="Xen does not use the functions provided by the Standard Library, but
>  implements a set of functions that share the same names as their Standard Library equivalent.
>  The implementation of these functions is available in source form, so the undefined, unspecified
> -- 
> 2.34.1
> 

