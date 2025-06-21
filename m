Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E54AAE29C0
	for <lists+xen-devel@lfdr.de>; Sat, 21 Jun 2025 17:12:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1021611.1397533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztE-0002Je-1U; Sat, 21 Jun 2025 15:12:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1021611.1397533; Sat, 21 Jun 2025 15:12:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSztD-0002I0-Tl; Sat, 21 Jun 2025 15:12:19 +0000
Received: by outflank-mailman (input) for mailman id 1021611;
 Sat, 21 Jun 2025 15:12:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x3VJ=ZE=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uSztC-0002Hn-3m
 for xen-devel@lists.xenproject.org; Sat, 21 Jun 2025 15:12:18 +0000
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c406::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bd21c5f-4eb2-11f0-a30e-13f23c93f187;
 Sat, 21 Jun 2025 17:12:14 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB3033.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2fd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Sat, 21 Jun
 2025 15:12:07 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8857.022; Sat, 21 Jun 2025
 15:12:07 +0000
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
X-Inumbo-ID: 1bd21c5f-4eb2-11f0-a30e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KguUZnrCkJU2Pmyn5JFZUL7C8Z6hQ59F0DPy+psbGRWSX+d9AOXcBc/DTMGwiEZZN3Q0T1qT5lOgt4nfDUdWREnTbyODX/9LGy5oAOEUR95tvTFv5SjMcEF0A4dntEhfVMYYIFXX1JrNqbxe8ihnODqdaf59Z6G28bF1/IgzjAMDRRkr/TV+6qZkaeRtNB7trJA10oXcLBPWc2NJLfzrWF+6Orv3avgPN70VqZaDIiqog/v1QZ08i/G01wgy1pRh80iQuPsnfGUOCx9IxrUDLXRSR04z6rsaYaCbPCwhDr+BnUKCvAuDmMGNwfyydqN2f6+jj2lQsOsZ5Am7vyzMSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bk8C0BSlJhA6mVNaKbWnyvdYNwVgYQD2+aecmXqoNGU=;
 b=mMY8G9Jf6rDourwNJG6ROT4/HqOC9rcWnFLplOartW3HwJWaNGTYPOljddJNMOhAnp8QSuA/p6gyvhxlWXs6oxDo/cXQcNZsnVOuHRK3cHXU8wJJhEhSvDiniyNrQLEw06GGOD9xXsdcsUSjkpHnnt76RcPF2Lt6/LYE4j4ZiyKHyWP2+DmUyaTJZiWehiXunAO3SJAfGmUEyAxWc15qqXdAtcyy3thGFPzN/xbTuUrqm8dwOJVQf3SzxUyv7Ix+sN4m1yPrcP3ObJbYzFgsTlbHIrKt30jc90vgaiGX9pCZC2YL0n2RNyw67GtEO+N5jd+KiDTQtS9J++IstAIfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bk8C0BSlJhA6mVNaKbWnyvdYNwVgYQD2+aecmXqoNGU=;
 b=b7EK1mj2lJ2IMoydMn0UArjGmac3utkNmla9wyHJ/KZ1Jkj/MIClokLelqW1p9w9E06mURUnhCZF7d9VQtAF/M0aqRdrJIzB0YZkoWqdFuKVLgh/d+ytJLVSUZGXXxiJXkCWQfsxULLETnByiq5YA90SIKEONVzvveMQMsKq4QI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Koichiro Den <den@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 1/4] xen/arm: Add wrapper find_unused_regions
Date: Sun, 22 Jun 2025 00:11:58 +0900
Message-ID: <20250621151201.896719-2-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250621151201.896719-1-den@valinux.co.jp>
References: <20250621151201.896719-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB3033:EE_
X-MS-Office365-Filtering-Correlation-Id: 598004ac-2d1b-4ce9-4c2b-08ddb0d5fcf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hYZa2VR8eggyGubTiP/rXdN+CJrZ8x0nEFAJ/KrSlE7Mg9fSJiilaxw6+E0g?=
 =?us-ascii?Q?L9CE7tx/YkA77cjBHTL5hZrM7DxSoJ1aY/bSkxcKH7fJAfyb9GGHsSyahF4t?=
 =?us-ascii?Q?1dPQ0nqtDSXqZu/GXkNGhDGONbO0PHUcu/cCDzaw7WRNTyAb4fR1LTSCAboI?=
 =?us-ascii?Q?YalyutWM3a70zELrJ7JeR+uctUBPf94oD62+2NpulghGZNTcmAbsYzBAGwzC?=
 =?us-ascii?Q?aEJ4+VJKpLGcAZ2R297hHvigq++E+WRxddmQTiJKM6hB64vcot5+7KL7XuxH?=
 =?us-ascii?Q?WFfzZ7DC003y92dcjZKpP032qFg6ZG2yeIJx6qHLMrnrZl6L5tl4QCW+u6JD?=
 =?us-ascii?Q?4WCbVq0SKzmGIocao/s/ocxZdlZN0ODVsmC99c1zMT4EioFpJnReyvPTSbCy?=
 =?us-ascii?Q?rMfX2ztrsnJtEnY1xHsx7z6TpyRaai/GQ6Ttr7mgDYmrYO7RXXJNYiqC5YIt?=
 =?us-ascii?Q?VCY4XSpOJL9RGQkRx69IWvP2N+eIP2eD4F4FuqlBDFiJEC4fW8fGEiALiCAb?=
 =?us-ascii?Q?X/M3PyRdKDHGfqJGHyY00JelZMYJ9wcdju3EdNoYCP6ja2R3vqiaU9GG5bQv?=
 =?us-ascii?Q?0kMDwqYz29gmq+GGgykGtr62yQhdSx3HB8fj3s0aivssIeTwrULveSuSTrXa?=
 =?us-ascii?Q?hlITB9nqP5c3Sfv3YAhbDa5U6SUA0QzsKBYTKzjRFlHgBcFY8Lr0SXQ0IjgW?=
 =?us-ascii?Q?hb3d2v6o8Wb4fkhUpWF0H//Y9ChgzRlvmJ0aAJ10pVAbZSYcv7RZL8RHmtKO?=
 =?us-ascii?Q?uFunlxj7wWqTg/GrvcbzZQAuHUj1eNj1by4MHNrpj5CFlRySL/WXMDm0rx8y?=
 =?us-ascii?Q?vISLVHJEqGi5jtgsYPliRS2f/3p8C/21tnP/d8fGjx+NkOsc3IFs1yJX+k5x?=
 =?us-ascii?Q?vPcSFLdf69OycAci/aV9SIT4ZHDlc4pA6XW4MAAoJ7koi3hbCROr5ZqFxtEP?=
 =?us-ascii?Q?7Ky8hGRtQtqQaQ8egqVIosqCGxnY9ZPfcuAtt+ehEtKDSfVB28Qqi0m0OUys?=
 =?us-ascii?Q?9OuFtdbMan+0ATMzf6SLQBAzC3XHqqvzZcMfgz2n0cSlu47Kn8OK8irzJztD?=
 =?us-ascii?Q?W0+F+cxq8/fQ1AguGn5jY3yKMfP6SkcMl8i2h6rf7UyOMOvBTxgk6bWB+jgS?=
 =?us-ascii?Q?W8ko5tqavAdM4uiWuHJV25VWK2R3s6RH/sGuFd0lz2iwJNccDsFq7yzpcx80?=
 =?us-ascii?Q?BM5yaUVTlodajFc+FZQLj2Z67ZzZtCiuVK/Jws+t5ZpcJAFuRYWmEBA9T8pl?=
 =?us-ascii?Q?cAJELZTZuVCyZbb4QdGPJ1WtmoBX7I87EG+sVV6TgFwilhU+9LBqpoq/Pbry?=
 =?us-ascii?Q?XRiKE5DEaExXwJ9QgsiDfNJNWAq4FUtYAxkVIrqWgvC1Bjxw1POQFtknKCRW?=
 =?us-ascii?Q?uGXjudAX4bTY8B4O2gBrIJBstLkLnlfiOv7Gv0RPJVbBd2exFV8eKnHiLKqS?=
 =?us-ascii?Q?zhR5WG4SKCU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AIw95+sX2Yv8cUnz0TPhicMCk4M80OHcZSOXCk+Q+655HTQk0lO3QOqmzK5Z?=
 =?us-ascii?Q?C4Rv6j8bg8KgyMldIXIjlwzN28u9isWlyVwIFGdGrMfKaz5iVWWpwcuyCUvy?=
 =?us-ascii?Q?C32GWW240T0YvRD518gHwqjy3S/6+lhbL/AJtUNDKJU5h7k1uucU6lVbbOh3?=
 =?us-ascii?Q?ujFVwbQBMnSCFe/vS0fBYbK94joTDD9NfFi1FmnHSouVtKTfg3pNaS9RvMSw?=
 =?us-ascii?Q?nk9BJaF6VCRFV09hWVjSQ0nYdLLaoogSRc/K7cJh4aqNPUh87ndK7UHT82M7?=
 =?us-ascii?Q?E13H4xYNEfEaH2cyD4U99visALQke9Jf0UhyY6KwvNW3q1yT/4rfFwxA6UgE?=
 =?us-ascii?Q?anRus1L1ny88epBYhDbfSdanvtX5rVecsTu6Nl02WZAnIMvE2M5jYoYpRB8S?=
 =?us-ascii?Q?sBE2Mhbz0iddrATacJHnExdEzIxLRFqJOXdlnlH7FN9WohGtb42e0AxlO0cb?=
 =?us-ascii?Q?dkS7Q7llnZk1iAifFz18GIcvPOzmkWuBkLBJlEToj1sQRvevKoQgDFVuMCGw?=
 =?us-ascii?Q?rD7A7Rf3mzSjIRwjiO2l5FA4/GMfmpMacF5AxB71wurDR65uVuOBs8VOKvEk?=
 =?us-ascii?Q?kCIMPR27nH/Uwwu6nABpgQ/tBdId5S2Zic6OoHCi1svZQ3UV9spsmCxHrrL6?=
 =?us-ascii?Q?arRx/cLHE+NUt9pnPu+UsIjlmDDBwx2K6w5ywyaNuHGCHFwSEirzU/zBRU2W?=
 =?us-ascii?Q?ZGolxvCMgtJnm6BlZ0H2vxsRdMCItSg7buDeEtcfuuJ1BpUwg1RaXK/BUXV3?=
 =?us-ascii?Q?rVLyIefHWD+Eq874ty08Pqz4zEXfKEYYX5KtrPafYvjhQyZ9nSV2j3TfF7rO?=
 =?us-ascii?Q?QIHf8+84Fc9YD5yMUWIVr0X5LonIibGS8giknyAaNIwqcrLWbv0h/m6ZfK2s?=
 =?us-ascii?Q?rpfz6BtZ1Qnqb2kJ5DlRDQlXHg1rTXI4kAtIdy4eA3Hd6ANbaSFLGT/QjO23?=
 =?us-ascii?Q?djUcFAzaf72OWC7gp7C1J+m2ci9iQtxQQf2HV0QebTC+uZMSViYHpAGOoF7U?=
 =?us-ascii?Q?aSwtw7L7okazkVCP6PbrdCZLs6R7FqUq+k3fZLLhowOKcx6k2nqEoeUFytyt?=
 =?us-ascii?Q?OBd8rNjcp3u1VbQ1B4VVuk6Q2W/JnSHYUVwqbmHPBOewsfVe96jpQrfWzQoL?=
 =?us-ascii?Q?vM+BI7950P12CGp3oOfP7LZvn4k3rTq86fL01v0HBx94Hg4b2SjBn3n9NJGI?=
 =?us-ascii?Q?ylvvqWI3NK/5Vm7xuAAGanQhdOhImgKEQRfI9BnqybmD1cactsqY4pAyfbZ2?=
 =?us-ascii?Q?O1X/7EdXeMZ83z2A1swOn20PSsrFepMPd2d2DHBnSawCNGgrClAZ/QeIcrnx?=
 =?us-ascii?Q?UX6FyDSrr2Sk+SIVTs1a+59pSL7d/CbQl/2qbRb2/6hrwt8Spj7UzHVWI32Z?=
 =?us-ascii?Q?IVldxiJiQWI+db1TORy87sDkmrgBJc4P1sICnrmfLNajzEfC8wMktwMDYWip?=
 =?us-ascii?Q?dT242mbZ4oCzkc3/5oEYEra+y779jcJ2Fv5iRgIoOKEb2dEdpQ2lF2PSR2ps?=
 =?us-ascii?Q?8UiG9r0Z45+khYhnWvS8i5U0vFopjVeiboQtTX2xaT/aXTexBT2mF7o1XLrB?=
 =?us-ascii?Q?HbAr+VU592WQQyNN2t1hymI+6FF86KocbvoghwbDIVJCHa9VVdvc18vnWNh4?=
 =?us-ascii?Q?84O3Jx/EJYTotDjpdajUEcU=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 598004ac-2d1b-4ce9-4c2b-08ddb0d5fcf5
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 15:12:07.5667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9VCKy2RaDT21t+8BXMRe1zadlt45pf6d2btyAeyK4sZhzVxRnsJ7O6E1SEufQSmsFzRhp5p01p4PNPcTTf9pNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB3033

This is preparatory work for the upcoming commits that implement the
standard PV time interface (ARM DEN 0057A).

No functional changes intended.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4ff161887ec3..9d44b6fa9470 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1070,6 +1070,23 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
     return res;
 }
 
+static int __init find_unused_regions(struct domain *d,
+                                      const struct kernel_info *kinfo,
+                                      struct membanks *ext_regions)
+{
+    if ( domain_use_host_layout(d) )
+    {
+        if ( !is_iommu_enabled(d) )
+            return find_host_extended_regions(kinfo, ext_regions);
+        else
+            return find_memory_holes(kinfo, ext_regions);
+    }
+    else
+    {
+        return find_domU_holes(kinfo, ext_regions);
+    }
+}
+
 int __init make_hypervisor_node(struct domain *d,
                                 const struct kernel_info *kinfo,
                                 int addrcells, int sizecells)
@@ -1121,17 +1138,7 @@ int __init make_hypervisor_node(struct domain *d,
         if ( !ext_regions )
             return -ENOMEM;
 
-        if ( domain_use_host_layout(d) )
-        {
-            if ( !is_iommu_enabled(d) )
-                res = find_host_extended_regions(kinfo, ext_regions);
-            else
-                res = find_memory_holes(kinfo, ext_regions);
-        }
-        else
-        {
-            res = find_domU_holes(kinfo, ext_regions);
-        }
+        res = find_unused_regions(d, kinfo, ext_regions);
 
         if ( res )
             printk(XENLOG_WARNING "%pd: failed to allocate extended regions\n",
-- 
2.48.1


