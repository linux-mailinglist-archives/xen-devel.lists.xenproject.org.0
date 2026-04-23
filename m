Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE4hClnh6WmTmQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 11:07:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E56E744F08E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 11:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1291811.1570621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFq1L-0004q5-4q; Thu, 23 Apr 2026 09:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1291811.1570621; Thu, 23 Apr 2026 09:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFq1L-0004oA-0u; Thu, 23 Apr 2026 09:06:51 +0000
Received: by outflank-mailman (input) for mailman id 1291811;
 Thu, 23 Apr 2026 09:06:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db99780f2000f373@swg.vates.tech>)
 id 1wFq1K-0004o4-BD
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 09:06:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFq1J-006Fvy-OM
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 11:06:49 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db99780f2000f373@swg.vates.tech>)
 id 69e9e123-e002-0a2a0a5209dd-0a2a4507d61e-18
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 11:06:49 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db99780f2000f373@swg.vates.tech>)
 id 69e9e129-229c-0a2a45070019-b9ff1c22a1a9-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 11:06:49 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19db99780f2000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 23 Apr 2026 09:06:47 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9BA8F8751B;
 Thu, 23 Apr 2026 11:06:46 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=go9+WX/P6oqYtEySQytKG8V8SBsCctPOIK9GQzP43hU=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=e7Eh3i5a5Vd2t6iXmZLTZlrnoFEmBNCL0TJaHpzZGRe9QHqKzc0nlR4Zpc8QtI2JuoVN+QQEc
 cfclA/dZXhk3+4cyk38/f2uRWuPnSB+RmpDjy5xGTM3ZSrNaCJoVqm3oFFbJidYHEpWEeH7Xj9I
 XGEYZsoEfNC4NPnJig7zhCJ6oubiiANKTXF5fs1ziclAvfwsMQpn+cfs+bsQ7oQpll8hNseTlFo
 lPwXAHQVoIop1gwBfBsYXXyvQjU6GkvoKPfLEWMiBapumv/tNLWBQaqe/GL5T6N7HHZ7OuINjYd
 FYD0tFaC7QtopeHXrRLN235BjaV8FhZOqQ0/1P4ew/tQ==
X-Zone-Loop: 2fa8092623fdedff30b0dab6bdbda7c872af21492609
x-campaign-type: default
x-transaction-id: 88636dab-3b3e-4762-bfa6-1782a7694db7
x-swg-uid: 01-421f5041-9174-4bec-b48c-7ada9737acc7
X-Mailer: Sweego
Message-ID:
 <1776935207.8631fc262581453bbf619ec5b2062170.19db99780f2000f373@vates.tech>
x-swg-bid: 1776935207.8631fc262581453bbf619ec5b2062170.19db99780f2000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 23 Apr 2026 11:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to express "externally managed" IOMMU domains for
 VFIO/IOMMUFD ?
To: "Tian, Kevin" <kevin.tian@intel.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
References: <1776873531.8631fc262581453bbf619ec5b2062170.19db5ea67ab000f373@vates.tech>
 <BN9PR11MB5276B3A829AD624A7E1AB4408C2A2@BN9PR11MB5276.namprd11.prod.outlook.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
In-Reply-To: <BN9PR11MB5276B3A829AD624A7E1AB4408C2A2@BN9PR11MB5276.namprd11.prod.outlook.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.268f.f9401862dbe5e1bb.19db9977f45.39413018467b706c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776935206726
X-purgate-ID: tlsNG-ef75cf/1776935209-AC961C48-18066BAD/0/0
X-purgate-type: clean
X-purgate-size: 3219
X-Spamd-Result: default: False [0.81 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:kevin.tian@intel.com,m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E56E744F08E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.268f.f9401862dbe5e1bb.19db9977f45.39413018467b706c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello and thanks for your response=2E

Le 23/04/2026 =C3=A0 10:05, Tian, Kevin a =C3=A9crit=C2=A0:
>> From: Teddy Astie
>> Sent: Wednesday, April 22, 2026 11:59 PM
>>
>> Hello,
>>
>> On Xen, for PV-IOMMU [1], we have IOMMU support in Dom0, which in
>> particular allows using VFIO and IOMMUFD from Dom0=2E
>>
>> However, its interactions with PCI Passthrough are unclear, and it woul=
d
>=20
> VFIO manages PCI passthrough=2E since it's already allowed which part of
> interaction is unclear?
>=20

AIUI, VFIO has no real knowledge of what is a "virtual machine" (at=20
least not in a way that would suffice for us), hence don't really PCI=20
Passthrough on its own=2E

For instance, the DMA remapping aspect of QEMU's PCI Passthrough is=20
implemented by keeping the VFIO DMA mappings in sync with "guest=20
memory", however, we can't really do that in our case as we don't have=20
full control and view of guest memory=2E

>> be preferable to let the kernel handle some of this logic=2E That would
>> for instance avoid situations where toolstack causes Xen and Linux to g=
o
>> out of sync on where devices belong=2E
>=20
> what is 'some of this logic' and what is the exact out-of-sync scenario?
>=20

In the sense of letting the kernel handle the PCI Passthrough lifecycle=2E

For now, the userland ("toolstack") is performing passthrough-related=20
operations on behalf of the kernel, i=2Ee move a device into the guest=2E=
=20
That causes a problem where the Linux IOMMU subsystem thinks the device=20
is in a specific IOMMU domain, while it's actually not=2E
That causes in particular Linux IOMMU logic to misbehave, and the device=
=20
to eventually DMA in the wrong places=2E

The idea isn't really to "fix" this specific case, but more to provide a=
=20
alternative where the kernel orchestrate PCI Passthrough instead=2E So the=
=20
logic would be now orchestrated in one place instead=2E

>>
>> On Xen, we have a dedicated hypercalls for moving a device into another
>> guest (so it no longer belongs in Dom0, at far as DMA is concerned)=2E
>>
>> But it looks like there are no way to describe that idea of "attach tha=
t
>> device to this VM" nor "the device is in a VM"; which makes that
>> impracticable=2E
>>
>> There may be things that could be done with the vIOMMU objects, but
>> there would be no "parent domain" in such case, as said earlier it
>> doesn't exist in the IOMMU subsystem=2E
>>
>> What is expected to be done instead ?
>>
>> Teddy
>>
>> [1] https://www=2Eyoutube=2Ecom/watch?v=3DpLMGRgEJ-Eg
>>
>=20
> It'd be much easier to collect comments if you can put plain words
> to explain the problem rather than expecting other folks to watch
> the video first=2E=2E=2E

The video is more to additional context, it's not really directly=20
related to this issue=2E

Teddy


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.268f.f9401862dbe5e1bb.19db9977f45.39413018467b706c=---

