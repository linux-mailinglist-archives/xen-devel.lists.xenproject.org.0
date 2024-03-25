Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AF48894C9
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 09:08:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697601.1088490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofN7-00081C-Dk; Mon, 25 Mar 2024 08:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697601.1088490; Mon, 25 Mar 2024 08:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rofN7-0007y1-AQ; Mon, 25 Mar 2024 08:07:57 +0000
Received: by outflank-mailman (input) for mailman id 697601;
 Mon, 25 Mar 2024 08:07:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yuQ0=K7=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rofN6-0007xv-2x
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 08:07:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7b451bb-ea7e-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 09:07:53 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 2808D4EE073E;
 Mon, 25 Mar 2024 09:07:53 +0100 (CET)
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
X-Inumbo-ID: c7b451bb-ea7e-11ee-a1ef-f123f15fe8a2
MIME-Version: 1.0
Date: Mon, 25 Mar 2024 09:07:53 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, "Daniel P. Smith"
 <dpsmith@apertussolutions.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 00/11] address some violations of MISRA C Rule 20.7
In-Reply-To: <9a9464de-f288-4f98-a194-22def7f2c4be@suse.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <9a9464de-f288-4f98-a194-22def7f2c4be@suse.com>
Message-ID: <cb25bd1e637ea960d0b2d53467a7b345@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-25 09:00, Jan Beulich wrote:
> On 22.03.2024 17:01, Nicola Vetrini wrote:
>> Hi all,
>> 
>> this series aims to refactor some macros that cause violations of 
>> MISRA C Rule
>> 20.7 ("Expressions resulting from the expansion of macro parameters 
>> shall be
>> enclosed in parentheses"). All the macros touched by these patches are 
>> in some
>> way involved in violations, and the strategy adopted to bring them 
>> into
>> compliance is to add parentheses around macro arguments where needed.
>> 
>> Given that the community has previously requested a deviation from the 
>> rule, as
>> stated in docs/misra/deviations.rst, and reported below for 
>> convenience [1],
>> some macro parameters do not need any adjusting (e.g., when used as 
>> lhs to
>> an assignment in statement expressions).
>> 
>> Patch 1 is taken, with adjustments, from [2]. Patches 2 and 3 are 
>> taken from [3]
>> without any modifications. All other patches are new in this series 
>> and are
>> pairwise indipendent.
>> 
>> [1] - Code violating Rule 20.7 is safe when macro parameters are used:
>>        (1) as function arguments;
>>        (2) as macro arguments;
>>        (3) as array indices;
>>        (4) as lhs in assignments.
>> 
>> [2] 
>> https://lore.kernel.org/xen-devel/b93a64b93ef4210f5fe96368c2522e5e71e9c87c.1709896401.git.nicola.vetrini@bugseng.com/
>> [3] 
>> https://lore.kernel.org/xen-devel/cover.1710762555.git.nicola.vetrini@bugseng.com/
>> 
>> Nicola Vetrini (11):
>>   xen/list: address violations of MISRA C Rule 20.7
>>   xen/xsm: add parentheses to comply with MISRA C Rule 20.7
>>   xen/efi: efibind: address violations of MISRA C Rule 20.7
>>   xentrace: address violation of MISRA C Rule 20.7
>>   xen: address MISRA C Rule 20.7 violation in generated hypercall
>>   xen/efi: address violations of MISRA C Rule 20.7
>>   xen/page_alloc: address violations of MISRA C Rule 20.7
>>   x86/altcall: address violations of MISRA C Rule 20.7
>>   x86/msi: address violation of MISRA C Rule 20.7 and coding style
>>   x86/hvm: address violations of Rule 20.7
>>   x86/public: hvm: address violations of MISRA C Rule 20.7
> 
> Just to clarify: While most of the patches here are new, two(?) I think
> were submitted before. As such, to indicate that, the series as a whole
> would want to be tagged v2.
> 
> Jan

Ok, that was an oversight. Technically the list.h patch makes this a v3, 
then.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

