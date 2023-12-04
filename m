Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C587803A28
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 17:26:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647163.1009944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rABls-000422-W8; Mon, 04 Dec 2023 16:26:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647163.1009944; Mon, 04 Dec 2023 16:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rABls-000402-TS; Mon, 04 Dec 2023 16:26:12 +0000
Received: by outflank-mailman (input) for mailman id 647163;
 Mon, 04 Dec 2023 16:26:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjtD=HP=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rABlr-0003k8-5j
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 16:26:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3f30ed3-92c1-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 17:26:08 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 54CD44EE073D;
 Mon,  4 Dec 2023 17:26:07 +0100 (CET)
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
X-Inumbo-ID: d3f30ed3-92c1-11ee-9b0f-b553b5be7939
MIME-Version: 1.0
Date: Mon, 04 Dec 2023 17:26:07 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?R?=
 =?UTF-8?Q?oger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 6/7] xen/x86: remove stale comment
In-Reply-To: <528ef7334c091ad9acb0316cf4b5558b@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <d06ee9f139392045fb8d927ff3a0c38fdc5080c6.1701270983.git.nicola.vetrini@bugseng.com>
 <48f44ee5-95c5-4656-97f1-7fa6d0fdc53c@suse.com>
 <528ef7334c091ad9acb0316cf4b5558b@bugseng.com>
Message-ID: <5b48da47a91a8e339b202a78bc5fd1eb@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-12-01 17:57, Nicola Vetrini wrote:
> On 2023-11-30 17:41, Jan Beulich wrote:
>> On 29.11.2023 16:24, Nicola Vetrini wrote:
>>> The comment referred to the declaration for do_mca, which
>>> now is part of hypercall-defs.h, therefore the comment is stale.
>> 
>> If the comments were stale, the #include-s should also be able to
>> disappear?

>>> --- a/xen/arch/x86/include/asm/hypercall.h
>>> +++ b/xen/arch/x86/include/asm/hypercall.h
>>> @@ -12,7 +12,7 @@
>>>  #include <xen/types.h>
>>>  #include <public/physdev.h>
>>>  #include <public/event_channel.h>
>>> -#include <public/arch-x86/xen-mca.h> /* for do_mca */
>>> +#include <public/arch-x86/xen-mca.h>
>>>  #include <asm/paging.h>
>> 
>> Here otoh I'm not even sure this public header (or the others) is 
>> (are)
>> really needed.
>> 
> 
> I confirm this. It build even without this header.

It does appear to be needed after all. I did two differential pipeline 
runs, and some jobs fail to compile when I remove the header (e.g., 
[1]). Looking trough the build log, it's not entirely clear what is the 
relationship, but it seems related to some use of this struct defined in 
xen-mca.h:

typedef struct xen_mc xen_mc_t;
DEFINE_XEN_GUEST_HANDLE(xen_mc_t);

[1] https://gitlab.com/xen-project/people/bugseng/xen/-/jobs/5675760184

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

