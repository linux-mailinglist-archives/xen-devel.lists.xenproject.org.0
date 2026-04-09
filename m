Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBUJHxLS12mrTAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 18:21:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140953CD996
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 18:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277972.1563047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAs82-0006vK-V2; Thu, 09 Apr 2026 16:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277972.1563047; Thu, 09 Apr 2026 16:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAs82-0006ry-S0; Thu, 09 Apr 2026 16:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1277972;
 Thu, 09 Apr 2026 16:21:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d7d1f7.v1-739e440ecbe14cfe85700eac099145f7@bounce.vates.tech>)
 id 1wAs81-0006qc-PY
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 16:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAs81-00AE9I-5G
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 18:21:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d7d1f7.v1-739e440ecbe14cfe85700eac099145f7@bounce.vates.tech>)
 id 69d7d1e5-5cb7-0a2a0a5109dd-0a2a450ae60c-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 18:21:13 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d7d1f7.v1-739e440ecbe14cfe85700eac099145f7@bounce.vates.tech>)
 id 69d7d1f7-ee98-0a2a450a0019-c602bb01ba26-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 18:21:12 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fs4tb59lKzBsTvmW
 for <xen-devel@lists.xenproject.org>; Thu,  9 Apr 2026 16:21:11 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 739e440ecbe14cfe85700eac099145f7; Thu, 09 Apr 2026 16:21:11 +0000
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
	s=mte1; t=1775751671; x=1776021671;
	bh=aEGweMh3nn2we8a8H+DP/OH/jK1OTcDX5edzheCVTKg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=uviAdraaIAKgWK8MUDWijOltDBdI1GTWJU2WJf2RYEcBk9sbLaJUki4KiXpLBTAy8
	 gii4EYYFY7lYGOQDkbb8QKel0ffAssf2VN/YBD5drts0cHD4UwsrUzwYeVe5J6e8en
	 Yd//ppt5++PUn4M8R5zWqfxR8W0dvJ6NlzgljxNdEnn+oZo91sp4MjkbPpOgzlsWXq
	 CnMV01CQpj3W2SCk2TzXf11kliUbfdr5FQBed7A6h6MGgacG0v8JJTM6aMSuGlz21S
	 XvUT1sRuFgg+KxEQoksvFqUpRZRjm5yTo4kVFvXjdOlXSuqOR0/624Y50A1Jg4PJhs
	 +CkGytnLNCPaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775751671; x=1776012171; i=thierry.escande@vates.tech;
	bh=aEGweMh3nn2we8a8H+DP/OH/jK1OTcDX5edzheCVTKg=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Uj1FqENKAg7IoF81l92a47OI80P0/OeB7Yg+6CMgJEs4O+ZHR+j8wDXA3PD1AWiDU
	 thRbtqACKW6mceDiXYfeP26QdQ13IMbGfyx5vIuNB+L7Donnookv4OBJb8oB+5zCUx
	 8E6vLX2xPfFoe/sxgldszo3bslDB4owDSGU7Z9HM1B9tEuE4gbuPZIHLMVi+c8wsdi
	 848XybE4XI9ilb8y3DGcCNFzYAzRn/pZgGmtS/72LONZZ1n6rPOcQDSIZpcdB1zlO9
	 86x/fss8OIjtxQrwdfvj9QO/pCofltGMPGZFtNnwqy4LDIav5tNxju3nz7mv+qklvF
	 kF3z2YsJT1n7A==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v2=203/3]=20docs:=20provide=20description=20for=20pci=20hotplug=20option?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775751671088
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <20260409162000.1102680-4-thierry.escande@vates.tech>
In-Reply-To: <20260409162000.1102680-1-thierry.escande@vates.tech>
References: <20260409162000.1102680-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.739e440ecbe14cfe85700eac099145f7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260409:md
Date: Thu, 09 Apr 2026 16:21:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1775751673-0DB550B1-350197DB/0/0
X-purgate-type: clean
X-purgate-size: 1897
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
	FORGED_SENDER(0.00)[thierry.escande@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 140953CD996
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds description for the 'hotplug' PCI option, allowing
devices to be attached to the guest using the legacy QMP hotplug
mechanism or by passing them to the Qemu command line using '-device'.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
v2: no change
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


