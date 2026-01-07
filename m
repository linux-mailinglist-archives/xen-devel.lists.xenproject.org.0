Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FE2D00044
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 21:34:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197224.1514832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdaDk-0007t3-OX; Wed, 07 Jan 2026 20:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197224.1514832; Wed, 07 Jan 2026 20:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdaDk-0007pv-Ls; Wed, 07 Jan 2026 20:33:32 +0000
Received: by outflank-mailman (input) for mailman id 1197224;
 Wed, 07 Jan 2026 20:33:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PFOO=7M=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vdaDi-0007pJ-Sw
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 20:33:30 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fe9c79b-ec08-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 21:33:30 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by DS1PR03MB7845.namprd03.prod.outlook.com (2603:10b6:8:21c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:33:26 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 20:33:26 +0000
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
X-Inumbo-ID: 1fe9c79b-ec08-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZgUtDQ9oUgampNK88UBgjvEnAuAoGR/5iE+ZJ2B+oJMDf5nD2Qi3WKBXas4GVYjTHaB6b4HevMLST1ImnBhwqnofDJQX9Y/n4fYebq+Vd7P2pfGwTYhIijJsAzWuQquBYpsymufQmUVmnvz/wkGagi3s2UTTUYdZYl45En/bxACqcljptU3g3faNCveu6f0wUB2OPkODsjAbwCFfU4X/0wYhwOaxpo/7XdJdynSj81y96oIg/544ijsT8xFpbnvf92ak1+CUAsoRwy3Q7NhpW25f7Xp6UxQNJA2rTAENeRupLYIXENp4xxKyyMPTIfKq37/BrXLoJqa/R1RF20yCZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3BJtMRKxVuXEnoIV9FOzi+tgLxVenbBPFNkP9YtRQ0=;
 b=cW4+NsxCGEnDvWLRPx4uENGf9mfHawSqk8xgy5yo/y24afsYHYlTyqQZ9tDZqKQmT1I7Inls95k8T1J27vkGAIrfmBTLCyCkpXH+zvCNuwueY8RtXOrSId8gDct40xtubNGvpwHN0TZAXm5hffIvz2Lc5Spi16V2YJ2Q1PMZfrYPG6znPYt5Y4ynJSkQljL+c4Uf9YfjPKwjtm5hP4rmthyU/ae71NkZmXua1ppVLDEpOCqzBzr7vOuHEKYaCt9dmbVr4Z2Jn3yMH6XtYjD4hoNt1KLGu1wO5OBoNP19Gar6uGL1me5N9NqqSsCMR0x//POh28gba1aUPTBbOWThPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3BJtMRKxVuXEnoIV9FOzi+tgLxVenbBPFNkP9YtRQ0=;
 b=uzhGOkREnWooUfyjSfFF3weBScj23LtUvJcETSORL0XHbNMkDNLSvrhaPJNyM1bdh1TPB157FLAaqSC/BTQvdbREEhzThmHHzi4yBFTo7MbrLl4c3MSSCH53Gy8E2Ajs4GbMPloU6biFOjp3r2jnB/7f1uwajGq42sg9vfoIbcc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] x86/hvm: be more strict with XENMAPSPACE_gmfn source types
Date: Wed,  7 Jan 2026 21:32:59 +0100
Message-ID: <20260107203259.59369-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0315.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:395::13) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|DS1PR03MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 68644b76-69d4-4b1f-f371-08de4e2c02b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QUJaQTBpVFRHMnN5NXlUa3dnVEVMc1hrcTg2RmRudW5VRjNtaEZueUMxaWNz?=
 =?utf-8?B?TnpvbFlBNnlyb2JPZ255MW9UL0hBeXJDTnJZZWJQQ2VvTVJIWlZEV3A3VHIz?=
 =?utf-8?B?ZUQzSEtRcStrSjRXcExqeFIvOTVvNlB0OXVoTFNxR3lDWTd6WFgrdTJsTGw2?=
 =?utf-8?B?TFdKSUphRHhPak9wbUlmTXM5NFZPRkNNL3RmM1A0NVdKR3ZPR29HclV5aURo?=
 =?utf-8?B?bWN4dDFTN1JBYXo3bHJScy9FbElDYTF6NndrbzVHcHBhRWVIZDMwZ3Jralox?=
 =?utf-8?B?WXFsVGM3U3krckd2VndxbXVicit4NVcxc0FzcHF3ckl2ZWZhcmgwVUdaNUND?=
 =?utf-8?B?b3FqZzRxUjE4WVpOTzhzM0RwS3ZGLzRVTGdrcUEwMGJzTVorUndpWjFwbWpr?=
 =?utf-8?B?dzRibVlDb3ZoQldGZTFvVDlrb056VGkvR3k5dXJacG9DQ0U2dENHd29xa1du?=
 =?utf-8?B?dng3OUg0dVJXMGFxTHNEbUd2NGhEdytVWVJvWERuUzhmdTVoOU40aE9BQjI3?=
 =?utf-8?B?Q0pnVGs3djBudlRuVytLdzltOXJ0MXVoWGdSbWRmOGVha1YwVTFjV2xyU2FL?=
 =?utf-8?B?VXdWWXJudGV4QnJRaXYyOGg0YUlzTkpvZnViVFpzNkdjQzlhNWtjSVpKeFI4?=
 =?utf-8?B?YVI5Szl1N2E2VU5WYzkvRm1Bd2srV2R4R1Y4SkxTN1lSS3RxcXAyNDNGOWpy?=
 =?utf-8?B?eVlDWDZqcVR2cDNoakovaFc0VjdIUzE2dkFZVDE0ajZ3THhnWHlOQUxuQUJk?=
 =?utf-8?B?RkNTbWpEUnJDNmQ5MkZjSTNCUlcvNjhjeEpMNW5uV2F1MUd1bFE0SWhoUTZR?=
 =?utf-8?B?bnphQ2I2VHdtbk9GU1ZiSmdZRzBqVXN0enp0QXpTQWplSThlQ0p0ZFVFcW5Q?=
 =?utf-8?B?MUVjTytObVFLa0kwU0IrQkR0L2wvRE9MOFJtR0NSeWVOWXJtcEhKZU9GOHZH?=
 =?utf-8?B?TmtyRW9JT1dybzJDT3hDTWZweER1Rk5SK3VFc1cvd1FXSVdHVnlzN2JlSGcv?=
 =?utf-8?B?Y0xNcFZvSC95MEYwVWphbUhia2xrdTNuSjAyRHRLQjFIYlVBSVhvZlJTS1VR?=
 =?utf-8?B?aWFuVnhSVEExZWg5dk4zV0RSNG02RVFPOS80d0IzTkM5aWltc2RjWThmUGlN?=
 =?utf-8?B?bnVWaWhTMjhxTjlVbmVsZFB6bWtGT0t3bXRBUWNKVWg1c1dQM1NVUHhLRXNW?=
 =?utf-8?B?VVpRSE5YMGFQZ0JjWitIUmFEdGV6Q0pqek80SnNWRWVLVkY2d1dVRFFsVHJw?=
 =?utf-8?B?NFh3czJTQzk2NlkrMVJ3ZjBESitXSEVFenFMTDhKazFuZFR3eHY4U0Y4ZGNP?=
 =?utf-8?B?RVlpakRzMWdrUTJJZjBuYXFKRGZrRXpRdzkyeDhQaVYxK0VteWpTRVRVdWlh?=
 =?utf-8?B?UThjNDZiWk53Q29wcWc0Z0txTmJZMXkxZ0xSRDdkcEdicktlVWZaUWthRjR4?=
 =?utf-8?B?TjdFN1NoMFV4S3BzSVNiN1lmamdHZjI0bGFIODdvQWRNbzEzbHFGZktrTjVJ?=
 =?utf-8?B?RTd3bUJFTXRHamU1eXFBalhyU0N3R3VyTGw3TjZ2NFppc0dWWGRaazFoak9H?=
 =?utf-8?B?MTRkNUk0KzBtTVRXQURlS29ZWjAzcFdySGQ0YXpUNFJsa09YSEFnZHd1RFFv?=
 =?utf-8?B?d0VrbXRqN05kOUo0YmlXT3p6Q05wWE8yNnpBeFZEYUhLem1ERitaaGxHcU5u?=
 =?utf-8?B?MmNXb2UyYWtybFFzYlpFdzNMOTRVbHNhZlplN0Q5dUZTamU5cGtGakFTb1Rx?=
 =?utf-8?B?T1QyV0xlK0JzZ2Z0NEJCdTVGclRtcFR5K0FmR3liRmRNdEovZktjY1ovVmlM?=
 =?utf-8?B?VnkxVVVIQlZDUnBvMkViZ3lDSEhkRTQxaEgyak5iVExBMEEvemovSkE2Mkkr?=
 =?utf-8?B?dFFmSVZYcTBvanZiVzdHNkVuYjFEbDgzckZhUE9Ba1Vyc0R0TmdCN01oMkJP?=
 =?utf-8?Q?zXI5MNzcGcCUSziEyGwJwiJAEkm6ni8X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXpuWHd5V25BNG10cGJTUG1IVnhQemw4aTZTUS80a1hOemx0MmNUb1FqYkxz?=
 =?utf-8?B?MlBRWWQ2TytBeFZodXBadTdpdEMzUGRWeFRPcWh2bUVIZGMrMTFZWWRRd2NF?=
 =?utf-8?B?QXc0RUhUb0l6SERnejZZcVFHUVd6djRxSlFOMmZwbFU1NlhOMTRHb1d3dFI1?=
 =?utf-8?B?KzBMbTRNZXVrOTB1VlZmVy9wWmRVcFF1UTl4U2l2Q1crclpoR2RlR1FybzJJ?=
 =?utf-8?B?SjZwa1Qzdml2MXJwUFUxRVJRQ0tMQllqZGRyazBEeEY2WHRUZWt6cGlhenZq?=
 =?utf-8?B?SkhvRFFUV2I2Q2h0bkRVVnZibDNNNVk2ZG1nVlZpVmltNVNqZVJPa01QQzdx?=
 =?utf-8?B?bTlsUk1tWnZ2clExeFBSR2RHelQxbXFJQ2Y0U0pHL2hseFhxdXlTSTlhN1Nq?=
 =?utf-8?B?SmpBek5wRXJmWTFrWDJqNHE2WVQyN0I5QTFaNVNIQjNoS2lCUmM5aVdkL1U5?=
 =?utf-8?B?QjF3VEpLYzdjeTdtbjJLWERoTHpnVEVWYk9nUi9OV08vYjdYdHdqcjF2YVB6?=
 =?utf-8?B?dVRrL3ZweVozcmUxaTF3OTBPSzFHRFJKdmdPVHFIYm1wQ1FOTDJHeklNaUxa?=
 =?utf-8?B?UW55eEpzZHYxbU5Xc2I3RWNzazVqSlZmSjUzM0t2dm1oNlBBM2g3Z1k5YjU2?=
 =?utf-8?B?NVpmZ1JjbDl6bGN3UWt2bktNZDJhaDNsdWhIM3l5QXdDWm9kY1RsazZBeFpS?=
 =?utf-8?B?cURoTGZNczdlQnRZWGlwMHZlMGw4Rm54TEJSVWxOa1BWcnJWV3RnREQxSDVh?=
 =?utf-8?B?Y094eG90SlFxalBNdDNpUmxPdHJPaHNLYVhWL1BaUWJNSWNCL1lxc1pmK3p3?=
 =?utf-8?B?RnFtNmtxc1pTSXlQQUEwbWJVQk1zeTRlVExCallCZnBoanplOE9iUkFnd2tO?=
 =?utf-8?B?TmRJaVFRVE9lRHUrTm1zV1ZjUUJPZno3ekdlbCs0R1h6U09qVk5zblZmdDBm?=
 =?utf-8?B?a3VGZzRoOXR5MXRjSGpadjFOVHUzWWZqRGpxRDlxWGNkMFNoaXhGdHFKZkta?=
 =?utf-8?B?WlVnQ25Nb1F5d1BrMkxXQzIxQXhZV1hTenQ0YlJIWGNGWUpBV2lpRm9KVE5N?=
 =?utf-8?B?ekI5d3ZHZHdkSVZVZUpNMkg0QVRjVlZzTUEyNkxwL0c2NDdRR0VZTTBHeG93?=
 =?utf-8?B?dmQreHh3SUdoY242aDRYbnQwVk41WDdWOTJzYWNuT0VLdU1vcXhUMUxDVDQ5?=
 =?utf-8?B?OE13VEVubXJINDlrWDh5aStJWWQ3L1AxOTVJSHVkUUZzYVNWRnhRbkV5ckdJ?=
 =?utf-8?B?SHdDTzZXM1pPWDlnUHpoaW85TDVaMElFdmRnR0t2b1FydzJBZEt1bmh4a0gy?=
 =?utf-8?B?SnB2dHVna1Q2bkFNdnJmOWh2RC9WTHRnbzdBZFN2YXBMRnh5V3g4Vy9Yd2FZ?=
 =?utf-8?B?dnlDaUJNQ002S3JyUnJlbzh4Vk5mK1VDNHZ0U2JwY0tpY0pHM1FCQ1c4aDB5?=
 =?utf-8?B?YTNhQThjNlBxS25nOURyT04vYTRHUVdoQXZBQkZLS29aaVNUZ3R4Ly9QcURm?=
 =?utf-8?B?a010MXZUU3Q5K25lTWFHdVZNTUhEK3A5VzJDMExpZFJtc0tCRXY0ZnNWZ3dP?=
 =?utf-8?B?N3hyYTRXSGFyTXlQTHNqWCtOQ2VXc0JkRTA1ZGI5UEhxaU5BQ05rc1k2Q0tL?=
 =?utf-8?B?T01vd2prT0NaY3VnRlowdEhtSGhmQXpOYmpRNmtvUHNsbUpDb09NZEhyZlU1?=
 =?utf-8?B?Y3Q4WVNEQ1d6bnpSR1RzNmZiVEtXWEtTaDBkUkpGenBIby8xY1dUQWlmbHND?=
 =?utf-8?B?N1dUeWNJZ1o5TEVNaS9SR1QyZ1FFQnNNT3l6VkRJQXlWTldQWitFOE1GR3N2?=
 =?utf-8?B?WlJDY255RUxTd2V5ZDRuV2Ntc09VVjUxc0JlNjIreEhLKzRjaDBPa2l1ZU4y?=
 =?utf-8?B?ckx4UWM3QzBSUVRmcEs1U3U4YWVUUE5COXZmNEVQMkFBVkNvcFBSa0JRNGVt?=
 =?utf-8?B?NmVqbE5jZFR2YWJwQlJNWUtkMW5BK1Z5dndGWDRaZ0Q4WlVOWUd0Y0hYTm1q?=
 =?utf-8?B?VFBldWIvOGJXTXo5c0JRVDFPK3RTblZBcUozUzBsS0t6YThodUZINU5sYXRp?=
 =?utf-8?B?RCtKZVM1TGEzVVRpV3N4RG9FTFlHWmRqcXZrMFlNUEIxQ3lNeFppdFpqZFZS?=
 =?utf-8?B?d1YvMUlVNDlGV3h0TElKRldqK2RDZmpMa3hnNkVIWlVZd28vUjhuaHUrL09j?=
 =?utf-8?B?T09JUXpwY0kxQU1Bd1NwUk5HOTlCUDRaNStNcjVFUVlqeDgzS3A1WjhlREox?=
 =?utf-8?B?WldTTzBPVHVwY1VzWVNsd3hVbkY2S2c5THdTSXh3aFBESU1sd0tLRGd3OFJo?=
 =?utf-8?B?Mm5VUHRsQjJVV01BZHVORXNQc0ZOUWNEeTZpaGxHRk9NeWhyZHpOdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68644b76-69d4-4b1f-f371-08de4e2c02b2
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:33:26.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2KihEAulngqxtET99SonT3y6akNEmPfkw8klGA4wis4BYRwpGcZErOhbu5guW3WFNr+/njSrRUFOUTN3BDAhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7845

XENMAPSPACE_gmfn{_range} allows moving gfn around the guest p2m: the mfn
behind the source gfn is zapped from the origin and mapped at the
requested destination gfn.  The destination p2m entries are always created
with type p2m_ram_rw.

With the current checking done in xenmem_add_to_physmap_one() it's possible
to use XENMAPSPACE_gmfn{_range} to change the type of a p2m entry.  The
source gfn is only checked to be not shared, and that the underlying page
is owned by the domain.

Make the source checks more strict, by checking that the source gfn is of
type read/write RAM or logdirty.  That prevents the operation from
inadvertently changing the type as part of the move.

Fixes: 3e50af3d8776 ('New XENMAPSPACE_gmfn parameter for XENMEM_add_to_physmap.')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v1:
 - Also handle logdirty types.
 - Return -ENOMEM on failure to unshare.
---
 xen/arch/x86/mm/p2m.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 2433230ac71c..759f3273d3d8 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2015,11 +2015,17 @@ int xenmem_add_to_physmap_one(
     {
         gmfn = idx;
         mfn = get_gfn_unshare(d, gmfn, &p2mt);
-        /* If the page is still shared, exit early */
-        if ( p2m_is_shared(p2mt) )
+        /*
+         * The entry at the destination gfn will be created as type p2m_ram_rw.
+         * Only allow moving source gfns with read/write or logdirty RAM types
+         * to avoid unexpected p2m type changes as a result of the operation.
+         * Note that for logdirty source type we rely on p2m_add_page() marking
+         * the destination gfn as dirty.
+         */
+        if ( p2mt != p2m_ram_rw && p2mt != p2m_ram_logdirty )
         {
             put_gfn(d, gmfn);
-            return -ENOMEM;
+            return p2m_is_shared(p2mt) ? -ENOMEM : -EACCES;
         }
         page = get_page_from_mfn(mfn, d);
         if ( unlikely(!page) )
-- 
2.51.0


