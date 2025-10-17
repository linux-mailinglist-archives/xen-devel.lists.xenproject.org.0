Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 512C7BEA3C8
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 17:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1145264.1478344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9mkN-0002Ch-I9; Fri, 17 Oct 2025 15:52:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1145264.1478344; Fri, 17 Oct 2025 15:52:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9mkN-0002BA-FF; Fri, 17 Oct 2025 15:52:03 +0000
Received: by outflank-mailman (input) for mailman id 1145264;
 Fri, 17 Oct 2025 15:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rDIu=42=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1v9mkM-0002B4-3M
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 15:52:02 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 360b04bc-ab71-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 17:51:59 +0200 (CEST)
Received: from DM6PR03MB5227.namprd03.prod.outlook.com (2603:10b6:5:247::22)
 by CO1PR03MB5908.namprd03.prod.outlook.com (2603:10b6:303:9d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 15:51:53 +0000
Received: from DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2]) by DM6PR03MB5227.namprd03.prod.outlook.com
 ([fe80::c9a0:563d:c344:aec2%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 15:51:53 +0000
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
X-Inumbo-ID: 360b04bc-ab71-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DODxHeo2OngVSR5aH+DQqhy6KE8xdm1FYP0BkOQ3bh6LoJPd5lvWEA1mpf3r/p5708/rTQoR/pKdmGZxvAvcM0cNHuO//0hDodrfiuYCjy4Y4RochDAnnsnP3DD5hc7YuBK7yt0zo/hRnuvrPyctEmmaDPSuSSJtmvELrFFWqDcw98ToSSR5zQPhxtn5sh5GG6cmOqzwHpiqgOb5Fp6EpW5P3OpScxrK7gnQRRGFBRwokMjA4zAvkDGBnJWJXljIsWZ5S9BMGVzQ6V+sxsufAiR3G9DCnpZSn7s+55RTJesD9KR3yVfn1NjhtmPFoWBdAWwoOm27QYnojSLONnWCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qMWxcf0rg5YHkceVGM3qS2pgcb4t2ikbgNbz1m3Vhc=;
 b=n4gFODnTDEhE8UXXJhV3ElIuH0jeMDfcJ/LFiZUw9FkiCo5Gw/ltVHJ2ZB6j5NHaR95m9rW9TNtOF+7qS5vHSnkH5tkeGU1m2tmmZ/io1rZq5phsp4iGtfbEXguYJCkXvXRN2AXKasUjr3fDGS/qC9tNZbd1IENw4R+mrmc/INYimqbqzOJhzxF6pgb90IlCcCgObVSjSIWgn1GaegNBGiBc2Oi/4Q+vslT0Wbb2QaYYMvN6zHzJ9VjPGzCNZOa9jlAisE8dAYBvNiGs6SOkme67PspIIi4Cg5YpLymTwM4nT+1SRg7fHilfq6w7Ia7UhsthOt2NyXD+UO5yrfR/PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qMWxcf0rg5YHkceVGM3qS2pgcb4t2ikbgNbz1m3Vhc=;
 b=WovroAtZy6ShyqYhglHYBtR2P1ySpfcyx7dzfCmhTlQNmH4JMoLPjApkgGuEL3Z05teKdCRNKNc8wLekV4nAzZxBOKzYSgSh8zfD7iRhMG+4ZVl34J/t8zlCDIjkAulNdzOf2682e4OCJWE76G1cD+sLIdWj4HIOc0ijnregjl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: qemu-devel@nongnu.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] hw/xen: pass PCI domain to xc_physdev_map_pirq_msi()
Date: Fri, 17 Oct 2025 17:51:36 +0200
Message-ID: <20251017155136.16540-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA2P292CA0011.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:1::15) To DM6PR03MB5227.namprd03.prod.outlook.com
 (2603:10b6:5:247::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5227:EE_|CO1PR03MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 55257727-9222-40e1-c175-08de0d951767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGxwei9sdEk1c0hTZTdxNndRVi9TMmRQMDl4ZVVWbTdUdDQ1VkM5ZC81aGtB?=
 =?utf-8?B?NElIT05hdFhwblJVTHpGMDNBbiszbVB4WkloUHNXUE4rQmZiNFVJckg4MFpw?=
 =?utf-8?B?Q2p0L0U1SUtHb3p0eGp0eXFDQW9QaEcvbUtyQXNYcHZKYWxjLzFETkhjUlVM?=
 =?utf-8?B?aWFHOHJQWlpIQUJmTzF3NnFUZUJ3bE13RmpNbUZNUWV4L0tEMXNTQk1oVk8y?=
 =?utf-8?B?eG9vYmlyRkMzc0FHSFd2WjZrb29iMkpuNmNCRmY3N0tCOXV6b0dFclQ5bG9z?=
 =?utf-8?B?N1FxUVZLdXpQUGxzQncvcUExcTlXeXFjMDBwMDE0TG1peUEwYXJRb3c3eUtR?=
 =?utf-8?B?bldObks4d2NjMjNHK0VlelRFUkVmQUlSNHBrTWxCdFdjVDBsUStCZUZ1VVZC?=
 =?utf-8?B?ajhuZVBNb3FpN1JuYWFqS054cFliaVlzQm4xS2Y4endQeWdUMS8zR3B3cklk?=
 =?utf-8?B?b24zVmR1VmFISDA1VDRPblN3ZmJSanhPc0dSTnpmNFpLYTRMcHVCeTIwVVpD?=
 =?utf-8?B?ektPM0xrR2lOcGpIOGFkaFgrbVdSMGgwMVdJZnJCUTlyK1dQOVIxVHhiZ3ox?=
 =?utf-8?B?TVpvcWd3NWJqWlc2ZTY0YXJ0V1lwck1kMG1zOGtMYkZiT1hCZHBiZGNoNWZh?=
 =?utf-8?B?ZlFWL3hvV2VwWXRIWWFQM1ZEWWQ5N2ZFU3VNVWQwUXR4bUJTWTUzeTJwSndv?=
 =?utf-8?B?MWEvZjI1M0FDOVhaK2lQWXJkOXI4eXJNQ1JaUnhwV0lFajZZT0FTQ1Erc3BR?=
 =?utf-8?B?UllldVE1dTg4ekFGeTdPdHpCU01XaVYrUitTMzdvL2phbnlHbW5aajFZVmE0?=
 =?utf-8?B?a09QZHJuQUgxMzZKM2dFeW9aLytqZjVVRGkyRUMyYW1qOVFLTkdKeUw1VTls?=
 =?utf-8?B?QkxMNFNwcmVPK2hZbTV1S29KS2xuVmhudjNKSjJHZGIwaXhjR1hJMGtENjNY?=
 =?utf-8?B?V1l3SmFvclVmdHNUVDlkOFltbFFxdXBvOHFzc1d0ZkVrUG1uZVZuU0RCNkc1?=
 =?utf-8?B?dFBMeVIwL0pUcmVFSWZRMU5ab3hyeE9SbVBvZzlydDQyL29vTkpybXZhTUtu?=
 =?utf-8?B?TXZnYUZObFg1MVZ2RGUyUzBWNVIrMXRqQ25va2lyZEJhREx2aGxUV2hrWGln?=
 =?utf-8?B?VDRHS05KQnVnSmVMc1Q3Q043RW5lTXorV1VHNFpDcEp2akZmaHliRmVCbXIv?=
 =?utf-8?B?QjdyOFhSN3FHMldwd25MbGdnVGtobElBcU9pNjBIYnBNazFURlZ0Y3hSc0hO?=
 =?utf-8?B?ZUkxWnRaUjVNNDgxOVp0V3J3NWZPN0twYkFPSVlTa1NFQmdtSi9hNjBOd0ly?=
 =?utf-8?B?bGk2VkxTSzJ1M1hzTitKSXBuNlIzTFBrbnZFczhId0pYblFtVEp4eFR1WVdP?=
 =?utf-8?B?ZTVYa1JRcUgyWm1JK3FwcnV6TFpjcFhpdUhrQ2J5WCtmY2hoNTlKb1dXcnYr?=
 =?utf-8?B?c3pIMUE4aDROSVpRMnpkOEwxdk94T3UvV0hQYWtIcElGd0hlVDNPNG9aUEJ6?=
 =?utf-8?B?d3NZRmZvSXdOTlN0Mi83REpEcUhHckJpSy93WlJRUXF0SWgrV2NpY0I0WUZN?=
 =?utf-8?B?aFBzNEtPcU5GclRmaEZaNVpEUWVsK1BmRXJnOUFIa2ZoMFg5K2FoWi9QU3hH?=
 =?utf-8?B?UjdVdjVONStwYi9qMlRCdDArYzMxb3pSdkhxSG50S1lqbmNzK0gzT3VpTzU2?=
 =?utf-8?B?U0lBbGp5cHYrS0pZWlc5T2V3Nms5azRKZTVIcUljNDAzZERKTnFnN0duQ29i?=
 =?utf-8?B?bXJSZlZBY253bEtEZEROWHJ1Zi9EL2NqeVExM21GYXl4MnhDSVl2eHhJUXZi?=
 =?utf-8?B?ZE5Gd1VTMnVaVEZlajFrWkVrU2F0ODhwMU5pblVCWm44L3BEMzdLbDkzSCtI?=
 =?utf-8?B?UGpsNDBmZWRNSjQrQ0x3TE40YTYwSFV1SjJjTnNBS0svTEQxc245dFlLS081?=
 =?utf-8?Q?s6ftQJLOppwN+is+sUUMrKRonLKcT35n?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5227.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEEvcGxSU1RlUkRXVkxZa0dBV1MrMU5TREliWmFpTE8yR3hhNk9YdDBiK2VH?=
 =?utf-8?B?UyttQ1lBdHlheklra3l1cHlKYmJwT09BZjZ1UTEzd3lXTERpSkVvM3VpRnNX?=
 =?utf-8?B?WWdTWFNrY2ljWGVUNnlDb09yUjBHTzJRVzcxM3YwVzJvaUdlcE1zbUIzVmJX?=
 =?utf-8?B?ZkQwaUxVdmUrelFFY2s3Snp4NGdZTmp2YmtJRXJIeTFqZDgydEkydnRvSFpY?=
 =?utf-8?B?VG9TVlhPL1JnSU1NUVl0R3VVQWVhSzloeEU5Q2ZjeW1qR2RNUkZza2FTZUFV?=
 =?utf-8?B?UGJvVWE0YkY5WTdtcDN0YlRYY2dzU3VONUZMTFcxNmNBNlUxOHU2S0Y4ejNv?=
 =?utf-8?B?TE0wNHUwc3J4bEtHTUoyM0x6K2luQ0tJT0o4ZnE0N0psSWRFWTNWTGN0QkR2?=
 =?utf-8?B?V3NmZWtLN3d3K3ErOG42VG5ZT2dZKzYyUHJBd0lFMWtKRjZrVUpPaGx6OFJl?=
 =?utf-8?B?bjVZQzdMaHNCejhtcFAxWjVjNXBQcTFHcE9jalN4NmZqNWw0allOVS9XcVJH?=
 =?utf-8?B?Z0tRS3FobmF4dEFObzZXcHlVS1dvd1hHbVlPNEZUL2IyWStpM05WcDlmVko0?=
 =?utf-8?B?T1F6SVVDczB6RVVjZHRTRlA2aGZIb0RZcnNCN1JUSjdwdVhwSVpHaE1zenVh?=
 =?utf-8?B?UFk3b0VRZnQ3NmpIWmZIVzMxYUhKZ0xWNi9JQk5sYlFPcDlLdlVGWlR5dWx0?=
 =?utf-8?B?ZFBVVW5mbkJOTUxlV1lzYVZvTkYzeGZJem1mY3owODVEUmE3L0J6TGFvMFlH?=
 =?utf-8?B?NXdsU0ZYNVI1L001YkVjT1Z1N0JRVjFmZ2tKZSs0MWxRVDRBcWF0NWIzRjBa?=
 =?utf-8?B?Vm8zUlRlQXU1Tzl0WFU4QmVmbmpld09tYnlJaFkzV05qZUlBd1NZM2g5Lzd0?=
 =?utf-8?B?dHBWWmFnR2x0RU11OTFHNVFJMFBtZjg0MFFXTnlnd0F6WTFBTTF5ZG9Kc2xn?=
 =?utf-8?B?cTR5QUxJQnJTckZNYXlLK2tUYWNyTURDbFpPOHl3aVlabVNPS0JIdGZWSERY?=
 =?utf-8?B?S1I5MGI2YnNCQ0hzS1BzSlN0Wm9oMnlGSHpUMzFFdkhKejdYYTFlbm1MZEVo?=
 =?utf-8?B?Nkh0azk2TStFTU54Y1c2QUduMG1lQWJHMDJkZ0lJOHJvYitrdjZBVXZlbGdj?=
 =?utf-8?B?aDBQYy9jQnBNREdmL01paVBmUnFLOHVXVjVPQ3g4TkMzWjFYUDZKQXpOZVk4?=
 =?utf-8?B?NkVWeExCeGUwTWZrSXdCQ0h0VHZCWUprdGRBcTIzalhEckZwTDFpWDJTeFRG?=
 =?utf-8?B?dUIwQ2JKd2RJTGlMMFR0SE9QbndHWi9WQVBMQ3BYWllrbG53Um90ekh3TS9H?=
 =?utf-8?B?eEVSYVRmREhkbm9Lb1JEaXVKUjFHa0lrUWZJWmxDcEZXUWxMOG84OGdza3pF?=
 =?utf-8?B?dW5kRW1RWXYwaUJWUWc1L0kwd1hMVkkwMXlWdUR3NFYwZTdaT3MyNXY0Y3hh?=
 =?utf-8?B?YzN4NlpvMWk3UFNxYkxrOHYvZVRSYVp3eGZoeTN1QXpHTGdWeHZKcjBPWG1I?=
 =?utf-8?B?TWxncTZNUGNZZ1V1K1Z5NGJFRUFkRGVUVWpUd3RIRE5nYVVXNXptT1lOc0Yy?=
 =?utf-8?B?TnIyaXJXWFN3QmRmdUxnakFiMlBMZ3FIOE5KTk9RTFhSL0Z3Vk1uTTBiVFZ2?=
 =?utf-8?B?emxVeDByTTEzVVM0SFZBTGExM2U1YlhFbGFjMTNoblRINWFDWHNYYmRvdWlD?=
 =?utf-8?B?RE5HbUVpU1dzZ2lCUU16b29zTHA4K2VHbFVQVlpyYkgwMGY5RThqR0dWc2xO?=
 =?utf-8?B?QTdiRUNCOW5jL2JnajZUTXNhcWhoQzNLL2R1TGxqdCswd2xPMjVaUmRrQnRM?=
 =?utf-8?B?ZXRMUGpTSHRZa0JKTEsrNFZlekJLWm9xbnB0czBJdGxxQzl1SFUwcTRURHRC?=
 =?utf-8?B?Q1NRSGJ3Y2I1aUtUVlFpb2o1QkhsTXNVSkpzdnBXblg2WW5XS2pMVmk2VS9v?=
 =?utf-8?B?cFQxSVlqYzVzTmZ5SlVkcVZwdXpyaVg4WnlTMEVqelJsS1FVN0tZR0RFOWFL?=
 =?utf-8?B?RjdNLzY1RFRBSWduL0VucFBBczIvZGV4REl2eTFXRW9scDBnZEpEejRaU0Vv?=
 =?utf-8?B?NUd6d2lhWUZ5NTdxSGo0VFJHc21pbmZHOEg0NFlTNmJ0bk9UMTEvM01ueGIz?=
 =?utf-8?Q?zV1nQ8+KO+U3ZVlbQ6tOi2dND?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55257727-9222-40e1-c175-08de0d951767
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5227.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:51:53.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /a+6d5BvsPnlvbQOUxzweATilvANoN5NpSl3MuPQWRTZEUkmkX0s9HIiOr1iZACWH0I2FPfSXuXEQcYaqjT9ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5908

It's currently impossible for passthrough devices on segment different than
0 to work correctly, as the PCI domain is not provided to
xc_physdev_map_pirq_msi(), and hence it's unconditionally assumed that all
devices are on segment 0.

Adjust the call to xc_physdev_map_pirq_msi() to pass the PCI domain in the
high 16bits of the bus parameter.  On versions of Xen where this is not
supported the passed segment will be ignored and assume to be 0, no worse
than the current state.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony@xenproject.org>
Cc: Paul Durrant <paul@xen.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: xen-devel@lists.xenproject.org
---
 hw/xen/xen_pt_msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/xen/xen_pt_msi.c b/hw/xen/xen_pt_msi.c
index e9ba17317aba..df15ccf0d030 100644
--- a/hw/xen/xen_pt_msi.c
+++ b/hw/xen/xen_pt_msi.c
@@ -138,6 +138,7 @@ static int msi_msix_setup(XenPCIPassthroughState *s,
         rc = xc_physdev_map_pirq_msi(xen_xc, xen_domid, XEN_PT_AUTO_ASSIGN,
                                      ppirq, PCI_DEVFN(s->real_device.dev,
                                                       s->real_device.func),
+                                     ((uint32_t)s->real_device.domain << 16) |
                                      s->real_device.bus,
                                      msix_entry, table_base);
         if (rc) {
-- 
2.51.0


