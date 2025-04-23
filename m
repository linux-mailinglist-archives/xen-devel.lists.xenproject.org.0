Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF81A997AE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 20:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965131.1355761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eeb-00076L-A8; Wed, 23 Apr 2025 18:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965131.1355761; Wed, 23 Apr 2025 18:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7eeb-00074X-72; Wed, 23 Apr 2025 18:17:01 +0000
Received: by outflank-mailman (input) for mailman id 965131;
 Wed, 23 Apr 2025 18:16:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V8j8=XJ=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1u7eeZ-00074R-Bt
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 18:16:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2412::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 227108a1-206f-11f0-9ffb-bf95429c2676;
 Wed, 23 Apr 2025 20:16:55 +0200 (CEST)
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com (2603:10b6:a03:539::18)
 by CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Wed, 23 Apr
 2025 18:16:51 +0000
Received: from SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a]) by SJ2PR12MB8876.namprd12.prod.outlook.com
 ([fe80::69d9:a014:7a29:de4a%4]) with mapi id 15.20.8655.031; Wed, 23 Apr 2025
 18:16:51 +0000
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
X-Inumbo-ID: 227108a1-206f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VywY1o3Nro3z419pzWp9jgWD4tj9tbeF+uGdzZz4gbKscgJwje9VDl4v4Unt3HkkA8qmYn0PoCgEcPlXp8ek4pDzSY/4AvLGuK0+9JSdagLw9pTJEvtXp3Oii/FV6lU5XheqWIN2nD+s+1SftlGEa42F1p7NN1e5j3JlRvGw0at8NZ2I6/iupJ7V//AQMWemJzG1YMbJeXXtQa3X2oUccmgzIdvz81o/TbWeYMRqT/xBU+cqmTR79qEadr53Wm89efFIvwrT+EiL70VbcYMKaywrWNM3sMo6A9d8et8BF4m9JS8D09qF4GfWGweIuXdbqmMUjCR+a+fGGABsMlFnhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n64qvoZYpJN9OEC17V23CLstYUTlZjpcxuIhKDXYZ+Y=;
 b=uw/UnEZ3vllKg14tiZb63VEDAwLNmln8T+9aD6dQzcHMDQb8njDIeK9PqK6bmCwCD0HI7mhGII1Q/B8OgU2APK9J4t5RdI2VWzMZrWxO5chTqlT8nJnATquD2FaynQ1Rp7kIXClLIIwTL3/ErnzxWjE3KX7u+Amq6HWhQXIChU0zItMcNr4pugdQKW8aHUYYbum3KNfo4vsya0Wp7szyWvFsC/ETpHTlXtBWE4YLZ9hrxGbicueq85x6yw+PvMLJm1aGqQBzO3tswF9pHqFyXKg355AS3GE4WvDWVkreQj86dhDPVeJ3mjN6//J58d6SRQSoXWJ7LUCGCJjKrFTsDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n64qvoZYpJN9OEC17V23CLstYUTlZjpcxuIhKDXYZ+Y=;
 b=aNHNJtd6TwH/i1zGTXAXUg40wT7n934yiEnMmb7Q5Dm8JxM8EgIIfaD5NBM6mJ2hVyi6VOjOhjxcShmKNKriFYb+guq2J6agpdbufQ55HFpoPW8RiIb8Qbxp9qnkUZernUunvqfhHzyHwVulF6YTFyy8sHDnAWEvHhSNEb/30Gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d81178fe-82b8-434e-8610-e0ec71df6a28@amd.com>
Date: Wed, 23 Apr 2025 11:16:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation of Rule 5.5
To: xen-devel@lists.xenproject.org
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <48c7830931a98b2bf70ef1509f309b262b9e5792.1745427770.git.victorm.lira@amd.com>
Content-Language: en-US
From: "Lira, Victor M" <VictorM.Lira@amd.com>
In-Reply-To: <48c7830931a98b2bf70ef1509f309b262b9e5792.1745427770.git.victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:510:174::19) To SJ2PR12MB8876.namprd12.prod.outlook.com
 (2603:10b6:a03:539::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8876:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dc7b2c9-5de3-40e9-e701-08dd8293050b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmlyNjFXTE9PWVJJbHBSTjNRRWFTVGwzSDZyRFNYV0wxdExxc2VZQnVrVHJP?=
 =?utf-8?B?RzYxNStFcTZPZHZFR0s1S0p4ekhrZnI1QVMxa1VKa0VOdDNlUFUxZEJJM2lN?=
 =?utf-8?B?dThENHZrUU9rem96ODJtNkwxSGp5WlN3Z0VNancwa2lIQUt6Uy9CcEMrTHFa?=
 =?utf-8?B?eHg0TEpVM3RNaGg0d0RKY1piSXFYS25PUU5jYk1MRkI1UkZzQUtJZFBIRE1q?=
 =?utf-8?B?WjJhT3hESThKUWZhcUQvMXRZR29uYTUyRDdvb29kMDk0dldmOWRFVlovQU02?=
 =?utf-8?B?cU1CMDRsaUtwRlpNb3hleUNiUG5pS292ZE51V2xuTzVUOWdLZVBBcVR1R3Yx?=
 =?utf-8?B?SlBxNng2ek9Ea1VJcjhlNDRXeXBxd2xNdGh2d05FR2Z5U1RsTFBDbStFVHV6?=
 =?utf-8?B?aHNYOFFNbUdmOVZ0SEVWSUNPUUtzaXgwV0FDZTVYZmNnaHRCMi9QZC9FVld6?=
 =?utf-8?B?bm8wTHJxcHBIUms2dzhLWDFTSDlyd3NjWllwMmorSDJPRk1PLzVGQlAzUDd1?=
 =?utf-8?B?eTZmalRjeUZrMm5hSGFEZFB5UEVFbDlad3FnZENTTkJ4RWRLWnQwTE5GRXdE?=
 =?utf-8?B?V25ZN2gwY203dXZJdHpKK1FUSWRNUWRkdHFPOG5qcnNnR2pPN2t1emVkeG1D?=
 =?utf-8?B?VlcxTmVLN1RJWG1DQUFpNGUwa0FvcGFRcVFyZWgxTHY4T2hIOFhBbmJKUTNW?=
 =?utf-8?B?NmczZlhrOGd2cjQ5Qm1xeVdXMVd6bkFWSnBYZXR5RDZiemp5dDd4WVduK1ZQ?=
 =?utf-8?B?bkUrcGdja2JVcEpHMmhZRUtKeWYxc0VZOWpTem83c2ViTC96YXNmWEZpWXhy?=
 =?utf-8?B?WGRPMkU3Mks5Z1UvUnlTZHdVajlJRnZGaUMyLzRLTmxmREJwUGo0a0syT3cr?=
 =?utf-8?B?RnpSM2V4d1oxdEdEb05SVjlHSHMvS0t5bTRIV1lnR2cyeG9pTUtYY3NaVnB4?=
 =?utf-8?B?aVkyeHFsaHpKY3hIZms2SFhrVGxwMTQ3TnFHclVJTHZzUDF3cjNWYWdBdUZ2?=
 =?utf-8?B?Y2RqY1NPWjFJWVNUVGFNeWc5czlEWWMxMUJwL3hnOUxHVXZ1a2cycnBpd3ZT?=
 =?utf-8?B?Nm9KMWJQZURQUTlTdURvdmdtcDBLT0RUZTU2WE9EUW40ZUVJTyttN2ZWaldR?=
 =?utf-8?B?aVl2SklxMDBXR0FWYXAwYUd1L2VLMXhGY0VMVWVuL3U4MGNKZ3FUdkcxVW1l?=
 =?utf-8?B?WDRhbmFMdlpzZi9lbHJxbEFTSUUvUEF2dENhcXkzWWt5UVNrQk5WU3Z4TXE0?=
 =?utf-8?B?aG5EUi9DZmZsNGlIN29yUnNrSmhOTHJYK3ZiVzZQZTl3OGpNbElRekpuV1VD?=
 =?utf-8?B?Y0J1dkJTUlhrYWx1Mkt0bmlUVnNZZHhaSXI5eDZRZHd5N0pGb2FVK2tBTGRQ?=
 =?utf-8?B?eWFxdmIvb0praFR4TzY4U0xFcWZ3RUdxNUdjNllNT2Fub3ZtQmpPMHVXN2dl?=
 =?utf-8?B?S0lQLzFiem10L0l1aGJVQXJWNjFZOFkrUFJpZmJyVGZPMFJ0TkhDNkoyVHRx?=
 =?utf-8?B?VHVXbGRsN3ZFL05FWkV1ODkzRTlzWVFZSU1RM0ZDN3Z1ampzS0RCd3haNFRk?=
 =?utf-8?B?WDhVRzBKVzNMUVorY1hzeXh4bWJlbitoL1lGRkUrUGRnMTVyaG5nSlM3eUlK?=
 =?utf-8?B?ZlhHeGVEYXJkMWVydzduWDZRZkkwWHRGcHhkQ1NsK004VE1tOVJnRktrWGFM?=
 =?utf-8?B?K0N1TE00SjRjSVRDQ0E1WUxCS25Ubk5Wa1k1WlRGa3I1Y0pRcWpZTEVVS3g4?=
 =?utf-8?B?UkMyQnVoSS80c2p4YlY4ZzVHSVc1YUFnT2V5cGJrSjFZV201RzRON1Y0YW9U?=
 =?utf-8?B?V0NmU0IzSFpYUkl2aFJtY3RIVG1ZUlF3S1dJbFVseEkwakZyTzU2a1lqK1N6?=
 =?utf-8?B?SHBDSGZRUk9GQnpwenBENDZjRXE4WlVzTFhWMnJ4Y3RsNVNBK3VhOUsvRHNU?=
 =?utf-8?Q?WnE9vI3XqUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8876.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3BuSjJVOVoxdlRNT0p1TkxvQlRYL04vRG5GM0NYODlxdDNTd3pUOFJqRDJI?=
 =?utf-8?B?a0hTUGdrVlhISEY3WVh1N3pCTUExRDMzYWtvN0l3Wk0wYXpOYTJqeERZMnRN?=
 =?utf-8?B?TkF1N0swZjhUMFJrNnJzNXE4cUFlTld1NTlISVE0UDdUcGRQcEdGZlFsWUZM?=
 =?utf-8?B?cGtqSTJ6ekR4MFRydzBGVW1pUHczMW9UMGFtdHVralU3Q0N3QkhDTHNjMjRY?=
 =?utf-8?B?YmFKeFp0S0pUTDRkdE5GVmVaRk9NemxZYVM3UFk4bzRqZ2J6aUphVkd2UWZI?=
 =?utf-8?B?cit1QXlCRThWU25RdUVrNXlQTmQ3SFFST3FNUzJXeHlvUEpmdzFvZm9JZEdM?=
 =?utf-8?B?eng1Y1JVWkNwSC9EWTFBMDg0bVMzUGphRU56VmNqNitrZkpmSFZyZ2d3bDBU?=
 =?utf-8?B?VERaSktoM296Q1VVa3N0Q0tLOXJjSGVWclk3YXlSUitObzhsZmlJLzZwaCsv?=
 =?utf-8?B?UDQ0V1lFQ2l2RHM3TmlSeVZaN3pRNlpPdHlMdWJEOGROOWVtSnRPR0k2aU5o?=
 =?utf-8?B?Z2RQY0pwd2o1a1FIb0FDb0VzZHk5ZHBKNkVpSzRJaVMxVlZlaWs5Y1M1NTNo?=
 =?utf-8?B?cU1iYkFYTUxZU3ZvenpZcHFzb0dsTUlQVG9JVHVTbjFGOW5xZi9UaitJS2h5?=
 =?utf-8?B?amt4YWxrREpnekpwS3ZONmQzODd2bE5SSDA5VWcyNnc0Z3hlK2VGOVBsRE4v?=
 =?utf-8?B?VDZTbU9kd1dJY2wyWDIwSXBuRklidmx0VGtKcmt2Y1p1eEtBVndSU3dscXp4?=
 =?utf-8?B?M2IrNGFTNTZSQVRNcVB5anlZWDFnVnF1VVJnZnkwRGxuWG9rRm54ampMMy9o?=
 =?utf-8?B?cUhudnJUNW1jN3dYcitLNW80alhtQm9rRUFjb2N0cWdyWDlIUHVGUDNJdExs?=
 =?utf-8?B?blR0SU1pR0tZRmRnMFY0SlJSWjQ0MW0vMWNoK2x3RVFvYUQvaGd6N0IrQTNw?=
 =?utf-8?B?K0tnTEx2dUszdHJCeWtDSGlsZTB5STJtYWlFS1hwdjB1c1ZIRXBQUjZFR0U1?=
 =?utf-8?B?WWsxRDQ4eDk4T3lSYU5sSVVpM3JRSlNLNCt2a2hpQk9PektnK2FFOW5sUDJK?=
 =?utf-8?B?MDYrQUZaVzBKd3VIeDZOZDBTbkM3V0dxcGJlam0zcGs1cFpSZFo1eE9HTkVx?=
 =?utf-8?B?L1hGUGE5ZThIV2lhS210TFB0T3ZoR2NmVi9Ic3ZWN2FUdUpKSFJvaG5BeVU2?=
 =?utf-8?B?bVVuODc2OGl1aVZ6cVM1bUxXSW5USGJvS0hRRzU1TzZJYnBBQ3MrU0VRTW1w?=
 =?utf-8?B?NTZGbTlPa3gvbHZFbk5ZbElhZlJNWkNONkJrZ2wwMHU3RXd5MmtvRWhaVmlX?=
 =?utf-8?B?NVIwZ3F2SDQ1OGhMMEpWU2xyWjBZSGhMNzd2UnMzUldSb21NSUhRanV1QmVN?=
 =?utf-8?B?VXdUWTNjbCt3cG40dFVXSlZta2taSkpyeEhiUitPKzZqSUVlT05xRXZQWHAx?=
 =?utf-8?B?T0NHWU45QnNjOGxkM1NwR2dUdVZ4dEZ3NkdsVnZndkVaQVgwMXJvMmpkVzVw?=
 =?utf-8?B?dHRidDA2UHZTMTdHVkRRMSsxWUQ5SG5PSlVqbXZMNDN4Z05xbHhBZWE0eHo5?=
 =?utf-8?B?aW5QRXBISGFIRm03NGk4ODlmMm9NL21jTS9oenl1U0M3T0xUVWpRRmZFWnVw?=
 =?utf-8?B?bU1qRzJtcExSWUxKRTZ6MndMWWRaQkFxeHdrbHp6VVRqcVRUUFdKNmduMitu?=
 =?utf-8?B?Wm9TV2ZiSVV2NWpDNFkxRXBjUUwreHdSdWU1SlNMcktYenVLUXhaMHFLVnRh?=
 =?utf-8?B?aFd4d0lSWUNScURpRG0zV1NVL2ZFNitOb0dHUGRkdGZnUUlybDMySXB4dDlr?=
 =?utf-8?B?Ky9qcGZDNVV4UDNXOFovZVpHK01QTDROT3lmQkU2Uk5GZ0hjL2Y3TDBKaFl6?=
 =?utf-8?B?b1ArTWpBelJ1SS9vSzBKTU1kUmlveVpNTGJWeW1CR3RMU1JXZ2NlbGM2aUZF?=
 =?utf-8?B?L0pkZ2JjdDhiUEFGYmVXczlCUkVCbndYL24vcjdXNzNlMjQ4Qjg5TzMyWWZs?=
 =?utf-8?B?cFFTdkF3UUx4QXYwTDJCVmoyemMrYWtqdzVlbVQzK1U4TG9TaG1BUUVUbUZY?=
 =?utf-8?B?RTlkdXV5cTFMdzM1Z0FhZFpHOXVrWm9qUlBoU1lHYlBnWFZ3cUFJVDRyZGdw?=
 =?utf-8?Q?ySmYa69MHriWOa771SQ2D3vf4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dc7b2c9-5de3-40e9-e701-08dd8293050b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8876.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 18:16:51.4473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igwt9q1SbusFZr/TxfLN1LiE7G+2T2Lkd9FP/VEYrbQBf73BEuihOwrfqRH2zaaxVC3J2Ne86N0RnPIGiuY60A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268

Continuing a discussion from before:

On 4/22/2025 11:44 PM, Jan Beulich wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On 23.04.2025 01:43, victorm.lira@amd.com wrote:
>>          memmove.
>>        - Tagged as `deliberate` for ECLAIR.
>>
>> +   * - R5.5
>> +     - Clashes between function-like macros and function names are
>> +       deliberate
> They may or may not be deliberate, depending on context. I don't think it's a
> good move to deviate this more widely than necessary. If I get the expression
> above (in deviations.ecl) right, even
>
> void func1(int);
> void func2(int);
>
> #define func1() func2(0)
> #define func2() func1(0)
>
> would be deviated, which I don't think we want. Especially when, in a less
> contrived scenario, the clash may not easily be visible.
OK, I see the issue for different functions. Does it make sense to say 
it's deliberate when it's the same identifier?

	void func1(int);
	...
	#define func1() func1(0)

Could this be deviated?


Victor


