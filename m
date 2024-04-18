Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 929988A9F38
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 17:56:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708506.1107479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxU75-0006iC-Le; Thu, 18 Apr 2024 15:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708506.1107479; Thu, 18 Apr 2024 15:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxU75-0006g8-Ih; Thu, 18 Apr 2024 15:55:51 +0000
Received: by outflank-mailman (input) for mailman id 708506;
 Thu, 18 Apr 2024 15:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QcTt=LX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rxU74-0006g2-B5
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 15:55:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f9045aa-fd9c-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 17:55:48 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id A56A04EE074A;
 Thu, 18 Apr 2024 17:55:47 +0200 (CEST)
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
X-Inumbo-ID: 1f9045aa-fd9c-11ee-94a3-07e782e9044d
MIME-Version: 1.0
Date: Thu, 18 Apr 2024 17:55:47 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v3 1/2] xen/domctl: address violations of MISRA C Rule
 16.2
In-Reply-To: <500fff2d-2316-4090-8cf3-a697bda6ee01@suse.com>
References: <cover.1713382466.git.nicola.vetrini@bugseng.com>
 <6ebb49a8ae92dc036d7bed0c708a8830bb93c788.1713382466.git.nicola.vetrini@bugseng.com>
 <500fff2d-2316-4090-8cf3-a697bda6ee01@suse.com>
Message-ID: <b815cd630edbdce68d5983b4d3900074@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-18 17:10, Jan Beulich wrote:
> On 17.04.2024 21:37, Nicola Vetrini wrote:
>> Refactor the first clauses so that a violation of
>> MISRA C Rule 16.2 is resolved (a switch label should be immediately
>> enclosed in the compound statement of the switch).
>> Note that the switch clause ending with the pseudo
>> keyword "fallthrough" is an allowed exception to Rule 16.3.
>> 
>> Convert fallthrough comments in other clauses to the pseudo-keyword
>> while at it.
>> 
>> No functional change.
>> 
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I did ack a patch with this title, yes, but the content of that patch
> was different. Besides all the references to the fallthrough pseudo-
> keyword being unrelated to the change below, there's also nothing ...
> 
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -457,6 +457,7 @@ static int domain_teardown(struct domain *d)
>> 
>>          for_each_vcpu ( d, v )
>>          {
>> +            /* SAF-5-safe MISRA C Rule 16.2: switch label enclosed by 
>> for loop*/
>>              PROGRESS_VCPU(teardown);
>> 
>>              rc = vcpu_teardown(v);
> 
> ... domctl-ish in here. What is going on?
> 
> Jan

Oh, I must have edited the wrong patch when doing v3. Sorry about that.
The patch was this [1], just with the id changed.

[1] 
https://lore.kernel.org/xen-devel/2328b1a43f8bc4c9a9303c46f8eba2847c67a713.1712305581.git.nicola.vetrini@bugseng.com/

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

