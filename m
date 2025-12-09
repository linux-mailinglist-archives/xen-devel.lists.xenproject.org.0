Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6912CB03FE
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 15:23:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181754.1504758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSybR-0005JQ-ET; Tue, 09 Dec 2025 14:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181754.1504758; Tue, 09 Dec 2025 14:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSybR-0005GS-Ax; Tue, 09 Dec 2025 14:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1181754;
 Tue, 09 Dec 2025 14:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I/6M=6P=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vSybP-0005GM-G6
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 14:22:07 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ff22ec4-d50a-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 15:22:05 +0100 (CET)
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com (2603:10a6:208:c8::27)
 by AM9PR03MB7459.eurprd03.prod.outlook.com (2603:10a6:20b:268::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 14:22:03 +0000
Received: from AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae]) by AM0PR03MB4594.eurprd03.prod.outlook.com
 ([fe80::5a:31d6:fee4:ccae%6]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 14:22:02 +0000
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
X-Inumbo-ID: 6ff22ec4-d50a-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ci3bKY4mKm7/iB26LodDIoR4BZQWMDuDgx1cZTjAj3pcOmU4bFdx6SCTBIk2Vdf85FATHZaHLt/heK9Y99m46iMHGJ3aDCZBJCVeBCsSDp88+NYNZ5IVjAp1xMngWM4THWA8q16nLXL4NOrZd2f2rGdBpysJjq+EJMgjlYuvxRByJNxvjCqGOzo5tE2mT/Vz/xL4OQvJ7GECcMp1nmRFhFweitRlZ14K/7i2QxCLxrcRP31rsFc7QBmWfgnZ38rGdB78h0TRrhEk3GMv/BCjU8090+GqtbxMH3jNmizMn32DWwy9CviresiMXa5HaUcanIFTBYa7U725yr3B9DiSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5qgmT2YSYvIfYW1pXZm7wasJ+8jZjmITWZqGKHzovg=;
 b=H7UxcrjAV0Yp8tKhvravS2jCj74qmD5I5tZSKV70Vp1huGQjGUNEMNnkbYZX8OFuFjQFzFnU6+adPH0ftEaQvb/eadY7n7Fc0WnYJKCzMvOf0EIcJ//GyeD/HtmBKgKSz3oWE2jIofgW/gi8W//qpC97iC+0VcC8Ge5qdN6y4xYU6LKqFTm+z9wyATFAj8oHdQ0SwdLTXPLo3IY56btF7x11/G/ok1JoJGfeFJax5oFBeQyqSJSVJqw2Xu+2uzWOjhmOjb3Hfvf3sssxa70kCm0HEGcEKqb5e8Z6KEFy7d9/hXZzRVeg+qwS56UJnCvzzXa4nWPjnlhTYMWzVVAonw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5qgmT2YSYvIfYW1pXZm7wasJ+8jZjmITWZqGKHzovg=;
 b=TVJvhMxLIggoxGdSJ+rNk4aC1GfR9vDYrb0LujPfRNsZzX6sxJsRjeCPfQRR4EcY9dVkejZyL6pK0rI1025sTcTfOWDS9XD0VeELMtZRs87ZpkZ+wo1Hwr2MhRG8L42IjR+hgPz61KTxkQrBV1ogcQzS7M77pGCHB6KNeRuFge+1Ff0VngLjNs/dAcQ4UvoTjRAShcSpxl/wvadntQuj3q28xVM5c+Ebt2AaOLvtq+nZgm7bURheSrTXWpLp9PN8hsVBEZMsHht8am4WJXKRveL5MkAhQVcvax5ivQmh6YQMzvmZM4A82F9q+zOFTEalmUzKqdaghjCuthw4aax1nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4e7e8f25-a658-4e8d-bdce-1e1266ff6339@epam.com>
Date: Tue, 9 Dec 2025 16:21:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v2] coverage: extend coverage on .init and lib code
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Victor Lira <victorm.lira@amd.com>
References: <20251205193411.1368659-1-grygorii_strashko@epam.com>
 <d9a632d1-8587-45bb-bc13-8dab8d346cb2@citrix.com>
 <4fc76270-98e6-46c4-a6a4-d73772e079c9@epam.com>
 <483d50d9-a076-4698-bd14-28afabd5d369@citrix.com>
 <f6cccd82-3112-4696-850a-119843fca5ec@citrix.com>
 <18ab3734-deb9-4569-ade5-9d96a7bf3c7c@epam.com>
 <25069a8e-ef00-4706-bffa-b3b724cca200@citrix.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <25069a8e-ef00-4706-bffa-b3b724cca200@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0031.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::12) To AM0PR03MB4594.eurprd03.prod.outlook.com
 (2603:10a6:208:c8::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR03MB4594:EE_|AM9PR03MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: fd84918a-20a0-47cd-ae50-08de372e528f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkIvMExSa1JiUlRmaCs0d1IvM3ppNVNCenh2YVNSK0JtSUlBRGRDZlIvaWs1?=
 =?utf-8?B?U3l1ZGFMKzNhMHV3TnRJMG5NbHkvOUo4TzNxYVRTSVZqazJTdDJzcVc5cDNW?=
 =?utf-8?B?RGJidDRHUnNObHZuMUR3bjNpb2Y0YWZZYjJEcmZIWmZFOGhrVnRuUFhJUzBW?=
 =?utf-8?B?bkFSckxPOHRoWFhSZ1c0d09JNjk5U01mNzVYZE9ZaWQzb2VCazkyYlJWU1o4?=
 =?utf-8?B?cUtzMjE1UDFKbVQ0eTFyVVRKNXFMZXhyZU9hSWJka2M0blp0RkJDZHFHRXVt?=
 =?utf-8?B?R0FoRE5JUk1vOW8rTVIxVEFGVFB5S1A0dXRORUx3WmEzaEFCaStxeXdLTWFE?=
 =?utf-8?B?YjYvdkQ5VjhPVGhtVDRSN2wwL2pHbStza0NXR2VITGRSUklEVndXWnFYTUZP?=
 =?utf-8?B?NnNJaEdoRG1yVXJiYlYvU2J3RFZLOG1nOUxDNU5XbVo0cmdBWTBQWGh1WUt6?=
 =?utf-8?B?RXQvSE1tMmo2RUtLbHBQUlptQkN1TnRIcFdmYmMxSWduYnFOK1JuYXErTzJU?=
 =?utf-8?B?ZjNrNkRtS0JnMWNmMWdHME5DcjY4eTVrTENlaUgvNlVrMmhhMUQ0TGZrREor?=
 =?utf-8?B?Q25VN2pRajk1TzN2S09mcXJ3NDdCZUdKWVJZeVk5dFFpWUR1NUZpbkdHUnV3?=
 =?utf-8?B?MzV1NWRnMkczNDFLV3VROFdUbVRZKys3UWVHcUIyYzFtbHVBYzJ6dERKNmdX?=
 =?utf-8?B?azMyWjJrVGxZZnUyMm01SCtiL2xyL2Z3SmJSTFB1SUdLL2p2T3BUWDNQWW5p?=
 =?utf-8?B?SHRkUm1sNTdzUm9UWnN2cS9qOUk2VEN0YW5qcnhlNlVyaUdNODNidVFXS2Mx?=
 =?utf-8?B?WmVDTFREd2JHbmZyR1dhc1FHTW5tRXVEYjZHUmFUSm9wYVpKL0daVi9UVytn?=
 =?utf-8?B?NDArL2Q0UWJlcUVmT01qUy9KK1VnY2ZlSWtaWWdTZGZRNUFXRFlLaHc5VGt4?=
 =?utf-8?B?bmVnOHQyazcxUGZqRHdxVEh4SVh3amFYWFlBcExZekVNQ3ZKdTMrWWV3SFpW?=
 =?utf-8?B?RUxHZXhBTk85ZUhvYWlTalcwUjQwcWpCMlRUOWFYNVJNbTJ0UTF1T1VZKzVU?=
 =?utf-8?B?WUxQS1hVWWhQdTBWYnhFbGhGTm9xOEg3VzhDNmJyKzNyMnNTK05aYmgxYzZD?=
 =?utf-8?B?YUtCVnV6cG5UQThjQWxMa0tudmcwRE50aUJNTE4xT2oxU21BOVZEL3NjK1dR?=
 =?utf-8?B?TkM0d2dqQ3U5a2N2ZTYrSnV3RzhjaDE2dXo2MnBOcHlCemRCRHRldXkvU3Bh?=
 =?utf-8?B?MHpGT25wV2lnTk95Y0VCVWhUbjlNcHVsUjlvQmpmczJ4R0ZDQ2dzYTIzZm9T?=
 =?utf-8?B?YkdZdFpVRmtaeXhpSGQ5aDZTaFBBTm9aSDNxUnd0dXg3bHY5QzJLODkyT1B5?=
 =?utf-8?B?ZStwbkZwdVVmOWlKODBtMFRBL2hTSTFxcHd0RTBrUGJtTit1V1dleGtHc0Ro?=
 =?utf-8?B?U3dGcmtDSnN5OEU2WlUwSnlpK2lPaWZQRVM3WnJoVmtLWmI5eTIyR3dHL3du?=
 =?utf-8?B?Rmp5LzB0ekVlMko3MHZ3a2hBNEFkZ2FCODdMbkxoaUsybVE0cGtIVEk0TlFP?=
 =?utf-8?B?OTE3eXVXUlRjVVFMR0xwek42S0V0a1owWXY1Zm85Y2NzR2ZRVy9jSjdrcU5O?=
 =?utf-8?B?Q0dNZDBmWnJ1WmFNYWlvN0liVnh3NGREdzBmeEZsbGFueE11LzBaTDdBV1Rm?=
 =?utf-8?B?bGF2RlB1NVFDQVIxWkE1dzZCZ0lpdGFQOUhLNTJVNEc5bnFvcDJBZmRZU2tG?=
 =?utf-8?B?MUt0WG16VjZDeWk0Q0QrUlZzaEIydWx0aWJVN2orMDJOelBoM1EwMEZMbTJl?=
 =?utf-8?B?ekZTTU5wMW5TSEJUMkZUQ0puV1pDVnEzaFFOZ3V1MjU4aURXSkFnK1cyQ3Z1?=
 =?utf-8?B?SkxYMmFvU09yRGdtTzZ6VU10RVlJQUtoVGtLQlFTQW90QWtxVXdHWkpqeFpV?=
 =?utf-8?Q?xtfrDHzHK70ZMCcB9e0lvnuW1mvpHkSI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4594.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHBsdFdMZUp5S2NGeEVyMTBFaTg0NnZrcFJWQnJkcnJCZVRLeTNKbGZzRkUw?=
 =?utf-8?B?MkdoSWFRaVVGYjkyRWw0QU9XN2MzVDBvemdoWFVrdXpEVk9QWGQ2Q2Z3ODlV?=
 =?utf-8?B?cTRSMDBpa1lwT0RUWExwdncxbUh1dEYyZ0tjbmtZMEFlMFB4UllLUWNpRWlC?=
 =?utf-8?B?UWRIQ2tLRGE4Zllaazk1UlB0V2x6N1NKQkE4bXdhZEdnbStQUzB0eWN5dDE3?=
 =?utf-8?B?WElJU3JtajJtVG1Fb1h4Z282cjUxbWxVTEszWEFTTTlHQkl3dGd3Z0ZtQmNU?=
 =?utf-8?B?eUc1RityWE9yK1ppL3BMa2oxZGpXMisvZC9ndC9UOE43alNuZzA5dnNIR29t?=
 =?utf-8?B?bmpiUDJSTFE5ZmRwOTFTY2ExcUE0Vy94WW1YU1cycjdZUkQyZHJ6ckt5U0RN?=
 =?utf-8?B?T3RrK0lKSTVlS1VOOVd1eUlyREhJTHBTbk4vU21UWTYvMHJFQ1BwWW5MRkty?=
 =?utf-8?B?d1A3cDFMQ3A2YzRYVVdSdHEwTWVpNlVIRGFiS2d1Y2tQbVFpMG45SzNtOW8v?=
 =?utf-8?B?c0JCQ1FCV1FMU2Y4cktsdTVvOFllUTd3WTdQdzYvMnJneHh0ZEhKcU5taVV3?=
 =?utf-8?B?R2FaSHJPSDIvS3ZSRUwzUjV1RldPb3lNdWhKWGpXMmVVZXZJZS9XcG5wUGRl?=
 =?utf-8?B?TDZkSXROWTVJOFhadGxCdzVHOVRoNzh5THNmcGpINC9FYTYxVG9Yc1hyWkNl?=
 =?utf-8?B?YWJ5UkRtUWNuQ3lZZjg1QkRhc2FZdXV5THNTR21FNFd4a3kvQW9YMWM2eUhO?=
 =?utf-8?B?N216ZHVhdFBFMVI0ZnBaaEZCenpFcWtGak9pdmZaNVpscUIrRlByU2J5L25r?=
 =?utf-8?B?TllPV1JpZmNhb1dEQUFMY1hUb0cwREVDWjZVQ21NWXlqZkYzazJJSnk4OEdZ?=
 =?utf-8?B?b05LbkQrZWpjejY1elV2aE5XWHp2eGQ3SkxiUy9GRTdaaWNHSjhUcFFZMXMz?=
 =?utf-8?B?eGZjeWNtb1o1VUZUYUVkTWxVMm8vVDhsbkJSc1JvNmMyL09FaVdaaFNyOUly?=
 =?utf-8?B?Nk8xSTB1Q2VqT2NGZDYxeG9yWGM3cnBmZndnZjJhWE55UE5EUm15N3kvQ0Jx?=
 =?utf-8?B?bnhKdUxDS1VTUGhHck5VYkJZQzI0eDdTOEJDOHNodCs3M200MW40Q0gyZUt1?=
 =?utf-8?B?WEszWElmMXp1dmFvNmhNRUhmdmpQTFRIZ1p6VDZpUmxvVEJQMGQzZHBSaXJn?=
 =?utf-8?B?MXRRU0xMRGEvTytzTldBQ09jTVZ3dVpFaGVsZ0ZZZndDbnFpVTZtbkluTkw3?=
 =?utf-8?B?WnluNlRUaEZEc2p4VVE0bmNvbWFmYWJKK2ppVWxIZGtnUEdMTnZRRlJyTkQ3?=
 =?utf-8?B?YXJqTVBzWGUwU2QyTU1OTnVJd1F3aCtTdDh3bFAyeEdhVDcyM0JuVUcwS0Jl?=
 =?utf-8?B?S1ErZ24rajVrRG9QV1Y3TkhLbjUyZUpSVVN1cEVsU1FHR0dZbU5wdEFld0t4?=
 =?utf-8?B?Skh3SGg2OUFQRVYyRjVlYU15dURDWGxYcW9JRnVCVHdjSm1NZ09MNnJla0FI?=
 =?utf-8?B?RjUybk00Y2JRQUZrMklrT0RxY1VoVnNQUEl0RFNXYjFJbHRrNmFrUkcyRFli?=
 =?utf-8?B?alBpVTliZnF1VURQQW9DZ3JDVlFGWmxHZzQwMXJwRXdZSHRmMnAwc1ZTbFhu?=
 =?utf-8?B?a0lVb0lFbk10YVdsQjVRcnFuYmx2VmQ4SllmTDlCbzNXOUVoSHBZb1FWMFp4?=
 =?utf-8?B?MVFvODNtaEd0dFpZem1Nbk03RGZ1cUxXMHBudzdibE9uUUxSREE4Qm0zUUV5?=
 =?utf-8?B?YkxoVzR2cE9TSTdxN25pbUtkL0hNTjVjcklRTGo4TXNLT2lqT2c1VE40Rkpo?=
 =?utf-8?B?cnJVWlpIcHhBcHVYOGY0d0VaTTZKWFB5eEVTbjdQc0FlRmVFTC9FbG5yTXll?=
 =?utf-8?B?QysyTHFwazhZb1hQaU0rbzRTWUhBbGM1OXlBQytvdUJRaWw5TEppMitNMUZL?=
 =?utf-8?B?aHg1SGhBcTBNVFBSRzZJZFgrWldMUjEvSFFNN2Fkc3lSTGtIVHpKYVJWeFFX?=
 =?utf-8?B?UEVOVmM2VlVzQ1FnQVE2MUozZEplWXJCVzVpRDlxQURvSTJaak1zUTcvQUZT?=
 =?utf-8?B?VUcrS0Mzb1Foa295VktnRlRyWHJBNEVSODM4QXJSZTI0VTdLcVkxWXNPRFU1?=
 =?utf-8?B?MSt1azZDd0dUQW8xTlZIS3ovTEQzbEhkbVF5L0RDbWIvcHdkRHl3dGhITWdU?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd84918a-20a0-47cd-ae50-08de372e528f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4594.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 14:22:02.7957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJCJjT0iX+SNfZ9qVGekh+Af5nj41rb/Vr64MKupF14t8cCZP1YOv6kyotPi7QV8nxZwgl/kle+9jWX7FiSlTFLXM3Qb1uESZTr6UCv97pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7459



On 09.12.25 15:19, Andrew Cooper wrote:
> On 08/12/2025 6:49 pm, Grygorii Strashko wrote:
>> Hi Andrew,
>>
>> On 06.12.25 16:21, Andrew Cooper wrote:
>>> On 06/12/2025 2:15 pm, Andrew Cooper wrote:
>>>> On 06/12/2025 9:10 am, Grygorii Strashko wrote:
>>>>>
>>>>> On 05.12.25 22:00, Andrew Cooper wrote:
>>>>>> On 05/12/2025 7:34 pm, Grygorii Strashko wrote:
>>>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>>
>>>>>>> Extend coverage support on .init and lib code.
>>>>>>> Add two hidden Kconfig options:
>>>>>>> - RELAX_INIT_CHECK "Relax strict check for .init sections only in
>>>>>>> %.init.o
>>>>>>> files"
>>>>>>> - DO_NOT_FREE_INIT_MEMORY "Prevent freeing of .init sections at the
>>>>>>> end of
>>>>>>> Xen boot."
>>>>>>>
>>>>>>> Both selected selected when COVERAGE=y, as getting coverage
>>>>>>> report for
>>>>>>> ".init" code is required:
>>>>>>> - to bypass strict check for .init sections only in %.init.o files;
>>>>>>> - the .init code stay in memory after Xen boot.
>>>>>>>
>>>>>>> RELAX_INIT_CHECK/DO_NOT_FREE_INIT_MEMORY could be used by other
>>>>>>> debug
>>>>>>> features in the future.
>>>>>>>
>>>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>>> ---
>>>>>>> changes in v2:
>>>>>>>     - add RELAX_INIT_CHECK and DO_NOT_FREE_INIT_MEMORY, those are two
>>>>>>> different things,
>>>>>>>       both potentially reusable
>>>>>>>     - enable coverage for libfdt/libelf always
>>>>>>>     - enable colverage for .init always
>>>>>> This is a lot nicer (i.e. more simple).
>>>>>>
>>>>>> But, I still don't know why we need to avoid freeing init memory
>>>>>> to make
>>>>>> this work.  What explodes if we dont?
>>>>>>
>>>>> It will just crash when coverage data is collected.
>>>>>
>>>>> First I made changes in make file to get .init covered
>>>>> then I hit a crash
>>>>> then I checked %.init.o
>>>>> conclusion was obvious.
>>>>>
>>>>> For example:
>>>>> objdump -x bzimage.init.o | grep gcov
>>>>>
>>>>> 0000000000000010 l     O .bss    0000000000000028
>>>>> __gcov0.bzimage_check
>>>>> 0000000000000040 l     O .bss    0000000000000040
>>>>> __gcov0.bzimage_headroom
>>>>> 0000000000000000 l     O .bss    0000000000000008
>>>>> __gcov0.output_length
>>>>> 0000000000000080 l     O .bss    0000000000000060
>>>>> __gcov0.bzimage_parse
>>>>> 0000000000000098 l     O .init.data.rel.local    0000000000000028
>>>>> __gcov_.bzimage_parse
>>>>> 0000000000000070 l     O .init.data.rel.local    0000000000000028
>>>>> __gcov_.bzimage_headroom
>>>>> 0000000000000048 l     O .init.data.rel.local    0000000000000028
>>>>> __gcov_.bzimage_check
>>>>> 0000000000000020 l     O .init.data.rel.local    0000000000000028
>>>>> __gcov_.output_length
>>>>> 0000000000000000         *UND*    0000000000000000 __gcov_init
>>>>> 0000000000000000         *UND*    0000000000000000 __gcov_exit
>>>>> 0000000000000000         *UND*    0000000000000000 __gcov_merge_add
>>>>> 0000000000000008 R_X86_64_PLT32    __gcov_init-0x0000000000000004
>>>>> 0000000000000012 R_X86_64_PLT32    __gcov_exit-0x0000000000000004
>>>>> 0000000000000020 R_X86_64_64       __gcov_merge_add
>>>>>
>>>> Aah, we should exclude the OJBCOPY too.  That's what's moving
>>>> .data.rel.local amongst other sections we target with attributes
>>>> directly.
>>>
>>> we can't target.
>>
>> I've come up with below diff - seems it's working without
>> DO_NOT_FREE_INIT_MEMORY.
>> Is this what you have in mind?
>>
>> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
>> index 8fc201d12c2c..16b1a82db46e 100644
>> --- a/xen/Kconfig.debug
>> +++ b/xen/Kconfig.debug
>> @@ -40,7 +40,6 @@ config COVERAGE
>>          depends on SYSCTL && !LIVEPATCH
>>          select SUPPRESS_DUPLICATE_SYMBOL_WARNINGS if
>> !ENFORCE_UNIQUE_SYMBOLS
>>          select RELAX_INIT_CHECK
>> -       select DO_NOT_FREE_INIT_MEMORY
>>          help
>>            Enable code coverage support.
>>   
>> diff --git a/xen/Rules.mk b/xen/Rules.mk
>> index 8c4861a427e6..47fdcc1d23b5 100644
>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -33,11 +33,15 @@ cov-cflags-y :=
>>   nocov-y :=
>>   noubsan-y :=
>>   
>> +# when coverage is enabled the gcc internal section should stay in
>> memory
>> +# after Xen boot
>> +ifneq ($(CONFIG_COVERAGE),y)
>>   SPECIAL_DATA_SECTIONS := rodata $(foreach a,1 2 4 8 16, \
>>                                               $(foreach w,1 2 4, \
>>                                                          
>> rodata.str$(w).$(a)) \
>>                                               rodata.cst$(a)) \
>>                            $(foreach r,rel rel.ro,data.$(r).local)
>> +endif
>>   
>>   # The filename build.mk has precedence over Makefile
>>   include $(firstword $(wildcard $(srcdir)/build.mk) $(srcdir)/Makefile)
>> diff --git a/xen/common/libelf/Makefile b/xen/common/libelf/Makefile
>> index 60b3ae40728f..8180c78f1510 100644
>> --- a/xen/common/libelf/Makefile
>> +++ b/xen/common/libelf/Makefile
>> @@ -1,8 +1,10 @@
>>   obj-bin-y := libelf.o
>>   libelf-objs := libelf-tools.o libelf-loader.o libelf-dominfo.o
>>   
>> +ifneq ($(CONFIG_COVERAGE),y)
>>   SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>>   OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section
>> .$(s)=.init.$(s))
>> +endif
>>   
>>   CFLAGS-y += -Wno-pointer-sign
>>   
>> diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
>> index ae0f69c01373..fb26e5bff0fd 100644
>> --- a/xen/common/libfdt/Makefile
>> +++ b/xen/common/libfdt/Makefile
>> @@ -4,7 +4,9 @@ SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
>>   
>>   # For CONFIG_OVERLAY_DTB, libfdt functionalities will be needed
>> during runtime.
>>   ifneq ($(CONFIG_OVERLAY_DTB),y)
>> -OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section
>> .$(s)=.init.$(s))
>> +       ifneq ($(CONFIG_COVERAGE),y)
>> +               OBJCOPYFLAGS := $(foreach
>> s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
>> +       endif
>>   endif
> 
> This is the (aforementioned) non-standard way of doing .init.o, which is
> why it doesn't play nicely.
> 
> I suggest that we first convert libelf and libfdt to the standard way of
> doing .init.

I assume the rest is ok.

> 
> For libelf this means we need regular __init annotations, but #undef'd
> outside of __XEN__ (when we're doing the userspace build).
> 

Need clarification here - this are imported libraries and changing their code
directly was not welcome before. Therefore there is Xen specific magic in Makefiles.
:(

Just an idea1, may be ".init" handling can be just dropped from libelf and libfdt
Makefiles with comment added instead (kinda "TODO") - they will be built-in.
It doesn't work with CONFIG_CC_SPLIT_SECTIONS any way now.

Just an idea2, drop libelf and libfdt changes from this patch.
- they will be not in coverage report (nocov-y += *.obj)
- will be resolved in the future.

Trying to avoid blocking on external dependencies :(

> For libfdt, this will need some init_or_$FOO things (matching
> init_or_livepatch).
> 
> Once the custom init has been made standard, this code becomes easier to
> move into lib, and we no longer have special cases when trying to extend
> coverage.


-- 
Best regards,
-grygorii


