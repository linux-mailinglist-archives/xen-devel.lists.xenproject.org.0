Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ttKNCnMbQmpc0QkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:14:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8926B6D6DAA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 09:14:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=d9hFz6pp;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1347273.1605143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we6CY-0005Ku-A9; Mon, 29 Jun 2026 07:14:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347273.1605143; Mon, 29 Jun 2026 07:14:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we6CY-0005Iu-77; Mon, 29 Jun 2026 07:14:42 +0000
Received: by outflank-mailman (input) for mailman id 1347273;
 Mon, 29 Jun 2026 07:14:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1we6CW-0005Io-3k
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 07:14:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we6CV-00DT7N-GJ
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 09:14:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a421b5e-bab6-0a2a0a5309dd-0a2a45059eae-6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:14:39 +0200
Received: from [52.101.53.13]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a421b5d-3cb2-0a2a45050019-3465350dd007-4
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 09:14:38 +0200
Received: from DS7P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25e::14) by
 SJ0PR12MB8089.namprd12.prod.outlook.com (2603:10b6:a03:4eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:14:33 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:8:25e:cafe::47) by DS7P221CA0031.outlook.office365.com
 (2603:10b6:8:25e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 07:14:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 07:14:32 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 02:14:32 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 02:14:30 -0500
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
 b=nW0shJwYPjx8ei0uTzylYKbKEXK61D17c993gaR60r5G5AYH5AXjaE0MVHIn2GOiM4ww1l3L/OSbPG6oaCK2G5naOH2ag5NGLwO2Tn5xcupPgCE257DkewbPcllv5bxh+UNBBvsk1SYsvQLiokaTB03ckSThiUlqh54qjzFkHd3X34w1n6QR2On5TiKVHxHK0NiUq+0viAIRnn0bi2THH6KmJ34wr0YWfXY9CP8G/wmZYvDq+6g1KBM3mv3GoKYtDy4Rk4cfnGKFKxa7YVB5dggGr5NHU+8p4i5+jH2wQCTBMfQ9h6SlfayIfJGYOdRxKqML/4iyKodQ8OIldvDoOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VirHLVq2OxKm+YfJ8qObxrOMTaALuOArnw1BSPsC+lg=;
 b=ayDn9SHtmYTE3W8CaJPqBIF5in9P0FV24PL1XgCtDW2X6yUS/AJxtvC8vjP524JLzHNbiINKAByBeek4904Ew2NAV9PvAVgqvN12Pgk6ZVmOPdA/JlGz/lEI/xeF9435l+7tS9irCAW1tEetmIWNdEsHJsxgN9FJhGM8Pz+GktniZY45HMS/NGb7eVWFpLYhd3yGloBEYIeder5EbZqQyDrTYhKVprzxAVMG/U4fDT08YGok4YhrCrSU38HgiE0P38aExl+7Zn3M3QcCP069Rh5hK9qgKtZnjfgUwiYXKaIU3mal2T17Sm+kTUgKOlvUG60xdlLIctPwn/n43gT4+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VirHLVq2OxKm+YfJ8qObxrOMTaALuOArnw1BSPsC+lg=;
 b=d9hFz6pp8np9GD6aY3lt1Jx5cnE7rk0oTEBtURMei/5Jw/0OTMgP/Zb1byLUoRMPGBlbehCaeWPYOKj7mZoQRCNI7sNpsL+LYzoJVRRzTlFCgOMQO0lVqf+yY4YvL2t+egQUuSkIKPj9hymGXGCTZGSq4keIg+dCS7xfslkjFdQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <4b6480cc-7ed8-4757-82fe-c739051c5fc6@amd.com>
Date: Mon, 29 Jun 2026 09:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/25] xen: arm: update p2m_set_allocation() prototype
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Connor
 Davis <connojdavis@gmail.com>
References: <cover.1782487661.git.oleksii.kurochko@gmail.com>
 <d476330d88137db084b11b754b4121d116b5bada.1782487661.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <d476330d88137db084b11b754b4121d116b5bada.1782487661.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SJ0PR12MB8089:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d921f0-18f4-49ca-28bc-08ded5ae118a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	6pFNkDPQPQE7R3pCoS/jLZUoWWWNHMBdRrewljNRR1KbWKGs1h6eckG34Fk7iHwJEDKnHHTTMUhgmBe+cnHWP18aWssf1OBitNBqa00OCfuUd9TmJaXwzJqMDlJnJAPu0k8iKCr7Eoc/hdGh+K1CiNRSbydGFzp4aFsdjBhUvJon20Mr31/l4SVEKHvc3OO4aCV1lpE45W8jS6GwIb4Hu2WGUPMbmuFB33irFUeLv9OyYVPeZWklylL+i+qQMpVTbOq4Zi4jUrk9BF0P6b4VdzA8hvBvuq4wMG/Htb8E59V38ChGUrDxyhXzwxwGXg0Ks+wQSvCJxd2BffQOrs3eGLvQ+QOh7p5pYi1ADSBw4+pI90U69Y34EdrHoVMJ3Pw3blDSV/UhRfWfU23WXm6/UpNyW2nUCrjb5K5yQ4IGhpW7Yt4TswFhfT+mKSSCh94aYzkWhKtpGURx3m8NMLGPMtgJkGN+2bviL8/a6myj4jG5EZbF+TI4wasNpqoVhTzRm4PVOm8lvYxuZR/ngxP9XAyPV+JdK9irWHmKdq7TegtQzScs+KlhqnaZ9HOG13DxToPDFz+bexv/GuvzXLRQPw9clBshjBrnt73ublrgE9pKgSIbYDJZKs2CbzwObuVChn3DabjqEBAuPbWG6SHCA2CrRxBt08Q4N0IJ3ilLoiteYEL18rhwuUVPkRo3IE1JOjBVl7YKXUECQajRqoFmFw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/FhycwQ3A3h+6kNmY8FuX9ThcexW1TgJ+VHZr9ttpg1B1KB1EcJRfkakRADUmMntfC5uM9bMxoH/K9rD5Tf72ZPiVhl7yvndb9ejLAIp0an7v2MYzjuaQLQJDY2WNaWxu1rxD2bPkPkLvsZRkxm2Lvpc1nTJP1YtqwoQR9H75qa/m5UMESQunn336DcGNIXXkq5yQdtaJOoirLXx7n9tmrMUj5RNuH7FfvVHQ2GTqSCY9bvhBP+VV6CiD685YM5e2sllyK3zWEb21kJP0cpmdAr1dDKHFbZMXjWAtlhzNlgjPqlTleF8wBwPbr8PhX8oJt/98Gt1rOBvyEddqDy0svgDIhofw7Z9SYItPj1in1MjW3FYzSkmTyWrxjfoR3Oq7bNhTfCy2s/kdHPfFiVpO+5RYAUVwSG426wd+7wzm4Z7fjgGtZrOHNQsnKvMjdPI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:14:32.7648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d921f0-18f4-49ca-28bc-08ded5ae118a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8089
X-purgate-ID: tlsNG-c201ff/1782717279-0D9082B8-A15F0F90/10/73395122804
X-purgate-type: spam
X-purgate-size: 1092
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:baptiste.le-duc@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[microchip.com,vates.tech,kernel.org,xen.org,arm.com,epam.com,citrix.com,suse.com,wdc.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8926B6D6DAA



On 26-Jun-26 17:46, Oleksii Kurochko wrote:
> p2m_set_allocation() uses a bool *preempted out-argument that overloads two
> meanings. When non-NULL, the value written back (true) duplicates information
> already carried by the -ERESTART return code — pure redundancy, which the
> caller-side ASSERT(preempted == (rc == -ERESTART)) only documents. Separately,
> a NULL pointer is an implicit calling convention meaning "preemption is not
> permitted in this context".
> 
> Replace the pointer with a plain bool can_preempt that explicitly controls
> whether the preemption check runs, making the NULL-to-suppress convention
> type-safe and self-documenting, and rely on the -ERESTART return code alone to
> report that preemption occurred.
> 
> Since p2m_set_allocation() is called by the common dom0less build code,
> move its declaration from the ARM-specific asm/p2m.h to xen/p2m-common.h.
> 
> Reported-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


