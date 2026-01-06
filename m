Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4DCCFA56C
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 19:53:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196412.1514233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdCBM-0005ND-1s; Tue, 06 Jan 2026 18:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196412.1514233; Tue, 06 Jan 2026 18:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdCBL-0005KS-V9; Tue, 06 Jan 2026 18:53:27 +0000
Received: by outflank-mailman (input) for mailman id 1196412;
 Tue, 06 Jan 2026 18:53:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heAF=7L=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vdCBK-0005KM-M5
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 18:53:26 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f99f84fd-eb30-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 19:53:24 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CO1PR03MB5844.namprd03.prod.outlook.com (2603:10b6:303:9c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 18:53:20 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 18:53:20 +0000
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
X-Inumbo-ID: f99f84fd-eb30-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7NB1+brIec66z4pEkpsDLpl7N7eQC9LbYIjDg1GY93bOVbMdcKDgNeHL1zSFZMsG8YJYOj6lZg1OQS5dBHH6FMl6b7mWvDG7fsXY04e++2vm6CWUROzHPjHudSOjGa57qVeBzbvC8yGDq4WYSe5Y/YbcDpFfEgeW8RXWVvkUDl1hRe6zmX9GqLoQw/+4+PM3aAfHish8sWm+gqPJW8K/pTZy6KzTINtVvB3gJVRTKRgTzovGD8cWs6OQ73rONYIIWlfDEl8+1LXA4Mtdi8Zsivn4ARuzCIM5HwE+nRpHkSeKWO98P15Av4g0p5VlRI3lYbv/o9/mi1XxqfpKaes6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEkWKgZsRK9tGzOoVFDJWIcu9E7/TeEa6oN39ecUl9U=;
 b=IsdXpMg4eL3MzYPGm/vE/qouUte1YSR/oHMRxpHYEHHsD8r8qH9cMbRFC8thT0zGzdo46V5PhVXB1DpZqMKfT/TTOSNEdOZlmXLl0yqBrDyfd4R5I7lZ29fVId9ljtb5fZjTpEcXtp5TCHsgNIRCxlPyUMIJRQLscqkWrrKDuKJ1fcR/OzhJQrSOZ5FeyuewQbUke+A8iZ0EnlBVew2kQRk0pTSxVtswRuV9Mtbk0byjO3oWTcONHMmwfuU12Z5JFIa9b4mAk/yw4eQVqIkIw//zA/o18cz8/83bXKIc3suemHL5S8/S+dBcrlt1/IMPXKum/GGVzhyBVLrWKQzOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lEkWKgZsRK9tGzOoVFDJWIcu9E7/TeEa6oN39ecUl9U=;
 b=b2FTxdzUziOTjtvNHDApPHxEuc0PJ6up2K5owOI/acfCOBFJnVk4LfOwMWxAYHZcgSkDbBjkgwmU21ZqQNeylz3Prd/MHv6CgoYu2FL0LnhLqzCM64gqbHMA6HIPszk3vSMrQ6MJkaJeyTlApKSxDMDk3XyWmRaSzPB7zJbu0Ak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <44781ed1-33ea-4438-9125-86557388ff24@citrix.com>
Date: Tue, 6 Jan 2026 18:53:16 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH] misra: allow using binary literals in c99 as an
 extension.
To: Nicola Vetrini <nicola.vetrini@gmail.com>, xen-devel@lists.xenproject.org
References: <30bb474fbb0e9236728fad9515bca4d160d594b3.1767721635.git.nicola.vetrini@bugseng.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <30bb474fbb0e9236728fad9515bca4d160d594b3.1767721635.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0110.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::14) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CO1PR03MB5844:EE_
X-MS-Office365-Filtering-Correlation-Id: 7109b04b-b1a5-4d50-d5cc-08de4d54dc3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFdHR2RlSEJVd2pTVy9acUpwdHM2b01KdGpTYUQrR2x2TjBSY3F0VmN2MHo0?=
 =?utf-8?B?Z1VqbnhCcjFGM1p4UTBtZlIzTE8raTdZRTcrakVRYmQ4WTJ0V0N2ZWFNbEhi?=
 =?utf-8?B?NzlDNGFHMVp6aEswQWMyYkhIVHFUQ3RKdjVwbHp2OVpoVmNwZWpTY0Fwdlpm?=
 =?utf-8?B?VG8xSVFjLzd0NE1ZWHc0aWZDaFpKMzRaL210cGFRQWx1QkIrS2N2ZHhkSEgz?=
 =?utf-8?B?c1lJcFI5NEpyMUNQUlJIeFFIRXdPQk5BMFlnSnFkYVc5cDhkTGVNMjdna0ZV?=
 =?utf-8?B?U1NBR1dzUkJxZUtEN1VJUzBBRTBFeEhLcnpSVFlzQ1NtelNrREIrUGpXajdO?=
 =?utf-8?B?R3ZyRVJDaHg0Y1RMOERzS2I2WWNPUmtXbkk4TVYxdURoaU1abzVZNEJqN2ZM?=
 =?utf-8?B?dDM2cUJqaGxvaDd6b1luMVBIOTdidjQ5YnFKR2h3S05acjVmL0trdWhlMG5j?=
 =?utf-8?B?T0gydzdDcHFYUC9CcFVzZGJPL2pBRGdUZ1RPQm5nTVZzMXZhRkMrTmgxK3J1?=
 =?utf-8?B?VEtNNkhmRTRTRG1WaytvOXZXVTRrVzVLaTVZYlIwK3dUUGNKdGFYQTEremZT?=
 =?utf-8?B?Zmc2bTZKS2l1ZlRibXdiQ2F2elYwN0Ftc2RheVV2dmIrRGlCc2RnSXFHbkNE?=
 =?utf-8?B?bCtoQ1piSHByUEdsazZDNUFZSFBiMVRvdHVxa2RueDVxaEEzb1NiL1d5TjdO?=
 =?utf-8?B?Y0xwUGViNENuUkxycHNiMmlaZWxxSnRmNG84aTMxV1BnR2Q2Sm1HOG5ja3Qw?=
 =?utf-8?B?cE5UUER0L2VoSlRXdjNmNHMzNEVkWjlkMStwcjZnSjBDcE5URndLYm1JT1hE?=
 =?utf-8?B?YTN1c2UrenJBSkhjSC9aOWFGbURhZmpVT3l5TW9mT2RyM2d0T1V3K3NYTHFp?=
 =?utf-8?B?dnBTN2h0TWlvV3N3Q2pFOThPd1lVMTEwOXFrSzhCVzVnM25qTnUyeFFoODZD?=
 =?utf-8?B?V0tqWk9pREJVZVU2eVRjLzUyZE1EOHdPMUxQN3hWUmNaWXZnb1A5M0FtVDdN?=
 =?utf-8?B?VHRkUWNxcFhNVVRaOUF1MlFPQnJHTFBtTHRhYmRsL2VMS1htaVY4VlR5YW9k?=
 =?utf-8?B?VEJnTDdialA3T0VQQ3dpU0RXTE5DRnVPUzlObmIvR3ZNTU9OTFozWmhiQ09D?=
 =?utf-8?B?Y2ppZ0dZTnRxL1M4U2NnakhoWFRzUENhdXRmbGovZVpSb2hNeHROdi9UbXJa?=
 =?utf-8?B?QVBjc2NYWDNYNVFCRmdJV0h1ZXpYeXVNc2YzNTNlUzFINC80ZVBYQlJWT3hY?=
 =?utf-8?B?WUoxdk5hK1hMVUJmUHlybkVYcWZoNGxySzF1Tm1UUllmOGYvbzYvOXh3WndO?=
 =?utf-8?B?a3NEL2FXQTRRRzYyL0VXWTl4NTRIemtxb2Q4VWRnZldEUHhYeFVNWngyUnI4?=
 =?utf-8?B?bCtTS01IZHg1M1kvWkFKTUNPNHdQR0VCQXpwcThBY09LWFdVNzNBNTBaajVS?=
 =?utf-8?B?UkZURlgzbHF2WEg1VWxyaEhwTDVJdUZNNDJvWWVYWHcwaFlzbyt3bWxuV0h4?=
 =?utf-8?B?enVSV1l2Nm9kY1oxKzJwekVrUGs0YW9GaEZPT1N3SzBxeEVJVjdmTFNjNVZq?=
 =?utf-8?B?NGVWT2RKUElFYzNWamEvZnRDcGlrcDREVFFSbGVPL3VpWlBJYlpIZDRTdjcz?=
 =?utf-8?B?aWNKQmg3RFlRdGhOeHVybkYxSVI4WVVrbnRzSENHS2dpZ1JubCtTL1hzWU5Q?=
 =?utf-8?B?VHJ3WkxjSy9rREdyQlYxM1FWK3MxNC94eEVKV25pdHFXYjFvRUFjbEkzYUpW?=
 =?utf-8?B?SS94aUc5TmtlVzFXeEdtRVprWjJ6aEZLUUlTSG93ZXY4elBINTdEVGpobGVU?=
 =?utf-8?B?UXByZ2lYZ0tOWmdjN0xWY0gzS09WTG1XeXNHNlhxZHFRTFN4UndQNFpmeFdU?=
 =?utf-8?B?S2NWc09Vc2VnVHh4NjcrZHhlQlhLV1p6aXNxRFVFYjE1cmhJam1pcVNTdDhY?=
 =?utf-8?Q?wrZjmR8/8FdUhsrLSqH1hsVBHCpcHf0X?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGd6NWdOMi8wV2Q4djBIS2l0bWtYZ1JJcTlua0NXVEYyTUpFL055aEthQzUz?=
 =?utf-8?B?eE9WMHJIalltdjFGQ0dob2lqV1Q3ZEhIK05BdWtFWVMrbzdMOTBDUFhKNmwr?=
 =?utf-8?B?c2M3ZG5xNHZYQ0lwaERuQVMzVHJiakZNNDFUdEUvVVFtZVJFSVR5VE5QRW81?=
 =?utf-8?B?Wk93d0dqZWE2T1U1cm9OWWtZRTBUYURHNnY4cDRZZW9BeU9rNFZGZTNFaGJB?=
 =?utf-8?B?NVJ1QWRvRDJreFB5czNlNFdzV1UxcmljQVQreldQM3U4OFg4VmtBc0RGK082?=
 =?utf-8?B?dUxhNmk4TEROc0luTVZ5M1gvQjlXbkM5aFVaNlZ6RXNJN0czaUVRemNpc2lU?=
 =?utf-8?B?OC9YODBCYmw0WnJWRHBsN3JFWXJSVWZaZlU4Y1hKWEVhMGFmTmVDWlZud2Z2?=
 =?utf-8?B?RWhQeTdBRGdWVHJLcTFqdGxkYzFGQUhsNmVPU0VwWGdOcUc5YXNWWUtLOTZW?=
 =?utf-8?B?Zlc2OVdxRmFlMlZ4YXNwZzMvbmc1YmVCdTUyZWFIak94K2dUanllQmxHMzV0?=
 =?utf-8?B?RUpuYzZ6MTJsQWc1N3VMWDUzajBNRTJmMUNnM2hCVWgyTmFGcDg4Y3J6L3Ni?=
 =?utf-8?B?NDFPalVWaVZGdzVRV1hmN2hYcGp3VVJDaklmZDNBR3ZrOVlzTGxnSEgxY3B2?=
 =?utf-8?B?WEpGa1RnZ1hzUXVxekNJK3Q2blgyNndETThleGc2TGIzazA4SFg2amtBMEVl?=
 =?utf-8?B?ekxMMEhKOTZYb0R2OXdjQVQ4TkE3NUd0VTlwSElRU3Z1eitCMnhEcUtQSlFI?=
 =?utf-8?B?NkhSaVAwSVNudjZHNzVjRHFCeEdYV0lXTzM3aGxqVVhGWTFmcjlsV0pTOHRo?=
 =?utf-8?B?cmtFWWxjUkdweDN0enlMdSt6dkdYclVHZytoTjdMYWhkQUtiMUcyNnpUd2RU?=
 =?utf-8?B?OHRKcGVSVWU4emF6WGtNSEJoT1VhUHgrVWJDS1lOQ2lDNlNLc3ZtYTF1b3Va?=
 =?utf-8?B?bFdWbEp0UENuUGdpZENmcWwxcHNHU2FmRkxDN0xlTlBSRG93eThhUTBoeGIz?=
 =?utf-8?B?VTFKdjFnYXNGU0N0dkVlMjIxK3VPdVNBMy9EQlhYUUV2V0MzeDRmU2dtcElz?=
 =?utf-8?B?OXVyWng2TEVmaGhkcXd5L0NsaWM4cGdTZnd1YUFMMnRMbHlIOE1raG1LUGJF?=
 =?utf-8?B?YVVOTlkrTmpKb20vMjJGVElGVXQrNGdHNkRma0R5Z3JZN0VmUCtTWmRrK2h4?=
 =?utf-8?B?OTVIS0hQUnpBbDV3KzJtVTFiSXcwbkQyOVEzd0ZJWG5hR09FaVIzbW8xUmdi?=
 =?utf-8?B?cTFSTlZvT0xPTmo5Tk5QRGpvNnR3ajZVend0dEVnN3BNMUZIYnVjb0hPdlRp?=
 =?utf-8?B?dDhrUGNKdmxhRjB0a3hvNjgyN09tM01hdGhUb242U3dpdVlSSnVvR0JrTkxt?=
 =?utf-8?B?R0QzMW9HWFNhODhWOUFHMndEdFBYZlgxK1F0V2ZGbHZIeTd2UnpYSVNQZngy?=
 =?utf-8?B?dnlMcEhjWGErVTR1eXpJRTR4K3pudHh0ZWlDVWR4L0U1N0tLV1pZTGRJa3VW?=
 =?utf-8?B?bTVLbDF1V3V4NTJidTY2NGhoV0RqZXNDQTNuYlltRGpnZmQwZHU0NWRrMVIy?=
 =?utf-8?B?d1B6OW94enBNdGVoWU5PeG9ieHE2SlYwUThtb1haNjFCOXRmZld4c253NzI5?=
 =?utf-8?B?UEhrQlUwNXZOc0k1NzlNaEhhendXZEU1ZGZhOEx0NlFmZndXVkM2ZXhTZkI4?=
 =?utf-8?B?a3JUQ3RmMTNQc1BiTG1UcmxxOEdLVlB6QXlkYzBzRjgvL3FCMmkvb2piYWJt?=
 =?utf-8?B?SVdzMHdkNlViK0ZYYWViVmh4c1NzWnV0Ym8wL3BMS1VTcURtYU80TVVYeXor?=
 =?utf-8?B?Q284V243WUVRUUcwSlZaSmw4OEdKQXhoN0N0ak1DdGFBRW4zKzhPWFIwYXNs?=
 =?utf-8?B?NTVBZUg2Q1FKbnRGdUZBNExYSUg1QmJ4aEsxWkViVG44TGExa1hlelNZZ0V6?=
 =?utf-8?B?eG0yMTJBNk9oaG1WYjNNSGNraGJyZjVuL204RkhUbVlxNi9URnc5VHV3S3Jm?=
 =?utf-8?B?SDBJY2N6RjVHOGJiQWN6b0lmejhzbUtJT0dwMWEzL1RoYkRwOUdEY1NqdGo3?=
 =?utf-8?B?aFdhdlEzOCt5eFdNUWk0NzVya00zM2xxdGFtZ01LZmNTdzZCSlRPYzVGTjV2?=
 =?utf-8?B?SzJQR3VLa250a2hZcGJsdFF3dTB1cTlKOXhtYW5WMHJFUTQ5ak5oZm5HK1Zq?=
 =?utf-8?B?eEY1MmhUM2FLNzFGcWdaWlhnUmp1d3V1TVFNWkdzdjJYWHRWaUw3QmRtZVA0?=
 =?utf-8?B?VXdySTRVdzNET1V2cUxPUVozYmc2MUpaamE5RUFRbmJKRDRveFc1SU5wR2E1?=
 =?utf-8?B?QVg5eFpsZ09NYnpFWUhsa0I3Mi9xdFlCbkNpUTVxVDBaeU53QksyZFhXQWdS?=
 =?utf-8?Q?HjzX8JW0jv9sYmzU=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7109b04b-b1a5-4d50-d5cc-08de4d54dc3a
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 18:53:20.2091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehkaMo0Nvyppf1dvDadQt3bZmFnlSa0yKXdWvoHUUDu6UNinuoZVuLqa4ujAreou2DzXekQHV67HUi+Bap3GAOhRFb7VMzVrwJetDu3VnNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5844

On 06/01/2026 5:50 pm, Nicola Vetrini wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>
> There is consensus towards using more binary literals in Xen,
> so they are enabled both for X86_64 and ARM64.
>
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks for looking into this.

