Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANJ3EIlhcmnfjQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:42:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A19066B8E7
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 18:42:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211736.1523229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyhL-0001r3-Vd; Thu, 22 Jan 2026 17:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211736.1523229; Thu, 22 Jan 2026 17:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viyhL-0001p5-SA; Thu, 22 Jan 2026 17:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1211736;
 Thu, 22 Jan 2026 17:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viyhK-0001oz-Cb
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 17:42:22 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2661509-f7b9-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 18:42:21 +0100 (CET)
Received: from BL6PEPF00013DFB.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1f) by DS2PR12MB9710.namprd12.prod.outlook.com
 (2603:10b6:8:276::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 17:42:14 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2a01:111:f403:f901::5) by BL6PEPF00013DFB.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:42:13 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:42:13 +0000
Received: from localhost (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 11:42:10 -0600
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
X-Inumbo-ID: b2661509-f7b9-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lu+HKytEq1fBiNmPMvnlJt5JMHW36HWICqER9b1BCEysDjxBe2414u/UARVdRb5PNHXD96HLIg7UicvdgoBgQreGGKjlIjGb4pr+2a4J5MVWRsnBPsKad0fYzPHpvNs9tQ7WI2+E5HEZwri9f6VnaRL4HDKpaUen08osEMMX07/aceyJaT47PsQeFD9or9ltWZaC8c6K/GBmckWIrBXtCRXeDKke0+PQHOEywh5TECdQV8e/H6rhIiPLX3IGZisxrkAanebdKs4VyeQXQkq/+rnKjyUFAfnahGQ6Vb8hE5cDFqJpAkVLynL4Y/RHLSaxhF0Ii1PfsbEp84R/47K5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViFD675q6zSwsunpxsz4IUcTHMny005zwVFrGu6zJYc=;
 b=dU5yfxxEysltmp+ghFcvZfdKRIYy+6e6CUyuhh/KgCaf6r4VhUxR3vI/yLs5NeD2vBE+A10tvgV05V1lDH+vuVorb6xE8eQmqV9429HL/Y1MJ80hoPncPweoEszsYl+5Jci0PM8FV2I/UYsDnV28qnGnyBeGMCgGiwBNSi4mGlmhMLTYx65lZOKkZqHG3+jim2gfYOVlKeXHb/ugG8XImHC8wO8okgd4+n0uamssRQ80jVKB49Cf+8d71LWHZ2yoMvolO9zJ1GvZ2CBnrqy3If/nz3lUTquFIzpIPcJbw0SNmrVu+NS327PfPqNR/TkIfAMKv8durf80yHCyPt65Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ViFD675q6zSwsunpxsz4IUcTHMny005zwVFrGu6zJYc=;
 b=C9JxFK3PdJ4d1H6D3TMdZd/Di0f5/4lYu2PQWA8m1yM+S8aq8AkyM0gxvKpk7IumhokoJBI5tYopCwSbYOUTNIXb0G2OOIY2HSCb4jVNTm9KIyCqDEBI3eCSfXLVhbU4gxoKU/3dTHjoNf65r5rPIfbj0AkJ9V3dD5vnJ97aMnM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 22 Jan 2026 18:42:09 +0100
Message-ID: <DFVAXLGSFPWC.3UXT3BXSBVFRZ@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	=?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: Re: [PATCH 0/4] x86: Drop cross-vendor support
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.20.1
References: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
 <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com>
In-Reply-To: <3421e525-fb04-4306-9320-4fa359c2ee28@citrix.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|DS2PR12MB9710:EE_
X-MS-Office365-Filtering-Correlation-Id: 419c1326-772e-4df4-27b5-08de59dd93e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3JDYjlNb05QLythZ3hYRzNtcUJINXNBTVJJQ1p0dCtQQ3pwdjFRTzZZTDZh?=
 =?utf-8?B?NHlvUlptOGJ2c0twQ1gwTksrQXYwY1JNNTgxektXL0tWWTFJRm9FYVBnOUVo?=
 =?utf-8?B?Z0pIMHREOGZhWWJYRXJCMGl0ZUF1OW5kQ1pxQ0tUMzhPd09ZeVBUR0cvdGlC?=
 =?utf-8?B?WFkxTWp2amU3T1AvWU1pak5vNGJXLzdyZEIydlg2SkpWbGpCZUk0U2Uzem5S?=
 =?utf-8?B?cXVkYjdBZzZqYTdLVHJaM2hDNzM2L1FTcldMcFk1MjlSRHpiK1ljcStaKzYw?=
 =?utf-8?B?ZmdkeGxIN1QxTW9zNEs4K1VMR1NEcU9Qa2p3cE54VXpPcXd6OW9NNmpQcEN4?=
 =?utf-8?B?K1ljNTNnd0Q2TzZObWNRbElyL2pjdlZwd3R4eGtZcVhrS3pIM0tkcHF2VDJy?=
 =?utf-8?B?cFlrTm5DaEZTaVJGK05teExXR3pGeHRsZEY5ZUF5eHh6eHl4MFNDZllBT2ts?=
 =?utf-8?B?Y3VZSTByaHF5OFBoWkgzbFA5U2pFaUE5dUJMY0g4Kyt5dDA2MHNaSXBnc2hK?=
 =?utf-8?B?eFpQMHFrQW1HdE51V1I2eFI2Uk5EYzNYMkFXRDdYV0h4NXZuQXhha2FkRnJE?=
 =?utf-8?B?eUNVdEJtSE1icGZ6T3MxZjBmNzhQb1FmQ3J0VzNKV2Z4ZmhmL1dsMUxyVVVQ?=
 =?utf-8?B?U0p0Y1BRajlZODRXR0dTUmlZT0lBSzk2RVJkN3FIRDU3TDVzOEhVODhwd21r?=
 =?utf-8?B?T0NmYmFMS1pWUFk1SGYyT3RYTjl1clVzT3VKbEpXNzBRSWpVTG91N3A0Q3Na?=
 =?utf-8?B?S0FtVHZZUTZsYXJPMGJLT2U3Y3V4eW4waDlBQVJ2bEhJUS92WVZLVmN6a0Rq?=
 =?utf-8?B?K2FCaXVPZTZWSC9DRXJKTUJmaXF4aVpOa3NscElHTzk2cDZHWDhCM3FVRW4w?=
 =?utf-8?B?MHB1UUFlZ2dSWDV0RkdoMzhNRUlPY0VheUFlYklDUVlldjEyTm1CenRjOUQv?=
 =?utf-8?B?a2FrSGw4R3ZRT0EwaEw5cXRiVXNOdVY5S3RDWW5QM1A4N25ab3VrS3hjenA4?=
 =?utf-8?B?aEY5M3k4QkR1eVhSbW1ESXNkYzV4MitDTEQyTEdSU3lKemlYQUJPRGkyVGRE?=
 =?utf-8?B?dlR3alNYaWIzNkQ3Qm01bmNsdGl3ZGEvTWZsSkE4YnFOd3B1RUVwWjhYSUFz?=
 =?utf-8?B?NDd6bHJiUDQxVGhPcXNxbEk0aUl6VDNTWmZCblA0WHVaOUpKYnZjVDBSdFVj?=
 =?utf-8?B?M0VDWDNTTkZYMGVadnQya2FocE83dlR6V3Z3TlFjR1l3T1ozZnE0bUQ1dU9U?=
 =?utf-8?B?ZG92TWxoYnpYbnNHTFFqc3ozYVczZ1FBdVRyaEFqL3F5ZnprZDMrMWsvaW55?=
 =?utf-8?B?Y1k4cllGVnA3TGFOU3BSaVVCQ1JSdkR6YkFuQ1d5Tzh3YlhLdHc2SlhhR0lW?=
 =?utf-8?B?SmFvSnVMWS9vTUxpTWVRaVlCTGloaVBaenl3bThSdmprbjRMVFVPdDN5Z0E3?=
 =?utf-8?B?cXBLbEk3OWlYYTZ0am4zRXhLWlpodExJbDZrc3pOaVlYUXdvSzFvTkhmdUV1?=
 =?utf-8?B?UFVnUng5LyszNEp4akluREJJR2hBOXpGcTlvRGEzSEo4RnVKbDBEc2M4M0k3?=
 =?utf-8?B?UVFTb1AxL21VYURPT3FCcjhZa3B5amZRM1BTZHdWTTVmNm9jdlF0YjRGVFVu?=
 =?utf-8?B?UGhDMGpjZSsrbXFGY0ZxZ0lNUGk5a0k3MWc5dHNPUzJsemsvRkcyWjEvZEs4?=
 =?utf-8?B?Y1ZicVd3WHZyWDd4YTduZ1Z3ME5jL1ZoRXF0RGY3cXhpZGtXcVl3OW5VTldz?=
 =?utf-8?B?WWFaWTFONlBkZXRaSmY2emhTREEyUVlTY2k2ekVjMHFQNVNXYzZycGFhRmRv?=
 =?utf-8?B?NDNmZEV3TjkvdSthUnk4Z01wT2RIMS9YT2RJSjIvL2lvL2NYd2hsZStuSVJr?=
 =?utf-8?B?VFNEL0NpUmU4VzAwVDJmYlp0UUJKYldtSUpTbzhveis5RkZTcWFEclBXak5z?=
 =?utf-8?B?TFBYbTVudk13dlhqTzg4Z2g4enBIdURsN1czWjZrUkFDWW9BNTh3RzlJeHAr?=
 =?utf-8?B?TXBqNk1HN256eFhwRFAreTd2TUNzSU5FaUVuZjFTNCtiUDF3cG4rZC9CQm5m?=
 =?utf-8?B?RUFEcDh1L21pM1VnRFpMbEs0dVF5Rk1QT0FqVGErQk9PR3U0M3BuRFFLUm0z?=
 =?utf-8?B?Zys4OXJCbXdyQUgxZUI2Zjhad2Q3WnNYREowZU4xUkRWSlFaTW1PV0tGVmJq?=
 =?utf-8?B?b1IwQmorZVgzS2V0VnFTd2xHQ2o3L0NsK0lyQk9CcEZvV2tXMkdwVlBsMzNF?=
 =?utf-8?B?SzR2cXlJVlYrbXVIMDA5MkJidEZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:42:13.6325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 419c1326-772e-4df4-27b5-08de59dd93e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9710
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,xenproject.org,suse.com,citrix.com,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.969];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A19066B8E7
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 6:10 PM CET, Andrew Cooper wrote:
> On 22/01/2026 4:49 pm, Alejandro Vallejo wrote:
>> Open question unrelated to the series: Does it make sense to conditional=
ise the
>> MSR handlers for non intercepted MSRs on HVM_FEP?
>
> I'm not quite sure what you're asking here.
>
> ~Andrew

The handlers for LSTAR and the like are dead code with !CONFIG_HVM_FEP as f=
ar
as I can tell. The question I'm asking is whether there is another code pat=
h
that might invoke MSR handlers for non-intercepted MSRs. I can't see it, bu=
t
I'm not sure.

If there isn't I'm considering (conditionally) getting rid of them.

Cheers,
Alejandro

