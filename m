Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E69E776036
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 15:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581080.909610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiv6-0007vD-Sh; Wed, 09 Aug 2023 13:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581080.909610; Wed, 09 Aug 2023 13:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTiv6-0007si-Pu; Wed, 09 Aug 2023 13:08:12 +0000
Received: by outflank-mailman (input) for mailman id 581080;
 Wed, 09 Aug 2023 13:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hYF7=D2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTiv4-0007sc-Nh
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 13:08:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c790fb95-36b5-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 15:08:06 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A31644EE073F;
 Wed,  9 Aug 2023 15:08:05 +0200 (CEST)
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
X-Inumbo-ID: c790fb95-36b5-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 15:08:05 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 4/8] xen/arm: address MISRA C:2012 Rule 8.4
In-Reply-To: <cfbc7569-3714-2200-054c-49ba593d6903@suse.com>
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <c2b0bb92a246e5cf149b1ec81c6ed635a275f9df.1691575243.git.nicola.vetrini@bugseng.com>
 <cfbc7569-3714-2200-054c-49ba593d6903@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <744a4ae451f3751d5a6c97e5f28cdaf1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 09/08/2023 14:42, Jan Beulich wrote:
> On 09.08.2023 13:02, Nicola Vetrini wrote:
>> 'xen/hypercall.h' is included in 'xen/arch/arm/setup.c' to allow
>> the declaration of 'arch_get_xen_caps' to be visible when
>> defining the function.
>> 
>> The header 'xen/delay.h' is included in 'xen/arch/arm/time.c'
>> to allow the declaration of 'udelay' to be visible.
>> 
>> At the same time, a declaration for 'get_sec' is added in
>> 'xen/include/xen/time.h' to be available for every call site
>> (in particular cper.h).
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>>  xen/arch/arm/setup.c   | 1 +
>>  xen/arch/arm/time.c    | 1 +
>>  xen/include/xen/cper.h | 3 +--
>>  xen/include/xen/time.h | 1 +
>>  4 files changed, 4 insertions(+), 2 deletions(-)
> 
> I would have almost put this off as Arm-only, but then saw this 
> diffstat.
> How come you consider cper.h Arm-related? This is used only by APEI 
> source
> files, which in turn are used only by x86 afaics. So I think you want 
> to
> split off the movement of the get_sec() declaration.
> 

My mistake, I squashed the arm and the cper part together to avoid 
touching the
time headers twice, but the old tag remained.

> As to title and description (perhaps affecting more than just this 
> patch):
> Failing to have declarations in scope where definitions appear is an at
> least latent bug. We fix these as we find them anyway, so Misra is
> secondary here. Hence I'd like to suggest that you declare any such
> change as an actual bugfix, ideally including a Fixes: tag. It is of
> course fine to mention that this then also addresses Misra rule 8.4.
> 
> Jan

Ok

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

