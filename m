Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6897DAE5E5C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023243.1399196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyPe-0001xQ-WD; Tue, 24 Jun 2025 07:49:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023243.1399196; Tue, 24 Jun 2025 07:49:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTyPe-0001ui-Ta; Tue, 24 Jun 2025 07:49:50 +0000
Received: by outflank-mailman (input) for mailman id 1023243;
 Tue, 24 Jun 2025 07:49:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NDMB=ZH=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uTyPd-0001tj-9q
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:49:49 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2418::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbf01ea5-50cf-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 09:49:46 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by IA1PR12MB8466.namprd12.prod.outlook.com (2603:10b6:208:44b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Tue, 24 Jun
 2025 07:49:43 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 07:49:43 +0000
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
X-Inumbo-ID: cbf01ea5-50cf-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rG4S/EDgGCfuBZ+FwlrD5h3POKzMh0gMCUzbK9kVg9LhksrphGbk1otve+CQPsiCstuSQxwZLAaRz1hRpWUTSkMpXQvedAnV//qX1YPMn/0jKHj7LG7vENK46M3s4SRFjEaRloWuuXE/8+c1xUafDeDufEyZUZcpJISlQItNHr3W9NmdH+3T3rWeLjyUHLX8bZtBsK2UINRwVQTKbsWc5HeJqWpG22ZhYb1bT6b7Hbmw3QfFbNMJ5/594BzPbmIp9NmQXB5bK5B0ZhVQTVeVe/V4MwXeRbyuhPwTrTseQUR5d/MUt6wwN7G0TxkfzSt3JuYfhRULYqQvS9iEnCDasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwjy3pO/5OXHLkxHZG23RgXHbFJDgzCqWHi6p1bVC0M=;
 b=yUNJ80RtlyhV5AAyzHMZ86rrM0On/vJ4kxf2wiUVRXJxvGZ+TIdqf1JfHvuSVDhJmArV+l/JHeCo9mt9sWuf65Fq84CGHQY+NE36vrv3OKaD2vS8y471weqZ2xQuAQxADuAkLRDjb0kkQJGCAYvma9JZcFlNDmJ3A9feWcHAc5xxPGmKPNou7NuFyHJpQLWnvxgSOU2X25KjpEd80n/f17eMJOLN1X2cPDjkOwYSCHJUell89X8FSjU5eeRktEVA1OsRXQsMMesvl/mpgnqbZk0izAlOtFykZFMp+QRooc6uDHLQ+rbsjD/LRgR0UtC+oPy8rLqIkVzo/fUMuJ7uCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwjy3pO/5OXHLkxHZG23RgXHbFJDgzCqWHi6p1bVC0M=;
 b=UqDzzfmhwmbF4H4Ey/sbRNDjldq+YECktP7U3bFeEeB1NvqxJdBwKOUVMuoBa6CNC0skUNlTZ8pXJw9awcxz5ydGAs0ovqzxX8lk4yiQThpPAJhPTNEDYm5Kc4tDy3ewJHK7sy9vT4nZr0CIRazSbXim+WzPO+6v+TjsJAlBSG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c0b76bb4-9330-4f54-8314-fa2c2efa8ee8@amd.com>
Date: Tue, 24 Jun 2025 09:49:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 02/16] arm/vpl011: move DT node parsing to PL011
 emulator code
To: dmkhn@proton.me, xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com,
 julien@xen.org, oleksii.kurochko@gmail.com, roger.pau@citrix.com,
 sstabellini@kernel.org, dmukhin@ford.com
References: <20250624035443.344099-1-dmukhin@ford.com>
 <20250624035443.344099-3-dmukhin@ford.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250624035443.344099-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::23) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|IA1PR12MB8466:EE_
X-MS-Office365-Filtering-Correlation-Id: c793df30-e899-4fad-369f-08ddb2f3aea7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUE1aENoNlVCeXl1SUd3MGlSY291R2YwL2FUc05QeU5aUklHNWxPOG9NZmEx?=
 =?utf-8?B?dEtHZDRtdVF6YSs3OUFOL0tCYmkzTmRRcGRnanNsRkN3UklUZURJdWZIMHE1?=
 =?utf-8?B?NmhVTm9TbFpUSVo4Z0lLSms0Zm5DZ25mQi90dUxEWC85aGNENGwvVUFjOGdH?=
 =?utf-8?B?RmNhN216Vi90UEsyWktBbGpRd0ZGTDQ2S2lpazhSc3daclRCT01JOG4rZXRF?=
 =?utf-8?B?cGpjNVBjWjhDQjRCd2UrbmwzZkI2YVhGYlh6NWMzUGs4NC9HdC80bnF4M3o1?=
 =?utf-8?B?dGo1UndySmlicUUwNmZLL1llRVJzT2VnL1VxOTRhb3dYV3lGek1ab2NUd3Fl?=
 =?utf-8?B?RWRBOXJKOFhRTFlNQ1RQUFZYQ0VoR2psbFNFQ2NSZWRvRkRwRVNMZDQwT1Bv?=
 =?utf-8?B?TGxSdEFXajBxdlNlYXBpY0p5Zk91WjhIYS95TW1qL3ZKZ1pMSFAwRDBiVkhT?=
 =?utf-8?B?cXpENE5PQXNmakh1TUZ5MW1tWHFZbVdhbjg2MGJOWVJvS3BMcW9iaXJLZmVm?=
 =?utf-8?B?b3p1TWI4aElZT05RbkJDT0NWR0xRc29DTmlDazhHNnphWWxQU0Y0dFF0ZGR2?=
 =?utf-8?B?UGdOUEc4b3Q1TVdGS3loMW93aGZCdEU0OVYzaklqOW9oZnFHY3dZVC9ydi8r?=
 =?utf-8?B?WjVJQThJMi9LVVpxcWZlOXJ2bGpMb21zb2dtN0VLeGRvR2pwVDBrWnJHVWpS?=
 =?utf-8?B?aTlBSHRHSkdaWDYxZ2hxOHFsa28rTzBuSVhmN2g1QjFITTdIMjl3TFl2U3B6?=
 =?utf-8?B?ZXFQSm9obDlxZjlPazFhUnNrWGc1VnZzOU43RUpSSG04M1VaSGgrR0piYlBx?=
 =?utf-8?B?ZU5KR3p6R2U2cHZKR3A5anQ3eEFJMlgyVUE3VGV6U3VSUzN2T1UvWUJxZVlx?=
 =?utf-8?B?bStXaG5MclJnQkxjV0t1VG5wbm5UcUUyai9QMmFnYnBDR1g5OFhuc0JMRVNo?=
 =?utf-8?B?bW5DVlJYUmphN1NKZFVQSWFHa28yb3gyamVXQnFpZ1l4NXV0Nko1V2ZnTWJy?=
 =?utf-8?B?OGNYOThEWENyeGtxTHZucFFhRFBNNUg3dWhoaE8yU3RvWmxCODJGbG5pOStX?=
 =?utf-8?B?dEdCL0FhQU5ZNE1hdjdNTDhiRGQzelpwRDQwbXBsWWYrK3ZpeFhsb2dFWVFR?=
 =?utf-8?B?djhzQkUzZW5sSTFaQ2dPNWl4Y0piaVZIaGNuOXdDbHBOOWplODFvaGFLeEQw?=
 =?utf-8?B?aVZ0NFZnS01GL3hkUTErdC9FdUE5QTJmMWMzUkhRbnFhem4xWmlvOTF2VlN2?=
 =?utf-8?B?UFUraHdMTEdDTTg0YXRjU1NCTmU3RFI0LzFBWmtmbnVsMzdOWjZPZk51dC9T?=
 =?utf-8?B?bXU3bGo1VWVUZThwSVA0OHVUcHJ0ZGs5d2FBekV3T0k1cDNoS25oSmhveG9l?=
 =?utf-8?B?UmQ3amM4WjdrSHlxaEZhbDREQk5TUi9UbDEwMkRLQ21GZVF0UytwWElUaVBV?=
 =?utf-8?B?YUdUT0JVdFVGaUxFb1FMSWJRUHVPNGNXQlZWVHFPY0g1ZVpHaWtqYTd5K29W?=
 =?utf-8?B?aTFyUjFyNnlibHVyRGhTZUxRWi9CekpSN3p6SjV5K0ZhNlpmWkJKc1lMOE1r?=
 =?utf-8?B?dXljajNWWGY4T1pFWGFBRm9rYmEwY3JXa3NYNG9iL3kzdHZjZGhlWGVQNFJU?=
 =?utf-8?B?ckNvemQ2VGtSZWNVMHFqSXdyVVoyZS9CKzh0REdvelk1SUdZWkhjU2UwZXlo?=
 =?utf-8?B?NG9hOXNoK0FzaDBZOHpyZ2I5elBtK0htL3RsUy9TZGNZditMaEVGMitnbHF0?=
 =?utf-8?B?SEFMN2tvb3FERkRtNjhab0MvdkR0c3RyTFNvZkdrQWhEUVJTVEU4K0ZUTnlq?=
 =?utf-8?B?ZlVXMTVGUUJmY3dhZEJGUWprRGdUdU4ranhNL0xMblpFaXhQZlBYS20xdnBa?=
 =?utf-8?B?dTJNd2tMWW9oZVFQZHJBNnVnMmFkMFNpRDNOTnpkNzl3ai9zT1pNUmQxOVhR?=
 =?utf-8?Q?kbG/lOSQgPY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3luVTlSR3FBbm1UQThTMWdHZVpPNkJXVU4zdnFBNWpTS3ZtZ3RvTDdEVm9m?=
 =?utf-8?B?M0p3ZlZsd2EzMW1TbUpEVUJ3MUJzKzBVb3FlYTZvb0tEMzhURnA4Qm5lOVJx?=
 =?utf-8?B?aDlZcGFjeXhROGxJZ1RlUWFXZWFndndhTDQ5M2luZUllclVtYk5hU3VtU1A5?=
 =?utf-8?B?amdLZHBoY3NlZnhRNnFLdFhHajJ4TmlPOEhUWEN1d29BSi9kVEZEZ2R2QTVn?=
 =?utf-8?B?MHJMSlBqZTdIMzVOaTQ0bW9CM1kxbWxXTWFWay9meUwydFRuYzNXVlVjREdy?=
 =?utf-8?B?MjdYSU55anZBSkVFUEZ5SEFzYVlNZmU2VFV3SktxMm83MGxjSE5kS2pVNlBr?=
 =?utf-8?B?VjZLY0ZwYlVmcmxSODVacldXZVVXZW1BUVVuSXlwMHFjeVI1ZStwSUFOWldo?=
 =?utf-8?B?akMvbkhpdjBlWDN6ZFlQL0tsbUhFZ3pyNVZZbDIzVS9VUVcrK0I4Njg5dFRl?=
 =?utf-8?B?RWhjb1VQRWtFNk5xaFhjQWZkWkNFeFdwSTJkbzlJT0pzbzFWeXA1ZWFWWTlM?=
 =?utf-8?B?andLdUV5WFdpOGtVckNDdk5kVVI3MGZPVUx3Nm1icy81VmJ5Ulo2MGdKdDhs?=
 =?utf-8?B?UFRqbkVKcklFT2pkUmdvN3lEMVBKcmR4M215MG9FWW5BTGtPeUt2Ujdobkdq?=
 =?utf-8?B?S2pDVTNiVUFQVHNhWDVMTTk1RjNyRVBoK1ZIMDM4YUp2d1dXL243QlFFMkRM?=
 =?utf-8?B?cERQZ2pJMU9hWEkxZ1Y0OXpEQ0hGRXNLTFdQL2R4cE9OYy9BaEZiSVMrSWpN?=
 =?utf-8?B?SE5pOCtuZE9FblpTTFJ2V1VQWTNRdndxWUlkdk8zcDZPZUdod2hwd0xXajd6?=
 =?utf-8?B?QjZ1OHpHdjNaSXZhOFdoZlBlblF5YW1kWVB0Ty9Vd21UampnQTExTEp1R3Ay?=
 =?utf-8?B?UGIvNERzMFlhamxGMGhMRW1naXZFOWYvbzQvL2lwMy93YVpxM1N2OTFZNGhD?=
 =?utf-8?B?V0RKa2VrdDNqQitZOC9MWktQc1FDbUo5M1RBbGt2NzJwV0pTMFVEbXZNVGUx?=
 =?utf-8?B?Rm5kRytYZVliS0diK2RxdUI0WEpuWFFUeUpaeVhNWlpHUGdtKytaamI2K3l4?=
 =?utf-8?B?YXF3Q2JlWlNLVGFCQmVjSFp5WjFvN29BMitIcWMvZjhMYjFjeHFmZVg0Zktv?=
 =?utf-8?B?ZE5XbUJFVitqaHdQNzFUL0wvaUhjYXVxL1pOVVJFcUNibzNYZVdKNEp2dzJV?=
 =?utf-8?B?Sk9IZkhBaVZQR2dtZmxkOVFydm1aUExYOTVTa1NTVmVubU8zeTRZeVRiN1BF?=
 =?utf-8?B?b3NCNHRiR0tHRFl1RG9RMytaNWNUTXkzakRqMUJDMjZYaDJqK2t5OEk1S21w?=
 =?utf-8?B?NG14TGVxcEdVaVRGYitkV1cwL1V4YzZqRXg0VjF6VkRnUEZPdlNUS3BHYTd6?=
 =?utf-8?B?S2VHM2ROdXhYc1F3dklJSXNDNmVYK1NDalZjOXQ1M2R6OGtiaGtPRFpHUjd5?=
 =?utf-8?B?U01nc2M2L1NLMG9uT2J5b1gwREZ5cEJKWkR1RjJCMDN6aWNkbWtMVEpqLzVn?=
 =?utf-8?B?RS9SazJCNHBsemRBM3F0ZU92R1VmdUptWmdFdGxWMzQ3Y1FQdkh5VXhsbzBG?=
 =?utf-8?B?bmFQV01CdGVBNnhkT0dFQmh4SnNyQXpnTDNlc2FIb3VJWU5YTldUMFUvSFY5?=
 =?utf-8?B?VHYrS0lEdHhuSTEvSjRIc3A5QUt6d1MwY240dnlrQ1NQQ0JrV3p1dHFhWEZs?=
 =?utf-8?B?V1JHWHplQkt0eVNGbUtSRzFWenJ6eUE4T0ovM0Z2TmpyaDdpQlRvSmpCOEE1?=
 =?utf-8?B?OVhWNW1Malo1ZHIzUjhiQmZqNlh5Nk1SZ2t4Qi9XeFY5T1RPdGV5WXowMm9S?=
 =?utf-8?B?WFZrSHI3NE9KT2pBTVJSUHo5eWUzbXZYaHJLK3RqT1g0UXYrVVl1VktRNnU3?=
 =?utf-8?B?ZmNUdTJ6TlBQallGWTZtTm80U1QyN0FUL0F0d2k2czZaSk1yK08xMittRENC?=
 =?utf-8?B?dFR3OTNJY1NDbm9LZm9XRmp1WCtCRDZXeVlCeHQxV3F0dGI1SFpZNEdlY3Fy?=
 =?utf-8?B?bHVldXRWOG1ZQ2t2d3BVTTNaWUwzT3VGakZnd2J1Vm5sbVJUMEpkcWtMTXNN?=
 =?utf-8?B?MGJ2MkE5ZHY4T2w5NW80SGMxNEZNQVFiTXh4eitaTEpzWHV1QjRmcHYxZlZr?=
 =?utf-8?Q?Gusg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c793df30-e899-4fad-369f-08ddb2f3aea7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 07:49:43.4786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7G3N08VjqYGoMCouDRywcY/blz3F4bhuYi7Bi8v9d88jQcH3C0h4HpHR5atPWEFu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8466



On 24/06/2025 05:55, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Move vpl011 DT node parsing from common Arm code to PL011 emulator code.
It's not parsing, it's DT node generation.

We usually keep all the DT node generation functions in one place. I'm not sure
if we want to move them to respective drivers (i.e. vpl011 to vpl011.c, gicv3 to
gicv3.c, etc.). Not sure what other maintainers think.

> 
> While doing it pick the generic name vuart_add_fwnode() for DT parser function
What 'fw' stands for? Firmware? This function creates DT node for domU, so it
should better be sth like vuart_add_dt_node().

~Michal


