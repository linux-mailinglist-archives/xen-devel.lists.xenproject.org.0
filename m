Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244187BB4A1
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 11:58:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613454.953962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohax-0001eR-8j; Fri, 06 Oct 2023 09:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613454.953962; Fri, 06 Oct 2023 09:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohax-0001cZ-5t; Fri, 06 Oct 2023 09:58:07 +0000
Received: by outflank-mailman (input) for mailman id 613454;
 Fri, 06 Oct 2023 09:58:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl8M=FU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qohav-0001cS-Uc
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 09:58:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7209f46-642e-11ee-9b0d-b553b5be7939;
 Fri, 06 Oct 2023 11:58:03 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 1BEFE4EE0738;
 Fri,  6 Oct 2023 11:58:03 +0200 (CEST)
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
X-Inumbo-ID: d7209f46-642e-11ee-9b0d-b553b5be7939
MIME-Version: 1.0
Date: Fri, 06 Oct 2023 11:58:03 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 1/2] xen: introduce a deviation for Rule
 11.9
In-Reply-To: <605f8045-754d-4d3c-b1b3-3bb34112bfc8@xen.org>
References: <cover.1696494834.git.nicola.vetrini@bugseng.com>
 <98bc1d90b93856ed7516a19114facf6528120248.1696494834.git.nicola.vetrini@bugseng.com>
 <605f8045-754d-4d3c-b1b3-3bb34112bfc8@xen.org>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <2aafb9710b4754e8d57acc1f769693b4@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2023 11:27, Julien Grall wrote:
> Hi,
> 
> On 05/10/2023 09:45, Nicola Vetrini wrote:
>> The constant 0 is used instead of NULL in '__ACCESS_ONCE' as a
>> compile-time check to detect non-scalar types; its usage for this
>> purpose is documented in rules.rst as an exception.
> Documenting ACCESS_ONCE() in rules.rst seems a bit odd. I am guessing
> that other analysis tool may point out the same error and therefore it
> would seem more appropriate to use a deviation.
> 
> This would also avoid having a specific rule in the Eclair
> configuration for __ACCESS_ONCE().
> 

I figured a single accepted use would benefit from an explicit 
exclusion.
I can rework it to use an in-code comment to deviate, in whatever form 
that comment may be
(still with some bits of ECLAIR-specific configuration anyway, as 
discussed for R2.1).

>> 
>> Furthermore, the 'access_field' and 'typeof_field' macros are
>> introduced as a general way to deal with accesses to structs
>> without declaring a struct variable.
>> 
>> Cleanup of spurious MISRA deviations.
> 
> Please don't do that. This is making the review of the patches a lot
> more complicated because there are unrelated changes (see [1]).
> 
> We often allow simple clean-up if they are in the context. But this is
> not the case here.
> 

Understood. There will be a separate MISRA deviations cleanup/update 
patch anyway,
so these can be included there.


> [1] 
> https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#What_is_in_a_patch_series.3F

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

