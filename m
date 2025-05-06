Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DEBAABDA1
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:46:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976857.1363982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDwf-0002P2-9D; Tue, 06 May 2025 08:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976857.1363982; Tue, 06 May 2025 08:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDwf-0002KN-42; Tue, 06 May 2025 08:46:33 +0000
Received: by outflank-mailman (input) for mailman id 976857;
 Tue, 06 May 2025 08:46:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+p1E=XW=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uCDwd-0002Hf-SQ
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:46:31 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 967a3719-2a56-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 10:46:23 +0200 (CEST)
Received: from DUZPR01CA0272.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::12) by AM8PR08MB5697.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d7::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Tue, 6 May
 2025 08:46:21 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::7) by DUZPR01CA0272.outlook.office365.com
 (2603:10a6:10:4b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 08:46:24 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18 via
 Frontend Transport; Tue, 6 May 2025 08:46:20 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 DB9PR08MB9684.eurprd08.prod.outlook.com (2603:10a6:10:460::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.21; Tue, 6 May 2025 08:45:48 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 08:45:48 +0000
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
X-Inumbo-ID: 967a3719-2a56-11f0-9eb4-5ba50f476ded
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w+3jHi2Lhe4DLm8uI/cJuOJLsQQLwMe/BhUvgdOz6l1XfSOWCJaN2jaXue1p8jPGCrshcQbGXY2HiZQjAaLWiW+Hhon+NYln+t36AKInmRYHLmVaMXRpRcMCyIJJ1FzXHQF51u3PE9tMJCvrhhxxbfonDFXtIB7ai/YkyTm2A3vbHQb2N92pss2Ml1wXafOoAHt6RIu0TJ95iW5LzqxHlRpEZlWIT7YhuTsLmEckiZvtO7LkFhWStpEStOtIsvHsDxPKorOUIF8KB/w+Oe5CY5HmEC88JXoMQhfAMiaHEIpo5+QlK7iah8cyC2gwnFcmREyv+6ly9JPfn8a5yjTACw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvUJUrNl6ANajshaEcEYREoNVnfY8bz+KZSy/ybfWM4=;
 b=uYf+uRsIohZ7cqGvb/Ol9bdDj7GthQAJizJunHQa4bm8RsA6YMnRktPUpdkwp+c9tTc90GnGymiK6vUDzeaX7DzrryM3m5nZtZLpopTMzywABcd8MreMWGvFVvkf88aY3MDbIZmepbFcaAtx+HWVROE2oMKzkUVrsc9aAHICfmI/9WKl5r7d/++A5w0q8G6TRm6FhpOYW7osv6jOa5CbvoIt51NAJkq0opZFmqj0Ny36BtkAmrHhmQ7/7ejfCiMOk5NMtrdpK1wQ4UNiq+1qKUBGrj65UkfACnAmQNOvHid+OJUGBcqGvjB/aNy7ezGXSnrENTghPKbTkVPxUvX4cA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvUJUrNl6ANajshaEcEYREoNVnfY8bz+KZSy/ybfWM4=;
 b=bjPaJGDDkkq6rw7R1GcOy/lMnzqne+BbnSPYejtDa5mHYU+QfkWUxGxXVewknsIO5plhIa17LMxEIQr2Km7g50FmhllvRZFazL6eTKkfx1HolC6zbgmGv8ZoL+Izfd4glfsdXpJPw3iaRrPnf4/AdEofJ9+RkM4J7JNxVnwUxzA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh6L38isQPgmjrLXEBymkwVUZ3OTZYkCpSXPEU+qtd71TYNO72CK16y05H7aHlRcH+Oh/NabNBsneYK/eiTcL/7Q3w9pSvEr8cVeeApbCxixUMa7diElcG/OPkek6a5+9Tj+Y6D53laMj+h+RxJf+A1UOsQo5rRxUlKciCsEDEDAENfKbW59R0VmSeOjiOlj8qeUp7kGLJzbMbP6HX8XCTQvzJtDFZC2NodJWHQ4fPmGXhyiqcps2qwCKwu6OjunA7SMF98bq+wnV7WpvpePT6YllFS4nyBirXP31K39Lc8huc7qK/HGDp8B6EdjX2Q/lZP8VrQ3SWZFzDYSdIqj0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZvUJUrNl6ANajshaEcEYREoNVnfY8bz+KZSy/ybfWM4=;
 b=UL3DOQPYi5K8Z6PEX1xUCL4lv6RtOAPYcXf72IZBPPFHFZRL/sQtG4/WdTWmKUaC+Q5YkePzyUwiEUSdEhhRai9sTl7mB4VSrf5yviV1eTghU2YyaPXCuolIgD1FblTToSNLmv6er1C+nnST979fLW0oIgi72aiViRBuJ9VytT6mELVK+WIpJZJfbG33NOR/izlLsdI38rBAUpAqjQsLpNY7aihBJOA/95XqZpPChHF2wIieo1n3ceCZlAGSkNQbjLYx9yyo7zlduQHsvrtLJXemriY+xBw1EvKxJgkHaYLHQazOdstaY24OQJrGbPB0P0Fxk2Wc+QSVSq5gEn0SVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZvUJUrNl6ANajshaEcEYREoNVnfY8bz+KZSy/ybfWM4=;
 b=bjPaJGDDkkq6rw7R1GcOy/lMnzqne+BbnSPYejtDa5mHYU+QfkWUxGxXVewknsIO5plhIa17LMxEIQr2Km7g50FmhllvRZFazL6eTKkfx1HolC6zbgmGv8ZoL+Izfd4glfsdXpJPw3iaRrPnf4/AdEofJ9+RkM4J7JNxVnwUxzA=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 5/7] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Topic: [PATCH v4 5/7] arm/mpu: Introduce utility functions for the pr_t
 type
Thread-Index: AQHbuRpkN0hqV8eyHEGiv1K+YR6eKbPD+ocAgAFZpwA=
Date: Tue, 6 May 2025 08:45:48 +0000
Message-ID: <D12F66BB-984F-4230-8846-BB69119FFC2F@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-6-luca.fancellu@arm.com>
 <a11855ac-62f1-439b-8fc0-dcf2006a76b0@amd.com>
In-Reply-To: <a11855ac-62f1-439b-8fc0-dcf2006a76b0@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|DB9PR08MB9684:EE_|DU2PEPF0001E9C5:EE_|AM8PR08MB5697:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bad79f-25d1-4738-e15a-08dd8c7a7989
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TkZYY3hXY0dXMi9EZHg5WDIremZqaW54VHpNL1FSUk92bVBmMFhCRWdNQ3dB?=
 =?utf-8?B?U0l4R0VJMGtQSGdCbFMvVU1CTXRYaFY4eEZhdHVDSTk2eUJpY3cvVHN3ZmVV?=
 =?utf-8?B?ZkhmQ0N1VzE4QnhLZFRVSFdhUi9BOUJkUHdoeEdjUEFQTGV0QVJjQnFUTEVD?=
 =?utf-8?B?NFQvVGJvanhONGo4WlE3aTJtOXRPVUd3dGZ6QlhEcit3aldLY1hHaFI0cDBB?=
 =?utf-8?B?NUJkMGZNalc0RWlpaWwzeTZnbDU0WlEzK1ozSTNIUnpJRURTYTZGTkpiSjRn?=
 =?utf-8?B?d3FxLzBQSDRSUXhLQTlMT2NVV2pUc2MvYm9GQ2M5OXpvNFJmbnJmSWRvZlBr?=
 =?utf-8?B?bGVxbTRocERwTURHUzBOQ2YzUVJlNWVyMW5LRkxqZkpERjFNRlZRbUxWU3Na?=
 =?utf-8?B?dnRGa3NXM3liSmVmMzk4REVMT3BLdVVPNDJ4WmQxRkVtcnZGczRKcE1RUkJO?=
 =?utf-8?B?WTg2eFA3cWVUb0t6ZDF1N3hiM2pubHVPUkgvUU0xOHlOWHVlSmdoVUJwRUJT?=
 =?utf-8?B?R2NGMmtCYmRzY0F2SWZTRGxUaFNmVXVjZUZBSm1PQ09Xdm10OTcvZy9VTmtu?=
 =?utf-8?B?K2ZkUUFHaEp5eTY1Q3JVSUJZZm4wZktNNVNKZGtydytyVG9sWXBxYXBXMGNw?=
 =?utf-8?B?SkZCTk9ONEpnczFFVU5TMngzWVl5KzJFRyt2eFdJVnZpTDVsYjJLNi9EMk9Q?=
 =?utf-8?B?dGhnbzJ6NFU2TGtEMHZJRDNBekZhQm5BWXg4Z1RDamk2S3ZoWkpvdGtDQk5H?=
 =?utf-8?B?UmVodFNOTndNNlc1NW9yVFc0Vk5RZm11Uk1zSFAzYXk2L0tEaUJNWUxpRkM3?=
 =?utf-8?B?VWd2ZCtlNWg2ZXk4UVRNYnV6STg1d3J4em1hYXNKQWt5Z1NmeTdEMExrcXYr?=
 =?utf-8?B?S0IrY0lrem80NVpsV0lwdm9TYVUydEpQUGJKd0QydXc3T2xSR0NBeXNUcUU2?=
 =?utf-8?B?YW10M0p3T21MRlRDMm02RjdLUW41UU1CRm1WTzVYYUhNZGlNbXpsajdoTitr?=
 =?utf-8?B?VzdpSUtocS9LcW5rT1NwVW5qcmlmWUFxUmNPaXRnZW40RGtYTk9rUnRLdEpC?=
 =?utf-8?B?TUNNS3JvNllWUjZ2M1BKckxXNmVLUkhtTHBnTnZZeDhhMzNPZXRybi9obFR4?=
 =?utf-8?B?SnV1MkpzaW1EZGFkeVNjNUx0dnJ1Qno3MWhyZjNMS1pONVhxdjUyL0tWNzNn?=
 =?utf-8?B?R2NtV0Zjcy9KbTBxT3czb0pFODYxZ2JaTEsyMlVvQ2lmYTVVcjFZL2Z5akhG?=
 =?utf-8?B?ckNGd2xpZGRjeTBUdUk5S1BoSkdRbFJhdTV2WlkwMUxqc1NOZVJuRXRQY3Z0?=
 =?utf-8?B?YlFLN0hCQ3BibENqWmZHeUhuRzA3Q1oyejZpRTIyclJlM1VsS3FteW54ZG00?=
 =?utf-8?B?ZjBUcXd4Z1NGbm8vMU03TWF0MThRd0RXcXdNN2RHbG9aVEZRNm52ZHBWTjEx?=
 =?utf-8?B?WDI0Q0ZlMU1nQXpSMnlPc2R3UjdhZWlUY2ZyOVlZdkREYitYb2NrUlBOdW8v?=
 =?utf-8?B?bEEyOVZlMDNjcnVaNityWlhhWFA3ZmUzbVlQdG1VbE9qK3NmR1BsOGlucnpr?=
 =?utf-8?B?NG5oVEx1Q2EzcGFpUnc3V0dOUXc2bDN5clRhVGFKZzh0K3ZMM1doN2RRcFZx?=
 =?utf-8?B?QVg0NFR4VHVBcmNnNUcyUW9YTmJNZ25WRXpuRzZVSkhVTXZmSFZBSXFVd2xP?=
 =?utf-8?B?QXpvdEk0clJHNzlRQTNXeXZybGxycDZsRkl6QkNITVdhVmJySWRKeXRIWVFq?=
 =?utf-8?B?K1pYakp6MUFXM0gwQWRMdWlGY0g0WGI5MjNyU2RodUpZM1o0d1paR0UvQ216?=
 =?utf-8?B?V2F3Qm9FbWdBanVCSnR4SzdpLzBjRFhXcDRyUElvaGRUOVA5NWpYSjh6ditj?=
 =?utf-8?B?eDBVZnIvdzBSYjVHNmpmQ3gxNzhZNE5zb0VtaDExTVVPWjdBQUtKdlNHdUpE?=
 =?utf-8?B?SGp0V2x0VUJzdmgyZ3J6QU8xanRocldTUEszelJ4NXJweXJyT3Q0T2RVb1dN?=
 =?utf-8?Q?x+rE235fQFw34Eib4HrX1LnMFyTN8o=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7D446BEEDB408D419C1E57A7917DF399@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9684
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cfa1caf3-aaaf-4f1e-29e7-08dd8c7a6617
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zi90aWQ2enphK1VMY2JxZlk3T3drV29LcW4vZGVRMEY5Nkd4K2p6cEw4akUx?=
 =?utf-8?B?eW5QYVo0dC9La0hhYnNMRHVXOEdSTHlIM0t4dGxzakJlK0pJMFhXbGUyMloz?=
 =?utf-8?B?cXpxTTNtTmxTMTd1QUxEYk04QTZ5UTlBd2NOVm9ucTE5TmhJMlpFd0dSblBy?=
 =?utf-8?B?UnVKRVRIeFNEYWs4T3RZSG5MMTVXek00dHdwY2NDR1ZGZVJoWHRnaEFza1FI?=
 =?utf-8?B?aHNTWEs2MTRrc1NLc3ZYKy9VMHJlbnFZWWNBWTJLbGlja3R3NldrYWorRVdN?=
 =?utf-8?B?YWdUZjdaRmxQcDFkRko4SFlENlRRVGpTQWZHckpabnBISndmbVVsQlRTc0E3?=
 =?utf-8?B?NGNzT2oybkJKWkcwaElhVXFmNEVZcmFwSWVUZnp3WmtjSElWb0Q4V1E2QWNW?=
 =?utf-8?B?cGNENDkyaEJJTm1RbmZHeHhtRUE4Q25BREpJZVd0aGNKMml1S3k1N25LK2Mw?=
 =?utf-8?B?cGpCQ3JwU2hEeHFHdEtrUWphOCtpd1VFUVhTdHVDRVUwRE1tRHN6YlVtemt4?=
 =?utf-8?B?dWJrNXgraWRMd2lTcVRHYTJzbERHdkNPQzI4ckx6eksrTnM2NHg5Qlc2VVBU?=
 =?utf-8?B?a3ZPTkRpYTBKSlBlakxyVXB5M0tzSGY5dVBkV0F1UWZMMG1TY3hMY2pEaTVW?=
 =?utf-8?B?N1FvaXpwa0ZKMEt0bkJGNm1PWTFkZysyQ3VrUXpab0d4V3krMkU2bFp6MmtG?=
 =?utf-8?B?bUZQek1tOUowOGNRUHlRMFo3eU5tQWovd1RZckJuTjNBb2pla0VYeWhGWTZG?=
 =?utf-8?B?Ti9ZWkliemtvWWhMcERjSnBpU210OGdRYmYrRllTVU1Hc0M2ci9iQ1NTcmNl?=
 =?utf-8?B?MmtyeXdaTy9yOVJZNXVvT2VEYUNPWjE4YTlTaytHY0Rvd2ZPa0lkU0Q3NWoz?=
 =?utf-8?B?cU1iT2xOd0c5UnExakQxTnpkSzFkUjJqWWkvU2hTM0hqbG1Za3ZUMDUya0Rw?=
 =?utf-8?B?ZzdoWWZTZ3lCNFYraGw0bEFFd3dvZkJRZG9IbFVjaVd6TTA3UDdaUkFRY2hD?=
 =?utf-8?B?cStvS01CN1RIWnY3OTZxMlB1WElMN285K21uU2tQeEloYS9KTk1hOE9sc3FJ?=
 =?utf-8?B?Tytnb3hlc05iaWpOS1k3dEFUU2tNTXBjNlBWUEpXYXo2ejgxbkNTY3RyL1JY?=
 =?utf-8?B?ZXdISUZON2JiSWtWenlrcThzcXVmWDFhYmZXMFRzMWpIUkxZdVNibzllMnZK?=
 =?utf-8?B?YzFySG5jdlZza0Rub2M3RG5TVGhrV2N0VFF6a1k4by94OVNqUnpxR3VPdUhL?=
 =?utf-8?B?d2JTS3RJVkdpWWZpVFFyNnJyNk9UcjlhTVdLem1Qb1Q2SUJUVkxMUjV1a1hN?=
 =?utf-8?B?ZWNTdmtDMXIvQlpXQld6S1U1dXlaaTdoa1BjNGVQUnlRMVRQd1FCV0Y2ZE9i?=
 =?utf-8?B?NnJQS1EwdThZRGhQNFFyQlQzUmxiK2xsaytMaTRpb2xTS0FsNEMwSEhCVnhz?=
 =?utf-8?B?bDJtdG5jT1lRZHRnQWo5ZkFzSmR6QXhERjJzUnVpcDFieEo1Yng3d0NvTzdk?=
 =?utf-8?B?N213b3UzVEJjUTZnVmpZNit0akZDNC93TkJNam5vNEVIOVVhV0JUZ0x1SXBx?=
 =?utf-8?B?YkgyVWxXeG1NbXN1WkErZVBDaTJCT2NDaUs3QUFpdU1pQnNJRExIV01WOS92?=
 =?utf-8?B?R1lyL3hZTGlTWElOSGNPR0NVOWg4ZjdFMXR4eXlSeWVEN3VYaittZ0lnSTAv?=
 =?utf-8?B?SVYwN3hTa0M4TkxxaWRpR09VVk1QNWRxL0VHanpZOXd6OVROZU1tWWdsckN4?=
 =?utf-8?B?dHpEYzRmMk1hcG5IejJ5Z0xNTUhiMHVKNVE2VkgwTHFDMTRpK2t4ZTljeElv?=
 =?utf-8?B?WEtPV2QvSDVwVTkrS2xURWFyeW81RTJIWkNzWVFjb3o5ZHpVQytHTkh5VVIv?=
 =?utf-8?B?cUhKUVVsRmN3bWRkZ0U2NEl2THREQjB4TTdiQkU2NEIzMjFuRzh2U0Q1TXN3?=
 =?utf-8?B?YmJ1REJPS0pMRWJnR2RKSmRRMmNQY1VsWFNOWHNsWW81NWNWSVdMYkl2aXZO?=
 =?utf-8?B?b3hCZGVSZytGYTF5aFJJcmE1MzFoOGp4VmVKbmk2SXRYZmI4V2R3VHhHejl1?=
 =?utf-8?Q?VCrlXJ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:46:20.8321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bad79f-25d1-4738-e15a-08dd8c7a7989
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5697

SGkgTWljaGFsLA0KDQo+IE9uIDUgTWF5IDIwMjUsIGF0IDEzOjA4LCBPcnplbCwgTWljaGFsIDxN
aWNoYWwuT3J6ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDI5LzA0LzIwMjUg
MTc6MjAsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBJbnRyb2R1Y2UgZmV3IHV0aWxpdHkgZnVu
Y3Rpb24gdG8gbWFuaXB1bGF0ZSBhbmQgaGFuZGxlIHRoZQ0KPiBzL2Zldy9hIGZldy8NCj4gcy9m
dW5jdGlvbi9mdW5jdGlvbnMvDQoNCk9rDQoNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9tcHUuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9tcHUuaA0K
Pj4gaW5kZXggNDBhODYxNDBiNmNjLi4wZTBhN2YwNWFkZTkgMTAwNjQ0DQo+PiAtLS0gYS94ZW4v
YXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1LmgNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9tcHUuaA0KPj4gQEAgLTI0LDYgKzI0LDcwIEBADQo+PiAjZGVmaW5lIE5VTV9NUFVfUkVH
SU9OU19NQVNLICAgIChOVU1fTVBVX1JFR0lPTlMgLSAxKQ0KPj4gI2RlZmluZSBNQVhfTVBVX1JF
R0lPTl9OUiAgICAgICAyNTUNCj4+IA0KPj4gKyNpZm5kZWYgX19BU1NFTUJMWV9fDQo+PiArDQo+
PiArI2lmZGVmIENPTkZJR19BUk1fNjQNCj4+ICsvKg0KPj4gKyAqIFNldCBiYXNlIGFkZHJlc3Mg
b2YgTVBVIHByb3RlY3Rpb24gcmVnaW9uLg0KPj4gKyAqDQo+PiArICogQHByOiBwb2ludGVyIHRv
IHRoZSBwcm90ZWN0aW9uIHJlZ2lvbiBzdHJ1Y3R1cmUuDQo+PiArICogQGJhc2U6IGJhc2UgYWRk
cmVzcyBhcyBiYXNlIG9mIHRoZSBwcm90ZWN0aW9uIHJlZ2lvbi4NCj4+ICsgKi8NCj4+ICtzdGF0
aWMgaW5saW5lIHZvaWQgcHJfc2V0X2Jhc2UocHJfdCAqcHIsIHBhZGRyX3QgYmFzZSkNCj4+ICt7
DQo+PiArICAgIHByLT5wcmJhci5yZWcuYmFzZSA9IChiYXNlID4+IE1QVV9SRUdJT05fU0hJRlQp
Ow0KPiBTaG91bGRuJ3QgeW91IHRha2UgTVBVX1JFR0lPTl9SRVMwIGludG8gYWNjb3VudD8NCg0K
WWVzIGluZGVlZCwgSeKAmWxsIGZpeA0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

