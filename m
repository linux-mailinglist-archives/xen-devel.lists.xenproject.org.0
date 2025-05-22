Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80DAC06D3
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 10:18:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.993180.1376623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI17j-0005zi-0D; Thu, 22 May 2025 08:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 993180.1376623; Thu, 22 May 2025 08:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI17i-0005xz-TP; Thu, 22 May 2025 08:17:54 +0000
Received: by outflank-mailman (input) for mailman id 993180;
 Thu, 22 May 2025 08:17:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yp15=YG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uI17g-0005xo-U3
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 08:17:53 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40087235-36e5-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 10:17:50 +0200 (CEST)
Received: from DU2PR04CA0031.eurprd04.prod.outlook.com (2603:10a6:10:234::6)
 by AM8PR08MB5809.eurprd08.prod.outlook.com (2603:10a6:20b:1db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 08:17:47 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::9f) by DU2PR04CA0031.outlook.office365.com
 (2603:10a6:10:234::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.29 via Frontend Transport; Thu,
 22 May 2025 08:17:47 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 08:17:46 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com (2603:10a6:5:1c::25) by
 AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 08:17:14 +0000
Received: from DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668]) by DB7PR08MB2987.eurprd08.prod.outlook.com
 ([fe80::d53f:b16d:70a5:8668%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 08:17:14 +0000
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
X-Inumbo-ID: 40087235-36e5-11f0-b892-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TGy1pZa1jMlF9uJRmerd3NJVn6bIqSyz1Y/Us747EIcrBnCpJNFFjJgE/H3N6I4mRG62ZFK3vPzrxWdQn65lvo15+M79vZdBY1df+vTN8FkNxNAe5lSDVPwONkYeDKJ983Xi0x1B3rJKrZpWMmw644ch+99eONjds5IQ7LQ60rhKCjbT8Mv6/BJB9TPkWZNdtHcp8mL00yF/zcZm8z9BhLJpUnkYi+sSMCVhX6hrzdITbmM32JzYYQ9R0o5+e7Q3/ONsqVkjLcVcVWyOuyrLjhiyYs3LLcrJ5WMtufNAxLiZlD0S0Xcp9Xv3QE53nHci9/MqAnjLR2ERwcH3sq8i1w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgIhukxxzm8aMMNZMjmLjgQK4wejOJcOd2ZdQIRhT58=;
 b=pefc1P2SGBvq01o19jqtUPenWRoHvRc2pF3Yw7vNg/F0wNLX0LqwpY1fsa0woYsI28ZAvY4Xo/C1pAS+l7cVBF7NAI66OUIj8ZNQSdMrtroHEoJGbjqgMUR02gDDr3lP/dxzlPL+79KhRdu5D14NN0cB2Tacl13cAlUda7fgBI1GjYKVWZKEOIS+y6uZo3QQdPMRc27A2KMTcup0pOvZL80MrqOvz3JDod9DhoESwCjvCaONqExe7/L7CIrU3QFC9Patk3qAszIHSZC2p4ElsRvKZa1R8HvvxWdTsPxjkA3wZvSkNTiuGxx/IbVnlHh3ZPzeSgZMdGkZzdfEqODLCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgIhukxxzm8aMMNZMjmLjgQK4wejOJcOd2ZdQIRhT58=;
 b=eHCw1vw4UlNcyT6tC0QeJ74qjRvtXxhThiAYToVs9gq1otnoRSKpULT3D0Tk9pxv+75GVjAHu4/FZ27ohUVKUZoqLhHyb/5vMmAiCPQr0F2C0cQ42Ltus1GpcWaLJdxt3PkN4j5bh2iFL7vmprO0Uib2I/N6n1caUMDCUpnYp/w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ed1/JxjdvJaoqNl8qIu9gJnQmcFOaQJSWqJTjo84wqizVzz5E5fWwDQdLvGZbAzmNkiO09J16ZUqjFbzRsIyzYUNnArcY4AIdM5atgS6R8T3yfQw6IE4XAs6FJM+vfGI8cVI+cYCv/ChQdra3+pDaMKP8CmZ8ZRE1LG4Bt+d+kCYMLrbO3rsun+Rdhcw0JNU/YB59z4fK7/2qNUuSOLcVdFDL0yHtmGTMl4+06xiS4WaC1yT1PSRrgvB9ZZZIZQRjk+9okRbVCcdDUyyxvIzDbMGfUs3hM7dTZLvuYt0n5spLkr2MAdY54Z462ek68cpy7ikrTnutw7KScrMKaxocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgIhukxxzm8aMMNZMjmLjgQK4wejOJcOd2ZdQIRhT58=;
 b=STae+x6cjwM9AlKsnsox12Bi3vuVzpCFKN0bWTPhYIoEPhOCGvuZLd8Hzl5YpnNqsc+tS3oQSNgpvSnTXpcWDHYSzd+Sq4giZtXIPFubNgotQSeljcyhewcJLGiPm4gz/vFDRZxThF9PP3sQUzMd82mPxOLXN70tRmofap02CGjO3+NHwIRx8Ok2Ob6LUVIWiws4KlK7Gf3ZDuZGeH0J1MBb9zNaX1JUGB0YawIXU0nNO6X1HHs+trssDZGuwG7Xrjz/PC7c/I/nOjpvG+yRSldgRVaQ6APItCEBCAtOjA3kXUBDzxUu7YBSmYL4mCJuL89rkD7kEVH4dvhqdiMCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mgIhukxxzm8aMMNZMjmLjgQK4wejOJcOd2ZdQIRhT58=;
 b=eHCw1vw4UlNcyT6tC0QeJ74qjRvtXxhThiAYToVs9gq1otnoRSKpULT3D0Tk9pxv+75GVjAHu4/FZ27ohUVKUZoqLhHyb/5vMmAiCPQr0F2C0cQ42Ltus1GpcWaLJdxt3PkN4j5bh2iFL7vmprO0Uib2I/N6n1caUMDCUpnYp/w=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: "Orzel, Michal" <Michal.Orzel@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Penny
 Zheng <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v5 2/6] arm/mpu: Introduce MPU memory region map structure
Thread-Topic: [PATCH v5 2/6] arm/mpu: Introduce MPU memory region map
 structure
Thread-Index: AQHbw+N/shgrvSYtoE6nwpjSqKGwG7PeWruAgAABMYA=
Date: Thu, 22 May 2025 08:17:13 +0000
Message-ID: <1CDB84D9-6D82-45DB-900A-7BE71DF54EEC@arm.com>
References: <20250513084532.4059388-1-luca.fancellu@arm.com>
 <20250513084532.4059388-3-luca.fancellu@arm.com>
 <d712300c-7c70-4459-bbf3-9c3447753ada@amd.com>
In-Reply-To: <d712300c-7c70-4459-bbf3-9c3447753ada@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB7PR08MB2987:EE_|AS4PR08MB7735:EE_|DB1PEPF000509F1:EE_|AM8PR08MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9d5af6-5135-4ee9-04cb-08dd9909226d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cGJVbVlab3VUcFlONGFRaXpySkVTK3lwY3hxaVY4Si92TlVKeGl6UHdEN3kw?=
 =?utf-8?B?ZDlNbGJHTUY3YktBbXUzUWxVWDNmL05LMGhQK3I0MVpQRVMwbVRsTG03NG5C?=
 =?utf-8?B?bnVkYjVCQVNzWTU0ZytreWQwY2s2RFh2Rm0vdTJ2MzhMRit0VGdraWJoRkl6?=
 =?utf-8?B?QlYzMEJzSWZjZTVuMTFXTjQveko3VFVWT0poaTNpUTRocUxabkh3MUFOOVNF?=
 =?utf-8?B?eU04R21MNkZzZkdnMmRsNlpOQzNoL3g1ZlRFMzd2bnhmU3JlWGJwS2tzTmNz?=
 =?utf-8?B?L0M2a3BnbDZxTGJmc2RHdm9EUk96a3UrSEFxYTJ0YXAwM1VLRUFMRndGT1p6?=
 =?utf-8?B?L04xTHFiVjQ2dkxyeWp3MVVSbEt1WjdIOGJkZnY0b2IrTGtXUU9hK0tkVUVw?=
 =?utf-8?B?K21oeklQSW5vdmRXMDV6eFVHZHA4RU91N0d0WE5ZamZDbDVCMmJ6bXNrOW5P?=
 =?utf-8?B?eWlHaHY0QzJNOGlQV3dTclFHUlNQR3M2blhSWFpNR0JSM215ZE41NVU1RG5Z?=
 =?utf-8?B?SHFRTzhHeWk5VmNvTGhmYmgwdFcrblhPdkdhVVBpOGhQanBlZlRRNXRFbEF0?=
 =?utf-8?B?bzMxQkpUNFhVb2tiMzFwcTg3VTFRdmR3eXBNVjUwVE02THpGTHBkaU5qM3hr?=
 =?utf-8?B?TE9wZytoOC9RUlZualp3cTZOSys4ZGYwdU1Ba0xkVVJLK0FkNlBnWkxvR2xu?=
 =?utf-8?B?b1RFYjMxdUgvaHJqNnJyUW5PR05MbFhsclBhaWJDaUY1NFh6WGRrMkMvVXd4?=
 =?utf-8?B?b1ZZN3VocHVicklHU0JGcE5wdi9pb3ZlN1ZTVk5TcW1OaDVONEJDNmorajhD?=
 =?utf-8?B?SDRCZkRNTDBBZmczSlhzU2dNM3E2NFduSDhWQmRJK0p0bzA5Vys5djhteWdy?=
 =?utf-8?B?TE1ZVjRmd2dsZnBaemJOMThoRHFqN1hGbmVyMndlZnZTbmd1YnQxTk04QlRL?=
 =?utf-8?B?WlZMQ2o5ZlNQSG5ETStmQXJsWlh5bVhOYVpJT1Y3TitBVnBITng0R0VrelRx?=
 =?utf-8?B?aWhRMlZzSDZoVUpnQ3lGaDlsSEcwWGhySU1wMldveUFlbFp5Y1BRMlhTQVY2?=
 =?utf-8?B?VG54dC9Fc0FEMGlPbzFWNDk5Ri82UWdrVUoydG9kc2dXOUdvK0NYWlhuUHd3?=
 =?utf-8?B?bVZ3TmNMMnFTNXo2OHF0SlB3RGlSR014Z1hIRjNFNHpWQ2g5K2lqWm1MbWl2?=
 =?utf-8?B?a2FCb3YxOElNdEZlcUlQaG9wWTYrV0UrbUtJWklPeWV6NGlsZ3lCZmp2S2Zw?=
 =?utf-8?B?akpib3FmQ0FJdUdjWlQzRE9DUTN1ZTJ3RlRWeWtoT3BNeWlPemRaK1NmZm9x?=
 =?utf-8?B?Z2ZMOTZLeGUrY0lZd3lzdzVIMk81bllZaHhZeEtHUExXajh2NHVKZm5lVVBr?=
 =?utf-8?B?M3JSYlFzTVd5UXBMaU5BZ3JPUGRQZzl2cUVZSHgwRWl1K0sxd0pZaW45bjN3?=
 =?utf-8?B?QmdoTnVLNEJXdS9vSW1vTzhJSFg3L2d3TXJOd0orQVRHemx5ZjVtQWgyaHhq?=
 =?utf-8?B?N2RWQ25pOEJoUVlhRmxmb2htUXZtc0VNWUwzNjVsR0hvWU0vWFNhd09naHBm?=
 =?utf-8?B?aXZyT2RidXNFZnVobXJZOEVOaEgwMlllOWN3N2hkS1duSTQ0eHJXcTllQkFK?=
 =?utf-8?B?VGhyai8yZ2ZSK2FEOHVQdVRWNGNVTG9hZVVodURKeklQemhlMi9NcUhheVVB?=
 =?utf-8?B?Ymw0TVhySGRteDNHWkJZaHl1ck84bTQydGdMMk92UDd4VGJEMnNhR2h3MGtj?=
 =?utf-8?B?dEZBMk4wNTU3VzdnRzduZFQ4VHpjbysxcUpNQ0ZIZm5GaW1ta3owcWtKbDVC?=
 =?utf-8?B?eUpkWHFGeUo1UXlJRk1mNEo0dTNGMlRnMncyV1BWd0ZkRk5LL3EvTk1kSlZq?=
 =?utf-8?B?RVlaZ3crREFWQ3g4TUMwQUpPS0lKbEdLcVRwS1FSdXB6QkQvTkxZODlyeFpQ?=
 =?utf-8?B?Qmx4WU1iYzNCQ0FsVnF6eU4wcDhSNlA3aWVTY21lQmU3NFo1cHkxSUtqK2Rs?=
 =?utf-8?B?U3hZM2VmME1RPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB2987.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <00070121C49EB442BA429E5760BFEB09@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7735
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c146ccd-a9a5-44d2-5d1a-08dd99090e9f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dmVOZWFPcDRVK2lySWZ0RWxwUFlwbHRWVEgrbEgyQ3FKWVY0RERkbFBwM2NM?=
 =?utf-8?B?TGQ0dVFpdkZFbTdiSjV3cnFhV2JKWU9SVDVrSGsxaml2aVY1T1dyZ3VSNzMw?=
 =?utf-8?B?ZVphMEdFUGJsNDl1UjkzNVlhNW5UUEFHaWQ2OWhmc2MwcE9iZjh3by93QnR0?=
 =?utf-8?B?REJibk5rNmF5L1ZrVGNmNnpKZ2ZpZlY1Qk9NRElxWUJqQjZkQmV2c0YzT08v?=
 =?utf-8?B?NnhNbzFHRXVzV3hwK1RiYUhNNlNjTHBCSll0OXFhRXFSaXZVTVVjS3JtREZD?=
 =?utf-8?B?OGtDQW9laHIzdHRsdFhaOExyUjVZMlo5aGtjNW5kS0kxOXRuU0kzVHAvUnpC?=
 =?utf-8?B?bUVNMGJ1MHIyckE5d2lkcHRmM3UyMVUxVFNEYlQ3VmdDWFZVTFlHck1zUDJ5?=
 =?utf-8?B?V1VSU1hiUXdKSDR0dGs3WGl6d2FLbGFrNndtcnpUaVg4NmgyNHY0Qm1OK3gr?=
 =?utf-8?B?bmNpZVBGeXk0ZTRMSlBxdENKQkFlckgwaTRFMXJNSEJQMk45TERyTkVvOGJD?=
 =?utf-8?B?VkRwOGtQbmZ4UE5WUWlqM3B4SDJQMW9RZnF2d1FxamNYYWprQ1FGd2tIOG1G?=
 =?utf-8?B?U0wyZ0I4TkM4VlNqNmNNSXBCcDR4aHN2Q1BYZ21QbTlXWGVJWUdJeTBZdm1Z?=
 =?utf-8?B?MG0wbDgraWlHM3ZDZDVoeE55cFNnL2dUa25udnVTOWJpTG0yelgrZlFIUkJv?=
 =?utf-8?B?c2t2NXlkeWJNdGl6OFhrb0ZXamJSNDR3WWh0b282RTFNM3JVVk1XT2VUUEJX?=
 =?utf-8?B?dkNqWWRIK0ZrMi85NGUwSlZBbC9xQnUycWlwU3V1aTVYcXd6VHYvaHFkbTdR?=
 =?utf-8?B?K1lTZVNGN1dJMXFUL21FZE1zVHdtalVJZkFmYnF4dGcyYjd1VDlZdElGNlVn?=
 =?utf-8?B?M24xUkRjK2NxcEtxajhmU0t5aHkzR1lPV3lHdG5CbXZyQWZGRTdLcUwrUElz?=
 =?utf-8?B?UnNDR3hlcUhDYUVUbmlTSG11dnFBdTFpMGpUazc4Q0FMSU5HaTB4cWtRLzdO?=
 =?utf-8?B?d1FZbVFtN0NKYnlueWgvamR1UU1rYXgvRS9xekRndzZoakluTE5hMGdNNG1r?=
 =?utf-8?B?aEgvV3V0bjZSQ3VSdWoralBhZituMXgxcy95aGlySFFGdGRjL1J5NEt6NVVQ?=
 =?utf-8?B?MXhBNXpXVHhkMEZpTHRjUVBDakxFTFVVQWMwZ0JEOWxsNFhnaVI4VlVUdGhS?=
 =?utf-8?B?MlVqSmZsYUhMallHNUVEV3VqRitMNlNJRGlWbHV2R1FqUG9IcFVzVHN1aVly?=
 =?utf-8?B?T0k3MklmbWtQK3JWNVZJMzJ2aEJuL212M2RxS0ZPbXJOTnhMeklKenN4NzFG?=
 =?utf-8?B?cW1FS3d0QWRBL0lYL2tCazRpTjBBTVdOQnNLVk5lZDlsM2U3Z3JGanEyNE83?=
 =?utf-8?B?dmlkTUkzbk01MWZKS0VQbW5LS1hHbVQ2UUZ1TXUrSTM3ZFh3V3ptNWRjeWhK?=
 =?utf-8?B?UDlnN1ozYlZ0N1gyY0ZWb1VMb2s1MytKRnk5WFFtSW54K3l4a0hRdEg3MklY?=
 =?utf-8?B?MmlwQVpzV1lERlp6dFMrS3Y2TmVvYmRCUnBaSCsyL2hkbGdrNUpqMnZjb3BS?=
 =?utf-8?B?ZjNWejVQb1crVU8vVnE5NVFjeFdBLzZtNjNpTW1ZQy9OUFFqL1dITkZ4NDBm?=
 =?utf-8?B?dmh6M0dMMEttL3pJT1pCNkhGZTdTN0s3dklnWXQxWTRwaEtJMVplcTN2N0JY?=
 =?utf-8?B?cmNiZXU5VEozeUNXaE4ycUFOeFRUTEVkY3o0WGQ2dEVPU1Q5MVpDVUtQYUNR?=
 =?utf-8?B?Wno3dGQ5SkdTT0pvcVRuVEhQbFJnWWpKR1NlSTlObFpYQVFTQlI2RlA0T2RE?=
 =?utf-8?B?bkMvd2Z5ZjdxeU9weVpuN0M3RUZVdkRKS0dVN1dVRzc3WEFQNHJlQkdzL3lY?=
 =?utf-8?B?Z1lNN0dEVmQ5MHFrVDNTYTRtR1ZkZWRqTi9oOWdNTk9RNGlUM2xmeCt0Mi85?=
 =?utf-8?B?UVVIUTJsL3hRcExLcDlKamgzOXRjSnRVRC9zT1A2TlNGRFRESGVYL2h5bkVH?=
 =?utf-8?B?RTRWcU9oVnp1TFZOZzJjSGRkTFZZQ1FPTXlEbEw1NUU1ZWdiUVZuRlBEZGtz?=
 =?utf-8?Q?Solagc?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:17:46.6762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9d5af6-5135-4ee9-04cb-08dd9909226d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5809

SGkgTWljaGFsLA0KDQo+PiANCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9h
c20vYXJtNjQvbXB1LmggYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vYXJtNjQvbXB1LmgNCj4+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmQzYzA1NWEyZTUz
Yg0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2Fy
bTY0L21wdS5oDQo+PiBAQCAtMCwwICsxLDUyIEBADQo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KPj4gKw0KPj4gKyNpZm5kZWYgX19BUk1fQVJNNjRfTVBV
X0hfXw0KPj4gKyNkZWZpbmUgX19BUk1fQVJNNjRfTVBVX0hfXw0KPiBHaXZlbiB0aGF0IEFuZHJl
dydzIENPRElOR19TVFlMRSB1cGRhdGUgXHdydCBoZWFkZXJzIHdlbnQgaXQsIEkgdGhpbmsgd2Ug
c2hvdWxkDQo+IGFkaGVyZSB0byBpdCBpbiBuZXcgZmlsZXMuIE90aGVyIHRoYW4gdGhhdDoNCj4g
DQo+IFJldmlld2VkLWJ5OiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnplbEBhbWQuY29tPg0KDQpP
aCBJIG1pc3NlZCB0aGF0LCBJ4oCZbGwgdXBkYXRlIHRoZSBoZWFkZXJzIGluIHRoaXMgc2VyaWUN
Cg0KQ2hlZXJzLA0KTHVjYQ0KDQo=

