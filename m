Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAECACB4932
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 03:48:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183514.1506181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTWik-0008Fn-C5; Thu, 11 Dec 2025 02:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183514.1506181; Thu, 11 Dec 2025 02:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTWik-0008EL-9N; Thu, 11 Dec 2025 02:47:58 +0000
Received: by outflank-mailman (input) for mailman id 1183514;
 Thu, 11 Dec 2025 02:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cEbC=6R=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vTWii-0008EE-Sk
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 02:47:57 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cac26896-d63b-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 03:47:54 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BN9PR03MB6090.namprd03.prod.outlook.com (2603:10b6:408:11b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 02:47:49 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9388.013; Thu, 11 Dec 2025
 02:47:49 +0000
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
X-Inumbo-ID: cac26896-d63b-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weP7F7AZ8fZceubwkYN0jJmxDro0GOQsl3OvuRzGUUgQ0ZQIq12yN7/bZsGiKwL9DMbg1+MrwV9ZaCydbJZkRPUYJJlClAM3B3rEOSqM+689VXiPQosIYVqu9dZ4STRFVyOCijTm1KAreEaW9kSZ0XOc/EdScuKR9bcpcK6C8K7PbI6vPVC970FfYDT7fmUKsXRjbOUwjNH1nwixsdgxB0Gny6fUDOMn77VKyDLpZpBmTPKIu8satjHFEYSBVSvbHFSKsh9D7WWsD5hFkrbwY2srinIY9SCAHSijh6EHUZrT1pMmiKvQyKtXulegPvN6PbytpijfgI2Hgsfj/bowtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfjvDfqrrIQVuGxOU9FYTJ2YyN24FTyo6wWdwVgCMPQ=;
 b=yC3oZ7dBir3Z4Q7qeestEiNDrVVISZcFO0MdKm4sBw2bb8m73TcHGZU0YERVs5KpSjSxH6EOsdXciDDFeeSooIrziUunY061p4ihdxhpaymZ7UujSvvTEgqejyM1uk6Rx6cO+Y+FPnj1BpJ0D1v1E8sD1EMMpVbMQ4NfHHekc0VBJ5QFIMyMzuR17ba3llH0aDH8dyH9dmwZ5MzyO+sBfWsBd/1h38HkzY1dnNPmU3G3uPy7o9qTJDTgElGxDfX0Yti/IdOUZQ/LcxDLcGU9P6idgh7ZtOWZoXFjMq6SVXYl/I+SSgPfS5U2N4EpOqH3biYjrwYkX3CE+RtmMaConQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfjvDfqrrIQVuGxOU9FYTJ2YyN24FTyo6wWdwVgCMPQ=;
 b=HrWlyNHJLpJnVxO04A+cn0u0V+dSMoX8fYRWOmRc6LUAuGGfCJLEuO6oufhzNeAkbaoOyT+S9NczwAmhPPWyKCV06ouAbySR8VNBzCxI7HSvJWH/IuV4em0kPyBdhEuNya1mTOwLGy6HJjJyiW5ypPSH+v61xvZPZgIUD3Z0VO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <13a270cd-b0bd-4565-9158-0e1728aef84e@citrix.com>
Date: Thu, 11 Dec 2025 02:47:44 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Victor Lira <victorm.lira@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: KEEP Re: [PATCH 2/2] xen: Add CONFIG_GC_SECTIONS
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
References: <20251209214728.278949-1-jason.andryuk@amd.com>
 <20251209214728.278949-3-jason.andryuk@amd.com>
 <ed620cd5-9630-4987-bd5c-9f69ae2c2609@citrix.com>
 <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <43d30e02-f818-4cf2-98c9-4182a2f65f64@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0247.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::18) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BN9PR03MB6090:EE_
X-MS-Office365-Filtering-Correlation-Id: c8e4188e-6ce1-4663-7db0-08de385fabee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk1pbEY2ZzhERG42TktRRzZOUnlyekFvbEJWYzJ4RVJvOXJmNDVpSDdBV3Q0?=
 =?utf-8?B?dWxSaEdQMHBybVd6a1BndHcwS2Jlc1ROOWVrNEpnSVZMc2l5SGw5R1pUY204?=
 =?utf-8?B?b0k1azR4c3IyVnFCRWk0a3k1QWNmRWhXbzNhSFNRTmdWTXlIaFFJRFp4eGM0?=
 =?utf-8?B?YzRBQk5uTmRXQTNOQzFTUlhGOTBDeUd4MXNYY0dmNEhrd0xCanA0QU5aT2RW?=
 =?utf-8?B?Q2RTQjNDK3dYSGxCY2ZacWRPUDFWV00xREYrdG00N3NlczhpbkRTaEJBZlFF?=
 =?utf-8?B?QXNoZVc5YkhHZHRsT0dWcytHMzBKcXd1cmNJUUVuVGo2UTV3VWRPWnppY3NY?=
 =?utf-8?B?OXNUWmNCTXlPYWMwU2htQVlsVXcwSFh5MThwZFFEanNUN1hseHVZZ0VVQ2lt?=
 =?utf-8?B?ZUdYbEZQbkJrdEd3Y0ZvVVBISXlWNEFHQk9CelVRL0pBbVVvU2FQT0dvekZO?=
 =?utf-8?B?L3kxeERleEZZV0I1a2JjSUxMazBKV2EwSVhhRzZEUkprQnBaV1BtKzYzenZB?=
 =?utf-8?B?b3FtSFI1cklDMExwVjE1azFKRnBMNjM1V2pLUXRMczBqUlErYm5KeUhuWHVs?=
 =?utf-8?B?bzhpTEpWTFJOek1WMFE0TmMyam5DVzlrQS9vNzMrbzlMa24rK1Myazg4blpp?=
 =?utf-8?B?K2pUQURBVjJNV1NLL1FGYWk3aVBDUU5KSHA4Qkd1OUErOWc3THdqKzVKTnMy?=
 =?utf-8?B?Y0lNOGV3K1h0dktlNC9KZXpRNGRWTXlHbmNtMlRZN0FndWJkZE5mb0xWRmlP?=
 =?utf-8?B?YlF0MllFaG8xdHFldTM3d0oraFZybGphQ0xMSDI0Tit0dTVtSWhMQXNWY2V4?=
 =?utf-8?B?czhiYUxZVEhPU1RldnFjWGVWRytLaHI1ZHQzd3NnQjgxaGRHdWRScW82UHkr?=
 =?utf-8?B?T3BWQ1ZSN0dqeTZKd1pRVHFORHZVZ3hxclNpRFZmYkpsby9oZzNWSUtWa0ox?=
 =?utf-8?B?cjNBdnhzUWRodURESEZOc0M0Ymp1TmU2SzZSekRZU2RpYm95QmtiK3kycnRl?=
 =?utf-8?B?NWxMQk1PVVVCT1llYVBsVlVaZkdDYVF2Qy9zQ1pkQVZhYmowU3ZlZXA2NUsv?=
 =?utf-8?B?d3pFUlV3Y0ZDUitZZTJSWXJPV3JrT2NsV2dxM3NNYWtOSVNTKytZWjV5UDQr?=
 =?utf-8?B?eGNaRGxrMUM0VDc5cXd5VzN3NlBUL2R0WTNxQnhOMDFFL21GbWdndWdiNTV1?=
 =?utf-8?B?VmhITTd0YzhEbTFIRkxGSUhXczlyVGRWSXdmWnNGVGlUa3NuR0UzSXE3dkZx?=
 =?utf-8?B?OTVheDdMQjBubVNidE5qNTU1dE9WaU1mczJBM004d0ZnbnkvdE55TnlmbHJY?=
 =?utf-8?B?blB4Tm90cjhMemZna3hCVExaV21yaUFNdmdjZVFRNWZqY1QwK0tRSDBMQ0JE?=
 =?utf-8?B?WkpFaUQ0VTZNOGdTeEVGdyt0ZVNmZVhCVm5zZDdxMUJBa21oUG4rMG9VRzdT?=
 =?utf-8?B?Wkdmb2lLZDZEWUdGb2tFUGc5UUlmOE5QTlNNK2owNk5LdmNjdDAxM1duWFFZ?=
 =?utf-8?B?MXBBZUpLd0FsNmRJRHhTek5zMHNpUXFNMUh3WWhDdW5FTGFYblVNU3ZOQVpL?=
 =?utf-8?B?dmUwREtZQXd5amlJWXovQmY2b3hQQVE2Q2JCa01WQWFDb01sWkdaWEU3VVZL?=
 =?utf-8?B?YzNTbXgwa3JyajJVTnlyTm0raEkrYnpyV3Q0MVlmeXpaeG9SaiswNDRpaHJH?=
 =?utf-8?B?azZpOUhISjR1c0lrY1IvSG1oRHVLRk9ndTV3S3ZFZzhuZjVNQWMxRUlLanBz?=
 =?utf-8?B?ODZvWmFyM1BTL0FoeVVPYlN2SisvOVZJRWFTVi9JTnUyUDVOV0JOck1pY3Ux?=
 =?utf-8?B?U0xTU045WTBUZnhUdi9XVU1iK1owcnMzL0FvcGlJL3h5NzhHWGZ1NVE4MU1P?=
 =?utf-8?B?aURPTWJhVUpVUVRIUjZ2enZ4SkQ1bFVJQ0VBak96RVZBelNSdVdQcVU1Ty9v?=
 =?utf-8?B?UXNwSFltUDkzQ3JZcHd6d1RVNlk5MkJaa0ZIREx6MzJCUEt5NHRuaVhTeE9r?=
 =?utf-8?B?cTlya3lhSEdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlpxNng5QjhtYkYzV0dZQ3JsOXRXK2dpZWtiNmNTOEVibUVlS253L3k2d3B3?=
 =?utf-8?B?WHB3cmpVMFA0NmIyUzZ3bUNtYjNwMk1sMlRSYmpad3R5OVE4bk56OEJWYThC?=
 =?utf-8?B?MVE5RXE1WFV2SGk4OEh4SHVkWkhzSC9lRzk1MS92S0VUTk5UaDdXU1p2bUV5?=
 =?utf-8?B?SU5QVGtLNXl1SVFmL1FtdkNiNjFUbnh2aFlRUkplZWpteHhiQmVsbEZMSDJK?=
 =?utf-8?B?YndSNjV5ckZQU3NqR2lGRThpT0hCdVd4WmlNMVJIaFdpLzFUS3NuU05MbzB5?=
 =?utf-8?B?eHkyM3V0NXpkOStJeXRnLy9kWWdHS2E1ZFErODd0RlNhRCtxV0tESFRkcC9m?=
 =?utf-8?B?VjVLT1F5dkVVRDFKUXdyalFyQmlqNi9lOHVsckcySVg0aDZMdllIWm5ZOXZq?=
 =?utf-8?B?eFYzendtUHJzNGVFbllsRG9TS3F0Nnl6NW9XQUI4czkzamxScHkvSFpxNnZB?=
 =?utf-8?B?Q0J0aDloamMzNnEva3BOMVJlSmp4c2ZlNVNmSk9aNHFMOHdNenJMNlZsaXVF?=
 =?utf-8?B?dWJ5WlFRazlDSDhMUlR5MGVvNExJc3doR2hZejFHdzY1T1NTaHU2bkJ2OFlM?=
 =?utf-8?B?aG14UlJkVjZvb1IwZktlR04wUEFTQnZkci93WDNsNzU1WFZBSVVHaXhUT2pB?=
 =?utf-8?B?MHFaYm14dVJiaTlKMHlLV01UdGZSWWRaVVlsMC9FcHkwSDB1cG5wOSs0Q1dz?=
 =?utf-8?B?cVlRTnE0d0h0bEZNOGhLaUtEeVcvc1Uvcm5wU2JFbVZxVkk0djNEWFBaeTJT?=
 =?utf-8?B?NEhKSHk4SFdtMEVzdE1hMmh1VTkvNm9ZZllXMTd3YnFJR0R3UjJZWHJ0Ynhh?=
 =?utf-8?B?WTJyN3Y2TzdwaE9wV1ZySjdmNG1qL1ZoV3RGdm5BUWs0YWl2ZUZLMmpRTDhD?=
 =?utf-8?B?ajJMaWNReDVRd2NKQnRhRm9LTlJ4andieWN0NFA3clRLOVovd3haTXE4amtj?=
 =?utf-8?B?Sk91ZlVnYXlBem8yeWdnWVpwZTR2aW44VC93OVRLMERHL0hVY25XbkhhQ3RH?=
 =?utf-8?B?bzRudjdra2NJL1N6Z2Qzc2RNZUx3d3I2bXBWeUJVcW82dnFudmNudWgyTVU0?=
 =?utf-8?B?MHdqYUtEb3NGUUZGZjBIMUMzUmVCSlp6YkcwRGU1b3ZtMUhITDVPNHBqdTZD?=
 =?utf-8?B?amRCVTNjYVRqdGUxejc4c0lBZzFOenI4YlorY0hHdVNxVURtamtnakp6NXZ2?=
 =?utf-8?B?S3NxWEZHTmlSZlZUZ1dybWxWM2p6YTgwLzRxVzhKbXlaN1VnZ0NwYktEcXJD?=
 =?utf-8?B?VTVoRDQ5TEpUcDM1WTAwaTNoL0ViMTVLWE44RGJxcHVEYkd5MjBUaWxGTUd6?=
 =?utf-8?B?dG1ZK2FrdFU1SC9DOVhZTTBPbGhwTlFNeTEvV1k5QzFBRUs0azF6aitpVWdt?=
 =?utf-8?B?ckdqZFcvWjAzWkZQVlYwVWpudStubVVidTg2VFluQUNvRDdXU3NuRXpNdVZP?=
 =?utf-8?B?aHl2SlRURCsvR1MwTkFZRmRuVFFIUXhMaUNONHE1K1A5WUxhcGQ2OE9oMXo5?=
 =?utf-8?B?NGZYVm5IdnlSL01JYTBrSGxkdHRSQjJsdWJpV1R2RUhMcmNwbXlGbWhEdXRT?=
 =?utf-8?B?cXV3emJUR0VjdTNPQ0xBVFdFZ2VLTnR6S2FnWG9INUk3YUtVTzY0T0N2UGpH?=
 =?utf-8?B?Z2xPOGh6c0RoeWdZdzlzKy9qTFpGRDFrK08zUVd4S1NlY3RJWW5Xc1plcWVj?=
 =?utf-8?B?NUNCY01wNVBYYXBvVk9aYU1JbXZNL3FXU3hNKzRGOXhRekMvSGJqKzkxQlJM?=
 =?utf-8?B?aGRXUWlBeWE4NXpUQVUweWRIQllPSHI3Mno1OWhnbmg2VEJQMnRWaXc1L2RR?=
 =?utf-8?B?YjBLekQ3Q3ZlWXFvb0NCWGUxbzB4QVZNYmlXOGI3ZDFqY0UwZkpnRlVGdDBH?=
 =?utf-8?B?cDJGWnZXL1RaQ1ROT3NIT0lVdHlKR3MvdGx3cjM3aE5JZDVXVFhiNjJYbHJE?=
 =?utf-8?B?WEVDSWY0blVXU2hFSDFHY3E4TWtJem5lZzZCSFEwVFRFa29tRURvYTVQVkxk?=
 =?utf-8?B?MXNSTWs0MUc1QUEvUnE1UHorYlBHakFGRzNycWVNODRTMzZVckp5bGxOZ3pk?=
 =?utf-8?B?V0d0YVZ3bmJLZUNmZC90MVJ0cWJLbFcxcUZmU1BkQmhlTFNhOHY0bGpVbHNL?=
 =?utf-8?B?cVloU2JIekpKL1l4bldQQmxVdDVic0JkSnNsWEZTQkgxZUF2K203c0dGL0J3?=
 =?utf-8?B?OWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e4188e-6ce1-4663-7db0-08de385fabee
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 02:47:49.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xv0P7vo8en+97gmmBdqhd6REGlVKisyVCLw70CBxlI11YUINd5L531A9Tq3wwsoO3e3dwB6Qw4WGzIbLFiQxh2xuvMMnTDpkjGASycHIkdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6090

On 11/12/2025 1:28 am, Jason Andryuk wrote:
> On 2025-12-10 11:55, Andrew Cooper wrote:
>> On 09/12/2025 9:47 pm, Jason Andryuk wrote:
>>>          . = ALIGN(4);
>>>          __alt_instructions = .;
>>> -       *(.altinstructions)
>>> +       KEEP(*(.altinstructions))
>>>          __alt_instructions_end = .;
>>
>> Thinking about this, what we need is for there to be a reference tied to
>> the source location, referencing the replacement metadata and
>> replacement instructions.
>>
>> Looking at https://maskray.me/blog/2021-02-28-linker-garbage-collection
>> might be able to do this with .reloc of type none.  In fact,
>> BFD_RELOC_NONE seems to have been invented for precisely this purpose.
>>
>> This means that if and only if the source function gets included, so
>> does the metadata and replacement.
>
> With Jan's -Wa,--sectname-subst changes added to CFLAGS, this seems to
> work somewhat.  I'm trying to make the ALTERNATIVE place relocations
> against the .altinstructions.%%S and .altinstr_replacement sections:
>
> diff --git c/xen/arch/x86/include/asm/alternative.h
> w/xen/arch/x86/include/asm/alternative.h
> index 18109e3dc5..e871bfc04c 100644
> --- c/xen/arch/x86/include/asm/alternative.h
> +++ w/xen/arch/x86/include/asm/alternative.h
> @@ -90,18 +90,25 @@ extern void alternative_instructions(void);
>  /* alternative assembly primitive: */
>  #define ALTERNATIVE(oldinstr, newinstr, feature)                      \
>          OLDINSTR_1(oldinstr, 1)                                       \
> -        ".pushsection .altinstructions, \"a\", @progbits\n"           \
> +        ".reloc ., BFD_RELOC_NONE, 567f\n"                            \
> +        ".reloc ., BFD_RELOC_NONE, 568f\n"                            \
> +        ".pushsection .altinstructions.%%S, \"a\", @progbits\n"       \
> +        "567:\n"                                                      \
>          ALTINSTR_ENTRY(feature, 1)                                    \
>          ".section .discard, \"a\", @progbits\n"                       \
>          ".byte " alt_total_len "\n" /* total_len <= 255 */            \
>          DISCARD_ENTRY(1)                                              \
>          ".section .altinstr_replacement, \"ax\", @progbits\n"         \
> +        "568:\n"                                                      \
>          ALTINSTR_REPLACEMENT(newinstr, 1)                             \
>          ".popsection\n"
>

There's already a symbol for the start of the replacement.  We only need
to introduce a symbol for the metadata.  Try something like this:

diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 18109e3dc594..a1295ed816f5 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -55,6 +55,10 @@ extern void alternative_instructions(void);
 
 #define as_max(a, b) "(("a") ^ ((("a") ^ ("b")) & -("AS_TRUE("("a") < ("b")")")))"
 
+#define REF(num)                                        \
+    ".reloc ., BFD_RELOC_NONE, .LXEN%=_alt" #num "\n\t" \
+    ".reloc ., BFD_RELOC_NONE, "alt_repl_s(num)  "\n\t"
+
 #define OLDINSTR(oldinstr, padding)                              \
     ".LXEN%=_orig_s:\n\t" oldinstr "\n .LXEN%=_orig_e:\n\t"      \
     ".LXEN%=_diff = " padding "\n\t"                             \
@@ -62,17 +66,21 @@ extern void alternative_instructions(void);
     ".LXEN%=_orig_p:\n\t"
 
 #define OLDINSTR_1(oldinstr, n1)                                 \
-    OLDINSTR(oldinstr, alt_repl_len(n1) "-" alt_orig_len)
+    OLDINSTR(oldinstr, alt_repl_len(n1) "-" alt_orig_len)        \
+    REF(n1)
 
 #define OLDINSTR_2(oldinstr, n1, n2)                             \
     OLDINSTR(oldinstr,                                           \
              as_max(alt_repl_len(n1),                            \
-                    alt_repl_len(n2)) "-" alt_orig_len)
+                    alt_repl_len(n2)) "-" alt_orig_len)          \
+    REF(n1)                                                      \
+    REF(n2)
 
 #define ALTINSTR_ENTRY(feature, num)                                    \
         " .if (" STR(feature & ~ALT_FLAG_NOT) ") >= " STR(NCAPINTS * 32) "\n" \
         " .error \"alternative feature outside of featureset range\"\n" \
         " .endif\n"                                                     \
+        ".LXEN%=_alt" #num ":\n"                                        \
         " .long .LXEN%=_orig_s - .\n"             /* label           */ \
         " .long " alt_repl_s(num)" - .\n"         /* new instruction */ \
         " .word " STR(feature) "\n"               /* feature bit     */ \


which also avoids the timebomb of using blind numbers and hoping for no
collision.

In principle we should reference the discard entry too, as that's the
(very obscure) build assertion that we got the lengths correct, but

`.discard' referenced in section `.text' of prelink.o: defined in discarded section `.discard' of prelink.o


gets in the way.  I'm really not sure what to do here.

> --print-gc-sections shows a few .altinstructions.%%S dropped - as an
> example:
>
> ld: removing unused section '.text.reserve_lapic_nmi' in file 'prelink.o'
> ld: removing unused section '.text.release_lapic_nmi' in file 'prelink.o'
> ...
> ld: removing unused section '.altinstructions..text.reserve_lapic_nmi'
> in file 'prelink.o'
> ld: removing unused section '.altinstructions..text.release_lapic_nmi'
> in file 'prelink.o'

Excellent.  This shows we're making progress.

>
> The full list is below.
>
> Unfortunately, EFI doesn't like it with ~14000 lines of:
> ld: error: 0-bit reloc in dll

Yeah, I found that too.  And because of the way we derive xen.efi from
prelink.o, we can't simply exclude these .reloc's in the xen.efi case.

>
> Also, my test of removing the path to memory_add() still doesn't drop
> memory_add().

Hmm.  There's nothing obvious I can see in the generated .s that ought
to keep it referenced.

>
> There is still something wrong where I get a fault in some shadow
> code. I'm still investigating that.

The hunk above builds for me, but I'm not using %%S yet.  The shadow
code has multi.c build 3 times and linked together, so you may need to
account for GUEST_PAGING_LEVELS specially.

~Andrew

