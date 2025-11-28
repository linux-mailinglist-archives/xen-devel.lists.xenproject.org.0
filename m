Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB231C91C4B
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 12:14:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174742.1499693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOwQQ-00064N-Mz; Fri, 28 Nov 2025 11:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174742.1499693; Fri, 28 Nov 2025 11:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOwQQ-00061i-K0; Fri, 28 Nov 2025 11:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1174742;
 Fri, 28 Nov 2025 11:14:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PqyU=6E=bounce.vates.tech=bounce-md_30504962.692983f8.v1-d60734be142e4a67a5142de03a9d113c@srs-se1.protection.inumbo.net>)
 id 1vOwQP-00061c-Fn
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 11:14:05 +0000
Received: from mail132-20.atl131.mandrillapp.com
 (mail132-20.atl131.mandrillapp.com [198.2.132.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58124f3c-cc4b-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 12:14:02 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-20.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4dHrK50YWJzFCWZ9S
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 11:14:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d60734be142e4a67a5142de03a9d113c; Fri, 28 Nov 2025 11:14:00 +0000
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
X-Inumbo-ID: 58124f3c-cc4b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1764328441; x=1764598441;
	bh=fWvvlUXp8lxK/Kka8IUH0ZGverhrkWEPxTTW/7PQC2c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pMKNwlpyVhxSb3T5sxXb+z01ajZL7mMLjS5HZeQ0qwnlHxHX2rU2GAjJJL/ozTF9A
	 lTp6NPkNsOXAwK2qRWUhlo2036fPAdnCPvQXJCEmZ9jF/EB5rNFZc3TMc6dsoptgKu
	 AKQVM6goBff9+gAoh8w4mopCz6PvATl0iepdBzHnirTQRvk/uq87pPf9dAvlVgTJZG
	 /JlZJvebxXDydXfSE6ioDAeo4FbDNZm+2p1gBlIJY+kpmBIzPxjv1kciK8W8fzKge2
	 8euy303jMgFychQo7LG40M59DcJG95WlFSArcRB6DsK6XTZvTp4IBEAQL/jEkFWHCV
	 6gYKASNIfev3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1764328441; x=1764588941; i=teddy.astie@vates.tech;
	bh=fWvvlUXp8lxK/Kka8IUH0ZGverhrkWEPxTTW/7PQC2c=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lLR019h8TT5oKfPjy4e7WXNv2dusT51GWxDlj8bUaReisg82ADn+BbUOkuapyNDJv
	 BUXwXrHZY+YSJxqiy4HCDq6o8GaKwwdzvzEKxzHLnhXSKm8K007Tf7wgJz60ymCiYY
	 2Bw32qYbbSDXE1kgtzbX34eoYXhXbWinH/PwP+OIv/vi0gxsj8Bqqo9Vz3gnJEamsj
	 tKlt6sMQwCCVvZuJZ88ByImXzBVEqJMektPp6dSApbOpjtsF+nMrbMn7lPEe6FHHgN
	 MWwhWTW+Nh+92f9h+4kn64xcjCf8OqQTNaDD7A7jcB1cBnKbGM6s97L54vY9Bcfu99
	 /0CoWnUBZ14bg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH=200/4]=20x86/p2m:=20Some=20P2M=20refactoring?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1764328439992
Message-Id: <268f4b88-8e22-42e1-ac80-da6930f894ec@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Tim Deegan" <tim@xen.org>
References: <cover.1764248710.git.teddy.astie@vates.tech> <0235ecb0-20aa-4c18-a172-0e48c13d00b9@citrix.com>
In-Reply-To: <0235ecb0-20aa-4c18-a172-0e48c13d00b9@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d60734be142e4a67a5142de03a9d113c?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251128:md
Date: Fri, 28 Nov 2025 11:14:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 27/11/2025 =C3=A0 20:52, Andrew Cooper a =C3=A9crit=C2=A0:
> On 27/11/2025 1:39 pm, Teddy Astie wrote:
>> First patch removes a shadow mode check in a function that can't be
>> called with shadow mode (only called with EPT hence HAP).
>>
>> 3 other patches drops guest_tlb_flush_mask by removing all its users :
>> in the shadow paging case by migrating it a shadow variant of it and
>> in the hap case by moving it to p2m->flush_tlb logic.
>>
>> One of the goal is to prepare adding HAP-specific optimizations to TLB
>> flushing code without risking regressions in the shadow paging code.
> 
> You need a clearer background to try and explain the changes.=C2=A0 I've
> discussed some of it with you, but it needs describing here for everyone
> else.
> 
>  From memory, encrypted AMD VMs cannot use "asid++" to flush TLBs, and
> must used VMCB->tlb_ctrl instead.
> 

Not only for encrypted VMs, but also for broadcast TLB invalidations 
(like AMD INVLPGB and Intel RAR) which also requires this.

I'm also wondering if the current model works well when Xen is running 
as a nested guest (as the L0 may get confused about the ASID changing 
constantly).

> On top of that, Xen does not have a correct abstraction for "flush guest
> VA space" vs "flush guest PA space" vs "flush Xen's mappings of guest VA
> space".=C2=A0 This comes about because of the shadow code originally had =
all
> 3 things together, and HAP didn't clean this up when the need first arose=
.
> 
> This causes over-flushing (Tamas found and reported this on Intel), and
> FLUSH_HVM_ASID_CORE isn't an adequate abstraction either.
> 

I guess that also wants to have a way to optionally specify the address 
we want to flush (whether it is gva or gpa). So that it can lower to 
things like single-address invalidation (instead of flushing everything) 
if possible and meaningful.

Having a clearer model would definetely help clarifying 
p2m_tlb_flush_sync vs paging_flush_tlb (which sounds like it does the 
same thing, but actually not really).

> 
> All of that said, it would help to have a sketch of what you want the
> logic to look like in the end.
> 

Yes, that's something I planned to do.

> "flush guest VA space" and "flush guest PA space" originate from
> different actions.=C2=A0 VA flushes always from emulation of a guest acti=
on,
> whereas PA flushes originate from modifications to the P2M.=C2=A0 When sh=
adow
> is in use, both of these escalate into a full local flush because of
> Xen's use of shadow linear mappings, but this escalation should be
> inside the shadow code, not the top level primitive.
> > Have I missed anything else?
> 

Nested virtualization will also wants clearly defined p2m semantics to 
avoid falling into obscure corner cases.

> ~Andrew
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



