Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABWUBnQR2WlClwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:04:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116AC3D8E4C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 17:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279252.1563782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDOy-0004Z6-Ov; Fri, 10 Apr 2026 15:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279252.1563782; Fri, 10 Apr 2026 15:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBDOy-0004XJ-KE; Fri, 10 Apr 2026 15:04:08 +0000
Received: by outflank-mailman (input) for mailman id 1279252;
 Fri, 10 Apr 2026 15:04:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d91165.v1-d6430dce3e4b4bb081ddae9aa27b1492@bounce.vates.tech>)
 id 1wBDOx-0004W7-CM
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 15:04:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBDOw-00G4Yb-Ok
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 17:04:06 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d91165.v1-d6430dce3e4b4bb081ddae9aa27b1492@bounce.vates.tech>)
 id 69d91150-bab6-0a2a0a5309dd-0a2a45099438-34
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:04:06 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d91165.v1-d6430dce3e4b4bb081ddae9aa27b1492@bounce.vates.tech>)
 id 69d91165-bf79-0a2a45090019-c602bb0143b2-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 17:04:06 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fsg791v2yzBsV34l
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 15:04:05 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 d6430dce3e4b4bb081ddae9aa27b1492; Fri, 10 Apr 2026 15:04:05 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="thierry.escande@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1775833445; x=1776103445;
	bh=jr8KFyjmD49J7UOWjFVMqFhnqGaZw9GrcOVJv0UGtBY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=LvD22wV59Xv0dkRwiBnQR+ufjb4doq6Kg3JDB8P6FkuPB2vGYbtMVTDn2ecS3gcbW
	 M/zuSowQ3RPwuSPFVRt32w1INs5JwYL12bFI+3y7MY2AYt9xMbzRzEReKK5lt1CVTm
	 oBL47ahtpuO8khvUhDi6TvzttJVTKdO0ofZwR9yj754SmosxmLjdwMtMTEwe29DMzC
	 ziQZyf8k4bJpnAiyXYKHnrOhtn/ZH9sPWR99jRxgw8UOPf6u4lgqAXEDBqqduecO0a
	 dZZQ25R7BCMW4wmkK1Kzh7z3si3G9yuWGLsn3oKzHJ4k8edKzs4QAHVdr0vnkZhZT0
	 3l6voTFDNH4JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775833445; x=1776093945; i=thierry.escande@vates.tech;
	bh=jr8KFyjmD49J7UOWjFVMqFhnqGaZw9GrcOVJv0UGtBY=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=K+IAFIljLDaenGDIZpVAj4OhrjiM1gaTMVcA2SB/msyQmbEMyFET8Zrj/yYb2SEhd
	 reKhlmU5aKBlOBjjJgWcKwvycw/8rpk1ICCoyoLDJtytg2ex0tpietLonftNdzF3Y/
	 /g0+FKSi8kPTlC/iC8NC8m535bC1LPxDJ3vv0hWncBWw2ovCX6fj2y/CnSRg5nzQ45
	 ER5mrV8L0bGowjqv8SvcZ5k33TyyhSc9/vYzFo1/X9ozVI19jezML4nAkhtW1l1sJu
	 wCRhSO5Yi3CSvc+jUgcg10SmX/YtmnePMDYFvMTmr58cN94h5TrEtZUrgEezpL/aBq
	 QdWWiegHg3iTQ==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v3=203/3]=20docs:=20provide=20description=20for=20pci=20hotplug=20option?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775833442211
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <20260410150333.1533568-4-thierry.escande@vates.tech>
In-Reply-To: <20260410150333.1533568-1-thierry.escande@vates.tech>
References: <20260410150333.1533568-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.d6430dce3e4b4bb081ddae9aa27b1492?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260410:md
Date: Fri, 10 Apr 2026 15:04:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1775833446-5714D152-747EFEF2/0/0
X-purgate-type: clean
X-purgate-size: 1912
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:thierry.escande@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.957];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 116AC3D8E4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds description for the 'hotplug' PCI option, allowing
devices to be attached to the guest using the legacy QMP hotplug
mechanism or by passing them to the Qemu command line using '-device'.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
v2: no change
v3: no change
---
 docs/man/xl-pci-configuration.5.pod | 17 +++++++++++++++++
 docs/man/xl.cfg.5.pod.in            |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/docs/man/xl-pci-configuration.5.pod b/docs/man/xl-pci-configuration.5.pod
index 0691f06ad3..8b664173cb 100644
--- a/docs/man/xl-pci-configuration.5.pod
+++ b/docs/man/xl-pci-configuration.5.pod
@@ -166,6 +166,23 @@ dom0 without confirmation.  Please use with care.
 
 =back
 
+=item B<hotplug>=I<BOOLEAN>
+
+=over 4
+
+=item Description
+
+Tells L<xl(1)> to use QMP hotplug mechanism to attach assignable device to
+the guest, or to pass it via Qemu command line using
+'B<-device xen-pci-passthrough,...>'. The default is to use the legacy QMP
+mechanism.
+
+=item Default Value
+
+1
+
+=back
+
 =item B<power_mgmt>=I<BOOLEAN>
 
 =over 4
diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 3aac0bc4fb..181aaffa0f 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1230,6 +1230,12 @@ B<(HVM only)> Changes the default value of B<power_mgmt> for all PCI
 devices passed through to this VM. See B<power_mgmt>
 above.
 
+=item B<pci_hotplug=BOOLEAN>
+
+B<(HVM only)> Changes the default value of B<hotplug> for all PCI
+devices passed through to this VM. See L<xl-pci-configuration(5)> for
+more details.
+
 =item B<gfx_passthru=BOOLEAN|"STRING">
 
 Enable graphics device PCI passthrough. This option makes an assigned
-- 
2.53.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


