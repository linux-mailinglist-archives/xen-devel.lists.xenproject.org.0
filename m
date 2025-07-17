Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9646B08DDB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 15:06:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046872.1417272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOJI-0006N3-Nb; Thu, 17 Jul 2025 13:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046872.1417272; Thu, 17 Jul 2025 13:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucOJI-0006LI-Ki; Thu, 17 Jul 2025 13:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1046872;
 Thu, 17 Jul 2025 13:06:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n76Z=Z6=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ucOJH-0006L1-1N
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 13:06:03 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca005d45-630e-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 15:06:02 +0200 (CEST)
Received: from DUZPR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::15) by AS2PR08MB8624.eurprd08.prod.outlook.com
 (2603:10a6:20b:55f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 13:05:58 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::20) by DUZPR01CA0051.outlook.office365.com
 (2603:10a6:10:469::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.22 via Frontend Transport; Thu,
 17 Jul 2025 13:06:09 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via
 Frontend Transport; Thu, 17 Jul 2025 13:05:56 +0000
Received: from AS8PR08MB7265.eurprd08.prod.outlook.com (2603:10a6:20b:420::10)
 by VI1PR08MB5344.eurprd08.prod.outlook.com (2603:10a6:803:13e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 13:05:24 +0000
Received: from AS8PR08MB7265.eurprd08.prod.outlook.com
 ([fe80::b001:5eea:7c3e:1a31]) by AS8PR08MB7265.eurprd08.prod.outlook.com
 ([fe80::b001:5eea:7c3e:1a31%5]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 13:05:24 +0000
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
X-Inumbo-ID: ca005d45-630e-11f0-a319-13f23c93f187
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TobyLHs2S3rPdI1oNzb+TcjyzBKTdwACscY3CfGPcQFLspDJk4DgMrYMzjF1RzOgaUJSWlh0yYIri5tuQJqI4bTCLiv5wEn3X2mq3nx10f99p1ReBrK1Bo543Ww0dTjp/3V6xzViZf90BMOiBR64w8ilYjhS9KI33Z9OmYyJUEPQs09dmy6PkgVMOUsu5pb0aIwniQMxLGtviJmAVxFqpmjMLCp0+JTumfYYpgKJalWR3uJuMoQ3UO0SAUW9JRRRo2HaYtwjQuM/ngMKznxSslOLqzCZJTSU8KkwixmbC+TpcEYgLWW4XxR4DYJPADfR2MUrURs6PqkWiUfKHRrPUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfgAk3shGh1JgQKMrPqq5FDS8e+5A5cGyqHr7wf71ps=;
 b=RJiK739ny2WAAZNtlI3pMpSzZLQkHQWGJnTiwagLpA3Baa4wkkRhTmD5kIA8IB8vJ9ymIu+86DaF1Zs0ERqgb4aqP0tztg8wLJOkPQgHy+XCzKsR2pBtPcu1DX6bBBEcUz0kRL4VpG7G4mnyd8K+LqZhC335ey8XC5yRSV4WCd87H9XaW76Ka5CdhKGeYYAsa1AODe0rAdkdIuHbgBh5cp64Yh9dnvipjD6AEFRh9YkhTXL0EnM2hgR+qlAZ1qYLNfMEZlGWGi1DmixST/Ccja+ABkafggzxClfnB3ajIgGl5Gm8QAfSI9ewEyofU3azJJakqLlYDA6s5h3/YqY22w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfgAk3shGh1JgQKMrPqq5FDS8e+5A5cGyqHr7wf71ps=;
 b=CSlDRtfa0nzy+8CcIwjAdcdfLbu/JcmehXYfrPkkgtMEfupb6l0ZD8bu2+Ubw1e47gcO2rPNxQzoqZOAW/+mAdbQcDUyM+CR+/rpg93pUflNBEtUS0q2aBROemdWLEMtOKMbvhzxcscs6Zj5/kN00Gr97RnLmR40LBSNiYX9C98=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eoEd5S60Oks3u4gP3wgEUc86BSXPbUjyXIhyX9PWalquMQpsfB6YuBJKiWyLSbDBgmGjsTSlMWuAf6LBcKW6i54iSNN+6xhT+UA7Rs9Rd6GfU8DbORxb5WzaYaks9CH0ZTn14bDnYw3c40MhGcMI8pu9iR08KBR5sutmly813Y9jAh7f22jGiSRFIU5b0jUNRwnNV6xNsH60QUZmU5o15NQnu6qCBFIEUUaeMPg9S8LjX+j/oDf5Kl2fgioo2puhHvHuFqVKyNanv8XpUb0wm30giSGVMpGHPs/8scNT0gXPfU6PgideVZ4vdJowdbm54WF5H0JJhJN3bodtE8EHnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfgAk3shGh1JgQKMrPqq5FDS8e+5A5cGyqHr7wf71ps=;
 b=MUQzEbMCNYVy6lwEdyvaRUtIY9QzHesz/9Vf7GPtrDpJOSoTA0RvIUmCw4S1XpZnX+yNP4Czyp3ph+yXZ5mpJ7pKmKRqqTgy2zAPaS9nSrupAxb9hSDWmiSvOFRIwOkKSBVoZDxjz344kgNeEQFV7v9Ds5RAERKicpx/L+IVfd148n1Bfdrr40jiCgUfvUaqeR7GgwYm5yvRKwSokzTZEox3M2JmHYE9N+WOnFmQFzCqNBO77XnEsLkhqbZaLxD2SR3R4CQ9FUwUYVTKlfpFWNxckjuqfn+CjxFkcxdo0gZz2F9cAOztytclifZFTGubUvlLivsAGKFsGNrngVZaew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfgAk3shGh1JgQKMrPqq5FDS8e+5A5cGyqHr7wf71ps=;
 b=CSlDRtfa0nzy+8CcIwjAdcdfLbu/JcmehXYfrPkkgtMEfupb6l0ZD8bu2+Ubw1e47gcO2rPNxQzoqZOAW/+mAdbQcDUyM+CR+/rpg93pUflNBEtUS0q2aBROemdWLEMtOKMbvhzxcscs6Zj5/kN00Gr97RnLmR40LBSNiYX9C98=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <michal.orzel@amd.com>
CC: Hari Limaye <Hari.Limaye@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: Re: [PATCH v3 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Topic: [PATCH v3 5/6] arm/mpu: Implement early_fdt_map support in MPU
 systems
Thread-Index: AQHb9xn3Gft3gY6gG0eTB3jDtAWVF7Q2RtIAgAAAoYCAAAEegA==
Date: Thu, 17 Jul 2025 13:05:24 +0000
Message-ID: <B8C42DBF-1849-4672-8744-C2FE03783B16@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
 <e6a881be371c54a6bceccfac2a7c2fae887ea023.1752565274.git.hari.limaye@arm.com>
 <43e05cb4-c17e-41ac-bd14-413e073f2c2e@amd.com>
 <88524379-8162-4F35-BECC-CE98535D03F1@arm.com>
 <3ecd6a33-bfc8-4827-8691-add60c60607b@amd.com>
In-Reply-To: <3ecd6a33-bfc8-4827-8691-add60c60607b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7265:EE_|VI1PR08MB5344:EE_|DU6PEPF00009526:EE_|AS2PR08MB8624:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c65768b-2120-4d77-9f3c-08ddc532ab16
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?eUU0Y0o2amUzQ28xbU8xTDR3bkdGTWdEL3JzTC9QSGR2Y0I2ZlNvTjd5eWpM?=
 =?utf-8?B?TEsxQnltVmpiVTBvSVNuMWFENzQ5MmxqQmlNMkpveFJZbmJRRWFlUjBnZTdC?=
 =?utf-8?B?UGN5enZaL0pDT2w0RUppMSt0M1Nvai81VWhpSTkvNk1EdEtNMmNOTDVYMURO?=
 =?utf-8?B?bVVVR3o2S3lhV0ExUzEzaEgydWt0cDNtYi9mcTVUajI1ellGNEZ5V1ZOb0Uv?=
 =?utf-8?B?anltZjE0aVRKWXpxWGFyU3RWSmNvZnM1S2p4WnpzWGMvRnlHalRNK2ZtYndS?=
 =?utf-8?B?cmU5WW53UVU2SitxcnVyMnA3UyttcmJJVUtLTVdKd3JDSUhxWlNIdkprb2tq?=
 =?utf-8?B?b056ckwyQmErenZXTGhXdExvMEN2dm9OZzF2S1l2ZEI2VU4vWnZrOTU4dkNw?=
 =?utf-8?B?bzN2bzZpbHdmVlBteE55T2ZRa3YrMFVlTE5RcDlHS01oYnMxbytkbFQxR0Rj?=
 =?utf-8?B?SHcvVEdNU3VNSFJ6WXNvcU9nQ1pYNXV1UkpHajNJMm8rTUNZcUxTYUdFQ3pT?=
 =?utf-8?B?SW5kcnpwdDMrbU94WUJzTmIyL1ZQc1FpQkZkZUFKODlEQzZ2T3NXWStBRHpo?=
 =?utf-8?B?TzBPTWoySDJ5RVBhYkpDTVBuN1V6UFBBSEJna3NpTVB0Vys0NkR0ajhsQ0Nj?=
 =?utf-8?B?emljMzlXa3pXNFhFU3VLdGhOcHg0eWVLM2hFRHN4V2t1a09LK0VDTkdZUkhJ?=
 =?utf-8?B?WWlSckxZSDVwSEZLWnZtSkFYSHJjbGoyeGYycitNNjBBQWc0WU43OHl0K2hU?=
 =?utf-8?B?MnlNd0VrMy9wWStKRk4xYTZrWVBkY2tET3RhUkE4TS9VSnI5YndIbStYcERX?=
 =?utf-8?B?dGFEcXJSZndaOFJMU1lITHQ2OU8zSkQ4RDBWeEVQK1pCbFlkQWx5UFViWkZR?=
 =?utf-8?B?RGUwY0ROckx3U2lFTmRMaSs4TUlHWkxBcXVRT1BkcVZvWm9XVzIrMENLVHB4?=
 =?utf-8?B?S2FQYWl1cTdnU2F1YUNybk5yNlluamdRTitGRnl6a0I3Z2F4WTNyV0tqOE9t?=
 =?utf-8?B?UmwzVzlPZGFCNVBGM05pTUIrR2dxUUt3cFhONWE0TCtFbUF3U0tlT0VWNnFm?=
 =?utf-8?B?Vy8zNUxXc0xBTmdFdklSM1F3RmF3RUdiTXI5dWZTbWpjaXM0Vk53QU8yL1cz?=
 =?utf-8?B?MVh0Q2puNXVMTFhtQWZteXBPczgvYXVzcklHc01MTjk2SUN0QTFkcnJ2aXh3?=
 =?utf-8?B?QUs5TWdZZVRlZGJ6bDdZbFNEazFuOURZd203UzlJcmVHMTN0ellCM0hTS1Fn?=
 =?utf-8?B?ZlFMdUFyaHpSY2R5RXRkRmRLejFQNUVaaGFKVk1TdGloVUU2blA5clFtZUY0?=
 =?utf-8?B?U1J4WDB3cHp6NjhLUXc5L0dPMHBBZ1poU2FpVFZvYW9ZSVNBODJGZW9hb0Jz?=
 =?utf-8?B?TmMxUDV4MFFJd2kzQWI0SVNMaldud3NTUk5pTlRxMm1MN2tqbHRGcmo1cERa?=
 =?utf-8?B?SVZkeFNXZ0tYMVNYOWo3UTE0dnlYR0NvaFhCZVk3RlZtZm5reC9RQlROY25j?=
 =?utf-8?B?V3k3WVBDaUM5Zk1GTTk4VGJza3M0ZmZCUW9SeXBVeTJLeHNXajN2UktPOTk1?=
 =?utf-8?B?QjRuY1duSmFBOE9Ddnpka1VZWHdWYzBkL0VjK2J0YjlIMEhTMzJNRXc0UUpL?=
 =?utf-8?B?R3p1Z290c1UxL2FJRGxkSUh5T0tzZWdLSFJSeFNackZVWHQwWmRvVTBVZnlV?=
 =?utf-8?B?WFdKaXBEQ1NGaUtSSmJnMlpIbW1ERkJ5WkRTSGhwZlVmbFRJRlFadHhJV2Ey?=
 =?utf-8?B?ckJsaC9lc3ZvV1RqeUxFQkxjUzZFT1pURFY2MXNPa2RKTXJCdDJua1pIYmhX?=
 =?utf-8?B?KzE2OHhiODhKaXJyYWNPQ0V5VC9kTGcrQjNCaGZ3YWNxajhMb1kydkliNWdw?=
 =?utf-8?B?SFM2ZStERnkveUtYTWVyZkRHSWEzYTdRRkIzYmFiTzAwZjI0Q1NvK0RWQUtB?=
 =?utf-8?B?UjZrbVl0Uk44SVdvZlFUZ29SSnQvZkthNktlTFdUaGhrK3VWMEw1Znp1aHJC?=
 =?utf-8?B?Q1pFeUJWZ0JBPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7265.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FB59933D83D664789740046160BD041@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5344
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3a355cb-211a-456e-7378-08ddc53297bf
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|82310400026|35042699022|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M0ZsdHNHdmJqUmU5L3lVM3RIbjNMVk1wajBSV2p5cWZUQ0VISGpXdmpXVHBt?=
 =?utf-8?B?MlhaZmtOWk9ManlxalYwcG80cGorbEtMb1gxNnpmbDRyY2JyaE40d3M2STJ2?=
 =?utf-8?B?dXF2N2p1OTBxcEtMSSt0aUN6S1c3N05NYnFva1dKOFhEVTBRejN1N25OR2hT?=
 =?utf-8?B?ZnF6MkZ6NmFZQmRQQXZ1UTM5VzJkczltVEZOdWkvSlZCRDFXb2pHZE5mK1N6?=
 =?utf-8?B?WFRXWDk4dm5EbGVJRjdTOEp6MkZid09wd2krb1VEQThiTGVNTEdrd2ZFdU1J?=
 =?utf-8?B?NExaRmFWeXZIbGJiVmtzdjNCWkl1cmJlcEhsUlZVU2x4WkplM2pBR2hwS2VJ?=
 =?utf-8?B?R003VXNrN3NKdFpPUFBOTXVPVm9ibXpkeVRabVdsNnlnOGo2OW5UaDBQSTl2?=
 =?utf-8?B?ak5XWGxHcE5PTFF1MUdRaHBXT3ZhYTJtREJFRHdCUjhpSXFDeXNiVVQrTFUz?=
 =?utf-8?B?WDZxR251WXpac0lwWlEzRjZJMXQ4SVp1b1hrb1hSMGs3dTRlemxCOVZ6aGhp?=
 =?utf-8?B?OFE2RCtMSkFBb2lHY0g2b2pneUNRZVBtMERnZFNlcENPYk9JRWg5UTdVcXJq?=
 =?utf-8?B?MEJhdSs4eUVhWURpWHhseDA5d2ZjT0IzN3p3Y2o0ZEF0a2I4RmI2R0lhQVky?=
 =?utf-8?B?US9RWVg4ZUMwRDVoSmRXdStQOWFDb3BIN3NIM0k5a3dMbm02QWJEREhNM1Fx?=
 =?utf-8?B?am5hQW9ZRjZPY20rOEpWMHlSb3ViUktQeGJoTW5PRHhzMkNSVS9CeEs3T1o1?=
 =?utf-8?B?Z0ZIWTJHVHBFNUF1M0pYaWQzVzRqdzUxNnVmWUo0Ymdna3hCb3RFTE1lamZB?=
 =?utf-8?B?VGVDVVRuZ2MveUFPQXNWSThFNitJOUprRFBlNnI4a214RkgyNEQ1OGtVQUtR?=
 =?utf-8?B?OTczb0xDak9sN05KRGM2WHpPMWVESG5qQUpTUEdyVkZ0UHRSR1JXS2Q1djU0?=
 =?utf-8?B?QUtJRU5CUHdPbDJrMklUM1VjNTRvKzhrTjREOTdvZ1NhZksxc3hNSGw5ZFNa?=
 =?utf-8?B?dzU0V0x0UVhhZjdlUWhnZXBvMTU1dkJjOEFRWUk2dkZBNE5yWkZXcnJTaTFH?=
 =?utf-8?B?eGdBU2NsQ2RicitteGk3K3p3QzMrMTJQMXBaVm44SWtIZjFEMWtodSszMnpT?=
 =?utf-8?B?ZWI5UmEreDA1R0x2Y1QvdC9kcGRkd0E4V1Jkd1l5cStsN3AyMDVadEdPVTdQ?=
 =?utf-8?B?N1pyTW5QU3hGR2pnTFJ6VGJNL2tBSGlFSjZzZ0ZXencwOWVmbnVNM0hrbm9x?=
 =?utf-8?B?OUswcU9KdzhmakFmYkxEazV6anJBNGJwaUxIVXhINFRXZ3l5cG5qME1oVGg5?=
 =?utf-8?B?Rld3b1JkN0cvK0dUYTVVRE11THVXVFpNTnpBSHlHSk9GRVlrcGpUVnY5dVZN?=
 =?utf-8?B?ZlBHVExBd0Z0b2VXT3JTbmFpa3NrVEFodG55L3FHVTVGazhuVjJWYllWN281?=
 =?utf-8?B?OVNxWXVIdGs3c1o4YXlvZFBwa0tsdkovMFExZkpUU2RkeFRqUnhtUkRMY3hr?=
 =?utf-8?B?RXYzeXJwMWRJa0s3b0FLV3pTb2xLZ3J2bWVoSTUrRWtvUUs1clhHTnJYTUty?=
 =?utf-8?B?K3k4Zm85cFI3RVNKVzRZY3hVaTRINWtVSWwvMGFBLzVvWmFJUVV2M2kzRGpD?=
 =?utf-8?B?TU9ua3RQYkZrWGVJK3pCYUxYbEgvcnZvcm9uZW1EU3hzTVBlOFU0ZGphVnZw?=
 =?utf-8?B?QVJ2VVFMVlp1YVhDU3R5UGNnQ3FSY3NERjk3dzVzN1M3M252dVFOZXZEMnR6?=
 =?utf-8?B?VTRKaUVmdUszZjcxdnRIa1k4RmtacEQzZzNkZm1VeVhkU01TT0pyQXBGYmRS?=
 =?utf-8?B?V1phTU5EdVFjYUJ4dTZVTDRWMlV2TlZ1TlNvblZiVlB4TnBZeEFaSzRRVStU?=
 =?utf-8?B?bTBBYXZnd3NTVldTanBhdWp5NVd1czY5SFY2MFFqanBBZWl0UUZMK0dBbzVV?=
 =?utf-8?B?TVF6bWtXMThmdjFLQnhSQVMwcFIvR3lOZUd5VkdGMjlZcUUycFh3MHltVERU?=
 =?utf-8?B?MEM2amtGd1NrQW1KZ0NWY3Y3akc2L3o1RWlwRXNmRGhDd2o2aGlMbUkrZE54?=
 =?utf-8?Q?Ctil4E?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(82310400026)(35042699022)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 13:05:56.4904
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c65768b-2120-4d77-9f3c-08ddc532ab16
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8624

SGkgTWljaGFsLA0KDQo+IE9uIDE3IEp1bCAyMDI1LCBhdCAxNDowMCwgT3J6ZWwsIE1pY2hhbCA8
bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiAxNy8wNy8yMDI1
IDE0OjU4LCBIYXJpIExpbWF5ZSB3cm90ZToNCj4+IEhpIE1pY2hhbCwNCj4+IA0KPj4+IE9uIDE3
IEp1bCAyMDI1LCBhdCAxMzo1NCwgT3J6ZWwsIE1pY2hhbCA8bWljaGFsLm9yemVsQGFtZC5jb20+
IHdyb3RlOg0KPj4+PiArICAgIC8qDQo+Pj4+ICsgICAgICogRFRCIHN0YXJ0aW5nIGF0IGEgZGlm
ZmVyZW50IGFkZHJlc3MgaGFzIGJlZW4gbWFwcGVkLCBzbyBkZXN0cm95IHRoaXMNCj4+Pj4gKyAg
ICAgKiBiZWZvcmUgY29udGludWluZy4NCj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBzY2Vu
YXJpby4gQ2FuIHlvdSBkZXNjcmliZSBpdCBpbiBtb3JlIGRldGFpbHM/DQo+Pj4gSSBrbm93IHRo
YXQgZWFybHlfZmR0X21hcCB3aWxsIGJlIGNhbGxlZCB0d2ljZS4gRmlyc3QgdGltZSwgbWFwcGVk
X2ZkdF9iYXNlID09DQo+Pj4gSU5WQUxJRF9QQUREUiBhbmQgc2Vjb25kIHRpbWUsIG1hcHBlZF9m
ZHRfYmFzZSA9PSBmZHRfcGFkZHIuIFdoYXQncyB0aGUgb3RoZXINCj4+PiBvcHRpb24/DQo+Pj4g
DQo+Pj4gfk1pY2hhbA0KPj4+IA0KPj4gDQo+PiBUaGlzIHdhcyBpbnRlbmRlZCBhcyBtb3JlIG9m
IGEgc2FuaXR5IGNoZWNrIHRoYW4gYSBzaXR1YXRpb24gdGhhdCB3YXMgZXhwZWN0ZWQgdG8gb2Nj
dXIuIE1heWJlIHlvdSB0aGluayBpdCBtYWtlcyBtb3JlIHNlbnNlIHRvIHJlbW92ZSB0aGlzIGFu
ZCBqdXN0IGFkZCBhbiBhc3NlcnQgdGhhdCBgbWFwcGVkX2ZkdF9iYXNlID09IElOVkFMSURfUEFE
RFJgIGhlcmU/DQo+IFllcywgYXNzZXJ0IHdvdWxkIGJlIG11Y2ggYmV0dGVyIGhlcmUuIEkgY2Fu
J3QgdGhpbmsgb2YgYSBzY2VuYXJpbywgd2hlcmUNCj4gZmR0X3BhZGRyIHdvdWxkIGRpZmZlciBk
ZXBlbmRpbmcgb24gdGhlIGNhbGwuDQoNCnNvIHlvdSBhcmUgcmlnaHQgaXQgY2Fu4oCZdCBoYXBw
ZW4gdG9kYXksIHRoaXMgd2FzIHB1dCBpbiBwbGFjZSBpbiBjYXNlIGJldHdlZW4gdHdvIGRpZmZl
cmVudCBjYWxsIHRoZSBEVEIgd2FzIHJlbG9jYXRlZCBzb21ld2hlcmUgZWxzZSBpbiB0aGUgZnV0
dXJlLg0KSXTigJlzIG5vdCB0aGUgY2FzZSByaWdodCBub3csIGJ1dCB3ZSB0aG91Z2h0IGFib3V0
IHRoYXQgd2hlbiBkb2luZyB0aGlzIGZ1bmN0aW9uLg0KDQpBbnl3YXkgaWYgeW91IHRoaW5rIHRo
ZSBjb21wbGV4aXR5IGlzIG5vdCB3b3J0aCB3ZSBjYW4gYWRkIGp1c3QgYW4gYXNzZXJ0IHRoZXJl
Lg0KDQpDaGVlcnMsDQpMdWNhDQoNCg==

