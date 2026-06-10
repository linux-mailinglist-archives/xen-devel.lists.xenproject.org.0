Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hqxsMAlHKWrtTQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:14:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC502668A09
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 13:14:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=X1z3dytZ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1334127.1597243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXGsJ-0006hz-Vg; Wed, 10 Jun 2026 11:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334127.1597243; Wed, 10 Jun 2026 11:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXGsJ-0006ch-Rs; Wed, 10 Jun 2026 11:13:35 +0000
Received: by outflank-mailman (input) for mailman id 1334127;
 Wed, 10 Jun 2026 11:13:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wXGsI-0006A3-9k
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 11:13:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXGsG-00GqBH-Aa
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 13:13:32 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2946da-5cb7-0a2a0a5109dd-0a2a450880a8-12
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:13:32 +0200
Received: from [52.101.229.134]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a2946d6-63b5-0a2a45080019-3465e5868771-5
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 13:13:31 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB6556.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 11:13:27 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 11:13:27 +0000
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
 b=WbQ3bavD4E7BuKM+eKzmqZn5dmLV4JpAe5lMCEFn4vYq0Y/V7fq+GBwhMp2pfD9/DG0RM3Aw9dwcwx/tHgE9iY1S7M2Rtuj/zxBIrrzEEGQQLF/0DmL+vbW3ymb7aOPW/v9rfqC2nYnQ635lyBfpvzRY1XKOiAi0yA0IlC4xv58nH8+Qj4FcpYRmGdaEYII+8jszFSP2MKh7Dd3bfq4iXPLa+OF4YOYaTHpzIoggUz/nu4HfC4lwo7D+2F7b0LmuXvxLXYQa14yRPczxgwFHveVGto4SyiNnZ3GZ2UQasUh7HxP/C6OFgtXTZ7MVJj/l0q8k8BfzO0QaFEAmHezLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cky4J/vAnZ9ZOtWZWlZtLmbIbAOYjiQm6m2bXsjzg8w=;
 b=SJHOh/4XwejsHtlOoPcRHyTDT87trmQeHYI9xxF4kAb+vzEGHtzQbUAcPwvLFRURpi+9HE9zAsX6GJhOg/w9WzuEyggVihZE2TXM/VJKf0lfWT1Dpy6pfSZtMfeo9NuHjNwPscPwnHYNAMgdx7cU8udfmDP8MU1M1A20WoutEgVCpEpeBf9psPcGVxOfiuwNmvr5DObT+YLC7FBJuv+mM/sMXuRQqYPKDxmRugl8NxbDdrh4Jk0cBdbb51/xCarPWjQ1kBotNmXuYE5mkfQVen24s0OJeLVjGIFrb0z6Z8yxHFMGqm6MVpMePAvc45xs9FJzzhwj4hDW+NgJdlsNDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cky4J/vAnZ9ZOtWZWlZtLmbIbAOYjiQm6m2bXsjzg8w=;
 b=X1z3dytZnecBhDBvsTfq6ixbTALNV1rKxptavSsCET9JlkCF1mcHwJ2l/vSnGg0OZ+MxB/SJqeFeAsDE6OdzEcjWL/Zapoyclk1eaouS4/egVnAgB+MNsxQTbg5ciNVUwLX3foUeI+HUZLaFctb0m7qeotLn8llofL0QjtbQurE=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Mykyta_Poturai@epam.com,
	Hirokazu Takahashi <taka@valinux.co.jp>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH 2/3] xen/sched: Link CPU topology to scheduler
Date: Wed, 10 Jun 2026 20:13:19 +0900
Message-ID: <20260610111320.133784-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610111320.133784-1-taka@valinux.co.jp>
References: <20260610111320.133784-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:3bd::18) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OS7P286MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 811ba388-b67a-4479-6437-08dec6e14be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|23010399003|22082099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	v6cdxQMoigjGpCUeTvzGpfaDceWK3bQozNXE43bss/AoLnI9X8n10n78nRsH9G4gK8SF51l2CaF77cmq1AiCGhIrCTACaSg5wuCyrU8SB6/W8BPA6E0Nl2odB2b8h5XPwhwCu3Q43+TWGqyzaSCjRW1Eninf0GV5w+99EelgzOCN2pu0jlOYOlT9YXUl8oHz1TOw9fmBjFSi7nte6Kfmr3U2CM4HNsfr9XPZqIZHRQIT0NLnX6l+CrooYkf70eBSuExZugIKQkVrfMmfMW3kG+UprcMnZ+B5QX5xKHiCU+SVVEMy+liZGkDhViAslJdUmC/lJcvAJ0d2lLmi1FxW7I4ODUjektz3VBGcqhn3ADjAQCNmBZU/0QHiOWI9WBbWtj+faePSnPEEcfV+Kjk5+4NAn/KICJH1yxtLTYsq4XudTdNfjBakEJ0eqiKF5clHy18oXOKuDsy5Aic7+5jWAUxvYJx0YCe8tPMeVByT3aR9Mr/k+/FAqcpSuHoSlJ0HeL0s145YFl5qy6i8xTEr8n3L6+q5OJp9rVeI7KC+CoWfFaWP4yun2mmSusLIQ6VSFwtPYnc/IFZpgAifiUAa5HVJI7onpekvOY+0eB1ZOvj0P0niLNMoP8bWugvy6/sE91gklhXTlAXLZIwYTF9ex2UlDAXy3FNeXdsjgOsvyzNVzco61z+c716E4dy+kWJ/
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jqtZgAigOLEF+fGe4PzBALkhSWmlgNKJxpCStmh0NvP+AJxBnSYVmvwxsXI8?=
 =?us-ascii?Q?tQWGfDRUg1gfzRunGuTJVVdoFSfV2c4aYWYiTxXVxMBx3d583MXkOHGfQnPv?=
 =?us-ascii?Q?jAaag03X1s0q3qOdtcPZvaZo6udskbkmWDvOEJubbkpbTkYhc2mx4Q2CMuhy?=
 =?us-ascii?Q?f/Vxlm1OL8kPPEJHU7S8n0t6E9q6P30OJo2QMmxN/8Cofu0jmNGAD/1xZJMQ?=
 =?us-ascii?Q?gS8XBP8VRPNPABLeBEfdWwikTCTiq3j/YexNTZD0wUCkGwXtKevGgMtZXbN4?=
 =?us-ascii?Q?CspbWbLzL1tyDNlwkkXdnDo6TBHMhQWk0SmbHSQ+oT8uSxeuDTeyU9TDdjbw?=
 =?us-ascii?Q?AYZde4jdYbDsvq8/CQ0Rq+ghIBPZPfhYlR+XRXyr89hVWNgupw6X7xFF4DxJ?=
 =?us-ascii?Q?OUrrCjtnJwKJda5EQgx5wZl6KBQYH1C0joyxDoQCIJIKEBbvvY1rlZkr1eiY?=
 =?us-ascii?Q?DSQuhkgu141q3+xQ7J1XrGdWChB515ePnC2kPHxBPXrR7GLCtTqXPoL5OCtd?=
 =?us-ascii?Q?1MChkjTnOFQfi/BxM9RmDF0SXVMIJ1358Rhmcu48/9aqXAlzC43vGYd8X/7e?=
 =?us-ascii?Q?PKisZiOhrRQdDiQ1qeNk9Ni1YJcXred3lQzJKYsvKRF95zuehZljK0rLAfPC?=
 =?us-ascii?Q?z/bxLIAl97dUgzK9Jg0Y1F7KBGDM//nX57k+UJO4wPDG83ULgT76Vi48WlbK?=
 =?us-ascii?Q?xuOdzvWi9c+eJXIbf+dPcwGfeVHy6JWp/dQDwMBMFQaoEaveX+fOMh2mFuYp?=
 =?us-ascii?Q?mMmsox2+8zUDXBuQrhqYzExbmXuTMGX8k3Iu7X9nudjr4syqbxNDGuqSBF4Y?=
 =?us-ascii?Q?TnOUO338XQxSAge6380rHhTaSksb8JqnYRpGJdwgyAgQaG2oo3XZ5LD53xmQ?=
 =?us-ascii?Q?hUJzqh5+vZ1IHMPRRvcW9Hs093rjTc73iinqQwN592dsdHp5yLxuS95nyS5L?=
 =?us-ascii?Q?/GK3xuRgn0k2/QvidjKB1w8DznxOaLSAv5khC8WGKe7lUF9S+Uy5QHURMhCZ?=
 =?us-ascii?Q?UK+/NkI5EVQaLxNsO2lot4/3o7H6cWBCmG+Cf/4RkJuaudaqqWh1nAaJsIRQ?=
 =?us-ascii?Q?Xq7nXRp3iwQVblDIRtNRZ/QSe+WqhxDKSLsy0ZLfxgJA4895du+MH3cAZ4QI?=
 =?us-ascii?Q?sKvvJA5nZWpW30Bas39D3o2LudKtWXN2ryV9vJSfXMGlaqP2fFFr4xswgK4M?=
 =?us-ascii?Q?99iGRymyNSZPwxC9PZKdsnVnR9z+J3QmkapIAW4nBNuiLTdDwDRUjQagFaRL?=
 =?us-ascii?Q?ynY3EUhOf10LbibDK0IBsUoIhc6TOFKk0NtxnDhQ0ElwBO9Cm+zi6hGRk1Ti?=
 =?us-ascii?Q?Bl8obt9Fsyf58RWC3bbbhhQaxTyBtlE8V5HrxGklWAJNVsVbk7JO/akTxqJB?=
 =?us-ascii?Q?RXNNS0No7GvEg0FKn46H6MUmFKPpm0/ifklcW+QS7a5kt/MphKRN3D3N4k29?=
 =?us-ascii?Q?cbnyEoRaXOvL3jKY9JwmtFjtF0WkT0uwircGZXF3quEDVVK5Bjpe7nYcJc+e?=
 =?us-ascii?Q?rKJV5rDZPZBWqcMmPWLMODiNEa7VbyxbDesKFlyAqem4PUWxr0LdGh/0txQy?=
 =?us-ascii?Q?97qB13TuCPz/qqtOa81TlK8g9NVCGodhSvVyJ1B6ePzhMxbI7ubAsgzo2IID?=
 =?us-ascii?Q?HD5uieDvmZ80193TTtTw7N2DrSkVinhQ/pojX5Ki/kIzLBxRDPXaVtLcorvL?=
 =?us-ascii?Q?MCTQcxhE8GU4eFbHeqgdKOUvvP1sNR9IPwl+wdmJ57y50og1Tr2ECelBsU6F?=
 =?us-ascii?Q?tdykZPV6Btv5CHI7nO6Wq1GcXvBa3f5Z4y/57aFtvpKGigmtxuQAfmA3+DYz?=
X-MS-Exchange-AntiSpam-MessageData-1: sixtv3pmGfYjmw==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 811ba388-b67a-4479-6437-08dec6e14be2
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:13:27.6978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NdhH9f1Al5ZNQ+pzUOXQ4yUSH6p7UluxqFwprEG7LyeTuPMNG2xX1xlGOdwHCZgwzl4phoPPfdiyuJ5HNRt3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6556
X-purgate-ID: tlsNG-c1860d/1781090012-C407FDB1-DF26F861/0/0
X-purgate-type: clean
X-purgate-size: 6305
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
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:dkim,valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:from_mime];
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
X-Rspamd-Queue-Id: BC502668A09

Make CPU topology information available to the Xen scheduler.
Additionally, ensure that this topology information is displayed
when executing the 'xl info -n' command.

Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
---
 xen/arch/arm/include/asm/processor.h  |  4 ---
 xen/arch/arm/smpboot.c                | 10 ++++--
 xen/common/device-tree/cpu-topology.c | 51 +++++++++++++++++++++++++++
 xen/common/sched/credit2.c            |  3 ++
 xen/common/sysctl.c                   |  1 +
 xen/include/xen/cpu-topology.h        | 10 ++++++
 6 files changed, 72 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index a3753c317f..41fa73cfc4 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -613,10 +613,6 @@ void show_stack(const struct cpu_user_regs *regs);
 
 #define cpu_relax() barrier() /* Could yield? */
 
-/* All a bit UP for the moment */
-#define cpu_to_core(_cpu)   (0)
-#define cpu_to_socket(_cpu) (0)
-
 struct vcpu;
 void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
                            struct vcpu_guest_core_regs *regs);
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index c071f1494f..b25d98c109 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -91,13 +91,17 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
+#ifdef CONFIG_DT_CPU_TOPOLOGY
+    cpumask_copy(per_cpu(cpu_sibling_mask, cpu), &cpu_topology[cpu].thread_sibling);
+    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_topology[cpu].core_sibling);
+#else /* CONFIG_DT_CPU_TOPOLOGY */
     /*
-     * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
+     * If CONFIG_DT_CPU_TOPOLOGY is disabled, it is assumed that
+     * all CPUs reside in the same socket and that SMT is not used.
      */
     cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
     cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+#endif /* CONFIG_DT_CPU_TOPOLOGY */
 
     return 0;
 }
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
index bbdf0d1fe8..7b6c918139 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -325,6 +325,55 @@ int __init parse_dt_topology(void)
     return parse_socket(map);
 }
 
+static void __init setup_cpu_topology_ids(void)
+{
+    unsigned int cpu;
+    unsigned int next_core_id = 0U;
+    unsigned int next_cluster_id = 0U;
+    unsigned int next_socket_id = 0U;
+
+    for_each_possible_cpu( cpu )
+    {
+        unsigned int first_cpu;
+        struct cpu_topology *topo = &cpu_topology[cpu];
+
+        first_cpu = cpumask_first(&topo->thread_sibling);
+        if ( first_cpu == cpu )
+        {
+            topo->phys_core_id = next_core_id;
+            next_core_id++;
+        }
+        else
+        {
+            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
+        }
+
+        first_cpu = cpumask_first(&topo->cluster_sibling);
+        if ( first_cpu == cpu )
+        {
+            topo->phys_cluster_id = next_cluster_id;
+            next_cluster_id++;
+        }
+        else
+        {
+            topo->phys_cluster_id = cpu_topology[first_cpu].phys_cluster_id;
+        }
+
+        first_cpu = cpumask_first(&topo->core_sibling);
+        if ( first_cpu == cpu )
+        {
+            topo->phys_socket_id = next_socket_id;
+            next_socket_id++;
+        }
+        else
+        {
+            topo->phys_socket_id = cpu_topology[first_cpu].phys_socket_id;
+        }
+
+        topo->num_siblings = cpumask_weight(&topo->thread_sibling);
+    }
+}
+
 void __init dt_init_cpu_topology(void)
 {
     unsigned int cpu;
@@ -339,4 +388,6 @@ void __init dt_init_cpu_topology(void)
 
     for_each_possible_cpu( cpu )
         setup_siblings_masks(cpu);
+
+    setup_cpu_topology_ids();
 }
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 77475ee363..dcce1e361f 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -19,6 +19,7 @@
 #include <xen/softirq.h>
 #include <xen/time.h>
 #include <xen/trace.h>
+#include <xen/cpu-topology.h>
 
 #include <asm/div64.h>
 
@@ -37,6 +38,8 @@ static unsigned int cpu_nr_siblings(unsigned int cpu)
 {
 #ifdef CONFIG_X86
     return cpu_data[cpu].x86_num_siblings;
+#elif CONFIG_DT_CPU_TOPOLOGY
+    return cpu_topology[cpu].num_siblings;
 #else
     return 1;
 #endif
diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index 5207664252..81a68fe24c 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -28,6 +28,7 @@
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
 #include <xen/coverage.h>
+#include <xen/cpu-topology.h>
 
 long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
 {
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 1c03f4deaa..f268069449 100644
--- a/xen/include/xen/cpu-topology.h
+++ b/xen/include/xen/cpu-topology.h
@@ -10,6 +10,10 @@ struct cpu_topology {
     cpumask_t thread_sibling;
     cpumask_t core_sibling;
     cpumask_t cluster_sibling;
+    unsigned int phys_core_id;
+    unsigned int phys_cluster_id;
+    unsigned int phys_socket_id;
+    unsigned int num_siblings;
 };
 
 
@@ -19,11 +23,17 @@ extern struct cpu_topology *cpu_topology;
 void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node);
 void dt_init_cpu_topology(void);
 
+#define cpu_to_core(_cpu)   (cpu_topology[_cpu].phys_core_id)
+#define cpu_to_socket(_cpu)   (cpu_topology[_cpu].phys_socket_id)
+
 #elif CONFIG_DEVICE_TREE_PARSE
 
 static inline void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node *cpu_node) {}
 static inline void dt_init_cpu_topology(void) {}
 
+#define cpu_to_core(_cpu)   (0)
+#define cpu_to_socket(_cpu) (0)
+
 #endif /* CONFIG_DEVICE_TREE_PARSE */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


