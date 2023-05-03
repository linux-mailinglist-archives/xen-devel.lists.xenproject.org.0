Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52986F5524
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 11:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529062.823029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu944-0000g5-NO; Wed, 03 May 2023 09:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529062.823029; Wed, 03 May 2023 09:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu944-0000dE-K0; Wed, 03 May 2023 09:46:24 +0000
Received: by outflank-mailman (input) for mailman id 529062;
 Wed, 03 May 2023 09:46:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S1uT=AY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pu942-0000NW-EQ
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 09:46:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bbe9fa1-e997-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 11:46:20 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by DBBPR04MB7980.eurprd04.prod.outlook.com (2603:10a6:10:1f0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.22; Wed, 3 May
 2023 09:46:13 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::768c:6df7:9afb:acd7%6]) with mapi id 15.20.6340.031; Wed, 3 May 2023
 09:46:13 +0000
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
X-Inumbo-ID: 5bbe9fa1-e997-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baVyL1YjsprtZuoztGplHhfLl3GIExQ+Byq4JgrWfmfX7r/N303+eIdSzV4KloqlV3Ymvl+PrAlL5VRjF8UVgvw7M+1PItN2OAPJdooiD2IrPFrnJSXSES4CLNUbPJX68veDCfJZ3JnI3TcmsLxl0NdRrQfi+2GQN5sexOVt6EISbi9TAp7oa6Z2DcpvLraGfWmREB8yXOnQ9dyfN693LlKy9pwIhsAie6+5t8IE573CaRqHtBPhfkHzee5yGDqYX8f1237YxM/G2kdqGRSNw4cBCeZvG1wRy2EcMblr94BrfSYndG7mGDXU8PzOozxLv5ESnq8ygfS3LjDHOlf0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ws+81il08fZF9Iyvf//QRJ+mt2teUl0Lbm4jBjIkcAo=;
 b=c2NF8nB8CjOAOryJyw4anItilvXvtyfOf6XAkN6Yu/yH6QEfle4SY+flQ20iC4mrSkeAfPmM0eCLfxrUXpgvsdew3cVMza9Nx2SEFgMtLe9Y47L+sA/+htm666ln2/uI4kktOMXmGT3uuRHlPpB2NLXKAN27qvWYwbwIEOGtLyGALLwNvHqrZrBjPldOEi1LZtG1HEQKODKF/TegIl1BT0ttOgp75CvMmRfYewVKsqFtDGSZIT1goLrGpouRaj87bB27I68iR3MQUp+PB3G8cZB0o3VjepFZCrLL0AMP1N1/C3/SU2zeEWCOD9MNhgO23GKdsjieYmGhF2MPp38gGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ws+81il08fZF9Iyvf//QRJ+mt2teUl0Lbm4jBjIkcAo=;
 b=amgxSUQqariV5Z5kqocOG8FAyVQZS3nVpB2u23E7qGlxCuq6nkpSIucU/Jbd+XxNMf9kdcaiEPzg47WNX08Vdw2FHmyrxCo80HhyyI50qPC9A+/R57HD8xHPYm7ieVPsOkJ5Iy8rdUJetjWfSuQFQaiVG4JSgqSyeJLTGutVVdok4Cce4XVzaOLyz9x/dTQExuQI9rxV7Ug3Ik0Wj5hw8RbdJxKb2Lg6b0CwnY3ws0pk3Q7IiGshPQnEfh5eTSLL5O6UocmAwdt39Sbc7DD783t3sMcuSdlxbG9S84h0CZaWvoCnbZ10I90kUQDjQuzsX9p/wbDqpbSTknBz4MSmKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bf99949c-0e09-13a5-3ad9-a6c26377bdbf@suse.com>
Date: Wed, 3 May 2023 11:46:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: [PATCH v2 4/6] VT-d: restrict iommu_flush_all() to cache writeback
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
In-Reply-To: <c030bfde-c5bb-f205-edff-435278a435f4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|DBBPR04MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a1238cc-c88c-40f4-e604-08db4bbb3b83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ClJdEjTpDKlYlZcz6EMYiejEPiGMD6VV9DUGIWvjRhbtqGCMWn9eTa3PBqsD73O6+3VuB/pXw1JhvarF2XrgnYMFSxocaFfEur5pLLravmG6Jvkxo0Hy9UFW6LlXLPUPbtnDSy1NU4T0FPnPyataGDtoSSFi4hqoZAy5LRdR5Z3VEbmjp3KDInh/HJ+35+lBbhVo7lM4M2MuCEBCcsBiWL/p39oQF7TNZwWUYtRZ8eSycmO6Ng9UdFGdOdPGZZgb/llj78CWDXKEmKELQPcNxqbPpOEx+kfNP0VgXvLQB2nbb0jwWrR95kwXttTp9KFNXZJ55k+z5/Y5irGXA0oiEfucu2lQddq0ygsS23ylOW//mppRPJrd4nwqeF22rWtmWcDPXNTgVXqfVzFtW8SHDlcxGQT21yw4LZyaxtmwpJusr4oFsQDkY0ahREfNq1F/klT21FJ9K9ccagZ2We/GPnBG1yFm6xYgUoCHL1TgGoKB6FYGO4AXeAD5BSe7BAC8X/h24+uec8ww8y+gFBRYMMellTG7ravC8Bf9IJuI7kroKni6NTs0feNeMjMZH13ZXmI2ZQhpGIuZlGjBojzMkCxDYAwdwcrMopQmkc7uTf5gjep3X902jo9JIJ1ksNXPmYrw+iQyP32893itb/713g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(366004)(396003)(451199021)(6506007)(26005)(6512007)(186003)(31686004)(2616005)(4744005)(2906002)(5660300002)(83380400001)(8936002)(8676002)(6486002)(41300700001)(36756003)(478600001)(54906003)(38100700002)(66476007)(66556008)(316002)(31696002)(66946007)(6916009)(4326008)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVdzZ2tsaU5oRkkrbmhIY1J2UVNMWXpGSmg3M09UOVNkOWRUK0xxNzFzWWVj?=
 =?utf-8?B?SmdHK2pxNFA0NXUzK2ZSa2E5aTlBQVUrVkNGdTdWYzlQbVhucklvNzdUYzJE?=
 =?utf-8?B?MEMwVVFDUkRranIza3dBU0RFOExhQi9ZN2s0WEljWGMzaktNYkRnUUZBK0pk?=
 =?utf-8?B?c09WL2ludGxvSlIyK3g1alFCYS92aHFiRWNQaXc5ckJLQ2lpd2NPNmJKZ0VV?=
 =?utf-8?B?RUdyZ0IxVVZ1Y1M5VXM4bW4vMmVvbkJxYm1tdXkvbVV1cGd2eUtVb3RtUXJ4?=
 =?utf-8?B?cTM1aTNaN2FETmFSS0JJR2pFbmtTUGs4Z0VES09mVG5KNVIzZWdXS2dQQ2Rs?=
 =?utf-8?B?ZzBQcjNLK2k4aHY3ZUNSZDRDN3FrczZyWVR1ZllMd1FLbE9Hd3p0Z2NkS0xx?=
 =?utf-8?B?d1U2b1p6d2kwc0hrVHkrTm9YQTdmVkZhVkwraFdENzg0V3dLOTN3ZnBMUkZy?=
 =?utf-8?B?eFVoWlNiMVVnaGRGaWRWZ3dMU1lpdnpLUlpIRmtuN29UZmZPRmU4enZvcjFN?=
 =?utf-8?B?NGpsUFJlNFZTdDhvaHU4VEFUdmdTWithd2hwV2o5eXNWa1lQaHArQ1oxd2hV?=
 =?utf-8?B?aUprcHhmbVcrNmZMN0lzQnBEYS9PdkVMTkFSY1A2VlcwNTFoRE50a2c3bUpQ?=
 =?utf-8?B?d0hwTm1LSVIzZVFmQ3gySWVqRGNxZU1oNldST1ZTS1FzMDNqMERTUUU4UzZy?=
 =?utf-8?B?NDMwVCtMMmlPMVc4L09JSG5FWW9MYUVXM0cwbFVXTGw0Y1lCTmIrYm12dUtG?=
 =?utf-8?B?cEQxY2RhMzNlUXZVa1VKS3FZTjlHdWF4Qkh2bzNabFdWb2dkN3NndWJjYjcv?=
 =?utf-8?B?cWQ3Uis4UW1MQks4MitpWGJBSittR1laakt5U09EQ3FYQ0hNWWxHOHZLWnZa?=
 =?utf-8?B?UTZMS3g5OWg4ZW5XT3dXaGF5QWNJbkxObXJza3Y2V1Y0c2FYT2UyWW52Zks2?=
 =?utf-8?B?R1QxRTlSRmwrb0VNUlBwb0pqOWozNzBsZDY0QUVJRi9VZWVxVkV1MCtzY2xL?=
 =?utf-8?B?WFZQcHV3L1crNUhPUXJBcXptOEt5bzk4OFkyYUlwYy9KK1k4Z0d4aWVtb21K?=
 =?utf-8?B?cUhHTUxTbGFBbU1NUHg3VFBwUFZqUGt4TWpOWUlNYjlibVVBYkZoZnBJaC9K?=
 =?utf-8?B?N1VjVDJjSGtmMGRVZFd6MkpNUFhkM3kyc2JhSkxldDZLRlprUzBzamJWS3oy?=
 =?utf-8?B?VnhXS2NuSlFlTU5qMGo2cEFNK2VqTUZOalZ5a1FHc01XSlhKZHpNUTdycm05?=
 =?utf-8?B?RU55ejlRUmtHRVVKOGErbXV1WHRiN2NGT0hiNXVtWUIwdDV6UTBYMDkvNGMy?=
 =?utf-8?B?MSszQS9qR1preXlsZWRKS2x4TDhSMlRjR09wUEFramgzUE8rTGNPa0NpLzZp?=
 =?utf-8?B?R1A1V3B3UHNaSUprbytRQzhkVjJtL05TQXRndWFBTTd6UER3OHBTTTVBTUJm?=
 =?utf-8?B?U21pRnVFQkY5YzdteTJ4U3hqNTdqMWVva2JXdWlGS0ltY0x1TlBrQmJ5RXNB?=
 =?utf-8?B?UkpjRlR1cSthNEdjVUNxM1NmbGlJbXMrbnhJOFFZYVdNL3ROTE92MnZoUTA3?=
 =?utf-8?B?SFJydDZuTjhLUk9YMXZoRHVFS2ZWcWwxUUgwL1R3czVUaFZiTkFVb1BKQXhT?=
 =?utf-8?B?MkMyVVhyTkxqeHpJM3Vkamdac3pPNEhSZXdncW1teVd4SWhrSmczTTRWcW5y?=
 =?utf-8?B?RmZOcStrcFlWd1VVRGNYLzNkK1VZY2ZOQXpTWVFBc2ZQRVpaM0ZGaEZtc1NN?=
 =?utf-8?B?VE00UDRlN2JEWmhoY2FHc3ZhZThsOXhWSlk4RHVrbWpicmZwZy9peERGZzN6?=
 =?utf-8?B?bFVUTk1IaVNmdWZQV243MjFVVzJEVlJueEpPRVdUbVhWZitCdEw0UllwdnRz?=
 =?utf-8?B?VjU1anBlQlhZaWVQQURHWE5ORUgxVkRuTmlwc05SeFoxNFVoMTlPb1pIWk5w?=
 =?utf-8?B?RElpSU1OaW93WkQ3OXUzRWNUQkx2QzN2clZSQlJ5VXRNVEJ3eVRjWVZVdTZF?=
 =?utf-8?B?Z2RTWUZhcFAyQkpIRThoZUVERm01cUJKU2tsMENWQkR3VzkvVWFmTGlWNFpV?=
 =?utf-8?B?MTg0U0tydjlZWmRZUDRpSGhMOEthaVFkQktSSlc1dWx2elhUdnNjRVZNVGk1?=
 =?utf-8?Q?YAnr6AOKPPVA74P/Fj2VOMMw1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a1238cc-c88c-40f4-e604-08db4bbb3b83
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2023 09:46:13.4542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XzSW4C2/tBeUvdnlgoTGW4+dhDrRraPPIiedr5w9JzuBXfbHq3IqBvBeFO2kv90l2W9ZNez75QPniwfFM8W/Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7980

We don't need to invalidate caches here; all we're after is that earlier
writes have made it to main memory (and aiui even that just in case).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This, aiui, being an analogue to uses of iommu_sync_cache() (just not
range restricted), I wonder whether it shouldn't be conditional upon
iommu_non_coherent. Then again I'm vaguely under the impression that
we had been here before, possibly even as far as questioning the need
for this call altogether.
---
v2: FLUSH_WRITEBACK -> FLUSH_CACHE_WRITEBACK.

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -693,7 +693,7 @@ static int __must_check iommu_flush_all(
     bool_t flush_dev_iotlb;
     int rc = 0;
 
-    flush_local(FLUSH_CACHE);
+    flush_local(FLUSH_CACHE_WRITEBACK);
 
     for_each_drhd_unit ( drhd )
     {


