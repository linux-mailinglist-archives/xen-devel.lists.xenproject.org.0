Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93270A64751
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916397.1321502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6n3-0002ci-Hi; Mon, 17 Mar 2025 09:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916397.1321502; Mon, 17 Mar 2025 09:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6n3-0002Zq-EK; Mon, 17 Mar 2025 09:29:45 +0000
Received: by outflank-mailman (input) for mailman id 916397;
 Mon, 17 Mar 2025 09:29:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WXuz=WE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tu6n2-0002M5-CA
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:29:44 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f403:240a::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59cf69e2-0312-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 10:29:41 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB7548.namprd12.prod.outlook.com (2603:10b6:610:144::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 09:29:37 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:29:37 +0000
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
X-Inumbo-ID: 59cf69e2-0312-11f0-9aba-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUWl1fAHh9SnU2prnB2BiAsbTuUNJGdfB49+9/FORq1zueDmv8EUmNFp1f9KY+8NryfPQMykZBTxMYm8SkKQwZ56j8sfWm2tSRCGF5We/nBbFK55uZGIy9/Zmv8vVaMwYoum9fKe5XuY5xcZ53Ed8Az664eK8mcKV7+KHFMl2PpQ02bXDwuCwhZvVbbU8iQe9x5d7qp+/swXfhDUkd5rfwGAtjYhWR9fXq40f8UlLljsBaLMyXoxRL5PIxG1SKU4KmoXbjlb/W9bdBJzU352yarnX2hLmTIoYTKWYcF0cCZyJ9gmRVjykMR3nL9h/hNmivWJaTyL4Cy4OOZeMqienw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzRMavpiwDKXW4ywe95u3j84nyyAEB48EqMPYn0Xp68=;
 b=ynPuNim6NYfe9lyqWfGtsBSGiafdmG+3c0JJ8lyixp5RrZf5yjJr1l6DHCRA0gI39ve25MQNTTO82/e9YEPMYEEUi346AW7YyxqIYBzaz07GaN2MbthHfJSdE/jqQZELQwpIt+9C4IdJZUDdLt/CxblpGhwodFx33uAyowLW1a6gjyrR6xpNbJbE8uxOhn0fKL+GprIJyiAZt1B71dXMgPse9O+llMzz/Ltka5shtoGE+8MKVEV7X5eV85OgztGjw+wb63Uc8sVL/kvbtigS3PPxTthFSnayamcIDRfPjWWY1qDpd39uk3tqR3omIKc4C8YE23Fpe5Fzi1/cKVDL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzRMavpiwDKXW4ywe95u3j84nyyAEB48EqMPYn0Xp68=;
 b=B4m2It3gJIsN3zr8R4AtpJzq1GCuRWwMoQczPepnmDr4luwvNnwI1+ri8ijLuANV3ZQiiQ0CkN04xeZ4QPmlfOMu9JLpfGyXR/2Hx87nTeO0dBO522MbB6jZdIR+Y3oAB3vnVsTkFORLGGZCqjVqEglgakqOcPUlJE+K1Zb4TPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <799e2b1a-aea8-43d4-99bb-eab4fd4f6b93@amd.com>
Date: Mon, 17 Mar 2025 10:29:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] xen/arm: Introduce frame_table and virt_to_page
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250316192445.2376484-1-luca.fancellu@arm.com>
 <20250316192445.2376484-4-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250316192445.2376484-4-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0067.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::21) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b0bb3b2-5d20-4c93-a8fa-08dd65363c56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVhwM3VnamJxTGxxTUkvZHNXZmVQRGJIN1hZQVBabHQxR0EvWEdydkNmcGI2?=
 =?utf-8?B?UUxtdjA2eHhvNG1SNy9EcnZNQkdocmNsdVNUS2p4OEpGbU5qL0VjS1pXdGJ2?=
 =?utf-8?B?SVRjVCszc2ZsVTgvaHc3QkRTS1dXMkZQaHFjRkJHRkhGQ1NwWGJnSzZLdG9k?=
 =?utf-8?B?M1dXMUFPV0ZmTjM2cnFmVnptMm0ycEZXaWJERWo0Yk1OVWhnVmViS29DN3BC?=
 =?utf-8?B?SzlpZkpvd3k2SFQ4ZTg0Unh0MGtPU21WR3g3dHFTWjRoRXRHZm40Zm81aVVC?=
 =?utf-8?B?Tk5hdW9pQ3F1bW1kMzFFc0l4dnRveGtZcTRQdWxuUDZGeGs3YVF6UU85R0Rp?=
 =?utf-8?B?RFp4Lzd4SnVGTG5tbHk1bFdWWm5EMXk2THdrNWVVR0NudGEyWmUzeWxuZlNy?=
 =?utf-8?B?OFlzUGNyQWZhdXh3TDFZT3VKZzVZT0hjOEtiWTRxbmJ1M1dnU2dGV0RsbXVn?=
 =?utf-8?B?MFNyZDZ6VUJadGhTNUUxMW5RTU1GeG1xU0tFRFVCVWFYSFhyQnY3SkhkL0hq?=
 =?utf-8?B?cVdGaVNUajBxeHZ3VGVNckw4aHNIbTVPMXlQOVFZeE1QVUNnZ0N3MFVZQ1Bw?=
 =?utf-8?B?bnBQUUQ5M0xDd05tVnhrS2RQVlFjUkM4c1V6RUhUOUh4bWU3Z3A4TC85M3pw?=
 =?utf-8?B?UHFDZXpIRzNod2tWNld6VElDZU5qNE5HbU9GUnVTUHVGaFQ1UDg5SHA2OE5j?=
 =?utf-8?B?ejVnanVEb29iMWlldFV3U1E0cno4My9zY3BJSHJUdmJDNzErYXpyVkxCdVl0?=
 =?utf-8?B?a3RIWHZtaTcwaFZDOHg1dEltNHdoU2g3TWxkQ0lycHZ0d1dlVk9aQmJobFlD?=
 =?utf-8?B?dmIrK2YrQmszTkRoQmxMblJObzBoUFlQVlRsT094V3Z5RVRyYmM1RzNHV1Vv?=
 =?utf-8?B?OVM4WjZSRmJOTjZOTk4rM0hNNi94d0lPbzJlZkdTSnduNUliSzl5U0V4aDdE?=
 =?utf-8?B?Z3laTTlZeFl6R2pmYmcvUjlNUkMwZEtBbW9LMHdFY2JoS0V2SHp3L3hsYUl4?=
 =?utf-8?B?Z0I4dzk4T1N5QmhWVDZKa0JXWWl3L0E0WnI3aHhrZDc5Vmg5QU81azFSRUR1?=
 =?utf-8?B?R29sRHlQM2paUlZQTmgvbTZuWXZIaDNYeE1xWitELzNzaGNXM2tKNmtZdGtP?=
 =?utf-8?B?eHVJOFRzM3ZBNFdmdGpoLzgxdEVSTkpnOWozcm9zUVRXTE9tcHJ2eVBPcFVK?=
 =?utf-8?B?RVlJRSt5RjhPVHoyaVZGekJic2F5QlpITVlWei9kTTJuemRjS3UyY1RRR2sr?=
 =?utf-8?B?aTIrOER5Z29FT2NJR0lRZHVvRWlYdDVlTi9kL2NHZXJtbWREdVpNVlNQQnRW?=
 =?utf-8?B?OXFiVWFkTmM3UHpmVFVNb2YzQnJzRmdZZG1ETnFWak05L2c0S0hiemMxSFRj?=
 =?utf-8?B?eDI0MG04OEM5NTc3V0ZCYVc1TDVoWjZ6MFFDakJhZmxBSlAybVRsWkMwMGsy?=
 =?utf-8?B?ZmIvOVRqNjBiVEJvRFNrSTBQOVorZ05BbFpIeitZMGZRWFBNazUyOFMzMkNy?=
 =?utf-8?B?UUZBNDY1OFFCaWEvZFpCYXZwcndKVzMyUklDL2R4UUJ6cnZnUko0Q01WVjVp?=
 =?utf-8?B?d29TQStjdEpFa2o4SU1xc0E0cE5GKzcrZUxGSEwwZkNWM240TjVnWGpYKzQ3?=
 =?utf-8?B?RkhqcVU2QnA5c0NMUVJXdVpaSUpoZ0drS284ZnhWUmJ6NERkc2xobzJQdzVS?=
 =?utf-8?B?bXhibXRXWjl2bHJmNUcvQUFkNVJWbm1aTDlwN3VtdHhNYVY2dHNaZGZ5OEE3?=
 =?utf-8?B?UmtMOUM2MmxTclFUMzdKQzJRcGlXNGhROEhIcFhqY041RU1HQWtiVnlLMnAr?=
 =?utf-8?B?SXQ5Y2NtU2wwTVA0K2hrdTR2dkZyOHFnOE44cjZ2R1RMajUwVWdHWU5JRGg5?=
 =?utf-8?Q?JttP0PX1GU0T/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlovVkJKVUVRUlNIeHlsU01WZjBVOFpnUTQxOG5ZcUY5QWNtbjQvaUp4MVR5?=
 =?utf-8?B?cUsvdHFhK2liYk8wZ0NqUzZ4Sk90YXhOYTJKU0RqeVIxRndsYXZMeGYybU9v?=
 =?utf-8?B?WDJiaTBubnhFN0djZis0OGpTOW50VlZRYWtiUi9OZHhYYU5IbWx0TnlwQ1lz?=
 =?utf-8?B?dG9yZktHWnBucXhneXV0Mm9udXU1Vm5EVmRTbHphWGVZdEtwQUtidjcvRzVP?=
 =?utf-8?B?bFRyQlRtblE3SmpqeWZRKy9TSHB0K1RlWjRXQW9xeko1dFBLRjcwUUUyTjBB?=
 =?utf-8?B?Mit1MU4xOVE4ZEZUMW5HclczVmkyb3hmaDdmYkxuTmRhcFNybzl2WWtBQ2JW?=
 =?utf-8?B?b0xnbXVQbXhVRlpnbXV6Tm8rb2pKSUlFQ01JbjFmT2tDOVlXcS80ZmxneWll?=
 =?utf-8?B?LzVlQVgzM3hDY0lFY0NXUTFSc3lmN0YwVWJqdURoU2NxcFJCdzZjOW1uLzUx?=
 =?utf-8?B?c2d6dWUweXNyVzVJVTBqK0JQaXNmdzE5RVo0RWVvOElXd3pzd0hIWDJCUzhv?=
 =?utf-8?B?bWlRa0h5WWV4YjhnOE45NTkzRExoaWFOcnFidkxyV0tHdnhQQkc1UDM5K3Q1?=
 =?utf-8?B?YWhUMmRJL2svMDlKQ0dScjFnbVFCa0JPT0VBNTExZEJqaG1zVXN1QWdSR09I?=
 =?utf-8?B?U0JyN3owN3BSeHhTVHJkbGV2L2RwblIvTzY2ckFLbTN4clRJUUZRN29jUmdw?=
 =?utf-8?B?VzhVS2wxMm1YWElkZ2xyMEhRZTdZeElkYVdTQXcwZ3lZam5nNFM1TlhIL2Rn?=
 =?utf-8?B?NTJhSjl2RU1TeFFIUVlNaE1HZ2pDZ1lSbTZadVYwMkJCdTFFRHJtcG50Sy9O?=
 =?utf-8?B?encydjVBVDc3N0FjQnJvVG1mQkl2UHRaL2UvQnJ0d2FTWllZU1lMQ3E0WXAx?=
 =?utf-8?B?V0hwbm5GUDJvRXJkM2RiUGVDTUtPaUNZeHErZGZyb3VRQzYyMDJxb3BxTWF5?=
 =?utf-8?B?bmFZSU8xR0ZOdzk4MEt0cE1UcCt3a1Q4R3lSNVFoZFRMTlZiay9yUk5ZaUd2?=
 =?utf-8?B?SXVNdk5kSi9kVTFmempFV0RxcS8vVzh3VVcyYklGbHhoUm1XeVF1d3lPVFJF?=
 =?utf-8?B?eTRwdnptd29ESzU4VTMxNkhrVVVxVWxVcG9QbEkyd1BJNlFwdG5BclIvdFJE?=
 =?utf-8?B?bjh3eHlubWlRL3RueDZ2NnhqWkdzM2ZCbnJxeVYveGlKTGVQN0oxMFVET3cz?=
 =?utf-8?B?SkNzcml0eSt4MFBJM0tNVFlSNml0emFUQ1h4M2xBTWhXZ1RtVFB1L3pxSUFC?=
 =?utf-8?B?Yyt5eFd0Ukd0TlpmNWNPVWMwdlQ3L20yZ3Fhd1c2elY0aFRXek44MEtiSVNC?=
 =?utf-8?B?S205NFBQRmRnWlowWEF4MlVvd0VKWFU4d3NEZlg5MDFHQ1NmTnYrZFc3SDJy?=
 =?utf-8?B?bWxLK0JnRjJYdnYycExTOVVkeEZIZTRZc25qYVc3ZmE0V01yYW5Vc2crQUhj?=
 =?utf-8?B?cU9IUnVXUGJpdmRwUVF4alJpNVNuZFJ1Q3RoVWhzMExOZFJUQ2NMVDVYYmM0?=
 =?utf-8?B?U0VwYTFFUmtOenRVSlQzZVdvWFlPbENiQWFETkNZYmFJc3pMYmVITStjeWR2?=
 =?utf-8?B?R2xvQlVoZnEyc3pjeTZGV3JyZHJBbTBsbG4wcmFFUG9yNEhRUjNOSVFVOWk5?=
 =?utf-8?B?ZCtQUUtpNFhsN01nZzluK2hOZXVVejYvR3hHZGZOV3A1STVmYTRWbWRtYm1Y?=
 =?utf-8?B?VldXbHl6L2RRcWdDVktjbmVsRE11Qk0vdW5IMTBrcyt6d2QvK25iYytucFRt?=
 =?utf-8?B?WHY2ZTVnbWJ4eFJaeUFwaUUxQm4xcmtEcDVGeFhnR1R2b0d4YUdzcWVOQUN2?=
 =?utf-8?B?OG84TlBVSHRqTDAwcGFxMzNTeURPdE9JK2dHbnNEWXZPSjc0OVNoWnRlSU91?=
 =?utf-8?B?QnJKZFRyQWJITGhDSExFVmxibFVrTG5EdXF4dGJsMDI1bzFTcXk4a0k0Z09j?=
 =?utf-8?B?VW9zNlIwSFRhM2NiRmNCRWtndkFVQzNmWWluNlZDOUgzQ2VVelpCOWYzK0Na?=
 =?utf-8?B?ZGQ4eEg3cDB6bWJEK2JFdTAxcVdMRk5LSjhvMUtlTERRVVNWOFB4aGw0bXc2?=
 =?utf-8?B?OWVWd1lTajRDZkdmNTQ0MmRqaS9KY3pvUjFqOXJTTGpiVDk3Tk82YVhGZFln?=
 =?utf-8?Q?lLi8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0bb3b2-5d20-4c93-a8fa-08dd65363c56
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:29:37.3399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HL1G+3qn4EvOAnsrRpyf8/N/GAlj/OCxAjh0cM5EreOSPRSbmzET3oXTE2Jf+W0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7548



On 16/03/2025 20:24, Luca Fancellu wrote:
> 
> 
> Introduce frame_table in order to provide the implementation of
> virt_to_page for MPU system, move the MMU variant in mmu/mm.h.
> 
> Introduce FRAMETABLE_NR that is required for 'pdx_group_valid' in
> pdx.c, but leave the initialisation of the frame table to a later
> stage.
> Define FRAMETABLE_SIZE for MPU to support up to 1TB of ram, as the
> only current implementation of armv8-r aarch64, which is cortex R82,
> can address up to that memory.
When mentioning support statements like this one, it'd be beneficial to provide
a reference to a doc of some sort.

Also, shouldn't this be occasion to clarify SUPPORT statement as for max RAM
supported for ARMv8R-AArch64? ARMv8R support is experimental, so I'm not 100%
sure if we need to provide support statement for it at this stage though. Better
check with others.

> 
> Take the occasion to sort alphabetically the headers following
> the Xen code style and add the emacs footer in mpu/mm.c.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v2 changes:
>  - sorted headers in mm.c
>  - modified commit message
>  - moved virt_to_page to MMU and MPU
>  - removed frametable_pdx_end, used mfn_valid
> ---
>  xen/arch/arm/include/asm/mm.h         | 14 --------------
>  xen/arch/arm/include/asm/mmu/mm.h     | 14 ++++++++++++++
>  xen/arch/arm/include/asm/mpu/layout.h |  3 +++
>  xen/arch/arm/include/asm/mpu/mm.h     | 15 +++++++++++++++
>  xen/arch/arm/mpu/mm.c                 | 14 +++++++++++++-
>  5 files changed, 45 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 444fd03823ec..fbffaccef49b 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -294,20 +294,6 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
>  #error "Unknown memory management layout"
>  #endif
> 
> -/* Convert between Xen-heap virtual addresses and page-info structures. */
> -static inline struct page_info *virt_to_page(const void *v)
> -{
> -    unsigned long va = (unsigned long)v;
> -    unsigned long pdx;
> -
> -    ASSERT(va >= XENHEAP_VIRT_START);
> -    ASSERT(va < directmap_virt_end);
> -
> -    pdx = (va - XENHEAP_VIRT_START) >> PAGE_SHIFT;
> -    pdx += mfn_to_pdx(directmap_mfn_start);
> -    return frame_table + pdx - frametable_base_pdx;
> -}
> -
>  static inline void *page_to_virt(const struct page_info *pg)
>  {
>      return mfn_to_virt(mfn_x(page_to_mfn(pg)));
> diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
> index 6737c3ede783..caba987edc85 100644
> --- a/xen/arch/arm/include/asm/mmu/mm.h
> +++ b/xen/arch/arm/include/asm/mmu/mm.h
> @@ -70,6 +70,20 @@ static inline void *maddr_to_virt(paddr_t ma)
>  }
>  #endif
> 
> +/* Convert between Xen-heap virtual addresses and page-info structures. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    unsigned long va = (unsigned long)v;
> +    unsigned long pdx;
> +
> +    ASSERT(va >= XENHEAP_VIRT_START);
> +    ASSERT(va < directmap_virt_end);
> +
> +    pdx = (va - XENHEAP_VIRT_START) >> PAGE_SHIFT;
> +    pdx += mfn_to_pdx(directmap_mfn_start);
> +    return frame_table + pdx - frametable_base_pdx;
> +}
> +
>  /*
>   * Print a walk of a page table or p2m
>   *
> diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
> index 248e55f8882d..c331d1feaa84 100644
> --- a/xen/arch/arm/include/asm/mpu/layout.h
> +++ b/xen/arch/arm/include/asm/mpu/layout.h
> @@ -3,6 +3,9 @@
>  #ifndef __ARM_MPU_LAYOUT_H__
>  #define __ARM_MPU_LAYOUT_H__
> 
> +#define FRAMETABLE_SIZE   GB(16)
> +#define FRAMETABLE_NR     (FRAMETABLE_SIZE / sizeof(*frame_table))
> +
>  #define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
> 
>  /*
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 6cfd0f5cd2c2..3a0a60dbfa18 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -3,9 +3,13 @@
>  #ifndef __ARM_MPU_MM_H__
>  #define __ARM_MPU_MM_H__
> 
> +#include <xen/bug.h>
>  #include <xen/macros.h>
>  #include <xen/page-size.h>
>  #include <xen/types.h>
> +#include <asm/mm.h>
> +
> +extern struct page_info *frame_table;
> 
>  #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
> 
> @@ -15,6 +19,17 @@ static inline void *maddr_to_virt(paddr_t ma)
>      return _p(ma);
>  }
> 
> +/* Convert between virtual address to page-info structure. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    paddr_t paddr = virt_to_maddr(v);
> +    unsigned long pdx = paddr_to_pdx(paddr);
> +
> +    ASSERT(mfn_valid(maddr_to_mfn(paddr)));
> +
> +    return frame_table + pdx - frametable_base_pdx;
> +}
This could be simplified (and number of conversions reduced) by doing sth like:
mfn_t mfn = virt_to_mfn(v);

ASSERT(mfn_valid(mfn));

return mfn_to_page(mfn);

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


