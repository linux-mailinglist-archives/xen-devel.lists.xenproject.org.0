Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIeCFtOoHWp+cwkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C363D621F67
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 17:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1323939.1589620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oF-0006Qu-8S; Mon, 01 Jun 2026 15:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1323939.1589620; Mon, 01 Jun 2026 15:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU4oF-0006Pu-46; Mon, 01 Jun 2026 15:44:11 +0000
Received: by outflank-mailman (input) for mailman id 1323939;
 Mon, 01 Jun 2026 15:44:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wU4oE-0006P3-Aj
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 15:44:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU4oD-00BHey-Nr
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:44:09 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8c8-e002-0a2a0a5209dd-0a2a4505dc48-4
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:09 +0200
Received: from [40.93.198.34]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a1da8c7-aaa8-0a2a45050019-285dc622e7f9-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 17:44:09 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BN8PR03MB5027.namprd03.prod.outlook.com (2603:10b6:408:db::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 15:44:05 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 15:44:05 +0000
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
 b=pEp7C70pj+Jz+Hcs9cXrk9OuxDKbk117A4/OaTRt2vTDQmeQ250y/Xf5iZA5ZkgPbwb2j+BlJ4CFGS/l9YH75CGL4Co/tONN4QLXH7x38Pg2tKTHYkS2DVhYCZKZvmmkb99y3NtE52fJEIQj5PXcQKppaaSJa/MZb6AnpwDwIx7qXZZZpFVe1WNdG08fHtSmaFgIn1H3xvuUNvT/dOZ6n0DyIaR6Bte1mMZQ0g2QksKmDYJthkBTpZllSOaBF8XWxiMXzYiorEarCY6Y0IQCuQv3MzXvMfe0zwR55O+qfY+DkdYrGRKSMqsqkqYP5QimJmvv4YdAgDBFtepfGsAxAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rz97qywwJLfTsLwGTN3c/x5dL1I1CWkX0dn7p+InnZs=;
 b=Y4n6j1P96/M/7S6Q7YbyPj1Q2DbG6wh0kazIXYPIIvxOH+cDOLhuI+Q9QCTRBRVbq5qnkNRXzfezhl4jdCwjdLVjrfMb24993bORt+QQulTBFnn1mDlZqf7LTrukwnARNbXAVe8YnBNat7AjZGOs6gIopzuyEaOqbrbgwiJwjc065r1d92pbetCBwjSXf25FDL+WWFZ80sEMgExEz5kFwp8JYm4B188Z27sRvtg1VfllTwQTqJyzPcT5Xfq9cTQ7X0bB307/+yCjCbP0Q/v2Ar5mZWwEmN6tppccHaXyX0/Ogutpl5MbgadLNvzFr33/nICFaQRZ7nfjWBQKWqemxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rz97qywwJLfTsLwGTN3c/x5dL1I1CWkX0dn7p+InnZs=;
 b=AMBzBG0NKXBe0azjNHV7tpab+03DCrRik5PJK1h+0BSc1znw2jlTvFFrOu04lKvFs/LULawqLSJM9O381bHqp7H5O50bd6fiAKMrSp09UiUf0fp7/j3Dgz3WR2ctQIyHb0YgCnQREeZjf7dtZcledVsmUoCwxVoRZDQ6FuPpkXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH for-4.22 2/5] tools/macros: adjust ROUNDUP() interface to match hypervisor
Date: Mon,  1 Jun 2026 17:43:29 +0200
Message-ID: <20260601154332.30797-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601154332.30797-1-roger.pau@citrix.com>
References: <20260601154332.30797-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0098.namprd03.prod.outlook.com
 (2603:10b6:408:fd::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BN8PR03MB5027:EE_
X-MS-Office365-Filtering-Correlation-Id: b0dee85a-29ac-41c2-8d85-08debff49c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CenyeQSKmY6qwazr0Nx5POgYu28gTHmSEznHbqU8yvlA6qfppvqTHdywbzBgZLVSirwx8whRIImvoUh7ngbuh4Fb7+t7hubYtZZJDShjGcDOhHsx583eS7MceudMgvipIhiCBP3hGTzNekJji5uvDP5Rd8N00EzBaLthDYdU9b+4JSccXRMGhlr8Uh/YqWRgo3ePIsmiymRBmTTER8syHWj/1W35HobIGCUanPbfPAjPeWvAfEs1FdggvWyEYQh9jeQbEh+7NbI0AG7xF1vkizmHGw0pY7Dh67QV0QOx0BJzlkaYZa0Q4s9u0F6rqd4WbEqYtGf3lb30X+rRyQ+EEeVroYWilcjMglIDgpoVakcKXg2t9gneKhz3+OQbwVAOEp/X9lw2kvtzNYrEjuXD8OulrtLsCcRI/HiNcFn6RD2IdUHAPVhqTDCqMrIufRZH4uUS1vHsSACdZgArEsYtjXFYc9Gz32W/W0cNxyiJTpGhXBOzqdGGenkh1eflAOzml0qLjGbf2Az8nA44mZ0C6J+wTHXRhtyYm93DGOEHkf8RuqqGtAV/ON//aY4pg0+sg56QP7rojSd4rUDKRZLN/6jtnXHaUrMoxYFEMjF49L+7K8VuWFfXL/o1ExDMi/u7TFYe5zqkOMZcELQcoAYso7uLPSXRL5SstiVbAAGiW2611lKapzaRL/tL1WE4GKX6
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWQ4dXozckJvVEJCUjl1cGdxbUZ4T1FsSmtGVlVlbmNOSU1zTmVRWmFpZXVN?=
 =?utf-8?B?RjdrZmdNeXVrK05veVpaS3J4TVcyU3B1QXBlNlI3bGtVMUZJd20zVjFobGV1?=
 =?utf-8?B?WFJOL200V2tUNjgzUSt5eWhWcDJjT2o0OHJJSVVXRTc4TWplR0JrUkxEb0lL?=
 =?utf-8?B?Y0ZYa1Fta2R0WUd5dWJOTGhjK1gvTTBha3AyTjQwYnJFdUtITTErRUR1UjdE?=
 =?utf-8?B?c2JzRWhzQVVoeExpb1dQaStuUnJHa0FZTWVkQTZIa0ZHSnFoeUNmQ1d1bnVp?=
 =?utf-8?B?b29aWUM1cThlMDNjWGxXeWFCdlVRbVZyN3M0TTQ0bmFCd0NzYWRxOXZRSEJk?=
 =?utf-8?B?ZW12UnYydzRUUmkxME12ZkZQZ29MKzFXU2hURnVMRkFCOW1hZUhiSUlGTXV3?=
 =?utf-8?B?TXVuOTZYRVYvVmZXT0YzMzFCWjYyakZBSk1KcisxdnBOdVBSVkVoaEg1OUZD?=
 =?utf-8?B?RUloZGY5NVZIZjAzdXc0M1dVS3NOQWVIRDFibEtrUmdPcWdNM1BiVTBjUFYr?=
 =?utf-8?B?ZnN1UjlXaUk3Mk1HUDVmZTk3VmFOV0hUNHNyUjBUT3hEYXBKZzZYS1VFUWpq?=
 =?utf-8?B?YmtzQWc3OEpES0NtRGw0dnErbE9UN1NHQnZpblc2K0Zaa0Zwb1I5Z2dDTWow?=
 =?utf-8?B?bDhkRWl4RUp4SlkwTjNqbkFZSXBPWDNoa2phRWhmYklDNUNSYXdPanZENDg4?=
 =?utf-8?B?cjFCRThhMFBXbVQrb3l2K2pWK1VrVGFFS1N4cXU1czVtSzJMVHBETTBncll0?=
 =?utf-8?B?ZlJ4ZU5XWmF3L0lqODFNZU95dnJyRjF1aVV1Tkdlb2dqVkpXTlNlaCtGR3M2?=
 =?utf-8?B?RWozVitacjJKU01IcmZ5RHcxVDhMUjhZQWtuNm8xVlA5SkhpQVpSMmFzWFhW?=
 =?utf-8?B?eU1EcU1ZVmRhRGYvM240WHpydnNabzkxNU1ZUVFmazdGTkNFQzlwVmlMVjVG?=
 =?utf-8?B?d095bjFRSDFpNXJ3K3QzOXlUWW5GUkNGeWphZjNpZ1JGSG56R0pvM0xIcXVy?=
 =?utf-8?B?VEdib3BZdGZjZVhtVUtLWGYvZHgrdkZZSkF2VzZ0SEZUMnhwcHYvQWgxNmZr?=
 =?utf-8?B?eTF6TWExeXZqOWNkblFMeVQ0YUt2TlVUK0Q0cUNwYUZQbjZUVXJwb2p5NnJ0?=
 =?utf-8?B?WjhRaEVvYlkxREpqQ2gzcFhINXZmeGZWSWV4M0lUemNjVHYwRGlGaTRZQit6?=
 =?utf-8?B?ZmozWHNYUitBT0JkZFJZNW16Y0hKNmtIL0FUaVJZQlNVUmNUUHRibU9DYm56?=
 =?utf-8?B?Q0hINTdpZXlyQkFlMnArRTZPYWJobmtOOVhqRzBCeEN6Wm50cEt5R093K3o0?=
 =?utf-8?B?RERZdnNDeVlHK1ZLRmN4d3Bwb1MvNE1USytpS25kZnJQbTI5OFBBei9ZeHE4?=
 =?utf-8?B?UFlQZ0N4K2J1eFdWc1AvWSsxYmg3TWRMUHFrbUdZU3FjNjBxaEF2YnRvdUhv?=
 =?utf-8?B?SHB2VDFYOUdISmhKT1lodWtvNUIwa0Rka29scTlOcDQwRlpWbzB2amc4c1NU?=
 =?utf-8?B?SFQrUmdEWVNndXpOMHpHTHRqYlBuMWlNVHVFcVpKK1d1ZG1CdTlYVHV1YmJp?=
 =?utf-8?B?UXFDSFg0SkFYOFNyaThiSHd4NTk0Z3RaK2VLL2hZZ3YvMi9hYTE4M29ldlg2?=
 =?utf-8?B?bnVhdCt2cnk5Qk01Z0xFMlhUNXp0SnhPMUdHWkZ4MGNsY0RUM25FaVo5Z2c4?=
 =?utf-8?B?NHlzc2lld1FLTENBd0V2SlRZaGNGcVBuelN0bzJJdDJ2ZXpiR3AyNlhmT0xw?=
 =?utf-8?B?SnFLbjdBMTJFMFdxNmlnNVlMdWRpWWNmdTlUQkFBayt6dWdaZGNTYXNTTExN?=
 =?utf-8?B?bGprQWRQbmg2QVVzRlZFOWNObXkyUEpxcHY3dHUvckpPNlRONjRpRlF1QVY2?=
 =?utf-8?B?NjlGSDhWQmhnUXZERG5GMGxmV3lHQk1xODB1d1FSR0l2LzlSNEJWSVRDeG54?=
 =?utf-8?B?ektUNDJtdjA3THphdFEvVEhmZ0dqNGR2NVFIclpOUCttK2w4UDMrTFhIVjU2?=
 =?utf-8?B?MG1HSjhpYkY0ZGxMVlJHbC9aRzlNMzMvb2ZtV2pyQ3YxemF4T3hTVnVDWXFo?=
 =?utf-8?B?bHR3S25ucTZ0TE13NzJIZzZ3SG1tL0dUNnF0RlNhZzNVUDZ1VXVPZ1ZMU0E0?=
 =?utf-8?B?T3BDVzNoc2JSYzhsL0labU1VMVZLcS9ITER3UU1hc2xta2xWV3pGQjZMQTFB?=
 =?utf-8?B?cTJsZVlnWVZ3amlzcmRHMDNVNUV3NGVqeHo3SW5aR1FmTlZqbElVSEVtbnEr?=
 =?utf-8?B?RG1vYlVpSTVESmtYajBVei9mb0ZrbnFWdjFGc1J6MVNzd1lDZml6SldJSUI2?=
 =?utf-8?B?Q2F2U0hTc2NFSEh1ZjZodUlqYk84RGkzNWVWUzFVb1AwZ2VGQ3JiZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dee85a-29ac-41c2-8d85-08debff49c8d
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 15:44:05.4547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yopaAGplkIF4jPcmvsvl0gN+IvTEjlEb8mwSwrn7N11WmKa+4eS1vd0as2S9eSeYLedHpIdOR0JAVv7UlEisGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5027
X-purgate-ID: tlsNG-c201ff/1780328649-E119B443-F488259D/0/0
X-purgate-type: clean
X-purgate-size: 19673
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,suse.com,recoil.org,xen.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:jgross@suse.com,m:christian.lindig@citrix.com,m:dave@recoil.org,m:julien@xen.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C363D621F67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adjust user-space callers to use the new interface.  No functional change
intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/console/daemon/io.c                 |  2 +-
 tools/include/xen-tools/common-macros.h   |  4 +---
 tools/libs/call/buffer.c                  |  3 ++-
 tools/libs/foreignmemory/linux.c          |  2 +-
 tools/libs/gnttab/freebsd.c               |  2 +-
 tools/libs/gnttab/linux.c                 |  2 +-
 tools/libs/guest/xg_core.c                |  2 +-
 tools/libs/guest/xg_dom_arm.c             |  6 +++---
 tools/libs/guest/xg_dom_x86.c             |  2 +-
 tools/libs/guest/xg_private.h             |  4 ++--
 tools/libs/guest/xg_sr_common.c           |  6 +++---
 tools/libs/guest/xg_sr_stream_format.h    |  2 +-
 tools/libs/light/libxl_arm_acpi.c         | 24 +++++++++++------------
 tools/libs/light/libxl_create.c           |  2 +-
 tools/libs/light/libxl_sr_stream_format.h |  2 +-
 tools/libs/light/libxl_stream_read.c      |  2 +-
 tools/libs/light/libxl_stream_write.c     |  4 ++--
 tools/misc/xen-mfndump.c                  |  2 +-
 tools/ocaml/libs/xc/xenctrl_stubs.c       |  2 +-
 tools/xenstored/core.c                    |  4 ++--
 tools/xenstored/domain.c                  |  9 +++++----
 tools/xenstored/watch.c                   |  2 +-
 22 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/tools/console/daemon/io.c b/tools/console/daemon/io.c
index 43d4973c247c..b6c46d11dea7 100644
--- a/tools/console/daemon/io.c
+++ b/tools/console/daemon/io.c
@@ -1233,7 +1233,7 @@ static int set_fds(int fd, short events)
 		/* Round up to 2^8 boundary, in practice this just
 		 * make newsize larger than current_array_size.
 		 */
-		newsize = ROUNDUP(nr_fds + 1, 8);
+		newsize = ROUNDUP(nr_fds + 1, 1U << 8);
 
 		new_fds = realloc(fds, sizeof(struct pollfd)*newsize);
 		if (!new_fds)
diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index 9838a108aaea..9e2799178235 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -68,9 +68,7 @@
     })
 #endif
 
-#ifndef ROUNDUP
-#define ROUNDUP(_x,_w) (((unsigned long)(_x)+(1UL<<(_w))-1) & ~((1UL<<(_w))-1))
-#endif
+#define ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
 
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
 #define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
diff --git a/tools/libs/call/buffer.c b/tools/libs/call/buffer.c
index 2579b8c71986..155e4f9d43eb 100644
--- a/tools/libs/call/buffer.c
+++ b/tools/libs/call/buffer.c
@@ -155,7 +155,8 @@ struct allocation_header {
 
 void *xencall_alloc_buffer(xencall_handle *xcall, size_t size)
 {
-    size_t actual_size = ROUNDUP(size + sizeof(struct allocation_header), PAGE_SHIFT);
+    size_t actual_size = ROUNDUP(size + sizeof(struct allocation_header),
+                                 PAGE_SIZE);
     int nr_pages = actual_size >> PAGE_SHIFT;
     struct allocation_header *hdr;
 
diff --git a/tools/libs/foreignmemory/linux.c b/tools/libs/foreignmemory/linux.c
index 12f959765abd..6d2f30cdf1b6 100644
--- a/tools/libs/foreignmemory/linux.c
+++ b/tools/libs/foreignmemory/linux.c
@@ -198,7 +198,7 @@ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
          */
         privcmd_mmapbatch_t ioctlx;
         xen_pfn_t *pfn;
-        unsigned int pfn_arr_size = ROUNDUP((num * sizeof(*pfn)), XC_PAGE_SHIFT);
+        unsigned int pfn_arr_size = ROUNDUP(num * sizeof(*pfn), XC_PAGE_SIZE);
         int os_page_size = sysconf(_SC_PAGESIZE);
 
         if ( pfn_arr_size <= os_page_size )
diff --git a/tools/libs/gnttab/freebsd.c b/tools/libs/gnttab/freebsd.c
index d69d928a165e..801274478217 100644
--- a/tools/libs/gnttab/freebsd.c
+++ b/tools/libs/gnttab/freebsd.c
@@ -74,7 +74,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
     int domids_stride;
     unsigned int refs_size = ROUNDUP(count *
                                      sizeof(struct ioctl_gntdev_grant_ref),
-                                     XC_PAGE_SHIFT);
+                                     XC_PAGE_SIZE);
     int os_page_size = getpagesize();
 
     domids_stride = (flags & XENGNTTAB_GRANT_MAP_SINGLE_DOMAIN) ? 0 : 1;
diff --git a/tools/libs/gnttab/linux.c b/tools/libs/gnttab/linux.c
index 7286c1d4fe83..829877e64baa 100644
--- a/tools/libs/gnttab/linux.c
+++ b/tools/libs/gnttab/linux.c
@@ -101,7 +101,7 @@ void *osdep_gnttab_grant_map(xengnttab_handle *xgt,
         map = alloca(map_size);
     else
     {
-        map_size = ROUNDUP(map_size, XC_PAGE_SHIFT);
+        map_size = ROUNDUP(map_size, XC_PAGE_SIZE);
         map = mmap(NULL, map_size, PROT_READ | PROT_WRITE,
                    MAP_PRIVATE | MAP_ANON | MAP_POPULATE, -1, 0);
         if ( map == MAP_FAILED )
diff --git a/tools/libs/guest/xg_core.c b/tools/libs/guest/xg_core.c
index f83436d6cbf8..d3640f0ef891 100644
--- a/tools/libs/guest/xg_core.c
+++ b/tools/libs/guest/xg_core.c
@@ -696,7 +696,7 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
     for ( i = 1; i < sheaders->num; i++ )
         sheaders->shdrs[i].sh_offset += fixup;
     offset += fixup;
-    dummy_len = ROUNDUP(offset, PAGE_SHIFT) - offset; /* padding length */
+    dummy_len = ROUNDUP(offset, PAGE_SIZE) - offset; /* padding length */
     offset += dummy_len;
 
     /* pages */
diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index c8d091850622..739ec1c33837 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -364,12 +364,12 @@ static int meminit(struct xc_dom_image *dom)
 
     /* Convenient */
     const uint64_t kernbase = dom->kernel_seg.vstart;
-    const uint64_t kernend = ROUNDUP(dom->kernel_seg.vend, 21/*2MB*/);
+    const uint64_t kernend = ROUNDUP(dom->kernel_seg.vend, MB(2));
     const uint64_t kernsize = kernend - kernbase;
     const uint64_t dtb_size = dom->devicetree_blob ?
-        ROUNDUP(dom->devicetree_size, XC_PAGE_SHIFT) : 0;
+        ROUNDUP(dom->devicetree_size, XC_PAGE_SIZE) : 0;
     const uint64_t ramdisk_size = dom->modules[0].blob ?
-        ROUNDUP(dom->modules[0].size, XC_PAGE_SHIFT) : 0;
+        ROUNDUP(dom->modules[0].size, XC_PAGE_SIZE) : 0;
     const uint64_t modsize = dtb_size + ramdisk_size;
     const uint64_t ram128mb = bankbase[0] + (128<<20);
 
diff --git a/tools/libs/guest/xg_dom_x86.c b/tools/libs/guest/xg_dom_x86.c
index 268936efe25b..9af83535944a 100644
--- a/tools/libs/guest/xg_dom_x86.c
+++ b/tools/libs/guest/xg_dom_x86.c
@@ -678,7 +678,7 @@ static int alloc_magic_pages_hvm(struct xc_dom_image *dom)
     {
         if ( dom->cmdline )
         {
-            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 3);
+            dom->cmdline_size = ROUNDUP(strlen(dom->cmdline) + 1, 1U << 3);
             start_info_size += dom->cmdline_size;
         }
     }
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 285229cf82a3..31a79bccf75e 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -135,7 +135,7 @@ typedef uint64_t x86_pgentry_t;
 #define PAGE_SIZE_X86           (1UL << PAGE_SHIFT_X86)
 #define PAGE_MASK_X86           (~(PAGE_SIZE_X86-1))
 
-#define NRPAGES(x) (ROUNDUP(x, PAGE_SHIFT) >> PAGE_SHIFT)
+#define NRPAGES(x) (ROUNDUP(x, PAGE_SIZE) >> PAGE_SHIFT)
 
 static inline xen_pfn_t xc_pfn_to_mfn(xen_pfn_t pfn, xen_pfn_t *p2m,
                                       unsigned gwidth)
@@ -167,7 +167,7 @@ int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
  */
 #define M2P_SHIFT       L2_PAGETABLE_SHIFT_PAE
 #define M2P_CHUNK_SIZE  (1 << M2P_SHIFT)
-#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
+#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_CHUNK_SIZE)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
 #if defined(__x86_64__) || defined(__i386__)
diff --git a/tools/libs/guest/xg_sr_common.c b/tools/libs/guest/xg_sr_common.c
index 7ccdc3b1f6aa..54dde924a7c0 100644
--- a/tools/libs/guest/xg_sr_common.c
+++ b/tools/libs/guest/xg_sr_common.c
@@ -56,11 +56,11 @@ const char *rec_type_to_str(uint32_t type)
 int write_split_record(struct xc_sr_context *ctx, struct xc_sr_record *rec,
                        void *buf, size_t sz)
 {
-    static const char zeroes[(1u << REC_ALIGN_ORDER) - 1] = { 0 };
+    static const char zeroes[REC_ALIGN - 1] = { 0 };
 
     xc_interface *xch = ctx->xch;
     typeof(rec->length) combined_length = rec->length + sz;
-    size_t record_length = ROUNDUP(combined_length, REC_ALIGN_ORDER);
+    size_t record_length = ROUNDUP(combined_length, REC_ALIGN);
     struct iovec parts[] = {
         { &rec->type,       sizeof(rec->type) },
         { &combined_length, sizeof(combined_length) },
@@ -110,7 +110,7 @@ int read_record(struct xc_sr_context *ctx, int fd, struct xc_sr_record *rec)
         return -1;
     }
 
-    datasz = ROUNDUP(rhdr.length, REC_ALIGN_ORDER);
+    datasz = ROUNDUP(rhdr.length, REC_ALIGN);
 
     if ( datasz )
     {
diff --git a/tools/libs/guest/xg_sr_stream_format.h b/tools/libs/guest/xg_sr_stream_format.h
index 8a0da26f7543..4310f4311e65 100644
--- a/tools/libs/guest/xg_sr_stream_format.h
+++ b/tools/libs/guest/xg_sr_stream_format.h
@@ -53,7 +53,7 @@ struct xc_sr_rhdr
 };
 
 /* All records must be aligned up to an 8 octet boundary */
-#define REC_ALIGN_ORDER               (3U)
+#define REC_ALIGN                     (1U << 3)
 /* Somewhat arbitrary - 128MB */
 #define REC_LENGTH_MAX                (128U << 20)
 
diff --git a/tools/libs/light/libxl_arm_acpi.c b/tools/libs/light/libxl_arm_acpi.c
index ba874c3d3224..ac8165de15b6 100644
--- a/tools/libs/light/libxl_arm_acpi.c
+++ b/tools/libs/light/libxl_arm_acpi.c
@@ -107,12 +107,12 @@ int libxl__get_acpi_size(libxl__gc *gc,
     if (rc < 0)
         goto out;
 
-    *out = ROUNDUP(size, 3) +
-           ROUNDUP(sizeof(struct acpi_table_rsdp), 3) +
-           ROUNDUP(sizeof(struct acpi_table_xsdt), 3) +
-           ROUNDUP(sizeof(struct acpi_table_gtdt), 3) +
-           ROUNDUP(sizeof(struct acpi_table_fadt), 3) +
-           ROUNDUP(sizeof(dsdt_anycpu_arm_len), 3);
+    *out = ROUNDUP(size, 1U << 3) +
+           ROUNDUP(sizeof(struct acpi_table_rsdp), 1U << 3) +
+           ROUNDUP(sizeof(struct acpi_table_xsdt), 1U << 3) +
+           ROUNDUP(sizeof(struct acpi_table_gtdt), 1U << 3) +
+           ROUNDUP(sizeof(struct acpi_table_fadt), 1U << 3) +
+           ROUNDUP(sizeof(dsdt_anycpu_arm_len), 1U << 3);
 
 out:
     return rc;
@@ -128,7 +128,7 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
 
     acpitables[RSDP].addr = GUEST_ACPI_BASE;
     acpitables[RSDP].size = sizeof(struct acpi_table_rsdp);
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[RSDP].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[RSDP].size, 1U << 3);
 
     acpitables[XSDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
     /*
@@ -137,11 +137,11 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
      */
     acpitables[XSDT].size = sizeof(struct acpi_table_xsdt) +
                             sizeof(uint64_t) * 2;
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[XSDT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[XSDT].size, 1U << 3);
 
     acpitables[GTDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
     acpitables[GTDT].size = sizeof(struct acpi_table_gtdt);
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[GTDT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[GTDT].size, 1U << 3);
 
     acpitables[MADT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
 
@@ -150,15 +150,15 @@ static int libxl__allocate_acpi_tables(libxl__gc *gc,
         goto out;
 
     acpitables[MADT].size = size;
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[MADT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[MADT].size, 1U << 3);
 
     acpitables[FADT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
     acpitables[FADT].size = sizeof(struct acpi_table_fadt);
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[FADT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[FADT].size, 1U << 3);
 
     acpitables[DSDT].addr = GUEST_ACPI_BASE + dom->acpi_modules[0].length;
     acpitables[DSDT].size = dsdt_anycpu_arm_len;
-    dom->acpi_modules[0].length += ROUNDUP(acpitables[DSDT].size, 3);
+    dom->acpi_modules[0].length += ROUNDUP(acpitables[DSDT].size, 1U << 3);
 
     assert(dom->acpi_modules[0].length <= GUEST_ACPI_SIZE);
     dom->acpi_modules[0].data = libxl__zalloc(gc, dom->acpi_modules[0].length);
diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 6fd62d140389..a8b0c8c50070 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -600,7 +600,7 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
                 .opts = 0, /* .opts will be set below */
                 .nr = b_info->altp2m_count,
             },
-            .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SHIFT),
+            .vmtrace_size = ROUNDUP(b_info->vmtrace_buf_kb << 10, XC_PAGE_SIZE),
             .cpupool_id = info->poolid,
         };
 
diff --git a/tools/libs/light/libxl_sr_stream_format.h b/tools/libs/light/libxl_sr_stream_format.h
index f8f4723c2e91..b02c954a388e 100644
--- a/tools/libs/light/libxl_sr_stream_format.h
+++ b/tools/libs/light/libxl_sr_stream_format.h
@@ -29,7 +29,7 @@ typedef struct libxl__sr_rec_hdr
 } libxl__sr_rec_hdr;
 
 /* All records must be aligned up to an 8 octet boundary */
-#define REC_ALIGN_ORDER              3U
+#define REC_ALIGN                    (1U << 3)
 
 #define REC_TYPE_END                    0x00000000U
 #define REC_TYPE_LIBXC_CONTEXT          0x00000001U
diff --git a/tools/libs/light/libxl_stream_read.c b/tools/libs/light/libxl_stream_read.c
index e64e8f0eadec..99c7607b6c54 100644
--- a/tools/libs/light/libxl_stream_read.c
+++ b/tools/libs/light/libxl_stream_read.c
@@ -511,7 +511,7 @@ static void record_header_done(libxl__egc *egc,
         return;
     }
 
-    size_t bytes_to_read = ROUNDUP(rec->hdr.length, REC_ALIGN_ORDER);
+    size_t bytes_to_read = ROUNDUP(rec->hdr.length, REC_ALIGN);
     rec->body = libxl__malloc(NOGC, bytes_to_read);
 
     rc = setup_read(stream, "record body",
diff --git a/tools/libs/light/libxl_stream_write.c b/tools/libs/light/libxl_stream_write.c
index 98d44597a732..9ea64369352f 100644
--- a/tools/libs/light/libxl_stream_write.c
+++ b/tools/libs/light/libxl_stream_write.c
@@ -119,7 +119,7 @@ static void setup_generic_write(libxl__egc *egc,
                                 void *body,
                                 sws_record_done_cb cb)
 {
-    static const uint8_t zero_padding[1U << REC_ALIGN_ORDER] = { 0 };
+    static const uint8_t zero_padding[REC_ALIGN] = { 0 };
 
     libxl__datacopier_state *dc = &stream->dc;
     int rc;
@@ -136,7 +136,7 @@ static void setup_generic_write(libxl__egc *egc,
         return;
     }
 
-    size_t padsz = ROUNDUP(hdr->length, REC_ALIGN_ORDER) - hdr->length;
+    size_t padsz = ROUNDUP(hdr->length, REC_ALIGN) - hdr->length;
     uint32_t length = hdr->length;
 
     /* Insert header */
diff --git a/tools/misc/xen-mfndump.c b/tools/misc/xen-mfndump.c
index 28687afbf01a..99a0b1d3b5c0 100644
--- a/tools/misc/xen-mfndump.c
+++ b/tools/misc/xen-mfndump.c
@@ -10,7 +10,7 @@
 
 #include <xen-tools/common-macros.h>
 
-#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), 21)
+#define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), MB(2))
 #define is_mapped(pfn_type) (!((pfn_type) & 0x80000000UL))
 
 #define ERROR(msg, args...) fprintf(stderr, msg, ## args)
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index c55f73b265b2..7f6381cdd2fe 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -221,7 +221,7 @@ CAMLprim value stub_xc_domain_create(value xch_val, value wanted_domid, value co
 	if ( altp2m_nr != (uint16_t)altp2m_nr )
 		caml_invalid_argument("altp2m_count");
 
-	vmtrace_size = ROUNDUP(vmtrace_size << 10, XC_PAGE_SHIFT);
+	vmtrace_size = ROUNDUP(vmtrace_size << 10, XC_PAGE_SIZE);
 	if ( vmtrace_size != (uint32_t)vmtrace_size )
 		caml_invalid_argument("vmtrace_buf_kb");
 
diff --git a/tools/xenstored/core.c b/tools/xenstored/core.c
index d6d462b7bc82..86c86b3e9a77 100644
--- a/tools/xenstored/core.c
+++ b/tools/xenstored/core.c
@@ -466,7 +466,7 @@ int set_fd(int fd, short events)
 		/* Round up to 2^8 boundary, in practice this just
 		 * make newsize larger than current_array_size.
 		 */
-		newsize = ROUNDUP(nr_fds + 1, 8);
+		newsize = ROUNDUP(nr_fds + 1, 1U << 8);
 
 		new_fds = realloc(poll_fds, sizeof(struct pollfd)*newsize);
 		if (!new_fds)
@@ -3067,7 +3067,7 @@ static int dump_state_node(const void *ctx, struct connection *conn,
 	head.length += node->hdr.num_perms * sizeof(*sn.perms);
 	head.length += pathlen;
 	head.length += node->hdr.datalen;
-	head.length = ROUNDUP(head.length, 3);
+	head.length = ROUNDUP(head.length, 1U << 3);
 
 	if (fwrite(&head, sizeof(head), 1, fp) != 1)
 		return dump_state_node_err(data, "Dump node head error");
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 2db452144dd4..a880ff678ef9 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -2159,7 +2159,7 @@ const char *dump_state_connections(FILE *fp)
 		if (ret)
 			return ret;
 		head.length += sc.data_in_len + sc.data_out_len;
-		head.length = ROUNDUP(head.length, 3);
+		head.length = ROUNDUP(head.length, 1U << 3);
 		if (c->domain) {
 			sc.fields |= XS_STATE_CONN_FIELDS_UNIQ_ID;
 			head.length += sizeof(uint64_t);
@@ -2232,7 +2232,8 @@ void read_state_connection(const void *ctx, const void *state)
 		unsigned long off;
 
 		off = sizeof(*sc) + sc->data_in_len + sc->data_out_len;
-		domain->unique_id = *(uint64_t *)(state + ROUNDUP(off, 3));
+		domain->unique_id =
+		    *(uint64_t *)(state + ROUNDUP(off, 1U << 3));
 	}
 }
 
@@ -2308,7 +2309,7 @@ static int dump_state_domain(const void *k, void *v, void *arg)
 	n_quota = get_quota_size(domain->acc, &rec_len);
 	rec_len += n_quota * sizeof(sd->quota_val[0]);
 	rec_len += sizeof(*sd);
-	rec_len = ROUNDUP(rec_len, 3);
+	rec_len = ROUNDUP(rec_len, 1U << 3);
 
 	record = talloc_size(NULL, rec_len + sizeof(*head));
 	if (!record)
@@ -2372,7 +2373,7 @@ const char *dump_state_glb_quota(FILE *fp)
 	n_quota = get_quota_size(quotas, &rec_len);
 	rec_len += n_quota * sizeof(glb->quota_val[0]);
 	rec_len += sizeof(*glb);
-	rec_len = ROUNDUP(rec_len, 3);
+	rec_len = ROUNDUP(rec_len, 1U << 3);
 
 	record = talloc_size(NULL, rec_len + sizeof(*head));
 	if (!record)
diff --git a/tools/xenstored/watch.c b/tools/xenstored/watch.c
index a9a06e9e4816..309c5bb66bef 100644
--- a/tools/xenstored/watch.c
+++ b/tools/xenstored/watch.c
@@ -349,7 +349,7 @@ const char *dump_state_watches(FILE *fp, struct connection *conn,
 		}
 
 		head.length += path_len + token_len;
-		head.length = ROUNDUP(head.length, 3);
+		head.length = ROUNDUP(head.length, 1U << 3);
 		if (fwrite(&head, sizeof(head), 1, fp) != 1)
 			return "Dump watch state error";
 
-- 
2.53.0


