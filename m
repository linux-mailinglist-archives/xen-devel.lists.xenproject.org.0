Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2KgZC5CUc2ktxQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 16:32:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D04877D1D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 16:32:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212342.1523537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjJ8B-0001N4-Kh; Fri, 23 Jan 2026 15:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212342.1523537; Fri, 23 Jan 2026 15:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjJ8B-0001Lc-I0; Fri, 23 Jan 2026 15:31:27 +0000
Received: by outflank-mailman (input) for mailman id 1212342;
 Fri, 23 Jan 2026 15:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nxdi=74=bounce.vates.tech=bounce-md_30504962.69739446.v1-cc70a094c3b4485b8f5b1f6e8f640562@srs-se1.protection.inumbo.net>)
 id 1vjJ8A-0001LW-8X
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 15:31:26 +0000
Received: from mail186-9.suw21.mandrillapp.com
 (mail186-9.suw21.mandrillapp.com [198.2.186.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 909a0011-f870-11f0-9ccf-f158ae23cfc8;
 Fri, 23 Jan 2026 16:31:20 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-9.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4dyMN65nD0zK5vgrm
 for <xen-devel@lists.xenproject.org>; Fri, 23 Jan 2026 15:31:18 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 cc70a094c3b4485b8f5b1f6e8f640562; Fri, 23 Jan 2026 15:31:18 +0000
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
X-Inumbo-ID: 909a0011-f870-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769182278; x=1769452278;
	bh=y8MWct1FnbcLHNIpjurdfj44N0ACIWyyIUFMtDNd+LI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Yo3Uqhpsij97j1GB1hsb7au0ygm+X7/MEjo7As2x0VCNXHIPtf17ErtS45Saz2KVy
	 cWNVmFnMTb3wyvR2aW4RyE9vlZlyJ36GS+YsSwwLA+YODxHZMH1yuUlvP41kGFCGPQ
	 eci5/BiF2JS7QFPG0TEsmCeb1rEkFuUyr84aSlFGImN6C6jsRyJcsm/p2g4F9G9p+u
	 Pij0YS/p6bXIbdV67oqXjp1Ex5Ol7lL6gyhMOOa7ZnxMTkpIShrqc+KM4N/HUdOEyh
	 vYJ7qqooRpgpQwEeKXlmXjAbbSzQ2PncEe/CLKAp3Hp/Ki3fz1pj9mcQrxYYUG6kjQ
	 vSNhlL+iZ/AUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769182278; x=1769442778; i=julian.vetter@vates.tech;
	bh=y8MWct1FnbcLHNIpjurdfj44N0ACIWyyIUFMtDNd+LI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=yf+nloaFISyYa8gpRBgiPm9EilAwnwAx85FyZRuDrLM6izTMv8d9iMw09BFOIZHEK
	 eXiIOJXC2M7nfurs0TwMEmYNfTV2sZYWDAZAQtXglitaDtdUOl1yc3L6kAhvbA+OCU
	 Zrs1aGJ1sG4MW5GQBIvpckCsBQq2WeY3xdUykqw+qWZcxqDCWB1H9IVpR5OHgoSJ+y
	 6YWaB1yftVW4PSDlj36uaXhbY99HzK3GI0p4hq4khhYdam07yD6APB9uyd5xKrbFTP
	 y3cT5oJkieWcv5d3W3GfYqVuQk/mbHD5NEhkB3HRRNSjAi+qcRoJHyLHlZg2PNMLeV
	 ODUbcbDEZnqMw==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen:=20Move=20NX=20handling=20to=20a=20dedicated=20place?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769182277546
Message-Id: <09d59ee2-92bb-41de-ad77-6b6c6bc44d6d@vates.tech>
To: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>
Cc: "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260115151658.3725784-1-julian.vetter@vates.tech> <69b511db-654d-46b3-aca3-3f37f30d3473@citrix.com> <c4c2c376-ab6b-4bb3-9ede-091f791c1427@vates.tech> <335949fc-059e-477c-9b2b-ddcd2f144300@citrix.com> <4a38c2ae-dc60-4fed-b30e-81a02b657e92@vates.tech> <92c02d2f-ccc5-42ce-ba0c-076fdc75e1fe@citrix.com> <a8081572-4147-4761-87e6-abaacadacdfb@suse.com>
In-Reply-To: <a8081572-4147-4761-87e6-abaacadacdfb@suse.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.cc70a094c3b4485b8f5b1f6e8f640562?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260123:md
Date: Fri, 23 Jan 2026 15:31:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_SPAM(0.00)[0.874];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7D04877D1D
X-Rspamd-Action: no action

On 1/22/26 15:11, Jan Beulich wrote:
> On 22.01.2026 14:57, Andrew Cooper wrote:
>> On 22/01/2026 1:48 pm, Julian Vetter wrote:
>>> (XEN) Early fatal page fault at e008:ffff82d0403b38e0
>>> (cr2=3D0000000001100202, ec=3D0009)
>>> (XEN) ----[ Xen-4.22-unstable  x86_64  debug=3Dy  Not tainted ]----
>>> (XEN) CPU:    0
>>> (XEN) RIP:    e008:[<ffff82d0403b38e0>] memcmp+0x20/0x46
>>> (XEN) RFLAGS: 0000000000010002   CONTEXT: hypervisor
>>> (XEN) rax: 0000000000000000   rbx: 0000000001100000   rcx: 000000000000=
0000
>>> (XEN) rdx: 0000000000000004   rsi: ffff82d0404a0d23   rdi: 000000000110=
0202
>>> (XEN) rbp: ffff82d040497d88   rsp: ffff82d040497d78   r8:  000000000000=
0016
>>> (XEN) r9:  ffff82d04061a180   r10: ffff82d04061a188   r11: 000000000000=
0010
>>> (XEN) r12: 0000000001100000   r13: 0000000000000001   r14: ffff82d0404d=
2b80
>>> (XEN) r15: ffff82d040462750   cr0: 0000000080050033   cr4: 000000000000=
00a0
>>> (XEN) cr3: 00000000b5d0e000   cr2: 0000000001100202
>>> (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 000000000000=
0000
>>> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
>>> (XEN) Xen code around <ffff82d0403b38e0> (memcmp+0x20/0x46):
>>> (XEN)  0f 1f 84 00 00 00 00 00 <0f> b6 04 0f 44 0f b6 04 0e 44 29 c0 75
>>> 13 48 83
>>> (XEN) Xen stack trace from rsp=3Dffff82d040497d78:
>>> (XEN)    ffff82d040483f79 0000000000696630 ffff82d040497db0 ffff82d0404=
83fd2
>>> (XEN)    0000000000696630 ffff82d040200000 0000000000000001 ffff82d0404=
97ef8
>>> (XEN)    ffff82d04047c4ac 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    ffff82d04062c6d8 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000000000140000 0000000000000000 00000000000=
00001
>>> (XEN)    0000000000000000 0000000000000000 ffff82d040497f08 ffff82d0404=
d2b80
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000000800000000 000000010000006e 00000000000=
00003
>>> (XEN)    00000000000002f8 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000099f30ba0 0000000099feeda7 0000000000000000 ffff82d0404=
97fff
>>> (XEN)    00000000b9cf3920 ffff82d0402043e8 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN)    0000000000000000 0000e01000000000 0000000000000000 00000000000=
00000
>>> (XEN)    00000000000000a0 0000000000000000 0000000000000000 00000000000=
00000
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d0403b38e0>] R memcmp+0x20/0x46
>>> (XEN)    [<ffff82d040483f79>] S arch/x86/bzimage.c#bzimage_check+0x2e/0=
x73
>>> (XEN)    [<ffff82d040483fd2>] F bzimage_headroom+0x14/0xa5
>>> (XEN)    [<ffff82d04047c4ac>] F __start_xen+0x908/0x2452
>>> (XEN)    [<ffff82d0402043e8>] F __high_start+0xb8/0xc0
>>> (XEN)
>>> (XEN) Pagetable walk from 0000000001100202:
>>> (XEN)  L4[0x000] =3D 00000000b5c9d063 ffffffffffffffff
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) FATAL TRAP: vec 14, #PF[0009] IN INTERRUPT CONTEXT
>>> (XEN) ****************************************
>>
>> Huh, that means we have a bug in the pagewalk rendering.=C2=A0 It should=
n't
>> give up like that.
> 
> Is it perhaps too early for mfn_valid() to return "true" for the page tab=
le
> page in question?

Yes, this is indeed the problem. Thank you Jan. The mfn_valid() doesn't 
work yet, because max_page is set afterwards in __start_xen. Here is the 
actual translation:

(XEN) Xen call trace:
(XEN)    [<ffff82d0403b3820>] R memcmp+0x20/0x46
(XEN)    [<ffff82d040483f79>] S arch/x86/bzimage.c#bzimage_check+0x2e/0x73
(XEN)    [<ffff82d040483fd2>] F bzimage_headroom+0x14/0xa5
(XEN)    [<ffff82d04047c4ac>] F __start_xen+0x908/0x2452
(XEN)    [<ffff82d0402043e8>] F __high_start+0xb8/0xc0
(XEN)
(XEN) Pagetable walk from 0000000001100202:
(XEN) Using simple walk without mfn_valid
(XEN) Early pagetable walk from 0000000001100202 (cr3=3D00000000b5d0e000):
(XEN)  L4[0x000] =3D 00000000b5c9d063
(XEN)  L3[0x000] =3D 00000000b5c99063
(XEN)  L2[0x008] =3D 80000000000001e3 (2MB)

And I also found the actual issue with the code, and why it fails in the 
first place. Somewhere before early_init_{intel,amd}, there is 
bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size), and 
the 'bootstrap_map_bm()' maps the new page with __PAGE_HYPERVISOR_RO, 
which has PAGE_NX. So, not sure how to work around this.

> 
> Jan
> 



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



