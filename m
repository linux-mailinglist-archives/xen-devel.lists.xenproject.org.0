Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59CF7F26DB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 09:00:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637552.993450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5LgS-0003zt-IU; Tue, 21 Nov 2023 08:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637552.993450; Tue, 21 Nov 2023 08:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5LgS-0003xR-Ej; Tue, 21 Nov 2023 08:00:36 +0000
Received: by outflank-mailman (input) for mailman id 637552;
 Tue, 21 Nov 2023 08:00:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f+q9=HC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r5LgR-0003xK-Sp
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 08:00:35 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0bcf28fa-8844-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 09:00:33 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 10F814EE0C96;
 Tue, 21 Nov 2023 09:00:33 +0100 (CET)
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
X-Inumbo-ID: 0bcf28fa-8844-11ee-9b0e-b553b5be7939
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 09:00:33 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen Devel <xen-devel@lists.xenproject.org>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jbeulich
 <jbeulich@suse.com>, Roger Pau <roger.pau@citrix.com>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Consulting
 <consulting@bugseng.com>
Subject: Re: Remaining violations of MISRA Rule 7.4
In-Reply-To: <df193960-b808-46fc-9361-b3850c249833@citrix.com>
References: <21761f2a6633a08ceb2b70a46013486a@bugseng.com>
 <bdb7efb1-b8b2-4426-a46d-e8f5afdba0f6@citrix.com>
 <edd14ce515721eebf5a897ae0e5b61c4@bugseng.com>
 <df193960-b808-46fc-9361-b3850c249833@citrix.com>
Message-ID: <25692da69361422af82d088df066539f@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2023-11-21 00:08, Andrew Cooper wrote:
> On 20/11/2023 4:40 pm, Nicola Vetrini wrote:
>>> I've just rebased and pushed the residual from the past work 
>>> (although I
>>> missed the ARM EFI fix.)
>>> 
>>> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=0f06bab762f5201f3e00aaaee704c3c01f516b51
>>> 
>>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1065699873
>>> 
>>> I'm going to make a firm request that we fix this by activating
>>> -Wwrite-strings Xen wide, because that's by far and away the best way 
>>> to
>>> stop regressions creeping back in.
>>> 
>>> In start_xen(), basically whatever goes.  All that's doing is 
>>> processing
>>> of one command line into another, and your version looks a bit neater
>>> than mine.
>>> 
>>> The name.s cases (it's duplicated in x86 and ARM) are more tricky.  
>>> The
>>> compiler warning can be silenced by swapping name.s for name.cs but I
>>> have no idea whether Eclair can see through that piece of blatent 
>>> lying.
>>> 
>>> ~Andrew
>> 
>> Just to avoid any misunderstanding: do you have the intention of
>> evaluating and then perhaps integrate the fixes that at the moment
>> block the introduction of -Wwrite-strings and then respin your patch,
>> or should I do something specifically?
>> 
> 
> Hopefully you'll find
> https://lore.kernel.org/xen-devel/20231120224912.1421916-1-andrew.cooper3@citrix.com/T/#u
> to your liking.
> 
> ~Andrew

Definitely. Thank you for the effort you put on this.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

