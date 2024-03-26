Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9BD88C84C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 16:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698135.1089526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9B7-0004Xg-U1; Tue, 26 Mar 2024 15:57:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698135.1089526; Tue, 26 Mar 2024 15:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp9B7-0004VN-RC; Tue, 26 Mar 2024 15:57:33 +0000
Received: by outflank-mailman (input) for mailman id 698135;
 Tue, 26 Mar 2024 15:57:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2PUu=LA=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rp9B6-0004VG-Th
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 15:57:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cda9ac1-eb89-11ee-a1ef-f123f15fe8a2;
 Tue, 26 Mar 2024 16:57:30 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id BD9DF4EE0739;
 Tue, 26 Mar 2024 16:57:29 +0100 (CET)
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
X-Inumbo-ID: 8cda9ac1-eb89-11ee-a1ef-f123f15fe8a2
MIME-Version: 1.0
Date: Tue, 26 Mar 2024 16:57:29 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 07/11] xen/page_alloc: address violations of MISRA C
 Rule 20.7
In-Reply-To: <f8cfa921-5586-4fe0-a18b-a34255a37731@suse.com>
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <ead692e7a9f7f21ae54448073af8b64a40f2ddfe.1711118582.git.nicola.vetrini@bugseng.com>
 <e013539a-b199-4e0f-90c7-835c9774fe17@suse.com>
 <ecb4007097fb835641667161950cc339@bugseng.com>
 <f8cfa921-5586-4fe0-a18b-a34255a37731@suse.com>
Message-ID: <dee83e2e49e004b9b7ae7f66cade0525@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-03-26 16:35, Jan Beulich wrote:
> On 26.03.2024 16:27, Nicola Vetrini wrote:
>> On 2024-03-25 10:27, Jan Beulich wrote:
>>> On 22.03.2024 17:01, Nicola Vetrini wrote:
>>>> --- a/xen/common/page_alloc.c
>>>> +++ b/xen/common/page_alloc.c
>>>> @@ -150,7 +150,7 @@
>>>>  #include <asm/paging.h>
>>>>  #else
>>>>  #define p2m_pod_offline_or_broken_hit(pg) 0
>>> 
>>> Seeing this in context: Does Misra also have a rule demanding
>>> evaluation
>>> of macro arguments?
>> 
>> No such rule. There is one for unused function parameters, though.
> 
> Interesting. Are there no concerns regarding side effects not taking
> place, as one might expect when looking just at the call site?
> 

I don't know. Either it was never discussed or it never made it to the 
final revisions, I guess.

>>>> -#define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
>>>> +#define p2m_pod_offline_or_broken_replace(pg) BUG_ON((pg) != NULL)
>>> 
>>> Or easier
>>> 
>>> #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg)
>>> 
>>> ?
>>> 
>> 
>> Good point. I'll modify it.
> 
> I can do that as well while committing. With that adjustment
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Jan

Thanks

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

