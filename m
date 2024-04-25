Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46298B22D7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 15:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712095.1112508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzzCs-0007eP-Ho; Thu, 25 Apr 2024 13:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712095.1112508; Thu, 25 Apr 2024 13:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzzCs-0007cs-Ee; Thu, 25 Apr 2024 13:32:10 +0000
Received: by outflank-mailman (input) for mailman id 712095;
 Thu, 25 Apr 2024 13:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RqcZ=L6=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzzCq-0007K4-JJ
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 13:32:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35834cff-0308-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 15:32:06 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id EFDCD4EE0739;
 Thu, 25 Apr 2024 15:32:05 +0200 (CEST)
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
X-Inumbo-ID: 35834cff-0308-11ef-b4bb-af5377834399
MIME-Version: 1.0
Date: Thu, 25 Apr 2024 15:32:05 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, consulting@bugseng.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>,
 Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca
 Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [XEN PATCH] automation/eclair: reorganize pipelines
In-Reply-To: <74f86426-b3bb-4af7-85ca-15851acee6fd@bugseng.com>
References: <fe1fe9c964d1f2ba3cb46cbaf798cf698f341386.1713885065.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2404241704430.3940@ubuntu-linux-20-04-desktop>
 <74f86426-b3bb-4af7-85ca-15851acee6fd@bugseng.com>
Message-ID: <8be082b6d22d61c0b14910680d3833a7@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-25 11:40, Federico Serafini wrote:
> On 25/04/24 02:06, Stefano Stabellini wrote:
>> On Tue, 23 Apr 2024, Federico Serafini wrote:
>>> From: Simone Ballarin <simone.ballarin@bugseng.com>
>>> 
>>> Introduce accepted_guidelines.sh: a script to autogenerate the
>>> configuration file accepted.ecl from docs/misra/rules.rst which 
>>> enables
>>> all accepted guidelines.
>>> 
>>> Introduce monitored.ecl: a manual selection of accepted guidelines
>>> which are clean or almost clean, it is intended to be used for the
>>> analyses triggered by commits.
>>> 
>>> Reorganize tagging.ecl:
>>>    -Remove "accepted" tags: keeping track of accepted guidelines 
>>> tagging
>>>     them as "accepted" in the configuration file tagging.ecl is no
>>>     longer needed since docs/rules.rst is keeping track of them.
>>>    -Tag more guidelines as clean.
>>> 
>>> Reorganize eclair pipelines:
>>>    - Set1, Set2, Set3 are now obsolete: remove the corresponding
>>>      pipelines and ecl files.
>>>    - Amend scheduled eclair pipeline to use accepted.ecl.
>>>    - Amend triggered eclair pipeline to use monitored.ecl.
>>> 
>>> Rename and improve action_check_clean_regressions.sh to print a
>>> diagnostic in case a commit introduces a violation of a clean 
>>> guideline.
>>> 
>>> An example of diagnostic is the following:
>>> 
>>> Failure: 13 regressions found for clean guidelines
>>>    service MC3R1.R8.2: (required) Function types shall be in 
>>> prototype form with named parameters:
>>>     violation: 13
>>> 
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> Signed-off-by: Alessandro Zucchelli 
>>> <alessandro.zucchelli@bugseng.com>
>> 
>> Fantastic work, thank you!
>> 
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> 
>> Is this patch safe to commit now? Or would it cause gitlab-ci 
>> breakage?
> 
> Yes, it is safe because the ECLAIR analysis is still allowed to fail.
> Committing this patch wouldn't break the CI but it will highlight some 
> regressions with the orange badge and the following messages:
> 
> arm:
> 
> Failure: 5 regressions found for clean guidelines
>   service MC3R1.R1.1: (required) The program shall contain no 
> violations of the standard C syntax and constraints, and shall not 
> exceed the implementation's translation limits:
>    violation: 5
> 

+Cc ARM maintainers, Luca Fancellu

after some investigation on these regressions on R1.1, there are some 
concerns with the current code:
2209c1e35b479dff8ed3d3161001ffdefa0a704e introduced the struct

struct membanks {
     unsigned int nr_banks;
     unsigned int max_banks;
     struct membank bank[];
};

with a flexible array member at the end; this is well-defined in C99, 
but what is non-standard (a GNU extension) is having this struct as a 
member to another struct/union in a position other than the last.

This is still supported by GNU (albeit reliance on this is undocumented 
for Xen), but what is concerning here is the following (taken from [1]):

"A structure containing a C99 flexible array member, or a union 
containing such a structure, is not the last field of another structure, 
for example:

struct flex  { int length; char data[]; };

struct mid_flex { int m; struct flex flex_data; int n; };

In the above, accessing a member of the array mid_flex.flex_data.data[] 
might have undefined behavior. Compilers do not handle such a case 
consistently. Any code relying on this case should be modified to ensure 
that flexible array members only end up at the ends of structures.
Please use the warning option -Wflex-array-member-not-at-end to identify 
all such cases in the source code and modify them. This extension is now 
deprecated."

It looks like this option, and the corresponding deprecation of the 
extension, will be available starting from GCC 14, so this might impact 
future compiler updates for Xen builds.

Linux is also concerned about this (see [2]), so I think the changes in 
struct layout introduced by the series [3] should be reviewed to 
determine whether this change was deliberate or happened as a byproduct. 
If this is determined not to be a legitimate concern, then this can be 
documented as an use of the GNU extension.

See [4] for the findings.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://lkml.org/lkml/2024/4/11/1293
[3] 
https://lore.kernel.org/xen-devel/20240418073652.3622828-1-luca.fancellu@arm.com/
[4] 
https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/xen/ECLAIR_normal/staging/ARM64/6713015426/PROJECT.ecd;/by_service/MC3R1.R1.1.html

Thanks,
   Nicola

> x86:
> 
> Failure: 2 regressions found for clean guidelines
>   service MC3R1.R8.2: (required) Function types shall be in prototype 
> form with named parameters:
>    violation: 2
> 
> (George just sent a patch to address the regressions of Rule 8.2.)
> 

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

