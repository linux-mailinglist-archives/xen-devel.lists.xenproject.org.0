Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZK+EOYJIOWqIpwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:36:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1166B05C7
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 16:36:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="m2bfQl/A";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1343820.1603053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbflQ-0004Wc-Uk; Mon, 22 Jun 2026 14:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343820.1603053; Mon, 22 Jun 2026 14:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbflQ-0004Tf-RP; Mon, 22 Jun 2026 14:36:40 +0000
Received: by outflank-mailman (input) for mailman id 1343820;
 Mon, 22 Jun 2026 14:36:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wbflO-0004Su-Vh
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 14:36:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbflO-00AVbm-93
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 16:36:38 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a394875-bab6-0a2a0a5309dd-0a2a4505838c-0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:36:37 +0200
Received: from [40.107.209.31]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a394871-ef3d-0a2a45050019-286bd11f50b2-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 16:36:35 +0200
Received: from SJ0PR05CA0089.namprd05.prod.outlook.com (2603:10b6:a03:332::34)
 by IA1PR12MB6652.namprd12.prod.outlook.com (2603:10b6:208:38a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 14:36:29 +0000
Received: from MWH0EPF000C6194.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::92) by SJ0PR05CA0089.outlook.office365.com
 (2603:10b6:a03:332::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.10 via Frontend Transport; Mon,
 22 Jun 2026 14:36:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6194.mail.protection.outlook.com (10.167.249.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Mon, 22 Jun 2026 14:36:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 09:36:28 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 22 Jun
 2026 07:36:28 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 22 Jun 2026 09:36:25 -0500
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
 b=j1tfAnxNOqKqNju0oPAyfwSbHPoTnSv5ttoJDHAH9lxss0Nu0O+FyzqIkkgsDDNsCDnUxF518fMCnGK04VfFvhAhmWRBCN8JBZWYI7m1SrDS3th/GNr7gUrwYWV0L8qxupzXaxEoB35vAkPlM70CC9l4lggtSm0rF2esjaoAbOlrrx1+NoAh3cdM739WyCvV/mmFDjAmRXDs6MgIKJcksye5nVE8OhWu6a0KFmR8TcthDF95emDbCVUV4UoKSMFErIDEiTgUmGmoQtFKRWl86aYBWWsjCC5N4Kfqu/XMA9n9il39W2q15tMnwJzdaCtmzxKXe1ZKkSOBhwEa3SlZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdJZIII6fJgENStRQs/xSAj0VFnYk2ZtwwuWF5M3jPI=;
 b=BCHYdHsb3JWInNtp5jTreVIOXA9IQZKSQEUNXTbEdm7vLs4jq802CpNXSEmFjUYVRb1rNjXAWOWf7fRndfvoOcM2t/KNe47CNal+Dv8J7Kuc8nZ4tnZN6G/p+U5g3XP5bhsoHzOLI2/LeUzB4Odd8krxXLFJTtPVUfM2783rb22KBlHulvP39A4kIGhNvcMupQNsGnGX9s7HfPwG2aKInou3ldmsqe6b3jXA9vAQVQlehpiaaLUmt9pFWMVzCB3G6MSZsl+hOiUrxM6o5L3bDb2qPimlnmSGrYh9hcTl8CS/3Ufj6dHd0kx0cKioXXKqsWzMPixAyuGugXlDRv4zcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdJZIII6fJgENStRQs/xSAj0VFnYk2ZtwwuWF5M3jPI=;
 b=m2bfQl/AVsu9oh/VcLqmElVFUp90239smDVv9C9opT4jQBqa6kSy2R/qlAMQ3pPLBbm5nYSnSBDrm26sFN1h/Li/lG7TJrAuoQFLbMRlsZmw/QHA5RL2uSvNN60OKbEahhyGIGD05RXsMROIRFP1gN5OdcmwdRoFyRo318XNqJc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <07f3b709-bd49-4a86-b22b-03bcb4da28c2@amd.com>
Date: Mon, 22 Jun 2026 16:36:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] MAINTAINERS: update Jens Wiklander's email address
To: Jens Wiklander <jens.wiklander@linaro.org>,
	<xen-devel@lists.xenproject.org>
CC: <patches@linaro.org>, Jens Wiklander <jenswi@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20260622141103.2799695-1-jens.wiklander@linaro.org>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260622141103.2799695-1-jens.wiklander@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6194:EE_|IA1PR12MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: faa203db-bb40-449f-f968-08ded06ba5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|7416014|376014|82310400026|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	mG+43091mY9mrYkDFPhgefp+lTNSeIJ+8MmRQzrTuVHdVjTUmOOnqp+mVwjJtmgJxaKPSvGss217cu+CofPd7jcuNZFee3OF18fbBuGMosWXrC2+2pIcQQpKnr5YWcAZ6e4WZ0V/Gp/K/oy1ZatKpYv+wttgnCa1yYctrmiqH2LJXtrK94bJQY2shUUJK2X6UBvi18lD9Ic+bsKY57v3IBkS0gdTGyq91iMiWH9rTTqRbVvZH8EAX5A3w5Zt+atTIkIgtQ3U5bnblIqNnk9tqVVNS01LqXKFx9EIeCgX5n2TUbw2xNlRu3fj6k1ARQbkpWnAOVkXJCitCTk89ez0I4Oo9nDNx7jFzRb/kInnP2XIPC3VqpvRErQWpqKYnFW4pNbFt2P2VJVs6w7c8HKa8VwSyGr26r8z6dT4ZoVfLSZiIdyUr4Xnc3c9nNil5sx4U1qKIqRvjaWcDfR9Oi9edxkPZhRH3EGyRfDImj+yDSOCFZyl9wrBc6J0kc5umZ+wOIkVj38bsEJbhceKqvfirof0qjMqoaggMbrbG/zxaePtsNrpzqXWCZZGiVIORdmCt1V00V0u/+M8LEpz1T9dRzSBEGCopNE34joSxwB+Lb2uzN2mWlYlzt/fDNjqAYQT1T/AqmD3v28llm4tHBcVI2d+V/hsMRJXGxni4DJHsMVxMjSZa+Qpu11+5akRHo+KkuAm+2hPbljAlslq1oUigA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(7416014)(376014)(82310400026)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bpdh3Y6FeI25MJbUvZ/mn/7V1uyF80wlogxO+zYyxHNH6tUeLDCUJGzx2nP501vlquL4d+yxXizVaHJct4mmhq9lR2wHfKdWaPcJXmwCXH0q5MAV3I+ovue06TikePI5CwwwtAPNk7k7udF1osA06asDAK2kXucYvWXg4+dCLov8xDBXMfpxT6i1K/EinmEVk+VFhG8OcPJs4S7DDmPQ0y2Mw54Cf8R1augcDLE4hpe+xuAhShg8OHW5pr/pazr+TwrAm7NTFnRwM5sbdAI/0rFtWRVwYtmhYLuppEoQB3cdHnx9nbGAo3qiRP+xkqwNE8jYNnoOOxrTiivc8Tt88VwLzBOLWPKD/th+dG+RZsxcyYtE+vfnHYmfVsoVurIqUnef5SUWax2x+t7i2Wtd0B1JYncFKEeH1FcXdnp4ayMHBNaugaUejPakBJGXlv9f
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 14:36:29.1332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: faa203db-bb40-449f-f968-08ded06ba5a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6194.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6652
X-purgate-ID: tlsNG-c201ff/1782138997-9D9C5127-46042E62/0/0
X-purgate-type: clean
X-purgate-size: 269
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jens.wiklander@linaro.org,m:xen-devel@lists.xenproject.org,m:patches@linaro.org,m:jenswi@kernel.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F1166B05C7



On 22-Jun-26 16:10, Jens Wiklander wrote:
> From: Jens Wiklander <jenswi@kernel.org>
> 
> Update Jens Wiklander's email address to @kernel.org.
> 
> Signed-off-by: Jens Wiklander <jenswi@kernel.org>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


