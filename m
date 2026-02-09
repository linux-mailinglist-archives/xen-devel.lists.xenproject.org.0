Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMINGBC5iWlDBQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:38:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E30A10E333
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 11:38:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225197.1531681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOeE-00064I-82; Mon, 09 Feb 2026 10:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225197.1531681; Mon, 09 Feb 2026 10:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpOeE-00061i-4m; Mon, 09 Feb 2026 10:37:42 +0000
Received: by outflank-mailman (input) for mailman id 1225197;
 Mon, 09 Feb 2026 10:37:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r8oy=AN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1vpOeD-0005yj-6F
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 10:37:41 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b661214-05a3-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 11:37:39 +0100 (CET)
Received: from DU7P195CA0008.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::35)
 by AM8PR08MB6449.eurprd08.prod.outlook.com (2603:10a6:20b:364::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:37:35 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::d6) by DU7P195CA0008.outlook.office365.com
 (2603:10a6:10:54d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 10:37:33 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Mon, 9 Feb 2026 10:37:34 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by AS2PR08MB8381.eurprd08.prod.outlook.com (2603:10a6:20b:558::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:36:29 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 10:36:29 +0000
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
X-Inumbo-ID: 5b661214-05a3-11f1-b162-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hrawf4RVcvw2enicDbCCSuOqk9mheeisnl5LmjDcTKe0E6dqISMOZyILkBOu4GCudzbtP5EUPNZJCbteCS/YhF4M0pW0ZNHFDCQeyhd0d1JSWjjzWahsd+UBzawUm7JLyut0GTQ3EFTDeMTTCGmufSmRURM86TCTYEMwlID3t3ELbZMnkScLL6gw3L0D7QrK13poiepvaSCcy4OGKlYM/Ibce5lB7JkqghyIkLHHLfd06CGtWd/hsyadmdhRvDfPOUc1breJY5Hc+IUdHcdHV4j9q736dOZtgxLzib9P6rGdqcmMKqOApmBVFCUa0TEoF0NzJr3H1Jeug7UX6wyVgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t1eUYfthphS+6r0sL9Y1OI1NN0KV8JI2/mcqgNwvMg=;
 b=n5tj11xwRcorn+Mq1JHT7ZhO5dhoxnslct8K+rw33JcV+UyckVpKfasiUF5SwnDWD8jFNE0nQXMgDcJt6xqlCQZx+kUYQIpyvknc2+ulkbVmY+hdR44XQN8L8UqzpfDc2TQJcug4ijS5Ku40NIjhU9k4sONjO4d2gOj8j8FDbWxLDOMR+TWG8yRyGuu9x85iTwzit4z0LKZdW38v5Y8sC6nnSYlfx5v3MLVQQhx0PISi284UoXEdCX7lqEgQNDBo+CCqjAagz/HrYjy4awVv8q2UCR9w7ootg9eOQT74zzktAP3RV8DX+ZfjOBaEPWxfO+AwkIfxpqG9SdX30BRI8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t1eUYfthphS+6r0sL9Y1OI1NN0KV8JI2/mcqgNwvMg=;
 b=SNb+ua+owWLYdPUsAaZ7r+VmbL4Z9uUkr4NF43NApKfKif+7XA5Hxg1y5a0h1x4WCAfN3ed4oV+2NrIo6Msbn/8x7csmP5F+bWQmTTxv+QYjn/Q1Hlc6SLufjLi1LCj/3NZOpMxJQeTcFa/z6H/TZ1Qh9hblRhJMgxeIKO91JpI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8SWMcSMrwh9jGM5cFzRSbrrK9pP04WAlDhl0QGclUO+iZlIPDNtfZv1E4NJ78UeDZ4tkYr4Q3wNNwz6MbjHrPTpryCI03B1JBlyRe5AxWyEcvTKpRKT0vYKG8Q9v6E6TKyOq8Cm/IkLckfzgOSNwSjuMfr8FcA+efLiGKSbW51Ei4P+Yk+owJfd/Svu8YOlSjtaligr8cvOiokX6cMQTOjCl1h1nXtenQUHtfm0/H90YvYmdULAYxDKSyX/Frsx0Fg2XKAiSTGZk33IGaoraOC5opUmVgngOwunxr+BacMdZIwYtIr66QTvrbiu/H7R0Hvbf9CSZxPBSy2UQPj/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5t1eUYfthphS+6r0sL9Y1OI1NN0KV8JI2/mcqgNwvMg=;
 b=gbdhpFidqcvHrs0ygmhedqYtiMZvliq+QN64ERF7Op3l1/aaxWdNKZis/eKnnaelRcScD8M7Piqo2adYz6HOV3cL4/rPpZoGNoeVx1ZUKPoo6tTVd9PNRfp7/jMQen2SLBJjvsyJlCRGlsmTUrwFGnGP+XOtY2uIIkq37yYXaA2CpO506UINIimrEY3absYJuCaVBTkKDpe7poLjfRuslSnrcbxB35164ML0+/R8TY+Keu7cMJWwPYU37b23bbpVu79szYlYFgNrPxqdrmyUoX/GG4fdBNI3z/iJe3r4OGv8dAQ/sx3cVTT8Apy1VLmYzWzO8iOAUvui3tQIxqX5Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5t1eUYfthphS+6r0sL9Y1OI1NN0KV8JI2/mcqgNwvMg=;
 b=SNb+ua+owWLYdPUsAaZ7r+VmbL4Z9uUkr4NF43NApKfKif+7XA5Hxg1y5a0h1x4WCAfN3ed4oV+2NrIo6Msbn/8x7csmP5F+bWQmTTxv+QYjn/Q1Hlc6SLufjLi1LCj/3NZOpMxJQeTcFa/z6H/TZ1Qh9hblRhJMgxeIKO91JpI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
Thread-Topic: [PATCH v4] xen: Add Darwin.mk for GNU toolchains
Thread-Index:
 AQHcl4TDvkxax6jik0exjnZrMlGqw7V17BsAgAQQvwCAABwvgIAACZqAgAAEx4CAAAQwAIAABTaA
Date: Mon, 9 Feb 2026 10:36:29 +0000
Message-ID: <0586655E-1A20-41B9-BC97-04FE305E5933@arm.com>
References:
 <ff14a313c6ec9b487263e8f823c96533bb70fe1d.1770394705.git.bertrand.marquis@arm.com>
 <aYYkAvGQygf2eNI7@Mac.lan> <28DF7F1E-BAA3-49AC-8A53-75100BAE74B5@arm.com>
 <aYmksdxh5PM7IHDN@Mac.lan> <d43840ca-4e06-45c4-853d-bd666ea06bc0@suse.com>
 <C851E211-4B56-489A-8F06-6512D785B611@arm.com>
 <51a91133-13d0-413a-b8fb-58b9d3018499@suse.com>
In-Reply-To: <51a91133-13d0-413a-b8fb-58b9d3018499@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|AS2PR08MB8381:EE_|DB1PEPF0003922E:EE_|AM8PR08MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c029d9e-1a4e-4a29-9222-08de67c73c6e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dTNXczV2ZHF2ZEMwVmVwUkhWSXJYdGF6c29FWW9JV2loMTRCMWFpTFRabm5y?=
 =?utf-8?B?RVkwU0NhbW5GWWhVU3JUVU1rczU3Smx6WkNTTmRSWW02MUR0K0MxTW5kR2tJ?=
 =?utf-8?B?aEo4QmloSGszZ2wrYVJOVnNTMXIrS0oyc1VYcXc4Zmo2OFRXSnNNTDV5b2t3?=
 =?utf-8?B?ejMydUNnWW5KMk9YNmxSWDRxejEvUk9NZlIzWUtiK2pweHZydW9VbGNZd3Br?=
 =?utf-8?B?bVRIM2YzOGVaRE5Na3RYeWJoVE4xUnJjaDBjRG5weXhudkVmZEROd2h3Ni82?=
 =?utf-8?B?RTJDQkFTSW1HYkhqdkVZSHZNTVpoM2lvV3VXRThzZWNuTTQrek9XTXBJSkZw?=
 =?utf-8?B?UjJFeWNTRmFLbjg2UC9uVEhYblViUkFselhHMWJCUXhyNFVER0dmMkNYRTQr?=
 =?utf-8?B?eldEOFNBS05Zekx3cm9jclo0bnc0a1kySmpXcnBkdWV4YnV3SmFpTHlZRGM2?=
 =?utf-8?B?YW1OdUludEF1aXRIdU1aVXo1eStXc0Q3SmpsNitMQllSY1ZreUhFYTBRZUYy?=
 =?utf-8?B?aExacHhCQlp3SzNmM3ZISkhrWmhmTk4zRXJ1azVIMmc1MUhNb2dzNkxQM09Z?=
 =?utf-8?B?aDJkQ2F0WTZ4anlaMDY4WVNLbzZsNVRZMjJKVXV1NWpFUUJFZUltRERheEF3?=
 =?utf-8?B?cUY4bkU1d25LTUNvY1YxblB6dzlLVy93YW5KNzh4UjJTS3ZTdW50T2xacDZ4?=
 =?utf-8?B?UUNiWEhyNDVBenMxYk4rOGs4b1Zmd0V4c042M25zelg3Y0VNODIrRGxWTE54?=
 =?utf-8?B?L2VWNWZZMG4xL1JXZ2dEbnlwYm9qeWFjL1NGa0ZHbW5zbWZxa2R6UUR1MWU4?=
 =?utf-8?B?QmtDdWdXY085RllYbEpDNTRKWUZsK0dGWmtIdStYZzd4RzRTb3NaTFJDQW9p?=
 =?utf-8?B?YndsVjFhdVFCcFdkNC96Z29wN3hBdExaU3VXcTd4WGozYm1FRW42K3E1aEh4?=
 =?utf-8?B?cXB2WVMrQTF3bkRlems1UGU2SGxPOFpkU0QzcTEreUV5c05HWk1ROVhjR1ZV?=
 =?utf-8?B?akJrK3QyK3lBZy9WOHh0ZnJ4V1dyK3BQcG03R1I1ZDZGRlRKUkVqNEhyVWdR?=
 =?utf-8?B?aExQdUliRUtOeVkxbjJGVmxxU29RS1lUbzB5ZGF3a2wrRU9WUmdlRzQ2Q2w3?=
 =?utf-8?B?MGRIYUd2VzhSalFxeHRNajdmWk4zYjJxNzVERHR6U0lSZ21HYUxTalhkTnZC?=
 =?utf-8?B?U2NaR0FUTmJRb3Fabnk4c0tRclJtWlJla2dZaUdvcFNJekZ5RHhYbXF4M29v?=
 =?utf-8?B?c3hRTzVta1FQRDlxdXFRK0psUk1PMEcrazNXQjZ3YlFmakhZd1V0UzJTclho?=
 =?utf-8?B?WjF2R0lJNDc3c2xWNTViempnd3VGYzRmL2loQVgxaDBCSHpKVStSQnpkRStm?=
 =?utf-8?B?TVUyR29GTFFianA0K3NwTTFaTGpZUS9XbTZXRmJneG9EWW56NXAyeTBBTzA2?=
 =?utf-8?B?ZU1VUGYzREFFVVhqRk10VVZBbWFoaUc4MUlhYVpTYnBSd1JvRmJGMEs1MnZq?=
 =?utf-8?B?RTA5MTc3NUt6ZHdvUTA0YXkzd0MzWXIzUHg2d3BTdWtGYk53bDkwTS8yTCtF?=
 =?utf-8?B?VGo0aGc5OXNJdzBkUk1CZTN0ZXR6UW1sTS9OaWVHbjliMGhMa0hReGdzMDNR?=
 =?utf-8?B?UGwveStLSkF3K2MvKzNPTHBlZmlqZko5NThEd3RoQnIwbURETi9uQmEzeWNG?=
 =?utf-8?B?K0d2OExsRTBENXk5emZ4dC8yRkRLdTkxT2UrTDF4aEFZc1JOUnRNaFZlYm1E?=
 =?utf-8?B?U0lTM1V3UTl0THlOTGQvM0tJRnQvN1hRV2RYSVYvclYyTnNtUlg2TThYK1Fv?=
 =?utf-8?B?L0dIcTYvYTNJZDBhaXBiUFBuZUFHNXFGQ3RLYkloWEpiS3NhL3ZVckZPYjE3?=
 =?utf-8?B?NEs5emt2cXVoRUhnaERFSGNaQUR5T0NkNllBVG5kR0hsQ09qTWxNMS8xMkwz?=
 =?utf-8?B?WkxaN0lJSlZhRTBDN2RkbEFwQ2NWRy9Cd3Q1VStyVDBiQVpqU1J3NzBDL0V5?=
 =?utf-8?B?NGRwa2dkem9FWVMxakxJbnhyZEUzWXNFbTludHp5VENOanJpZ3h3Qm9tMnNR?=
 =?utf-8?B?cTlsRkEraVhtcTN5Wkh5emtLMlMxOXpjQTNqWVNnYmxRdmg4bHpIQ29GamVv?=
 =?utf-8?B?VjlBby9YOS9iMTVQYmdmOEtqTzNZKzU1RU5MSjJFTEJrbk9iMUNPU2NFdFNK?=
 =?utf-8?Q?VLFPG2Ifjex0cl0Om5G2F7E=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <50147FEBE812FF468E194E162D664F6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8381
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec03ea67-5847-428e-fd30-08de67c715bd
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|376014|14060799003|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkV5dUNWWGhQeVU4MVF5UDEzYjJjWk0wbzlpNFVsOUhuZllyWlhBWmxSdjVG?=
 =?utf-8?B?aFlMREtuZm4zMjV6TGNWUUhrUkdyY3ludXZhNUU4K1YvL2dIK3BaK3hGam5W?=
 =?utf-8?B?MGZOeDNWVFp2WEtocnRrc1hmNVVreGJOMTh5MzZDT0dlTEJlZi9xbXJabXo2?=
 =?utf-8?B?cXlWcVRYU3J1QmJoSThSU3VremdGYU5vaHZURHRTYzFSQW1QT3l6OCtiQmVv?=
 =?utf-8?B?YU51bGlYN0prSUdwOXFwajFlN29qTkFjWnNJN2dBc3hkYldjbmRiR3FBQ3ps?=
 =?utf-8?B?TmxaczBCMTFIQVduMXVibGJOOGJTSVlNUEtCNmJvZDA4MFFaNktTM2RDTENq?=
 =?utf-8?B?YjJhUFdPRkNoazhqdkxKMmhKNUZGcUNZSWQxVkdmbFl2alluRlcwUEs1L05H?=
 =?utf-8?B?bHJnUllaRjV4UEhUWXdXcTlaMVd1SHZydkZuVjMrQ3JHSktFREx6b2pLaG9I?=
 =?utf-8?B?dTRDWElXQnd0d3VCOG1aa1Y5cDc5SDM2Q0ZaNXVhdmZTQ0JCd1o5ZTZDWTFF?=
 =?utf-8?B?czhqNHBzbUVvbSs4VExHT2pNeUx6dU11Y1BPUGdHU1VVbDdEWDBVc0NzelIz?=
 =?utf-8?B?TTBpakZ6YkhKS2NtdjlMMkhyL2o2cU5vRFlwWXg3N2VzWGFZcTFMWW55S3pV?=
 =?utf-8?B?cHlTbzZOd0FmeHFKTkxUVy9nckloWE1GbkJMOElkSzdjQnhOcSs2K2kyeXkx?=
 =?utf-8?B?L1BjbjRyUGE0VFdxS0EvUGNKS0dmbWJ2RndyOXdSdXc2Z3N1OUVhNy93N1Fi?=
 =?utf-8?B?QjF2anZjaWtUaVpVOHUzME4xbzNma1orMFRKNXNBbDg2K09pRzZuRmRNemFr?=
 =?utf-8?B?aDcreHNMUnFLQXFyc3Fjc1FzSTVsWXdaVWFPL2p4aUdpOHFkR0UraEdKeGdL?=
 =?utf-8?B?MWwvdkt4OTFZOU85MCtUbHExeHh2RWVOQm5LK0tKd1JicVFDZDJCdnlQRC92?=
 =?utf-8?B?MStZV3BLYlFWSDZmQi84MkxLYU5tNHBRK1dvQ0YxUytVTXJhYzRSem9UdkU3?=
 =?utf-8?B?Um1aNVJHYVhaNDlVcUpVbTY0QTFyTk9yS2NPanVhWG5pcmxxcDZKL3hSTjFZ?=
 =?utf-8?B?OFVxZXFUR21MNFZvYzZtR0w5ZFlxTjVzNENsemZDRzNqMWdZTEh1dlJKQkJ6?=
 =?utf-8?B?UDZUaFhHeVhLK3ErM3RWcUJoRVIwN2x3dlZCVWFvU3RXc3pEekYvTFM2aDJm?=
 =?utf-8?B?c1Z0SDJwZjdvQ08rREhnc2hLQ3lVM3M2UkovYzl5U1lHVnVSNUszYmlrS2NX?=
 =?utf-8?B?bldRcTZDZWV5UkVYSXJ5TnpzcEtaU01oK0JWNjBSNHpEZG1Kd0x0V0VVd1h1?=
 =?utf-8?B?TWRTUFpPOGlUb3ZDZ05oT1ZGd2tacGJZMCtML01iRXlWd3Uzbm1KYlVUeFpv?=
 =?utf-8?B?UGxIUkdYNUppNUJRMkdRSENub1dhY3hXL0Zna1VTVzNFVDArZDVaYXdsVlZY?=
 =?utf-8?B?c3BZc0FDZGtnSDEvSnBqcW4zdWJadEZ4NHVPSzhqTmJaZGFzcVlxVEZHRkZQ?=
 =?utf-8?B?NFZxQkdFNFJ3RnNVWFhNUDE1TzdOVFdHMnNMSUZqZ2xIeHBQQUNORklxaUU0?=
 =?utf-8?B?N25SMkI4R05UUkNHZ3FsTUNsdGorajJBaHZYUDAxMG1MN0YrRThoU2dKbThn?=
 =?utf-8?B?Y1l4MGFrSXo4UXQzMk55ZVpFYU5XY0YrRlZHWGI1cTZqNXFBMEQ2dFEzZ1JO?=
 =?utf-8?B?ODlXMkZDMmd5cXBDTGhqcTdUZWg2WStCYkRwRlprNVkyODlkQlIrVWRvN0JG?=
 =?utf-8?B?V2oraVBvMXI5SWpDMkdrdDgwVFFmaU9XZWJKR3k4UzRIckcwZVNUMkRKVFBQ?=
 =?utf-8?B?VHdPVGl4Vlh6Mk8ybllPT0hsb1NVRzJlckNDdlFHTDNiYlZHaVZHYzFEdjFQ?=
 =?utf-8?B?UWt2SWRDV2F4K0xGOEt5Y3FHYUZWWHRxYUhHUXRNOFRQNVRyR0YyeFlOcUhw?=
 =?utf-8?B?eGZsakxjYWM0ZnZnc1B1SmorSm9XWWNQdmJQRE9zWW1kSC9hWjFGOU1XQjMy?=
 =?utf-8?B?Kytiem1BWFZUTnZ6RGd2R2NEK0x6ZnE0SUtsT2xLdUp5Y0RabUZOaytkVEFw?=
 =?utf-8?B?bjZqMkRkZGRhVlBMOFU4Z2NBd3B4SmY1UGlaUHhlWUk2bHBqaitvTHJQd3FB?=
 =?utf-8?B?MFFwUFkraHVUMGI3dnJUQVJ4dC9zTkZuTDZybDhKNTlVSjd0MU9qNXVhZzMx?=
 =?utf-8?B?d2FjbVNzN2JwMExPNmxPSUw3Qkl2RHgvVFhXOVBjTk9vT2s0aHdjZ1E1YWpP?=
 =?utf-8?B?c0xHclZMUTN4UmZFVXBKbXkxa2NnPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(14060799003)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EEAbONlHEoGAWCXqcBaqr0IpSocfRpgl//ZOoMgjLapq1k4yWvirkOwTadfnm1RgEtj8rVUj5E4dHCaqbbfFDSL5dwhBqxqI2SocAELoQWE3KnqyetiFKFo21Tvc1E17WgsGUEtfPKuD+q5wZMe7kiwE+Wu38ON9+oy8zrnd4m2k6dq1PYt9o5o/+dAXlXz2COBTZPk33a8qxtJOWmgcfrrA7fJ1FY9U+qTDNS+N4C0RdV0y+wN8E7YxzVD6GzTc5UK6DrY6zRTBXCb8LSZvoLoMojgYJqFJWDv3Z6gjS3gKWgggSeb4JEfxyofh1aic8e+Hmyonu4wMDejzRF+ViyJpo+/dPpAC4Gr38o9Qv/uYMqsRS492FA1KYa8mYPrU6/VU1SrapBH4QdBJeypQe89ooIeNiQ1xMhBWcUblW9auEG6uLYlX/7wfrOXqtQCm
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:37:34.2102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c029d9e-1a4e-4a29-9222-08de67c73c6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6449
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.08 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=2];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[arm.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,arm.com:email,arm.com:dkim,arm.com:mid,citrix.com:email,stdgnu.mk:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,darwin.mk:url];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 6E30A10E333
X-Rspamd-Action: no action

SGkgSmFuLA0KDQo+IE9uIDkgRmViIDIwMjYsIGF0IDExOjE3LCBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMDkuMDIuMjAyNiAxMTowMiwgQmVydHJhbmQg
TWFycXVpcyB3cm90ZToNCj4+IEhpIEphbiwNCj4+IA0KPj4+IE9uIDkgRmViIDIwMjYsIGF0IDEw
OjQ1LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9u
IDA5LjAyLjIwMjYgMTA6MTEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+IE9uIE1vbiwg
RmViIDA5LCAyMDI2IGF0IDA3OjMwOjMwQU0gKzAwMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6
DQo+Pj4+PiBIaSBSb2dlciwNCj4+Pj4+IA0KPj4+Pj4+IE9uIDYgRmViIDIwMjYsIGF0IDE4OjI1
LCBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+Pj4+Pj4g
DQo+Pj4+Pj4gT24gRnJpLCBGZWIgMDYsIDIwMjYgYXQgMDU6MjE6NDRQTSArMDEwMCwgQmVydHJh
bmQgTWFycXVpcyB3cm90ZToNCj4+Pj4+Pj4gWGVuIGRvZXMgbm90IHByb3ZpZGUgYSBEYXJ3aW4g
YnVpbGQgY29uZmlndXJhdGlvbiBmb3Igc2VsZWN0aW5nDQo+Pj4+Pj4+IEdOVSB0b29sIGRlZmlu
aXRpb25zLiBPbiBtYWNPUywgdGhlIHRvb2xzIHdlIHVzZSBhcmUgZWl0aGVyIEdOVQ0KPj4+Pj4+
PiBjb21wYXRpYmxlIG9yIHdlIG9ubHkgcmVseSBvbiBmZWF0dXJlcyBzdXBwb3J0ZWQgYnkgTWFj
IE9TLCBzbw0KPj4+Pj4+PiB1c2luZyB0aGUgR05VIHRvb2wgZGVmaW5pdGlvbnMgaXMgYXBwcm9w
cmlhdGUuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBBZGQgY29uZmlnL0Rhcndpbi5tayB0byBpbmNsdWRl
IFN0ZEdOVS5tayBhbmQgZm9yY2UNCj4+Pj4+Pj4gWEVOX0NPTVBJTEVfQVJDSD11bmtub3duLCBl
bnN1cmluZyBEYXJ3aW4gYnVpbGRzIGFsd2F5cyBmb2xsb3cNCj4+Pj4+Pj4gdGhlIGNyb3NzLWNv
bXBpbGUgcGF0aCBhcyB3ZSBkZXBlbmQgb24gdGhlIExpbnV4IEFCSSBzbyBjb21waWxpbmcNCj4+
Pj4+Pj4gb24gTWFjIE9TIGlzIGFsd2F5cyBhIGNyb3NzIGNvbXBpbGF0aW9uIGNhc2UuDQo+Pj4+
Pj4+IA0KPj4+Pj4+PiBBbiBleGFtcGxlIG9mIGhvdyB0byBidWlsZCB0aGUgaHlwZXJ2aXNvciBm
b3IgYXJtNjQgb24gTWFjIE9TDQo+Pj4+Pj4+ICh0b29scyBjYW5ub3QgYmUgYnVpbGQgZm9yIG5v
dykgdXNpbmcgYSB0b29sY2hhaW4gZnJvbSBicmV3Og0KPj4+Pj4+PiAtIGJyZXcgaW5zdGFsbCBh
YXJjaDY0LWVsZi1nY2MgYWFyY2g2NC1lbGYtYmludXRpbHMNCj4+Pj4+Pj4gLSBjZCB4ZW4NCj4+
Pj4+Pj4gLSBtYWtlIFhFTl9UQVJHRVRfQVJDSD1hcm02NCBDUk9TU19DT01QSUxFPWFhcmNoNjQt
ZWxmLSBIT1NUQ0M9Y2xhbmcNCj4+Pj4+PiANCj4+Pj4+PiBJbnN0ZWFkIG9mIGBjZCB4ZW5gIEkg
d291bGQgdXNlIGBtYWtlIHhlbiAuLi5gLg0KPj4+Pj4gDQo+Pj4+PiBBY2sgdGhlICdjZCB4ZW4n
IGxpbmUgaXMgdXNlbGVzcyBhbmQgc2hvdWxkIGJlIHJlbW92ZWQuDQo+Pj4+PiANCj4+Pj4+PiAN
Cj4+Pj4+Pj4gDQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlcnRyYW5kIE1hcnF1aXMgPGJlcnRy
YW5kLm1hcnF1aXNAYXJtLmNvbT4NCj4+Pj4+PiANCj4+Pj4+PiBBY2tlZC1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4+Pj4gDQo+Pj4+Pj4gT25lIGNvbW1l
bnQgYmVsb3cuDQo+Pj4+Pj4gDQo+Pj4+Pj4+IC0tLQ0KPj4+Pj4+PiBDaGFuZ2VzIHNpbmNlIHYz
Og0KPj4+Pj4+PiAtIHNldCBYRU5fQ09NUElMRV9BUkNIIHRvIHVua25vd24gaW5zdGVhZCBvZiBE
YXJ3aW4NCj4+Pj4+Pj4gLSBsaXN0IGJpbnV0aWxzIGFzIGEgZGVwZW5kZW5jeSB0byBpbnN0YWxs
IGluIGJyZXcgaW4gY29tbWl0IG1lc3NhZ2UNCj4+Pj4+Pj4gDQo+Pj4+Pj4+IENoYW5nZXMgc2lu
Y2UgdjI6DQo+Pj4+Pj4+IC0gU3ViamVjdCB3YXMgInhlbjogQWRkIG1hY09TIGh5cGVydmlzb3Ig
YnVpbGQgY29uZmlndXJhdGlvbiINCj4+Pj4+Pj4gLSBVcGRhdGUgRGFyd2luLm1rIGNvbW1lbnRz
IHRvIG1vcmUgYWNjdXJhdGUgdmVyc2lvbnMgKEphbikNCj4+Pj4+Pj4gLSBSZW1vdmUgdGhlIGJ1
aWxkLW9uLW1hY29zIGhlbHAgYXMgd2UgaGF2ZSBubyBkZXBlbmRlbmN5IG9uIGFueXRoaW5nDQo+
Pj4+Pj4+IGNvbWluZyBmcm9tIGJyZXcgYW55bW9yZSBhbmQgdGhlIHRvb2xjaGFpbiBjYW4gYmUg
cmV0cmlldmVkIGJ5IGxvdHMgb2YNCj4+Pj4+Pj4gb3RoZXIgc29sdXRpb25zIHRoYW4gYnJldyBv
biBtYWMgb3MuIFN3aXRjaCB0byBhIHNpbXBsZSBkb2MgaW4gdGhlDQo+Pj4+Pj4+IGNvbW1pdCBt
ZXNzYWdlIGluc3RlYWQNCj4+Pj4+Pj4gLS0tDQo+Pj4+Pj4+IGNvbmZpZy9EYXJ3aW4ubWsgfCA3
ICsrKysrKysNCj4+Pj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPj4+Pj4+
PiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlnL0Rhcndpbi5taw0KPj4+Pj4+PiANCj4+Pj4+Pj4g
ZGlmZiAtLWdpdCBhL2NvbmZpZy9EYXJ3aW4ubWsgYi9jb25maWcvRGFyd2luLm1rDQo+Pj4+Pj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTc2YjI3
ZWFjNjc2DQo+Pj4+Pj4+IC0tLSAvZGV2L251bGwNCj4+Pj4+Pj4gKysrIGIvY29uZmlnL0Rhcndp
bi5taw0KPj4+Pj4+PiBAQCAtMCwwICsxLDcgQEANCj4+Pj4+Pj4gKyMgVXNlIEdOVSB0b29sIGRl
ZmluaXRpb25zIGFzIHRoZSB0b29scyB3ZSBhcmUgdXNpbmcgYXJlIGVpdGhlciBHTlUgY29tcGF0
aWJsZQ0KPj4+Pj4+PiArIyBvciB3ZSBvbmx5IHVzZSBmZWF0dXJlcyB3aGljaCBhcmUgc3VwcG9y
dGVkIG9uIE1hYyBPUy4NCj4+Pj4+Pj4gK2luY2x1ZGUgJChYRU5fUk9PVCkvY29uZmlnL1N0ZEdO
VS5taw0KPj4+Pj4+PiArDQo+Pj4+Pj4+ICsjIFhlbiB1c2VzIExpbnV4J2VzIEFCSSBzbyB3ZSBh
cmUgY3Jvc3MgY29tcGlsaW5nIG9uIE1hYyBPUy4NCj4+Pj4+PiANCj4+Pj4+PiBIbSwgaXMgdGhp
cyBhY3R1YWxseSBmdWxseSB0cnVlPyAgV2hhdCdzIHRoZSBMaW51eCBBQkkgZXhhY3RseSBoZXJl
Pw0KPj4+Pj4+IA0KPj4+Pj4+IEZyZWVCU0QgYnVpbGRzIFhlbiBuYXRpdmVseSwgYW5kIGl0J3Mg
bm90IHVzaW5nIHRoZSBMaW51eCBBQkkuDQo+Pj4+Pj4gRnJlZUJTRCB1c2VzIG5vIHNwZWNpZmlj
IC10YXJnZXQgdG8gdGhlIGNvbXBpbGVyIGludm9jYXRpb25zLCBhbmQgdGhlDQo+Pj4+Pj4gbGlu
a2VyIGVtdWxhdGlvbiBpcyBzZXQgdG8gZWxmX3g4Nl82NF9mYnNkLg0KPj4+Pj4+IA0KPj4+Pj4+
IEkgdGhpbmsgdGhlIHBvaW50IGhlcmUgaXMgdGhhdCB0aGUgdG9vbGNoYWluIG11c3Qgc3VwcG9y
dCBidWlsZGluZyBFTEYNCj4+Pj4+PiBvYmplY3RzIC8gaW1hZ2VzLCBiZWNhdXNlIHRoYXQncyB0
aGUgYmluYXJ5IGZvcm1hdCBzdXBwb3J0ZWQgYnkgWGVuLg0KPj4+Pj4+IFdoZXRoZXIgaXQncyBM
aW51eCBFTEYgb3IgRnJlZUJTRCBFTEYgZG9lc24ndCBtYWtlIGEgZGlmZmVyZW5jZSBmb3INCj4+
Pj4+PiBzdGFuZGFsb25lIGVudmlyb25tZW50cyBsaWtlIHRoZSBYZW4ga2VybmVsLg0KPj4+Pj4g
DQo+Pj4+PiBUaGlzIGZpbGUgaXMgYWxzbyB1c2Ugd2hpbGUgY29tcGlsaW5nIHRoZSB0b29scyBh
bmQgZm9yIHRob3NlIHlvdSBkZWZpbml0ZWx5DQo+Pj4+PiB0byBjcm9zcyBjb21waWxlIGFzIHRo
ZXkgZGVwZW5kIG9uIExpbnV4IEFCSS4NCj4+Pj4gDQo+Pj4+IEknbSBub3QgYW4gZXhwZXJ0IG9u
IHRoaXMgYXQgYWxsLCBidXQgSU1PIHRoZSB0b29scyBkb24ndCBkZXBlbmQgb24NCj4+Pj4gdGhl
IExpbnV4IEFCSSBhdCBhbGwuICBBbnlvbmUgY2FuIGFkZCB0aGUgbWluaW1hbCBPUy1zcGVjaWZp
YyBiaW5kaW5ncw0KPj4+PiByZXF1aXJlZCBmb3IgdGhlIHRvb2xzIHRvIHdvcmsgb24gZW52aXJv
bm1lbnRzIGRpZmZlcmVudCB0aGFuIExpbnV4Lg0KPj4+PiBXZSBjdXJyZW50bHkgaGF2ZSB7TmV0
LEZyZWV9QlNEIGFuZCBMaW51eC4gIEluIHRoZSBwYXN0IHdlIGFsc28gaGFkDQo+Pj4+IFNvbGFy
aXMsIGJ1dCB0aGF0IGhhcyBiaXQgcm90dGVuLg0KPj4+PiANCj4+Pj4+IE1heWJlIHRoYXQgd29y
a3Mgb24gQlNEDQo+Pj4+PiBidXQgaSBkb3VidCB0aGlzIHdvdWxkIGJlIHRoZSBjYXNlIG9uIG1h
YyBvcy4NCj4+Pj4gDQo+Pj4+IEkgZG91YnQgd2Ugd291bGQgZXZlciBoYXZlIGFueSBuZWVkIHRv
IGJ1aWxkIGFuIE9TWCBuYXRpdmUgdG9vbGNoYWluLA0KPj4+PiBhcyBpdCdzIHVubGlrZWx5ICg/
KSB0aGF0IHdlIHdpbGwgZXZlciBnZXQgWGVuIHN1cHBvcnQgaW4gdGhlIERhcndpbg0KPj4+PiBr
ZXJuZWwuDQo+Pj4gDQo+Pj4gSWYgRGFyd2luIGhhcyBzb21lIHdheSB0byBsb2FkICJtb2R1bGVz
IiAoZS5nLiBkcml2ZXJzKSBpbnRvIHRoZSBrZXJuZWwsIGl0DQo+Pj4gbWF5IGluIHByaW5jaXBs
ZSBiZSBwb3NzaWJsZSB0byBydW4gT1NYIGFzIGEgSFZNLURvbTAsIHdpdGggYSBYZW4gZHJpdmVy
DQo+Pj4gbG9hZGVkIHNlcGFyYXRlbHkuIFRoYXQncyBmYXIgZmV0Y2hlZCwgSSBrbm93Lg0KPj4+
IA0KPj4+Pj4gTWF5YmUgd2UgY291bGQgc2ltcGxpZnkgdGhlIHNlbnRlbmNlIHRvIG5vdCBzYXkg
YW55dGhpbmcgd2UgYXJlIHVuc3VyZToNCj4+Pj4+IA0KPj4+Pj4gIyBDcm9zcyBjb21waWxlIG9u
IE1hYyBPUw0KPj4+Pj4gDQo+Pj4+PiBUZWxsIG1lIGlmIHRoYXQgd29ya3MgZm9yIHlvdSBhbmQg
aSBjYW4gc3VibWl0IGEgdjUgb3IgdGhpcyBtaWdodCBiZSBwb3NzaWJsZSB0bw0KPj4+Pj4gZml4
IG9uIGNvbW1pdC4NCj4+Pj4gDQo+Pj4+IEknbSBmaW5lIHdpdGggaXQsIEkgd291bGQgbGlrZSB0
byBoZWFyIEphbidzIG9waW5pb24uDQo+Pj4gDQo+Pj4gQXMgbG9uZyBhcyBpdCdzIGNsZWFyIHRo
YXQgYWxsIG9mIHRoaXMgaXMgb25seSBhYm91dCBidWlsZGluZyB0aGUgaHlwZXJ2aXNvcg0KPj4+
ICh3aGljaCBkb2Vzbid0IGxvb2sgdG8gYmUgdGhlIGNhc2UgcmlnaHQgbm93IGJleW9uZCB0aGUg
ZXhhbXBsZSBnaXZlbiBpbiB0aGUNCj4+PiBjb21taXQgbWVzc2FnZSwgd2hpY2ggbWF5IGJlIHRh
a2VuIGFzIHJlYWxseSBvbmx5IGFuIGV4YW1wbGUpLCB0aGF0J3Mgb2theQ0KPj4+IFsxXS4gSSdk
IHN0aWxsIHByZWZlciB0byBtZW50aW9uIHRoZSBTVlI0IEFCSSBoZXJlLCB0aG91Z2gsIHRvIGF0
IGxlYXN0DQo+Pj4gc29tZXdoYXQgZXhwbGFpbiB0aGUgImFsd2F5cyBjcm9zcyIgYXNwZWN0Lg0K
Pj4+IA0KPj4+IEkgY2FuIG1ha2UgZWRpdHMgd2hpbGUgY29tbWl0dGluZywgYnV0IEknbSB1bnN1
cmUgd2hldGhlciB0aGF0J3Mgd2FudGVkIGluDQo+Pj4gdGhpcyBjYXNlLg0KPj4gDQo+PiBJIHdv
dWxkIHN1Z2dlc3Q6DQo+PiANCj4+IENyb3NzIGNvbXBpbGUgb24gTWFjIE9TLCBvbmx5IGh5cGVy
dmlzb3IgYnVpbGQgaGFzIGJlZW4gdGVzdGVkLCBubyB0b29scw0KPj4gDQo+PiBQbGVhc2UgZG8g
dGhlIGZvbGxvd2luZyBlZGl0cyBvbiBjb21taXQgaWYgdGhhdCdzIG9rIGZvciB5b3UgOg0KPj4g
LSByZW1vdmUgJ2NkIHhlbicgZnJvbSBjb21taXQgbWVzc2FnZQ0KPj4gLSB1c2UgcHJldmlvdXMg
Y29tbWVudCBpbiBEYXJ3aW4ubWsNCj4gDQo+IFRoZXJlIGhhdmUgYmVlbiBzZXZlcmFsICJwcmV2
aW91cyIgY29tbWVudHMgdGhlcmUsIHNvIEkgdGhpbmsgaW4gdGhpcyBjYXNlDQo+IGl0IG1heSBp
bmRlZWQgYmUgYmV0dGVyIC4uLg0KPiANCj4+IE90aGV3aXNlIGhhcHB5IHRvIHN1Ym1pdCBhIHY1
DQo+IA0KPiAuLi4gaWYgeW91IGRvIHRoaXMuIEknbSBzb3JyeSwgaXQncyBxdWl0ZSBhIGJpdCBv
ZiBiaWtlLXNoZWRkaW5nIG9uICJtZXJlbHkiDQo+IGNvbW1lbnRhcnksIHlldCBJIHRoaW5rIHdl
IHdhbnQgdG8gYXZvaWQgbWlzbGVhZGluZyBwZW9wbGUuDQoNCm9rLg0KDQpDaGVlcnMNCkJlcnRy
YW5kDQoNCj4gDQo+IEphbg0KDQoNCg==

