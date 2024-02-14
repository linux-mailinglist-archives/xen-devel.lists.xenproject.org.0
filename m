Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C5B854DBD
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 17:10:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681067.1059640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHpr-0003aK-Ph; Wed, 14 Feb 2024 16:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681067.1059640; Wed, 14 Feb 2024 16:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHpr-0003Y8-LK; Wed, 14 Feb 2024 16:10:11 +0000
Received: by outflank-mailman (input) for mailman id 681067;
 Wed, 14 Feb 2024 16:10:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=83ZH=JX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1raHpq-0003Xu-1d
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 16:10:10 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85d7b54c-cb53-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 17:10:08 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id CDA7A4EE0737;
 Wed, 14 Feb 2024 17:10:07 +0100 (CET)
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
X-Inumbo-ID: 85d7b54c-cb53-11ee-8a4d-1f161083a0e0
MIME-Version: 1.0
Date: Wed, 14 Feb 2024 17:10:07 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Simone Ballarin <simone.ballarin@bugseng.com>, Doug
 Goldstein <cardoe@cardoe.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] automation/eclair_analysis: deviate certain macros
 for Rule 20.12
In-Reply-To: <447b1843-f28c-4633-9e74-d695bc37208a@suse.com>
References: <892be5c403ca7a20b35fb9facacb6a38bc7f6bfe.1707900742.git.nicola.vetrini@bugseng.com>
 <3519db82-6126-4aa0-9d04-795edf6f2bca@suse.com>
 <b87f53b8e39fdbd7f7aefe63f227fe7f@bugseng.com>
 <447b1843-f28c-4633-9e74-d695bc37208a@suse.com>
Message-ID: <0733c2e990bca64f4c9a8a47a05b4795@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-02-14 16:45, Jan Beulich wrote:
> On 14.02.2024 16:31, Nicola Vetrini wrote:
>> On 2024-02-14 12:49, Jan Beulich wrote:
>>> On 14.02.2024 12:26, Nicola Vetrini wrote:
>>>> +-config=MC3R1.R20.12,macros+={deliberate,
>>>> "name(ASSERT||BUILD_BUG_ON||BUILD_BUG_ON_ZERO||GENERATE_CASE)"}
>>> 
>>> I said in another context already that it is necessary to separate
>>> global scope macros from local helper ones. Any CU can introduce
>>> another
>>> GENERATE_CASE(), and would be deviated here right away. In fact I
>>> question applicability of the deviation to arm/arm64/vsysreg.c; I 
>>> only
>>> see it as applicable to arm/vcpreg.c.
>> 
>> Why wouldn't this be applicable for vsysreg.c? I can certainly 
>> fine-tune
>> the deviation, if needed
> 
> There the sole macro parameter is used in only one of the possible 
> ways,
> with ##, unless I'm overlooking something. Aiui it is mixed use which
> would need a deviation.

I see. In that case I'll restrict the deviation, thanks.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

