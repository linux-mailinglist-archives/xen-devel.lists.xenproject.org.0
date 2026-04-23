Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6H9EDcFE6mkhxgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:11:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB22454B6A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2026 18:11:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1292396.1570864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFweJ-0008PU-4C; Thu, 23 Apr 2026 16:11:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1292396.1570864; Thu, 23 Apr 2026 16:11:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFweJ-0008MS-10; Thu, 23 Apr 2026 16:11:31 +0000
Received: by outflank-mailman (input) for mailman id 1292396;
 Thu, 23 Apr 2026 16:11:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wFweH-0008MM-PD
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 16:11:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFweG-004ti3-Rc
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2026 18:11:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69ea44a7-5cb7-0a2a0a5109dd-0a2a450bc060-20
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:28 +0200
Received: from [52.101.201.26]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69ea44ae-212f-0a2a450b0019-3465c91a55e2-3
 for <xen-devel@lists.xenproject.org>; Thu, 23 Apr 2026 18:11:28 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by BN8PR03MB4963.namprd03.prod.outlook.com (2603:10b6:408:7e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Thu, 23 Apr
 2026 16:11:24 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 16:11:24 +0000
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
 b=yiPNgPXsaxttcqqTGax4Kf4TllOanvVWEK1oNmD0dXCGHVEzWQN51hYnd5Inn12Im+kdFL6Smj9cvdSJ2LH2Z46o/vjxcBycTWNm0e4nOloaSkG8YCYpSirVm9xhZMgMQRe9supamOWhp5yXxD3G+nBm9uKGxk2VU2aj/xSkoeBU9bkJ31TRjsHTgyRxU/o3XrMUHlH6q6HMF9gLRibU0myhu2cPPlWm8TyNiijwgBG0H9Fti92iyJPVGhPNZW85Me/H7R7T5APVkUbgK77ej+ydznF+kLxKL/waQe8Q0RSR7+z7rY/J/3m35ZNxOiIvGBut6bwHDChmNqFjgt10Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z2v5tmIHhBOrrj6BIBeW9FFmoLBnaS91AVXvGPW16lk=;
 b=p9dy5m0n7+P1bF4/VaYqeijuAJCAColhHFrXjKeyzUxk/NnOCqbAIyBfGiA9VAOJPDdRhsM5u6KeyPrCg7KjIjJcQ55G/swSQIHgLfKLv4b2oa2s58V7+NHNwH6z7NiZHGr8gJ1rBtSKq8OmtrHP2G0iFK3IWWi8FItLmcj65pDhp8C/xu+2iql7AcUfXa/EVT2808DeEz07KUNpH6VJgCBEBevbj8pXKf4rz0yj1utWNHizwpKATNAH8xtNVQYf4F+O6h5wyEPwCghCrWX1f/Rhi1aYTqiF7ptC74RRxMDevYNsW5hI4VOPxg4uAGP1PwEmelplvUrcOCc4Y4DJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z2v5tmIHhBOrrj6BIBeW9FFmoLBnaS91AVXvGPW16lk=;
 b=gf0ezdXwK1lXxn7fJ0htKxNytLpInNVB7akePsatvU2KwnpmuF/K9MGJua3VLZkPzckn1U+fzF9pDIMkDOngqTjJcNjUlTODScKFzbN/rp/ADgjSQqTo8x3BvpVWnLMWo6brfthShUMNSmB8Oaot3uSM6B3WHg5EiMtqsScSFWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] nestedsvm: Clear GIF when injecting VMEXIT
Date: Thu, 23 Apr 2026 17:11:12 +0100
Message-ID: <20260423161112.50221-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::15) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|BN8PR03MB4963:EE_
X-MS-Office365-Filtering-Correlation-Id: 18ce8e1a-350c-49a0-8b1a-08dea152f78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wYHCdLN9GSysR0LkLDLBtUWKA+X4kuI1o7ROLSI8zCPRbhQvFC7opvKfHcL3umg+JtaspalQPFLDOdAaNzqIDqaTwCxw4hIH5HgmJo+40GiLoeAC8LSifPtabO4laviw7K0ZuQhI5C/7ikhlFdxb/Gl9WJAZzKqpehti+NSzq9HhYOkwOBXIIAQBDeHm74TwxspI/ZQoFd4OR2Y+CSJ/qKhHhzziVWhOXuJC2Mt8nDyFZgl7UUJX+4AQx++q5nX4AEZaRbPzmeTTFauzkIftjDkAb+go7ER46zbuZAbBx3Ijv6w3yg9DZF/pnpv9pZNr7Pjwq1M6QrJDSX2+D4HxBa+J80op11t26xOioENBxwLX9VvMFhVjWsW8J73bYhEOGDnLVxWNv1ckH0uBtL61RapnK2veP9rkcA3K91WB/tMJ+bRXw7vkedFRw7OnM5eDica1011wH49ja7ycmECE24JPFlFMMZqQ6WcLImxcIZP1lIXzA5RibaWcFIEfthgpjBxF3iBUyu322TqBp5pjpl57vESU3j6ABDefxtlmv9I5POp7/fjNYbr0gfX9gMbKquOirslVsJv/w09R5tImpt+GrSQsMEHigZXmn0aeQs9yAUGnNoaI5iQhsH5d92WUbGWtc+16wZOFJ61Ie2I5p21KV6FdPp2zDY7vrwbUTYPGh16RZqOvT3hgg2lHBFOWLcHX/NU65eMHddf3GKLtKtmJ5H7D0zS/D70ysVGR5ik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fGnm/awDu/XuhK5X44ARrsz1Hw2/QbQ3KSiHhzMjJCjVoU7w7xchlIwGCCgY?=
 =?us-ascii?Q?yqCf3iYQih5GFDLIr3DpPu9iQEJnJaRAFTtNWVSApAVAQ+FpGowU9wkYJC8C?=
 =?us-ascii?Q?dqkzLzam68wYd1vopK8nfckUrXjNkoZs4sckMVgsCMGRAD54TwQ4YFnr5jaB?=
 =?us-ascii?Q?wxCvrVEX/9gFBXVRnUguLfW0dcqr8H/262sfcO8SjsLMRRU3q/L0/T0z/3Kp?=
 =?us-ascii?Q?iLHo8MPqnMrXWnLhtHfAEiCTvTUNypeC56Cflc+bT+54Bt0CeAC90ag3vwDQ?=
 =?us-ascii?Q?EbS66noMJdatBZKO8YtvhR+2rPSUAIyNvjt/vefICdwKHdnTfZiP5cTKPrgM?=
 =?us-ascii?Q?S+T+RnhG04KBy9M9oH2SRImc7ltZm69X/BmXzorCmlL4hJHKu8lbvGHU8KGx?=
 =?us-ascii?Q?LAjYPSSUtOqA1lGugpUpG6IGfGpaVr4gurtKV4pkIX9OYPicGFHXBA4mrKv/?=
 =?us-ascii?Q?p7IkQP6GIX1OYLKdBLksJcKzCr5iyU8hChz9ie8PYg6cfPpPs+usJ39sCwne?=
 =?us-ascii?Q?JftiwMDVakBzN54uLGDlBN8XyRt8F5s8XGZa+dl0RTe5vgxmBOjQVVZ4C/VE?=
 =?us-ascii?Q?Kr29sIbWlCAFmuh9qouAIL5UIhSlvFrk/rUSEoLftR/84iKpFUN210KKd0mX?=
 =?us-ascii?Q?EtM9skczjQpJE1yCvb4MnvFhlC/EDlNUrQ7VvLCsvJ9EsLqYpZO4xFE91b7T?=
 =?us-ascii?Q?9rhDMOFxG5MJqtZf09v4kGAacjdwcsnf/EvcaRSxgyBAs0s/A4oGCnyS4Fuk?=
 =?us-ascii?Q?wdjYZeaoJm60QHE6brR/W1+/G7TlxBEKRyRA0GVfINz9Cy4QHHEwy8uJ7lL/?=
 =?us-ascii?Q?DYUAOolvDZYoA7lOMUA1BS6gJd1xC+fbN7o19wWzHbXthNaNl839qf1l+/xd?=
 =?us-ascii?Q?uxhLWbbS+LU0YP9fL3HWCo4ZbhOwhnjvvHwI9P65SYmfnprKm118HHonjyn0?=
 =?us-ascii?Q?QfLCfdaUWFQLbC37PfO+VckOJwU+E99OqaH6hbzZbMOjiIEJdPZ90lOEOrs1?=
 =?us-ascii?Q?JzHEAnQFZNzWRuEl3Ba14PdiOxTrJ/QNsMwRnqGQbtGC8qFUM9ihQKLbRe0l?=
 =?us-ascii?Q?hO2M8qhorNhLryQMKtmO4XCWdw1fV9e3rsFqSlj+FCdgCgPkMU1cPEKs1HT7?=
 =?us-ascii?Q?6V0ONRp8I08tCQMwAqppsdnZ6vAC93DJ/sGZbctGxbniO/D43NtxbLJTeirA?=
 =?us-ascii?Q?jxWfW+quruDhY9A5QiTDrfnQWHaW+gjGguyfWKPxurWUZq0ZJCTUJ074CUf6?=
 =?us-ascii?Q?4JAjunn4/r9rHQ/18hhGSirjZsRCWWCZKuzKZFuvD5VX128TAOWRjf9NRdcZ?=
 =?us-ascii?Q?R2tQtenHUQcMlI5FrX+JjiFQD9c4MYLD4+MC9lfXU7m/111qvGD4oESK/aKQ?=
 =?us-ascii?Q?xKzMUEtztvGOIjn3Z5azwIsGT3cHymbYMhnJqoV2UD4hoIcRTxV3KSAykHzz?=
 =?us-ascii?Q?MfUtAChZjXzBfpy7s8QusUygHAiDr2T/m5i9R4vyWw7iRkzcZ9GnO95lYdlP?=
 =?us-ascii?Q?9TB6hBZJFxy3CMzkOevo4DXTIMRLp0WmqypNTXL4/EcYpcLqutzI+UNIX1E9?=
 =?us-ascii?Q?p4Kpk0iJQv0xkvpZOsLkulsmpiPdWnKEqLpHkSHNGVSMlvArs1aVe5DhbMhD?=
 =?us-ascii?Q?/CbYUyvGuh6aA/fCUYVvS0tjAJFoRCB95QJmIAQG0AB15jp+NOy2PEPcldat?=
 =?us-ascii?Q?CYMRowrmYTv51vhjWlhENLnVMCGgQAvoWJID4/BTzOBrSYY9Azr6uE115hkh?=
 =?us-ascii?Q?5t8rJbF36rJ99kLdk7v3uRDLTgv1QHU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18ce8e1a-350c-49a0-8b1a-08dea152f78b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 16:11:24.6648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uf1xi4u9U3VQe7wt302XQxhzOlPm2AlvURw67ruFKvsmjhoMbG5fp3CoxUabU2RLg31sT09DjIE8rMKX39my2iNTFWYMXcytjx5zUWmqTww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4963
X-purgate-ID: tlsNG-42698a/1776960688-7D76AF3B-A3EFDF6E/0/0
X-purgate-type: clean
X-purgate-size: 1084
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:ross.lagerwall@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[ross.lagerwall@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2EB22454B6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If L1 executes VMRUN with the GIF set and it fails consistency checks,
Xen will inject a VMEXIT and fail the assert checking the GIF is cleared.

Instead, clear the GIF when injecting a VMEXIT to match what hardware
does.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index ef6fa5d23b67..f89b087a1155 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -733,9 +733,9 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( vmcb->_vintr.fields.vgif_enable )
-        ASSERT(vmcb->_vintr.fields.vgif == 0);
+        vmcb->_vintr.fields.vgif = 0;
     else
-        ASSERT(svm->ns_gif == 0);
+        nestedsvm_vcpu_clgi(v);
 
     ns_vmcb = nv->nv_vvmcx;
 
-- 
2.53.0


