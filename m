Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 114727E3ACB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 12:10:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628775.980586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jyg-0004qm-Km; Tue, 07 Nov 2023 11:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628775.980586; Tue, 07 Nov 2023 11:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Jyg-0004nt-Hu; Tue, 07 Nov 2023 11:10:38 +0000
Received: by outflank-mailman (input) for mailman id 628775;
 Tue, 07 Nov 2023 11:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=raD6=GU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r0Jyf-0004nn-7G
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 11:10:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 469a4b62-7d5e-11ee-98da-6d05b1d4d9a1;
 Tue, 07 Nov 2023 12:10:36 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8CD554EE0C81;
 Tue,  7 Nov 2023 12:10:30 +0100 (CET)
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
X-Inumbo-ID: 469a4b62-7d5e-11ee-98da-6d05b1d4d9a1
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 12:10:30 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Subject: Re: [RFC PATCH 0/4] address MISRA C:2012 Rule 15.2
In-Reply-To: <88e164aa-4b7f-d86e-3ee6-0f720dcd21ed@suse.com>
References: <cover.1699295113.git.nicola.vetrini@bugseng.com>
 <88e164aa-4b7f-d86e-3ee6-0f720dcd21ed@suse.com>
Message-ID: <61648922e51442f7ccaf10ccbc1e0dd2@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2023-11-07 11:52, Jan Beulich wrote:
> On 07.11.2023 11:33, Nicola Vetrini wrote:
>> This series is aimed at presenting some strategies that can be used to 
>> deal with
>> violations of Rule 15.2:
>> "The goto statement shall jump to a label declared later in the same 
>> function".
> 
> I don't recall this rule being discussed on any of the meetings.
> 

This series is aimed mainly at collecting opinions on the possible 
resolution strategies,
and based on the feedback decide what to focus the discussion on in the 
meetings.

>> The rule's rationale is about possible developer confusion, therefore 
>> it could
>> be argued that there is no substantial gain in complying with it, 
>> given the
>> torough review process in place.
> 
> To be honest, forward goto have potential of developer confusion as 
> well: All
> other entities need to be declared / defined before they can be used. 
> Just
> labels don't. (Or have I missed any other outlier?) IOW if I saw Misra 
> make
> any rule here, I think it ought to suggest to avoid using "goto" 
> altogether.
> 
> Jan

There is Rule 15.1 that says precisely that "do not use goto", but it's 
advisory and has never been proposed
(there are likely hundreds of violations, and some are perhaps 
legitimate uses of goto).
MISRA says that, if 15.1 is not followed, then a constrained use of goto 
is regulated by subsequent
rules 15.2 and 15.3.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

