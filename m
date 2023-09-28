Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD107B28D7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Sep 2023 01:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.610108.949377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0Ua-0001jd-Me; Thu, 28 Sep 2023 23:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 610108.949377; Thu, 28 Sep 2023 23:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qm0Ua-0001hQ-Jt; Thu, 28 Sep 2023 23:32:24 +0000
Received: by outflank-mailman (input) for mailman id 610108;
 Thu, 28 Sep 2023 23:32:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=33nX=FM=amdcloud.onmicrosoft.com=bounces+SRS=0floO=FM@srs-se1.protection.inumbo.net>)
 id 1qm0UZ-0001hK-FJ
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 23:32:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c71bf1-5e57-11ee-878b-cb3800f73035;
 Fri, 29 Sep 2023 01:32:22 +0200 (CEST)
Received: from BLAPR03CA0065.namprd03.prod.outlook.com (2603:10b6:208:329::10)
 by IA1PR12MB6140.namprd12.prod.outlook.com (2603:10b6:208:3e8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Thu, 28 Sep
 2023 23:32:15 +0000
Received: from BL6PEPF0001AB55.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::87) by BLAPR03CA0065.outlook.office365.com
 (2603:10b6:208:329::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25 via Frontend
 Transport; Thu, 28 Sep 2023 23:32:15 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB55.mail.protection.outlook.com (10.167.241.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Thu, 28 Sep 2023 23:32:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 18:32:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 18:32:14 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 28 Sep 2023 18:32:13 -0500
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
X-Inumbo-ID: 43c71bf1-5e57-11ee-878b-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkzikMpcedhbHF1TiOZN3IIAu+SUOaJUJpOTbA3rbv5+RAllEkB8yk6CGHY+78dhTDJG24GAnl8yTzikBSn0QKF1aD9igg+EX0ZJyA4IiH5ejovsiM5I7WK72vQOlh//9vzEcHuw6yzF/Ew7R/mc0MrccySLdudfs9fRRxFVUnMeC80DpLocYa8VqSEVNh60hMM3LUsmNfxZZfjEWPVXWTIQ4NhF7JQsSiZJWJAivkP3v4aVahYJPLTxzCZEgT/P5tLH8vg4b201RKTshp51Kl0nnEWNuN2yDoNGtouT+s7EjJn+ItN7EGKH+GkdYO5qxPJjlhxJWH0FJXbC2e5BHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2HFekxmIWiGuxZhkHilRxFo21oGlCAbLTUeYT9BvpbU=;
 b=YJaB+tbKt1K/3fKybJ9e1JN5EgBJmOJ8TCCVAdcqN4cMsjNPG6z8gwWHPiyUIFAY/W08/qGFAOpKMa63yQN0/ODOuR+nafR7NwNgfoszHjJLE9hEuPWjnQsf/UGyCOaeZgUzHwKRj8esDwWW//mmWRjq8Q9Wzc3tJ7nhNZqnR5WsDZ7cwklt0Cek3RLrPr8syu37Vx/F9z0p95DBC8Sf50OJmPuMZ0p+R6v4y8f4jgCwxhBDc+Kj/nkdMTXDM3O2gOpNh7MSFUPNxeTWe6FMVviX2yaHvh/UCAD/Ztk5p+P72GuSfw7ZooXTyJCeDORmd6iosknJpZcvaaAowV8K1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=kernel.org; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=kernel.org; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2HFekxmIWiGuxZhkHilRxFo21oGlCAbLTUeYT9BvpbU=;
 b=ZVKTRljnYXOjf8WQfNozEgFGrTbvGEwCPhh6QYYN3ces5VWxh5Y29BzhtmrYPdKiw9h/lpypDOw1rE4Z2TrRSdqlgrWbB+krfwT0Vz7M6J1DyYxWFm6P7zJqVwcXfc6VkgWxmbn2WaqKSnjM9kZ8p3sE8mOw8PEOBmbsIO0SAS3VrqkTxRThLZdIPA1rWaTtSpCO3HFcMlcCW673oA7obvz0teccu/ookZ0Xn7Doi+nVbVwRNRRMlbUj5l8Xs1KUNGlDToImTi5YJbtBrLQCjR+kxyiV8NaBDK3R5EezhWNJD2A2PyHBNF0iaurWIbt1jmQeO4YpTx/eitVP9lPE6g==
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=kernel.org; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=kernel.org;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 kernel.org discourages use of 165.204.84.17 as permitted sender)
Date: Thu, 28 Sep 2023 16:32:12 -0700
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <george.dunlap@citrix.com>, <wl@xen.org>
Subject: [PATCH] cpumask: fix integer type in cpumask_first
Message-ID: <alpine.DEB.2.22.394.2309281629360.1996340@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB55:EE_|IA1PR12MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db9a137-869a-4515-43b8-08dbc07b2606
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/saHeQVemjVhpkwFSVSyFeeavwrUIKWOQhHxoZwtPEmOSp8iryEJCWFN5nrWq643M/Vf8RhABEcox++AnE478ZlZ0EXlEgbBN9l1f3MfX9hA4XnWdisE6nIka1OPqJ3dpYBaq/sO23hl8jliSk7Kg+CRELsc7XoQy1RBCCv/6ynQVRxoGR6wfUrMdFi/d4S7JCboTPm1UJaztcl3xW4kcZM6+sYRfufwkTs3cgYW45Dh/nanTiWSHdiWOD3KLF5zZIfmOF/iM3h6abTrz+oHo/03qB2x8jUDKW6MyoqZxKqcNX9TJWDrDUkh33voI0bk2dibhH09vgoU3gYoiXh2oFxAsFRllk8rxR4fVg+JYSdYMjOble3HSYLQpU+tO6EHwzzuK1ZGn7Zrc88D3vjq5A8i57IrHVOubbx9IU7ImVcOf+X0ubSpH4rLj+f7Ab5zjLJ9VIRrvN+oxoDJr3O3fZDDG5Xwc7+iJRIDJVdXNt5KZDiMJ+haKoWakJDiih+qgRZzzR42+HdoEbuSXWr3cMz+B709Z8/xXykv3oqRO33m9ccUJetr97u8Y7zBqhciVqtpx7NlKYqM094GH6yrxzu0NDecwOC6WMdAk/rtoM8w0SlxEsseaRX2s1brZqV9AZ7U2L+tlxhDeChhKe1JNUgn7PHFgbLiXoSBsnwHdS7p5rtYVQxCxP/+Wgjg2NRabR8s0IJnvXcjGSRCbCXfYFy9/1KbDNrwkUyxO+NL06WWZt+LOTSlkhIqNUdW4ZIxIpzegD0vKctuCt+dfRAE5g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(7916004)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(82310400011)(61400799006)(48200799006)(64100799003)(451199024)(46966006)(40470700004)(47076005)(498600001)(35950700001)(40460700003)(26005)(336012)(82740400003)(40480700001)(9686003)(356005)(81166007)(86362001)(4744005)(2906002)(33716001)(8936002)(8676002)(4326008)(5660300002)(316002)(70586007)(70206006)(54906003)(6916009)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 23:32:15.4043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db9a137-869a-4515-43b8-08dbc07b2606
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB55.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6140

nr_cpu_ids is unsigned int, but find_first_bit returns unsigned long (at
least on arm). Use the larger type for min_t to avoid larger-to-smaller
type assignments. This address 141 MISRA C 10.3 violations.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---

diff --git a/xen/include/xen/cpumask.h b/xen/include/xen/cpumask.h
index 9826707909..a6ed6a28e8 100644
--- a/xen/include/xen/cpumask.h
+++ b/xen/include/xen/cpumask.h
@@ -208,7 +208,7 @@ static inline void cpumask_copy(cpumask_t *dstp, const cpumask_t *srcp)
 
 static inline int cpumask_first(const cpumask_t *srcp)
 {
-	return min_t(int, nr_cpu_ids, find_first_bit(srcp->bits, nr_cpu_ids));
+	return min_t(unsigned long, nr_cpu_ids, find_first_bit(srcp->bits, nr_cpu_ids));
 }
 
 static inline int cpumask_next(int n, const cpumask_t *srcp)

