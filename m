Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07A8745B5A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 13:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558069.871869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGHvB-0004nU-E9; Mon, 03 Jul 2023 11:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558069.871869; Mon, 03 Jul 2023 11:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGHvB-0004lb-BJ; Mon, 03 Jul 2023 11:40:45 +0000
Received: by outflank-mailman (input) for mailman id 558069;
 Mon, 03 Jul 2023 11:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fMaW=CV=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1qGHv9-0003Ml-4t
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 11:40:43 +0000
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com
 [136.143.184.59]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f5ad728-1996-11ee-8611-37d641c3527e;
 Mon, 03 Jul 2023 13:40:41 +0200 (CEST)
Received: from [10.10.1.94] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1688384419951877.2414136011109;
 Mon, 3 Jul 2023 04:40:19 -0700 (PDT)
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
X-Inumbo-ID: 6f5ad728-1996-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; t=1688384421; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cFwMk09dzT0vneG+8ZDsuOP5KlklzW8WBklDCPI9LDe9pmEO0rnzSYoVc898fazVnVeZ+CzJpFLPGg7e0dTKhKkEUTjjYRWesITp1lr+kHQzEQXbx+WHJVYrcESiPJMZJgHDglkxMRXHbx6+c+yeZyG8TTeOdT2OIPN1ftLKYaI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1688384421; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DTgl9jwz2fepBYFxfxTiktRfHIC/YIshbjxQzz/ZFwI=; 
	b=W9bHqGrTmPXFERq5RL7GA50MY/wWilHzQadzyqos5hpAeoJKivzzP0pOMrpyKOirvqUqRInEXRd5rEd8p9x64WFy2hrDvZOybIHzuoijC7mU7s2LpPz0I9Ce+mV0+gbTqpbNyRTPwS42GEuCPy9Prnjqx9EqfJ6T0U3EJ4YDTYI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1688384421;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=DTgl9jwz2fepBYFxfxTiktRfHIC/YIshbjxQzz/ZFwI=;
	b=c/pyy6Jry6KoSOCX2t4w/VsxJRTT5+RPvTt76HB56mg3QyfCCX8Z+ClqJXcBvjuq
	2LPwEnA0g1askOAiNLAyNYqKOMnzeGR2hsOUeKiHxcB/NxszM/azFAUUpZ1VAJ+MUgp
	XwibBRYpTmEeNJk6IZwl8NiJe1TZcXk7t02yQ/G8=
Message-ID: <0c113f33-4410-aa75-84b7-c3ca860688f9@apertussolutions.com>
Date: Mon, 3 Jul 2023 07:40:17 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Community Manager <community.manager@xenproject.org>,
 Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20230630091210.3742121-1-luca.fancellu@arm.com>
 <6060dd00-5d9c-3804-4b9d-154b9b9dca49@citrix.com>
 <31FE51E0-0336-4756-8B30-6FE77DE10932@arm.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <31FE51E0-0336-4756-8B30-6FE77DE10932@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 7/1/23 11:13, Luca Fancellu wrote:
> 
> 
>> On 1 Jul 2023, at 08:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 30/06/2023 10:12 am, Luca Fancellu wrote:
>>> The "dom0less" feature was intended to be the feature where a domU
>>> domain could be launched without the control domain (Dom0)
>>> intervention, however the name seems to suggest that Dom0 cannot
>>> be part of the configuration, while instead it's a possible use case.
>>>
>>> To avoid that, rename the "dom0less" configuration with the name
>>> "hyperlaunch", that is less misleading.
>>>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> This is an RFC to get the feeling of the community about the name
>>> change, for now it's everything in one patch just to see how it
>>> will look like, if there is interest on proceeding into it, I can
>>> split in more commit.
>>
>> Have you discussed this with Dan and Chris at all?  You haven't even
>> CC'd them.
> 
> No, this rename idea started from a chat during the summit, anyway Julien
> promptly add them to the CC, because I forgot.

No worries and thank you for considering and taking the time to do this 
RFC. It is greatly appreciated that there is a strong willingness to 
have dom0less and hyperlaunch merged.

>>
>> While there is a lot of end-goal in common between the dom0less and
>> hyperlaunch, and that the name dom0less is deeply misleading,
>> hyperlaunch is specifically not this.
> 
> Yes Hyperlaunch is more than this, however as I said, with this RFC I would like
> to ear opinions, @Daniel @Christopher could it be a proper name for the dom0less
> feature?

As Andy has alluded, hyperlaunch is meant to provide a flexible means to 
handle domain construction at boot to meet a wide range of possible use 
cases. One of those use cases is dom0less, so yes, ultimately what 
dom0less does today will be achievable under hyperlaunch. Our intended 
approach to align the two implementations is one that is meant to be 
minimally disruptive, since dom0less is considered a supported 
(SUPPORT.md) capability. As mentioned, we are greatly appreciative to 
the openness to adopt the name, but a big concern I personally have is 
the confusion it could cause a general user. A blanket rename would end 
up with two documents in the docs tree that provide two different 
explanations of hyperlaunch and two different device tree definitions. 
So I think a more measured approach should be considered here.

> If this patch makes things more difficult for the Hyperlunch serie, I’m ok to drop it,
> my only aim was just to find a less misleading name for the feature.

What I would like to suggest as a good first step would be an update to 
the dom0less document. Provide a note at the beginning that points to 
the hyperlaunch design doc as a more general approach that will 
eventually subsume dom0less. This would provide a gentler transition for 
exist users of dom0less.

If it is not too much, I would also ask, please have a look at the 
design for boot modules in the series Christopher just posted. The 
design pulls from the work done by dom0less and expanded upon it. I 
major step into merging the two capabilities will be to have a common 
set of structures. Once those are in place, we can move to a common 
device tree representation, and at that point we would be fairly close, 
if not at the point of a formal merger of between the two.

Thank you and please let me know what you think!

v/r,
dps

> Cheers,
> Luca
> 
>>
>> ~Andrew
> 

