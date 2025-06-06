Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0181DAD02F3
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 15:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008546.1387821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWu5-0001LD-E2; Fri, 06 Jun 2025 13:14:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008546.1387821; Fri, 06 Jun 2025 13:14:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNWu5-0001JL-BS; Fri, 06 Jun 2025 13:14:37 +0000
Received: by outflank-mailman (input) for mailman id 1008546;
 Fri, 06 Jun 2025 13:14:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3yS5=YV=bounce.vates.tech=bounce-md_30504962.6842e9b5.v1-943029341ed845ecaf7c959627a851d3@srs-se1.protection.inumbo.net>)
 id 1uNWu4-0001JF-7h
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 13:14:36 +0000
Received: from mail36.us4.mandrillapp.com (mail36.us4.mandrillapp.com
 [205.201.136.36]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2df0a66d-42d8-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 15:14:30 +0200 (CEST)
Received: from pmta15.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail36.us4.mandrillapp.com (Mailchimp) with ESMTP id 4bDMGs32Q0zS6490c
 for <xen-devel@lists.xenproject.org>; Fri,  6 Jun 2025 13:14:29 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 943029341ed845ecaf7c959627a851d3; Fri, 06 Jun 2025 13:14:29 +0000
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
X-Inumbo-ID: 2df0a66d-42d8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1749215669; x=1749485669;
	bh=rmA1dBtxjSRg0bWhkqTxNO3I99+IO9Y74gvQliIpfNc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0jnppKPRD/OzlNfjsep+/dt149kl1fAMZ2LbiujpQa7hslW0G0VP02McgbZyTQc+v
	 GQnUXP8EVk3CpuG81/6PqDHfVG9jkVGcSgTlZMC061ODYTaMgzEBVedTjizfKUWXNM
	 Y9Yszrpnbo86fH5PbipvSeavh4ij2/otzQRog1ctG2IhU4y/VwRS2sIQYcmUMfueJv
	 5cCXfn8oNSW9FSvhdp3030056tyYWc8iGjUwfEu3KBysO6HSmjgM5/TKA6wJpu3LhZ
	 p21Mlg0umRvklYTzYH1s9JbTtE68qL9vOqaVHpWVQ8+dt0q8msbniFvkQro000bGCJ
	 d1OF/15uc5uLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1749215669; x=1749476169; i=teddy.astie@vates.tech;
	bh=rmA1dBtxjSRg0bWhkqTxNO3I99+IO9Y74gvQliIpfNc=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sk8wCndjKmPKUHXmVVnfS0mVElr09SzICnb1T7mWKEn53K/zRMlVVLTOf8oTbmHd/
	 cLzcP2tyvZi8iRP3q5C2QuUwO0wKp9ceFyhYNZmxzYibcrak60MToO4tQkX/iRx+uM
	 V3tFQSQYYxeU8/OACWofhYswn9QexJT/y8ierJZsY03uEKA0+kJ7qqp0cBH786UgiC
	 jNN+VhzYDUMnn6uG9dOo6WgbH3S37ObePj4gQqhoxCANF5oU5RTG5zLkhK0Vtbihsa
	 5tVQon2VLZE+QlW4hlxp0Ecqy/WhfLEIQyWZVdf2/QJfQUV+HhPjTaF+PL6g81BX2a
	 URCF939aCLgDQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v5=204/6]=20x86:=20control=20memset()=20and=20memcpy()=20inlining?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1749215668377
Message-Id: <0c955c01-fc47-499f-b900-61de814cf16e@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com> <f659ba34-a1cc-444b-8727-2ecfbcfb00e3@suse.com> <f909c07f-d587-4ce7-9bbc-bdc13f604664@vates.tech> <0c9d2432-3c5c-4f93-8c07-99894d7f8606@suse.com>
In-Reply-To: <0c9d2432-3c5c-4f93-8c07-99894d7f8606@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.943029341ed845ecaf7c959627a851d3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250606:md
Date: Fri, 06 Jun 2025 13:14:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 06/06/2025 =C3=A0 11:21, Jan Beulich a =C3=A9crit=C2=A0:
> On 05.06.2025 19:34, Teddy Astie wrote:
>> Le 05/06/2025 =C3=A0 12:28, Jan Beulich a =C3=A9crit=C2=A0:
>>> Stop the compiler from inlining non-trivial memset() and memcpy() (for
>>> memset() see e.g. map_vcpu_info() or kimage_load_segments() for
>>> examples). This way we even keep the compiler from using REP STOSQ /
>>> REP MOVSQ when we'd prefer REP STOSB / REP MOVSB (when ERMS is
>>> available).
>>>
>>
>> If the size is known and constant, and the compiler is able to generate
>> a trivial rep movs/stos (usually with a mov $x, %ecx before). I don't
>> see a reason to prevent it or forcing it to make a function call, as I
>> suppose it is very likely that the plain inline rep movs/stos will
>> perform better than a function call (even if it is not the prefered rep
>> movsb/stosb), eventually also being smaller.
>>
>> I wonder if it is possible to only generate inline rep movs/stos for
>> "trivial cases" (i.e preceded with a plain mov $x, %ecx), and rely on
>> either inline movs or function call in other cases (non-trivial ones).
> 
> Note how the description starts with "Stop the compiler from inlining
> non-trivial ...", which indeed remain unaffected according to my
> observations (back at the time).

Yes, at least it is what appears to happen when testing using GCC 14.2.0 
where non-trivial memset/memcpy are replaced with explicit functions 
call, and some trivial ones still use rep movsb/l/q.

Though,

> unrolled_loop:16:noalign,libcall:-1:noalign

to me sounds like :
- use a inline unrolled loop for 0-16 memcpy/memset
- call memset/memcpy for other cases
(thus no rep-prefix shall be used)

The align/noalign meaning being vaguely documented in GCC documentation, 
so it's unclear if it only affects "non-aligned" copies, or potentially 
all of them.

> 
> Jan
> 

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



