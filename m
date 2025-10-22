Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1B2BFB06C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 11:00:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147705.1479881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBUhI-0006gd-Ur; Wed, 22 Oct 2025 08:59:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147705.1479881; Wed, 22 Oct 2025 08:59:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBUhI-0006e0-RG; Wed, 22 Oct 2025 08:59:56 +0000
Received: by outflank-mailman (input) for mailman id 1147705;
 Wed, 22 Oct 2025 08:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XfCa=47=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vBUhH-0006du-UU
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 08:59:56 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 768885b5-af25-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 10:59:49 +0200 (CEST)
Received: from CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
 by DS7PR03MB5446.namprd03.prod.outlook.com (2603:10b6:5:2c8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 08:59:45 +0000
Received: from CH2PR03MB5223.namprd03.prod.outlook.com
 ([fe80::64db:a9da:5b27:8665]) by CH2PR03MB5223.namprd03.prod.outlook.com
 ([fe80::64db:a9da:5b27:8665%4]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 08:59:45 +0000
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
X-Inumbo-ID: 768885b5-af25-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgsO1s9UYQ58X2OjzRFobpkR7gOwyd3asxIgfSbd725Ynq/2KtnZcO9ozHXX0zNLK33zaFt91ieIWFk77v+E4yqdLelR7+85hh3tARUKKVc57JEzWRSBm4wTeU2lVqedulCGJE8Mh2cXVS9kgXEHgTlxjT3iThElmzOiRjoYIcvOs8MPAAtY/kO2lzGH560Huw00e6PIZa4/QEqLE7byv6oP17PbcLvB9UWUEwkwWv36E6SCIPEbyAH2s7qij1vp8RYTxdQmAR8WfVQgl3sIHLysa+HnKS1ac36lHH4FqUbhL696F1lzyC3lVGrgCcFg8PmC/aOw9cVC61KJ9Wgamw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQ1xQgksZ9QFJl/KHo9ye+YP1I9gi0PFi1GsQ1K6tXY=;
 b=UYw9q3++rtjUgwIS3JZ98QLCLDVdxcvLLERfOHIY0tRSGOn1/84o+5oMdFNxbb36ztFgMipbRPrgK7G8+4gAb+hENppsBo3tf4AMhSdUIoCMC0Iig+vBGBf0KAUYCHgbG9QDXEQwt7bECK2INjW2aBbffu//k+XmkQ+4JQQjmSJwV+oPMPZ/c6xsGo9IPQxhrnzc5irPRzoYoq+DE60DhiuYXcdJfu6Oq6MaPCKczPhmQ5pmdYctzxy7WaqtwM1oLgPFl9hc8MIir2A8MDwRK5unfyFuVoStH0LhON/jy7PnZC1QpPnbCtvXFzhrfkm5yfAmv+ABu4/lkA+qvb7qSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ1xQgksZ9QFJl/KHo9ye+YP1I9gi0PFi1GsQ1K6tXY=;
 b=zzd/W5j4/QsUCkq5zADkwmkhvFk6NnJIn6pIMpajhd6D00cJVBg6TBu52l+G6rlPSKtfQwopaYtTDaz5O4Q9V71LPeiMKc2w44oTHCrnQ2AoOkRYPrInYOCduU7Ld3X8zwvScfmBosWEsA5OHHVm3PCN1g9BiVsoOIpiD/vfO64=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	jbeulich@suse.com,
	stewart.hildebrand@amd.com
Subject: [PATCH for-4.{19,20}] xen/vpci: fix backport of 53859596c0d3
Date: Wed, 22 Oct 2025 09:59:09 +0100
Message-ID: <20251022085909.76402-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0010.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::9)
 To CH2PR03MB5223.namprd03.prod.outlook.com (2603:10b6:610:9c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR03MB5223:EE_|DS7PR03MB5446:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a87d81-fcd8-435b-b988-08de114958b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?clBUZHh4blBPV2xtSVpvMjMxWmlibE03NWRIbmhXSmU3TjdENlluaENxU2du?=
 =?utf-8?B?ZnVLMU9KdEZveDFYcmJnMFlIN29GS1F0T1BJQ0hhL1Z0OVdXWWp6ZGg4dHI1?=
 =?utf-8?B?UU5pT3BaVDdjeDFrQll4ejJFVUlOOG5CeE1mUWVWMHNFaVp6elhRdjBxUlpR?=
 =?utf-8?B?enllT3o1VEdCbGFOVlpRVUhUV0Q0WThlczZEWG5XU0x2REp4YmlVV1VyNTFt?=
 =?utf-8?B?YTgxUDRVTVg5Sy9Yc00za0J5c1N2d25YdGQ1SG4xTEk0bklZeFdkUHNuLzNp?=
 =?utf-8?B?cWNpTEd6MXFYZmtKS2x4QmloT29YcGRCSjNSZXVmamdwU2p2K1NDNG9tNytG?=
 =?utf-8?B?YWlzTTNTVVVwSHlTL1owUjVwUjh6Szg5RmJMTnJ2cHVkeHhFeDZGb0svdHo0?=
 =?utf-8?B?dTZ2UnErZFNzL3k3eHRsZ0RuelQ5OEkxTFVBREFSeDhwdDhxT0hjNVdQUDBw?=
 =?utf-8?B?UDN4Ry9CMm5ob0hnWm1xejhBUEYyaGE2WEU1NktkNzRTSVE4Vld5U3B3b3U3?=
 =?utf-8?B?cG9lL3NFeWpwcittYTBYSkNLbGV4N2pCYkVXYkpzNkd4dUZqRUZjMkNYYUZw?=
 =?utf-8?B?eGt6OUx5REw0RFllZ1VNcDYzSHZIT2lwcE5VcE5hdTNhV01POHVEWldDcHp0?=
 =?utf-8?B?NGVKQ1dkdXBuRHZYUXRSUXlHOFVNdW14dGVDbjRHa01UNUxqeFVRMkFMUCs1?=
 =?utf-8?B?TktXbnlkNUxJeWFuSFhXd0F1ck8xWDdLVzhrdUJnVmVIL0p2bG1EdmRXMzNL?=
 =?utf-8?B?eStLS2k4QWxkeTRIVnlCUDVNUjJOcHpXNU96ZWN3Z0hiTHp3aUc0L3ZibHFI?=
 =?utf-8?B?ZG9kMU5DZGNkdnNidzUwTVpLZXZpbGNOM2RxMjlraWlCeWxIMGJEck5jRGlI?=
 =?utf-8?B?SUY5R0R4bHJuVFRqNXY3NXFjRS82OTJzRjFyNDVlanFYRzY0NWVtV2hneGVK?=
 =?utf-8?B?OHQwbnBrQW5IbGNkcW9nSjQ3a2tkNUViOENicEJ3Zm1qcTBpL1VqY2RVQlQx?=
 =?utf-8?B?S2orbVNZVVMrZVlBcTZlQnQxUlMyUHVidDVIRnZVMUNubVU4SjJFOG0wT1dP?=
 =?utf-8?B?aHYzOWlwa29Fclg3S0ZtVVROdVQwRkJvekpOOEhzUFJnN1c4cmZ3cm9DWjNw?=
 =?utf-8?B?QUljNTVhaDMwNllzU1dFTnJhbUpQL3F5bnArUFRzZk5mclhyVGFhd3MxbVhR?=
 =?utf-8?B?OVU4VFFtU1VnSFF6K3VGeVdLeFd0SkpFY0VBVWk4Q3N3RGtBNjg0dUk1YUdl?=
 =?utf-8?B?R1hYM215QmZOL2ZqTS92dkV0a3hOMm4vMnJPL1JoYmZYUERwd28yREpSWjZj?=
 =?utf-8?B?V3g3NG05VXd6T2UrQ1BoMjJ3UXhrZnNZUWVKc0FzVXBpRmZmZjRMbGZRUXNm?=
 =?utf-8?B?SVlOOUlRWkl3UHF6cmhEdVc3SGt6azFGSmtMNithalZzZCtYQmFYVlNPT2Ri?=
 =?utf-8?B?YzJlOGMrdmErQWZZVU5sWE1kUjlHVzlaK25ucDZQNWdmTHh0RFZhUzRRSDBW?=
 =?utf-8?B?ck5EM01HeW1ubjBjRGtQR2hhc2FKeTliMkNwUW5vb1RVN1o4YnBjMzM1RlZx?=
 =?utf-8?B?SXEyaDlkeDdscmV1bkJxNndFUEQ5Vk91MkdyRTNqaEdqRC81ejRCN2kvR2tn?=
 =?utf-8?B?dnhHS0ZMbExadnBKdTBCTzlKNFkxWm45Rks1ZkZhU2c2Mk1FUHE5Z2hIeG11?=
 =?utf-8?B?T29OWVdpVWhXenJtdFNITEdlY3c2QlJ5N1I2RXVQbjErek1OL3ZhWUt1Mkt2?=
 =?utf-8?B?dDBCa3pyOWZBNE9Wb1EzcThsT1R3Q2lpNU11MGRHZXdmMjUrakdOWEFwZG5r?=
 =?utf-8?B?TVBWRmdtYzljWHphdTZlMVFUcXdtN1lXcFE1a0I5WGlYV1VROE1BdGtiRzhL?=
 =?utf-8?B?SWtkRktwZWlWSzBPVngraDE4SUUzV3J6ZGltaThKM0NQUnRSRXBTVlUvMTcz?=
 =?utf-8?Q?++MGLVYphiiPvd0NGtpEwNMdLlNsb3hN?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR03MB5223.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1NqTHE2VGtjelRNS3FPSDhmRzRVazlZM0RvZnlidVFra1lPQzRkK0lLbk9T?=
 =?utf-8?B?M2NVSC9BOFJ4bDZYSThncEhZU3J2azhNTnVkU1dXUlJwMFFrWVZSY0FJMEty?=
 =?utf-8?B?MGhFWFBBWTJ2YUVhWjViM09rSlZPRGlwWGUrTnBQamxCV09jdU9ncm55Q0JU?=
 =?utf-8?B?UnhndnBEVi9NcXhVUS96ZGhDcitmbnVXdDhiN2tsQ202bnJLajZ1dUJiNmR1?=
 =?utf-8?B?VU5yRWsrcWNJUENDaTJYcFZ4VkVJdVZOZXJqbDQ3aFpmMUR1SlhzZjJWVUdV?=
 =?utf-8?B?NFJWUHhBaXFINEhzKys2ckxUbzFoUjBNdjh3Z2RpQmJudVBIV1dXY0loc1F0?=
 =?utf-8?B?SlkxUXV1NlAxcW42Umh4MjJGMlk5eWFkOWkrWkR4N2VEcUpXVDltUlhXeEV3?=
 =?utf-8?B?UnJpTWQyajBHWE1ZV3kvN1FlQmUwUzFkMWVMUE84Q3UwVG1pWHB6RE4ydVFq?=
 =?utf-8?B?YlJjRHJMdFdYVDZWREY3SExNVjdwYlhDeUFiaTRycC8yQkxScXNUeW1HVEEy?=
 =?utf-8?B?TGFlVERWeGp6VTF0UnF4ZngxZG1FMm5kUVhleU53M1FDMlltN0IwMnpqNXpt?=
 =?utf-8?B?SVNXN0VaVWoxQ3hOZG9aS1M0V1BBNVBDd2hRSWxjWlRWWkRUZmtMdG5jd0t1?=
 =?utf-8?B?N052U0c1dnNwV2gzcXpqci9tOGkrUmptcHg4UVdCaytuNzFYZ3NTcVJuTGhj?=
 =?utf-8?B?enBCVWI4YW9kOGJ5UmZJV1JNb0NjMFZxS3dBMGRocXV5NTc0OXpVOXd0Y3lO?=
 =?utf-8?B?S0hqc1Bjdm5HM0Y3Tytqcys4UHN5NlcxVmlqK3NmT3o1di8vOFdmWGtJNGxC?=
 =?utf-8?B?dUgvMCtIWmtqTmc1OWY4Q25qcUVsZWVTQS9YYnB0Y3lvdXp0NTFXTXNBaVRF?=
 =?utf-8?B?YVhKUFZGdFlKQ1RyUHcxQ1FSaEVrTkV1VGhiQWxINUhKVHFFVUI2b3R6QTRq?=
 =?utf-8?B?MEFYQnpDWU45NHFjbDl2cXZ2VWsycThONHpxNWtnRXZVS0MzSHZqcTRKaDdQ?=
 =?utf-8?B?RVVHT1kxZytOTzMwa2t2V1J0YnpsSHhFWnBQL05WbnZwTWo4VEhacVJtM1ov?=
 =?utf-8?B?OE1RN2VYZlRPOEt2eTVrTjYybE5XTXU5cGsvanZVNkY2MjZNOGxlNENkQmJs?=
 =?utf-8?B?VFhJYnRhakg3NHQ0Qis2KzJ2b0J6dE5FRzI5czJXVUlDNGVMNVYwU0FSSHBx?=
 =?utf-8?B?R01XK1RUbFVxa2VwMXRKdXI0ZEh1SFhHVDN0cGhUQlJyN0lmN0lidmswL2xX?=
 =?utf-8?B?RHFsYjJkY3I1SGwrak52RGI4S24yV24xRVpkd1VaRmNGKzVPSEltY0Y3bGZk?=
 =?utf-8?B?czBUdWdqc1FKdlpwODh3RlZtNUczSlFRVjcwQnZrVmxsMW5nMWJQaStXbHgw?=
 =?utf-8?B?TFdrTGZjYzlXdjArcm9XWW1uM0ZzbHl4TXJTN0pxVWZFb0tCRExiU0tlRHVx?=
 =?utf-8?B?WVVCRXRXc3RkZEZVRmpPNlgyak1TMGNMMFBJRlVNdXc1THpvMDFqd1NtWnFq?=
 =?utf-8?B?T1FGTEMwSFdoRmZyS040MU9JNmRhQ1hiVS96YnhVRGFwUHliUW4vcnl3NkZM?=
 =?utf-8?B?aGNHa1FSM1U5ejBxVW9VWkI5cWxrZWFHSTdsUTFOTmFEMkN6OVRLbmE1eEZ1?=
 =?utf-8?B?UDh5Q0JmeEJWQ1Fpd2Q4VC9LNmFnOElwQ0lGd0NHT1R3YVEzeHhqWERMd1ZL?=
 =?utf-8?B?cXN2bkdGaVYyaWZkdXdBVVo1Q1BMOGlUR2lXN2NCR04wMUJHSUwrK3dvZzMv?=
 =?utf-8?B?akQ0TzRHZ2c4aktxdlFZS0xqa3JReEZmbW5UTElpUnZYNk9vYWZOZ1hQL2hr?=
 =?utf-8?B?N3VWTlJ4ayt3c0NsTDFsSlU5WUdjYXJZN3dsZ21ndXdMYTZuL0RQbXc1ZWhN?=
 =?utf-8?B?b2NOMmllQ1dqbGtIL2xqUDAwUExBajE4WXRjTkxjSW1NK1BVTjJici9aY2Zj?=
 =?utf-8?B?NktWZXUvdXBHWFErZlB4Qm8wQWs3RFhkRW5UcExUSXNqTXFaV3N3VGdDVVU2?=
 =?utf-8?B?MVFZRkc4S3NIVU1DZGw4OTN3d29FMDJCSWd3MlhNRU9qSnBEQyt5aWZOd3NF?=
 =?utf-8?B?aS8waTBvYWJhdzh0NC95Q2pGd3dIc2Rna1loejg3Z2IwL3lqd2txRmozdndJ?=
 =?utf-8?Q?ykL/9FrT/y0cjKsCY1UTCGeCZ?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a87d81-fcd8-435b-b988-08de114958b6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR03MB5223.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 08:59:45.4205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcL2Jbyt9CS/cteWsSdq+ztzpz89OYfonYEA9Tsee2INzOh/dDUfMCq+R/Hr46sZh9H1b9YDP9St2bHzUQsc7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5446

Commit 53859596c0d3 depends on the behavioral change introduced in
ee2eb6849d50 that inverted the initialization of the MSI-X and header vPCI
handlers.  53859596c0d3 requires the header to be initialized before MSI-X.

Change the order of initialization and adjust init_msix() to carve holes
for the MSI-X tables if necessary, since it will now run after the BARs
have been possibly mapped into the domain p2m.

Fixes: f9aea52a9747 ("vpci/msix: improve handling of bogus MSI-X capabilities")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: jbeulich@suse.com
Cc: stewart.hildebrand@amd.com
---
 xen/drivers/vpci/header.c | 2 +-
 xen/drivers/vpci/msix.c   | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/vpci/header.c b/xen/drivers/vpci/header.c
index 1f48f2aac64e..b002eb207243 100644
--- a/xen/drivers/vpci/header.c
+++ b/xen/drivers/vpci/header.c
@@ -1016,7 +1016,7 @@ static int cf_check init_header(struct pci_dev *pdev)
     pci_conf_write16(pdev->sbdf, PCI_COMMAND, cmd);
     return rc;
 }
-REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_MIDDLE);
+REGISTER_VPCI_INIT(init_header, VPCI_PRIORITY_HIGH);
 
 /*
  * Local variables:
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index faa7c1cd494a..94fb645377e5 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -792,9 +792,14 @@ static int cf_check init_msix(struct pci_dev *pdev)
     pdev->vpci->msix = msix;
     list_add(&msix->next, &d->arch.hvm.msix_tables);
 
-    return 0;
+    /*
+     * vPCI header initialization will have mapped the whole BAR into the
+     * p2m, as MSI-X capability was not yet initialized.  Crave a hole for
+     * the MSI-X table here, so that Xen can trap accesses.
+     */
+    return vpci_make_msix_hole(pdev);
 }
-REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_HIGH);
+REGISTER_VPCI_INIT(init_msix, VPCI_PRIORITY_MIDDLE);
 
 /*
  * Local variables:
-- 
2.51.0


