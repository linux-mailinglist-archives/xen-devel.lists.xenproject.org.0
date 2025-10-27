Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F7AC11D85
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 23:46:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151895.1482428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVyv-0000LY-9l; Mon, 27 Oct 2025 22:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151895.1482428; Mon, 27 Oct 2025 22:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVyv-0000JR-6d; Mon, 27 Oct 2025 22:46:29 +0000
Received: by outflank-mailman (input) for mailman id 1151895;
 Mon, 27 Oct 2025 22:46:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JYa4=5E=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vDVyt-0000JF-VY
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 22:46:28 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c110::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4e364d9-b386-11f0-980a-7dc792cee155;
 Mon, 27 Oct 2025 23:46:26 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SN7PR03MB7273.namprd03.prod.outlook.com (2603:10b6:806:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 22:46:17 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 22:46:17 +0000
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
X-Inumbo-ID: c4e364d9-b386-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUQKdRGSKikXoAy1lC03ljHAZMNACZuCz4rUsJUSe/Ho2yGYPh423ClKQHQcRDvD2eP1ZGRSBQIhKzWBnsaUTdPNhwzSL6g9Ws6P0lwye+wzJzfnoA2NZUwRZbX52GA7KYasF6Gi8fqew2pQ1FmQ65rnFBJHlYxjEMuqCj+z8RrJJXLl12/d22eqOU6o4AjUZAW8A7PZ4+UNYhXKFVNCjfSo9J4czCOAbrw56GpJASz+2l3gVhKOoZzvrqE/SMD0iRC+0XZ/3v+ReJF0jVZLa7bWaQDcQReHhGEPjKaqxq+1rxA1Cm0KNpiiQdyxINABCM7F8pL3XixW3tN9xwhKdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AgzfwEt0ebsYP7ZpHydDBkzUkW89uEllabWHgcZG+Kg=;
 b=hs6Wkkia3Y/YqEYzCmDwFw1RftT9ZkMeZ034RQAafLnGgA+y7NusOg1jyklavnUzIp9kyNBBlwJ79JUbk8x4iNriQU8SJXxW33qXyOc0JNS6rF7l/EyNlLc9GysT8T7DbIWNnEeTvB1S7aQdVT30jsUyPA8ldtfxeGwBpndVdNpUO8oQC2n4S82zH6LgEwOTRuRcY1M37SVGLppP5ugNuBdIaoO9S6SlFX43cH/n0GCSW6k/zgq54KREyFpX50/ZsAqlnbwCg9CWuY+swxqKpgbaoUqswaKCqaRqTrYKEja3TATXeevIe+BYD8DVpgzmfc9QSBgLUZ/ASSDUGRZveQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AgzfwEt0ebsYP7ZpHydDBkzUkW89uEllabWHgcZG+Kg=;
 b=ARRnzsk1iEMxnupRWvl/kNoVoXwcOyS25J6azzNCn3Jni7U549XEiZEyiDNHVGqy8U3TQPlUu/O3QVqKRG3JaHO4WJYnwk03mNzJaz/ERqkiCYy2mYoXWi7nROFU54SCFwbd9sstSRqTbY/Bc7yKwIawCcv/LI1WwCRGK5CDF8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <eb1b8e4b-aaba-4615-bc0f-6ad908732e89@citrix.com>
Date: Mon, 27 Oct 2025 22:46:13 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86/ucode: Abort parallel load early on any control
 thread error
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-3-andrew.cooper3@citrix.com>
 <4fb57b9e-2a39-471a-a629-e8cd00997f22@suse.com>
 <342ead3d-3d10-46b9-bb2f-89f941582d96@citrix.com>
 <b62ae9fd-01db-43df-9966-98d028ca24e1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <b62ae9fd-01db-43df-9966-98d028ca24e1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0480.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::17) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SN7PR03MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 911b1bba-0956-47f1-a399-08de15aaa3d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VjI1QW1LVHRobU44d1NOMVpjNTJySmsyT0U5Tm90TG5uT3ZyS1pjU2g0dHJN?=
 =?utf-8?B?TnpGb2w5c3FWVG1WUEdtcjhTcWNOZ1dRUEFhZ2hhVEZ5TmNjRW91VndCYzRN?=
 =?utf-8?B?dVBPSDJZRWZKNU44RkoyaWlQQmFRb3JoMHRLQ2JDVVV4eTFzUkJSOVRhVlgw?=
 =?utf-8?B?VGU2RmN5L1d3K0UwNnBhT005TjRuUkxDbUJpTllxUE1KanZaOFZ5VVh5RFIz?=
 =?utf-8?B?VmNRbU1VRSs3a292QlJmckp2NFBwdE44OFBIOGZUUGtEdTJzWFVReUJ4NWJT?=
 =?utf-8?B?WnNqbEhZTFoyelQxMlNuV3VBZGhIalpkdkw5dEFWMEJRVW4zRHZPQXNHNE1D?=
 =?utf-8?B?Q3MxK2JpeHVwYnByNytsbHV6cnVYTFVKSFAvaXdzWXE2NXowQ1JzNDRNVUkz?=
 =?utf-8?B?cXZIbkp3QW8xSVlRbGtNaHFLOTNyN1BSQkJMMENLUXg4WkJiVVlSOGtpTXNN?=
 =?utf-8?B?K294VHJkVFUzblU1UWF4bXVQaWFPQmp0MUpsdDJkdE9NS25NVHRHQ09rblhp?=
 =?utf-8?B?KzB2ai9Uanc3d2s0UStCN2tQV1VhTHNJZjVwaEhBL2JTVTV5M2hSZnM4Titv?=
 =?utf-8?B?em43MU5acUl3ZU1RRFJYVEI0elNCUm9DN0txYTJOazhNbndTWnBFcGpSaVJj?=
 =?utf-8?B?WjMrZTF3S2Z2ZEk4SFBXY3dtaGoxL1ZJSFVEbnRJUVN3Qllmbm12RkZaTWlK?=
 =?utf-8?B?dUhHWUNhNGh3Mm9hYkxZcUtWb2E4bGFzSDN2VWcwRFl1RzJ0T2RsREQvUnBo?=
 =?utf-8?B?ajVyaHF3bGNNZDRoK04wUmNBUXpJYW5KRitaQVBRL0dETWZYVkpSQW93Q0RI?=
 =?utf-8?B?OXZMa3FWWGhFdjZ4dTRCREtUYWFYR1ArN0RqTGlxNjFxSlo5NklBSTdnL0dH?=
 =?utf-8?B?bGI3SEdEU2ZUU1drK1NJTnBCLzRUZGVtL1RBcmpoQmhFNHdtOUlTT2NiOWNW?=
 =?utf-8?B?N0x5L1dqTFZMaTczWEdqTnkzQndGWVVXVTJIL0w0OWFhRmNpV1FJSHQwYXky?=
 =?utf-8?B?ZzEzSTJTTGlzaFB6SGZnbGpKd2FBMytxSWE3bWk0b256NFYrTDVjQXZRV0xY?=
 =?utf-8?B?ZzZ3REttNjlRZ2U0bzZzQU50MWd5b0JoejJkcG5DNUM3dUlqblZPb0pDamlY?=
 =?utf-8?B?dXBzcHpxbjlBbnFsRCtBSXpuTW00a2xTSUNGYTZNWEFPb0FHcCtzRlkzajZ5?=
 =?utf-8?B?ZVFvaldMakk1RHdiYTRpUEZENGlWbUpKdVdIZlM3UFJvRjkwbDNTdk12MkQw?=
 =?utf-8?B?czJobXhJY3VwL29xRFR1WC94bGk3NlY4VHI1b0RqbnpQWGZxVk9Tc0J4b09t?=
 =?utf-8?B?UHhZNFJSN1hsZnExc2hXcG45eFVnY2Y0aW15MUxqVWVDUjd1ZER5ZXVhSEY0?=
 =?utf-8?B?Q3JTaXRLeUlnRkJRSjVWYzh6dWlXMUpEdlVaQVovZ0V1U09iZnFxUHhFTlBG?=
 =?utf-8?B?cmUwenVHbmdUQWRkUisvRHdZdTJGTC9RNjFiRXJEZFNxTHJnTFNnL014THZP?=
 =?utf-8?B?T1JJQU10VmJCaTBOeDZGYittR3doenJFcVpwbHZaaTV6aUVZRjdORjl5WG5R?=
 =?utf-8?B?Um5nd2pmZ0FVMXNFcmNqeGpXMVY0T3dhS3NaNE1tT3ZybWRVRTY1MU1PcG1P?=
 =?utf-8?B?WUJJWmhRMDZ4M1doODEvN0V3M3VaVFhKTTErYWVURjk4OVo2QXNaMUIxcmlM?=
 =?utf-8?B?NS85RGFLTDcvZ1RrUU14MHdVQ1ZyU1lSOHl3cE9JQmJFWGdGay83MXVVUndI?=
 =?utf-8?B?bGtoOXNJSUIwem9XdjBsT0ZSR0gzN1U2TU1ta2I2NTl1Qk1ZcjFQc0p1R0Vo?=
 =?utf-8?B?VjloV1BVTTdENk1oK0sxMXNVcUdNODY3aFhkVm9wSEVhdHhmRms0cGdycVZR?=
 =?utf-8?B?MXdPOEdxWE1vdlBhLzBBSWlJS2tsWXowanBVOXY3MVJTK2N6c2k2S2M0ZE90?=
 =?utf-8?Q?IDnw9Foy3rP/awlFM3d7DsJ2ctS/ollg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTU4Njh3VzIyaGRDUDBicnpoS3QrcGV2YUZxY3dVeDVvTjhlY1pqWnhCZHdz?=
 =?utf-8?B?cGZGZncyVGY2OTFGb2RkNnBDWWlDc2NaRFJtOUYvZi80anFSNXR2SVVCdERo?=
 =?utf-8?B?TUNQK1craDJvV3NtbklzQkhZT2tuNmJvTzhxbDYzWExnd0pBL0IvVHpsaGNM?=
 =?utf-8?B?YkVMSWk3LzRiLzNaV3ZhcW15ZCtjcVA4ejJVUEJoOUtzTHZFRTg1QkpJSlZE?=
 =?utf-8?B?cmdoUVU1akc4aWw5MWV0aDN0aFhhQjNSd3VEMnZsV20yM2x0TjZPZ3g0amN6?=
 =?utf-8?B?bzNiQ2VoWTkzNFBEc1RWN3NrdnNmdzdZd1BpRHM4R3BqK2NMVTJycW9Dc0Y2?=
 =?utf-8?B?R3ExU29vZGZvSEhUVkRaWG53Q1FPVHBwM2k1RmRleUkxdG5ZbXZHaWprdGYx?=
 =?utf-8?B?NXJRWkhlbVBMaGxhTDBkL3hCbXd5cVhxTjhvUFoyWEl1QTc1VDFCbkpuNmxD?=
 =?utf-8?B?bjdGZENQb0JwYzhURDZOWG5odGJqc3lwdmE2R1U3YnNLNUlsMU80MHY5TlIx?=
 =?utf-8?B?LzZxYm5lYWJrcTBvN2J4eXNPUHBVR2VHMVJEVkw5anczT0JqOVFVVUU1OUJp?=
 =?utf-8?B?OGlIakFYdG5WOFVpc3ZFSTNyZEtrVUptZG9ZemlONEVDN1l1d2ZwK09md2tK?=
 =?utf-8?B?SHFMWjQ0K0I5Q3Vxd2dRby9LQzVEOVBXbUljdlNaN1ZOeUFkMDhERTNwTk9w?=
 =?utf-8?B?K0ZXWUliKytTVjFST284RkwveTJNUHhSaGxHbEVxckZRTGZ2K2tFQ2k1ZHl1?=
 =?utf-8?B?M2FVbk4vSTZGRTh4NjNqN2FxUiszeGgrWm91NEpndFlxdU1ZRXd1Nk5YSWhL?=
 =?utf-8?B?cU9ndXlPdWJHbW9ad1hXYzNwREd3RGNEM0l0OE1NTTh3cGFmTmk1cGZvWnFC?=
 =?utf-8?B?bEV2RDlHa0hFa0Qzb1BZK09BeTVtQlZ2QTA2My85S2N6SEZmTnA3TWk4TXBz?=
 =?utf-8?B?ZmNlOURZYXI5Y2FqZTdBNGExQ3o1cHg0YWRGVnBzRkluZk5mYzYzbFdmQkRl?=
 =?utf-8?B?eDAza2RNQmpScWJnYlR6NEFWb0NXQkxHakVmOGtZSWdjOHJzd2kwWWZ2YkJh?=
 =?utf-8?B?YS9hb1lSVm1rN25WZGdubmQvL0dnaWZOVzI3UTdNcy94TWNXdXo2V2FiVXN4?=
 =?utf-8?B?ZVlZU3VRWTduTE5GTWV3TTA1Ylo1Q0RwT0p1cTZGTjJHb0NJa2haY2lRbG4y?=
 =?utf-8?B?OVFPaGtVd1J2b1Y2K0xPM2pteWhOUTFocVFTQVpkQWZCTk01Q0xkNWNxK3dL?=
 =?utf-8?B?Ym8xd0JIU0Q5Zm53ZXg2eHFsWjJTZFhRZkhRc1Bra1RxR2N3NHY4alRRYTZ1?=
 =?utf-8?B?Z3h4Lytqa3IwMVFNNkh6b1hKMlh0NmZiMm9RUUxmZERTcy9xZDlINytkUmND?=
 =?utf-8?B?VjIraFJ3R082SXVYUTQ0bnBXL2RZTERKSGx2MnREZEpDa0xQbDRuRW04dWFa?=
 =?utf-8?B?Rmh1ZmYrWnZIb0xDbll1L01XR0lJSlhmTDNYWVM3dU1rOE9GZW1uVmJNSWlQ?=
 =?utf-8?B?NjNNREJvOFdKOEcvRVN6dm5qbjNFRStiTER2eGo3T1paWkY4RkZYb0gxa3lP?=
 =?utf-8?B?aFRQYW1YT2tIWnoxNXdpczBPdlRURVY3bnIxOGNOR1g5Sk10TklvSUZPemMv?=
 =?utf-8?B?YzJrTlhodzIzN1JkVG92aWRoNExiSFE4Lzc0Z1dZY3BBbkU3TkIwUm1WMUVj?=
 =?utf-8?B?V2lLdzJrNEI4eGZuOHFsaWJGbnZjVWFibU8vZUtWLzVXWmdqRkZSbE9RMDdP?=
 =?utf-8?B?cGtFTmp2S1NSbTQ5RFNrZE1CWVlDbDVlcHlkaXArdmtiYkJ6b1lGZ3k0WEgx?=
 =?utf-8?B?TER0VkMrRnM5SStkR1dFK29ndjVTYm5wVUZONWhvV1JJajFMQkNhVHhTa1lE?=
 =?utf-8?B?YXdqOUJaU1pMOFVxM2ZBK1BvMlhMdmthd1hBVzFCR2grRENhNmlsV1RVNlF5?=
 =?utf-8?B?WExvTnpvTERTUERCajk1a1dZVjlud01QbDQwa1J4TUp1cWY2OHBzNUpBdHBa?=
 =?utf-8?B?dk1OaHNKZ2plVExXbjVQNWdSTTJUcXpPTGV1Y2hJU1EyeTJHUk0yNHNsVExB?=
 =?utf-8?B?T2FRNWtaVzNVcnlQN1JkYURrY2hWREhMaEtoTllCd1QwV0VWNWNzcGNONGVT?=
 =?utf-8?B?MGVjYVNwZFlyaCs3MXRUNUZvUVRrNXI3U056bm1MZ0ZXelpFckhSOFpXL05I?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 911b1bba-0956-47f1-a399-08de15aaa3d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 22:46:17.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zGTAy9aU1qsI5b7gnsCJpv1dqViGruLOpdXNasIfPd48nUqyktbiJR061GpTlfFTn6u6qHCZ1xgeyOyBxlEM5nBf+5yP8NJz26EJ9SD3GSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7273

On 23/10/2025 7:24 am, Jan Beulich wrote:
> On 22.10.2025 21:28, Andrew Cooper wrote:
>> On 20/10/2025 4:55 pm, Jan Beulich wrote:
>>> On 20.10.2025 15:19, Andrew Cooper wrote:
>>>> EIO is not the only error that ucode_ops.apply_microcode() can produce.
>>>> EINVAL, EEXISTS and ENXIO can be generated too, each of which mean that Xen is
>>>> unhappy in some way with the proposed blob.
>>> Yes, yet wasn't that the case already when the EIO check was added? Were we
>>> perhaps trying to deal with a certain level of asymmetry in the system? I
>>> think a little more is needed here, also to ...
>>>
>>>> Some of these can be bypassed with --force, which will cause the parallel load
>>>> to be attempted.
>>>>
>>>> Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
>>> ... justify there being a Fixes: tag. It would also seem possible that the
>>> check was intentional and correct at the time of introduction, but was
>>> rendered stale by some later change.
>> The parallel load logic more bugs than lines of code.  What hasn't
>> already been rewritten either has pending patches, or pending bugs
>> needing fixing.
>>
>> I didn't care to check why it was limited to EIO at the time.  It's
>> definitely wrong.
>>
>> But if you insist that I waste time doing so, at the time EIO was
>> introduced, both apply_microcode()'s could fail with -ENOENT for a NULL
>> pointer, -EINVAL for "patch isn't for this CPU".
> The latter fits my "trying to deal with a certain level of asymmetry" guess,
> doesn't it?

If you mean CPU asymmetry, I'm going to argue this as a bugfix.  Some
Intel CPUs are known not to check the stepping, accept the wrong
microcode, and crash.  I have more patches to at least make this case
very obvious, but I need to get through some of the existing queue first.

If you mean revision asymmetry, nothing has really changed here.  The
parallel load is only started if a blob newer than the cache is found. 
If --force is used to override this check and load anyway, you also
won't get -EEXISTs out of apply_microcode().

> And btw, why are you being so negative again? "Waste time" is a pretty clear
> sign of you (once again) thinking that your view of the world is the only
> possibly sensible one.

I have rewritten most of microcode loading from scratch.  What hasn't
yet been rewritten is pending, with serious errors already identified
on-list and more still that haven't made it into public.

I would be further through if it had not taken an unreasonable amount of
effort to make the changes so far.  You refused my module changes
despite the blatant issues in the existing code, forcing me to
manoeuvrer them in via the boot_info changes (and in so doing discover
that module handling in general was even more broken than originally
realised).

The current pending series is in part stuck because I haven't had the
energy to tell you to stop trying to scope creep the work.

So yes, I was irritated at being asked to justify not breaking a thing
which has been thoroughly demonstrated to be broken.

>
> Nevertheless, considering that asymmetry is not something we really mean to
> care about:
>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

