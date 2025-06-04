Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C172CACE4BB
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jun 2025 21:21:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1005876.1385214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMtfE-0003E3-DP; Wed, 04 Jun 2025 19:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1005876.1385214; Wed, 04 Jun 2025 19:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMtfE-0003BI-AB; Wed, 04 Jun 2025 19:20:40 +0000
Received: by outflank-mailman (input) for mailman id 1005876;
 Wed, 04 Jun 2025 19:20:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fx5t=YT=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uMtfC-0003B9-Bd
 for xen-devel@lists.xenproject.org; Wed, 04 Jun 2025 19:20:38 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2060d.outbound.protection.outlook.com
 [2a01:111:f403:260e::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd0aa8f3-4178-11f0-b894-0df219b8e170;
 Wed, 04 Jun 2025 21:20:35 +0200 (CEST)
Received: from DUZPR01CA0320.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::16) by DBBPR08MB10795.eurprd08.prod.outlook.com
 (2603:10a6:10:530::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 19:20:31 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::51) by DUZPR01CA0320.outlook.office365.com
 (2603:10a6:10:4ba::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.24 via Frontend Transport; Wed,
 4 Jun 2025 19:20:24 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29 via
 Frontend Transport; Wed, 4 Jun 2025 19:20:31 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS4PR08MB8093.eurprd08.prod.outlook.com (2603:10a6:20b:588::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 19:19:58 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 19:19:57 +0000
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
X-Inumbo-ID: fd0aa8f3-4178-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WG1B6sKKOr4nEaaTjTkD3pvXcNh6GNDHE9Ojsf6PMM5uImZmO+kguAxbV2i0+OFvRCWqHEMCKa3WmXVYQfkFFuAtzykVqlTVV+xdRHyvjryPZKN5UxULXC7192C8s+H2wvQZL2LXZphQCK9XaYw5RFrVO+WYE3865WPOMgml2FqHm2TJXSPZ5Tjje08qG64Ngi22XRzEbFDnhikOnYVLYFe8fSui/fZBISV9DCV5/T4fF//zZ4YAvUeW0FkAzEWOsrVPqgOr8n/pqi/qszuquy1hI9dmBnJS7nIha2JbI+M0zmJeHT5bwC14ZRbWH4CYH/WJEc5PP+IAc6enXWp9pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtDwB5a4jaBk8/cJ+Rk3+5Pv6Jo34HQdVBLkmcHrKuQ=;
 b=dcJAF8mJxTHR6vOHxc4WiJ2NWJ9+A/Kqc8j1ikswRvPi6Lu3rWq0c4vNP1gy7uFpZPI3PJcaEpQ6f8apCw16+iW2pVcKmiL4AhVDS/s9udQJx2K9vAlf0yxpnZLvayb9Cn5A6PZIsbkKinXe+4CuLCcWkbQoVoQ2RP+sJPoYdkuV6W+RtawRWJc5LVsbfjfOB3BhS6ATz7C15ALQn+wHTIDUUrvqPXIYxH+/ydsWpaR+c65lVFbyOZ4XByMGGehatWB+FJ1myZ10/yVHJF+K9L2R0xfrkzj9GQwLfCpzV3pHrS2i68JW6fsM3LTbcC7Z7ChBMkU1/x3tfWTf/YFd/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtDwB5a4jaBk8/cJ+Rk3+5Pv6Jo34HQdVBLkmcHrKuQ=;
 b=GFwGKYhMSnIddUf/Zkh64MxQPagZnIbUnKEWiIuMiTIOGapO9mt20tn0CqHKl8Ld8xSbSSR10NKi9bZJLsrElcmSoxGggfcJvgTQbzaqqoSkgHjE4Z83I36AbbMrwK7MtmWOtnEb7GczFo79HnBO0r7q3SkGP7LvxYk5+wf2RNc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t9hXFK9dAqq2sA4EPlB5XxtX0OQRQGJnhiI1CtX+QVb5sZANOqWhDd/5HwyNCYry/9EQ6ylZgzLGeAoBScmhje30zy1GOTEGW/dfpqKBNZGRKoCH4/V5WDePn+PXUxSK7wYO4MfPV1xxjcYYu45Eyht8nYZ0fK04NIl5W5rA+P97Qxrv0d2suDAy2dlLR4hJ2tnX38ArnHHNTj/O4hmcRyvH+qG9W/Q4jdj2KTglPPaCz/in0loZFBGsZXshWbZmoZ12+Y6wOtdzaKjVTI3MffhCH48UtvQ33/Fn6u9nVyzeSzh/3HIaY/s8VhFXQZBDa+K4wY+yGtTb/dBEgOjPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtDwB5a4jaBk8/cJ+Rk3+5Pv6Jo34HQdVBLkmcHrKuQ=;
 b=NZcNUPedAlCkpfAqk4Q91Cc7U6rabhU8NCJOKeTqsoE7AH4kN+j5Uc6+dZWyt9XiIqAWLfeSEk7wiEgIT8GyV4aZhFGc7ZXEvEVygz145d/IjnZKkRkHoBxC7bfMO54dlh43BBjSvC2wJ4MRcnz9wQdg2YTdxciwEZaz63z1eqqK3iEOro9pGdZMHHPUOqCuIMNpgkpRtdQH5bT8SFXsvKy9CEnkZy8FO1yKnpZeGpnddzpwadIwOcXeqR+aa2nqgU7ZNMmE+xhTKpMi5sZQGb7q85Ug1D1TeBV3AIlul/nAUZ639FJIE6CiJfup5KZA68ke3RX6shYp9EtjjusLXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtDwB5a4jaBk8/cJ+Rk3+5Pv6Jo34HQdVBLkmcHrKuQ=;
 b=GFwGKYhMSnIddUf/Zkh64MxQPagZnIbUnKEWiIuMiTIOGapO9mt20tn0CqHKl8Ld8xSbSSR10NKi9bZJLsrElcmSoxGggfcJvgTQbzaqqoSkgHjE4Z83I36AbbMrwK7MtmWOtnEb7GczFo79HnBO0r7q3SkGP7LvxYk5+wf2RNc=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map structure
Thread-Topic: [PATCH v1 1/3] arm/mpu: Introduce MPU memory region map
 structure
Thread-Index: AQHb1XhE+9uzMCRJ9UO6OgGmjkgLx7PzYDyA
Date: Wed, 4 Jun 2025 19:19:57 +0000
Message-ID: <154A0263-6E4D-4855-9408-ED31F45B293F@arm.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-2-ayan.kumar.halder@amd.com>
In-Reply-To: <20250604174311.754899-2-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS4PR08MB8093:EE_|DU6PEPF00009526:EE_|DBBPR08MB10795:EE_
X-MS-Office365-Filtering-Correlation-Id: 62c83304-c3e6-4df2-b285-08dda39cdf35
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Y0FUWVZKNHhBVTdNQTcrRFJVc3BZNzk0dlJtblQzODNsTEM4Yy9qOGpkd3cw?=
 =?utf-8?B?OVZEVFV0WHBaNVJlMTJ5N2xEQUord3hzQ0pTNUJDKzJ5cUdiUVVYdzhYMHc5?=
 =?utf-8?B?dDV4TkFBUzgrbks1WjluT2lZK2V4RzhCLzh1dGdFRlRoTWRkelcxRUVoeU5G?=
 =?utf-8?B?WlJuNG9OR3VoUzdkVStFakRZT0NzdGUyQjhnNVpseE1TeXArUkhwamU3WXRB?=
 =?utf-8?B?Vk1SMW5mZEE4c0ZzZ0ZRSjF2YWN6djhOTTVpRERsWnpRbnlmSjNLNVN6NGNp?=
 =?utf-8?B?OW53QVh3Qi8wQ1doMHo0eU1CLzJrMlY1amJxWW5QNEVQRGFkaVpqeWFmUVVC?=
 =?utf-8?B?UWZYblhaWkNOSVI1TkJ5R3JEN2cxQzBwZ0xFejM0bWFKTndVMGZwbU45Ujkx?=
 =?utf-8?B?R1NjOUFNdGY4VWUwRU43MXNrN1p0NWg0UWNsUDVnVzd6eUN6V0krZE14VDd6?=
 =?utf-8?B?c1N4M2tFc1U2SWNyL2Y4RFUrWUdrMnhES1ZPVDRMcWhhRUV0YnlwWVhnb2NT?=
 =?utf-8?B?cGVLVXVRTVdNMDhqWThCb3BmQ0tVSndRZG9PN2FjSFlXeFR4dVdhdTl1eGJi?=
 =?utf-8?B?VDRYbExQQnJhRTVjR0NuQXcrZVAxNUVuYVI3RmdrQ0g0cnlyc2VOejVKbnh1?=
 =?utf-8?B?T1VrMk45c2pCU1ovZFFFLzFoOUNHVnlLNExudDY4M1V2Ty9LMk5iMjBPaU9E?=
 =?utf-8?B?aGdrTnhoYWx4WVZLN2J2dCsxYU56TUVSazlsWGF0K01NSWNsSmhxU0hxTHpP?=
 =?utf-8?B?QS85djZDMjlwbDB6MVJmNGtIeHZ6SThFeUtkMGk1cTFnVjExeDgrTVFQOEd6?=
 =?utf-8?B?azZTT3hRZkgrKzdLOHJDa3ZlRHlnS2NZNDdReXJ4QjRuZkxCcThhNDBFSy8x?=
 =?utf-8?B?T21QZ2duZ2d6cnBjRU5HNVhjMlNuSnR3aWVDZHB1T1o0SDR5Y1RPT3RBbVJW?=
 =?utf-8?B?RWFmeDlmbWpEMTJmb1VVL0tOQ1c4dVdsdDIvQmhpZ25URVVMV1oxTERCaDk0?=
 =?utf-8?B?VUJibXQ3SWpkUzhqRTRGdVRiOG0vM1llRkFFS21pMG1ndzMvRDBoWkhPNlFK?=
 =?utf-8?B?clEvaVk3YkVIT3VPV1I0RnVMUGt6RW1SREtQK29QWDVTYitTZmZjMHRrRGRQ?=
 =?utf-8?B?OHl5VmtzdjBEeHkvbEZjc2RjOS93NHF4Ny9pZ3kwS01GT25VWHIvMDJXMDN1?=
 =?utf-8?B?emNCK0JXeWFVdkpDUDFRT2lkb0ZJSkI1M2kyM2l0YWhKZjBFdkRXeWtyVTN1?=
 =?utf-8?B?NWJoSGgzampWTFBoVmYvTldEaWZVVFR2TGVBMGVRcmNGbUJXd3JmWnh4WFNT?=
 =?utf-8?B?N0pwNG1QaDlSREl5ZmxITEZTbmdWVmRBalJ5NGxGYTJtalF3ZlN5dCtQc2VS?=
 =?utf-8?B?cW93MGZ0M0txbktqMHVhQmZGUCtLYXhxUFhUblllQ0lFRmN3dUN0SllBVVE4?=
 =?utf-8?B?dFUvYTBNOGJrL3BQS3F6YU5uYVZGeldXaGNnNndFYWJCRnZWOTFIZTV0NE91?=
 =?utf-8?B?dXpkeW9aNGlrUjcrL1J1UkwrTi9VZ20rclpKOG42V3Y2Y29yUDM2Q3dtdHVZ?=
 =?utf-8?B?QlJLMlJ0ZTFqQnVhMDJiYkh1Rlg1UkdXSWZGMkZMTjBHc0l6VDcxSWJPUC9Q?=
 =?utf-8?B?NGhwQUZvcWZvZWFMa0ZpcFpkNEhhT1JtNWYyenpTdTJpM0E4ZmtYSGl6cE5x?=
 =?utf-8?B?MURUYm12WHhOL3ZGQ1B0Q0JLQys2emtoUDZLcWw3UDgzbGRCQzFqdDNTcXFt?=
 =?utf-8?B?bTJ6ZWg4UTczdDRVTFZVMXFhNHRaNFdtODRKVndudDBTMWdWMU1CN0o2UUV0?=
 =?utf-8?B?djVCZzBkSHBhSDBZdG9nMEkrYklHNVV1TFAweDNpNFFtbTRYekFCOC9SeFRT?=
 =?utf-8?B?UEFNNUVTb05mOFQva1JZSVRtZTdkQ1o4aGRwSElhYlV2M3liemp1TzkvQ2tu?=
 =?utf-8?B?Wk1kOEVnbUkzK0M1c0lpMFNKMEJiSXZjalUxN0lsQ0Fsa2NUMTJrMEZnUlRp?=
 =?utf-8?Q?pPfrS/18Dv2CUVm2T8aN7jy5/KJZD0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6794D7E81FB5964F8D79B03F3E58D751@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8093
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9f22ae0-f5ec-475b-fc02-08dda39ccb54
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|14060799003|36860700013|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SE9pL2Y2T2kyc0FZSE9UOUx5ZzNCUnRkdk5zMXV6VWY3T2pPbGhqclEvV1VX?=
 =?utf-8?B?dTI0T1ppTlFVeFpnR2xGQlNSTW1oOEpKQ2xXU2x4ZGdNWmU3WjRudnZQQXdO?=
 =?utf-8?B?SXAyNTMxVlkvWkI4Q1p3ZnpMcUkvUEFFNm13cGdhbWxkNlRJVDIxZ3pHMWhj?=
 =?utf-8?B?T2hjUHdRdnltZ3JYckNYOEtMUXJqbjB4NDlXVDNMdDc4eGRFTUR2U1BHS0Jo?=
 =?utf-8?B?Q3MzRjhzMnVkUHY4R1ZVbFlmMXpxcWJhTkZZcXhuaTlzM2d0TUVoMG1ORFFI?=
 =?utf-8?B?M3JXKytLUzRVMFZhdjJYQktTMEpPeHVSUGsvZXZRUGFOVm1FSHE1Uk50NFJj?=
 =?utf-8?B?TFE0aUE0S0p5WjhzUldwelhhZE01a2VwVUNMT2xrdHpPVU1ObklrY1habFFl?=
 =?utf-8?B?SVB4eTZ0bDNneDNEZktpNEczMkowaWY0QTV6Y3p2bHEzVTkzcFlRVHRMamUr?=
 =?utf-8?B?cmpTUG1obUFuN1NrWE0wMnJFQWU0Vk1NUTRMSFJlMWVraGZqRUx0Mk5peGJr?=
 =?utf-8?B?dWVJcmdQUCtFcjBhTVRRWTIxbUNjYVZnY0RyQ1FQa2dnVGtSZiswTGxaQXpY?=
 =?utf-8?B?U2ZZTncrbUI3eEVPbGtNNEg2ZDJ1UnRra3Q5QXlMdElJcmlrQ1NlcE1aUkNR?=
 =?utf-8?B?Q2kyd1ptZUFtaGVnbytsWVRyckJlWjBkMzY2NExjNWk2emlIbUZ4U1IxS2Mz?=
 =?utf-8?B?M3cwYmJ0SEpray96aERIc0NUajVobmFqL2pUZ09SSzhnZ29aTVF6SFJkWEpk?=
 =?utf-8?B?ZUNNaXZzVmpMaEZZQ0M5WnVqRktDendrSHJueVlIdkhEeWJIMHdwUUFOOUs1?=
 =?utf-8?B?M05xNVNXUXQxNUhhWFlsMlhFVk02eHIxazB6M2hNUlo2Q0lkSFJMN3R1SXVh?=
 =?utf-8?B?dlpSNzJKbFlwd0xlMHpQWTdNL1lONTc4cmZVbldNeGF2cUhKR285ZzJ1Wkwz?=
 =?utf-8?B?R1lneEZWNFl4bjZtYjlqUE9ZQ3U3cVE3S0FvMDRLMWF0MFpCZkdxKytucGYw?=
 =?utf-8?B?c0xnSmZSdGJTKyttOHNoU0xPcDlRclh3ZzI1TTBGY3ZMdVhjeVJReDUva3Ur?=
 =?utf-8?B?dXNaRkZuOVJPQUJLU2xFTlVEdmpYdGJJcGwrT1I0dVNIV0dBc2Vja0JvcGZF?=
 =?utf-8?B?K1RGVHNWUDB2NHdBRUhjZVZSc2lUTE56cXgwK1pHdmVSdWlFdXlWT1I3aDlp?=
 =?utf-8?B?WTdIcHhyLzlHblVPS3BSMEQyVGhrOE4ySm1KVG80T01XdTg1Qm93TTZCR29p?=
 =?utf-8?B?RjFLN2dJK1RRTkFaQ1RncDJaZXVVZEtLOVMwQzB4ZkhOblU1K3UyMjRibnBU?=
 =?utf-8?B?QU5PQ21YemhMUUg1Uy8vN3J6azJBVlhReFZqREM2cTFrWFdCWGVOSWdJb1NR?=
 =?utf-8?B?cy9NRkxaRXZZQTJWcEw2TERPd0lKczl3bjB3VzdETU5acUxXOUlPUTVRRkwr?=
 =?utf-8?B?SVEyaU95WDJVUDVOZGhiT2RKMUkwVSt1SndDd3N2Q2JVOWU3YUhEZU9SUVlR?=
 =?utf-8?B?N0o4MzlHU0NKaStCbEpvT3NWQjFlVjlScXdlS0Irdklaamd0eFpYZGVDVUN0?=
 =?utf-8?B?dlF2QTNPdjNOOXFyZjRHSVRXTk9NcFlGemVmclZnczdGaHVsd3I1b2JxMzRl?=
 =?utf-8?B?dEJxaFZ2TjZyUjNwWXBWUHI4VXh2SEJocFY4ajgvRlBnVnk0cWUzaklBQkNH?=
 =?utf-8?B?TFRaWG5meWs0R3RiVHpCdXhqNkJtNnEyZmR4bzVqVlBwQW56RHlVYTVsRzcw?=
 =?utf-8?B?UVZIcUdtYUFLYTVTNVpqbGpQRW5EK0xmNTlRWmc5bng4KzhJUGhGb0dGSVJs?=
 =?utf-8?B?ZUlkOXdSMnc3WGRTdUZTclhDa1A1RUpLN2NLbEZsaU1WT3kwdTlXY1FZSmdL?=
 =?utf-8?B?MEF0SVBvUGFHVWVLUVBPb2JBYnBZQlQzRU4yUTFTWEFwOTN6dlJZYWZiTDE5?=
 =?utf-8?B?cytyVXhZVExZZVlNaUJoV2k2Q0xkay9MWGVRUVhxRDBLUFZmWEdvcGpzMEZl?=
 =?utf-8?B?ZWRLRWwxMEw4UmJDQWlXelVOWHRZK0ErYnJ2VW1IR25EQjkxK3lobFRISnRR?=
 =?utf-8?Q?R1AcFJ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(82310400026)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 19:20:31.0466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62c83304-c3e6-4df2-b285-08dda39cdf35
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10795

SGkgQXlhbiwNCg0KPiBPbiA0IEp1biAyMDI1LCBhdCAxODo0MywgQXlhbiBLdW1hciBIYWxkZXIg
PGF5YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+IHdyb3RlOg0KPiANCj4gSW50cm9kdWNlIHByX3Qg
dHlwZWRlZiB3aGljaCBpcyBhIHN0cnVjdHVyZSBoYXZpbmcgdGhlIHByYmFyIGFuZCBwcmxhciBt
ZW1iZXJzLA0KPiBlYWNoIGJlaW5nIHN0cnVjdHVyZWQgYXMgdGhlIHJlZ2lzdGVycyBvZiB0aGUg
QUFyY2gzMiBBcm12OC1SIGFyY2hpdGVjdHVyZS4NCj4gDQo+IEFsc28sIGRlZmluZSBNUFVfUkVH
SU9OX1JFUzAgdG8gMCBhcyB0aGVyZSBhcmUgbm8gcmVzZXJ2ZWQgMCBiaXRzIGJleW9uZCB0aGUN
Cj4gQkFTRSBvciBMSU1JVCBiaXRmaWVsZHMgaW4gcHJiYXIgb3IgcHJsYXIgcmVzcGVjdGl2ZWx5
Lg0KPiANCj4gTW92ZSBwcl90IGRlZmluaXRpb24gdG8gY29tbW9uIGNvZGUuDQo+IEFsc28sIGVu
Y2xvc2UgeG5fMCB3aXRoaW4gQVJNNjQgYXMgaXQgaXMgbm90IHByZXNlbnQgZm9yIEFSTTMyLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5YW4ua3VtYXIuaGFsZGVy
QGFtZC5jb20+DQo+IC0tLQ0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtMzIvbXB1Lmgg
fCAzMCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+IHhlbi9hcmNoL2FybS9pbmNsdWRl
L2FzbS9hcm02NC9tcHUuaCB8ICA2IC0tLS0tLQ0KPiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
bXB1LmggICAgICAgfCAgNiArKysrKysNCj4geGVuL2FyY2gvYXJtL21wdS9tbS5jICAgICAgICAg
ICAgICAgIHwgIDIgKysNCj4gNCBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
YXJtMzIvbXB1LmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtMzIvbXB1LmgNCj4gaW5k
ZXggZjBkNGQ0MDU1Yy4uYWUzYjY2MWZkZSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gvYXJtL2lu
Y2x1ZGUvYXNtL2FybTMyL21wdS5oDQo+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9h
cm0zMi9tcHUuaA0KPiBAQCAtNSwxMSArNSwzMSBAQA0KPiANCj4gI2lmbmRlZiBfX0FTU0VNQkxZ
X18NCj4gDQo+IC0vKiBNUFUgUHJvdGVjdGlvbiBSZWdpb24gKi8NCj4gLXR5cGVkZWYgc3RydWN0
IHsNCj4gLSAgICB1aW50MzJfdCBwcmJhcjsNCj4gLSAgICB1aW50MzJfdCBwcmxhcjsNCj4gLX0g
cHJfdDsNCj4gKyNkZWZpbmUgTVBVX1JFR0lPTl9SRVMwICAgICAgIDB4MA0KPiArDQo+ICsvKiBI
eXBlcnZpc29yIFByb3RlY3Rpb24gUmVnaW9uIEJhc2UgQWRkcmVzcyBSZWdpc3RlciAqLw0KPiAr
dHlwZWRlZiB1bmlvbiB7DQo+ICsgICAgc3RydWN0IHsNCj4gKyAgICAgICAgdW5zaWduZWQgaW50
IHhuOjE7ICAgICAgIC8qIEV4ZWN1dGUtTmV2ZXIgKi8NCj4gKyAgICAgICAgdW5zaWduZWQgaW50
IGFwXzA6MTsgICAgIC8qIEFjZXNzIFBlcm1pc3Npb24gKi8NCj4gKyAgICAgICAgdW5zaWduZWQg
bG9uZyBybzoxOyAgICAgIC8qIEFjY2VzcyBQZXJtaXNzaW9uIEFQWzFdICovDQo+ICsgICAgICAg
IHVuc2lnbmVkIGludCBzaDoyOyAgICAgICAvKiBTaGFyZWJpbGl0eSAqLw0KDQpUeXBvOiBTaGFy
ZWJpbGl0eSAtPiBTaGFyZWFiaWxpdHkuDQoNCkFsc28sIGZyb20gdGhlIHBhdGNoIHRoZSBjb21t
ZW50cyBmZWVscyBub3QgYWxpZ25lZCwgaXMgdGhhdCB0aGUgY2FzZT8NCg0KPiArICAgICAgICB1
bnNpZ25lZCBpbnQgcmVzMDoxOyAgICAgLyogUmVzZXJ2ZWQgYXMgMCAqLw0KPiArICAgICAgICB1
bnNpZ25lZCBpbnQgYmFzZToyNjsgICAgLyogQmFzZSBBZGRyZXNzICovDQo+ICsgICAgfSByZWc7
DQo+ICsgICAgdWludDMyX3QgYml0czsNCj4gK30gcHJiYXJfdDsNCj4gKw0KPiArLyogSHlwZXJ2
aXNvciBQcm90ZWN0aW9uIFJlZ2lvbiBMaW1pdCBBZGRyZXNzIFJlZ2lzdGVyICovDQo+ICt0eXBl
ZGVmIHVuaW9uIHsNCj4gKyAgICBzdHJ1Y3Qgew0KPiArICAgICAgICB1bnNpZ25lZCBpbnQgZW46
MTsgICAgIC8qIFJlZ2lvbiBlbmFibGUgKi8NCj4gKyAgICAgICAgdW5zaWduZWQgaW50IGFpOjM7
ICAgICAvKiBNZW1vcnkgQXR0cmlidXRlIEluZGV4ICovDQo+ICsgICAgICAgIHVuc2lnbmVkIGlu
dCByZXMwOjI7ICAgLyogUmVzZXJ2ZWQgMCBieSBoYXJkd2FyZSAqLw0KPiArICAgICAgICB1bnNp
Z25lZCBpbnQgbGltaXQ6MjY7IC8qIExpbWl0IEFkZHJlc3MgKi8NCj4gKyAgICB9IHJlZzsNCj4g
KyAgICB1aW50MzJfdCBiaXRzOw0KPiArfSBwcmxhcl90Ow0KPiANCj4gI2VuZGlmIC8qIF9fQVNT
RU1CTFlfXyAqLw0KPiANCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9h
cm02NC9tcHUuaCBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9hcm02NC9tcHUuaA0KPiBpbmRl
eCBmMGNlMzQ0ZTc4Li5kZjQ2Nzc0ZGNiIDEwMDY0NA0KPiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5j
bHVkZS9hc20vYXJtNjQvbXB1LmgNCj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Fy
bTY0L21wdS5oDQo+IEBAIC0zNCwxMiArMzQsNiBAQCB0eXBlZGVmIHVuaW9uIHsNCj4gICAgIHVp
bnQ2NF90IGJpdHM7DQo+IH0gcHJsYXJfdDsNCj4gDQo+IC0vKiBNUFUgUHJvdGVjdGlvbiBSZWdp
b24gKi8NCj4gLXR5cGVkZWYgc3RydWN0IHsNCj4gLSAgICBwcmJhcl90IHByYmFyOw0KPiAtICAg
IHBybGFyX3QgcHJsYXI7DQo+IC19IHByX3Q7DQoNCknigJltIG5vdCBzdXJlIEkgd291bGQgZG8g
dGhpcywgYXQgc29tZSBwb2ludCB0aGVyZSB3aWxsIGJlIHRoZSB0cmFuc2llbnQgZmxhZ3MgYW5k
IHAybSB0eXBlDQphbmQgd2Uga25vdyBhcm0zMiB3aWxsIG5lZWQgdG8gc3RvcmUgdGhlbSBpbiBw
cl90IGFzIGFkZGl0aW9uYWwgbWVtYmVycywgaW5zdGVhZCANCmFybTY0IHdpbGwgc3RvcmUgdGhl
bSBhcyBwYXJ0IG9mIHByYmFyL3BybGFyIHVzaW5nIHRoZSBub3QgdXNlZCBzcGFjZSAod2l0aG91
dCB3cml0aW5nIHRoZW0NCmluIHRoZSBIVyByZWdpc3RlcnMpDQoNCj4gLQ0KPiAjZW5kaWYgLyog
X19BU1NFTUJMWV9fICovDQo+IA0KPiAjZW5kaWYgLyogQVJNX0FSTTY0X01QVV9IICovDQo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vbXB1LmggYi94ZW4vYXJjaC9hcm0v
aW5jbHVkZS9hc20vbXB1LmgNCj4gaW5kZXggOGYwNmRkYWMwZi4uYzg1NzNhNTk4MCAxMDA2NDQN
Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL21wdS5oDQo+ICsrKyBiL3hlbi9hcmNo
L2FybS9pbmNsdWRlL2FzbS9tcHUuaA0KPiBAQCAtMjUsNiArMjUsMTIgQEANCj4gDQo+ICNpZm5k
ZWYgX19BU1NFTUJMWV9fDQo+IA0KPiArLyogTVBVIFByb3RlY3Rpb24gUmVnaW9uICovDQo+ICt0
eXBlZGVmIHN0cnVjdCB7DQo+ICsgICAgcHJiYXJfdCBwcmJhcjsNCj4gKyAgICBwcmxhcl90IHBy
bGFyOw0KPiArfSBwcl90Ow0KPiArDQo+ICNpZmRlZiBDT05GSUdfQVJNXzY0DQo+IC8qDQo+ICAq
IFNldCBiYXNlIGFkZHJlc3Mgb2YgTVBVIHByb3RlY3Rpb24gcmVnaW9uLg0KPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL21wdS9tbS5jIGIveGVuL2FyY2gvYXJtL21wdS9tbS5jDQo+IGluZGV4
IDg2ZmJlMTA1YWYuLjJmYjZiODIyYzYgMTAwNjQ0DQo+IC0tLSBhL3hlbi9hcmNoL2FybS9tcHUv
bW0uYw0KPiArKysgYi94ZW4vYXJjaC9hcm0vbXB1L21tLmMNCj4gQEAgLTE2Nyw3ICsxNjcsOSBA
QCBwcl90IHByX29mX2FkZHIocGFkZHJfdCBiYXNlLCBwYWRkcl90IGxpbWl0LCB1bnNpZ25lZCBp
bnQgZmxhZ3MpDQo+ICAgICAvKiBCdWlsZCB1cCB2YWx1ZSBmb3IgUFJCQVJfRUwyLiAqLw0KPiAg
ICAgcHJiYXIgPSAocHJiYXJfdCkgew0KPiAgICAgICAgIC5yZWcgPSB7DQo+ICsjaWZkZWYgQ09O
RklHX0FSTTY0DQo+ICAgICAgICAgICAgIC54bl8wID0gMCwNCj4gKyNlbmRpZg0KPiAgICAgICAg
ICAgICAueG4gPSBQQUdFX1hOX01BU0soZmxhZ3MpLA0KPiAgICAgICAgICAgICAuYXBfMCA9IDAs
DQo+ICAgICAgICAgICAgIC5ybyA9IFBBR0VfUk9fTUFTSyhmbGFncykNCj4gLS0gDQo+IDIuMjUu
MQ0KPiANCg0KQ2hlZXJzLA0KTHVjYQ0KDQoNCg==

