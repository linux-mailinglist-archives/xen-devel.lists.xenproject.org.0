Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9484EC5DA
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 15:43:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296358.504434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYb0-00014G-5f; Wed, 30 Mar 2022 13:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296358.504434; Wed, 30 Mar 2022 13:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZYb0-00011d-2b; Wed, 30 Mar 2022 13:42:46 +0000
Received: by outflank-mailman (input) for mailman id 296358;
 Wed, 30 Mar 2022 13:42:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L21/=UJ=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1nZYay-00011X-NB
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 13:42:44 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45786c5c-b02f-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 15:42:43 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1648647757129546.9455965960345;
 Wed, 30 Mar 2022 06:42:37 -0700 (PDT)
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
X-Inumbo-ID: 45786c5c-b02f-11ec-8fbc-03012f2f19d4
ARC-Seal: i=1; a=rsa-sha256; t=1648647759; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C8cB4/n2if2xlm14AKu4OCf75KDtCq2mQVdAQzZGn2Gg76yib99QKRO5WAWYcoqlTCBJjkkuYGKOJPSdVFVFuQsqISJQaXyUoU9DOj8BZEGc4OzaZDHWmRvpupJJauC0XGFUF/clGKkX/+Xq+dNvTRqVEAs6mU9T0T75HA8jU9I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1648647759; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1Zyc0QvwbIuAC3285/2GSHpo0DdLzlFPGEz1MlOh/uM=; 
	b=MYINmZFNK075OwmlDT/qVhXmOCHWpJh32fUAEVQV9822g+EI1OKSNabgHe+o7RSbrpckw5xPHZHiZ3D4u7fvK9NgR8/YoHuWHTP+f9DjoXZTPzR4P/rJxZX7IBsiA9M80p2NkMfvkXB77nT2HQpcS1TGNdojrQ60nNP+OI1Zjko=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1648647759;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=1Zyc0QvwbIuAC3285/2GSHpo0DdLzlFPGEz1MlOh/uM=;
	b=kB0/zfcWyo507wKuxATmGEO33izlarMyEo/fYSznKJlstCViT65oDKQ1KfAZ+EcA
	UkYdgoEbWeX0pqP4oVVYi1DnEP9gBiBYE2j76XaTprOqZxJBzJ9Ei3v9wZE998Vp4io
	41y9Sx2pdWZxq0rYhgbAthANBYT4V5mnmAnA5jXc=
Message-ID: <d7c2f9ab-561c-01dd-e1a4-8f99f356d56d@apertussolutions.com>
Date: Wed, 30 Mar 2022 09:42:18 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, scott.davis@starlab.io,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Jason Andryuk <jandryuk@gmail.com>
References: <20220328203622.30961-1-dpsmith@apertussolutions.com>
 <20220328203622.30961-2-dpsmith@apertussolutions.com>
 <YkK1dSS6RZ9hzyh6@Air-de-Roger>
 <ae3ba2f9-ace5-0c30-9190-06c747953b20@apertussolutions.com>
 <YkQlkOWtXqGBAoM/@Air-de-Roger>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [RFC PATCH 1/1] xsm: allows system domains to allocate evtchn
In-Reply-To: <YkQlkOWtXqGBAoM/@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 3/30/22 05:40, Roger Pau Monné wrote:
> On Tue, Mar 29, 2022 at 07:12:56PM -0400, Daniel P. Smith wrote:
>> On 3/29/22 03:29, Roger Pau Monné wrote:
>>> On Mon, Mar 28, 2022 at 04:36:22PM -0400, Daniel P. Smith wrote:
>>>> During domain construction under dom0less and hyperlaunch it is necessary to
>>>> allocate at least the event channel for xenstore and potentially the event
>>>> channel for the core console. When dom0less and hyperlaunch are doing their
>>>> construction logic they are executing under the idle domain context. The idle
>>>> domain is not a privileged domain, it is not the target domain, and as a result
>>>> under the current default XSM policy is not allowed to allocate the event
>>>> channel.
>>>
>>> I've not been following the discussion around this patch, but I would
>>> assume such privileges are only required for init code when no other
>>> domains are running?
>>
>> At this time, correct.
>>
>>> Since it's only at that point where the idle domain context needs to
>>> allocate event channels would it make sense to temporary elevate it's
>>> privileges by setting d->is_privileged while doing the domain creation?
>>
>> This is initially what I did but it seemed like there was some
>> reluctance. As I was looking to formalize/abstract this in XSM instead
>> of doing direct manipulations, I realized I could achieve it in the hook
>> which would allow the hyperlaunch and dom0less code work without having
>> to ensure priv escalation is properly handled.
>>
>>> That way we wouldn't need to grant those permissions for the lifetime
>>> of the host when they are only needed for initialization code.
>>
>> Correct, which is why I adjusted the effective default policy only on
>> the check instead of in xsm_default_action() as Jan has suggested.
>> Outside of a code fault, all other times that evtchn_alloc_unbound() is
>> called `current->domain` should be pointing at the caller of the hypercall.
>>
>> This works as an interim solution with minimal impact as it is all
>> internal to XSM and can easily be evolved. My concern is that exposing a
>> function call to provide priv escalation for the idle domain as an
>> interim solution for dom0less and hyperlaunch will have more impactful
>> code churn in both of these when a longer term approach is adopted.
>>
>>> Another option would be switching to the initial vCPU of the domain
>>> being created, but that's likely to be more complex, or even create a
>>> short lived system domain with is_privileged set just for the purpose
>>> of building other domains.
>>
>> Longer term I would like to explore doing this in general. Some initial
>> thinking is the fact that hypervisor has a few contexts, relative to
>> external entities, under which it is executing. When it is handling
>> internal house keeping (e.g. scheduler and security server), when it is
>> interacting with guest domains, when it is interacting with hardware
>> (e.g. vpci), and now when it is processing boot material to construct
>> domains. It  has been mentioned that today in Xen if one of these
>> contexts acting with external entities is corrupted, it can interfere
>> with operations occurring in the other contexts. In the past the have
>> advocated and been working to split these contexts using hard L0/L1
>> separation. As noted in other discussions, some architectures are
>> gaining hardware features that can be used in hard L0/L1 partitioning
>> but also could be used in a more "soft" partitioning more a kin to
>> Nested Kernel[1] and Dune[2]. Again just some initial thoughts.
>>
>>> Overall I'm not sure it's worth giving those extra privileges to the
>>> idle domain when they are just need for a known and bounded period of
>>> time.
>>
>> IMHO that is a slight over simplification. Setting is_privileged to the
>> idle domain while it is processing domain construction data from outside
>> the hypervisor means that during that bounded period the idle domain is
>> complete unrestricted and may invoke any XSM protected call.
> 
> The domain builder code executed in the idle domain context can make
> direct calls to any functions that are otherwise protected behind an
> XSM check on the hypercall paths, so I don't see much difference.  The
> code executed by the idle domain in order to do domain creation is
> already part of the trusted code base (ie: it's hypervisor code)
> likewise with the data used as input.

I am only referring to what legit code paths exist, not what a full
control exploit could achieve at this time. My comments below was
discussing what might want to be considered down the road.

>> Contrast
>> this with only granting the idle domain the ability to allocate event
>> channels between domains at any time with the only codified usage is
>> during init/setup. While I am unsure how, theoretically malformed
>> construction data could expose a logic flaw to do some very unsavory
>> allocations without any guards.
> 
> It's kind of like that already, it's just that in other instances the
> calls done by the domain builder in idle domain context bypass the
> hypercall XSM checks.

Not on legitimate code paths, which is what I am focused on since the
primary vector that I was considering here is data attacks which are
about steering execution down legitimate paths as opposed to attacks
like ROP that allows runtime construction of execution paths.

> This might be giving you a false sense of security, but what's done in
> the idle domain context in order to do domain creation would strictly
> speaking require the idle domain to be a fully privileged entity, it's
> just that we mostly bypass the XSM checks by calling functions
> directly instead of using the hypercall entry paths.

Not at all as long as it is understood this is just about
least-privilege with the concern being around data attacks.

To be clear, I am not saying either solution is wrong and standing
firmly for one or the other. I am just trying to ensure that we consider
the applicable security aspects and thus make an informed decision.

>> Whereas during runtime if the idle
>> domain was tricked into establishing an event channel between two
>> domains, it would only serve to provide a covert channel between the two
>> domains. Neither is desirable but IMHO I find the former a little more
>> concerning than the latter.
>>
>> With that said, I am not completely against doing the priv escalation if
>> overall this is the direction that is preferred. If so, I would prefer
>> to provide a pair of static inlines under XSM name space to provide a
>> consistent implementation and be able to easily locate the places where
>> it is applied if/when a longer term approach is implemented.
> 
> I think those helpers must be __init, and we need to assert that by
> the time domains are started the idle domain is no longer
> privileged.

That is fine, I am not sure if there is a difference between static
inline functions that are only invoked from __init code (and I would
think would thus not exist anywhere else in the binary) over__init
functions. Although I have not been keeping Live Update in mind but I
think this is where the controlled privileged builder context is really
needed that dom0less, hyperlaunch, and Live Update can all utilize.

Good point regarding the assert. This was a concern I forgot to mention
with using priv escalation. Once a legitimate path exists to do such an
action, what locations should there be checks/assertions it is has not
occurred.

> From my PoV increasing the privileges of the idle domain just for the
> time it acts as a domain builder is merely formalizing what is already
> a fact: if the domain building was executed outside of Xen it would
> require the context domain to be privileged.

Except that it is now in guest space and can only reach resources
through the controlled hypercall interface. Any data that is sent is
considered trustworthy because the domain builder is trusted.

I will send out my original priv escalation patch later today.

v/r,
dps

