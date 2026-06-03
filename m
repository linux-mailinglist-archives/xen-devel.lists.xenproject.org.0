Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1gVnGoHMH2odqAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:41:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11915634B8B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:41:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=eyJGhoWV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=redhat.com
Received: from list by lists.xenproject.org with outflank-mailman.1325744.1591069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfHT-0000qy-Ax; Wed, 03 Jun 2026 06:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325744.1591069; Wed, 03 Jun 2026 06:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUfHT-0000pD-87; Wed, 03 Jun 2026 06:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1325744;
 Wed, 03 Jun 2026 06:40:46 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <armbru@redhat.com>) id 1wUfHS-0000p7-83
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:40:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUfHR-005O38-Ab
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:40:45 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <armbru@redhat.com>)
 id 6a1fcc65-2eae-0a2a0a5409dd-0a2a450abf30-36
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:40:44 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <armbru@redhat.com>)
 id 6a1fcc6b-56b3-0a2a450a0019-aa0a857c7889-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:40:44 +0200
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-RLawYz73OIqh5JmmI2ZwEw-1; Wed,
 03 Jun 2026 02:40:39 -0400
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8FAAD180049F; Wed,  3 Jun 2026 06:40:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.44.22.2])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2345A30001A7; Wed,  3 Jun 2026 06:40:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5652F21E6A25; Wed, 03 Jun 2026 08:40:32 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780468843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f/1NMFbCCTiIHLk8JtsDwjURe28Qph3Ze1ot3C5bz1c=;
	b=eyJGhoWVqtBeP3i93l905osVn0019WCmCagI+qjUgRAtSm3JLnuQ68snocDRQ9uZ0Qwatk
	uoPnTeM4KMt7cSFE9lEpOLOdu5BktnXXqwDI85CF0/cCAkg5CI0NWgDLVBl8n2tzBp90Kb
	edrOX+I5Y0Rc5N/cuHalw+YR1ckuywI=
X-MC-Unique: RLawYz73OIqh5JmmI2ZwEw-1
X-Mimecast-MFC-AGG-ID: RLawYz73OIqh5JmmI2ZwEw_1780468838
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: philmd@mailo.com,
	pierrick.bouvier@oss.qualcomm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 09/38] MAINTAINERS: Drop bad F: in "X86 Xen CPUs"
Date: Wed,  3 Jun 2026 08:40:03 +0200
Message-ID: <20260603064032.3733394-10-armbru@redhat.com>
In-Reply-To: <20260603064032.3733394-1-armbru@redhat.com>
References: <20260603064032.3733394-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: AOQJjsdoTf6aKJM4lLKAw46Kn0BTEtVaPDC_qPiwFYI_1780468838
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-purgate-ID: tlsNG-4011c0/1780468844-70F618B7-F64AB698/0/0
X-purgate-type: clean
X-purgate-size: 890
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:philmd@mailo.com,m:pierrick.bouvier@oss.qualcomm.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:xen-devel@lists.xenproject.org,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[armbru@redhat.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[mailo.com,oss.qualcomm.com,kernel.org,xenproject.org,gmail.com,lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[armbru@redhat.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenproject.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11915634B8B

include/hw/block/dataplane/xen* does not exist.
hw/block/dataplane/xen* does, and is covered.  Drop the bad line.

Fixes: fcab2b464e (xen: add header and build dataplane/xen-block.c, 2019-01-08)
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>
Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
Cc: xen-devel@lists.xenproject.org
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Anthony PERARD <anthony@xenproject.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 269c26196d..3a99c84839 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -634,7 +634,6 @@ F: hw/xen/
 F: hw/xenpv/
 F: hw/i386/xen/
 F: hw/pci-host/xen_igd_pt.c
-F: include/hw/block/dataplane/xen*
 F: include/hw/xen/
 F: include/system/xen.h
 F: include/system/xen-mapcache.h
-- 
2.54.0


