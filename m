Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5799D86CFAD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:49:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687337.1070671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjan-0003Zx-3G; Thu, 29 Feb 2024 16:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687337.1070671; Thu, 29 Feb 2024 16:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjam-0003YN-WB; Thu, 29 Feb 2024 16:49:08 +0000
Received: by outflank-mailman (input) for mailman id 687337;
 Thu, 29 Feb 2024 16:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ot4I=KG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rfjal-0003YF-Sw
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:49:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 735ab007-d722-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:49:06 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id C5C914EE0737;
 Thu, 29 Feb 2024 17:49:05 +0100 (CET)
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
X-Inumbo-ID: 735ab007-d722-11ee-a1ee-f123f15fe8a2
MIME-Version: 1.0
Date: Thu, 29 Feb 2024 17:49:05 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 04/10] xen/public: address violations of MISRA C Rule
 20.7
In-Reply-To: <bd95193c-522a-4c74-98e0-68fa088a5b49@suse.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <0cdc4dc2fcad699a2274277b32de3ee0207d5a2d.1709219010.git.nicola.vetrini@bugseng.com>
 <bd95193c-522a-4c74-98e0-68fa088a5b49@suse.com>
Message-ID: <82940f688e5a5eee274fa579991ebd15@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-29 17:40, Jan Beulich wrote:
> On 29.02.2024 16:27, Nicola Vetrini wrote:
>> --- a/xen/include/public/xen.h
>> +++ b/xen/include/public/xen.h
>> @@ -988,7 +988,7 @@ typedef struct {
>>        ((b) >>  8) & 0xFF, ((b) >>  0) & 0xFF,                         
>>   \
>>        ((c) >>  8) & 0xFF, ((c) >>  0) & 0xFF,                         
>>   \
>>        ((d) >>  8) & 0xFF, ((d) >>  0) & 0xFF,                         
>>   \
>> -                e1, e2, e3, e4, e5, e6}}
>> +                (e1), (e2), (e3), (e4), (e5), (e6)}}
> 
> Why? Wasn't it agreed already that long macro arguments passed on
> (no matter whether to a function, a macro, or like used here) don't
> need parenthesizing?
> 

That applies to all outermost macro invocations, but not to the 
innermost one. If you want also aggregate initalizers to be deviated, 
that could be done (provided that the macro arg is not included in some 
expression, such as "{..., e1 + 1, ...}"

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

