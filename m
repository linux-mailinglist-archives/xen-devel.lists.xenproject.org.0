Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oL/zBe30NGoVlQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AF46A473A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b="HuCw0CD/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341733.1602016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzg-0004Rr-5o; Fri, 19 Jun 2026 07:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341733.1602016; Fri, 19 Jun 2026 07:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzg-0004O7-23; Fri, 19 Jun 2026 07:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1341733;
 Fri, 19 Jun 2026 07:50:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTze-00046t-RG
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTze-001qMv-7n
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4ab-2eae-0a2a0a5409dd-0a2a4504a682-32
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:20 +0200
Received: from [40.107.74.93]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5f9f-0a2a45040019-286b4a5d4991-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:19 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYTP286MB4024.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:185::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.12; Fri, 19 Jun
 2026 07:50:14 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:13 +0000
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
 b=Hy2C9xnszRL+Qa89EGIFb2k7vsQLTEz/SXhacF/6GEAoMPHL8GxeTPUDl21lYgP7d68vy4Ivcg9cCsLm+kRK96X7DWmaIHOvawTfBpR5WswfPBuegxX16rpXqFaH4pqriFT08mNfRNNoMLnNh4Dn35zAYTEhaHiQ1EYM2Wv7RbIf/ieYjQlQYYJKXpkmLWMzkittt0lLwSV9pEr+WWYk8QW17eMo4kcYqko3b0LgQ2djS8rg4VVboGzbbC17nTkU8WnoEC4t+ldgsVIHWEUYqtFELNpLS2FytUlkErKxJ4w1Bw1dQwW1iReYOoJTFLQxHRFNwNo37lhexMjEAX7lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5DRyVcGqc4trjAUUFIspT0qRbRZA+1C1Qy6wanYWX0=;
 b=esF6qEghcxqV8KTxizuC6j4nqFCh0XSdkmaH1RAE3xD9mCk8Tg7td3OOx90Zf+PUNApKX/oe2Eg+uygzqp1TIhuxk+Fn1z2R6vsvxj5f9z7S00mJuRuwPDhte50b3M0tscqcKCwKkRs8mxnpPANTmD4Aqqj0+TTZjVAyBrRSbCj3Rkit5AznzMDeGsD1dEug0+xKGyVq7oTPlXYPahP1PLc/kyUHXuHTEherEk3ZX41VYj27u3dh48XJZWqfRt48OEBoW0aCWo612RvnKaHOOT9q/+gbDsfzsolVtFGE5ACAA6/rTx0xssfZ361yXfvjKQkW00Cd4V7DuRWZSwB2Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5DRyVcGqc4trjAUUFIspT0qRbRZA+1C1Qy6wanYWX0=;
 b=HuCw0CD/MWb9KZC1V+FKhFKsG16fS6CGj9JtOm81WXKTJY4/zM2Fh3fXWvMLu7+vY3ukAY+/pTdiXNgaOUwgh+L/YZYBNbRLHE7Px33mqL+V+GUBmxe5LCn+uf/Q9WHuNrbQ3y/7HcrjnzPsTZ+Eb4xr23JC7sEgCsjJuFGIcd0=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 00/22] Introduce Device Tree based NUMA support for ARM Xen
Date: Fri, 19 Jun 2026 16:49:48 +0900
Message-ID: <20260619075011.377116-1-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0005.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::9) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TYTP286MB4024:EE_
X-MS-Office365-Filtering-Correlation-Id: df1aedbc-a2ea-40ed-776c-08decdd76563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|18002099003|5023799004|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Bu52PLS++K7A3Rbb5HY54ncQjGbM62LDFF2sAmIS0tc3nmH8zhUzRcumPLo98oNCK8zg0YEv3i8olREiOCyYwt5a9Gtcbl/HnanXNFE5Iic5Zn5UcZr8v8euPgWO72jab35gPyV8Caf86m5zQsauSfNiXWfs/RXLdZr4LiFq4e5XAK3XN9iLYNHLG9MJ7e0PUKmKFTDIXzn4QtRDq7AQTT8L9m10znzL/bjKi+6J2t3nbNN4FbSXz009mWwR5cIhYZkkRfh/jZkdBHpHH5weeaE3kK6LTVrToPqF4KEqlF7hfovIiosNvRI4PvvhSlNa/vClHp0ysKOHmNF2scGH/CxnjztvAO01xHaDMZnyPS2hhdY3EAQ3JH+JssPRIJoaCXVPzcJge1x/OZ0YD9dnon6QIivbDwkdQjwc63PJl7aMEY7bJx2yqxRhS6A9zIwTe1qwHEYuQ6HRmacOQT3DSH4H+QYtiK2HAbV5mffWXyDO/qps8HhRUO/n63MxqH6uD6U3OH6rj4cG3tptm/a92PZAtrGfJvqDst52RJgFiPhPpNlIEcwGpWEiOCEi9UXo8FiZB9zAbWSPEKw4dIA9GEQEImjkzbeENXIMJ5IGOGQhPROoR1RfaSMKF1nkkkL8iouwjjUOeN35aEWOLYUvdV6eL1iLG5vVDOOL0QLWWRw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(18002099003)(5023799004)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Aei1SFZ3NGFsOcaiOxI4Vw4N/NDhWcNtynKgnq+3KLRJNE3rfFg0rfUTUtOV?=
 =?us-ascii?Q?uOj1wb/yLt19B3hTpuHki+O7z1gBifGzS7oLWjE5smRhMIvT2Saxro3qp5Fm?=
 =?us-ascii?Q?IZbWmpduVhwHkCuo9ebQMGrVeDTzXTZV7aoY/YyrgJ1Keo+X//P72lgmqL4z?=
 =?us-ascii?Q?9E59c3cefrOcFPGhuNlL+Ehx5jATkDTW28nfoMcVRbC5rfbWwRFm+AbSIBMO?=
 =?us-ascii?Q?GAmdWCtZAYczpcD6vgx/VK25d2SNbrTykm09V8Fqc+XGvs/hG+lUlzka/Nge?=
 =?us-ascii?Q?RZaIoJrD0DB5BrMv6OKSO98THbbqw9MGdaFQ50srEyIyBUizdqzvl4uBBQEm?=
 =?us-ascii?Q?KL1IlqyLnVt+OfA+QiA4+O5OQ7b0CJfCaGz80w6qg/QLCMYmTrcD55EllF5T?=
 =?us-ascii?Q?VS0fA88wSKmAr1TYDOqktCwzfVZqJna/c4OrLfUsYGrhuVVy4e70661UrCkN?=
 =?us-ascii?Q?W+fA2a1TTQl9/EpqRyXUEl4go1AQAq/V+gczEIY1bH1DKno55Co5U7v/9XIg?=
 =?us-ascii?Q?J0K6fIZ/3zpg767qyQal7nb/38GJTq/eKMBm9inRNETT8RgwjeYFXMwk+kI5?=
 =?us-ascii?Q?fIJYoWqL1iuRJeVf3Lip4n7mjvd5HUNJyRRrfYDY1+a9Xpy+cCREadkPTgGp?=
 =?us-ascii?Q?dukHBbjh/176eudHa0uSvPjNvuARZ93z/M1n9sRKtNMb66k+tlpK+KVRqusS?=
 =?us-ascii?Q?l+9Ras+D9GqQDj92K+f9P+zr0PvgcpWr0qEe+VV3OZVz3yvYGcK4L9DzyQx9?=
 =?us-ascii?Q?Ll42kjKNsCyp9sFG9b7BU7rfSZD/2SmTRL9UCB5S6GPLX5+RKLTmWh7iI5u2?=
 =?us-ascii?Q?fNHtuCrkafUl1k0HhldsvQE/y+zbEE8YrVHJwmKWPn3vs+X0FLvJ+kxdLAll?=
 =?us-ascii?Q?aULW+6tX73zly/yH2uEqB/pA/4sBbA5SEsbo4yIn4jAAhBeJlLyf4JrZwr0C?=
 =?us-ascii?Q?EYsy28l5vQ1cWWV/ucalvn1msAiUtCNQwlSwmexRuGQlZSNs6GBJYgPwJUJ2?=
 =?us-ascii?Q?SytIq3Ba5/PaIKUF5n0+5JNil1TwhwxkqnsGVKc8IfMu4ABS5y3Pk4rYizv0?=
 =?us-ascii?Q?/7yrP73FUJ9y3YWWk6M2Bp7QfFhhVv96sHLxmxSqC310SsjRsTpVfMLxC3FX?=
 =?us-ascii?Q?e3kAlSrS8nj+x2LlFLukRqXd2W8t2vuf1aSgQaVbm8JaCCrWKaL40OZfX/Ee?=
 =?us-ascii?Q?iJGTez1y2BPNF+6EK6XFRWreEkuFw35bVs+RJ/7vRSVJhuqfnwLX8nxzaOLV?=
 =?us-ascii?Q?LdQhftjQe0URq/ncHLDocZYULlvup58u5IunaFFeWQZ0ZZzWGvvHVMS7iQRE?=
 =?us-ascii?Q?SVebGBwSQIf5TVwZWtrGfq82AMhEw1dXb2SJjtpyaNQsvLV4JG1btfZLpOuc?=
 =?us-ascii?Q?u40hmB/OeNKrB03S4T4Asx8mjZDkSQKiSfDd3/ZrYulqXOHtjMMPiyhJ6Czy?=
 =?us-ascii?Q?OanI7e+cqRL35IkLH+qBWtop/sZjf9B1bSTfFD0/LK17bfIhQzYew1LjBlCV?=
 =?us-ascii?Q?UTgqEZ9He87d3QIpBy/vmefTvxTcq6sgAkyjSK4O8FwN3MA7TwDW0Oc6Zeut?=
 =?us-ascii?Q?2YipVgkssY/OolHZRdltkcS7WfRhhqg6xB33XzgguQNGaQrp3uVjuNU1r5uS?=
 =?us-ascii?Q?7U9PCrgYhqb9LuDz6CQO7xX55cswjBNQF2PBGZhXvz5CfVmuZsTIYiNUKL9B?=
 =?us-ascii?Q?V6TnOAA7CZJarmIU05A/6RON7j89y11LVUvQOJqTVT6zD32a5hsQbQmqFTIl?=
 =?us-ascii?Q?kwsHp+/F/SJlN1IFl9U2PuZlOLDNex9i19LAv4t/WbRs3cWNzf8HkFFHIYy3?=
X-MS-Exchange-AntiSpam-MessageData-1: m5Qzg7O09x8rhw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: df1aedbc-a2ea-40ed-776c-08decdd76563
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:13.7554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaGtsQuZfzmiZpofkqWaWLWsuDdZadREHTJ+w+4LZ26czFC8Y76ncFZnEEf+ZSyIBn46AVRUNJCO7sWGlrZKPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB4024
X-purgate-ID: tlsNG-ebf023/1781855420-9EBD7141-8EFDA251/0/0
X-purgate-type: clean
X-purgate-size: 4412
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:mid,valinux.co.jp:from_mime];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9AF46A473A

Hello,

Here is the v3 of the patch series to introduce NUMA support for
ARM Xen.

For this stage, I am focusing on getting it up and running based
on Device Tree. I think porting this patch series over RISC-V Xen
or PPC Xen will be pretty easy.

Please note that this series is meant to be used alongside the CPU
topology patch series.
Please note that this series is best used alongside the CPU
topology patch series. It can actually run without them, but it
won't be as efficient.

Changes in v3:
- Split off the CPU topology patches into a separate series:
  "Device Tree based CPU topology support".
- For the distance map table, now we only allocate enough memory
  to match the actual number of NUMA nodes.
- Separated the distance map table functions into generic and
  Device Tree-dependent parts, keeping future ACPI support in mind.

Changes in v2:
- Fix vNUMA memory allocation algorithm to support ARM
- Allocate vNUMA memory from the associated pNUMA memory
- Include the XSM Policy module size in the required memory
  calculation for Dom0 Bank 0.
- Enforce a minimum chunk size of 4MB during Dom0 memory
  allocation.
- Define the cpu_to_core() and cpu_to_socket() macros in
  cpu-topology.h instead of processor.h, as processor.h should
  strictly focus on processor hardware information.
- Make cpu_nr_siblings() an architecture-specific function.
- Refine the code to conform with the Xen coding style guidelines.

Thanks,
Hirokazu Takahashi

Hirokazu Takahashi (22):
  xen/device-tree: Initial framework for Device Tree NUMA support
  xen/common: Default function to get the distance between nodes
  xen/arm: NUMA helper functions via Device Tree helpers
  xen/arm: Introduce CONFIG_DEVICE_TREE_NUMA config option
  xen/arm: Configure NUMA affinity for populated memory banks
  xen/arm: Map populated CPUs to their respective NUMA nodes
  xen/device-tree: Read NUMA node distance from Device Tree
    'distance-map'
  xen/common: Allow building ARM32 Xen with CONFIG_NUMA
  xen/arm: Introduce dom0_nodes boot command option
  xen/arm: Set Domain-0 node affinity from dom0_nodes option
  xen/arm: Reflect physical NUMA node IDs in Dom0 memory DT nodes
  xen/arm: Balance Dom0 vCPU assignment across NUMA nodes
  xen/arm: Export Dom0 vCPU-to-NUMA node mapping to Device Tree
  xen/arm: Generate distance-map node for Dom0 Device Tree
  xen/arm: Balance Dom0 memory allocation across allowed NUMA nodes
  xen/arm: Use dedicated function for Static SHM Device Tree creation
  tools/libxl: Fix vNUMA memory allocation algorithm to support ARM
  tools/libs/guest: Allocate vNUMA memory from associated pNUMA nodes
  tools/libxl: Add 'numa-node-id' property to DomU memory nodes
  tools/libxl: Add 'numa-node-id' property to DomU CPU nodes
  tools/libxl: Create 'distance-map' node in DomU Device Tree
  xen/arm: Support numa and dom0_nodes boot options

 docs/misc/xen-command-line.pandoc     |   9 +-
 tools/libs/guest/xg_dom_arm.c         |  57 +++-
 tools/libs/light/libxl_arm.c          | 103 ++++++-
 tools/libs/light/libxl_vnuma.c        |  13 +-
 xen/arch/arm/Kconfig                  |   8 +
 xen/arch/arm/Makefile                 |   1 +
 xen/arch/arm/domain_build.c           | 426 +++++++++++++++++++-------
 xen/arch/arm/include/asm/numa.h       |  20 ++
 xen/arch/arm/numa.c                   |  57 ++++
 xen/arch/arm/setup.c                  |   8 +
 xen/arch/arm/smpboot.c                |  20 ++
 xen/common/Kconfig                    |   8 +
 xen/common/Makefile                   |   1 +
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/bootinfo-fdt.c |   8 +
 xen/common/device-tree/domain-build.c |  99 +++---
 xen/common/device-tree/numa.c         | 105 +++++++
 xen/common/numa-distance-map.c        |  62 ++++
 xen/common/numa.c                     |   2 +-
 xen/include/xen/bootinfo.h            |  39 +++
 xen/include/xen/dt-numa.h             |  30 ++
 xen/include/xen/fdt-domain-build.h    |   2 +
 xen/include/xen/numa.h                |   7 +
 23 files changed, 904 insertions(+), 182 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/numa.h
 create mode 100644 xen/arch/arm/numa.c
 create mode 100644 xen/common/device-tree/numa.c
 create mode 100644 xen/common/numa-distance-map.c
 create mode 100644 xen/include/xen/dt-numa.h

-- 
2.43.0


