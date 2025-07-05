Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F161AFA079
	for <lists+xen-devel@lfdr.de>; Sat,  5 Jul 2025 16:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034238.1407127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rT-0005Jq-5x; Sat, 05 Jul 2025 14:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034238.1407127; Sat, 05 Jul 2025 14:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uY3rT-0005CW-0b; Sat, 05 Jul 2025 14:27:27 +0000
Received: by outflank-mailman (input) for mailman id 1034238;
 Sat, 05 Jul 2025 14:27:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oLNU=ZS=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uY3rR-00055Q-Ai
 for xen-devel@lists.xenproject.org; Sat, 05 Jul 2025 14:27:25 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2af19dbb-59ac-11f0-a315-13f23c93f187;
 Sat, 05 Jul 2025 16:27:24 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYWP286MB1974.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:165::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Sat, 5 Jul
 2025 14:27:18 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.023; Sat, 5 Jul 2025
 14:27:18 +0000
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
X-Inumbo-ID: 2af19dbb-59ac-11f0-a315-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVSRTQN1dhlhI6VPhkz8ppm/pKzhRs0NOKi8lMuAkmIT2v5hpEYkdJMeLf4GR7oYaCCnsnYcZLhMZ7cdFoLPyUSiUef2ycFOkPFF1n0crQ96mp39ucEufd9EEqTM/ExrKx8C7j61t0EtJJ5bzIxLTCfWzafgctLQXftlro+SI/WmLu1dJEsBa6elO1kk3lYUNzhBR8IGTFkQVaWczQvNNxEicAgvdLRvX+v47sSvOqkAkiOqAi1iWkO8+wvLZyctvCjZ/OxkuKBrIdoJa9ykDXFS88zka5M0ihLtbfKO0S617mcZneDYiPvVmrkPO87ihAIJVS66+xSqUS0gdlAncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adYHyU0Z4LO58iQg+65jtVe1dhfX3gBG7osPUnd80vM=;
 b=yF97IUKZ5cAVjANQ8i74A6UHfqgmU+0uTVwWa9OCGz/TL4FsQ4qcMzgCRM905uUHch66kn2mCnFdBCsdUJPm1HBvFPktXDDqX7qFLpbSf/SG2QdNTGaEGTpQXAI4QN55MW80mrdloncoOyIr0YS57cSXA87AGPPqopBqhdE4v/dGWqUcic17KapORkZVku+ZTGab9Guu4EU8PDbiCzk7FmZ/RHYgLQzmvVcwlnUMqDe7MMTEhPHMdzWhThgMmVH9qAKt+e/GcBYHk44H22MPYyF5Yj8kjOWc1CfQ2TZXiRyUua24MHtE3Abbtwh40dkIBB/MMsXrklp5NKp8JBFbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adYHyU0Z4LO58iQg+65jtVe1dhfX3gBG7osPUnd80vM=;
 b=vSO3llKLcVYUoGf/6QTWaza7PTFsH2gi2Dvh2oo8gdBRZmV6y5vzFn5FY0Pgch/ToyuTcfiFYKG66/eDXLkwJP7+Ahml8vusu4jeIvcX2hEttIOEU2e11mTUU1h8UjCFlm6OCmWjn4L0Y5diHBKrf7UHw6iBNKF7KbmU9RDdwHQ=
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
Subject: [PATCH v2 2/5] xen/arm: Reorder hypervisor node creation
Date: Sat,  5 Jul 2025 23:27:00 +0900
Message-ID: <20250705142703.2769819-3-den@valinux.co.jp>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250705142703.2769819-1-den@valinux.co.jp>
References: <20250705142703.2769819-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYWP286MB1974:EE_
X-MS-Office365-Filtering-Correlation-Id: d78ca364-0bdc-466b-314a-08ddbbd00bc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sfiQ0OEPlVZFv94ZeFz4CrpvfYUc7Z5AQPpa+SLqzQ4B6zGJM6MD+rXHyYqo?=
 =?us-ascii?Q?aHXhKN+g/MCPaBjWq7s+e1NSHGABLqFDHgbl9bGQETW2qfQoT2v4s3rykMtU?=
 =?us-ascii?Q?wls4fZFE6s0b71P2B3/Knofqr2NvJB3CR7w+uxF4BOLOKSWtqUY446niVFOY?=
 =?us-ascii?Q?LnfOjVlgZv8SNQ7vrP7rYg06NWXkN/gcXfb7jT31fJAkzR2Had9EnEZdKxBd?=
 =?us-ascii?Q?AYP2AkAWl95LnlEChkpyDP0rOgQUDWvtF/xhan7XsH2fqWbuuo6GSOpL16M6?=
 =?us-ascii?Q?ZsisZWCGq5TwLMVSeJe3uBqNStX3G/w6sRlDDIR/QvVIpQYqmwVY5tMGVgSp?=
 =?us-ascii?Q?/If+L4lXkRWACf2RG27ghb/tfOGOdhxSRlfWWSR9QViDItukL1KrjXF8Eine?=
 =?us-ascii?Q?ryN5aZ96cHbqWGXaikDtC5pPgY9FaAjfvneG5vqPQf2Wd6tR8P1zamj1IzPl?=
 =?us-ascii?Q?ISWSIUMUMmJAl54ybqz5mcDVjJ6M5aBA5HPd4Xe8oh8ZIu48qMzeTVlp121m?=
 =?us-ascii?Q?QnPDl7rAPGpaxb4QOHOwoUad0fHERX6Da7rk/I3UlzVODu3R3UGwHsILvupg?=
 =?us-ascii?Q?5N4/IcOmDjLq3G4bKtgIj91+VW7inNpgPHbgIITDVUK+PymQAu3xPcD5XMRU?=
 =?us-ascii?Q?jsHE2YKKP9YvUjHnCo3MZ0zVotkP1uKYIhsyKGRcKUGZrfN0iEokxR6TZsV1?=
 =?us-ascii?Q?YtT3m7CvPMMQV8SBQ5CMP2RjRvL8XTXN7aPGlV8LDr7eYolvPcdMNRVGR6IZ?=
 =?us-ascii?Q?IWYN95paVB8TOHTs4GypMgo/TskPuAOupqRJI39ipcTqBSrA0O0WZR8rfVL+?=
 =?us-ascii?Q?jOLSIVfIGRljf9pVK4YrVSA8HsFlpNayzpD6qmrpI5K3W15nnQt1VyFLJVBS?=
 =?us-ascii?Q?msQgj8oDTUkoqeKzGDVSMYWIIgKMuCb8EgPfDPlvoUaAL/sTIAsVndxcHWCJ?=
 =?us-ascii?Q?5aeiM+zxvM5PAeMc9OURq1ozcZQRp/EQhE4hO+KZlsh5jDr8nOrNcNpX57sm?=
 =?us-ascii?Q?OzOWzlOdPQUxfEz4/uvfWOYhKU/xlI2JCpCBxReA0jFRk1cJyIueG1Iff5MH?=
 =?us-ascii?Q?v1xg8kvl0FBKVcXHKiy8KQgcBC6zDaXvwxmF6y7sDK/pH6W/WXdzRiFxX3sW?=
 =?us-ascii?Q?bXOvzMgf29YIIIxKpyvlKdJCls4H8rr674U2bRg/3x8mm4Os9jInzsK2j/2q?=
 =?us-ascii?Q?msgtBEPZL1k0C4PdlfPFWgAbUFtK3+YmZU1fd9nCgBWm4v9xLWGYeb298H0n?=
 =?us-ascii?Q?JNYBXbTcT2EeIlfEr7ryE0fTlwB237g+Ww3sxnZi69GVkQtKPWy+df+rKqBl?=
 =?us-ascii?Q?gOE1qcOe21qxbcWGh09XJQ4hc+pT8RD3hNo6mkZG12V75CEYLDUyH9Ry8cDv?=
 =?us-ascii?Q?CsSj4aznuYXBHukY8pEyXP6R9EjuUlO0rkU7XY/zuzigTjFLi1M27tkGNF6+?=
 =?us-ascii?Q?cNHlrv0NEiI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eIuo22FJJtQZPyyhUDIHlpQ1rQE9rAyUwOlyb6D+oSBofJHU7gsABBRDrsH/?=
 =?us-ascii?Q?3gDv7ucTqi+NDFfyQNQruNlYdU8iNLmYNuzzMrRZqMmOgyRE9gDYKXcCLhYe?=
 =?us-ascii?Q?x/Hrt2pxMhzd1RN4/hI/LrWXqs7Ky423XrjNP9Lq9xmhaoj2fPHzLjD/GE5r?=
 =?us-ascii?Q?Odm5pT8JU/n7L4lR/aV514cKZw8pwHDgVQ0d0/6eXFcEIPMWca0OLBNN1aFX?=
 =?us-ascii?Q?ryZeLYlGkKTVNvT6I+kdX2ulTF96CHYuRcyiPWz/pvkfctabMhyWngxUbKiP?=
 =?us-ascii?Q?d9KIG8v/nnTsaCNEN+LjDOsuM5HApwU63jUEmvdgeG2wSkjzVec8vej/pv7J?=
 =?us-ascii?Q?7QdC3rN7mMif9a8ovTU0f4CKeAbbDA67KbTQvN9Epln/zM1/sfanWNciOtZO?=
 =?us-ascii?Q?LTvHq1nIBj2wacumBR1QBxAdJpUC6Kh9ejdJQ+4UTF1fXPYWrznjQXLmjetw?=
 =?us-ascii?Q?OmSqQrAakr3r8g909ASbMxxdbVh4Bl7UVAiBKa7AnisCUoDgdZ+TA0KIYOFW?=
 =?us-ascii?Q?yOp8I5fKBYaivX8g4sbDUsjw2XTCMf7quMpL20kCgZMsc3/j7yJnV7ek00vd?=
 =?us-ascii?Q?bFQjMzHgu01LlvkMEffyAmHMy3a1DF79NXZlRz4ThnW0QiujRjQ2iVEiBp/g?=
 =?us-ascii?Q?YomOupX96UCfFQjKyzUV8+oFo64OdwkWiJXSKZXJuU/CrGxgKrcd3CkS+VX9?=
 =?us-ascii?Q?oApMZlzCQHMmsL30yEl0rC56onBc6Xe+aJNoitYG/labl5r6k4m582WDcG5Y?=
 =?us-ascii?Q?jNMx4uqyA4VVyfJMqMj+a7LpckL89Bx6IEwdX67mmjzHpKrU9p6oJ2IChipy?=
 =?us-ascii?Q?OWN0/Ooth84fj37Cu7KUAhUxCAaPZlmNJCP0wSsr6Wl4Cg9ezjfEVxDTDZbU?=
 =?us-ascii?Q?DPAo30+L/jZAkNWd0QnD+wj3zz8SW9AywIXed5zwmel2DnkM/o02sFE164U9?=
 =?us-ascii?Q?7bBG5cnsnSqbzBCh1UgHYAu1Voe/wNcbbojHcUGJOXcJRMmRBY+MEJxbDifX?=
 =?us-ascii?Q?BBJVAzzCjUHpI5c0BVC/Gymn/T2pnvhOiA1A65xLXDu7IJEnQCB8gmSaHFNJ?=
 =?us-ascii?Q?70xvOCPlHRN3/zlc99JXUTGslPm/2ZUlBagZU5zh1ZBncyzefTSh9e/YJye6?=
 =?us-ascii?Q?9eR9t5OZSx4UxVCGbg52eg/FP83gnnFwFDXuI2dgT3dbLztHaHnPRRMEMnlk?=
 =?us-ascii?Q?upbryzsGNU75SPa9yR0C4bx53/mJpYUCRG44hBt+tMx4bUl4kPKo5B/4SzEU?=
 =?us-ascii?Q?t6iaz2wSL48vEwppz3AmBY/coxyQA9G5MR8DWW4qrDRemMvg1aBG2jVZt5A5?=
 =?us-ascii?Q?lVKzP/g7rneraiR0Go6lwQUk5IU665PZ1K5J1GBFcFRFmGZyhzUxTLjVWFyD?=
 =?us-ascii?Q?xa4IKVXiFpD7pvpl8MrdPgrX93W+ccBQqQniwPbOCp/J7nQjgWG4UsSJdTot?=
 =?us-ascii?Q?ZF9Wl0pnwhvKnV+E231IiFBlxVrn66VDW4E4ERQfQ7zP7ymobG2vZi7cWnOt?=
 =?us-ascii?Q?bQ2fwDnQnL8HH0CBzjyO0dhuPaySQSXvX9HS5yqMwusRU0ffezvAonv7dEPn?=
 =?us-ascii?Q?gdVCZt/BxmoIzhv1Xj5OGMiGVfEFsGFFFN8yOqTqz2qDmP8jo0z0d3FfykXH?=
 =?us-ascii?Q?z/bwQJol2tkn6DKeXBp8y5k=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: d78ca364-0bdc-466b-314a-08ddbbd00bc1
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 14:27:18.1921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHg37GAESFeweVBkKvXgnp4eOg1eKzp5FIfzjQ0AMaSMpSl1st+qUf2wuD3k7RlkhiPHuo6qgT+KqRJ67PzowQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB1974

Move the creation of the hypervisor node to a later stage to avoid
potential dependency issues.

No functional change.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 42210c702ab8..5fbc26f70988 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1728,14 +1728,6 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
          */
         evtchn_allocate(d);
 
-        /*
-         * The hypervisor node should always be created after all nodes
-         * from the host DT have been parsed.
-         */
-        res = make_hypervisor_node(d, kinfo, addrcells, sizecells);
-        if ( res )
-            return res;
-
         res = make_psci_node(kinfo->fdt);
         if ( res )
             return res;
@@ -1766,6 +1758,14 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
             if ( res )
                 return res;
         }
+
+        /*
+         * The hypervisor node should always be created after all nodes
+         * from the host DT have been parsed.
+         */
+        res = make_hypervisor_node(d, kinfo, addrcells, sizecells);
+        if ( res )
+            return res;
     }
 
     res = fdt_end_node(kinfo->fdt);
-- 
2.48.1


