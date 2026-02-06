Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN4NIUyehWlKEAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 08:54:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF381FB258
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 08:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222852.1530541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGfY-0002v1-5O; Fri, 06 Feb 2026 07:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222852.1530541; Fri, 06 Feb 2026 07:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGfY-0002sy-1l; Fri, 06 Feb 2026 07:54:24 +0000
Received: by outflank-mailman (input) for mailman id 1222852;
 Fri, 06 Feb 2026 07:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1voGfW-0002ss-QR
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 07:54:22 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08962fbe-0331-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 08:54:15 +0100 (CET)
Received: from DB9PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:10:1d9::24)
 by DB9PR08MB11500.eurprd08.prod.outlook.com (2603:10a6:10:60b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 07:54:11 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::6d) by DB9PR02CA0019.outlook.office365.com
 (2603:10a6:10:1d9::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 07:53:52 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 07:54:10 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by PAWPR08MB10017.eurprd08.prod.outlook.com (2603:10a6:102:34e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 07:53:04 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 07:53:04 +0000
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
X-Inumbo-ID: 08962fbe-0331-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EJS7Ql0VXj7pFMWH1dParq+q1f81C6bEu2Vdfi0/zCO4x3a57mTMAA9YvHN0UdKW4l0Hs4f8pBwyyo1mXRpY31Bvw0vtBvtyoVvlIQrVQDNjw/FdLIX7igl5ZjN8Yl/AgMNZYdrU4xMQoENcRC54jVQhl391XqDEgifF6OKjMEM8PLVhpOVZVYItG688bOyzzbckd/iF9N0QyoIBIdTdW2u2gJHhMAnP03VYhM/L8g6rVnrRykUg3J+z+u/Uw9zd+Vkrh5RWt9vsWrMlvV1hWL4n8dvVEX2ek8qOlzvV8+c8uK4dJSmXLK3l091mu6Wfm5LFfp2f+ShcfLtXHbvLtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsIBgg5Jdm8OVT/O87Y/EymGpgNHjPl3oSkLoUgTdXc=;
 b=TjT/0d14QI4gR5qLA3cgiJp8HtnPomDzjYHLr41lGKGj9/b29Qy/g71Zh5y13Xuj895Vv+Nmd7uDNbIkxft4Yjy4QV/7twjldtYw1QotmW5JYlXNCjTyfT666J3wDk67CVKwf/ZH8huYU3NAfBnHVwJPXR1ZKuJ3JLG6irZTu0/mrv3JcIQw0GkrJdMt6xrfjF6Y5vVTFpVmERgnDZnKe7jvk22p9wXVhzFPpnMpKtvNSiUshZfb9AlX1oI/fFx3KyWJNA0CA1s0qHw/Z8IguHcVwXQoocbeHi4Vcmr/l7x1qfRgYhtmcsPfu4p+ngqWjnyqV4jM9jGm82FLuVFXwg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=suse.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsIBgg5Jdm8OVT/O87Y/EymGpgNHjPl3oSkLoUgTdXc=;
 b=IC1YGnliHJXveMA4yu0LHvdFpAqyitkVFF/qENdZ9gPBxoG45ZJEZZ2BnQgh9JvXcAAaWqnB5VO3LnBXYyOUSgKmsVTXp6Q1QrBQwgA4KfzYpxwf4vShXNPrl2aA2P3dZJqz0DEKXybcF4ENqMHEtkhlgbYOsEbydJrn1PsMJu8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLhBUNsrPCHdLtb4OGp67UAQEEIDY7RkGINTQ4Q7q9hl2hWUS4a5uYWJRnTjqh/3dw9jeLS7fBGvbZ0pv51vIzx3lyXTlQccn4Skn8N6LA6WTd92W4T7Gcehf86XGOyTXBf+l/EhjYC64PqU8vHynXE7yFcU6amZ4H4GPZhhdboDt9l2iSDv/fCShymC0dl68UMmYnaiOWE/pleHaTpe2vY45oUEskVw9ymbT5x6htiA5C9prlV5VxSAw1D1BgeM+IJSL5F6N0PLMI6qJJpEcg2T6G9xefoJeRf58UwCX1OiYYXBV0a62VyR5VnQl8B3avl2ohp5jECllUcjT5mjOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsIBgg5Jdm8OVT/O87Y/EymGpgNHjPl3oSkLoUgTdXc=;
 b=YRZoYiNs8k71T+ob4uzONLVX7HEYbO4KxFiFRQqkyx+lFKinkWI16wyhdr20tb/nDtXxAbcDwXYUG+iMbED6JS//GSveufgo3kx0tb3ulNYk5SLUy9jueuG6WYDq4KH3wkd/ojONFZdcwLmxluuEQBG0TCArJVusw4OdEU3rGOOwNplHe45RFq4gBZ94mZixioxw4A6Ps7wN8WGoLVF0/u6Wtui46XIALzuoEzkZrc8C0bm1jbmJYU2lK8EnT8QrDHQKIHS5kmDOmYrQp4DAMm/QzGO/SEg3ZCvX+u+XwcTkH4CojCgaOJbBBhZtPqHyaGraXWlfoGiwLlWf8QlVSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsIBgg5Jdm8OVT/O87Y/EymGpgNHjPl3oSkLoUgTdXc=;
 b=IC1YGnliHJXveMA4yu0LHvdFpAqyitkVFF/qENdZ9gPBxoG45ZJEZZ2BnQgh9JvXcAAaWqnB5VO3LnBXYyOUSgKmsVTXp6Q1QrBQwgA4KfzYpxwf4vShXNPrl2aA2P3dZJqz0DEKXybcF4ENqMHEtkhlgbYOsEbydJrn1PsMJu8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v1] xen: Use MFLAGS for silent-mode detection
Thread-Topic: [PATCH v1] xen: Use MFLAGS for silent-mode detection
Thread-Index: AQHclpNYPLhzf1Jy6UKGKEMKa2gWarVz/LiAgAAD8oCAAU1iAA==
Date: Fri, 6 Feb 2026 07:53:04 +0000
Message-ID: <F6E76E4B-1992-484E-8232-85696D3F23F0@arm.com>
References:
 <3ab39249c788fd0463e73df9464d482fefe8516b.1770290975.git.bertrand.marquis@arm.com>
 <1a0c5e48-5457-414e-89c8-0f12cfa55a96@suse.com>
 <2E85263B-38BC-49CB-80CD-3C30F37EFE4F@arm.com>
In-Reply-To: <2E85263B-38BC-49CB-80CD-3C30F37EFE4F@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|PAWPR08MB10017:EE_|DU6PEPF0000B61E:EE_|DB9PR08MB11500:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f835618-ad91-4ba6-f3e4-08de6554e9ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NGg2dFFCMjE3S0l2NUQ4SUtuZWNlakdyMGhMdnA4bUlnY2FMWGdaL0gxZkRl?=
 =?utf-8?B?cmtFMCtZeUQxbzJCZ0RYWk1qVzhaWkY3MG5kYkJ0SWpTTzh0b1ExZTBHSFhI?=
 =?utf-8?B?SXRRSFhiVjh4QUdDblFVTDJoYkJIbm5QTE5IdzhVL3Y3WEVPWE00ZzlsalRh?=
 =?utf-8?B?MnJGSFpRNllLTFZVd2JSNktRK3JPWGFJeEtPQlYxVmhadXFRazhLRStnU044?=
 =?utf-8?B?elJ5YTBOcU1iVmZ6cUp4WFFRTkpKbFE2Qy9YaU5YZ2o1eHMzSWN0SWtub2Zs?=
 =?utf-8?B?Q04vNk14enJmQjVuS2pGWTVoY1B3SEJZcStPcXJoVTFEdjk0SEpkVDh3cVBz?=
 =?utf-8?B?cTdTWElLQVZkc1FrK2lpdkMvN2hLWHhlanVxOG5QRFFhZ0hncXlHUldBQVNT?=
 =?utf-8?B?cGJoT2cyRDRxOGhLQXNPaFdQMFZiVTgra05BcVhzUHU0RllHQ2pUUWt6YzVW?=
 =?utf-8?B?M3VrNnhNYS9TcDFvYjJ6RXR1R2oxbDdsR043WTBuTTMwOHFxOTNsVVpkcFFZ?=
 =?utf-8?B?NzZpaSt2S3BhNHZmTkovNzV2WkVWdWwvWCtvak1EVkpRbUF4eU9QbnhpanJv?=
 =?utf-8?B?bFdncVBESWRscWwxVzhzMHhiblk1bWdJZWE4Qnd0L2srbGI3alAybWNwRitW?=
 =?utf-8?B?ZVNYTUtuWTVkTU1ieUxORndWWFNydDlOZktIWTBtV2hwRHJkSVZGbWFTM3hq?=
 =?utf-8?B?ampHK3J2TWNodVpRWVNKQStPS2dYMDJNakdUN0ppWmEyS1VMc3JsOTBzVVhn?=
 =?utf-8?B?V3VzbllhdGEyMmd1OElrQVRndzhWSnFKcVBRWWNYeHBhdW5xN0ZHVGQ0NC8r?=
 =?utf-8?B?MGVRTS9vVFZDb3NBV0FEV21sQWg0Vjd6anFFOG84Z1FydTl6Vk9OL2x2MjYy?=
 =?utf-8?B?ak44OXdHQUVpb1YxUmNjNkNsK2Q0dHJaeVVmcTJVVTl2ckM0Q3dlZ0ZKbEVy?=
 =?utf-8?B?NldiQmw0M04rcnBVRytKU2ptVmhxN1IxM1B5YUxCc3NQR1k3MUEzVXQzMDVK?=
 =?utf-8?B?ejNtTi9sdEN0ckxhMUV2ME5NTHJlWnRiSEZsbk9IcG1ETi9wN0xicFR6VnBR?=
 =?utf-8?B?eFlnMXFhMEczTmtXSW9tWFFQSjJaZzA1QWJLTHFzTW00b0N4ODArZ090a21v?=
 =?utf-8?B?TFRjUzZsWU1LUHpseTBPaGZMSVg1OHVHMTIxVEwyQTdQNTZ4SVpZbjRKT2Qv?=
 =?utf-8?B?RTBiWmRzRUhhaEx1S0xEemVKbk1TcUVBUU4vN1QyN09YTzhPMGFaMzduZENS?=
 =?utf-8?B?NTUvRC9yNEJyZTVvV2NBN2xJWnExMnBWRDZjaGoxWkE1Qyt1Y0o1enFCYXdj?=
 =?utf-8?B?VjBYbUZwbVhrOTgxWmVBOVBUYWpkRy9GTTVOU3ZmN0wzMGxNRGtUY3B1WkV5?=
 =?utf-8?B?cHFTVTNQcGcrWnNiM0duN1duSXdFWjA4c0R2QWVoamlHUGNsUmJkdGhhdFoz?=
 =?utf-8?B?bDNsNHVMallna2VXbzJKVUFnWDQ1Y0ZIczA5Ni9iRzZjVnNKelAyZngwbjBF?=
 =?utf-8?B?QkN3SDlHM003RjRITVc4a0JIZnJENHZoZDYvenpkZjE4QVA4RDNHeW9adE1T?=
 =?utf-8?B?OFRlOEFsdC9SNFNtTkt2NmxhMExNOTVuSzJzZ2I4bS9iblVoUE5wblB3RTQw?=
 =?utf-8?B?b2hJU3lIcW5nT0lINXpIdjdWVHFnV3FwNERDc0Vjaktic08wc3ByS0xVdGFF?=
 =?utf-8?B?SUFHM1g1WEZodWpIT3I3YWUzaTIvSmhrM2l6TUNRdmYzSlFLN1VZTlA4b1do?=
 =?utf-8?B?SjM3Y3NxeEkwT25hbGU4S3pnSlA3SFhLNS9vdDlkb2tSMXZoVGg5U1NIdE9T?=
 =?utf-8?B?VSsxRUdsRGYxTGZESkliT2dOTC9mZ056V2k4aVJDMWc0UXk4MmtJYnJ6bWVo?=
 =?utf-8?B?QklQVyt1SlpJZkJjWGVoVEJzUDAzWXBXY0pwZDZpMncrZzg5S011ZlVJNEda?=
 =?utf-8?B?SnFLK2VYSm54VTdVME9QRVdPNmNieEdUNFdicWRsalFwbEZSUXR0dVVQd0VE?=
 =?utf-8?B?c0JmR1dQdkljRzVRTVQyS0phLy9Md050MWZNNjcrZzRBeVdpNlZGS2F3ZVBL?=
 =?utf-8?B?TVEyanYwcXJ0a0pyNDkwaHR5UmY0ZG5pZlFqVENIVXNack82NDE3V0FJK0tF?=
 =?utf-8?B?b3FvaUQ5djFlb2VVL29JVGdTS0dXR25nV0lXZVMvRmJzQ21lNHcyRld6cGhR?=
 =?utf-8?Q?8oEJ+J7Kp4dm1hCM9LrFP0Y=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDF10735F2E0BE41B76C04AD39BFBC39@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10017
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c1fe55d0-d6c1-4b1c-6ee6-08de6554c233
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700013|376014|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVJMNDRHU202V3ArSU1vRS83Tmp6UmRJbzF0TmZySExUK2NLSmV0bXBGSDRC?=
 =?utf-8?B?K3FpSGM3eHhnWGtkZDZqTnE5Z0kxQWtyblExdTJpS2lvcDY1c25PNGYyWCtJ?=
 =?utf-8?B?aWtaWHA1eEpTSEQ0K04xSWF4dnVwc1JmRHFYRk5ZVnlDNWozZ2pvdjAvNVNX?=
 =?utf-8?B?UitaVkQ1YzZKek9ETlJFZXlmcDQrdUp2bEdnM2cwYUtLSlhOeml3aS9Xbk9x?=
 =?utf-8?B?d3o1eTRsVHIvYSsrcVByeHdrQmg0NXFHeGdaeUhmcWJ6K0o2RjVvRlhSK1dy?=
 =?utf-8?B?dzd0aGJDdDNxZFF2ZXBxMEFZa2QrTFhPWGREVCtqeXhKWGJETjBBVzM3TnNB?=
 =?utf-8?B?VlNoNERLaFhuamxoSC8ybmx2UDllYVpndWRIK3pCYjh5enp4RzJrUytQQlB2?=
 =?utf-8?B?YXV3R3ZqMlBnZEo5eGVJdy96eEpSeHk0U01mS1kvZkpxelo3U0Q5aFZ2K2I4?=
 =?utf-8?B?VjhMT1ZiWFFVRW8xcnlWMjg2WjZHdEdpYm9KQ1ZtRGxmY3lLejlkYzZQUHE3?=
 =?utf-8?B?Q0R5VW9sOXp5RkdCcnhHUVpuOERaZWR3VVl2ZExQcnVKMDFPZTQ5Vi93dnZY?=
 =?utf-8?B?bEpvUGtPYVRJcG5kVWJKR3VFZ3ZhcUo2MlVUVmxRM0RGelhRNEQxd05BOTlR?=
 =?utf-8?B?VTJLcG5INWlHcytzWERzQU9nRC9aeVR1dWRqWmZ2SHVaVFFaK0xmUFMzNnN4?=
 =?utf-8?B?R2t3MGtoQzVISk1MYm5PanpuRUd6eVo5SWNzdWVqalh5bE9LWjVpQlNkZ2dz?=
 =?utf-8?B?b3NvTEI2dG1sUFFJaG1HT0FEam9mVnN6elQwT1l2NjN1NE1mc2JFZUZuOTNZ?=
 =?utf-8?B?T2pRaFZHaGsxc0ZqUi9INVV5RFNFSWErMWhaVHZHQzJFS2dYaWM0a2Vmd2RV?=
 =?utf-8?B?NnY5cXhzRm5BZzJ4MnNvTTlVQk9oYXo5aGhZMGNUUkJVcEdoM1ErTmt6emZ2?=
 =?utf-8?B?TjhtZVZNOWFNTzRnUmFIY2ZzcllkNHR0V0h3cmJucjB2VnRLRUUrQUM0NjRi?=
 =?utf-8?B?L0RHbUFmckt0N2kyaHFGaGRtaG52OGJ0aUNUcGpWNktpdHpDR055bnVwaytV?=
 =?utf-8?B?NlJJQThvbFZkTFg4VmNXZlJNeVlncHlRLzI0TWJiMXJGNFV2dXB5OXpCaGpk?=
 =?utf-8?B?THVNUGxqMVlLaVFIaVg0T3dOSGhXLzZSNDU0aVdIYjdHdTlBZGZwWDczSmNU?=
 =?utf-8?B?dFFMTXZZK3RBemNSY0FYcnN2cXp0OHl1V2kzbGlyM0RtaFMvcEx5eDFvcWtE?=
 =?utf-8?B?SVBBR21BZnM0MDhkZCtQeHZyOHR2YlZkTkZ1SUUxMTR5cVVEdXFmVVM5MndC?=
 =?utf-8?B?MG03bndRcG5jQWhid21lWVVzRC91b1I0SGsvMEJSeUIwL215R0tOdFU4SkVq?=
 =?utf-8?B?NmtGUkpWKzNpTHZEcW5IUVpYTVNhbU9FVVF5UXB6SXd0Uis5WkEyZ2FIUU9L?=
 =?utf-8?B?UDl3TklsWDE3TFprZGsybmlTbVVsV0xMbXZQT1dZd1pzWUc2ekNZVHJpTWNU?=
 =?utf-8?B?bnd5Y1VKZm1LeWRtaGdxQk00UnhQZGltK1RPa0lqZGk2TFJ0dmNBNmJ2dWhu?=
 =?utf-8?B?VFdHeXdLWlNxWVh1U2NDRXkzZHkrSEZpYnVqN1dkTTZDT3hIVHlwTlozV0dw?=
 =?utf-8?B?c1B5dGlONUZKTUFNZnE4ZFMwckp0U2RVWWRVb1BBei94eXRvOW1LZUVFd2M1?=
 =?utf-8?B?V1lzOW5DOU83N1pNUDN2TWdsUk01WVR5Ky8zOUFVUzVaZ0FDL3JkMEd2M2tp?=
 =?utf-8?B?VjAxU3FVVmpUbjgvUlZNZW9JeUVyc0cwbFRBUkp6Y0pqeTQyVE1sc2VaQTM3?=
 =?utf-8?B?V1pmNUNFZ09kS1U4eXNQWExadS9lMW9NeEk0cWtSZmhwRDBQRUdDKzJRNU53?=
 =?utf-8?B?T0NMazNTazZqY1lZUHJmd0JSOG52QTJxck1sd0VqSHNIaGhlVmhOSG1vVVpz?=
 =?utf-8?B?YnZFWmJKNnZ5Y2FkaW91NjV4cGZ3bVlGNFhEZVlKeHRyTnJXNkJtbEFvWnVN?=
 =?utf-8?B?MkNOMkNNc3NsK2owSnlxUzNhd0JhYUZ2OGVNMzJrSEx3T2MzN3NHV253Sjkr?=
 =?utf-8?B?V0hhSTF6dmIyYWVrRjloUzVnS05CT0NkMHhmTmRMVzJNdFpsbUVhRWIyRWFK?=
 =?utf-8?B?aUtOVERFV1RQZ3pnSVdsZlZ6dVpKL054WVRLOHRUK0I3eXZrYzF2ZDcwTnZr?=
 =?utf-8?B?OUtoK1F3M2xsM1VJcjNpdEtxTWovUTdkRjJoSk5FVG9KWWhRU0FWcEJJYmth?=
 =?utf-8?B?N3VyeU5EbDFNak1WRzVwbTFxOE5BPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700013)(376014)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GSSgvWLTSx+XVvucSlUai8sbQeFZv/Y1gPju2FyDmtuLyoXvirrtjl98oUyk2chqQjpnH+yfCTYK8v4h0ssXC3jBGQhKsWgI+GprOT8q83dXM6u7jwIpQlUQ6xoZYgxR6Zbq4/Y/u4IrPyNX6NCxbaZxa8Qo3xwAytZ9xmnWrtKpypfjfGIMWLRAgpXSyyUigA1Y5Dh6YO8XNhD7jbqvuouKj+wn+al4wH8a27AAbtkQr0zfBlxyNCDaNGrydmRRwcDd/izT4Ex+l/9LC62/szcnCGmvsK+QMA7MTRkpNPxIzbuafUNrjUSSfhW6f2AU5hW91YcPW8GoDGjETEJpiD2kXMmBD0yev+oaeOUviv0dRXlW/qOCO5K46BNMFQ7I1zg+mITZtgKwkS+mYQ6njycXbTr1oVGSrdtvASJ3lCoHNuKE+cY5Y4Y28shJon+N
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 07:54:10.8154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f835618-ad91-4ba6-f3e4-08de6554e9ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11500
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,arm.com:email,arm.com:dkim,arm.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: CF381FB258
X-Rspamd-Action: no action

SGkgSmFuLA0KDQo+IE9uIDUgRmViIDIwMjYsIGF0IDEyOjU5LCBCZXJ0cmFuZCBNYXJxdWlzIDxC
ZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSGkgSmFuLA0KPiANCj4+IE9u
IDUgRmViIDIwMjYsIGF0IDEyOjQ1LCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdy
b3RlOg0KPj4gDQo+PiBPbiAwNS4wMi4yMDI2IDEyOjMzLCBCZXJ0cmFuZCBNYXJxdWlzIHdyb3Rl
Og0KPj4+IEdOVSBtYWtlIDQuNCsgZXhwb3NlcyB2YXJpYWJsZSBvdmVycmlkZXMgaW4gTUFLRUZM
QUdTIGFmdGVyICItLSIgKGUuZy4NCj4+PiBPPS9wYXRoLCBGT089YmFyKS4gVGhlIHNpbGVudC1t
b2RlIGNoZWNrIHNlYXJjaGVzIGZvciAicyIgYW5kIGNhbiBtYXRjaA0KPj4+IGFuIG92ZXJyaWRl
IHZhbHVlLCBmb3JjaW5nIHNpbGVudCBvdXRwdXQgZXZlbiB3aXRob3V0IC1zLg0KPj4+IA0KPj4+
IFVzZSBNRkxBR1MgZm9yIHNob3J0IG9wdGlvbnMgYW5kIGZpbHRlciBvdXQgYW55IGxvbmcgb3B0
aW9ucyBiZWZvcmUNCj4+PiBzZWFyY2hpbmcgZm9yICJzIi4gVGhpcyBwcmVzZXJ2ZXMgLXMgZGV0
ZWN0aW9uIHdoaWxlIGF2b2lkaW5nIGZhbHNlDQo+Pj4gcG9zaXRpdmVzIGZyb20gb3ZlcnJpZGVz
Lg0KPj4+IA0KPj4+IEZpeGVzOiA0ZmRiNGI3MWIxNTIgKCJ4ZW4vYnVpbGQ6IGludHJvZHVjZSBp
Zl9jaGFuZ2VkIGFuZCBpZl9jaGFuZ2VkX3J1bGUiKQ0KPj4gDQo+PiBJIGRvbid0IHRoaW5rIHRo
aXMgaXMgcXVpdGUgcmlnaHQ6IG1ha2UgNC40IHBvc3QtZGF0ZXMgdGhhdCBjb21taXQgYnkgYWJv
dXQNCj4+IDIuNSB5ZWFycy4NCj4gDQo+IFRydWUsIHdlIGNhbiByZW1vdmUgdGhlIGZpeGVzIHRh
Zy4NCj4gDQo+PiANCj4+PiANCj4+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxi
ZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+PiANCj4+IE5pdDogTm8gYmxhbmsgbGluZXMgYmV0
d2VlbiB0YWdzLCBwbGVhc2UuDQo+IA0KPiBBY2sNCj4gDQo+PiANCj4+PiAtLS0gYS94ZW4vTWFr
ZWZpbGUNCj4+PiArKysgYi94ZW4vTWFrZWZpbGUNCj4+PiBAQCAtMTEzLDEwICsxMTMsMTEgQEAg
ZWxzZQ0KPj4+ICAgIFEgOj0gQA0KPj4+IGVuZGlmDQo+Pj4gDQo+Pj4gLSMgSWYgdGhlIHVzZXIg
aXMgcnVubmluZyBtYWtlIC1zIChzaWxlbnQgbW9kZSksIHN1cHByZXNzIGVjaG9pbmcgb2YNCj4+
PiAtIyBjb21tYW5kcw0KPj4+IC0NCj4+PiAtaWZuZXEgKCQoZmluZHN0cmluZyBzLCQoZmlsdGVy
LW91dCAtLSUsJChNQUtFRkxBR1MpKSksKQ0KPj4+ICsjIElmIHRoZSB1c2VyIGlzIHJ1bm5pbmcg
bWFrZSAtcyAoc2lsZW50IG1vZGUpLCBzdXBwcmVzcyBlY2hvaW5nIG9mIGNvbW1hbmRzLg0KPj4+
ICsjIFVzZSBNRkxBR1MgKHNob3J0IG9wdGlvbnMgb25seSkuIE1BS0VGTEFHUyBtYXkgaW5jbHVk
ZSB2YXJpYWJsZSBvdmVycmlkZXMNCj4+IA0KPj4gV2h5ICJzaG9ydCBvcHRpb25zIG9ubHkiPyBJ
dCBsb29rcyB5b3UgbWVhbiB0byBkZXNjcmliZSB0aGUgbWFjcm8gaGVyZSwgbm90DQo+PiB3aGF0
J3MgZG9uZSBpbiB0aGUgaWZlcSgpOyBhdCB0aGUgdmVyeSBsZWFzdCBpdCBjYW4gYmUgcmVhZCBi
b3RoIHdheXMuDQo+IA0KPiBUcnVlIHNob3VsZCBiZS4NCj4gRmlsdGVyIHNob3J0IG9wdGlvbnMg
ZnJvbSBNRkxBR1MuDQo+IA0KPj4gDQo+Pj4gKyMgYWZ0ZXIg4oCcLS3igJ0gKEdOVSBtYWtlIGdy
ZWF0ZXIgdGhhbiA0LjQpLCB3aGljaCBjYW4gY29udGFpbiBhbiDigJxz4oCdIGFuZCBmYWxzZWx5
DQo+PiANCj4+IDQuNCBhbmQgbmV3ZXIgcmVhbGx5LCBhcyA0LjQgaXRzZWxmIGlzIGluY2x1ZGVk
IGluIHRoZSBhZmZlY3RlZCByYW5nZS4gSSdtDQo+PiBub3QgcXVpdGUgc3VyZSBhbnl3YXkgd2hl
dGhlciB0aGUgY29tbWVudCByZWFsbHkgbmVlZHMgdG8gZ28gdGhpcyBmYXIuIFRoaXMNCj4+IGtp
bmQgb2YgZGV0YWlsIGNhbiBiZSBoYWQgZnJvbSB0aGUgY29tbWl0IG1lc3NhZ2Ugb2YgdGhpcyBj
aGFuZ2UsIGlmIG5lZWRlZC4NCj4+IA0KPj4gSGFwcHkgdG8gbWFrZSBhZGp1c3RtZW50cyB3aGls
ZSBjb21taXR0aW5nLCB5ZXQgSSdtIG5vdCBzdXJlIHdoZXRoZXIgeW91DQo+PiBhZ3JlZSBpbiBh
bGwgcmVnYXJkcy4NCj4gDQo+IEFncmVlLg0KPiANCj4gSWYgeW91IGFncmVlIGFuZCBjYW4gZG8g
dGhhdCBvbiBjb21taXQsIGkgd291bGQganVzdCBwdXQ6DQo+IA0KPiBGaWx0ZXIgc2hvcnQgb3B0
aW9ucyBmcm9tIE1GTEFHUyBhcyBNQUtFRkxBR1MgbWF5IGluY2x1ZGUgdmFyaWFibGUgb3ZlcnJp
ZGVzLg0KDQpBcmUgeW91IG9rIHRvIGdpdmUgYSByZXZpZXdlZC1ieSBhbmQgZG8gdGhlIGNoYW5n
ZXMgb24gY29tbWl0IG9yIGRvIHlvdSB3YW50IG1lIHRvDQpwdXNoIGEgdjIgd2l0aCB0aG9zZSBm
aXhlcyA/DQoNCkNoZWVycw0KQmVydHJhbmQNCg0K

