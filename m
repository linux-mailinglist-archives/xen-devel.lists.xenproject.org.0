Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vgIdOpLHfGn3OgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C9ABBD5F
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 16:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217649.1527029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyh-0007hd-5R; Fri, 30 Jan 2026 15:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217649.1527029; Fri, 30 Jan 2026 15:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlpyh-0007ep-2b; Fri, 30 Jan 2026 15:00:07 +0000
Received: by outflank-mailman (input) for mailman id 1217649;
 Fri, 30 Jan 2026 15:00:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u48w=AD=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1vlpyf-0007Ra-A5
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 15:00:05 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f70d9df-fdec-11f0-9ccf-f158ae23cfc8;
 Fri, 30 Jan 2026 15:59:45 +0100 (CET)
Received: from CH7PR03MB7860.namprd03.prod.outlook.com (2603:10b6:610:24e::14)
 by BY5PR03MB5329.namprd03.prod.outlook.com (2603:10b6:a03:22a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 14:59:41 +0000
Received: from CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343]) by CH7PR03MB7860.namprd03.prod.outlook.com
 ([fe80::f5ba:35df:1c9f:b343%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 14:59:41 +0000
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
X-Inumbo-ID: 4f70d9df-fdec-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2x1IMFuX7Zomi/n4dSqdxB0Xsl9uqQuppmyVkLG617Yj/DiQXg+SwzXErTpvo5RlHTuGPK1kTyRNaru1yOsqyflUWCvrO/oF3L3NqGrbtA8ffU5ETFOVOwuEgtTdUfSFhJgaVuhQcDar5/zRmGAqV41lsBPPpFREpIFMWJgoNBCZIYOGXTKZ/IDrt/QcW08bPyH5eifj1zPv3sfrF82oYRjUG7XBotPDVSxZ039KYlHyXly6JHYgQbOrg0m/RMPXM9Lm/uRCt6if5dq9DGw7oRQZz4w+c3us2dqGNUqnoLhXkNfnYmx7FrV8FkbNuUU8HFQwXNjL0TPBj3D6D+NLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meYD0sEYsHml9Llwi+NW6eF01LWKICbMJckmF1mY/m0=;
 b=VAyzHajGiZylf3mnDaSM40Trx9ljutGbBjTfmrOW5sqnxoRYVI8auXVeffHczylFXqvXRCjA0X3S1J9lHitT+IvLyxb+jAIeaXI1C3r20xSg/M39LrlRBXG73W5YSufIB9mjStyH3yNbEuazGp6cQ9GlQfDmMAnSnWV4xrU31RJVT8hcoCwLa67UGvu//Vx3F5sZ1MYxxR+VQNCt/2eprEiVlJaKtkGfYt/+o1fpbyn4C9fBBHIEg03Weo4sgPk58I6ZpreyXyiMw8rjSIKtFUfXmRKhkTUsKqdnSkO2Ukase+YYy69hmVOyvwa/4KSGF4Cit1X/RW90NN9uYFJJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meYD0sEYsHml9Llwi+NW6eF01LWKICbMJckmF1mY/m0=;
 b=AxHgvW97gqJIJiM/oWIoCFK5AGXJnwHSxC6geyWrbs95xsoQwKU55BzOZvHbOOqsZtbPbBezg3c1YxGA2Yi6Ob9mEZzWqMcIjdw0hPFdZOVAa4UEN8M9maaLyaM5ppTKTqEgaKJNLexbyoXRFP/K6280YTKtChtp0RVw4quuAqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v5 1/4] xen/mm: remove aliasing of PGC_need_scrub over PGC_allocated
Date: Fri, 30 Jan 2026 15:57:23 +0100
Message-ID: <20260130145726.85907-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260130145726.85907-1-roger.pau@citrix.com>
References: <20260130145726.85907-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0152.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::15) To CH7PR03MB7860.namprd03.prod.outlook.com
 (2603:10b6:610:24e::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH7PR03MB7860:EE_|BY5PR03MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f45895-a2e0-4f78-53e5-08de60103102
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YVZ4RFZXWE9ZL3dBUXlzRWY0NlhSbGhYNTVNK2VCc3V3clFLMFVwVFRJM1U1?=
 =?utf-8?B?cnNyb2JVcDByOTVyZ0JMZHhlMlBHb05RWDBGelZiZzEzWmZqbHRVaVVRU3JY?=
 =?utf-8?B?T0dSdGllK3QvelFPcm5aOGIrOEFkYmd4OHpMNzdVT3I2K2pZOWVTemJvM2s1?=
 =?utf-8?B?eHZESFNKUUp1REJIYmhXTzNCR1JoRXJDeG92MGZGU3RsMFVTeWhXOHdGVzEw?=
 =?utf-8?B?UTE3VUxEdUtYalBSdnZBdDYvYXk0L21Va3FJQmdqcjdIQnR0MVRnaUhBL1NY?=
 =?utf-8?B?ZHZmSCtFK2Q2aTNHa2lhc1NyVGlDWmRGeUFlbmRndDNWNy9zM1hyZTNDaWVY?=
 =?utf-8?B?RTc2MFhiUjN2Z3J1blJFU0FvUEg0N3J1UUM5ME56Znd1NzNNQ1dvS2dXMkR4?=
 =?utf-8?B?NU5qTHl2akpGNmMyeE5ickdBbXY1T3lYUHhvcXhKY3BtR2tBREczcWJFSElj?=
 =?utf-8?B?TGxPVWxOWUJ3ODdDSXlwNHV6QlRsT3pkYzZxVk5CcG4wUHN2eFpWTTNzZU5q?=
 =?utf-8?B?NkdpbG9ueW92Tkt0bXR0QkVkdHowMmowamczUDVaOHVJczRtWTFSSW10Uk9o?=
 =?utf-8?B?eERWQWNvdVRRS2FyMXl6QlhhemlxMmtMMWRUdUNLUmNvYmhrTjArUmdFYUVM?=
 =?utf-8?B?OC9hUElvaWlGSE5jb1ZhZnFtcGYwdm5RcUE0VFNvMUR4R2dNUVFDSTBmeFl0?=
 =?utf-8?B?TXFHYnpRcmYwZDFJbG05RVp5YjFNdE1UVkZKNzVaU3pKeG1TbC9aM2tkMmNP?=
 =?utf-8?B?NFIzam51aExXc2txeS9NMHA3R3l1NEJqc3ZkV09Wbm5YYkxRNzBYQnp0RFFn?=
 =?utf-8?B?NXFhaEFwdWl6dktOclpJMmdCS0hxUnhyRXpGMVY0QW1TWkZwNTZjejFiWGw0?=
 =?utf-8?B?SzkwUlhKYzlsakNXMTA2TmRhVjhCUWJ0V3hwdCtVTFQzQ3psK01tV3RwaFpH?=
 =?utf-8?B?eTczYzhEK3k1aUQ1SFc5TkJncXNpa2pMSmZKVERSaWt0bjdUWmR2NGc4SEJi?=
 =?utf-8?B?MlhXTStydVJJdmFsOXRucHUvL3VlbHFvOWk1TDkrQVhtREtXYVZBWmxNN3Vp?=
 =?utf-8?B?VE56Q2xGcFdiTm9lRUJCdk9ia1dKSUkwenUvMXprSHpvZFFUdnd3Yjh1UUoz?=
 =?utf-8?B?RWFldlJmR1JWS0Nkd0FEcmlTa2pSbzE0L3lLazlsbjB1UXV4eHNVNklVYVRY?=
 =?utf-8?B?aEk3MnBZRWtmcDR3cmpFQmdlZmZGSkNqTVJCV2puZENMTmZ4VUpQUmpZRGhJ?=
 =?utf-8?B?OS8vSm1lcEFUZzlUSzgzQ255bUlWVmp2QXp1VjJWQzVSZmpqNng5S3ZmSE94?=
 =?utf-8?B?Q0FGdC8wdEFvdUIwQi9nVTc1TEVXWkNpVEs0RUtoQkdLUkhUTFRpRHI2NFBu?=
 =?utf-8?B?YmZjcmk4RFdqQ3VBUXJzaUV1NXhabFVKb21vVkdWcmtNZFJhbklHYkszUTRC?=
 =?utf-8?B?TldWTGY5ZW16bGpVVXdKbDE0QUFETGRzVkJuN0JoYThzT3J2RVFaVmdoaHdF?=
 =?utf-8?B?L0ZNdTIwRjJmRG0xVGlKQ1ZRdjNVbkdtUFNZcGRjWGEvaG4rZmkyQW0vLzU3?=
 =?utf-8?B?VWNZVytYSVR4d05xdzU2citTU24vcmVOSXlGSC9LZ1pwbUIvcHl1Z0Q4WDVt?=
 =?utf-8?B?Y0Q0SVYyZVBUK2g1eWpvMm1zNXlPeC9rWDdieW51c0duUFFsK1BnMmx5dDVX?=
 =?utf-8?B?NE9jTGRTN0JGcmlpMGpOQUhRVHAzRHBDVHV5K0EwVnpWZlhQKzRRQmhJZnVS?=
 =?utf-8?B?SDVnNXM0enhtNUNoT3NZc01Pc0JEa0xoMklra0N1RkgzL2k3djJEQ3NKZkJX?=
 =?utf-8?B?UGR5KzlUYmovUzBvWUhxWjYzVTE4WkRwWVl1dDdHc1lGdytIZ21kd0lFWS9X?=
 =?utf-8?B?NXZUbU96VUtxYW9VU2I1dklRazVkVmlMaTlIUUJhcjhzVW5CVkZDSG9DV3dY?=
 =?utf-8?B?SEVMYmVCY0I0dWRCLy9Ball2VjBVdTRuUENZbnQzWHl0MzdUQUhxMVB0SFND?=
 =?utf-8?B?czZzNkR0dDhEdGtHNk1vY29jK0xObXczNTlIcmlXTFAzbnExUlRsbUVYQ1JY?=
 =?utf-8?B?eGNLbFBra1pvWk02Z0prM1l2aDF2b3oyd0IwbTZxSXM0eVAvalRjc1Bsc0FI?=
 =?utf-8?Q?Ygno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH7PR03MB7860.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWtxenFrMFc3eDNLR3ovaHZkTlVPZ09mZ0dxUDhnMGZ2SVhZdkVZTlAyMDRl?=
 =?utf-8?B?cWNMbjZ1RG9oejZleDJhVkhwMFRUbmwzeUFFVGN3NWdpM3oxWVF0Y0JRV2lL?=
 =?utf-8?B?UU9Ja2hVQWI0Zk5mQWFrNHNXOGpVQnpZK2NEN21yT2UyTWtFaW53WkVYUE9r?=
 =?utf-8?B?U1pvdU1iYjQzVEFBcy8vNXQ3K2YwVEhoYlcxSnhZUGZ2UDNCZ3I2TTB0MTha?=
 =?utf-8?B?MEQ5MjNaNHNweUg2Z2lwYXF4SE5VdE55ZjFsczZJMmtqaVBDZzFwdllJU3FX?=
 =?utf-8?B?VXp2bUoyUFZ2Zjh4dUtVeExWUEZHR0pWZGR4RE0zdEhUaHJmNTRVaWFDUXIx?=
 =?utf-8?B?K0NKMC9jZnp1cGkzcXlScXEyY01XOFhXaGVRckxlKzBIMzcydG0wMXdPTWtC?=
 =?utf-8?B?VnRGS1AvN2dQdGkyWFdWOEN4cWkzeTZ5dzByNVU2YjE5YkN5K09pRzhKd0RG?=
 =?utf-8?B?dUVQVnE0UlFMejV2bzU0QTAzSmY0cFlUeWowS3ZOSEdYODNJTlBWT3MvbVJp?=
 =?utf-8?B?VGg1VWFGY054Qmg4MDMxTVl3enlNRnJWYVNsT2QycHJ0U21nN3Y5Zk9xdGRr?=
 =?utf-8?B?ZGVjeWZJTG8raEo1U3Q0eXdjOThsV2V3Z01IMU8vS28xWXdrdy9Oa01pN2hJ?=
 =?utf-8?B?VWFBeThBY3RTM3JOWHA5Y2o3RTlheVhxNkg4U3dhNDFQeENQUHhKWVp6Zmtq?=
 =?utf-8?B?MjlRck1BNnY3OVFXWFltK0RkRHR6YnFoYW53Z3VqT0R3MklaOW5Xc2hpTGY5?=
 =?utf-8?B?Z21ydG4reU43cDRwdlFCUkMycGYxT3M5Y1BNNkRkOWJzd2FGaTZ2aURUU1M1?=
 =?utf-8?B?NGFJNExuT1kvL3RFY2JROExBTG9SeXlMZ0RIYlRFb0laVFBCMGlyQkVHcVhP?=
 =?utf-8?B?L0h6M0VNMWJRVHhLNUlFV1NvNHhuMFRkQTN0dnZwVGhMZk9KdzVCL0lxREhE?=
 =?utf-8?B?cUJZR0VUbzdpOWxnTlpSV0FYeXNsdVFWd3B2bTAzcXpYU2NPUnR1dkY5N09R?=
 =?utf-8?B?QVRyamRnNkhobWEreGhSQytXZWlCUXV4Tm5GWlAvNnVGSnFKbmc4a2ZxTnVi?=
 =?utf-8?B?ZDdXdHVJdnFuWGl4THNjRmhIRDh4ZytoMjJEVDdEeGppRXMyUHVkN0dJS2RP?=
 =?utf-8?B?bmxOSGRaNitTWmw1R1lGUjlRUXpEUmVWd2tVclphWDROYUFlVlhQbW9QOWdw?=
 =?utf-8?B?U0R4ZkJQWUd2OEpBcUsxUE82YjdHYTNQaDNaTVh1SnJKVWI3dS85YTFxSHVs?=
 =?utf-8?B?WUx5ZUlGMng4S1M1bFBOamFzMkVwVkVreElIK1VBK3VlZTJVM0k2MGFZTGJW?=
 =?utf-8?B?QjQzTitrMzVVa0piWk9DM2lmWlZIcitQa0R6Ym0vUHZDNnJKUkhid3FFVVI3?=
 =?utf-8?B?bVZMNTd3OHpBcDg2a3pWMWlLVnd5czZFTnVxUWZ5M2YrTkY4eWZCOVNVRlQ0?=
 =?utf-8?B?ZnNXMjhFeGJwM2Y2V2kyaC9vdVZNMkp5M290UEN2LzFUTk1Bc245QURMSWw2?=
 =?utf-8?B?T2haUmRFd1c4VEhKZ2pGQW9yQzcva250L3ZZWTcyREdWeWRnd1FpQng5a2t5?=
 =?utf-8?B?VThpUFFnY2czcEpBRkN0RGF4b041UVdzZ3NVK29OOG10QlMxcE9hV0hvR01o?=
 =?utf-8?B?T3dNZk9xZFFSMVNlZE8ycWNqeDZBUmp3V29sMEN1d1VER2xQU3A1clJPNWl0?=
 =?utf-8?B?dlFUaVpneGQvZGNJZUVld0VLSWV5RHYwamJ1dkhmZHZybHNsYUJzT09WNlhh?=
 =?utf-8?B?T1I0Qjl5OVE1bEhWc0RwM0NRM1gzcmNSb1NUd2hiVGdoQzh1KzB3YURSY25z?=
 =?utf-8?B?YnRaWGpuYTgrY1BpTGY4Rmp4RE1hcG5Nbyt3WHRCY0hGYms0cWdZM211dC8z?=
 =?utf-8?B?NG5mQk9QbHh0R2RESFNac1hvU1R3dWh3M0RZQndlQVNVVXpTTmw3SXRqQ3Nh?=
 =?utf-8?B?T0JEa0VLSlIzeEo3cFdTd2h1SHVOK1dkU3NKdlBxZWJMKzA1d1I4OU5XRGo0?=
 =?utf-8?B?bmpIN2Q4aWtHb1VBeXhEZVFTcXp1OVVMOXdUaVJ2ZFdwL3Z3dUt4V2wxZjRw?=
 =?utf-8?B?UzJNMnZSTm9hN0swcURyWlROSFc1c3JhUkE1MUJaYk0xaGFCVzhDejhxd1JN?=
 =?utf-8?B?RUI3b0huSU5CZDNGVmVlVmg4N1VBaFRmOUVHV0ZSQ2FmQjdOd2U0U1dwc0Qz?=
 =?utf-8?B?RnpoZWhkVDJ3K3RkeFhiQTVMc1FqYmFnd0hHUkxJZnEzQVRpSTZuaCtjdU14?=
 =?utf-8?B?NTRlU0pPdklqMTNsVmI3aHp0ZHpmanhEWDNYV0U3WEs3dC9mUXQwbWN6OUZX?=
 =?utf-8?B?YUVnQjBiTTdVbHdTSWUxVTRsbjEzRnRPTUVkK0R2c3VxbnUxVDBOQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f45895-a2e0-4f78-53e5-08de60103102
X-MS-Exchange-CrossTenant-AuthSource: CH7PR03MB7860.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 14:59:39.3222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JJIL+QLsWl47x+eDHwRi8vwVzLNKDMq1Kifpr33mQupXwsfHvluV+/qYCvJCFrQ12dHmBxQzupF8dnJ9cOhKQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5329
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,vates.tech,suse.com,raptorengineering.com,wdc.com,gmail.com];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MAILSPIKE_FAIL(0.00)[192.237.175.120:query timed out];
	FROM_NEQ_ENVFROM(0.00)[roger.pau@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E9C9ABBD5F
X-Rspamd-Action: no action

Future changes will care about the state of the PGC_need_scrub flag even
when pages have the PGC_allocated set, and hence it's no longer possible to
alias both values.  Also introduce PGC_need_scrub to the set of preserved
flags, so it's not dropped by assign_pages().

No functional change intended, albeit the page counter on x86 looses a bit.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v4:
 - New in this version.
---
The PGC space on arches different than x86 is not compact, so I've just
used a hole in those.
---
 xen/arch/arm/include/asm/mm.h   | 10 +++-------
 xen/arch/ppc/include/asm/mm.h   | 10 +++-------
 xen/arch/riscv/include/asm/mm.h | 10 +++-------
 xen/arch/x86/include/asm/mm.h   | 18 +++++++-----------
 xen/common/page_alloc.c         |  2 +-
 5 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index ec2d2dc5372a..72a692862420 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -144,6 +144,9 @@ struct page_info
 #define _PGC_colored      PG_shift(4)
 #define PGC_colored       PG_mask(1, 4)
 #endif
+/* Page needs to be scrubbed. */
+#define _PGC_need_scrub   PG_shift(5)
+#define PGC_need_scrub    PG_mask(1, 5)
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
@@ -163,13 +166,6 @@ struct page_info
 #define PGC_count_width   PG_shift(10)
 #define PGC_count_mask    ((1UL<<PGC_count_width)-1)
 
-/*
- * Page needs to be scrubbed. Since this bit can only be set on a page that is
- * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
- */
-#define _PGC_need_scrub   _PGC_allocated
-#define PGC_need_scrub    PGC_allocated
-
 #if defined(CONFIG_ARM_64) || defined(CONFIG_MPU)
 #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
 #define is_xen_heap_mfn(mfn) \
diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
index 91c405876bd0..402d06bdaa9f 100644
--- a/xen/arch/ppc/include/asm/mm.h
+++ b/xen/arch/ppc/include/asm/mm.h
@@ -57,6 +57,9 @@ static inline struct page_info *virt_to_page(const void *v)
 /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
+/* Page needs to be scrubbed. */
+#define _PGC_need_scrub   PG_shift(3)
+#define PGC_need_scrub    PG_mask(1, 3)
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
 #define PGC_broken        PG_mask(1, 7)
@@ -75,13 +78,6 @@ static inline struct page_info *virt_to_page(const void *v)
 #define PGC_count_width   PG_shift(10)
 #define PGC_count_mask    ((1UL<<PGC_count_width)-1)
 
-/*
- * Page needs to be scrubbed. Since this bit can only be set on a page that is
- * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
- */
-#define _PGC_need_scrub   _PGC_allocated
-#define PGC_need_scrub    PGC_allocated
-
 #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
 #define is_xen_heap_mfn(mfn) \
     (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index a005d0247a6f..9e28c2495462 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -273,13 +273,6 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define PGT_count_width   PG_shift(2)
 #define PGT_count_mask    ((1UL << PGT_count_width) - 1)
 
-/*
- * Page needs to be scrubbed. Since this bit can only be set on a page that is
- * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
- */
-#define _PGC_need_scrub   _PGC_allocated
-#define PGC_need_scrub    PGC_allocated
-
 /* Cleared when the owning guest 'frees' this page. */
 #define _PGC_allocated    PG_shift(1)
 #define PGC_allocated     PG_mask(1, 1)
@@ -293,6 +286,9 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #else
 #define PGC_static     0
 #endif
+/* Page needs to be scrubbed. */
+#define _PGC_need_scrub   PG_shift(4)
+#define PGC_need_scrub    PG_mask(1, 4)
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
 #define PGC_broken        PG_mask(1, 7)
diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
index 419fa17a4373..06c20ab8de33 100644
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -83,29 +83,25 @@
 #define PGC_state_offlined  PG_mask(2, 6)
 #define PGC_state_free      PG_mask(3, 6)
 #define page_state_is(pg, st) (((pg)->count_info&PGC_state) == PGC_state_##st)
+/* Page needs to be scrubbed. */
+#define _PGC_need_scrub   PG_shift(7)
+#define PGC_need_scrub    PG_mask(1, 7)
 #ifdef CONFIG_SHADOW_PAGING
  /* Set when a page table page has been shadowed. */
-#define _PGC_shadowed_pt  PG_shift(7)
-#define PGC_shadowed_pt   PG_mask(1, 7)
+#define _PGC_shadowed_pt  PG_shift(8)
+#define PGC_shadowed_pt   PG_mask(1, 8)
 #else
 #define PGC_shadowed_pt   0
 #endif
 
 /* Count of references to this frame. */
 #if PGC_shadowed_pt
-#define PGC_count_width   PG_shift(7)
+#define PGC_count_width   PG_shift(8)
 #else
-#define PGC_count_width   PG_shift(6)
+#define PGC_count_width   PG_shift(7)
 #endif
 #define PGC_count_mask    ((1UL<<PGC_count_width)-1)
 
-/*
- * Page needs to be scrubbed. Since this bit can only be set on a page that is
- * free (i.e. in PGC_state_free) we can reuse PGC_allocated bit.
- */
-#define _PGC_need_scrub   _PGC_allocated
-#define PGC_need_scrub    PGC_allocated
-
 #ifndef CONFIG_BIGMEM
 /*
  * This definition is solely for the use in struct page_info (and
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2efc11ce095f..2ee249ac365a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -170,7 +170,7 @@
 /*
  * Flags that are preserved in assign_pages() (and only there)
  */
-#define PGC_preserved (PGC_extra | PGC_static | PGC_colored)
+#define PGC_preserved (PGC_extra | PGC_static | PGC_colored | PGC_need_scrub)
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
-- 
2.51.0


