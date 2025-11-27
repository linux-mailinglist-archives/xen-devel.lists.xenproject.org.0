Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB14C902C2
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 22:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174393.1499336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOj7J-0001OI-4t; Thu, 27 Nov 2025 21:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174393.1499336; Thu, 27 Nov 2025 21:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOj7J-0001LB-1e; Thu, 27 Nov 2025 21:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1174393;
 Thu, 27 Nov 2025 21:01:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOj7G-0001Fl-SW
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 21:01:26 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3adfd339-cbd4-11f0-980a-7dc792cee155;
 Thu, 27 Nov 2025 22:01:24 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH2PR03MB5240.namprd03.prod.outlook.com (2603:10b6:610:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 21:01:19 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 21:01:19 +0000
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
X-Inumbo-ID: 3adfd339-cbd4-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=udDXwUanApvyC9uV0h4fe9Dvs3v4iqbMSzNbGoOIgLuiHRAC8Mq7DZpUSz5OpUUdpqN+EEY4PYIFkChhrOwRrbhSVkxwuDUA0Y+7Mauy8TZ18D/eceeYN7jKkvkbn2dLpXsbIUP5xHzYC+oK+kpinDgLHhxsQXPEba7MBkkzzxgrEURUOF8GUDOfScx6AA7gFFRRiteAwX2kG1RfRH62ToHGLrYr6jDXqVCPWH5+ybxXhfbRCKaFZMWcXcGUuOQMOxPWYe2e6CDrOQWc+lp1V+zdV1+aWbKuFZqz3VRkoQRtxt5XFyZkQup2DAG8re8YUHH/h2yvGwT+WjV73j5AqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6TwGDYbKW7x7RzRGYcCKbvSXqTYzzq5e3l2yT72UmM=;
 b=WXbC3nGbYjBDA1p9Ijtzboe8/E7raQnSwTr6F4R1J+jmppp4sefgj5p2wSRVsDD+u9CFHqaYLJIRELYqCiAfcdrWnHsT/3VU4Wze5TjCbXRYfhCOe2Bb6s48sUssICNALAKzFMZQK6h+Gdkhl57HCD0/eh/1X/8Pg7PUEh2hSLY/t+wwECJTfaUvwUZLddZIMoBXqcwY4SQNhNTQ2MukT/FdSdESbJCrKA/kqUarc7aD0NqTZ1WzSv1h4jQ+4vsUgoeEqLqXuqJjr7ExwvU3OpOXYdWaYvgR1+Um8YQrKT8P+voM4dxwwvq5jg/BFTvbbWAen+JeyE9P6n7rHKfPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6TwGDYbKW7x7RzRGYcCKbvSXqTYzzq5e3l2yT72UmM=;
 b=Fe7go6AP++BK46mN0XOFUcRB4soZjyrNeGfipYSmF3M8kOIOoGdUSTyRxGia3kK5NyVMXB/DWGviQOW6LmFdWpIIFxPsN8MtkOpGs7HQSvJ+tFI5NXNChqq2GoRKWIhOYtv6Aj86i3G9eRxsUpFp0CpFElFi7ngcwcw42dNT52M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <ab368c3d-3cfd-41e5-b4ed-d3b8f8093b84@citrix.com>
Date: Thu, 27 Nov 2025 21:01:15 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 01/11] x86: Add more granularity to the vendors in
 Kconfig
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20251126164419.174487-1-alejandro.garciavallejo@amd.com>
 <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20251126164419.174487-2-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::30) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH2PR03MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c09146-2944-49f1-44c9-08de2df81d20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3cwaU1HNCtMZnhMQ29jRFgxRlFMdTFhQ0F6dWNWRTVtZlRVdnVkVGhVSHAx?=
 =?utf-8?B?bDI2cXdvMjBsMFE0K2tRM3lzbWo1YW9rS3hWbmM0UFJFVDhoOXdkU2U5MDZV?=
 =?utf-8?B?dDE4K0dDd0hpUkorODc2UnpXTW45ekJNK0cwTTI5NHkzUER5TCtFSjdjNG1j?=
 =?utf-8?B?MmtmenUyUi9hZ0xxN0JYQnVUSmFaS21HejZxLzdLcElVc0hKR0tKcElBaklO?=
 =?utf-8?B?WlE3MXVuZ0VnSVhHekhTSW5VaHBmQmRMQUZ3SGVyakxyWEI2S1Vpc29CSnNo?=
 =?utf-8?B?ZmxBbnVhUDgyV3JPWi9ZK0wwTkpZbGU0dUx1VVlQNEdudzRsWVFHQmorNmIr?=
 =?utf-8?B?blRreC9SdHN6anZ0eThSUlBHWHBLeHhEK2thbmtHVy9XeUJhRmppckR4WmVl?=
 =?utf-8?B?RzRmOURNbWpOUnhscmpLMCtiUlEyN2R2OGZXcjBMU1YwaUlNZXozSU9GZDlH?=
 =?utf-8?B?M1lPQ3JZaHl2NkpCSVd1WkNiTUY5L01EdXVmVzJSd3JrL2JrT3lYM2lEd0NG?=
 =?utf-8?B?dVd4SFdXQnVXbXJBR2FNL0lTOCtDSUZ1eldrWDJqZC9EMDEybExBUzBWUkda?=
 =?utf-8?B?MG5tSVNWR3VjN1RndkErbTFWeExYelM3K1NoOGZXTi9zVWZKWU9rZWpnZk1k?=
 =?utf-8?B?SEtXSE5SYXQzSm9jbnQ4aGp0TjBLZTRNU3J4L3g1SFdGZ2xESkJDMHNPazN6?=
 =?utf-8?B?OEZzeWhhbko0dmJBY2tQakgrN2kveXlndmJESjZCYStZS29ja2FIbk5LdS9y?=
 =?utf-8?B?RGhUOVZRcGpTMm9jOWxzOXdxMXlWUkpKV1lhb29JSityS3pPZGJIaENDY2w3?=
 =?utf-8?B?QVRGOHFTaC9oc3BMTXhCbXlpa2RtYVI3U25zRnpZY1pSQXhuKzZQTmpIT3V4?=
 =?utf-8?B?RjNCMnZBT1RBTElFYlNKenc4K0pvV253enc3ZmczWUlNMUZaK004bVNFRVdR?=
 =?utf-8?B?bUg0UjVsampndWtUWlh3T3I3amJGbmhmU0FKcDF1Vm5JeVJTME0vdnd5YkVK?=
 =?utf-8?B?WkJ1UEE4Zms1VXE4YTF6R1BPQjFxbkE0RVFaSENYRk1WeHBZcSt1b1hHRmNn?=
 =?utf-8?B?ckZya1NHOE1DZzdOZTV3bTBSSk1ycFN2bUlPNmExRTYzSnArd3ZqVUVSOGJ0?=
 =?utf-8?B?amkyQUphR0VESGh2MEVYOHcxMnVxQ2lweVBwcWpPVlpOeCs5SnhyUkovTWVW?=
 =?utf-8?B?bks5K2ZzcWFmT2t3TXBITkJFNmpFZ1N4VjhiNS85aW9PZFpqMGFlbE9hWG1o?=
 =?utf-8?B?QzZpZ0xJb1V0ckRzRTJQTFlDM1d0d00wemR4bituUURESjJSR05FMGJKeE9l?=
 =?utf-8?B?aGFOSmxIYldxU2pTSFduQWRuUGh3eXNaa29RUlJTeWVQdmcwL1hBL3FiSHhj?=
 =?utf-8?B?RzNueGJoNXlrZEhnMCtHcitrdFJWZkJud05nQ3c0ZERNT0FnWVNRWkI4ZkFD?=
 =?utf-8?B?MmUwL0dCNGVwMTRFQU9mNk80dW5sVkJBRzJ3ZVlRWXdDMFA0YUhMTE8zVkpY?=
 =?utf-8?B?cVhyWjNRQXA1bHhZYnlTYXF5aTlGUTA0aWp0eEZlTFhuR1NHUEVpd2luM2hQ?=
 =?utf-8?B?VTJlZE00QTMvL0ZybHZYSlBRcVRwelJnV0RDTlphTXRmbW54RWVzb2MvVFky?=
 =?utf-8?B?Z2dWMWVmdFFmUk5pSTQyaHlMSGNnZytYU3lNZERPWlh1d21raFBER0c1Tksr?=
 =?utf-8?B?QXBQdytTaGwvVjBGZUtGSnE2Rm8vdFRyNU1YZS9Rc3J0cW9sMFBiMEJsN3JK?=
 =?utf-8?B?SDdaVmxFeVJhczVJSWo4ZGw5cld6Vlp2RDkydk15OTE5WDcxTS9HcGFIMVdv?=
 =?utf-8?B?R1VKalp2WFg4UzU1RUFBR2lBMUtBQ2ZvWWxKODVUTXVkU3JUSW1iNTNwSTNW?=
 =?utf-8?B?c1owQTR6WkZkZEhITzF5eGJOZ1g1RkoyNytmUEJYcjlablJMQUgzZHVNNlFS?=
 =?utf-8?Q?/zFcr022VS3z4qctujbstmkkym9A8th/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YVJQZ0tRUk5GSG1TTGh6TGs3RVJGamM2bVJ5dHgvVlpoUnlsOHU2NDdVSlMw?=
 =?utf-8?B?U3BtZXNqbUtEZW45b2pQWG9YSVE4cjNFYTBvM1lSbmJ3a3BjeHNORUVPSXpp?=
 =?utf-8?B?TThrSGZZL2F5N2tjSkM0RDZXVTlkMTQ3Ni9uMDBZRG5WZkgwd2ZMR1MzV0JC?=
 =?utf-8?B?QXJaNkJhV0daeGhFZ2dpSGJJS04rWjNhVEZ6eEwyT284WjNiOWtEOWMreTRS?=
 =?utf-8?B?TlRXcjVxaFpiT2xhV2ZFblB6cEVVdWt0b2Y0R25seTBhWkFlY0dHV0FWU0s5?=
 =?utf-8?B?MEZrOXNrUXNEOUZPd1c2ZU1wRENLL09qU0p5QzBzZ2IyVm0rOTR3WTFFL09B?=
 =?utf-8?B?Y0Q0VjczSkM0UmpCeEN6bm93VU1uSURwZXpzV2lJVERjdENsYS9ZTHBmVXNn?=
 =?utf-8?B?WmFWSkpTSzN5N1BySEZSRmRGeEVtV2pQV1o4b3YxdXFPem1XNVNoMkxycUFP?=
 =?utf-8?B?bFJWcUJiVDVEenBRK2R4bGh5UENtL3hYN0dCbFRSd3JVbk1RRkFkNjJxV2N2?=
 =?utf-8?B?QUdjVnBHUFVoU0FuTDFVZ1R6ME5zdkltZFJ0THpuQUtMNHRjcTF4L1k1STRP?=
 =?utf-8?B?djdSQmN0bkUvcElKSXBOZTRhclJwc05HMEJyUFhZSUw4cGwvRVhERm4wL2Nw?=
 =?utf-8?B?bk9sNlVhMnh5OU41RVFVbXpDTWVIajNSL1ptNDRpU285N3FGQkU1SHlnOHVu?=
 =?utf-8?B?TmdqdUNoemwzNndqQ0xEOTJtZjZVUHlrNXJTK3g4WTFhTHBkYU9iYUFlUVJp?=
 =?utf-8?B?eGtyUG9jVWNZcDBsTGVoUlU5SzJ6YzN5dmZpR29Ibnc5TXdoVURNUHFMUHdi?=
 =?utf-8?B?M2JwcHB3MjcyZzlISHp4S3hIY1NMOTlwb0hBVGtvNStSVDBocHp4RnEvUTNT?=
 =?utf-8?B?ZS8wOEpuUXMyRWxmUG8zYnFkR0Fob3ZTTTExY2lhZHRFaG5OcllJWitHWmVY?=
 =?utf-8?B?NzE2SG5neGRuZmhKR0I4ZmNBSlRwVStVN21BRlBUaGdmeW9mY09yZnVQc0xO?=
 =?utf-8?B?SU4zZkQ2c2Zkc1J2aFZPWmZNL2pDOUpaNXZNdUQ0U1VZMEpOMXN3Z2NvQzVP?=
 =?utf-8?B?bU9FN2d4aTI2SE9KaG9VTFc4Uit3NXZjcS8rYVVxMlRwMEwwWUdmNGM5enFW?=
 =?utf-8?B?VVFTaUpLMjhqeXdlZERBQjFFelFrN3JieG9uMkU5R21sb2lwL0dKd1B6Qi9v?=
 =?utf-8?B?QjBkam1FeGJuTFh2dFVMYm5UVzd1V2dySGQyRTFvbVJsR3J2UlpFN2tNUkY4?=
 =?utf-8?B?MkZoelJOTEZGS1R2N21abldseDlQQlNuemFidDlUQ2J0WWNSZmtPYUFnWkF2?=
 =?utf-8?B?aXVFeldrMW9HaFNHdlNaZTFOTEFiTk5RR2Q2L0RtWlhlZ2pmVEY2VGdEY3pm?=
 =?utf-8?B?UW5yMngrMVRkTDhHc1pyS1JjN3BwTkU5OGZLbTh5SmtoLzFjanJ2VXk5dVRP?=
 =?utf-8?B?NGwvRWMzb2lVajhIREkrR0JXYUwreHNaQTNmQldDTzMrK2dRVmJ5Q3pLekIy?=
 =?utf-8?B?RGNIcURDSHFOSC95T3UrL3NEZWRYWGNMNERUUkdrRU5DSGV3RmorT0t3dmlX?=
 =?utf-8?B?Zys3LzFpZEIzVjhCTHp0UmdvdThPQ0RQQTA0bmh2N2pkaEZpS2NiZmNkUDIv?=
 =?utf-8?B?NHJuMkFaa2EreUx4WWVmSHF3Q2tkc2xhZm1kbXUzUjRwOVUzMHkvajVMb2dr?=
 =?utf-8?B?aVhBbU1JanIrM2VkcWNBeXFBUjUzd0MwbkZvSGdKdjBlek5HRFg4WnRPbThD?=
 =?utf-8?B?WmtaMTJpMmdrMzA0QjdXZlhONVJ3c2U3TFZrbkF1c0FhVU5YL3dNOExWVHAw?=
 =?utf-8?B?YjdOTUZoWDZlbXNkdVVNZjdRc0xXeDE4YVFyZDY3YkRjS2NZdmxjZXoyaWhC?=
 =?utf-8?B?SVNXYTdCVFVLd0k5dG9SQkVLOGRiY0Z6UTkvTEx2TlFQTEdRT2JpTzB4aTRY?=
 =?utf-8?B?YTg4TjF0eDVZYmw5MTUwTmpzV3l6SG5RWTNZOEJKMEM5QXFMSkxpRm9sM1Bk?=
 =?utf-8?B?YVd6YkR4TDN1bXk4eU1kOFQzSm9ibGpwR0JoNTZmaVlTdVFMbUkxSHcyYTFy?=
 =?utf-8?B?VWxDR0dDbkVXUHRaNGVIT2Z3ZFFxeWdxbU8vczVOU2ZYUTdKRUJLa1BXL1lu?=
 =?utf-8?B?MzIxZGZQNUpIa2pVbzRYTDFqNnFYZ3dqRmR5SDV0dE1SQWx1NHN0NlRFWGty?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c09146-2944-49f1-44c9-08de2df81d20
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 21:01:19.8635
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNxIrZj8pAcbpCeBDA9V53HNMbfEkdvJZ0OhfSu6Jcebdpcd2QL+0JXnC343ysgMKsSh8LQfN1tEicEUK5xSM8ncwf2VcepDHQ03XhQy3Dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5240

On 26/11/2025 4:44 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
> index 5fb18db1aa..aaf70fb37b 100644
> --- a/xen/arch/x86/Kconfig.cpu
> +++ b/xen/arch/x86/Kconfig.cpu
> @@ -19,4 +19,49 @@ config INTEL
>  	  May be turned off in builds targetting other vendors.  Otherwise,
>  	  must be enabled for Xen to work suitably on Intel platforms.
>  
> +config HYGON
> +	bool "Support Hygon CPUs"
> +	depends on AMD
> +	default y
> +	help
> +	  Detection, tunings and quirks for Hygon platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Hygon platforms.
> +
> +
> +config CENTAUR
> +	bool "Support Centaur CPUs"
> +	depends on INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Centaur platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Centaur platforms.
> +
> +config SHANGHAI
> +	bool "Support Shanghai CPUs"
> +	depends on INTEL
> +	default y
> +	help
> +	  Detection, tunings and quirks for Shanghai platforms.
> +
> +	  May be turned off in builds targetting other vendors.  Otherwise,
> +	  must be enabled for Xen to work suitably on Shanghai platforms.

Minor nit, but all these 3 should be select AMD/INTEL, not depends. 
It's an implementation detail that they reach sideways into AMD/INTEL to
operate.

An end user in front of menuconfig wants to see all 5 to configure. 
It's unreasonable to require them to know that they need to enable AMD
in order to be able to configure Hygon.

> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index 37820a3a08..393c30227f 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -118,7 +118,7 @@ static void cf_check default_init(struct cpuinfo_x86 * c)
>  	__clear_bit(X86_FEATURE_SEP, c->x86_capability);
>  }
>  
> -static const struct cpu_dev __initconst_cf_clobber __used default_cpu = {
> +static const struct cpu_dev __initconst_cf_clobber default_cpu = {

To follow up on a different question, the __used came from 660f8a75013
but it does look wrong on a second look.  It might have been a leftover
from an older revision of the patch.

~Andrew

