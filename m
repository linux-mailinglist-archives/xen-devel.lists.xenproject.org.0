Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6A9CC3FC2
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 16:37:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188061.1509321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVX6k-0001be-Lc; Tue, 16 Dec 2025 15:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188061.1509321; Tue, 16 Dec 2025 15:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVX6k-0001Z8-Hw; Tue, 16 Dec 2025 15:37:02 +0000
Received: by outflank-mailman (input) for mailman id 1188061;
 Tue, 16 Dec 2025 15:37:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKfF=6W=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vVX6j-0001Z1-Fw
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 15:37:01 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f0e40c3-da95-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 16:37:00 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MN2PR03MB5024.namprd03.prod.outlook.com (2603:10b6:208:1a6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 15:36:56 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 15:36:56 +0000
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
X-Inumbo-ID: 0f0e40c3-da95-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAnfHnzBJ3cjt0EGGTSzF7nSZVACC+wKkfdtHiLEYPdPs1COxhgHxGdul6CSjXpBONOAp9RQgFBYjQOa8q2vF025fniK20Xb2xg9FFoZOmeoYDwrh4CATPctihNy0ObD/A3K0e4RcSA92DCY7Arcq4UjmJENI8DPZqqD9PD/pfemsqGCK/yLMIfLmoDrARZX5jO2M4KfiY2490ZHc/rgINAMj3qlVS7nxSkpIAiVkRrElxEtn6kdp9nS7KAxQsaN4YdON0JsKrXo5rz55WDm9xY7JzrO5jF4JyV4wik3Yve3WBqGy8xzrGfi5HYAceBTG6JJ5Rt0lkI4SwDipGo8RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwNH+EgGkiVUKYSzGCZiKqOjMVsa/2NoBF/nwuuvZMs=;
 b=ssyseutOvhyGkFX60et91aApMYyCsuO60Od+ijvHRoDllbf5ShHELWM/rCi4jJ+9NYqwTRygAr0axnYi2ZlzKUsXC5+cpsafBqdA7ri7Tx00fxNj8Ct8PROMRYbdIgB21zob1aceV02YNO5xTV553ENK35w9+k2oxESRszWYVdkWO11QfPT6PVR4lhHIomEk+c6rjVeV1LOCmFumTiAXsyKVz88EUd879VUamwcLs7HfWGnKve8fRNGu19J1NzHNIclt+XuAIy0idfLYwN9YfSaSl8w0pBqNehxMKfH76QnqD5h9lQKU4+/x1AsfRxnm+mcSYUemO323SzUxvXX4pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwNH+EgGkiVUKYSzGCZiKqOjMVsa/2NoBF/nwuuvZMs=;
 b=jhoH4tMDbYaLvHytgITPm9yyN+LyhfBANI3w1tGKTX+/6N3T63zqLDDSGuqYO4AEG9MCFivWEwwum6bdb9Q68HFf5s/9Y/Umx7DV2wFThiDn8IQ5N5xelLuOwRW4YvqFYzlGhsWZqL0HmGA1JfuFRNijWBznqtKVD8rsJEGfryI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6ec91521-454e-4631-bf14-f23973222d95@citrix.com>
Date: Tue, 16 Dec 2025 15:36:53 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] tools/fuzz: use vpath uniformly for access to hypervisor
 library code
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0cdf924a-2e9b-4997-a01d-6d8b2f711104@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <0cdf924a-2e9b-4997-a01d-6d8b2f711104@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0137.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::16) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MN2PR03MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 49467f11-8610-4e7e-2b2a-08de3cb8f1b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q0tvTHVJNnpYbW5YcDJ4d1ozZGdCeHZQdTFSQTFTMktZcTJROTlyQi9tRDVG?=
 =?utf-8?B?OWRRcWNKV1RuNGU1b29xSGRsb215YkM4Z3FadjBsY2V5UTBXQW9nanBiUVJZ?=
 =?utf-8?B?NHB3TVkzbmdZdmtDUVNsaS9DQnBXZEJaUGV1YThRZE9BREpkWXdpcFUwakVD?=
 =?utf-8?B?U3BWaElyekZyTTQwdGRVWEFaUytLdnlhWUt3VFM4ZTczTVZWd2tNbE5VWmdJ?=
 =?utf-8?B?cldHeUU1bjVPOFp0WENBeVdEZzkrdUp2aVJ6MVBYTUVxMVlKeUdWUzlyNXhK?=
 =?utf-8?B?MzVIRUFyU3NWdnhWdU5DeS9YNW9mUGdRQURKdmx6TFdmcnB4cnJSTEN6QUh0?=
 =?utf-8?B?SFJoQ3R0VUIxNWlBTkRITFc4VHJBSUdWalBCQW5XSjY2dlhORE9oUG1YVWo3?=
 =?utf-8?B?UnVQNkFERXQ1V0xkdy9ORml6WFEzWSt6eGxwdHFickgvWU1ZbjlIdmJXUkhS?=
 =?utf-8?B?aHd1N2dnN3c4ZTE4RUJXMmRWZ2pjL1ZVckVtTU41SXFXbzRwbzlmclljazM5?=
 =?utf-8?B?RUlVUk44UTNsaVNzdW11SW0ramUxWFlaRVBNU05RdHZTVU1VcmNQQ1JWd2hC?=
 =?utf-8?B?NVg5WlQzeGJMS1pjK3NMb21CTm1TUUF4WkZHZlFEQ2h6UXdSM1FPbTNvY0k5?=
 =?utf-8?B?N2YzcmgyN0k3cmtSamQ0U0hMNnZ2TVJjVTZYV2VCeFNNMS9WRkFSYUkwRnBh?=
 =?utf-8?B?bXpHa3ptdUVFNXhqeVNoRmtLallLZVFrVGcrd1lZekpJbE93aElySXFFeUxG?=
 =?utf-8?B?aWVBVVBVNWluOVVhVkthbloyR3FIWWtwa2NEeTVYNGxxbDRla2xpWkxwUkhE?=
 =?utf-8?B?ZWcxQXZOWWNNeEdEMDBFcE9GL1gzQlgxOVg5ZnRtbHhQaWl4alljVTFDc280?=
 =?utf-8?B?eDcxaXV0WVcxOHdZRW5xeENBRXpheE9UWnVYL09tUEgwMVk2aHFpR0NGSUlL?=
 =?utf-8?B?OFVCbXN2Z01ldDZyS1ZXNmJqeXlaUWYxQkl4bmxKeEt0NDY1S3BuYzIvSG1L?=
 =?utf-8?B?K3JEc3h2N01hMzF5eUo1a3o3bUVZazdoUVBNdSs5YndhekNMLzVpdHp4bGp6?=
 =?utf-8?B?WCtXN0x5STFNMnRJQk1MbHVPbzVaK0pFQ1BwUW5lbVcycmd4Q3V4TmhkRnlx?=
 =?utf-8?B?bW9LV1R3R244c243U2VxcDA1U011eDNTQVdZVVpqUlY5MzhqMVZHaTR6SVk5?=
 =?utf-8?B?TTJYa2QvcWJjOEMzSmZMaVFRYkNkVWg1NG1jNCtOTERNUW82RE1obFY2VTAw?=
 =?utf-8?B?OHdWbnVTNU91bkNFTkJHNEFkRFRuODk5c0RJV2g0K2pVVmFSRGVkOXpMalVx?=
 =?utf-8?B?UjVST2c2TUdCZFJJRVdrWW5vWmQ3YnVkVHl3NDhXdXE5UXdJRkoyTVo5alNW?=
 =?utf-8?B?M2dzeEtNVG5qcUlRVXJGNCtKVW4wMHVYaHg0am44cm5yV2JSblduckx6VGxj?=
 =?utf-8?B?TGVYT2hHZWh5T3I3NFhyVldRSXQzMis4Q1F6cXNQdEdZdmt1azdteEkrelp6?=
 =?utf-8?B?Wm5zd1FJMk1FRUROVVM1dStWNGpxVkdsQ0ZJL3QySkpjNWhnVGJTY0xvZk9W?=
 =?utf-8?B?d1Y1cXVKckt5UlF1d3RCeVB1VkFrVEw0bDgrWWN5TWN4ZVhkeWJGZVpzVnRB?=
 =?utf-8?B?MnRQL3ZZY3lBcW9CSGFUcGVDMDZhOVZGcEIxWnFMbDRZbkxock0rMHl2NGVW?=
 =?utf-8?B?NFQ2QzR2c0plcUdqMU92Zko4a3JveFVpaXYvRlNSdVphVXV0NmFrVzI5YW1y?=
 =?utf-8?B?aGpHUm1tSGNka2dzZGtBalZtMWNBczJienQ4d3JmdmxoLzJoQ2N6QmFYRjkw?=
 =?utf-8?B?Zlc3WGxOazFHRXpYaTdKS04zUUtOVDdIQjJkenRTd3BZRnE5ajh1d1BBMGJD?=
 =?utf-8?B?a0ZHTys4c2R1clp3WXdVOCtNdlZHbHE3SEh1a2NZcmxCUFcxUC90b1I1eW1F?=
 =?utf-8?Q?koWBu2wp+Hyj7IAGhCF2oLHP/0cJ+cx9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHNqZmliRHpidXZNc1ZEN2I1aFpPcUt4N0V4Y1dZL2ZrQ1RvMTRDT1NLeGEz?=
 =?utf-8?B?QmNWMlBTaXpTNllRU2xWbWw5a2FBR1hDcGtXcFA4bTlXSlRmWGo1cWszOG1X?=
 =?utf-8?B?Y1BxWE1OcHNjZ1lOTkZneWFqODhJNisrejlZWXFSRVpQdmFsQnBRbU5oWkJp?=
 =?utf-8?B?dzFoUS9kbE12QWxXOFFiTldaOEFmSjVGbzJlQnFIWm42YWs0djIrNlBoaFNX?=
 =?utf-8?B?NTZhVUo4N3lmRGxwY0h6VzdKWjNoZ0lNK3hIOXlPMnJ6VHVjYklkZHYrWGlh?=
 =?utf-8?B?OHNrK0p5dkd2M1RZeHhYTzdocEx0WTRQanJWVGpReCtjNzdOWjQxTlVydk40?=
 =?utf-8?B?eU54UmNZQ1B0V3hVSGluQ2pwREhkcFlSOHZ2dStvZ0hJdDdOUW1LRWJZMjE5?=
 =?utf-8?B?RmJtdTFFeXFNSjFnUGZESVIyTlFicURIclR1TEVGM1lrM2VWWFAvT3RSOWM3?=
 =?utf-8?B?MEluRVAvYjlrODlmTVR4azFwZjExWVMwalltL1IzdGdWL3RwMEd5eElHUkpm?=
 =?utf-8?B?Y0lKYUVjdFl2Rmp5TW1rQUFqK3paZXVlTnkxbzI4NXAzSkhKakJVaVp0TWtM?=
 =?utf-8?B?OHBSNytkK0QyQVM0WmdJcU5hUlNPVDkvdFJhWTcwY0RZaVRiT2QzSUpLQUx6?=
 =?utf-8?B?QVlwZXA4SjY4WElWV3YzWklkNmV2OUs2dkNHV3ZweUdrWU9JUDRaR1ZqN1c0?=
 =?utf-8?B?QzRlZ0xod1hYY0FqRGxoTXJ3V3JBMXZpRXRlbEtTTk9aRFl1VDM5ZHhzY2tz?=
 =?utf-8?B?U3hmdHl1TWYrSUpOejFUbUtsMXZ0ZGxkektKQnNRZWEzSlhtb2d6ZUU5TjVT?=
 =?utf-8?B?bDhJSnRKWCtGMmI2VWRiOFZPLzcxWkUyeFZOVVZGR2ZyeGFiK1NoOThOT3Ro?=
 =?utf-8?B?UjhLODRpejhRMmFhdWk0eUJmNFl1NllRSlNMbncvWmxHYStJQ1gwTTVCb3Zz?=
 =?utf-8?B?SWVLZmd3RFpSV1pZaFJQaXJnSjBpSnI4b245U0UwZVR6c2UxSHM0L1ZNdEFh?=
 =?utf-8?B?dHdwczUxaHZDdk5FdnNZdG5ydW5uODR0MzJpSS9vQkJaSlFaL1ZySnIwaFRR?=
 =?utf-8?B?RVVuQSs0cStzOUZBOHNVUVdtbmowcGhqSlE4SEgzMjlJUmJNNUt6M0tGNnI0?=
 =?utf-8?B?eGw4ai9Eb05WeGVxbFMzazI4UjV5WUVIbzBsZlA2U1N1Z3dGd2x1M0NoU0NG?=
 =?utf-8?B?N0J1VmdBK0kyblVxUkNyWTYyeUJoWXpNdklvTm9HSHlsVy82WXp0RTVkQ0Nq?=
 =?utf-8?B?UjBwK0xoR2F1ZHRmdTd1N2x1dTRoSGdQWGZtNkNvSDBxUzdtRzArSWNBeFpy?=
 =?utf-8?B?U1ZZWHpXbkJQOVArZStkMncyZHFIT0NxVkJ2VmJEZ1haSEpxOGcxc1hzRS9T?=
 =?utf-8?B?emtuQ1F4UVVSWW93M2ZzN1g3cHpaRGwwNjErVnV4c3pybGlJemwxWUZ4dXdU?=
 =?utf-8?B?cVF3THBZQm05YXhmbWRPeVhuMWF4Wk5GL1dPYnBqcTJ2VWdZQ0dvbEY0SzRo?=
 =?utf-8?B?VEpXQmRXaEZUZFVOeDlpd3NYN0ttWUM3MjlWT3FpZkNiZGhUT3RIRlRiM24r?=
 =?utf-8?B?cWxuL29lRU5obDM2WWc2U1VsTnIzS0ZIYno4cXpwa2h3RklaejR3Zms4cmpS?=
 =?utf-8?B?YitxM1lQdHpzSEZ2amhLRk5sUlZESlp1VWxUd0VLcktpOFljaWt4MkU4elIv?=
 =?utf-8?B?bUIvRFQvREJHUmxZeUFNRTlwWHljS00vZ0dRdHNTd1hDM3IrSThJcW9ZZ0pw?=
 =?utf-8?B?NGYwUkloSXdjbGo0M2pjeXgrNWxHSEZOSU5Rc2l4YlZNajM5dmtaeXQxbWto?=
 =?utf-8?B?QTZzMXZGMEY4WUpCdDM2cW5JYUh0VGJMdU1yNDE3anpHVDl4K1dwRDc4aVRz?=
 =?utf-8?B?bDVzK2FFblI0RitkeXpXYmFESEQvSkdJQ0xnMjIxUkE5YnFjcC9icmZUZVZv?=
 =?utf-8?B?VGxjWDBzT2tVNkptMUJvZEQ2RTMwMHRaTFNhM251SERaWDdsSEFzZjgxL1pI?=
 =?utf-8?B?MldHWTdaQWxJMWtGb0F3SllJcTdham1EMkg2NlRzTzV6N2EreG9tMWxTOVlo?=
 =?utf-8?B?NS9YRFdMcGl3UWlBbWU2SElvdmlWYU9FYmFBeHNhbURhMlYvN3pqcVlWWW1h?=
 =?utf-8?B?QnRMRUw1Rmo3QkJoQk55OGU1aUZvZFVkUE5jeXJ0MUVoQ1c3QWxnT3laczcv?=
 =?utf-8?B?bWd2NmZoemNCU0VJS05ZcHZ6V2xhRllKWk93d1BFbkFLVHp6Q1VHbkFOTW5K?=
 =?utf-8?B?MWVRWHR0MW10OWlmVnNPaXVQeVg0RFNzU09lem51VjkrMVdxcmowSWE4S2JX?=
 =?utf-8?B?WGd1T2g2WUt3UUV5a2M5ZHVHREdkZUxkMFJrZW1nd0lYQ1dkaHJLZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49467f11-8610-4e7e-2b2a-08de3cb8f1b9
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 15:36:56.2357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b/BVGRSf6enKdK5LlCnbYltfrdurjsuxZw5kHbT5Cv8tMkd1TeS/lqfkrQWUFA5rH9oNR9+sLj1LmENUb+B/Uq/B+8HLT/6ONmPCEVILU08=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5024

On 16/12/2025 3:34 pm, Jan Beulich wrote:
> It's not quite clear why for libelf and the emulator we use symlink-ing,
> while elsewhere we use vpath. Do so for these two as well, thus also
> eliminating the need for custom -iquote options and custom cleaning.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Of course for the emulator fuzzer we could go farther and use vpath also
> for the references into the test harness dir as well as the core emulator
> one.

Doing everything consistently sounds like a good thing.

