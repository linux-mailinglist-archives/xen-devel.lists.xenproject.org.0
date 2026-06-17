Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7g5FOwlJMmp6yAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:13:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83224697146
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:13:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=valinux.co.jp header.s=selector1 header.b=RHg7kl3s;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=valinux.co.jp;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1339817.1600903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkRi-00029m-9M; Wed, 17 Jun 2026 07:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339817.1600903; Wed, 17 Jun 2026 07:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkRi-00022V-5H; Wed, 17 Jun 2026 07:12:22 +0000
Received: by outflank-mailman (input) for mailman id 1339817;
 Wed, 17 Jun 2026 07:12:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wZkRg-0001un-Pm
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 07:12:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZkRg-00CS1m-6e
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:12:20 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3248ce-5cb7-0a2a0a5109dd-0a2a4507bf88-22
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:12:19 +0200
Received: from [52.101.125.100]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a3248cd-229c-0a2a45070019-34657d648175-5
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:12:19 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OSCP286MB5166.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:34e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 07:12:14 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0139.009; Wed, 17 Jun 2026
 07:12:14 +0000
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
 b=DnzZCOrCcBq0+IO+YTqmeGEQyK6Fshh6s4g7x5+3hsYjNi3Mw8phT1kGRlNRY9FrWeEdTIT7CdJWmpGkn7M7tKaqMwGQTif/lqpyxrM1ZTNsnwqFAThTZhCjMY1CznC3mUUBiCzWrggA2UGYmVET0e/Oy4SgdegwDbQk60qOU+p0SQs7nB4fp68uNeOBpQX6pvG0H8TrLZ7B2RFdPWwPKCZ/hAD4cJWD7OORWOq6/6FmeZ47Sq/Xu8bsBHVXZMlRDJ/6iw5tV+X2uBrOKBqqPRH1bKMqBmtzk3dSPqQiQadFOeVpH+065qEMNcJJtwUwAiJkWBAZt3rW7P9NKSzNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nh46NLdxeEeIQno5OW3KrzlC799wkphwGxCHu+nSAvI=;
 b=YCZuilwtPuQ+ljdHNjjMe/q3ukWq4K1Da2okVQC6HMvX3cSUbDX9MhioIVygOwleeeL/W+9esgA7wNl1Gf53kY2mbPUDGIg1+Z1gJmon88uoR3q9bXOvW2b0I7/DhTLCK8NJunsKPBt8C2IxHipp7gAXk4gXEmKInsYXMMnu5KR97Jeif1qhpGDDW71mWff6NBG+6dEzEZGjDy0DhWRW8D5nURDF20beD+ZMtormUtmjoaliIhjzljmEcMLlpFJlFcOF33GqwTzbJ1qPDs59KUQmvFWoNmHtUSXhqp/JcTb/UeBb0UP7CzhC+0iS5ibspwkDBucEaw1wvjrNKMjzPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nh46NLdxeEeIQno5OW3KrzlC799wkphwGxCHu+nSAvI=;
 b=RHg7kl3srRsBmbSGPGPvEGEmvLdJw/YVMsmGCS8kR3kX/OAGOIGhjvieEIVFfSUx3tX/edr2x/xe/XVZD6usFLipkp+SRC3+HNAlhnPguHN3kls8uDYuuDy+9xyjQbSKHqSu/2HE5SKW9WvEAxZZ2oLrG6TlmHadMH3OFrgVKf8=
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
Subject: [PATCH v2 2/3] xen/sched: Link CPU topology to scheduler
Date: Wed, 17 Jun 2026 16:12:05 +0900
Message-ID: <20260617071206.265599-3-taka@valinux.co.jp>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617071206.265599-1-taka@valinux.co.jp>
References: <20260617071206.265599-1-taka@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b7::16) To OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:458::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9P286MB7222:EE_|OSCP286MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: 30da6583-b44f-4a05-f981-08decc3fc1fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|10070799003|7416014|376014|22082099003|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	lv608YHyvvYoxc6BQrEXsiv9qZb1f0Jr0fLAtrkUJ6Ect0jJbvfWOVQwyVc0GIqGwLhzP6N2I40kTxVcuRwuna9e0OOM8lvOZGBmiW+BHfIWcWheAP2eCNO6w3Pr4VnamlTRt9rpv2AXhtBL/F1/nLoilhBSHC5WXO11B5Oxltb/G8b0cfDi7NmcieSQ+iik4VNlVjQgW5vIWIRLeierGsl8HxtERTR7WSP/MA/6/0jaNlqa6VxyQHEB/rgfJ8kJZOEx1a4OgnEPcTlxjpG8abe3Os4+YGS/2DuIzcYY4d1mJNDfl/x9StZHQSphPDNYkuWRauyCCqBAWNEqojJ1Wu1L0p6E9gwhRaA7xBoLgtmasavPX7t1EHUxASPfbaJX1n2suXuXKaSPQs6J+/35c58gtGC+huQHIEOU9S2zMgT4DaP0uCItDOhjNZfPjaqY831hsHHPxgaNYxux46fHI2/vLE0pHmUcLUppxmfTsRdYJfLBYVWy9e3SugCrCrUVDk+GlpLcK9NtcdaFJUb/wPn58a9noGwSldZkuQU76FUN3satKcf+KJireQJk/kSQ/w4czPcIAMBch8NjXEh6FUrOdiYMBrc3cBl1E5UyRzr0f0EIm6pnTE08IFBC+8u3FIKzNQIlIlaVXK58fPQng1yXxVMAK92FxGJa9zf0jeyyOi8T/U73yCCC97njJ9mj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(10070799003)(7416014)(376014)(22082099003)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sh3+M39Om+KUiTvsMQ3ercYX04+6UsResZGerIZ4fUXaDtHzETD6wyrdHMbc?=
 =?us-ascii?Q?qdTgaUDCBxUBqx7dXXIJTxfHkxKkl8UuxAqkXdIweTDrbBhjoLkGXaH5A1CQ?=
 =?us-ascii?Q?JB8/IBZxk7ZOlF8bniU5miiXroz92uapd/GGhyqtpwF91z1jBKD8qWSvn4fq?=
 =?us-ascii?Q?qwII/UtnNuPZLD79GxrSEO9wQPfClJhT2pvFcpynKJmX0dXlobje7lKuHsyB?=
 =?us-ascii?Q?RRpoNYYIZZS4341dA85orLoFxrtHn9tbVKnxQqKd5bIPgYXwoYRUyJd7XY/U?=
 =?us-ascii?Q?KXCsRvHwn+WVGhmC7Z6pVIT6om2jt0cc3uf4p7ONiNPw1QRzkkV1yX+tnszL?=
 =?us-ascii?Q?VkadcOI44hlLFk/raZFQpgLBjOhdq3JX5IzUwc8KFQNyRlWka9f1yH5/24yl?=
 =?us-ascii?Q?anY3KX3SdwA+UGja8sh28TuFzPl/v532agpgAHIgmloR2lTtIc2T6cHtHVD/?=
 =?us-ascii?Q?5koZpo2UQrSr+Xvj6kGhMF90q6QN7jrzJOlKPq7l0Lk9VY7wIQh8jFlZd2zI?=
 =?us-ascii?Q?hYL109DMe4PVmLIUbVbZXWp8Sl52vETMf5zzL/kFy40Qrcw7ioG0aYP9vN7X?=
 =?us-ascii?Q?AX5MJxbjyAthjDipI9hk2NfVQm/nFqPncefHazDMowKHWUIdAWGD0DmMPbit?=
 =?us-ascii?Q?zK3UTtEcfoDXSX60RJDYqIAPnMz0O320KmuY7hc/4cRnEC1X3fcH29WfVNky?=
 =?us-ascii?Q?iTGhEXPIOzig1wiHeS0EH9myLrHFHaErmM8SHdKQSE2JGCtzkKoSsQmgxFJ0?=
 =?us-ascii?Q?TS3Phpw7zOX4wJU1PCoVUYpc09IL7CzO1RpiMdtMlXj7A0W8p6EUeW0zQ44E?=
 =?us-ascii?Q?5mGR4kD4bgNCXOmpuT+cllXlgoibxYF2cGb79G1od3Ntr+u41u37FMUKt/bH?=
 =?us-ascii?Q?sKqAepTMLI525sfiIAPTkZ0vNfRZzfGAtI/qK2Nh9G4vQn0fA30z+OvRpaQF?=
 =?us-ascii?Q?+sziKo+swUmHD2tFf00WwtYP6Z6AmBgzzLZOO4Xl30aRHrrH3Uzoo/tFvrEv?=
 =?us-ascii?Q?Pxd6yuZRcuuREieftr2OLZaFvaGVqEBZEAZkRrkWADv3SIiek3/p5xnlK3np?=
 =?us-ascii?Q?1JWOlj69ETotuuuIxvyWL/he6YGy681x7fuXTjA9EOaUiSbOD+NbBSPwGMwk?=
 =?us-ascii?Q?uHFQQ1Yz9bGcpl2LBhmVS//bK5SqWbKIR+rEp+TRmDXivDff9jNtBjKKP0mv?=
 =?us-ascii?Q?IgVxzf5fTVLzLGugaaim1wttcSke4yWepF94Xe1GuSB4BzEmdcK8NTICzQ+G?=
 =?us-ascii?Q?plgML6/F44d8tvhWSWvLzse5kowmcQci7Ko/d92XzubzUmbRZGAMkksY88dZ?=
 =?us-ascii?Q?M7VZp0+51QP6VWEnhN8l79fTL4qP0XoLl+S8GLGJgP+e+cUGOAGP6aAr8WM9?=
 =?us-ascii?Q?Feb05VgV5pVSRFwv5eQa+7sG2RI495N66s6NXVC0zHXDgMARkwFbBMO30l/x?=
 =?us-ascii?Q?jQVStEBN2R2VFftfYSGifTUW1tLlJC85QGoPansKB/q55qQnVtbH7N87juDq?=
 =?us-ascii?Q?kWL6+r9b+q57zofx6p6Wm3ob1355YNPjjYhiK6ktmzD86Rr9kvVAeDPYX7P5?=
 =?us-ascii?Q?22hmpvAI0VYTbOSwV+5ecJ9oLVT20P4GHW+16HzgBUme/vfAQoitjQU9gJL1?=
 =?us-ascii?Q?bJhAcJvxlX8toX+fNbYi2ENQ6LCr4gqoMEbBQAtmN18Qq04y9s1AOBqko3dc?=
 =?us-ascii?Q?BcGDyyx8RQS7TlhPQ4dQup8H7F8I3+dqne/uvoNXEmfTDjS4sv+/TuQaEqzX?=
 =?us-ascii?Q?aVhfW/8TMWLJs3JW9z2MXt/2HHFosCDgd7UQ4jdseBf+489ONUoBbyuEq7y0?=
X-MS-Exchange-AntiSpam-MessageData-1: phrGcVrkL7C0mA==
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 30da6583-b44f-4a05-f981-08decc3fc1fc
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 07:12:14.3667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YWd0IB9ri/J1sxlkD9zBKeMbwUENfriXRTOiJL+DWagCN5jIJnvTe4HYKkDtjdhQvhzX6SX9qVG2fInVpZLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB5166
X-purgate-ID: tlsNG-ef75cf/1781680339-21165C48-AAB49A88/0/0
X-purgate-type: clean
X-purgate-size: 6884
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Mykyta_Poturai@epam.com,m:taka@valinux.co.jp,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taka@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 83224697146

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
 xen/drivers/acpi/topology.c           |  3 ++
 xen/include/xen/cpu-topology.h        | 10 ++++++
 7 files changed, 75 insertions(+), 7 deletions(-)

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
index fb2cf26424..4a3f1149f6 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -91,13 +91,17 @@ static int setup_cpu_sibling_map(int cpu)
          !zalloc_cpumask_var(&per_cpu(cpu_core_mask, cpu)) )
         return -ENOMEM;
 
+#ifdef CONFIG_CPU_TOPOLOGY
+    cpumask_copy(per_cpu(cpu_sibling_mask, cpu), &cpu_topology[cpu].thread_sibling);
+    cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_topology[cpu].core_sibling);
+#else /* CONFIG_CPU_TOPOLOGY */
     /*
-     * Currently we assume there is no multithread and NUMA, so
-     * a CPU is a sibling with itself, and the all possible CPUs
-     * are supposed to belong to the same socket (NUMA node).
+     * If CONFIG_CPU_TOPOLOGY is disabled, it is assumed that
+     * all CPUs reside in the same socket and that SMT is not used.
      */
     cpumask_set_cpu(cpu, per_cpu(cpu_sibling_mask, cpu));
     cpumask_copy(per_cpu(cpu_core_mask, cpu), &cpu_possible_map);
+#endif /* CONFIG_CPU_TOPOLOGY */
 
     return 0;
 }
diff --git a/xen/common/device-tree/cpu-topology.c b/xen/common/device-tree/cpu-topology.c
index af8417b478..39c11ad5c6 100644
--- a/xen/common/device-tree/cpu-topology.c
+++ b/xen/common/device-tree/cpu-topology.c
@@ -319,6 +319,55 @@ int __init parse_dt_topology(void)
     return parse_socket(map);
 }
 
+static void __init setup_cpu_topology_ids(void)
+{
+    unsigned int cpu;
+    unsigned int next_core_id = 0U;
+    unsigned int next_cluster_id = 0U;
+    unsigned int next_socket_id = 0U;
+
+    for_each_possible_cpu(cpu)
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
+            topo->phys_core_id = cpu_topology[first_cpu].phys_core_id;
+
+        /* Reuse the calculated core id if clustering is not supported */
+        if ( cpumask_empty(&topo->cluster_sibling) )
+            topo->phys_cluster_id = topo->phys_core_id;
+        else
+        {
+            first_cpu = cpumask_first(&topo->cluster_sibling);
+            if ( first_cpu == cpu )
+            {
+                topo->phys_cluster_id = next_cluster_id;
+                next_cluster_id++;
+            }
+            else
+                topo->phys_cluster_id = cpu_topology[first_cpu].phys_cluster_id;
+        }
+
+        first_cpu = cpumask_first(&topo->core_sibling);
+        if ( first_cpu == cpu )
+        {
+            topo->phys_socket_id = next_socket_id;
+            next_socket_id++;
+        }
+        else
+            topo->phys_socket_id = cpu_topology[first_cpu].phys_socket_id;
+
+        topo->num_siblings = cpumask_weight(&topo->thread_sibling);
+    }
+}
+
 void __init dt_init_cpu_topology(void)
 {
     unsigned int cpu;
@@ -330,6 +379,8 @@ void __init dt_init_cpu_topology(void)
 
     for_each_possible_cpu(cpu)
         setup_siblings_masks(cpu);
+
+    setup_cpu_topology_ids();
 }
 
 /*
diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 77475ee363..cd8b7212bc 100644
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
+#elif defined(CONFIG_CPU_TOPOLOGY)
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
diff --git a/xen/drivers/acpi/topology.c b/xen/drivers/acpi/topology.c
index 7a7042c84e..301ee0dafa 100644
--- a/xen/drivers/acpi/topology.c
+++ b/xen/drivers/acpi/topology.c
@@ -22,6 +22,9 @@ void __init acpi_init_cpu_topology(void)
     {
         struct cpu_topology *topo = &cpu_topology[cpu];
 
+        topo->phys_core_id = cpu;
+        topo->num_siblings = 1U;
+
         cpumask_set_cpu(cpu, &topo->thread_sibling);
         cpumask_copy(&topo->core_sibling, &cpu_possible_map);
     }
diff --git a/xen/include/xen/cpu-topology.h b/xen/include/xen/cpu-topology.h
index 896eefb04f..3fdbc25e8e 100644
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
 
 
@@ -18,10 +22,16 @@ struct cpu_topology {
 extern struct cpu_topology *cpu_topology;
 void init_cpu_topology(void);
 
+#define cpu_to_core(cpu)   (cpu_topology[cpu].phys_core_id)
+#define cpu_to_socket(cpu)   (cpu_topology[cpu].phys_socket_id)
+
 #else /* CONFIG_CPU_TOPOLOGY */
 
 static inline void init_cpu_topology(void) {}
 
+#define cpu_to_core(cpu)   (0U)
+#define cpu_to_socket(cpu) (0U)
+
 #endif /* CONFIG_CPU_TOPOLOGY */
 
 #endif /* XEN_CPU_TOPOLOGY_H */
-- 
2.43.0


