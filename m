Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A9FBDED3E
	for <lists+xen-devel@lfdr.de>; Wed, 15 Oct 2025 15:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1143616.1477323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rS-0003YI-C4; Wed, 15 Oct 2025 13:48:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1143616.1477323; Wed, 15 Oct 2025 13:48:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v91rS-0003VG-5d; Wed, 15 Oct 2025 13:48:14 +0000
Received: by outflank-mailman (input) for mailman id 1143616;
 Wed, 15 Oct 2025 13:48:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pY79=4Y=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v91rR-0002AF-0O
 for xen-devel@lists.xenproject.org; Wed, 15 Oct 2025 13:48:13 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9736b2b9-a9cd-11f0-9d15-b5c5bf9af7f9;
 Wed, 15 Oct 2025 15:48:12 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CH2PR03MB5176.namprd03.prod.outlook.com (2603:10b6:610:97::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 13:48:10 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 13:48:10 +0000
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
X-Inumbo-ID: 9736b2b9-a9cd-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9tktHKpTpp8m+KVrQIxfYXz+xLxjHIGP2kwPsmdlgf2C3CIjBDdycmO/pYs+mLAoScALRkkXonm4h+R2fWuM2J3r5Z2Uix5SM8ITQ7FRzNwJcXzldX/8bBawX/mg8SACFicuZDqyng57d9PsdCKJYu+rNul//5/J3PQeVJbl0KfChlXxcg+vRcmOeKqRHdeeWRMRuf0xDR8wq/X1Tk5ZL/1i+nxQmEhFv46yjVSKZaUFoMdjSJ9xRzu7nV1c/5k0erlkeDt/i6M7dIVMW2bosS680/78QZoYTeYjZ9FJJqis2uiN3k79jjd2JVcF1twFC/Dro9JIlS5f90VouuaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAZenEHHSJc9XuumDpKzapOsydcxgd6TjINpy1Ft2iE=;
 b=bukHzepcWiIfWk30DaTWs1OaVr/9pqNIsUNGSqHN+qQ2XeBgvQcIP0O95QMeuhXRoR9qVSpwA0KLyCsa81lvLtYLFa0fA3ZZgZ6w9SdU2nNZjctzkOmHC7xE0+nyYHeqK3Mx4Q+mjOjTbkrgeEk7nTUjM1zkNoSheqVtpisesp245JSKNU6AXWR39URajEtndYNfb59cYqiIxg7QDgw950shTcv70u/Z1vtFqWsaT7rp62r9E7YBB5kC648ElX1qzLSCyv9boVTyqs6GJisjCQusNguaJL7JoF8+3sXp17GniXPJr2uv0jJc26zNCjdxfMrFlNdEkMVwhOGzAP2EHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yAZenEHHSJc9XuumDpKzapOsydcxgd6TjINpy1Ft2iE=;
 b=fIxf75mlf9MlSJJEiKYVUth3DwK0LulHHnPsEVXffvl0PmhE65LqMt6bXFhvzdPZPeEhTShcdgww0LvhhaacvaRkoCFoNpf2wAI5+hxMgyPz7Ik3BA1oIVA/oIPMUazSLq5U7dzLliybf65/8ojeVYQ9LjhOmOYS/gszsd2Xqfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: oleksii.kurochko@gmail.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH for-4.21 5/6] tools/xl: fix possible uninitialized usage in printf_info()
Date: Wed, 15 Oct 2025 15:40:42 +0200
Message-ID: <20251015134043.72316-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015134043.72316-1-roger.pau@citrix.com>
References: <20251015134043.72316-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR1P264CA0137.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ce::9) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CH2PR03MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: f8955876-78aa-457c-6335-08de0bf17aba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZE9sQkdyRlU1WkRiVm80WW9vd2F4enR2UCtZMUJlUFJiWlR2WmtuRkxkVTFa?=
 =?utf-8?B?WFh4dWpTQ3JrbFdKeG1RcFdsZkNPSHVnNHpJU25pS2xiQVllREJZcW1ZUThT?=
 =?utf-8?B?ZDI4ZllnZ1oxWG1XK083NXYrYmxSYXNaZEM4SGhVRG9sK1pnekEwVUd1ajZT?=
 =?utf-8?B?ODRKRGlGMVFibGR4MGc0MXBOUHlPSDJWWVZBanljV2dyeVNZRmR6TnR6K1ZJ?=
 =?utf-8?B?OTZPdmQ1YUxSdlBQOEQ0bWQzdU9yRFFkN2JWWjdjYWV6WnFBUWpuMTlsRERI?=
 =?utf-8?B?WXRmTG5pYzNrS1JXcE5ucUhpNTA5T1ZUM0FYT3ZGTHozS1VuSkl1bUIyOG51?=
 =?utf-8?B?WVVtTUYwR1Jjbm82cVNnR1VVenkxbGpvSkM5YmF5RVM3QWZiWGxjSjdqbHV6?=
 =?utf-8?B?SEdDYUZ0cmtIVnU2L2ZCZEErdVUvZzZ0K2oza2h6NFZsU1dJaXVsZ1d1c2hs?=
 =?utf-8?B?c2dqTHpDanUrQjRwNUtpY0UvRjJhS1J5aDRTQW9ZNm96KzRHMjh1SzFxaU9i?=
 =?utf-8?B?SS9VanhlNUprdGlUU2diQjR1elhuZUF3ekxWTnluZ3JWS0dxc3pHeXJWajN6?=
 =?utf-8?B?T1ZsMzkybUx4RWJKdUk0WktuUDArdkVIWVQ5RkxWTm5icmFpZXZJWnozbXMx?=
 =?utf-8?B?cUdWczNuVEZmQzRXZ3hvbU10L1NhaGNhSzh6a3BuWkE0WXZiZkZzVjFiOHR4?=
 =?utf-8?B?ZTlSNXZpWklSTWNYK3VIL3MxbmxoWFU3ZWs0akQ0QjRrVkpEUjJiaWJsVG9l?=
 =?utf-8?B?U2pFbURDMm8rcWFTVzZlNUcreVJ6MjFvTDQ2ZFBwcGFDR2hXdVBZNEt4RWMv?=
 =?utf-8?B?enZKMVllVi9xdjNKVERzZkNKRFpBL25qNjVnQkYyUHF4alJlcWQzL1ZraGlE?=
 =?utf-8?B?STlER0VsOVJvQ0V6ZVppZkZKazQveW9uNS9TaTgwQzkwdmsrSWV5UWlxTmtw?=
 =?utf-8?B?TjdNeTZWUVl2aTR6MWU0REFlVlFqbTdiOGxpbk5zWXg0eXd6RDZOc2MydEFL?=
 =?utf-8?B?K3ZlRGRTLy9objZyeEVudHBjeEIzSFZ1SGw3K1huZ25TTUpsZWgybEJDRUNS?=
 =?utf-8?B?K2tyZUJMU0lOVklsaEtmTkpCazNaSVJqaWFqeGxhdHRlMU5rTUo1MS9ONW5V?=
 =?utf-8?B?dTZ4RldoR3d6QTNoZ1pwd3phZlBaNmFSQTg5c2RuWnpwZTVpdEVzTE1XVHVy?=
 =?utf-8?B?eEl1N0NpYmozYTNqSUdQVkwzVUpOcGQzVklwNW5mUjZoV0lzMWdKSDRhaTNL?=
 =?utf-8?B?Uk83Y0Z3aEoxWjd6bjN2OElrWE5SWW5mSW1iM3poOTBya09WN00wWHltRHh3?=
 =?utf-8?B?Yk1kcEIxZEFyUVI0dWpaMFpjeTJwekg1bGV2d2xTRjJqemxvUWtSYzJyZWVs?=
 =?utf-8?B?aURQaDVEMXlIZm5vSWh5TE1KSnV3ZXVkcUFjTUFOT1JMMzVXUDNRb01qMUgz?=
 =?utf-8?B?K1lwUXFGZDJYdDI0dW1EMVVSUVFhcW1SckxhY0tMMGRBV0QzcjEzYzhVblBz?=
 =?utf-8?B?ZWpYc2xKQVRRbkx1Mml3WlI1NVJtc1ZLL0x1QkNPVHVpL1gzVCtzSUp2dURN?=
 =?utf-8?B?QkgwWTd2YkhUbU5uWHNteFlUYUR0MHZJeXlsaU9MVjdlSW53ZnM1dDZjbzAr?=
 =?utf-8?B?V3pWZXViaHlwRlQrdWlzZk42SG5lcjdBWTgzVmxUeXhxME1KWWVrUUFWT3hR?=
 =?utf-8?B?R1NvcG9NOVh0S21XL290SEowa0laWkY2d25NRmtEdzZMRW94ZUNISmJlVkNN?=
 =?utf-8?B?TEVSRHJnV1YxTDd3MjB1VGw2bW9rK240UE5PUXlMTGJGSkdkTVg1L0FINGNa?=
 =?utf-8?B?Qy8yd2cxd2xoM1ZNeDFwOUhSSFJrQlRhd0tLTFp1YzVFTS9TemVTcUlYNmZq?=
 =?utf-8?B?V3pRaWhhbjlLRy91V3NENThCNlRySEd2eGp2SGVEMFF4QkUxc0gwZUc1Yi83?=
 =?utf-8?Q?VJlt/hJDdvggOz317/aoPVsKCQJ05TGg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUxqTkw5dCtLeHRjay8ybUxsbzlMZTR6a3FQWHFncFhGb0hva3ZUK3h2NDNj?=
 =?utf-8?B?K1ljdUNvMlEwS3R3WW5HdXJxSDF0bktOeHlQUkd0TFk3QVE5SVducjVJS0hm?=
 =?utf-8?B?Wk9pYlVtZHI0akE0Y3hWRGRwOGJTWHRzdHRJcmhPbVFaNERnbTJhYVZMaWZq?=
 =?utf-8?B?Mzd6NDBSazNSbG5mVjVOaUdUbDRHQjV4eXB4ZmxpczFKbWdMejk4cFpaUkxD?=
 =?utf-8?B?Nk5rVk5pTEUzZjErK3dqM0ZmUGQxSEYzbkYzakd5RVJxMEZuVDY3eHBzbzZo?=
 =?utf-8?B?aUcyNzJnZmNXZmU1U1BGb3VQR1dIL05MZWx4WVBOeTYyay8vanVhSFdMTG1J?=
 =?utf-8?B?eUhIZEtDK1RsUmh4akdiWHViVm80dTdRVE9ESUlhOHB6dmtxSllNdU1kSDB4?=
 =?utf-8?B?M3JwVEJOV0doV3lMOGQ3em5vUXNYLy9pQUFNd0cvMHozMzRrcTBPVlJOeW1h?=
 =?utf-8?B?aUduaVJEblBmWXR1MSsxanA1UEVZdlpnM0lkajF3dS9OVG54Mkp6aE9ROWMw?=
 =?utf-8?B?cUxHS0hZM2Vxdks0bGowNmJ3UnlzOVkrNk8zYkJmUXBRVDVXbHpYODNnZ29T?=
 =?utf-8?B?ZW91YndqcDN2YXoyQy9MTTlPRzE3M2wybXVRc2YyaVRONGFrRTZLNmVRZ1NL?=
 =?utf-8?B?YUxGNkF2M3FxQisyS0cvL2tWUGg3TE1WaU1CTmR5eXdXd0huQy9sTWRidGxQ?=
 =?utf-8?B?MFkzWUxSS1U2YXBTeXJtSFRwS3cxNVlYbFdhblE2c2F5L1A3djRDWVlFaDNB?=
 =?utf-8?B?R2hKejNrSXp1R2dBVk5OWFhTTm12YTBFT2d0VkF2d3RtRmErOGs3VHNvWGFy?=
 =?utf-8?B?aGlGTlAwVlZSR0pFbjA2MUtWNlBHR09rb0pqQlEzUjg3dDZWcUxMSFFGYldy?=
 =?utf-8?B?T3ZSYmhoZlN6VkRIWFNSenkvYXhoODNLVGljb0VBSjZNK0xKVVlDdERBM1Zm?=
 =?utf-8?B?Nkl3c2haczZKK3hvaUJUK01ORXFLZ3cwUmFXMzN2ajdjdmMwT0JlODBadkh2?=
 =?utf-8?B?eitGQ0pXVWxpdDRsSjh6SGlHVWhRREVlVVJIT2cvbVRPcnVuc1ErcWhpTGxm?=
 =?utf-8?B?NWh4eU91S2t5SS9Md3pRdG1iTUxkcHBsQ3hSMDNwcEhOY0toR0dMNk44WHJE?=
 =?utf-8?B?Z0tPczdMcmk0YUdWdysrUWNYZU1uTU5CcC9kbjM2WXVwc3ZGMHNUN3RHNXhp?=
 =?utf-8?B?Yll2UElzcE9SL0RMRTQ5R05NOWpjb0ZXUU9aM01xdmp1YythdUp1ZFk3Sk5I?=
 =?utf-8?B?aWVISmd2QjhtNFNlQnZNYSsybE9PdnFldERPZFIvL1ZXa0Z3amV5aWMwZFR6?=
 =?utf-8?B?LzViNkRPdkJ2TGkxNFA2MnpjWWRxUzE3dEorRXJSNmtMVzBsWWNud01yaWJK?=
 =?utf-8?B?YzdTMkQ4SXJrWXFDdkZFeDB6dUV1THpybTNxUVpLei9oWTF2VmZCeEtIMGQ5?=
 =?utf-8?B?cVlnbUNON3lETVROYTJBaHJDQ1JaalVUb2xzT1JaMGxJVENPL3RqdW5JeVd6?=
 =?utf-8?B?UkRzWjhuRVpRY3drcExqWlFFVTMvTjFiNnl0L0NmT1Y0R28vdzVPZTRtSnYy?=
 =?utf-8?B?c1VQWitLc203V1IyVFlxcnQweS9pT2JCQTFNVjhRaWtKVTRYZ0hyUEs4Sjha?=
 =?utf-8?B?Nkk5RmxjVDVqYVBBQ3Jha2ZOSVFqRnQvMWNDWTJYU0hNOVduRkVSRXA0TTFV?=
 =?utf-8?B?eHpIOGRiZVV5WHR2elVXTmJodnpaRTVkak9tV0FpS0JuVlYwYXJ0N21aMExj?=
 =?utf-8?B?eXZDNElvR0YralhWSEJrR1RjNWdub085WUhPS1MxZ0F4R3gxdnNyOHU3S3o1?=
 =?utf-8?B?TjI2aW5KQ3YxWUFCWTM1VE9WOGZyK1lRYkV1WTJLTlFzOHUyeCtIMHQ5dFVr?=
 =?utf-8?B?MDJuWjRQcTNHWk5ROXdjbzRaT2J5dkh1VWtVN1NDMkJwNkRqKzlnVk44MU5z?=
 =?utf-8?B?akd4d3JGUlY0M1hlY2o4dGtPTkFyMEJ1U3A3YlkxNXhWeldHY2thNlJGQzh6?=
 =?utf-8?B?dDRGZzBCdzJacTdrYVRlZkJuc3lkVmJRL1JNK2RuQzE1ckpTVXA4RXJ2V2Z6?=
 =?utf-8?B?cGxXZEU0UkRxUE1STUhsZTJmYUk3YlJoeDVRV0FIUDEwU3doYStZV2x0bGFP?=
 =?utf-8?Q?Wh7nwSKChmFScnIt95r5qXUsA?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8955876-78aa-457c-6335-08de0bf17aba
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 13:48:10.8355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbCkNFXp3pN4FnVqUEI3/rhpGDbNnTtNrktaxVIh8bSZwt8puIy5EPLyWxYewRbQOG0qT35O0U8LDenxb7g55Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5176

printf_info_one_json() won't initialize the passed jso_r parameter on
error, and hence the usage in printf_info() needs prior initialization,
otherwise an uninitialized pointer is passed to json_object_put() on
failure.

Reported by the internal XenServer Coverity instance.

Fixes: f6c6f2679d49 ("libxl: Convert libxl__object_to_json() to json-c")
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/xl/xl_info.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 696f1f7423cb..0314ce7d4c22 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -155,7 +155,7 @@ void printf_info(enum output_format output_format,
 #ifdef HAVE_LIBJSONC
     int r;
     const char *buf;
-    json_object *jso;
+    json_object *jso = NULL;
 
     r = printf_info_one_json(&jso, domid, d_config);
     if (r)
-- 
2.51.0


