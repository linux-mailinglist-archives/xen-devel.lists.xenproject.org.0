Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AC9A34814
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 16:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887855.1297301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibMl-0002GJ-6a; Thu, 13 Feb 2025 15:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887855.1297301; Thu, 13 Feb 2025 15:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibMl-0002Eq-3n; Thu, 13 Feb 2025 15:43:03 +0000
Received: by outflank-mailman (input) for mailman id 887855;
 Thu, 13 Feb 2025 15:43:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKD7=VE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tibMj-0002Ej-7N
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 15:43:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 336d8a5c-ea21-11ef-abfc-e33de0ed8607;
 Thu, 13 Feb 2025 16:42:59 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id F03264EF40C8;
 Thu, 13 Feb 2025 16:42:57 +0100 (CET)
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
X-Inumbo-ID: 336d8a5c-ea21-11ef-abfc-e33de0ed8607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739461378; bh=exGqb50+WOYAlzdIErWVAOwyuWfgOumS1UqnwHoWYJQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CWCNn/tIYvqzXfIY3jX0Nlow+hDkspXAU2fc46AfvVcVtZ7meAH7UQTIM7HmCKyIX
	 hj1lCEKCmyP0gOZQ2Ilqqem3SIM2Uw4Gi6dNKWXBWheo8IAJGfCLP3eTLKgzHX8eMF
	 WXeTwOss+K/6DUGNRRlZ47FR1s3pavHR9HuhG/P+qd9rrl6zce+0064i60Z7bhxdWa
	 38iWzOfZIOSKdZVUtL2hMoFDrnb7rPNukKI4I1ke2+RIbfCRu1QWnGJwN3CXyQ5L3g
	 pux2LY1ZA1v2G+8yT/PIK7SvWbMIx4coc6JsWK023M5XWYUdyA779ny8aHoSZwgljO
	 wPyDllE808T9g==
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 16:42:57 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
 <teddy.astie@vates.tech>, Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
In-Reply-To: <e34113912d9886a876fd5f3bd094abb2@bugseng.com>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
 <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com>
 <2118904d-3a33-47f3-af68-7303bc17186c@suse.com>
 <e34113912d9886a876fd5f3bd094abb2@bugseng.com>
Message-ID: <8ca92f7360385a5b4033cf22ef843775@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-13 16:32, Nicola Vetrini wrote:
> On 2025-02-13 16:01, Jan Beulich wrote:
>> On 13.02.2025 15:52, Nicola Vetrini wrote:
>>> On 2025-02-13 15:22, Jan Beulich wrote:
>>>> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), 
>>>> yet
>>>> left shifting negative values is UB. Use an unsigned intermediate 
>>>> type,
>>>> reducing the impact to implementation defined behavior (for the
>>>> unsigned->signed conversion).
>>>> 
>>>> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric
>>>> 'l'
>>>> tag.
>>>> 
>>>> No difference in generated code, at least on x86.
>>>> 
>>>> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions)
>>>> radix_tree_int_to_ptr()")
>>>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Bugseng: Why was the 7.3 violation not spotted by Eclair? According 
>>>> to
>>>>          tagging.ecl the codebase is clean for this rule, aiui.
>>>> 
>>> 
>>> radix-tree.{c,h} is out of scope:
>>> 
>>> automation/eclair_analysis/ECLAIR/out_of_scope.ecl:32:-file_tag+={out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
>>> docs/misra/exclude-list.json:153:            "rel_path":
>>> "common/radix-tree.c",
>> 
>> Is there a record of why they are excluded? Is it further explainable
>> why exclude-list.json mentions only the .c file and out_of_scope.ecl
>> mentions only the .h one? Shouldn't different parts be in sync?
>> 
> 
> exclude-list.json is used to generate a configuration file for ECLAIR 
> just before the analysis starts, so effectively both are excluded. It's 
> a good point however to have only one file to handle exclusions, and 
> use that file to generate the exclusion list dynamically, but then 
> someone might want to exclude certain files only in some analyses and 
> not others, which is not a good fit for exclude-list.json as it is now.
> 
> @Stefano, thoughts?
> 

I forgot to address the first question: the (vague) reasons are listed 
in exclude-list.json as the "comment" field; in most cases, it's because 
the files have been imported from Linux, but the full rationale is 
something that should be asked to the original author, which is Luca 
Fancellu. Over the past months, I made small edits upon receiving 
feedback from the community (e.g., excluding gdbsx.c), but there's the 
possibility that the content should be re-evaulated in its entirety 
(which will likely lead to additional MISRA violations being generated, 
even for clean rules, as you correctly pointed out) and possibly lead to 
different sets of excluded files depending on the type of analysis 
(i.e., a restricted "safety" configuration and a wider "community" 
configuration).

> Thanks,
>  Nicola
> 
>>> We are in the process of setting up a wider analysis (i.e. with a
>>> different exclusion set) with a broader configuration that may catch
>>> these issues.
>> 
>> Good.
>> 
>> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

