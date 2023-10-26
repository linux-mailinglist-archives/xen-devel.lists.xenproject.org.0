Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DEF7D80C8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 12:32:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623674.971742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxfU-0006PG-Aw; Thu, 26 Oct 2023 10:32:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623674.971742; Thu, 26 Oct 2023 10:32:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvxfU-0006Mr-8B; Thu, 26 Oct 2023 10:32:48 +0000
Received: by outflank-mailman (input) for mailman id 623674;
 Thu, 26 Oct 2023 10:32:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VqC+=GI=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qvxfS-0006Mj-Ma
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 10:32:46 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00572945-73eb-11ee-98d5-6d05b1d4d9a1;
 Thu, 26 Oct 2023 12:32:45 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 47B1C4EE0742;
 Thu, 26 Oct 2023 12:32:45 +0200 (CEST)
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
X-Inumbo-ID: 00572945-73eb-11ee-98d5-6d05b1d4d9a1
MIME-Version: 1.0
Date: Thu, 26 Oct 2023 12:32:45 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Simone Ballarin
 <simone.ballarin@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, George
 Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
In-Reply-To: <3cc22b2d-fbcf-899e-1d7d-036a53bd0f7f@suse.com>
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
 <f504772a-68b4-fbfa-e7d4-8d22992c7944@suse.com>
 <f23a1f95916bd61ddcd5002428d8876c@bugseng.com>
 <6d113a237846c7a41aa083e806f172e7@bugseng.com>
 <5475d9e5-ec1c-7f71-ee77-59ec2e6ee01e@suse.com>
 <alpine.DEB.2.22.394.2310231340320.3516@ubuntu-linux-20-04-desktop>
 <dd33e92f-03aa-cf3c-23d7-dcf9cce23c8e@suse.com>
 <2f88afb2383b5fdecf83d311ebe69bb4@bugseng.com>
 <96dd7efb-c214-2155-c5d1-3b9a47c10d33@suse.com>
 <alpine.DEB.2.22.394.2310251537460.271731@ubuntu-linux-20-04-desktop>
 <3cc22b2d-fbcf-899e-1d7d-036a53bd0f7f@suse.com>
User-Agent: Roundcube Webmail/1.4.3
Message-ID: <ff395b4eab2e79a901516e0958647f8b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 26/10/2023 08:52, Jan Beulich wrote:
> On 26.10.2023 00:38, Stefano Stabellini wrote:
>> On Wed, 25 Oct 2023, Jan Beulich wrote:
>>> On 25.10.2023 16:50, Nicola Vetrini wrote:
>>>> Ok, I'll send a revised version using MASK_LOWEST_BIT, taking into
>>>> account also the
>>>> other comments about the explanation on the macro definition
>>>> (which some IDEs even show when hovering on its usage, which could
>>>> partially address
>>>> the latter concern).
>>> 
>>> You're of course free to do so, but since - as indicated before -
>>> MASK_LOWEST_BIT() imo isn't a better name than LOWEST_BIT(), I'll
>>> continue to object.
>> 
>> Jan if you are OK with that I'll ask Julien to break the tie and pick
>> the name to use. Julien can you please help us move forward?
> 
> Hmm, I'm having trouble seeing us at the point of breaking ties yet.
> First we need naming suggestions which actually unambiguously
> describe what's being done by the macro. I gave one suggestion which
> I think fulfills this property, but is a little too long for my
> taste. I gave another suggestion with a far-off but shorter name,
> which I can appreciate isn't liked. I've not seen other suggestions
> fulfilling this base criteria.
> 
> Jan

Any name is fine with me. ISOLATE_LOW_BIT may be longish, but the macro 
would be used
in just a few places for a specific reason, so the loss in readability 
is probably not
that high.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

