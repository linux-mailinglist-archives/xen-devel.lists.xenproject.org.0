Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id shZ3D+z0NGoTlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD47A6A472D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=TDviDKhv;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341757.1602129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU00-0008Ra-N9; Fri, 19 Jun 2026 07:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341757.1602129; Fri, 19 Jun 2026 07:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waU00-0008LC-79; Fri, 19 Jun 2026 07:50:48 +0000
Received: by outflank-mailman (input) for mailman id 1341757;
 Fri, 19 Jun 2026 07:50:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzx-0007m8-SO
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzx-001qUf-8T
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4c4-2eae-0a2a0a5409dd-0a2a450cb99e-44
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:45 +0200
Received: from [52.101.125.75]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4d0-94a4-0a2a450c0019-34657d4b8662-4
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:44 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:42 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:42 +0000
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
 b=CBpCzKmTzGC3RE/ijY/AP3GTl2HVw8NISXO+SW/9O2N7Bcl8lVmjy0T7EeNsPQwBbLAzAnfDjqvcZWjwnzG/sYq4IIv6qqXOepF543NukGA1y0lt29Cn1hahkg8WlVfiCwOzcmLHVh1ff9tpWI5mzqmj/omPI+ZYuVSCrSmXT9u9442TSYQQf9WWvLstSnkBfUrtr1mCqpEJxobFFsFYpi/Ve7sSMwgcYh3sKDLSv2xJJxQrlJzBPYIF+tcvfeBnpWrlqPvbErXoPJ4diZOM0lkSLT0aiDG54rV2Gale5iMnqM0BgsvQ/h8uKdDLM3a5n2OP8OiUfu23bUIG2Yx7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gevVPhmJDfeBhPDt7bTqXXZzC2OXbkPPQ3tykLpIMiI=;
 b=hcfhnbUStrZMTxw7o/P/H9nX616LdyESEG3hSOBWhvPElTzR7A6wI9aZ0vWxLY7Kc7Ii1YEqP9snRWj5Kw/8wK+5bgeVnvbQbLRXzuJ3R/gO0szOh8ky3HssRpyNkEYDhBPk3o1HkOdwS1sw9E4rHF4oMEXYuQT4+bFkptVTNR/pgiAPmXF14RRXMtKoPSR1ZXzxBZNZyEVm/N4HoEw9RQ/4duqUhuE/OSPp1VckWeNTQd+qj9Wf+s79J84YEDBOqUlcJjNZInjz/EaVNRMvn21R/I1Xt8v1QD6GEXOYulmilh3uy+oC1by16w/PYRmBQU1BHzY3VciVs4Zgjhu4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gevVPhmJDfeBhPDt7bTqXXZzC2OXbkPPQ3tykLpIMiI=;
 b=TDviDKhv0Cld8b8qhBtgCBSjZHBNZMjkbNtKatW7VfW8fY7IsZhTaksokbBurvS5QNO47G8UZZwq34q38Xu0rTOXWLL9pYCIl0qYeJ1Qh8dksHiYgmL2atp6PCuhZqYXN0obrHNM68eJsIYWh2sIzkNEVknnoRWEgYxxwlZmhYQ=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 15/22] xen/arm: Balance Dom0 memory allocation across allowed NUMA nodes
Date: Fri, 19 Jun 2026 16:50:03 +0900
Message-ID: <20260619075011.377116-16-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0091.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::11) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c839891-3b60-48b8-2552-08decdd776b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|18002099003|22082099003|5023799004|6133799003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	QZ+iOcchzFSLpCu1zSGAFvEijvonFVTMUV+FCJ75e3PdNb2Ua85IiQ0Ci1wECjYlF0A4EdIDNPYAQ+NQWODPxYvK27ppWOQo6gO2rTTSlIFsXy46ACJEYQQJfkRBiSxD2EVJOXgBZ3liASkKGcV55XkcDTY5I8twDBo1dN4Ckci4YbhPX10l+GulQ+pYrVxApY0ziYLPpCpIVfSGzPSjMqafUZp/WfkvECY2V62NqXS3iTZKUOVTpQmAn5Lzt9cqGW0/nFE7I3K4D4MCz68VCrgTXh9EVw+sBzIKclIk4VksjEObVoKlc/uab7FYFyyXXAVBbjW0A0D5A1DGJ1taDSYifXz/Rx6bMQSjaPVBxV5yo39OnHLsSQgUIGpHljD8he+a59RZ2D+PGNu3qChUoURmdIFKLBrUSiTKCpjgpcVq744n+4KGA1kZeBaoUCY8ztr3K+9bSf7eP63ZHjfR+ITPoFDlVs4iHdFG831jpKaF9XHW4FrX+Qgc6HpM9WDcMmsYX+20AfFRI1pGDAsYHu9E2z61jdH06T4908usIwBw6donBIOZ3ST2VS4qNftVf8yMskn08dMXBIvchex3ZhNYVByFtpy6xsg0iDx5iEZfwC5TKuIWeuhQhZEfj8xTC4JtAMoL5SMNTyTHLwqHsyn0dy1VtLEhdJbx+sHGZtg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(5023799004)(6133799003)(56012099006)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8kgiYc+Q0K62gB9bKu5NYoRP+4BM90aT0mJPnppzVkyEX+Fv74wbblG7CMJ7?=
 =?us-ascii?Q?vxJrQL+nZlBp42jbl3cLU7OahXdZD/DIJ7McLwJ9VU3phZ9ovDc6kwPiL0cF?=
 =?us-ascii?Q?kR0xBIiuUzCXQZeExcWiScLw6QH/Oa8gJetJH7gGiQcCTVFPNeVzUHGmOgRg?=
 =?us-ascii?Q?FZLJ0kmwnQapB3yvZpBK0ZkFZETBuUoLiQTLtmn3UMiTKv21XqDABcUb4JZp?=
 =?us-ascii?Q?SS7x3n3rsIFjh/x1/V0Zs5dJri2FGYMaKoeTJSntT1Sqj0SFq4T0F8lUgKaX?=
 =?us-ascii?Q?O7/DNJw5/uU0NGAaIUvBczTE+McJ024gJSRjX+L5lirM2EHWjgr8JUF/Oo2H?=
 =?us-ascii?Q?ERoUNGo/WdoUVUqzJNhlkg8ZjLty0zfJnJS8Xq3h3vskEg3FruTwiuwiTdeD?=
 =?us-ascii?Q?v9WIXRpByYKfwHC2hD8DSk/wsFfas3X/xANeHvGCRnKWuoqnkeCrtDm9I4dI?=
 =?us-ascii?Q?MFyySUUBnrQNJocDEbHgfPsZMu/LVhyrMNt5iXkLE1B8emLA5feJ9nUY87Si?=
 =?us-ascii?Q?BLCDHFPmkqxHLN4GokroHEx8TyOMyGp57qBYTg9VNM8wOlnoiCbCWtStsSwb?=
 =?us-ascii?Q?WcXY7tXiNtnyrioq9fXUU+McteGr3DitUEGJbZnggfCmKa6S8OrysyieWCqB?=
 =?us-ascii?Q?X1dm+AcCQCiIacjm0qUpqEbJlKP8zAp+e+ZXRUSyTyZ+G2Sv6MoLr3S5Mm3p?=
 =?us-ascii?Q?P2/IUC8yscONce9vKivj0J1vz+y2msR88XW/X3J6CnVKqA49ekmUqwYlx8K3?=
 =?us-ascii?Q?mh8HKpjEOwgKC2hvIb6bsdkMyLZm4p51lMP/+55ulUKFZNQ0BWuQ/zRwtRDp?=
 =?us-ascii?Q?HNAufJ1USfnL/TubuR5guNFekjurkoHu7N4bCcB3ZnvTMZAQZz/wg5lIZ2Ro?=
 =?us-ascii?Q?0amVnZZaFlYnAx3Cme8eX419nFfY960UyiW+cvUv2V69CPu6OeeLy+CAbxfZ?=
 =?us-ascii?Q?r5ejXsIVQoRI/v+1oC5B0S8nnZX42jyGsPgusQjiH/5yYT+FVmGH83xVewxX?=
 =?us-ascii?Q?o2C/1yltQJMywktePrxYw8vQ6IRc1X7PRqdQFz+8s3921CPRl3X8sAlvAq0r?=
 =?us-ascii?Q?uzF7IBnni97T8YT0jlJs31U4kmxmytEwRijBEaxgPuLDFbL3r+6ozq5mNFiu?=
 =?us-ascii?Q?s1qRZAmPvgsbc5LrfJY6P4AypyafSD3wh2xmxzTW8x1QfO5I02UnUkkQOnIr?=
 =?us-ascii?Q?KJMxjUxMkOhahXrgOKGBk45VImVpNZRe9EgP664bYvKAse3WErQPVN+1Uk+j?=
 =?us-ascii?Q?cAy2xNUpPcwFFViHejTZoBXT0PtEo/gAgUmULdC7B+yzkCRLrckmGSLQ5+zo?=
 =?us-ascii?Q?i87JoFQfc/HcbbcMYJMICW++Qu4CoglhBkEx5J2Ko969oQ3GFxoWB+AuJspa?=
 =?us-ascii?Q?iJ6AiEeOJaM32V9JDKBQRKGBYmS6BEtGFkJKslNXbuh3bdwUxOmUqMxn7Jx0?=
 =?us-ascii?Q?L/aoGkCnFnacrgBEbVkhalzhumlrb1F14h/mzqdSjMezXOBSvZV0iLl7EttT?=
 =?us-ascii?Q?DjrrG6S8hxxEUR0sfY48+gqiRPO7V/Jp2XYAkVILY9P7s2CeupZKaq79aA6a?=
 =?us-ascii?Q?rzyfrXY6Oy1XVnJQN8TCASk58bJ7wSFLoLaNpE7p36zUO4J87kDBZMvHWSo+?=
 =?us-ascii?Q?DeT7j4/2WYXM0wPZIluAJENaejxu7BGXnuEuVPQGxF49LYlo3YpRDW/zMSLS?=
 =?us-ascii?Q?W1b4x34GMg6huOGgcxdcQFCnTU6kfncU3LAQk6EWqYN6NsBBxHteAd8T3Ldf?=
 =?us-ascii?Q?WzT8my1y04vElwryVLL43RChlub8tMtDmX4akDMnayvOH8oPew+j+UaIF9NE?=
X-MS-Exchange-AntiSpam-MessageData-1: FgMOUGwTFMCyLw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c839891-3b60-48b8-2552-08decdd776b6
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:42.7240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nx69JhBD2F8+3iCh8xdUXd/cpewMabPXvA/ZR5sRFHqLQXKfCavwuJoRwXTrfPiqAuIX6Hyi1+vrYS/r2jj4Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-d25034/1781855445-DB5E0ABF-F0EA92BD/0/0
X-purgate-type: clean
X-purgate-size: 15149
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD47A6A472D

Allocate memory for Domain-0 exclusively from the permitted NUMA nodes.
When multiple NUMA nodes are available, distribute the allocation in a
balanced manner across each of these nodes.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 274 ++++++++++++++++++++----------------
 1 file changed, 151 insertions(+), 123 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c036721f45..6828cfc46a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -188,33 +188,19 @@ unsigned int __init dom0_max_vcpus(void)
 static bool __init insert_11_bank(struct domain *d,
                                   struct kernel_info *kinfo,
                                   struct page_info *pg,
-                                  unsigned int order)
+                                  unsigned int order,
+                                  nodeid_t node)
 {
     struct membanks *mem = kernel_info_get_mem(kinfo);
     unsigned int i;
     int res;
     mfn_t smfn;
     paddr_t start, size;
-    nodeid_t node = 0U;
 
     smfn = page_to_mfn(pg);
     start = mfn_to_maddr(smfn);
     size = pfn_to_paddr(1UL << order);
 
-    /* This code is temporary */
-    {
-        struct membanks *mem = bootinfo_get_mem();
-        for ( i = 0; i < mem->nr_banks; i++ )
-        {
-            if ( start >= mem->bank[i].start &&
-                 start < (mem->bank[i].start + mem->bank[i].size) )
-            {
-                node = get_numa_nodeid(&mem->bank[i]);
-                break;
-            }
-        }
-    }
-
     D11PRINT("Allocated %#"PRIpaddr"-%#"PRIpaddr" (%ldMB/%ldMB, order %d)\n",
              start, start + size,
              1UL << (order + PAGE_SHIFT - 20),
@@ -301,7 +287,13 @@ fail:
 }
 
 /*
- * This is all pretty horrible.
+ * Allocate NUMA-aware memory for Dom0 with 1:1 mapping.
+ *
+ * This function distributes the requested Dom0 memory across the allowed
+ * physical NUMA nodes in a balanced manner. It implements a multi-pass
+ * scavenging loop to allow nodes to dynamically back up each other if a
+ * particular node runs out of memory, maintaining a balanced distribution
+ * while ensuring the maximum amount of requested memory is satisfied.
  *
  * Requirements:
  *
@@ -316,155 +308,190 @@ fail:
  *    below 4GB, so that it can be used by non-LPAE enabled kernels (32-bit).
  * 4. Some devices assigned to dom0 can only do 32-bit DMA access or
  *    even be more restricted. We want to allocate as much of the RAM
- *    as we reasonably can that can be accessed from all the devices..
+ *    as we reasonably can that can be accessed from all the devices.
  * 5. For 32-bit dom0 the kernel must be located below 4GB.
- * 6. We want to have a few largers banks rather than many smaller ones.
+ * 6. We want to have a few larger banks rather than many smaller ones.
  *
  * For the first two requirements we need to make sure that the lowest
- * bank is sufficiently large.
- *
- * For convenience we also sort the banks by physical address.
- *
- * The memory allocator does not really give us the flexibility to
- * meet these requirements directly. So instead of proceed as follows:
- *
- * We first allocate the largest allocation we can as low as we
- * can. This then becomes the first bank. This bank must be at least
- * 128MB (or memory size requested for domain if that is smaller).
+ * bank (Bank 0) is sufficiently large to hold all boot modules.
  *
- * Then we start allocating more memory, trying to allocate the
- * largest possible size and trying smaller sizes until we
- * successfully allocate something.
+ * The memory allocator does not really give us the flexibility to meet
+ * these requirements directly under NUMA topologies. So instead we proceed
+ * as follows:
  *
- * We then try and insert this memory in to the list of banks. If it
- * can be merged into an existing bank then this is trivial.
+ * We first calculate the total size required for the kernel, ramdisk, and
+ * DTB to establish a safe minimum size constraint for the first bank (Bank 0).
  *
- * If the new memory is before the first bank (and cannot be merged into it)
- * and is at least 128M then we allow it, otherwise we give up. Since the
- * allocator prefers to allocate high addresses first and the first bank has
- * already been allocated to be as low as possible this likely means we
- * wouldn't have been able to allocate much more memory anyway.
+ * We then enter a multi-pass outer loop that runs until the full memory
+ * request is met. In each pass, we dynamically calculate the target allocation
+ * amount for each remaining active node to ensure a balanced distribution.
  *
- * Otherwise we insert a new bank. If we've reached MAX_NR_BANKS then
- * we give up.
- *
- * For 32-bit domain we require that the initial allocation for the
- * first bank is part of the low mem. For 64-bit, the first bank is preferred
- * to be allocated in the low mem. Then for subsequent allocation, we
- * initially allocate memory only from low mem. Once that runs out out
- * (as described above) we allow higher allocations and continue until
- * that runs out (or we have allocated sufficient dom0 memory).
+ * For the initial chunk (Bank 0), we try to allocate the largest possible size
+ * as low as possible, honoring the 32-bit lowmem/DMA constraints. If it fails
+ * to find lowmem space and the domain is 64-bit, it falls back to highmem
+ * without violating the minimum size needed for the boot modules.
  */
 static void __init allocate_memory_11(struct domain *d,
                                       struct kernel_info *kinfo)
 {
-    const unsigned int min_low_order =
-        get_order_from_bytes(min_t(paddr_t, kinfo->unassigned_mem, MB(128)));
+    paddr_t todo = kinfo->unassigned_mem;
+    nodeid_t node;
+
+    const unsigned int max_chunk_order = get_order_from_bytes(MB(128));
     const unsigned int min_order = get_order_from_bytes(MB(4));
+    const unsigned int lowmem_bitsize = arch_get_dma_bitsize();
+    unsigned int min_bank0_order;
+    bool is_bank0 = true;
+
+    const struct boot_module *kernel_mod  = boot_module_find_by_kind(BOOTMOD_KERNEL);
+    const struct boot_module *ramdisk_mod = boot_module_find_by_kind(BOOTMOD_RAMDISK);
+    const struct boot_module *dtb_mod     = boot_module_find_by_kind(BOOTMOD_FDT);
+    const struct boot_module *xsm_policy_mod = boot_module_find_by_kind(BOOTMOD_XSM_POLICY);
+    paddr_t required_size = 0;
+
+    nodemask_t exhausted_nodes;
+    nodemask_t valid_nodes;
+
     struct membanks *mem = kernel_info_get_mem(kinfo);
-    struct page_info *pg;
-    unsigned int order = get_allocation_size(kinfo->unassigned_mem);
     unsigned int i;
 
-    bool lowmem = true;
-    unsigned int lowmem_bitsize = min(32U, arch_get_dma_bitsize());
-    unsigned int bits;
-
     /*
      * TODO: Implement memory bank allocation when DOM0 is not direct
      * mapped
      */
     BUG_ON(!is_domain_direct_mapped(d));
 
-    printk("Allocating 1:1 mappings totalling %ldMB for %pd:\n",
+    printk("Allocating 1:1 mappings totalling %ldMB for dom0:\n",
            /* Don't want format this as PRIpaddr (16 digit hex) */
-           (unsigned long)(kinfo->unassigned_mem >> 20), d);
+           (unsigned long)(kinfo->unassigned_mem >> 20));
 
     mem->nr_banks = 0;
 
     /*
-     * First try and allocate the largest thing we can as low as
-     * possible to be bank 0.
+     * Calculate the absolute minimum size required to fit the kernel,
+     * initrd, and DTB inside Bank 0
      */
-    while ( order >= min_low_order )
-    {
-        for ( bits = order ; bits <= lowmem_bitsize; bits++ )
-        {
-            pg = alloc_domheap_pages(d, order, MEMF_bits(bits));
-            if ( pg != NULL )
-            {
-                if ( !insert_11_bank(d, kinfo, pg, order) )
-                    BUG(); /* Cannot fail for first bank */
+    if ( kernel_mod )
+        required_size += kernel_mod->size;
+    if ( ramdisk_mod )
+        required_size += ramdisk_mod->size;
+    if ( dtb_mod )
+        required_size += dtb_mod->size;
+    if ( xsm_policy_mod )
+        required_size += xsm_policy_mod->size;
 
-                goto got_bank0;
-            }
-        }
-        order--;
-    }
-
-    /* Failed to allocate bank0 in the lowmem region. */
-    if ( is_32bit_domain(d) )
-        panic("Unable to allocate first memory bank\n");
+    min_bank0_order = get_order_from_bytes(required_size);
 
-    /* Try to allocate memory from above the lowmem region */
-    printk(XENLOG_INFO "No bank has been allocated below %u-bit.\n",
-           lowmem_bitsize);
-    lowmem = false;
+    nodes_clear(exhausted_nodes);
+    nodes_and(valid_nodes, d->node_affinity, node_online_map);
 
- got_bank0:
+    BUG_ON(nodes_empty(valid_nodes));
 
-    /*
-     * If we failed to allocate bank0 in the lowmem region,
-     * continue allocating from above the lowmem and fill in banks.
-     */
-    order = get_allocation_size(kinfo->unassigned_mem);
-    while ( kinfo->unassigned_mem && mem->nr_banks < mem->max_banks )
+    while ( todo > 0 )
     {
-        pg = alloc_domheap_pages(d, order,
-                                 lowmem ? MEMF_bits(lowmem_bitsize) : 0);
-        if ( !pg )
-        {
-            order --;
+        paddr_t last_todo = todo;
+        nodemask_t active_nodes;
+        unsigned int active_nodes_count;
+        unsigned int nodes_left;
 
-            if ( lowmem && order < min_low_order)
-            {
-                D11PRINT("Failed at min_low_order, allow high allocations\n");
-                order = get_allocation_size(kinfo->unassigned_mem);
-                lowmem = false;
-                continue;
-            }
-            if ( order >= min_order )
-                continue;
+        /* Filter out exhausted nodes to find active candidates */
+        nodes_andnot(active_nodes, valid_nodes, exhausted_nodes);
+        active_nodes_count = nodes_weight(active_nodes);
 
-            /* No more we can do */
+        if ( active_nodes_count == 0U )
+        {
+            printk(XENLOG_WARNING "Dom0 NUMA: All specified nodes are completely exhausted.\n");
             break;
         }
 
-        if ( !insert_11_bank(d, kinfo, pg, order) )
+        nodes_left = active_nodes_count;
+
+        for_each_node_mask(node, active_nodes)
         {
-            if ( mem->nr_banks == mem->max_banks )
-                /* Nothing more we can do. */
-                break;
+            paddr_t target_per_node;
+            paddr_t node_todo;
+
+            /* Target chunk size per node */
+            target_per_node = DIV_ROUND_UP(todo, nodes_left);
+            target_per_node = DIV_ROUND_UP(target_per_node, MB(128)) * MB(128);
 
-            if ( lowmem )
+            node_todo = min(todo, target_per_node);
+
+            while ( node_todo > 0 )
             {
-                D11PRINT("Allocation below bank 0, allow high allocations\n");
-                order = get_allocation_size(kinfo->unassigned_mem);
-                lowmem = false;
-                continue;
+                struct page_info *pg = NULL;
+                unsigned int max_order = get_allocation_size(node_todo);
+                unsigned int order;
+                paddr_t bank_size;
+
+                /*
+                 * Enforce a maximum chunk cap of 128MB for all allocations
+                 * except Bank 0
+                 */
+                if ( !is_bank0 && max_order > max_chunk_order )
+                    max_order = max_chunk_order;
+
+                for ( order = max_order; order >= min_order; order-- )
+                {
+                    unsigned int memflags = MEMF_node(node);
+                    if ( !dom0_affinity_relaxed )
+                        memflags |= MEMF_exact_node;
+
+                    if ( is_bank0 )
+                    {
+                        unsigned int bits;
+                        for ( bits = order; bits <= lowmem_bitsize; bits++ )
+                        {
+                            pg = alloc_domheap_pages(d, order, memflags | MEMF_bits(bits));
+                            if ( pg != NULL )
+                                break;
+                        }
+
+                        if ( !pg && order <= min_bank0_order )
+                        {
+                            if ( is_32bit_domain(d) )
+                                panic("Unable to allocate first memory bank below %u-bit\n", lowmem_bitsize);
+
+                            pg = alloc_domheap_pages(d, order, memflags);
+                        }
+                    }
+                    else
+                        pg = alloc_domheap_pages(d, order, memflags);
+
+                    if ( pg )
+                        break;
+                }
+
+                if ( !pg )
+                {
+                    node_set(node, exhausted_nodes);
+                    break;
+                }
+
+                is_bank0 = false;
+
+                if ( !insert_11_bank(d, kinfo, pg, order, node) )
+                    break;
+
+                bank_size = 1ULL << (PAGE_SHIFT + order);
+                node_todo -= bank_size;
+                todo -= bank_size;
+
+                if ( todo == 0 )
+                    break;
             }
-            else
-            {
-                D11PRINT("Allocation below bank 0\n");
+
+            nodes_left--;
+            if ( todo == 0 )
                 break;
-            }
         }
 
         /*
-         * Success, next time around try again to get the largest order
-         * allocation possible.
+         * Prevent infinite loop if a full pass across all active nodes
+         * yields zero progress
          */
-        order = get_allocation_size(kinfo->unassigned_mem);
+        if ( todo == last_todo )
+            break;
     }
 
     if ( kinfo->unassigned_mem )
@@ -472,14 +499,15 @@ static void __init allocate_memory_11(struct domain *d,
         panic("Failed to allocate requested dom0 memory. %ldMB unallocated\n",
               (unsigned long)kinfo->unassigned_mem >> 20);
 
-    for( i = 0; i < mem->nr_banks; i++ )
+    for ( i = 0U; i < mem->nr_banks; i++ )
     {
-        printk("BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
+        printk("BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB) NODE:%u\n",
                i,
                mem->bank[i].start,
                mem->bank[i].start + mem->bank[i].size,
                /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(mem->bank[i].size >> 20));
+               (unsigned long)(mem->bank[i].size >> 20),
+               get_numa_nodeid(&mem->bank[i]));
     }
 }
 
-- 
2.43.0


