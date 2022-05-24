Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB0F532FF8
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 20:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336707.561100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntYpN-0006bP-KH; Tue, 24 May 2022 18:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336707.561100; Tue, 24 May 2022 18:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntYpN-0006ZD-Gr; Tue, 24 May 2022 18:00:17 +0000
Received: by outflank-mailman (input) for mailman id 336707;
 Tue, 24 May 2022 18:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6c9/=WA=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1ntYpM-0005MP-Mj
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 18:00:16 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c6f1f52-db8b-11ec-837f-e5687231ffcc;
 Tue, 24 May 2022 20:00:15 +0200 (CEST)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1653415195405721.5775292220314;
 Tue, 24 May 2022 10:59:55 -0700 (PDT)
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
X-Inumbo-ID: 5c6f1f52-db8b-11ec-837f-e5687231ffcc
ARC-Seal: i=1; a=rsa-sha256; t=1653415213; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WBK6L3Nel+O6afU+R/ZpE0N5PK/NOQEv56faR79y+sm8o3HadX8Y30hZGQT2IHrhe4h9Z4CFmCK8Oe4h2d6pJLubUMmUt2eEW/zchNEIQfF63lGSz/ZlSqpg5K3ymGvnCFNvBRDWEcG6aKd1LmKGJ0L3rFteAQ5ggt49N2pSF7Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1653415213; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=A0NTTAo1SuOkAyNJpRscid4Uxwkm6A6JVfaNhMYraAc=; 
	b=MBhQv8sUsuQCAM2OE+Y8tUVmg2TqUoKNrD0+Oo4+nOa9H4V9C0gKlBaAX9p+Cx6NLszCQynxCrePUjrBVZtDkI9pXw4VJ9Cy8ApKQHt1klWvEhAmFJ7Th7SLasv/zoWHSyp2C5ljclWJ0PmtktoIogf6hum3uCudBP5QbgVl5P4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1653415213;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:To:To:Cc:Cc:References:From:From:Subject:Subject:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=A0NTTAo1SuOkAyNJpRscid4Uxwkm6A6JVfaNhMYraAc=;
	b=oElyvfoYTOfAwEqwk3QNciI4MzxmkYw16D2pKgQl+SqVFsHJlniRd+B4PVxjGvqC
	FcuciLnyMWQye4y8SpFsMGpt/kX2WNgtD0ZDp35E0WBaeAW4501g6/VPhNoFsi5kXoA
	Z8ZG4GnbvzZMVMUbSonfcMGN5GR9wGmDKL1VNrLM=
Message-ID: <cc34fd89-4eec-c4a4-804d-09733d18bd5c@apertussolutions.com>
Date: Tue, 24 May 2022 13:58:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Scott Davis <scott.davis@starlab.io>, christopher.clark@starlab.io,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20220523154024.1947-1-dpsmith@apertussolutions.com>
 <CAKf6xptJHoA=Zn+jQi6_xDjA8pkAuOnGtnfw_WZenVJYcmwX8w@mail.gmail.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] xsm: refactor and optimize policy loading
In-Reply-To: <CAKf6xptJHoA=Zn+jQi6_xDjA8pkAuOnGtnfw_WZenVJYcmwX8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 5/24/22 12:17, Jason Andryuk wrote:
> On Mon, May 23, 2022 at 11:40 AM Daniel P. Smith
> <dpsmith@apertussolutions.com> wrote:
>>
>> It is possible to select a few different build configurations that results in
>> the unnecessary walking of the boot module list looking for a policy module.
>> This specifically occurs when the flask policy is enabled but either the dummy
>> or the SILO policy is selected as the enforcing policy. This is not ideal for
>> configurations like hyperlaunch and dom0less when there could be a number of
>> modules to be walked or unnecessary device tree lookups
>>
>> This patch does two things, it moves all policy initialization logic under the
>> xsm_XXXX_policy_init() functions and introduces the init_policy flag.  The
>> init_policy flag will be set based on which enforcing policy is selected and
>> gates whether the boot modules should be checked for a policy file.
> 
> I can see the use of init_policy to skip the search.  (I'm not the
> biggest fan of the name, need_policy/uses_policy/has_policy?, but
> that's not a big deal).  That part seems fine.

Yep, I went through that and several other variations trying to find the
one that would "read" best at the places it was set and checked. If
anyone has a strong stance for a preferred naming, I have no objections.

> I don't care for the movement of `policy_buffer =
> xsm_flask_init_policy;` since it replaces the single location with two
> locations.  I prefer leaving the built-in policy fallback in
> xsm_core_init since it is multiboot/devicetree agnostic.  i.e. the
> boot-method specific code passes a policy if it finds one, and
> xsm_core_init can fallback to the built-in policy if none is supplied.
> Since a built-in policy is flask specific, it could potentially be
> pushed down in flask_init.
> 
> Is there a need for the xsm_flask_init_policy movement I am missing?

I would be willing to bet that the de-duplication is the reason it was
initially done this way. But as I explained in the response to Jan,
doing so means that xsm_XXXX_policy_init() will have to return success
even if it did not successfully initialize the policy buffer. I
considered making a static inline function to point the policy buffer at
the built-in policy, but quickly walked back from it. The reason being
is that it is not any real logic duplications, just two lines of
variable setting. IMHO a single repeat of setting a pair of variables is
better than the bifurcating of the policy buffer initialization.

v/r,
dps

