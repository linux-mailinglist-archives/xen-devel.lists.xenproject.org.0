Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZZtbEur0NGr9lAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D666A4701
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 09:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=KzqIyGg1;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1341740.1602075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzn-0005zx-PY; Fri, 19 Jun 2026 07:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341740.1602075; Fri, 19 Jun 2026 07:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waTzn-0005uO-KF; Fri, 19 Jun 2026 07:50:35 +0000
Received: by outflank-mailman (input) for mailman id 1341740;
 Fri, 19 Jun 2026 07:50:34 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1waTzm-0005jB-7x
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 07:50:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waTzl-00Dxzh-Ko
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:50:33 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4c7-e002-0a2a0a5209dd-0a2a450bbb74-6
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:33 +0200
Received: from [40.107.74.114]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <taka@valinux.co.jp>)
 id 6a34f4b9-5e53-0a2a450b0019-286b4a724d13-12
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 09:50:33 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TY4P286MB7477.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:356::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 07:50:31 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 07:50:31 +0000
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
 b=usEBasDQXTZ8IGzAnrgooUaeNy2Wn4rRbd2cmo04UAlkfSiCInycxEvTRZFB6EEoh2CM3jRir+G/1SiqBPmrQB4lml9Cor1T8gQ9rFBHs7pXTUjUynM740Y/sODPnsbVv5mRrje9efJ82CNA2yQyosE/ob5g111MQavvFsIrcw4FpFrg+kY4P+OdBHwMKSjAAvwZeNY9lZxv0RfDuHHyUiVr+rhqxIw8YxW3D4mfcuh16BNCpq5OoWsUOMkX2g6HWaCM7xyfNHNEYVxSSCC2IT9jhYCLtDHY//8zaOkTBN+4LiS01ygbPp5VF8yNXbL7DoI7WQ3o0vz/QO7xWxv+wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5jXGN5XTJvY8GDO94y/Kujx+vvvugQUUMTqzPztSCc=;
 b=Q0JeZycmGm5b0p4fobwddUaR/r/N+4yFjbYRLd5hRWbOn+1+EZc6qfJzGmU4nz7YKtW7z3o+TQohH08GeBWDi5vty9mOsi3TtAVaFgb6bEiEue+ZjQv5yAEzxTKh0h/X4iXgkSEt6DHW34WX9Mfm8ULV7lEJw5Sgw9jZzr84gW/VPksp+wAe+eSjyEF9caQ5mETzNQ3o0H/1W2aKctn0um1Cf31bN5DUezkf9FZkGvsjpYjh+zxz3oXiHbO77zE4OYajV/wAU4HRxsPVCpw7pQuPHoy315d4JKlGXskEq5tYXv70njxPTSSX43zbpPmzZ3U1vtiMEe8j6itzpufwxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5jXGN5XTJvY8GDO94y/Kujx+vvvugQUUMTqzPztSCc=;
 b=KzqIyGg1nxx+2HYYNyk0VlnKg2Pb4vb9n04W0iKQKcJ38iZ+SQh9MRyH5zWTGyiHyc5Dna/bfu3/mS5dGjE/U3dHwr//FOa3txhGnoD8rOdWRfvhpimfVPL7O6dd4meuvZIRxscxRDj6fJQQ78iknmjjTqzZyV3aytukYGRuzyM=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 10/22] xen/arm: Set Domain-0 node affinity from dom0_nodes option
Date: Fri, 19 Jun 2026 16:49:58 +0900
Message-ID: <20260619075011.377116-11-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260619075011.377116-1-taka@valinux.co.jp>
References: <20260619075011.377116-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0149.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::12) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|TY4P286MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: e71534fd-44e5-40bb-fb59-08decdd77010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	c3dcrBNcHKeXeOLiUlolLmxCCD1iEFSDFVWsJC7eNXlHf0+PSCiX/Kz7r6ybbPE4/58TAtvx8Jmg1Va8byWXpwRii0NtJZExsWcy6vuxeL9uegIQMeYgAp8OKTNFcXEtz7y5Grpzpm2K2I14oFnCBn+XLCjNUNapNGMP/Or7NsO/LgxU5gRpSYvsIPWpJlR3x5mGeDDQ3Q6S7J5MpoKDz6O67LpgxHXIlagu0MP5jKKo9Q2qDC/19VLxeJQpOBtAlsjhCcPNy5ByAITkechSNIzOfJ8hqUEzMXPqOVPrFu4MwHRoAfKjmHxmxEoSQBqM7O2PJ4tveAEUbPRIDo3Tm67qeeopr2SO6SDAvBzGZxcrKkIuvq7AZcet9xOcrJkkWXkGsYDmbyuki8sdK0c0DCoRZzRNsO1UCORusc8sXcYE+gc74QhJRWt3IrFTEkE0O9U1lesp/mZvHfdW2YFbS0aFcMURjP+riENo6VE+FRpg6GwFl70LBlJgCcKoxZw91ip/9j3qsvlL5N2ZnnjHJPVNYlH3d0J0nFDza0+2kIKp9j8VS3es+oBo88IxtdtigaAEUK4QxNlNILaiqGE/1XCMq46eDGS85re9neP1ZNgOxdv90x20zgYT3345SIXsKGw/MRkp/XV4+/GQZAqSN/Oc6yz8/19/pi5Inn91pz0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qfvTM70FNf3L+zz9SsVdZvodKV6FFafljSWNM5rBBL7FbpBR1u78k79oxESV?=
 =?us-ascii?Q?Hw9cjK0WlHDzAzxzcrBtpgHtak/Ots6ZhowGlzr/D2aHZgh1bG/kXgvoPTj9?=
 =?us-ascii?Q?5uTH+cT+MAFSSV9oenotu8NxnYhcN7X96t7o/+BlbNOJD1ITrIGtu5ywJllF?=
 =?us-ascii?Q?8sBubqMrdicRAgxqfWoLHc9wbepvahy0OFUJAQxSt4bZsOEj91YBmS20G1J7?=
 =?us-ascii?Q?TeEVzh00Iu6VjR8i7/e3mavLccVlYBiWqMdH4W425bmR9U0+ONCaOewhE7/w?=
 =?us-ascii?Q?BvHTDSoVS0NIM04mZI4rqoHRWMT75fojA2EvHNlBnhtwlDbk8uB5WxSW/u79?=
 =?us-ascii?Q?HOfJXklSQPMiCeRWJJGpJoJUB6BoJtG2UafILYyQyGpAhcqyHkF6B7hn8fho?=
 =?us-ascii?Q?s6h3hoMI1vXWwwYzpnHqMyPDxoJEkrzmOjjYjzS22tN1zJA5B+6Yy8ieNsa4?=
 =?us-ascii?Q?Oz5N/O9LB/I+iKHww0/A1EXvz0ZAPvGk2JBJwCNPVUhKh4uw/zOjqCxwOkJC?=
 =?us-ascii?Q?JY6LnetPg6v8mjjF9tCRwFhhbqfdRDka02Cj6yUXxhR2o3B7v72OhshWfOI0?=
 =?us-ascii?Q?idPWLG8uJs+U/DX8nk6trO+F7xs48v9XSFwDQOfDiRljikXcVHGderFrbmyS?=
 =?us-ascii?Q?E63MSu261d2qSS/SFawiMDwTr9M0839KNf8spd9Zy/v6xeWQpKCEtWxozgY2?=
 =?us-ascii?Q?nuRl4GQoaUQOQdiJ01xJxFrDFBOi0tssWfFRJWphf3ePg5kh8C+7yrx9/lTF?=
 =?us-ascii?Q?shBl0c95p7X7coO/OE8kzTcosnHHytfSsRIe+tXf163OpD0BRXC+naRbmeQH?=
 =?us-ascii?Q?ixkoy0kXYcc2WwQ9fkjwL2mv7sCFEwXjHPTTfwYG5+XDxDlc3sqPD6jLoA7a?=
 =?us-ascii?Q?KrrU2CS60gkXqEcfd51OPvmnsH/yqNIL9CAFIyt4jAmVX3P9vJRjCjw4KWlh?=
 =?us-ascii?Q?Iqti5hmxVD5lZU4s/8C4EmWxnkEeGSP3jAXV9VyU9pA81ew3Mv0HClO7JlmH?=
 =?us-ascii?Q?uhGVTvQqepdz/3hFMaLeRsoonHduxe9k5e27DZvtlmcZu9sv+FqjqnroFMpv?=
 =?us-ascii?Q?Le0xR+VrdtoSzbGsMHZw3d9BsauFzu2fec/LV5kao9V2+QlWhnRWX6J6AaK9?=
 =?us-ascii?Q?bM2ROmgsHiuBovdqVRGDW1DVg4h0XqGe9WF1oeQlNbqGepZ1x5JnZqgzdMmK?=
 =?us-ascii?Q?zukXbEk1SnAMaAjAFcjYsuaB6CAVcQ5Ag8PsR0cY8b6IfK6fbmLWlUaG0YF/?=
 =?us-ascii?Q?FjaolyvkwPyyvCnzwFo1qwd7vCrfeiGp34jxfiWQ1F/DOHcgMdxWwP+y+8Nt?=
 =?us-ascii?Q?hhnrBQki7jlHOPax11zP9sgvuyEi9BwqL8HsOpCqvjbRUX0ankegLgN9Wo62?=
 =?us-ascii?Q?dtR1/HCwm7xCYa50IEggVfDAuvl7KMlXNIsN3IOkl8UozZ4FI+3CcEOLku26?=
 =?us-ascii?Q?wAa/JTOPua3wgvYKe4ELSraM+bADFY5Cruj+IQM/uMokz3ljRL1stFFZebaj?=
 =?us-ascii?Q?JPBxRQBMuyYGOEx+UA5ke1ycx5o7MMtFFBBkRvi4fK+bUHQOsx+i+JS37n4F?=
 =?us-ascii?Q?IMFC7y8cAWA3QVEygYzWL1gcC6HFBQJbN0cGLdzI7AScOQLdtDNlqew6SJV5?=
 =?us-ascii?Q?PySLkPYZyzoFmUmgssvJnQimuu0RJfJ+Y8EC6jH0jShzmOgChvD243gcdMuN?=
 =?us-ascii?Q?0hVCQlFY1zKaMZ0lrM+q/J6c0tPIN9kXI/jdpUAYEyQKrRKMycUGPwLKB5lR?=
 =?us-ascii?Q?aYk0J9PfqOncG8jcZwqfFA6n1FzpbxR7SGd2xxhuXKZexikY/flzvJZKS7qv?=
X-MS-Exchange-AntiSpam-MessageData-1: 9dADd4zpMR6LHQ==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e71534fd-44e5-40bb-fb59-08decdd77010
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 07:50:31.5704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TktVRVKAyAdkPyHaNVewrZaoKiFmap8YGOoBnyrCy1GaNHkZPAzvBIc0ZgWWj3uYzEm7VDJtcfIvHOIhv9O1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB7477
X-purgate-ID: tlsNG-42698a/1781855433-445F400E-AB86C881/0/0
X-purgate-type: clean
X-purgate-size: 1182
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37D666A4701

Set Domain-0's node affinity to run on the NUMA nodes specified via the
'dom0_nodes' boot command line option. If the option is omitted, the
node affinity is configured to use all available NUMA nodes managed by
Xen. When Xen is built with CONFIG_NUMA disabled, the node affinity
falls back to using only NUMA node 0.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/domain_build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 512ae8e630..1dcb5b3455 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2035,6 +2035,13 @@ void __init create_dom0(void)
     if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
         panic("Error initializing LLC coloring for %pd (rc = %d)\n", dom0, rc);
 
+    nodes_and(dom0_nodes, dom0_nodes, node_online_map);
+    if ( nodes_empty(dom0_nodes) )
+        dom0_nodes = node_online_map;
+
+    dom0->node_affinity = dom0_nodes;
+    dom0->auto_node_affinity = false;
+
     if ( vcpu_create(dom0, 0) == NULL )
         panic("Error creating %pdv0\n", dom0);
 
-- 
2.43.0


