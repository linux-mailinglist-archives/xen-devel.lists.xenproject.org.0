Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D1AD1A60D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:47:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202176.1517801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhXz-0001t5-59; Tue, 13 Jan 2026 16:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202176.1517801; Tue, 13 Jan 2026 16:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhXz-0001qG-2U; Tue, 13 Jan 2026 16:47:11 +0000
Received: by outflank-mailman (input) for mailman id 1202176;
 Tue, 13 Jan 2026 16:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vMW5=7S=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vfhXx-0001qA-AV
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:47:09 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f0dba36-f09f-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 17:47:08 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by DS1PR03MB7967.namprd03.prod.outlook.com (2603:10b6:8:21a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 16:47:04 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 16:47:04 +0000
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
X-Inumbo-ID: 7f0dba36-f09f-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FtFKjAXp9GQ2kgfrjc+EvbcwqMWEtQNVcL9mnHlvswQmNiwUcmmOEIFFXWF5DXUG6Jr16BTQiwk1ywY2wq5ufQn0wzlKOquqWtz3WhnZhjPwGL7wmRxdsO8GgIgBp6GLhti1SXzj8Qh0vzypPYAK12dZ5B34WFB9u5Ic+ouNj//ZUX7TYV65ysgM2utG+pp/GNM+UHifoYl+65w2I6Tw7CdJFxwAZTXYf4K9zUPR53sf7GykwkHX6p8N2Cobo0LisNCetPzOUth1fQjc6vsSBKJaassbLmWfEQAm2eM4JOWt9H+M1JR9coywm1ZlfLhuRPBlvlciu/FgWuJOulNLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIG4mSMbZSnCptsDEr0hozuhM7aJ3MO1bArNE8P9lVM=;
 b=FqghGb+ryAxHiamrQIny8xzFXwF4g/L3e3LzPE1UQ2vcj09s8tAGT4EGqXDLqupu6DpYnfHX+Xyw6pDZgyVhGb1Ud7I8BDLYAS8APgKcBP/cTT2jdsXKMWJdxxD8LjhO6Q3IrToM30gILjgKmdklCGSdHPbFESWcWpokldFVE/y5MrCq1Ukkb3rNxkkH/Q125zYyfd6DPVHD+iLV9QknOL1mAQ814rvJW1aQQIL0kFqy4whmlbdDDLzm1ebk60hfDn+Fip3OTKwVo815UUmGehaof/+NJ6c0iqFUWIp+NtjUPypysMnT+5AnFvbBoZdILSl+Yv1x5dcxF1sUbYREXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIG4mSMbZSnCptsDEr0hozuhM7aJ3MO1bArNE8P9lVM=;
 b=krM/FYC9UytDdEF5K2BfGhPLB2tbt7pwPg3y6YYEpsK7OdFaf8Y+S6KdGW84SjtGwL6QiURVBHsmDg/AzZmZeoy/KgYH4Ll8hx9RCN9AkWDzYNzeyvt48KA4C4bs0dzMaI1IbY1CRVP1CO7hJYfLrV4cmx8WdvOChtNKroP5NbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1dab1120-d947-4e5e-bf9d-0dfa5ec35bb0@citrix.com>
Date: Tue, 13 Jan 2026 16:47:00 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 4/4] x86/ucode: Add Kconfig option to remove microcode
 loading
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-5-alejandro.garciavallejo@amd.com>
 <0706617f-fdb8-47c1-94f4-6aa92abd07ec@suse.com>
 <DFNLDTH4EKQS.1UL1S5Q9OEQ5O@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <DFNLDTH4EKQS.1UL1S5Q9OEQ5O@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P123CA0024.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::7) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|DS1PR03MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f5bd29f-a654-48f7-411d-08de52c361a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHhKdGFjNUU3YmFJVzJuK1JsNHFTK0VzRThpZDBMbWpISlA5a0Q0MWdiWW5R?=
 =?utf-8?B?VzVaa2x6NkJpb200anJWYmEvWW56YnpDT0xzN3B2NHhDZEtMKzZnQVR1bEx0?=
 =?utf-8?B?bXljQ1pKMU1CN004eitOQ0JuTTUwdUJSSG5zWmhJR21SOXFLMnc2WmFwenVk?=
 =?utf-8?B?eWJId2RrNkxqeVQxbUJFVFExVnp5T1FPd2lZdkFZSDdDbVgyd0JiLzJ5MW9l?=
 =?utf-8?B?OTNuS3hsdHp6UHVRWkNpS1dSUnNpbUk1VzYycnpGMUh2d0tGMS85eHZ4Y1g0?=
 =?utf-8?B?Z2Z2TEFCcGFSVFBaa0FJRlBnV2thYUwvTVVXcjhiTmhsSkQwWVNDNldaT0Nv?=
 =?utf-8?B?MDlkbzV5Y0hwajJ3L1BDdjNtdEFTZnZPY21DOHFWU0xCZ2tYYmpmUnNMVTdW?=
 =?utf-8?B?czNlcitWSGlpLzB4T3Z3SlpuWDBoWVBENjN4UmFtRGNKVHhYWHhxZnR4eFhH?=
 =?utf-8?B?NEJFNUFsTTFzQXFmSWhxa1FRcTE4UG5mMWhyakxoRHJ1Z1Z1SmZMKzVPNGNr?=
 =?utf-8?B?V0J3ZVVLUFlLNFZ5bG5mcHdQRk1uNVB3MW5ibHZHYmVrYkIyUm95M2FVWXJk?=
 =?utf-8?B?RHpDNmtCRzFrd1FMdWFhK2JraWhaK0dTdkVIWHhXanFlVTZGK2Q1QS9OWWFl?=
 =?utf-8?B?Qk04eDdYVDdjekMwYnNlL2dIMUZnR2w0ZnFUdHNkakExZmJJWGNOakhPSDZM?=
 =?utf-8?B?Qkw0SVp1Tm1hN3duTzI3NW5KNW1nVndUUUZqSUF5TGdHQlF0UThnWk1wNGdO?=
 =?utf-8?B?K2xQYTFvQnllWFZDbi9kc2lTVyt6dEo5dFRRTGFrTGg3NXcxQ1piMW9LYjc5?=
 =?utf-8?B?Rm16WUEwY3JSRksyOStjU1Y5T0s1Wit4MWhBeXlOZEljZktuNnBPS0F4Nyt0?=
 =?utf-8?B?YXIwRDNrck5YaHhrc1lZMjFOZDNvVjJxTnVnSU5CaVpmSXdpa25vLzNyU25o?=
 =?utf-8?B?bW14eHlhMjZNYkhZUXBnUTErMjF6cDZJOXhlU3Q3Y2E1YjgxRXdaOG1ib3Ux?=
 =?utf-8?B?QnVLZUtFYUpYODRnUjBKeTB0dk9aeHdKRFMyNGlNTlZEa3EwcFRuODcxaFpn?=
 =?utf-8?B?YWV6bXFURk1INE9uSWErOG9PSU5sQXFON1FVNXV0OXAyMkFDNHRPQ2xFbmhz?=
 =?utf-8?B?YjRSeWY3aDRKMkNaOE1Yam5zME9WN1BrMmd6dktUMzVNcnJwdkM4TU0wbDJl?=
 =?utf-8?B?Z2w2NHN5RGhGbjZiMHByMm1EZHdzR2dtZUxVZGc2REE5clpOU2VLbk1BaTFU?=
 =?utf-8?B?eXV6UkUvdHRHbnJPWENGMUlnV29tZEREZS9rdVpIUUszelhKSTB1MjBGTjQ3?=
 =?utf-8?B?ekZzdGo2ZE1IdUd6alEwMlBQV2wrWllOWGJHWlNic0YrTEg4TU1GTjh1Q1ZM?=
 =?utf-8?B?WWs0cXZVN0ZKZUtwSWF5NjR6WDFsVDVDanpSc2xrZnJmaWZuMUVGaVQxM3g1?=
 =?utf-8?B?SitKRlJnNkUzVlVCaXFUNTFmbFpaUjFlaGZsT0Z1WEJkQ3I1SE5xb1lpeDIv?=
 =?utf-8?B?VHpNMlUyMUpFZ3MzWktzdEovaVdYL3pEVTFNSmFaWGFqMitYRE5jbXl6RW9a?=
 =?utf-8?B?LzkzdTJXdkd6aExkMVZyNkh6K1V5RkNGL2NtQ3hZSHZ4VU9yQnNtTWJsVVcy?=
 =?utf-8?B?T1RYMEZBNkFic09PKzdkaFVqS3MySGY1TXVFNXF5MGVCcWFpTzhkcE9JZlBn?=
 =?utf-8?B?U0dlQWpOZURhb0tjVHNPZThHbXpkVkE4dVRHaFppVktGU01ZQnl4SDl2Y3Y4?=
 =?utf-8?B?ZEY2d2ZtaUxFdi8zY05vSGJLeW5Na0FKL0YyWllIREZ4NXF2RFVHcXUzRVZy?=
 =?utf-8?B?S3JXaVUzMCtJZlFFdk8zeUU1ZHBSckVTSlpybmcwYUFPdU4vaGoyZUFJbTB3?=
 =?utf-8?B?NGdVR2Z2WVZBSVpsUDBzakwyeGNyenZoVWl5QjJ0SXpPczJDN2liZUVGb09G?=
 =?utf-8?Q?Q6OVLv3C2y7IE74TQGFUjpeBsdnHoxri?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0ZrQ1RoZjZwVTBOMEo0bUxaUGVjYzBKWmZ2YnZ3M2ovdWF3UmJzVUNmUkhQ?=
 =?utf-8?B?NlR5Q0RucU5MM3ZSbmNUMWFEV3dldnVseHU1VTE3b08wdmt4ZGtjcUtLTWxt?=
 =?utf-8?B?NUFGZU82VjBjZGNXeExtNHRrWjdoLzJGSHkzTHp2SXBOQ1BTVUc5amlqT1hn?=
 =?utf-8?B?elJzODg3WnFDY1plVzJPalIwN2pwWlhGU2R0TmJlZkZMdUlzZ3BYY3J5OWx6?=
 =?utf-8?B?cHpiOTdKR0VXVGNlVmdVOEFXdzB5dEwzSklzRjNlMDM0T1FpSU5CQ3k0QnB4?=
 =?utf-8?B?T1hyTjhodXFCRHpVZitYdHM1OUFMdi9naG0xZHVtdk1YLy9mc1VBS2lSd3NX?=
 =?utf-8?B?SFhlVVQyN0FSaTY0MFREMXpKdWJDYSt0eFhoV1pWdWFIY1NiUE55SXA5cmZr?=
 =?utf-8?B?S2Uvc094Z2k3NFVCRzBmU3drb1FKRmdHbjJUQWxtSGxLUVBTaEFWQnN3a25h?=
 =?utf-8?B?ZWNySFZnZDZPTnJUdTNNSklqSFZuSVppL3IyTERHSVYrajRaREY1dWhCN0p0?=
 =?utf-8?B?eVd5TEZGMkhEZHlEdTlOYS9iM2xpZDBidzQ2TWhOZUhib3BLWGVRT1BWOVMv?=
 =?utf-8?B?a2E2K3d0MXd5REQ5SVRzdEhzTHIzMnVYd1FydllLTWxyMmliRjVDbG5Edy9w?=
 =?utf-8?B?Nm5kWk92SnBBM2djYXUwRkluYWR5M2VWZDB3S283M203RnhFT0FXRTV4ZG52?=
 =?utf-8?B?NG5Jbkp6TE1uWU92eHRCYTR5R09XYmxoV2xRZWUwQ2VZVWRiOW5CdzBVK1ds?=
 =?utf-8?B?L3hXQVlDK25LNE1VaTVHNjJNMVZtbmdHRFNEUVVhUEFoV29lOTg1bktxQmFC?=
 =?utf-8?B?RnJGUVl0Q2JLc2c0LzZUMHIvVlNCRm4vcjFUQkJtK1I4ajBDQzlWKytxUTUr?=
 =?utf-8?B?RksraXRNTjBNVlF1bUZlK0VLbXlWSmprV1RwSFcydU9PWEFITjlKV1BBQ2RH?=
 =?utf-8?B?NzdFSklwU21aMmJEU3dobGlINGRyTTNJQ3F4alV0ZWhXV2wyS1hFM2NBVnVE?=
 =?utf-8?B?T3FuWTYwc0VTbU83Rm1HRzh6MEVoOG9FQXR1WW9NM2tkUGFxYUlQQWpXMjhX?=
 =?utf-8?B?ZldDNlpacS9DVktab21wbTZwSXJiSmcybnRuU0RteXkxclZFVkU3S3d2c1gy?=
 =?utf-8?B?c1pkR1hpQXh3ZmVGcWFxbG41R28yVFZKcjVEWm9QcnV1MTJCejVEdWpDVFR5?=
 =?utf-8?B?dVZuak4zZS9WNDE4YkN4NWoxRy9weCszM2x2UDJKRjRreHgzS0lJUHgyZnpF?=
 =?utf-8?B?YjdoZUcyWUVRVnJhWmxvb3krWi8veFE2L0xHSHJoZ3BMNEs5b2MzVXFVQis1?=
 =?utf-8?B?dUhCN3NLVHlLc0s0NVUvZklBUUNsWWExRStVc2xMNlczeGxOUGlJc3NVUnYr?=
 =?utf-8?B?VkhFRzdXZFpsZ0RTT0Z4dW5qa0VCU0RPZnNnVVc1TkwvZXdPQ2tCWGNHUjRh?=
 =?utf-8?B?Z0dpaFZvVk9oMGpjSHM1MnIxWEZVanFod1orTVh1dVQzY1IvU29EeGlPTHNw?=
 =?utf-8?B?bk9mT0pKNjRjU3RIcXhCYlpwM2doOVBNU0tBb3hsRWhqb21JQ0s1dS9vUVNs?=
 =?utf-8?B?M3dlQmhtMmpJT3VIbm9FczlxVk5WUC9oRkZoOW02RnNzNmpvWkt0dlRPdVlW?=
 =?utf-8?B?V2ZWN0srTlozMnBHUmtaMllJbFlQbytsYlNxWWhYdUcvRUd1QW1NNUUva2Vz?=
 =?utf-8?B?OUZQd0Vrelo4eEdvWE9zWkZ6ZUh2WG5NdWVrVGNUWEpkY2I2eFhMY0JHczdj?=
 =?utf-8?B?V1NlbU10NGE3NWJUL1hvK1E2aVVnT3d0djRQKzRDZkN5aWJPbjdrWURRWGxC?=
 =?utf-8?B?enMrdmQra3FOUEZPc3dNVkE2anJaRUpHbml2bzdhWmhmTCtrZHo2V3RhdmdX?=
 =?utf-8?B?eTFPVjZuYmxsUXNVOHVXa3Rkbm9HRk9vRTFubm41czFjeXdKY20wa1hJbXVX?=
 =?utf-8?B?Y0pqaG5HaFp4aUZEUUFVbkxWQmpnYnRETk44RTFwTlRBSnpoSkFtakZIaW1q?=
 =?utf-8?B?K2I2UVdHUUl1VjdFdnlkLzZLNWw4bWtIZldpZWVuVDJUNlgvb0JadTZHa2Ny?=
 =?utf-8?B?UEVOSVpTVGNsbkI1MXRBSE53UG5UTmU4eXZ5OVM2bEJCb1lJT2dwbHBTSHRB?=
 =?utf-8?B?bmVVa0hXSVVVQ3hEbHU0ZXNnYkEyYTFlWjhFTVVFUi9Jcm9IV0x4U0lsV0ZC?=
 =?utf-8?B?L0Y2Z3VKMlJZbTNKVmNPZUYrSXVrK1FnSVZyTGFjMTI0YkZ1UG5hUVlwQjMr?=
 =?utf-8?B?NDlNbEJrTm1IeVp2VFRPUGVpb2J6QnhIeW83MXlxZmgxdTgzV0x5K1JLS1Fv?=
 =?utf-8?B?dlJxaThqZWFjU3ZJTVdvVUpFTmp6SUkrYVFSYWEzWGZrYTBpRFd2RTFpbGVT?=
 =?utf-8?Q?R7SmVOfWMP42oKZA=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f5bd29f-a654-48f7-411d-08de52c361a8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:47:04.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dV6v4He9BSa4rVKqBhJ9peWp8sG8QuhYUdXTQjQZs4F5WZcV0wbA02gICXQKcbXCj/FH2dIzbbdjKBnLkwgG5QSq9aMjHXoZXn+lrrWFV1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR03MB7967

On 13/01/2026 4:12 pm, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/cpu/microcode/intel.c
>>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>>> @@ -408,17 +408,20 @@ static const char __initconst intel_cpio_path[] =
>>>      "kernel/x86/microcode/GenuineIntel.bin";
>>>  
>>>  static const struct microcode_ops __initconst_cf_clobber intel_ucode_ops = {
>>> -    .cpu_request_microcode            = cpu_request_microcode,
>>> +    .cpu_request_microcode            = MICROCODE_OP(cpu_request_microcode),
>>>      .collect_cpu_info                 = collect_cpu_info,
>>> -    .apply_microcode                  = apply_microcode,
>>> -    .compare                          = intel_compare,
>>> -    .cpio_path                        = intel_cpio_path,
>>> +    .apply_microcode                  = MICROCODE_OP(apply_microcode),
>>> +    .compare                          = MICROCODE_OP(intel_compare),
>>> +    .cpio_path                        = MICROCODE_OP(intel_cpio_path),
>>>  };
>> While I appreciate the intention with MICROCODE_OP(), I'm not really happy
>> with function pointer members left in place just for them to be NULL
>> everywhere. What if a call site remains unguarded? With PV guests that
>> would be a privilege escalation XSA.
> I see where you're coming from, but these are already NULL if microcode
> loading is not exposed by the underlying hypervisor (if any), or is blocked by
> hardware in Intel, so arguably that worry is orthogonal to this.

Also because they're cf_clobber, the calls are turned into UDs.  We
won't follow a function pointer to 0.

~Andrew

