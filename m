Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1251EBFBC8B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 14:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147987.1480098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBXeX-0007mO-V1; Wed, 22 Oct 2025 12:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147987.1480098; Wed, 22 Oct 2025 12:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBXeX-0007jh-SJ; Wed, 22 Oct 2025 12:09:17 +0000
Received: by outflank-mailman (input) for mailman id 1147987;
 Wed, 22 Oct 2025 12:09:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K0p8=47=bounce.vates.tech=bounce-md_30504962.68f8c969.v1-90857937d7ba46528d50ca0428bc5f5f@srs-se1.protection.inumbo.net>)
 id 1vBXeW-0007jb-5A
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 12:09:16 +0000
Received: from mail180-10.suw31.mandrillapp.com
 (mail180-10.suw31.mandrillapp.com [198.2.180.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecdce19c-af3f-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 14:09:14 +0200 (CEST)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-10.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4cs7Hs1qnhz5QrJgy
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 12:09:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 90857937d7ba46528d50ca0428bc5f5f; Wed, 22 Oct 2025 12:09:13 +0000
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
X-Inumbo-ID: ecdce19c-af3f-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1761134953; x=1761404953;
	bh=//vHRL4R/JMjIYJBz1NJqCzAQ7RqV6Ej8/XRsbgmQsk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=M9oPxDzbY8GGXnd5vNwrpLEtOCZkOzVibLLOL2T3gwOdsIuxEAYbdtJaFrda77y2W
	 FLn4C6MDt95djr7aaNevx2f9LFpENPa4I5KAHyg5CldfIecN2NZrorZNKKCByms3Ib
	 it/aQg8vf/XDo5kKtp3nMsHM0v1JojVkAhXrq0BJV+dlgfRGNz11nYhzp2H1h2sDFd
	 YHRbmsEzRwoizA2hD6Cjimjfo1YZh16kJ+Vd52xsJOh4cFYqeOkY/nmtzNyCvEXfWc
	 Rwnz7YZKKhdeK4URWaDnYsWzPGpXPRRJC4VgzS8Uht0o2snlveQGLtAZOlHMVhZqbI
	 Dp2pn9rzFiPYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1761134953; x=1761395453; i=teddy.astie@vates.tech;
	bh=//vHRL4R/JMjIYJBz1NJqCzAQ7RqV6Ej8/XRsbgmQsk=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=y26Oyouz6CSOqzctBdYH5Vdw69+AVJYES1+W28yWua5D+By8rdabASL5dg6oUgwzk
	 RmxXj2Q+0tNzxvky0qpcwYHfdXDD+qWigNEoi/fsddWimP+4Qgk0B4o0/bUaLqgkxh
	 R3kGks33w8h0nuOisShcli9L1KIc3vgZ6+OOSCTqZsrrLqyPxN1EAI2o+B+l0CFPwN
	 vE4sUYdoNi9dF24P/RG/ZRXujwqx39BkzKSqbZ1PtZJsdW0ecjSz9x7kD6ytCkVwyx
	 67SI/6K5GSR/27EDClFxrJviMR4B6kYos50HOC1pIsVFNHKG39+jKbpMGcHfSrK8+b
	 XDwHzCXpxGWqg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=202/4]=20vtd:=20Collapse=20x86=20subdirectory?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1761134952219
Message-Id: <be5aaddb-4531-4d60-9184-a7d7fc9bc4cf@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
References: <cover.1761124632.git.teddy.astie@vates.tech> <0b9cda94fc8b69563a5f8783d6bc3ed22b0531d9.1761124632.git.teddy.astie@vates.tech> <413a2226-bab8-41d6-b858-0255e25ee96e@citrix.com>
In-Reply-To: <413a2226-bab8-41d6-b858-0255e25ee96e@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.90857937d7ba46528d50ca0428bc5f5f?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251022:md
Date: Wed, 22 Oct 2025 12:09:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 22/10/2025 =C3=A0 12:13, Andrew Cooper a =C3=A9crit=C2=A0:
> On 22/10/2025 10:51 am, Teddy Astie wrote:
>> As VT-d only exists on x86, it doesn't make sense to have a x86-specific
>> subdirectory.
> 
> VT-d does exist elsewhere.
> 
> Xen (via the absence of ia64 support) only implements VT-d on x86.
> 
>>   Moreover, now that vtd.c empty (once we moved the deprecated
>> iommu_inclusive_mapping parameter), only ats.c remain which could be mov=
ed to
>> the upper directory.
>>
>> Collapse this directory to make the driver structure clearer.
>>
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> Do we care much about iommu_inclusive_mapping ?
> 
> What do you mean?=C2=A0 The functionality, yes.=C2=A0 The top-level optio=
n option
> that's been listed as deprecated since Xen 4.12 (7 years now), probably n=
ot.
> 

Yes, I'm speaking about iommu_inclusive_mapping=3D<boolean> command-line 
option (that lived in vtd code) that is actually deprecated and replaced 
by dom0-iommu=3Dmap-inclusive.

> But if you're going to delete it, it should be in a patch of it's own,
> including editing xen-command-line.pandoc.

I can add one (along with a approriate change in changelog).

> 
> ~Andrew



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



