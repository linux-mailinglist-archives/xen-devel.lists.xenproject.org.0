Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1DBA350CE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 23:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888112.1297535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihGA-00057R-3X; Thu, 13 Feb 2025 22:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888112.1297535; Thu, 13 Feb 2025 22:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tihGA-00054Z-01; Thu, 13 Feb 2025 22:00:38 +0000
Received: by outflank-mailman (input) for mailman id 888112;
 Thu, 13 Feb 2025 22:00:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bb01=VE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tihG8-0004bW-L4
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 22:00:36 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20606.outbound.protection.outlook.com
 [2a01:111:f403:2614::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f380d785-ea55-11ef-9896-31a8f345e629;
 Thu, 13 Feb 2025 23:00:35 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PA4PR03MB7069.eurprd03.prod.outlook.com
 (2603:10a6:102:e4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 22:00:29 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 22:00:29 +0000
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
X-Inumbo-ID: f380d785-ea55-11ef-9896-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtoOlouxSce9q7zFuCWmziUZGDwSWgaMmUf9NFhHi+uAvOPpoGNw/CIm72QOzWyUAp37rnBtI9jYDZj/h+wTWRtAQce6lIhHdT8lQxzOwoxPqIUdas83C2tk+mDb9kVZXsqgQ0Z5eTHadepqUgAjQ2/S0S70DGPihXDE16bynSQJEiznJG6vffYw8N8D1WxZ+ymN1bKNYOdShCZMaILNHXf/T+OhELH/8lEgz5rLTqbxzAkVBoUvNzstoxQchHOz6JOFHScVhKLSwwDncRF2aW42A2fxA1ofb/AnN1n9sgyNcwiE/BG8JXO+qhnhkrnXpLHdNA7SACP1tlOrvK7eQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1uQdAGwFGGyhk0UmxlV4ntFJuw/pAbi5iT6SVTTNG8=;
 b=GN1eCVGfQ7C45x35XR/xnHq+k6RzLyjckIU5vaX0lQRddWso2ENuBG9IuNahgPF0+ynrFNyPoNb1QEzFqauTL1Z+nIddrX6pWjciBB8qlXz0hXi8MC4JCmSXXJd4ymYFyra83JKFhqDIi3mcvscfIB6UyQe1Y1i1It4yUWr9t6GKTDQpLAKaZ7S4tw3g41556ZhaFl09rqLSIozZXzBLTyf303IWfSAz4KULRSvU/xXN1hBC/pf5ruVaCTN0qtbfIJ0HvRqox6E1mCOQlkwjL0iiJsKnHN7Qu5NuM5Ma0G1CiCEK0bhT9IT0hXCfINXE+0fgW5e5L/tKRlhdidCP6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1uQdAGwFGGyhk0UmxlV4ntFJuw/pAbi5iT6SVTTNG8=;
 b=it497oKdonehtCCF1IU7J3FEnkO8u1g+ePwPyyV3S60EywULjX9ejMK4AiLJvT+j22MVtyWJPx1+OcJZHshD2HQap1CHxMP71JpMt0Ly7LU29xfwrMppPRoRSfXbPibFJkiJgIqCOQ3LRxxU2MC/ZmGXjgJaZtVjz6/ZDQW+W4fUKqdpamElCgSEayWE70PBUPS2TfyCLdFxHO2AcDerlYdpNUzTPo8vl71vSFc0XqE0dUQKTTeyfAKhdvR6cp3+rZKpdgSTK/LCJQ2iN4Bvl9mPcqYJz2ZXjk8LYmOZJ5/Njb+DrX0Ahc7YZz86Xhx5i6g4iar/ImjwXI81u7IVoQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 2/4] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH v5 2/4] xen: common: add ability to enable stack
 protector
Thread-Index: AQHbfmKwgsjxBZVOSE6qB7f/GfKgPA==
Date: Thu, 13 Feb 2025 22:00:27 +0000
Message-ID: <20250213220021.2897526-3-volodymyr_babchuk@epam.com>
References: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20250213220021.2897526-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PA4PR03MB7069:EE_
x-ms-office365-filtering-correlation-id: 2d660be8-1a62-474b-7148-08dd4c79d473
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dk9LS1R4bmIxMVVvdVdrbGJ2cUpjaFZPd3pHR2tpWndOb3lkeDUreWR2Q0lm?=
 =?utf-8?B?NGx0dWFMdExmS3A1MjE3VUtLQkt3V3ZYLzdoWURKUFVCamZxdmYyNXNySkE1?=
 =?utf-8?B?dmJPVHBpVk5HSm0xN0JrMDlVRU1UNy9vOTBQRjV2bWVFY1REeVJaVlJoTnRn?=
 =?utf-8?B?ZENjUFJReTQrbUZoZ3MxZVRtS2duTVBWeHlLclFtQ1Bab0UrZERoY0x4Zm5B?=
 =?utf-8?B?cjNRRWdVdUk5dGdMM2Nqa2E4VHpOOXg0L1VMc0JnVFl2QmZDb20xTG1CUVpN?=
 =?utf-8?B?NXJyaTg3TmFCcldUalFLUmg0dDFaTTFaSUh0RnYrNzRYQng4NCtFeWo5UGNB?=
 =?utf-8?B?UDJpWVFFTVNjK3l5Vy9ET2RSdXhwV2NHTitKN0hzOXZuMlJYNUhsbGp2K0x1?=
 =?utf-8?B?NGY5SnJPMWVOdW96ais0TVlUZm5WTlVtYjZMaks2UzNrWWFpMkt1OWhQbTZ4?=
 =?utf-8?B?YjBibXJUMjhSUVlFZmY2UnFPYlQ4UHJGeGRTVE11WnJKMzU4M3F2eHZFTjln?=
 =?utf-8?B?Mm5KUjNIWENDTVEyOTFLU3g5NEN3R3NtS0RoYktWY0FxcVBHOU9BSzdYYk9C?=
 =?utf-8?B?RWMvcFBPWnUrVVJmR3d6R0djbUllMnFnaDBaeEl4NUNoQVhmZGZKOXViSWxh?=
 =?utf-8?B?RHB1dU5RcmNYOWhLbFd5c2k1UEJzdm5nOTdlenZ6YWgyL293R0wwcWpkSjlQ?=
 =?utf-8?B?M3FlMDhYaFkyUjdMbG5VaVBKRDQvUDM1VFBuM1I4T2t4QitZaE1qREdEYW12?=
 =?utf-8?B?a1RZNndMRGNUNUJ4R29YbE41VlZFVWdrZkViZGpHRkZodlZoSmZzU1NycUd1?=
 =?utf-8?B?MWx3aFZpTHBBMjdhQzJKQzNDeXJETXRpUDRmZWV0b1J4bGlXTGNaNUF1UDA5?=
 =?utf-8?B?cWtEZHNaR1ZrZllpTS8vRFpHZ0xwYk9FN0xYS3lsWTNNdjRjMkdHd1hBUDVL?=
 =?utf-8?B?Vmd2SXdMcTRzUURVOUQvRXIvbi9JNDk1dmxxNlVmZXpYc0N2dmNaVFZyZVJ3?=
 =?utf-8?B?R3h3ZmE5TXZoUUgxTDMvZUJGWEZ6SHVyWnk2MStKbHo4TysvazJ6TVZXR3Js?=
 =?utf-8?B?U1RReEJlZWk4a0xQcEtKZG0wNGtxNkRGOTNxcExaVkFwOUhIUTVBUGFtYlEr?=
 =?utf-8?B?WnNvS2YrUFdqWERBamx4U0lod1BIYmEzRTVsRXFkeUNBRTJNSVpkUGg3bHhS?=
 =?utf-8?B?RCtuSERxRnNtcTJyd3BLdjBqRlVhUzRISVhyWTZZZTBSMlplWDIyWlFOVDM2?=
 =?utf-8?B?bkZnc3Y4bXl4Qkhoa3MwQkk5ZFJ4MzZOMXJENFk5MnNCVm5ackVDbnhhcFZE?=
 =?utf-8?B?eDRlMnltelp1cjFOOVZDZElBNHkyWXhacmJScWUxNFlsRFNVK0dDdDhtR1VX?=
 =?utf-8?B?cFJwNHdKdU9kNUN0Zk03NzdtNGZhb3RHZjloN01MOVIzVFZJVEhzckV1VkNV?=
 =?utf-8?B?TkZoZVQ0VUFpWVp3aktjMk9rWG9CLzNyMlRTUk9oSXMwbWVaMVFPQys3S3Jj?=
 =?utf-8?B?SW04ZWNXL3JZeE1ORGZVUjN4Q0w4OXJsY3dKZkxDV21ZZ1k3Wk1tK3FnY1VJ?=
 =?utf-8?B?UHg1SEdaWGUrSkpPT0lpYUo4TVlpU29CUm9IaDN3eHByYjZPVzB1WW04cjhD?=
 =?utf-8?B?QkZEcWNNbXRUWml6alIraHB0WTZEM0l3eW43cGxidytlZkJLUFpxQWo5Qytr?=
 =?utf-8?B?UGZGaHhWSHhVWlFxaDIycHNoWnFSRllXOWovcjRmRXo0WU5tbXdPWHZSdC9i?=
 =?utf-8?B?UzhrOU8zaWR6Z2Q4NUV4K2FlMER4WGRVZ2VoNzZzbUtEYlRLNEk3VTBOTXc3?=
 =?utf-8?B?SGxkTFV5cndYUFlPNTk5UlZ5SlpueE4zdWFFcFQvOUQrVHlwRjRFcTdPbWVw?=
 =?utf-8?B?WEZrS1NCRE5GekNZYkJRV0hSS1V3ckR4QU9UYlZmM3F1SkVEcG9ZcHRvN1BX?=
 =?utf-8?Q?ahinJxqrCgpewBIz1Mahl/XyPCdMr8P7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bkplbXVoRC9LR3ozTGhPaElxOW9qY1BwNE9aYkRFUDlZRXZiakZtMG10NTRM?=
 =?utf-8?B?cTNDcmFoTUIzTjhFTDBLRmc5OUd2aEJ1aWhDYldoM1paU3BPaFlXOG5pUTFk?=
 =?utf-8?B?dG1iTG9hQ05LTVkxSmhiSW9pR3RMUlpibk1TWGd3Y1NPMHd5bmJKNm9HVUFn?=
 =?utf-8?B?RVp2eTArOUUrMGJpaTVEcXlpZDErb0FWNDIvOXNxbmFvSzNydmlYUjlVQjVx?=
 =?utf-8?B?SENCUHJsSU8ydUdoTGViRW0yNHFHSVcvemsrYlFoSDR0QkJFb0lBNGNvbkNh?=
 =?utf-8?B?WEtkVFhVNGF5NXFsQVI5SHUxWUU4ZXJmckRqTW9aNUVmK3JtZExYZmZMQWtD?=
 =?utf-8?B?YktSNGhzRWErZ0ZKTzZzSC9EMXN1amhYdm1kYldmWlpwU2U3Z0tZZFhHNmFx?=
 =?utf-8?B?VlJyNnBmLzBIMmpUMkVIb0s5N1NrWmduSUxGS3NUT20yd2M2bWs5cGM3TFhO?=
 =?utf-8?B?RkVnSmNFUVhHNVZ2WVl0eG5teGhCT3RMU1hpNk1NVW9VUG9HTUFvOHFQQmNG?=
 =?utf-8?B?Yk5XNllwQjIvcUNrY2t1L1FvVkRQVGFJanFrY1VFSzd4a2ZzUUpscEZHbjVI?=
 =?utf-8?B?UkNidWRSTTNWWi9sbmk0OCtuSFlWOVpUUGFWekJNeWFSUTVvbWJuY1QvM0hs?=
 =?utf-8?B?cjlJTFlKS1g0SmRqbG1NWG1na283RlZaT1IyVFFPcFJFZHdiTGVRckxkSmhH?=
 =?utf-8?B?L3p4VzlnYkQ4VXhSN0tCUGkvUHFYUzFoOGxTbmE0MG56ZUR0cHJzWVRhVk1G?=
 =?utf-8?B?bG5yT085Znc4NXdWWkx3cGFiZWtlU2lEKzJIN1JETVluZ095Y25SQWM4MzRv?=
 =?utf-8?B?RDdaZ1Q1N0lNVkVjb29pNlVIdy84WjVBaDdhTTdSYnY1WHVZNllJY2dQMWxp?=
 =?utf-8?B?bnMwM2lKaVFPTjJUUytkS3FGbnFSWEJDcGhnQVp3K2ZEL1NWMWFUWkJ0NTM3?=
 =?utf-8?B?Z1UwR1FwQmlZWGozN1l2NE1kazBWSlBZeHN0UWtHWXpiSlpRM1Y5a2tweWNz?=
 =?utf-8?B?UnhUM01RZmNIdDAyS3ROS2UxbnduK2ZaS1VwZFZGQ011MlZHdDlKYzdZUnBN?=
 =?utf-8?B?M21aOHZPbHJBL1JOWXJNNWZVSEJFangvc0lsVXBGNVZSVVRRc0RzWjZ0dDFp?=
 =?utf-8?B?c2pGTlZsSGlpS2kxQlFTVDhBMzJiV1E1MXBlWmpGZ2taTzNHRFlsbjlwNk9T?=
 =?utf-8?B?NWtKenJnd3dLT2NNeU9DZVVHd1pON25TZnNucmdpK1IvWkJEZzNqV2lVSTkr?=
 =?utf-8?B?aS9OY3dvRHNZRFcyaFROTjZ0NnVBVFVNK3R1SzZKaHNqYlN2bHBTeDJuYyty?=
 =?utf-8?B?Y3VobURFU0FUTldDTWxiczY0bGs5WjQzT3RoRGJFUXVqRGhheUJ1c0JXamRC?=
 =?utf-8?B?TjhVeEduY0pVSWY0OWo4MmpHZkttRTVHd090TDl0cTc5ZjV3R3l1clMzMVNT?=
 =?utf-8?B?djJBMDVac01yRWZJYk9OSHkvdno4TVBsbytPSEhHYjRiZUFKR09FSndXWi9L?=
 =?utf-8?B?emlyYmpMckp6M2lQc1R3cTl3Tzcwa21kZnowSHhteFlyRis0eHZRR2cyU2U0?=
 =?utf-8?B?eFljWG0zY3lJd2ZKVDAxOUxYZnpyb0pEVFBRSGVQWDR0L3pxMlZ0SmhIdzlB?=
 =?utf-8?B?Ymp4V3FyMEhoMEhQVXNWVlI2bTBNaDdnUnd0WDVNbERrdWJjNjh1R3NFdmFh?=
 =?utf-8?B?SEZiTmtLc2JhMHp3cGVjVktNN3hJZFpobG9CTkY0UFpxalNLZkpoWDhjQ0pv?=
 =?utf-8?B?OFhaQVRnQVVybmIvMHByaFZaRnlzQ1F0WXVkdHNSR0lpblF1VEFBNjJ3S1FW?=
 =?utf-8?B?bzJOTnI4alJmbFc3cHFXVXluWldRbVJuV2tCVTlPVFpMSzVocENRbTNYVjV2?=
 =?utf-8?B?TG9vdVlNWXFDTW1KYlhJOXVERkhxYWpsM3JKNHd5Sk5LclByM2h5Zjd0RmM1?=
 =?utf-8?B?V0FxR2wvbGVsS0JhZGx0ejg4RmlNeUozd0JMUkVqUFJGeWFGNVpZbkZMc0JS?=
 =?utf-8?B?Y1BXS3M4WFdhRDFBY1lFS0NiMmVOOEtvc1NSVmJYWFk1MXRuWnJieUFQRlVL?=
 =?utf-8?B?dHBpTHNsRVlFZWtwUGF5YkxMRmcvdGZ0TXlZbDRYeEorQXBRdVZIdWUySzJQ?=
 =?utf-8?B?Rm9KV00xYkJTeXNkWHh6WG54cVF2TWQ1R0NTUk9jTFNnL3JGaGk1c082OGtY?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E84844C2EAB3148B75ADF4EB1E8D68B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d660be8-1a62-474b-7148-08dd4c79d473
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 22:00:27.0708
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/EsKjMUnLwJVFv4dmu2Amw9ymz0p/8OUslV90I/TOq01bwMqc+w6Ba51+wKtg0Vh4K+HAzuem9tJaMOL04bRVgV3wzhS0JSOcP8+/L5F9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7069

Qm90aCBHQ0MgYW5kIENsYW5nIHN1cHBvcnQgLWZzdGFjay1wcm90ZWN0b3IgZmVhdHVyZSwgd2hp
Y2ggYWRkIHN0YWNrDQpjYW5hcmllcyB0byBmdW5jdGlvbnMgd2hlcmUgc3RhY2sgY29ycnVwdGlv
biBpcyBwb3NzaWJsZS4gVGhpcyBwYXRjaA0KbWFrZXMgZ2VuZXJhbCBwcmVwYXJhdGlvbnMgdG8g
ZW5hYmxlIHRoaXMgZmVhdHVyZSBvbiBkaWZmZXJlbnQNCnN1cHBvcnRlZCBhcmNoaXRlY3R1cmVz
Og0KDQogLSBBZGRlZCBDT05GSUdfSEFTX1NUQUNLX1BST1RFQ1RPUiBvcHRpb24gc28gZWFjaCBh
cmNoaXRlY3R1cmUNCiAgIGNhbiBlbmFibGUgdGhpcyBmZWF0dXJlIGluZGl2aWR1YWxseQ0KIC0g
QWRkZWQgdXNlci1zZWxlY3RhYmxlIENPTkZJR19TVEFDS19QUk9URUNUT1Igb3B0aW9uDQogLSBJ
bXBsZW1lbnRlZCBjb2RlIHRoYXQgc2V0cyB1cCByYW5kb20gc3RhY2sgY2FuYXJ5IGFuZCBhIGJh
c2ljDQogICBoYW5kbGVyIGZvciBzdGFjayBwcm90ZWN0b3IgZmFpbHVyZXMNCg0KU3RhY2sgZ3Vh
cmQgdmFsdWUgaXMgaW5pdGlhbGl6ZWQgaW4gdHdvIHBoYXNlczoNCg0KMS4gUHJlLWRlZmluZWQg
cmFuZG9tbHktc2VsZWN0ZWQgdmFsdWUuDQoNCjIuIE93biBpbXBsZW1lbnRhdGlvbiBsaW5lYXIg
Y29uZ3J1ZW50IHJhbmRvbSBudW1iZXIgZ2VuZXJhdG9yLiBJdA0KcmVsaWVzIG9uIGdldF9jeWNs
ZXMoKSBiZWluZyBhdmFpbGFibGUgdmVyeSBlYXJseS4gSWYgZ2V0X2N5Y2xlcygpDQpyZXR1cm5z
IHplcm8sIGl0IHdvdWxkIGxlYXZlIHByZS1kZWZpbmVkIHZhbHVlIGZyb20gdGhlIHByZXZpb3Vz
DQpzdGVwLg0KDQpTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2Jh
YmNodWtAZXBhbS5jb20+DQpSZXZpZXdlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCi0tLQ0KDQpDaGFuZ2VzIGluIHY1Og0KDQotIEZpeGVkIGluZGVudGF0
aW9uDQotIEFkZGVkIHN0YWNrLXByb3RlY3Rvci5oDQotLS0NCiB4ZW4vTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgICAgfCAgNCArKysNCiB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgICAg
ICAgfCAxNSArKysrKysrKysNCiB4ZW4vY29tbW9uL01ha2VmaWxlICAgICAgICAgICAgICAgfCAg
MSArDQogeGVuL2NvbW1vbi9zdGFjay1wcm90ZWN0b3IuYyAgICAgIHwgNTEgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KIHhlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90ZWN0b3IuaCB8
IDE0ICsrKysrKysrKw0KIDUgZmlsZXMgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL3N0YWNrLXByb3RlY3Rvci5jDQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9pbmNsdWRlL3hlbi9zdGFjay1wcm90ZWN0b3IuaA0KDQpkaWZmIC0tZ2l0IGEv
eGVuL01ha2VmaWxlIGIveGVuL01ha2VmaWxlDQppbmRleCBhMGM3NzRhYjdkLi40OGJjMTdjNDE4
IDEwMDY0NA0KLS0tIGEveGVuL01ha2VmaWxlDQorKysgYi94ZW4vTWFrZWZpbGUNCkBAIC00MzUs
NyArNDM1LDExIEBAIGVsc2UNCiBDRkxBR1NfVUJTQU4gOj0NCiBlbmRpZg0KIA0KK2lmZXEgKCQo
Q09ORklHX1NUQUNLX1BST1RFQ1RPUikseSkNCitDRkxBR1MgKz0gLWZzdGFjay1wcm90ZWN0b3IN
CitlbHNlDQogQ0ZMQUdTICs9IC1mbm8tc3RhY2stcHJvdGVjdG9yDQorZW5kaWYNCiANCiBpZmVx
ICgkKENPTkZJR19MVE8pLHkpDQogQ0ZMQUdTICs9IC1mbHRvDQpkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9LY29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnDQppbmRleCA2MTY2MzI3ZjRkLi5iZDUz
ZGFlNDNjIDEwMDY0NA0KLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnDQorKysgYi94ZW4vY29tbW9u
L0tjb25maWcNCkBAIC04Myw2ICs4Myw5IEBAIGNvbmZpZyBIQVNfUE1BUA0KIGNvbmZpZyBIQVNf
U0NIRURfR1JBTlVMQVJJVFkNCiAJYm9vbA0KIA0KK2NvbmZpZyBIQVNfU1RBQ0tfUFJPVEVDVE9S
DQorCWJvb2wNCisNCiBjb25maWcgSEFTX1VCU0FODQogCWJvb2wNCiANCkBAIC0yMTYsNiArMjE5
LDE4IEBAIGNvbmZpZyBTUEVDVUxBVElWRV9IQVJERU5fTE9DSw0KIA0KIGVuZG1lbnUNCiANCitt
ZW51ICJPdGhlciBoYXJkZW5pbmciDQorDQorY29uZmlnIFNUQUNLX1BST1RFQ1RPUg0KKwlib29s
ICJTdGFjayBwcm90ZWN0b3IiDQorCWRlcGVuZHMgb24gSEFTX1NUQUNLX1BST1RFQ1RPUg0KKwlo
ZWxwDQorCSAgRW5hYmxlIHRoZSBTdGFjayBQcm90ZWN0b3IgY29tcGlsZXIgaGFyZGVuaW5nIG9w
dGlvbi4gVGhpcyBpbnNlcnRzIGENCisJICBjYW5hcnkgdmFsdWUgaW4gdGhlIHN0YWNrIGZyYW1l
IG9mIGZ1bmN0aW9ucywgYW5kIHBlcmZvcm1zIGFuIGludGVncml0eQ0KKwkgIGNoZWNrIG9uIGZ1
bmN0aW9uIGV4aXQuDQorDQorZW5kbWVudQ0KKw0KIGNvbmZpZyBESVRfREVGQVVMVA0KIAlib29s
ICJEYXRhIEluZGVwZW5kZW50IFRpbWluZyBkZWZhdWx0Ig0KIAlkZXBlbmRzIG9uIEhBU19ESVQN
CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL01ha2VmaWxlIGIveGVuL2NvbW1vbi9NYWtlZmlsZQ0K
aW5kZXggY2JhM2IzMjczMy4uOGFkYmY2YTNiNSAxMDA2NDQNCi0tLSBhL3hlbi9jb21tb24vTWFr
ZWZpbGUNCisrKyBiL3hlbi9jb21tb24vTWFrZWZpbGUNCkBAIC00Niw2ICs0Niw3IEBAIG9iai15
ICs9IHNodXRkb3duLm8NCiBvYmoteSArPSBzb2Z0aXJxLm8NCiBvYmoteSArPSBzbXAubw0KIG9i
ai15ICs9IHNwaW5sb2NrLm8NCitvYmotJChDT05GSUdfU1RBQ0tfUFJPVEVDVE9SKSArPSBzdGFj
ay1wcm90ZWN0b3Iubw0KIG9iai15ICs9IHN0b3BfbWFjaGluZS5vDQogb2JqLXkgKz0gc3ltYm9s
cy5vDQogb2JqLXkgKz0gdGFza2xldC5vDQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zdGFjay1w
cm90ZWN0b3IuYyBiL3hlbi9jb21tb24vc3RhY2stcHJvdGVjdG9yLmMNCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwLi4yODY3NTNhMWIxDQotLS0gL2Rldi9udWxsDQorKysg
Yi94ZW4vY29tbW9uL3N0YWNrLXByb3RlY3Rvci5jDQpAQCAtMCwwICsxLDUxIEBADQorLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLw0KKyNpbmNsdWRlIDx4ZW4vaW5p
dC5oPg0KKyNpbmNsdWRlIDx4ZW4vbGliLmg+DQorI2luY2x1ZGUgPHhlbi9yYW5kb20uaD4NCisj
aW5jbHVkZSA8eGVuL3RpbWUuaD4NCisNCisvKg0KKyAqIEluaXRpYWwgdmFsdWUgaXMgY2hvc2Vu
IGJ5IGEgZmFpciBkaWNlIHJvbGwuDQorICogSXQgd2lsbCBiZSB1cGRhdGVkIGR1cmluZyBib290
IHByb2Nlc3MuDQorICovDQorI2lmIEJJVFNfUEVSX0xPTkcgPT0gMzINCit1bnNpZ25lZCBsb25n
IF9fcm9fYWZ0ZXJfaW5pdCBfX3N0YWNrX2Noa19ndWFyZCA9IDB4ZGQyY2M5MjdVTDsNCisjZWxz
ZQ0KK3Vuc2lnbmVkIGxvbmcgX19yb19hZnRlcl9pbml0IF9fc3RhY2tfY2hrX2d1YXJkID0gMHgy
ZDg1MzYwNWE0ZDlhMDljVUw7DQorI2VuZGlmDQorDQorLyoNCisgKiBUaGlzIGZ1bmN0aW9uIHNo
b3VsZCBiZSBjYWxsZWQgZnJvbSBlYXJseSBhc20gb3IgZnJvbSBhIEMgZnVuY3Rpb24NCisgKiB0
aGF0IGVzY2FwZXMgc3RhY2sgY2FuYXJ5IHRyYWNraW5nIChieSBjYWxsaW5nDQorICogcmVzZXRf
c3RhY2tfYW5kX2p1bXAoKSBmb3IgZXhhbXBsZSkuDQorICovDQordm9pZCBfX2luaXQgYXNtbGlu
a2FnZSBib290X3N0YWNrX2Noa19ndWFyZF9zZXR1cCh2b2lkKQ0KK3sNCisgICAgLyoNCisgICAg
ICogTGluZWFyIGNvbmdydWVudCBnZW5lcmF0b3IgKFhfbisxID0gWF9uICogYSArIGMpLg0KKyAg
ICAgKg0KKyAgICAgKiBDb25zdGFudCBpcyB0YWtlbiBmcm9tICJUYWJsZXMgT2YgTGluZWFyIENv
bmdydWVudGlhbA0KKyAgICAgKiBHZW5lcmF0b3JzIE9mIERpZmZlcmVudCBTaXplcyBBbmQgR29v
ZCBMYXR0aWNlIFN0cnVjdHVyZSIgYnkNCisgICAgICogUGllcnJlIEzigJlFY3V5ZXIuDQorICAg
ICAqLw0KKyNpZiBCSVRTX1BFUl9MT05HID09IDMyDQorICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcg
YSA9IDI4OTEzMzY0NTNVTDsNCisjZWxzZQ0KKyAgICBjb25zdCB1bnNpZ25lZCBsb25nIGEgPSAy
ODYyOTMzNTU1Nzc3OTQxNzU3VUw7DQorI2VuZGlmDQorICAgIGNvbnN0IHVuc2lnbmVkIGxvbmcg
YyA9IDE7DQorDQorICAgIHVuc2lnbmVkIGxvbmcgY3ljbGVzID0gZ2V0X2N5Y2xlcygpOw0KKw0K
KyAgICAvKiBVc2UgdGhlIGluaXRpYWwgdmFsdWUgaWYgd2UgY2FuJ3QgZ2VuZXJhdGUgcmFuZG9t
IG9uZSAqLw0KKyAgICBpZiAoICFjeWNsZXMgKQ0KKyAgICAgICAgcmV0dXJuOw0KKw0KKyAgICBf
X3N0YWNrX2Noa19ndWFyZCA9IGN5Y2xlcyAqIGEgKyBjOw0KK30NCisNCit2b2lkIGFzbWxpbmth
Z2UgX19zdGFja19jaGtfZmFpbCh2b2lkKQ0KK3sNCisgICAgZHVtcF9leGVjdXRpb25fc3RhdGUo
KTsNCisgICAgcGFuaWMoIlN0YWNrIFByb3RlY3RvciBpbnRlZ3JpdHkgdmlvbGF0aW9uIGlkZW50
aWZpZWRcbiIpOw0KK30NCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc3RhY2stcHJvdGVj
dG9yLmggYi94ZW4vaW5jbHVkZS94ZW4vc3RhY2stcHJvdGVjdG9yLmgNCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQppbmRleCAwMDAwMDAwMDAwLi43MTQxMTY0OThiDQotLS0gL2Rldi9udWxsDQorKysg
Yi94ZW4vaW5jbHVkZS94ZW4vc3RhY2stcHJvdGVjdG9yLmgNCkBAIC0wLDAgKzEsMTQgQEANCisj
aWZuZGVmIF9fWEVOX1NUQUNLX1BST1RFQ1RPUl9IX18NCisjZGVmaW5lIF9fWEVOX1NUQUNLX1BS
T1RFQ1RPUl9IX18NCisNCisjaWZkZWYgQ09ORklHX1NUQUNLX1BST1RFQ1RPUg0KKw0KK3ZvaWQg
YXNtbGlua2FnZSBib290X3N0YWNrX2Noa19ndWFyZF9zZXR1cCh2b2lkKTsNCisNCisjZWxzZQ0K
Kw0KK3N0YXRpYyBpbmxpbmUgdm9pZCBib290X3N0YWNrX2Noa19ndWFyZF9zZXR1cCh2b2lkKSB7
fTsNCisNCisjZW5kaWYNCisNCisjZW5kaWYJLyogX19YRU5fU1RBQ0tfUFJPVEVDVE9SX0hfXyAq
Lw0KLS0gDQoyLjQ3LjENCg==

