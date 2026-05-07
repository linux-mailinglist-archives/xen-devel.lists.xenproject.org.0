Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IN+WHrpv/GknQAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:55:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F94E7168
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 12:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302575.1576469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwOE-000430-RM; Thu, 07 May 2026 10:55:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302575.1576469; Thu, 07 May 2026 10:55:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKwOE-00041S-Nh; Thu, 07 May 2026 10:55:34 +0000
Received: by outflank-mailman (input) for mailman id 1302575;
 Thu, 07 May 2026 10:55:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1wKwOD-00040R-E2
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 10:55:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKwOB-00Afc1-9E
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 12:55:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc6fa0-bab6-0a2a0a5309dd-0a2a4503c8fa-12
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:55:32 +0200
Received: from [40.107.208.5]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 69fc6fa3-672d-0a2a45030019-286bd005ae35-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 12:55:32 +0200
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by DS3PR03MB989145.namprd03.prod.outlook.com (2603:10b6:8:39b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 10:55:29 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%7]) with mapi id 15.20.9891.017; Thu, 7 May 2026
 10:55:29 +0000
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
 b=gqxiFNqEJ4uaHrJN7IehzlCR4pHthuLiqb/KClcgLaOW5PlgfjP+0P0x4tARyftfoYyp/Yjjoa+1/y1w7IIj3vRZjr091yQlCzqU9IRNu47llEmU7y5vcPenHfmJdf0QIlks1LILd9bE0gCrmuZ4YHbsjAwkoIg8pU1by8/Vd62Z0Z5kzC0L/3aU0iQjvoxiQ+IsoMKamzVcuMZsK5JwdM3xk5LaE9KdB9oe/I8Wcx6hxUyYsIDN3Q5QmvNWJ/0hP4u+jwtL1I8+f+7TpsThSumSY+ujYOg8xThFuLC5kxvHu94jjnW9CGliJf7OFiQoAkoPKWTB0km8bYcV5ppaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJPgfvfHsAx+3DSvYAonI3+tuzu/fv903d4CjWROgaM=;
 b=rObXxuRmc7P4d5KXr1A4SQWKLQNxeb7/z8A983rAmRECMn0zj8ZN9+9nSmdBaSf4MxoHJ637JxTaexifkPkTzAyQIUHeaa4A3K/5Npt7YtTo6TuA5e1fhpipq6AXL1AefIWYTr4OAt3lGi7wiZUlUq5DnfHbqwLSNGiteruOzuSw5z6GElkHTgQ3uT8VCGG+2u4u58X7E1joPiniE7sUQHUIeX7uFLQAkvwmPwupbzO5G1m6M/OD/Qjvs/4gpcxrWNkrRpodd935qOYhb7RudCRS5UnIZhURLqXgsTB1LNtezKGIP8dC6jJbGPsJFofEKuXmaUru0alzTTJYf3h1dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJPgfvfHsAx+3DSvYAonI3+tuzu/fv903d4CjWROgaM=;
 b=sz3ow7cL+K7Zfib1ABcD2SfN6flJ2OZTBwuYjsrZFgRQ7K/IfKi13ZSox/j1iMT0q2Sst0AG1HXKcjXBXl4dWPBa37gEC5RRJWY4WM3/AKy9tVUw6K9yAVcXbBmanBmDLXk6QdGLfTH65XB7dutR5DjBko+TmKlaG6O2V9ojc6o=
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
Subject: [PATCH v2 2/2] nestedsvm: Clear GIF when injecting VMEXIT
Date: Thu,  7 May 2026 11:55:07 +0100
Message-ID: <20260507105507.2078971-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507105507.2078971-1-ross.lagerwall@citrix.com>
References: <20260507105507.2078971-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0522.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::8) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|DS3PR03MB989145:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b1f35e-0b4d-4024-68fe-08deac272751
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NM42Xncv/Z+RUnXL9nq830iFjeAKzDmi12MaWgLCTulLfogOX+4eGVC+11ItmV13P6sXEsE6N5A0ddNxPXxASv2mkTziuwUtaRXfT1srmuKZRnC+vzW9SAX6sAR/JQXLqU/Edhv4Nn6CinT7766cWieZvMmb52Cy1jsNN9e4sYbNGen8IiNI86zvG63dG9wAw56lmpwGbfaWVW9Sl/7WQxHHls7g+tUJ09fsUVQ/1HNtqNOQeLM14klTzluYVMVN76IDRCNE3W64TZqSu0hKGczLWb8P2sQhSrfy4vcyJ0bO2Uj0F6DXGCA+7jut4nkI0IeBTcAutZw0O2bQnVFraeA56IJ/GQGv4ASbWl1CUiRa0hMCGBb34OZZLeAlpxB3VTnDMVVZeOTSl5PQMBX50ySnzZJmo1GkJk8logyq+kV+1b/G/5Cvk+Vo6HpXeZo4K3Th1NBmnHPfoqKg0KCspYlmqi8dUNyvniZ5HTmIgUf0lxplg54nP/OxEojGhieL+H8UjEz6GPLsodPMIJBfLHR7pRRDyrFnzQUSNQWUvWG7nznJgPggSxu0mZXSxBBBE3+reSrLa1+DXRRFhXHb3JyJWlSmZf4dYXjAIj6fzu5OQAbRu23Lz1zgouBWoqvbVimGvCbdxvjvKjeHbBF7ctHOMWa5tEnM0dBGINuNR7YZ+K/DTDaQr1yLDE1brrKE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xvxX2uL6pFt8EJnws1hJlDGzVefpSzCq1KRcHgl/x4bN+Jg8q6qerZxbhwaV?=
 =?us-ascii?Q?0XNFJnPc4Bb/HLCigdZvx4hLhUOX9Zj7yQItvNry1HR0TXJK4nePjlE81Jb5?=
 =?us-ascii?Q?+JcprlxiAOCF8KDb/sE8p9uUo0+j9xD9ZBjZfsE7LsUNkYlzZfXNFb8JWqYH?=
 =?us-ascii?Q?yCOusq/j39tLi7jwu4OHdBwys8O51bfK9wAazqWaYdI8InAHGcCQDe4xjGfE?=
 =?us-ascii?Q?vXumNpc98700HqY8aFejZcrjHdg/HhNfjHlBImzvI4V+L1E/ixqhpXnP5EME?=
 =?us-ascii?Q?HScWu1/S4b7x08rjjvkb5sLDoNsk+zj831i+prqwvEKdvCqn+3SsYXHN86QB?=
 =?us-ascii?Q?G3cJ8/C8E4LAffR7RFtJMtedpPHcpjg7UnvcGIhfT/8hogK5lMQwQ6WTrqaU?=
 =?us-ascii?Q?bFp6ZKo/90udYdy6lHdEiJ7V1iqe+kEqvX5/NFniHrPquCrQCboLgXQfIDrW?=
 =?us-ascii?Q?nayDpl1rmPwlk1hJ+/HdXOg/wtoyjLd3Do+0+1vOlxu+72ZjEuB7mL2/9ise?=
 =?us-ascii?Q?+d7meiK8AiH+n5+MS8ogDnNjKoz8NOUTw1yi59pOC60w/VBVqVqXD2gqfJzO?=
 =?us-ascii?Q?5W7n2syzDedGxFuauP5bANy2O6wYp667zs+JZovnueYRGWu8qScolCuMXo76?=
 =?us-ascii?Q?nvpTADN+Sosh6X/wKPzKYvl6I280Jwalucd5h5ZCkO8YMVtIIOYsdfK2Ided?=
 =?us-ascii?Q?dY+F3fxpm2BDSx8FD5041eiNtaFHdH+Z2e5kaXcdJDMTHywg6eR1pum4zYrq?=
 =?us-ascii?Q?n6znfmLj72KvpBm4NcUMhpMdWTkh5Bz55NMiKl02Eld/FvXj7i6VoxdonLZD?=
 =?us-ascii?Q?G6NHloB1KOlRHqcDGaADVBulmA3xDnNzN03rBfjGUqFy+dqlZL194IFVgCPW?=
 =?us-ascii?Q?iNG8fITLgaXLYuDTn1qFTetXGIadWDFwzsryLPxga4A43661YTeAY/BETZ6K?=
 =?us-ascii?Q?Md857ZT6qbAoppQH3C08JOVFM4y378qPB/BNwSO4cImiS3nkniVdoQozZ6ox?=
 =?us-ascii?Q?WDL/3HLLNUYOz/EDtFhaobk+PvQL+4mZbdLKgMvmuroJo3U34WwTvxZYuqoc?=
 =?us-ascii?Q?XVKFpzNKaOMt4nB79tK1FlYmgEEvLdbbnqA9wSL1N91J8Hq+y0T4dq6vIJeQ?=
 =?us-ascii?Q?2TUraGfqWmG0urm17DWs/UKq7f2DRu6d6VzeKPh5B8okzFzjsiTy73kCV7Gn?=
 =?us-ascii?Q?GRz0Y63di0lb673IpdeRO+W9k7J1hI0eED6FvYDd+IFRLQa8sDgCwvxT3WW+?=
 =?us-ascii?Q?FGa2H9hd1LeY438bE8PEtComngJOFgxkPssymwjnqDpmBP+TlFgm1bqiQmRu?=
 =?us-ascii?Q?BpSQao31OU9NyFoq8fv5HVFMK6+3qgaCUFWqgdqEKzkbwtwMr7Iso6TDM6M4?=
 =?us-ascii?Q?2lc48e9jj/3bcxW00cuvVnmCSEaHrhioKhSkb3QRZ/JDvwv5hhuuQZhJAsHL?=
 =?us-ascii?Q?VU4zOr7QPruLCE1n/6eBQeQe9CibisQjrSVN7J4T/4Cs2U6bqXb0FbKsYKPT?=
 =?us-ascii?Q?Ob5NbIRmYD3CyHYSFhLcnDkZn/9vEU9qaUG19GU6V/4FL91n1hEnUYFPIEd4?=
 =?us-ascii?Q?vbZZWif3PrAXU1Lo0//weggt237mZ22vhFkluTlTMfOSbURnj4WnINbZPy9v?=
 =?us-ascii?Q?Tqtnvm+x4TblpBe7/fLUZeBG7+dzsyb9WkfNoZZFvue0zNRhRY9JB+RMWWn3?=
 =?us-ascii?Q?A/d/lkS7NZPjeN5E+Mv3HDLKQ28SmKS6uZ+x97s26/ZR+p3GgV5g+Ua0D+BI?=
 =?us-ascii?Q?4qKy68I2u8+xg/ALIzYBViQl9s5IiDQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b1f35e-0b4d-4024-68fe-08deac272751
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:55:29.7160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBnLDOF4pYSf2us2oJU4HdpcOJ6dI9KjkxnSdjPMzrkR6Ipv/CbRxp99w5J/di/5VB+u+fPpv+brOmvAxC6o01M49/2blmurfglQiZYMmkY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR03MB989145
X-purgate-ID: tlsNG-33051d/1778151332-4066C938-075DBE38/0/0
X-purgate-type: clean
X-purgate-size: 1131
X-Rspamd-Queue-Id: D26F94E7168
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:mid,citrix.com:dkim];
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
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

If L1 executes VMRUN with the GIF set and it fails consistency checks,
Xen will inject a VMEXIT and fail the assert checking the GIF is cleared.

Instead, clear the GIF when injecting a VMEXIT to match what hardware
does.

Fixes: 9a779e4fc161 ("Implement SVM specific part for Nested Virtualization")
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v2: Adjusted for the preceding cleanup patch.

 xen/arch/x86/hvm/svm/nestedsvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 64fbfe8fa71f..9899cb2147b1 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -717,9 +717,9 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
     if ( vmcb->_vintr.fields.vgif_enable )
-        ASSERT(vmcb->_vintr.fields.vgif == 0);
+        vmcb->_vintr.fields.vgif = 0;
     else
-        ASSERT(svm->ns_gif == 0);
+        svm->ns_gif = 0;
 
     ns_vmcb = nv->nv_vvmcx;
 
-- 
2.53.0


