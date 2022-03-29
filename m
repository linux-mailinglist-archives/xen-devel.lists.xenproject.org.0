Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D913A4EB3C2
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 20:59:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295928.503746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZH2r-0000Hu-FV; Tue, 29 Mar 2022 18:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295928.503746; Tue, 29 Mar 2022 18:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZH2r-0000FC-Bh; Tue, 29 Mar 2022 18:58:21 +0000
Received: by outflank-mailman (input) for mailman id 295928;
 Tue, 29 Mar 2022 18:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OsXo=UI=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZH2p-0000F6-UD
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 18:58:20 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 311823f2-af92-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 20:58:18 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 16485802917781.8588007249323937;
 Tue, 29 Mar 2022 11:58:11 -0700 (PDT)
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
X-Inumbo-ID: 311823f2-af92-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1648580294; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D5iKMR7NE0wxnbnz4SD3BfCHCVIdHIU5ZxMdMSbgYCWxs+zaKSe0MYWhrYh2DkLxCC+bzh20xHb3cfoyDio5c88UbQ0EKSJbNzGwHxP1rZ8fzjgQJzPbNl+wutQI2ZdrEOPtLrZnoNZungbwme8T1DdJQoLdxrjk9cJm5zc0wnI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648580294; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=82N1iEJ3aMRbMRMlDeQvRehl+/kjpA2zJvqFaRoFm24=; 
	b=WMLI1cyPo4768/sD2xu9x5JwzOEJxUa2ikicQHCWlHfpHzLK6NkdG1BZyXv3E95JsT3L6oH8fyzGjb6rQwcyMHNJgG/TWUZgfVLzZfaZc9GnIe2XNfuoGHjCp+MbpFnVc8TFehiGLpT8bItChZ5Le1EaDPRApZMMm2RqLekpYS4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648580294;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=82N1iEJ3aMRbMRMlDeQvRehl+/kjpA2zJvqFaRoFm24=;
	b=f0mvPEfBGLaaTqvoLee/nHi92UvAdYISYAiMJxpBAI6YIOIUEMXoER6PaIBpYH6s
	eBE/jbDbvUgDiA04iStqLkF5uf3A0m2lFfzuYxAHrMIlJC9zY7UH3u5wflkPNVTYCbw
	nwlx4WmC7+qU4g5XPTRTs5JhpV+JFxRTPaq7fElk=
Message-ID: <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
Date: Tue, 29 Mar 2022 14:57:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
 <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
In-Reply-To: <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/29/22 02:43, Jan Beulich wrote:
> On 28.03.2022 22:36, Daniel P. Smith wrote:
>> During domain construction under dom0less and hyperlaunch it is necessary to
>> allocate at least the event channel for xenstore and potentially the event
>> channel for the core console. When dom0less and hyperlaunch are doing their
>> construction logic they are executing under the idle domain context. The idle
>> domain is not a privileged domain, it is not the target domain, and as a result
>> under the current default XSM policy is not allowed to allocate the event
>> channel.
> 
> I appreciate the change is only needed there right now, but it feels
> inconsistent. _If_ it is to remain that way, at least a comment needs
> to be put in xsm_evtchn_unbound() making clear why this is a special
> case, and hence clarifying to people what the approximate conditions
> are to have such also put elsewhere. But imo it would be better to
> make the adjustment right in xsm_default_action(), without touching
> event_channel.c at all. Iirc altering xsm_default_action() was
> discussed before, but I don't recall particular reasons speaking
> against that approach.

By inconsistent, I take it you mean this is first place within an XSM
hook where an access decision is based on the current domain being a
system domain? I do agree and would add a comment to the change in the
XSM hook in a non-RFC version of the patch.

As to moving the check down into xsm_default_action(), the concern I
have with doing so is that this would then make every XSM check succeed
if `current->domain` is a system domain. Doing so would require a review
of every function which has an XSM hoook to evaluate every invocation of
those functions that,
  1. is there ever a time when current->domain may be a system domain
  2. if so,
    a. is the invocation on behalf of the system domain
    b. or is the invocation on behalf of a non-system domain

If there is any instance of 2b, then an inadvertent privilege escalation
can occur on that path. For evtchn_alloc_unbound() I verified the only
place, besides the new hyperlaunch calls, it is invoked is in the evtchn
hypercall handler, where current should be pointing at the domain that
made the hypercall.

>> This patch only addresses the event channel situation by adjust the default XSM
>> policy for xsm_evtchn_unbound to explicitly allow system domains to be able to
>> make the allocation call.
> 
> Indeed I'm having trouble seeing how your change would work for SILO
> mode, albeit Stefano having tested this would make me assume he did
> so in SILO mode, as that's the default on Arm iirc. Afaict
> silo_mode_dom_check() should return false in the described situation.

Correct, this patch only addressed the default policy. If an equivalent
change for SILO is desired, then it would be placed in
silo_evtchn_unbound() and not in silo_mode_dom_check() for the same
reasons I would be hesitant to place it in xsm_default_action().

> Similarly I don't see how things would work transparently with a
> Flask policy in place. Regardless of you mentioning the restriction,
> I think this wants resolving before the patch can go in.

To enable the equivalent in flask would require no hypervisor code
changes. Instead that would be handled by adding the necessary rules to
the appropriate flask policy file(s).


v/r,
dps

