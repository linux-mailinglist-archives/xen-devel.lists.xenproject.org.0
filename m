Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D457AB7E44
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 08:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984785.1370722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFSMj-0007AC-EC; Thu, 15 May 2025 06:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984785.1370722; Thu, 15 May 2025 06:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFSMj-00077E-AV; Thu, 15 May 2025 06:46:49 +0000
Received: by outflank-mailman (input) for mailman id 984785;
 Thu, 15 May 2025 06:46:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HsD7=X7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uFSMh-0006in-PY
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 06:46:47 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cc7f4ab-3158-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 08:46:43 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MN0PR12MB5858.namprd12.prod.outlook.com (2603:10b6:208:379::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 15 May
 2025 06:46:42 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%4]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 06:46:41 +0000
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
X-Inumbo-ID: 5cc7f4ab-3158-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMplpcBxrK6kQqARv4FaC7Rkw7CxR3uGfZU8haLro7zdC4ZscZQdNMECkbm0MxhtyO2c9miUI97LKdaB37fNZMs8uuD40pYcBlYxShITLIFGx5nW7zexorutM8j5eJciXi80Rjz8uPLji1P+8y3U2vykRsGNJsJuzFNcmkVbydDhtGbFBzBf0DeC1ZBIqv1myx4BrtuTiIPPRbqTIgR21AJH3q0ztRmTDpwGT3YBqEX00qtzM7sWhztsyu1AegSV8IjtzxW/vWtYcse0BnVsXnZu36aulk9dpKqfOyYCU3vUwTf0JDjgi8qG8bc/7rEvJjur5Pmkrm/ZdVbhE95KBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SxxI1N4Y+6xmDawm3ZS8BKZzhQdt9UuahaoFkuRjb6w=;
 b=ER85F/EjG1QGKHUUGFqTA2xi5R5ZMOMAqd+Y2Aw6Ag64IDIc/AlyMYzofKzZjkhhmZGmjLebpIb8ByJ/QuahZLFers4XlLGSd3II9bBEJh0IU/sRb8y3E0dkJTm7iP0gcaKtc007mMgplw/lME2wujHKf6uK/SuUQdTvx1TtCAQ3yuGt0vMqAg3NQQY10dFo93ulVTXRaoINHeSjwVPZY4+bcx7RQrw+7KvxAigNyIjyClNkHbT7GGlEfR7KMXw9ibTESjUVAcKhR2E+qF+HCng7uA6gfq88eEUGhwIt2JeKNDhhhpXbn6VhcoD/AYD06i1ImX/W6YmC+cbJa/2vuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SxxI1N4Y+6xmDawm3ZS8BKZzhQdt9UuahaoFkuRjb6w=;
 b=mAexZxRl16FqiCw9z9VZubIkQ5rWofaUuWFWALe+XEEARVqusVcH/kRedM+tmCjBAyruW+YHrgp4glVMg3/EiwFyaKcI9cK/cLjVgaXay52v+K2KmbC9+gQVq2QzZBr+1dhUmMOjOJlVBGOHRZUq3mrHvZ+RYd+3qBCy0ZZpoA4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0c750c15-50f9-4702-9dce-a1122cf60783@amd.com>
Date: Thu, 15 May 2025 08:46:38 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] xen/dom0less: refactor architecture-specific DomU
 construction
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1747145897.git.oleksii.kurochko@gmail.com>
 <a13b414ba19c8928dc7b0e70cece6c26a77d514f.1747145897.git.oleksii.kurochko@gmail.com>
 <0acae8dd-d4d6-4d65-909d-637c4a283ea7@xen.org>
 <6ec7c286-a6c4-491b-8733-42037ba3b91a@gmail.com>
 <44143db1-1766-4851-9a0c-7428dce9087d@xen.org>
 <c8e9469f-2ee3-4b60-a580-9705f4831053@amd.com>
 <aa6a1f7c-8abf-4af0-97a0-e0e265839bd2@xen.org>
 <aed77ddd-3db9-49a9-8a51-2df50b768e24@amd.com>
 <alpine.DEB.2.22.394.2505141702120.145034@ubuntu-linux-20-04-desktop>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2505141702120.145034@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0350.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::12) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MN0PR12MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb0ca1c-5530-4e9e-c5da-08dd937c4002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWo2eTZocCtMSWxkUVlxbEVldFRtTzd5UnpscElKbXByS2wwWklqVGUwSU9D?=
 =?utf-8?B?RjNPcmMwN3V0SnZBQWdNeWQwVUxMM0FEa3lBRzIwWGNGWFhMd3dYbjFMSkhY?=
 =?utf-8?B?T0ROSmc4OUZzc0JBZTI3dnEwdTdxVXdxdnJvTlJNZ0pUVXhEVHhWcHphVVdj?=
 =?utf-8?B?SU9TZUJmWWlaL2VORlJkOXo2eWVQWWJ3V2U0ZUZMeW52UkFsdkV4REExdTdz?=
 =?utf-8?B?ZUtVMlhoNURRMkdpaWErUE8yRXJ6M2p0V1AxSm5qVjFNMGdnS05sQ2RDdHph?=
 =?utf-8?B?KzFBcFczME1xbjJnSEJYa3JIK1U0ZWlzZjFwSFhXTVFNNUcwVC90U215NHM4?=
 =?utf-8?B?dUVEVEllV2FaVXo4ZHpKdVhWcGVWUVVhN2RBRVNCREJwQXhDTGZ6K3JqSW1R?=
 =?utf-8?B?dFlPQzRTRnNvRGtOYWQ4Yk1rSjl1TnlvRHltdkZuNzFGT1RxVVVrS1hvNkhR?=
 =?utf-8?B?T2dUSWxnTUxBaU1MQitpY2xJTTdVdGdmSVVEcDFIb2E0Rk9zdnJyaUo5ODVK?=
 =?utf-8?B?NGF3RElJVzVtKzRpTWdGalZMbFJPZFFVR1I5WjA0WWkwK2VYd2w3cHpPWklY?=
 =?utf-8?B?aVNkSmtnd0t5Z1JWS05sQlBsR1NkWGZlSUtZL3d1MmlhaFRQZXJoOVZyUjhY?=
 =?utf-8?B?WUtiUS9RZWhJSk5RQXNVSEpIMUluSER4YUpJZVpaQUpjUjhhVFhZWU0xU05E?=
 =?utf-8?B?MGNySjJ3bUorU25YNmZCOXZkUDBKNzVYRHlUYTMvNWtEMzFYdWJNQzBBZWVX?=
 =?utf-8?B?ekwyUWsydXpjbnd5TFBZY1JWaG42Z3FrN0dVSVhTUk4zZm8xLzBCeXNzZ3pv?=
 =?utf-8?B?T1B4R2FYaStoOVRBZXBHYUtSN0tteVN3d094WnRHRnM4ejI2bXB3YWNkTTNO?=
 =?utf-8?B?ZzhaQk9oTTZwaDdZR0pCdFNVWmg2UHBrc2dUOXNRSDVJK3c0L2lUajFYbUZo?=
 =?utf-8?B?alZQM3FQUTBWZWJtWmovSEVEVzczdWN4Q1hZZ0FCQW45NDRuNkFOTHA4di9B?=
 =?utf-8?B?ZzNlekJ5YkIwczF3UTIzMCtleGJVcDNZUnFweUo2bmJ3NDVWMHZOSVB6YmtT?=
 =?utf-8?B?UmhBdUcyeFhkZkdCU1FqKzJZZFB3MVZwUDlUVlN1UFBaZ1F2TEs0RlpvUDkw?=
 =?utf-8?B?REM1cTVUdEVzdGU5YXBOWGZHU0pFczVKRkh1bGRzbFZVbUdjakpIbGRiNWZi?=
 =?utf-8?B?NTVyemRKVXZ2VW9iNlVsUmRIMWI1bDk2ZmxZb0RkSWdoWURSM2plbFZzZTdS?=
 =?utf-8?B?VjZaUHRFUDNuTXk4c2M2aWYzRGgvdXRNRTVybUd3cE9BM09HbjhiWlAzVjE5?=
 =?utf-8?B?empuMXBxdmpQWER1ckp4K2k3dXl4UGhLanVrSVNGNE5nVXpDVE1qU3ZhVFF3?=
 =?utf-8?B?OHFBbDVuYW5nUCs0YVBZQWc5eGhmZ1pIT1c4dkRpaGRUZkJPK2tPbm10YVE1?=
 =?utf-8?B?Rm81bGF3bjRJcHVNYUx2dDI1ZkR5NjdvK0xDeEpWSERnVWhoSDBkeFVpSzVu?=
 =?utf-8?B?c3cyc3dXcFVrOHVJQnF0bndoNlZmK3VSMnA1MWYzdzNBZy9rVEEyRTJlNTdF?=
 =?utf-8?B?L2pTc04zcGIrS2Z1STVqY0J4VlFEOTZ4NDVwTU51SFZJYzVuTGxuZFhTSnlB?=
 =?utf-8?B?TWZlc3J1b3A2Ui8rWW5FVVMvdDExQ0RKbTlra1d0TTQvYjVSakJxNjMwNkh4?=
 =?utf-8?B?M28zdUZBcTFkdVBWanZpbGJmYUZ4SlEzTFlBQVdOR2gvek92cU5pWjRYKy9s?=
 =?utf-8?B?cjA2eExTWW9iWHM3NmRsZjdHUVNGTHdabzdYY0VJNmliZld4ZHc0L2dzVGUv?=
 =?utf-8?B?ZXdyT1I5eUpYajFXUjJzdGhVMFpqRmNJV2k4QkpQVU91c20wVXZTSXlDcWYx?=
 =?utf-8?B?WE9wZC9qdHg1anFQMlRGVlNyN1lqeGZIcm45Zy9pZStOTGtZSjNBN2xPOHNT?=
 =?utf-8?Q?j6SbdlMCsFI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTNlbW9mQmVXanFBcmdhMUVkZHZPSlpITG0yOFVNOHc1bjFBNjNEVHducnpZ?=
 =?utf-8?B?VXJLWXBxTEozUWc1TWlvS3NUZFNoRHRyem1BUW9DL1BPWWVDaXN0VzhlTDRJ?=
 =?utf-8?B?ZkcraE5Qa0FaSGkvVURKOGZ4Vkx3Tjl5T2FtSU1nQ0JCRFQrb0F6QWdaQlhz?=
 =?utf-8?B?cG5lY3JMV0E0dTlHbjlEOVNWSTZ4OTdxR2tHUXVHU0R2ckRLeEpXUlhiWER1?=
 =?utf-8?B?bFFKOHorcnBnUldWcitDM3kvenE0Y2YyTkt3UmdKK3RnMVl5L2ttTTA1Rlpi?=
 =?utf-8?B?Z3BEekxEeEdFU0xMWnJxU29tNlVTYXE2Q25HanRQaG8rMnZRMVFUdEJJOFBI?=
 =?utf-8?B?NENBczAyOXI4K216dUVmSS9pOUNpQjNEV292YjZkZkNMdXh4TUFTUXNyem8z?=
 =?utf-8?B?OXZZUTVhbkZXa21oNm1GVUhMbGdRNk8yc1BiandhWFpQWXVNVHZvUlFBTWhw?=
 =?utf-8?B?L3NNRmZxL1RpNjJ6WWdLVGJ1TElrOFBHaEl2Vm5DM1ZndHZnWTBHekFhWndz?=
 =?utf-8?B?VkMwTitKd3BWVEllUGNzN1pQVVhVdEZxekJYTENrQ25DTG5BNThvM21sVEg2?=
 =?utf-8?B?YzA3RmRKbitKMk5pZHlDd0IrdUlERGVMRUNieE16ZEhhMkRldWNZT0VSYitX?=
 =?utf-8?B?Zmx1MjJCZEdkNHBzcVltTjFOaUpCb0NPRHJ0ekRDODdkSGNZQ1hvMGFoOXd6?=
 =?utf-8?B?NzZuUDN1aGwwdldRSXpYMUlsK1g5KzgxbGI3VEY5cmpVdVhVaDdnVU9tYVFz?=
 =?utf-8?B?em5mWmZGbzNCV3hCUXF1bzR4ZHg5YTBDNzRxWDZLM25HV3E2dGNOMWFNajMy?=
 =?utf-8?B?NnordzI5dHJ5WVZNZVpZenRjdEp1Z0JSZmJhbExjNnluUEJ3MnU5Y0tyeVBP?=
 =?utf-8?B?dFhOV3VZRW9WWUNtVDBlT0VFSWNVOXdRTkJIYVJkTXV2VDBsY3Vhbi9qckRX?=
 =?utf-8?B?UGVQUE5sZWZ3a0VmNVd6ZGd3MkUrRVd2NUIxN2t0dEYyWExkaUh1SExxS1E1?=
 =?utf-8?B?OXhEUHZEY0lsVjNPWjBCOTNmS3hySW5iZDZFMWVlRUYrN3NVZTR1VVRVRzlp?=
 =?utf-8?B?Slo5eTJ3eGFuU2NRcDJhdE80azlKYk1FcWNsS2hUZ2xNbGh3aUxqTGhjejcw?=
 =?utf-8?B?Z1g3VVFwcUlNb1pnOEFVcVIxNHhCMGJqclYybTZ2VWZLZllQNDlpMENvb0tW?=
 =?utf-8?B?VTlmcSsxcWV2VlJ1U3p5bkNNUktzN3E2YzU4K3k5VHRBR0VIOC9pUnJRT2dD?=
 =?utf-8?B?YmZaSkFQNllUOHpGOVplZ0lPNUxNb0YzL0cvY1NWeHZLMVpROWJBMlVwQy9Z?=
 =?utf-8?B?TEpmQUtiN2g1TDFEZzV1Q0RHSVp5R25CUWZPUzZ5dTVXMEFRbmF1eUtDRzNl?=
 =?utf-8?B?Tk00Nk4vSlNFWXBCWS8wQlRTWjVKNTNlVXUvT0ZYVFFZRzdoQXcxVkF5dSsw?=
 =?utf-8?B?TDdWQzFHaUFnRkFLSjRSQkg1SnIzeXRmbm4wS3c2OTRUSndMVHFZcnk4NjhB?=
 =?utf-8?B?NFgwVFpPSy9UTG42Z2J2eVEybVN5SlpPdmpqYkpoWWhqSEV0L04xQXdJSFpo?=
 =?utf-8?B?bURVbTUxRGFDcUY5MU1YekptWHQrL1JpREZmVkQ3UllMNU42c3hFSW9rYnFE?=
 =?utf-8?B?T2tNQmc0Rm5sckw0cmtLckU5UVlYMUUyRndTRFBrODlOZDA0Zi9QaFJQMEp2?=
 =?utf-8?B?d0J4RDc4MUhiVWVhRklub0tYL1lBay9YeVdXQlpUUzduTUxteDl2bWtUdWxl?=
 =?utf-8?B?ZTNLcTdzSFpTUGYrZGV4SHZUK0p2ZDVxQlM2ZTdOaTl3WkJwVzhPZHhic0Vi?=
 =?utf-8?B?M0hvUkhrdmxmN211SVA0OEZ1aXFyUmg3dEtKMUpWaEdiakxRcEpKSDJuSW82?=
 =?utf-8?B?ZHBBRVdmY2kyZWllYlh3VWlCZEdSMmM4aUpMaHVFKzVuMTMwTGVtSUlCTWxQ?=
 =?utf-8?B?bU8vb3kxWUxuQndOb0xPUFNuajFRem5CRnh6RGcvYnZ6YTNYWU82MCtWdkJr?=
 =?utf-8?B?ZWhLM29ZUGpld1RnUXVtWUVJWkxDV0lxRW8rTDFoei9qWkFOTVlYcDVVaWI4?=
 =?utf-8?B?L0labkxTQUNLTDhPMW9penBSUHloaVdBbmJldUswbDM1ZStlNjZNRkZtbC9V?=
 =?utf-8?Q?vUU8+i/uPmBpJuuPrCXJW7zGO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb0ca1c-5530-4e9e-c5da-08dd937c4002
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 06:46:41.7310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iczzTwRuZo0RWmIs3bAEUVuJd6dXJ7FQ/GtPSCTYuIDoz7nLrM1r5bbZaRHMGyE5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5858



On 15/05/2025 02:07, Stefano Stabellini wrote:
> On Wed, 14 May 2025, Orzel, Michal wrote:
>>> Sure. But my point is rather more that static memory is not a feature 
>>> described by the Arm Arm. Instead, it is a feature of Xen that is ti to 
>>> device-tree. So inherently there is no reason to be implemented in arch/arm.
>> I agree, it can and should be made common. But exposing only callers makes no
>> sense at all for me. Callers should be exposed together with feature code movement.
> 
> [...]
> 
>>>>> back to Arm for then moving back to common potentially in a few weeks time.
>>>> What about static memory code? With the recent Oleksii code movement, the inline
>>>> helpers like allocate_static_memory() became unreachable when the feature is
>>>> disabled and the main purpose for helpers was to avoid ifdefery.
>>>
>>> Sorry I am not sure which part you are referring to.
>> With the current code, allocate_static_memory(), assign_static_memory_11()
>> callers (that were moved to common) are protected with #ifdef. This causes the
>> helpers defined in case CONFIG_STATIC_MEMORY is not defined to be unreachable
>> (see static-memory.h).
> 
> At a high level I agree with Julien, this is the kind of feature that
> should be common. In fact, I would even say that I consider the related
> device tree bindings common.  But looking at the code movements and the
> #ifdef's, I think that as of today, this patch series is improving
> things.
I've said multiple times already that I also agree that static mem/shmem should
be common. It was not the point of this discussion. My only concern is that it
should be done in a proper way and not in 5% like it was done recently that also
resulted in issues I mentioned above. Therefore I also (hence my tag) believe we
should accept it.

~Michal


