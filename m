Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B5D5627A2
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 02:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358778.588155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o74Ho-0006AX-2P; Fri, 01 Jul 2022 00:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358778.588155; Fri, 01 Jul 2022 00:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o74Hn-00068f-UU; Fri, 01 Jul 2022 00:13:27 +0000
Received: by outflank-mailman (input) for mailman id 358778;
 Fri, 01 Jul 2022 00:13:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q11/=XG=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1o74Hm-00068M-Dw
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 00:13:26 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e869347-f8d2-11ec-bdce-3d151da133c5;
 Fri, 01 Jul 2022 02:13:24 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1656634399124369.22079018393185;
 Thu, 30 Jun 2022 17:13:19 -0700 (PDT)
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
X-Inumbo-ID: 9e869347-f8d2-11ec-bdce-3d151da133c5
ARC-Seal: i=1; a=rsa-sha256; t=1656634401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MzZCeTW6aM8Tz9mFcnzfFpK+mkYS24Ys4j2pE+YfELkUkbWNcsBSZr1H5lLdEMQv9cyAezfPwxb7KRB29eCvt/dZc6Unnj7xE1lgFbh9ICSf3qYILjXVLdrfLbw2sg0I/WaujW/aSbuu2TcCnC24quQiJWORlD9sTpVl5Q6HsE0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1656634401; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=feV83fab+6AFl6hEvNKgoWcd6V6qGB2HOCVoWX3SF2I=; 
	b=dJzGA3dy2/bFrxUYt+Xk7aFjC6d0oymuHJn38DWZ4Y6IAB4/V3qpKfByBdvYzwbijNc+kw0oUAlo2rdvjT4FR6tpdwL40PAhKkh8LnilcWcv7KGeSLcgrKXDIKAUcbdGzAAaDIvJr7ZSmaRh+uGMeLpQx9wvbl+7GOBES7OqQtw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1656634401;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=feV83fab+6AFl6hEvNKgoWcd6V6qGB2HOCVoWX3SF2I=;
	b=cEthfyk5F3AgxE1HrvMQgOn+TkGCZeDi/wH7juflCuLTl0u+0zSsYlY32rciGPdv
	QpsF7bs2L5KU2DGRaX+bGkFkWvHFuBInXbkLNIA3yIYU9mP2+zSiHIq7pJGY6iWlfuF
	vFV29JQw5azuut82HvXJE6bANVkx6E2mM31fH33Q=
Message-ID: <2f227767-93f3-8895-1e9e-127e4d2ac65b@apertussolutions.com>
Date: Thu, 30 Jun 2022 20:11:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v9 0/3] Adds starting the idle domain privileged
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, scott.davis@starlab.io,
 jandryuk@gmail.com, christopher.clark@starlab.io, dgdegra@tycho.nsa.gov,
 jbeulich@suse.com, julien@xen.org, george.dunlap@citrix.com,
 andrew.cooper3@citrix.com, dfaggioli@suse.com
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
 <alpine.DEB.2.22.394.2206301529570.4389@ubuntu-linux-20-04-desktop>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <alpine.DEB.2.22.394.2206301529570.4389@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External


On 6/30/22 18:35, Stefano Stabellini wrote:
> On Wed, 29 Jun 2022, Daniel P. Smith wrote:
>> This series makes it so that the idle domain is started privileged under the
>> default policy, which the SILO policy inherits, and under the flask policy. It
>> then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
>> by an XSM policy to transition the idle domain to its running privilege level.
>>
>> Patch 3 is an important one, as first it addresses the issue raised under an
>> RFC late last year by Jason Andryuk regarding the awkward entanglement of
>> flask_domain_alloc_security() and flask_domain_create(). Second, it helps
>> articulate why it is that the hypervisor should go through the access control
>> checks, even when it is doing the action itself. The issue at hand is not that
>> the hypervisor could be influenced to go around these check. The issue is these
>> checks provides a configurable way to express the execution flow that the
>> hypervisor should enforce. Specifically with this change, it is now possible
>> for an owner of a dom0less or hyperlaunch system to express a policy where the
>> hypervisor will enforce that no dom0 will be constructed, regardless of what
>> boot construction details were provided to it. Likewise, an owner that does not
>> want to see dom0less or hyperlaunch to be used can enforce that the hypervisor
>> will only construct a dom0 domain. This can all be accomplished without the
>> need to rebuild the hypervisor with these features enabled or disabled.
> 
> 
> It looks like this patch series is fully acked except:
> - in theory we need an ack from Daniel for flask
> - there is a very small change to sched that would need an ack from
>   George/Dario
> 
> 
> I think we should commit the series in a couple of days unless someone
> spots an issue with it. Let me know if you have any concerns with this.
> 
> The minimal request to improve the in-code comment by Jan could be done
> on commit.

I already have those changes ready to go. I was holding off with the
hope that Jason might find some time to read the last patch. I can try
pinging him directly tomorrow to see if he is even in town, as this is a
big holiday weekend here in the states.

> Note that committing this series would also have the benefit of
> unblocking the ARM gitlab-ci pipeline.

v/r,
dps

