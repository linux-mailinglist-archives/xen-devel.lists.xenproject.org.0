Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC87AC863C9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 18:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172169.1497267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwyA-00054v-GD; Tue, 25 Nov 2025 17:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172169.1497267; Tue, 25 Nov 2025 17:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNwyA-00052z-DV; Tue, 25 Nov 2025 17:36:50 +0000
Received: by outflank-mailman (input) for mailman id 1172169;
 Tue, 25 Nov 2025 17:36:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48u=6B=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vNwy9-00052t-3O
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 17:36:49 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 501a2922-ca25-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 18:36:46 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5284.namprd03.prod.outlook.com (2603:10b6:a03:223::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 17:36:43 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 17:36:43 +0000
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
X-Inumbo-ID: 501a2922-ca25-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHpHCuGesAGsgBEp2Hd3ezRi1wSJPeIFTV812djGHP39flNtBpOuRRVhqz8RlDlK4Bech1v3zSn26OnfLDWnaQOoAumTy3cKdAbguI8DCpK7H9MoqsygCbEjZ8IMVsts82mKTfjV7yAng/dG021W4PNHNZZroU1XIXwr9CgbBi+pOuO3p9GvM1XuWI1PIDOMpEtnavAB7shfC60zIDd0CiIZDuTbBv0F4ZZa1vcut+2i1AXWTKkdgM6SBcedz57FNHahFz6d6tZcl+1twqCeU/Q1sSp5Qz93CgAektz8BjaFl5bJgXqovfyG7qHaOa9cY4vQ4BDXfKOeN9/z7TaRog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMvcnfOcb3XPxgNPmv0cQwNPmIQWCCW2y59Uf+UEUf0=;
 b=qoaDUs79AGgxoen2V5B9REHasAtWeCX8wO4oqtIyG7kNd3uSbQG5lJzMOY90zGVUZu9nokvdzzj9Xf0bkXvhXIBLh0uRpP+BWAOZqS7bc3SJH9vFnSTcimaojux4WdtZZvHPFbhDem8WSEYYBNFiz/kZEw943xXNatTyKP1b0XTBFhH6SUu8tqtbo7yKO31qsQA/eG+6O35yUvzEg0vXUgEJunNyO9rv1jW+f2vuXRqM4hQCG4sNQo/UH6h35mx7rfnZuEVchWdXOM4AEXC0rh3KkxsExnPxYTMz0uw3jhzbHqxggQZz87LGyFh+CCMPmE5u7OoSfkMZdipK+L7KhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMvcnfOcb3XPxgNPmv0cQwNPmIQWCCW2y59Uf+UEUf0=;
 b=vKqysUDBvmAmHmmi9AsIET8BKrYCqwCam5jyV2tmn7OUg0KngeeE9qMXDeVI8TkyQSl6SI3BwMyREFqAyXYdiNwL1KGInAw/qZe+P5erKKPE5cMB8N8tEu5DCH9z1rSURZnF3zoTb6TQb2BeDFh6NsUuSZQWlUbU4OxQ6J0QAZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 25 Nov 2025 18:36:39 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH 2/2] symbols/x86: don't use symbols-dummy
Message-ID: <aSXpJ3yqSWfNgElC@Mac.lan>
References: <2d7602ce-3665-4853-85f0-c0201642193f@suse.com>
 <3618c458-d9ec-4cc6-a800-0741ade461a1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3618c458-d9ec-4cc6-a800-0741ade461a1@suse.com>
X-ClientProxiedBy: PAZP264CA0194.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:237::27) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6001cb-4ff2-4a25-10f1-08de2c4932d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uk9td09SR21NdXhPMC9LYmxRakw2V0kzSnVLTHJsVzVFdEc5KzhMai9GNnMr?=
 =?utf-8?B?dSt5SExaZDJtRVZXYUdoOXZPakhVcXpDZlhBenBvamxXZzFoMS9IbWdIcXVL?=
 =?utf-8?B?SXRYUTZIcFdwbDdVUEZCZGtkUVNGTUhMMGVTcStRdXFFZ1NTdWJQVWRoZ1dW?=
 =?utf-8?B?Q1ZjbnpCM1hzQzhyci9wNjhpc1puY1hqM1JOSzVwZ3RtNnEwUWp4cmZWVDlq?=
 =?utf-8?B?R0liNXZ5REd5Q1IxY1ZySG8rTW5Rck9EVHphemM4emllNHU4VVZicmlmTmxV?=
 =?utf-8?B?OFdnMmVIYk1ZaHhpN1VPNVFFTDBCZ3VWSWlNRlFtMFAzS3NaYW1JS3pzSENo?=
 =?utf-8?B?NGZSMEI3VEgrNXhuTzZia3UwVUFMSWlmaXpFUzhVOFdaaDRJV014MERuSkUz?=
 =?utf-8?B?d29tK2VpWUZGQVVuMVIzMkptRWFvVGQ2eWQ4cDZLOTJTTi9WS1pITG9Xa29s?=
 =?utf-8?B?cUxmYktabS84N21LYTBTNXJoYUJBQlpySlhMTTBEaXhDb2JkTXNHV1dlTWo3?=
 =?utf-8?B?NHlHN3pJU3lScElLYUI4RnJ3SGJUMmM5ZG1nSFhLZHVMNTdqSm5tQ2Z1b053?=
 =?utf-8?B?eVN5SXVhcWtNV1p2ZzE4MmRDaXdIK3FNTGh2Z0xHakk1RmRZb0NlZ0lSamlu?=
 =?utf-8?B?K2dJQVN5dnoxSldhazR2V1VwUHI2MDRKZUtjcEVtQ2wvS0x2VnA3RDZ4ejZG?=
 =?utf-8?B?c296cE14OWxXaHp5enZENlhoMHFRaFdrYkJVMmlRVmpWRmUvRjVka2RoNXZX?=
 =?utf-8?B?MHdWK3RzYzJKY0Nrd2RLSnJqVjVUZ1FDMk1uQ0VPcjlRcks4T2hOdkhvZlgy?=
 =?utf-8?B?aVhRbjNYcE1uYnVYZlkyQTdJREw4Z2NXaWdsK0VDUUtIU1hBNDhYc0Z3N0Zh?=
 =?utf-8?B?MUNFODJtaDFCOHdSRVRrbHNoNCtrWDFKV3FHU1Z1emlyM3Fobzc0VHI0VTU5?=
 =?utf-8?B?WUNZSTFOQ0N4NHNOR3U3SCswK3V3NTE1VmhCenhRelVMOTBsRXl2V0Ftajk2?=
 =?utf-8?B?ejJzOUpQUG5mZXZCTS93bjREdmdTdzZNN0t3OUQ0V0hJSzlpNjRKaGtDV05v?=
 =?utf-8?B?WHZpcTEyVWVFK0pNTU9zZ0s3bnBwYmFlYm52c3RxeVhQQ1RCeUJqRFNtazFD?=
 =?utf-8?B?czVKZXczWUp1TzJ0YzRySVdtd2k5TkxsK0ZRS08wclVPVUdVaHk5bDFma05s?=
 =?utf-8?B?QmprMVk3VEpJWklCT2tQU1FKUXBJaDRLaU1qUTFJaExjbXpaSE9VNVh1Yi9l?=
 =?utf-8?B?Rk95dkp4dnpSMTdRZkFQZytKNWhNWWhQbi9va3h3SDlGNThNSGY5UmpsR3NS?=
 =?utf-8?B?dDhLeUJkUW1jOUtoaVZ4VGJNakhmSm1ybmdLMUx3OUplbFlaaG4xNTlBNE5j?=
 =?utf-8?B?VkxMTlRvMVRaa3NWVHNVa1hLQjV5TDVkSllBVGNGeDVEM0ttVUJHZ01RZWpM?=
 =?utf-8?B?Smw1SXNUU3grZWE1UzBFVE41eWxLTU5Rd0FqUXZFS0p0dDM2eUZXSDBXZEFT?=
 =?utf-8?B?b3U3eGdrek9oQkJoai9xS2k2N1ZWd2JpU041RjNaZHdveHQ4ZmFLREpXaEFy?=
 =?utf-8?B?bTNKNVc1S2lWakRGZHFNanNyWExRc2IyWnlMcW5tOExVUk9UbkIwYlM3cElE?=
 =?utf-8?B?WHBPRWNZcGZkWGlka3JSWWdnUDQ1Y1BEMGx4VldsWGo4T1IvL0xmQWx1R0hu?=
 =?utf-8?B?Tm9hQ0RNL3BPS3Mva3pxUmRPUko0MnkxMy9pdWREbmFQU3FpeUsvVDlnQVgy?=
 =?utf-8?B?ajZ0YUo5YWdxUkhYb1ZGL3FjaXVWSjFGcVVXdmlqWk1lN011SFRZZFZzMGw1?=
 =?utf-8?B?QjM5dFhIYWNVRXRPTnViS0pHSlFlSUtwU0xaVURDVytXWHRTbUNPQVhXWk41?=
 =?utf-8?B?TWNmbUF0bmNFdjZ4OHZFL1lqVXdNQVBUcXVVVFdzN0h3VG01emNFNkNsaExP?=
 =?utf-8?Q?m6uMtIN6hwKtlgoZLMVwHwX3s8C7O24o?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajR3NitLTEFFMXA3UEVxNUhRQm80NDhTaDdab3NkZThhRGlxQkRNVUVlTURW?=
 =?utf-8?B?QlpqQkI4eUxXVnFpR2pNRGZ3bHZmVmd2OTl3MzBBOW12ZlJ0cFp6c29CbDIv?=
 =?utf-8?B?WkM1ckdTTUdZVXlaY3ZUc2xpaHcvMWZ5TFdYNS9zSlBXZFRuZUtBQVZuV2cx?=
 =?utf-8?B?WXo1ZVJ6UFpQZ1QrSURIVG1pNmVXdmhyWHN6K2FOWFZYQTFwaFZjVVpibW91?=
 =?utf-8?B?ZzlIMFNuaEtXT1NRNXVZQ0pUSFZ2aTZEYjBTVkMwa2N1V0xya213YVlnRTYy?=
 =?utf-8?B?eVUzUnhKVlhtZy92dDY2MC9CWkQyT2xWTjByMGhxVXhtUEVxRXR4bVMvVnA4?=
 =?utf-8?B?MFdaMDJIRkFkKy9pckI2eElqSlNxbkhZTEo0bkN1VU9wMXZpa0g1bVRweUNZ?=
 =?utf-8?B?c05FUVdPR2RQcytCNDlKRnJpQWt5ZlFQMWc0RS9jQW8yRW53SzBlYWpDelZC?=
 =?utf-8?B?YTBLdTRNUnYyMGppc1VVUjBMcUhWekNBS0VocGorcE9LM0dsTFJRTlo4K3Fj?=
 =?utf-8?B?Z09nWnYyLzdhRFVzbXpCdk91SFpUVHhadU5DTW5ZSVltTGM0emhpQXJvUFE5?=
 =?utf-8?B?QlZuaFRZM3ZkRnNkMFc5REx5cHY1ODQwWlRCaXFENzZFOXNkckxOYjc2MytS?=
 =?utf-8?B?dEh5Y09OTzJaUWVKeWt1V0piMkRKd1FrbUc4dHpZb0wvbVZNL0Nlam5oZHRM?=
 =?utf-8?B?aWoyczNUVTFicXBUeWN0d2tUeC9SNDhhZ1BQZXB1RmxUVndkZTlMQzlydDJr?=
 =?utf-8?B?OGFMUnNTeU9XcGhzOXFIYmNyS0Z0cmk4S2FrY0tJWTc0SzRET0xKZGoxTU9U?=
 =?utf-8?B?TUJBL21zNlk5RUpIbm5taVZSU0NsNXA4b0phL1lQTDlLNWlHUGZxb3RWeWNu?=
 =?utf-8?B?SGN6V2VrWFN2OHlackhhZmlXUUtreVZRRG9naVNRQS9zNmFXV0NuQ3ZWN3pz?=
 =?utf-8?B?akliUFp1Sk42NVQ4MGw4WThRcjAxTS9rQUtKWXVIZ0xQSy90Vk1DOFZlL2dZ?=
 =?utf-8?B?QzRMUXJXc2lBQi9hdkM3NGdGdmZYcFNRTGJKcmxYUHo5MjZmSlBOaUZnbEIx?=
 =?utf-8?B?cnB2NTlUbHRNZEMrbXY3Y1FHY1VyZVZjTlFGMW16Sm9GUGdFRnZEKy9oZkZX?=
 =?utf-8?B?QytjZHg4ZXMzakwwU2NsenZHUkx0SlVhWGtkcU0xNlNPU0s2T00xOXRtNmJV?=
 =?utf-8?B?MVFJcVpYNWhZRGZXUmd3TVBkcy96SEpEV1VWNEhxTVFSTlgxaWtsZzZGWTA0?=
 =?utf-8?B?YytCV3RhOTBSV29BZHBaN0R4bzhiMTJ1SGwwT2k2d2RlYlRzbitDbXV2NEVi?=
 =?utf-8?B?eCtxMloxRkF1OXlhbUh2NnBkWDlVc2d4YUhJY1RVV1hHRTZSNjBBTUhSRHNC?=
 =?utf-8?B?RUJzSkVnY2FQbnp6U0p0a2pXa0JUL0ZiT3ZmdFhJR2tYNTFSTTJGejRlRU8y?=
 =?utf-8?B?cEhWK3BDWHlEZDhSYldKM3RnS0tmNDl5ZHB2dzloQkhFZ0NOSnNLUEZZMWdW?=
 =?utf-8?B?MFd2bThPbG9MVjN6eEJlZzB3R1FHazlaSDlQWnBqdktoT1NFd29ra0t1cnFC?=
 =?utf-8?B?WjBjVHhaRk9vYjdkVUZtSFNmeFlFTmVKWHFTRy9jMjBhZ1E0ZUJLUFNwUjY4?=
 =?utf-8?B?cmFjOENOTkZmNmhXOXo2MCtCMEZYT3Z6SzZwL0tNK0k5UzBISlRpL3lWQzBo?=
 =?utf-8?B?R2ZWY1pwV2VPWnlqUUxOL1RrT0hJSGZnS1Z0N2ZOZXNvWGkzV0xrbml1SGIv?=
 =?utf-8?B?ZnUyOEFBa0xjUzdxd0VHU0hmU283djhOWkhKTEFseUJsM0ZneDlQN1hnUngw?=
 =?utf-8?B?RHh2TllWN3BXaVlsbklTcmNzUzNMcEFNak1Oait5WVN4N3c4QW9KOGNSRVlI?=
 =?utf-8?B?U21JOTBENnAzR1BxaGVMSTBLNXgyRUhRTlJtT1J6MmVsSGFPZmxiNy9qakxz?=
 =?utf-8?B?U0lPU3hBZHVOWHltTG9jNkNEV0V1UTJ0TXVZZkREbXlpY1hjdmt5MEdTVDhR?=
 =?utf-8?B?eU1UenhqUDE4NS9VWHcyZXVVSkZ2NldjdXhUdTQxYUlBaEF4Si95VFZmS3l2?=
 =?utf-8?B?dzlteVJhS3dZRWxaN3F6UWg4MG8rSjFidS9XNnI3TCtNNVJLcTJBZTQ4NUJD?=
 =?utf-8?Q?5gjJZIovDKdepyjuZDNAHiZ0i?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6001cb-4ff2-4a25-10f1-08de2c4932d4
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 17:36:43.2048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NABxuA7D0lM2ri9OFCwey3q0jsNtND61gZQH8mWttLPKNU4LyaHfDFX43FIkZKepHx2lMTA2tcvL70IV9vW2HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5284

On Tue, Nov 25, 2025 at 03:14:27PM +0100, Jan Beulich wrote:
> In particular when linking with lld, which converts hidden symbols to
> local ones, the ELF symbol table can change in unhelpful ways between the
> first two linking passes, resulting in the .rodata contributions to change
> between the 2nd and 3rd pass. That, however, renders our embedded symbol
> table pretty much unusable; the recently introduced self-test may then
> also fail. (Another difference between compiling a C file and assembling
> the generated ones is that - with -fdata-sections in use - the .rodata
> contributions move between passes 1 and 2, when we'd prefer them not to.)
> 
> Make tools/symbols capable of producing an "empty" assembly file, such
> that unwanted differences between passes 1 and 2 go away when then using
> the corresponding objects in place of common/symbols-dummy.o.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reported-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

LGTM, not sure whether you want to extend to other arches in this
same patch, or simply guard the build of symbols-dummy.o for non-x86
arches.

> ---
> May want mirroring to other arch-es.
> 
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -134,8 +134,10 @@ $(TARGET): $(TARGET)-syms $(efi-y) $(obj
>  CFLAGS-$(XEN_BUILD_EFI) += -DXEN_BUILD_EFI
>  
>  $(TARGET)-syms: $(objtree)/prelink.o $(obj)/xen.lds
> +	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0.S
> +	$(MAKE) $(build)=$(@D) $(dot-target).0.o
>  	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
> -	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0

It would be good if we could now stop building symbols-dummy.o as part
of extra-y.  Maybe you could guard it with ifneq ($(CONFIG_X86),y) in
the Makefile?

Or otherwise remove this from all arches thus removing
common/symbols-dummy.c.

> +	      $(dot-target).0.o -o $(dot-target).0
>  	$(NM) -pa --format=sysv $(dot-target).0 \
>  		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
>  		> $(dot-target).1.S
> @@ -207,9 +209,11 @@ $(TARGET).efi: $(objtree)/prelink.o $(no
>  ifeq ($(CONFIG_DEBUG_INFO),y)
>  	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
>  endif
> +	$(objtree)/tools/symbols $(all_symbols) --empty > $(dot-target).0s.S
> +	$(MAKE) $(build)=$(@D) .$(@F).0s.o
>  	$(foreach base, $(VIRT_BASE) $(ALT_BASE), \
>  	          $(LD) $(call EFI_LDFLAGS,$(base)) -T $(obj)/efi.lds $< $(relocs-dummy) \
> -	                $(objtree)/common/symbols-dummy.o $(note_file_option) \
> +	                $(dot-target).0s.o $(note_file_option) \
>  	                -o $(dot-target).$(base).0 &&) :
>  	$(MKRELOC) $(foreach base,$(VIRT_BASE) $(ALT_BASE),$(dot-target).$(base).0) \
>  		> $(dot-target).1r.S
> --- a/xen/tools/symbols.c
> +++ b/xen/tools/symbols.c
> @@ -672,7 +672,10 @@ int main(int argc, char **argv)
>  				warn_dup = true;
>  			else if (strcmp(argv[i], "--error-dup") == 0)
>  				warn_dup = error_dup = true;
> -			else if (strcmp(argv[i], "--xensyms") == 0)
> +			else if (strcmp(argv[i], "--empty") == 0) {
> +				write_src();
> +				return 0;

Oh, that was easier than I was expecting for symbols to generate a
working empty assembly file.

Thanks, Roger.

