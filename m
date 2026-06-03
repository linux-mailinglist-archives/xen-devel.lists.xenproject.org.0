Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jmvvBL16IGp74AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:04:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608E863ABCF
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 21:04:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=selector1 header.b=BldVub59;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1327027.1592228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUqs0-000783-HB; Wed, 03 Jun 2026 19:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1327027.1592228; Wed, 03 Jun 2026 19:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUqs0-00076I-EM; Wed, 03 Jun 2026 19:03:16 +0000
Received: by outflank-mailman (input) for mailman id 1327027;
 Wed, 03 Jun 2026 19:03:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger.pau@citrix.com>) id 1wUqry-00076C-6z
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 19:03:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUqrx-008EJv-K4
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 21:03:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207a48-e002-0a2a0a5209dd-0a2a4502c796-16
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:03:13 +0200
Received: from [52.101.62.52]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <roger.pau@citrix.com>)
 id 6a207a70-af86-0a2a45020019-34653e34046b-4
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 21:03:13 +0200
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DSVPR03MB989241.namprd03.prod.outlook.com (2603:10b6:8:3ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:03:10 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 19:03:10 +0000
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
 b=ifWlxIOAQm/dL2htjRvCDVfpsM68I0y2AOtnBESquI0u9QwIsTFk5cUnI8VJUtpL0dlmOc7le2j8R0vjF+aguperZs2THe7v3jT/auAs4rtep60M+tAmdBk7wa4r7AK1J1nKMZZKgM1/3occjK1lz9cY/q8zjq+WcpKENMRvlgyNjSqXPzag5WsHQdkO9CYMVo6aRWwOITgUfFL5hnempJO4rXbMWL4vVk8kLu8wwstAUYV2l/nDJYX2Rdm2jIYmPgMyKK2+X00dzUAaTksEDuYAI9dNCj4DIMJZj8l0yn6LBPKT6VJqaF8pbQygO7qP6DdeV1KXF8LcFD7bEXzLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SalFx0HE0KXFJI8Hh84m0f5kI0bFpmmWHZ6RrIYJKis=;
 b=ukjzPHz9hRMPtNz3ZEqSkTrwGH2hTUdp+rDyiiKSchUFX84YsWj9zD0XTEL4bgig6ZgESCNKGd2D9+ezN7cinpelO773G7NJIZXBRDczhmUoyJI1jbbGrPLp+2Sm6t6dpOGVwn9JDJo8hgOsE3KjX9LH2j5tufYB4WcV56G0Tjhni9XeAybnOTU4+y7bLU9fhkl/H8D+Cch5AM5zYWYa2SsqANMzZ0guw7dCdMOUbYzXJP9fLOFCGb64VLrv9Qv8HTxVSYDUF0QVOerCxTiv996fk9nWdntOUlc3TqEDtG2NfPgkP/H2e510InVsj7sKD4VFj6bEu1LWxpbDV+HJ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SalFx0HE0KXFJI8Hh84m0f5kI0bFpmmWHZ6RrIYJKis=;
 b=BldVub59qbw6hwT34RUs2MlwxbfCLzxxUt7oUG+NWmLfWrWQg+RP9RS4J8PYjjOnU7PGB/PZanRQAys5oggeh8IO8OI9y8oLFvVqAi8Hy2mhIB/CPJrXhVM6TByHcCaNN7wytCQ9ElMQPz02kcxgGmfp6BCYynsAQXQM2uyNVO4=
Date: Wed, 3 Jun 2026 21:03:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.22 1/5] tools/bitops: adjust bitmap_or() interface
 to match hypervisor
Message-ID: <aiB6a52SnU7BO6rN@macbook.local>
References: <20260601154332.30797-1-roger.pau@citrix.com>
 <20260601154332.30797-2-roger.pau@citrix.com>
 <1780497273.8631fc262581453bbf619ec5b2062170.19e8de8523b000701b@vates.tech>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1780497273.8631fc262581453bbf619ec5b2062170.19e8de8523b000701b@vates.tech>
X-ClientProxiedBy: MR1P264CA0176.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:58::10) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DSVPR03MB989241:EE_
X-MS-Office365-Filtering-Correlation-Id: db6d38d1-17d9-4a6b-f38d-08dec1a2c0f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099006|11063799006|6133799003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rPc82d1lEm9OlDIClWC9eCUc939v2+BSIxzsfZXn6ANaWbLZAa774Aodpo9lYOgnnfLGMPUAvM2JWQpcRWB7Nub9APw28/9V44S0o1c95QC9ZfppdGz5ftRcMxZZoN2AwQJG8sDkU/L86D9fw6o7/YmZYq4GD/dpBMAzW5Zf7rZUQKZaTQ6dL1mvIk8JsCWysm1UFI61TDPI5NiE7jHIQOGkIcJjlUoqeIvkBTA1Fbr+WohLi12xOmrGeb3rNI1FvljVV+Zo+hcMeR6DqWuf7s5tkSMfFzbhjz043scYXs9FRx2jrdn9ewkRSrJ37SjHEL4wgp+Ud+CEfO34x00hx4u5KyFWdYi3kW56nMJwZntlqNFysg+OJLlNz/G7hrFqV1QXusEC8PgqS3vBtJndFlCLkEHt09RvfazRBnQ/kCrXDRuNA/82yGtfriHoBNd0agnoIpD2J3/yjOBe9xryCBZSI3WwfLIhJ2CNCU0X351kPWYlJeE0cjMxEd0TqgnuRpmHounEsof0KOnmJxruG/YAugBlboCE4HsxZ/XtLifZOk5qi33UhwfAjEDeTeds2wcK6pNNiZCuqoHjrfSVDvjljOw72Cpngud8vrtk6Uk+pINKePiggrt1PhSXqHbwBCSeoJPhn7g7Ypzd9uxAlRKtqJgagASmZp5O7fcBowgSEhycjSwvtNVO7BqqYpj2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(11063799006)(6133799003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3lKekdwemJ6ZVJDRnVkTjJYQmlPYkxINEpyNExxZEpZbzlCV0NBUi9IRjdP?=
 =?utf-8?B?UmU0clFaaTNMS3MrQ1BMTEowM2gxYit2R2pkZkpqVjNPZEROeVdiSkdGUFBJ?=
 =?utf-8?B?ZDNHSFJIMzBnZ1RmUkFnajlzcmxyQ2E4TVJIR2FwT0QrTGtYY3lwOGF4akNw?=
 =?utf-8?B?THJnaVR1Q2F6TDRkR3l3YWhMSE1INmJaaG9UMVVrLys0VFlPaUg2RjF2TU41?=
 =?utf-8?B?ZTBnclJybmJCbWorY0tNa3I4Y0M0SFhuUGhyYzhvS21RQytXYXlPZ1JYTjJ3?=
 =?utf-8?B?V1VxYXp4Q01MdEVJRk5tY3NGUDVLSlBaV3RLYXJzbG9lUFJNd2RYZkRic3Nl?=
 =?utf-8?B?MHNtakgzOG1SV3RXM1dEaGpZSkppbmtMclUrYzV1VVRwTlM4elo5R3BBN1dG?=
 =?utf-8?B?Ykx5bDFSSEZMMTEvWEp2VGo1TldQVUphNEVMRFZrb2R6cy9xTjJPcG1yOXhT?=
 =?utf-8?B?ZXM3S1JqbkJLbzNxSkxoQ0xrS1g0ZEhDSDB3bTd4clR4Y2xrb0xQUWFrRmpi?=
 =?utf-8?B?VTR5Rkkrc1BXRGFiYk9WdGd2SzdOK205VGovamZEaUhaU0tBMkVvbmMydXA5?=
 =?utf-8?B?RERRc2NNN2VMdzRoTVgxd2tVRzlidDVzd3lyQlkxeGMxWHJ5azA2T3VpRHY3?=
 =?utf-8?B?UEsrT04yQUNXcEN0cEJDZGxLZzlDbjBQQUtPWStvbHhpVFZYakYwWnhmMnQr?=
 =?utf-8?B?bUc0ZkUvVFFaNS9KWWEwMVREUG5NaVlIeVd6V3pnbm9ZY1RVTDMrSmlYYXR4?=
 =?utf-8?B?UnFHTzJ5RU5laEYxTHVFWktINHNoWTlRVVRNSWxpQy9pSFlmcU85WkRNL2Ny?=
 =?utf-8?B?YWx0VFcvcnlJZFEwNGh0QVhkdkxvUXpoNmpTZ3pyOC9BdXovengzS2ZKcmZW?=
 =?utf-8?B?NHl3L0FvSm55VjQxUGhhcG9hQ0FMME4rYnFaZFhra3FzVVFUVjV3QjNhZXd0?=
 =?utf-8?B?bG1wQUNYRGhQTFhyTGsyL1BDM2FyMzBuVC9JZGJESkppN3pvUnFXMjdPUzVG?=
 =?utf-8?B?aXNHUFI4aThrVzE2M3dSSTRmb253NHRWWENXdzNMWCtqZXhpT2RsSmJheWho?=
 =?utf-8?B?M0dpVVVoazVIQ3ZOUlZFTUU5cTk1azlDNnVlMFJ4d0g4Z2hTRHVzZ0dTWkY0?=
 =?utf-8?B?a1JNU085K09rTUoyWEo0MGp3SHpscXBNS1lOUnZHdU82ayt5N3o2UDZVSjBG?=
 =?utf-8?B?K2lKUWpMcDdyS0J3VzhXSEVuSTZUQVIyd0NObXB5elZ4N1REajJ1bkJRakNL?=
 =?utf-8?B?VUNqVkRkRWdSamptMFBIcnlMb1NaK2hsS3E5Qm1KbWZwRGVBUVF6a01sNEJ5?=
 =?utf-8?B?YW9XTlJhemFQSVk0SXRZdXFqOExKK3V0RWNLRTFIb1BzL08xb2t2dXAvMysx?=
 =?utf-8?B?akpFc3I1VDlkd2Z4Mkx1TklaY2ZkY3RWbnkrSFltWWtzVHNZTXpZUExFdjZl?=
 =?utf-8?B?Q2RKZ0ZDemIwYW1xZWtranFuaStoazFYTTZ4emVZZDBwaytEUGEyYlRtTGxt?=
 =?utf-8?B?ZlhvU0tBUjJHYlJOb1owQ3pxbHIwbDhMdk16bytVU3pCY0M4SFU3c2t6dVg3?=
 =?utf-8?B?dEhEU1dHcTJyY3p5ME15ajZLYVBWSWgwNVg1MlFkekRtVUdld1dKZTUvY2pD?=
 =?utf-8?B?MEFHOEpja3RqamwvOUptOFVHcTJqMnJwalVPTFlhSlhxMXVQQmlnRlFsQjdX?=
 =?utf-8?B?di9mazlrL1hWano4cGkrY2ttRUVqbTlGcXk2NUlST0hzZDVPS0VhTDlDQk5k?=
 =?utf-8?B?Um4xczZCUmZRRVpyZk9IZEdNcHNKRzJYbTI1cVRUdnJpMlN5YjFZN0p2bWM5?=
 =?utf-8?B?QzFpaVBDZFg4V1d3WGovYWVJR01xY3h0RzJHWWlpNlNUb0ZvMmJtbW9XQ2J3?=
 =?utf-8?B?T09WWGtiWExrdTllMmkvWlI3ZyszWE8yY3owQmlkSkI1Qkd4MnFCMHBXS01M?=
 =?utf-8?B?RHZXL2wxdVdPemtwQ1B3Q1RYbnJzL0cxazJmL2VDbUgvRlVQb3VqVkRncHB5?=
 =?utf-8?B?Ly9pRjVySW9vZ0w1Mk5SdGVqRFVlS2xaRTJIcENNRlNPbTB0d01pd293VnI5?=
 =?utf-8?B?K2xiRFFHeWtieTlySS9HV2E2cThFTHRBWmhGQzFnTDV4SlRULzJ1R2cyRVY2?=
 =?utf-8?B?SHdBbm00K0J3R0pRSmJJZWhNdEkxNnhBRE80OENhemZWdCtoS1pUanhmWWNZ?=
 =?utf-8?B?ZzZsMTJMSzFVWnBtVDZQMHgzK0lBVDdPUVR1aHZGdFljRW5JMUZSVGpDd1pR?=
 =?utf-8?B?YUhoQnZtSVlsUVZucS9wQythVzRHdUhNVjlQK0M3SDIxS21wZ2dnZnpiZGRq?=
 =?utf-8?B?YUpDeWNKcHVhR1FiS010YzhZRFQ0R3BUWnVZcGdYb1dFS1FZMzNxZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db6d38d1-17d9-4a6b-f38d-08dec1a2c0f5
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:03:10.2490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0zdMbzJDsIdnewBxfXafDR/o8fMvz7JIIL+aIQ+GVCUJ9ya1kspXSjdkMCUblJ+R4jpAv2AdyuCtLuUapJmKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR03MB989241
X-purgate-ID: tlsNG-720697/1780513393-A9B70161-D26C7BE3/0/0
X-purgate-type: clean
X-purgate-size: 825
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksii.kurochko@gmail.com,m:jgross@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,suse.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 608E863ABCF

On Wed, Jun 03, 2026 at 04:34:32PM +0200, Anthony PERARD wrote:
> On Mon, Jun 01, 2026 at 05:43:28PM +0200, Roger Pau Monne wrote:
> > Adjust the only toolstack caller to use the new interface.  No functional
> > change intended.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.

> > ---
> > I'm tempted to rewrite bitmap_or() to use unsigned long (just like the
> > hypervisor side), but that's outside the scope of this change.
> 
> You mean revert 11d0044a1689 ("tools/libxc: Modify bitmap operations to
> take void pointers") ? Or maybe the hypervisor code when trough the same
> path.

Kind of yes, so that it matches more closely the hypervisor interface.
Anyway, not going to do that now either.

Regards, Roger.

