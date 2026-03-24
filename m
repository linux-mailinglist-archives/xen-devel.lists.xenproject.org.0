Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNdeFfPVwmnmmgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC20331AB13
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 19:20:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1261273.1554400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MZ-0007aW-4s; Tue, 24 Mar 2026 18:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1261273.1554400; Tue, 24 Mar 2026 18:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w56MZ-0007YB-1P; Tue, 24 Mar 2026 18:20:23 +0000
Received: by outflank-mailman (input) for mailman id 1261273;
 Tue, 24 Mar 2026 18:20:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1w56MY-0007Ug-Bm
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 18:20:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w56MX-00DbE3-NJ
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 19:20:21 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5d4-e002-0a2a0a5209dd-0a2a450591ec-32
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:21 +0100
Received: from [52.101.52.42]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69c2d5e4-5aeb-0a2a45050019-3465342a35b3-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 19:20:21 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by CH4PR03MB7771.namprd03.prod.outlook.com (2603:10b6:610:237::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Tue, 24 Mar
 2026 18:20:19 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 18:20:19 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvvfCX02Ojw0TXPBVp9tsQdSRIcpjxSU4rAsysY4B3Sl07kbx0otmZ3PfUXfEoQOXR/edLq25oodwX7c0nKlp9LszymSrb+qU5xeiPEGjM5960xB67qGd+g2eD38BN2Whz6gzLUm55ZOFsPoLyuS0aNa8BXN4YHU8Wgk7gBK9fXd3jADGVbVTCS8mYw5kzzJZJJj7hUwfZR7vbtTppUzltRsJ+pDKDOFQckMHljsR3QXvuM76A5mjOHGL0+sB49Bq5y9TUNDViC33I5WzNKCE3xqbV0My9Wvhse4kUIRd76kvdEXDOrpK9yu7K0aIYt7cztYl6WTpckpw0CW454b5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uicoMoHs+Gl51hDkgrbL84Tv8MCml7k1ZtutNzfBkt0=;
 b=aSwUSocj+MIhWApdRnH3TM6Bw5dvhCdF2G6IjUry4L17rT7uMiFtBqMoGMv6gL6VIZ9uAGDLxZMcETrJ5ATWtFi4TFB9T9kHvAo/o9lpHcydVsw26xf3WhVfgqb8AOWkEP6AGDPRl5BD432RYM0d05YH3EADYOd0caNZrkS54TNVwmB5TCMw14bioVIbS7/bWVbJWWP0n63YuQZ2kb2ypsX6AFjIsJE90B0wgDKd/APcsR8YTESJzqHkYTcF8+sN9TNusTgPARG8sC7FcEaICNlRZMh+boU502+w2+X5yNLtn/tnmJP999pHmtRia2VN/wiSZeplDdJ80rJmwQWe5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uicoMoHs+Gl51hDkgrbL84Tv8MCml7k1ZtutNzfBkt0=;
 b=yGpZ9vDOQCPcoGGX3QLSZd3Nj/OoYCMDmpJU8zwu+7qLPVbVqXr7fpECtDpsk9Fbbu5Q5TtBmOXr5YPl87TtZuzJlmhOHBPQE/b+49HdeB3aaKJyFGX+lCL1emJo1YdXzbeuGsmM5DqTv4J8QN0dNHBLUgNh3+4jHAR7QPaxejE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 9/9] x86: Cleanup cr0.TS flag handling
Date: Tue, 24 Mar 2026 18:19:37 +0000
Message-ID: <20260324181937.2465574-10-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
References: <20260324181937.2465574-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0482.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::7) To DS0PR03MB8272.namprd03.prod.outlook.com
 (2603:10b6:8:28f::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|CH4PR03MB7771:EE_
X-MS-Office365-Filtering-Correlation-Id: ffecc672-2818-43f7-6bf0-08de89d1fbe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	/6l+hMQhzcsVvsMMqztYAgsQ1uw77qDwZ7Hh33cn7kyUfRzHj0L27SYTXCuG3yODVI1Q8nuE99LFcdvQ+fFB6bOTvjmHCRPce1ZVwmBcIIvLyTDYyBJZNB9YYkjm8zOW1Ri/jqch9wCOLiuBUEVWCd3QVXwSEcnBEv/7/NKQ4iqDr3ZqdhradziBEbAb2zkIxB5d75evmUWo/7K3g70ndFJ2MZSC+TRn3m5HbCDx0BesXyK494CMy4v1npw3YhddqEBfGYfsDhX7FQVOqfoco8/HyKiTFT4IB7ScjHNJ6UZBxLgvcTKFjjdy/Ma1R0KDleDQN/y5SL7SjvE/POLdgQVBGM1bcQjTGoCjN1H7EI0cOtD4RsUzhAyymonefsRnR+FYOGPRrR3KkWRUuUhU8DzhCcYH41JKzWUi/NnEJ4stt2GsZoANpOiDqqFhJ5jktptCQaI2Ckw6SdWLbetew+VF4M+AktrmzxR3YQrZwUHmfx1IEZMDWPoZbaB/sPVL1+XByQ8pZcScOslE3Ug/poKSBDXU6NHw8f54dpjYVasjynEvlZt3cOMQgY5RShGRczQeyhdb15hLT0lPwS6bSzDf/Gk2T1CPQHP6jLlXRT7wys10fPhtF2SUBwyQQDFFqvfTE+46mtir7i3BF1BO1fNgJ+kyxCJk878MIqqPaouzIjjg7GCGgqNSIPGjt2zK11G3RkU9pZc6faFJ+oLDgQQueZgVvnnvlmZl7OjWOWw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9AMemaz4RmmNbySDbeFfBATWC1vjznrpfjPW48At6aiOP0/tJxkjvugb/Iwe?=
 =?us-ascii?Q?56hPBL8sP25Ffsb9dQl89I0S54Gj4OlVC943yJJGXbfeFDlHjgqESkjRbfGv?=
 =?us-ascii?Q?BLZnY31dofdK9YiDMCi2YiOhU+6xRgQcgmXzgaJO9AN0tWn2pUJTdVCvFok/?=
 =?us-ascii?Q?gsm9MLvQmFtlxYpfoEGCccxqFR+Zw+78VGKHTDztGX5GhSAQJkliF7xXysM3?=
 =?us-ascii?Q?z8VbjLrylA43b1gHXS13VtIRJcIyZcqtZzhPC/fsc3O6AyECx3UODNhXb/rk?=
 =?us-ascii?Q?4O3d9vFIWRIjabp3gI68EHuBwAn3PFzNYLdflqvlpQoXE19E8ovHUwtPUV8Y?=
 =?us-ascii?Q?ab9yhbmTFOOQkyvdUa1Gpoys355M9Js4D5fU/AwhkQrMSk/u/U7gj8rBCBsi?=
 =?us-ascii?Q?jIJdAvmpeSy1lvFWJO0OuGz2GndRIcmHKUeyLf7OB3kcxAzFCOQufqbCiAtt?=
 =?us-ascii?Q?z/YnYkSWxJ7GUS0PykbjbYRy0Kt9PD7dowXsDdPq3q7D4jbsxkcTSWB1rgDR?=
 =?us-ascii?Q?QFitJuYETVbf9zrYYupyehivog+c6DQaQaShWXbPTO6N8VN368huDE82pMC7?=
 =?us-ascii?Q?PXYYK8gaZ5ekeI5K7dV8cE/VOZCEdVKCG2ZLYu1uRinUQaZ+9pZ15V0uW1Cr?=
 =?us-ascii?Q?NPGr6JqFGH86IOhXuqQz/rRzXz423HdEoaFfDjRoZaUhbwhSeC1RUfxEwA24?=
 =?us-ascii?Q?yicClYxJgG7KJC5XyjRe0+qWIa1WQ5+KECT3zBisty4rXgKjKMKU42UaijCW?=
 =?us-ascii?Q?vTlMEYy+k9PsVzCU4uqZ3sUYkcfLsnbo5CFGbY81/ekCPSt9EprDGFrldOVM?=
 =?us-ascii?Q?0JP/Pb/FdGyymB/btxKccyke9FdKKOqDqRiGSrk7bYw+baV4K+Qd8QeCuZAM?=
 =?us-ascii?Q?vsY2SysQIux4s5g3kvP1O9LrMhHXIlv6XRnNFkZYHu/j1ecNEKbY46SdTB3E?=
 =?us-ascii?Q?bVZjEmT5RVpM5Mkn1MMXa6r4/OHU4kL847FYO2pSAb/1O3UfFA7+cvVMs9sO?=
 =?us-ascii?Q?jatOuswRzbLV1ytaHbSVQjsR8b+ZTro4/FtE8hd3AMt1rupI+I7aXkTVMz+x?=
 =?us-ascii?Q?Jv6p50ajkhai8gZso/uwl372ac1SOBL3c9K4G4R0+M1nVBbY6eZy8s7HvgBN?=
 =?us-ascii?Q?a46Mv3IWC02KRavcz6cUDZzeGEdZVKP9ZdGaGR3XS5nAvaAKrdkf2/hRFzFv?=
 =?us-ascii?Q?BJIEP3sfsrM/GtruA1KWgmgWhXBK9mQ0J8Vpn2N/60uHFmSsexcXLI8nfe2i?=
 =?us-ascii?Q?Gs8NfbaGoIxiE3lFdzbSkIdnAaisNQUA2X87NWOzV77b2MEyqTyADHzb2hZ6?=
 =?us-ascii?Q?512eHZ/S+2A9NsHcwBp93DWLMQu2M9RrID2pgjso8QTvZIYVPwkmfM0HMz2k?=
 =?us-ascii?Q?9H9VPld1DTgBp2Z3x030yRuWp39MHxkOh2PQzr9RyMYxRCweyNwA482Ufiqr?=
 =?us-ascii?Q?8709j4RLjznOPvwLwVt3fSbLb3jaw/29B9bGaeWEspgU0rMWiQ88ATTwA5Po?=
 =?us-ascii?Q?8T7/IqsQ8h3yre0+ssmZPn1aTAqpoAXihK1HSKOcfI8uKzInrdQLRHYhSEfn?=
 =?us-ascii?Q?vsNDzS0f4v2/Ke6eX/OrvFyfr3T3GCEliVhs1Ir7Tbt8dHy9MaWoYnnwi1pG?=
 =?us-ascii?Q?lWIv7m4M02pHj8YyFmQmHzPtaztswVjMECgP18lFrR7So3K+iXwYGKp2IniA?=
 =?us-ascii?Q?GaTGvqe6vk54RDL4nz0DgZRBkftLjycFQXho6B/sNGzVegC9s3d3dQp5jCX6?=
 =?us-ascii?Q?61V99xA0r3EhqjHVu8GyqYvwxS1FOIM=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffecc672-2818-43f7-6bf0-08de89d1fbe0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR03MB8272.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 18:20:19.4613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eabTEZSijsvKce/IWG89zsPMQdR67WdKbsJHeNPmQY31xMIAlXT5bZpsDdw1ofnXzX7VYbkFkRseAoAXQSFTC4EoPcNnuXYUAITdPfqwHGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR03MB7771
X-purgate-ID: tlsNG-c201ff/1774376421-8215E488-4CF5DD21/0/0
X-purgate-type: clean
X-purgate-size: 5182
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:ross.lagerwall@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: DC20331AB13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Setting/clearing the cr0.TS bit is serializing and setting the cr0.TS
bit in particular requires a write to CR0 which is implemented in
microcode and is very slow. Therefore and with lazy FPU removed, avoid
setting/clearing the cr0.TS flag on context switch except when
saving/restoring the FPU for a PV guest.

After this, Xen's context switch code and idle CPUs run with the TS bit
cleared. An unfortunate side effect of this is that any mistaken use of
XMM registers or extended state will not trap and will therefore be more
difficult to detect.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
In v2:
* Add more justification to the commit message.
* Always call clts() in vcpu_save_fpu().

 xen/arch/x86/cpu/common.c       |  3 ---
 xen/arch/x86/hvm/emulate.c      | 14 ++------------
 xen/arch/x86/i387.c             | 19 +------------------
 xen/arch/x86/include/asm/i387.h |  1 -
 xen/common/efi/runtime.c        |  2 +-
 5 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 5ac76897ae47..057592b7c870 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -887,9 +887,6 @@ void cpu_init(void)
 	/* Install correct page table. */
 	write_ptbase(current);
 
-	/* Ensure FPU gets initialised for each domain. */
-	stts();
-
 	/* Reset debug registers: */
 	write_debugreg(0, 0);
 	write_debugreg(1, 0);
diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
index 48c7320360c7..f3aae158e9f8 100644
--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -2527,14 +2527,8 @@ static int cf_check hvmemul_get_fpu(
          * Latch current register state so that we can back out changes
          * if needed (namely when a memory write fails after register state
          * has already been updated).
-         * NB: We don't really need the "enable" part of the called function
-         * (->fpu_dirtied set implies CR0.TS clear), but the additional
-         * overhead should be low enough to not warrant introduction of yet
-         * another slightly different function. However, we need to undo the
-         * ->fpu_dirtied clearing the function does as well as the possible
-         * masking of all exceptions by FNSTENV.)
          */
-        save_fpu_enable();
+        vcpu_save_fpu(curr);
         if ( (fpu_ctxt->fcw & 0x3f) != 0x3f )
         {
             uint16_t fcw;
@@ -2572,12 +2566,8 @@ static void cf_check hvmemul_put_fpu(
          * Latch current register state so that we can replace FIP/FDP/FOP
          * (which have values resulting from our own invocation of the FPU
          * instruction during emulation).
-         * NB: See also the comment in hvmemul_get_fpu(); we don't need to
-         * set ->fpu_dirtied here as it is going to be cleared below, and
-         * we also don't need to reload FCW as we're forcing full state to
-         * be reloaded anyway.
          */
-        save_fpu_enable();
+        vcpu_save_fpu(curr);
 
         if ( boot_cpu_has(X86_FEATURE_FDP_EXCP_ONLY) &&
              !(fpu_ctxt->fsw & ~fpu_ctxt->fcw & 0x003f) )
diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 9acaaf4673df..c6796bc97b70 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -176,9 +176,6 @@ void vcpu_restore_fpu(struct vcpu *v)
 {
     ASSERT(!is_idle_vcpu(v));
 
-    /* Avoid recursion */
-    clts();
-
     if ( cpu_has_xsave )
         fpu_xrstor(v, XSTATE_ALL);
     else
@@ -193,7 +190,7 @@ void vcpu_restore_fpu(struct vcpu *v)
  * On each context switch, save the necessary FPU info of VCPU being switch 
  * out. It dispatches saving operation based on CPU's capability.
  */
-static bool _vcpu_save_fpu(struct vcpu *v)
+void vcpu_save_fpu(struct vcpu *v)
 {
     ASSERT(!is_idle_vcpu(v));
 
@@ -204,20 +201,6 @@ static bool _vcpu_save_fpu(struct vcpu *v)
         fpu_xsave(v);
     else
         fpu_fxsave(v);
-
-    return true;
-}
-
-void vcpu_save_fpu(struct vcpu *v)
-{
-    _vcpu_save_fpu(v);
-    stts();
-}
-
-void save_fpu_enable(void)
-{
-    if ( !_vcpu_save_fpu(current) )
-        clts();
 }
 
 /* Initialize FPU's context save area */
diff --git a/xen/arch/x86/include/asm/i387.h b/xen/arch/x86/include/asm/i387.h
index fe5e4419b6f4..0717005d31f0 100644
--- a/xen/arch/x86/include/asm/i387.h
+++ b/xen/arch/x86/include/asm/i387.h
@@ -29,7 +29,6 @@ struct ix87_env {
 
 void vcpu_restore_fpu(struct vcpu *v);
 void vcpu_save_fpu(struct vcpu *v);
-void save_fpu_enable(void);
 int vcpu_init_fpu(struct vcpu *v);
 void vcpu_destroy_fpu(struct vcpu *v);
 
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 982e42e8f341..0f1cc765ec5e 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -94,7 +94,7 @@ struct efi_rs_state efi_rs_enter(void)
         return state;
 
     state.cr3 = read_cr3();
-    save_fpu_enable();
+    vcpu_save_fpu(current);
     asm volatile ( "fnclex; fldcw %0" :: "m" (fcw) );
     asm volatile ( "ldmxcsr %0" :: "m" (mxcsr) );
 
-- 
2.53.0


