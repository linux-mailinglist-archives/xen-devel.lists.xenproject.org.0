Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D082AD8FB3
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 16:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014407.1392509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ5We-0002SR-EZ; Fri, 13 Jun 2025 14:37:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014407.1392509; Fri, 13 Jun 2025 14:37:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ5We-0002Ps-Bi; Fri, 13 Jun 2025 14:37:00 +0000
Received: by outflank-mailman (input) for mailman id 1014407;
 Fri, 13 Jun 2025 14:36:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OW95=Y4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uQ5Wc-0002Pm-0e
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 14:36:58 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2412::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d938f2ba-4863-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 16:36:55 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM6PR12MB4401.namprd12.prod.outlook.com (2603:10b6:5:2a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Fri, 13 Jun
 2025 14:36:49 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:36:49 +0000
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
X-Inumbo-ID: d938f2ba-4863-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsuT/tOSWZR13eC0M8vuptMINBmy9u7jo0tOI93unVkixs9zov03XWL0/FG1DFhiVRqi0fgVDl4L/JIS+7vQZW8MvcAVjIyUmAZQGUHLOKQbuOoFjwwhepdKX3O+hwWBkL9oMxuX9UEvyZMn6E3C8bAZpO/VfLVA3F9VrY2gBwxLe7VHxTDiKyESBLw0Kdy+3Dd4U5hblrVlUK5z5JjYqyW1ryHLv3vYFeQ6nYAudxatIu1u6wAcTzMx/+1xnNy4oQ88ZIclz++uo0F6bB147l05feD2y9Jn5qNXv551hqmCMhxeC/dVUvyBSzn7wdpHunK8FsLuWO9vGFSZ0F7bgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Bhfezr/npPdf/3ciPsOvpWHjiqsuZEZHbRLK1j6hSw=;
 b=aGGgocjXmp/t8LM9puwiCpvMyQeQ88XU3CM/PtTWHPl/EQ3PkrNFUXUucbvvMNBfBpQDjEdCUMXFWPMQReYATQt08bQOwQHuqVWYFJJTTNqbK12C4u1LWRUdsU8SnTt7P/8jHhb8E+lVQFrbsjTT9za9zqWCQRXGPiSGsUDYEi7CRCdlEGI/7FKOCW38agRhewestlyAT7gmqxGllQPIZw3AIAyODfOf5pbsL2YPNgbKroq/y3M8d46ds8waHZRFv1a2AuZ+/BjSqacXheNn8cSh3qqJ9avEVWEpRIRq8qXMvBlfbaQdFKdZGYpiMwWPb+nRKsmKtyS8a3eHM6rgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Bhfezr/npPdf/3ciPsOvpWHjiqsuZEZHbRLK1j6hSw=;
 b=jEub1mQ1RTcwzz3qRCb4Xlptp89gb20xJ/eUab+D+LKDfFalrFmGSrMlYJyrB0iotDb6HQtxfagHVBuIqh9iZFc5ozS63WfGMYaju2dNFEFtACrc3cnknfptAbgM3mdXLwdPiozO4yQa88il0RoEbR5t2piMdus2T8L5lGtAKAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4403d50b-3380-4f94-8c14-f0eb2884b50d@amd.com>
Date: Fri, 13 Jun 2025 15:36:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/char: implement suspend/resume calls for SCIF
 driver
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1749204282.git.mykola_kvach@epam.com>
 <3be3369910ec5159eab3cb26155da645dd1df83b.1749204282.git.mykola_kvach@epam.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <3be3369910ec5159eab3cb26155da645dd1df83b.1749204282.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0025.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM6PR12MB4401:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a7615d-c38e-4e64-f940-08ddaa87bacd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ckJmOEpkTHJxdE4wQ1NtTVF5LyttMjNOZ1dqNmdPMldzL25yazRKSnlmMzNk?=
 =?utf-8?B?OENIckVWS05ROUpIOTQzc1M5RUJtMnBzVnJYZUloRHFZamlGNUg5clkvYWZ2?=
 =?utf-8?B?aERLYlYveC9QT1Y5SS9PZkVmQ3F4MkR0RklpSElIaW5FV1ZEYStWb3VFaWZl?=
 =?utf-8?B?RG9MRXpoMmJuZlgxYkFEOVU2bGFvQ1hmVUZsNlhvUmhQcmtoNHo2U29iNkY0?=
 =?utf-8?B?ZncyaDR5aExCV1h2Q1JoRW5tQ1YyMlh6NnVjV1dDZ2ZDRnJBRFg0MFNHT1lO?=
 =?utf-8?B?MVRlUG9jK0E1ZGU0V251OXpxazhsMEVpVWZTcWs3NXFTalg1QmdtSVV3Q3lt?=
 =?utf-8?B?dUxDT3YvdWk3QU5HWWwyRzRzdmpzd0h1WU9wcjdJOGFRamp4M3V5anlNSWx6?=
 =?utf-8?B?RUI0TTN4a0QyNHBaRjZIRE9VaUdiZlVsWDFreER1UC9rcng4b3JIZXdvMkJK?=
 =?utf-8?B?ckNGSGtqSlB0WmlYVFhKUGFxbXdDM2dLWkluRDBQMVNGOVRXbmlJQ3d6dGU3?=
 =?utf-8?B?Y1k2WTdKZS81eEpucDdVQ3IzNktBM0VwS1cvWUI1aWIrR0lRa3VPbC9jRXVp?=
 =?utf-8?B?WGxlbXZhbGtoN1I3ang1MUlyWlc5dHMwUkg2V29JQXFnWUV6UzFXNXF5SEJO?=
 =?utf-8?B?cG9UaTdPbTBFcG9BUUlGU1pSZm1GN0lYZkhKYWpndzZMWVRVclJ0L1QxTnZ0?=
 =?utf-8?B?K0lyVm5MNzFVRHhSc2M2b2xucHNxQkVRUEZWQjJlSkVNM0dObW1xNnN1K3BP?=
 =?utf-8?B?bkV5M0szYndjWWFLN1Q2ZXp2WSt6YWVFWnVITDlXRHFJcW9qMXVRemsxUlBM?=
 =?utf-8?B?UmNJb3JYYTJWcmlTVllhUlIzMUZHTEY3Ylhxd1JYK2pYdFhMSjk4ckNsVitP?=
 =?utf-8?B?bVZtSUNaa2xPazk4Z3FPbkIxMHRtNTBHdVdXT3dObFBlQkQ1SWxZU0xFZFRo?=
 =?utf-8?B?eko0M0RYVWVDNHJIYWMzSldjM1B0MzIxR2NWbTQ2RTBJemhwRHBXUmFyU0Fs?=
 =?utf-8?B?a3hoMDgyTEQxMGtlQXRsNjRuSzdOaHJVWWVBdU02NnhndXhoQ3pEd2RLakx4?=
 =?utf-8?B?a1Foam5rQmNneVYxeEh2KzBpWTdFUWdwMzB1ZElsS3ljNzBWRHVGdG56bWZl?=
 =?utf-8?B?aE5LZ3lnSXFNVXVmNzhwSGEyR0UrcjF5N0M5T0NCa2dWN1VYSm5DWnpXeGtV?=
 =?utf-8?B?OWl2YXRpQXRTeUdkOUlNd1RVTUFYOEROUmhyc2lDNzladHRsdGc2NWhMODU0?=
 =?utf-8?B?a0lpYmUzR2NheW8zMkhTRVVxNDBqNnZyamRLaWFUYnI0bG1JYk16ZCtuc3Na?=
 =?utf-8?B?TnU4a295dXJNS293ZlV4Y3hpOXlvVTFVYllqVmg0UWlRSnlURjZIK3NaYnhi?=
 =?utf-8?B?VDdLMm04TWdWMHRNQnVaODUzdmZDZzQ5cWFSWUFIWElJVTBhRnMvNWVoSll6?=
 =?utf-8?B?c1NBeExpM2dWMTJBK1BwL0Zvekczb1ViSlZDZ0RCYzFoMzFqL1FQOVBuNzRF?=
 =?utf-8?B?cFArcUlSUHQvRURhMlhaUnoxTnFOVlF3RERiTHRHUjVQUXhzZjRMWTdIRTIv?=
 =?utf-8?B?YlVDRzAyVkpJcVZhOElhS3VsZDgxdnFvUkRVZUJ3V3VUOWJPNDE5b25Ga3pk?=
 =?utf-8?B?TGpQa2lETGdtV1l3d2p2K3E5Q1JrVDJqUVhOQkdFWHcyTnVtRnU5bWZVdG0y?=
 =?utf-8?B?Mi9YWWlzMkp6dUlqT3UxM2ZBanZyMmRvUy9aWGxpV1Vxei94SUFoaW5UTFI5?=
 =?utf-8?B?WXpRWXNTTXEzOEliR1J1MHJXNlNsdlR1aWxoY1locmkvYld4MUJtSlQvQ2RC?=
 =?utf-8?B?eHNhVTJOUlYzL2l0N1JGdklmb2p2Ny9CZWpGeVl5WXF4TlRsZkM2MkdySXc5?=
 =?utf-8?B?NmlmcVNYMDI3V2hLK1FXMjlxTi81UDk4UTFuOTVQRjh2eXY3S0R1K0NkcVlt?=
 =?utf-8?Q?WezHpnfBYNU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NktuU0c2UUxQaktDOTFSRXB2VC9ZcDd0ajV4MGUvRmhwRFNvbjNWcVh6TXFS?=
 =?utf-8?B?OWs0Z0ZRVjlNWVo4Yk1QK0Nnamg0N0UzbEZUS3NSNGM1ZTBGWjBROWlxMkd1?=
 =?utf-8?B?N2pMUGVMa0xZMHlLS000YlgzUW13dFJ5SFdQTUp3azZYclpFU2ZlNTRnVlcv?=
 =?utf-8?B?eVhoeXZhNC9mcWdsdHdFUks4YlpVRW40THZUcU1wRWVPcnVSRUV5U3NGNFRv?=
 =?utf-8?B?cFdXOWRwK05rbjRCR00rRHV2WHpqdzJYRm55NG0xbjlVYnNvVUZ0aHkyRmRv?=
 =?utf-8?B?TzA1MzNpTlF3Ni9kV3dzNk4xMXp1d1NRTHd0aWtPZExld0FuMzMzWm9RdGlM?=
 =?utf-8?B?WFJmZzNkcGo4bGZKSHBQOFB4NXdydklDMkwxVHZVRSt5dzU2OER0VFh5MFkz?=
 =?utf-8?B?SGt5UTlydjM3ZmlSNW01cC9hdmtCVmZxU2tXWUYra2dQOHlOcFhGSlg4dlRR?=
 =?utf-8?B?S3BPUFZBc3FadHdwUWt3Z0NCSXp5bjVXTE5GMTBWUFR5WVkxOHA1a2pTTnNq?=
 =?utf-8?B?d2JTSDFadVFQS28yTkxHUEp4WEFwVkUrMk5QM1hCSzR1K0ZqYTJHQzNOaGUw?=
 =?utf-8?B?THhWbFRRbzc4TVNaU3d0YnV1UUxlYkpvREhpNkhWN2x4Y1dIczd4bWdQbVg0?=
 =?utf-8?B?NCs1T29ybjdLcHBDdlNzVEpiV2MwR095SGtFdWw0WlVEcXhpc2dzQmVTNnhq?=
 =?utf-8?B?ZGZEZmxqZlUyL0plRkgwSkljWms1Q2gxMWIxZk9BRm1LZlJ0bk1vNzJlTFZ1?=
 =?utf-8?B?VzE3SWFnbWM0QVFKOGREaDRTMXdJWE1iOUNTNTBnQVg1OUNQYkZVWkJLcFR0?=
 =?utf-8?B?MUk2d2UyRUErU2pEZUV6d1pyTnZlc2NBOFBVSjB5QVBBbFB2YVBNVDgrR1hJ?=
 =?utf-8?B?RE5mMElHRS84bDNsb2JGR1dCVm9oZWprbGNwUjRrcFJYYWplNVpPQUF3N2tD?=
 =?utf-8?B?NG4xM2k1SjBOaXVpVERnT2FwdTd1Sk96MFpjd2lGNFhVT3ZwOEUvbFJsd0tR?=
 =?utf-8?B?ZFBVaUg4Ri9XRDRPbXBWdnQ5b2NtMDlUc2RRT0R3QWlMb2V6QVZBcmlQQ2to?=
 =?utf-8?B?dC9ZV2ljNXV0TkE2czhQcVVSOFlhK3BLOWhFdlpuYmswNEZsK3RxTll3VGJr?=
 =?utf-8?B?WDU3blQ4QTV4c0ZzaFdTdFV6YmU5aEJ6cWNOdkcwZVJibFJjQWllbE9KSHlW?=
 =?utf-8?B?RnZEa0RMTkIraGFVV1hZOTFOMnZRQWRhMmNvQ2dmaW9wQk05Z2RTUjZoVm95?=
 =?utf-8?B?bitxVHhBMktoNWN5bWI3TmlyYTlJaXNQQ3loOUVva2RsYjZQY0xxbEtLYjkv?=
 =?utf-8?B?MHluRGVIN3pYUmNXNTJPUkpRZkJoTmpRTUsreWJ6SGlVZmVoWFQwSUFlWjNM?=
 =?utf-8?B?Q0c4eTVibFI5K2JLYUNjbTdVdVpocytMSHpNZ0N0azdkc3Rzd29NTXEwL1RC?=
 =?utf-8?B?OC8xRFRJc3lkaXVOakVKSGFlaHNZbHhWTmZHbkdacWdVdE96c1V3OWxhYk9M?=
 =?utf-8?B?eG1PeFpFVitGYmZqZnY5TGNPeENMMHBneE9nN25TRGVXdWYzYy9lTCtyenh5?=
 =?utf-8?B?Y25pVFBZWHBhdUNpL0w2bDJZVllEa0pVMEI2blhUUTJHVkpRbmswR2h2Y2Fz?=
 =?utf-8?B?Y1A5MXJxT2pFMHVURWFuMUZvWVFLWlVVc2pqSmtxSkxBNmlZVytoSUJsMWgx?=
 =?utf-8?B?RjFTaHZaT0FyVzBxY0lHWkV2WGMyMXJLS1ZlTEc5dUdXL1RBY2I5WUExcHVn?=
 =?utf-8?B?TXNSN3R1bnJZYkEwZkt2RGplWEtja1o2UGxFYnNGL2Y5K042b05TcWlYVVZE?=
 =?utf-8?B?NWlPVHNPMElmeUpxS3k3Q1lpTW5XVG1UWHpIcWVFSmduRTVxblUxeWhFR25v?=
 =?utf-8?B?ZDFPSm5YNFBUMHFWSHNsZHA1aXVTcUxoWUxuMXdXcDJJcG9uTURXMjdsaFNw?=
 =?utf-8?B?OUJsQWZaUkpnWVpveDM0L3NXTTI5NEM2MjI2UGsrWUZ1ZzJKNkZxeklDN0RQ?=
 =?utf-8?B?aFo3NlR5UXMvb0oraHJDYlBpQURYOFdXTEhhcE9GMmMvU0ZyV2gvYUxKT21U?=
 =?utf-8?B?U0hkRnl2V3FydGY0UVoyYXdZR1NXWXpJaHh4SktzZisyYzNLNzQ0L0V0T3Fz?=
 =?utf-8?Q?ki6wDYl9MJYOQfU/ua3O/IBaP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a7615d-c38e-4e64-f940-08ddaa87bacd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:36:49.1373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxCtjTo7WWeCkxlJD3qgbTMngCUBiEF7m//FefpbBZhCY/N8XOfGS2v85Dti5bJMq+GITGlaJjk2ZE3AW8H3kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4401

Hi Mykola,

On 06/06/2025 11:11, Mykola Kvach wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> The changes have been tested only on the Renesas R-Car H3 Starter Kit board.

The commit message need to explain what the change is and why it is needed.

Also ...

>
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
> the suspend/resume functions in the SCIF driver.
> ---
>   xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
>
> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
> index 757793ca45..888821a3b8 100644
> --- a/xen/drivers/char/scif-uart.c
> +++ b/xen/drivers/char/scif-uart.c
> @@ -139,9 +139,8 @@ static void scif_uart_interrupt(int irq, void *data)
>       }
>   }
>
> -static void __init scif_uart_init_preirq(struct serial_port *port)
> +static void scif_uart_disable(struct scif_uart *uart)
>   {
> -    struct scif_uart *uart = port->uart;
>       const struct port_params *params = uart->params;
>
>       /*
> @@ -155,6 +154,14 @@ static void __init scif_uart_init_preirq(struct serial_port *port)
>
>       /* Reset TX/RX FIFOs */
>       scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
> +}
> +
> +static void scif_uart_init_preirq(struct serial_port *port)
> +{
> +    struct scif_uart *uart = port->uart;
> +    const struct port_params *params = uart->params;
> +
> +    scif_uart_disable(uart);
>
>       /* Clear all errors and flags */
>       scif_readw(uart, params->status_reg);
> @@ -271,6 +278,31 @@ static void scif_uart_stop_tx(struct serial_port *port)
>       scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_TIE);
>   }
>
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +static void scif_uart_suspend(struct serial_port *port)
> +{
> +    struct scif_uart *uart = port->uart;
> +
> +    scif_uart_stop_tx(port);
> +    scif_uart_disable(uart);
> +}
> +
> +static void scif_uart_resume(struct serial_port *port)
> +{
> +    struct scif_uart *uart = port->uart;
> +    const struct port_params *params = uart->params;
> +    uint16_t ctrl;
> +
> +    scif_uart_init_preirq(port);
> +
> +    /* Enable TX/RX and Error Interrupts  */
> +    ctrl = scif_readw(uart, SCIF_SCSCR);
> +    scif_writew(uart, SCIF_SCSCR, ctrl | params->irq_flags);

If you can give reference to a public doc which describe these 
registers, it will be great.

Otherwise, the changes look ok to me.

> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   static struct uart_driver __read_mostly scif_uart_driver = {
>       .init_preirq  = scif_uart_init_preirq,
>       .init_postirq = scif_uart_init_postirq,
> @@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uart_driver = {
>       .start_tx     = scif_uart_start_tx,
>       .stop_tx      = scif_uart_stop_tx,
>       .vuart_info   = scif_vuart_info,
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +    .suspend      = scif_uart_suspend,
> +    .resume       = scif_uart_resume,
> +#endif
>   };
>
>   static const struct dt_device_match scif_uart_dt_match[] __initconst =
- Ayan
> --
> 2.48.1
>
>

