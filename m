Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A3AA87A8B
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 10:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949394.1345943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4FKk-0000y0-Pk; Mon, 14 Apr 2025 08:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949394.1345943; Mon, 14 Apr 2025 08:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4FKk-0000wD-Mo; Mon, 14 Apr 2025 08:38:26 +0000
Received: by outflank-mailman (input) for mailman id 949394;
 Mon, 14 Apr 2025 08:38:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m6tK=XA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4FKj-0000w7-9f
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 08:38:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20608.outbound.protection.outlook.com
 [2a01:111:f403:2417::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdb8539b-190b-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 10:38:14 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MN0PR12MB6320.namprd12.prod.outlook.com (2603:10b6:208:3d3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 08:38:11 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 08:38:11 +0000
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
X-Inumbo-ID: cdb8539b-190b-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZ1XgOfze+dQVZ6bEIRGJFnk8KjZCnDmGl3KS4nqOoWUvB3pzKFzzn5vDweJGLEH7QgWULasPVZczJbyrwMcf6uvM23/bG2IsHI5CrcsNhTEWDNCzpaGlfumHsEGBwSUYvU9Wqh5zXn3Tz7KqKp0stx2JBDhfWLKpQITeWnyuM/klI+LETa7qnkk1zHVQtbZEb81zG+8uECthf3Pp9EqXO4VEhMa2LMnFpy6uVbMD8wew1G4dnHr7O0IhnRbgBxi5jtNCy0P/Oce2faTGu0uoCjQ4vxkBCTpgUER/297AytJA9pHU66oSZ6UjT2jjgClVGa5QEi0SyALq7qZn/aICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZK1tjQsCI74AQnsWSptWmcfJCmWCypjtZwD9Dp5C9k=;
 b=yNSG9OcpUv+UlfF5T4zZWA8PbER/KfpYgerTJHXe23lS+GXocldY/7urVzSLvpcshiaZGLl98/iOrA7J1Y/uBgI2JLawt0QSjGNbugjbJpZTSLVxIi0pXWjLn8/bpD9zyireqBH70zhoBNNL9wCr/0vMcHbhq/XVzuaYD1Tk9zmvqGEazMwh68O6tXFnqOYU1rylusmXeHHrAEGyQiF2eR3chH3q3OyqcXGi6RhVIpVkEPGQntss37hio0PfqnThr+mTbtGYrr7Svor3HI1htLbx3pYyDhylxq9rpPF20JhFkyB/Q1cwTpXifAa/Fn3bCJEraixmANo5RTABnDosMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZK1tjQsCI74AQnsWSptWmcfJCmWCypjtZwD9Dp5C9k=;
 b=p1F8wPPtGyvuCK4+EgLaUaWJvcCHhJElpO77UMijosMR3DwlekbjwAtOhx0+wLcPS6/wrnDMnkM4AIFKvq0vAxfEGDprFLV9TrIcGlPiK+omlxSTSgmxzcoIq1dVvqg7nJRSQB9l/zWRVijVwK1iiMZDVGc/H9VgEXGuhFEiSBs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f4c43d72-b403-4829-b490-46823391f82c@amd.com>
Date: Mon, 14 Apr 2025 10:38:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0148.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::7) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MN0PR12MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: a229a715-6479-4279-227c-08dd7b2fb05d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUdBSS9RblFNVk9EOFRpNEMraHVqckZWd1U3cmwxNjdSLzdBZHpGS202UlAr?=
 =?utf-8?B?U0xrL2NDRzNvelppSVJDK3J1OHdPdlVTTFBCbkJrTDRuNFVuN0hzK1FwaDJi?=
 =?utf-8?B?SzMxU08vcE5GckdISC9QT0lIK1M2cjNONTJpZFdxUU1BRlNEaVJVempYbXdE?=
 =?utf-8?B?c1NtZ3h3RjEwbFVVNXdkZ0dsUC9FRGt2Qm5ybTgrYU52clFvZ2dyYlFsLzQ0?=
 =?utf-8?B?eFR6SGlhNW83cWNGazYrdklLNjduMjdkbEg5eXVhc2pndmFIRXQrK0YyRUV3?=
 =?utf-8?B?cnN5TnUrb2pxYnRZUWk4RW1OTVhnYk1jbHJ6dFFSTnlqd1grMmgvelNTVjhr?=
 =?utf-8?B?bTY4K3pSek1aeWlmck4xd2o5WFdrUzJRYUROV1EybWt0bjlEbEI0QkhaSTRI?=
 =?utf-8?B?YnF1M2FQL2Y3NFowOFdBdE94Uk5jNjFreUljbkgyTnJHcW43czVsMlFlQjlX?=
 =?utf-8?B?Vi9BdGtPTE1UTTQycmpmaFl3SFN2ZVlidFRCUUY0cnowbHlTREtnVWZpWmM1?=
 =?utf-8?B?bW5OMmVJR3lyYU52aDB3ZkRZcHF1bGJvR1psakc4R2RoL0MyN0RpS0hPbGsx?=
 =?utf-8?B?N2ZKYldWQzlVeHBFcmFIb0FoNW9HMFd6RkNnTWY4QjAyQlFQNlM0UHRnT2E1?=
 =?utf-8?B?dGQvOVJsTCs1QVhKeGloYVRFSDNWNGdRYi9JcWljanR0OTVuTzBpSlFwRWFm?=
 =?utf-8?B?bnBXN2pWTGNLejdkUnRvVkExbHRCL3JFWmlhR0MzTEtmZUdibytqOWpxd3dD?=
 =?utf-8?B?OGZFcHR4NmcwaXYzbkJxWVFMK2V1Y2VJUnZnaTczcDY5Yk03Vk5ER0tCQTVG?=
 =?utf-8?B?djVWeFVmZG5weENzOEJYUmxRL2N0WUdMNDZFRGh0Rm5NZ25waCttZVBBTjZO?=
 =?utf-8?B?MFRpVm5YQ0NkUmdqTHhEYVFBWnFPTnZrMjFvZ0lCbzZaYnVBb0dMckR1a0M2?=
 =?utf-8?B?blBPdjgzQVp3VzJXN3dGbjJmWWIvN05pREZpYUlZSis5Nzh0K1A1bktKbUZj?=
 =?utf-8?B?a1M0M3Qva21jTmNtSE5NbE9sTDRQR2lJSzZLc3hTdUpwZ3VkbTRCc0piQ2ZK?=
 =?utf-8?B?ajZBb2E0U1lVbTVXeTdDYjA2UjlxU3lQRUx4TE1hU1cxNU9YRENZK3ZpREZI?=
 =?utf-8?B?V0ZwdXdCUWM5dDVYUEFXRkZaeDV4ZFZQQTdMdTRVL3RpYVdIS2UzVmVmWlVp?=
 =?utf-8?B?YzQ4VEZCN09XS3NEck5mZlBLTDFjY1g5djVVWXlaVkVLRVgyaUdzU1dnRFRZ?=
 =?utf-8?B?Qjdqc3dwRTFkRzg2Uko5N2tSTytUenNaazJvZXQwWTZMcnNJcU4rSVVlVFQ5?=
 =?utf-8?B?dXc0c1hQekdRb3lZakRnZ20rZWxDZk9PK0NCUjhDMkh2NUJEcDZ0dmFINHdq?=
 =?utf-8?B?dDFGMW0wUG1oM0EvYzlMSXA0Q0xESExyTGh3c1FxYUR2U2NySUhFeWUrNWR6?=
 =?utf-8?B?STZOUzBhZWx5U3lXd1RqZkhRdG5EaGtpRkVodmNFY0h4MndVWUJOM3dqWkht?=
 =?utf-8?B?TXBZYndoZ2QzUW4xTjNQNlJFcStZZURTK3RkUkpEVlIwK2c4VFA1b0RmTzZV?=
 =?utf-8?B?aGtEZFhQQjhUZ3IvelRjRDNacFBwbCsyVWdmNVExY0lINkJINE9GT1dFVm55?=
 =?utf-8?B?V1NvbFVsSk5YQTd1U1Y0SHp2Z1FQOHFQQnFzUVZUYmpUb00zdUU3d0l3V1U3?=
 =?utf-8?B?K0p4MXNnZG5HbnZUQWM4ZUYrbFZxMkVEWWhFS0tRNElVN0N1ZFo2TFRMZlI3?=
 =?utf-8?B?Wk9BV084OGxSV0RGNVl4UzQ2cXNoL3h3cm5qcmFyVGl1R24zNkJ5ZWdVMzZs?=
 =?utf-8?B?d0VSdmhZenB5Z0JSMUhJbGdYeEYvTzl6Yjl2a0ora3VwSkVJQ01jek1QdjJk?=
 =?utf-8?B?YnJubmh5Q3RCSlRUSm1pMElGMThjcmt0UTY3eEJxQ0pIeG1DeTFaajZFc2lL?=
 =?utf-8?Q?Tn8NoqcEuV0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1JSTHhxRUdzOWJ5TERBN05kMHpzc2JqZlVjdWw3UGpJMEYzcWVxendZU1ZO?=
 =?utf-8?B?bWQ1b1NwZlNJUzhWd0YyU0VJL0lRc3BxSVNTYXBOT2JIdUJQc2hsWElrMlh6?=
 =?utf-8?B?ZVpYL2ZpRkhsRjZEUWczeU5Cd2NCZTZuYW9WMGRiRERRSnlCOTByek9mU2lk?=
 =?utf-8?B?Z1VxMHJMMThzL2ZlWUo3bHZvdEZJQXhtQXNFZ2t2ZlR4aHJJNlU1ZnRLUUh1?=
 =?utf-8?B?K0pKdmljejU5ZjZ2TmtFZlpacDFjSG9BbC9vd2paSUdZRDRwa1U4OXZYNTBK?=
 =?utf-8?B?NXM5NXdEUFBHeWs2Q3Bta1ZQdWg2ZFFkamY3K3FqM0JPVlBtOG9SZUg3ZnZI?=
 =?utf-8?B?MUpYWm0wKy9md0xEbCt1WXFJVWxEbjc3eGsvUGgwNUNReHA1SkkvUFdnVDln?=
 =?utf-8?B?RnAwYkNGNWxEbWtnZERWN3dyQ1RBK0dTcEV1NEhueWpGcFc5STB4NEQ1cmJk?=
 =?utf-8?B?UTBJODdPZGZYM0ZxMXBaeXpwMysydFpOKzB3S25mSzgvckV4Y2Vac0hvV2xY?=
 =?utf-8?B?UW9jc05icTlFWnd2eTRDRlFZcjJybW5wd0J3YjRmVmtrbDZNZzFESThsR2ZQ?=
 =?utf-8?B?V05YSlRKUkgvd3NDSm5CLzdBUTQ3WjUyRGdvMTBJWEsvYnFUV0l1OVhuQmRx?=
 =?utf-8?B?WGV2VTVldkJCY3NvTWdEME9waUY5UWk4NitPOXN1OURMUCs2L25PMjdCcUh0?=
 =?utf-8?B?NjF4YTVYQXIvOHA0d2xqK2tLc1ZQNWcvTEptdjlnSDJQWjQxaU5VZGVtQ1hF?=
 =?utf-8?B?OTVXMkY4b2UzRXd4ZThhMVVWWnRLVFRJbmY0SjdRYVZiZ1VsM3FIL3lxS1I3?=
 =?utf-8?B?djJYdnh5VGJ4YmI5U29JeXVVS0dNbHBQNnZpZFN3eWhOaHZkRlc3Zzl2TG0y?=
 =?utf-8?B?S3A1TWhDaHdvU1VQNkppRTZNNnIvVWtRdnBhWGlkRE9yZlQwbmYxK3k1MUhF?=
 =?utf-8?B?Tm4zZmRYYTVGYUVpS1lSMTdFenRhNk9EWU9UVmVQdUdTSWd4WUdtZHY2SUtL?=
 =?utf-8?B?dFZOc0szT0FaUjhmc1pNcWZzQmdPRDl2SGVEVXRMRVYrSnVHSTh0RjNsdURW?=
 =?utf-8?B?bFBRekE4b0J2Z1FDdG1kMlJHMDFKVHlrcU1qWXY4K2dZT3FNZk5kQmlSeThE?=
 =?utf-8?B?OXlKeVZsempuQVBZbFhXK254SzFKSmhpaUtURklselQyWnZlZUdtR3FxUTBl?=
 =?utf-8?B?ZXZwakhuOWhtRnFDQzZGdkdvSFNRbjMvbTNFSDVhNmNGdSs3SkU0ZVpKSDBo?=
 =?utf-8?B?LytRN0ltTFJmM2l5MW1iZHVYVWd1YnZQQnl2RkVSK1ZZY0JLM09Bd3BCdG16?=
 =?utf-8?B?QmZSdWxrTzFOMFpGeWN5WG52YXdhM0xWNFJwNFNkMWE0T0ZXam5sMHpCTjNZ?=
 =?utf-8?B?YVlIeTRZZDh1QUZWTEt0a2Joczl1dHgyTHRsbk1pMEdJN3JqTHdnVnpMNHVU?=
 =?utf-8?B?b1lTTHQ3VkdMQmN0YXVXdkExSTJ3QURCR3JZWkFIK2xoaTc0bnlHUXhzaWRy?=
 =?utf-8?B?VlVnSVMyRjBraDRKM3ptZHBOQ1JPcGRaQXJteGI2c0lWdkEzQ2JrV1k1TFRX?=
 =?utf-8?B?SUlsZHY4anRHbUs4eHQxcHdTMTdBS2l4cE05aFAzZzFacEJabWRhcnRQMnli?=
 =?utf-8?B?VXM0ZzhkMEo5MGx3ZVlKZFdRSFlMY1hvemNrLzJjZXdBZFpRVmYxZ0hlazky?=
 =?utf-8?B?Mk96Mnk3N3NHV2ZyMGM4NkxnUGRRRnRzVzI4azNsOGxZZ052MGxOdGpRWGhF?=
 =?utf-8?B?bTd5V3lNVXVRaHJFN2dzNm5QU1ZGOVVKRUI1cloySVVabjVTUElvWVBrVWZw?=
 =?utf-8?B?Q3ZwNHQycWtwN3hnbXJKNEUvWEZyU3RIN2hoUndxbVdueVI4VGNMZUdaYXZS?=
 =?utf-8?B?TUk2K2pkNlRtbWp2ZUREZjFnUHJ4bWlMVXZQNlQ3VkMzekk1SDRSRk5GS1lv?=
 =?utf-8?B?bWN5d25hVUtOYkltMFpRVERjVCtveU5EN2x0eEVmeVNha25ER1N4Mk5ySCt0?=
 =?utf-8?B?djZkb05ZeVZpSTBITXNMZksxTkVXSTR6L0VUMmRsQ3c5MGlDa2toY1pqZ0tm?=
 =?utf-8?B?aFA0c0tjWG1rcWJpUzJubUtIMHFtQ3h4dlc0ZGtNSWg2QkNHV1V0V25aRVB5?=
 =?utf-8?Q?mUF8kOEQ9lBM5MxLiL7/T+VLy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a229a715-6479-4279-227c-08dd7b2fb05d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 08:38:11.1040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvaHP9EwSU8FBHvGJduPipAtvDfZnR1Kkr3u/CQb6U9JIMemxcWiZa3TMuMDOG0A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6320



On 11/04/2025 13:04, Ayan Kumar Halder wrote:
> Boot-time MPU protection regions (similar to Armv8-R AArch64) are created for
> Armv8-R AArch32.
> Also, defined *_PRBAR macros for arm32. The only difference from arm64 is that
> XN is 1-bit for arm32.
> Defined the system registers and macros in mpu/cpregs.h.
> 
> Introduced WRITE_SYSREG_ASM() to write to system registers in assembly.
It really reads odd when you write what patch does in past tense.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes from
> 
> v1 -
> 
> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
> being done in enable_mmu(). All the mm related configurations happen in this
> function.
> 
> 2. Fixed some typos. 
> 
> v2 -
> 1. Include the common prepare_xen_region.inc in head.S.
> 
> 2. Define LOAD_SYSREG()/STORE_SYSREG() for arm32.
> 
> v3 -
> 1. Rename STORE_SYSREG() as WRITE_SYSREG_ASM()
> 
> 2. enable_boot_cpu_mm() is defined in head.S
> 
> v4 -
> 1. *_PRBAR is moved to arm32/sysregs.h.
> 
> 2. MPU specific CP15 system registers are defined in mpu/cpregs.h. 
> 
> v5 -
> 1. WRITE_SYSREG_ASM is enclosed within #ifdef __ASSEMBLY__
> 
> 2. enable_mpu() clobbers r0 only.
> 
> 3. Definitions in mpu/cpregs.h in enclosed within ARM_32.
> 
> 4. Removed some #ifdefs and style changes.
> 
>  xen/arch/arm/arm32/Makefile              |   1 +
>  xen/arch/arm/arm32/mpu/Makefile          |   1 +
>  xen/arch/arm/arm32/mpu/head.S            | 104 +++++++++++++++++++++++
>  xen/arch/arm/include/asm/arm32/sysregs.h |   9 ++
>  xen/arch/arm/include/asm/cpregs.h        |   2 +
>  xen/arch/arm/include/asm/mpu/cpregs.h    |  27 ++++++
>  6 files changed, 144 insertions(+)
>  create mode 100644 xen/arch/arm/arm32/mpu/Makefile
>  create mode 100644 xen/arch/arm/arm32/mpu/head.S
>  create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
> 
> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
> index 40a2b4803f..537969d753 100644
> --- a/xen/arch/arm/arm32/Makefile
> +++ b/xen/arch/arm/arm32/Makefile
> @@ -1,5 +1,6 @@
>  obj-y += lib/
>  obj-$(CONFIG_MMU) += mmu/
> +obj-$(CONFIG_MPU) += mpu/
>  
>  obj-$(CONFIG_EARLY_PRINTK) += debug.o
>  obj-y += domctl.o
> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
> new file mode 100644
> index 0000000000..3340058c08
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/Makefile
> @@ -0,0 +1 @@
> +obj-y += head.o
> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
> new file mode 100644
> index 0000000000..b2c5245e51
> --- /dev/null
> +++ b/xen/arch/arm/arm32/mpu/head.S
> @@ -0,0 +1,104 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Start-of-day code for an Armv8-R-AArch32 MPU system.
> + */
> +
> +#include <asm/arm32/macros.h>
> +#include <asm/arm32/sysregs.h>
> +#include <asm/cpregs.h>
> +#include <asm/mpu.h>
> +#include <asm/mpu/regions.inc>
> +#include <asm/page.h>
> +
> +/*
> + * Set up the memory attribute type tables and enable EL2 MPU and data cache.
> + * If the Background region is enabled, then the MPU uses the default memory
> + * map as the Background region for generating the memory
> + * attributes when MPU is disabled.
> + * Since the default memory map of the Armv8-R AArch32 architecture is
> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
> + *
> + * Clobbers r0
> + */
> +FUNC_LOCAL(enable_mpu)
> +    /* Set up memory attribute type tables */
> +    mov_w r0, MAIR0VAL
> +    mcr   CP32(r0, HMAIR0)
> +    mov_w r0, MAIR1VAL
> +    mcr   CP32(r0, HMAIR1)
> +
> +    mrc   CP32(r0, HSCTLR)
> +    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
> +    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
> +    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
> +    mcr   CP32(r0, HSCTLR)
> +    isb
> +
> +    ret
> +END(enable_mpu)
> +
> +/*
> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
> + * regions.
> + *
> + * Clobbers r0 - r5
> + *
> + */
> +FUNC(enable_boot_cpu_mm)
> +    /* Get the number of regions specified in MPUIR_EL2 */
> +    mrc   CP32(r5, MPUIR_EL2)
> +    and   r5, r5, #NUM_MPU_REGIONS_MASK
> +
> +    /* x0: region sel */
> +    mov   r0, #0
> +    /* Xen text section. */
> +    mov_w   r1, _stext
> +    mov_w   r2, _etext
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen read-only data section. */
> +    mov_w   r1, _srodata
> +    mov_w   r2, _erodata
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
> +
> +    /* Xen read-only after init and data section. (RW data) */
> +    mov_w   r1, __ro_after_init_start
> +    mov_w   r2, __init_begin
> +    prepare_xen_region r0, r1, r2, r3, r4, r5
> +
> +    /* Xen code section. */
> +    mov_w   r1, __init_begin
> +    mov_w   r2, __init_data_begin
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
> +
> +    /* Xen data and BSS section. */
> +    mov_w   r1, __init_data_begin
> +    mov_w   r2, __bss_end
> +    prepare_xen_region r0, r1, r2, r3, r4, r5
> +
> +#ifdef CONFIG_EARLY_PRINTK
> +    /* Xen early UART section. */
> +    mov_w   r1, CONFIG_EARLY_UART_BASE_ADDRESS
> +    mov_w   r2, (CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
> +#endif
> +
> +    b    enable_mpu
> +END(enable_boot_cpu_mm)
> +
> +/*
> + * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
> + * please the common code.
> + */
> +FUNC(enable_secondary_cpu_mm)
> +    PRINT("- SMP not enabled yet -\r\n")
> +1:  wfe
> +    b 1b
> +END(enable_secondary_cpu_mm)
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
> index 22871999af..8d7b95d982 100644
> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
> @@ -20,6 +20,15 @@
>   * uses r0 as a placeholder register. */
>  #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>  
> +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
> +
> +#ifdef __ASSEMBLY__
In previous patch, you had empty lines surrounding the macro.

> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
Hmm, for arm64 you surrounded msr within "". Any reason for these style changes?

> +#endif /* __ASSEMBLY__ */
Why #endif given ...

> +
>  #ifndef __ASSEMBLY__
this one?

>  
>  /* C wrappers */
> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
> index aec9e8f329..a7503a190f 100644
> --- a/xen/arch/arm/include/asm/cpregs.h
> +++ b/xen/arch/arm/include/asm/cpregs.h
> @@ -1,6 +1,8 @@
>  #ifndef __ASM_ARM_CPREGS_H
>  #define __ASM_ARM_CPREGS_H
>  
> +#include <asm/mpu/cpregs.h>
> +
>  /*
>   * AArch32 Co-processor registers.
>   *
> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
> new file mode 100644
> index 0000000000..e2f3b2264c
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_ARM_MPU_CPREGS_H
There are already 4 header files in this directory. Why don't you look at them
to get a hint as for naming the header guards? You don't need ASM here.

> +#define __ASM_ARM_MPU_CPREGS_H
> +
> +#ifdef CONFIG_ARM_32
If you look at cpregs.h, we only use #ifdef CONFIG_ARM_32 to protect aliases.
I'd prefer to follow the same rules here.

> +
> +/* CP15 CR0: MPU Type Register */
> +#define HMPUIR          p15,4,c0,c0,4
> +
> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
> +#define HPRSELR         p15,4,c6,c2,1
> +#define PRBAR_EL2       p15,4,c6,c3,0
> +#define PRLAR_EL2       p15,4,c6,c8,1
> +
> +#define MPUIR_EL2       HMPUIR
> +#define PRSELR_EL2      HPRSELR
> +
> +#endif /* CONFIG_ARM_32 */
Emtpy line here

> +#endif /* __ASM_ARM_MPU_CPREGS_H */
> +
> +/*
> + * Local variables:
> + * mode: ASM
This is not ASM file.

~Michal


