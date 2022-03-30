Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A908A4EC9A6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 18:28:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296442.504587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZbBY-0005vT-Dp; Wed, 30 Mar 2022 16:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296442.504587; Wed, 30 Mar 2022 16:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZbBY-0005sl-As; Wed, 30 Mar 2022 16:28:40 +0000
Received: by outflank-mailman (input) for mailman id 296442;
 Wed, 30 Mar 2022 16:28:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L21/=UJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZbBX-0005sf-8D
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 16:28:39 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7334c19b-b046-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 18:28:38 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648657711464399.6184339127499;
 Wed, 30 Mar 2022 09:28:31 -0700 (PDT)
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
X-Inumbo-ID: 7334c19b-b046-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1648657713; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WcTcYjXxD3izUJgEBDGMOVleIxLfLbHeSY7K3Za0keN652zV2yNsMuMDEQlnJiLIZpY04f69xAi346iiR3kxiHJ6KZEW8WDFnoTYJQaIi7UL0qdkjLeTQZTCoO8LNrtCkVBtIlnNY4bOXV61y4Cy+QfezfvkKwo8aDpovRoI3Y8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648657713; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=QCCZ8ho3M1TzHGqKp9aZP8JJ+ODHrM5J8iw4Po+J/Wk=; 
	b=LcPFWyXxB8WKz2rOeRZ9Z7BbQK5IRtnQTZwwcComu+2zQY6zVkeUA5T0O9dWKem7oV4ZCSAAnNVROaFQH3KbnUc9ltbFCYzWCfaIeSzUkncOyYePO5aomGQ3d7yvGcypsf2yI5LBE84Q8Oc8r7/8lWhI9v6C7NgyfOrgIzP7dSQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648657713;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QCCZ8ho3M1TzHGqKp9aZP8JJ+ODHrM5J8iw4Po+J/Wk=;
	b=Ys1cqDWITTlKyHHc/EbRUClQxNCSWXghBnSLTfDyvVE7B0pTecdDRplJTR8A1yK+
	Da2VXso1q1c0liMTVlMaTgPEwRdhjSrJH6zGrbMnhQGB7Hh65QjFdxWzFBBju8/3N2u
	giwMIgZcUDs6Vxsssv0uHSKsg7LXXsg5+pVC+fEk=
Message-ID: <58a977ea-460d-cfb9-aa75-5290de957c51@apertussolutions.com>
Date: Wed, 30 Mar 2022 12:28:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, Scott Davis <scott.davis@starlab.io>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
 <7935e60e-34b1-76be-e5de-56e60f173438@suse.com>
 <a991c32d-4e45-f015-3d99-8552199e8d45@apertussolutions.com>
 <e711e8c8-5e5d-7443-fbc8-368ccdde533b@suse.com>
 <CAKf6xpt46jFgexwLA=wdUVH-HJWLOEisL6-2cmSLyJsO3QE2eQ@mail.gmail.com>
 <bdd9547f-d3d7-2315-898f-786ce31f9bbc@apertussolutions.com>
 <CAKf6xpt60zHwwzgQ8EFuXkgfeiwYoBdsCMdY0d_fKZFXa5HyXA@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <CAKf6xpt60zHwwzgQ8EFuXkgfeiwYoBdsCMdY0d_fKZFXa5HyXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/30/22 11:15, Jason Andryuk wrote:
> On Wed, Mar 30, 2022 at 10:04 AM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> On 3/30/22 08:30, Jason Andryuk wrote:
>>> On Wed, Mar 30, 2022 at 2:30 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>>
>>>> On 29.03.2022 20:57, Daniel P. Smith wrote:
>>>>> On 3/29/22 02:43, Jan Beulich wrote:
>>>>>> Similarly I don't see how things would work transparently with a
>>>>>> Flask policy in place. Regardless of you mentioning the restriction,
>>>>>> I think this wants resolving before the patch can go in.
>>>>>
>>>>> To enable the equivalent in flask would require no hypervisor code
>>>>> changes. Instead that would be handled by adding the necessary rules to
>>>>> the appropriate flask policy file(s).
>>>>
>>>> Of course this can be dealt with by adjusting policy file(s), but until
>>>> people do so they'd end up with a perceived regression and/or unexplained
>>>> difference in behavior from running in dummy (or SILO, once also taken
>>>> care of) mode.
>>>
>>> This need to change the Flask policy is the crux of my dislike for
>>> making Xen-internal operations go through XSM checks.  It is wrong,
>>> IMO, to require the separate policy to grant xen_t permissions for
>>> proper operation.  I prefer restructuring the code so Xen itself
>>> doesn't have to go through XSM checks since that way Xen itself always
>>> runs properly regardless of the policy.
>>>
>>> This is more based on unmap_domain_pirq having an XSM check for an
>>> internal operation.  dom0less, hyperlaunch, & Live Update may all be
>>> niche use cases where requiring a policy change is reasonable.
>>
>> I will continue to agree with the base logic that today any least
>> privilege separation imposed is merely artificial in the face of any
>> attack that gains execution control over hypervisor space. What I will
>> disagree with is using that as a justification to create tight couplings
>> between the internals of the hypervisor that have a potential of causing
>> more work in the future when people are looking to use for instance's
>> Arms upcoming capability pointers as a real separation enforcement
>> mechanisms to de-privilege portions of the hypervisor.
>>
>> While on principle it is justified to object to having policy statements
>> that present a facade, is it not better to look longer term than object
>> to some thing on principle based in the now?
> 
> Your claims seem to be speculative about something that doesn't exist,
> so I can't evaluate them.

Apologies, let me give you some references as well.

https://mrfunk.info/?page_id=5
https://www.platformsecuritysummit.com/2019/speaker/hunt/

v/r,
dps

