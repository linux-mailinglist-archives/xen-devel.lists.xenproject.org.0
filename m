Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B785975F809
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 15:16:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568954.889195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvPj-0006u6-Mr; Mon, 24 Jul 2023 13:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568954.889195; Mon, 24 Jul 2023 13:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNvPj-0006rX-KB; Mon, 24 Jul 2023 13:15:51 +0000
Received: by outflank-mailman (input) for mailman id 568954;
 Mon, 24 Jul 2023 13:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOzI=DK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qNvPi-0006rR-Hs
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 13:15:50 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 345ec366-2a24-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 15:15:48 +0200 (CEST)
Received: from [192.168.1.100] (unknown [37.162.132.135])
 by support.bugseng.com (Postfix) with ESMTPSA id 61D1F4EE0737;
 Mon, 24 Jul 2023 15:15:46 +0200 (CEST)
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
X-Inumbo-ID: 345ec366-2a24-11ee-8612-37d641c3527e
Message-ID: <33af17e5-2942-e263-22bf-7e60148e1de1@bugseng.com>
Date: Mon, 24 Jul 2023 15:15:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH] xen/arm: p2m: refactor 'p2m_get_entry'
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <118566cd8b9ebbcedd2b610f5f602cc31c12fd55.1689922099.git.nicola.vetrini@bugseng.com>
 <9c1b7c53-f8da-76a2-cc02-7c72a3030be4@xen.org>
Content-Language: en-US
In-Reply-To: <9c1b7c53-f8da-76a2-cc02-7c72a3030be4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/07/23 12:01, Julien Grall wrote:
> Hi Nicola,
> 
> I would add "to please ECLAIR" in the commit title.

I would be against this. It's the MISRA assessor that needs
to understand and agree on what has been done to claim MISRA compliance. 
A static analysis tool is just a useful way to help reaching this aim.

> 
> On 21/07/2023 07:49, Nicola Vetrini wrote:
>> This function is refactored to avoid using a
>> local dummy variable that served as a fallback
>> if the parameter 't' is NULL.
>>
>> Storing the address of that variable into 't' caused
>> static analysis tools not to be able to recognize the
> 
> Can you mention which static analysis tools is not happy and the 
> version? This could help us in the future if we decided to revert the 
> patch.
> 

It is not a matter of tool happiness, but of MISRA compliance.
There are several tools (even emblazoned ones) that have lots
of false negatives, also for mandatory guidelines such as Rule 9.1:
the fact that they do not issue messages for possible violations
they cannot exclude is happiness for nobody (especially for those
who have to ensure there are indeed no violations). Two things
that have to be kept well in mind are:

1) Rule 9.1 is undecidable, there will never be a tool that flags all
    and only the violations; tools will false positives, false negatives
    or both. ECLAIR (all versions of it) errs on the safe side.

2) Safety-critical code has to be boring and obviously correct:
    programming virtuosism and safety are in two very different leagues.
    This is why ECLAIR uses the algorithm it uses: typically when it
    issues a caution the code is not obviously correct.

Kind Regards,

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

