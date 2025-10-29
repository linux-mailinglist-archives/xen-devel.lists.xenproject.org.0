Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21745C1BED2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 17:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152962.1483459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8hQ-0002vD-0v; Wed, 29 Oct 2025 16:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152962.1483459; Wed, 29 Oct 2025 16:06:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE8hP-0002si-Ta; Wed, 29 Oct 2025 16:06:59 +0000
Received: by outflank-mailman (input) for mailman id 1152962;
 Wed, 29 Oct 2025 16:06:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=brwG=5G=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vE8hO-0002sa-UG
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 16:06:58 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b2d3c1e-b4e1-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 17:06:58 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 DS1PR03MB7872.namprd03.prod.outlook.com (2603:10b6:8:21e::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Wed, 29 Oct 2025 16:06:52 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 16:06:52 +0000
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
X-Inumbo-ID: 4b2d3c1e-b4e1-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaM1FFFyFyZ4hsiUVebJygpWj0Xk5pyeTWdyWeYC3GZ93scDirlvcQQNBlmN+w7OD/d7rlqegkL/6Xe7NXhbX2abTng7JswTtbaUc9is5zgMAZIW56gLemZ+pdDpaRfgr6k0ORlzkdfL1YShQTjaFilBAteGBoDUJV6Lrz7ShP/hfNaXKu06sXQcQN6gcjDWgGr1t1w158tnuU7SSRPyCv0E/+txsRHSYau8O3LKvp6RUqR5oYBebXuVDVYv5KG08JIBYcbkz69kvjdF0rZEFlyPshf3nWcz+b/M3CgSurT41bSGHuyvAKkAToCuow8RMdvc7AUGx9fhvoeCx6RTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eytu9P3R1oLbBV3tsOzcZ6+137ornPWN35PjmWSG8fE=;
 b=y7/8pePSDYTr8rv4B/LW1OXWuvGjf/6a92V1q9gueii5hrCumdb76JMntmdXRUu6qsXOxRvRZS4vCtrOzfLPkX9uJryr4yL7JH8WDhzWhkPj5JqEy4eJ1x/ZzqdGtEHDEBQqrveX6TjXI8lVrPJWLTBR2bc03QQpZSDKGbwkqf5l+LULMVfOhw+SBpc93oXWtqq//YykYfXBL+UDnyeJPx7P4/uw3oceIUBjOfnLTP98997iFfky8JF7MuunAyWaTVmWL1qmeSYc0eCyJOggjQ9RSt3bY67ez0CitpDXIxSRJQnohK8jOgs8tR1wuaKzbHS1MUGWsCsyNNEUKXs9Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eytu9P3R1oLbBV3tsOzcZ6+137ornPWN35PjmWSG8fE=;
 b=KJ7tyigmx5LsO69qcM4xe6g7oQQaf7Diqh5mtv/0qEpe7CskIl4FFo+oByEE1jW1mn905OGuJhoBjkE0LIs4JBevw8YJ9DWbil2UprqeFDgGm8NosrmBHJ0aN5rttBX02I47Me81M5+hw0T6726kHkMvjaIsaro2NiRwQOJ7Mw0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <aa6cc0c3-87e1-4a25-8ae0-d30f3c067c78@citrix.com>
Date: Wed, 29 Oct 2025 16:06:48 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 1/2] x86/platform: Expose DTS sensors MSR
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1761585640.git.teddy.astie@vates.tech>
 <48b15617f248852560a0e0674eea65d25330c605.1761585640.git.teddy.astie@vates.tech>
 <83712d12-08ec-46a4-b215-18f7ea1c1069@citrix.com>
 <78fe46d2-f21a-46d2-bcb5-a54d7cd86e91@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <78fe46d2-f21a-46d2-bcb5-a54d7cd86e91@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::10) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|DS1PR03MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: a5480a44-a733-4177-2bc5-08de17052c1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnEvbFE3UFdaNlZQY1VBUUZ4Q01Ja3IrT0RuUzd0dE05akIyMnBrdUtiQXYw?=
 =?utf-8?B?SGNZUFNyb3N1azlwejJqYW12NGZIQlVrSmtBVnJsQTczWkgrMzBEVWdZV0pH?=
 =?utf-8?B?R28vYWFUZ1dycit4cFg2aUlveW1KWS9TejVOeEZSVVk0NVh5VEhCcmFZWnE2?=
 =?utf-8?B?VlN6SjNHc1NrVUwxeDV4Z2xIS216Q0dSdDJFbU1ieVNJZ0RpZGFXeENtNHhU?=
 =?utf-8?B?QURtdGhrZGs5ZTk1UkdJa0RDMUhkN1ZRZUFtclFhdTN4Ym0vTXJ4NHhsWnRl?=
 =?utf-8?B?djZVV21LKzVHcTZWc1pvejFPVk95MC85Ry8weko5UEVnRlZLN29QSTRER1Ir?=
 =?utf-8?B?WStFT1Nld2VyVjRVemdlRkxhUm1JRytJNkNDeWdnT2tQWHNoYlB3cGhQOGdm?=
 =?utf-8?B?ZWlYMWg2OEUxNVdpV25ZUnBsNmQ5SlI2dXBrSVFiY3pHa0hYWVZOSXE4NG1u?=
 =?utf-8?B?b1FYWHVhTUREdlJMeC9kMWprZzJCeVVaOXpuZHYzeUpkaERhclp4NmZ2Umxs?=
 =?utf-8?B?STVHbWJiS0d4RVdVKzFINU5Xd0FLOE9RckZsd1J0QzkrbGxBOVdJTGFWYWlq?=
 =?utf-8?B?TlpZdUFGRFZ1YTIrZmJNN0dmbTF2MlhVb1VRNTRSYkxVRXN0aVVUb1cyWWdV?=
 =?utf-8?B?RkY3VHVUZTNhRFZzT0x6VklDVE41U1FNRDFnbWNONDhqelU0ZkpHemJWTUo1?=
 =?utf-8?B?RW9kZk85T2RQTTBzdVVYWm1qTWhDdC9ZT0RqMW1SU2dHNHBYZHBTdENyWjY3?=
 =?utf-8?B?blZTd3VGM1VzeCs1K1dTS1V1VEpIeTBtcE1VenZ2SlFORFBmc0lENFpDd2dY?=
 =?utf-8?B?QzhFTm91ak43YVBnS1F3dmxzMTIvRlVWWEo4VzBuRmRqTElDNXZmOEtwbTJU?=
 =?utf-8?B?M3ZRWUtaT1BqeG9venFoSnc2bk8rQWQyVHhvam9mblVRRUFxbDFiQ3lFa3Ux?=
 =?utf-8?B?RjZ1VFBmRmYvQ0VzdEZ0TytwdngwVnA1TFkxT01FSHVta3ExSSsva3ZrNXBN?=
 =?utf-8?B?RnJlYmUzVXU5VU1YTUJXL1FOd3pnTzUrT05tWmgyaTBFU2EvUTNUTXNRNzRG?=
 =?utf-8?B?SjFLeVY0VWdqMWIxK2lPa3RjRzZjL2ZkbFJyVC8rN3ZZNENQdUJod3pXNzht?=
 =?utf-8?B?VGphdW5yTEh5T3NsS1p3VEt5eHhoSldIK3p5TlJ5MG1OR05lR3U0b3VVMFd3?=
 =?utf-8?B?bFJnc3RFV05tWjhTYlVCdkFHZVlmL2hiNDVBcVFKUTFNS28wQjlUQlFQdWQ4?=
 =?utf-8?B?ZUJvaWc2SS85Ym9jSlVYL09KdExWdW1EQU9CTElqK21RZVNNU3ZvWkZpRVRT?=
 =?utf-8?B?aWVvVnBhRkZwUWp5c3FJb0VTUkp6TGcxNjE3b0dEajlmWi9QTFlaVWt1N1ZQ?=
 =?utf-8?B?RTVxMWl5UGExRWVPTlp0aFd1c3VEbUdXOVZ2bFlyeWM5MndRVWtrK0NMazFh?=
 =?utf-8?B?QWhUMDl6d0ZWOU9NdUljS1ZrUDVaazJEaEVVZSs2Unk2SU1lcHNBK3dDNEZz?=
 =?utf-8?B?cDhJTlpRR0dwQ1FEYVc1WGlBVVM0cUxiYTl1VTR2eitJRU5sTytrWU1kT2Z3?=
 =?utf-8?B?Y21FT3BDK2ZWa0gwaGlLWUZJRTRZZHE5Q2p6QllKY3pVMnhYZm1WWVR1M3NV?=
 =?utf-8?B?NnhEZ2piSG94L25qa3FXQzhwWXVTVFd3ZzBzRUk5eE9kKzMzVGtTSjJNRG9X?=
 =?utf-8?B?TFZWd1VoR0FqWW1lM2tHdUtoeWN6TFFtbzV1M0YzSWcydmxEZ0pmRDFlM0tN?=
 =?utf-8?B?M1dJU1c5WWdjT0YrYXNuTGR4anFHd05QdzViakFhRGhpV3ZRSFFQWldoNTRW?=
 =?utf-8?B?akd1eG1rU0dVUlNDWWhzMjNRZkh5M1JkRWdrbVZrSDJjaGFoNURnSzg4akxD?=
 =?utf-8?B?cHY1V2FVTTlYT1k4aXlhTW9RWVU3ZVZFOHVjeS9ON2FMTzk5VGhndHdaWjZ2?=
 =?utf-8?Q?eJUVdo1L597b+pIqh2QJVZtK1jepCuJ0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ODVnbmpkMmFZSkxCK00rNnZ5OXJBZTJ1YU1wamJ5ZEN2OVR2bGhVTjVEVTlW?=
 =?utf-8?B?QlRud2pvUmtiVmQrTGFkbGJydC9qdFc2ejNBSkhSTGpJbE9GMkNKODBKQ0Y3?=
 =?utf-8?B?eUhSWUZQdmJnUE5ObWpOQWI1dnVLS2FJVFdibWxySkhpNjBXVXJBdnJuV1R3?=
 =?utf-8?B?MkNpeWwyUUN4RmdSNlMwejBNQkd3MGYxTjRYelZDTjBJVjZmQUhmV3lQM0RN?=
 =?utf-8?B?bEpQSk42YTZUMVNtZ092Wnk2czI5ODdsemg5SnkyQjhnUCt3bFBvdVVkS2FE?=
 =?utf-8?B?Z2gwRGVqWnNuZThPd0w2a3RGc25pSHJNbjBZSTdUclpPeWJsc1lZc1pPQmdD?=
 =?utf-8?B?enpHejhPZUd5WDg3eFFyNVlLV0pLbXVRT2M0YkxGcDZtVVVhOXZrM3FwTnJs?=
 =?utf-8?B?WGlodStSVEZjVTRPY25GK1ZpTCtPMmR1TDNkMjFDbjZjd3UzNTJVdlNCZlp0?=
 =?utf-8?B?cGZ5dHdrT3BmTjlSWG45elBjTmpjSDNEODhNSGlVb1RNV3N1OTNaRHBlbmJt?=
 =?utf-8?B?dGtjTUF4T3ZTWFlzb2tOYzFXZmFXWEV5emN1T0ZXVXN4UmF0cks0WVI5R05P?=
 =?utf-8?B?dHZEcFpkMStYZXd4U1lTZGF0U2M1NkhVZ004bENNNzloYjZLbzhNQXhRaGtP?=
 =?utf-8?B?Vm1FQnZPTm9vVTI0M0VXMm14Z0xDMURyUVNUdlc3SzZQazEybm50MVhpaWJv?=
 =?utf-8?B?Y3ozUENub1BpK0pweHh4REtjN1pKd1ZPMFFxdk50VVFMT0pURnZKQzVjMHBO?=
 =?utf-8?B?YXZ0dkxxTEk1amNhbjA3djhyNzNuMmFKekowZUpuMEdnR1RabkxqNUsyTFhU?=
 =?utf-8?B?dnBxQUM3OEpxTE11ZCtUdjJvOThrRklaQmFwOTk3WlVSM2tGTS8yVGNYV1A4?=
 =?utf-8?B?N0JrczkyVnpOVnVEamFubHdHR2I0TVlPei9EQk1JQlQwYkVuQ2JOVWRQNXpu?=
 =?utf-8?B?RnlncDFDcERDRDRSZ0o4RW5zLzh3U2NxQnVqV05uNXlFYVhSR3BLVHdiMEFi?=
 =?utf-8?B?c1RrUEVUMG8xaU5DZDh6d3h4L2FDWC9aUUQxVDlvMldtQXpzSU9YMlVqempB?=
 =?utf-8?B?dC9jalFKQ3liSjEwU3ExU1haQlp0UDAvR215WGVzT2R3TjRkdFVrdTVlK3ZR?=
 =?utf-8?B?OWtXR200Ukt5RStsR25GMHNpOWhxcXo3ejZMY3NrSUdLODI2VkgzMWFFU2NP?=
 =?utf-8?B?dk8xSUhEa2QvTFZ6NFNvRGJoRnY5OHh5VCsvWnRIR1pYYW92a0dTN25jQU5O?=
 =?utf-8?B?UUp0Vng1N3JzdXB5QUpTOE5yNUNpQTRZUVBKWDJ2SE5LdjByeExmc0JDTHZn?=
 =?utf-8?B?bVdNVURXMDFJR0dBenorMldUcXZsUm9xY2N2cVNIUHdCWmdNSmkxMlV3c3FJ?=
 =?utf-8?B?RjRUY1hCOGQzMU52T3puUllNKzZNWmU2Q0k2aEVMWVViWU0rSlNpRWw5QUlQ?=
 =?utf-8?B?ZlJqK2huTkwrU0dWaTJ6UHM5WWZUcVkzM3JuLytUMCt1R0lTNm56U3Q2MFgv?=
 =?utf-8?B?MDVMb0pKVFI4ak5PUVFVdFhySHFVZzhaN0NLY0NlMVh1anJLZUo5cHZaMWpE?=
 =?utf-8?B?Z0hiMHpqdmRvdTI2MW5CS3VrSXd6VGlLTm5GZW1oalBjc0JRM2orNmNVdGEy?=
 =?utf-8?B?d01tSnYya1JPZ2RlanRIZGhiT3lsN2cxUHQ5Tm5OQ2JMaVlFU2JqSktZUzNj?=
 =?utf-8?B?ZlVrS21OeHNtSmxUdm95S1pCbzdsNm42WFh6dUo4dVROTk1kN3dVT3hiT1lF?=
 =?utf-8?B?b2l6b0VtaEJhUUFFejkyUHc2dGVrMHdaUXljTm5yQ2dodG9Cd3J1eWZJRUV2?=
 =?utf-8?B?N25jczFDa2ZDc1NvRk5ydFpDNkI1aGhGekI1cDlsL1BhMzR0SG5SODVHdGFI?=
 =?utf-8?B?QTEvd1V1d2luaHVQNEtqbE13V1RKT0Q0aEVsQVpRUUtVM2ZUczduY1VneitM?=
 =?utf-8?B?UWt2QnoxY1JHUTR4V1BsU1hnL2xhYUVWVFBWVyt2OVRodTVDcGtMdGszRVR0?=
 =?utf-8?B?RnFnYUdqTWdlMmVSZVk1Y2EwT1hHOXdDYmFSaVhZcFIxRzJDczBKNUwwV3Fm?=
 =?utf-8?B?MUN3bjRUdTRKdUxKRlhGTGZFNmxQUXR3ZDN5US8reDAxdi95Skdpd0xWY0N6?=
 =?utf-8?B?MDZlSTlzQ3crSW10K0tZTVVGNVB3bUJ0bHdhUnhSWWtzQkFDckdxbG1JQld2?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5480a44-a733-4177-2bc5-08de17052c1f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 16:06:52.3208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maJSZFiFDH/j6zLVmC7yTB3FFC7tT0AP/aCDEsh8n6cQrIRn1diHqsihAGg1ki6flHRL57XduXzyEYRlkTfku4PZe11YIqVErpm6nEVE6pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7872

On 28/10/2025 9:20 am, Jan Beulich wrote:
> On 27.10.2025 20:38, Andrew Cooper wrote:
>> On 27/10/2025 5:26 pm, Teddy Astie wrote:
>>> I'm not a fan of doing a inline cpuid check here, but I don't have a
>>> better approach in mind.
>> I'm not sure if there's enough information in leaf 6 to justify putting
>> it fully into the CPUID infrastructure.
>>
>> But, if you do something like this:
>>
>> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
>> index f94f23e159d2..d02fe4d22151 100644
>> --- a/xen/include/xen/lib/x86/cpu-policy.h
>> +++ b/xen/include/xen/lib/x86/cpu-policy.h
>> @@ -121,7 +121,13 @@ struct cpu_policy
>>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
>> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
>> +
>> +            /* Leaf 0x6 - Thermal and Perf. */
>> +            struct {
>> +                bool /* a */ dts:1;
>> +                uint32_t /* b */:32, /* c */:32, /* d */:32;
>> +            };
>> +
>>              uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
>>              uint64_t :64, :64; /* Leaf 0x8 - rsvd */
>>              uint64_t :64, :64; /* Leaf 0x9 - DCA */
> Just to mention, below a patch I have pending as part of a series to
> e.g. replace the various CPUID6_* values we presently use. As you did
> indicate when we talked about this, a prereq to then use respective
> bits from host_policy is an adjustment to cpu-policy.c, which is also
> part of that series. If we weren't in freeze right now, I would have
> posted the series already.
>
> Jan
>
> x86/cpu-policy: define bits of leaf 6
>
> ... as far as we presently use them in the codebase.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Or should we make both parts proper featureset elements? At least
> APERFMPERF could likely be made visible to guests (in principle).
>
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -128,7 +128,31 @@ struct cpu_policy
>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
> +
> +            /* Leaf 0x6 - Therm/Perf. */
> +            struct {
> +                uint32_t /* a */:1,
> +                    turbo:1,
> +                    arat:1,
> +                    :4,
> +                    hwp:1,
> +                    hwp_notification:1,
> +                    hwp_activity_window:1,
> +                    hwp_epp:1,
> +                    hwp_plr:1,
> +                    :1,
> +                    hdc:1,
> +                    :2,
> +                    hwp_peci:1,
> +                    :2,
> +                    hw_feedback:1,
> +                    :12;
> +                uint32_t /* b */:32;
> +                uint32_t /* c */ aperfmperf:1,
> +                    :31;
> +                uint32_t /* d */:32;
> +            } pm;

This works too, although we don't have 'pm' equivalents elsewhere in
this part of the union.

APERF/MPERF is a disaster of an interface.  It can't safely be read even
in root mode, because an NMI/SMI breaks the algorithm in a way that
isn't easy to spot and retry.  On AMD, it's marginally better because
GIF can be used to exclude NMIs and non-fatal MCEs while sampling the
register pair.

In a VM, it's simply unusable.  Any VMExit, and even a vCPU reschedule,
breaks reading the pair.

Until the CPU vendors produce a way of reading the two counters together
(i.e. atomically, which has been asked for, repeatedly), there's no
point considering it for use in a VM.

~Andrew

