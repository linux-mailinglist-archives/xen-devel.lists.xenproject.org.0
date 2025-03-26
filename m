Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79DCA71331
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 09:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927312.1330069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMaI-0007sX-Iq; Wed, 26 Mar 2025 08:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927312.1330069; Wed, 26 Mar 2025 08:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMaI-0007pm-Df; Wed, 26 Mar 2025 08:58:02 +0000
Received: by outflank-mailman (input) for mailman id 927312;
 Wed, 26 Mar 2025 08:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+/s=WN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1txMaH-0007pc-3y
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 08:58:01 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20630.outbound.protection.outlook.com
 [2a01:111:f403:2009::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 697d7186-0a20-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 09:57:58 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 08:57:53 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 08:57:53 +0000
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
X-Inumbo-ID: 697d7186-0a20-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jV1EySX+aBE2Ru+VBXLeU1d2FrgEVXw6aW8cGiXq8lSI2Vc0vm7qGM+S2h0XD6EDtYs7Y8nCEXx3n5yqcoPWLGyRBuiM81ydyqGkHKAEmMx6WWOdWvC9QAeWHEa719KEAV9MLMdAzt7rdj6iJzngIGe6/qFg+mQFFssuKAg6EU3OFRX4zwIc+4dqQu1NsVqqo85MKTPxp9ST9W4pi0od2aUWZB6+2X6+DaRkcfxwDqEGfZLwtckIsynbmGAB0zAmIUg1iCQMF7L90/w6+XisAhuobM4gx6ApYHAyAlLqvMogcFmxo6AG2HTsY1jolHqvD3IhvVWkOD1PSVsJXDQaLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktBsZlelN5gjemRMVv0ki2io3eG0mY1p/6TdKDsgq+8=;
 b=AFJ/pihDNEpiamgeEy9PHFhu7aIcb5HMZfmKpKQVq8ONJSvVUytFnN1lW3tTeHslcZMe+eHRQXnMVQsE05milUjl2eefnKyyvN9JpXLZsgbo6CweoohoRRB7S/RA5b1jTKs46Wvt+gpMYz6qlKq4Y/1aI/yzCiN2AGXb6u/E4BwITda2pRtBabP6hRHa2yJRI7ZVYg6Bl+1pk5V/r+/lmZlGiTyGbSPCiFT16Y5gLT2pAkDYwjZf5yQj7Q/XOHISSEPP9sZAM9A1yAlwY/LrYdw2SOpB/7jT9MSXbJQjIVUy1625ZiuI+tYwCBdplPtepXdcnfOq1tui94VjTl9LZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktBsZlelN5gjemRMVv0ki2io3eG0mY1p/6TdKDsgq+8=;
 b=N+yGEpHx/Tib/H7mUhY4GxXuwjAzWL+O7/qZ9RGLPhnehI1I51M9GqeFROBe7xt9YF2zflZQkO5j8zuiSul25jgapajNpHnN6pr3tbrtK8GXBcOfctDY8+1GfxY3J9EBDfCzyxZVDDqwUFR61tO3hrpEYutWXCoR3ZU2/3ioL7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <48c3c175-8249-4e9c-91b2-babc227f68fc@amd.com>
Date: Wed, 26 Mar 2025 09:57:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/arm: Initialize acpi_disabled to true during
 declaration
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250325150842.2015968-1-oleksandr_tyshchenko@epam.com>
 <9b96395c-ca88-483b-be06-b7768b552983@xen.org>
 <4e048dad-bd12-4526-ae62-f424bdb8271b@amd.com>
 <db47de86-b2c1-4860-9212-49c051e1bebd@xen.org>
 <24809d8d-5d95-4527-89e1-e82889d58e3f@epam.com>
 <180d0f62-cab1-4fb5-a09f-c82b117ff554@xen.org>
 <340d58e8-b4f0-43ce-8925-e509282bccf0@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <340d58e8-b4f0-43ce-8925-e509282bccf0@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::11) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc1c996-cb56-4448-6846-08dd6c444b09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUJGQjhOSDhuSXNTZ044UCtYMUVnekY1Mm03cnBXMnJtcnFsaHQ4azVIclA5?=
 =?utf-8?B?Qk1uM1JkS3crQ1B0UUpjOVVzNDNRcnJnR2Z2NHZhekZCVmt6Z29VWWpvekdz?=
 =?utf-8?B?T0JlbmJ1a2pRMC9yM0RwU0hKNDFVUlVXZGc2WkwzTjhMaDdxUXcwK05zOUFj?=
 =?utf-8?B?VzYzOVpyajIyVnNYdXVoejVpSFZmS1U4c1VHNUUrN3hBek8vV3J6S0s2clhk?=
 =?utf-8?B?Tlkrd3l6L28xVmNkRFU5Zy9QUk9kS3hobWliNjNYV1EvZEZIbEZKNFdkNU1k?=
 =?utf-8?B?ZmRaN1pBNWp4dnFEbEZVaG5Ia0ZtOTBuZkFyci9yTFZrMEM3Mm9TbXV6RXVH?=
 =?utf-8?B?d3hIUzRQdzRxSU9VeE1MMmZYbkxqcTZSTzlkRHNncnhleTNGaFA0TURqakpY?=
 =?utf-8?B?dXp4V0E4QXI5LzEyWkFWc3ArYUJRanFkOVgzOEk1SHF3akJ1UVFSWmFmRHpQ?=
 =?utf-8?B?TklMNEZNNWVWd1M5emVZRlA2V3pnWDRnRFZoem9vaEx5eTZmVms5OWVOMVVH?=
 =?utf-8?B?S0g2aFdrTWhxeHhVQTV2cS9MZFRhQkZjVjlIRlY4ZFBpUEJZZnBCY1lJdFor?=
 =?utf-8?B?V2ZhV0tSbXA0NStqTFprQzFsMDhBaXhWVHFJM05hQ3pzUlBDV1IvTHJ3S0hO?=
 =?utf-8?B?VHN4SHhsRHlHMUtTWUR6cGpTR2p1WXMrWTQvUXN0Q1VzSno3Z3VoQW11VHRa?=
 =?utf-8?B?bVoyY25Vd0kwVERwWlF3QVpGMnV6azg0cmZxUjhmaGRYWmdGcUJMdHd0YTlB?=
 =?utf-8?B?OENKOG5HVXlNVEVjM3lGQk5oWlBlU290UElKS3FnT3l5dU8zTWJUM2wvRWN0?=
 =?utf-8?B?UGlXK0x3M291TVRiSW55Z2FmQTlrNUFMdENaRHZoenI4akg3NUxJKzU1VDZW?=
 =?utf-8?B?cmc3V2wxM2dOeEx2b09XUWJVUmlYMGMxWDlpemk4bVRncWNUcEhMZXVaeVVU?=
 =?utf-8?B?MDFjRVo5TVdEYURFQTJCa0xRb0I3UFJKS0NlQy9lbjd6V0NGY29FSHVyTThs?=
 =?utf-8?B?eFZUbzBJelR3S2NRTkJtRHpyTjVkQXc5MVdtUm8rSUNnakNQNGJEOFIvOTVa?=
 =?utf-8?B?a3QwZHBuNmZiOHRtQzlNZHdBWkRLY2M0NDcvdkdhSTRDeUVkOTd1OWJLUnlJ?=
 =?utf-8?B?bno3Qzh3SUtGMHNsYStUaTJsYkw1UStHL1JQdU84cE53R1pnQnBBNVd6WnhI?=
 =?utf-8?B?SHduUnQxcnVxeUxyS3I0THRXaTBhMFFYZ0hWNmdqSm1DY2ExWVA1MlYzcVIy?=
 =?utf-8?B?aEhSOTE1VjdXODJlSzI4RjRGSTdpWWhRUHBYWnZ1WjJFcTd2aFFraWdGTlIy?=
 =?utf-8?B?UXdwc01xMTMyNEhtbHUwM0g0d2tnTWVxVVZXWGhZbUJ2eCtOSDVHSjN1N2pP?=
 =?utf-8?B?QlF5Q3JRa3dNMEV1b2V3dUowbmIwdWp2Vi9kWmRib1pFandEc3QvaW1IUGhz?=
 =?utf-8?B?U3dnSzVmMXRWVHhpYWEvSXl3RngxQ3ZJMnV5OFpGcnpPMndld3Y4WDdEMVV6?=
 =?utf-8?B?c2lhNlFabW04RmEyMHBRVmh6Qmhkc2tSZW5qN3R3MjBjeFNXWDNWd3BpUU82?=
 =?utf-8?B?dGYyNXVISUhJNzZUR29NaUowVTRxbmtremRzYnBwTFdkdGhSQmVtYzNuTW9C?=
 =?utf-8?B?eXdrUE5IeDRMREtzbElHNk5wS0pZMXRMZmFwcFVmOGFCTFlxT2lnd1dFVXNa?=
 =?utf-8?B?ZlZtMHNGR24vcDhFM1FSY24vbDlmak1vTklVRmhzT0ZnMkswOGZha1Y5bnFW?=
 =?utf-8?B?dUtSWjVDVWYxa1l6QUQ0MHdXRTdjVlczY0FmQ1FxbE13NWFhblNvQ1QyMFBq?=
 =?utf-8?B?a2NzZWIwNzl0bkFxQjUxY1NrdnlCUTZHSnRPWURVMG5hOThLbGYzR0JTQnA5?=
 =?utf-8?Q?+f+WRIQSEXaac?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGJNd1ZuNGEyL2pKM2VwQlpXcW5HUzJ6SHFsVWlkWGRBMisyUnZScU90cmFX?=
 =?utf-8?B?NG5PdjZhcUFIemwwNW43RWRUZ2h1MEcrRWZzVkxOY0N5ODdsWmlCT1FWNnZY?=
 =?utf-8?B?dUZwd1VtbGtJNlV2SFJBQ2tCZ2RpM0FWTmJxSGlpcFNMRTg1bGxQYnl2V2NH?=
 =?utf-8?B?SW15N0FYTXMxVVZqaXRheTU2S1BLNjhrRFU0aVRJQjZPem5QUGRGMG1RRGQ2?=
 =?utf-8?B?b21nc3B5dGIxT2FSd3VLcUgreXl2UHYzUnhKZVBKVVJzSEg5WUJ5N1Q1YjNR?=
 =?utf-8?B?cUJDNUJRNVZUZVZVaWNBN1JGS2twUVIzaUlyOVE2T0xZellIM0x2dnp6LzBS?=
 =?utf-8?B?YmRabTVQcC9tV21rV2VKVWJWVzBBT0l0SGlvVDFHNTZnWFQwWldvcG56dE4v?=
 =?utf-8?B?VU1rTHVablIxS0hMVDR1dldZV2hSdVlybUQ4Uitzc2kySnRrU09jb3ZVRk90?=
 =?utf-8?B?UGJNNDUzTFRnYU9GOUhtdXU1VldJcDRUMHB6TjZYSEdabVBFSHlIYVNtTXNZ?=
 =?utf-8?B?YzhsNXBjUldsR1I2SGxSc2RzN1dJZlJxeHpkbmpHVnNjcEtkam1jZjFuQnls?=
 =?utf-8?B?Y3RhWUdQRXVweHVBL1dBdERTbWhnaE9DaXpUNk5VRUdJTlNxREpZajFCY2Qz?=
 =?utf-8?B?ZEgyY0x4L2tPS2JOVFFyZDVLRkV1R1RhcG5vRVRzRWdVeWZ6UFpnbVJvUVpU?=
 =?utf-8?B?NzMrWkhGZjdkcDJvdUJySmZ5bzJqRXBmVVo0UXBXSjZtWUlnN1hpQ3FFbS80?=
 =?utf-8?B?ZE4wc2RtSWQvanZDOERubzVmU1IrMGt1RG5sdUNTTEFoaUM5eS9mdmJiUHlh?=
 =?utf-8?B?U2pzVGg5SGdyVzRRbnZySXJUM3ZoTDhVU0ZaL1plS1JxRzhWMGI1RWZIbVlP?=
 =?utf-8?B?MmFBanR2aW5WbWZkcmo2QjlEeFR0MTBOYnNSNGlzbERud0kvcjRQcHlnMm5I?=
 =?utf-8?B?WExjUElYb3VXS1VBNjJjRzRGcHBhU1JHSXoxa3JrZ2Q1Wis5QzdtaFhoRnAy?=
 =?utf-8?B?UGtrTFBQcFFySWNFNlZWdmtxVVRjYXBNak5nZWdoWEgrM0licHk2eG9qdXVx?=
 =?utf-8?B?eGVwTXhtK2M4K01QUXB3TG9BMHVYSktkcTI1SUdUSUNMeHk2enN4eFhuYjZR?=
 =?utf-8?B?cXBPNThHNzJST1ZSVnVlVCtuQ3dkbE5vaWpnMHdOM1I0cmE1MC9VSVlZVVVs?=
 =?utf-8?B?ZzFqYXVpZU91Vm5xSzFVM1ZVYjBXRmJHQlB1Mk92cnFiQ2dNdlJxenJSWVpu?=
 =?utf-8?B?VGYrQnFzVEQyLzZoRWJ6a3E5eXN0QWh1SndqRkQ4dG9vWHNNMTU1ODBDU0E1?=
 =?utf-8?B?ZjFFdU9ka2FXdFM3d1J5dzBQcDYyeTUwY0h6WWxQNUJNMkw4dHYyd2xyTnBD?=
 =?utf-8?B?VDE2ZTNmejV5aVJwa0VMaDM0SWZDU1JITDlQdGFheEE3LzJxSlFxR0ZhdUQ5?=
 =?utf-8?B?TmdzSmVTSzl1MUU1WGtiSkt4RmNPaE11USt3djFaR2R6MGJ5NGtxdUFwaitI?=
 =?utf-8?B?WHJDQnpTL2JGT2p0WFJJREh6OU5lTGdrbnh3OXNJRVRVSk1RbEdSUURjSm1q?=
 =?utf-8?B?V2taT3pWb2JGK1d6bGhKcGh3amlLdjRUK2pFVmxvRWhYMzRtN1JBeDhZbDhI?=
 =?utf-8?B?c0o1bFJvZVhZbis0VFBDQWVMdjFqR1c4U2dCRHZHamVLVkdlakhzclhhVkpm?=
 =?utf-8?B?cTZ5NGlLNGhpTC9YK1laZ3hiV05tYy9pOStaNFh2V0VyakhLeUM2Vnk1eDZq?=
 =?utf-8?B?eTJZb0NHUGF6djZxTkVWdndqU3ZVV0dJVlhabHl2SmtSKytMeFpXR3JvajNp?=
 =?utf-8?B?bnNtblY4SFh3YjQ5TVpSMlR1QUlmNnIxNDFhMS9MVDBiN0tMZS8vcFZaM0gx?=
 =?utf-8?B?VUxhZllBU0RoTlBEUGR4V2E4QXJsd0lhUU1mQ3RJekQrK0d2TDdvcDYwL0s5?=
 =?utf-8?B?QVN1ZEJpRVYrNnZid2dLTjF1b1BjQXh3OU9hUFM1N3NKaDVDMDJPWXBlTmpL?=
 =?utf-8?B?UTJnYXdrNm0zWVVCbklnUlJvQnA4UDhkOUpQVmQrU2tMOGxuaHVFTStqeDV1?=
 =?utf-8?B?UnF1enZOSm00OG44N2tHMktaYTMzNVFobDhXUk42b3E4cU1McE9aR1Z4TWVl?=
 =?utf-8?Q?4XC0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc1c996-cb56-4448-6846-08dd6c444b09
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 08:57:53.1616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nj7k9v12hdYExoL+1fZ/l46avGILWQm2fQA39ZC3Izvu8y7/6pDDCbJyWN9Ejw9b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518



On 25/03/2025 17:54, Oleksandr Tyshchenko wrote:
> 
> 
> On 25.03.25 18:09, Julien Grall wrote:
> 
> 
>> Hi Oleksandr,
> 
> Hello Julien
> 
>>
>> On 25/03/2025 16:05, Oleksandr Tyshchenko wrote:
>>>>>> Furthermore, what happen if we decide to use ACPI afterwards? Wouldn't
>>>>>> this mean that the static regions would be reserved even if ACPI
>>>>>> doesn't
>>>>>> use static memory (all the memory is expected to be given to the
>>>>>> allocator)?
>>>>> I don't think such hybrid configuration is valid (booting with ACPI yet
>>>>> declaring reserved regions in DT). See commit:
>>>>> 9c2bc0f24b2ba7082df408b3c33ec9a86bf20cf0
>>>>
>>>> I don't think the commit is preventing hybrid configuration. It is just
>>>> saying that the region (which could be a static region because this is
>>>> not supported) will be unreserved.
>>>>
>>>> IOW, when booting with Device-Tree you may be able to use static memory.
>>>> But if you were booting with ACPI, static memory is not supported and
>>>> therefore the regions should be free for other purpose.
>>>
>>>
>>> Julien, I see your points, but the current patch does not attempt to
>>> make static (reserved) memory properly work on ACPI-based system (if it
>>> is available there), current patch tries to solve the real issue on
>>> device-tree-based system with Xen compiled with CONFIG_ACPI=y (at least
>>> unintentionally).
>>
>> I am not asking to make ACPI work with static memory. I am asking to not
>> break ACPI if the Device-Tree is specifying static memory region.
>>
>>> However, I wonder, why it has not been noticed so far.
>>
>> ACPI is not a supported feature and gated by UNSUPPORTED. So the
>> implication is you have enabled UNSUPPORTED and anything can happen
>> really ;).
> 
> Indeed, this answers the question.
> 
> 
>>
>>>
>>> It took some time to understand why just enabling CONFIG_STATIC_MEMORY=y
>>> triggered a BUG in common code. And it turned out that it was
>>> CONFIG_ACPI=y in my Xen's .config that caused that consequence (I
>>> specially wrote so long description to provide full context).
>>
>> As I wrote above, the only thing I am asking is that memory for static
>> regions should be unreserved when ACPI is enabled like it is already the
>> case today.
> 
> So the concern is that not reserving provided by the device tree static
> memory region is going to be a potential waste of the memory on the real
> ACPI system? Or I missed something?
> 
> I see two options with unreserving the static memory regions on the real
> ACPI system. I assume, that we should unreserve only after we definitely
> know that we are running with ACPI (i.e. after acpi_boot_table_init()
> completes and acpi_disabled reflects the real state of things), right?
> 
> 1. either call acpi_boot_table_init() before setup_mm() in Arm64's
> start_xen().
This cannot be done. acpi_boot_table_init() calls ACPI functions that make use
of VMAP and alloc_boot_pages, so the boot allocator is expected to be populated
at this point.

> 2. or go through reserved_mem->nr_banks and unreserve everything marked
> with MEMBANK_STATIC_DOMAIN after acpi_boot_table_init() completes
What if we split acpi_boot_table_init() into 2 parts, where first is used to
determine the real "acpi_disabled" value, called before setup_mm and second used
to parse the tables? There's one issue with this approach. Today, even after we
evaluate that we should run with ACPI enabled [*], error in ACPI table parsing
is ignored and ACPI is set to disabled. That's not really in the spirit of our
current methodology, where we should panic if user requested something that does
not work. Example: today, even after specifying "acpi=force", error in table
parsing bails out to DT approach which is not what user wanted.

~Michal


