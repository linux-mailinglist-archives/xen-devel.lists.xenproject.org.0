Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B3BC693CB
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 13:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164648.1491557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLKOp-00077j-Vq; Tue, 18 Nov 2025 12:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164648.1491557; Tue, 18 Nov 2025 12:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLKOp-00076F-T2; Tue, 18 Nov 2025 12:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1164648;
 Tue, 18 Nov 2025 12:01:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YPWA=52=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vLKOp-000769-BX
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 12:01:31 +0000
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c005::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ffaff25-c476-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 13:01:29 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV5PR03MB8409.namprd03.prod.outlook.com (2603:10b6:408:35c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 12:01:25 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 12:01:25 +0000
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
X-Inumbo-ID: 4ffaff25-c476-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vw8ZjM7ChxqTszHhVStn1D2Kq44DSw04p73p1KMA4v+k8g4/5KiGuhxwafkbl/rBBKRcJ0CvLDF/Z+oJOvj3bKm3cj2SWnoS2A3UY+CoRyrqp3xs3pFP9wQBnDPldL0L0hTkCe2QmHnMbuFKZcCDs/8AC8BSyfoeU3KTK/2c39B0wEYJoNWWl6YmDSphbUY4msvnxxgh7EGTd8E6QiMqh5+gYb6bTcEc2xSuc2A4+Pfw1tHFI41y5F1atsYLuAZ1V292R1ti/8VdoKulZJcCOFIkZRWnx6MNKNxBZ3hgN5HxE8eejKytZtD/1IcH8dMMXPW4RuolL8iAkPa7IZAZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfB4ZAAy+1lMtrxygrej1C/X/vQrG1zAUYbcl7qHRqA=;
 b=tI8u2REvSYjJ38aCy34VQaQHFotxKoYZUq/NYLkVaTcu9QM5Xl0Raw58L0Ppwz7t7k5XRN5ezsLCnjT4szdLCrL4+M4UxbvtTJzVnK6OMBQhqDzJ/ibsb8KKGXY1tLinTUJO88OMrq9/Zr9hrce8X9xHVtjmbQqIAA6r07fLE5SqWAPmf8teRxa1qj4V9UFGQd1YNZkN5AIzyfX6S9BL+qBKIeb7mvk3vNMSZj015iHcuq26GVX3Rvvh8RxF51MTyOkSfdYBqoowv0oa1QwnWdNOL5gKFcyPUylXMRHAj/1/2yhlPImWl9JHRgugnnRr5BQbncWt2Gi09io3y6fOzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfB4ZAAy+1lMtrxygrej1C/X/vQrG1zAUYbcl7qHRqA=;
 b=DWWrX3e8FgVKASuI2iMfuiJKbKffuCz6q+6KyvpegChHAKSmbBiS1wxTLF7BcIV7hveTybLNehUljAeaPfhMoMptfd6iZFGOxeYoR5QLxdhzZ01rQs0c3qdWNmAfU2wnV2FfgPE8SV7Qm7bScIQjJhvcIs+A5d6e4TNNgJYDqnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c381e863-0787-4f4f-82b3-f48484aef05a@citrix.com>
Date: Tue, 18 Nov 2025 12:01:21 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/ucode: Fix error handling during parallel ucode
 load
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251117222120.473451-1-andrew.cooper3@citrix.com>
 <20251117222120.473451-2-andrew.cooper3@citrix.com>
 <52b13a38-f037-4235-8ea2-70b0d8a4b470@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <52b13a38-f037-4235-8ea2-70b0d8a4b470@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0319.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV5PR03MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 752286ab-342d-4c4f-04f2-08de269a32ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZjBhVkpITVduZCtWQm9HdVh0MVpKU00zVVF0aGYwNk95N2xqQ1JJRjNQVWZk?=
 =?utf-8?B?NVB0SUlnamt0Q0ZJYTNNMUxRencyRk94bnkyampxbnlkMFRudFowcFlMekd1?=
 =?utf-8?B?Tk0rVUhvVG9UMStxSEJHTDg5aEwzVHNCMm04SmlhcGk3Q3UxZ0lpQmNpaGF4?=
 =?utf-8?B?NTkySEc1dVM5cHIzeFRjT1FYUVFUM1djWEdFalp1U2p3MWJDTnZUT04zbXU0?=
 =?utf-8?B?TEwvLytadzIrR3R0djZ0TE1OSDA4V0lWRkQ5TDhWZm1BOHc4eFA2M3RpRXRB?=
 =?utf-8?B?blBkcWJhOXdTMkR1SWhGT1FvUG5oNXRjRysxeWtxbGkvVUJwY1RqWHdFcTNX?=
 =?utf-8?B?WjFtdEhHbEdsRGZxUmxvSTIvOElKZ2NyRVJ0aHMzVHczK2hqaWl3ZVpYRzNt?=
 =?utf-8?B?QVl6T3RmZnUxTitFNTkrSjV6VkNlWHNwdHk3eS9ZKzd4UGZrSVdxQTR2V3hE?=
 =?utf-8?B?dHFibkFVTEorckovRnRkdWVBUEdTbVFpdDIydkpwUkRGaXhVd2ZwUHlReUFZ?=
 =?utf-8?B?emNWWXRWSGEzbytUUWlWUHVVSk1SZEFqOHNsdXk1N05ZZ2xHZyt1K0pnakZV?=
 =?utf-8?B?WXlXTmxCcW5iV3FybnNhUGlmS1l4dzQ5NkdGaFJmTTdSNEpUMHgxcndGZDRC?=
 =?utf-8?B?UFRDUnRQUko4cDdCc0lXNUR1UHZBSnBHNE9hVnFUOVBldHpHS29DWTFycWdV?=
 =?utf-8?B?bng4bWJDQUYydGFPL1N1WmNQMWNyNUJqMTBVZVB6alpnaFQ2aEk5Qk5FcE1R?=
 =?utf-8?B?NzlGaTc4cFJzVXcxZlB0ZUdtMlBpZ21lR0dhOHh3YUNodFY3c1BjQW8wdnBP?=
 =?utf-8?B?a0NLY0FEeDBSNzQ4QmZBdW9HM204SkZsR1ZERnpXeXBOM1A4WGU1SmwvYmQw?=
 =?utf-8?B?RFpvbGorazZuYmNyUlRTQjB2WkdlTlczTVpIK3BjTVVuN1hFTm1QLytQTStG?=
 =?utf-8?B?N081Y3RucDdSdHdSeTZEQ0hqMlQ3T0FBOXFGYk0vdnNka2lZUjQ0UTJycXVH?=
 =?utf-8?B?eVVjTXgrWmdpN0t5RmpGYVVRSjFnRCszOEVmaXc4NzRYNVZyMlVjZWMrOXJi?=
 =?utf-8?B?V3lNU1ByTEI2UmdHdmttZHcyOUkzenF5bm5yN3R3WlF0RWJXYjJOeU9jVlZL?=
 =?utf-8?B?aUtDRitnRm5JNWZRajRCSE1URlFvc0t1SVE0L1lTK3U4L0JDQXVwVXkvcVpP?=
 =?utf-8?B?WDRDMVhtOEdNcUk5clgzM0Z3S3l6azNXRSt5bWFwcnVaTlJkYnNQNC9kZ0JT?=
 =?utf-8?B?M1h6djhuSmhyRVpRN0cwZGw4YzNXeEdocGlRWjNFWmFmZHpEV0dTRWRWWGNO?=
 =?utf-8?B?UEFNa2dJc0NyQWphZ1NuUWxZaU5pa21XMGx6RkttdWNrM3JVT2wxTHh5Q0FX?=
 =?utf-8?B?Zk5wTTlXTHF1UkhIWnFtOFVRUG50ZzUyUG5WeXR1Y1lLQ0JsZmsrckw4NU43?=
 =?utf-8?B?MjNGM2JFd1NLcHYzMHUvZzlITlpBcCtNZ2lqQ0Nzd2JPbEdhNmVlTzkzREpy?=
 =?utf-8?B?cUJjbzRFM1hKNUxPeUk3aWxabWtDdHN4OSsrcXkrcWNJV3pHcFVjKzdhWHQ3?=
 =?utf-8?B?eUttWWJPQzNEUDY4UUhPbzU3SWl1aG9BRjgrVVFtM0ZCUXFDemt6T2EyZnlv?=
 =?utf-8?B?ZGxyaVJ2dGd6akcvTHEwUkRmWWdmZmRKc0NIb1ZqbGxSVUNBODV4UTdMTVBm?=
 =?utf-8?B?ZHZncjBSQU1sSFp4anVIWU10clhjVUN4cHhxUUZTREFTbkxMSTBnWldKWlM2?=
 =?utf-8?B?NWpRenZVU1ZFTnNBOHR4TTdWWXhlMjY3azRnVEcwWklpQTZCQmlZRkE2QzBp?=
 =?utf-8?B?L1lPM2V6bURBRlJhZmJkUjUvSkJiRndtK21aUGt4Q2cwZ0w1dE41NWE3NHpt?=
 =?utf-8?B?Y3I2SXVRRjUvSGNXZUI1d0xqaDZ6a2d1T09WczB2U1ZlaldhVGtOdHl0eldv?=
 =?utf-8?Q?8tKIg+IZg91Tweav3OlcP+7DFlOkcCDY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWJLK1NyanJ2Z3daaXZpZEh3NzBuK3RpSmdnZkNhNUppU1hTV3hZdmdobU1F?=
 =?utf-8?B?WUVWa3FuZUxMNjU1M1ZDSVZ5Y0h6d1djaXROZHdCS2JsVW5lUFAzcXBhck5B?=
 =?utf-8?B?Um4xZVpKYzNKZWMyOVJYWFp4VTN4bHNEaTVxV29TL3k1SVV0a1IyZCsvaVFu?=
 =?utf-8?B?eFRPa0Ria1VOeFM4bVZWMkU4RkNUYzgwdDZLK3VrSkNJVEp4OUk3NmxpSUlJ?=
 =?utf-8?B?U0FQcVorVmhtdnBwTGdoQzQ0aUt3TXhLR2Z4bFVaLzZybWhGTE5mMS9pVUV2?=
 =?utf-8?B?VTBZUWpqUVViQ1E4R0FraExWQjZBdGhoVWZqSkFxamNGNVlieXZadWY4NnBx?=
 =?utf-8?B?TEp5YkptUHF4Q1RMTG5halRGNFM5cmNNWjlsdjdtbUhXUlZWSHE2SFZ5ZGhK?=
 =?utf-8?B?NW5oWXFiOG5kZkZaMUUxSXNzVXhXcG5aVktMQlVWTEE2M2xPS1poRWc4MTd3?=
 =?utf-8?B?T1gwbmJ5Njhvdzh6MnpYaWV4dGRVWng3eVlaNnpQVHpLV1IvNnN1cFd2TVp3?=
 =?utf-8?B?aFB4alBQRzhtWUc3TFQ4cW9RWW9uNWFIbnUrL2hJRkJBT1h3RVNnOG9SeTk2?=
 =?utf-8?B?d0w5Qi9BKytrbWUzNkxEWFhLSkVDTzRkSGVzdFNSR0k4RE5PcUZCWGFDci9x?=
 =?utf-8?B?cEN2VjNQd1hIaFZDVzVPTXZVeGRGVG0ydk5reWNKUVRaN2Jibm9jdWcvYmZL?=
 =?utf-8?B?dE5MKzg4Q0QrcnREaXpENmZ3MjVwcW1VM3RSMlY3a1lwYkpIbXViaFZUQ29p?=
 =?utf-8?B?ZW1KWThDNzBseVFTTDdmK3pOUWk1M3BJMHRnT0YxREtoZTllTWlXRkF4L3I1?=
 =?utf-8?B?U1RuRzFTQldnK1dCaU41V1BmOGFLOGpwNjlFU1ZScmREdVRlZWFmV0FYTVdO?=
 =?utf-8?B?R0ZVRUs4NUJWUzJVRVdWZ1AwUnQyWGJjV3phWUk4Tjd0Qmo3T1lGemhWcmxq?=
 =?utf-8?B?VXpDeEpBNmN6aGFtSGx5R3loWUVEV2l0VjRGRU1qOWJlTG5oTmZQM0RveTBq?=
 =?utf-8?B?MDErcjRaRjJsQ1AvbjRxeW5TM0NLTXBYcVFpYVZvSTZKVm9zVzZPdXBrQldK?=
 =?utf-8?B?UFY2SzQ0dER4akZPMS9YNkE0K3dZaWR1QjFBbStIOTJXMjhlcUk1bk1zNzQ2?=
 =?utf-8?B?bU9IUnBJSVR3WG9hQnYzcmdrNGJsek1yczhpT09EcDFtVnV3NHQycUFQeWUy?=
 =?utf-8?B?VzJ2VWVaTnJlRlZLbTNiaDk3S0NRRHdQRFNmcm84VFpmQ0FhMnJQeURzdjhP?=
 =?utf-8?B?dlhZamJWaUYxSE5vUGU3RWFjR3RFYmthK1NOUVVnRlFvTEdHUFA3SlBXVWc1?=
 =?utf-8?B?SkRNSml3RUJrb2JtcUFweVRmWEM5Z3RVb2JJaURFRTljdllSZlZVMUtTYzNB?=
 =?utf-8?B?RjJYa1lVQkhSSUlKc2lXUlFMcW90WWxCYUx3b3BoaEowU25ndVhFUGdJZU1a?=
 =?utf-8?B?L2RiV3JmeWN2K21GOEl1VHlibzVyRzZZVUtvUWIzc1hYNTl1T2s1ckd1SXEr?=
 =?utf-8?B?SmhrVGdweFh6WURnd1JHcDNhTXJ0S05VcTQrRUgySzRrQ01URU45b2NuU3k3?=
 =?utf-8?B?Y2pLSnp3Q1Izbkhjb3JrMFVqRFd1RDFpdkl1eHhsZVUvSmlGK3pSbkkxUE9N?=
 =?utf-8?B?N2d0L2QwQ0FnQithazlGajd5ZithNi9NZzgvVjczRW9vSDNtdjNMcG1iSjl1?=
 =?utf-8?B?UFdJMGpnV0IrZHRVV0dNUXRnK0c1RlRsN1djTUZOMERSRXlXUGxnb1NyNlRF?=
 =?utf-8?B?a1ZJa0NocU5aVE41ZXVRWE1wdGhZM3JrTmF2elVZaXFoWi9rdDIvMVRFZGJ6?=
 =?utf-8?B?UVMxL2RtWW1VelU5OFhSa2Vlc0FNRnhvNzd5Z1JnSll3dkhTb1RiZ0dZWnYy?=
 =?utf-8?B?eExxdWVpQ1VUbUJCWHBFMHAvc2RzbzRSWmZudW5ReTl6UFlJUHlYcldyS3pB?=
 =?utf-8?B?ZndGOGQyMUhHVlA0dnA0c0tESVpoc3BCcDNGbWtWbUFTZVZwbnNuUmZtN3Ru?=
 =?utf-8?B?bnk2eWNmZndRUUpQQXZnWTVlSkw5dEZvZlJYRmJxaFJ6ZHZwQXd0MVU4YW9u?=
 =?utf-8?B?anh5Y3o4S0NtM1AvUGlQNlFGR0NUT01Xb3JFeFBXMVdOaFphMjh2OVUvZHdS?=
 =?utf-8?B?aWplcHVWWEpMYXNqUDVkeUJsOUZlYTBHRXhraWJwWTlMY0xhVkJnblJyRktP?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752286ab-342d-4c4f-04f2-08de269a32ad
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 12:01:25.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PES2gL8PIWaSOYbNi1rZbaP3EByLsmDX5p8y7kwB7BtABVSF0u5PKdGSvyJjdA9BT5zdLTBTG59txTjGh7VGQcsBTEJPrSs8KYa5oxHrXm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8409

On 18/11/2025 7:49 am, Jan Beulich wrote:
> On 17.11.2025 23:21, Andrew Cooper wrote:
>> wait_for_state() returns false on encountering LOADING_EXIT.
>> control_thread_fn() can move directly to this state in the case of an early
>> error.  It is not an error condition for APs, but right now the latest write
>> into stopmachine_data.fn_result wins, causing the real error, -EIO, to get
>> clobbered with -EBUSY.  e.g.:
>>
>>   # xen-ucode /lib/firmware/amd-ucode/microcode_amd_fam17h.bin --force
>>   Failed to update microcode. (err: Device or resource busy)
>>
>>   (XEN) 256 cores are to update their microcode
>>   (XEN) microcode: CPU0 update rev 0x830107d to 0x830107c failed, result 0x830107d
>>   (XEN) Late loading aborted: CPU0 failed to update ucode: -5
>>
>> Drop all the -EBUSY's, and treat hitting LOADING_EXIT as a success case.  This
>> causes only a single error to be returned through stop_machine_run().  e.g.:
> Why "single"? stop_machine_run() can't return multiple ones, having only a
> scalar return type? Or do you mean "a single, consistent" or some such?

stop_machine_run() has a data race on stopmachine_data.fn_result.

Any CPU returning any nonzero value back into the stop_machine machinery
will update the singleton result, and latest wins.

This causes the BSP to return -EIO, and all APs to return 0 and not
interfere with the -EIO.

>
>>   # xen-ucode /lib/firmware/amd-ucode/microcode_amd_fam17h.bin --force
>>   Failed to update microcode. (err: Input/output error)
>>
>>   (XEN) 256 cores are to update their microcode
>>   (XEN) microcode: CPU0 update rev 0x830107d to 0x830107c failed, result 0x830107d
>>   (XEN) Late loading aborted: CPU0 failed to update ucode: -5
> The sole difference being which specific error is observed, which looks to
> support the above interpretation. What I don't quite understand is ...
>
>> Fixes: 5ed12565aa32 ("microcode: rendezvous CPUs in NMI handler and load ucode")
> ... this and the specific indication that this needs backporting: Why is
> the particular error code this important here?

Because userspace cares about -EEXIST as a special case for success.

Having -EEIXST clobbered with -EBUSY causes a false negative failure in
XenServer's testing.

As said in the cover letter, 4.19 and earlier now suffer this as a side
effect of e0bb712a28a9 ("x86/ucode: Abort parallel load early on any
control thread error") because out-of-date ucodes used to be passed into
stop_machine and cause every CPU to fail with -EEXIST.

>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -260,7 +260,9 @@ static int secondary_nmi_work(void)
>>  {
>>      cpumask_set_cpu(smp_processor_id(), &cpu_callin_map);
>>  
>> -    return wait_for_state(LOADING_EXIT) ? 0 : -EBUSY;
>> +    wait_for_state(LOADING_EXIT);
>> +
>> +    return 0;
>>  }
> At which point the function could as well return void? Preferably with this
> adjustment (and the knock-on one at the call site) and with the slight
> clarification to the description
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

I have a different series, but ucode_in_nmi needs untangling first.

Even changing this function to be void causes this patch to be dominated
by cleanup, which isn't appropriate for a bugfix.

~Andrew

