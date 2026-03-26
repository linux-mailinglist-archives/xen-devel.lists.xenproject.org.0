Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN+jLJF6xWnw+QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 19:27:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238C33A0E5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 19:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264668.1556085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5pPx-0005Od-8e; Thu, 26 Mar 2026 18:26:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264668.1556085; Thu, 26 Mar 2026 18:26:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5pPx-0005NB-5n; Thu, 26 Mar 2026 18:26:53 +0000
Received: by outflank-mailman (input) for mailman id 1264668;
 Thu, 26 Mar 2026 18:26:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69c57a69.v1-452d7e70b9d944b4b844328b68b68019@bounce.vates.tech>)
 id 1w5pPw-0005N5-Bc
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 18:26:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5pPv-003Juu-MM
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 19:26:51 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69c57a69.v1-452d7e70b9d944b4b844328b68b68019@bounce.vates.tech>)
 id 69c57a66-bab6-0a2a0a5309dd-0a2a450bc52e-6
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 19:26:51 +0100
Received: from [198.2.179.37] (helo=mail179-37.suw41.mandrillapp.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from
 <bounce-md_30504962.69c57a69.v1-452d7e70b9d944b4b844328b68b68019@bounce.vates.tech>)
 id 69c57a6a-ef63-0a2a450b0019-c602b325c953-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 19:26:51 +0100
Received: from pmta12.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail179-37.suw41.mandrillapp.com (Mailchimp) with ESMTP id
 4fhXL169rkzG0CLs3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 18:26:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 452d7e70b9d944b4b844328b68b68019; Thu, 26 Mar 2026 18:26:49 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1774549609; x=1774819609;
	bh=1AD6XtpInmedqkHt3lklQZZmmP5HZmKfK2sFPcPiL8Q=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vEsv4QQsazjAHRM3hDgnHJS/DV6TE2qRjFuL1KhzeJEGCPdaWKlZPr6GPJY8sd6Lw
	 DZbmBwgTTq5yuaPvSCCKPsOI6uX2VDeZ4cIxWKN2g8+e3cQnaHllnigRL447kxoEs6
	 y/YoG1nYUFel6p0+ipkWJz8SeNBs8+HM9Stb+fk9Bog5M6eoUo5e4gPumDYRZbPDgy
	 V1oIXg50UiDsBtspuPVmZwNkXymBPS2yKgqdIrNnE5dRjSFLPIilbAUGnUud8evcBP
	 2kbvHboKx2habjDMpda3HioZuqiWVkllMSer9+izacIc6QWMyYD6orGVNHYpw7ipka
	 /uw4MohVwXkLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1774549609; x=1774810109; i=teddy.astie@vates.tech;
	bh=1AD6XtpInmedqkHt3lklQZZmmP5HZmKfK2sFPcPiL8Q=;
	h=From:Subject:Message-Id:To:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=l8JHY/Tea6yBGHD1sI4FsunVDPU7/Y++mbqvOpZSJoQBLtQfgCYHF2QDpq3fUF0G5
	 ZOJNfuLl/mrRjHZIfkczqwaAAGxKopAkS+iAB/75GKxEACbuTACL7DEj4EFtSQa5fs
	 0WuDayNMs/82LGffSVpuHGz91NrlfQSQlqakKSfNY86YFvMegVGZ+eQoOxjs5+X8q0
	 lNWw2MZRVQPeQzjGf0eYFqALRkbag1S7yGwyvJmoO8ZkAbAxAoAA9itHVNLTgPWImw
	 8lITpTTpOP3FDfQFiM6Xdaj0AZ12vLBF70kI7ILOUaOHnMuRl6/GC7/iB+ZlW+EcHc
	 5urfVUKW3eWCg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20Mapping=20non-pinned=20memory=20from=20one=20Xen=20domain=20into=20another?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1774549607657
Message-Id: <df6194cf-1fc4-4a20-ad46-6eeab1d920a2@vates.tech>
To: "Demi Marie Obenour" <demiobenour@gmail.com>, "Xen developer discussion" <xen-devel@lists.xenproject.org>, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, "Jan Beulich" <jbeulich@suse.com>, "Val Packett" <val@invisiblethingslab.com>, "Ariadne Conill" <ariadne@ariadne.space>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Juergen Gross" <jgross@suse.com>
References: <84462c4b-7813-4ad1-aeb2-862ae4f3a627@gmail.com> <5123c11c-3b8a-4633-809f-16c24418a4ce@vates.tech> <4f201188-31ac-4dac-9cc6-79c4283486e5@gmail.com>
In-Reply-To: <4f201188-31ac-4dac-9cc6-79c4283486e5@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.452d7e70b9d944b4b844328b68b68019?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260326:md
Date: Thu, 26 Mar 2026 18:26:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1774549611-990B9112-8381C09B/0/0
X-purgate-type: clean
X-purgate-size: 6581
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org,lists.freedesktop.org,kvack.org,suse.com,invisiblethingslab.com,ariadne.space,citrix.com];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:demiobenour@gmail.com,m:xen-devel@lists.xenproject.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:jbeulich@suse.com,m:val@invisiblethingslab.com,m:ariadne@ariadne.space,m:andrew.cooper3@citrix.com,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.232];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1238C33A0E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 26/03/2026 =C3=A0 18:18, Demi Marie Obenour a =C3=A9crit=C2=A0:
> On 3/24/26 14:00, Teddy Astie wrote:
>>> ## Restrictions on lent memory>>
>>> Lent memory is still considered to belong to the lending domain.
>>> The borrowing domain can only access it via its p2m.  Hypercalls made
>>> by the borrowing domain act as if the borrowed memory was not present.
>>> This includes, but is not limited to:
>>>
>>> - Using pointers to borrowed memory in hypercall arguments.
>>> - Granting borrowed memory to other VMs.
>>> - Any other operation that depends on whether a page is accessible
>>>     by a domain.
>>
>> What about emulated instructions that refers to this memory ?
> 
> This would be allowed if (and only if) it can trigger paging as you
> wrote above.
> 
>>> Furthermore:
>>>
>>> - Borrowed memory isn't mapped into the IOMMU of any PCIe devices
>>>     the guest has attached, because IOTLB faults generally are not
>>>     replayable.
>>>
>>
>> Given that (as written bellow) Borrowed memory is a part of some form of
>> emulated BAR or special region, there is no guarantee that DMA will work
>> properly anyway (unless P2P DMA support is advertised).
>>
>> Splitting the IOMMU side from the P2M is not a good idea as it rules out
>> the "IOMMU HAP PT Share" optimization.
> 
> If the pages are mapped in the IOMMU, paging them out requires an
> IOTLB invalidation.  My understanding is that these are far too slow.
> 

yes (aside specific cases like with paravirtualized IOMMU), but only if 
you have a device in the guest.

The problem is that that would force us to modify the ABI to have 
"non-DMA-able" memory in the guest, which doesn't exist yet aside 
specific cases like grants in PV.

> How important is sharing the HAP and IOMMU page tables?
> 
>>> - Foreign mapping hypercalls that reference lent memory will fail.
>>>     Otherwise, the domain making the foreign mapping hypercall could
>>>     continue to access the borrowed memory after the lease had been
>>>     revoked.  This is true even if the domain performing the foreign
>>>     mapping is an all-powerful dom0.  Otherwise, an emulated device
>>>     could access memory whose lease had been revoked.
>>>
>>> This also means that live migration of a domain that has borrowed
>>> memory requires cooperation from the lending domain.  For now, it
>>> will be considered out of scope.  Live migration is typically used
>>> with server workloads, and accelerators for server hardware often
>>> support SR-IOV.
>>>
>>> ## Where will lent memory appear in a guest's address space?
>>>
>>> Typically, lent memory will be an emulated PCI BAR.  It may be emulated
>>> by dom0 or an alternate ioreq server.  However, it is not *required*
>>> to be a PCI BAR.
>>>
>>
>> ---
>>
>> While the design could work (albeit the implied complexity), I'm not a
>> big fan of it, or at least, it needs to consider some constraints for
>> having reasonable performance.
>> One of the big issue is that a performance-sensitive system (virtualized
>> GPU) is interlocking with several "hard to optimize" subsystem like P2M
>> or Dom0 having to process a paging event.
>>
>> Modifying the P2M (especially removing entries) is a fairly expensive
>> operation as it sometimes requires pausing all the vCPUs each time it's
>> done.
> 
> Not every GPU supports recoverable page faults.  Even when they
> are supported, they are extremely expensive.  Each of them involves
> a round-trip from the GPU to the CPU and back, which means that a
> potentially very large number of GPU cores are blocked until the
> CPU can respond.  Therefore, GPU driver developers avoid relying on
> GPU page faults whenever possible.  Instead, data is moved in large
> chunks using a dedicated DMA engine in the GPU.
> As a result, I'm not too concerned with the cost of P2M manipulation.
> Anything that requires making a GPU buffer temporarily inaccessible
> is already an expensive process, and driver developers have strong
> incentives to keep the time the buffer is unmapped as short as
> possible.
> If performance turns out to be a problem, something like KVM's
> asynchronous page faults might be a better solution.
> 

Asynchronous page fault looks like a interesting and potentially easier 
to implement.

IIUC, the idea is to make the pages disappears on the guest behalf, and 
the guest would have to deal with the eventual page fault. Currently in 
Xen, a unhandled #NPF is fatal, but that could be tuned down for 
specific regions and transformed into a #PF or another exception for the 
guest to handle.

We have actually a similar need for SEV-ES MMIO handling, as we need to 
distinguish "MMIO-related NPF" (to paravirtualize through GHCB) to the 
other NPF; which needs to be configured in advance in page-tables (so 
that the CPU choose between #VC and VMEXIT#NPF).

It would also need some form of para-virtualization coming from virtio 
or a new Xen PV driver for the guest to be made aware of this mechanism.
I also assume that the guest handles properly that kind of event.

>> If it's done at 4k granularity, it would also lack superpage support,
>> which wouldn't help either. (doing things at the 2M+ scale would help,
>> but I don't know enough how MMU notifier does things.
>>
>> While I agree that grants is not a adequate mechanism for this (for
>> multiples reasons), I'm not fully convinced of the proposal.
>> I would prefer a strategy where we map a fixed amount of RAM+VRAM as a
>> blob, along with some form of cooperative hotplug mechanism to
>> dynamically provision the amount.
> 
> I asked the GPU driver developers about pinning VRAM like this a couple
> years ago or so.  The response I got was that it isn't supported.
> I suspect that anyone needing VRAM pinning for graphics workloads is
> using non-upstreamable hacks, most likely specific to a single driver.
> 
> More generally, the entire graphics stack receives essentially no
> testing under Xen.  There have been bugs that have affected Qubes OS
> users for months or more, and they went unfixed because they couldn't
> be reproduced outside of Xen.  To the upstream graphics developers,
> Xen might as well not exist.  This means that any solution that
> requires changing the graphics stack is not a practical option,
> and I do not expect this to change in the foreseeable future.


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



