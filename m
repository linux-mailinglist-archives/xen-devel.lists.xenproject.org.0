Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED53236D442
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 10:49:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119088.225412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbfsV-0005Kc-FR; Wed, 28 Apr 2021 08:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119088.225412; Wed, 28 Apr 2021 08:49:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbfsV-0005KD-C3; Wed, 28 Apr 2021 08:49:03 +0000
Received: by outflank-mailman (input) for mailman id 119088;
 Wed, 28 Apr 2021 08:49:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+xa=JZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lbfsU-0005K8-Mo
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 08:49:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98d80166-d8f7-4163-8ef9-8371b7770d3b;
 Wed, 28 Apr 2021 08:49:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E627EAF2F;
 Wed, 28 Apr 2021 08:49:00 +0000 (UTC)
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
X-Inumbo-ID: 98d80166-d8f7-4163-8ef9-8371b7770d3b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619599741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aeY/g3ui4YX7dtEb5NxwJh5hT4ZgkkgX63VRBnZlm+Q=;
	b=smDG6emRtYjSHL5FEdlEOXbtp3XJO9B+IBKzOO2BZgrMSW2FLoti5UM56m8SD72gsd+yxx
	Fj7nJytEHaeG8QPXg8qxQN430MKH1lkGy3zWR5C0AwRf4XFf6cFh4K//mkw+MsiYWAEjmW
	/p7TNwRtEH6fo825MYLMl0ew1fIFhZ0=
Subject: Re: [RFC PATCH] iommu: make no-quarantine mean no-quarantine
To: paul@xen.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Scott Davis <scottwd@gmail.com>, Scott Davis <scott.davis@starlab.io>
References: <0a292d952ff71dbfed5234d27b42a05f7b49a1fe.1619451434.git.scott.davis@starlab.io>
 <cea1d2d0-fd69-a4cd-6653-dd881d07b96a@suse.com>
 <56F61E81-511E-4ECA-B2A0-B91F250804D7@starlab.io>
 <237ad45b-b68d-9d31-0fbc-1af52dfca808@suse.com>
 <dc6556ae-c653-8519-1a81-9524e4472f26@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b6888c16-92fa-7ece-8882-3775c08f212b@suse.com>
Date: Wed, 28 Apr 2021 10:49:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <dc6556ae-c653-8519-1a81-9524e4472f26@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.04.2021 09:19, Paul Durrant wrote:
> On 28/04/2021 07:15, Jan Beulich wrote:
>> Following the extension to the command line option I'm putting in place
>> in "IOMMU: make DMA containment of quarantined devices optional" (which
>> I still need to get around to address review feedback for and resubmit),
>> I'd be inclined to suggest "iommu=quarantine=always" or
>> "iommu=quarantine=on-assign". Unless of course we'd prefer to have the
>> caller of the assignment operation have full control over the behavior
>> here anyway (in which case a command line option control simply is not
>> necessary).
>>
> 
> I'm still not entirely sure why not quarantining on is a problem,

Well, I continue to think that it is a mistake to hide problems (with
their hardware) from system administrators by default. I guess most
everyone else put usability in foreground, as my view to workarounds
(with non-benign [side-]effects) being enabled by default looks to be
generally different.

> other 
> than it triggering an as-yet undiagnosed issue in QEMU, but I agree that 
> that the expectation of 'no-quarantine' meaning just that (i.e. the old 
> dom0->domU and domU->dom0 transitions are re-instated) is reasonable.

I'm afraid I'm not clear what you're talking about here. What "old
transitions"? The ones prior to the introduction of quarantining? If
so, and if the tool stack is given (some level of) control, I guess
we'd first need to establish who "rules": The command line option,
or the tool stack (which imo ought to be acting whichever particular
way based on admin requests, not to blindly override Xen's defaults).

> Do we really want yet more command line options?

If we can avoid them without sacrificing functionality / flexibility ...

Jan

