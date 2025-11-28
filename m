Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5067BC915CD
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 10:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174585.1499535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOuRy-00063d-EQ; Fri, 28 Nov 2025 09:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174585.1499535; Fri, 28 Nov 2025 09:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOuRy-00061v-AS; Fri, 28 Nov 2025 09:07:34 +0000
Received: by outflank-mailman (input) for mailman id 1174585;
 Fri, 28 Nov 2025 09:07:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q4nf=6E=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vOuRx-00061p-LY
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 09:07:33 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a804a476-cc39-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 10:07:25 +0100 (CET)
Received: from DU7P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::30)
 by GVXPR08MB11320.eurprd08.prod.outlook.com (2603:10a6:150:2c2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 09:07:22 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::65) by DU7P195CA0025.outlook.office365.com
 (2603:10a6:10:54d::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.15 via Frontend Transport; Fri,
 28 Nov 2025 09:07:22 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 09:07:22 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AS2PR08MB9475.eurprd08.prod.outlook.com (2603:10a6:20b:5e8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.21; Fri, 28 Nov
 2025 09:06:19 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 09:06:19 +0000
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
X-Inumbo-ID: a804a476-cc39-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=w5GBWwdbuvUs/iR0sh3n4yGwYpSzJQHuqrpLJ5/ptjpQA7x0EM4AtGLJmDxNFuxj//WvwI0fxlX0RJsWf9/AwTudyYASC1ppzyy5ddX1mnsHoquOBJ/fx/M3+1REFtci9pvj5guuF8drHdh8+TmSZ/1M8Vdahm0HYgAzz8oP+jC2TfKNVql7dSbVlYIIQHWTyBVjjh20zawPr8IqO8EKdDMlJP+CNIu+q1nDrlRiudIdrtPKcQigwiKBimh3mYRqh/XRWgFZfjT53AMktfuqh8kldIT2WWKAJLROQkdBSIvk+lXymetJt0g1nOMm2iXTVzdMoP8AANswO58JGZEm7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYGvF0x+VBOoOZUwaZ0boKhDynIX3N7WZVxMr6qp7es=;
 b=qx1fkuTOBZXFFtlP0M9SQbn6codW6qWHlnRU91uSP7g2IDz6j4YTusb9Qob7l/bhHLz/9+2fUSRXHw1OOz6WjaZlt2kFX3puj764p3qCbaEamfHS9iKhLafrhw34CCAWHpo75Q6YSzps1iTWkTT6eqiM+tGFgTfyQ8h7IqGSWRYAFi7Ip7+A3gip4Nl8lmyMjGQRt3gVkrXKOK+FBSY3+NH/tM57wHz9ovQWCLSl8sWXxXcX8seicUl/6bHBTbvcNww9EnI6nusrZ8GEix6gLgaasd//KOwteAkOJVDWZ/x+Mwwlw0Hy1FZxc8VCgfjUfy2OvMZUs4zvzVTfeAoHGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYGvF0x+VBOoOZUwaZ0boKhDynIX3N7WZVxMr6qp7es=;
 b=kuMlFLxMzje2cvSeXnWQYRdbJZDGNUtpk3LsP+jtgeXpoS7mBnYSkEWh0/jNwodp7/nhdmRszvJfpeAoJoWvmrygej9b3mnMbH/E7CJeOzxIIhdCNz3igkWRjOmGppHx57z59C+aJ4SAIA3Vk345gFwBzI1akLlFg6OkXZVll6I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeLv+Noq2Y9ixeYb84fvGFEMtMm9ZOfuXqTsvmFcuUlKhwvLFPz/lM8Y53EvDG76KpWV32o3GIro1PoQcRfrVNymF9CjQ0kW7SAA0V3vt8x0pfxQzNuKRDLrs/e4KkM7+MTAb0ekb30fsg7RZER7D1nuJ9OcIQ7UMtv39nwuCn1kUZ6pfjP0hpdMaR58iv2U2FJrqPK1gUvm2ZTQdCsYeAxopISuEjlApQv6ZDd8WUfBxvsT0M8jSu1BmPZUiSLzRTXa6k7bXIUXkDvO0b1h7X10Sz8lOnP24jEMVoatcimFgUGLAVTrlxuAqG2pDaYbo2r0tWWt6pAeq/FXlcwbuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYGvF0x+VBOoOZUwaZ0boKhDynIX3N7WZVxMr6qp7es=;
 b=F/LhUoCNKiLgYYMOhuEq2/S/8c581KFbzPAslhnZoWRGwOA3n7edQgF3ratOzjjHPDfL7PBIL+vlw31rJO4QNeu04hAxSix35YlSW3uIHD0dpZQnjhXNdVf7U5h9VE85eUnkLAeluEIWAd4GtFOEvcukAdlaSIIFM7tWTXT4ht1F9ozoG+Z/HZrLC06susApeUyXiFgNjE4QQ2dM+3RuEvQAt5N1cmozyjUujTe61c0MP2ur0F6dCV7q+Dr8MRzdeTMW3ljQ6DoO5c8xA2vCDmd2oKVo35G6msnUyxvtf/Q8512Bz6edgOk6wkcl0aqQQU0rPGaaNdXqspHbLJQ4bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYGvF0x+VBOoOZUwaZ0boKhDynIX3N7WZVxMr6qp7es=;
 b=kuMlFLxMzje2cvSeXnWQYRdbJZDGNUtpk3LsP+jtgeXpoS7mBnYSkEWh0/jNwodp7/nhdmRszvJfpeAoJoWvmrygej9b3mnMbH/E7CJeOzxIIhdCNz3igkWRjOmGppHx57z59C+aJ4SAIA3Vk345gFwBzI1akLlFg6OkXZVll6I=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 2/2] xen/dom0less: move make_memory_node() to common
 code
Thread-Topic: [PATCH v2 2/2] xen/dom0less: move make_memory_node() to common
 code
Thread-Index: AQHcX7qlfbmHBnQ91k+D1QR6oggnHbUHzOoA
Date: Fri, 28 Nov 2025 09:06:19 +0000
Message-ID: <ECE56FA5-058A-4031-A4B3-74B3C2134A4A@arm.com>
References: <cover.1764260246.git.oleksii.kurochko@gmail.com>
 <dba41b3415313112a7612b5cfaf7ce0ee4a4a1ee.1764260246.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <dba41b3415313112a7612b5cfaf7ce0ee4a4a1ee.1764260246.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AS2PR08MB9475:EE_|DB5PEPF00014B89:EE_|GVXPR08MB11320:EE_
X-MS-Office365-Filtering-Correlation-Id: 44362f63-0e2e-416a-a3c5-08de2e5d8a77
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Q090SS9MVytzZGRRZjJhTmJSQ1cwRFQwTUNFNzBjU2x5L3BYYnFDOFVUOFVr?=
 =?utf-8?B?cmk0QVptUDlnQ0VOM1dJQmNTVTlTZWZRbUNPQXM2a2pOOUw1TVpuVURtaDJq?=
 =?utf-8?B?dDFHM2tZYmZmUDQ4VTY5dzZxN0dsTnV1eG1Yd3lCSnNUMVJpaUU1cGJSOGpp?=
 =?utf-8?B?NDZZMmVHMlZEVStLNE9ZUzdGNTN4WkZpcC9mYmQwWmtjRXhkSURlOElRMmcy?=
 =?utf-8?B?aHRvQ3BpaVpPbXhWS3B4aG9xd2JBaUxLOVNJOG1RRTkvUWRUMEw3NGVsRUxL?=
 =?utf-8?B?Y0FkZVFHYllJazFldzVLT1gzY0lnb2Nib1BTNmFLOUVQS21PQ2dEV1o0dTIz?=
 =?utf-8?B?MWVDTTl5dTVZcWxubjY2NU1mazZtTWRjSVMyT3p3L3JqTXVyOUphNkQyU3ZC?=
 =?utf-8?B?OTVwNDNPaXhZckVqcmovc1AvaXhUUnVHSVE4WkpwakdDZ0pITmZOckR6SDA0?=
 =?utf-8?B?RnMzNGgyaDU2b3lGM0wyY1VpWjFCVkc1T1NFbmorRDRVQWFhOVc0TE5qYkdl?=
 =?utf-8?B?MHpBdE1uZXk0S3ZoVjdKcmJ3UzBWekVGV2NjMmFKR2VCN0FkeUE4eFhTSlN3?=
 =?utf-8?B?Q2ljWDhVL3ZKM0JBaTZVMlZvU3V2ZlBUa2hYYmNlcTZzTFVranMxQ1lEcnlq?=
 =?utf-8?B?MTFGMm5iSnRUVnJqa1QyaHBEZnFrakdpQmhQcENwcGprV3RCQnRwWTBvM2RB?=
 =?utf-8?B?NE9lRnpzNk9pc3VIMnVyaWJZM3g2SmR1QjJEenRmeTc1ckVOMGtXMjFVUDQr?=
 =?utf-8?B?R3lRei9Ya3p1R2NvVTZ6eU52aUR3QlphMElUbEJtbHRBdkE3T0c5Y0I4Wlkz?=
 =?utf-8?B?YUJpSUU0cWZKVUxYU04rTHZ4OG93NTBnNUJxbU1WRkVHWCtmR2JadVhzTHZK?=
 =?utf-8?B?ck9Na2dDWmJRcitsdG8rdGtPR1IxbDNYNkdKZWlMTkNkWmR3UzBJb1k4YXZq?=
 =?utf-8?B?NlFOM1RSOHRsRHAwN3hrUCtVdmFYR3RoVWhyOEwydlZXbnUwMnlrcGlCdnNS?=
 =?utf-8?B?Q0dVdVNSQzB3am5QNjB0Uyt6Y0tOR0NweDdtSk13dDVlTDd6TUVtalgyV041?=
 =?utf-8?B?bW81VTN2K2ZNQTNCQngyUkpiUHpZNWdBS3AwczhzRXlNNVNzUEZtelZwUGVp?=
 =?utf-8?B?bW12YUNhTnltcTZqanppR2N0QVoxS1NMSU5MTDEyOEtsVVpBYzdhbjBEUHk2?=
 =?utf-8?B?NktNVjJrSjZWSldPaXJ0R2kxc3o4NENiS05Wa0lqME11QnpKR3ZEU0hRdWxU?=
 =?utf-8?B?ZzBHZEs4dExvSU5TOFArREc4RVZKeHQ5a1I0d25SYWUzQXh5WUtZZmVwSDFQ?=
 =?utf-8?B?eUszMnpBaTdyc0JyZGIyMUl0alUxM01semlqbnluZldJSURHclR4dUVZTkFj?=
 =?utf-8?B?MXZybTd6bFpFb3MzemZIbzg2RlFSdjVvVjE2UDErSDFEaFJzTElaSGR3VSs3?=
 =?utf-8?B?d1EyK2NncXcwcVpyMEw3Q0VIVlZhR0tWbldodFpLS2o2Q3FBdW0yMHB2T3RU?=
 =?utf-8?B?QVp3czlMTzNOSU1DUEl5UUZIQnRqT0R4MVhGNmkxaFMzYk5HNThPYzQ0K3dn?=
 =?utf-8?B?NENnaFFHSXBFOVJjbS9YZmZLOU9STzJ6UGtqODdQWDg0S05mZFFuamJoMDBB?=
 =?utf-8?B?VUpEUTB6d2FPdlF2LzFqdGk0MWw1M2JqRE5GNHkyZGx4bFpiRm02Mm1TamZi?=
 =?utf-8?B?czJyMDlLcnVnNVNuR1VLQUM1YnN0OWs2ekcvTGUvRjZTRVBHakJxdUx2MmVL?=
 =?utf-8?B?WlJjZ2diN3dtcGlNQ2Y0Q3E3amZxOHVORWZ3NVZRaWlZaklOZDNwbTJUNWVt?=
 =?utf-8?B?a0NuUTZSeFZjbGFuOWpzQ2F5QmhualNIY0h5QkFmb2VhMzREd0R5NDkxZ1lp?=
 =?utf-8?B?V3hlT0VpUnZ2WW1UTk5rbEtTcEhobExKb3VjVUd0Q2M1TlltaFh4U285ODNi?=
 =?utf-8?B?U0dGTXg3UG1yd0o5ODY1ekNhU2cvQUdGMkl6eXcwdDdXWnJDa3FRbldZbHJx?=
 =?utf-8?B?TUdteFlralkzTEp3N2p6TzZJbVFBb3huekw4VTdoRlQ4dVN6U2JWVXV5NDJH?=
 =?utf-8?Q?tLdQbK?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4D05F64DE34D745BF6C5ACC4ACE7360@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9475
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	963da70a-c53f-4b9b-792c-08de2e5d64db
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|36860700013|14060799003|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG9hY2pObEJLclU5QTc2R2tLRlhmd2d3Y2UwTHpPVU0yYjlQaE9Nbnc5MFRO?=
 =?utf-8?B?RUk2bWsxa0QreVRrYUlibGxUeHhyNHdtbW1lSEFvY1dRUHlwd1E4dUxTSGt4?=
 =?utf-8?B?d0NlZHY0SkoweXFlZTY4Wm8zYjFxVlhuMlVWS0ppU0txNEluQ0VZSVNZMEpC?=
 =?utf-8?B?c2xCSGM4MU9KcURyVTh5a3ZiRkVDaDI0QldQeEc1K2g1Z2VCdVBWaHlmWDh6?=
 =?utf-8?B?cE5DdlA3L3ZiYzVGVzc1Z1kvaGxlUXhRNTlzNk50eUFxSzRWY1cyemwwblg4?=
 =?utf-8?B?ZFNHL0VOZlkwdGhzdXNqbDBtREhYYnpiYkFKbHAzUXFxY0JNR1pacndmZ2hq?=
 =?utf-8?B?dW8zdlpMZS9JWXFEbmQ0MWsybG1WQnExSWNUVFU0UVRqSXZMSzVvRW1reDJv?=
 =?utf-8?B?anFKajdhMExMdmxmRjlmbXhZUGpZS3BaNE9FZFREblVNcWQxNVg5NlBCZU8y?=
 =?utf-8?B?OExDMVVOODJjVy8rd1dHZnJDOG1aRjdsSDA5Q3Fucy9keE5WRzFBcGV5ZG5C?=
 =?utf-8?B?aDMyWE9IRWNNaThBdnJLQmVCbnhZNjdHRnFqYXRMajVMV0g1d0FTbm1xQ0NX?=
 =?utf-8?B?MEtlV1A5NmE1RTRYdFhGNjN3UUlWMHJidnNVUzNMSEx1dmw1RmwrMmV6TVFB?=
 =?utf-8?B?QS9NMjNjcmp2RTY0ZzBmbGZsQUpUaG5rb1AwSVNvMjQxaTliajUyb1FoeWdC?=
 =?utf-8?B?SVJ2YnNDR1RINGVtWjg5M21BMmNZYnN2VlVjYmcxL3p2QzRjTU1tRkpYZTBp?=
 =?utf-8?B?Ly80T3BEdWNuZWsxK2lMUGpNSDhBM09GazNhVlVhRHYxQmVSRFV3RkwvZXR2?=
 =?utf-8?B?aEdlTFFPQnVjN3NKay9UMTlqMldnQm1WN2VTMmNLbmd0aXVtdCtEbTVwa2RJ?=
 =?utf-8?B?U2ZGbDlPeDc4VTBYajFienpOTXcxWjNtUW8vNjlTTjczN3BlVEVJSDRBQWUy?=
 =?utf-8?B?Z0szVm1GWGU1K1RFbkh5OTIxYUpLcVk3V3lpNmRJdHl6U3RWd05DVFVoQTda?=
 =?utf-8?B?TkRqWEpURlEyMzlYdUVxbm02cTFGc1gzbDVrTmg5RnlHOEFLbGVmTTZ5cGpM?=
 =?utf-8?B?KzdqRWQrTWprUmhYa3NMOE54TmEybkdZb2V2ZGx6eHZ4bytRV01xSjd3VE0y?=
 =?utf-8?B?YVF5Q2FLSnFrbFhmMDBEOUx2VWRESTdGeC9iMnF3MDlIMzdvVXVOQWFGM1dk?=
 =?utf-8?B?R0tWMWU1UVdCemVqdkdpVmFDdmVnZjljNThlVy9kRUM0RnpUcE5HTjlBRkRC?=
 =?utf-8?B?aldDZm5CY2hHTDIwNEJkT1pka21odlRFV1Y5MmMzL3ZHVFQwaXd6aDVKQ3pO?=
 =?utf-8?B?NTRLM21LQk5UTWJDQVJ3NHdpdkxNaEFLKy84cFNzck0vZXJuRXk4VmFNK2dN?=
 =?utf-8?B?OVBYdVRZNWNEWjdjM3ArejVvakpKOEJuem5QUFNmZjBSblp2K09PUWVBeWdF?=
 =?utf-8?B?TkNpY1Z0QkwrNXo1Qk1KSVc3Z2NEMDJia01yQ0VNUmZRNHVaenUwOU1BOWVI?=
 =?utf-8?B?R2g1aUUrc2Fwb3V2UmcrL0dnaS9hT1B2VGthTVEvZUhvM3EwTThhM1o2WkZy?=
 =?utf-8?B?bDN6V0RqUEl1Smk2eUFxWTFqRmVxdURXNS9kaVltYVNZRGY3bnMrb3cvNmdN?=
 =?utf-8?B?dVZxWU9BeldHNUVOWklXaHJwYzFhUFlrRU5KN2dFMGd0V0ZkV2d4VWM3U3Jj?=
 =?utf-8?B?NlYzN0hUUFpna3pHUzVUeUkwTDJWTkJMczJFWGY3c0pPR1ZRMFZXMkNuM1Y4?=
 =?utf-8?B?ZnUxRGkxdWlFR2pyWTgrM1RMc1oxTDFZdVdaWGV6SXBwOEllY24ycTdOS3FW?=
 =?utf-8?B?c2JDc2g4Q1NPWjZDd1JTY0F4N2kvT1duUXdlZ2g4OWRiQS9pdnZ5NW5SdUIz?=
 =?utf-8?B?RXdvS1RTZkdmUWtJVTJpSWhDMG1tYmZ5KzNocFlob0NBR3RlSDdtcWNGYTZR?=
 =?utf-8?B?N3hIWjJjTElSc2tmd0paSVBvUlhvN2RJRGdHNW9Lb0pSMU1HQ1J1Y2dXYitP?=
 =?utf-8?B?U1liWTl3Z1J6VkFrNDBLaHE3RFJycHVGWXRUdjkzNHF3UC9rN1ZlRjI2UVRo?=
 =?utf-8?B?b0hlcThZVlFIZ3NLVTRWWitocDZ2c1hTOTdDYTdCaTFGU29HWTArcEtsRkZi?=
 =?utf-8?Q?Jlrg=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(14060799003)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 09:07:22.2027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44362f63-0e2e-416a-a3c5-08de2e5d8a77
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11320

SGkgT2xla3NpaSwNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RldmljZS10cmVlL2Rv
bWFpbi1idWlsZC5jIGIveGVuL2NvbW1vbi9kZXZpY2UtdHJlZS9kb21haW4tYnVpbGQuYw0KPiBp
bmRleCA3NzQ3OTBhYWIzLi42NzA4YzlkZDY2IDEwMDY0NA0KPiAtLS0gYS94ZW4vY29tbW9uL2Rl
dmljZS10cmVlL2RvbWFpbi1idWlsZC5jDQo+ICsrKyBiL3hlbi9jb21tb24vZGV2aWNlLXRyZWUv
ZG9tYWluLWJ1aWxkLmMNCj4gQEAgLTgsNiArOCw3IEBADQo+ICNpbmNsdWRlIDx4ZW4vbW0uaD4N
Cj4gI2luY2x1ZGUgPHhlbi9zY2hlZC5oPg0KPiAjaW5jbHVkZSA8eGVuL3NpemVzLmg+DQo+ICsj
aW5jbHVkZSA8eGVuL3N0YXRpYy1zaG1lbS5oPg0KPiAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+
ICNpbmNsdWRlIDx4ZW4vdm1hcC5oPg0KPiANCj4gQEAgLTQ1MSw2ICs0NTIsODAgQEAgaW50IF9f
aW5pdCBtYWtlX2Nob3Nlbl9ub2RlKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pDQo+
ICAgIHJldHVybiByZXM7DQo+IH0NCj4gDQo+ICtpbnQgX19pbml0IG1ha2VfbWVtb3J5X25vZGUo
Y29uc3Qgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywgaW50IGFkZHJjZWxscywNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgc2l6ZWNlbGxzLCBjb25zdCBzdHJ1Y3QgbWVtYmFu
a3MgKm1lbSkNCj4gK3sNCj4gKyAgICB2b2lkICpmZHQgPSBraW5mby0+ZmR0Ow0KPiArICAgIHVu
c2lnbmVkIGludCBpOw0KPiArICAgIGludCByZXMsIHJlZ19zaXplID0gYWRkcmNlbGxzICsgc2l6
ZWNlbGxzOw0KPiArICAgIGludCBucl9jZWxscyA9IDA7DQo+ICsgICAgX19iZTMyIHJlZ1tEVF9N
RU1fTk9ERV9SRUdfUkFOR0VfU0laRV07DQo+ICsgICAgX19iZTMyICpjZWxsczsNCj4gKw0KPiAr
ICAgIGlmICggbWVtLT5ucl9iYW5rcyA9PSAwICkNCj4gKyAgICAgICAgcmV0dXJuIC1FTk9FTlQ7
DQo+ICsNCj4gKyAgICAvKiBmaW5kIHRoZSBmaXJzdCBtZW1vcnkgcmFuZ2UgdGhhdCBpcyByZXNl
cnZlZCBmb3IgZGV2aWNlIChvciBmaXJtd2FyZSkgKi8NCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8
IG1lbS0+bnJfYmFua3MgJiYNCj4gKyAgICAgICAgICAgICAgICAgKG1lbS0+YmFua1tpXS50eXBl
ICE9IE1FTUJBTktfREVGQVVMVCk7IGkrKyApDQo+ICsgICAgICAgIDsNCg0KTklUOiBtYXliZSB3
ZSBjYW4gZml4IHRoZSBjb2RlIHN0eWxlIGhlcmUsIG1haW50YWluZXJzIGNhbiBnaXZlIHRoZWly
IG9waW5pb24uDQoNCkNoYW5nZXMgbG9va3MgZ29vZCB0byBtZSwgSeKAmXZlIGFsc28gdGVzdGVk
IHJ1bm5pbmcgb24gYXJtNjQgYW5kIGFybTMyIEZWUDoNCg0KUmV2aWV3ZWQtYnk6IEx1Y2EgRmFu
Y2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NClRlc3RlZC1ieTogTHVjYSBGYW5jZWxsdSA8
bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KDQpDaGVlcnMsDQpMdWNhDQoNCg0K

