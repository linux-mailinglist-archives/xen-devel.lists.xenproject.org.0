Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265A92959F0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Oct 2020 10:14:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10254.27188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVjQ-0002v9-5q; Thu, 22 Oct 2020 08:13:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10254.27188; Thu, 22 Oct 2020 08:13:56 +0000
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
	id 1kVVjQ-0002uk-2V; Thu, 22 Oct 2020 08:13:56 +0000
Received: by outflank-mailman (input) for mailman id 10254;
 Thu, 22 Oct 2020 08:13:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVVjO-0002uf-08
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:13:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 821790a2-601f-4033-bda9-e18cc0bd9a75;
 Thu, 22 Oct 2020 08:13:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63D89AEB6;
 Thu, 22 Oct 2020 08:13:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Z30Q=D5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVVjO-0002uf-08
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:13:54 +0000
X-Inumbo-ID: 821790a2-601f-4033-bda9-e18cc0bd9a75
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 821790a2-601f-4033-bda9-e18cc0bd9a75;
	Thu, 22 Oct 2020 08:13:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603354432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NiGj3diI1wYoQKy25zHuk6TRVDkf/COt9qFsW9GLczM=;
	b=sK7JfJlQeZk06be7dZ+pPIYgX/OsXSb0HGzwIfwvVZ2Qwm1TC4hv5/o/nTqxImEI8Hw6cI
	YHuSA207LuPRJLAZEPJh4FMyYGWKQLgOuj71TIgHM0jX0cru8PrNjZ8CfITB0oLV06oM44
	aGiH9t6AdB59BM8znqEKnV7nrIxd2bc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 63D89AEB6;
	Thu, 22 Oct 2020 08:13:52 +0000 (UTC)
Subject: Re: XSM and the idle domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org>
 <2dbee673-036a-077e-6cb4-556aac46ac33@apertussolutions.com>
Cc: Hongyan Xia <hx242@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 andrew.cooper3@citrix.com, jandryuk@gmail.com, dgdegra@tycho.nsa.gov
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09aad1f6-b9bd-1ba4-5e08-198ab2815a5b@suse.com>
Date: Thu, 22 Oct 2020 10:13:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <2dbee673-036a-077e-6cb4-556aac46ac33@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.2020 03:23, Daniel P. Smith wrote:
> On 10/21/20 10:34 AM, Hongyan Xia wrote:
>> Also, should idle domain be restricted? IMO the idle domain is Xen
>> itself which mostly bootstraps the system and performs limited work
>> when switched to, and is not something a user (either dom0 or domU)
>> directly interacts with. I doubt XSM was designed to include the idle
>> domain (although there is an ID allocated for it in the code), so I
>> would say just exclude idle in all security policy checks.
> 
> The idle domain is a limited, internal construct within the hypervisor 
> and should be constrained as part of the hypervisor, which is why its 
> domain id gets labeled with the same label as the hypervisor. For this 
> reason I would wholeheartedly disagree with exempting the idle domain id 
> from XSM hooks as that would effectively be saying the core hypervisor 
> should not be constrained. The purpose of the XSM hooks is to control 
> the flow of information in the system in a non-bypassable way. Codifying 
> bypasses completely subverts the security model behind XSM for which the 
> flask security server is dependent upon.

While what you say may in general make sense, I have two questions:
1) When the idle domain is purely an internal construct of Xen, why
   does it need limiting in any way? In fact, if restricting it in a
   bad way, aren't you risking to prevent the system from functioning
   correctly?
2) LU is merely restoring the prior state of the system. This prior
   state was reached with security auditing as per the system's
   policy at the time. Why should there be anything denind in the
   process of re-establishing this same state? IOW can't XSM checking
   be globally disabled until the system is ready be run normally
   again?
Please forgive if this sounds like rubbish to you - I may not have a
good enough understanding of the abstract constraints involved here.

Jan

