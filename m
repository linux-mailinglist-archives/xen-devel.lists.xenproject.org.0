Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aVzZN8XHIWqhNQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:45:25 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B44E642A73
	for <lists+xen-devel@lfdr.de>; Thu, 04 Jun 2026 20:45:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=rROKI7EO;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328365.1592870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVD3P-0000G0-2R; Thu, 04 Jun 2026 18:44:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328365.1592870; Thu, 04 Jun 2026 18:44:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVD3O-0000Cz-VG; Thu, 04 Jun 2026 18:44:30 +0000
Received: by outflank-mailman (input) for mailman id 1328365;
 Thu, 04 Jun 2026 18:44:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVD3M-0000Ct-Mw
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 18:44:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVD3L-002Ks0-M6
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:44:27 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c77a-5cb7-0a2a0a5109dd-0a2a4503d1a4-8
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:44:27 +0200
Received: from [52.101.53.65]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a21c789-672d-0a2a45030019-346535411f70-4
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:44:26 +0200
Received: from BL1PR13CA0250.namprd13.prod.outlook.com (2603:10b6:208:2ba::15)
 by DM4PR12MB9070.namprd12.prod.outlook.com (2603:10b6:8:bc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 4 Jun 2026
 18:44:22 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:2ba::4) by BL1PR13CA0250.outlook.office365.com
 (2603:10b6:208:2ba::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Thu, 4
 Jun 2026 18:44:22 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 18:44:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:44:21 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 13:44:21 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 13:44:20 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVvT8ekMT9ibvOBKoz8nQ+PQcphqCKgronx00tfgrTduJN0a9qvhringc9RLDF2nf3lF0jaowSDDzFPnWztD+OrYyvPjg8Wz64Q/l+Ug0vna62QcJ1+DgUfc/umabb+o+q3NPSDe1OhjrSyuks8WBqcJ+3bCAAexSZT43haEEUR9iqU+082hnkpOuN1LqbGyJEt2TbyqlM3TBlaDdjL9PUILOCFVcUVxYAu77GKSv1Fh95VheTuGiwbPK0yE6MbBajzLQiZ+Y2R7dr/wla+KGl+vwRKUpEAskj5pYbqskqqB6gcGzpjDEJ1t2JjkakU61bbX2dpE4hP5sPH3sobeuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T05BAHbXJoUUxyLi9HwBzgDewcCQqsV6oDq9ZSW7PyM=;
 b=qDeUS6/5/+eyNMfBRluLh5Zms8N1O2VoKIYCHVIBmVE5wl58elzLz2PdXUx5rp5tDkcOqKSLj2c3QLYqKNDXf2QvtewpJulQ3aRvWd2uF8gJt2S/0dXnAerHEd1t7uhH3TM4w4Njih2HBDtpG9Y/0GHfgtJ+AijzabHzDxIhoS6mERVeh2s6tNCr2HXscUrYewXxc3F76OGWfwZ0/EX82J9V++F4+AFPYILLXnNjLFd37udoUsvhwZ1sBmNfl9BeMIxN/DAisjtSpPS4m9n0DE4ZLfdzid//L7KpjI/PbIl4r0WS0tSWFgqGZ0Rg7ET3RRNfRCuiY+evrrUHN+tcRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T05BAHbXJoUUxyLi9HwBzgDewcCQqsV6oDq9ZSW7PyM=;
 b=rROKI7EOhaHElHqj9wX0hoz5GGzMV9w0pVNqDPgNaWHtMw+KiGGbPCFH+8vUx7LwkmIWB67DZOyBn0wkIzDyjFFaJOtw/8Fhmo6nelWa8+7YDPmWETRig8eJZJywD1K8wSWe78QPWSMZYNqqUBRTHj74lWbA8ok7vq8fXKUJJwo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Christopher Clark <christopher.w.clark@gmail.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Jason Andryuk <jason.andryuk@amd.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: Add myself as an Argo reviewer
Date: Thu, 4 Jun 2026 14:44:13 -0400
Message-ID: <20260604184413.788910-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|DM4PR12MB9070:EE_
X-MS-Office365-Filtering-Correlation-Id: de6bda60-f8b1-4b5c-b6b0-08dec2694afd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	oowxnLxBqGkttMllmIbmsHUuz4PnlDnF3WJqMDt1TR8SpBiHi1RSymglbj6RIxKxLA6fKiE4VG0vnv9qjVS0+W8zQae0SJK5AVLM/kC37nu3bNRHiY/zgP44FnCtdAucQkdJoZuGQ3bG69b+1S1Hvo6JkCUeCJbCgHprvk+UGbMDg0MVe3+Yp/ol8uyJe3TpsZ7f5eAiRuQ1CTZFqnJrinZ8Uz663xB65QMsbDhLsn9TAiNcwS+rcLND9nKIMUw6ua6hJEi3loLQtnAMVYCxSkbE4jZVo5jOVZue0hLD7ZuiCoqxDiH30xhhW0wCk4+alQsFT8qyzagejJtbfLBLtKFyoavrH5UbpvJXY6wiMY29Fj/aPGkhkpBzaV9nRproDKjcyBzxg+MTAb2sk7Hfjyw6OXkk/YNL1A+mbTTihBLFbxU3mWElVOMtE1F730yNaAwWAK5E2272spYGtjZ6ptO6+Q5iWq00Ph2QsJ20CG+8if/zGr3fMJjFgHmubqW6emtPNPDcrGK+1a79mxl7/M0l9+8PAIK+MpYbYuHsvykJiDH41V5W4Cvlv4A07MVqFHha1TZefDFJdgABQoq0gYhaA3c2ZfLmrr4ROw5D3/bQXrAVxK/i5E4CimNQ4LV4R3uVddRjbiz/kojC4YZqwB3ytwbcj/BCAvMoT5YYawTw1RiNBpdO2KPpxuW2WXszo/Z0gc1kCW4fMMS6XqbP2260e6uQ7vz0uJzuigc1Drc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AcazFXKaTZSTbUAWbwl9R420w4Jwhxp0sqi8pBNSXnX5DYXHbx6pckrQdTlAhfNEshsnNN92TMahbXvMwwmLiDW3dbwEkqp4iaBwIFidsG0X2ed1FVgtQznD20BGzUMC0QGo0ajHODJ8RPKmFTRziWR8R3lMtgolA6tieiCiuyQGPJ7Vmahi9GU70GRrVMSEhsgJaVL1XJerYEshR27QJR0X35CkjJn/N45LY+eRVl1GC30JI1G+52aRICNBIdIay6iNeegfMHgx4CD0tbcWU+4/YnSKlj7g8NZO5aRgmt8YcJy4ccBpLOHUQvAAyniE3LuzY4BYislY3WaCyCdHDTwKrhz7aZIcyQV/Q6Nv10b1KjLlnfo10Qqzjm598QWfvVQUkGumvL93IfVlX40P18OJFaRvSIDmUr0fBgVfkq+DhltJxMzdlEGZd5rJ057m
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 18:44:21.8250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de6bda60-f8b1-4b5c-b6b0-08dec2694afd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB9070
X-purgate-ID: tlsNG-33051d/1780598667-4279C938-876F7E6A/0/0
X-purgate-type: clean
X-purgate-size: 551
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,apertussolutions.com,amd.com,citrix.com,vates.tech,suse.com,xen.org,kernel.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email,apertussolutions.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B44E642A73

I'd like to help with reviews of Argo.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77f72e52f4..b3c33317d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -242,6 +242,7 @@ F:	xen/arch/x86/include/asm/hvm/svm/
 
 ARGO
 M:	Christopher Clark <christopher.w.clark@gmail.com>
+R:	Jason Andryuk <jason.andryuk@amd.com>
 R:	Daniel P. Smith <dpsmith@apertussolutions.com>
 S:	Maintained
 F:	xen/include/public/argo.h
-- 
2.54.0


