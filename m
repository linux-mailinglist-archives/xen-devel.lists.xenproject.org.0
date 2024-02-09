Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C8884F112
	for <lists+xen-devel@lfdr.de>; Fri,  9 Feb 2024 08:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678552.1055933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYLgj-0001qL-RK; Fri, 09 Feb 2024 07:52:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678552.1055933; Fri, 09 Feb 2024 07:52:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rYLgj-0001oP-Ns; Fri, 09 Feb 2024 07:52:45 +0000
Received: by outflank-mailman (input) for mailman id 678552;
 Fri, 09 Feb 2024 07:52:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BFPS=JS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rYLgh-0001oI-Ue
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2024 07:52:43 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33c85d06-c720-11ee-8a4b-1f161083a0e0;
 Fri, 09 Feb 2024 08:52:42 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 52D4F4EE0739;
 Fri,  9 Feb 2024 08:52:41 +0100 (CET)
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
X-Inumbo-ID: 33c85d06-c720-11ee-8a4b-1f161083a0e0
MIME-Version: 1.0
Date: Fri, 09 Feb 2024 08:52:41 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
 roger.pau@citrix.com, bertrand.marquis@arm.com, George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] docs/misra: add x86_64 and arm64 asm-offset.c to
 exclude-list
In-Reply-To: <ccc568a3-d81c-482c-8768-c5934e3943a8@xen.org>
References: <b0c855581eed247a32b745906f84d352bf812091.1707324479.git.nicola.vetrini@bugseng.com>
 <ccc568a3-d81c-482c-8768-c5934e3943a8@xen.org>
Message-ID: <a6ed69c037c23cf2b0854ef52d797921@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Julien,

On 2024-02-08 22:33, Julien Grall wrote:
> Hi Nicola,
> 
> On 08/02/2024 07:55, Nicola Vetrini wrote:
>> These two files contain several deliberate violations of MISRA C rules 
>> and
>> they are not linked in the final Xen binary, therefore they can be 
>> exempted
>> from MISRA compliance.
> 
> I am curious, what are the violations you are talking about?
> 
> Cheers,
> 

The one that prompted the exclusion is for R20.12 on arm for the macros 
DEFINE and OFFSET, where the second argument of OFFSET is a macro and is 
used as a normal parameter and a stringification operand.
However, there are other special cases (e.g., the file not being linked, 
which violates R2.1 and was already decided to deviate that aspect).

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

