Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D447E54AD
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 12:03:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629262.981332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0gLE-0007gj-0z; Wed, 08 Nov 2023 11:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629262.981332; Wed, 08 Nov 2023 11:03:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0gLD-0007f4-TK; Wed, 08 Nov 2023 11:03:23 +0000
Received: by outflank-mailman (input) for mailman id 629262;
 Wed, 08 Nov 2023 11:03:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7seD=GV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0gLC-0007d7-RN
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 11:03:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d75ec65-7e26-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 12:03:20 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 4114A4EE0737;
 Wed,  8 Nov 2023 12:03:20 +0100 (CET)
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
X-Inumbo-ID: 6d75ec65-7e26-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Wed, 08 Nov 2023 12:03:20 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
In-Reply-To: <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
 <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com>
Message-ID: <44df74cb532bfb9642b1c8752ee8c0d6@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-08 09:24, Jan Beulich wrote:
> On 03.11.2023 18:58, Nicola Vetrini wrote:
>> Static analysis tools may detect a possible null
>> pointer dereference at line 760 (the memcpy call)
>> of xen/common/domain.c. This ASSERT helps them in
>> detecting that such a condition is not possible
>> and also provides a basic sanity check.
> 
> I disagree with this being a possible justification for adding such a
> redundant assertion. More detail is needed on what is actually
> (suspected to be) confusing the tool. Plus it also needs explaining
> why (a) adding such an assertion helps and (b) how that's going to
> cover release builds.
> 

How about:
"Static analysis tools may detect a possible null pointer dereference
at line 760 (config->handle) due to config possibly being NULL.

However, given that all system domains, including IDLE, have a NULL
config and in the code path leading to the assertion only real domains
(which have a non-NULL config) can be present."

On point b): this finding is a false positive, therefore even if the 
ASSERT is
expanded to effectively a no-op, there is no inherent problem with Xen's 
code.
The context in which the patch was suggested [1] hinted at avoiding 
inserting in
the codebase false positive comments.

>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -700,6 +700,8 @@ struct domain *domain_create(domid_t domid,
>> 
>>      if ( !is_idle_domain(d) )
>>      {
>> +        ASSERT(config);
>> +
>>          watchdog_domain_init(d);
>>          init_status |= INIT_watchdog;
> 
> The assertion being redundant clearly requires it to be accompanied
> by a comment. Otherwise it is going to be a prime subject of
> redundancy elimination.
> 
> Jan

Good point; I'd rather keep it short and understandable
(e.g. "This ASSERT helps static analysis tool avoid a false positive
on a possible NULL dereference of config")

[1] 
https://lore.kernel.org/xen-devel/5ddb6398-f2a3-4bcb-8808-bad653b6c3cd@xen.org/

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

