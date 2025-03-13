Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5F7A5ED46
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 08:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.911301.1317746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdIo-0005b6-El; Thu, 13 Mar 2025 07:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 911301.1317746; Thu, 13 Mar 2025 07:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsdIo-0005Yv-B8; Thu, 13 Mar 2025 07:48:26 +0000
Received: by outflank-mailman (input) for mailman id 911301;
 Thu, 13 Mar 2025 07:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a6QA=WA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tsdIm-0005Yp-DR
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 07:48:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:200a::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88e59e69-ffdf-11ef-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 08:48:22 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB8903.namprd12.prod.outlook.com (2603:10b6:610:17a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 07:48:18 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 07:48:18 +0000
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
X-Inumbo-ID: 88e59e69-ffdf-11ef-9ab9-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUc58UHaK/r0M1Q04eBJFD9Ip6sZWJRCTRH/WTn9f5dXZzEaHKRhat8IpFGQ0eXWb+N4flcepgrMpoQ1mR/MNPtTHRlQZP7IYgUXWKhYBuIuC0YWAZB7IGFSCHA6+TOaqQ6q0KUP7SmZTIsab1D1wRyerI3A120D3V8ZaUUEiiZMKIxUa3V2tnoTRuWPQFIPdixE8qBRpaxEaiVzvukKL3yY08ce8goWymy0xnsmtggImtcFNLd44DHWn0ezTfb5KJoTnQxyMi1HA+MMXHWcjr+yELcU90aSopWSv+HkagwQHueH8oXa9DXvMqIfpP6VhqTlvnUaXWCdin9ScF+HiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UD+lfanEE0YNXqP8u1patLg89e3t9Asz7pYJQiCzyX8=;
 b=agFMYvBZVQXfWIrNNc1RLHIMTYrVg/hIpmWB9G4zy77EzPh2owShaBkqq1GMYzpEjYlGUvdik27Ekh2OuJYGoV7O1wI5dMmd1UtFWDmZARgAEPEnSQOXVwyW5h6td7b5VAhb5D0aDdva3naKW+dEmQyhIqg6yiMmB+Qw/3BfQqREL3IAH9E8bVbEVpkqBMV4yoidhdxfCt30dYiYV/loGbLdO+XONpZ2DbcT7KGX0/vwgJUsFu/RtBT6TYEGh/rRc1dJhJqk2nbH8GvBRAutAjhc1Tzg6UISeesRuqaTmk5oFiRhrEf1lWDjWC8nRsw4UvnVupydK9jHQRZTnff5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UD+lfanEE0YNXqP8u1patLg89e3t9Asz7pYJQiCzyX8=;
 b=q3SZGOR8XNS+CAJ/Rcr4YaoPhNTnQDRykQ5JQUdC4ZJuqER9lDfrTW9Jf6ihTnfe3yjzxx04+htynp9jGkiff/pkPpijtSzgP6eFa4NNJ9rqWqJc9i8Z1qjaqan7rE8eDhiLNyJPJVr1SZmxhsZw7ZGR2axZlhyk7O5/My/BzYI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7f3a0b2a-6713-45ae-8deb-60f145f48be8@amd.com>
Date: Thu, 13 Mar 2025 08:48:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] MPU mm subsistem skeleton
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250312135258.1815706-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0435.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::14) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB8903:EE_
X-MS-Office365-Filtering-Correlation-Id: d1dc69cb-c479-4381-bd08-08dd62036b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N09aZzlyV0RHVVNlbkRaMjJrVkxsSmd2eHNLd05yNGczN0htOHA3S1JFVlR6?=
 =?utf-8?B?SkNGVzVPbHE0V2o3UVVKa3F1a29kVDVIbmc0emxOcEY4bGdNMjBITXhSeXpP?=
 =?utf-8?B?VGc1b1g1MzdQRzQ5a2lFcVQ2REZHMnBQNWdZUzFCQlF5V0RTL0VVWVJKRFA5?=
 =?utf-8?B?OTM4eXg5KzBDejRxVFdNSXZwWVd5VUJjcytCRkJucjR1RXhrZmovYzcvSEp6?=
 =?utf-8?B?Ylh2bmR5TVRaQ09pd3NFNnhjTXUrOFYzSVhsZTBLMGxsTVQvN0Zxd0xyaHFy?=
 =?utf-8?B?TkpzUE1FSi9Rdm0wZ3dWRzZNc3VKOXRkUW55c3MyRGNDSWZsR0VvRmNIK3Ez?=
 =?utf-8?B?NngzV3FDY0dKUXJYOERTUjI2NWg5MnhkTTFjUDd2MStRRzM3VHRMTVg4VlZD?=
 =?utf-8?B?U05GMlhaQ1BEUHhDZVdtcXh2OU5FSWl0Qm0reElYU0JlenV6Y0FBcXo0dllo?=
 =?utf-8?B?K2NFdlJzOGt6ZUNtdzd5UUV5NEVXL3ZGdkZ3MHFGaUxoc3FCTWpLUmxSSlg4?=
 =?utf-8?B?K05BdlVMRTRhNnBDOTB6ZnFNN2J4ZkNjRmxuQUVRSHdzSXljMldNVGE0cksr?=
 =?utf-8?B?Z0V0VFFzaTgrTHM2TytJaW1kUnJrTTUvRzN4NFlqUEhBS2hSY2RJa2VqcmhV?=
 =?utf-8?B?YU1ORURaMG5odG5sa0k4b2JnbHlSWWlQRENNcDVLQmxsTzZXN0YwVEZBUm9I?=
 =?utf-8?B?eU96TktBVWQ0NGNxc2NuUDllcnF0Q2xJQjVBR29MRlRJVWNydHh4Uk0xR3A5?=
 =?utf-8?B?bUhSdVBXdk5GQ1MwQmVWZVpkeUlubHV0MUUwcXhzb1dQZmhPTU9EaWp2NERx?=
 =?utf-8?B?bU51VHRHZ1Ixdm5WZDE2WVZ4Uy9lY0NxdG1SdlRBa3d2R1pabHZGa2J6cmto?=
 =?utf-8?B?dlJzYndrd1NrTmZvRlo2MUZSdkZVQW9YY1ppL01LMWlZZGRlamZTYnpCd3pC?=
 =?utf-8?B?Vi9xR0JjNFNxU2lWb2Flc0RTNy85WThrcnRnQ01oRWJWV1FCNVBsTkFzS1Ez?=
 =?utf-8?B?VW1aSlRxejJvZGpyWGpWK2Z2Q09zN09tRmFvQm4vUzdMY1BzeXZrbHZENXZz?=
 =?utf-8?B?anlrZTBiczJtUWtWT0w1YTloNEdXTTFnQTlQUlY1YjJLZS9YdjJiU3FKN1Fi?=
 =?utf-8?B?UXJaUXIxSkRpRjBiSVpBZThld25SR1J3bU1WTjZtWEdBdXVNWjcyWjZBNmkw?=
 =?utf-8?B?aXMvWE5DdW8wTm9Od2wwRGFQWkpUWkpZMU5XN3hzVnlCamFRQ2RPNWw3Ly9L?=
 =?utf-8?B?d2VCSDM5VkRsYyt0aTlvRG1VVWJwb2dRUGZ6azRvSld2L21Pd0lJMkRBaTNX?=
 =?utf-8?B?QUpUVEpUaHV2MjFBN0NMSGpFSTl3RzIwci83U1hHdTVWMVpLV2JiVzVUYmtr?=
 =?utf-8?B?aUFNNUFIZitsdWVvT0QyOUFxdjZBei85UGtCd2tlWVZGekhOMzNZSWt6U25s?=
 =?utf-8?B?bGFmUDIrVXg4dmtNa3dMYVorWi9sSldBaDZxcXA3dEsxMGJUUExGQTFYNlNG?=
 =?utf-8?B?SjlhZFpkdVZWSnNVYU9aNldxM21yN1FCM001ak5IbUJIN1I2MDVtdHhnektK?=
 =?utf-8?B?TGZBSzA2K1kraURyNW1qOFBTVHpoRjdMaUMxb2tkRHRpekJ2SFJUV1Rxb3R6?=
 =?utf-8?B?OUppR3VhRFE0V3MzaHVMSHU4cEVDV2t6eDg1eVQ2RkxnQkIzZHU1OXYzbHR4?=
 =?utf-8?B?cjUva0NHbEI5ZHVvMWk4Y3BNZjVaMDlRQmlKaHU1Qm42bm9ZQXlhNmptNSsv?=
 =?utf-8?B?cHhHVG9oallqUUZzeFE4a1dVZkw1MnlIaGNVT1Foc1BNZm5iNmpLbklDVTJu?=
 =?utf-8?B?clBkS2IxNWEwQlJGbkZja0R6VmtGK3RBdkdxVU1JclJXSXNFdGViNDNEQmI2?=
 =?utf-8?Q?vfPnXfSU85SV+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?emhqYUE2RThhY3oxQmw1Vzlld3B4ZlVJMFdlOWpxYzBxUHU5SGEwb0JOYit0?=
 =?utf-8?B?Vi9QY0RPYnkxVHlXRXB2allnM29CQnM4MFNaS2hwMGQ5Um1PYThDQU4xOFRK?=
 =?utf-8?B?eXB1WmZrQjdzbThvTVdrY0QxREVBTXd3a2V4K0lCYmIwcnhUUDJnbkl6YXow?=
 =?utf-8?B?RE5OOHRPSTd3T0NING1uc1BaY21pbkprS3dLWkk0VDRaVzNpaFZGRENHQ3Bo?=
 =?utf-8?B?c1FRMmdtenhUVEtDMVpSWmUvclRnTmVTWGZvV2dUaWxYZFhWejV3REplZy9l?=
 =?utf-8?B?a0p5TzllK0tnVWVlYzN3bEtoYnkxT2NvODBIQ0FwNWJNRDlVVkxDZmJIRmRP?=
 =?utf-8?B?b2RzQ0kxQkl4Z09qTlBZS1JHSC9HREgzdlRTOUJaTzRUcmNRa3hvc0FyS2o0?=
 =?utf-8?B?OFpWMmlwOWdUczNkNTlXb0xLM1ZzSmR2QUlxY24zak1lWVlKZXBiNzEyaU1z?=
 =?utf-8?B?UFJnQnNCRnBiQm5RdkRhUWRqZjJSc1Q0eDJnK0lmaWlDTHVvdml6WGZvRGls?=
 =?utf-8?B?THYrSnpIbUJUTkxtYVc0MVR1Y213UzdkNnIwNFhUNGY1bXd3eFY0UTBzTTlh?=
 =?utf-8?B?UUFLSTRrWDM0RW9qdk01QTJTNkhnSGJNUk03dmRDekhBSmNGekFhY2RhVzNK?=
 =?utf-8?B?L2tocDZud0g1TGsrdkI0ZWZKWHFyaHBPb0d5cWpMU1hiMWI4dS8vZmZjMWhW?=
 =?utf-8?B?RUIwd095TDlieC9FbUlndVRUM2pVdW5XbVBzUVRDd25nY2Rhd0tjRFM4elcr?=
 =?utf-8?B?bkI0ZUI2eVAxQVFLamRMQkx1cDRuQXdITkVSQXlhRitLS3JCdGlRcnhnQ25l?=
 =?utf-8?B?c05FV096MEFTa1JYcTY3Sk9paFlXSklTZ1daMkw5TkR1VDBxWnQrYURhTTZk?=
 =?utf-8?B?S2RGa2YrYXh4MGFPVFNleUJPYWxSclNnWlVEcUlMQjlONTBEUXlIR0xFRjhZ?=
 =?utf-8?B?YVlNMFBoT0plUjFIUmpkMjZyUExnVXJ3ejY5eEo5aVVWVU5vQlNpZVcvUHlM?=
 =?utf-8?B?UndOaGZyOEk3RUhOY2RFd0Zpa3F1aG5uQTk3djd5MmxzTkJxYWtqdERRVCta?=
 =?utf-8?B?Z3VmNlgrTndFQkdiYm5iQms3TVN3WXB0VGIrUThhZisvRzN4SzNZczVRcnJm?=
 =?utf-8?B?VTducjIrQ2t0cm1zMWRHejJuOW9oV2Zia2Z6V0ZPZXlyeHdPOFJDQWlzamdq?=
 =?utf-8?B?em56Y0crdEF2TExMeWx5UldpaTFVVmkvbVNjd1lkampVYUlwdDU0cnZlL1Jn?=
 =?utf-8?B?YnV2MnhBVjJ6MHkwbm5LUWdBakVZWjZJY1R5OWdoVlltVUJZQ2hJd05LTm15?=
 =?utf-8?B?ZHhZUkl4cURwL09jSkV5Vm9KZDY1NGFjSkFkYUhlVGZPVytNZ1F6UFVzZG9H?=
 =?utf-8?B?bmNxRkQ1Y2w3VVJBVEZlNEp0UU1aM0x0N2RoQkNNamUvK2t1QStSeFc4c0lD?=
 =?utf-8?B?V2NURHNBZ3ZoTGNIVnhsUUNoZVFZM1kwL240K05wc2FMNVVRejRnZTMzOUo0?=
 =?utf-8?B?OThHUXRUR0duR1dxOFZyaEhoNlJBUWd2OHhVeGZ6ZGRHUDRBOG4rUStreVVn?=
 =?utf-8?B?UFQzK3ZPZXUyZmRUWU82eGxrNUEwRHJreUVYakxsUDFpcHJwSHdLYlJpV2JG?=
 =?utf-8?B?Q2lRb1h0eUw4TmJIaDZ1WUNqSU1IcTJPZEtTSmdtc3FHRmF4VDhiZVQ0UFN5?=
 =?utf-8?B?UkVPOThtWlRTVEdncUZMSG5TQThHYUJLVGJFcWRwaXRSK3NzSnBiZHJjU2gv?=
 =?utf-8?B?cmNoYkt2S0xncXgrOE5EMjhoYW9RWTF2WExNZkFDeTJnNGZnd1N6ZnZ4eStl?=
 =?utf-8?B?RitVMlFmRTUweG5QQUcrclQ1NWJsZWJBelY2U01ndDdBdlk2N0laMENNdWJw?=
 =?utf-8?B?NHEvaEIzcmxMUUxSdjFMaUQrUzkzbHZIMmhsRUVtZ3FPclRZVmtlODRtNmJp?=
 =?utf-8?B?a0ZTN1lTbVN6bjhDTFgyK04ySHlxaUE0Ukd3a1dWcllCMDByeVZvcHdpd0Mw?=
 =?utf-8?B?TEx4d1BoNHIxWDZFNlJZdHBzS2cwUDVYNGlVTTRtWldCalRVYUtET3MwTUs2?=
 =?utf-8?B?TW1jOEl3eDhFM254UUpJUnphVG9MNGlBNTE2NkRjMERqVjFheFowYlJJZCtl?=
 =?utf-8?Q?WLRE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1dc69cb-c479-4381-bd08-08dd62036b82
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 07:48:18.6734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZviQqCQKCaRurs12iqsiwDteJZcziYM6VR3HZ4lAJhv363oJHX7ZbWVqpHgeMaS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8903



On 12/03/2025 14:52, Luca Fancellu wrote:
> 
> 
> Hi all,
> 
> this serie implements the skeleton for the MPU memory management subsystem,
> at the end of the serie it will be possible to compile the Arm arch using MPU.
> 
> The minimum Arm Kconfig configuration is this one:
> 
> CONFIG_UNSUPPORTED=y
> CONFIG_MPU=y
> CONFIG_XEN_START_ADDRESS=0x0
> 
> Luca Fancellu (8):
>   xen/passthrough: Provide stub functions when !HAS_PASSTHROUGH
>   xen/arm: Restrict Kconfig configuration for LLC coloring
These patches have necessary tags, so I committed them right away.

~Michal


