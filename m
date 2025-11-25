Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E652C8769D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 00:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172224.1497318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO23S-0003Nk-4b; Tue, 25 Nov 2025 23:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172224.1497318; Tue, 25 Nov 2025 23:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO23S-0003MU-1S; Tue, 25 Nov 2025 23:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1172224;
 Tue, 25 Nov 2025 23:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUk1=6B=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vO23Q-0003LK-Hu
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 23:02:36 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4bc61c5-ca52-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 00:02:36 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by PAVPR03MB9091.eurprd03.prod.outlook.com (2603:10a6:102:326::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 23:02:33 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 23:02:33 +0000
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
X-Inumbo-ID: d4bc61c5-ca52-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXlFj44cUA0mQ+ZajI7yM2aOSLtTmSz1NUpxjDGUkt9eR2k9mcmXRCWHdOBLjxcC2gJ2uBCNAnOV7LF9BDeTrMdAL8+Zv1pBL/d9QsWpwBCojATgODlsk4tHc/+AD0udKSK/G9DdTK4t3g9Ut9NtSz/kHy/GCXyfdYpty+dFJQt+X12bXTIUtCMwKINLLpLb/g4ly57U/M1lDDnY3zRwv/xXsa1L+k00YXir41rXUy+PZJUg7tSUpwZJMxyE5a67YUGMLSHWV1bPfOb5G9qPF5smHUcJYoX0zb/Kys2HmjdXEiutYL78Vndp8kumMXjfmdi22krlROzCiM4xtbgndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tKIrGofXLPN6qgL4uafSzn5M401zlwadw+S5GDn4Pg=;
 b=iypFtjRJLPvwIU/5PfLb0XOEsgG/J58TfLf9eXMZRuXfarGxAez6cyMulK+jgNLKTaEu4XHr8IjGI2ZneRz2E3fozlTbYyDXZ3HLES7IhdAWZ76ooKN5zC9wxEirIpzOF1O0R8/0qgsBCqFS0Pp3tt5ufLPwT4sS4Wz1f7wOWyTO9KbalI/4Qpw83Rbp+LzKyw3DlBui1vv1gY43b2PoewRAM4h9UG3kYVSSD+M0viqMELR6zp/iBS7zp81deEjxqaa30/8b3p2Ef75KgNsDSN+//sEvScGGT+AUiydm2t62xlwLff/hJOsTFxoLWHLdz0MYFIcdvjwMCan0JxkVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tKIrGofXLPN6qgL4uafSzn5M401zlwadw+S5GDn4Pg=;
 b=VTnyw+nYAL6tt+Ab0196HQ1RLavq7zX/RH4RW+agzQyLN9qq7rRaIL8K7SBuNvzh38jljTHvgcMq6shT1qjDV9UsrAyhivtxYpWri0SMmQ/RTWnMFQ3HE7cIxKciiisLvOEfZCakeraR6UGlMogcf8y6h3NrYCKimv2/AG27oZjutjDnfu5FUNpajLTWG/4nO+ghPBrjaFEWr5ZkR8FpWeSuKE8gwVDsqGAKty2Dq03tXNxyuKYEcX6dHu4CUZ17Wq8RmFEM7FuJbyTyEwkXXDp/2TG7YunoCXBKYeKLo7Abq7vpY9yl9cdxcMDVoNYDc/D6V7VzJQL1w4DEINayVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <5050db49-8581-499b-93bb-98c0f084d071@epam.com>
Date: Wed, 26 Nov 2025 01:02:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/24] xen/sysctl: replace CONFIG_SYSCTL with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20251121105801.1251262-1-Penny.Zheng@amd.com>
 <20251121105801.1251262-4-Penny.Zheng@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <20251121105801.1251262-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0016.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::12) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|PAVPR03MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 0051ff7c-b3eb-4146-90dc-08de2c76b7a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW1IYXBTM3ppNFAvWjhRVUhXMHdMKzZ4RzdIYzlpMzNEYzFscnFFaFRiR0pJ?=
 =?utf-8?B?VjNyV1JYWUpSVVZwazMydGhuZVVRQWxQWWVoZkJxNlhiT2JzbWhWSFQvUFYv?=
 =?utf-8?B?Zm1yNk5JNENBMmRTL3lTRzhsWmhTMUxHTVh5K1B2VUJjUnhHbUhOVUNVcUMz?=
 =?utf-8?B?ZGw3ZGVXNkh2YzJCNEo1eUhxUDk0WVZSOW1ublFaNDloWXhnK01oOTgwN2Fq?=
 =?utf-8?B?UC8vYUU1U3VuMkhDYVR2YU1XSjZydCtZUSt1cmM0ZHREREVtcDREeU0xenZt?=
 =?utf-8?B?NE1WQWl2UmIwQjkvKzJmZGg0d0pxOGRHMzgrS2ZRZjlmelZzc2ZjeGttSmxK?=
 =?utf-8?B?VE9Zcm5OV1J5dk45MUxzR2g5SW0vaUgwQTVDOXhWa01WQkw2SmRuOUUzREVk?=
 =?utf-8?B?aUZKRVZqY2pIQzF4VGZLUkZxSFlwV0xPTG1NZS9CNGZmWk04VTcvcHJRY0ly?=
 =?utf-8?B?KzVxVmw3dWNhVTVxdi9iSkEzUDUyd1dTVkZQeXhWVmJhWlF1Z0tMT2xwZk5V?=
 =?utf-8?B?OXl3V3p5dDRqdWpyYm9RYjlrNlNEWjE3eWQwazlVdlRiaWFUbmw2dzFBZzQ0?=
 =?utf-8?B?QWFqek9MazY2c1lSVEg2L2VBSU1HZVpvS01xYmNST2Y4T0VzTDVveUtkWDZU?=
 =?utf-8?B?WFIyK2NCanRVdm0rTnBPSERKTy9mbWhkaU5wMkUyTmxRWVFJdkpuWXFOa3dQ?=
 =?utf-8?B?b3lHVHJwVW9TUTRjWmVyT1hUUFFzNnVDNzNNLzJjblI1am0rVW91ZDlXYm0z?=
 =?utf-8?B?R3FZT3ZpWkNaTTV6dE1teHRPUmkvcHlTd2lNdU5JTXJSelFueWpPQzNMVzd6?=
 =?utf-8?B?MnVlZE8yNzh4QTdmb1dXQ3krSUJHRHdaVDFBbHpQZmJEakJ2eGNubVNUUlYy?=
 =?utf-8?B?VGY2YzJuSXpHZWZVdVBrTCt3dkg4b1IzRVh4RWt6R09Kc1pSVXUxZFBqaW5Y?=
 =?utf-8?B?cXRRTWpqWndkWDRnQUFMK3ViSlIySWcrRkVieWc0QllvWGt0alRPa1I1WXJS?=
 =?utf-8?B?bUpyeCtKVVZDTWk2NFIvMFVpZ1BaWFh6ellES3VxNUxyYURjbHUzOVhGNlBE?=
 =?utf-8?B?TWVTSC9Jd2h3bnB1VkV1d0dyUjl2dTgrYW9TYWUwb21CdFZxZ21pV0JVN3l4?=
 =?utf-8?B?dHhMT0RXdFY3VXhTNE1PVERDalJpMHJjY21hZ21FT1I0THg3NDFZVitrY3ZS?=
 =?utf-8?B?clU1TTNIcVhocXpucTJwZldXMTdhazNLL0hpVGlwK0lROVdhNmFEeVhlL3NS?=
 =?utf-8?B?QlZYTkFHNE82K3pDakE5WU9FcWVmNXRLTFZJRGtzY09VSUkxUy9BVklQM3E1?=
 =?utf-8?B?azkzcnR6M1hHRmJPNjNkcnVXWnl6dTc1Ny9rbnNnWVJ5b1djbnhCUjQva29H?=
 =?utf-8?B?TlhyU0FRL3c3ZC84QkNOYlBuU2pqWlZuVFJMOHNja0Zud2FwaWxLSmR2M3Va?=
 =?utf-8?B?dW1YRUdPYyt2SUNyWm9jbVVFSWM3NlNRdXVrbTNwNmV6M2F4bE5scy9GcXVX?=
 =?utf-8?B?b3NPZU1Ybi9MY3dpZTdiT29pQ1hIbWNULzBWTUZoTEV6dEVhR2ZuT2w4VTJn?=
 =?utf-8?B?Sm9wb2dXWTZBNmk1SUFjeHdLVXhydUFoalVaUTdiZFZsRlZoTGFJVTlZRFEy?=
 =?utf-8?B?WitoOWZzN29SUHVVcUVac1pObUxURVdId0hrczY5b2hwMi9XZ3JlZDByczhY?=
 =?utf-8?B?OWZSTFBVYjhMMWNvcDk5YU1RYkgzN3NaS3lUYlhpNEN5dTAwalpub1pRY2Fs?=
 =?utf-8?B?Y2lQQ1pQaXlHZ2RRNWl3eis1dXRjdHpFNW94eDVwMjVlZFhwWVBOVnN3STdO?=
 =?utf-8?B?ay81bmFnVEpEMmUycmxHdVpiNGtscGJ3NXBna0pyQzF4emd5UTNmcTZGbVdZ?=
 =?utf-8?B?bVZYMitpMW8yQ0NwTHNHMDlaZVVKU01NV1ZPRTBwVWlrUlhNRUJEeDMrZzRU?=
 =?utf-8?Q?wneFZBEXLwgmaIEICLLZFdFlGuJHY75a?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3VxbHJRbEFNMTMvekxFSW5DWlFIbG1MUWd0Y2NjMGV3bS9WOXFvV2ZrSzNs?=
 =?utf-8?B?cllzdGJ6RDNSSXdVQkZUR1NvNkFVT1ltUk43RFpJZTEzMlZoSlJkWVBoeFFp?=
 =?utf-8?B?TThwVFJnZnVReHBGcXVxbFdRbTNtc2FmbWoxbFN4Q29Ec0JoYzMyeVZDNERj?=
 =?utf-8?B?TnlETURrTWk2OGkrMzZBaVJnR3ZpOWE4Y01FSm1yaGRJeGNLQWp6dS9tN3Fx?=
 =?utf-8?B?QWU5L3N0M2xIZFIyeHBSTk9GYXAybEdEdmdpVC8yTVQvWlU2dzJtQkQ5enZG?=
 =?utf-8?B?T2lzVS9CNzNPK3puSFJYQkZSU0RBeEkyc0ZDSzFLMU8rZVVValdzV01VNDZD?=
 =?utf-8?B?WGdmWHNaS1NBeHpjY2RhY29NMWplTFFVMkFrc1lGaU5yTGxsUXZpRDVsZVdR?=
 =?utf-8?B?djNZdElJenY2SGdtZ3VOTmcrYmVFRjFpVnc3ZU5DNXBodVlQMkpSMTdlWVMy?=
 =?utf-8?B?TDNqWU5HdllTOHFoYnNSUXJaYWRVYnEwTVdzSnZHYm1xcUxidUI2OXRLZmJ4?=
 =?utf-8?B?YnVheTlTdlcva3N4eEdsMUNiNWNkVGsvZzJVQWxXb2Uycmh1QWRTNm1GWklr?=
 =?utf-8?B?dWx6b1JKaGJJUUszeVJ5K0F1ZTNxTlp5VFZkb1c2bDUvNWZROXBYTFlqa2gz?=
 =?utf-8?B?VUttSXZobWlPSXk4NnNUY3ZvWVQzejUzWG9YYTZPVitGK0lQR0NxYWRzMlVp?=
 =?utf-8?B?RnFxWkNGcWdCM1FQUFBnTFVQQmtvelRaV3NLdXJ1RnVrTEE2WmcrNDBKeUVr?=
 =?utf-8?B?VW54a1JDcHBQRTlNQ0dVcTZZNGl2M2xKaUoyV2pOWWI2T1MvZzRUN0w1NHRZ?=
 =?utf-8?B?a1lJeWk1cy90eHR2dnlOTDhqSTRaWk5HZFBtNDM2TXBsQk9nSk9yY2oyYk9p?=
 =?utf-8?B?MEttVG1GM2NGcUlKSnZvZVh0MjFhU3BqdGlQRWhWK0c3ZWU2WEJUcHVid0Ju?=
 =?utf-8?B?NFBYMWcveUpGVkg1MmQrVzlUM3BUQ2JpaXRkQ1NKSmQ1cVJiZWl4Ni83OUNG?=
 =?utf-8?B?cWVlOVYyaWdoRjRPUUZydG5CNnB4M1dtWlBDSFVwUUt3bXFPQ25Pcy9GdmxB?=
 =?utf-8?B?RFlKRC8xdzdoSk1FM2QyQ0NNNnhHajNYcU9oK1dOOGMvbmwzdmJQSEZCMWhF?=
 =?utf-8?B?b2dnM3ZkQnFmVnZ1MFI4U2NkMVNleXdMSFFEakRLUDBSM29VMy9IVG13a3dx?=
 =?utf-8?B?aThWUFNDM3JXejJEM0lCTncwanR0YzVlL3Y3ZXdnRUVoVVJzOGp0dFJZbklk?=
 =?utf-8?B?cWpxeE5jVTVZV0hobzNGVFJVOFErVmlhNGFOTVNvczVDUFo4dktQVlNtM21B?=
 =?utf-8?B?SHJGUGd4SWd5RlgzNmNjczdIaEN1MklDQXExc1pQUTlGeUxPN0VUYUw0S2FY?=
 =?utf-8?B?Rk5uN1BWb056c3ZmaDBZQTJVSWxKaUFBTEZTUExOQWxDZzg4aUVXL3ltOExh?=
 =?utf-8?B?RlFCcXVjeUlnT20wMm5ONTVQRlhJL05QNEhacmtEK29qVlNMQVRNazd2M3Uv?=
 =?utf-8?B?K2IySjhqWkNZaGFLOXBiT255ZDRxM0U5R2ZOMjFVNFVCT1RCelJYVDNmMEYz?=
 =?utf-8?B?YUpiWEJGdDN1RjdzeGlnTGl3dHJCR2E2akNHaFlubjlnNDRSR2RzaUcxT1F4?=
 =?utf-8?B?WEdyM0VXSVUyQjhIT0N3azBsRUp6SXIzV1cxQWJMdFBzUFZneDgzTFNxNkhJ?=
 =?utf-8?B?UVJPa0RNY0RUbVJWWllBTmZPVG4ySEJsVm9GUmJyTkp3NW1SMGxrNjNrenFx?=
 =?utf-8?B?aGRFaFptYVRBUmc2YzBlcDlPZ3k2a1pKZVBYR3RRd2xTQW9SOGlFRGdZRXFl?=
 =?utf-8?B?SkhqT3ZlaHNYblQ3RnBlb1JCYllCR0JUZHBObStTcW9qS2NzbnJvOTBQUHIv?=
 =?utf-8?B?TERRbVc1ZzBESUVjU1ZKemJnYzZFMGZ4Z3cxN3dKSk1TOFpvVFZHK2s4NkJ0?=
 =?utf-8?B?R3ZIV2hlUWFhS3Rjb25RWlBKSTNGaWdxL0ZFa0JZQVdRL1paU0ZRYzRoaCtP?=
 =?utf-8?B?ZitFOWJBTy9oUHNYMUROWVZtUUVib2JVWnV3Z1NmN1FYaGhCUk02QmdwalE4?=
 =?utf-8?B?K1FzTjdndDFVM0M4VGc0VlN4cGR1K2lsYnlYTTcxL0lFZ3oyVVk0ZURpZC9T?=
 =?utf-8?B?Rkp5SDZLWjdQK2pwM0JtR09GWXhoaWREeTZ5RFIwbHRoMGUxckpid1RBUVhr?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0051ff7c-b3eb-4146-90dc-08de2c76b7a2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 23:02:33.2984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x4A6fAELGpgQXyCZ6+5qYoOm24RCqK3sIhBozjK2WPWR/XkoU0WA3x3eAxNTWukADpSWDd9jb54piw2Kgh9WCaCPh4+p9mn3loomhhPxVVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9091

Hi

On 21.11.25 12:57, Penny Zheng wrote:
> Rename all the CONFIG_SYSCTL into CONFIG_MGMT_HYPERCALLS to help provide a
> single option to manage all unnecessary hypercalls, including
> sysctl, domctl, etc, in dom0less system and PV shim mode, which could also
> make it easier to support randconfigs.
> While doing the replacement, we fix some bugs on xsm system:
> - wrap the whole xsm function to avoid bringing unreachable codes when
> MGMT_DOMCTL=n
> - add missing wrapping in include/xsm/dummy.h
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Reviewed-by: Juergen Gross <jgross@suse.com>
> Acked-by: Stewart Hildebrand <stewart@stew.dk> #ARINC 653
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Cc: Alistair Francis <alistair.francis@wdc.com>
> ---
> v2 -> v3:
> - wrap the whole xsm function
> - add missing wrapping in include/xsm/dummy.h
> - refine kconfig description
> ---

With below diff..

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 6709c3c95c53..f478adffff9c 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -652,9 +652,8 @@ menu "Supported hypercall interfaces"
         visible if EXPERT
  
  config MGMT_HYPERCALLS
-       bool "Enable privileged hypercalls for system management"
         depends on !PV_SHIM_EXCLUSIVE
-       default y
+       def_bool y
         help
           This option shall only be disabled on some dom0less systems, or
           PV shim on x86, to reduce Xen footprint via managing unnessary

It could be very helpful to consider this patch to be applied first.

- number of tags indicates that it's the way to move forward
- with above diff patch 4 can be dropped
- it is mechanical change, but it's big and constant source of rebase/merge/cherry-pick conflicts
- once applied it will allow, actually, parallel development of this feature as MGMT_HYPERCALLS will
   be defined while build not broken.

-- 
Best regards,
-grygorii


