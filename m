Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46697AD7876
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 18:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013311.1391809 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPl40-0000W2-KD; Thu, 12 Jun 2025 16:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013311.1391809; Thu, 12 Jun 2025 16:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPl40-0000UK-GB; Thu, 12 Jun 2025 16:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1013311;
 Thu, 12 Jun 2025 16:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ejcU=Y3=bounce.vates.tech=bounce-md_30504962.684b0446.v1-59d1d471516a4b15a87c356eb56a6148@srs-se1.protection.inumbo.net>)
 id 1uPl3y-0000UE-FM
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 16:46:02 +0000
Received: from mail187-14.suw11.mandrillapp.com
 (mail187-14.suw11.mandrillapp.com [198.2.187.14])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7b81c40-47ac-11f0-b894-0df219b8e170;
 Thu, 12 Jun 2025 18:45:59 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-14.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4bJ7h63wmPz8XS2rq
 for <xen-devel@lists.xenproject.org>; Thu, 12 Jun 2025 16:45:58 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 59d1d471516a4b15a87c356eb56a6148; Thu, 12 Jun 2025 16:45:58 +0000
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
X-Inumbo-ID: b7b81c40-47ac-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749746758; x=1750016758;
	bh=3sutpI42EtEi4mz0u2ZBCtTxbQRpGFiDM9I9bELbKHk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZPpRHWeFWxXdfjYt/4AcXv6FWc722slVVY9hibI7pOT5C1w/XmyeqQIavs5iBHb6z
	 +cgvGV4dRXKekzo+GIVwwy8HsgrNAO1Ut+duC9SSMuYExmXjase0Fy0vpgwBx8uced
	 Taf9/9AQvSDaeJL7XiEIWzy73HzfSfTLhjFW6UVFzAHsHgAPtQ0zkLE/KKpjSGA1Ek
	 +PMeHKDnikoNIhhH/RzvySW/F0ScYzYZQkK3+GL6WdH07viF3tNPbUlFSNXkxJsfYZ
	 OryuD16fF318HqqVNb50Jkdg6WxZX1GnDCngzZnXmUVqeuUmoybEVzyxT2za2GekoR
	 1Eeq7BjWgookQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749746758; x=1750007258; i=teddy.astie@vates.tech;
	bh=3sutpI42EtEi4mz0u2ZBCtTxbQRpGFiDM9I9bELbKHk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=u6W7vrbsDySPrOGhmPkVRhqF5aMDuKynuXPTdPgg8d0lM84XF4Cr1QTluS5kfrNG2
	 6fZ+5v95HadIc/UYe7XBufiAxp218OrrtsAMSd4k70w1YZAh03tYbxK0/CBG2qPSbM
	 1q7jgcXdIjEl+scmSkZXCwRcm+GpihsvM5folBRW/FDwuvd/7n+1ghyrHZwk8cURjJ
	 Rs89zRchqAYP61+ioSfFmqkW9bkAYHucHZBX2c3FQHXEFPrMl9P5YUNpbisbHcK22m
	 R4dHJrNy/xwOgNKHbUlUfXdoeMN3dl0p6jLNZYxNH425jZRB0XbfVRLDBDw6GuRApz
	 Y0qz4RzszGrYQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC]=20Proposed=20x86=20shadow=20paging=20changes?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749746757835
Message-Id: <e8ebc4fa-b478-4634-bcb7-85c9bd07730e@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <a769ea0f-84b7-47d0-9a6a-438de98aa0ed@vates.tech> <2274612e-d6cd-402e-9f2c-cefb72422cd7@suse.com>
In-Reply-To: <2274612e-d6cd-402e-9f2c-cefb72422cd7@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.59d1d471516a4b15a87c356eb56a6148?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250612:md
Date: Thu, 12 Jun 2025 16:45:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 12/06/2025 =C3=A0 14:12, Jan Beulich a =C3=A9crit=C2=A0:
> On 12.06.2025 13:45, Teddy Astie wrote:
>> In Xen x86, there is the shadow paging that could be used in some cases
>> (notably with HVM), and is used when HAP is not available. It may also
>> be used in very specific cases for PV guests.
>>
>> With the vast majority of hardware supporting HAP (through EPT or NPT),
>> it's rarely used in practice for HVM, with most downstream projects
>> (XenServer, XCP-ng, QubesOS) are compiling-out its support by default.
>> It also performs very significantly worse than HAP.
> 
> Whenever this argument was made, iirc it was in particular George (who
> was involved in the original work aiui) who kept pointing that such a
> statement is not generally true, for numbers being workload dependent.
> 

I am a bit curious on specific workloads where shadow paging performs 
better than hap. Especially considering that shadow paging doesn't 
support PCID and the existence of ASIDs.

>> Therefore, it's not very used in production, and unsurprisingly isn't
>> actively being worked on (most projects being around HAP).
> 
> Is it not? Feel free to review this 2 year old series
> (https://lists.xen.org/archives/html/xen-devel/2023-05/msg01140.html),
> to allow it to finally go in. I'm simply reluctant to do any other work
> in that area until such earlier work was properly settled. In fact I may
> have added one or two patches on top in the meantime, but I saw no good
> reason to even post them, given the state of the series.
> 
>> One of the issues of Shadow Paging is that it relies on a heavy set of
>> optimizations, with some of them being effectively obselete
>> (optimisations based on heuristics designed for more than 20 years old
>> kernels) or eventually problematic (e.g with modern CPU mitigations e.g
>> L1TF mitigations).
>> Most of these optimizations are hard to reason regarding reliability and
>> security and difficult to debug. Some of these optimizations causes very
>> subtle issues with TLB refactoring for ASID management rework [1].
>> Moreover, it's fair to say performance is no longer the priority for
>> shadow paging.
>>
>> My proposal would be to :
>> - significantly reduce the complexity of shadow paging by dropping most
>> of the complex optimizations
> 
> If such can be proven to have no dramatic effect on performance, maybe.
> 
>> - consider Shadow Paging as Deprecated
> 
> I consider this impossible as long as it's still used for PV migration
> and PV L1TF fallback. In particular ...
> 

What about deprecated only for HVM ?

>>   > Functional completeness: Yes
>>   > Functional stability: Quirky
>>   > Interface stability: No (as in, may disappear the next release)
> 
> ... I don't see this as being possible to happen any time soon.
> 
> Jan
> 
>>   > Security supported: Yes
>>
>> Teddy
>>
>> [1]
>> https://lore.kernel.org/xen-devel/9cdb3e67abd01390bcc4cd103ca539d6bf7adb=
c0.1747312394.git.teddy.astie@vates.tech/
>>
>>
>>   | Vates
>>
>> XCP-ng & Xen Orchestra - Vates solutions
>>
>> web: https://vates.tech
>>
>>
> 


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



