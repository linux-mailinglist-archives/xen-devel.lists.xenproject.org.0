Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE54EC9A4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 18:25:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296438.504576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZb7K-0005GN-SN; Wed, 30 Mar 2022 16:24:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296438.504576; Wed, 30 Mar 2022 16:24:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZb7K-0005EZ-PE; Wed, 30 Mar 2022 16:24:18 +0000
Received: by outflank-mailman (input) for mailman id 296438;
 Wed, 30 Mar 2022 16:24:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L21/=UJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZb7I-0005ES-A8
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 16:24:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d51d4435-b045-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 18:24:13 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648657447329576.4366358354467;
 Wed, 30 Mar 2022 09:24:07 -0700 (PDT)
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
X-Inumbo-ID: d51d4435-b045-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1648657448; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mqfRIv0CMhfE4N/Y5btypUD8sfBaqlQaTZnxsSRQ0IikEv2y1acFzm7irSqT2S6W4TlAIR0J3wtUcn9t/gibF62EaNYF0q49ihux1K7u8MrChUvy4SEULTjsxT+y73AHq0LGFQJWVbHZCl5XyLB/RI7JCyC4xbSOnWIKbQy0oZg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648657448; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=y7BDcaXHCElSfh8WOJgZ7bN/ulI6GrlTBoJ1hQ5NRuM=; 
	b=hhJn4bWmk79ZiJoldCjyNbTi1xy5lmmTpG2fJwaBwGBgR+X8V8IAZf4YE6wEethK0mJ9fvoKXaEag3BciIBA+P45badrVE26AE+R+pURVbkcCk19f7tG0JE84bAhStStKl1/MP2BzLQM67Tj9gBjOP5+QND5bQxFPSCFn+nUwA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648657448;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=y7BDcaXHCElSfh8WOJgZ7bN/ulI6GrlTBoJ1hQ5NRuM=;
	b=T3hDHdZ6y9L9EWpMH728SaMRVvYyKTz3+q+/IBANMG4gXUNyar1ck4k0rFdYFExS
	0rXhM9SflnjAtGl7lAwFL96I+VPR9s0lmvITunwJ2AXuQML/hjaIkts09kSvIA50PBv
	dP3Rb86lAuQz0k9CWfH7eC0xbo9qIxJNqHcbBLio=
Message-ID: <867570da-f60c-0b04-24b7-69d9a1737e85@apertussolutions.com>
Date: Wed, 30 Mar 2022 12:23:48 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
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
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
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

They exists, they are available in OpenPOWER and Arm CHERI is in
evaluation now.

> Do you envision that this future Xen would have multiple xen_*_t types
> requiring explicit Flask policy rules?

Right now I would say no for two reasons, first flask comes from the
mind set of controlling what hypervisor interfaces a guest may have
access and second is that I am not certain whether hypervisor internal
contexts should be configurable.

v/r,
dps

