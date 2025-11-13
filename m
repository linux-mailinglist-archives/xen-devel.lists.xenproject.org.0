Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C123DC59861
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 19:40:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1162056.1489849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJcFA-0003ok-48; Thu, 13 Nov 2025 18:40:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1162056.1489849; Thu, 13 Nov 2025 18:40:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJcFA-0003mL-12; Thu, 13 Nov 2025 18:40:28 +0000
Received: by outflank-mailman (input) for mailman id 1162056;
 Thu, 13 Nov 2025 18:40:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X5Bi=5V=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJcF9-0003mF-0I
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 18:40:27 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 350acf2a-c0c0-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 19:40:21 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by SA1PR03MB6562.namprd03.prod.outlook.com (2603:10b6:806:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 18:40:15 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 18:40:15 +0000
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
X-Inumbo-ID: 350acf2a-c0c0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DcW70mAgotGGgQX0Psdd94uTiCUDMf3az56xCp4EfvhbeFQt9H4o+EWRwqN39EAs2RRRYUYCaoWn8ZoetRhanqpc6j5YatWJKzHFhhNC+8w+/xMkKSbQj5IP5SAS/ngqLbHrSoR4oQ3Aur9AXL5b4TNFK67ub5+s57O2SXkSfL7oX/Z46gVs09Bz89is7hEMXhroNVn9ZRVmFjd8OKeHUvxYuhjNnamcgio8zmOpAM5Fr8Gm3p6PHCo6W3saizCdkLtL6zYNbz8SqDesFTC/6ApJZPPUYn7lMJ5m8TOHJKwv7TCqh9y1quurQwEkM+wD+rs3ID36H1qzT74LxHKCng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h64cCLujmHCZOMUaU8v8tv2k8Sg/VOIGd0dYcxlE0xI=;
 b=HY5Kknnye/oHoUEXbDZB1Z5+QZX2LFjyByPwMpLEMgsQDuYoggjrYkNV7iQB/kUeHMyFuJxwuD/VdhhlKq4+Kb5DVQwIGmBiy0yHfjySl5o0S+7Gw8DqBRkgC/RFIV2IH97HzLsRePRQnYSYID5a3HmDuvi6/VJTVmUqFqKJeHKKP94DhiTK59bsCaxGIo9NjVMLPVIFKSHaIITdIykcuDNilJXigQC8Ssni0H5tnXKNbaXdsxb6YJV9tJrerf9iM5PMHR8tjzGqocbAoLDtIGIstX+2e6rqjYgpkxarLJkHFMfIFaZaRtRZgbtkZZgSHMMNLREXQWySL1MOjKQZtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h64cCLujmHCZOMUaU8v8tv2k8Sg/VOIGd0dYcxlE0xI=;
 b=H0ugjnXYH49EEHoROQfBeya5jpo2gbEM5YhjdoBsWb6THS++3gcIS3Ngb2RgSNqLe9iQ7MzzR9iElmnTOrf5/Q/IpPKXpSfcqGFGdXX1HGDBg2uV2eSy63u3R2tWuHoHJl6zY4b4ml/bDhhIAhfpq68esdbWPLDZrMZRag5ImWE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d95e5a85-a8cf-4207-94d8-5e1afff615c1@citrix.com>
Date: Thu, 13 Nov 2025 18:40:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v8] xen: Strip xen.efi by default
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Frediano Ziglio <freddy77@gmail.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20251113154358.28704-1-frediano.ziglio@citrix.com>
 <aRYk80Sqo-sjN6fG@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aRYk80Sqo-sjN6fG@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0182.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|SA1PR03MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a3ce7c5-7aea-48c8-34e7-08de22e415f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UjMyNjB3MXgrY0RwTExjNklqZTNvZGlPRXdTRkE2bHN1bzFKeDY3bk9DcnEr?=
 =?utf-8?B?aXBUY3Job3R3a3FDWUd1SVA2S0x6MzhNSlVoQ3J3aXN6ZlZ3ZjBQc1BVWmJx?=
 =?utf-8?B?SHUyVThNcE8vcFlZc0ROWGQrelFZQzFIOGt3L0oydTVRcnRNWEI1bGdsR0pX?=
 =?utf-8?B?WWdLYXFRMUVCMVNXaWNCNmtSc2p0Sm9DRHNCUk1sZTYxa0t2ekFtdHlxT2RM?=
 =?utf-8?B?Nno1Q1JOL1Y2S1drbkRDd2VycUp1S1M0TE1EREgrbFZwbmxWTFI1T3RDUEFM?=
 =?utf-8?B?ZmFKV0ZyY1daY0ZEVkUvRkpYVnZ4YSt4bmJ4S2RBZ3ZWRDduMUtKVmh4TVRK?=
 =?utf-8?B?dk00Q04xSnhHbytheUZVVUxMNXlKcHprb0xtalB3WTZ3Y1V4eE92QkI2c3J4?=
 =?utf-8?B?SVJ1UEdtVDRWNk8ydmc1UFZVdWhaMDdBRDJXUkhBeFBwVGdKdWwrWVR2OVI5?=
 =?utf-8?B?VHVvVFNhbTAzbTFxT1l6RUFqb1hSa3QxUGF0UGlJbmlQcVd4T2hqUVdZa0Yz?=
 =?utf-8?B?cWhCMndEa2E2MldIenhaM1RnM25QTHJ0dW4vTmZ6NlN5dk9VeitDeFBCQ0ZC?=
 =?utf-8?B?MTIvQ1FTSGdZd0JPL09qUTlFZzIvU0I3STV1RHFEbzU4SkFYNjJMc2ViNzNN?=
 =?utf-8?B?RGhvN2ovNDB6MTEwaXpVTklrQmZyT0RxdmhMWWhWcC94L1ZxRDI0NlpvNUxD?=
 =?utf-8?B?ZUpyL3YvQjJrRkk2Nm5hbVp4VEU3alFVUmtSVlN4eDlpdUQya04yUlpWdjJ0?=
 =?utf-8?B?U0pHdUhUMHg3OWpCbkFvZFByRzZWVithSDRzSVp2ZWFMM1NKbzdJZjVtRTZ0?=
 =?utf-8?B?NkdQMlBHNDdrREQzc0hoQkF4aWVKL0pGMTVQVWx6RWtXRHdES0o3YzN3dnZu?=
 =?utf-8?B?SmNRK2xNa3FKNDlOWHU4L0N1Q1FxaTlOYkdvMWFubEdzeFpnaVJpdnpMa0My?=
 =?utf-8?B?ZEc3Sm9tbmNGSDhYU2k0WFJtUTRwTUQ4WHR1dUU5amIvWDNyakpvQTV1WmpI?=
 =?utf-8?B?RVhnMmlIWjdnQjRQc2JLRUF5K2dXSENSc1lSVWs4aGh0N0dnWXZ2clU2NXFr?=
 =?utf-8?B?ZXlDc201MFA2Vk1oMkVQelpXN0k0NFVoVmN3SHk5L2lYT0YrWXdZOCtwMG96?=
 =?utf-8?B?N2tjaFFsekVNWDZKSzR3ZFRXRnVTZ2JiN0tiRTUvdUtqTStjZUdWZG14MnhO?=
 =?utf-8?B?QVBScXNoVTZtckNzVnc2a05TS1FUL1JHb2h4QjZFcFB5Zk1VL3NnN29sWkFq?=
 =?utf-8?B?SnpOM2dob2RIMmFlTUZDNUNobk5qcmVMWkFVZG5lVW1WbkEwTWVoQkFpQ2dN?=
 =?utf-8?B?WmQycktpZmwySnRxNkF2OG81ZlUzS1pGTS9RbHNUUG1BR2F3NXloQ0dOTEh1?=
 =?utf-8?B?S0hSdXVTeHhYdkxGZkVOTGdkbmhpWTMwWHBYaVFsYTZORjVvWlRiRlBVU005?=
 =?utf-8?B?R3VGTzZIQVRvVFRzZWlTdEo0bllPZ3JOcmZQdnE3WUk5K2ZQcEJDMmd4UmNL?=
 =?utf-8?B?ajhFSGNXMTBQZE1IbEFXL0d4UmZpRlV6S3RObFNkN05qWHBNblVGRnlUUmxC?=
 =?utf-8?B?SEVFdGkrRGEycFlPSTJFT2tjMkR0c0hEa1JDdFBXU3dsRDZ1M0F6ZHVwOHFW?=
 =?utf-8?B?SW1JK3d1blpDVENUaUhPdDBiZEpkdXpzZGUvemZWLzlCa0VGU0NEbi9yYXlP?=
 =?utf-8?B?TVc4MEtWcU8vZmtoSW9UVnlsZVE1d0h0b25tL3laTXo0bHBNRXRzNkhIbk5l?=
 =?utf-8?B?M2tOcFlzWkFlR1NUblo5bTF0L2ZKc2RxZy9QNFBLdnFzSU1hOTZiSERXUlky?=
 =?utf-8?B?VzVZSG93UlZwZitKU1RwUnFBSU9kTTRmQmhLNnRqSk04ZjU3bFR3VHorZ0Vz?=
 =?utf-8?B?aTh4NS9lQld5akRwODE5bEFKbEdjMU9Vem12RjM0OTFWNzd0emFlWjdDVFNt?=
 =?utf-8?Q?4oWtvGXDrvtFcuvt1vxlDgdJEbSs6h6R?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFB4aC8wYlg4SDVUbW1qVnYvb29kRWhSVENDcnBTS3d1NzhtbHg3SWRxMFBV?=
 =?utf-8?B?Z0dqYU12VFVLNFZZbVp1S3FGMm5UUjYrODlSN0VtaGQzekdQTlZxWkhXUFRR?=
 =?utf-8?B?OW1vVnhFU0c4Y1BVMk9tdmtvSlFBbDBidGZsRHFXNWRJd0hOY3dMWDFBTjFT?=
 =?utf-8?B?YWpmSGhkdWVhWEh6WkcxdUoyL1hLL2xkV2NpMWU0bWRXMHpTUXJleGhZbm80?=
 =?utf-8?B?MWdoQkl4bSt5eHMxVktFbm5YVEdva09wMENtS1FOOU9LWW5RaVBsTjJWWERE?=
 =?utf-8?B?YWlidG8vd251TVRSR2lQeFh6djdVWWhEdTlieVREdjVQVlFPYWhZZjFYVEdW?=
 =?utf-8?B?bllGTzZOdlBheDdWanpDZmZuaEhIbFRMQWpJN1E0MUVYZFlYY1E4ejBwcUJ2?=
 =?utf-8?B?bjl3U0VvM3JCWTBaalp0Vm9yajhIcHBHUllQSG5RYlVOazlod29RZElEVCs5?=
 =?utf-8?B?R3RZWWllaEk2bEpLMXJCRnJtRWFLY2o1d0VmR2lXZ2FGZEpsYVpOYmt4WWRI?=
 =?utf-8?B?dEZ1VXhtN0o3QnBwZEJOSEhwbDJ5ZUpYTHlRQ2wzQzE5a21GbXozcWJXRHlE?=
 =?utf-8?B?QThuUHcwMFAwVVhDSXJkdmk0RzlTeVh4RFZtMUVOM0hZUnAvbmRmTElONndq?=
 =?utf-8?B?Umw5SUNZaW4rdFJMQTBUeENuVFpMbmRqSldqdngzY3hRa0NJUG1Tekg1SllQ?=
 =?utf-8?B?cXNVblBNcDEyMk1Kdkg3UVVzTC9Fc3FXbi9SSTMwUitqM000WVBWMVo0SWJ1?=
 =?utf-8?B?N2ZLMTd3MmNsZlBueFB2UUx0YTYxaGdXU0tUcDZGVlB2S0gvMUtMQkRCZkdM?=
 =?utf-8?B?K3ZQL3hvUXRsVHI4T1NBb25lWHVvQ0FCcjMwMXZyQk5CdytFL21nbWtJQ3pv?=
 =?utf-8?B?UE5TQW8zMG1MbWZzNVNqdDkvQTI1dHMxVi9HNURBblNqZFFucUFWMktEemdL?=
 =?utf-8?B?L2pERkpjVHU4eUtHem13M3crRUloaGhKbWRaejBRZU0vQ2RFTlVSWVZBeHVM?=
 =?utf-8?B?bm1TOGtnMHZGSUlnd3pxVHJjVmdyNXZVcUtqRTVraTIraUIyN2w3L3RKTVRL?=
 =?utf-8?B?NTVaSTBKUEdMOU9aa2dMRWFoV3ZLVGdLemFtbU1YQlBvU0NHMFNHZ3FTTlNx?=
 =?utf-8?B?aUk2Q1VnejRTcEJXVGR1T1NFK2xDTHIvY0NRQXdxZ01DSDRCcWFVNVJhMG8w?=
 =?utf-8?B?SkVFV0RZWkZXZENicEt4V1VnbjBCVldyY2Q0c2hNdytONityZlFJSG9xTHM3?=
 =?utf-8?B?ayt5b0hzNXZHKzExeEhSUkVTem5xNXdudjhVa29xc3pXL1FCNzJSaDQ4S2tv?=
 =?utf-8?B?ekVMekxXTG5pZFB5M3ZwZjBrNGszaU5Gc3VjUjE2eDVBWkVDajNuRlNJcVcw?=
 =?utf-8?B?RjFyMEZLYVp2VDRYMk8yaHdaZGtuclJrRmoyMXVSbC9NM05LbXExRFJxbkQy?=
 =?utf-8?B?Vld2QkJxdWFNalFIWTNVcU9WUFNrUFozY1RobCtYelg0U0MzQzRXVUZKNmpa?=
 =?utf-8?B?aDkxSWoxTlR6R1hwamtuU20vU2pDcFpKVTRpcyt4eExIMEpXQU1kT2U2cG5j?=
 =?utf-8?B?OXhUcmFlVUQzTmpHT2xrdGh3Y1BoaUtZU1JBcTMzZUJrdVF1V2tXSEgzaldV?=
 =?utf-8?B?MVBIc2lSVERBWFhReUwvWlp0NUhYTGNNMU1odjNzM0FMOWdNSU9XMFFqWjla?=
 =?utf-8?B?eXMwZVhLeEI0dXRzWUFsNkhUWjk0ZVduZmNvNU13d2ljeDJJTU1rRVVPZzFL?=
 =?utf-8?B?QldPMHBRbUpCYWhhMVZ6VVdldGxLZEpSdTJydWl4TDkzMGI5WXZrTmtBaVpU?=
 =?utf-8?B?TmxjbWExelNSUzU4Z2tnajR0L25pOHdubGpJRDJVWE0ybjZOc0ZpSllFaGNt?=
 =?utf-8?B?eXVHL3BBek9adUNpY05sVEh3L1JYVFdDVXhacjkzcnZyODcvT3ZxNjJ6LzVl?=
 =?utf-8?B?ZnUwelJ3RFJBVWgwL2hPa0ZoSEF3TWVXTk9Jd3NMSEt5S01scFVnb3B0cWJZ?=
 =?utf-8?B?bWJqd0xRRzZmOXNjb2Q1dFVMcndpMGVCSXhtN3E5REtnOFlwMmlOdzZUSm5N?=
 =?utf-8?B?Z2p6RkxYVW13eTAwaG4xNWZOdGtFTVpaUyt1Zmw1NzNRWXBIYStCckt4d04w?=
 =?utf-8?B?L0M0Yy9xSnFKTVNKTUZSK2VkT0l1czJkYWFEeFpsZ0lHZ3dTa096L3NHOUlG?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a3ce7c5-7aea-48c8-34e7-08de22e415f5
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:40:15.1041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHkKD/hIpIZ/UdU8BlbYVh9VBpTNfgeqO1dJIlBZ5SL+Qw1t3FH65sR1PDSuLj7WpNUcyP0lBfvwg5DAQy3zVqBTxeE6nVgf/9vkAVjQnRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6562

On 13/11/2025 6:35 pm, Marek Marczykowski-Górecki wrote:
> On Thu, Nov 13, 2025 at 03:43:58PM +0000, Frediano Ziglio wrote:
>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>
>> For xen.gz file we strip all symbols and have an additional
>> xen-syms.efi file version with all symbols.
> You meant xen-syms here, right?

I think so.  I just noticed the same.

>
>> Make xen.efi more coherent stripping all symbols too.
>> xen-syms.efi can be used for debugging.
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> With the above fixed:
>
> Reviewed-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>

I've done some ad-hoc testing and everything seems to be in order.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

