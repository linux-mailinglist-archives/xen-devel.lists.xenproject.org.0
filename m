Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DF692FA9A
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 14:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757987.1167170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFfS-0006p0-4o; Fri, 12 Jul 2024 12:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757987.1167170; Fri, 12 Jul 2024 12:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSFfS-0006nJ-1y; Fri, 12 Jul 2024 12:46:30 +0000
Received: by outflank-mailman (input) for mailman id 757987;
 Fri, 12 Jul 2024 12:46:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c/ql=OM=bounce.vates.tech=bounce-md_30504962.669125a1.v1-2cb22e772bfe49859d68f731a127e561@srs-se1.protection.inumbo.net>)
 id 1sSFfR-0006nD-22
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 12:46:29 +0000
Received: from mail186-27.suw21.mandrillapp.com
 (mail186-27.suw21.mandrillapp.com [198.2.186.27])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c05bb003-404c-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 14:46:26 +0200 (CEST)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-27.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4WLBDK34c0z6CQ87q
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 12:46:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 2cb22e772bfe49859d68f731a127e561; Fri, 12 Jul 2024 12:46:25 +0000
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
X-Inumbo-ID: c05bb003-404c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1720788385; x=1721048885;
	bh=3LBjJClDAIcqsde3xIA1xFT0TmLR0+p0bPdSdYZmOIs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hqWLGlALMBs2dGbgBw3CDgpmR2nzXGZmkj77QCVrRk/WxQ29QNxrLkdrGpcBogs1j
	 5FbKWDON0EgwVK090d6uOPQJWGBowCMHGUWKlY99GsT5U2CfmZB2/CJOffujyWeW+g
	 e0m0szrKMcuztv0FXiZIIWjoPotxb4UaXGIwuAqlEh4u74xM7cGh6uzRQegU5RDg+r
	 DBCGHz8bT0jzynS5p501MuzYuAY9itAYdClzD26mIN5sYu7mci0AslT1ygfLbax3px
	 zFPhJMt/JfIECBgDESmSoO7aHxD40mYN268cEimCyEH2rB+WsUDw0cn53r/OesiCMd
	 8m7AXXPfT/lZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1720788385; x=1721048885; i=teddy.astie@vates.tech;
	bh=3LBjJClDAIcqsde3xIA1xFT0TmLR0+p0bPdSdYZmOIs=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hL32fuymSPV4CsBgOvxQGPoEbssLNjZbdp8vNSHbOFkq8AStrIVRnRiMZyTPXxTx3
	 sEi1Vlt9TgTS7r3w59bxwVXLMM+OE9pG0HLjexBHmUlaU0lhDXuT0+Gr9vQ5jH2mCe
	 UeOkXtIeBYTYy2Y+ahXb0Sva+Q/i05JkfEauUz4drP8tEPOCgqn0vw1wAsFNaSpWjc
	 DaME5VQ4ibIeU4cNLaDlkur7SeODDEBoz+PTKobDjf3ITR8AQMjNX0BQ0MSOTsmbhy
	 AksOO1uUpmNVpCSTzKRqSdIdFFbl3Uuhg3pnDeHrtHgH175QAM3VsEQhwP7F/eazG9
	 oH6LHh/OwvZnA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20XEN=20PATCH=20v3=205/5]=20xen/public:=20Introduce=20PV-IOMMU=20hypercall=20interface?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1720788384180
Message-Id: <46ba77ce-1b32-45cb-bfbb-70c6c0a21b0c@vates.tech>
To: Jan Beulich <jbeulich@suse.com>, Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.1720703078.git.teddy.astie@vates.tech> <f9ae663df38acc0d330b7582dfaa7ac199746aca.1720703078.git.teddy.astie@vates.tech> <D2MYC4AEBUQZ.3DNOIV8LEE7F9@cloud.com> <1ece7ecb-7f35-4a1c-93f8-ee4191560275@suse.com>
In-Reply-To: <1ece7ecb-7f35-4a1c-93f8-ee4191560275@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.2cb22e772bfe49859d68f731a127e561?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240712:md
Date: Fri, 12 Jul 2024 12:46:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Jan,

Le 12/07/2024 =C3=A0 12:46, Jan Beulich a =C3=A9crit=C2=A0:
> On 11.07.2024 21:20, Alejandro Vallejo wrote:
>> On Thu Jul 11, 2024 at 3:04 PM BST, Teddy Astie wrote:
>>> --- /dev/null
>>> +++ b/xen/common/pv-iommu.c
>>> @@ -0,0 +1,328 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * xen/common/pv_iommu.c
>>> + *
>>> + * PV-IOMMU hypercall interface.
>>> + */
>>> +
>>> +#include <xen/mm.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/iommu.h>
>>> +#include <xen/sched.h>
>>> +#include <xen/pci.h>
>>> +#include <xen/guest_access.h>
>>> +#include <asm/p2m.h>
>>> +#include <asm/event.h>
>>> +#include <public/pv-iommu.h>
>>> +
>>> +#define PVIOMMU_PREFIX "[PV-IOMMU] "
>>> +
>>> +#define PVIOMMU_MAX_PAGES 256 /* Move to Kconfig ? */
>>
>> It probably wants to be a cmdline argument, I think.
> 
> For Dom0. For DomU-s it wants to be a guest config setting, I suppose. Th=
en
> again I wonder if I understand the purpose of this correctly: The number =
looks
> surprisingly small if it was something the guest may use for arranging it=
s
> mappings.
> 
> Jan

Makes sense to be a guest setting for DomUs. I don't think this limit is 
too small, actually it means that we can can map up to 1M of contiguous 
memory in a single hypercall, in the guest case (e.g Linux), it very 
rarely goes beyond this limit.

I put this limit to prevent the guest from trying to map millions of 
pages, which is going to take a while (and may cause stability issues). 
And to actually give a chance for Xen to preempt the guest (and keep the 
ability to shut it down between 2 hypercalls).

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


