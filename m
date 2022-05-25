Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E696F533EE9
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 16:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337239.561777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntrl2-0005ho-2y; Wed, 25 May 2022 14:13:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337239.561777; Wed, 25 May 2022 14:13:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntrl1-0005fX-VW; Wed, 25 May 2022 14:13:03 +0000
Received: by outflank-mailman (input) for mailman id 337239;
 Wed, 25 May 2022 14:13:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZus=WB=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ntrl0-0005fR-Dy
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 14:13:02 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c71b5a5a-dc34-11ec-837f-e5687231ffcc;
 Wed, 25 May 2022 16:13:00 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653487972668809.1500672546416;
 Wed, 25 May 2022 07:12:52 -0700 (PDT)
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
X-Inumbo-ID: c71b5a5a-dc34-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653487976; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iaUX9h7pEagIRwWB744cH8QK8Z4IwVm1QIMe6aAPey8kA0e53FtEYYX7tG0Vd02uEn8hPgyLaD3BpiG4My4UzFgkEnSzV5DvAQRRXfFQrnHzu91BBm7wWHyQQwDrtRUIZfK6OPogf669ujYEd3vNwYNXmit76nbRV/35k8mZiz0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653487976; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=nnn6qdW5xichgRN3JAFkNZ4sj2skJaVWwMhoN/+fSpk=; 
	b=agu/rkp6Lq7krhzdyGkv7n71Xjk2GVN5g6nqW3sfG+Jiqry1ALIlDD3vErLYtMbqdT7bpk1R7dVr25j/ucgExSnWigJdZPMZZ3cb9XHL0rNnIycUOBnBFex0BHmowV6bs7V5A5Al3MP6DqPUgd6DnEh5jxHvs7XR4kvCU7nD650=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653487976;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nnn6qdW5xichgRN3JAFkNZ4sj2skJaVWwMhoN/+fSpk=;
	b=BmLeMaHFP3v0+BmC+KoeWq1XFIqV/H/qiOxPrcPAxjeKExdfb9B+jWLJebA/XzO2
	3/XjW29yh6/W5TGX+UXU3fraRuj8FsT17r38zU2+j4INTylj02r0wbu5Ti7uxBBjDom
	S8dLhrnB9cckgs9eEpgDPH/2alOp4/IcHXvC02/8=
Message-ID: <4d3a8914-a505-230c-5807-8ca295c3b60a@apertussolutions.com>
Date: Wed, 25 May 2022 10:11:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: scott.davis@starlab.io, jandryuk@gmail.com, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20220523154024.1947-1-dpsmith@apertussolutions.com>
 <dc50678e-0a35-e3a2-110b-9b5ba7f7364b@suse.com>
 <db5c23cc-074f-2c7f-8033-a4b6aaf8443e@apertussolutions.com>
 <8aebc234-e870-9435-9f60-3c06013421d9@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xsm: refactor and optimize policy loading
In-Reply-To: <8aebc234-e870-9435-9f60-3c06013421d9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/25/22 02:37, Jan Beulich wrote:
> On 24.05.2022 19:42, Daniel P. Smith wrote:
>> On 5/24/22 11:50, Jan Beulich wrote:
>>> On 23.05.2022 17:40, Daniel P. Smith wrote:
>>>> @@ -36,10 +36,17 @@ int __init xsm_multiboot_policy_init(
>>>>  {
>>>>      int i;
>>>>      module_t *mod = (module_t *)__va(mbi->mods_addr);
>>>> -    int rc = 0;
>>>> +    int rc = -ENOENT;
>>>
>>> I'm afraid I can't easily convince myself that this and the other
>>> -ENOENT is really relevant to this change and/or not breaking
>>> anything which currently does work (i.e. not entirely benign).
>>> Please can you extend the description accordingly or split off
>>> this adjustment?
>>
>> Let me expand the commit explanation, and you can let me know how much
>> of this detail you would like to see in the commit message.
>>
>> When enabling CONFIG_XSM_FLASK today, the XSM_MAGIC variable becomes
>> defined as a non-zero value. This results in xsm_XXXX_policy_init() to
>> be called regardless of the XSM policy selection, either through the
>> respective CONFIG_XSM_XXXXX_DEFAULT flags or through the cmdline
>> parameter. Additionally, the concept of policy initialization is split
>> between xsm_XXXX_policy_init() and xsm_core_init(), with the latter
>> being where the built-in policy would be selected. This forces
>> xsm_XXXX_policy_init() to have to return successful for configurations
>> where no policy loading was necessary. It also means that the situation
>> where selecting XSM flask, with no built-in policy, and failure to
>> provide a policy via MB/DT relies on the security server to fault when
>> it is unable to load a policy.
>>
>> What this commit does is moves all policy buffer initialization to
>> xsm_XXXX_policy_init(). As the init function, it should only return
>> success (0) if it was able to initialize the policy buffer with either
>> the built-in policy or a policy loaded from MB/DT. The second half of
>> this commit corrects the logical flow so that the policy buffer
>> initialization only occurs for XSM policy modules that consume a policy
>> buffer, e.g. flask.
> 
> I'm afraid this doesn't clarify anything for me wrt the addition of
> -ENOENT. There's no case of returning -ENOENT right now afaics (and
> there's no case of you dealing with the -ENOENT anywhere in your
> changes, so there would look to be an overall change in behavior as
> viewed from the outside, i.e. the callers of xsm_{multiboot,dt}_init()).
> If that's wrong for some reason (and yes, it looks at least questionable
> on the surface), that's what wants spelling out imo. A question then
> might be whether that's not a separate change, potentially even a fix
> which may want to be considered for backport. Of course otoh the sole
> caller of xsm_multiboot_init() ignores the return value altogether,
> and the sole caller of xsm_dt_init() only cares for the specific value
> of 1. This in turn looks at least questionable to me.

Okay, let me change the view a bit.

The existing behavior is for xsm_{multiboot,dt}_init() to return 0 if
they did not locate a policy file for initializing the policy buffer. It
did so because it expected later that xsm_core_init() would just set it
to the built-in policy. BUT, it also served the purpose of succeeding if
it were called when either the dummy or SILO, neither of which needs the
policy buffer initialized, is the enforcing policy.

This change starts with moving the lines that set the policy buffer to
the built-in policy into xsm_{multiboot,dt}_init() respectively and only
return success if it was able to populate the policy buffer. In other
words, if there is not a built-in policy and a policy file was not able
to be loaded, it returns -NOENT to represent it was not able to find a
policy file. This change makes these functions do as their name
suggests, to initialize the policy buffer either from MB or DT with a
fallback to the built-in policy otherwise fail.

Upon making the function behave correctly, it exposes a valid set of
conditions that under the current behavior succeeds but will fail under
the correct behavior for xsm_{multiboot,dt}_init(). With flask enabled
in the build but not the built-in policy and either dummy or SILO is the
enforcing policy, then xsm_{multiboot,dt}_init() will be called and
fail. This is where the second half of the change comes into effect,
which is to introduce a gating that will only attempt to initialize the
policy buffer if the enforcing XSM policy requires a policy file. With
this gating in place, under the above set of conditions
xsm_{multiboot,dt}_init() will not be called and XSM initialization will
succeed as it should.

Now to your question of whether these changes could be split and given a
focused explanation in their respective commits. Yes, I can split it
into two separate commits. While the gating of the call to
xsm_{multiboot,dt}_init() is an independent change, the change to
xsm_{multiboot,dt}_init() itself is not and must proceed after the
gating change. This means it is possible to backport the first commit,
gating, independently. If the desire is to backport the second commit,
xsm_{multiboot,dt}_init() behavior, then it would require both commits
to be backported.

I hope this helps better clarify my reasoning and if you would like to
see the changes split how I highlighted, just let me know.

v/r,
dps


