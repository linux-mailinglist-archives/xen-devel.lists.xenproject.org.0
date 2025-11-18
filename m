Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE617C6B7A3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 20:43:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165317.1492102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRc7-00022v-Hp; Tue, 18 Nov 2025 19:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165317.1492102; Tue, 18 Nov 2025 19:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLRc7-0001zt-Ez; Tue, 18 Nov 2025 19:43:43 +0000
Received: by outflank-mailman (input) for mailman id 1165317;
 Tue, 18 Nov 2025 19:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/jeL=52=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1vLRc5-0001zi-Vs
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 19:43:42 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0c590b9-c4b6-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 20:43:39 +0100 (CET)
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com (2603:10a6:20b:6::31)
 by AS2PR03MB9791.eurprd03.prod.outlook.com (2603:10a6:20b:609::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 18 Nov
 2025 19:43:35 +0000
Received: from AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4]) by AM6PR03MB4600.eurprd03.prod.outlook.com
 ([fe80::ec82:849c:dc0b:f6d4%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 19:43:35 +0000
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
X-Inumbo-ID: e0c590b9-c4b6-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArVzEj+sceqFNO5IOtyk8o4elg9g4cvZnYjKlqwn0TV6QhAGdnNSiAhAHouAPuhsKKabHeq/aGrKwbtSM5DWGm9SXGyqNj5XZ0ZVml/giGH1+Lad9Ek8lXyLisPAXVKrQCv4A8NDGsPomc+oMxa7w20npSqPkrL3tTr5MLAeweSDxtQCp4jFP7pJzEgDWB61ex+14uFqGuJube7QF1VPDvc2IjGu+Xfb/DZog1T0TFk8M3TM1idZQ2vJOySMBhx70AYBSEIJ3d2k/+gZQS8qmk3MYUg+VciU99SM6i/jg1K3EWAVSq2ktXUn3rVsao4j1RPrbW93p+3r6Kj5aoM8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bd4ODv427YJtT60WZI6Ty3rkCnD2W7OaWuKCYaDTL9U=;
 b=XJaM1GcbfLXY+xQ8EwBiEYHnKpyZ7NY3Zsn5JSip4FH42S960iaw9FgtwF6/ByZp0zWIjj9v/qNK0BVlT90Fnnm1gh7itmU2NgvSaXB8F4glI4cdYnDB0n2fgihkt8BnR3YjSUa1C+z4uZRPWkAemTtVRqALJt/T/6o7kex0cJ32jbsWrodf9fNj01rwnJJ871p8KjwmjaUHPwJHxc1syiKT9+6SSeMQcgXYuYeHy4i3yTo9Pvpj0JLiTx189YCncPFeobLA4t8IuUK6c1OU1mGB65K+e5qtNeXFTdqZSWYbLt4kSM8W+in37zDbGpCLDFZW/BDwPnZW4pAHka6LFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd4ODv427YJtT60WZI6Ty3rkCnD2W7OaWuKCYaDTL9U=;
 b=sQleHvIi5XiS1rVYKwEqlyLZdKTVkx2Z1fgz9unzWHfxmmiTPpJgVNtm81HWm8pQL+dVNvU9To+x528DUDFZHlfFqJZBsCk74OhL8/WVm6dufoLY5lKIv1Zxu0Tudor4lptS6IFDblY4DsKNsHma9EwQ/d6WKHSLqLv+DliYDVgqT4HcIA26DsbWYn9aVY7eEDSdD5NubJiKJtddpcp27/CwNXdguCr8pnKZaM1mxbfDznBlXIGtjt+aH3lMX7bJ/yYlCp59wVl8dtBHQU0h6rA1xgGTrj2sOWKD7aYVmGxgHimOWFC4BVos7k/ucyqwhEzPdMpTiyBaW7mlfElkNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <04e6d52e-a5c7-4684-b806-556d0c14c9c8@epam.com>
Date: Tue, 18 Nov 2025 21:43:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] common/libfdt: optimize usage
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114180130.346755-1-grygorii_strashko@epam.com>
 <0557029f-5946-4ee1-a622-842e2698a6c8@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <0557029f-5946-4ee1-a622-842e2698a6c8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To AM6PR03MB4600.eurprd03.prod.outlook.com
 (2603:10a6:20b:6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR03MB4600:EE_|AS2PR03MB9791:EE_
X-MS-Office365-Filtering-Correlation-Id: c7883a04-1a26-48ae-35db-08de26dac316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aXlNNmxvNTF2U0k3S2dzSjQ0b3Mvb2JWQWRBUisyL1p0ZnUwSlZ2c0tGYWxY?=
 =?utf-8?B?Y0twM3RJcjQyQjM3dTlscmR0Nm9rMXZQVER6dXc5d3hjc1J4SDhLeXJsV01E?=
 =?utf-8?B?QjAzMlRpblhiUk1lSlp6eEJMQThCNUlteWhRb2drUVhONWZSMWZHZ0ViYVZT?=
 =?utf-8?B?OHNaM0hDZW5SMXVVaTIvdElQdk8wVVFwSW1BMzZ5ZXowSGpEU2FlYlBNMmFB?=
 =?utf-8?B?SVNzVUg1cGdUalFBRDdERlZMa25Fd3UzbCtBSWZHd2pVZ2xGRWloekM1VHN6?=
 =?utf-8?B?dnBKTThMazZTSTlhdExzRXBELzZoYWpnM2Q2UWlBZjdsYUErVU1YUjE4SGVm?=
 =?utf-8?B?RHc4VHFmaXRoVWkrRFVKL3cvdDZkWnluTzl5VmlFSy9VbS9rWlp1RGVobkxB?=
 =?utf-8?B?dFlhYWNVbnczSTZJcEg2N2s0OWV6QkZNRVdLMjdxQXoyTGFtbnFCTmlRWVcy?=
 =?utf-8?B?TGJ4WXZpcDlGWHBVODd0V1BMdkdVNW5OQThuWkd0Y3FpN0w3VkkyVEkrUklv?=
 =?utf-8?B?eXQyQk9kRXRPSWNzNFluSzhieVZ1WTRuQ0NtRmhJVnRyLzBuRi9wbW5GRlpp?=
 =?utf-8?B?bThuWjdOVWYyZE1LTW5ZZ2w4MFVMKzkwRWZrSkJXVXpvZ2RIZGlUbXArazh3?=
 =?utf-8?B?VWl6QlBreUVUa3NSbC96NjZMbUt2T3hrTk5LUUh3TFB0Q1hoTkFyb0c0V29o?=
 =?utf-8?B?eEh1SnVuOEU1eVVtWkMvK3hYanFKUkNvcWZEa3JrUXc3cjVMaS80NGg0bFJT?=
 =?utf-8?B?QkJsNnNzS2cwdnNMekJ1RCs1MXZueWR2TzhjK1UrSFB1T25xbjBzWVlpR1c2?=
 =?utf-8?B?R3VoM0Q0alV4V0ozOEk1ditoNXE4aGFuWTVNNWo5N1FVYkE4WkZhK2lJQkdL?=
 =?utf-8?B?Tm9vNTBpZHJCWUt6RFpPcGx5Q1JkWXdHRzJPTzRRSFQ1ekc1WVd6SDVvcTRt?=
 =?utf-8?B?eHJCNzVwczBSWHd5Ty9aZVVsclNlaE1CenNGWm9YbHova1diVzhiaEVNUDh4?=
 =?utf-8?B?NFYzT3dwVXBBMjYydERzUTN3bSs1cG95aWNmeGQxdjdHV1ppcjUrNkVFSnhQ?=
 =?utf-8?B?MlEwRmdGaDZ0eGRtVzhOMU5qbUR3dkpOLzRZL0pDTHJFUVE2UU10VXlqOXRr?=
 =?utf-8?B?RnZPcmZqRWZyRFI3dGRrUDJISS9BNWtsVXVVbitWaXRURnhyWHJMbCtPZzhr?=
 =?utf-8?B?T1pXQnFpWXEzNlZOckt2V2s5WGVyb0pnSVp0bFNYaHRLMUhvL1dEUUlTeGMx?=
 =?utf-8?B?N1VSclFoOWRwYVRLWE5FVkJLS05TbzU4WUJ2ZEpsQTN1SjYrcDBiQXpGNDFy?=
 =?utf-8?B?Snk5d2Zjd3lwN0VZL1MxRC93Zk1Waml6NmZ6RWJOK0hrZVpGL1RZQytpS0lt?=
 =?utf-8?B?Nzd6UUlwNEpkRVE0Y015VHQxRFVJakRpOVk3cVowT2c4emZlK1laQXlFR0ZP?=
 =?utf-8?B?dXJKYVByeWJyM01VWW4yM0NQa0RwcEV6K09pS0FKRUloU1gzcDJWd1JNWVhp?=
 =?utf-8?B?Y1c2ekFEcWhvOWRMOXhWRm5uT3lsYnhkOTVJTVdOaFdsWEpHZ2NlN1VyUDJP?=
 =?utf-8?B?eWF0cDNoVEI3ZWVFdjIyNy9EbVVqM3ZFcnZWOWhjaFVBcEVtSVZ6eTJac2Jo?=
 =?utf-8?B?TlRjREgyc3d5dy9vdDNsKzRvMWZoZ0NvMlNBeTRHT3p6U0QycGU1L1R3M1cz?=
 =?utf-8?B?d3EzWGUxN2VOK0VVVVRRN2tRRVZ4WW51SVVvZ2Qyd29oZUJuR0JleEtCS2ow?=
 =?utf-8?B?NFplOXRzZnAySDBvc1lYU2QwSGdUcnFUOE4zcDNkR1JXdVluMXNqd090WG1j?=
 =?utf-8?B?bFF1ZFVmbTRGanZWLy9ZNzF2UENKMEFWTU9DbUN3VGVuQ21OelJCSzJ1dW9m?=
 =?utf-8?B?UlMrdUlNWXNGWHRGUHJpaGZEVDlJZytyRnR4K1h2cEdmVVhEenFVUHErNDhi?=
 =?utf-8?Q?qa0S364kGUWX6o/5eKx2aQLkkO4BCGUk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR03MB4600.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmp4Qit6U1ZIL1B1STFzTE9YaUNwbGZUamtyNy9TWWhuMXRLbGNQc3pFN0Mw?=
 =?utf-8?B?UkpZYWsySXRoNWMxR1M5REk4RW1LaVZXblVZRCtTRFdlUTNWY1hGdzhXSUF4?=
 =?utf-8?B?QkZZenBTSFNYek5maXlXNWxLYXlhWmZZYWx0c2JYWEovOTVyUHU1elRneUFk?=
 =?utf-8?B?bDIyT3ZxbDZNc2JSMHVwRFZUQ2NsM2crYmxKNSt5MVh4dEZaUEdsY3VGMm9M?=
 =?utf-8?B?dnBmNnkxbVZobklwT2tXNVRaTTBRUVhtbTRVTzdEQitZK2FHNnFCNWE2KzVy?=
 =?utf-8?B?QktaMlFoMVFrVGEyclFQTnVQRnkwQmY4ckRVYkdsY0lwaEx3ZUVpeHQ1RkFx?=
 =?utf-8?B?UGNHSkpmaWpWcG90REt1Y1k5UVR4MkVjTkNkcXF0S2hXczhPeDRmbm83Qmgr?=
 =?utf-8?B?bFFEc2IwRy9iSVNsWGtvbkhUeHJMTWN3b1hPazZrVW1RVzVNVnNJSjJMcnhH?=
 =?utf-8?B?WDIrSnNJa3Axa0JjV3JOYXR4d2NPZFRSVU9jdWxGYU9FUUdtSlIrSEdvY0JH?=
 =?utf-8?B?azFGUVo5a1M4SDRYbFZWb3RtTFBVL1E2WDhKdnloN2lJRUVITVRvTkVscXdo?=
 =?utf-8?B?QkN2ZC9UNm90b1VDbHVzbHU3VkVScExnbzc0UDhiZnBFTEVjQkJNWUtKdnlT?=
 =?utf-8?B?bTYrTVZ1UXlvOUJzSlNUWXVONG53TENta25SWXJiaU9uWHBrWmx3Ry8yRVZE?=
 =?utf-8?B?ZGRKZVVoakZyODBYem9zYlFXTjUraytxU0tQazBaQ3VrWEFkQUtuSzVvdXdT?=
 =?utf-8?B?aFNidEdxWnJTSENGUlFxWkVzOUplSXFvRCtiK20wQzVyeTZKR3JGcnVOWnox?=
 =?utf-8?B?MXlBUGd0aGdZYThzSC9za1ArTStSVzZ4ZTVGWjFTazloRmFzVytITWtYNGVG?=
 =?utf-8?B?QXAzRUtwMnBQNkF0M1l6RSsxeHRZRUptS205V3NvbmZId21ZTlZVNVlUT2c5?=
 =?utf-8?B?ajRnS0F2N3RHMGRrVDhVYlM3cFJ1R2lIL1RFdGZmUExFQUZIV0E1S1VUZ0Qr?=
 =?utf-8?B?SDR4alBvRWVvVEV0VzBBa1ZJcG5CWDNZazllU1VEa2JadVB1VzlFWVpiQ0pT?=
 =?utf-8?B?M2pRWVkrTkZzcjZGUWk0MUFSYUdmVXFjcG9KNnR6WWVVd2hGeWgxeTVtWmlU?=
 =?utf-8?B?L0RTbDBBZWJpekFkZTc5UkVUTTl3aG1ISGdNWVc4NzJuMnIyRWpuY0lTcU9t?=
 =?utf-8?B?bG50WXBWRHdRaFRaR2h3T3hnSUtDbE5qU0IyT29wUEI0RUxUSnNhQXNVWVRU?=
 =?utf-8?B?T0xmVnBHMEFBck50WU1FMDZST0ZqQ3M5eVZXMk9PdnFBVjR6SDBrOXNHTG1W?=
 =?utf-8?B?cWpYUWxTZDJXNzVKTnpzWTFhbTlDZ1RqaVVZOExDcGl5UHlqVkZ2RFFaSVkz?=
 =?utf-8?B?S1VwWEhIQlpodkZYVGVqN3V0M3ZIa0ZESW1yUlN6WW1yRGlMV2ZiQzZBYkpX?=
 =?utf-8?B?TGthbWxLUVRIZ3RNbUZJZmN6MWFjZkdDQUhBVGY2anhDaTEzTmZGVVA1VjQw?=
 =?utf-8?B?VHAySFRuU1dpdGdkMk81UzlTRVM2dWQrOW1kVys1MWJwTGpWM2NLcnBLNWdO?=
 =?utf-8?B?S2RsdUVSSCswak44OFZtcUFLSXFSL0w4TjQ2NG1ldUV0cmtKZU1CdjI5Wm1H?=
 =?utf-8?B?LzV6Z1pPMCt0NDIvZkZSMmxKdXdyRmJDZWxPQnVCVXBpT2RxYmJPZ0NFYThi?=
 =?utf-8?B?ZkNBaTl2K0FxT1hhTSt0cHBEL2xQaUlnajVLaWdFUkwwUTRvaUkxTDVQSHFo?=
 =?utf-8?B?REVvRytIeHg1UkxUd3BDMWphNU4yT2thN2NybG9ieUZaTmNOUWV3M29vWHYr?=
 =?utf-8?B?ZW1aNCtoaXlocWV2SDc2Nkg0emV0MFNIYnJqQnc0NXJOditYRzFCVWJXc0Y5?=
 =?utf-8?B?RUpaQzhwUi8vS2JQL2dTZExHUi9kOUpGb1puV3BkNjV2ZTNXQjBwSGZvSk1F?=
 =?utf-8?B?TUJhSVBEclFOdzFZb0o3Q3dGZmdEZERPM1lhV0dOTExvTEd5S0NlL0pWb1Rp?=
 =?utf-8?B?bG83cEZuVVlwT29ZTkQwUmZtTmdpVEFTbTZ6cHhGVzNKdFdaaTZrK0F4Nzho?=
 =?utf-8?B?RDdLa1NoN0FzdUVaVkpsZEdNVjVtcGp1aExKUVg5NXdjYWhDZlkyTmRzQ1Iz?=
 =?utf-8?B?c0VWOXExVk5vWVIzcWhBRHY3c01wWmpNcWZ4ZTF0K0RyUkVPSFF0Vk16dGRt?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7883a04-1a26-48ae-35db-08de26dac316
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB4600.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:43:35.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NjtFdh3a+AMKQQyK1Hk7QnE2nD2fDoCN5Oampis14qP2OsajZfTSq+uLpUeSEiWURJ7cLY+de1Mbg9nCW54WWITjC/MGe3a9ivAuYDXPWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9791



On 17.11.25 11:31, Jan Beulich wrote:
> On 14.11.2025 19:01, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> Now all libfdt features are built-it unconditionally, but...
>>
>> X86: The libfdt is used on x86 only to parse Hyperlaunch/dom0less Xen
>> nodes, so full libfdt is not needed in this case and minimal, RO
>> configuration can be used.
>>
>> ARM - situation is more complicated:
>> 1) ARM reads Host DT (fdt.c RO)
>> 2) ARM reads passthrough DT (RO)
>> 3) ARM generates dom0/hwdom DT from Host DT (there is a mix of WIP and SW APIs)
>> 4) ARM generates domU DT (there is a mix of WIP and SW APIs)
>> 4) With EFI enabled - ARM needs RW API and fdt_empty_tree
>> 5) With CONFIG_OVERLAY_DTB - ARM needs RW and fdt_overlay API
> 
> This goes too far, imo.
> 
>> --- /dev/null
>> +++ b/xen/common/libfdt/Kconfig
>> @@ -0,0 +1,14 @@
>> +config LIBFDT_WIP

"Write-in-place"
- update property in place
- NOP the property or node
(no resize)

>> +	bool
>> +
>> +config LIBFDT_SW

"Sequential-write"
Used to create DT in a buffer sequentially in one pass
fdt_create
  fdt_begin_node
   fdt_property
   ...
  fdt_end_node
...
fdt_finish

>> +    bool
>> +
>> +config LIBFDT_RW

"Full read-write"
- add/del/change nodes or properties in fdt blob
- no automatic resize

>> +    bool
>> +
>> +config LIBFDT_EMPTY_TREE

Enables fdt_create_empty_tree() helper

>> +    bool
>> +
>> +config LIBFDT_OVERLAY

Enables DT overlay helpers (deps: RW, WIP)

>> +    bool
> 
> Nit: Inconsistent indentation.
> 
> Also, how would one be to guess which of these may need selecting? What do
> "WIP", "SW", and "RW" stand for? What exactly would "empty tree" mean? Yes,
> you follow what the files are named under libfdt/, but that naming is
> overly cryptic, too. The comments at the top of these files also don't
> say anything helpful.

Indeed.

-- 
Best regards,
-grygorii


