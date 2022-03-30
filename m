Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3CB4EC532
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 15:07:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296314.504341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZY1e-00014G-F7; Wed, 30 Mar 2022 13:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296314.504341; Wed, 30 Mar 2022 13:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZY1e-00011v-CF; Wed, 30 Mar 2022 13:06:14 +0000
Received: by outflank-mailman (input) for mailman id 296314;
 Wed, 30 Mar 2022 13:06:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L21/=UJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZY1c-00011p-UJ
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 13:06:13 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 298b532a-b02a-11ec-a405-831a346695d4;
 Wed, 30 Mar 2022 15:06:09 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648645551016506.05686400761556;
 Wed, 30 Mar 2022 06:05:51 -0700 (PDT)
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
X-Inumbo-ID: 298b532a-b02a-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; t=1648645564; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nXqD72tNIieKIJnJ+jJfnVFBS/+HTVnM/t5eCHxT8+29GGJSWgE08uWeDoiHBINyPwOMjPqWWXMOpljT3b/nVr6lXaViIUrJTyp8ISAgC/jqsXCYPRiRbYQ6nXek5Lt/3d+t1A6ULgaujDx2KEEDrW+crL7ZMjXM3BBDW/J9MoM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648645564; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=bUJmJCGEdM2uqDh5Muuv5gI6Wx4z05uTf9ucNEM+z7o=; 
	b=EFP7NIwMh4s0TUEQMEAPD5+dWlMzSV5rX21Uph3DPPnbjHBQMp5H1rNhFNx0TApazozBk/WQEvT5IBUuIwRv4USEJ19SmZF46kEhvbbI/VpQwiU/KvIzk4Ca4P01xDWfL1Bz4QgCklle3cKgxMSvbw01jiC/vav4iKNHX2BlCPQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648645564;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bUJmJCGEdM2uqDh5Muuv5gI6Wx4z05uTf9ucNEM+z7o=;
	b=QsUkznn5N540wvPWYnSLZMt0Qc2gh4CKjb7uqK8pHFDL7aC/kb3aJgOsz5P8dfxl
	vZg+A2zeLWKmLkPsyzZ+vs9jTPb/81InPwWwQjvTXHXm9iRct6tJ1GruH/nyu7ujAd3
	QpEPpNqfe01eNlEPY5qh4dR41klqsqSe+WyMCZ2g=
Message-ID: <9b01dce0-961b-fbe7-8208-444a2785f055@apertussolutions.com>
Date: Wed, 30 Mar 2022 09:05:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org,
 Jason Andryuk <jandryuk@gmail.com>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
 <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
 <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
 <edecda2d-bf81-c722-a9ef-42461da66319@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
In-Reply-To: <edecda2d-bf81-c722-a9ef-42461da66319@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hey Julien,

On 3/29/22 17:57, Julien Grall wrote:
> Hi Daniel,
> 
> On 29/03/2022 19:57, Daniel P. Smith wrote:
>> On 3/29/22 02:43, Jan Beulich wrote:
>>> On 28.03.2022 22:36, Daniel P. Smith wrote:
>>>> During domain construction under dom0less and hyperlaunch it is
>>>> necessary to
>>>> allocate at least the event channel for xenstore and potentially the
>>>> event
>>>> channel for the core console. When dom0less and hyperlaunch are
>>>> doing their
>>>> construction logic they are executing under the idle domain context.
>>>> The idle
>>>> domain is not a privileged domain, it is not the target domain, and
>>>> as a result
>>>> under the current default XSM policy is not allowed to allocate the
>>>> event
>>>> channel.
>>>
>>> I appreciate the change is only needed there right now, but it feels
>>> inconsistent. _If_ it is to remain that way, at least a comment needs
>>> to be put in xsm_evtchn_unbound() making clear why this is a special
>>> case, and hence clarifying to people what the approximate conditions
>>> are to have such also put elsewhere. But imo it would be better to
>>> make the adjustment right in xsm_default_action(), without touching
>>> event_channel.c at all. Iirc altering xsm_default_action() was
>>> discussed before, but I don't recall particular reasons speaking
>>> against that approach.
>>
>> By inconsistent, I take it you mean this is first place within an XSM
>> hook where an access decision is based on the current domain being a
>> system domain? I do agree and would add a comment to the change in the
>> XSM hook in a non-RFC version of the patch.
>>
>> As to moving the check down into xsm_default_action(), the concern I
>> have with doing so is that this would then make every XSM check succeed
>> if `current->domain` is a system domain. Doing so would require a review
>> of every function which has an XSM hoook to evaluate every invocation of
>> those functions that,
>>    1. is there ever a time when current->domain may be a system domain
>>    2. if so,
>>      a. is the invocation on behalf of the system domain
>>      b. or is the invocation on behalf of a non-system domain
>>
>> If there is any instance of 2b, then an inadvertent privilege escalation
>> can occur on that path. For evtchn_alloc_unbound() I verified the only
>> place, besides the new hyperlaunch calls, it is invoked is in the evtchn
>> hypercall handler, where current should be pointing at the domain that
>> made the hypercall.
> Auditing existing calls is somewhat easy. The trouble are for new calls.
> I would say they are unlikely, but we would need to rely on the
> reviewers to spot any misuse. So this is a bit risky.
> 
> I am also a bit worry that we would end up to convert a lot of
> XSM_TARGET to XSM_HOOK (Note I have Live-Update in mind). This would
> make more difficult to figure what would the XSM calls allows without
> looking at the helper.

This approach was not mean to be the long term solution but to deal with
the immediate need as I agree doing this long term would make the
default policy very nuanced.

> I quite like the proposal from Roger. If we define two helpers (e.g.
> xsm_{enable, disable}_build_domain()), we could elevate the privilege
> for the idle domain for a short period of time (this could be restricted
> to when the dummy policy is used).

This is where I was initially going but I am hesitant to change the XSM
API in what might be temporary API calls which have a good chance will
be displaced. That being said, and it does seem like there is more in
favor of it, if the priv escalation is the overall preferred approach I
would still agree and prefer it be done in the XSM API so any usage is
more easily tracked.

v/r,
dps

