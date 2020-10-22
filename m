Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B85295606
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 03:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10163.26900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVPKj-00048F-Gp; Thu, 22 Oct 2020 01:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10163.26900; Thu, 22 Oct 2020 01:24:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVPKj-00047p-CD; Thu, 22 Oct 2020 01:24:01 +0000
Received: by outflank-mailman (input) for mailman id 10163;
 Thu, 22 Oct 2020 01:23:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DD7K=D5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1kVPKf-00047g-LS
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 01:23:59 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe375d51-9392-4a7c-bb35-9fc94cc3a4c6;
 Thu, 22 Oct 2020 01:23:56 +0000 (UTC)
Received: from [10.10.1.137] (c-73-129-147-140.hsd1.md.comcast.net
 [73.129.147.140]) by mx.zohomail.com
 with SMTPS id 1603329828911614.8460963906813;
 Wed, 21 Oct 2020 18:23:48 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DD7K=D5=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
	id 1kVPKf-00047g-LS
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 01:23:59 +0000
X-Inumbo-ID: fe375d51-9392-4a7c-bb35-9fc94cc3a4c6
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fe375d51-9392-4a7c-bb35-9fc94cc3a4c6;
	Thu, 22 Oct 2020 01:23:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1603329831; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gtp42vUhCZZYbSwUBHL+kPs0nVV+qubxqnOsbtv/VInei1/SP4N2YjV3d69YD3jTxwB/Ex8a50ItH4yiuyMjUI1G5NUs5VLmtyoRRuTUI64romQkcBTpy09SEkbIMRpsB0F4vEw0CzVo4+MpesOWb8FpWOwv1saZnD86wLNnPmo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1603329831; h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=stFXklIoiHG3PHIWlVEZraIR0nK8W927Dv5q75eD7oQ=; 
	b=Me9++XvXTmYhNv+sKnYL9X2mgcCdQk66KcxE8snvxdmVaCPMQJlIw8onX7lEhPMbWwUN1Y/56EFhsa7v0aCIK7SM16BiXVA6ZQ8X7VNXr7nmSNmz5vPBxqG74eNbrP9HOVeX/sniHwuSf+VKhb1lA22A4mKoO0rjCg/zZ/bDRrI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1603329831;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=stFXklIoiHG3PHIWlVEZraIR0nK8W927Dv5q75eD7oQ=;
	b=Qdw9ZPluGH+LZB2ZvbscAVVTbhYSyFcjnJ7N57lywm2zMcIatqIn5KFECdnL/S2q
	LGd0f6UUOhi1DBVgR8RHpnPBrHZtqL+9gwmsNkqdyI4/cRtpoxlFw23uOfJQKP31lRD
	j3EifDvcSKde8EVe47Oml0ncQtaZGbdDjNdTxjQ8=
Received: from [10.10.1.137] (c-73-129-147-140.hsd1.md.comcast.net [73.129.147.140]) by mx.zohomail.com
	with SMTPS id 1603329828911614.8460963906813; Wed, 21 Oct 2020 18:23:48 -0700 (PDT)
Subject: Re: XSM and the idle domain
To: Hongyan Xia <hx242@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 jbeulich@suse.com, andrew.cooper3@citrix.com, jandryuk@gmail.com,
 dgdegra@tycho.nsa.gov
References: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <2dbee673-036a-077e-6cb4-556aac46ac33@apertussolutions.com>
Date: Wed, 21 Oct 2020 21:23:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/21/20 10:34 AM, Hongyan Xia wrote:
> Hi,
> 
> A while ago there was a quick chat on IRC about how XSM interacts with
> the idle domain. The conversation did not reach any clear conclusions
> so it might be a good idea to summarise the questions in an email.
> 
> Basically there were two questions in that conversation:
> 
> 1. In its current state, are security modules able to limit what the
> idle domain can do?

Yes in the fact that the idle domain has a type and you can constrain 
what actions the type is allowed. Now in reality the idle domain is 
given the same type as the hypervisor itself thus must have the ability 
to make certain actions.

> 2. Should security modules be able to restrict the idle domain?

IMHO I think this question should be reversed to ask whether the actions 
the idle domain is being used for is appropriate from a security point 
of view. AIUI the idle domain is a mechanism for the scheduler to use as 
a place to schedule an idle vcpu. And yes I understand that some limited 
work is done there, e.g. memory scrubbing, but 1.) there is a difference 
between light/limited work that can be done within the confines of a 
domain and work requiring hypercalls, and 2.) this precedence may have 
been due to limitations vs being the necessarily correct approach.

> The first question came up during ongoing work in LiveUpdate. After an
> LU, the next Xen needs to restore all domains. To do that, some
> hypercalls need to be issued from the idle domain context and
> apparently XSM does not like it. We need to introduce hacks in the
> dummy module to leave the idle domain alone. Our work is not compiled
> with CONFIG_XSM at all, but with CONFIG_XSM, are we able to enforce
> security policies against the idle domain? Of course, without any LU
> work this does not make any difference because the idle domain does not
> do any useful work to be restricted anyway.

Why do they "need to be issued from the idle domain"? As was suggested 
by Jason, why isn't this done from a construction domain context? I will 
interject here that with DomB that is what we will be doing and it 
sounds like LiveUpdate is very similar to the relaunch concept that DomB 
is being constructed to support.

Yes XSM did not like it because an analogy of what is being done is like 
trying to do a system call from inside an OS kernel. Again AIUI the idle 
domain is not a real domain but an internal construct for the scheduler 
to manage idle vcpu and attempting to make hypercalls from it is in fact 
attempting to turn into a full fledged domain.

 From a security perspective, if hacks to the XSM hooks are necessary to 
make something work then it is highly recommended to take a step back 
and ask why and whether you are doing something that is not safe from a 
security perspective.

> Also, should idle domain be restricted? IMO the idle domain is Xen
> itself which mostly bootstraps the system and performs limited work
> when switched to, and is not something a user (either dom0 or domU)
> directly interacts with. I doubt XSM was designed to include the idle
> domain (although there is an ID allocated for it in the code), so I
> would say just exclude idle in all security policy checks.

The idle domain is a limited, internal construct within the hypervisor 
and should be constrained as part of the hypervisor, which is why its 
domain id gets labeled with the same label as the hypervisor. For this 
reason I would wholeheartedly disagree with exempting the idle domain id 
from XSM hooks as that would effectively be saying the core hypervisor 
should not be constrained. The purpose of the XSM hooks is to control 
the flow of information in the system in a non-bypassable way. Codifying 
bypasses completely subverts the security model behind XSM for which the 
flask security server is dependent upon.

> I may have missed some points in that discussion, so please feel free
> to add.
> 
> Hongyan
> 
> 

V/r,
DPS

