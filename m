Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216A99F2AC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 18:25:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819287.1232578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0kLq-0003vA-5e; Tue, 15 Oct 2024 16:24:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819287.1232578; Tue, 15 Oct 2024 16:24:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0kLq-0003tf-2K; Tue, 15 Oct 2024 16:24:50 +0000
Received: by outflank-mailman (input) for mailman id 819287;
 Tue, 15 Oct 2024 16:24:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vOwl=RL=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t0kLo-0003tY-RH
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 16:24:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2412::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe1e822a-8b11-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 18:24:46 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 16:24:41 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 16:24:41 +0000
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
X-Inumbo-ID: fe1e822a-8b11-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkAW9mGykmVbFPyFIDLmmwpzaWirwva7Le1P0RHWeoOhbYXPbFLWW0nYxQG2fwtTVSTDHKOyKBQtw2lsX/pYKYPXhTOhda2jwzetdORwh7tf4sPpVBHcolD9fWIEsIQWZ8Z+rJKhenRZ02jyMM2OAUu9oS/dEggEK2H9snHU59dIpTh6lxy0UNxV1MJHdxRh3SiEEDjzbXDISQUq77kddbc+VnYrPYV0/Fdfx4xccuM9lpwjCdv103mMuBQttihta4pyIezrH1WTDLqn7R8AWI9ozGnSWYruqFIMVbG5PegLVwy2BsD60M/xtoPvvxOFFQd0rQ1idkMWldxDFcq7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBZ8LVIcC70PBPUX+KlhAPi9vNtEL7oq5bAD7s2TGjY=;
 b=osJQJvhvwy8IloGHDNrjYxFSQL6OnR45R5mS2DyH1/ccobI61SxsI0z5498Nd+ugoOIwndc/fTZQdZFtK37/EcbM0f2eRaH+e6e43y1q098JpumydjUQLZGolJDoEUIAQAfEOIHcYiQ/Klw2tz5WrPXQloo4q18Q7yAZ/vmeiWvyUypmVLbPcSTPisUPvJGpcJUsiVARKGuO1nm2sWf2DLqsoovZGl7GN/Q8NnI3Cf6VJaKFVat/jwzcRK+qeqTXMB5O6j58Hh8qZePNLpolSLCKXyZ+7F4B495UTG75ezkifMTAn8QcEMs2/nWyxvBcIMCNrLTTKdKJfJGNbeTOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBZ8LVIcC70PBPUX+KlhAPi9vNtEL7oq5bAD7s2TGjY=;
 b=trihhXRFBUJVTswQlbMRsyWGF+Zo+AS3upJT8r+L3PRsVbsLhHTxElHuIz608peuZZHauuKb811Ox7wTlraKXdCoCArl7uDeABf8TadXkYU/UwbukGaipIRKKd6VcoPSKSeKZDVb7akQQheR5Z7+Atc6Ti8+VXwsg16QIcXj6fY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <9c19c7a3-2e1e-43e3-88c4-ff8c02b4adfe@amd.com>
Date: Tue, 15 Oct 2024 17:24:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jiamei Xie <Jiamei.Xie@arm.com>,
 "frediano.ziglio@cloud.com" <frediano.ziglio@cloud.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-4-ayan.kumar.halder@amd.com>
 <8AE12285-F017-4FC9-9F9C-6218257211F9@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <8AE12285-F017-4FC9-9F9C-6218257211F9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0112.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::20) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: bf00768c-1340-4e76-31ae-08dced35df3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Qnp6djBzTzNycE1TN3VCdm1yUExWZWJGakJ5UlFXYmVERVJiQnlkSEJNMnNa?=
 =?utf-8?B?cE9nM2lvWFJXeFF2TlZLbXhKcUtrMldmS2gzcVNYZml1Sjhlc1pHWFpFWFVO?=
 =?utf-8?B?VkJaNEtZaWRkQXgra1NGSk9LZkMzS2RPNlFSNVdueHU3ejllVXcvUHBvcTc5?=
 =?utf-8?B?azV1MnFZcXVEdmdyK2Q4MWRKOStsR1RQeVVZWEU3RSsxUzE2VDIzTEdTZzQr?=
 =?utf-8?B?TFhvY29hcndVTVBjd0VzT0ExbWRPTXM5TjBvZVprSE9tU1BtK2JHelp2bTBp?=
 =?utf-8?B?cnU5QUVXdGtnQjgxM3JzYjVDWnNmQWJmUm1WYURSWm1rME52bHQxOHdReUdt?=
 =?utf-8?B?RjJuNy9QakdLZjhlUURPWUU1Tm1sZVZ6N2MwbXFWQUVJVmNxTU1JelRWMFRI?=
 =?utf-8?B?UWNZcjNIayswVUV5MFhkbXluVmFxUXRNejFvYzRyWEtSTkpkQm9OOWhnTnVS?=
 =?utf-8?B?cTB5K0pJY1ZFQmN6MXBSRUJUTHRyM2dLV3Ayckl0RkpFdU5WVkladThEcDBh?=
 =?utf-8?B?YUlnaTk2emc1WmREdURTckMvbmw1YjZxNVd3cWYvcUM1dlhLSUsxb0tlNHVz?=
 =?utf-8?B?U0Q1aE9ya1Z1TzZhd3hsM0J1Y1ZKc2lZRG15Y0ZVbnk2Yys5dmNSTSt3b2xw?=
 =?utf-8?B?bGMwK04yOWtqM2FLYWl5dElTbDJtSEZVOFBDMC9uc3MrWVJjTUlSQTRxZWFR?=
 =?utf-8?B?MWpCVUI4dkgzNWdlRmhYeDJ0UGNKZnd2YjZFdXVydjdYYWhEWUl4dFBSNER4?=
 =?utf-8?B?UUU1cXpWNHNWZ0hFNENlQm81RFNERWxnWkJxekx2aUVQQjNnQ0RoOWlxZUFo?=
 =?utf-8?B?ejhLUzBTQ1lzaDJBU1FyckZRSDRkYytRU1VyVGhLejkyU0FEUVNNQytEcWVQ?=
 =?utf-8?B?VVFWajJaanV6eTZiV2FpRHV6bkdXbS8wOU8xVmZVdUFkNVc3K05taVNzOWZo?=
 =?utf-8?B?cHBBR2NVWnI3YmYxZVFIWFFQK01CNHVFSW1IQmp1N0dldVFkUUtad3FIQW05?=
 =?utf-8?B?NHNCb01JQjdJdHlqdUoxQU5KYzR6SE1wQTEzaWVVVEY2S0REK2ErOUlIV3Yr?=
 =?utf-8?B?bFRtcnkyWGFvTkttSEVOMFhDRzEwWHZHODhCcFV3OElSNDVsdEl6UjRsZDA0?=
 =?utf-8?B?TDZyd1Y3UzZSQ0ZaUmx1K2NzbHBrNTYrNGVPVlZyQ0pZWjNzRG9BT1hGSjRB?=
 =?utf-8?B?ZThuRytudWFjcUQwUlpuTFVCU252MkRnRVN2K1Mra01LbGQ2L1NLU2E4ZWJ0?=
 =?utf-8?B?aUxiRnpNNHBHSkNIRVAzdUx1aXoxNmFHNzQweklFZlNLUDg5cmlYTWlhSEVq?=
 =?utf-8?B?NnhGeXZiV3JQL1BCMEd5OHplMkUxNWVGZWhQc0RvNmZ3NXZqaG5iTDdhVXlO?=
 =?utf-8?B?Rm5sTzk1SkRUM1JZeTVqVXR3b0FsUGc5YzNjbEkzZjJORW9PSnVNZHVLNFRv?=
 =?utf-8?B?MFJVaXRWbjlDWGRmbi93NHlwMUxYNDhEcDRHSUVjNGQ4Y3E2Rks5RDJ1ZjE4?=
 =?utf-8?B?VkpreWkvNGZFaTQwNlNnTTdTRWFwTUdDQTN2Y0M4Ykg2U0drcTBRUmRFdzkw?=
 =?utf-8?B?U3NqODJoUUJjbFBQaldLNGo4QkJvd0ZpaDR5YTM2VnFmTHBlSlZZQkNtWTFv?=
 =?utf-8?B?UU5RMER4ZzZEaDdHNDlBYXhnNEVBUk1KOEt6SmRRem9oZ0o4aGwyV2huUnda?=
 =?utf-8?B?LzN4WlBsZEM1NXc0UGlHeFB4Mk5ZcmR2bHZJeUpVYzJUSU1DdDZvdm5FWEtv?=
 =?utf-8?Q?5jlssp00L4uRDZCH4M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEZVS0hjYUdwZFh6RnBkZlNubnZScHV1T2xOZzM4SjM4VDVqc1hFZlhid2Qw?=
 =?utf-8?B?bkhoNE5lbjVWL3hJdk42UFYvRzNMa1BiV3N4Z054RWgwMW5scWsxRngzVXhq?=
 =?utf-8?B?Mjd3bWZYd3RPcENWWlN1SXJUUktPTStHVFY2b3UyS0lOZ1hUZUwxd2J5VU5F?=
 =?utf-8?B?UXBPNHoxV0JUdDJieXU5UzIwL3ZVek0vdGVsdDRJSDN0Zkc2bG5xU3F4Y1RR?=
 =?utf-8?B?Vm56clVzUXpZSHNhcDM2VlllNHhGS1lJNVoyRzFQQllXcFJiWld1OURkZERV?=
 =?utf-8?B?Rlc0RVdZYkpoK2p6YmxYdCtudWMveWV3N1hvNzFOTm1ic2FSK1JYY2VHZmdG?=
 =?utf-8?B?dVNVbkd6NmdWMURPL0Y3ZFRpMkpuQXZGclVOd2lOM3R2VTMwN0V0NjdST2RE?=
 =?utf-8?B?QWZKbG1qWWZta0JVd1hmR0F6R2ovTXhIUWFwYVEwWnVBYVI1ZVZtMXkydC9a?=
 =?utf-8?B?MU1UdGpVNUdqU3VZWkVWV0paUlBCSUhJNzNXMFNTbU5xMVVjNzBPZ0RRcDhO?=
 =?utf-8?B?STRieG1wYUM4VmtjWWlTS0tCR3pCMTY5dXFCSmtzSFhaa2ZtdEIxNGV6TlZ4?=
 =?utf-8?B?eWRRR2w3bnRHNTF5N0ZmRHlFSDhyQXcxZnZoZmRTMldORUZCTnNMWkl0K0FX?=
 =?utf-8?B?NEltNmFiNHNhcThpaTRwenhTU3NteHJOQTJ4UlpGeVBuUXpVclUydnkzNmVq?=
 =?utf-8?B?RHY2bG1PVEVKcUM4R3VjaHlTaTB1OEJXbDdDQTgzdFpZN21OMmVIWG8vOGs4?=
 =?utf-8?B?MFVNdncyVS96aGhkbzQ5RTZSRmhWV1hvalRmUmdFUmdZbmY5akFYckM2QWRr?=
 =?utf-8?B?VmFiNVRvak9na3JraUtUMTJCT2ZSQ2lUKzlaSCtrbW9GUnFYb3UvcXRzbkJF?=
 =?utf-8?B?VitUcUF6WTBGODUwclJDRUNZN2N1c0JPSHJ6Q3ViM0xETlN3S1IxczRGdjl3?=
 =?utf-8?B?Mk45dUJ3S0FQRGxlSXhEZmxzWnZyQ0VEcEdNUjZ1TVBFOXpKdk5CRmZha1A5?=
 =?utf-8?B?Skhtd1NUVVIwN3B5ZVFwK2ZsUzFrTGd1Y1NHclBPOWZOZVUzS3YzRWRjWEJk?=
 =?utf-8?B?YURBVGVnUXJDRCtmaElIVFJiOGFsNWEyY2c0Zk91NG9MaVFERFhsZG1ieG1L?=
 =?utf-8?B?bVFZVDdNQ2lBOXZ0SUJoOUpUd0RGU3hiL1JrQlNiVG11cWd1bzE2cExoeG4w?=
 =?utf-8?B?QWxqRjdLTC85ZW5HWG96NkZkZER5STlBZXEvTzVkRDhaOVhPYXg1aE9FcTB5?=
 =?utf-8?B?Y0lpTnlSSjhJVDZuYlpscmN0QmRtd0N3Zy8wWENyUXlLSHRBdjFXbndCRG9J?=
 =?utf-8?B?bkJkaTBJcFFCaHIweFc1RHp2cUNBZklBQWZBVmZLVEhMaWN6Zk5TRFoxTTRp?=
 =?utf-8?B?SDBTYUZTRWd0MzE1cmZMenQ1RWFBcnNQUzZqcno4U3hhdkRMQTltM2JpY1Fp?=
 =?utf-8?B?bENqWnZrbVZscUZaN2F4UU92VHhtcm5xTWY4YVQ3UXhqRlpKTXQ4VzJUNVM5?=
 =?utf-8?B?cGJwUGN5Z2Roc3FGdTUvZHpuWVFXdHdIOXI0ZVM0RjBWekFlN0NzOWYrZzJx?=
 =?utf-8?B?SjUxRTFYYnVuemVSREh1TGhTd2M2bERuUFFhbzh6SXJxd1Z6ZE05N1hXbUU2?=
 =?utf-8?B?VERpb004N1BiOE84cldGbHlGa2ZCYjJJRkZFVnIwT0gwenF2V293R1c1N29H?=
 =?utf-8?B?OVYrLzQrSWV4bTZHeTBZQ3A5U3UwOE9lTGlOU1pXbzNXU3BHcFVHQ1FTT0t0?=
 =?utf-8?B?TUNockhFcHg3cEs2UjRnSXA1ZTNkd2Q4S2FFQzBCdlkxZ25PL1FGSWZWMW4v?=
 =?utf-8?B?MUswMVBCV3FWZ3VUU1hYZjZWN1kva0xLc3M5NVc3dGxjaE5tdmd0eG9yNjNt?=
 =?utf-8?B?TlVjaVBxZzdRdzNPeUxFMU9vUjlnczNkS1dkTjEwbHBydGxpQlBYVWdicXNz?=
 =?utf-8?B?SmduaVhXanpFc0V0b3JQeVVyZ3Y4Qmd3SllzRTlnb3oyMUNKYkVhWnZxZjA0?=
 =?utf-8?B?WFhhbTRSUm12eHBHOUlyMVBNdDJKY2JxN0w1RllXekh5SnhzM3BBdU80dGZz?=
 =?utf-8?B?WlJhbldHTHppbjNKYzdSdjZXYnNrczY4OXg1M3RMemZadEpsNEZvUG5wWVFO?=
 =?utf-8?Q?20NaRnvXzU6J4AkOh/hLTiimY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf00768c-1340-4e76-31ae-08dced35df3d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:24:41.6469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 52CcB1WbVfXjHHF5NGZflwx8+n2c6tq3P5DAWN4KL7omG5PCKRMhtCgd4g9o2jmVaA/bQuqh2c+4VupYNY0rbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416

Hi,

On 14/10/2024 19:53, Luca Fancellu wrote:
> + Frediano for suggestion about header protection define name
>
>> +++ b/xen/arch/arm/include/asm/mpu/layout.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ARM_MPU_LAYOUT_H__
>> +#define __ARM_MPU_LAYOUT_H__
> I think we are moving away from this notation:
> https://patchwork.kernel.org/project/xen-devel/patch/20241004081713.749031-6-frediano.ziglio@cloud.com/
> Shall this be ASM___ARM__MPU__LAYOUT_H ? @Frediano

I could see that the patch hasn't been Rb yet and as per 
https://patchwork.kernel.org/project/xen-devel/cover/20241004081713.749031-1-frediano.ziglio@cloud.com/ 
, the new coding style is still under discussion.

May be the Arm maintainers (Stefano, Julien, Bertrand, Michal) can 
provide their opinion on this.

- Ayan


