Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17020A8229B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 12:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943870.1342482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Sx1-0006iW-8O; Wed, 09 Apr 2025 10:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943870.1342482; Wed, 09 Apr 2025 10:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Sx1-0006g9-5H; Wed, 09 Apr 2025 10:46:35 +0000
Received: by outflank-mailman (input) for mailman id 943870;
 Wed, 09 Apr 2025 10:46:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAcD=W3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u2Swz-0006g3-L4
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 10:46:33 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f403:240a::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5fc7f9a-152f-11f0-9eaa-5ba50f476ded;
 Wed, 09 Apr 2025 12:46:31 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA1PR12MB7542.namprd12.prod.outlook.com (2603:10b6:208:42e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Wed, 9 Apr
 2025 10:46:27 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8632.017; Wed, 9 Apr 2025
 10:46:27 +0000
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
X-Inumbo-ID: e5fc7f9a-152f-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qqrsYvM73oEw0BC70P8oBdzZvkzl0Wy10VK+XqJTgRIcqpjuxfCiYtUcUgRH+nxAT15lLT4af7/jVsO7lsQuD8nYTWOKP3ibIPEikE09vuUh+TBpKzTmGwj69y8CS7y8VpoaLsrKGgRcD9KCBSujwDjt64ZDCZBPk5I593jR/4g5HLaT0WLSgLzaGcrlqiwmq29/zu3nQw0EkMdqeDOF+uHgYmvnZoq8esGL3gaiH7paUNtCEZCOtey72pmFB6CGJaz84XcprbRPPHeTZ1ghEowXGdsaGA9omy1MPEmPP9D/O5DPUY2EFzVEadkcOsqAKX9kMxoe7UlJGxsVtejVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXjeDSjKaKUBSlhXupgJQX6UkrOCSr4+ro7Z7dI/9/8=;
 b=MDzYMdCuCS/kKiJZl6YcLpnH9HZ1jk1/5AeCD0pLJiUp8KANEXoYdeAPA6u63+9StXjFrPy8MOW53ivQn/XNll2nn8dczllMd8IH0Lfw979r+yqfvfGf4QUvKwUgRaXX+XvoeQUYzJADoMvv2n2tJ/pnjbGhFFigF4iAboyw4fJxRbcmMXOyaKmhzwuFnseBJxOdeTWy050J5o70WEBC2De8jB6Bl7b+bMjuGcYHQbuXASG8gEoR47tFVNXUkZyeFgpC1kIU+aGnMgFldF2ccRhqoE2skAuQLZ1luA1+V+iYGk0t2iWxGVMUW9rN4FlHUcwteKHh3pIBqbxuyWU9Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXjeDSjKaKUBSlhXupgJQX6UkrOCSr4+ro7Z7dI/9/8=;
 b=X50/PC+rBAWEiikmFFuECujob8BkCzU+7STnZh7U7merFqCfY0XFtD3vhuHWsBMmXEz660128GZBOC1WqmZ41L/vAE5jQ/ba5r9eqi9bcOFmzqGSOFhmt99oaMBg3alJGKaNyiStFNPBDQoahe2uZUkeZMHwSa92r8m4/nytev4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <44944588-2225-4f77-9a89-1153630f900c@amd.com>
Date: Wed, 9 Apr 2025 11:46:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm/mpu: Provide access to the MPU region from the
 C code
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250407091430.2342709-1-luca.fancellu@arm.com>
 <20250407091430.2342709-3-luca.fancellu@arm.com>
 <0acf63c0-267e-44c0-b629-fa576307497c@amd.com>
 <1AC85CBD-02B1-4AA4-B9A3-68DFC06137AA@arm.com>
 <4f860a56-5536-455b-9490-196bfc220556@amd.com>
 <40C7A4DC-0216-4981-A501-AFDA0E8671DD@arm.com>
 <9f637d98-c8f8-49e0-9f0a-002cdfefc296@amd.com>
 <EABA5C5E-4FE3-4E7A-8E29-B37A4CFCC18D@arm.com>
 <F2C6FC52-386A-4417-B592-151ECE079E52@arm.com>
 <aded1d6f-0e6f-4903-a5a3-127e06e3803f@amd.com>
 <C4B4B135-AF5D-4BA9-AD17-0C46868B7FFD@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <C4B4B135-AF5D-4BA9-AD17-0C46868B7FFD@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0426.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::17) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA1PR12MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: 44d95f47-3916-4bfe-aa3f-08dd7753c79a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ti9qYmxBWjVwK3VlSDNIWGxLVG9HTlRyUmRKQ2JxUE1XOWlBaHpUM1JrTDBY?=
 =?utf-8?B?MGZZZnJyemQ2amI4VSt5dWIxMEsrS3FsUUdSQitwaGNRdUJSZXpra0cvUjVQ?=
 =?utf-8?B?V1BGRzR1UERkU2c0K3pVam5tdVlQa0hzeXNJYkNJY3dBRTl1aURMM1dNVlFO?=
 =?utf-8?B?dmRrRUoybnE2MjFwaldURFVYTnpScGVSVTduQmhRanIzVTg3ZVR6SWNPUWht?=
 =?utf-8?B?VzlxSjI0cVg2cjY2RDJnVWRPcklKdEE3dWVkWnp0K1ZYd0pXOXpVSm1ZcGNj?=
 =?utf-8?B?OEhNdWV2V2d4b1hCUGxmZGNBTEhRR2FxMk40eTY4bi9Zb1lZYkI3cXQ4L3p5?=
 =?utf-8?B?RG5IZzJrLzdzcTVjZ2NiclAxODNYZXRBNGJydytDYlg3L1VZRkViN2RmSXVx?=
 =?utf-8?B?RWlKbU5nRmcveXZVU2J3RmhNVS8xY3dPTXFsSCtPNXB3cWFJZ3dqSk9HTG9t?=
 =?utf-8?B?WlorVzkvSFpkQkI0NzhMOVFlVVFrdjFsRngzc2JiSG5pcmsrcFRIdTh1L1lk?=
 =?utf-8?B?QzU0SnJqclREQ09EZWJQN0VPVGwxTFg0Q0FwT2FUdkNCc2hvNDBUaWFZYnpC?=
 =?utf-8?B?bm1jQnlhWEw5TTd4Q0tVcFBrRlRSL296eU85L0ZkcHJyaWdhdkN2WG9jT3Aw?=
 =?utf-8?B?RDREejY1T0VheFFqSWdnS0pjL0xiaVJpazdBbS9WdEl6elVRN2NnOFJPSGxn?=
 =?utf-8?B?a1ZnUnNVbllZVnU0YmhYZTJCVjIrdkdBYXNqdXhITGt5S1RkWE43OHRmRWdF?=
 =?utf-8?B?MmlaTTEwSm8yOXMxK3dWRFdNYTV1OEpyWDkrK1lQQTNLSlNndjM3aWpabWtv?=
 =?utf-8?B?MUJmY3lYRVpabzJNWVExWVBTL0hyUlEyalpTRUFtK3greVdQNW9NVXdSQktn?=
 =?utf-8?B?Mm1oblhyQzh3cU14RjBvdWcrWnBhRFNUK2Mxd1JZYmhsOU1mRmNkRGhCK1dQ?=
 =?utf-8?B?em9nNkw4enlNaDBXMTM1eG55NW15SVRzYnZqazdaaFdwY0MyZlVXRi81T1dQ?=
 =?utf-8?B?T1NvVDVyYVpIdGYwSzFDNTAyYXpWNXlubW9YR0Y3Nmdjb2JGZTNjU2FVcHhB?=
 =?utf-8?B?M3VNRmljeFR2Y3E3WloyYkRscUM2QkRzblpjRFNrbmRhRkdVUm5LM3NYaXRu?=
 =?utf-8?B?eGxGUWdHVlB0aEV1V216UjUvM1ZnQ2V1T242MHp4WFgvaGNWanZvYVdIVnZs?=
 =?utf-8?B?a1Jsay93cmQzNkZ6MmdEbFdhRHhBUC9NeVJrZTZkcTBqa010aG5RWmtRWFlr?=
 =?utf-8?B?SEVtVWd0cGdENmJPY05GNWlxbDZjRVpnNko0ZS90ejJDVGpML25hTm8zazBM?=
 =?utf-8?B?Q0dxMGR1aS9NUGRXOERVYnd6S3UvaCtGRThFOFlXSmw3QlFzM2hHM3JCUnVx?=
 =?utf-8?B?V3d4bi9UbFNEV3RwNWEyUEZWOEV3NGRiUTNhTm1XOFBvaHk1YWNqcVFHb0Fs?=
 =?utf-8?B?cXpuOUEyMWN3VkdzUmUwRExJNmcrVDIrZVluQ3UrNEZyOHpicFVFaFh4c0E3?=
 =?utf-8?B?aUVIRlR1QXhvNjArZERYMlFiQ1p5UU80OTIxM1RzQk5Ia3IzM0tVbWhTMU52?=
 =?utf-8?B?Z3B6NHRCaFlRZjE2UTQ4cjVCVWNWckJaeWNheHZJR3BmYzZLZThYOFI0SHlW?=
 =?utf-8?B?K1ZpRzZtVGFnbUI0OWhxY1B5dGdqeEREa0xXbUVuZk1ONGNDVlpXWWRnQ2JO?=
 =?utf-8?B?MldwckYrT2dSZTZtWlNMNU0xK0Y3dFlxRWFaZVZmSC9MTE5kMndhdFZuM212?=
 =?utf-8?B?ZXRTSmdKMHJ4WWVoSWJNM0xUeGZFQ3ZUaWhtNlk1YjljSld4SmNWQkVqRGVZ?=
 =?utf-8?B?Um1XbWYxMkNraXB4L0p6dHRMbDFxaURvUDh3TkR6S1JDWUwydFFNRCtvV0hZ?=
 =?utf-8?B?YnFRUjhmUzVIaElOay9jd0tVYlRkb2dMcFRNS0hvbzh5dDh5dHRiQVZiTXlL?=
 =?utf-8?Q?1ucJ80KiTzg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUFSL3AwZE40V3N2SVZSYVRIL2NzNUJJNU1mUDNqUG10aXIxMGZIYlEva2lL?=
 =?utf-8?B?NW82cFZGT1EwZWZJQUFyRWlwV3dCRGNka20rdkdZTVNONlhrUHE5UmdwU08w?=
 =?utf-8?B?TkQwOG5SZDBLbGlGSVZPTDZ5OGozRjZPMW5RWWJGVTluUGU5dGJsQVYwY0dC?=
 =?utf-8?B?ZC9MT2lYaS9VeDdDTm5ZWnpuSlVZVm9xNXNSNjhicEF2WTFTM0l2WVlrMDla?=
 =?utf-8?B?SkpOYnNiZ211UGIxOThZU0VJUnFDVzR1SEY1clRZOHMzZWxjY2pFbmluNXZS?=
 =?utf-8?B?bmoyd1NCWG9vdFcwQ1c4K21OUEZrS3d2ZFVaVEIwNE5OeW9tc2VFUFVzODlJ?=
 =?utf-8?B?eVpGT3JPZkFFU2VDWGpud2xzN2J3VnlkYXFlVVNFN21OMU9xMGUxR2dITHAx?=
 =?utf-8?B?Y2F6cGUrMzFaa0wvRkt5MEh1MXJ6dkFhanN6Wk02endnZzJVSUlJM2RwT0JC?=
 =?utf-8?B?Z3YrdXJjdEsrV0dBYmRSdjVkUmxGVlNHaU9CZ1djZlBmSGlSQk16Y0tINjZ1?=
 =?utf-8?B?TFB5MkxhbWROYnZXTkFtMGRFVEE1K1NEb1cyVGFaK1NOcVJXOGkvZytoQkxJ?=
 =?utf-8?B?VFRnSEp5R05YTndRbkNIRFdkbkQ3TTYranBsV1Z6eksybG0vOVRrUmJOV3Jr?=
 =?utf-8?B?NEdJb3lycFVLQjRKaE44RlU4SUxLc1VCMm5UUHRueTlaUGdESk5lRmprMFk3?=
 =?utf-8?B?MXdyMnFEUENPbnR2UlBLZjdPOHBnOE1Md3FvOVFDMXB4cm5neUpseXFRMVZ6?=
 =?utf-8?B?SGQwL2hIaHdhWmZ3d3dlbVhCckNuYU8yU0xrdVN1OUx4aWdoZTJsclQ1Vldp?=
 =?utf-8?B?VEZublVmZ1BubDk3TGZZSVZMYjFMRXU1Rk12d1o4VkFMVmdScDV2MmdHUjhs?=
 =?utf-8?B?QXZaM3QxcTJ1NnpnNkdJRjdvK3llTjV3L3BNbUVwcEJSd0s4a0JaRCs5b3Y1?=
 =?utf-8?B?MURDRTNjTGxHVjJJdHZBbUZ3UlpoL2ZoNDkvM3U5N3BpMmVxZS9ibXFubWpx?=
 =?utf-8?B?eUd4ZWNVNytoNm9CRTEvUVVWdXBiS041eWF3T09WQmlLVXFxSzBEWUxxNlF3?=
 =?utf-8?B?U2VVRnk4NGs2SFVSSVZxRFdaa1UrbTR4ZHAzUmVjMzlWMTMzODRhOENpSXhs?=
 =?utf-8?B?MU9lc2xaVElkTEFNZkJ4RWpVU0c4bzlhYm1CaTcydHE2bXFNVlJKazlKQjVL?=
 =?utf-8?B?OEkxUmRNVDVuVjc0RlpOUXRWbjBpcXlwOGxJdFZCOXI1LzJtRlRHSE55bFp6?=
 =?utf-8?B?bU9tSHA4QndZYjJSQm90Y1V5V0NDUnBpektPTlJBK1c4MjRUZWxPTE54dHhz?=
 =?utf-8?B?b1BLNHlEaHFWTUFhNjREbERMQ1k4cTM1NTFCQVBTTFoxWDV6ekc3MnBzRks0?=
 =?utf-8?B?NmhibUlqa2JIKzV5dHR4K3c2OWllNnhHb2dpMmc4Q2dLUktyMGN3YTdkSFJo?=
 =?utf-8?B?NGdkb2lCeU9hckFONXlnN1U1SlpxV3NWMG54S2Q2Y21SSElJOGY1b0grbXhP?=
 =?utf-8?B?N2R0UFB6akJka280OUhiZy9mRTdtdG9OaHdIUEtVaXF4SHhEbTRNVUFxRXRN?=
 =?utf-8?B?d3RXZXREemRxTGpHWlZsOEY2bUpiY3YrYlVJZGVhc0xOaEtXZG10cDFWdFB4?=
 =?utf-8?B?dDM2T0FCT3c5K0xqcEpiQkRyQzMrK01SNm8yQVhmSnJkZ0tsaTdzL3ltakEr?=
 =?utf-8?B?MlNudXl0S0lDU01NYW1nM094cTIyTkFTL3MzK3krTGxRazZhNitlWHRENmEv?=
 =?utf-8?B?ZzBuRHgvVXlRSDA3MWxicUNpQkRvSmxwOWRLYysrdDdQa0RLMm1DMC92MlhP?=
 =?utf-8?B?VHRHaWV0Y2F2Vy9EbXN4cURRYU9mRWdEQmtoZ1JGN09ZeTlSelc3VjJ6MjFW?=
 =?utf-8?B?TTgxaEdETEtVZXEzUUVZN0JHK2ZvNm9qaE9XK21zb3BNKzg0UDA5MUdMcVVG?=
 =?utf-8?B?OVFrSmRhV202NjRPNW45ZHV5alpNTUFtQitIRGhoQTV3N3BvNStNVG53UWh0?=
 =?utf-8?B?TGw1VjA2RzZRYXFtWFN6Ukd3ejdnWHpLb3REemlOMzVWdVVib1RMWEpieVZQ?=
 =?utf-8?B?YnJiMjJiVTVMOEp1RWZrNHFVeVB3RVRWcWlaM21NQmwxN0xqNlBRRm82eS9l?=
 =?utf-8?Q?MsVt+1TH7FOQ/sjCvLGwybzzL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44d95f47-3916-4bfe-aa3f-08dd7753c79a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 10:46:27.3820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQMMQAJo7/LLGGZqNj0KcRSGhjQx6DOP1IgM48Q8SQK7cXgHvx9ZW53S9jNl7FlU3mksQUygPGkN8ykarfaSFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7542


On 09/04/2025 11:21, Luca Fancellu wrote:
> Hi Ayan,
Hi,
>
>> On 9 Apr 2025, at 11:07, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>
>>
>> On 09/04/2025 09:26, Luca Fancellu wrote:
>>> Hi Ayan,
>> Hi Luca,
>>>>>> The point of the code was to don’t issue an isb() every time we change the selector,
>>>>>> of course the code would be easier otherwise, but do we want to do that?
>>>>> Not sure if it is beneficial as you would need to use isb() from region16 onwards.
>>>> The isb() is issued only when changing the selector, so when you go from reading/writing regions
>>>> from 0-15 to 16-31 for example, of course there is a case that if you continuously write on region 15
>>>> and 16 you would have to always change the selector, but it’s the less impact we could have.
>>>>
>>>> armv8-R is even better since it’s able to address regions from 0 to 23 without flushing the pipeline,
>>>                   ^— aarch32 :)
>> Can you point me to the document where you got this info ?
> was referring to the r52, of course you are more knowledgeable on the armv8-r aarch32 part, so ...
If you can point me to the page and section within R52 TRM, I can take a 
look to see if I missed something (which isn't suprising as the docs are 
huge :))
>
>>>> so I would say we should exploit this big advantage.
>>>>
>>>> I’ll send shortly in this thread the code I would use and the code I was thinking you could use.
>>> Here the code I have in mind:
>>>
>>> static void prepare_selector(uint8_t *sel)
>>> {
>>>      uint8_t cur_sel = *sel;
>>>      /*
>>>       * {read,write}_protection_region works using the direct access to the 0..15
>>>       * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>>>       * only when needed, so when the upper 4 bits of the selector will change.
>>>       */
>>>      cur_sel &= 0xF0U;
>>>      if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
>>>      {
>>>          WRITE_SYSREG(cur_sel, PRSELR_EL2);
>>>          isb();
>>>      }
>>>      *sel = *sel & 0xFU;
>>> }
>>>
>>> void read_protection_region(pr_t *pr_read, uint8_t sel)
>>> {
>>>      /*
>>>       * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
>>>       * make sure PRSELR_EL2 is set, as it determines which MPU region
>>>       * is selected.
>>>       */
>>>      prepare_selector(&sel);
>>>
>>>      switch ( sel )
>>>      {
>>>          GENERATE_READ_PR_REG_CASE(0, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(1, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(2, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(3, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(4, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(5, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(6, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(7, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(8, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(9, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(10, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(11, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(12, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(13, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(14, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(15, pr_read);
>>>      default:
>>>          BUG(); /* Can't happen */
>>>      }
>>> }
>>>
>>> void write_protection_region(const pr_t *pr_write, uint8_t sel)
>>> {
>>>      /*
>>>       * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
>>>       * make sure PRSELR_EL2 is set, as it determines which MPU region
>>>       * is selected.
>>>       */
>>>      prepare_selector(&sel);
>>>
>>>      switch ( sel )
>>>      {
>>>          GENERATE_WRITE_PR_REG_CASE(0, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(1, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(2, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(3, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(4, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(5, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(6, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(7, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(8, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(9, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(10, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(11, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(12, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(13, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(14, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(15, pr_write);
>>>      default:
>>>          BUG(); /* Can't happen */
>>>      }
>>> }
>> Till here I am fine if you think this is the correct approach for arm64.
> Ok
>
>>> Here the code I thought you could add for arm32:
>>>
>>> static void prepare_selector(uint8_t *sel)
>>> {
>>>      uint8_t cur_sel = *sel;
>>>
>>> #ifdef CONFIG_ARM_64
>>>      /*
>>>       * {read,write}_protection_region works using the direct access to the 0..15
>>>       * regions, so in order to save the isb() overhead, change the PRSELR_EL2
>>>       * only when needed, so when the upper 4 bits of the selector will change.
>>>       */
>>>      cur_sel &= 0xF0U;
>>>      if ( READ_SYSREG(PRSELR_EL2) != cur_sel )
>>>      {
>>>          WRITE_SYSREG(cur_sel, PRSELR_EL2);
>>>          isb();
>>>      }
>>>      *sel = *sel & 0xFU;
>>> #else
>>>      if ( cur_sel > 23 )
>>>          panic("Armv8-R AArch32 region selector exceeds maximum allowed range!");
>> I am not sure about this. See my question before. However ...
>>> #endif
>>> }
>>  From ARM DDI 0568A.c ID110520
>>
>> E2.2.3 HPRBAR<n> - Provides access to the base addresses for the first 32 defined EL2 MPU regions.
>>
>> E2.2.6 HPRLAR<n> - Provides access to the limit addresses for the first 32 defined EL2 MPU regions.
>>
>> I understand that HPRSELR is not used when directly accessing the above two registers. Thus, this function will be a nop for Arm32. Please let me know if I am mistaken.
> yes you are right, you can decide if doing something or not in that function, you don’t need to change the selector.
>
>
>>> void read_protection_region(pr_t *pr_read, uint8_t sel)
>>> {
>>>      /*
>>>       * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
>>>       * make sure PRSELR_EL2 is set, as it determines which MPU region
>>>       * is selected.
>>>       */
>>>      prepare_selector(&sel);
>>>
>>>      switch ( sel )
>>>      {
>>>          GENERATE_READ_PR_REG_CASE(0, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(1, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(2, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(3, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(4, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(5, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(6, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(7, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(8, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(9, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(10, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(11, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(12, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(13, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(14, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(15, pr_read);
>>> #ifdef CONFIG_ARM_32
>>>          GENERATE_READ_PR_REG_CASE(16, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(17, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(18, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(19, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(20, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(21, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(22, pr_read);
>>>          GENERATE_READ_PR_REG_CASE(23, pr_read);
>> At least 32 regions are directly accessible, thus thisn should go till 31 (0-31). Same ..
> yeah you can add until the 31st here and ...
>
>>> #endif
>>>      default:
>>>          BUG(); /* Can't happen */
>>>      }
>>> }
>>>
>>> void write_protection_region(const pr_t *pr_write, uint8_t sel)
>>> {
>>>      /*
>>>       * Before accessing EL2 MPU region register PRBAR_EL2/PRLAR_EL2,
>>>       * make sure PRSELR_EL2 is set, as it determines which MPU region
>>>       * is selected.
>>>       */
>>>      prepare_selector(&sel);
>>>
>>>      switch ( sel )
>>>      {
>>>          GENERATE_WRITE_PR_REG_CASE(0, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(1, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(2, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(3, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(4, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(5, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(6, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(7, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(8, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(9, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(10, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(11, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(12, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(13, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(14, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(15, pr_write);
>>> #ifdef CONFIG_ARM_32
>>>          GENERATE_WRITE_PR_REG_CASE(16, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(17, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(18, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(19, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(20, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(21, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(22, pr_write);
>>>          GENERATE_WRITE_PR_REG_CASE(23, pr_write);
>> for here.
> also here.
>
> So I guess we are aligned for this patch right? I will update this patch as the code above and you
> will modify the code for arm32 to support the direct access up to 32 region. Ok?

This is ok.

- Ayan

>
> Cheers,
> Luca
>
>

