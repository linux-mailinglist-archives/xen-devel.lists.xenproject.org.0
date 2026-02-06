Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IeSF56ZhWmUDwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 08:34:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E2FB084
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 08:34:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222832.1530521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGLi-0007t3-91; Fri, 06 Feb 2026 07:33:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222832.1530521; Fri, 06 Feb 2026 07:33:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voGLi-0007ra-5J; Fri, 06 Feb 2026 07:33:54 +0000
Received: by outflank-mailman (input) for mailman id 1222832;
 Fri, 06 Feb 2026 07:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUCI=AK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1voGLh-0007rT-1L
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 07:33:53 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a918c38-032e-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 08:33:44 +0100 (CET)
Received: from AS9PR06CA0702.eurprd06.prod.outlook.com (2603:10a6:20b:49f::10)
 by DB9PR08MB8436.eurprd08.prod.outlook.com (2603:10a6:10:3d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 07:33:38 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:49f:cafe::57) by AS9PR06CA0702.outlook.office365.com
 (2603:10a6:20b:49f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 07:33:31 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 07:33:38 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com (2603:10a6:102:84::13)
 by DU2PR08MB10278.eurprd08.prod.outlook.com (2603:10a6:10:498::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 07:32:36 +0000
Received: from PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e]) by PR3PR08MB5593.eurprd08.prod.outlook.com
 ([fe80::aae1:6871:afc4:620e%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 07:32:35 +0000
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
X-Inumbo-ID: 2a918c38-032e-11f1-b161-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z3Urh8WXhS/b4cBCtOUFE8k70iWS+WGTCeL7RtgPBNR72qYMAN5pOyhNTFYKQ1MSSL0aq/nsFzGe87PatEVjgrOPykikrZffNhR8WtbGRsZi5kK/wuO7GrGYsgXOicXLWmixZzQoJsnY1+h8sh+fov14f5tffkKzvPQN4p/2AG1Y2qDaUMtkm+GwxpcGR88u9Y8PhXI63DV2XppfzxR7UBQK8l1DcB8FzUn1gMGsngE0xqQ7OIV7177qyx/zhMV3H46apYtfoFV95RevJq2/0R+UqYCdnYMNxqDmKm6DBe7Bt/bYnFC5+M787TIeioanylJhyQDMDsW6Beyjjfmq6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgjbS7Kv5LTkUZAlz7cUF/olh4GYFZmhnLy2cNrk3A4=;
 b=iG4CkeRXWQHXHUSzXn0+GqyRfB+W8gKsoQfqupHbcQCPvZOqu8qZxmJH8CNXP3dil5C+vMv6zKX4b1e1BA8V+b2MwOpJx9iYacXIdEHUUqBdQqTdb0wpTKsWp2Sw5xgUGXKOxlrxnnyBJjpgTwz4n67WITC51d70XI8kWr3PsU9WpyIl0QP41bx/ryJDPaDmVHOVsdO3xKJOVeP0D9EC8OGYimCQ1/d57GIddPAkg6ft6gTjFWhcBa+LXgAw8piUnNzljzlRp78IQNt9EhzKtwIvU26Dph0g/yE2AAnpb5nwFEhovOhE3xSNqcrBYOZpRmqJbk8fd4j8ZiWeyRVNnA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=citrix.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgjbS7Kv5LTkUZAlz7cUF/olh4GYFZmhnLy2cNrk3A4=;
 b=WX+stRx7j4XjMM+lfGjYGzjj07AmPdxx55DC2os8+CJz2Qy4S1kNSgDOE5cLXKCKczyZ6y2wKS3+ZJYZlTihTFedoQyzmkJ83I2cm9LUKwmK+l7xqk1XFk0gzMUV3DU6Q3aqwLj5dGR7mgmm86N4YBIeoiwz9Cb3tVXxmj9CIyY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwpoWEl8ekwycrUpZsKiwCs2toqKOKlCDlEkjnzYmZm38oOvXJFbgDgspc538nZQxmyAKVCXS+xDCnsMc3Lwjs4FnPO+e9sd30Z6Tzarg//e48GIVLxr365ReIgCn+mVbhyMKdt10yO2w9m8ug8kLZi2WDdAd7G9c1r3KZSxEyvTQIG+KXpfPiUdDZz7gQlh9Xhf6A6HEB010Qm+3JPTwv1kWscV5WrGrmhtC5lxy42xvPJBx0s+dtsUNhzZEy07XGyMevGuRYym+9uNYMjyF1yUw3DXxlYXVXtAO2aMwfTJvrUL3M17tQWA6YEEh3KDoGVKCegVjYs/Tl2K8ECWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgjbS7Kv5LTkUZAlz7cUF/olh4GYFZmhnLy2cNrk3A4=;
 b=IMhjx31c1FEpWu3EPuSdZ+Sh96MjUISArxcyZXCS4oJl+05caU3BYPvGwgjEcl1zHYl+jUApPgt9n8f6MAZhi/IQnSz4uj0FF7W9OtubTXySr+XH6IQOTOTfHFnn4JjxZFYZRnzaN+lrX6+e/ibsvTyoo/nyCDvd2q2pu0Wkjyc3rZr2mdyNF5DgdQqLgeiVch4ztSXc2JW//CQQwqvchKUXrvOsW31xEHxljhNymYZMvJPuLHgKuoT0NLldMKW+MBZHOBJTDkmoOJ2ZCl0O3w3wNjYUbQ166Ix0ybE9wTVYlGV7ZRaMjl5+Y+azXQAXohT7Gm6m1oIUHgb1gFFm4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IgjbS7Kv5LTkUZAlz7cUF/olh4GYFZmhnLy2cNrk3A4=;
 b=WX+stRx7j4XjMM+lfGjYGzjj07AmPdxx55DC2os8+CJz2Qy4S1kNSgDOE5cLXKCKczyZ6y2wKS3+ZJYZlTihTFedoQyzmkJ83I2cm9LUKwmK+l7xqk1XFk0gzMUV3DU6Q3aqwLj5dGR7mgmm86N4YBIeoiwz9Cb3tVXxmj9CIyY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Topic: [PATCH v2] xen: Add macOS hypervisor build configuration
Thread-Index: AQHclpNk83RtAc43+U+zvyNqPofiH7V0VocAgADxzIA=
Date: Fri, 6 Feb 2026 07:32:35 +0000
Message-ID: <DFD0D9C3-86A4-4124-8D63-451ADBCB8B3B@arm.com>
References:
 <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
 <aYTONBslOYwyrFqM@Mac.lan>
In-Reply-To: <aYTONBslOYwyrFqM@Mac.lan>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3864.300.41.1.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	PR3PR08MB5593:EE_|DU2PR08MB10278:EE_|AM2PEPF0001C710:EE_|DB9PR08MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b33007-61a9-4150-b1bc-08de65520b49
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|10070799003|1800799024|376014|366016|38070700021|7142099003;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WG03d3FCSzg3L3pld1ZlVVhZMGFncjN1dm9RdlJaeHhMWG1Sc0dzN25QY2JQ?=
 =?utf-8?B?S2E3bHdZNXRMcUx6d3loMm8yZTE2SmlINkFMU0lEWGFMQUtLcDVkQU85Ri9C?=
 =?utf-8?B?L1FyVUEwVkJPU0NqbXdRK1NmV0NwSytuZk5FZml2SkZVVEsyQlh5amxoelR2?=
 =?utf-8?B?dkJ3eVlpbjBFcVp0QUN3eTk1RU1FVjF0MkE5cjhXcFZWNTlleG80bmtkSEs2?=
 =?utf-8?B?VU1hNFFjNS8wVzRTcTJKZS9WTXptTnV4SGk3VXorbGlqTkl1MFdvSk5wS3k0?=
 =?utf-8?B?Z0NGd0NRNTg3aFl6ODVmeVFFc2NtM1VVUU54cTAyUGNLK2JPSktVcGpyNFdP?=
 =?utf-8?B?Y3ZMTGxJd1kyQVR1WkRvczBBQjdlK1JwNGhhL2tCeHl5cmcyUzc0dmJKU2tO?=
 =?utf-8?B?SE0xOFRJV2xwSHYzVlRpMnlrdVkzZVIyOVNRU3V1d1BEaEdUNTB0ZXdRQkZu?=
 =?utf-8?B?dHQ3MGVPWFdKdk00L1NKYTZLNUZQWkMrUzZCbktYcVkrUnlQMURDY0JqU3hG?=
 =?utf-8?B?bW43RGpqWGdaWGJzZkZBRWRKb1ViRGlpNXhuaUFKYjB5YTRXUkZwaktxWEIx?=
 =?utf-8?B?MTloZGV3WEluNHIyVkpTRXBpYlRLSUVPM3RIMXdwZkRCdysxTk5FTGZnYnZ4?=
 =?utf-8?B?ZGl6aFhjU3ZMbjB6aVZjZFdtbDg0VSs0NEE1dEhZdy9Md2VyR3ZRcGFzZEFY?=
 =?utf-8?B?V2FacGJxcHV6SEJ0OENZZWMvRml5aGhtcVRuV3F1bWtTSzArQ1ZTUmJoYmdu?=
 =?utf-8?B?V2NZNVZYMUtGeENhdEtzWFlPVVVuZGZMOWlPYktQdzZ2eXVvc3NvRzBzTkdF?=
 =?utf-8?B?YlkwZ0NIK2lYS1NURUpzWG9JWjlibG9pUkErZ0lPMkJsU3c3ZXZTNUM2UXZ0?=
 =?utf-8?B?WSsvaE9UcGFHUi9yWVAxVW1xejdZQnJVeFdTdVVMQjV1OHZuSHhRUkEzNHht?=
 =?utf-8?B?L2sxYjRvWFJDdjZxY0NVT0dMRXNUbTUyMXRKZ1JhRUxMd3NpaUN5V2Zkcjkr?=
 =?utf-8?B?U1hyL2liKzVNd2EwQ0VVOG5mR0Q5NmdHTmxRZ1lrVUY0MmhzekFzOHN1bG5R?=
 =?utf-8?B?SWpsYmtvS1E3R1pubVNLNnhVOEMwZlhnaXgzUzZDMXB3UGJhdmNMMTltbGJU?=
 =?utf-8?B?NWUrSUk0R2hud3dVR2dGMmxlYlJKZW5qMmNqRHFQSE52c0J4UitNUlNnaGtq?=
 =?utf-8?B?c2tQL0NNT1ZublRFak9UWlZBcnA1TE1tV0JTMUtSR3lpaXBENW92ejhzWTdL?=
 =?utf-8?B?WGFNeStmTVBoeVA1TmJDSndmM2k4YnNSdWJNMWFWbEFlZ0VteURubVNKbW5O?=
 =?utf-8?B?Vk1nODhxNXBXL0VmYXlTeVBwVDhiZzl2cS96dmQvb2MyMFNxdTF2RTc0OWpL?=
 =?utf-8?B?UFpheisxOW5lQ0VsVHJqV01CUXowU2NSU09oUVdVVi9mbzQvVTZKYTdZMmFw?=
 =?utf-8?B?U0NuNDNyS1VVdVlMMmNxMEo1VlM0bXVuTXg1U3pXWGQ0cmdKZVAzNEJtYjBy?=
 =?utf-8?B?NWJOQklCVXFPSFhrMXRMRmdDUzhNU2xkMlJGUGU3Z2haZXV6SnNoekEvdk0w?=
 =?utf-8?B?RUs2cHc1cFVOSWZ2bjhFbkhXMjJrbFg4YW1kSjRwRFk2MHQxallrcGxXbFVq?=
 =?utf-8?B?NUtlN2JhZFZhbXpxb2RnbUVIQUVJTElxaEFONnk5RkxVWmwxNnNIVTBGRUNN?=
 =?utf-8?B?Q1FGcmFhbnJhRmtTMGFVSTdqeWJzakhHeXl0UTBqU2dnK0xIUThOS1kveXNY?=
 =?utf-8?B?dmlVK2dVZ0kwdURVcnFUY0lMVU9MaFhJT3g5SU9PYkE1YVpMOSs4S0J4ZGs2?=
 =?utf-8?B?Uy9Da3NzNU9TTjk2cEhVYk42cUhUVllkbXZkYnR2NkZRdW5EYmhSTXVVRUN4?=
 =?utf-8?B?N0xYWVpzaGlaaHo0OUFEVzB6aHUya095RTEzc3pLcWU1dWZkRTZFaGNmbENI?=
 =?utf-8?B?d0Q5OFZkaTV3RndWK1JkY2JKNkRtOURraXoyNWg3cUMrcUZ2WGUzaUVUbWhy?=
 =?utf-8?B?U29UZzk1ZEtOSm81QmMxaXRGd25rYm9uV3lnc3gra0ZoeFlNc2ZVcklmNEF0?=
 =?utf-8?B?R3ZqNnJzSVN5emhjcjBxbSs5Vjdnem05ZXRvK1FaOFZRb0U0Z3kwK2F5MGRB?=
 =?utf-8?B?N3dyUXY3bkZpbU13ZFN1eWlmWmw0UkFoMXo3dHlic0ljb2NCSThMWjBoeWdi?=
 =?utf-8?Q?mjro/2DpzES+q8sEw/myer4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5593.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(38070700021)(7142099003);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <687C2B58BC22424284816F3CD9955A1C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10278
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0e12697e-a747-4c03-b203-08de6551e5e5
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|35042699022|376014|14060799003|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mysrbmt1c094RENFQUo3VW9aQWxIV1dwV3B0cU1lUjMrQ2FTVUxVMklua01x?=
 =?utf-8?B?SVhlclp3M3pIRVhxUWVOU3JTS2tDMExwSUpzS1B3WFNEVGxSYVU5NTNWWExS?=
 =?utf-8?B?em8vcEx6UWkvZ0dRUlY4VGhFaU9LSDN6cXBnQXJBQ0dLU3k3Wmg5dFhZTWl4?=
 =?utf-8?B?RExFdFp3YVdFV3AyVU5TL3BXRWdIdW1rYWswQXZRbUF6M21ab2Z6akQydyta?=
 =?utf-8?B?bkNLUll5UUdEa3laTmViaE9WOUVXaExWN3c4Tmlxc29BWmZuSXNqVVM1Yko0?=
 =?utf-8?B?Sm5DeXk0Wmp2TW8vRjBBeC9aT3BFSzI1RDNUcTFUWGlYQjRkR1NKL1RzamxY?=
 =?utf-8?B?dHRsQ1FVeVBXeFhrRGZncHUwTTdMeDJnNXdsM2l1YTlwQ01ZUHk4OTcwanAw?=
 =?utf-8?B?bkhTa0EwbHp6VS9xS1EzSUZzZVpDM0pwcFVpOHZZR3V2ejhxRUs1ZVZxWElp?=
 =?utf-8?B?MkJLaHVYM3N1VTl2MkFQcGpCRHZBb0I5ZFB2bGZqdDZsZG5yM2xXYytWL3V1?=
 =?utf-8?B?NzBMUEYxKyswck5Oc1JYTUk4YUdDTmI4YTR6d1dsM05TVnhyd2xtakFBN0RP?=
 =?utf-8?B?bXMxRWd0TnpyaGR6cndzOE5pWGQ4dGZHRC9GQ3NlQUY3dzFScnRlUVFGdlg2?=
 =?utf-8?B?Mkw4R2I5d0RtVGZrVDZLZjRDM2dacjJyYzJZM0RpMVR4ais5QTlzWlF3ci9W?=
 =?utf-8?B?SnZEczFMUW10ZGltejBtaE1QK1BNNEZBWUJPNWo3R3psOUd1Y0xMZlBteFpO?=
 =?utf-8?B?L1ErRzREdXUwM3RaT2tCL3NOSWh4QTAyOHpDVm5razU3aEY2U1JWWjhCeXB5?=
 =?utf-8?B?enVreVR6SGszWFRPWlQzbkgybXduVE52WFNIMUZvWGdPMXBUQlBtVUV2ZXpt?=
 =?utf-8?B?eTFiNEZhQmpQWkNyaDU4RHdJb2hTN285U2pUeVNpenVSeStCUHhHbEo4c09Q?=
 =?utf-8?B?cDBDNDA0R2hydUhwaklsQ3QrREtrOFZoRnFYUmVsRGpscHoyRXZJNlZZV0x6?=
 =?utf-8?B?NWNLRGo0ekdrMkpLb3FwRTYxZXFKNVpuM2hQeDROTDVwUERzYlo0QXg2OWJi?=
 =?utf-8?B?Y2hHbTJpdnkvNGJCRGJ6a0J4bmhtUjlBUyszUEZ4MHBRZEN2amdlTzZiSkVL?=
 =?utf-8?B?WngyZ3BsTHhXWFVROThZalFTQmFnTENXWWtGcmtNbWRHbXFvcUJ4RHMrQXpo?=
 =?utf-8?B?OHREMW9TODlrQ3NqWUhXeWtpblFsV2RsdFhEdkVNeExkNTdxTklSV3NlWEJR?=
 =?utf-8?B?dE41eEdua3BTV1pOT3dQRi9KUXd6aFpYUUdybTJUQVNpc1JLQ1BzWUM1V1VC?=
 =?utf-8?B?Q1VrODdKZUxBODFBNElFc1lPSTFWQnF3djJPdklLb0VGZ1NyMEhFNGRhSTAv?=
 =?utf-8?B?bTJzS2ltT2xkSkZkV29ZcVNOWXRYWk41RDJuN0ZmcVpMTFBoSDlwSHFBeVRk?=
 =?utf-8?B?TTVjUG9Mbjc0NGtGT2RhYTRaNVZIblRnWGRLMGpvYktSZ3Y0M3hVWVp3Qk9D?=
 =?utf-8?B?TzNpTG5adWJHNndSZHJKbGRzVlhkeEJ1dlU4MmZkWkE2V0lXSXhMcU1hQ3Ix?=
 =?utf-8?B?RklxMHVVbUlzK0tuSmZTdjBYaFoyTlh6b1NEZlhiYm0xMXJ1Q29VTVdDUUpp?=
 =?utf-8?B?ZEp1eTBPRUdaaFQySC9wbDduaWlOaEdROS81ZWJNSDJNbWdSV21QUEM1RXNK?=
 =?utf-8?B?OWFwTmcwNHpoZU5VWm04ZW5GZVRCVnlDNG05bTNvVlYzRmFkTXY4amU3ZHBu?=
 =?utf-8?B?UFFEMjA0WkJWK3hPbkduZHJaSjBtc3ZhaFVSVFg3bXJTbWVxUk9Oam9vWGo1?=
 =?utf-8?B?NHl0Z3g3bldkSDQ5TWJIc05CT2pXQUgwTDRIdm85MDM1OFdabW9WbGxuR0hl?=
 =?utf-8?B?dzlFT1BSZmd4bXp2cFd3QWtEcWx1aUlIRm9ka2lFOXkxNjdvSWFrd2xlYUxu?=
 =?utf-8?B?cUFQMStoRWJpUkZ1ckMvYmxEaFFQODNIMXByZlVqdHRkUXZiajl1RWxOdk1u?=
 =?utf-8?B?YXBENUVtM3RwOUpSWkpFbzgyd3hVRXR1R2lXOXI2Z1NFaFF1dVBiUFVrd3Y0?=
 =?utf-8?B?N05iaHE0eGkySUZWcElVejdVaUR6b2xNcXB2elNTUDJ5SmhoTXhCNjNySjRI?=
 =?utf-8?B?VTJycEpWNEJHUlpQMEduNXJCWlN3bE5GY2FEWmowMzdndmw4S25RcUZ3Mk5h?=
 =?utf-8?B?V0FaZ1NyN1RCUjdCU1ZVTFZ2VmRyVXlCVnZBemlhOTlQVVRnK0lMOVZRanVE?=
 =?utf-8?B?TGNBTCtzL095LzArTG5NSEFZZFV3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(35042699022)(376014)(14060799003)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qI2mCxmYSNclc0/Fx3HdStxBcpKvYDZ4QFSFigrYZl8PvPOzV+pIsavA0JiOJe9OdrPHvSUrkfRpe3XJMV/4YF2wERqF1oEVgUXpAoSwgXNYI9s1c6MfI4In5rLuT4Trgmv29XXtMRijtAdsJ3sTufCnL5lm9YRDB5QDEgjLkDeVKfVXhHm204S/WRck32jZx7A1dgxpMk2Y0c8sBtJG+UId2Q9kZORDYhAGYwEYxiSxys8R0BWPxPyHkm2pSgW1SM3dUh/x+afaRo1dR8vRvbZaClckjP+2NJU0x4ruVbAqdCEIuTr0MSq1rxik2TetM+1eUCucZAT3nkDg+WqYCvTQ/rwdcW5tSVNb8P7UhWvLzQ31jSrF4KyAR9rGTVPclAR/cgxRf6cJPnxVoJbF388UZzy7GowD9CzUO4CEtLkp2B5FUB5VkydluViEFiD3
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 07:33:38.3246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b33007-61a9-4150-b1bc-08de65520b49
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8436
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[Bertrand.Marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,arm.com:email,arm.com:dkim,arm.com:mid,darwin.mk:url];
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
X-Rspamd-Queue-Id: 741E2FB084
X-Rspamd-Action: no action

SGkgUm9nZXIsDQoNCj4gT24gNSBGZWIgMjAyNiwgYXQgMTg6MDcsIFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgRmViIDA1LCAyMDI2
IGF0IDEyOjMzOjU0UE0gKzAxMDAsIEJlcnRyYW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBYZW4gZG9l
cyBub3QgY3VycmVudGx5IGRvY3VtZW50IGhvdyB0byBidWlsZCB0aGUgaHlwZXJ2aXNvciBvbiBt
YWNPUywgYW5kDQo+PiB0aGVyZSBpcyBubyBEYXJ3aW4gY29uZmlndXJhdGlvbiBmb3Igc2VsZWN0
aW5nIGEgSG9tZWJyZXctYmFzZWQgR05VDQo+PiB0b29sY2hhaW4uIE5hdGl2ZSBidWlsZHMgYXJl
IG5vdCBzdXBwb3J0ZWQ7IHRoZSBoeXBlcnZpc29yIG11c3QgYmUNCj4+IGNyb3NzLWJ1aWx0IHdp
dGggYSBHTlUgdG9vbGNoYWluIGFuZCBHTlUgbWFrZS9zZWQuDQo+PiANCj4+IEFkZCBhIG1pbmlt
YWwgRGFyd2luLm1rIHdoaWNoIHNlbGVjdHMgdGhlIEdOVSB0b29sIGRlZmluaXRpb25zIHVzZWQg
YnkNCj4+IHRoZSBtYWNPUyB3b3JrZmxvdyBhbmQgcG9pbnQgdG8gdGhlIGJ1aWxkIGd1aWRlIGZv
ciByZXF1aXJlZCB0b29scyBhbmQNCj4+IHNldHVwLiBEb2N1bWVudCB0aGUgSG9tZWJyZXcgY3Jv
c3MgdG9vbGNoYWluIGFuZCBHTlUgdG9vbHMgbmVlZGVkIHRvDQo+PiBidWlsZCB0aGUgaHlwZXJ2
aXNvciBvbiBtYWNPUy4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogQmVydHJhbmQgTWFycXVpcyA8
YmVydHJhbmQubWFycXVpc0Bhcm0uY29tPg0KPj4gLS0tDQo+PiBjb25maWcvRGFyd2luLm1rICAg
ICAgICAgICAgfCAgNiArKysrDQo+PiBkb2NzL21pc2MvYnVpbGQtb24tbWFjb3MubWQgfCA2NiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+PiAyIGZpbGVzIGNoYW5nZWQs
IDcyIGluc2VydGlvbnMoKykNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWcvRGFyd2luLm1r
DQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9taXNjL2J1aWxkLW9uLW1hY29zLm1kDQo+PiAN
Cj4+IGRpZmYgLS1naXQgYS9jb25maWcvRGFyd2luLm1rIGIvY29uZmlnL0Rhcndpbi5taw0KPj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYTRlM2VmYTgxODQy
DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9jb25maWcvRGFyd2luLm1rDQo+PiBAQCAtMCww
ICsxLDYgQEANCj4+ICsjIFVzZSBHTlUgdG9vbCBkZWZpbml0aW9uczsgdGhlIG1hY09TIHdvcmtm
bG93IHJlbGllcyBvbiBIb21lYnJldyBHTlUgdG9vbHMuDQo+PiArIyBTZWUgZG9jcy9taXNjL2J1
aWxkLW9uLW1hY29zLm1kIGZvciByZXF1aXJlZCB0b29scyBhbmQgc2V0dXAuDQo+PiAraW5jbHVk
ZSAkKFhFTl9ST09UKS9jb25maWcvU3RkR05VLm1rDQo+PiArDQo+PiArIyBXZSBhcmUgYWx3YXlz
IGNyb3NzIGNvbXBpbGluZyBzbyBmYWtlIENPTVBJTEVfQVJDSA0KPj4gK1hFTl9DT01QSUxFX0FS
Q0ggPSBEYXJ3aW4NCj4+IGRpZmYgLS1naXQgYS9kb2NzL21pc2MvYnVpbGQtb24tbWFjb3MubWQg
Yi9kb2NzL21pc2MvYnVpbGQtb24tbWFjb3MubWQNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
PiBpbmRleCAwMDAwMDAwMDAwMDAuLjZiNTZjZDhlY2NhYg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4g
KysrIGIvZG9jcy9taXNjL2J1aWxkLW9uLW1hY29zLm1kDQo+PiBAQCAtMCwwICsxLDY2IEBADQo+
PiArIyBCdWlsZGluZyBYZW4gSHlwZXJ2aXNvciBvbiBtYWNPUw0KPj4gKw0KPj4gK1RoaXMgZ3Vp
ZGUgZXhwbGFpbnMgaG93IHRvIGNyb3NzLWNvbXBpbGUgdGhlIFhlbiBoeXBlcnZpc29yICh4ZW4N
Cj4+ICtzdWJkaXJlY3Rvcnkgb25seSkgb24gbWFjT1MuIFRoaXMgZG9lcyAqKm5vdCoqIGJ1aWxk
IHRoZSB0b29scy4NCj4gDQo+IE1vcmUgb24gdGhpcyBiZWxvdywgSSdtIG5vdCBzdXJlIEkgd291
bGQgY2FsbCBpdCBhICJjcm9zcy1jb21waWxlIi4NCj4gT25seSB3aGVuIGRvaW5nIHNvIGZyb20g
YSB4ODYgc2lsaWNvbiBNYWM/DQoNCkFzIEphbiBtZW50aW9uZWQgd2UgYXJlIG5vdCBidWlsZGlu
ZyBvbiBMaW51eCBzbyBpdCBjYW4gYmUgY29uc2lkZXJlZA0KY3Jvc3MgY29tcGlsaW5nLg0KDQo+
IA0KPj4gKyMjIFByZXJlcXVpc2l0ZXMNCj4+ICsNCj4+ICtJbnN0YWxsIHRoZSBmb2xsb3dpbmcg
cGFja2FnZXMgdXNpbmcgSG9tZWJyZXc6DQo+PiArDQo+PiArYGBgYmFzaA0KPj4gKyMgQ3Jvc3Mt
Y29tcGlsYXRpb24gdG9vbGNoYWluIGZvciBBUk02NA0KPj4gK2JyZXcgaW5zdGFsbCBhYXJjaDY0
LWVsZi1nY2MNCj4+ICsNCj4+ICsjIEdOVSB0b29scyAocmVxdWlyZWQgZm9yIGNvbXBhdGliaWxp
dHkpDQo+PiArYnJldyBpbnN0YWxsIG1ha2UgZ251LXNlZA0KPj4gK2BgYA0KPiANCj4gSW5zdGFs
bGluZyBtYWtlIC8gc2VkIGFyZSBub3Qgc3RyaWN0bHkgbmVlZGVkLg0KDQpBY2sNCg0KPiANCj4+
ICsNCj4+ICtIb21lYnJldyBpbnN0YWxscyB1bmRlciBgL29wdC9ob21lYnJld2Agb24gQXBwbGUg
U2lsaWNvbiBhbmQgYC91c3IvbG9jYWxgIG9uDQo+PiArSW50ZWwgTWFjcy4gQWRqdXN0IHBhdGhz
IGJlbG93IGFjY29yZGluZ2x5Lg0KPj4gKw0KPj4gKyMjIyBWZXJpZmljYXRpb24NCj4+ICsNCj4+
ICtWZXJpZnkgeW91ciBpbnN0YWxsYXRpb246DQo+PiArDQo+PiArYGBgYmFzaA0KPj4gKyMgQ2hl
Y2sgY3Jvc3MgY29tcGlsZXINCj4+ICthYXJjaDY0LWVsZi1nY2MgLS12ZXJzaW9uDQo+PiArDQo+
PiArIyBDaGVjayBHTlUgbWFrZSAoYWRqdXN0IHByZWZpeCBpZiBuZWVkZWQpDQo+PiArL29wdC9o
b21lYnJldy9vcHQvbWFrZS9saWJleGVjL2dudWJpbi9tYWtlIC0tdmVyc2lvbg0KPj4gKw0KPj4g
KyMgQ2hlY2sgR05VIHNlZCAoYWRqdXN0IHByZWZpeCBpZiBuZWVkZWQpDQo+PiArL29wdC9ob21l
YnJldy9vcHQvZ251LXNlZC9saWJleGVjL2dudWJpbi9zZWQgLS12ZXJzaW9uDQo+PiArYGBgDQo+
IA0KPiBDaGVja2luZyBmb3IgbWFrZSAvIHNlZCBjYW4gYmUgcmVtb3ZlZC4NCg0KQWNrDQoNCj4g
DQo+PiArDQo+PiArIyMgQnVpbGRpbmcgdGhlIEh5cGVydmlzb3INCj4+ICsNCj4+ICtTZXQgdXAg
R05VIHRvb2xzIGluIFBBVEggYW5kIGJ1aWxkOg0KPj4gKw0KPj4gK2BgYGJhc2gNCj4+ICsjIFNl
dCB1cCBHTlUgdG9vbHMgaW4gUEFUSCAoYWRqdXN0IHByZWZpeCBpZiBuZWVkZWQpDQo+PiArZXhw
b3J0IFBBVEg9Ii9vcHQvaG9tZWJyZXcvb3B0L2dudS1zZWQvbGliZXhlYy9nbnViaW46L29wdC9o
b21lYnJldy9vcHQvbWFrZS9saWJleGVjL2dudWJpbjokUEFUSCINCj4gDQo+IERvIHlvdSByZWFs
bHkgbmVlZCB0aGUgZ251YmluPyAgSSB0aGluayB0aGlzIHdhcyBvbmx5IGZvciBzZWQgLyBtYWtl
LA0KPiB3aGljaCBpcyBub3QgcmVhbGx5IG5lZWRlZC4NCg0KSSBkbyBub3QgbmVlZCBhbnl0aGlu
ZyBhbnltb3JlLCBqdXN0IHRoZSBjb21waWxlciAuLi4NCg0KPiANCj4+ICsNCj4+ICsjIEJ1aWxk
IFhlbiBoeXBlcnZpc29yIG9ubHkgKGluLXRyZWUpDQo+PiArY2QgeGVuLw0KPj4gK21ha2UgWEVO
X1RBUkdFVF9BUkNIPWFybTY0IENST1NTX0NPTVBJTEU9YWFyY2g2NC1lbGYtIEhPU1RDQz1nY2MN
Cj4+ICsNCj4+ICsjIE9wdGlvbmFsOiBvdXQtb2YtdHJlZSBidWlsZCBkaXJlY3RvcnkNCj4+ICsj
IG1ha2UgWEVOX1RBUkdFVF9BUkNIPWFybTY0IENST1NTX0NPTVBJTEU9YWFyY2g2NC1lbGYtIEhP
U1RDQz1nY2MgTz0kUFdEL2J1aWxkLW1hYw0KPj4gK2BgYA0KPj4gKw0KPj4gKyMjIEFyY2hpdGVj
dHVyZSBTdXBwb3J0DQo+PiArDQo+PiArQ3VycmVudGx5IHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVz
Og0KPj4gKw0KPj4gKy0gKipBUk02NCoqIChgYXJtNjRgKSAtIERlZmF1bHQsIHVzZXMgYGFhcmNo
NjQtZWxmLWdjY2ANCj4gDQo+IEl0IGNvdWxkIHBvc3NpYmx5IGFsc28gdXNlIHRoZSBsbHZtIHBh
Y2thZ2UgZnJvbSBob21lYnJldywgYnV0IEkgY2FuDQo+IGFkZCBsYXRlciBpZiBJIGdldCBzb21l
IHRpbWUgdG8gdGVzdC4NCg0KeWVzIC4uDQoNCj4gDQo+PiArDQo+PiArT3RoZXIgdGFyZ2V0cyBt
YXkgd29yayBpZiB0aGUgY29ycmVzcG9uZGluZyBjcm9zcyB0b29sY2hhaW4gaXMgaW5zdGFsbGVk
LA0KPj4gK2J1dCB0aGlzIGd1aWRlIGhhcyBvbmx5IGJlZW4gdGVzdGVkIG9uIEFSTTY0Lg0KPj4g
Kw0KPj4gKyMjIExpbWl0YXRpb25zDQo+PiArDQo+PiArLSAqKkh5cGVydmlzb3Igb25seSoqOiBU
aGlzIG9ubHkgYnVpbGRzIHRoZSBYZW4gaHlwZXJ2aXNvciwgbm90IHRoZSB0b29scw0KPj4gKy0g
KipDcm9zcy1jb21waWxhdGlvbiBvbmx5Kio6IE5hdGl2ZSBidWlsZHMgYXJlIG5vdCBzdXBwb3J0
ZWQNCj4gDQo+IFByb2JhYmx5IGEgbW9yZSBwaGlsb3NvcGhpY2FsIHF1ZXN0aW9uLCBidXQgaXMg
aXQgcmVhbGx5IGEgY3Jvc3MNCj4gY29tcGlsYXRpb24gaWYgSSdtIGJ1aWxkaW5nIGFuIGFybTY0
IFhlbiBvbiBBcHBsZSBhcm02NCBzaWxpY29uPw0KPiANCj4gU3VyZSwgaXQgbWlnaHQgdXNlIGEg
ZGlmZmVyZW50IHRvb2xjaGFpbiBmcm9tIG5hdGl2ZSwgYnV0IGl0J3Mgc3RpbGwgYQ0KPiAibmF0
aXZlIiBidWlsZCBmcm9tIGFuIGFyY2hpdGVjdHVyYWwgcGVyc3BlY3RpdmU/DQo+IA0KPj4gKy0g
KiptYWNPUy1zcGVjaWZpYyoqOiBJbnN0cnVjdGlvbnMgb3B0aW1pemVkIGZvciBtYWNPUyB3aXRo
IEhvbWVicmV3DQo+PiArLSAqKkdOVSB0b29scyByZXF1aXJlZCoqOiBOYXRpdmUgQlNEIHRvb2xz
IGFyZSBub3QgY29tcGF0aWJsZQ0KPiANCj4gVGhhdCBsYXN0IGl0ZW0gY2FuIGJlIHJlbW92ZWQu
DQoNCkF0IHRoZSBlbmQgYWxtb3N0IGV2ZXJ5dGhpbmcgY2FuIGJlIHJlbW92ZWQsIHRoZSBvbmx5
ICJtYWMgb3MiIHNwZWNpZmljDQppbnN0cnVjdGlvbiB3b3VsZCBiZSB0byBpbnN0YWxsIGdjYyB0
aHJvdWdoIGhvbWVicmV3IGJ1dCB0aGVyZSBhcmUgb3RoZXINCnNvbHV0aW9ucyAoY3Jvc3MtdG9v
bHMsIGxsdm0sIGRvd25sb2FkaW5nIGEgcHJlIGNvbXBpbGVkIGdjYywgY29tcGlsaW5nDQppdCB5
b3Vyc2VsZiwgLi4uLnlvdSBuYW1lIGl0KSBzbyB3aGF0IHdvdWxkIG9ubHkgcmVtYWluIGhlcmUg
d291bGQgYmUNCmluc3RydWN0aW9ucyBvbiBob3cgdG8gY29tcGlsZSB0aGUgaHlwZXJ2aXNvciB3
aGljaCBpcyBub3QgbWFjIG9zIHNwZWNpZmljLg0KDQpTbyBpIHdpbGwgcmVtb3ZlIHRoYXQgZmls
ZSBhbmQganVzdCBwdXNoIGEgc21hbGwgcGF0Y2ggYWRkaW5nIERhcndpbi5taw0Kd2l0aCBhbiB1
cGRhdGVkIGNvbW1lbnQuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4gVGhhbmtzLCBSb2dl
ci4NCg0KDQo=

