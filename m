Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9063ACF82
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 17:54:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144818.266504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGoZ-0006VH-BX; Fri, 18 Jun 2021 15:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144818.266504; Fri, 18 Jun 2021 15:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luGoZ-0006SU-8J; Fri, 18 Jun 2021 15:53:51 +0000
Received: by outflank-mailman (input) for mailman id 144818;
 Fri, 18 Jun 2021 15:53:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UjTI=LM=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1luGoY-0006SO-46
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 15:53:50 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08ebd227-764f-4cdb-9248-5c8e9f95d7bf;
 Fri, 18 Jun 2021 15:53:49 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1624031612945314.7643764006626;
 Fri, 18 Jun 2021 08:53:32 -0700 (PDT)
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
X-Inumbo-ID: 08ebd227-764f-4cdb-9248-5c8e9f95d7bf
ARC-Seal: i=1; a=rsa-sha256; t=1624031615; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GWxLYqJd2pFqAY4smF8hNBFJvbufP05u/lOIOY22CsEkWeH44Uzn8vvO7cqHKISU2feoLMD8Mu9EvBjtd1nOK1MmVWF4ieT1aIxImcswttJiyDQZ80591XJbgzko+eEEcjRTnPU5e2HqgzTiZSWjzdcnlQ0Yj5wp/WpF5aX0GSU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1624031615; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=XEiZ0OtFS7O29rUsQHkZqz53ltyNSi0NrVXpKFni0Bg=; 
	b=S1NGG3ZUyXBvgeZBGT6Sxp2C28PNPoPziWFSwniL7q71pXEGH3Ml9Fz/AsSQ9o+UEmewNE36d4ZyJYa5gB2YVS7iVbAa23OUEkJVFynYGsQAm/zMI3Fi+7P/7XL9qlAqJ6B+e6MmHxHLiaFt35oYT9WSMaRiQ6ZtmbrXu88s3dA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1624031615;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XEiZ0OtFS7O29rUsQHkZqz53ltyNSi0NrVXpKFni0Bg=;
	b=RN+Gj/MjiE+1thAyjgxU5zo5agCYL6plIbehBcdq4KXK3VVwVKhY0kxjLL3MkXua
	IeCLI6u03+VEqMGUsFQYDC1ejl/hFfgQgwf2tfGCWo/u3KN1fIhHtjHxA4BEvoE2WKm
	hDT8+QAj6HV7tkiF48/21HrxNTvphTprk1Pt5xmI=
Subject: Re: [PATCH 0/6] xsm: refactoring xsm hooks
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Tim Deegan <tim@xen.org>,
 Juergen Gross <jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul@xen.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, persaur@gmail.com,
 christopher.w.clark@gmail.com, adam.schwalm@starlab.io,
 scott.davis@starlab.io
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <7219a9c8-f6c0-a86c-bf47-5b38c579170b@citrix.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <6ab0d368-2625-40b6-bdce-69a76c6542fb@apertussolutions.com>
Date: Fri, 18 Jun 2021 11:53:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7219a9c8-f6c0-a86c-bf47-5b38c579170b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 6/18/21 6:14 AM, Andrew Cooper wrote:
> On 18/06/2021 00:39, Daniel P. Smith wrote:
>> Based on feedback from 2021 Xen Developers Summit the xsm-roles RFC
>> patch set is being split into two separate patch sets. This is the first
>> patch set and is focused purely on the clean up and refactoring of the
>> XSM hooks.
>>
>> This patch set refactors the xsm_ops wrapper hooks to use the alternative_call
>> infrastructure. Then proceeds to move and realign the headers to remove the
>> psuedo is/is not enable implementation. The remainder of the changes are clean up
>> and removing no longer necessary abstractions.
>>
>> <snip>
>>  51 files changed, 1309 insertions(+), 1413 deletions(-)
> 
> The diffstat is great, but sadly CI says no. 
> https://gitlab.com/xen-project/patchew/xen/-/pipelines/323044913
> 
> The problem is that ARM doesn't have alternative_vcall().  Given how
> much of an improvement this ought to be for hypercalls, I don't want to
> lose the vcalls.
> 
> One option is to implement vcall() support on ARM, but that will leave
> new architectures (RISC-V on the way) with a heavy lift to get XSM to
> compile.
> 
> Instead, what we want to do is make vcall() a common interface, falling
> back to a plain function pointer call for architectures which don't
> implement the optimisation.  So something like:
> 
> 1) Introduce CONFIG_HAS_VCALL, which is selected by X86 only right now
> 2) Introduce xen/vcall.h which uses CONFIG_HAS_VCALL to either include
> asm/vcall.h or provide the fallback implementation
> 3) Switch x86's current use over to this new interface
> 
> The iommu_vcall() is a red herring, not adequately documented, and needs
> to stay in some form.  Specifically, it needs to not become an
> alternative on ARM, even if ARM gains vcalls.  I'd be tempted to rework
> it in 4) to use the common vcall() by default, and leave ARM as the
> special case overriding the default behaviour, along with an explanation
> of why it isn't a vcall().
> 
> Obviously, name subject bikeshedding.  alternative_vcall() is a bit of a
> mouthful, and I don't think that alt_vcall() loses any salient information.
> 
> Thoughts?

I can look at spinning an attempt at what you are suggesting and submitting.

v/r,
dps


