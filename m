Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B97959776
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 12:05:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780946.1190575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgiDA-0004KP-3y; Wed, 21 Aug 2024 10:05:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780946.1190575; Wed, 21 Aug 2024 10:05:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgiDA-0004HN-17; Wed, 21 Aug 2024 10:05:04 +0000
Received: by outflank-mailman (input) for mailman id 780946;
 Wed, 21 Aug 2024 07:48:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SFbP=PU=vivo.com=chenyufan@srs-se1.protection.inumbo.net>)
 id 1sgg5K-0005rX-Hr
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 07:48:50 +0000
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2061d.outbound.protection.outlook.com
 [2a01:111:f400:feae::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cca7e9ea-5f91-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 09:48:48 +0200 (CEST)
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14) by SEZPR06MB7176.apcprd06.prod.outlook.com
 (2603:1096:101:225::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.17; Wed, 21 Aug
 2024 07:48:38 +0000
Received: from KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f]) by KL1PR0601MB5487.apcprd06.prod.outlook.com
 ([fe80::2129:59e5:6c67:311f%7]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 07:48:38 +0000
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
X-Inumbo-ID: cca7e9ea-5f91-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FqTpJqpoRBo8Sy9lvE29rxdIKvKYfQ4WcIlURPCC5B0NtAi/CmDdPK3/rUTo3QOSmq5cUgQUmKp5RWIPtZNF0153c8riJDueCm0f7ND3K8YgihsIZGpJxty4BblBwQFo4qtO81/DSx8UvmNr5i6JQ50lUy+vxXzEWPTTospcMPllmWHjon6/dpRZs5v3GETqHCdhDE+FQdl7Gtqk9ZB3/lKloQL1IDkIBx+gM14hYKaFSefwVdBWAwIyKQgAveYEPEILYZqG4apPeEHwyjWtQO7NSlw2zVlyGLE+GfQ4btpeErWJtEcrAUJiKZqicVCTUqLjHsmROAHkKsRWMgY+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xcv46LbAtMXtLrGfMa4QG6Sf4EvGlsOq7eLg4KJy4mA=;
 b=vAsONj3Zv1bQdTWE0++ZhyFctp7Sfl+wZI5T8JD1GZYGokf2+x+2OrV6BFXV1qSqyi2TwFN6HANdfgvMRMV2GwIP9CjCDRFQn1o1NGbcp6u1j5frEjJwhWdoXYpTP1HLg4LFbQsN/qd+USiIsmm555WAp8h5HQpmTpth3z2dDv3UWofQFyfv4PwWLbtKuhlL+C7LU6jAdDDoAGS1TeUonYWuTWC9MilofA0hDydCM+msoD2PcZTGMcm2lFxjjHp7ywLSaP6AZmOgSskzJRq0batu0cd9aaTdjrhKw/r04UymGueP9TEVe4NLeKVxQWx5A+D4nSXces482mah5rTeyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xcv46LbAtMXtLrGfMa4QG6Sf4EvGlsOq7eLg4KJy4mA=;
 b=g3jnixOUEE/56zoSbDGlh+o3ptYtW9GfYJVxi/YJaCMlAdDRjyrT4lAPbLHMj5z6OwD4iZVdovsj+llL9NpOTRbxcvid5Q6ptCbRDAj5Wzw/cVyPAY518CYEjjrzWBBR1dH6sPESxU4By5IlWin0BUpzUlkCvluwrZq+Cg/3VjrxKAdqwl0nG22u/LgzVFAxZ7J3aWuNA8geVLoKLyP7md9DYclnZbywnvpqH92l/kOwLq8D5w6snU4n6qhIaDBh7Zr1nDZF/THbNAh/0B1KdyqyCfT94hJI4pWuSA3vk4JigL4KBJjasudqHI/i3YuqNdAcTkZTIP0f9Rf9dpuHTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
From: Chen Yufan <chenyufan@vivo.com>
To: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jens Axboe <axboe@kernel.dk>,
	xen-devel@lists.xenproject.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Chen Yufan <chenyufan@vivo.com>
Subject: [PATCH v1] xen/blkback: Convert to use time_after_eq macro
Date: Wed, 21 Aug 2024 15:47:29 +0800
Message-Id: <20240821074730.13411-1-chenyufan@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0344.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::16) To KL1PR0601MB5487.apcprd06.prod.outlook.com
 (2603:1096:820:bf::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB5487:EE_|SEZPR06MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb7f01b-a6b4-40c6-3e5e-08dcc1b5aad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BpYS8GyY/WYZ50dMpfB6yjrZr63j1c1SK2Ep4ExC8V8GsMp4InmP/XLKQ5sB?=
 =?us-ascii?Q?lqSVQFocNgABymcrrkSejnLHSqskNTsSoWCnMyKVnbUYNapBx0MJqA7dahcb?=
 =?us-ascii?Q?cFX3+Qvt2lO9MX4OW/QK6/Oc/pM5YYnbOyBfhgvG+5lFhJCHWVKaiFMSWtM9?=
 =?us-ascii?Q?tGs7FlXbDR9QsukmTl5WOrwC/VE0JpDckhFZFo7yo50tzuj9oQhK1Ci1/Pif?=
 =?us-ascii?Q?96EMptSNJPp7DutHN179p3ClHw152V7ByqhnBNGhQaqrsDiNy2+09MRjOtjq?=
 =?us-ascii?Q?OggGyrGBUWlP4FhjtCgTsr6q1HtW7oMiVU7KHYIBVAWOwQcwkXakc02wPhCd?=
 =?us-ascii?Q?8aSlr4gz22/+IXhDCoqEWvEQt+xJlzDsLpTLMDuL9wA8utV76BpmFfy8wo7q?=
 =?us-ascii?Q?Z9Z43c/FnTPdcBb17UTk6v0HfhjlzRFckjPE9TaZ1O3ixqMdN5Jv7LRGH7af?=
 =?us-ascii?Q?ASXcfMmoy8NJ50H9zhdur6G6r2AhKTqoa8rR1AdYvg02tm3FQpY8qjyYyDtB?=
 =?us-ascii?Q?xBbBe1ZmKvHDd1I1SlfBuzG36TTGL9x2KZZrKmVv7qQ3yqUQai61kGZHqEvS?=
 =?us-ascii?Q?El5vVYnEpYI+vQH0H+OxBwwXsVHl2PCaF/hv8OjD1EOlEfPy37awJQp8ZBsj?=
 =?us-ascii?Q?uKAVaNs/3qLf5aZRfkblRUVK1deYWNAbq+Mye3yslexdtVb1YTKiHPJabBYu?=
 =?us-ascii?Q?7X8Knx0QpK1lq+DNgwfn0nrVy5EUmUzNCSErEEShlfSHCYQumV2fTrqM/T6d?=
 =?us-ascii?Q?DTLzZNUDKhgfXjksubVEUhiSv4Y0xcvrDFHvCr3/Knxf7qI2Jwm7Rrynutea?=
 =?us-ascii?Q?nEo/GQgfGKfZCZdt3ulYwSo5ukTsXMdcCVf/wYvmDrtGl4z439fONNnAzxTc?=
 =?us-ascii?Q?RyCTDrkzEkNveSDklz5C1h4x/nRsaMmuQ6YjARKKGpROWwyJjUa7iZEha3uX?=
 =?us-ascii?Q?J3n6TB0TLVWrjUkMvic2bYPAz01s2QuVDGqWSdIMUCT4jUDh52uFHcp+A/ck?=
 =?us-ascii?Q?6taIwGfVuY8w2i6gsAscZr9R49MyuZPwo6uAy7/imDSzBg+HIckXMWNy3SAu?=
 =?us-ascii?Q?YYjwixNMh8CWjvVKvLuqavoQlG0Xn/xt6m6RxoHZAw8BSj3HM/6CR91VAHKL?=
 =?us-ascii?Q?qvSUWQE1DNkKIvpGqTXgMo+yjrlfcxXyjYesfxf6jCrqbjmQW4KtlMFsvPUU?=
 =?us-ascii?Q?PGRpu2SzQhLwDXrKrFlnTXh+CloeJ33mVTMA3YQ7DVIjbPr1yVlJMgREv87o?=
 =?us-ascii?Q?JLy8INhPsH3d+QPBJev6J/9XGBCG5zlqxk8BcsIzL2iwQB9GHwuJPNiKFT7O?=
 =?us-ascii?Q?5YMfS8dP+HdUV2J6mjRe7jktMCMlC651fkeQ31FgJbDrGSkdPJDDGFx+XkZR?=
 =?us-ascii?Q?qk2JrMGxhJ0i8mLEiokzns0x3u6W6n57JrOZ617hNjA/DhpGZQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB5487.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jNmyPD49RtN4YBauS5oCl6OcSRRb6bWAqB2Jz3FmEE4S+a1on13WOrj4XgTT?=
 =?us-ascii?Q?9FanqsHUhvz/0ZEej08qI+rd8tLrMbC/BaeQYu+UmpFc2+/UCFjcxrtlMt2J?=
 =?us-ascii?Q?nPFDPFK6oX/sLkfi9MHtU3fVNMmJC0M8qrQ2JpbJdbpOALcbU6uEL5uTu2jO?=
 =?us-ascii?Q?Tbn+ue786bu7S+ZFM91IRX8a1d7H1ikYrvDo1Q5FBnjUUe6Zt+jA5ccdNhGm?=
 =?us-ascii?Q?REY3+D48IpNeg+a2srYSwAOT8JZ9HcX4fl5TjdcP4xvp5Vg1z8efxMXnjLBj?=
 =?us-ascii?Q?BCQSl7eDgbCuTPfk7AQSMCfngHa/7t34yzOepNMQeH4g8dGP94y2tUlaAvca?=
 =?us-ascii?Q?zICqpV0a4rT83N1fD5sH1wzzCfwMC8t2YGHfb/LLvkj1bT7rkG2GIP3J5fcK?=
 =?us-ascii?Q?iRo1pzYyi6FlPscCM7BaYO20gwbatYp+wLtdDOPRaCBXX6qsiHmdHf+3dHwe?=
 =?us-ascii?Q?KiA3GqVnTY1EE2+BRz5D9XFrwU4YPoGdKKd80Ty84HNZaozW7miQCNiaX2+E?=
 =?us-ascii?Q?lwVCbBQunn8lW2AUmLA/3W740JNDBRCiqqoSYZMPZU0VrnfoJ3iMmxaamHGR?=
 =?us-ascii?Q?W+biwLTmtdd+5ZDN8PzDQfb0ApXpjp6NVdD79z4DHYGAlhpQpxgTFMu5jjpT?=
 =?us-ascii?Q?dtgtWgt6cEkcw442Zou25QjWwdIE9PNJohP5RzFDK4hh5/PTN6yyCm1RF1FC?=
 =?us-ascii?Q?uI3lRZImIhJBaozeDu0VdK/kdJH5MvoYrpcgkE9OZu2kVo9mf3f2ZmRHLPb5?=
 =?us-ascii?Q?kWh/OuXg8CNj44sV/q+pVMoNs61H//6rvoRR9FPiWKMMZnC5t/Oie6gj2OTV?=
 =?us-ascii?Q?JLQwSHv7kXZgMRGNpQjPLhxBAFPbEsrziaP2hnOs7RxZMELCjEueRoWRPDXH?=
 =?us-ascii?Q?xKRekgbymMPGkZ0wj5uar/+XcBbyKFr2Tyz8UdTyunA580lYo8iLZV0YprFY?=
 =?us-ascii?Q?Vk3U+mTmfL/GNUh2G0b5JibdGpA6fm4+UvVoJnZFxgtXJ3OnUmALni2udmgb?=
 =?us-ascii?Q?/9IWaN5asKsipKElQrmc5iBDF542zZ3O4FSARuhEwP2VJOUg01Ral4a8WNFU?=
 =?us-ascii?Q?LWHecJgYYcJyI5IwpApUzIog/ue39TaXjKrwBuOoTqgq0hnvCVFEP+J1W/3L?=
 =?us-ascii?Q?IUOx4ihNY2r8uqnygozvVSw/OC6w/8OPCd1HFE5NEYkeplqYxZfjUDXlyRPi?=
 =?us-ascii?Q?RTtXiSZeA7OFABRACuCl+ERBfaxT77buS+ETvh9Oqe22+tZCkwI9NmIBoLWJ?=
 =?us-ascii?Q?jkawVQmbb0c5rzq00naz7ZHfTRt5Y1fxbQfzRV06B++FXGx9SVOYzWl1QH9b?=
 =?us-ascii?Q?DorDymolXmLO8iaIMotaq879XFikO+yb98DkEQBdCONkBoh0JPFnXHa169iv?=
 =?us-ascii?Q?Jzw9jZlanScFdraS5S6aIhf1QDjVrK5e2K1EcuKtm7qeMU2bUJT6RNEnhCHy?=
 =?us-ascii?Q?ZrBK5vv75+yo63RW0V0z17FcKuzF1wqQo253kDl0MgRZHxIVJYskhIr2OLj+?=
 =?us-ascii?Q?Kd4caEKSUELR2grjZIjw70bre1E/6STFSAjNzXk0LDubu+8+N11GFq9tyI2c?=
 =?us-ascii?Q?5Tlulq2VKGtCzp5n/ceTRlxTBmajVBf5rMb5hq4e?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb7f01b-a6b4-40c6-3e5e-08dcc1b5aad7
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB5487.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 07:48:38.1441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpBNEWl2af4bEn9VSCNY9JS1bbVy6s4Y+1Jc1HOXQmKanRsR+8zLObKb9r9eo6YWvL42tTsAWQ1pk2jCNvtBeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7176

Use time_after_eq macro instead of opening it for readability.

Signed-off-by: Chen Yufan <chenyufan@vivo.com>
---
 drivers/block/xen-blkback/blkback.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
index 838064593..f6da0b74d 100644
--- a/drivers/block/xen-blkback/blkback.c
+++ b/drivers/block/xen-blkback/blkback.c
@@ -42,6 +42,7 @@
 #include <linux/delay.h>
 #include <linux/freezer.h>
 #include <linux/bitmap.h>
+#include <linux/jiffies.h>
 
 #include <xen/events.h>
 #include <xen/page.h>
@@ -134,8 +135,8 @@ module_param(log_stats, int, 0644);
 
 static inline bool persistent_gnt_timeout(struct persistent_gnt *persistent_gnt)
 {
-	return pgrant_timeout && (jiffies - persistent_gnt->last_used >=
-			HZ * pgrant_timeout);
+	return pgrant_timeout && (time_after_eq(jiffies,
+			persistent_gnt->last_used + HZ * pgrant_timeout));
 }
 
 #define vaddr(page) ((unsigned long)pfn_to_kaddr(page_to_pfn(page)))
-- 
2.39.0


