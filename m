Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D776BCC1E5B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:59:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187805.1509139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRpD-0003OE-3y; Tue, 16 Dec 2025 09:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187805.1509139; Tue, 16 Dec 2025 09:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVRpD-0003Mn-0Y; Tue, 16 Dec 2025 09:58:35 +0000
Received: by outflank-mailman (input) for mailman id 1187805;
 Tue, 16 Dec 2025 09:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zuqr=6W=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vVRpB-0003MB-IB
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:58:33 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c780dbc7-da65-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 10:58:32 +0100 (CET)
Received: from DUZPR01CA0289.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::20) by DB9PR08MB6619.eurprd08.prod.outlook.com
 (2603:10a6:10:257::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:58:29 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::b0) by DUZPR01CA0289.outlook.office365.com
 (2603:10a6:10:4b7::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 09:58:41 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Tue, 16 Dec 2025 09:58:29 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by AM9PR08MB6257.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 09:57:26 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::5d34:206f:373:a323%6]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 09:57:26 +0000
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
X-Inumbo-ID: c780dbc7-da65-11f0-b15b-2bf370ae4941
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h2FPB82m1u4u7FSjE+ZxwcZGI1KHXxJdsYeMPicQJIMoNdkZ0DgcYayhPbiDflMD5WVryfXQrXIoEOuasgllLFSPMH3Dt3ZGTbvXbwQr+5+71qnb3VYvzOfJPLP9/MT/h3TmKgC8ZVJVZXSk7GJvtNCAarCE2/YmVa+yAMEOivd9Tn6mUGjnP2d1CcdQcixk+EUgEnX9PBsyhxj6FV5g5iwmytUC5ZItsIzqNDioxNC68vUXjUHAdDsmnb6sqTtNeGSrI3SurVShkmtqg4xELCPt/oTXwvul8Ny/kOmeTD9H8cZymbIPmeMSJCckpaYxY+g1S5/85PeIaya2hzStjA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1bmVrLVopNDImED7cXFe6GHn6MJWyZPipjvJyan0Wo=;
 b=YvckqS0WBbdaACrrjRQQnaKdGuIf9Qh6bnk4iABzLJ/AWUmZ9bCoTJsIxai5XkKp5mOXQ8Sw4FOEbJd3aoNTDEN4UxEEuIFhI66HsV/deTdyN86MkFhLWP23EdNhLpFuK6DtCpbwD6mTdaKD7JHAfPibV8n5F1pw5OPPF2ZNkgCC1LRq/Zek0L8sgtNqlFd8kCMOHkQYOfd8NuiW70g7vLvXJL482TcJ/2Dfz3ibb5yiSvLnEqHA7cVBbRl8EGlRxVWrEchZtYfYSpcMHeu+nAIs8cahs9OHBDyLghIHPYfwnOl5lt4YIgDlX2rqmse+Ba2tPm6FBjSjXGHNRWssjw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1bmVrLVopNDImED7cXFe6GHn6MJWyZPipjvJyan0Wo=;
 b=OA7RSpMe4Re98A3cterN4XTmCU+YXwwn65NfpkhQT7rYwD4HCkyY82CzYPH2pwokIwoRG7gSbKqQQcOKHQsWmLHr8d+p7OvmnrXZCUIJbm0fDWJVQXMcgcwh0/bT0lCH6l7yWXvIBNMHFSqrOzLObvwz7PsbOwGC3mlI/II3ujM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwuRb5v+9WrsViFeV1iPwA905jvaqj9rui9RpYwKribVbKc5hUwswns1Fu0kHRnIxFRN8pOvLDHHQwZj7+IrD69wJU9/Xq2E6xknbTWtec+kZ1wvw7vDryIICjWXxAkPf4iyjRo977HA5Nhch2N5iW3gW9wq9HBTTTPHLKOinembcT0uWdZ0ryyFNClr4GovI3AHErutL+7nzCtExkGzhwiPg6E8ktoI1UNSUzMmMzbDxESTiCLGAjNaamAlToGPsXiQGBPmPfyx6qIEp2yWb1IRjB3rE/QF7AOwzJmYvwi0ASdBCOOH7tzdpR1Gr0oJ0IVOmR7vBKBsexOPM95FdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1bmVrLVopNDImED7cXFe6GHn6MJWyZPipjvJyan0Wo=;
 b=wk1v+Vite67Kzi+IuSk51DKTC3Ae8GxmfK98cLdoirbuw+IZYwMC3wSfyEYG9DOuyseA3Qn5LmWlnUVdy4dqnI3dDNtv6mxxqpH9PJFdu/Mgq6UC49X4ifHdvMl8vq/OpGAX9ZYk2z47tMEfrMMJTMVW/uS4Focd/r9MZUGJfD2YixQD6CTeOyONL6GKifC5wrSwWLk0RDVdCPQixnq6yRyGGHmOpXvQ6nKsrqK53ZE0MH1EQB7B+e2icaGD+4SVSqLY32oGqoQUECot/u3SKXUI9ehFMAzdMBRj2yOFUMtxyLSMulZeecfXze0LllJAtP41AaJtMHrbgoGOqgYRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1bmVrLVopNDImED7cXFe6GHn6MJWyZPipjvJyan0Wo=;
 b=OA7RSpMe4Re98A3cterN4XTmCU+YXwwn65NfpkhQT7rYwD4HCkyY82CzYPH2pwokIwoRG7gSbKqQQcOKHQsWmLHr8d+p7OvmnrXZCUIJbm0fDWJVQXMcgcwh0/bT0lCH6l7yWXvIBNMHFSqrOzLObvwz7PsbOwGC3mlI/II3ujM=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: Harry Ramsey <Harry.Ramsey@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Penny Zheng <Penny.Zheng@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH 6/6] arm/mpu: Map domain page in AArch64 MPU systems
Thread-Topic: [PATCH 6/6] arm/mpu: Map domain page in AArch64 MPU systems
Thread-Index: AQHcbm4YR0/90zis5Uafj3gh5AdGL7Uj/+kAgAAA9gCAAAbjgA==
Date: Tue, 16 Dec 2025 09:57:25 +0000
Message-ID: <3907164B-3808-4A8C-A86E-F7D9CF8F1221@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
 <20251128095859.11264-7-harry.ramsey@arm.com>
 <4c3f8be6-2525-4387-9dc4-b5dfdbf41a77@amd.com>
 <CC6759B6-0341-4E8E-A038-7B50B22FFD89@arm.com>
 <53055cb0-c71f-4134-9ca2-359d96f438ca@amd.com>
In-Reply-To: <53055cb0-c71f-4134-9ca2-359d96f438ca@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|AM9PR08MB6257:EE_|DU2PEPF00028D09:EE_|DB9PR08MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 229551c7-aeeb-4e46-e2c5-08de3c89a9ec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cTExM3ZLaVBFbTNGSUJRVWRvLzM5OVkrZlpUMllmakZmRzZOUjltcjlsQnZq?=
 =?utf-8?B?ZkdOZTl4VVZLUUdoQU1kRHhyNUpUS2FkbTBjYzJucWVQMGFTOXdTQ0x5T3Yr?=
 =?utf-8?B?Ky93UUtXQUY0ZlJUb2J0SVdnOGJwTUxYbFIzejh0ZGdtNDVPbDNlV3FmRXlP?=
 =?utf-8?B?cnVZdklkMXlhVnIwdXJKZER5clFyNlBKaVpCbkluY0t6NWRYMzlKeGROMTJU?=
 =?utf-8?B?aW1xcHhHa1NTSW1neFBFUm5oa2ZzQkczY0VhNFZ1UDZCM0dVQ2dQOTMzWWhH?=
 =?utf-8?B?czdBdUIxUEVidzlWQklCVWk4SUFnSlIyc1FkZGNKenhRa0o1VFVvRDgxeEoy?=
 =?utf-8?B?cGpqMkhEem9ZTUoxbS9OWndKM0JMVFdwZUhrVk9uWElIMDMxMk9JUVRtV1V5?=
 =?utf-8?B?WS9iZ3oxdTFxbWZpQStKdEFWTWJ3NFZMY1g0bHpuZEgrbkcyZHBGWjIwbVdr?=
 =?utf-8?B?YVdvS2Z2UXJHVEI0OGVnM1h1Q0lveUxHVENhQ3F0V05GY0ZGdVEySU1TL3Nt?=
 =?utf-8?B?RGlDNWJhdFlrSVlIMW1DMkZDYmhGc2tiMjl5c2tmNGN2RmdmVVY3eXVNZVdk?=
 =?utf-8?B?Z05GZktPVWk0OGZ4RzNISG80UklxU0FjWXVBcWVzZmVMMFZnTnBDSWd5RUQy?=
 =?utf-8?B?NGxhbUZLNUx3T0RjcjdpamxFYlNiVHUvTVdFOCt5VlFzQVMzRWQ2NzNkNVZS?=
 =?utf-8?B?ZUdzSXRkZithSG9OaWhoNWluZFMzTCtOcGpGTEYvbnRmTUp0QlN3eTNBaGZs?=
 =?utf-8?B?cy9CVllTU1N6azhHZDNLalNwNEV0VWxKV2JmSnJTZS9LU0RiM0hIMnorV3VL?=
 =?utf-8?B?bHZLZlpjd1d6YWVha3ZrcG9jT3BLb2d6QjdUZXJDOWJOUTVjdnVzMVFDWWNj?=
 =?utf-8?B?cnFsL2pBRHU0bXFndWMzQlAydzEvNXV4TXMvM0ZZUlhDN29TUVVjUktodlh2?=
 =?utf-8?B?aHlvVmRnMmtKZFRmWUFqbEpHbE9RSThLUmg0RkQyL2VpOGwrTW1Yb1JHaTJt?=
 =?utf-8?B?Y2VMUmpTUU9rUDNJQ29QamVPSHhCd0xIQWdabXpRS1dUUWpQV20yVTVZWlJx?=
 =?utf-8?B?bnNNR3JMS3M1ak56UGpRaEc3cmZZUUl5bHBwNlQ5WGNUVHJ0NUhvcTZ2TzFo?=
 =?utf-8?B?WWxOYTJBYVdleWt2bWx0cDRTK1BNZWNRT0RRcEhLSHU3bHpGamtoRGlKQjRn?=
 =?utf-8?B?S2NtTkxJWTFrdEs1ZFB4WktRRlpCNFI3aEJMbUt1TVB3YkpscDA3NllFUTVY?=
 =?utf-8?B?L2JKQmJJK3AxSXpMU1VuTWRoTUltUHRCdGxubEhMeWJpSWpDQXlPVkNmcVBM?=
 =?utf-8?B?N0pzTVk5M2Y5dG5XaEJtakxuWTVLYkU4d1UyN3plWkhqbkhLN1FLVzRMd1R5?=
 =?utf-8?B?NHZUSU1HUW9NRU9lbURVRitMelVXa0lLNkpKSjBjVTllNnNkQzk0V2tCQ1I5?=
 =?utf-8?B?b3orSS9iMVVsR1V4cXlyZG1FZUVGY3NydGJ4MXNnSTJUYkVob0JtTVZUa0hN?=
 =?utf-8?B?VlpvU2R0ZVFETXlwSlpUd1NQRnQvbzhEOG5SdEZEcHdudFJXYWNhQ09zaUlQ?=
 =?utf-8?B?VkpXbVRzMUVIbmlpaS95ZkIwcTRWWGNTeDRIL0ZZVkFoZlU5WUQ5eDdIM05G?=
 =?utf-8?B?NmJMaUh3aWpEb0xaL3pqMm11d05IOVQwd2RZSmZDblhILzNPa3RLSUszeVlr?=
 =?utf-8?B?Uy9FQktVdStPUTFwa2pmQW9KMDNHWDZVeWVqdWhoNEwzZmJjMm02a0EzazBG?=
 =?utf-8?B?NEpPNmN2aW5wbUtvT2U5ZzlpRGdxYzcwWVVOMDJuNFd4WVhsRWYyOUt1MDV0?=
 =?utf-8?B?cmRubE5tZThaQS91UVpVa0lkVUNDRmtGRVNhOU1ZbHo5YmdmdC9YRUFtNnh0?=
 =?utf-8?B?UERzRVZ0NVhUS0tFbzYwZ1A2TjhsY1c1QnF6ZE1Ca21FZDBKNGhsRVlIOVpF?=
 =?utf-8?B?YmQxRUJrKzIwazl4ek92QzZTaVdiVWRadDVvZVE0cmFWS2o2ZHQzT1V6bkp5?=
 =?utf-8?B?Ui9HSzNaTFQ5QkY1RThnQkNCYzE0S0hiZ1FhN0hVS0UwSmN1NXNudTJUYWg3?=
 =?utf-8?Q?vr6+v2?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1B56ED2C7DEF1F428733D7800BDBD15D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6257
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9e1ee472-cdca-4544-65e6-08de3c89843f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|14060799003|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wlo0a1RTOE4vRGRkcTBpNmM4a0hBdTZBYThxci9qNm9LRnorS05NS2YvTi9T?=
 =?utf-8?B?dHRCQkRLejQ3OVVBMHFUZWRpTXZlQVU3QU5kSFF0NFlWamx3NTZUaWR0R1Rh?=
 =?utf-8?B?NmFhWCtiOG4zTG5ENjZFWTByMGo3WkVnQ1BCRzVJdUh2eW1uaGNQY2tZdVh4?=
 =?utf-8?B?bmFHVStsbkZ0QjN0NmxJRzRkYlFwa3lsSWhvclpXMzFsQlV6RUgxdm9BdE1W?=
 =?utf-8?B?RlJRYzFjZTgwWTNzY0oxdEdQSFZYVkdUU25oZ3hvNkt0UWs5QjhlczFJV0pl?=
 =?utf-8?B?b01obmdpTjZ6Q1lLVHRaeUNpcTNsYW9FbjhQMlVSS21ieitLSTQ5WkZ1TUdq?=
 =?utf-8?B?TG1VeHVET3M3eHI2OUlMSTBYemxYZnMrbXZkc2dKQi8yTWxxNDVVOEZuV3Fh?=
 =?utf-8?B?Rm1Bc0xqdWtwYTliaUZZUktlR2NVU1hWN0ZQaTZYeExZQUt4VzNCd0R0dDFG?=
 =?utf-8?B?YlZpZEpLTG9RaUR2d3c2WURuWkpnQTJpc2tnR2liSC95cWpINCt4R2dmMUhr?=
 =?utf-8?B?K3o0d28yZzlGSFF0OUpQci9ybCtZNXhENmFYV0xVRkJpMlZNK2k0Y3d4bklG?=
 =?utf-8?B?WU1JTTFKaDFNVXN5NjBRaGwxYnQ4cVdLUmU2cWxybkl4aDJLbUZINUJNNkJs?=
 =?utf-8?B?bzFteWQ3T0FNSXVMUXU3KzJDL2JMZThxRktJVWRRUzRXZmx0N1BUS1MxK3p6?=
 =?utf-8?B?MjBFY1lHS3JOaC96Qi9NZ1ZIYkx1d2o3LzBOanRUcmsvSUU2UDhXTXR6SWtl?=
 =?utf-8?B?WEwrOUE2WS9nUVBiQUxaWkIyMndzZnFFQnl0S0s0ZWNFbks2RmtaRG5zNXR4?=
 =?utf-8?B?Z1BrdXQwQTRJaUtIbDhIWWk2bTRrd2Fid2N1amdLL0o5WERGNHMrd0R6VUlh?=
 =?utf-8?B?R0o1WStvOERPVjAxYnM3Yjkvdmh6cng2MGRvQkk0NDVHcldBWVg2SVFGK2Ux?=
 =?utf-8?B?bGtGK05La0hwUXhaRzFlRmlPbnR3SFI5STZvd2xURFBKK3dsd3pWbkxsWXBM?=
 =?utf-8?B?RCtWY2hDQ3dXbStFQmhSdmdTQTIxYkxzNHgrZDhQVStXalNNM05OMDVFS0tT?=
 =?utf-8?B?UTYvWURES3IwVmRWaDlNVXVxdWVpZzBmYm5DOGJYR2FJNHBZWGMrS2VMVGlQ?=
 =?utf-8?B?VHNEcXBJWDVpU2ZYczNlS2I4UmJrYVllVUlIWEpISVBHWWsxOVlVU3lnVU9X?=
 =?utf-8?B?dmlNem1UZU1lVGNZTEs4STZpU3dZUnNmcFhzeE9PWWxmdDBqRVB0cmVxaWxm?=
 =?utf-8?B?dHo5cFdaWUFxY2sxOXR4VXp6aVZUYUlPbE9COGwzTzFDSFVMMjBIK3hKZzNJ?=
 =?utf-8?B?eXJOWU5WWUR0SEZuV0xPcWJGVWNrQi81bVdNZ3M4NUxaenNNZ1RxVWVic085?=
 =?utf-8?B?K0l5WHNWL0pkazkrT1dBdTczQVZpTVFZVVo4aGxlUmZRcm5TL25ETUZBbkVU?=
 =?utf-8?B?bzNNL203V0NMSWlDSEVYZGlwQ1ZlclFCb3pRNUw5V1pZMmpCbzNWeXA5OXpx?=
 =?utf-8?B?Y2Y2MjhYcU0wYjVCVFhhd1diNmdMdXNzWEw5Q1h6VnphUEg0bFd3dStNZHlV?=
 =?utf-8?B?YnpKWStNclphS1ZYYWNtMXlsS3puMUFsK2dKU3NFdXdPNFRuTlU1L0xJNFZz?=
 =?utf-8?B?OGg3Z2EzRFhCZGFLc0QybE9CT2RxdERIWnU4QzJhNWtsQ09NbGRVVzA5VWxT?=
 =?utf-8?B?SGVKdy90RDU5aVVTRzEzY0NCcDdiSzZCQmhmQm5yR1grOXBHKzFIZ3kzeW9V?=
 =?utf-8?B?WkJpYk5nNzV3L0FSNjRSSytVbUVwM1F6eU96L1M4Q1BaYzZjSkoxODZoMjVD?=
 =?utf-8?B?RzZEMmZvSjAwalc0ZW14Yk9rdEdkNkduWDhOUUZEb0VNVDRsWVRGeWtxNDAw?=
 =?utf-8?B?eVNGYlVCeTdpR0dOZlNCeXRlQnpCcXkvcU1rUkRZVHVOS2tIU3Nxc3hjUWVP?=
 =?utf-8?B?MVBRVnRTYkdDVXg0VUp3a09XK0tVOTI5M1QzYXp0alErN3JrUlQrUU8vdEZZ?=
 =?utf-8?B?UHNpTWJjdFJYa1hXWVNSZ3M0d21vWmtmTVpIZVJZUlErdHVTR3FhVW9xUExp?=
 =?utf-8?B?QkVrbXNGdng2MmFJdFVyQkZUUVoydmt2V1V3YnMxZ1VqRHd2U3h6RFQ2Z1N2?=
 =?utf-8?Q?BQdQ=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(14060799003)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 09:58:29.1268
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 229551c7-aeeb-4e46-e2c5-08de3c89a9ec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6619

DQoNCj4gT24gMTYgRGVjIDIwMjUsIGF0IDA5OjMyLCBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6
ZWxAYW1kLmNvbT4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDE2LzEyLzIwMjUgMTA6MjksIEx1
Y2EgRmFuY2VsbHUgd3JvdGU6DQo+PiBIaSBNaWNoYWVsLA0KPj4gDQo+Pj4gT24gMTYgRGVjIDIw
MjUsIGF0IDA5OjI2LCBPcnplbCwgTWljaGFsIDxNaWNoYWwuT3J6ZWxAYW1kLmNvbT4gd3JvdGU6
DQo+Pj4gDQo+Pj4gDQo+Pj4gDQo+Pj4gT24gMjgvMTEvMjAyNSAxMDo1OCwgSGFycnkgUmFtc2V5
IHdyb3RlOg0KPj4+PiBGcm9tOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4+
Pj4gDQo+Pj4+IEluIE1QVSBzeXN0ZW1zLCB3ZSBpbXBsZW1lbnQgbWFwX2RvbWFpbl9wYWdlKCkv
dW5tYXBfZG9tYWluX3BhZ2UoKQ0KPj4+PiB0aHJvdWdoIG1hcHBpbmcgdGhlIGRvbWFpbiBwYWdl
IHdpdGggYSBNUFUgcmVnaW9uIG9uIGRlbWFuZC4NCj4+PiBXaGF0IHByZXZlbnRzIHlvdSBmcm9t
IGltcGxlbWVudGluZyB0aGUgcmVtYWluaW5nIGZldyBoZWxwZXJzPw0KPj4gDQo+PiBPbmx5IHRo
ZSBmYWN0IHRoYXQgdGhleSBhcmUgbm90IHVzZWQgYXQgdGhpcyBzdGFnZSwgb3RoZXJ3aXNlIHdl
IHdvdWxkIGhhdmUgc2Vlbg0KPj4gYSBwYW5pYyB3aGlsZSBydW5uaW5nIExpbnV4Lg0KPiBTdXJl
IGJ1dCBpdCBsb29rcyBsaWtlIHRoYXQgdGhleSB3b3VsZCBhbHNvIGJlIGEgZmV3LWxpbmVycyBo
ZW5jZSB0aGVyZSBpcyBhDQo+IGZlZWxpbmcgdGhhdCB0aGV5IGNvdWxkIGFsbCBiZSBkb25lIGlu
IG9uZSBnbyBmb3IgY29tcGxldGVuZXNzIHNha2UuDQoNCnllYWggYnV0IHdlIGRvbuKAmXQgaGF2
ZSB0aGUgY29uZmlkZW5jZSBpdCB3b3JrcyBiZWNhdXNlIHdlIGNhbuKAmXQgdGVzdA0KDQpDaGVl
cnMsDQpMdWNhDQoNCg==

