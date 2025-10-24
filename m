Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8B4C07A65
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 20:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150768.1481779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMD4-0004di-VO; Fri, 24 Oct 2025 18:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150768.1481779; Fri, 24 Oct 2025 18:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCMD4-0004b0-Sf; Fri, 24 Oct 2025 18:08:18 +0000
Received: by outflank-mailman (input) for mailman id 1150768;
 Fri, 24 Oct 2025 18:08:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0w6I=5B=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vCMD3-0004as-DA
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 18:08:17 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6598e2d2-b104-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 20:08:12 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 BY5PR03MB5281.namprd03.prod.outlook.com (2603:10b6:a03:226::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 18:08:05 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 18:08:05 +0000
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
X-Inumbo-ID: 6598e2d2-b104-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TTcKydf99bXSEW6g+RGmuSma1gWKsyKU3WJ3iyJmNKL9fRcM++6CigR+2Cdb6KAi8sFsO2ozp+HBk0DhcJF+bn+R0+BgAPGczBOldLo0RCjhODdMwoQup3LCrUm2WztQs07rL+nnEVdbYIEOR+YQFkkAYf0FT9uxR0fG9sPs7fHImHDogK36ICnpk3huWLzlU9vgLFHdpHQbxJnoGQaHcgCkIZeQ0R4WhXOhUFJFg2fJH85a5bAxBOjywI5zgJiUWscXY+ykuruJL8t6zmdCiRnc7ATEN+qHB6fr6L2ROsDvGTo+/Yd2/lT86gE9aoNp8sd9eQt3HegLoEfQcQS1SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXSdLoQI8GYo8dq1cVgYo9cAPdrEKz5fUSfvlSu5Ewg=;
 b=YZeZX9R8sSo2h1fLKy7df0vVcrE+1xv4pev/2xz1RzmZBg92cDZUP+dmNUN2UaBSdfSla5+Em96iEaDrnDBpg7MQ9tFNmkxFijNZnCGf4DLx7SPSPuzH16cGeJZtmi356JxJDu5VEhsgK4nnkqlna+EelqL9nAX5vVZhqWmPJRUv4AxeShrnnp9gYvg3IbFL19NX0ricJt/Q3skaPSPlNIIYoiUEWV0wX4F7xqld7b55p5wivrIM49Vt116NLhP9O/YftjnGmintpWDFZj0v4tbZmOk8tyy5TbRzLUyllOyTSyhG49gwPaqoXIzFSZYa/7LxC3yolOzuLChB1Y/TtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXSdLoQI8GYo8dq1cVgYo9cAPdrEKz5fUSfvlSu5Ewg=;
 b=PfSH/Yl3myBhAPWRPl3xbmuOn/3PL1uN8Tv4gEiun7nx6Be1eHrLO7YG3uRliPTX7GhrGrKpW9hCnAqne0tcChTA4PowRBa+2KcKLXqcVaPhu22c6i5rW+FbIUeIlRMde89FzO7OOlJFrsb4JJ0rngZhWGhZ10jWdBOvufnr5lE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <213b6d6a-9d97-4ce6-a4b1-e41e8380656a@citrix.com>
Date: Fri, 24 Oct 2025 19:08:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vVMX: Cleanup partial vCPU initialization
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20251024162054.2610454-1-ross.lagerwall@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251024162054.2610454-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0420.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::24) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|BY5PR03MB5281:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3bf8e6-a358-4bbf-d8be-08de1328475a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU1adnRualRMVW9FWFVrT1AvTUZmVWFnbDVzUGJZRWEvclhCUlljZmc1ZVdh?=
 =?utf-8?B?VGloWnUwZFZPZUgwZENMWFh2VUpWd0dJUDYzRUZHSmhlcjRDZ2FoTUx1Zi8z?=
 =?utf-8?B?alNHLzdxQ2IyUGdEYkVEcHd5bnpKZTVobVlzbnFlSDVrejFreEU0OWY2bUtm?=
 =?utf-8?B?NktqSW5qU2VRbkMvTEp3MFh0ajBOMkxmKzBxRlhZT050UWkzTXlaMU9hb2pk?=
 =?utf-8?B?R244S3U3VEhLRFhncTRORXdIRWJvZkp6dWRobXFadmhKOFRxLzVpZHpaUWs2?=
 =?utf-8?B?U1Nwajd1SGhhYUgyOTROc0R4azI0S2xTRDBxYy9RNGphL1NJbGtReWI4OUhu?=
 =?utf-8?B?ZjdNM1p6dTE5UmFFeWVYNGxVS0kwS2lKQjJycmVibGExVnhWZ1BaWFlRSWRV?=
 =?utf-8?B?K0ZYNWIrcGRqNW5meVlGN1l2V3B4K2tLN1g1alM2cklNNnM5R2VsSEp4RWJ5?=
 =?utf-8?B?N2Q3c2lrOHlXWFVZcXorckZINnJMRThuUzljUTQ1aW91clF4anZ3TmZ1UnYx?=
 =?utf-8?B?bzVNR0lTMUNsL2Vac3BIRkk5b0F5QmEwZitwTHhhQnBOUExSbHFpMzJvaVlO?=
 =?utf-8?B?bGJseWNtVFZjN2UyejZjTE11Z08rS2E5V0dzUHRZMzRWMDRyakVWcldKVlJF?=
 =?utf-8?B?dXBYVzZvTTNLdEtvSkpNUTBuR0FqWGdvb0tkcEVrOEl6WTMwN1NGRHd3OEx1?=
 =?utf-8?B?eWQ3Ly9EUjBOWGQ0cG1remt1ODlaZmFwMEYzSnBCeFYrZ2lrQW03V0RKSHl6?=
 =?utf-8?B?NGt0S2cyMU9yMkdjTEJnYmE2M2RBaHZEdkxNRnhzejNTZmk1QXg5UndJdTZy?=
 =?utf-8?B?QU9oc1RwRGRjbDNKc2o2Nk5BYmFwbnpjKzBuNnlPY29wMm1YTS9yY29zU0lE?=
 =?utf-8?B?d1NLTnd6c0o1U1dvSklSa1c2T09WcjRiQkpIQ3JrTWtXOGJsYk91L0k2cE5s?=
 =?utf-8?B?NGRCYktWY1VKTHgzd3NBb1RMV0hFRm02Z2dON0dDR3JGQmNzVGVlMjNEOXB1?=
 =?utf-8?B?NXptbGZLMmVnNHRkNkMrYWtwUDc3S1BGU2JTZXI1dUQrcjJld3BhaWw0WDZ5?=
 =?utf-8?B?RVo4WldBdHJBZ0NtbkIra3JRTTZ5YTJUK2d2N1ZUbExLcWJXb0hHTm9UaEl6?=
 =?utf-8?B?Zll3cU41a0xmTjIrQktTN2VFNVZIc2VxY3hEVExlVng0by8rR0hYMC9rMlFQ?=
 =?utf-8?B?VHVKSEo2ZFJTY09jbmcxNk9aUzZvbkV5azdhem0xY3JpZzhzZkpmRWp1SUxH?=
 =?utf-8?B?UzFzZmRoVjZwSEJYUTh0WDNrSTY2V3RWOXV2UzJ3QmdOVjVaOVM2RGsxMEZF?=
 =?utf-8?B?cWVnZ3ZlbEwzYmxJSitCbHFoMmNFV1Q1L2ppcFo0QWtmSVYyN3BCd0VnRUVa?=
 =?utf-8?B?dGd5aEpmRkZheEI5QS9rRG56TElVZ1BUYXpEVWdEcWlEdHlkWUVvQW9SbXBv?=
 =?utf-8?B?ai8vNExxeE1HSWttNU1kLzc4UC84VDVuOVhVejFqQTgremZtb1g2QXlueFNL?=
 =?utf-8?B?MmhTdVM4aFZQdDlWVyt4dWxrSlNJR1VzS3BvTHpETDFhZ0tHVTYxQmtnalRs?=
 =?utf-8?B?aklEWEVyWFk3YXl4ejY3ZGRPWVJOellFdXZUR0UwMFpEaEZOTlpLL0ZySHFt?=
 =?utf-8?B?WlNwNWE1aTBBczFMZk1YMnpjMVZ1TGZjN1Q5aFhnVXZCU0U1a0pNYVdlaTBH?=
 =?utf-8?B?UXZZWWhNdXErU2JhU3drdUdFRC8xcml5QzBXWVI4VkNYZnBtYjlxVjFlekFu?=
 =?utf-8?B?ZEJDL2JpczNNQXlscDFQYTFicTVmbXRIc3BLMFJVZ2o1c2hyWUxyWlhKM1FI?=
 =?utf-8?B?NmFRQ0I1OXVBNlVCVVJJTVdDNndFUEsybXJWaG1vNzVJNkU1NXFtamx0YzY2?=
 =?utf-8?B?TGEyMlRyem0rMzRlZFpqbmlIRnUxczZQV1ZXQ1psQkNtYkdwNWsxVUVwanVM?=
 =?utf-8?Q?VcJnEtOIv/kRLIomlO88MW7kCo7cEUUm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1VzZmJLajVMQ21ESDhJalVsTXI4N0N5R3VRY21Zb1NSNnR2T0s0eUpLUFVa?=
 =?utf-8?B?VDNhQW05WkYxVmtyeTRuZ1I2UGI0UTZ4RC9zVmJ6MjZSeDkxMnFvRnhzNmtz?=
 =?utf-8?B?eDRMa00wbUJ5TVAzcXZMM2VoRjlTR3JqQjFuNDBCaXBtdHpLbmxUeW01R0Ft?=
 =?utf-8?B?TXN5RjlwZWZoQkVpd1VkcVZ5RVNKKzFPNlBpMlc0SVQ5anhKcmxpOTVSdWU5?=
 =?utf-8?B?elJuY3FTWmxkd0E5TzdzOStmblJ3Vkp1WVd3ODdmcDYrN2t2NzFvMTJRRzN3?=
 =?utf-8?B?SkRKOXdTSFh2d2RJOUVsTXF2VjdVYW01YUFIZTIrV3k1REdxaHBiOE94TVd5?=
 =?utf-8?B?VEkvQ1VDYmo4MTBpQ1VnRS9vYlBQVklISTRBNXFQbld5cWIySDBVOElqYzFT?=
 =?utf-8?B?MkxMbVR5dGJRODZyaDBZSXRmVnBHaHdUdmExYjE1NkxIVnFyMWxxcVZIYmEy?=
 =?utf-8?B?aU9rL0NBWVJCMmR6U3VweWQrSWVIWUMyQ3lsaHBEWGVwL0dKYVdoK0pNOFpq?=
 =?utf-8?B?UnBRWmpMbkpSYmRaRlBnaEw0eDQ3TjdSbUNNd3c1MGhzZ0p1K3BpOWloc1Fz?=
 =?utf-8?B?VVkrOUJkSFZrN3AzK0kvOEdpYjR4WTk2eVNvRjlva3RTY1lCSmtFVVJjcmoy?=
 =?utf-8?B?ZmNqRFJzQU1mYVcrS0VqUEpyVUhIeHVnbDZxTW13eWZaQXJwcGVzbjlwZXhi?=
 =?utf-8?B?MUtCS3ZEM0dWUG1mbWVrTUZ4TDNYY01PTWY1NG5NRkVXZGFNSElOaW5acjhQ?=
 =?utf-8?B?ZVF3MWxOMm1hanhkZU9KdTNyNjMxNHNRaE9FL0hteUMwRllNSkVEbGJSSnJ6?=
 =?utf-8?B?K2dQeVBCMVNZTWs4dEs3MnNKbE5oSVVkTGxKSEx1Z3FkVld0Z1ZFQUZVUmZz?=
 =?utf-8?B?c2lIakxkdjVHVzVCWXFNWmNScGM4cUxBeWRUaWplbS9yNDBHWENzaDZtL0cx?=
 =?utf-8?B?TnI3NEpPdEtBUHc3eEgrT1lkYm5UZEt6ZnpIUEs1TlpxVVhVeXI4OVplUlli?=
 =?utf-8?B?ZFZsb2tCdDhTL3B5NUZHSlhyWlBoSUtKQndvb2hyTW5zdWdlMXoyTDlpZTNm?=
 =?utf-8?B?d0tISk0wMkVML0dqRVVZVm5JdGtMaEtFYUp1ZzdUTTVmVmo2eFRzK1ltQlV4?=
 =?utf-8?B?TEx5Q2x6VGdvZU5hVlRZNERqS2ZCTytybTYwaXNIVDJXenFFTTRFcHlwRDJs?=
 =?utf-8?B?NVNyelJTSnpJZmFtTXpzN3Q2L1YxZ280cXJKOGRxSy9BM1Z1M0JGQXZkbFZG?=
 =?utf-8?B?ckVVaEVVUlBMY3N4elRyL1FQY1hoNXo0dU03RjZLbGh4c1UzMndlV1NGS0E5?=
 =?utf-8?B?Z1JveUtENFJFTUxRQTRGa043OVJ0VVF1L3hYODFMbkdvcWN2MlRmYXBQT1dh?=
 =?utf-8?B?UmhJOHB3LytnL2t3RDI1aS9ibHNUeWRTMVQ0RUdwbXRLRnJ5Q25zS1c1UXRs?=
 =?utf-8?B?a2hmanp0c3h1dXJFOGRtYXN6b3lQWVR1eWdMVDcwRi8xOHBRbUthcUhjcEFN?=
 =?utf-8?B?a2grYm4xMkZWOGRpYVI2eWVqT3JZSldHMk9ENURsak9pTGdXVXpWY0JBcUJn?=
 =?utf-8?B?RzZ3ZFRqU1lESGJjOEJ1WlRSczUzMHlGcU9NNDQzZkNKcW1hUHpvWVRhUmhC?=
 =?utf-8?B?YW5TanRYWlpvaVRnK3ZtOURGQzQ2b29VMEJ5QlRQYjNzUE1BUStaUmE3SFlN?=
 =?utf-8?B?TjRFSG81d2dIREJwMFBCU1g5VHpsQlFBNWRSTDJ6UjZDTktkbGhBaHpxYUlp?=
 =?utf-8?B?WmM3dmZPOWV1ck9oVEtVcFRQN3FvajJKU2x6bWltaHQrUkxWdzVWd09jTlhP?=
 =?utf-8?B?M0gzdzZGdktHMEU0ak9mMXd2UmdQUG1xaFhKN3lPQ1NETThSejBkdWtaVnd5?=
 =?utf-8?B?ZElzOHRpY3VUQlF6YlUzd2NPeEpnQkZzdlZGK3BQRHpScWlkVmUzbUNobVcz?=
 =?utf-8?B?ZmRKcWJ5T3o3dFlLRjZlMjFSSjFUQngzaXBML0loM201S1lrSUxiRVBJUjFD?=
 =?utf-8?B?STVYMjZtR1RXRys0U0ZoRW0ySWZlcThVNnlTQWNyWXkyWlR1ZWJHQXE0cTFl?=
 =?utf-8?B?T0VmSHc4MTRlR0pYaUExZC80NnV2cU1ZSHIrbmRQaVVOR1lsOFJHbGFMRGlm?=
 =?utf-8?B?WElsMlRYRU1SaExLb0ZJNnh0bzQ2TVczdUlJMXFiY1lCby9kbmJPb21heFho?=
 =?utf-8?B?Zmc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3bf8e6-a358-4bbf-d8be-08de1328475a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 18:08:05.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8YlsgaYW5n+tvaSaiCzx21s0nX3RfHwHSFGKAeA6pD4Rnsys9QZGKVGf4qm4I3jGnRmUQc170Us6ZRKd7sD9o3Wos1TEvy9h0y30UIFhusk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5281

On 24/10/2025 5:20 pm, Ross Lagerwall wrote:
> If nested vCPU initialization fails, cleanup the allocated memory since
> it is no longer handled by the caller.
>
> Fixes: c47984aabead ("nvmx: implement support for MSR bitmaps")
> Fixes: f5bdb4aaa165 ("x86/hvm: Obsolete the use of HVM_PARAM_NESTEDHVM")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>

AFAICT, this is because of hvm_vcpu_initialise() not calling
nestedhvm_vcpu_destroy() if nestedhvm_vcpu_initialise() fails?

I think this is an improvement in the short term, but we really need to
fix our object lifecycle.  Relatedly, I should dust off the fault-ttl
series because it would be able to find this failure automatically.

~Andrew

