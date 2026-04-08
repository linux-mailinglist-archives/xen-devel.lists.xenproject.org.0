Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG0OOjqP1mmEGQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 19:24:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357BF3BF779
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 19:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276428.1561917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWdE-00062R-Tc; Wed, 08 Apr 2026 17:24:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276428.1561917; Wed, 08 Apr 2026 17:24:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAWdE-00060V-PC; Wed, 08 Apr 2026 17:24:00 +0000
Received: by outflank-mailman (input) for mailman id 1276428;
 Wed, 08 Apr 2026 17:23:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69d68f2c.v1-44c5db41318c4e0bbf8ffde4898d605a@bounce.vates.tech>)
 id 1wAWdC-0005x3-MH
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 17:23:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAWdC-006jn2-2J
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 19:23:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69d68f2c.v1-44c5db41318c4e0bbf8ffde4898d605a@bounce.vates.tech>)
 id 69d68ef4-bab6-0a2a0a5309dd-0a2a450295d8-36
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:23:58 +0200
Received: from [198.2.180.46] (helo=mail180-46.suw31.mandrillapp.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69d68f2c.v1-44c5db41318c4e0bbf8ffde4898d605a@bounce.vates.tech>)
 id 69d68f2c-42fa-0a2a45020019-c602b42e8a13-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 19:23:57 +0200
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-46.suw31.mandrillapp.com (Mailchimp) with ESMTP id
 4frVKS4FH1z8XVRg6
 for <xen-devel@lists.xenproject.org>; Wed,  8 Apr 2026 17:23:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 44c5db41318c4e0bbf8ffde4898d605a; Wed, 08 Apr 2026 17:23:56 +0000
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
	s=mte1; t=1775669036; x=1775939036;
	bh=dBdXC8CLXllaOOaQAKE2xMRBGZ2MJ8SlC6WJCLiAOQE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XZE8gBvZWloVMYtiIeoTj1MB1z6InRyjNsL2DMJxfQRMPuuCpyqz143vvpTWY91Bi
	 xAtAmo4X/sHLd1s7AlbC9Ql2fi953LVhxYBMml7mX+6r2fxmaefOBHhePvqxOVu4T5
	 sLXYq4DrG/nILAIIbYJktfJ54KrpZqfrfyVFUhUt2aO84WeXM9aUftNjUDBn2F/2Qn
	 R1z6XY5M2yqWY3vSlT2DLT3JOdH4WN4E+Zt6QTCbbkSsz5yPynpMXnksq+Ol73g6eo
	 RzMy1CE4FTfjp2hKndFY0susW3UA6BkhuBKzh2dPmOOZHguRdKJmLRDkoOkzVGQYHx
	 PriXoRjz3xZYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1775669036; x=1775929536; i=thierry.escande@vates.tech;
	bh=dBdXC8CLXllaOOaQAKE2xMRBGZ2MJ8SlC6WJCLiAOQE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DmDbwGmEh+MUtKjHP/VlSdzvF3WAEBEt5upyEfz+cf6/WHGl1NssmE0vipkbKPRa8
	 dV/aEB5yxOUCKsALo2XV9oVv7EudzTlLXupraI4y1PGenEAgKAKMSx7ayEvi7v5g9q
	 pg/L3HRoaR6t5S7xJJiZaI5qALgRiLhydi7Yt2D8kqVDrR6iICUaY60RyrfJO/6AaI
	 x94LoA4fwXRGNVFarWNgvGgQPe1pBvl1LKJzdQJNw45bKEUFi2TcMT1s3qpBHAJRlz
	 QIrSxwYh7IAsL3bZSHWbYtgMvwjwm/c1HizkJov1j2dQlMWy/vY3qnpnD/Y8yqykYn
	 0GxFEwSZ0ewxg==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=203/3]=20docs:=20provide=20description=20for=20pci=20hotplug=20option?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1775669035607
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>, "Juergen Gross" <jgross@suse.com>, "=?utf-8?Q?Daniel=20P=20.=20Berrang=C3=A9?=" <berrange@redhat.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <20260408172320.539750-4-thierry.escande@vates.tech>
In-Reply-To: <20260408172320.539750-1-thierry.escande@vates.tech>
References: <20260408172320.539750-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.44c5db41318c4e0bbf8ffde4898d605a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260408:md
Date: Wed, 08 Apr 2026 17:23:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1775669037-AF122CD1-A241C7AF/0/0
X-purgate-type: clean
X-purgate-size: 1877
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.907];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 357BF3BF779
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds description for the 'hotplug' PCI option, allowing
devices to be attached to the guest using the legacy QMP hotplug
mechanism or by passing them to the Qemu command line using '-device'.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
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


