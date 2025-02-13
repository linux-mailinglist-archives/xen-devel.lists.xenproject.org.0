Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99D5A34734
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 16:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887811.1297261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibCU-0007PG-Bl; Thu, 13 Feb 2025 15:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887811.1297261; Thu, 13 Feb 2025 15:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tibCU-0007Mf-8b; Thu, 13 Feb 2025 15:32:26 +0000
Received: by outflank-mailman (input) for mailman id 887811;
 Thu, 13 Feb 2025 15:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fKD7=VE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tibCS-0007MZ-GX
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 15:32:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b830710e-ea1f-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 16:32:22 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D4A464EF40C8;
 Thu, 13 Feb 2025 16:32:21 +0100 (CET)
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
X-Inumbo-ID: b830710e-ea1f-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739460742; bh=g/RCIobIcOAtpyhrU2Z/MfFJTDXgw3oZvhDDMiM6Vfs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B4zIJ2p3Sl8MqqyG6YGlC4YwyPenbZsnvvAHnc3ZE3l+ALZfR1Q8/33H7Af1U57Nx
	 hziQ92omvDV2ZrAhz+ht9vgt1LbVvhlRyjgXD/VVafQCQXwqpXV+LwSz01InJQHRSd
	 sy+UilevzaGEVYBFgTRfQHFMQqNUCT8i52BrcabTRHKVaV8Te0TyH+atfpNheJDE7n
	 7djIp4o2aVDC5PFe0PD6W80GacaxXp8HSPlL6+Wf8pn4Y3G1pvtROlpTadYCjvmaDm
	 IkRhyHHUNXXugt7vZS1uAFeDfA0rMSW+vSyM/kwXXbO7Ugfo2gxRso1e8doJl/U7s7
	 //xXjZ8KBOWFQ==
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 16:32:21 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
 <teddy.astie@vates.tech>
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
In-Reply-To: <2118904d-3a33-47f3-af68-7303bc17186c@suse.com>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
 <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com>
 <2118904d-3a33-47f3-af68-7303bc17186c@suse.com>
Message-ID: <e34113912d9886a876fd5f3bd094abb2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-13 16:01, Jan Beulich wrote:
> On 13.02.2025 15:52, Nicola Vetrini wrote:
>> On 2025-02-13 15:22, Jan Beulich wrote:
>>> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), 
>>> yet
>>> left shifting negative values is UB. Use an unsigned intermediate 
>>> type,
>>> reducing the impact to implementation defined behavior (for the
>>> unsigned->signed conversion).
>>> 
>>> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric
>>> 'l'
>>> tag.
>>> 
>>> No difference in generated code, at least on x86.
>>> 
>>> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions)
>>> radix_tree_int_to_ptr()")
>>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Bugseng: Why was the 7.3 violation not spotted by Eclair? According 
>>> to
>>>          tagging.ecl the codebase is clean for this rule, aiui.
>>> 
>> 
>> radix-tree.{c,h} is out of scope:
>> 
>> automation/eclair_analysis/ECLAIR/out_of_scope.ecl:32:-file_tag+={out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
>> docs/misra/exclude-list.json:153:            "rel_path":
>> "common/radix-tree.c",
> 
> Is there a record of why they are excluded? Is it further explainable
> why exclude-list.json mentions only the .c file and out_of_scope.ecl
> mentions only the .h one? Shouldn't different parts be in sync?
> 

exclude-list.json is used to generate a configuration file for ECLAIR 
just before the analysis starts, so effectively both are excluded. It's 
a good point however to have only one file to handle exclusions, and use 
that file to generate the exclusion list dynamically, but then someone 
might want to exclude certain files only in some analyses and not 
others, which is not a good fit for exclude-list.json as it is now.

@Stefano, thoughts?

Thanks,
  Nicola

>> We are in the process of setting up a wider analysis (i.e. with a
>> different exclusion set) with a broader configuration that may catch
>> these issues.
> 
> Good.
> 
> Jan

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

