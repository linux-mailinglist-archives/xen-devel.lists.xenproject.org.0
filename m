Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCp8A8G8HWo/dQkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 19:09:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 678FB6230D0
	for <lists+xen-devel@lfdr.de>; Mon, 01 Jun 2026 19:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324022.1589691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU68J-0005kc-U6; Mon, 01 Jun 2026 17:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324022.1589691; Mon, 01 Jun 2026 17:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wU68J-0005jE-RR; Mon, 01 Jun 2026 17:08:59 +0000
Received: by outflank-mailman (input) for mailman id 1324022;
 Mon, 01 Jun 2026 17:08:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper@citrix.com>) id 1wU68I-0005j7-6a
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 17:08:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wU68H-00EFRb-Jd
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2026 19:08:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1dbc92-2eae-0a2a0a5409dd-0a2a450c9d78-32
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:08:57 +0200
Received: from [52.101.62.71]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper@citrix.com>)
 id 6a1dbca8-62f1-0a2a450c0019-34653e47efa1-3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2026 19:08:57 +0200
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA6PR03MB8009.namprd03.prod.outlook.com (2603:10b6:806:437::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 17:08:53 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 17:08:53 +0000
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
 b=xySWV/WByEEOgjttlEinzN4KGc9m05VcG6HZSxJAbHON0ED15C4/2cjTWP9Kprfs5q+/CWhVRD3XaOUJJH2vLSSnovVEALaZousAAS/EwR6BgZIv5OgAPmOdq4Xlg852/V0Eu03zmmDzBuLW7wwy4+AdgrKrERuGvAXARoQdyMqj4zFcfJsFqSMt1sh/c+VeLXgvmOdxeAJbFG/flItIK14PIsATKzHB2+EfojIuFKpC2X4pZoXZeJsJ8qOp0LcS/JZCvw9R2/EL86D2A2Hslfb/bPCgEl7AC2Eln1Rt+5ZNFnv+4Yklsnug1S6PQdlNRpTeuy3muunmr+U82I40pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Wns+MOvruvUmWtZ/sA3S3UpY35Nm2tQmle8/w2+Fy4=;
 b=xD7mUd09/C+azIdIZvmyTx2wDps1/8hbx9X4zUpBVIgLqtRFGS66LotvhpaIvQmxB1Rr6DSkrO+MSOzHChwy1LEYHs+6cAA+d7tpX2oCLFLHQ6uJNykFNXou8wSpaqPOo3Cu+WdIuoqlPyJd/9yTMWTDKMyfDbWKZUMUgkJc+KEb9La0PfGOiSCEe8mvShaOBu0/PzSWV+80o+QGkLC1jIBTsmLbXjIhOnjoG2DdImZTV07uWssqr+VF7A/hvYRiFlDQRuY+3q1pstEnC4AEZSkU+nkbURhgfLQt2IcFQ5vP3zSnD/ZtAO8RrzQlwfOd8A7oQNabJqrBa6Z7pnKnWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Wns+MOvruvUmWtZ/sA3S3UpY35Nm2tQmle8/w2+Fy4=;
 b=xf5wJIr1Yfaxs4mbmezS8kivTtQz3i+N1Xx7SLxeTs1BqfqPncod7dHuFH18bF9qKI1HIJ6GIgaTbbR3eqqwD87fU0FZ6+Rlu792zRKfwdSIB2B807Yv6SrV6BZPAEEggjzA2toADjA5UtRVa1ARKiTPRHAiRzIauhYgCvjYfOE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e08a1e30-cac2-40a6-9dbc-31aa4074ae88@citrix.com>
Date: Mon, 1 Jun 2026 18:08:49 +0100
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH for-4.22 5/5] xen/numa: fix setup of non-aligned memory
 affinity ranges
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-6-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20260601154332.30797-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0178.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::21) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA6PR03MB8009:EE_
X-MS-Office365-Filtering-Correlation-Id: 724f992f-2979-4c70-0162-08dec000756a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	5VewX9jaI8U+7ncZU48o0zK4d0kV/juxzRyccf0NnFm5p4bmws+x/V71nqI+OUhjrxKr/pnSYGcfonVDCltG/Ous8mXdD01ismj/d4QXZwc3cNt3rnrMYAxq6fcKKxVBT4nk4XIE2IavGpzPTZojqzJWDWIPxrfLuWGKvLRk2zsWjcAn+DpBCmHAqZVah8HI4fVbeKura5zSOeGxHLb7isvwQHnyLnPYAGohaOis/2FFNHQizlRDAAOWBpP/2jaQow96fDvyKp0IrR3XvlCu4Qy4nk4MifRGickUqoQbM96uEr9ST+RXqxiU8d+v4anr1lTKxO7agl9gsXY7V5ZuE8TYpW39jvTJL2OABKqJ0YoieH0ze6S49gGk1lCX6DQFLVD1Kc25ilqSUR8VYAQfUfp1Ez5i0w2RIGtxF6xfPDQzC7Dd7Le0PspfLhw9TjegxZomc1afhAStaFiQv4hZ2xMipy01afWdftce313g13NdpUgVmYJPIZERBsiaUVnUz6x6FfiKrgU4F7hKCoCK7Eyl59+TschyHAZUTtVFT7vHsXe9C26VXKTQluN+J+HaxnKdmpbKAqpNE+vofTE/NDh1eCRvoiEdO6nLJNANrU6u5GQtRnu3V5LDO1FwIW6BRLVDOfl0uAV6LUuWkRwFWD2eHeDGf45bbpvPiBLykVy8Y4F+H03UGfg8oz1FkzQD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0JSbmxhVEJEeWc4NjNGZE55TWx4T0pRU010b1pJOFpqUWZ3RkIxbnhYZDRL?=
 =?utf-8?B?NnVHeTREaGk5dkw4U3hxV082Y3RuZjFDVngzOWVTVFQ5Z2JINlRLdW00OE9D?=
 =?utf-8?B?S1ZqWUZTRVNYNlhtZ2hiL2FuOXcyU0F3bW1VOTE5bnlVMU5lRmovMTBHdlJ3?=
 =?utf-8?B?NEFBZ3l5c0h2ZDZSUXRyZkVpZG5JRUtvYnZQeloxSHhFKzR6UVZxc3pRUFFu?=
 =?utf-8?B?eEtVNVRjS1YrU3V4RityeFZQU3dDekNQNTB0VnFFV0J1cTRkWUNzcS82R3Nz?=
 =?utf-8?B?a0V3STBMb1UwMWwxYWgyU255djBZMVpjRnpxVTJjWUg2eXovM0xWSFpqYW5K?=
 =?utf-8?B?QnBNMlNneExFRjk3eHozZzRNOWJDYkUrczZQb000STZhSzVNR3hpMDd5dkJU?=
 =?utf-8?B?QmFpSmo4L1BReWdVNkdHckZtYjJLS1JqWnZIN3BzYnhmWktVVmdveGJFRXY3?=
 =?utf-8?B?OVpCSG0wcS9vOFNQVE1NQmtuV1BidHY2Mll1cnNvRzEwekYrdlg4RE9KYkZQ?=
 =?utf-8?B?ejVJOFJvYzZCaU82R21PY2hqc04rT3JoblZmTEdtc1ZVQitwS3MrWUQ3dzZj?=
 =?utf-8?B?MnJ1RWNWREZkSDhhSDJndldjeTk5QWludExXdUtwVE42WWdzcWE4VHZBMTRO?=
 =?utf-8?B?czNIU0xzRGhqdlQyVmF1UGVzTU41bHd6RW1tWHdPRStZWVVaeENsOXdOWjk4?=
 =?utf-8?B?SmdaM3ZCNHphejFrc1JOdEovVStKSklDQi8yZUw3aCtxYzI2OHljcGIxZ1g5?=
 =?utf-8?B?Z3ZleVh1dEc1UDhUL3I3TWJEWmUyUUZxV0d3S014dVM2OC9ia3FhWDVNdzV2?=
 =?utf-8?B?Rk5YaUdFUjVQNERWMERXMlIyRDBsanRwRHBDdlhKTFhsN1Nobm9Lc0hSa1VU?=
 =?utf-8?B?VWNpNG5CRFV1L0JmRWtldkFzdWF0Nit5UlR4VmVrLzBvdW5zNlJuOFhzNEhG?=
 =?utf-8?B?cC9FWW9FR3BiT3JzdW5Rczd1cjUwUm8rVnpSUGRvWVpqaVFNY2xkempEbGoz?=
 =?utf-8?B?MG1oWEF2eXZVbkE4cW1zc0o2SXBwQi9sY2hYdFg5cTNBbXZHUGRqL05ZMjFh?=
 =?utf-8?B?NVhsRVYvSGhYam5tSG9tRXp4NHYwdkxtbDNIZlc4UGF3NkhrZkM3WHUxcXFu?=
 =?utf-8?B?STB0M2gva1lLa0NGbmordVhGWXNNTE5ZMEUzU1lsMVdqYzVTR3luREI0SFpa?=
 =?utf-8?B?RVBIcXhpRmxkWXczMzZtZ2V2U1NiTllGb2VPTWxxNnBTSGlITHpsN2Z3Uytt?=
 =?utf-8?B?YVdSNTB0cXFkcGE5MlVEUGNHelVaUW9GM255dU1qY1JaNDlzMnlhbnJjMTZK?=
 =?utf-8?B?NXVjY1ZHbDhkMXVTdjNTbVhSSjM3Q2VzYml1YXRRQWZSanFaaGx2VjVKa0lw?=
 =?utf-8?B?TXRrS1kyZTJRcWRZc3lPSGVGYXRvWWNLR1VTYmJwLzIyLzhZNGZEZ2RWYUsv?=
 =?utf-8?B?cCtubzZxYXFXWWF6TktOUTFaRGhRYmk5aktXZFVVSkx2ZGtEUzI1V0tYY2R2?=
 =?utf-8?B?dml1UUswRHlpdVdjS3l0cjVaR2lwZTRHL0pjRitDcGhRU0FFUEtvWlV3VERk?=
 =?utf-8?B?eTRVNCsyNHRXWGE4TWNzLzJwdktRWlRxQ1BVbUFIT2FMVk9XUno3RFgyM0RD?=
 =?utf-8?B?N0phcjJyR3VqVUtuQnhXL0hWMkJHR0Yra25oU1JpVUN3RUpSV0d2MW40SXlK?=
 =?utf-8?B?U1NkYzExNTM0TllKVUlCUUtxS0FsejVjUXM0cUJkYmtGaEpkOHRiaXZKSzJK?=
 =?utf-8?B?RG5YdDUrOTRTa3RFa3EwdlQzeVlEdExrazEzdEpjSmw1alc0WWZzOC9nZ0dH?=
 =?utf-8?B?S0x0Zy9RZXh4L0xCL1BMSkNIam1IOE56bTI3YkMzcVBGc2hzNmpKbVMvSktR?=
 =?utf-8?B?aXFBeW9MZVExSnBRN2VoTkZEVVBIbUJXQUVCZU9hRHF5YnllUU05MmJOSEZm?=
 =?utf-8?B?MkFad0lIaE1zSDdocUVBUHlCK1p6QUJuejBLb041L0tZc01pWGs5V3FieDJj?=
 =?utf-8?B?RUZkT2FYUW5BVWJtMXVNcU4yQXNibDU2elo0OVJiY2haZDZWbDhEZ3AxeEFB?=
 =?utf-8?B?MXFQR240YUkwSXB0L0EyY1hncUc4U0ovVTN4Tk8yanB3QWl5Z3hISHZYZlRC?=
 =?utf-8?B?R3FOY1ZSZS9EYkhPY1Y0ZW9OTGcyTXhjNWVhby9zdkFyQ24wbVp0WnVUYXho?=
 =?utf-8?B?UTVKMmZVOW0vcW54VnlxZUV0bjdRUTFGL0tWM1lId0UrRUFUTEdwSm1OZGZ2?=
 =?utf-8?B?YlJFS000L2xlcEVDRkpwSG50am1GWTRDMG1kbG1iaXRqVmpjd0JkY0tOWEFR?=
 =?utf-8?B?TGhxTDZxRHhkdmNhMWxaVWJFKzl6K3VIMW5wTWFvemRwalc3RGpJVEljZ0Fw?=
 =?utf-8?Q?WILjeD1Xng1re4pE=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724f992f-2979-4c70-0162-08dec000756a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:08:53.6623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSlZrOsjzXLHoTbMVbAqkYh8dT4S0Q3+j3faUIuQ5KrnAdLg296auR3zzEK93yt+JqpNElGU0AK81Mh5Sw9q6HRmHVGhnKP68m4jmEvn7zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR03MB8009
X-purgate-ID: tlsNG-d25034/1780333737-E1D6BCF5-CED0900B/0/0
X-purgate-type: clean
X-purgate-size: 1049
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[citrix.com,gmail.com,vates.tech,amd.com,suse.com,xen.org,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 678FB6230D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 01/06/2026 4:43 pm, Roger Pau Monne wrote:
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index 8544a1598218..8b2f29597f30 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -396,7 +396,13 @@ static int __init populate_memnodemap(const struct node *nodes,
>  
>      for ( i = 0; i < numnodes; i++ )
>      {
> -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
> +        /*
> +         * Round down start address: if start is not aligned to the memnodemap
> +         * chunk size the tail remainder might not be added.  Overlaps created
> +         * by rounding will fall into the same NUMA region.
> +         */
> +        unsigned long spdx = ROUNDDOWN(paddr_to_pdx(nodes[i].start),
> +                                       1UL << shift);
>          unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
>  
>          if ( spdx > epdx )

I like that this comes with a unit test, but this hunk needs to be
standalone at the start of the series, because it needs backporting.

~Andrew

