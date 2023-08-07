Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD89771C1A
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 10:13:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577807.904844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvMd-0006Gb-MH; Mon, 07 Aug 2023 08:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577807.904844; Mon, 07 Aug 2023 08:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSvMd-0006E5-J0; Mon, 07 Aug 2023 08:13:19 +0000
Received: by outflank-mailman (input) for mailman id 577807;
 Mon, 07 Aug 2023 08:13:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iKtn=DY=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qSvMb-0006Dt-Sd
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 08:13:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 429376b6-34fa-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 10:13:16 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 90B414EE0737;
 Mon,  7 Aug 2023 10:13:15 +0200 (CEST)
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
X-Inumbo-ID: 429376b6-34fa-11ee-8613-37d641c3527e
MIME-Version: 1.0
Date: Mon, 07 Aug 2023 10:13:15 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 10/11] xen/sched: add ASSERT_UNREACHABLE() to address
 MISRA C:2012 Rule 2.1
In-Reply-To: <d18a1e2c-4396-7d7f-bd28-2d9e71107862@suse.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <3f1385f2ddb151a53ca092ea1caeac5d12fd80f5.1690985045.git.nicola.vetrini@bugseng.com>
 <d18a1e2c-4396-7d7f-bd28-2d9e71107862@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <4c5b5091ecae8b1314ba67825f4a959d@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 03/08/2023 11:17, Jan Beulich wrote:
> On 02.08.2023 16:38, Nicola Vetrini wrote:
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -2233,6 +2233,7 @@ static bool sched_tasklet_check_cpu(unsigned int 
>> cpu)
>>          /* fallthrough */
>>      case TASKLET_enqueued|TASKLET_scheduled:
>>          return true;
>> +        ASSERT_UNREACHABLE();
>>          break;
> 
> What use is "break" after "return"? IOW rather than adding code here,
> imo a line wants removing.
> 
> Jan

The "return false" after the switch would still be unreachable. The 
reasoning behind preserving the break
is mainly MISRA Rule 16.3: "An unconditional break statement shall 
terminate every switch-clause", which has
not yet been considered for adoption, but might be in future 
discussions, leading to putting back the break here.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

