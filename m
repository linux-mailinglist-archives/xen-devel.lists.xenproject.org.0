Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4MQcDdiXRWqrCgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 00:42:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF2C6F2220
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 00:42:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=EHlJDaF9;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1351008.1608360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf3cb-0001UD-27; Wed, 01 Jul 2026 22:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351008.1608360; Wed, 01 Jul 2026 22:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf3ca-0001S7-V3; Wed, 01 Jul 2026 22:41:32 +0000
Received: by outflank-mailman (input) for mailman id 1351008;
 Wed, 01 Jul 2026 22:41:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wf3cY-0001Rz-Nj
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 22:41:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf3cX-00AMwd-VX
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 00:41:29 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a459787-5cb7-0a2a0a5109dd-0a2a450cb7d4-14
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 00:41:29 +0200
Received: from [52.101.125.77]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a459796-f399-0a2a450c0019-34657d4dfa73-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 00:41:28 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYYP286MB4652.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:194::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 22:41:23 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 22:41:23 +0000
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpZOys80WbxwSdxEpywkQX1JarkUqhwV8ONIGlEd7cjgiDqdputtqfIMG4W/R8zn5wnozzD4DyaUfxe5o4Y5Y33qKCiAXWuOX/tLVScqJ5WzLk/IXKdo/pnraNgWnv5A/gT8+h+8w/iKhJIBa3Z1PV5Ahq1Kv1likq01nbDgEIFwazd9j05DUfs/2zxyVMJrdM7zCqhMJlTB9MqT/FK+MyDLXbuXyA/bl8LrwIGIjypShnDAPvow3F6k6ziLOl5kn+S6Qvj31f30i/Q6hvpS7LucgfsaOOoYFjInqMDw5u4eRqWWIUQU3BYhyAoAf5zBUsKoIKhAvUcml1VnKuBIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tUfFRxT1O+2cz1vpN39n0rIxgr80Gv1sJ1w0nFmvPA=;
 b=S0vCgLdE20YidkYKhV+G2q8wPlGVm5ZFxxmYaHGOY9d+UbX2GTAs1lRyhmAmJ7hnDGpstcyV4HzPkvDzy7vgu2me0pTPceqy6Ex+IFsnbvdI8r3F5Mx5BXae6YSPJNMwkTdY7SViyGhC5OwZ6mw0GLJyxJMhXA6S5VZq/KgkwQrRmZHMyAx0EQA0NZmw+6pOLDF4uMhS3/aevUsTeCFiyc+kEUAM7Ppn1MmoIU8xeGiY0VuHB1Z+N89IevIYTy7fH8C4kH/DaftOyUm24mUDMpFPJi8x/i6i3enoYQYgysfue6UWgTx3hBl2BqMoxB/Cylyo8CLPTePfdxNy8v7emQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tUfFRxT1O+2cz1vpN39n0rIxgr80Gv1sJ1w0nFmvPA=;
 b=EHlJDaF9Z50zdu2LlYUDJtZ59ezGV9XnWgV47+Ke4Qx4v3RJByVSPZJmo3Ho2bp3Pl307m7vjPVYPXvNwFAUJ52OGbEz/aOnvm6c4vkdSZztDtMMp0ogKRWy6p4E4nY+nSjC2KW7NGZza6pINBxk2tKYUt0x2hP8v99Eox1vnco=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Hirokazu Takahashi <taka@valinux.co.jp>
Subject: [PATCH v3 1/1] xen/arm: fix sparse cpu_possible_map calculation on SMP boot
Date: Thu,  2 Jul 2026 07:40:57 +0900
Message-ID: <20260701224057.46592-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0051.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::7) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYYP286MB4652:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ca15ec8-b133-4e1e-a615-08ded7c1e0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	uCDPF+66gS3Z92FnzVDALvrvHZkeXnMuxh8n4HS6NxWU871D0PnNeEmVcKc+cKuhC3EAo6SUS6pOXg8ovgnwef4/Ddob3uGrN5zBgeYrKH1TVwK0edUglXRkGdgv3pVBCnthPf8LhNmCR4Tx3I8tdKgnL+JjX91VQv7tdbNyXwV5ygCUOotVnzBEKBs/gOlPr8VlpMVbvpgoPH0hU0PEJeC7UliooEMJIWgWuUlOeJ/E9jSSxTznHYBODEm0yQJ/5g3oRdbpVGk2DEY4mAbRI+sMieGfNe1DxmS6bRwNt8k44Yc/iIYNXiyCEh1iT2hqqMEsYgEx4mkD/ryHKNA2LmFbME6DQjEXWJHTVQi0Q5VIAVpArEEyi8G8VjY8UicXZ5nPe8+jc4p98Tq7W2xrjtHgLlFxW4r1YMyb3KghVm/RkTVT1qjhz+t7KsVbSotmqPqJaMUJw6BU618nCZ50ybgJ0T4LlVgGXLPP3vI91xUi9RnGPzwDFKA0LNEDQnwXKOXPwoZytryNdRcXoEVl9m8hLpBwr/T6Hjq4saZ2Il0yG3T2kMwyKQZLR5etsPPuCij18mqqurERdhRwKUbLm/9ja5aEZtm7uCCbmx+Erf2aHAvPxXhDoxE/hRX1V8OP6fGdA9U10BEG/sz3OeAnIUx1WUvxQ3N/+ZpwBhf/I0E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u51DIDw+1h1O7kzh0fyhpaHzL6pgjTroji5D2PXAqkk3h0j1xGmPaCSfnp73?=
 =?us-ascii?Q?QwhMPf3fTDSSKPl6Mn0JdamCY7vZUL0s4zo281+zQxmX609SkecPvs2p2rsf?=
 =?us-ascii?Q?ZKn7/VkHPtNASA2CemXHPb3U6g7WJEVlog7X62fFT9ZywjmpNIIqRQ8lay5K?=
 =?us-ascii?Q?zDmzuBkpAb/IM+gn494gAo/vfMqs8FR5qUGK4ru+b+7HN3qyXjIIU56eaZtI?=
 =?us-ascii?Q?TFJAtlyjUV4ZQ59aCyFFe8bjbptTar9FbTPvq1x6vIOegAGWYucxw9mLk1vY?=
 =?us-ascii?Q?GPm+ANA0FtYtSnWVtzCK+qYNeNAROnc5HHze8es3d0c3pf0TRM/NhNDpWTMp?=
 =?us-ascii?Q?0aC6xmUEHvkq7aBd659oO33+q7HdO/Aw72tKQbnOFHu1g7kSDKvDbqU27mjJ?=
 =?us-ascii?Q?upcKl62b1YRqZDaRPLnS9pM9Vw5/NwgZe2Oa4BQ/P4sYhoUmgvgcNfVNAluV?=
 =?us-ascii?Q?HPWbsxNvogeFEgcPkak4czkvUM0CNGLSHg4Wr7kXX9XU08BCqH/NeWq/ypWw?=
 =?us-ascii?Q?BT1E3E9MdZsefhrySWc1xzzjrYrBm2or5nZhlHinNmR77g0o7UGohCE0BOLU?=
 =?us-ascii?Q?gIfjQIL0qg/cOfHQ4y4QfD7pgwzfAmkR79Fk9I19u4LSzwxLuQjl5d+R9xLj?=
 =?us-ascii?Q?yg5i5cqMNix52yA1ly86tvwWmepLPLWmGsOErIjGVZ/hR/lpaF+Irz3D+6p/?=
 =?us-ascii?Q?8ReaAWbX68mO9Fs1EptQ00oRP+bsxwrcttpH0gtAP/jb3fW+Q553mbxcbFZI?=
 =?us-ascii?Q?FHp1SybjWF6+nDbbR+WZOKuWvcujD4eErScFZyIjKEvDnGXyzgR18DQ+GBcT?=
 =?us-ascii?Q?pvRPxA0qNjoQCL2TgrlmdGZpCIcV+7MbjZnNQjYjGLZ/pCtZIgAW0dq+gPoT?=
 =?us-ascii?Q?KWE4onQrRydR8dm/94W/49ZTlfWvrKAzL0Ypu8uBhu3ZcL+6KUcj89J1LKJq?=
 =?us-ascii?Q?2yySvGmb+TBBjMIiZqCyamn/LVOcvV18xV29QqLculhIhVVEXC7Bgd4s8iGO?=
 =?us-ascii?Q?AuJgs0zEiLz/QuckykU31QrkSOhTYLZOD+QjR1yjYBVISU07w1hY9f0fBUjA?=
 =?us-ascii?Q?qmdtnXYn4JQH0iNZFXV9lfb2m6DiTNIVd7QHsIuqI5r3HSsvWrJyB8tHhDaf?=
 =?us-ascii?Q?jQUIHWGItLc1hh6Wfi5MMrvjX/ODbz9zPCbxMEkNu0wUyhzZMwKBbdQ6Fwzz?=
 =?us-ascii?Q?KrnlMB45LC4FlqTw8j1n11zok/FqeKeSQDmLdXMREQminCGZiwD8hJFnQ126?=
 =?us-ascii?Q?2LBcSXwQxWQyUOk4POryl+gJvOm87o2xWg7kge8nTsi1kZRJX0lezu7nyGrZ?=
 =?us-ascii?Q?uKJg87DM5JV17Gt9mFdpV9pmtRXk/50GS31xodxXhOSyVq8mwfsm5X0ebd08?=
 =?us-ascii?Q?lkEWWHns3bI+ZUBPA+j33LSXXyZf57OrrYl0ny4FKHfjdwEdFWLEF5C7CKvz?=
 =?us-ascii?Q?8Yns76Kh6QCAevV5DWXeJ+Te7rOA6RnGUwyqA06U98N0pUeDHuEUhwwVeGQq?=
 =?us-ascii?Q?aU/V/DEStZO0Y/gwJqpAm2QEtxFYdZkbZVz59LIYPB4Z19Gp/izVKZGJJHWD?=
 =?us-ascii?Q?LxjaWfpCVcP0j1C01GAe2JMT70IY/gtEZuq0wV3eFdax4MKk4nmnZT6MZ6gk?=
 =?us-ascii?Q?uQRch/y1ribueU19LaTFl79BqNyrsMxkD43MygCDO+KXTK3ZfqGWJhHwlpMF?=
 =?us-ascii?Q?c2/qaZtadOVbZrzPsWypzJCIwtZHE60JATkRXvGrsUFCdtzsDC7Yea9YHySp?=
 =?us-ascii?Q?bgq6djNRbJHM6w+CO+Fl0uJonPkgZ8h0NgepvpJIrFdYfGKEWc/RfBzD6Qjx?=
X-MS-Exchange-AntiSpam-MessageData-1: V/idVtkCyZFaQQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ca15ec8-b133-4e1e-a615-08ded7c1e0e9
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 22:41:23.6252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxmtOy6DnknT4kUGZRvzqiYORI+ECH3qdgejKoEH95IxVwosrxzkQdVu7BrjVWOMNMEJ9Uqq1f/lH8VNer3DGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4652
X-purgate-ID: tlsNG-d25034/1782945689-93536D51-D26E2C5F/0/0
X-purgate-type: clean
X-purgate-size: 2072
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:taka@valinux.co.jp,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAF2C6F2220

Currently, during ARM Xen's SMP initialization, if there is
a Device Tree error (such as an invalid 'enable-method'),
cpu_possible_map can end up being sparse.

The issue here is that nr_cpu_ids is calculated in a way that
doesn't properly account for the maximum CPU ID when the map is
sparse, causing a mismatch. For example, if cpu_possible_map is
0xff0f, nr_cpu_ids becomes 12, but the actual maximum CPU ID
is 15. Xen's common code is built on the assumption that
'CPU ID < nr_cpu_ids', so this mismatch can break things.

To fix this, modify dt_smp_init_cpus() so that if the
arch_cpu_init() call fails, we don't consume the CPU ID slot.

Fixes: 4557c2292854 ("xen: arm: rewrite start of day page table and cpu bring up")
Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
Changes in v3:
Restore the NR_CPUS check to its original place to properly handle
duplicate nodes.

Changes in v2:
Fix an issue where cpu_logical_map(0) is cleared when boot CPU
initialization fails.

 xen/arch/arm/smpboot.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 7f3cfa812e..ba5fd2dd52 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -238,7 +238,9 @@ static void __init dt_smp_init_cpus(void)
         if ( (rc = arch_cpu_init(i, cpu)) < 0 )
         {
             printk("cpu%d init failed (hwid %"PRIregister"): %d\n", i, hwid, rc);
-            tmp_map[i] = MPIDR_INVALID;
+
+            if ( i != 0 )
+                cpuidx--;
         }
         else
             tmp_map[i] = hwid;
@@ -251,10 +253,9 @@ static void __init dt_smp_init_cpus(void)
         return;
     }
 
-    for ( i = 0; i < cpuidx; i++ )
+    /* Skip CPU 0 as it was already initialized in smp_prepare_boot_cpu(). */
+    for ( i = 1; i < cpuidx; i++ )
     {
-        if ( tmp_map[i] == MPIDR_INVALID )
-            continue;
         cpumask_set_cpu(i, &cpu_possible_map);
         cpu_logical_map(i) = tmp_map[i];
     }
-- 
2.43.0


