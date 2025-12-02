Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70F9C9B570
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 12:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176143.1500679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQOnu-0008Ts-KK; Tue, 02 Dec 2025 11:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176143.1500679; Tue, 02 Dec 2025 11:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQOnu-0008Ra-HI; Tue, 02 Dec 2025 11:44:22 +0000
Received: by outflank-mailman (input) for mailman id 1176143;
 Tue, 02 Dec 2025 11:44:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WL05=6I=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vQOnt-0008RQ-0K
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 11:44:21 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a1b95a5-cf74-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 12:44:15 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AS2PR03MB9003.eurprd03.prod.outlook.com (2603:10a6:20b:5e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 2 Dec
 2025 11:44:11 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 11:44:11 +0000
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
X-Inumbo-ID: 3a1b95a5-cf74-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvbFMZbYOd2GB6FVZaFaHeVvalUzpkrNLsZmQaBEF1tjXlaA6wUTMX3GzbzJd4exDJI9UYQb7EzwUD2LhS3s7mziEuVYnF/fWCI0cuKykwuHJJw8xgfDicL1m6t9xrmgUX+wsDa+vAiNq5Eyf7dU7seprHPKcYoDd2NvBSu/zEYNUbASCS9nnf7skGmP2ouY7Or2w+MZZb7cW5r+F9VtF1O9N98QXYQ5n+jEZNlRzu98GY6dpibEaoz5zLicBlUHeETQKZK4hgcgctAsrPTMChGaB1otN4Hd9s910V35Xakr+j8rNqCGvy6dqxehlL2s0paKoisE9V89viBrC0Gq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8Dm0QJ0gR2lbXLFTrqzLa2MbAI0+LzNdHczf/PDrrg=;
 b=osXe7+z65bOy67rqa6x9WjoCZewB7R6WRy0ltH7vwrWRtHA2v1LuhFFuoeqmcwoLME9cE0gn3XgFD3Qxd0nU+716L3mEiySmaQSI2v56YDmWzc5ahvEfm2uvHOILDbbm77QHei82ZUXJRaUJnZxhnj08QPKpVJIiOe1kqzV3eJ31sGni/H6U59mevHrxqeGY2hBaNnOkVR46WfVjf/v/urPZqP9TfeNljQetsmURYAIc5Kemppn+hj8GnzjoKjz3S/9Y9FUG82q7cnXIMntRT6opFyPK9+b1b6tkYu/QTkR3/5NnngvUAob47ASbGsbfEEw9ZXf1IhfuaewytT18hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8Dm0QJ0gR2lbXLFTrqzLa2MbAI0+LzNdHczf/PDrrg=;
 b=buRAUGMzvJao9L3mKUMTGAUHNopFw8pvYU/LAkSu54daUT21fnwYulOWqQ4wJrgl+AI32fVQqUd1QCZUch18yllN/600x7+xzUI0d7CTHrPtiaVvb0o3tXhXrudrVe+7rS00PqfdgnZbN4mN/Pe63iq0sOvnD9q5pkZU+0E5ekymyxWmJ5a72xr2Pn6usBaqSTBTMJxDvcmNJ6WQ0chDVRe82t8+IjET0xw2VInkT3dPbC+TVRFMk+55S7/E0NI3DEwXofJ120SO+awJukB3/q7LHBpj5KTDY8HWzlgHq31DoAD4IGfz0hbm8LCjsalGBbXk2hyV8Py9d1sHQi7aKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <11b01aca-5a3e-4bfc-b939-46461d143c4d@epam.com>
Date: Tue, 2 Dec 2025 13:44:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Ping: [XEN][PATCH v4] xen: make VMTRACE support optional
To: Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Teddy Astie <teddy.astie@vates.tech>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251119193120.1011448-1-grygorii_strashko@epam.com>
 <90ac9206-10ce-4c46-83e3-82ac8ef0d152@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <90ac9206-10ce-4c46-83e3-82ac8ef0d152@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|AS2PR03MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: 722c0880-c0cc-4a84-ac01-08de31981c2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXZMZ1M4NUxLclZUUCtWcFJSWE5TVGw1RXdHd1pXa0ZocGFjVmxsN3NvYllJ?=
 =?utf-8?B?WFpURThWR200VjErN1lNNEdlNGx0dHZaUDhzbXVkb201R3QwZkJFTUtOT0Rv?=
 =?utf-8?B?c3pDK3gxVklrYmdOVWMrZ3Q0NWJYMy85RE1vQk1hQWtWUXlUZ0tGWjBqSEla?=
 =?utf-8?B?dENmWDhDTkVpNmo2d2RyY1huZzY4VWMrMGhUMzZpT09sQzJxUFFvR2c3bWJ1?=
 =?utf-8?B?dlZsZ0grUk44c1hyNVZ4eVZ6REpUMVJKTHRONWowQVh6TlNnMUV3MHdmY1I5?=
 =?utf-8?B?STBSaUVRMXo2TjVBYzVhTjFJMmxqV3Z5c3NsTjdvb05JQ0RKT25ORWk3UWNK?=
 =?utf-8?B?OVRacGR0UE4yK0tnYlkyVG5SaGp3eGtJYnRQdzBrdFFER29vMFIxZ3V1TUVn?=
 =?utf-8?B?bmJtdkpDWFRxWENKYkpQdjJ2dHNtUUZKRXMrYlFEdDBSZlcwLzIrd0M3NlVr?=
 =?utf-8?B?VjNvNWFRMjlMRVhodGI0c2dyQTJLaDV5aGRTZHMxeFBGUzV6ZDV0Q3lrVnJ6?=
 =?utf-8?B?aHBQTEpWUkt5OTJDWUd2aGM0MzJudUwxK0Q3Vk1INUtGMUo2b3drQkxmNWp4?=
 =?utf-8?B?YjVjdWxFbktXcjJRZ3RLL2FvRFViT1ZqQ0s3dHRRdmRPK3V4djFEQU5icG4x?=
 =?utf-8?B?OFhxU2xGV3VRUk4vLzh2U2Zsem94dGFGWnYrYlNiWDVZbSt3ejk5RHd4ZlpR?=
 =?utf-8?B?UU5GSnJvcDhhckVta0xNYUJhS0dvNG9OenMzVU1oQzJCZlFVaDUrSFVnWFBi?=
 =?utf-8?B?NklkTlZqNnk2WUdHelR6REZseXZxaWdXbDdoUmN0NUpNak5IZVd6UU1Hby92?=
 =?utf-8?B?MjZOdGY2VWV4eFhtb0hiRGxNd2hXYk5BTkV4OU5qcXZJZVZQSEtHWTMwMlhm?=
 =?utf-8?B?VXBwK045R21HbElFeWc5M1l4SXp2YlFxVUc1VXpFNlZodzg2U2p0ZjJ1aXVG?=
 =?utf-8?B?S2pRbWFYdlZRcEltQkZaR3lzSCs2emUvZEhMak9vWVBISVdQNWY2SzdMU3Mz?=
 =?utf-8?B?VXBvbytkdzVaYWFuVEpuYkVudHpLS1gvM3puQyt6ZkptUEZBSXBnWnhudlNy?=
 =?utf-8?B?NG5sN0hkakNyRGY4K3RVTmZYbklhRXB4aktxZXpOeHB4cVU5TFlydUtyaW9n?=
 =?utf-8?B?cGlVcWp4RHBxN2tKUXpLR2dMNDhuTVRkRWxiNTV5TWorT3VRdVg2RUw4NDU5?=
 =?utf-8?B?NEpOdm9NRFRGNi9ZT2ZMNzNrZWVaSGRJS2lwNFNXNG85N1pvVTZxWTQ0UnFk?=
 =?utf-8?B?b1Nub2dzcWJBYTlPVmZrTTBNNTg5Qm9zL2t1akRzVXdPQXYwL1J4Z3hJcXhU?=
 =?utf-8?B?b09naS9FZmJOWDRpWW1SR0xBdjF5d3N2U1RzTXplL1RWcy81Vk1EZ2VkZ3pn?=
 =?utf-8?B?SzdTVWVyMnZpWlBwZTJ5NENoWGt5UG9TM3RpZnBtb0ZLMU5icHdycHptWjd2?=
 =?utf-8?B?aTJ4bHVMVjBrSzRUdVVEeGpDR1VDWmhDNVgrbVh3a0tXLzVLVklVM0RGL0x2?=
 =?utf-8?B?VUhSYmFjdytUcWtnMnNqTWM3eGFJWVVzdnJ2MEhTdXladjMrNGJYY2E0RXk3?=
 =?utf-8?B?MEtWaWRXMEoxaGhDcmRFb1Y4Wmg3ZkRKZURIYm9oUnoyZ3FINGVyN3hSZVhP?=
 =?utf-8?B?OHIwTmIxbkhTOXU0SW1WaERwWTZyd2JCdDhhVTlYUURmUS9xenF3cFl3b2pm?=
 =?utf-8?B?K1dGZm9uQ3oxNW9ia1VXU1p6YlRPTlNyY1IvbklUMjhCMDlHWmoyeVhSVnB0?=
 =?utf-8?B?S3RjRlhyUHlUTnZmdWRpT2g5NFpiN3lvRnE1UWRpTDZTSFE4MWdyYitJd2M4?=
 =?utf-8?B?SmtPTjExWFVjR0RaZjVveVpjMUNnb1VmMXVCS2FSL0Zpcjcrdm5leHJDb1RY?=
 =?utf-8?B?Z1paT1VKZ3g4eG9lTUpxOEF5UFRGVDQvQ2FqVzNHbTBjbmNLbXBFeVFqbWlL?=
 =?utf-8?B?L2FiL1lDdUNsd285ZmZBZjJvK2J6cnRCaFpWS1FqVjFCaW8vMDN5RFhCa3hT?=
 =?utf-8?B?ek5LQ3ZIZUl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFJrUWxiRm5EZWFTOTJGZk9ERUpFSzNhdU5CUGdzdFZUMVJJMVhEYWQ2YmNQ?=
 =?utf-8?B?eWM2WGJ4M0V6OTBiTFhrSHZWeThCbEVaaHlyWkhUUXRaTVJMdjlBOVVJSktm?=
 =?utf-8?B?THM5aEpzK051QzIvWFkrTnl5cUhVRTRYMStKV05PbXhDZlo4YTY1RzFXZkZB?=
 =?utf-8?B?ZlBzaHZ4Mm5mOTlCQVNBN2VKZm9KbElsTHdiUE5vcmU3bzFsQjhNUEd2bVhY?=
 =?utf-8?B?cktSdCtDb2hQV0tsVFErNTFDT2k1YkVCZDJjVy9OWnd5TGdnbFRXSE9MQlh2?=
 =?utf-8?B?QlJ1ZVZNM2RMSWlpM0xiWWJwam1wQjE2K3VTZ3VRVkxiT3JtL0RWbUZDdDIr?=
 =?utf-8?B?R2xiaUZGSHNEMXFjZTN6WWV0enFaSS81QzBQWFB4bUFCMkFEU1J3NURqa1c0?=
 =?utf-8?B?TklpR1ljZFFxOXg0dzR3anFEZWVOOHNmRHl6UUgxQUpiQklPRXdCaUJscDlD?=
 =?utf-8?B?TU84eWdsVzBoVWZteklaL25QbmtkZ0tRWlZ1dzhCTUFWeWlRNUlmQWZRVVUx?=
 =?utf-8?B?WGV1dXlQVEwzbnp1NmVyV2VUeUNTbXFpNjhNWDlpNUkrc2Flck1tc0RINXRw?=
 =?utf-8?B?MjN5Z2ZJelVPeGsxbjl4ZjRQajEwUStvdFh0RklrbVlna2V2ZTFDNml3WnFk?=
 =?utf-8?B?c01LcXN6SVBXU1JGTnJSMXZ5MlBuQXdGRjdTaDQ0M3lJS0MwSkh5RFNIbG03?=
 =?utf-8?B?NnNYSjJySXFkUmRibWJIR0tMMi9oS0p1SDErMUtleWZEZ2h5Sm14ZE9lLzZP?=
 =?utf-8?B?cVk2d3ZvaDJIeXF5NkNWWEUyZzlzQk81VFo0ZmdwUXc3aGR6cVpRQTRCVFFo?=
 =?utf-8?B?WjhlRlpDM1VhYml6bytXZGUyWWhxMTY5a2psNisvV2JhcUQxSFNrcjBRdTFj?=
 =?utf-8?B?WDVxSlEzOFUvbWJSTzdTVjNWQnovZGJvUnBRcFQrOFNCQmVQZTFaelhVdFVt?=
 =?utf-8?B?OGI4M3gxRlFvQ1dLbk9nYndUbFVDVGFYeGVIVndZbWVoQXVoMVVFS2gxaTc2?=
 =?utf-8?B?Q3VBaXdYOTJ1c3ExMEYzREtaVnlkSUMvR3kwT25WL2ZSZ00xNDJOckJ5ajZ4?=
 =?utf-8?B?WTVFb0dIalgvU05weXhSUWJoMURvNGl0Y3ZraFF4SGxEQlpjb1MvUnFrM2po?=
 =?utf-8?B?QmZ6TzhqOVNxcWIyUjUyWUFRTG56WTB2eTZ0L3ZPNGZQSFlDNnJGeHNFUTF6?=
 =?utf-8?B?alVsV2VtQzFXVWcyZkNFU3gzTVA2L0V2R1dMaFkrVmlMY1JDTjc3SHZ2NUxa?=
 =?utf-8?B?L0V6QnQxY1g2d2tvejRLUVlNQ0tDNkdTS05kSDFwMXZwakpvRWdmalJUdEpN?=
 =?utf-8?B?eHhJL01Jc09kVmNRRE9VRDRXcVJaaEh1Ym5XMzh4MFB1dmJjbVdpR002T3BN?=
 =?utf-8?B?ZVMraUpVOG5lRWE5SXJkeC9jNkJJbTV6aDNyWVh0NzhwZVF4SlcwYXRlV210?=
 =?utf-8?B?SlVkazVCWm5tMTVFRnhXSXhJeDdOa0NQdjJqMGptRVNoUzFybWlubW5KWk4z?=
 =?utf-8?B?TnlkYmIvbVo2S0NiQ3VSb1JlcUtuaXJpTGhtS0t5YkZlZldhaVVRUFlLQm52?=
 =?utf-8?B?L0U2d04vaSt4Q0QvUTJwUGg2RVRXeTBnci9RL0ZONis3UWpQK09YT2xUdkxv?=
 =?utf-8?B?SGkvQmtjcGNvK1d0SjdoRVpFZHNtbHpHeWtpY0RQWStPMzdBLzd5bEFCNVZW?=
 =?utf-8?B?a05wSy9sSk1vSjNMeHYrbytPUlUwbmhGSW9ZcnVZeldjMk9Ydk1sTEhDQkJF?=
 =?utf-8?B?ekJlTEVLek9OSVZwS1N6dGliZmdVTm5YVC8wWlVBWFRMWHNJTXk2OTdlODNa?=
 =?utf-8?B?SklpNHRaZ2QwN1FuL2E2UmpBR0Rsb2ZSa1I4Rkl2Rlo5RFE5RWtBNUpzQnFK?=
 =?utf-8?B?VUg0ZHlPQUlqTWY4K082UHhqVDJQTHVzQ1NUdEZ6dkRnNkdsNExVcmFUQjg4?=
 =?utf-8?B?V3JMSU96ZnpXc3BVUHlLRGk3Y2pSY1FIZWJOTExVMkNSbFI3c0VRWGtUb2x3?=
 =?utf-8?B?R2JmRXBmMGRVZlFiMWZkMjErZllmNVdmaURlNWd0RnNsVGVsU1BGVDR6aEVo?=
 =?utf-8?B?UjZXR2VLdmZIcG5rc0RoTlQvdVdnREF0TkhtQWl2ZjdoUENwbUZnUVVTQUxQ?=
 =?utf-8?B?UXU3T1pubUhBbCtnRWZEWE1KazNUeit3aEc2aWNFYkNlZVY0cWwrMW1ZNW83?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722c0880-c0cc-4a84-ac01-08de31981c2f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 11:44:11.2282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wAf4u4LBxTrIbEx2xGDjamqzmtzIy/EJ3yrNkP99v8Yg3sFrePbwIMpP2F9OBmTYK2EGaWxLzI1axmZiDebHcjKaoU4qydv3cksObmyHdDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9003



On 02.12.25 12:57, Jan Beulich wrote:
> On 19.11.2025 20:31, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The VMTRACE feature is depends on Platform/Arch HW and code support and now
>> can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
>> This makes VMTRACE support optional by introducing HVM Kconfig option:
>> - CONFIG_VMTRACE to enable/disable the feature.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>> changes in v4:
>> - format changes
>>
>> changes in v3:
>> - drop vmtrace stubs for HVM=n case from hvm.h (VMTRACE depnds on HVM)
>> - hvm_vmtrace_reset() fix return err code
>> - add comment about using func declaration without definition
>>
>> changes in v2:
>>   - fix comments from Jan Beulich
>>   - move CONFIG_VMTRACE in HVM
>>   - drop HAS_VMTRACE
>>
>> v3:
>>   https://patchwork.kernel.org/project/xen-devel/patch/20251114142207.279834-1-grygorii_strashko@epam.com/
>> v2:
>>   https://patchwork.kernel.org/project/xen-devel/patch/20251112202442.3879997-1-grygorii_strashko@epam.com/
>> v1:
>>   https://patchwork.kernel.org/project/xen-devel/patch/20251031212005.1338212-1-grygorii_strashko@epam.com/
>>
>>   xen/arch/x86/domctl.c                   |  4 +++
>>   xen/arch/x86/hvm/Kconfig                | 12 +++++++++
>>   xen/arch/x86/hvm/vmx/vmcs.c             |  2 ++
>>   xen/arch/x86/hvm/vmx/vmx.c              | 11 ++++++++
>>   xen/arch/x86/include/asm/guest-msr.h    |  2 ++
>>   xen/arch/x86/include/asm/hvm/hvm.h      | 36 ++++++++++---------------
>>   xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 ++
>>   xen/arch/x86/mm/mem_sharing.c           |  2 ++
>>   xen/arch/x86/vm_event.c                 |  8 +++---
>>   xen/common/domain.c                     | 10 +++++++
>>   xen/common/memory.c                     |  6 +++++
>>   xen/common/vm_event.c                   |  3 ++-
>>   xen/include/xen/domain.h                |  4 +++
>>   xen/include/xen/sched.h                 |  4 +++
>>   14 files changed, 80 insertions(+), 26 deletions(-)
> 
> Tamas - any chance of an ack here?
> 
> Grygorii - chasing missing acks is generally the submitter's responsibility.
>

Sorry, I switched to different task and forgot to ask :(
  
> Jan
> 
> 

-- 
Best regards,
-grygorii


