Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JOXdK5vEKmovwgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:22:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFFE672AA7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2026 16:22:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=qewjLxUs;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1335629.1597820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgIK-0003bU-Bx; Thu, 11 Jun 2026 14:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335629.1597820; Thu, 11 Jun 2026 14:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgIK-0003a2-8n; Thu, 11 Jun 2026 14:22:08 +0000
Received: by outflank-mailman (input) for mailman id 1335629;
 Thu, 11 Jun 2026 14:22:07 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wXgIJ-0003Zq-6E
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:22:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgII-004jwn-CZ
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:22:06 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2ac482-bab6-0a2a0a5309dd-0a2a450ae9fc-38
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:22:06 +0200
Received: from [40.107.209.17]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a2ac48a-56b3-0a2a450a0019-286bd111a96b-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:22:05 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by MW4PR03MB6868.namprd03.prod.outlook.com (2603:10b6:303:1b8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Thu, 11 Jun
 2026 14:21:59 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 14:21:59 +0000
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
 b=lqhBMSVpYxgOK8QmS/MZtjydpQj5KYjOT5KWwbmKc7Kqw/qcMtXomjEqrBEiVBzzuP04Dc4K4EAJOju7pdO136ABnceUbhFyBefVAr92TpIt1j0UZohVuKGj9tk0j98yOgHWAcHqtyS6BGHzqKctHDt3/6BxC0cFUIkC2MVEkg4NYgYHG/hgEvp9GIxNKL2i3oYCQj/Se3qd9OQP5Vrr4QWrDOH7M+BP+Qv+FzbBwiis2oRWeVyDS8jxPoGQWlPO9dpv9BDKfOfxjSGU02WHB1YI8k2fUsr/IUbNvIYt6O9aXKOBnvvXnmFnYIgQICLZ0WmS/IpiSFmhU4XuBKatsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w8o7/s7koCPnxEkhlH28JSJXfj8ZLAGi46hUfnB7CrM=;
 b=NwH1Pplzu+Nn1KlYMGfLzzlzDXOuBDtLVKdKU1yl4yDJnPREx3USXXEzyriIB/aVwrnWmaPWgzgDafWd7GqmEsDiEOhT1Nzcoinuc5bALUDOpke+QWtPCOaMn1va4izKJ7ChArTo1PGxFzuS3/BqpLJAiDYK8kdJ6MiXQawRbtnvr728TrbS/6MEsFy8lgxpbqnPnBNWX8wv7eYenVEeKyKKtyQt8TIElZK/Bcj+5yb0mDi1yAhXcgJZ6uUzzIC9V4JFki5PjdtsCe5ks6AUMfkM/9PqTINeB7ncCSi/Nt6mbPQ8zcprM0Qb6pMrUjKCRQGkJp72idkuV4keQFYCnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w8o7/s7koCPnxEkhlH28JSJXfj8ZLAGi46hUfnB7CrM=;
 b=qewjLxUsEabcN3xZs4b89cl4fFyubVTri0wqjDsvUlc7JLhDbM4rmGN+8kWbxTfPjOQY5aJIAOUYwdVeZx+SeE0OwtOcC7bC314xqhd7ewOiDnqUR5G/kZsN6PFUeUhJG1X+42ClrMwKT10JGC8RbO6zB69UP6z4+PCWuFaeD3Q=
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH for-4.22 v2] xen/x86: Change stub page allocation/free
Date: Thu, 11 Jun 2026 16:21:54 +0200
Message-ID: <20260611142154.64525-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: IA4P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::17) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|MW4PR03MB6868:EE_
X-MS-Office365-Filtering-Correlation-Id: 16ff0c55-8db4-419c-0cf1-08dec7c4cc77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	qIml6B84rzXD3EVw/ED98OqIuqk1pvBp7q162488RqmRcpR62dZSBEz2+11Pt8Zv6Dj5GrNtSsBlOzziL4G3H7hs1wW5WybHhcQJhlls0LmnsEh8RZ05Ku4mX2NLcKLjtypCR9w5/0t6aZs2tA01R8ayVdT/ARRpnAff5L3zf6SyMIp2IVh4lMtvANJ7uh4CDNWDozM6p679bP86TptDj4hXyssBQtrXhE2lph78t9GPx3LFQ+wiS79wb1KYolt8M8odtzH6QERYwpH68rrlocTmVvqSLlNgylQ05NMwrKPfxqnkubVtQDl6d/gG6fCM9OKq0HDq4kbAhN4Gxm9i37u4sESnYZIzLu2oDMOdYJ1+NHZ6Alo5zAHCTaNngbfvmtj+oDZ9PFFMg5gBkRlCDSHKnsXv5ncRNXUYLwQ2YraMlQWv6FXr6fO0Fz470Sth/mlwvqIfSMtxB3EBXJm2CiGJehbvT7a3Bz9pV7tqmYgJhMkvaY0Dlz18GcqtbZumwByrBhbFs07xWMq+q5ccVZHE/kFwn/qcj870o44Eal7lv7WoXc64EBDT/mYD5q/tSzC9yL5Z35m8IYPqyfpFY5jynbG8oHyQcmAd5WyraxmBz8DnpADxI5GxP3birLCRgl/LYCaFNo11AE3kkDuFJVpZUEBbQ/tPuBVI0X3iJHwsgFJEfrgepd9N13F/zjva
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0dzL05JU015WmxhYmErb29jU3hFVENDKzVoVXAvQWlXWE5Kb004N2RzSWM3?=
 =?utf-8?B?MzZFUUhhcVhEcmpsSHd5YW8xcXRhWHlOSHltRUNhMWZNRVhKaWZWRURaUEJr?=
 =?utf-8?B?ZVY5Z0k4QmJRSStISGszR1F3UllaZ1Q2bVp3TVlja2hwQUFKTGFQckJDMGph?=
 =?utf-8?B?U0x6ZGZIN2NUMm1xSDlGeWNVMjFBS0YvYmVvMGJieHdEaUNwbFVTUEhCb0do?=
 =?utf-8?B?b1FST0tNRVNHVVVuWFJqSXZ6NWVKS2xMUER0M20vS0RoOEdoUVIreDZYV2l2?=
 =?utf-8?B?bDFybDQ3WFhxQWVSQjJzRmo2Sk5xdG9HcGhYUWpsQTZvaFZnY3ZEVk5uWkFW?=
 =?utf-8?B?TjJyTFh1L1F6enJFRXZyVzJ2MWFJbjM4MDBpbE9BeVdPLy9GWFBpZDdLRVRH?=
 =?utf-8?B?ejJJa3JDK202dVRmaVBRRzRmUE40ZklNeVpYYTlmL2MvWG9jR2RiR1FmbGlJ?=
 =?utf-8?B?enhhSXlEUWVpcWptMG5Fell2Ymt2dTJ3NFdxazRBcVBSTGJqU2d6eWFuWHk2?=
 =?utf-8?B?blJjZDdiL3RqWTdZZGthZW0xUFlxeUZ1TElFa1U2TTZHYTkzeDdOaVRsbzFs?=
 =?utf-8?B?QTBkVzhQaEhhSE9sNHZmV1hGRUhaZEVPTXY0MEtNdlVLRjAxSm13RTlWUkww?=
 =?utf-8?B?eGQ1elBHZG5xVGxWZVRrYitMakZYYmtKSmdvVnpPdWUyTWx5d3lWMERIZ0VP?=
 =?utf-8?B?bitKNHY4eTdZZVQwLzcxbndNVHdHS01PdlJGU0x3TW5NRFcxTloxTlI2Yk9z?=
 =?utf-8?B?ejBqNU5qY3RNVFRRVkVNMzdwMWEreXVHcUlLV09hdnI5Wnh1SzRxUndKenB4?=
 =?utf-8?B?a25QRk1SbTFQRmxENlBJNkFxOXY1N05DdHFqd2d4endxVTNWTnNETEZyUEdU?=
 =?utf-8?B?UEx3akdodGtiQ29kTzF0RUtvaXZLSkhxazNweExzOGtTVnBHR3Fud0hxcG9K?=
 =?utf-8?B?MENjT3ZNV2NHMktLeG5uczRuTzA5THBwMHR1cU8wNDRLSWYwTzBqQ3U5eDdJ?=
 =?utf-8?B?bzVobXlkQmJOeFdzaDNTOXRwTHNCb1l4TmFObjlVTGNSSmhIeU13RkpKK1lI?=
 =?utf-8?B?eCtiaUZpR1pDUEdSRXA2NWMxZWhPRkIvUGJiN3JkRW9jOEU5VVVDL0V6dUN1?=
 =?utf-8?B?TXl3cW8vVkc3YUl6RlBXcC9Fckc5SXdOQ094cENiMUpyM3FVNWpUNWJYaDE1?=
 =?utf-8?B?WVJVNTVRV0Qwemp1SWZmdXJwclFocDZpYy93T2lWMEQ5eFUrSXNZQTNpUStu?=
 =?utf-8?B?OVdIVkJ0b3pLWk5YdE5CM1JnUnlEWGVTamlQSklzWE56MTgxNE9SWmQ1WW1T?=
 =?utf-8?B?RlJKdE00Y0NQa2FXa0pXd01QN2hBSVNNazcrRXl4QW9JVk1RTTJSRUkvR0Np?=
 =?utf-8?B?TEwxeHJXcWltOVg4d2t1MjJWUU9sMzV5S3QyYm02eS9pbmo4STlJbExScDB2?=
 =?utf-8?B?c2RiTGJwKzJ2MGtud0Y0ZHkvenZhTXBLWENJaCtVSG1XSEFJNTFacmxmUDM3?=
 =?utf-8?B?QUxiTDBLMlVLTjZrNkJlVmpYRDNXVisyS2haQUo2MFRnZWxYUzhJaDU4NmtK?=
 =?utf-8?B?Rk4wRUh6bGlEcVozdEI2ZUFPazNLeFdvcEZveFA0b0VENy9EUVA4SEZ6b0Q2?=
 =?utf-8?B?UlZ5c0VoVlJ1M0VVQm4xMkZVY05DZlJvVmZ4RW55R3g3eFNGa0ZOYzFTM0J1?=
 =?utf-8?B?d0tSZGxtcCtDQ0lKRCt0TEJ2L2FlOXZoMlhEMngzMmpXVHY5RWZ1T2ZNeDV1?=
 =?utf-8?B?T2FKanhHblpKTTV2dHZFVXhsd3ZkbzlnZnFYekFTaXduVWJ0bFJLZXFrUFJF?=
 =?utf-8?B?VllNQ0d5SE4xd0VjMmtNRGZnTWRHZUd3UTNXR2lwTlJNellIYW5tM2xIQml1?=
 =?utf-8?B?WXZoUVBCNkJqZ2JaOFVhWVIrT0o5TVFkOUZOeGVvMXdJY1Y0cnRFVmVEcllM?=
 =?utf-8?B?aW5XN3A3Mmt4d29xQW9aOUlPZ1FzR2trTjRoV0dEODZDdjR1eUFPcmh1bHdG?=
 =?utf-8?B?NzFtTEFaZW5FMEpHTlNybDRzczRERklCV2hZNWZzbGY1RXdabFpTM3hyM3VG?=
 =?utf-8?B?SWVuOEpKQVRiakNuS3JHMWtLdU9qQUJGTVFzK1hid1I3SGhRNmF2TUdFUzR4?=
 =?utf-8?B?c0llaDl3K0FabWpLZnEvL2E3SGdSTTRkaXNXYnczRWEyRjZPMER5d1o1UExP?=
 =?utf-8?B?QnkyMEgyblpOcWhLWkdiUVhMOVdlZWd4M1l3KzVUeWNETHRFSmVvS3I3aXV3?=
 =?utf-8?B?MXlmbU9FbzBOa0NOOXdVM09VUi9jd2pKMXJSaU16RXFKTDlrZ3oxd056aUNv?=
 =?utf-8?B?Ulk2RlhRVkJvKzhSeGpwUkptR294SktIZndDZk5EM2F6NkdDVi9rQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16ff0c55-8db4-419c-0cf1-08dec7c4cc77
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:21:59.3020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: us8s5Gs7sHdzuYTZol9DazDMTEqg1t8wSn6ylfCh3R4XKGLmL3uvmpjM+6ZNw8xzIX2cpsWzFEpJ43J5EV7wfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6868
X-purgate-ID: tlsNG-4011c0/1781187726-7DF838B7-C18BB2F6/0/0
X-purgate-type: clean
X-purgate-size: 7740
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,suse.com,citrix.com,vates.tech];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EBFFE672AA7

From: Jason Andryuk <jason.andryuk@amd.com>

Today the inline tracking of the stub page is problematic.  0xcc is used to
indicate unused, but it is also a "clear value."  A !CONFIG_PV build with
smt=0 will bring up CPU0, bring up CPU1, bring down CPU1, and free the
in-use stub page.  CPU0 or subsequent onlined CPUs can write to the re-used
page.

The new approach uses a global, CPU-indexed dynamically allocated array of
stub addresses.  However, to handle NUMA aware allocations, we cannot
allocate all the memory in advance because of the NUMA dependency.  Take
advantage of the fact that Xen will attempt to contiguously pack CPUs on
the same NUMA node (see normalise_cpu_order()), and on CPU bringup use the
same stubs page the previous CPU did if suitable.  Note the code would
still function properly even if CPUs from NUMA nodes are not contiguously
packed, it just consumes more memory.

stub pages are no longer freed.  They remain referenced in the global
CPU-indexed array and are re-used if the CPU is re-onlined.

The stubs array doesn't have an explicit lock.  During boot it's accessed
single threaded.  During runtime, &cpu_add_remove_lock serializes access.

Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/stubs.h |  2 +-
 xen/arch/x86/setup.c             |  4 +-
 xen/arch/x86/smpboot.c           | 92 +++++++++++++++++---------------
 3 files changed, 50 insertions(+), 48 deletions(-)

diff --git a/xen/arch/x86/include/asm/stubs.h b/xen/arch/x86/include/asm/stubs.h
index a520928e9a50..467551136a2a 100644
--- a/xen/arch/x86/include/asm/stubs.h
+++ b/xen/arch/x86/include/asm/stubs.h
@@ -32,6 +32,6 @@ struct stubs {
 };
 
 DECLARE_PER_CPU(struct stubs, stubs);
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
+void init_stub(void);
 
 #endif /* X86_ASM_STUBS_H */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4192edf635b6..0253d22c349d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2089,9 +2089,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     init_idle_domain();
 
-    this_cpu(stubs.addr) = alloc_stub_page(smp_processor_id(),
-                                           &this_cpu(stubs).mfn);
-    BUG_ON(!this_cpu(stubs.addr));
+    init_stub();
 
     bsp_traps_reinit(); /* Needs stubs allocated, must be before presmp_initcalls. */
 
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index d8fd71ffab37..f0c104b9f072 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -20,6 +20,7 @@
 #include <xen/serial.h>
 #include <xen/softirq.h>
 #include <xen/tasklet.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/apic.h>
 #include <asm/cpuidle.h>
@@ -641,41 +642,62 @@ static int do_boot_cpu(int apicid, int cpu)
     return rc;
 }
 
-#define STUB_BUF_CPU_OFFS(cpu) (((cpu) & (STUBS_PER_PAGE - 1)) * STUB_BUF_SIZE)
+/* Dynamically allocated, indexed by CPU.  Store physical address of stubs. */
+static paddr_t *__ro_after_init stubs;
 
-unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn)
+static bool assign_stub_page(unsigned int cpu)
 {
     unsigned long stub_va;
-    struct page_info *pg;
+    paddr_t addr = stubs[cpu];
 
-    BUILD_BUG_ON(STUBS_PER_PAGE & (STUBS_PER_PAGE - 1));
-
-    if ( *mfn )
-        pg = mfn_to_page(_mfn(*mfn));
-    else
+    if ( addr == INVALID_PADDR )
     {
-        nodeid_t node = cpu_to_node(cpu);
-        unsigned int memflags = node != NUMA_NO_NODE ? MEMF_node(node) : 0;
+        nodeid_t nid = cpu_to_node(cpu);
 
-        pg = alloc_domheap_page(NULL, memflags);
-        if ( !pg )
-            return 0;
+        /*
+         * Attempt to use the same page as the previous CPU if possible,
+         * otherwise allocate a new one.
+         */
+        if ( cpu && nid == cpu_to_node(cpu - 1) &&
+             PAGE_OFFSET(stubs[cpu - 1] + STUB_BUF_SIZE) )
+            addr = stubs[cpu - 1] + STUB_BUF_SIZE;
+        else
+        {
+            struct page_info *pg = alloc_domheap_page(NULL, MEMF_node(nid));
 
-        unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
+            if ( !pg )
+                return false;
+            unmap_domain_page(memset(__map_domain_page(pg), 0xcc, PAGE_SIZE));
+            addr = page_to_maddr(pg);
+        }
+        stubs[cpu] = addr;
     }
 
     stub_va = XEN_VIRT_END - FIXADDR_X_SIZE - (cpu + 1) * PAGE_SIZE;
-    if ( map_pages_to_xen(stub_va, page_to_mfn(pg), 1,
+    if ( map_pages_to_xen(stub_va, maddr_to_mfn(addr), 1,
                           PAGE_HYPERVISOR_RX | MAP_SMALL_PAGES) )
-    {
-        if ( !*mfn )
-            free_domheap_page(pg);
-        stub_va = 0;
-    }
-    else if ( !*mfn )
-        *mfn = mfn_x(page_to_mfn(pg));
+        return false;
 
-    return stub_va;
+    per_cpu(stubs.mfn, cpu) = PFN_DOWN(addr);
+    per_cpu(stubs.addr, cpu) = stub_va + PAGE_OFFSET(addr);
+    return true;
+}
+
+void __init init_stub(void)
+{
+    const unsigned int num_cpus = num_present_cpus();
+    unsigned int i;
+
+    ASSERT(!stubs);
+    stubs = xvmalloc_array(typeof(*stubs), num_cpus);
+    if ( !stubs )
+        panic("Unable to allocate stub array\n");
+
+    for ( i = 0; i < num_cpus; i++ )
+        stubs[i] = INVALID_PADDR;
+
+    if ( !assign_stub_page(0) )
+        panic("Unable to initialize BSP stub region\n");
 }
 
 void cpu_exit_clear(unsigned int cpu)
@@ -990,19 +1012,12 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
     {
         mfn_t mfn = _mfn(per_cpu(stubs.mfn, cpu));
         unsigned char *stub_page = map_domain_page(mfn);
-        unsigned int i;
 
-        memset(stub_page + STUB_BUF_CPU_OFFS(cpu), 0xcc, STUB_BUF_SIZE);
-        for ( i = 0; i < STUBS_PER_PAGE; ++i )
-            if ( stub_page[i * STUB_BUF_SIZE] != 0xcc )
-                break;
+        memset(stub_page + PAGE_OFFSET(stubs[cpu]), 0xcc, STUB_BUF_SIZE);
         unmap_domain_page(stub_page);
         destroy_xen_mappings(per_cpu(stubs.addr, cpu) & PAGE_MASK,
                              (per_cpu(stubs.addr, cpu) | ~PAGE_MASK) + 1);
         per_cpu(stubs.addr, cpu) = 0;
-        per_cpu(stubs.mfn, cpu) = 0;
-        if ( i == STUBS_PER_PAGE )
-            free_domheap_page(mfn_to_page(mfn));
     }
 
     if ( IS_ENABLED(CONFIG_PV32) )
@@ -1041,10 +1056,9 @@ void *cpu_alloc_stack(unsigned int cpu)
 static int cpu_smpboot_alloc(unsigned int cpu)
 {
     struct cpu_info *info;
-    unsigned int i, memflags = 0;
+    unsigned int memflags = 0;
     nodeid_t node = cpu_to_node(cpu);
     seg_desc_t *gdt;
-    unsigned long stub_page;
     int rc = -ENOMEM;
 
     if ( node != NUMA_NO_NODE )
@@ -1092,18 +1106,8 @@ static int cpu_smpboot_alloc(unsigned int cpu)
     memcpy(per_cpu(idt, cpu), bsp_idt, sizeof(bsp_idt));
     disable_each_ist(per_cpu(idt, cpu));
 
-    for ( stub_page = 0, i = cpu & ~(STUBS_PER_PAGE - 1);
-          i < nr_cpu_ids && i <= (cpu | (STUBS_PER_PAGE - 1)); ++i )
-        if ( cpu_online(i) && cpu_to_node(i) == node )
-        {
-            per_cpu(stubs.mfn, cpu) = per_cpu(stubs.mfn, i);
-            break;
-        }
-    BUG_ON(i == cpu);
-    stub_page = alloc_stub_page(cpu, &per_cpu(stubs.mfn, cpu));
-    if ( !stub_page )
+    if ( !assign_stub_page(cpu) )
         goto out;
-    per_cpu(stubs.addr, cpu) = stub_page + STUB_BUF_CPU_OFFS(cpu);
 
     rc = setup_cpu_root_pgt(cpu);
     if ( rc )
-- 
2.53.0


