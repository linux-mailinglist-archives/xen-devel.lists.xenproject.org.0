Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA29981E2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 11:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.815871.1230111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypJZ-0006Q6-7C; Thu, 10 Oct 2024 09:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 815871.1230111; Thu, 10 Oct 2024 09:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sypJZ-0006Oa-2r; Thu, 10 Oct 2024 09:18:33 +0000
Received: by outflank-mailman (input) for mailman id 815871;
 Thu, 10 Oct 2024 09:18:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwpE=RG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sypJX-0006OU-Ey
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 09:18:31 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c29b5b5-86e8-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 11:18:28 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH3PR12MB8075.namprd12.prod.outlook.com (2603:10b6:610:122::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Thu, 10 Oct
 2024 09:18:22 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%5]) with mapi id 15.20.8026.020; Thu, 10 Oct 2024
 09:18:21 +0000
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
X-Inumbo-ID: 9c29b5b5-86e8-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecxx5V3TJk1ZzKKDENYTO5MsLb2Qj5TajdkX4vFmrPuVNb4a9QpwjN33mgZEeHWIikQamdMzdDwc7toI11FRzEnHDFQt9uJmj7HS8nySMtaWcp1SL4/686A0ibrZoWCCK5LNisS+LufQ4EyH8qlTqLwf+OWXjZqAcxNqQPWFv4NOvn9J5EcrOBAiif7jtNzZLOu+OtqCDKmdNLKIia/Kxo+UcVy38qYhtRs3KMLmM2ahe/cXLHgF40IYosQqLpzQ/FW49mmYw9vMhuEMiCfz6TLySPOBSEDIsRhnp0kpIWRctrhB/u7aJZFW8oPfzud/VBSN2P76qR8Qme/UbTuBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuH8VFJFn8r2mU2sN2j7WmjWUiRGxfWYFvAXdEh28L0=;
 b=eiJj2MXrffe5uI04RhOIM3X17Mv1bp68c/bAsNgnX1HS6DOic4kfBiUQFt01/B0MTZk/mHwserNejdngn2UtiP1huJR1EtXzD6L9OyJOuI2Ef2/9VwbVKcsOvchqBLwf7Q8zKYsqt8IwK1wFrGKv+7mQPU9y9HHoHmUOdkypPZd+TjhNcSYWrsNbD9rhpkW0nrQ8y5xqt/EXJs3HhI+kGvlTCElrA9nxdzS6sVwxY7mnhAFu9g52Wk9x8C3mkW1UK547/xiRDlYS9evVpXwowgkYpLI/ZAGeCv4xxzLiolkgj3xnlg06HFFaiFCTV9TL6fNbloG6TY76V6+npG1jdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuH8VFJFn8r2mU2sN2j7WmjWUiRGxfWYFvAXdEh28L0=;
 b=X13idUoY9wQ0EHG00ZX066Z+z4N8hxwAFuG+fMjoPLGVqkDBp9knmJz1EOZM3qUpyukhcdnPPtYYhREOsYlO4fNxI54rbjfn6bwWY/2JTbV1bfKyoPT7lcYybVHIMWkDTjbw/qIzUliSVdSwK5nsHBCeFXh7OqKP2xlLtrrGG4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <08fba71e-44ec-4905-b533-46697a43a59b@amd.com>
Date: Thu, 10 Oct 2024 10:18:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
 <6E89CC97-C7E3-40DF-8BFA-5F3065429F54@arm.com>
 <f8ea9ab4-190e-427a-ae77-b7c0769dffbe@gmail.com>
 <alpine.DEB.2.22.394.2410081523292.12382@ubuntu-linux-20-04-desktop>
 <85FF2EB0-474D-4807-8DB3-FC502A5B2DE8@arm.com>
 <451c092a-af4b-40f4-a902-28f6f502d39a@amd.com>
 <7601808F-C5A6-4F20-A61A-A389252C7C5F@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <7601808F-C5A6-4F20-A61A-A389252C7C5F@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0655.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::9) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH3PR12MB8075:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c498ee-e6e3-4a07-b73e-08dce90c7c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RXp4aTlmNnd2WnpqcHJETTFEaGtmcTBNY2lNa3JDU1BrT3pQc1dkS0JzbXg0?=
 =?utf-8?B?ZlBwemxLMW8vTlV1eW83RUMwN0RCOG4yOW45OTVRdnN5Z2FROEtra0NibFp0?=
 =?utf-8?B?Z1RTK1pCWWR4Umd4Qk5RbDdLTFhIV1V0Rms3akl2OHpMN2ZqbHRJdU1KcFFU?=
 =?utf-8?B?aDhXa2YrVUYvSTNoWEdIY1NpSkhJL1plTHRMUUF3c0tXeVBmR2xNZUNMWTBP?=
 =?utf-8?B?bHpVME5JTzB3Wm5Oeiszc1ZmS3A3bitoY0FNdHZWdnkwSkZGZU1NQ0RLQVRQ?=
 =?utf-8?B?aFVxbmJXanNFTmJ4ZkFXcUxPWUt2RER6YzIveGh4cTlvS3JXZmZnK3ZoQ2dw?=
 =?utf-8?B?N1h2UHNaSFlJeGhuNXNmaFo1SlRKYTFTVURxWHJ2dG13ekpHWVFDYVUvQ3Uw?=
 =?utf-8?B?SlBXUFREN1BGSUtXQlc0dUUxVW9TZ2t1VG90NDF4L2JxS1ZhQ0dIay9mWWpG?=
 =?utf-8?B?Q2xoOFp2OUhwL2FaZjg3Ni9DMk9UT2NUcmcxd2JZMWxkN1Mrakl2V1FMb1hY?=
 =?utf-8?B?QW5oMGlBZCtJc1diN2g1c3Q5T1NCeWFiZGFtMWhzV2dGblpuVlN0SVUxOWJI?=
 =?utf-8?B?ZnRxb05hT0MxdjUyb0tvNCsyVkdDQ3pOby9JSUROWU8vZnVROWVJRTIrQlV3?=
 =?utf-8?B?S0F5OE1iRnJkcHNCbVFUUllhVlh6ZkpkYitxWDBYMTA2cU1hNzZnQ3BNZEEy?=
 =?utf-8?B?a1FMMnlJM1JqbHBYVEFUbmZaRHFKam1naGhuSWtOVU5GNW5hdUZMaE9kcUhN?=
 =?utf-8?B?VEFoQWE0SDZLNkpTcGxpQmVwck1tVmhWSGI3WEdkL2FWR3lPREZLdFh1OWgy?=
 =?utf-8?B?LzFMd1R2M1dZSXYxQkx4N3RMZjh6M3FjY01iSTFMTDRqUHJobVFMcU9PTjM0?=
 =?utf-8?B?ckxNWmo5Y2xhYm50Qlk3NnlIWkFyTmxDL0xiQlFMZmhFTXlJSVhaMmx5OCtO?=
 =?utf-8?B?SkxzaGtMRnRHYlY3a2JybG55S1d2c1ZOb2I5RzNTL1NucGhSNFNKVFpkZmJK?=
 =?utf-8?B?WU1LNWFQUWxFSU90a0JrVGpPOE9YdklFa281QUdNeTNwa3RPcDExTkp6S2l0?=
 =?utf-8?B?Wk1QZEt5Sk5EZGdyd3BQQWlSMHZSSlJkQmFycEZZQzJuN0pKZDk1SWxqRFBs?=
 =?utf-8?B?OXBvNmZORUQ5Y2tBdEFDZFU4ZHNxbnZKdWFhTXI3WSs5M3FJRjM5ZmJqWjJC?=
 =?utf-8?B?YVdRMXVxeVVTME84bDZuYjJJNTZGeVp0ZEtVZGl3R0tnMjdQd3BjOHVod1BP?=
 =?utf-8?B?L3FuN2FtWmI5SWd4MXlCcmlxcXB3cW1RQXlWbk1DazRsL20vY3B3aHIyNGVR?=
 =?utf-8?B?MDgrQUhxd2d4SFkwcGNPenFyMGlzcDF6cmN3cnU2aDdsSEM2Nmo0L3Avbmhk?=
 =?utf-8?B?S2RQU0JkbEFpYTRXWmtpdjd5TDJWcnNldEdsUE4wajZoS1M3VjhieHBldHlM?=
 =?utf-8?B?blowS1hoeDBVWXVYOVJXT1VROG1WazU2VW1IV2c2UHFNbTU4L25mdC9vU2c2?=
 =?utf-8?B?c0h1M1AzT0NrRFZtek5ScktiS0FPb3VGTzJsY2FtUHIxZ295Tzl4d2ErTk1B?=
 =?utf-8?B?MTNpYmJWWmYrZm0rREpzZHVoalR2Y1FjQ3VzaGtoTmM5UmQ0QzY1Tk1jQ1Ns?=
 =?utf-8?B?aTJ2WXEwb050YkYwYmUzK0kxdGRQaUxPSnU5NkZvRmtpUmJtbEtlVG05S1pj?=
 =?utf-8?B?OG5VMEdlSEVBZmxqV3VvYWYvZFZiSzF3YU50UGRsZUpwRFhiK2syWE9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2JBWEtRSW00KytqeWFGVlVVeHVmOXp5QTVNK2xKZ1VIRE9nR0Q5T1lXT251?=
 =?utf-8?B?L1JWU3c2ajNaMDBJSjBYZEYrUmQ1dzVBOG82UUhnZEl5RlFHc0dWUDVYT3FM?=
 =?utf-8?B?V3RVb3hLMDRqNFU3UUlPcERsbWlNM3h3NGYyRDU3LzBDMXR5dXdOYzFkOTUv?=
 =?utf-8?B?a1NaU0xtRmRzWkJrajNqT0JiWmhxVVhicC95WDdoaUJDbGVnN2xyOGR6RGNY?=
 =?utf-8?B?WkV6RXdLODEzdFlwNlBobUQrbUZvNHR2MzdPWmRRbjJxSnRkWDdJanczRVR0?=
 =?utf-8?B?OUtvVXFyZEViV1MyWktiQ0ZTT3dHbVU4YkpUTlF0cHN6QkNoM3F5ZjFwV1VS?=
 =?utf-8?B?T1BENkN1VXJaSGUyaTBiTXk4QlB3VWgyL3BwblZOWXpFeFM4bmFURTllNVBT?=
 =?utf-8?B?cEFFS2FVa1FmZWNHL01aRmJrUklJVEs0Y3pNRjVZa3BpNmM1UU1qa2dQUjJl?=
 =?utf-8?B?Mlp2TzRtb3lmRXdwK3BvK2xYeE5EZS90bHpRZUhvQU1mcVJCRWRCZEgrRm5l?=
 =?utf-8?B?ZTN1NEJRdE4rdkRGWVdXV1JNSnBWS3JNY0VWQ0J4Q0hNcXJzNkN0OHovWGh0?=
 =?utf-8?B?Tnpma2xjV05YUHNranVVT3RFYmE4NEc5ZWE4M1ZMeDQ5UDNQK0NKWG9Rbms0?=
 =?utf-8?B?ZDVHNWljM2JHaDk5Y3dPUUpmUXZPb3dPR3NMS0lIV1JlZ2hKTmtoelJKZGVH?=
 =?utf-8?B?TnVPOUFDZFRpb2JUVkphVHYyQi9JbnRaU0hZZjcyS1A0V1Bxb0Z4djdJN2ta?=
 =?utf-8?B?VXJaQlpvb05mM0RLaDBNVmFsdmpBOW5TSExnSkx3d1YwL2t3WXJNby92ZG1Y?=
 =?utf-8?B?YmNhdmh1RXFxVHFNMzJYT1JhZlRJa2dPMm91OVlYTVU0ZWl3NXEyaHgrcElQ?=
 =?utf-8?B?ZGRvSFZWUmhidTZUQVNocnEwTkRvaUMza0VxcWJ4YW9TQitIcFoydUs3UXFO?=
 =?utf-8?B?VTZwV2IrSmhCR0tLQ0l5WFhRVXZmdHpQZWt1eTV6aU9wWi9RK3F0dTNGeDdr?=
 =?utf-8?B?ZHQwaDNzcTduY0pKeklBbHVDVjBlb2tBMzAxck5SOXVZVTJqeEZaOHZwTUpS?=
 =?utf-8?B?T2hEN2FCaUdhbE1WVzRIM3JyMExuc1NIdEcxVUhqbUxYNHh5aGxjMDFLNTB4?=
 =?utf-8?B?eW8zVFMxYXFjNmJERktLSWRqQzBoeDE3V0FJK1hiTFdnSmpXOFBDM2tRZUNQ?=
 =?utf-8?B?SUUzajBrdWdWOWF1cGpjdlQvcWxDUUF3MmJSY2kzNGozRkFoZzk3blNsWUV2?=
 =?utf-8?B?Z3VYU0srVDNpZTY3d1o3SzNBaEUvd0lWSHEyL243TVI3YVBESmpUbW9YRjA4?=
 =?utf-8?B?ekFhQXhYRXJacy9RUGo2RENvZURXb1FiOHVDb2JNUmpuak5jUWxvZzBMNHA0?=
 =?utf-8?B?dWY3NnJRMDNXbjRkbDBRbmJoSmQ1NDNLUnN1SURHNzlwc1M0d0VEdloyV0xr?=
 =?utf-8?B?emF2c05iZ0o2R0NiMXAyZkUwbXNjQ2RSTjV6Yi9rY2pWaG5XbVBBOE1iSEph?=
 =?utf-8?B?OG9ya0lUTDJHSVVtZzdBdXlIZWhCT0tKQlYxQ1d3c0NNY0NvbXREbWpEemRH?=
 =?utf-8?B?NHZ3YkRYaENCaDVkeWg5bHNXTDFVcXZ1Uy9mMVhtUEZNNVhHcGk2NU5CMmtv?=
 =?utf-8?B?V0dvUVNlZWRXdkhGaHF0MlVoR29wL0dKQXRBanFOSzA1VEt2cmFVNUd2RWty?=
 =?utf-8?B?a1hkZEhUYkxwN0F5WnEzdmg5WEhTVHRPditjS3hya3hDbllib1F4QnVxYmw3?=
 =?utf-8?B?VmFWY0JjWjEvK05rL3hXYmtHWDFFV1Y4dWhIcjdJcnQyTGFsNzFiS3d3TTd4?=
 =?utf-8?B?bEpXQnhsWFVIdGRBZ3VxeGtpWDIrNHl1cmpaemNjRWNVWitrZE5FK3FDMkZv?=
 =?utf-8?B?QWtOVFYvemtvc2JZS2wyYVVQR3V1ZlF4WmVwTmVtUlNhM0ZxVkR3bGZKV1hz?=
 =?utf-8?B?MmQwRUVhbE9jTlZsVGJFckgxbVNMSStnRUhGWmQ4azk5MHF3MjZYdzM4Ukkz?=
 =?utf-8?B?a2o1b0ZLLzFTYUZVWWJpcHFTcGtReFpHaThldzFoRUVBS1dXYW5TdTBMRFkx?=
 =?utf-8?B?QnpMVGRRQjlJR3phM1ZicE1udGxtWXV4OWVhWHNCN1FWMWJFS2ZIbjFKTFJL?=
 =?utf-8?Q?rr4FGdoELKUAMrzftm8ruNNTt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c498ee-e6e3-4a07-b73e-08dce90c7c7d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:18:21.8352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lG8MwvKBEh0U99+E2xdEMPHf6EC6SHp+wwJCKBYuMHcMcgJ4r1Sno62CSDeVJk7Q9xYiUDTSD1QgLYf3got5Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8075

Hi Bertrand,

< snip>

>> 4) AoU on domain - 1) Domains should not use HVC DCC registers as Xen does not emulate them.
> Xen does not depend on that, the domain does so this is only a Xen expected behaviour and we should document that Domains shall not use it.

Agreed, we need to document somewhere that Domains shall not use 
registers like HVC_DCC, etc which are not properly emulated by Xen.

Yes, it should not be a part of AoU as Xen's behaviour is not dependent 
on it.

>
> Xen behaviour if used should be specified.
Agreed, there should be a document stating the behavior of Xen if non 
emulated registers are accessed by domains (as an example).
>
>> The AoUs can either be tested or need to be stated explicitly in the safety manual.
>>
>>> - "integrator" (word always problematic in Fusa as usually use to bail out
>>> and give responsibility to someone else) shall and shall not do (for example
>>> giving access to IOMMU registers to a domain)
>> The responsibility with the integrator lies for things which cannot be tested. For eg Xen has to be built with a particular configuration (eg SMMUv3) or a specific CPU errata. Integrator should provide at the most X amount of memory for each domain. SMMU (or any specific device) should not be assigned to a domain (which should be under Xen's control).
> Ack

>
>> For some of the AoUs which cannot be tested (eg Bootloader/Firmare needs to initialize the DDR, CNTFRQ_EL0 needs to contain the correct system counter frequency), the responsibility will lie with the integrator.
> This is an AoU on the firmware or the platform not on the integrator.

I agree that this is an AoU on firmware or platform. But we can agree 
that this AoU cannot be tested by us (within the scope of Xen's safety 
certification) as we do not know on which hardware platform Xen is 
deployed. The system integrator (or hardware manufacturer) should know 
the correct value of system counter frequency. Thus, they should be able 
to test this.

Our intention is to keep the scope of Xen's safety certification 
decoupled from a specific hardware platform. Is this making sense ?

>
>>> - interface and what we expect a domain will do with it
>> This should be covered as part of AoU on domain. We can have more examples of this in near future.
> In my mind interface are for example hypercall numbers and behaviours.
> I would not expect to find this kind of stuff as AoU.

Yes, we will be having requirements for the hypercalls. Do you mean this ?

- Ayan


