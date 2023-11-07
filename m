Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79697E38F9
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 11:22:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628716.980465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JDr-0008J6-0A; Tue, 07 Nov 2023 10:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628716.980465; Tue, 07 Nov 2023 10:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0JDq-0008Gx-TZ; Tue, 07 Nov 2023 10:22:14 +0000
Received: by outflank-mailman (input) for mailman id 628716;
 Tue, 07 Nov 2023 10:22:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raD6=GU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0JDo-0008Gp-Qq
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 10:22:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 834f8ada-7d57-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 11:22:11 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id D0F274EE0C81;
 Tue,  7 Nov 2023 11:22:10 +0100 (CET)
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
X-Inumbo-ID: 834f8ada-7d57-11ee-98da-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 11:22:10 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH][for-4.19] xen: replace occurrences of SAF-1-safe with
 asmlinkage attribute
In-Reply-To: <859bbbc7-617a-4df0-893d-320b7e1e6e5b@xen.org>
References: <334b360fada7177e0b6e074fbdd33e02ce186b8f.1699034672.git.nicola.vetrini@bugseng.com>
 <ef60f721-f784-4595-8866-e1c57da7e48f@xen.org>
 <bb40675e3372abf264dcd63d0d64d476@bugseng.com>
 <859bbbc7-617a-4df0-893d-320b7e1e6e5b@xen.org>
Message-ID: <8435a92f1a70832abb3215e2630f729f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-07 10:49, Julien Grall wrote:
> Hi,
> 
> On 07/11/2023 08:36, Nicola Vetrini wrote:
>> On 2023-11-06 23:57, Julien Grall wrote:
>>> Hi Nicola,
>>> 
>>> On 03/11/2023 18:05, Nicola Vetrini wrote:
>>>> The comment-based justifications for MISRA C:2012 Rule 8.4 are 
>>>> replaced
>>>> by the asmlinkage pseudo-attribute, for the sake of uniformity.
>>>> The deviation with a comment based on the SAF framework is also
>>>> mentioned as a last resort.
>>> 
>>> I don't see any reason to keep SAF-1 after this patch. So can this be 
>>> removed?
>>> 
>> 
>> In documenting-violations.rst it's stated:
>> "Entries in the database shall never be removed, even if they are not 
>> used
>> anymore in the code (if a patch is removing or modifying the faulty 
>> line).
>> This is to make sure that numbers are not reused which could lead to 
>> conflicts
>> with old branches or misleading justifications."
> 
> I read this as the number can not be re-used. But we could replace the 
> description with "Not used anymore".
> 
>> 
>> that's why I kept SAF-1 in the safe.json file and added the remark 
>> about it
>> being a last resort.
> 
> Right, but this is confusing. What is the last resort? Why would one 
> use it? It would be best to not mention SAF-1 at all in deviations.rst.
> 
> Cheers,

Ok, I'll submit a v2

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

