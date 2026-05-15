Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fE3PM2OcBmpSlQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A5E5491D5
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 06:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309344.1580412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqk-0002jR-FX; Fri, 15 May 2026 04:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309344.1580412; Fri, 15 May 2026 04:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNjqk-0002gK-1H; Fri, 15 May 2026 04:08:34 +0000
Received: by outflank-mailman (input) for mailman id 1309344;
 Fri, 15 May 2026 04:08:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <den@valinux.co.jp>) id 1wNjqh-00021K-E3
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 04:08:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNjqg-00Bu3E-Qp
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 06:08:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c0b-5cb7-0a2a0a5109dd-0a2a45038516-48
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:30 +0200
Received: from [52.101.228.127]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <den@valinux.co.jp>)
 id 6a069c3b-672d-0a2a45030019-3465e47fdc14-4
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 06:08:30 +0200
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB5257.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:163::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Fri, 15 May
 2026 04:08:25 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9846.025; Fri, 15 May 2026
 04:08:25 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M+j7WgkLsNNsUQog+JY3HCqRFlPzGEoa0WezZYwDI6uxBVtvu6Fv8K3mrmtZlPSLJ6DPGW9WE74Aq6kRK50IRYU+J0AEy6EOTZBb+KkZpb++g0IzPqEPaJlJ9x+3YxLuW4ptW/KbdwDRgld7nVr743fYeH+XfpWVgq0Deo3O0ehtIyySu0HR0cn8hnXN3K4iWtix0eEWtL3+9QOYqQUjcLU7SQbvlz9lp5sgqzb/lUVN6tqaQEGRRHRfdQJdDKzHzM9mMAEGuC6ZM5L9iNp+Rd4+/iVDPKyCHChcKWY2txrGB9qzS2aHC/FJyswBLAANmVqoXOk2zokaLhT8mcJtAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clH4lYO5wbmlpaQIs7uoidyKQIOc+adymnvGpmXm3os=;
 b=kpNicKWiRaUN7GCt9/Qtc8hUoe/br8BZjYpAasP6RzteiVd3vGVUKwquvGgVUbejdf457t5CJVFZyI/jbr7oa4i8TsL16MauDQXHmw17lk7HrW3Zccv1/JyIPDXFT8krc5nfihlpzGpJb58Q7JI82eV/ZJC7+CfLV+/0Kq4UbuFGooQmzufrh6GWIr21ZEe2K2a05UMALGn3a4MOwUzaY3J9yiSEpRQOdeM7Ff6ERfrnpii1F3a0r346Xc73+NjYU6sJ/88CwHK5d8aQABBDcUOijOGRH9EpHXzsA9kBr/X2DQ9x89LRKhIzgkZmJ/d8IIr/PFzI+n2bdbf7+tW8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clH4lYO5wbmlpaQIs7uoidyKQIOc+adymnvGpmXm3os=;
 b=s5HAR+Knp/HCSk99ksrP5vJ0+5Vx7AiudST8fzgcr4WrCpoytbJt+pn8qJC9XOa8I5CegLnO0FCAJBfy4MOPPz+iErxVRewtXTLmQyQKUCt4hKXtGmqNucDjiLA6h4PcZwFPKrwdZU5d8C7muFY1lg5MUeqT0R8cx+TjBsgyiCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
From: Koichiro Den <den@valinux.co.jp>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Juergen Gross <jgross@suse.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH v1 09/26] xen/arm: vpl011: expose VPL011 presence to Arm code
Date: Fri, 15 May 2026 13:07:55 +0900
Message-ID: <20260515040812.983626-10-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260515040812.983626-1-den@valinux.co.jp>
References: <20260515040812.983626-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB5257:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d76a1a3-5e66-4a7c-3e44-08deb2379ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9lTVlJNHahq+ojBEUkiP3eixCr08Kjxvnalzg4IOzf1laArrd1tL14LA3YCW53V6SoPwDIzUrEudAUa4NGPDJDRdQtb/d3id8qRp9dGCTGgMbe/YU7Xi5o9saVs/1NzRktdvgLwWjC9sKN1lJz32cPJbbh4syU2gU4xVLKjx+9NgfByWaMA4czCyqQ6JNy1WCFllbDbtCGtueoLQi6KXap8bsNlifxPXVm4KFfHsit/6URsgU1VL9kcI58HULKOe9/DDs45SnBNwVfAWTw4+j3b6BVY/97RxE//XBiolCJv1XCv+Kh4Y5qNmG935FrXmCgL7D/a10vm1nqKiBrtVqDABLKpBjt7kaWZEhHS83kfX1BxCGB50XIOFMQG+YGX5rkWfoBcpLEmDNHSMc3MLvcG80ft+gsbjwyoLKlU+dq0uaZfWj8J54Pq156ngIqUERILwQkRNZyswk238xUuhRo6tRT7jLNcL/x2XuByPs8ceCgqGuqMRSsBxSrQYTU0qzCygeHC+Sdm/lmPcG+c4ojyzpaclgVtcf+4OksOcfUqQE/9g6Fxwp5bLHIMwmrkAv2sirD6etH0iWM3Sk9uMUCK0sn18LJ/Efb7yqaPMTGHQOJyKaNBxU7+go+8pKlJAX9ft7ZIDgwpblVIwmc+LQjGC4LhXnGUs1K9gmZb7gYiSyHFOn6kyJV8U6c7JBhRX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XANYrq7gGKUITOc/HNJVNsBIsAoslnE/vpY4+byTyV2+4dgqIQA11sotrQuA?=
 =?us-ascii?Q?99tO56SISUBbzE6ldT5irUWMsgOqNJYXGlYB4ydwxomgLjlGia4sPBAJ4vST?=
 =?us-ascii?Q?gp4mWN19gnR9uo4Wmjh4XE5XB2/0POd5vAPG81P2aDsBTjrPygdMfdsRTPg/?=
 =?us-ascii?Q?lIy8q97haZ5qQxXJctaY52REuvgRKiiBFPxDa0fi8JyWJkmkpBZYzWYrcPDe?=
 =?us-ascii?Q?yEtPaUkEj98lKjpg8rqfxwtR8M2ZITgp5hocYXLN6D+DMZo6V7UoV7wSPJis?=
 =?us-ascii?Q?x/GAaP5FF/5BIYgqFLY/6jnvAh6NrnhQYeZ4pG6ZtDhg1Rd3MgYZhQyVtOGW?=
 =?us-ascii?Q?C0Z/5FmoxHnrUc12INU727cH6HRurFUPuvTZ+TitMpdW9eJm/tzwXv423CkK?=
 =?us-ascii?Q?8NxeK3vhUzyYuPwxRzvSsvaRJv89nc44nns2uoVQjDF+c4menWs49IqyPTkk?=
 =?us-ascii?Q?wZQRDUp4rgYfyOQ38rcweWqWz/cpKEnLqRr337boIDK1c/JL940Ct+kqASDl?=
 =?us-ascii?Q?RZ2do0E/caGIHz4Gpv3Kc95p/klevpYpm0QRwvGAqdbLD/Kjni33leg8Lv/v?=
 =?us-ascii?Q?vjYak8dCPs0PjVxme9VL5lOuECcXt80cdCwHG+rnSco/iMEsNiwXYpcB1AMO?=
 =?us-ascii?Q?a12ryuSgzo1v9ls2eaQef0EjzcBSUPkoG4J80B6jGp+BB/of+tfhPynx9I8M?=
 =?us-ascii?Q?54EhtohzDpIBAMLYSOh457oKL39Mnsn1BUzaeXg2EvisoGFVnXVOCAKREenz?=
 =?us-ascii?Q?pYFw9Rwi9agiQhPzdJ8gGgMyZj98MB+2ezyb5WJj/WNNJFHTWTJd7v8WdJfP?=
 =?us-ascii?Q?oU+mosPCbpGBFJGaZ1QMZTpMiZ5ER5DbtLyd0fI1235f0tvcOWMMj11eHlNs?=
 =?us-ascii?Q?r+8LKAZtYDIMr3qWhXCHJ/NwhcHg3gk8GgMt5LjHqIlqVmgPY3KJVYmeL9+L?=
 =?us-ascii?Q?IcGhC9fAcqm+LDHetrOOuXDeSKOJC4x79FsDRiRPBP7Gb6E7GS3aW843o8Ye?=
 =?us-ascii?Q?PV7nIJBY9pOTHPer/IrOh/Q+BujJEqq82+VwYu5b5FpqGN5nxueJfp7fusHs?=
 =?us-ascii?Q?u8frhcr1xJFNiT7GGy+MdTMQyrcTUeiFQh6WXO5BSfGB+gCH+avT8oc8YrDO?=
 =?us-ascii?Q?4YmaITjilUs830xfiod9MjH6wc5w784QXGFnJ6ECeQEncyjhFWnKw4lPC834?=
 =?us-ascii?Q?JLSh1jrSJvWSnQDD4aQORV/QMajbKBB0FczGS32yUDP0xBUgv0NceXc95yBK?=
 =?us-ascii?Q?DfiA/JSVecZs6pIC80y/4Jpd8LuCFhCjJ3Hx2mUNrn1qdkllTavC+AOgBbPk?=
 =?us-ascii?Q?3LyPJTqs1fQRJnTAHaTrzbrTzVZSuiS0/8KRpnOdv71PY/xJXegvB1df+ud2?=
 =?us-ascii?Q?Mt7xgLSAAWDKlDceca+VdWFaWNJMjFsKWPWUvn6NAQd5sJH0io1MNV7C5xcS?=
 =?us-ascii?Q?2JibveHLfaADE/zv0/oYqJVCFU99kY0LIrHL5HvyGriF5QWTzYHIQQtaUX2L?=
 =?us-ascii?Q?MgawV8ZO5oqkUwJpVu7G98LACkUE4QfW3XY6lrscLblbkfmbh6gz7XKc1r8I?=
 =?us-ascii?Q?X59b9Md6xAvPBm8QJB2LNNepkob/heAq7PLqByLko+jW2zKy565ixZHwKtK/?=
 =?us-ascii?Q?g2pG/37KK9wr1ig5NE3vJiYkeZHbeAO5Jb3c+Mh3SUB5TTANMlinaMui2hkS?=
 =?us-ascii?Q?6j8/dSpbKLe2cC1fLmAiNaZtlPhCdx2tK4LvK958r1JuO9cjx+G07L80G/Ht?=
 =?us-ascii?Q?lMB5Onw246/KFWJce6PDGV1uL75ia3zciBHvOSdXH2rchAsejuDd?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d76a1a3-5e66-4a7c-3e44-08deb2379ca9
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 04:08:25.5007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DG9lhykioq/Uui1z0n+ZeTJOlofgVw6SqCpAzVa4TgaBGtiadIWLrWLLBeV7CKq4uUQiT46v+y8a4aKrba2dmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB5257
X-purgate-ID: tlsNG-33051d/1778818110-38149938-DEAAF145/0/0
X-purgate-type: clean
X-purgate-size: 1612
X-Rspamd-Queue-Id: 86A5E5491D5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.32 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:jgross@suse.com,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:mid,valinux.co.jp:dkim];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Let Arm code ask whether a domain has an SBSA VUART. Realm validation
uses this to keep the clear-text debug console behind a Kconfig choice.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 xen/arch/arm/include/asm/vpl011.h | 5 +++++
 xen/arch/arm/vpl011.c             | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
index cc838682815c..35d08556785a 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -69,6 +69,7 @@ struct vpl011_init_info {
 int domain_vpl011_init(struct domain *d,
                        struct vpl011_init_info *info);
 void domain_vpl011_deinit(struct domain *d);
+bool domain_has_vpl011(const struct domain *d);
 int vpl011_rx_char_xen(struct domain *d, char c);
 #else
 static inline int domain_vpl011_init(struct domain *d,
@@ -78,6 +79,10 @@ static inline int domain_vpl011_init(struct domain *d,
 }
 
 static inline void domain_vpl011_deinit(struct domain *d) { }
+static inline bool domain_has_vpl011(const struct domain *d)
+{
+    return false;
+}
 #endif
 #endif  /* _VPL011_H_ */
 
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index d0d17c76b72c..05a03a5ce5d0 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -747,6 +747,11 @@ out:
     return rc;
 }
 
+bool domain_has_vpl011(const struct domain *d)
+{
+    return d->arch.vpl011.backend.dom.ring_buf != NULL;
+}
+
 void domain_vpl011_deinit(struct domain *d)
 {
     struct vpl011 *vpl011 = &d->arch.vpl011;
-- 
2.51.0


