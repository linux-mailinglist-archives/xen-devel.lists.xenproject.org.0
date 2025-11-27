Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F63FC8F888
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 17:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174265.1499225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOezu-00039D-Ni; Thu, 27 Nov 2025 16:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174265.1499225; Thu, 27 Nov 2025 16:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOezu-00036c-L3; Thu, 27 Nov 2025 16:37:34 +0000
Received: by outflank-mailman (input) for mailman id 1174265;
 Thu, 27 Nov 2025 16:37:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYBX=6D=bounce.vates.tech=bounce-md_30504962.69287e44.v1-5045fc97e5ec47b6950cfee2cae4346e@srs-se1.protection.inumbo.net>)
 id 1vOezs-00036Q-L3
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 16:37:32 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b1dea5f-cbaf-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 17:37:26 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHMXh4mjLzFCWjMM
 for <xen-devel@lists.xenproject.org>; Thu, 27 Nov 2025 16:37:24 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5045fc97e5ec47b6950cfee2cae4346e; Thu, 27 Nov 2025 16:37:24 +0000
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
X-Inumbo-ID: 5b1dea5f-cbaf-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764261444; x=1764531444;
	bh=C+nP0THGNsJheVlXHUIGUiE4UMAsBt73chUwC0Zwdho=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tDVXjVEfsnI37Tv7fTKmcDoWAc4gVWARjQFc9UdXJK83bB+6f4NEoR0FsvRBDjJgp
	 H0NdpvguKlGtsytMZZgG6XratNjXFGNMCKfFV3lJGxQEp5HCXYMR9OsFGYylosK+OC
	 6eUxgOT2x2ymNRvtcDTJlR6OZWHVr1vg8k5KIVA9O3IfAt+blLQjEONaGDQoHbNuVu
	 ko9o7aHfNZZ5AdmGYNB1/mrRBNlq1zuvpw1QSy20IjP7fEPKMY6YHfp7AN5m8jyw9R
	 9eMGmRRHFfO9oT/dCumhtNjx20ltj8rfPj5qIA5hxqie4O9xsIlqS4zJG1lqL+L7n+
	 t0YK9XAukkZeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764261444; x=1764521944; i=teddy.astie@vates.tech;
	bh=C+nP0THGNsJheVlXHUIGUiE4UMAsBt73chUwC0Zwdho=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=C55CVzfmIoHPkT1YP1gYtdQnHlP75DWq80TCz39c2vt9aW9xJ3NdIv2jobKzCQEuw
	 du8WrZGczP5eRGdPK77R6gvKMqp1QzB9mwUmXgLKjFxbKt9pF8vY+VGOMrZWNxOqjk
	 LO4CElY0cgX5DyZV9R5pXQzmkuI5XNp0si68YZGTD8GX6pbX77tRQJqqesTDCKHj6Q
	 qmUucB+jjgvs1zVu4rBacMSagiWjH655cIPIalB/WGpk+uONojgY7Tm4AuE57jvL1J
	 7NVzeQ7mJ7bKSKkjT7s2FIOTtkkDtm1OUYmFh/ne8mtcnNYwwmHWJ57YnftBVvVOX0
	 RlvHMrFnvAVxw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=203/4]=20x86/p2m-pt:=20Set=20p2m->need=5Fflush=20if=20page=20was=20present=20before?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764261443699
Message-Id: <40752e0c-7f4d-461e-9ab7-a8d6b8f10ecd@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1764248710.git.teddy.astie@vates.tech> <8f5a0cecba14cd38d739a9f29a5c8344c2f6bd11.1764248710.git.teddy.astie@vates.tech> <42fd724a-ec74-47bf-9310-74969f1d3aa5@suse.com>
In-Reply-To: <42fd724a-ec74-47bf-9310-74969f1d3aa5@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5045fc97e5ec47b6950cfee2cae4346e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251127:md
Date: Thu, 27 Nov 2025 16:37:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/11/2025 =C3=A0 15:08, Jan Beulich a =C3=A9crit=C2=A0:
> On 27.11.2025 14:39, Teddy Astie wrote:
>> Update p2m->need_flush if page was present before (requiring a tlb flush=
).
>> This causes p2m->flush_tlb() to be now be reachable, make sure we call i=
t
>> only when set.
> 
> I don't follow. Why would p2m->flush_tlb() not have been reachable? There=
 are
> other places where ->need_flush is set to true.
> 
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> This change is important for the next patch.
>> Would it be better to merge it with the next patch ?
> 
> I'm inclined to say yes, but without understanding the description here I
> cannot be sure.
> 
> Hmm, wait. The sole place in x86 where the flag is set is in EPT code. So
> do you perhaps mean that for NPT or shadow those call sites can now be
> reached, and hence - with the hook being NULL there - checks need adding?
> Then, by its title, the next patch actually may be making use of the hook=
,
> so the checks then can be dropped again?
> 

Even with the next patch, in the shadow case, p2m->flush_tlb is still 
NULL as only HAP-NPT uses hap_p2m_tlb_flush().

> Jan



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



