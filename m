Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGjlAsfzxGlO5QQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:52:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15CC331A64
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 09:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263521.1555441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gRf-0003gD-Cn; Thu, 26 Mar 2026 08:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263521.1555441; Thu, 26 Mar 2026 08:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5gRf-0003dd-9Z; Thu, 26 Mar 2026 08:52:03 +0000
Received: by outflank-mailman (input) for mailman id 1263521;
 Thu, 26 Mar 2026 08:52:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1w5gRd-0003QQ-Vb
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 08:52:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5gRd-00FZYJ-Bb
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 09:52:01 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f3ab-5cb7-0a2a0a5109dd-0a2a45049bf0-14
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:52:01 +0100
Received: from [40.93.201.24]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <roger.pau@citrix.com>)
 id 69c4f3ae-c823-0a2a45040019-285dc9187e5b-4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 09:52:00 +0100
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by CH0PR03MB6130.namprd03.prod.outlook.com (2603:10b6:610:b9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Thu, 26 Mar
 2026 08:51:58 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 08:51:58 +0000
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
 b=ixNEF9S7/WD2t0p0E7Z2MvBrV7GdDsKKRz8FkckyZGJP4qRjLaoP1eYWKjC1QSaxntUQKxCtY6EzlxLh06jV8VCInL6b4tXOqeQ1he75eqXTVxFzjJ2wHOEudzHHk3KT3C5PG3Q3wUWV7y8Xux0jmqetK5wqAZiuog8mapRWJh2IE/LEXwf1VjN5gFxSCyBjJ7di83AgdMbOmCI++j2XDETMZLjCpfIKTmSZoAaTMFySnAHJ7+UMhWOI+lfQZnLv+5aZsqQOuVqCt63sfHRkTghrsph3yumOb1iAwf9WRo3s685W8SHU1DDLAtGwx2oUGYf/WfQefZitVJs1brV/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZ1xpzEDrW0cINW1Khcas9uTksBFZTXi7/cO4ecCji4=;
 b=eNcuihLyHMR5QnKVmbBTmAEA9LPuhmFCy1aMHWrU2U2ZlCkGtlNoLp3vLvV9YvLfBsHVfWflSQ+VvZHhivnUvJWw/tfJaATee3pE5AaDwErjXWizeKVPAuTx9dUC9TwBcGP9hPzlHFI/+Fvto3e8TdBNigTPGvzrRG90sA90Bigpp6+hqt2yQxMAZD2Hu9JlX2uVJVGaW8M5VV/RqXr7hlUOxKAE2Nb3YAPJ9WeXzp8lEYH+X1GHv8pIQHx3CTDscaCH6tNOCn1sVSJOG896DzF91j/Jl0xPQNqzGfZfzzN8QISg7bh3+k02ZOdAC1iXoQsEMDFLGSrprm8+l6Bttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kZ1xpzEDrW0cINW1Khcas9uTksBFZTXi7/cO4ecCji4=;
 b=G/e2I45xT77TvltnP5wP9pgjYa1e1EIpAItskEtqV6JJKwDR5UUwzNHCQeb4/Y/ZmWpOXJb255FVodNa+Q0NRB23NUGnwWN5OvZb31uZGWIebdZoWu49K8H2MfZRv6EknAUuXMWr/X1o1dsKyU+o0PZ531xgZudeO48EQTf9Wjc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Ayden Bottos <aydenbottos12@gmail.com>
Subject: [PATCH v2 1/3] xen/mm: don't unconditionally clear PGC_need_scrub in alloc_heap_pages()
Date: Thu, 26 Mar 2026 09:51:43 +0100
Message-ID: <20260326085145.61380-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326085145.61380-1-roger.pau@citrix.com>
References: <20260326085145.61380-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR1P264CA0016.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::21) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|CH0PR03MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3f3dd9-fd7e-429c-f791-08de8b14f01b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	k8chdTFuHChl3+OOkx+z92ASZPXRafM8TWB9CztnM9KfInOSXYqUrBa9H5XuZCfeGQklStr+xrqQ2sOkaQN/yYbZ9MSSZiXjseuzU3GwnZMaQb1SfhFZj9YaiH98oTqHM+u1oSmPjjbZs8k6RGfYDZ5qVfs8D5ow4Ormp5iqDBNchAzX1As5N+BnbtuMQfDFFSUJIkYqplA4cda8izKR0TJv1zkHxpP1LQNRciKdtJscV5TS0YaEwM4T+FP8AIGYnXz3lbyCqGRx0gXA6AHQGgljrFe8eyfNhy37GdFWzaOJp4xCEgrnGi38z+AA5LIUmSoBx9iI7nnJAbwj2eJyCvGlfF84UwxR//cM3Yzf8q2RULH7rNFKoq2pX8h68oIiz6Z3Y/b+bbIFF4wNG/Jpd1KeG0eQTb9ky2IjNUsc3FDKKYxFfmUVMtSSqdfm+Kc7tvLHQjjKqd2S3ErPHh227Fqm85LhUjf4hDHDdAswO0ggZn+7mX7ad2RgdFBbWoGTS0iOW48gW8wPE1Dv5fDWMnepE9UcB9kgkFb7nOb0xEQSy6FLHNbIKPohlFLhkvLDdjdBuSJtDx2RJgvJ/phvYxrnUkZFY0O3R6byEkDX/9eZtcvc4a58YWbl71ju6AQsz74CpBiDzvfvKxNJymN6UdomdbP4mwL297OIXLDk/YOJB9uHG+ppepVAz3nu+k0gCvNCiDPKWihSWIzMrsUXCz4akBTwUCBjFBhJ2PUzzco=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjliVEg2c2JNNUswa1dDa3ZXdFVaYjh2Qyszc2NERmtEOHFSaWV0Z0kyS09X?=
 =?utf-8?B?cXpHQnR5SlJRUTArSnpiZ2VqUmdMcVpEbGdzY0NxalhiUlRBRTNwS0VkTUR6?=
 =?utf-8?B?Umo4UExvTmVwRm1nOElaRmdvVWJZV0FhaUt5NFliTEdRVm9QaUp6aVhzM2pp?=
 =?utf-8?B?UlcxSzJqcUU5eVh0RHNJOVU2UFVtSXJEUFNzQ2pJcGRJbFZLOWxoZzVMTmFx?=
 =?utf-8?B?b2FxZFlkY3VwNnRCcEo0THNGMFg0M1ZKMng1SVUxbGlzY2RvQksvQTcwYXVz?=
 =?utf-8?B?eFpaL3MxdUsxSk96dm1mQWIxUFNpQ1JUSXR0NFBBaE1CeUNCUlNha3RQb2FQ?=
 =?utf-8?B?eXJWaEpGbnlVN3I0MkV2Q2xYZEJaVDV6UUU5aFlpeTF1WU81QWRTZlc5cjMw?=
 =?utf-8?B?R2VOWTg1aytwYllpb2Z2QjZFR2xNQTNBd0xNaDVieVZDME0zREMwSC9sNU9u?=
 =?utf-8?B?bzhLQXhLZWNGMm54VWVQNHlWZnl3TldEUDlqZGQwdGNsQjRFNmU3RVlVc0xH?=
 =?utf-8?B?Y3U2V0FCRjIwamVXQURUakJSWnJaL0l1eG4xNjRuc0ZXOEhNNWdWM0k5bVVO?=
 =?utf-8?B?UDBmNXF2Wjk4OU5qMkM1TzVualc1amdFMGJ4OWd5ZU9PMktiSkVaOGlzdG9s?=
 =?utf-8?B?NS9PUVNDYVF1WUdKaHM3ZTl5Z3hhUnFFRTJkd2dHUldRd3F5WnlOc0ZacjZL?=
 =?utf-8?B?QkF6ZDNIS2JPQ3E0Y0R5ay82ajJRMjdXbGNqczZPNVd1cWJXN0lCQXRRZFp4?=
 =?utf-8?B?U0duRWpybWk5cmJnRjJLVmlXRG0wU1FGRS9nNU4vTCtjTnBrdlFhQW1jWXpj?=
 =?utf-8?B?dTczMWVOZGRFbm5TNTBTcGV4aktEbk5BdzRLVWYzaGY0TER6SUFndlBPZ2pL?=
 =?utf-8?B?dDB1VHNRU2pHc0RzOC9sMGlJS2xWT0NZdjJzb0hvRXJFRXlzUUNTMjFsRVVY?=
 =?utf-8?B?VHN3cXVFMkFIM2VLc2I1R09kU2xwK28yRE42N0dMOUlUQW1YMVFHQ3VEUmV5?=
 =?utf-8?B?USt3UlhVZnRrVWtnY0ZOQ1Nqay90ZkJHTVJUUXVlQ0g1cXJ6VGZvRWE3dU9E?=
 =?utf-8?B?Wm83Rko3ZVZqd3JDb3FtQnlKbkVXL2ZSWG0rdTRMV3l0OXV6QmZYK1A4dmps?=
 =?utf-8?B?N0hHMFMxU1QrdmFUTVc4WWZFOWs0Z1FVZWFYSUN2Y1ZIZGUwSDhuZjIzam9j?=
 =?utf-8?B?S1RHay9oSkFFaHlOajdob2lEV2tzdGhIYmw2cDBXVTRqbjJNTmFKOXFLTGFK?=
 =?utf-8?B?NERRdTJFNHZqdkNsTnIwMit3MHFVUlRac1NLU3BRUFFhbExVUnVESFhVZDlX?=
 =?utf-8?B?SlBaQjZJMFpWQTdpc0FoazRCR2VsVTU1YWRsRUVXc2p0Q1RVdWthUVFTLzRW?=
 =?utf-8?B?Nm0vcXk3QmIvNmZzSThicldtN28zV0tnUEIvRnNiVDRmTWVncXgwT1BoY3FW?=
 =?utf-8?B?WkgyM0RMc0pIdVZBTlRaSTh0Z0ZrYzRhNGpYWUFhWmNCRmdVUHdpVFJGNnBH?=
 =?utf-8?B?WDl4cGY2YzM2cnJyRnpNMm5OYjBxN05IWHd0aFNMbFp3MWlOTHNqV0FBbVU5?=
 =?utf-8?B?dW94UkgvUDdlNDlBcUxIK3pnaUNKRElQVCtzc2hYQjQrbUc2OGVUVkI4SlZw?=
 =?utf-8?B?N3JMSllNSExoOVFxVXRQMm5DZ1p0WUUzMTlNcCtiYURtaWpHK0t2bVB5TDIx?=
 =?utf-8?B?dGlUVTJDVGp6YXgxdVQ3ZEthU1lyNVh4bmthQWlMdDJJU2dqWjE1MVczMGI4?=
 =?utf-8?B?TkNiQjBMVE8yRHVqWThiTW1aNmd2UlF5NXZRRWJtQXRiRFUxMEpGUlA0Y1Nh?=
 =?utf-8?B?SHZYNDBvd2pXa0pVQ21sZzNJRVZNdFhpNkVQMVZVZ1lpcnhCZnhDY1pNU1FU?=
 =?utf-8?B?T2ZzS29SSmM3ZGZqejhrcjAycGJ4VkNyS0FrVWlEYnJQK2lqUm1oVXkvMGY2?=
 =?utf-8?B?M2JWTlFOYWpEZmIxWXRNUDJSNm1LeUUwVWNkK2lBRGhEV1l0Szdpcnc4ZTBl?=
 =?utf-8?B?Qm1zOXFkbU96R1BURlVwOXc3V2JvQ29KREhLNGt0ano2MFg0QWJ3alFBbDJD?=
 =?utf-8?B?STBZeUNhNzFTQXJ4UXlySmtKcHlrcUFXSXRIbjNpakNPWjh0ZlRtanpFbnBm?=
 =?utf-8?B?STNkd3lTTXRXSzJSU0xPZFFhZ3ZwNDc1WVZEdG9mbDVKMEVxZnpxOGMyd0N4?=
 =?utf-8?B?QWJ2amFOYTRWV3JnUGo1M0NiS2xLVkR2UkZScjBDMVVjUFZYdGkyaDhabHNv?=
 =?utf-8?B?V1dDUVc3Nis0VDBBWDg1Nm1hRmJ2c3BsOUVpNnVPS3ZvMFVXeW42RVVaQVN3?=
 =?utf-8?B?N3JCRVFXZ3F3TC8vTHN3elgxejZlK0F2VXFxTlhncm12TThnTzFZZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3f3dd9-fd7e-429c-f791-08de8b14f01b
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:51:57.9096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aN7lAJfHuYPPSfC8K0YJZNq6nj9q9AFX532+4S7I99SwafmnCLtCHi70BAh3uvH3CW0O9dbQWyMDKK7ntUwVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6130
X-purgate-ID: tlsNG-ebf023/1774515121-B3A969D1-C722C90D/0/0
X-purgate-type: clean
X-purgate-size: 4706
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,amd.com,suse.com,xen.org,kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:aydenbottos12@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B15CC331A64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

alloc_heap_pages() will unconditionally clear PGC_need_scrub, even when
MEMF_no_scrub is requested.  This is kind of expected as otherwise some
callers will assert on seeing non-expected flags set on the count_info
field.

Introduce a new MEMF bit to signal to alloc_heap_pages() that non-scrubbed
pages should keep the PGC_need_scrub bit set. This fixes returning dirty
pages from alloc_domheap_pages() without the PGC_need_scrub bit set for
populate_physmap() to consume.

With the above change alloc_domheap_pages() needs an adjustment to cope
with allocated pages possibly having the PGC_need_scrub set.

Fixes: 83a784a15b47 ("xen/mm: allow deferred scrub of physmap populate allocated pages")
Reported-by: Ayden Bottos <aydenbottos12@gmail.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/memory.c     |  3 ++-
 xen/common/page_alloc.c | 31 ++++++++++++++++++++++---------
 xen/include/xen/mm.h    |  3 +++
 3 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 918510f287a0..f0ff1311881c 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -345,7 +345,8 @@ static void populate_physmap(struct memop_args *a)
                 unsigned int scrub_start = 0;
                 unsigned int memflags =
                     a->memflags | (d->creation_finished ? 0
-                                                        : MEMF_no_scrub);
+                                                        : (MEMF_no_scrub |
+                                                           MEMF_keep_scrub));
                 nodeid_t node =
                     (a->memflags & MEMF_exact_node) ? MEMF_get_node(a->memflags)
                                                     : NUMA_NO_NODE;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 588b5b99cbc7..1316dfbd15ee 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -989,6 +989,8 @@ static struct page_info *alloc_heap_pages(
     ASSERT(zone_lo <= zone_hi);
     ASSERT(zone_hi < NR_ZONES);
 
+    ASSERT(!(memflags & MEMF_keep_scrub) || (memflags & MEMF_no_scrub));
+
     if ( unlikely(order > MAX_ORDER) )
         return NULL;
 
@@ -1110,17 +1112,26 @@ static struct page_info *alloc_heap_pages(
     {
         bool cold = d && d != current->domain;
 
-        for ( i = 0; i < (1U << order); i++ )
+        if ( !(memflags & MEMF_no_scrub) )
         {
-            if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
+            for ( i = 0; i < (1U << order); i++ )
             {
-                if ( !(memflags & MEMF_no_scrub) )
+                if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
+                {
                     scrub_one_page(&pg[i], cold);
-
-                dirty_cnt++;
+                    dirty_cnt++;
+                }
+                else
+                    check_one_page(&pg[i]);
             }
-            else if ( !(memflags & MEMF_no_scrub) )
-                check_one_page(&pg[i]);
+        }
+        else
+        {
+            for ( i = 0; i < (1U << order); i++ )
+                if ( (memflags & MEMF_keep_scrub)
+                     ? test_bit(_PGC_need_scrub, &pg[i].count_info)
+                     : test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
+                    dirty_cnt++;
         }
 
         if ( dirty_cnt )
@@ -2696,8 +2707,10 @@ struct page_info *alloc_domheap_pages(
 
             for ( i = 0; i < (1UL << order); i++ )
             {
-                ASSERT(!pg[i].count_info);
-                pg[i].count_info = PGC_extra;
+                ASSERT(!(pg[i].count_info &
+                         ~((memflags & MEMF_keep_scrub) ? PGC_need_scrub
+                                                        : 0UL)));
+                pg[i].count_info |= PGC_extra;
             }
         }
         if ( assign_page(pg, order, d, memflags) )
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index d80bfba6d393..5e786c874a73 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -208,6 +208,9 @@ struct npfec {
 #define  MEMF_no_refcount (1U<<_MEMF_no_refcount)
 #define _MEMF_populate_on_demand 1
 #define  MEMF_populate_on_demand (1U<<_MEMF_populate_on_demand)
+/* MEMF_keep_scrub is only valid when specified together with MEMF_no_scrub. */
+#define _MEMF_keep_scrub  2
+#define  MEMF_keep_scrub  (1U << _MEMF_keep_scrub)
 #define _MEMF_no_dma      3
 #define  MEMF_no_dma      (1U<<_MEMF_no_dma)
 #define _MEMF_exact_node  4
-- 
2.51.0


