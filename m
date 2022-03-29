Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27ED34EB57B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 23:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295950.503785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZJqB-0000l0-Mh; Tue, 29 Mar 2022 21:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295950.503785; Tue, 29 Mar 2022 21:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZJqB-0000jA-It; Tue, 29 Mar 2022 21:57:27 +0000
Received: by outflank-mailman (input) for mailman id 295950;
 Tue, 29 Mar 2022 21:57:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nZJqA-0000j0-6h
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 21:57:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZJq1-0000nn-1E; Tue, 29 Mar 2022 21:57:17 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nZJq0-0003Xb-R4; Tue, 29 Mar 2022 21:57:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=3/l7wWqt1nK2Cey0Udo5YIXVv4dDSonQUUKeFAJZKC4=; b=GHO0JrrYjB+ht0tcjNUKzrp3XX
	YcQgHQvTLGL6keWy6VnkBBjAyFP1HN6ppdaaDhH4csF4JvqB2UfiggmAufAYnt9E7JlHwVKTMo0P6
	FVm2/6JwTPhrARE64T0jS8AxnAIA3PhLGbKk8XTyB0XjqTndQVVf5n/lTlFw7GapCIuw=;
Message-ID: <edecda2d-bf81-c722-a9ef-42461da66319@xen.org>
Date: Tue, 29 Mar 2022 22:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
 <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
 <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
In-Reply-To: <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 29/03/2022 19:57, Daniel P. Smith wrote:
> On 3/29/22 02:43, Jan Beulich wrote:
>> On 28.03.2022 22:36, Daniel P. Smith wrote:
>>> During domain construction under dom0less and hyperlaunch it is necessary to
>>> allocate at least the event channel for xenstore and potentially the event
>>> channel for the core console. When dom0less and hyperlaunch are doing their
>>> construction logic they are executing under the idle domain context. The idle
>>> domain is not a privileged domain, it is not the target domain, and as a result
>>> under the current default XSM policy is not allowed to allocate the event
>>> channel.
>>
>> I appreciate the change is only needed there right now, but it feels
>> inconsistent. _If_ it is to remain that way, at least a comment needs
>> to be put in xsm_evtchn_unbound() making clear why this is a special
>> case, and hence clarifying to people what the approximate conditions
>> are to have such also put elsewhere. But imo it would be better to
>> make the adjustment right in xsm_default_action(), without touching
>> event_channel.c at all. Iirc altering xsm_default_action() was
>> discussed before, but I don't recall particular reasons speaking
>> against that approach.
> 
> By inconsistent, I take it you mean this is first place within an XSM
> hook where an access decision is based on the current domain being a
> system domain? I do agree and would add a comment to the change in the
> XSM hook in a non-RFC version of the patch.
> 
> As to moving the check down into xsm_default_action(), the concern I
> have with doing so is that this would then make every XSM check succeed
> if `current->domain` is a system domain. Doing so would require a review
> of every function which has an XSM hoook to evaluate every invocation of
> those functions that,
>    1. is there ever a time when current->domain may be a system domain
>    2. if so,
>      a. is the invocation on behalf of the system domain
>      b. or is the invocation on behalf of a non-system domain
> 
> If there is any instance of 2b, then an inadvertent privilege escalation
> can occur on that path. For evtchn_alloc_unbound() I verified the only
> place, besides the new hyperlaunch calls, it is invoked is in the evtchn
> hypercall handler, where current should be pointing at the domain that
> made the hypercall.
Auditing existing calls is somewhat easy. The trouble are for new calls. 
I would say they are unlikely, but we would need to rely on the 
reviewers to spot any misuse. So this is a bit risky.

I am also a bit worry that we would end up to convert a lot of 
XSM_TARGET to XSM_HOOK (Note I have Live-Update in mind). This would 
make more difficult to figure what would the XSM calls allows without 
looking at the helper.

I quite like the proposal from Roger. If we define two helpers (e.g. 
xsm_{enable, disable}_build_domain()), we could elevate the privilege 
for the idle domain for a short period of time (this could be restricted 
to when the dummy policy is used).

Cheers,

-- 
Julien Grall

