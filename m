Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEYLOLnXhGlo5gMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:47:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80624F6277
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 18:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222350.1530327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo38p-00005Z-OE; Thu, 05 Feb 2026 17:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222350.1530327; Thu, 05 Feb 2026 17:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo38p-0008Vi-Kh; Thu, 05 Feb 2026 17:27:43 +0000
Received: by outflank-mailman (input) for mailman id 1222350;
 Thu, 05 Feb 2026 17:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=++8R=AJ=bounce.vates.tech=bounce-md_30504962.6984d306.v1-7cfb7669aa814b809b31d35be6213a93@srs-se1.protection.inumbo.net>)
 id 1vo38o-0008VM-1s
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 17:27:42 +0000
Received: from mail177-22.suw61.mandrillapp.com
 (mail177-22.suw61.mandrillapp.com [198.2.177.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5dd2567-02b7-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Feb 2026 18:27:36 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-22.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4f6PLG3fNRzGlsp6v
 for <xen-devel@lists.xenproject.org>; Thu,  5 Feb 2026 17:27:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7cfb7669aa814b809b31d35be6213a93; Thu, 05 Feb 2026 17:27:34 +0000
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
X-Inumbo-ID: f5dd2567-02b7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1770312454; x=1770582454;
	bh=5gJfGwa8o6GZ+PiMQ55z7D9ACCtS3gqDjblVe+fCVBA=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=MWMaFSb73wDOzC8isjdwjRcp/3W+PQduOiRpo9/tw2aSf48+Qi/KFJRy96F9jQvQK
	 TyoQN/j+FdRzRsikN6SzHuoWzmp7ac6tQtIpTdu8GgJ0CIodeV5FDbE0NYWHFUag18
	 u0rAnGIMLpRSaGC435Otm/tEUYc27e89Rpsbo3WZNBFON5W3xqkqGH0FhTgqadPStG
	 nqDy8ezobHMexNBV7D1EPfKwUoHW+PwZN1zpfq6OinJAXLMPfwQC2T9lBRCjeYBAuG
	 e4NSdPbfk+wAzqBTf64NDfXaZU3n/u5aF+bzb6dSTULni23OxxOnmsEeBh2KoXNCTx
	 xbphBVYIFhC0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1770312454; x=1770572954; i=teddy.astie@vates.tech;
	bh=5gJfGwa8o6GZ+PiMQ55z7D9ACCtS3gqDjblVe+fCVBA=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=l21pjyEdHcYVojj4hazmeGQyXw7PUJkg75zstX2vKZXndO61UMEJ6CpoQOVzucFzV
	 waD8t55flxQfNU+ZiNy9HAxy3sfyXN6jZOmurNzi0qaofFdpI/Qjp0Vd5UxgIL5cxx
	 3uiwCt6OW4O4Mv/axffFgO9P42SYw1GbuT7buUMiMSzAIyD8AL61UpJ5flmBEeD5B9
	 8S9n2gTsp98dnp8EK1yEnYlFanfktw9R91ocS/ZSdCrYz4xFRjxZDKa2axkERmzGoS
	 NADhziIDj2AlR+37NtDiPu0KU0ir9qVrgxckF6x3EY2OcmK31p3ePa9RCnI12sYRly
	 fBo7B9dci9HtQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20efi:=20Enable=20EFI=5FSET=5FVIRTUAL=5FADDRESS=5FMAP=20by=20default?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1770312452868
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <82dfede43d81c2072f90b01d12fe5ef18c80fc24.1770312308.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7cfb7669aa814b809b31d35be6213a93?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260205:md
Date: Thu, 05 Feb 2026 17:27:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,apertussolutions.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.036];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 80624F6277
X-Rspamd-Action: no action

Many machines fail to boot if this option is disabled, as
there are no known drawback toggling this option, enable it
by default.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

 xen/common/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d7e79e752a..49dea2412d 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -363,13 +363,14 @@ config KEXEC
 
 config EFI_SET_VIRTUAL_ADDRESS_MAP
     bool "EFI: call SetVirtualAddressMap()" if EXPERT
+    default y
     help
       Call EFI SetVirtualAddressMap() runtime service to setup memory map =
for
       further runtime services. According to UEFI spec, it isn't strictly
       necessary, but many UEFI implementations misbehave when this call is
       missing.
 
-      If unsure, say N.
+      If unsure, say Y.
 
 config XSM
 =09bool "Xen Security Modules support"
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



