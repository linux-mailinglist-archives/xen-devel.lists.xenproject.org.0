Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF37A496EA
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 11:20:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898602.1307122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnxT0-0003ub-Mp; Fri, 28 Feb 2025 10:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898602.1307122; Fri, 28 Feb 2025 10:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnxT0-0003sI-K7; Fri, 28 Feb 2025 10:19:38 +0000
Received: by outflank-mailman (input) for mailman id 898602;
 Fri, 28 Feb 2025 10:19:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8joV=VT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tnxSz-0003sC-5I
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 10:19:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82256f85-f5bd-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 11:19:35 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 94EB24EF54BF;
 Fri, 28 Feb 2025 11:19:34 +0100 (CET)
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
X-Inumbo-ID: 82256f85-f5bd-11ef-9aaf-95dc52dad729
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1740737974;
	b=jWOfQyTR56YUNxMXLRfTcrYKwafUMsGh1kOQeecH9zRc2UofLj0/c9Fnj2+CmH1dIGVg
	 RDgcyDBSztSWDDUEKbjhKjWslk81HVioygODiwmU5WuCGiDV8hN8k0YdixX5aybCibt7W
	 eSBY3Wn/HcVpG4mpfd5GR4yTVNp+AO7F8z36gnDPHIKug/rLrzikfeJGAmiTrd3T6MOG1
	 UmykUSwK9dJmMxCqKf80QcHZmmWPslHBG2Aah9j88zznvaT3AljCrvMrY9o6SrdXoZikZ
	 oUwOlxHc2fn87ARibw9kGEofSVblspdhaqPx9Bh3UDGyMeIGxavIcKB0VS6+/WCD86NKl
	 aJI3M3pceAzHepKw04zhgjggnsvUnS5t5sA0579/R/ceRYRKDPBo7Pamhk1WED/HnJVCk
	 tkH0zSaYD+H3jZyoalzjabnLzZOW353lGBfSwV9HwnEAZfCoT+zJd3N/9bvzbaSwMZ/co
	 QWBtqnuiLU5D49d5x4C4BlkZEabWImxh49m9xpjrCLQ8s8AFapWv3//3bV9sGnhzTn9P9
	 bCQ5ppc7wJ/EGFoyWKp5AHrp2kehPj9x29MpKpfPEzRpCP6dEyTQOk49jsgvvtX/ybnla
	 gIfObBZm0sWtbPImQqdf7/J7sQJHiXhjQ2t9w/On4dW31TMcM4b0drl7X//li2M=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1740737974;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ww+nkWg190Kxcj6JBiNBknRjfHK9WzaxLu090Jvkt3c=;
	b=3GODTAkgaZ4nko+bTnJIkeaL5zXzcn3yp5VWJuhqjmWT9Y6C1ilExKTQVB+652cLJmpH
	 mH4qVgUNCcTHoz3sQHlkTik3iWoIcZlY7sAXL74fdFtxq8X7FIK94w06apigN74n6HuhF
	 8nP9yik6CjOu5OlwPAadEPIriRzsRSAYa7aTcIBVhL7bIq5NM2GeLORw4bg3aRkA0PErZ
	 eeY7hV4OkoIXuBJaVpWhghOTko7hVwXW4Iv+i9lbaXriorEI4sfvdXVIiMv1SvIECgyud
	 rRmCQ8WhOO6wjob7p5tkDd6bvj9uAQ6JrRG3LOarCEUypb5orxhgdZIsGGFmCZZZft1/e
	 0Rm9PM2wFX8RKFZRSiY9MefPIDbKW3zlI59SO4ORVTXyvUkfvkL6ieR1z7M28sLWENjmK
	 4zaS+IxESCRoG+bnj/YURdPsTZBxt2kpvcsiyd+HIQbT3SPyCL/T3YuWQPNLu9ooVOksJ
	 mLN+XZC6atAhm1PnQKAy2McjyqgLQg+f2LQmTSh/eAPZm5RcfAWos++wGbkJKq9Zgo+eY
	 EbisOX2sN7gxj9pVxUbsrZ+P3A5pti/L+LAiIhUt4d6VyXEN367Y8IYm4kJY38QV01tWJ
	 DygGcHYJRLJNuLVEx+990y0PJKn2POtyR1R5Uurj6HhZkGdAapr7KqEWRymILcA=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1740737974; bh=WCNKO5eVWfiQk/GS/0lUOya5uLM6sYynyEJddQ5sRZg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RuDx/9bE2JhkgHfbkJUVg9aXEnGJ/EKp7OUBgdJUzyupoR05P8REGjYFUNpit47uX
	 Bd+7omrPCRomkg+EAT0wio6cwEU5s6b7hbN/+iPTwq6pec3DGFLdkmDs/LxXVPvfoY
	 fUmOHPwCBCQVS1gdLsH+pfi8kC5NZ7bJNME4Kxu1r9ZbYEsCzbExCfS5xGjMK408yb
	 EanzsFIZ7u9er2ZuNownJLhngvW1q0jYSoR25mlwZDroPJ3GXA78iMBk90FqfmeYEI
	 DvV8AX/Ib9Uj6SUnOwOzTDzqwqVK+DYyxyWb+EV+1WBL7trkMvlsKPPMVWOLw3JbjC
	 TbdJWJH8w3EIg==
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 11:19:34 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Michal
 Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, "consulting @ bugseng . com"
 <consulting@bugseng.com>
Subject: Re: [PATCH] MISRA: Update path for bsearch devation
In-Reply-To: <20250228100604.1955747-1-andrew.cooper3@citrix.com>
References: <20250228100604.1955747-1-andrew.cooper3@citrix.com>
Message-ID: <f329a4d65ca17aa9f8ad2bce8cfe35e0@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-02-28 11:06, Andrew Cooper wrote:
> This ought to have been part of the original patch, so as to avoid 
> breaking
> CI.
> 
> Fixes: 31c0d6fdf421 ("xen/bsearch: Split out of lib.h into it's own 
> header")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1693121902
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
> b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index a28eb0ae7658..dfa5f34b3952 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -231,7 +231,7 @@ Therefore the absence of prior declarations is 
> safe."
> 
>  -doc_begin="Given that bsearch and sort are defined with the attribute 
> 'gnu_inline', it's deliberate not to have a prior declaration.
>  See Section \"6.33.1 Common Function Attributes\" of \"GCC_MANUAL\" 
> for a full explanation of gnu_inline."
> --file_tag+={bsearch_sort, "^xen/include/xen/(sort|lib)\\.h$"}
> +-file_tag+={bsearch_sort, "^xen/include/xen/(sort|bsearch)\\.h$"}
>  -config=MC3A2.R8.4,reports+={deliberate, 
> "any_area(any_loc(file(bsearch_sort))&&decl(name(bsearch||sort)))"}
>  -doc_end
> 
> 
> base-commit: 31c0d6fdf421b09327448351eb13bc4f1f40106b

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

