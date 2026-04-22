Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPOYL0vw6GkdRwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:59:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275D448301
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 17:59:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290844.1570310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZyd-00052F-3S; Wed, 22 Apr 2026 15:58:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290844.1570310; Wed, 22 Apr 2026 15:58:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFZyd-00050o-0C; Wed, 22 Apr 2026 15:58:59 +0000
Received: by outflank-mailman (input) for mailman id 1290844;
 Wed, 22 Apr 2026 15:58:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db5ea67ab000f373@swg.vates.tech>)
 id 1wFZyb-00050i-HX
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:58:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFZya-003sCe-Tw
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 17:58:56 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db5ea67ab000f373@swg.vates.tech>)
 id 69e8f032-e002-0a2a0a5209dd-0a2a450ba842-32
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:58:56 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19db5ea67ab000f373@swg.vates.tech>)
 id 69e8f040-212f-0a2a450b0019-b9ff1c228f2b-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 17:58:56 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19db5ea67ab000f373.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 22 Apr 2026 15:58:51 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 934948748B;
 Wed, 22 Apr 2026 17:58:50 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=gyZFUs5aFRRUxyucIstVItWo3Q2H3S9RHfFu8k4dP2g=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=ojLOiJARh00Z+JmQSKC4OHB45z0LDa03MGx/Qzet8fFqbv086FAtWlN4Hve8YmIeNMi0ae6Gf
 x9Mo0v5wLHyuZBDj/GaPrMUMiQUjH5W1r3fN/Zgwr1cS/vMGSgF9EwUrdfW7U8bkXROBLj2ixiz
 /Y+j82AbNVRXXR9AX+2uxQtnlQ4k0UtOz5/bllvmKG2oczjgoLXsyWVh2bkdjW+xbvUrcpS4VcM
 RxlO5hC4nqmRKCinFm4QYurvRaMmdLPqqHAZ75x3pO+yIKPcG0eLCw7lyAtzQaxemAb4lvUMA+k
 j2dsUwA5/pim8ErzrP6tjf9WMPuqAS0Z/cr9IW7/Holw==
X-Zone-Loop: b559f5993fc66329da02f088278f6a4db2b9978dc6ca
x-campaign-type: default
x-transaction-id: 91154bd0-e709-4e30-a690-1f1a071be8f3
x-swg-uid: 01-7b9ca31e-60c7-4000-9de9-77f816e05395
X-Mailer: Sweego
Message-ID:
 <1776873531.8631fc262581453bbf619ec5b2062170.19db5ea67ab000f373@vates.tech>
x-swg-bid: 1776873531.8631fc262581453bbf619ec5b2062170.19db5ea67ab000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 22 Apr 2026 17:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: iommu@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
From: Teddy Astie <teddy.astie@vates.tech>
Subject: How to express "externally managed" IOMMU domains for VFIO/IOMMUFD ?
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.25ec.d120997fac5ce7ce.19db5ea652d.e879bb6dc3eb451b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776873530670
X-purgate-ID: tlsNG-42698a/1776873536-05D6FF3B-608975BF/0/0
X-purgate-type: clean
X-purgate-size: 1364
X-Spamd-Result: default: False [0.81 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:iommu@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7275D448301
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

---=Part.25ec.d120997fac5ce7ce.19db5ea652d.e879bb6dc3eb451b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Xen, for PV-IOMMU [1], we have IOMMU support in Dom0, which in=20
particular allows using VFIO and IOMMUFD from Dom0=2E

However, its interactions with PCI Passthrough are unclear, and it would=
=20
be preferable to let the kernel handle some of this logic=2E That would=20
for instance avoid situations where toolstack causes Xen and Linux to go=
=20
out of sync on where devices belong=2E

On Xen, we have a dedicated hypercalls for moving a device into another=20
guest (so it no longer belongs in Dom0, at far as DMA is concerned)=2E

But it looks like there are no way to describe that idea of "attach that=
=20
device to this VM" nor "the device is in a VM"; which makes that=20
impracticable=2E

There may be things that could be done with the vIOMMU objects, but=20
there would be no "parent domain" in such case, as said earlier it=20
doesn't exist in the IOMMU subsystem=2E

What is expected to be done instead ?

Teddy

[1] https://www=2Eyoutube=2Ecom/watch?v=3DpLMGRgEJ-Eg


-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.25ec.d120997fac5ce7ce.19db5ea652d.e879bb6dc3eb451b=---

