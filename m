Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id euKEID7BHmrSUgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:40:46 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F062D9D1
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 13:40:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=XonPlr9L;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1324789.1590295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNTz-0005sg-FM; Tue, 02 Jun 2026 11:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324789.1590295; Tue, 02 Jun 2026 11:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUNTz-0005qF-CL; Tue, 02 Jun 2026 11:40:31 +0000
Received: by outflank-mailman (input) for mailman id 1324789;
 Tue, 02 Jun 2026 11:40:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUNTy-0005q9-20
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 11:40:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUNTx-003SaK-A4
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 13:40:29 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1ec121-2eae-0a2a0a5409dd-0a2a45049a62-32
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:40:29 +0200
Received: from [52.101.52.14]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1ec12b-1dec-0a2a45040019-3465340ef653-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 13:40:28 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by PH0PR03MB6235.namprd03.prod.outlook.com (2603:10b6:510:ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.18; Tue, 2 Jun 2026
 11:40:25 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 11:40:24 +0000
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
 b=U5Lg0ZmVHTRhOxgAf7kD2u6y10PXM1uDanwJlFQVkXIF+yU51w1atnELciXW7IyI9RW2gFz4m7h6APYyT79/TCuLw9z9ROwRxA+iUBMWMUD3xPFRxiU2IIY7zWsxuoe3MUvstl1/DIARY48YqeB8lEGSbRsyIPXhad835aYVcOY/v9ri57HlY7p1JhhvmWyA8lSJgUrW92FCTC5VdE+S2ZndNWd3oNN5fEbyRUh00mILJ5ToBlyyJyWs3E5RoX0sKLAmbK/CjJajUdAKdS6vWb6YDkLW4TmxkGaWeERbdWeiSEUWgzuieSU4OkdSb8pryszjUAEgLHK3RxX12hmUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlNgACLTZDlzRA7+/Fey+BnzeUCXoDk1XPlPyUiZvp0=;
 b=mg+CmoMLiDvMAERzy7Sxk+Z+jb/9q2IT3wZvJnge9OPI655A2xFuEGT9PGXv/K7sWvJkH75izatVOX3g/HTwFDMuLaRLfNIaDHQMokvDuGJ+zrvRzL2YgWP1FFLvOoDnykg8tBqvcMXqw007zhPsOuHnHS9QHC2SavO4bvprKaKp7aharoiF+74/IXY8xSyYkqM4/LouDMrd/ro6bLyWBdaLJxXVDmDg1m3N40stVyOI6gXFYDnAhgbGAE7abcA2K8bnaI5KAHMg6EY5AD9tBp9cAelaGPAIClKwim7gbnWMUrEYIFyg53xFTJGhCuvFFJdsydlJLNsufwf6nWe2pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlNgACLTZDlzRA7+/Fey+BnzeUCXoDk1XPlPyUiZvp0=;
 b=XonPlr9L7xhyPMWdE9IQWmdCXRJ1GI1E3r7RRQ5kP6465JVBdlNgYSUcFjK8SYkc24EMAoR+pOh1qICjUbVduZgyb08lHGzK3vDOM2MFq6qsJrRXqCDtG5w21FmPxyTMK7JIbCV/Zdsq2BNJI9OouanfI8K+3V4P/zBquTRsAuM=
Date: Tue, 2 Jun 2026 13:40:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
	Marcus Granado <marcus.granado@citrix.com>
Subject: Re: [PATCH] xen/mm: avoid watchdog timeout in dump_numa() on large
 domains
Message-ID: <ah7BJEqu7bi5pN5J@macbook.local>
References: <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10d8309efdb878a3b615a7daca2bb5209525cb37.1780390167.git.bernhard.kaindl@citrix.com>
X-ClientProxiedBy: MR1P264CA0184.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::6) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|PH0PR03MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: c31b8fa8-031c-44ab-1130-08dec09bbc39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|22082099003|18002099003|6133799003|11063799006|56012099006|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info:
	rOqe7vMN8kSodYmXiM7MJhCOuxX8FQYzP7G1oArh0sOXJZ2EDgLPoJUqxqRU0gfN/iHnY52gb9MGG8+uKMnvZa+Jn3nn8OVnJosQ/RXlY1AdxD+qIcV6nVSN/h5p2fvNcEUAaW7Kwk69hwwWWcKctg5ZlcQcceZ+jlFQR1U/N8AHjw9M2H6UpiEn/cluI+qYp1IOpNeU4qFOBzFItddrveWdbYxaF3NpHjIa/ES95TKxDtFsn3x6Oi0BA6bfcW0937T5+Z4aDIsqmXTOgeG8le/szC7YD0dM9pQYCVnfrKh8A7igYVZBzGwPjTCU/I4mMPTiMUgS4DHGrPlZd0hSfJKVZWci/fLH8cZR0JpLif7G1OnC/FUIHiBXcEvCK2nJS7Mhgi9bEOOL7tvGNgGU7AcRmsFXFOxXiFciJmcdoxzkOgTI56h9+xD1MM6WXpye5gJEeq+lvXRVN7gJ3L2eL5yO+p+jRCJhUug1189P5myGLOKu3iEuXfHthaJmhWXMFdu1TJGxqxp8RHPa8k6zq2F6kX0xFrRdgSwtY/xBIIoOfmdSr/yKamq/Y8c510/smhXAxj2lavvTMRg0XtzPBDkQMG9HOwJAlXdYt3265xE18gYdYnZ5imDMjQ25nh9GP++w4piVYGx6UtqwqeBCIa2Sjm/jsV21ap4uW98COZ/L6A2WKOMyVl2Wu4UnCIAk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGF6WHZpOWxWL3pMZ2Q0M0xteXd1TVIxQnZwaktsU0RQVXV0OTVrRi9pdm8z?=
 =?utf-8?B?SHdKNzVNdEVMOEd0ampQUkswa3AzaHlaN2o0TDNhQm1Zazc4KzJ4Vk1XZzRU?=
 =?utf-8?B?V2I2ZE9sUEpvSG5BN2VwYU5WZlgvMEdsajQyeU5XRjYwemw5US90THFZV091?=
 =?utf-8?B?K3FkZnozdUdmcWRxejlvb0tFYmhVY0xNbnVuN01mUzJpNnkyMDBDUnU0TmhZ?=
 =?utf-8?B?am5vZndSV3ViT3RJTEpaWXJVeVpLYnVyazkyaExnZlp6WVRLSlZlZG5LR3pa?=
 =?utf-8?B?dUFhSGFaMUhucHZHTEYrZ2dRdnNCVzdHVnp2YUc4c1pndmxhckhpY0MyLzZx?=
 =?utf-8?B?OTlObVZMVXV0b24wYmF2Y0tXTDlmK3B3V0ZPMDZZd2lyeGR2VjJWajFIUTF4?=
 =?utf-8?B?a0c0SHdzMUk4eFNsTCtwQ2RaOW1obC9taHFuejhnNHJoV3JoVmxadGpmY3E2?=
 =?utf-8?B?VUFvOGNhZkZseGVNa2NFcHFoWFBMTElrS0w2WGR1c0o0RlpsM3p6Sk5RdDNB?=
 =?utf-8?B?MFJqdGl5OFdJbkd6MmRLZk5CajM4dlFDZE5sWUpiTjdFTXc5cDlqMWRuelln?=
 =?utf-8?B?QXZ4Wm1UOFUzQkRjSEs1VHU0R09uRUF6SGNnYkpZWFVGd2s5cG1TbnpUNkNB?=
 =?utf-8?B?cWVXUDJvTm9SSytJT1djT3hYVWFwRE9zNTFab20rYk5CVVR1OVFqV3MwNWQy?=
 =?utf-8?B?OGgrc0x0NWlIZGk5S0p3aGhrL1NFcTk3cEVneVpLRkhSeW1EZUhpVVB2V3Zp?=
 =?utf-8?B?ZklxemJEV3pPVWtVQ0FXcW42WStVOHRJeEluZ0NDN2todW1hMDdmcTlIcWli?=
 =?utf-8?B?L0dWVWUzRFNvWCttTWY1dHcvOENhdk9LTkVpUCswTTBoQVhLU1g3QVF1N2Nk?=
 =?utf-8?B?V0k0bC9qT1JhVWhRYUlKdm55RXYvdDJnY3RCN21LYWM0bTlxTVlwL0NGamdt?=
 =?utf-8?B?UkE0TnRWOHBhdHNSdk1hcUlZQU1VQlJJRHB5VkhRME5DeFdsaGFNN1BibXBS?=
 =?utf-8?B?RUlRTXlud1JmZ2YyZ3RxTzJCN1Vmc0VKWHJyU1ZYZjhqZzZwa3d5VzdMemkx?=
 =?utf-8?B?Y1BnQkMxTmRqSjVqYUE2c085RGV1L3I5QS9KQ2lRbktGbXVKSXd4SzhxRWQw?=
 =?utf-8?B?cXU4OXk2V3p2Q2xrYWtGanZ3TE9zdnBTQ0dkMVl6QWdmeHVFdVFlb3RCamox?=
 =?utf-8?B?V0dZVzF6b1crR1FibjBWeW5zcmFtWUtCa1d0NzVLOVFWM0dQaVlsdDlxYjBV?=
 =?utf-8?B?RCtSNlBwN3FMb2k5YVEzYUhoK3Q5YTRGK1UxK3FzUERRUytYVzdnSGQ3dllW?=
 =?utf-8?B?Rnl2aE9La1NMRmRJN2xPbTJjZWltdDg1T2lmMFFrVCtWM0tjbGRaNjRwdVRv?=
 =?utf-8?B?Y253aXZFUVBKSzRrSTVQRzNQVi9lUGw0K3Brc2lKa0hqcDA3NFBGL0RwWGJF?=
 =?utf-8?B?dHh1WXdsaHQ5cktyNzN6VHdjVWMzQms5eWZxYWM1YklTUFBlQ0tGek5tQmZI?=
 =?utf-8?B?M2Qwa2tBZWtnN1BON1Jka0pxekswMHNDUHhYdWtLV0M0UFhycVRYMnJXSFZC?=
 =?utf-8?B?cC90RmJ3SmE5NXE1a3RrYkw1MDVlRHdxTGtZVGFrWkN6ZzZnTmFVWDhBeWJQ?=
 =?utf-8?B?UFY2UkhONWVHL2hjMy9CUHl0ZkhyMXkyNmR3am5DSkNhdk03QmJpYzQzcG5H?=
 =?utf-8?B?YUdiV3NZQTFRWnRVQTNrV2JJMzI2U3hPVi9lcHZleklLdEVqa0tIQTdScHBC?=
 =?utf-8?B?b3ZTV3dOTFp6aTF4a2FvS1lrejRUN3YrT3lBSU82UENSQ0ZrVG5FdUZnUjRm?=
 =?utf-8?B?SS9VQkpVOWlzbXVwdTJJaVRlWDNTWlM0WkJRaDZpT0hBc0F6KzE3QU5jQ0FK?=
 =?utf-8?B?WnkwRkxJc2pvaXdEYm1aTHdMTXJBN2o2ZWlDSzNzbFA5U3dkdjlJbXJJWmwy?=
 =?utf-8?B?akpZc25Wck5MSjl0b1FhVVlCR2ljM3V2SE1FbHNXeUFjbHdSSTgrVU0vbnBY?=
 =?utf-8?B?VHllazJ4dVF5ZEtRcGhGUDFHcmtBeW9mOC9vb1JJQnRHS3BGYkZKTVA0aVpw?=
 =?utf-8?B?cVNaMzVEaTRQZ3FQNXBlU1phWXozT1JUWnlLa1hwU0hDejU4VndEN0VQVDJp?=
 =?utf-8?B?T2YrSFFmNWdGNUxOYmdPVHZKMU85THIzczQrSlhRQ1BjWE5TR0Z4cDRlU1hJ?=
 =?utf-8?B?REg5c2djdjNlcitMV0RsM2szMmFIN3VCRXFOa1g0aHM1M3hacjNaQUNEWE5Q?=
 =?utf-8?B?WWJDZUdTM01ZOENYY0V1NEEvckdncW96NVFPc2lHQ2hOMU44eitpWVVZR1BV?=
 =?utf-8?B?RmlFRktjTjhwMElwYmhLc0laNERaeG1iTE5tMUN1UjZ1VUh0a3A3QT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31b8fa8-031c-44ab-1130-08dec09bbc39
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:40:24.5842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSgnhR8lDav5hVZSMPAPQgFT4BiDNHgMAGi9HvBSF+xRq8Zh/SjjAj5nmM0XI3bxTH1oisnxLF5k+8USoIe+eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6235
X-purgate-ID: tlsNG-ebf023/1780400429-491763FF-EF23B9F3/0/0
X-purgate-type: clean
X-purgate-size: 24646
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:tamas@tklengyel.com,m:alejandro.garciavallejo@amd.com,m:marcus.granado@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:dkim,citrix.com:from_mime,citrix.com:email,amd.com:email,cloud.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[citrix.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A43F062D9D1

Hello,

This is missing a "From:" line that matches the first SoB in the
command message, if nit doesn't match the sender (which is the case
here).

On Tue, Jun 02, 2026 at 09:49:50AM +0100, Bernhard Kaindl wrote:
> Using the 'u' debug key invokes dump_numa(), which walks each domain's
> page list under page_alloc_lock to compute per-NUMA-node counts. On
> domains with many pages, this O(pages) operation can hold the lock long
> enough to trigger a watchdog timeout.
> 
> Replace the page-list walk with node_tot_pages[], a per-node counter
> maintained in struct domain. This reduces dump_numa()'s per-domain work
> from O(pages) to O(nodes).
> 
> Accounting via domain_adjust_tot_pages()
> 
> Most page-count updates flow through domain_adjust_tot_pages(). The
> helper takes the affected NUMA node and updates both tot_pages and
> node_tot_pages[node] in the same locked critical section.
> 
> A debug-only helper, assert_numa_page_count(), checks after each locked
> update that the node totals sum to tot_pages.
> 
> Accounting in memory_exchange()
> 
> memory_exchange() cannot use the same helper. It is preemptible, may
> fail and roll back part way through a chunk, and does not hold
> page_alloc_lock for the whole operation. The final success-path value of
> tot_pages is unchanged: by construction, the number of input pages stolen
> equals the number of output pages assigned. domain_commit_page_deltas()
> still applies the accumulated deltas to tot_pages, but their sum is zero.
> 
> Instead, it accumulates deferred per-node deltas in
> node_tot_pages_adjustments[] for the current chunk:
> 
>   When steal_page() is called with MEMF_no_refcount, tot_pages is
>   intentionally not decremented. A decrement of 1 is recorded for the
>   input page's node.
> 
>   When assign_page() is called with MEMF_no_refcount, tot_pages is
>   intentionally not incremented. An increment equal to the number of
>   pages in the output extent is recorded.
> 
> At the end of a successful chunk, these deltas are committed under
> page_alloc_lock. The net tot_pages delta is zero, while node_tot_pages[]
> is updated to reflect the NUMA-node movement.
> 
> Correctness on failure paths:
> 
>   Invariant 1: Pages allocated with MEMF_no_owner are not counted in
>   tot_pages until assign_page() succeeds. Freeing such pages with
>   free_domheap_pages() is therefore accounting-neutral.
> 
>   Invariant 2: Pages stolen with MEMF_no_refcount remain counted in
>   tot_pages until the deferred adjustment is committed. No window
>   exists in which a stolen page is absent from d->page_list and
>   already subtracted from tot_pages.
> 
> These invariants cover the failure cases:
> 
>   Input-side failure before output allocation: any input pages already
>   stolen are still on in_chunk_list. The fail path attempts to assign them
>   back to the domain. A successful reassign cancels the earlier negative
>   delta; if the reassign fails because the domain is dying, the negative
>   delta remains and is committed, reflecting that the page has been freed.
> 
>   OOM during output allocation (alloc_domheap_pages() returns NULL):
>   output pages already allocated before the failure are on out_chunk_list,
>   have no owner, and have never been counted in tot_pages. Freeing them
>   does not change accounting. Stolen input pages are handled as above:
>   reassignment cancels their negative deltas, while unreassigned pages are
>   deducted because the domain is dying.
> 
>   assign_page() failure because the domain is dying: output pages
>   assigned before the failure remain accounted to the domain and are
>   reclaimed later by domain_relinquish_resources(). The accumulated
>   deltas therefore contain positive entries for the successful output
>   assignments and negative entries for all stolen input pages.
>   Committing the net delta to both tot_pages and node_tot_pages[] leaves
>   the accounting consistent with the pages the domain still owns.
> 
>   Post-assignment failure in guest_physmap_add_page() or while copying the
>   new frame number back to the guest: at this point the output extent has
>   already been assigned to the domain and the input pages for the chunk
>   have already been freed. Input and output page counts are therefore
>   equal, so the committed update only redistributes per-node counts and
>   leaves tot_pages unchanged.

This commit message is way, way, too long and dense.  We need to
exercise some restrain and summarize the important bits.

> A functionally equivalent version of this change is included in the
> XenServer 9 pre-release and is widely exercised there. Debug Xen
> builds with the added consistency checks are also used in internal
> end-to-end regression testing (XenRT). For upstream submission, the
> change was additionally updated to support non-NUMA Xen builds and
> reviewed again for correctness, including the failure paths.

IMO the mentioning of XenServer 9 or XenRT should be a post-commit
message.

> Fixes: 4dff228603ba ("Walking the page lists needs the page_alloc lock")
> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>

It's not acceptable to change the original SoB, Alejandro SoB on this
patch is:

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

And it must be kept this way.

> Signed-off-by: Marcus Granado <marcus.granado@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
> Brief history of this code base: Work was started by Marcus Granado,
> adding per-node accounting to domain_adjust_tot_pages() using work
> by Alejandro Vallejo <alejandro.garciavallejo@amd.com> as basis.
> 
> In a 2nd phase, Bernhard Kaindl and Roger Pau Monné implemented
> accumulating of per-node deltas in memory_exchange(), including
> handling across failure paths and consistency checks of the page
> counters after each update with CONFIG_DEBUG enabled. Bernhard
> updated dump_numa() to replace walking d->page_list under lock
> and Roger fixed handling of hypercall preemption. Andrew Cooper
> participated in this phase as well and Joash Robinson tested using
> end-to-end tests exercising debug-key 'u' and checking its output.
> 
> In a 3rd phase, Bernhard Kaindl added explanatory comments, prepared
> this commit message for review, fixed a failure path that can occur
> when memory_exchange() fails mid-exchange due to OOM, fixed the code
> for non-NUMA builds and consolidated loops that apply accumulated
> deltas into a single helper.

Why do you speak of yourself in 3rd person on the post-commit remark?

> ---
>  xen/arch/x86/mm.c             |  3 +-
>  xen/arch/x86/mm/mem_sharing.c |  4 +-
>  xen/common/domain.c           |  9 ++++
>  xen/common/grant_table.c      |  4 +-
>  xen/common/memory.c           | 79 +++++++++++++++++++++++++----------
>  xen/common/numa.c             | 14 +------
>  xen/common/page_alloc.c       | 40 ++++++++++++++++--
>  xen/include/xen/mm.h          | 12 +++++-
>  xen/include/xen/sched.h       | 24 +++++++++++
>  9 files changed, 143 insertions(+), 46 deletions(-)
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index a158379e7734..a723a2c50a2f 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4445,7 +4445,8 @@ int steal_page(
>      page_list_del(page, &d->page_list);
>  
>      /* Unlink from original owner. */
> -    if ( !(memflags & MEMF_no_refcount) && !domain_adjust_tot_pages(d, -1) )
> +    if ( !(memflags & MEMF_no_refcount) &&
> +         !domain_adjust_tot_pages(d, page_to_nid(page), -1) )
>          drop_dom_ref = true;
>  
>      nrspin_unlock(&d->page_alloc_lock);
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 5c7a0ff30e8b..89ae418be0ae 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -723,7 +723,7 @@ static int page_make_sharable(struct domain *d,
>      if ( !validate_only )
>      {
>          page_set_owner(page, dom_cow);
> -        drop_dom_ref = !domain_adjust_tot_pages(d, -1);
> +        drop_dom_ref = !domain_adjust_tot_pages(d, page_to_nid(page), -1);
>          page_list_del(page, &d->page_list);
>      }
>  
> @@ -769,7 +769,7 @@ static int page_make_private(struct domain *d, struct page_info *page)
>      ASSERT(page_get_owner(page) == dom_cow);
>      page_set_owner(page, d);
>  
> -    if ( domain_adjust_tot_pages(d, 1) == 1 )
> +    if ( domain_adjust_tot_pages(d, page_to_nid(page), 1) == 1 )
>          get_knownalive_domain(d);
>      page_list_add_tail(page, &d->page_list);
>      nrspin_unlock(&d->page_alloc_lock);
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 8cb4241b0511..0b6afba2acdb 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1558,6 +1558,15 @@ void domain_destroy(struct domain *d)
>      /* Remove from the domlist/hash. */
>      domlist_remove(d);
>  
> +    /*
> +     * Final invariant check: all pages still owned by the dying domain must
> +     * be accounted for per-node before complete_domain_destroy() reclaims
> +     * them.  Debug-only; expands to a no-op in production builds.
> +     */

This should be a single line comment if anything:

/* Ensure per-node page counts match global one. */

> +    nrspin_lock(&d->page_alloc_lock);
> +    assert_numa_page_count(d);
> +    nrspin_unlock(&d->page_alloc_lock);
> +
>      /* Schedule RCU asynchronous completion of domain destroy. */
>      call_rcu(&d->rcu, complete_domain_destroy);
>  }
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index ac9fed600101..298662c3d69e 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -2404,7 +2404,7 @@ gnttab_transfer(
>          }
>  
>          /* Okay, add the page to 'e'. */
> -        if ( unlikely(domain_adjust_tot_pages(e, 1) == 1) )
> +        if ( unlikely(domain_adjust_tot_pages(e, page_to_nid(page), 1) == 1) )
>              get_knownalive_domain(e);
>  
>          /*
> @@ -2430,7 +2430,7 @@ gnttab_transfer(
>               * page in the page total
>               */
>              nrspin_lock(&e->page_alloc_lock);
> -            drop_dom_ref = !domain_adjust_tot_pages(e, -1);
> +            drop_dom_ref = !domain_adjust_tot_pages(e, page_to_nid(page), -1);
>              nrspin_unlock(&e->page_alloc_lock);
>  
>              if ( okay /* i.e. e->is_dying due to the surrounding if() */ )
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 9e4899f9fc63..00eeaf33aefc 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -673,6 +673,14 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>      struct domain *d;
>      struct page_info *page;
>  
> +    /*
> +     * Deferred accounting for the current exchange chunk.  Keep it at
> +     * function scope because the fail: path also needs to commit or cancel
> +     * partial work.  domain_commit_page_deltas() clears applied entries, so
> +     * each new chunk starts with a zeroed accumulator.

This is way to verbose: you don't need to mention it must be kept at
function scope, as it's obvious by it's usage.  Regarding the zeroing,
you might also zeor at the start of each chunk, and avoid doing it in
domain_commit_page_deltas() if you think that would be clearer (and
forego the need of a comment to clarify).

> +     */
> +    long node_tot_pages_adjustments[MAX_NUMNODES] = {};
> +
>      if ( copy_from_guest(&exch, arg, 1) )
>          return -EFAULT;
>  
> @@ -822,6 +830,12 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>                  }
>  
>                  page_list_add(page, &in_chunk_list);
> +                /*
> +                 * steal_page() with MEMF_no_refcount removes ownership but
> +                 * leaves the domain page counts unchanged; record the
> +                 * deferred -1 for this page's node.
> +                 */
> +                node_tot_pages_adjustments[page_to_nid(page)]--;
>  #ifdef CONFIG_X86
>                  put_gfn(d, gmfn + k);
>  #endif
> @@ -870,32 +884,31 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>              if ( assign_page(page, exch.out.extent_order, d,
>                               MEMF_no_refcount) )
>              {
> -                unsigned long dec_count;
> -                bool drop_dom_ref;
> -
>                  /*
> -                 * Pages in in_chunk_list is stolen without
> -                 * decreasing the tot_pages. If the domain is dying when
> -                 * assign pages, we need decrease the count. For those pages
> -                 * that has been assigned, it should be covered by
> -                 * domain_relinquish_resources().
> +                 * Input pages for this chunk were stolen and freed without
> +                 * decreasing tot_pages.  Output extents already assigned
> +                 * before this failure will be released later by
> +                 * domain_relinquish_resources().  Commit the relative deltas
> +                 * now so concurrent reservation changes made under
> +                 * page_alloc_lock are preserved.  The net delta is strictly
> +                 * negative on this branch, so a zero post-commit tot_pages
> +                 * means the last reference must be dropped.
>                   */
> -                dec_count = (((1UL << exch.in.extent_order) *
> -                              (1UL << in_chunk_order)) -
> -                             (j * (1UL << exch.out.extent_order)));
> -
> -                nrspin_lock(&d->page_alloc_lock);
> -                drop_dom_ref = (dec_count &&
> -                                !domain_adjust_tot_pages(d, -dec_count));
> -                nrspin_unlock(&d->page_alloc_lock);
> -
> -                if ( drop_dom_ref )
> +                if ( !domain_commit_page_deltas(d, node_tot_pages_adjustments) )
>                      put_domain(d);
>  
>                  free_domheap_pages(page, exch.out.extent_order);
>                  goto dying;
>              }
>  
> +            /*
> +             * assign_page() with MEMF_no_refcount gives ownership without
> +             * updating the domain page counts; record the deferred extent
> +             * size for this output node.
> +             */
> +            node_tot_pages_adjustments[page_to_nid(page)] +=
> +                1UL << exch.out.extent_order;
> +
>              if ( __copy_from_guest_offset(&gpfn, exch.out.extent_start,
>                                            (i << out_chunk_order) + j, 1) )
>              {
> @@ -915,8 +928,19 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>          }
>          BUG_ON( !(d->is_dying) && (j != (1UL << out_chunk_order)) );
>  
> +        /*
> +         * If publishing output GFNs failed after assignment, fail: still
> +         * needs to commit the zero-net per-node redistribution.
> +         */
>          if ( rc )
>              goto fail;
> +
> +        /*
> +         * Success: commit the per-node redistribution.  The helper also
> +         * applies the deltas to tot_pages; the final value is unchanged
> +         * because the exchange is size-neutral.
> +         */
> +        domain_commit_page_deltas(d, node_tot_pages_adjustments);
>      }
>  
>      exch.nr_exchanged = exch.in.nr_extents;
> @@ -925,22 +949,31 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>      rcu_unlock_domain(d);
>      return rc;
>  
> -    /*
> -     * Failed a chunk! Free any partial chunk work. Tell caller how many
> -     * chunks succeeded.
> -     */
> +    /* Failed a chunk.  Free partial work and report completed chunks. */
>   fail:
>      /*
>       * Reassign any input pages we managed to steal.  NB that if the assign
>       * fails again, we're on the hook for freeing the page, since we've already
> -     * cleared PGC_allocated.
> +     * cleared PGC_allocated.  A successful reassignment cancels the -1 that
> +     * was recorded when the page was stolen.
>       */
>      while ( (page = page_list_remove_head(&in_chunk_list)) )
> +    {
>          if ( assign_pages(page, 1, d, MEMF_no_refcount) )
>          {
>              BUG_ON(!d->is_dying);
>              free_domheap_page(page);
>          }
> +        else
> +            node_tot_pages_adjustments[page_to_nid(page)] += 1;
> +    }
> +
> +    /*
> +     * Commit remaining deltas.  If all stolen pages were reassigned, this is
> +     * a zero-net update.  Otherwise the domain is dying and unreassigned
> +     * pages are deducted.
> +     */
> +    domain_commit_page_deltas(d, node_tot_pages_adjustments);
>  
>   dying:
>      rcu_unlock_domain(d);
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index ad75955a1622..9f38145579e0 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -737,26 +737,14 @@ static void cf_check dump_numa(unsigned char key)
>      printk("Memory location of each domain:\n");
>      for_each_domain ( d )
>      {
> -        const struct page_info *page;
> -        unsigned int page_num_node[MAX_NUMNODES];
>          const struct vnuma_info *vnuma;
>  
>          process_pending_softirqs();
>  
>          printk("%pd (total: %u):\n", d, domain_tot_pages(d));
>  
> -        memset(page_num_node, 0, sizeof(page_num_node));
> -
> -        nrspin_lock(&d->page_alloc_lock);
> -        page_list_for_each ( page, &d->page_list )
> -        {
> -            i = page_to_nid(page);
> -            page_num_node[i]++;
> -        }
> -        nrspin_unlock(&d->page_alloc_lock);
> -
>          for_each_online_node ( i )
> -            printk("    Node %u: %u\n", i, page_num_node[i]);
> +            printk("    Node %u: %u\n", i, d->node_tot_pages[i]);

You are not holding any lock here (which I guess it's fine, because
this is just debug info), and hence you could call
process_pending_softirqs() while iteration over the nodes if you think
this might be an issue, ie:

nodeid_t nr = 0;
[...]
for_each_online_node ( i )
{
    printk("    Node %u: %u\n", i, d->node_tot_pages[i]);
    if ( !(++nr % 0x3f) )
        process_pending_softirqs();
}

>  
>          if ( !read_trylock(&d->vnuma_rwlock) )
>              continue;
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 1801afc96a0a..ab6f44a3f993 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -520,14 +520,45 @@ static unsigned long avail_heap_pages(
>      return free_pages;
>  }
>  
> -unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
> +unsigned long domain_adjust_tot_pages(struct domain *d, nodeid_t node,
> +                                      long pages)
>  {
>      ASSERT(rspin_is_locked(&d->page_alloc_lock));
>      d->tot_pages += pages;
>  
> +#ifdef CONFIG_NUMA
> +    ASSERT(node != NUMA_NO_NODE);
> +    ASSERT(node_online(node));
> +    d->node_tot_pages[node] += pages;
> +    assert_numa_page_count(d);
> +#endif
> +
>      return d->tot_pages;
>  }
>  
> +unsigned long domain_commit_page_deltas(struct domain *d,
> +                                        long adjustments[MAX_NUMNODES])
> +{
> +    unsigned long tot_pages;
> +    nodeid_t node;
> +
> +    nrspin_lock(&d->page_alloc_lock);
> +    for_each_online_node ( node )
> +        if ( adjustments[node] )
> +        {
> +#ifdef CONFIG_NUMA
> +            d->node_tot_pages[node] += adjustments[node];
> +#endif
> +            d->tot_pages += adjustments[node];
> +            adjustments[node] = 0;
> +        }
> +    assert_numa_page_count(d);
> +    tot_pages = d->tot_pages;
> +    nrspin_unlock(&d->page_alloc_lock);
> +
> +    return tot_pages;
> +}
> +
>  #ifdef CONFIG_SYSCTL
>  void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
>  {
> @@ -2924,7 +2955,7 @@ int assign_pages(
>              goto out;
>          }
>  
> -        if ( unlikely(domain_adjust_tot_pages(d, nr) == nr) )
> +        if ( unlikely(domain_adjust_tot_pages(d, page_to_nid(pg), nr) == nr) )
>              get_knownalive_domain(d);
>      }
>  
> @@ -3066,7 +3097,8 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>                  }
>              }
>  
> -            drop_dom_ref = !domain_adjust_tot_pages(d, -(1 << order));
> +            drop_dom_ref = !domain_adjust_tot_pages(d, page_to_nid(pg),
> +                                                    -(1 << order));
>  
>              rspin_unlock(&d->page_alloc_lock);
>  
> @@ -3274,7 +3306,7 @@ void free_domstatic_page(struct page_info *page)
>  
>      arch_free_heap_page(d, page);
>  
> -    drop_dom_ref = !domain_adjust_tot_pages(d, -1);
> +    drop_dom_ref = !domain_adjust_tot_pages(d, page_to_nid(page), -1);
>  
>      unprepare_staticmem_pages(page, 1, scrub_debug);
>  
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index b3a35c4bc8d6..0737df02eda2 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -68,6 +68,7 @@
>  #include <xen/types.h>
>  #include <xen/list.h>
>  #include <xen/spinlock.h>
> +#include <xen/numa.h>
>  #include <xen/perfc.h>
>  #include <public/memory.h>
>  
> @@ -131,7 +132,16 @@ mfn_t xen_map_to_mfn(unsigned long va);
>  int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
>  /* Claim handling */
>  unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
> -    long pages);
> +                                                   nodeid_t node, long pages);
> +/*
> + * Commit accumulated per-node page deltas to d->tot_pages and (under NUMA)
> + * d->node_tot_pages[] under page_alloc_lock.  Applied entries are cleared
> + * so the same accumulator can be reused for the next batch.  Returns the
> + * post-commit value of d->tot_pages; callers that may be releasing the last
> + * reference on the domain should drop it when the return value is zero.
> + */
> +unsigned long domain_commit_page_deltas(struct domain *d,
> +                                        long adjustments[MAX_NUMNODES]);

Given the (current) usage of domain_commit_page_deltas() it might be
better to simply return bool to signal whether the domain reference
should be released?  Callers don't care about the exact amount of
pages.

>  int domain_set_claim_entries(struct domain *d, uint32_t nr_entries,
>                               const struct xen_memory_claim *claim_set);
>  int domain_get_claim_entries(struct domain *d, uint32_t *nr_entries,
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index f671e0c4c7b3..ae50f523e9f5 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -620,6 +620,11 @@ struct domain
>      unsigned int last_alloc_node;
>      spinlock_t node_affinity_lock;
>  
> +#ifdef CONFIG_NUMA
> +    /* Distribution of tot_pages across NUMA nodes. */

It would be helpful to note this array is protected by the
page_alloc_lock lock.

> +    unsigned int node_tot_pages[MAX_NUMNODES];
> +#endif
> +
>      /* vNUMA topology accesses are protected by rwlock. */
>      rwlock_t vnuma_rwlock;
>      struct vnuma_info *vnuma;
> @@ -698,6 +703,25 @@ static inline unsigned int domain_tot_pages(const struct domain *d)
>      return d->tot_pages - d->extra_pages;
>  }
>  
> +/*
> + * Debug-only consistency check: the per-node page counts must sum to
> + * d->tot_pages.  Compiled out unless both NUMA and debug builds are
> + * configured; caller must hold page_alloc_lock.

This is way too verbose, and not very helpful.  It's obvious from the
guards below that the code is compiled out unless NUMA and DEBUG are
enabled.  I would just write:

/* Consistency check: ensure tot_pages == sum(node_tot_pages[]) */

> + */
> +static inline void assert_numa_page_count(const struct domain *d)
> +{
> +#if defined(CONFIG_NUMA) && defined(CONFIG_DEBUG)
> +    unsigned int i, node_total = 0;

i might be nodeid_t if we want to be type-accurate.

Thanks, Roger.

