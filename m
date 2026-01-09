Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB042D0A7B9
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 14:48:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198840.1515657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCpy-0005iM-Kk; Fri, 09 Jan 2026 13:47:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198840.1515657; Fri, 09 Jan 2026 13:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veCpy-0005fj-Gq; Fri, 09 Jan 2026 13:47:34 +0000
Received: by outflank-mailman (input) for mailman id 1198840;
 Fri, 09 Jan 2026 13:47:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTJE=7O=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1veCpx-0005eH-6A
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 13:47:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be70e011-ed61-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 14:47:31 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 216514EE3C11;
 Fri,  9 Jan 2026 14:47:30 +0100 (CET)
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
X-Inumbo-ID: be70e011-ed61-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767966450;
	b=0zjHDCjrRtxvZoRQweEQBTwrfH1OdmsJBONZI4neZfm7G8iWkqRir4utSl2m89/yCT8Q
	 3lOV7sSk/mqaCk+RQw0xqDPzn0A11Jnrkogn0ZLFjH+7ud5rhIq7BpdICVb1KUAKo5nZt
	 CF/GPZb7asY9WF1Y4LhnuV51+T9ghnsjosy3NNDfhyvjPWBYcc1Lrt5FDTK9Bj8ZapqAR
	 GbxGT5yGrreQnYdD77myUmXsRSy1/Fywq24u0D50DoFk9LU2E80AS9xdFc4ZxpJp/kxoA
	 kncL/r5eT4R3FNUKhfgwm5HLHGw/Eyk8Gp4UCpG52NyBt60nLBpr2/IvQ84uVwdGcVz0p
	 I3MYURPk4DbbtSDEHOo+aly77cq6twvygt1vCJrLv6UrdppeZRmvCX9z8xfJjyUWMjgc2
	 qJGZ+Wk/OaAUR21QdSBOCUl/3melupWdEIkx021Q1Zgn01PCugkmWabVOHL6TWPbhXcWb
	 MD8cHrtL2V3YsLUA2DvPntbY+OSU/ZkSvr4g0iMs2/nrbztyTi8btoDJWEzaB6o4zibW3
	 Tw4D9ZTR+iKIbC4urCIJ/8IXTE/qFGLsE2A/zNP3ub14FAcysL3exae4oUQtPPLFL4als
	 mDoC97QxL9YylHOWwH8MaDdUx/hb6Et+cMYk1ZfTbPsm3Qmh6fk35GmE3F2Tio0=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767966450;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=43uGOl9QcAOHv+wuK+FTtpUjHIexCK/0igWh8XWoB48=;
	b=U3x6diUhVX3RQXpoW49Mt6Ix+wYy4cZcqoyZEiDXQ3W/t+jyA5TpJDINFGiqE5Ad/SCV
	 J+Qjvc/XKkMcZ4UvglsIT65rHicQwFNZm9uLs5zCZkRXDgEoqpTz11yJwYTmqwye2g1hN
	 qySwBlkBCgc7pDrxzRlpN4OhFPvQFHUoskHGX2bRTciM6hgIZPHiTgmO79e46wKzJyzHi
	 dbt5534UNW6FfTebj2BGFuoYviXh26J/mij7PBaxA6WPxsndLo7jkcrA8AxKin3tyLiOw
	 SqCoMIsZAW4OER2sV48yLxZwkfqfdd2ieWmvJjxPJWbFPEWwtIRrIsTsrQUoQMV2YafsO
	 qpZB6A1vH2f5urjHylG4qCtc10SCYT9soRVqkO+eRg0+hijl6JzK+x8M3LGS0RxBYdMOO
	 cZt4/sRVIIOnOCkarlQtGMQlgyGGiak3OXy9J00YNi+SNdyZRZJc2Q0UofZ9KlFAs//rt
	 FdltMJKXVkE0ETpIXEReSEE93CM6+0DdxUxAXQGo8Co8IvDcCZ4ZW+dwMr+c9l52RLkPd
	 cAHrP7lw+kiGqyw/yBZ+Q/sBHdBvrT0ll4LrMMnQB6tmZbEgNsEvSe0ivtJRQhO7L0v9c
	 3Jv+rCYNAuKhrQaAVgAUlzkbfrzWU9FIUVvCCiGMuqb+9oIG3DcnJhC1ujYibAk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
MIME-Version: 1.0
Date: Fri, 09 Jan 2026 14:47:30 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH] MISRA: Extend the R3.1 deviation for URLs to include
 git://
In-Reply-To: <20260109131807.860397-1-andrew.cooper3@citrix.com>
References: <20260109131807.860397-1-andrew.cooper3@citrix.com>
Message-ID: <3708b916520ba100cbf931d632c990b1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2026-01-09 14:18, Andrew Cooper wrote:
> xen/drivers/passthrough/arm/ipmmu-vmsa.c contains a git:// URL in a 
> block
> comment.  This is also not an example of commented out code, so 
> shouldn't be
> considered a R3.1 violation.
> 
> Extend the regex to include git://, and swap hyperlink for URL in the
> associated documentation to be more precise.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2252341951
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++--
>  docs/misra/deviations.rst                        | 4 ++--
>  docs/misra/rules.rst                             | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 7dee4a488d45..30c323906924 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -58,9 +58,9 @@ removed by the compiler, the resulting slowdown is 
> negligible."
>  # Series 3.
>  #
> 
> --doc_begin="Comments starting with '/*' and containing hyperlinks are 
> safe as
> +-doc_begin="Comments starting with '/*' and containing URLs are safe 
> as
>  they are not instances of commented-out code."
> --config=MC3A2.R3.1,reports+={safe, 
> "first_area(text(^.*https?://.*$))"}
> +-config=MC3A2.R3.1,reports+={safe, 
> "first_area(text(^.*(https?|git)://.*$))"}
>  -doc_end
> 
>  #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 0d90f5886e7e..17c21537f286 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -117,8 +117,8 @@ Deviations related to MISRA C:2012 Rules:
>       - Tagged as `deliberate` for ECLAIR.
> 
>     * - R3.1
> -     - Comments starting with '/\*' and containing hyperlinks are safe 
> as they
> -       are not instances of commented-out code.
> +     - Comments starting with '/\*' and containing URLs are safe as 
> they are
> +       not instances of commented-out code.
>       - Tagged as `safe` for ECLAIR.
> 
>     * - R5.3
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 4e9425188742..b3e929307d51 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -143,7 +143,7 @@ maintainers if you want to suggest a change.
>       - Required
>       - The character sequences /* and // shall not be used within a
>         comment
> -     - Comments containing hyperlinks inside C-style block comments 
> are safe
> +     - Comments containing URLs inside C-style block comments are safe
> 
>     * - `Rule 3.2 
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_03_02.c>`_
>       - Required

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

