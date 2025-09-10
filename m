Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5232B51BC5
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 17:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118514.1464273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMqc-0004qP-JL; Wed, 10 Sep 2025 15:35:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118514.1464273; Wed, 10 Sep 2025 15:35:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwMqc-0004o8-Fo; Wed, 10 Sep 2025 15:35:02 +0000
Received: by outflank-mailman (input) for mailman id 1118514;
 Wed, 10 Sep 2025 15:35:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rM0n=3V=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uwMqb-0004nR-0E
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 15:35:01 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b586316d-8e5b-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 17:35:00 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by DBBPR03MB6956.eurprd03.prod.outlook.com (2603:10a6:10:20e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:34:56 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 15:34:56 +0000
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
X-Inumbo-ID: b586316d-8e5b-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mzOH9qnlbjuk3E6iSHtmX0bqZxviB8Zl2t/ln6IvyLhjW0plHpeEWvCkiQOvaQ8V3yCGijiM/uIThMKwnwzcFyjHDXJ6n6lRNBynkXF9CHk2N64zFyBkXV53wQrpA5mAYRkEfigLTjZzL5ogciBsNUykone1iNHKjsEYyZtbexuO0i9FZTUS8h0rzPO8+seLFDUamG/eY6Rvc67/FZVQK4ryBLfNsaePUwUTsiDblDy1SlvVZhim3nbvilQRfNFJjR73E2DDzS478/qXGD4a8f7EroEfz69igfiampFXKju6pNoIhbB18dMt0tpMRPFJIW2CoiDZ6Chpv445FzBWJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W1tJZWU2IlPQNrbhAJQ/MWSSAxIiK4ZF+maCctw/PNo=;
 b=JOPEsaKTc1SnnJnC5I/1v7hQhwNF7djmhm5AIF7Xn59p8Plm909A/MnU6MXHk5jgmOeYii2ZsvEAQC6P1Fv0AMYZ1nbl5vi6yp6UJ4lqdOvZ30TRazbNN9U48Gj7aqSEcP91Wo0mQavRi2p3fp/LqhJpp0MMbhQ2xVNfEUC7c+H0cZnA7r7++56vQ8tz8QSmrX2bAxfsg6YrEmsmLEUODFR1P0Z23AeVnknA6usmgg6uI9Jl91gJOqE/5KD2rq7L6iyVMVtYE2zDNbeZgNTTsqjLfpTHlvdi/3qmTz66DYlGwRfDKEdm2rCstJOmN5bUX/6j51auShiSFKjhN1Zi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W1tJZWU2IlPQNrbhAJQ/MWSSAxIiK4ZF+maCctw/PNo=;
 b=HdSuatDf/nRXso8riza2T6KcWPrpDMNV+9jySsMIPcnu7/5Wdoj13UvHvBA1sNAerML1KsOrvxkval8yQJgaLEWjzRsVlLtHhMS+x8cmhn7UCjHwtYcNqtfS5c+RkIIzOF+Cl2QBfokKN0WKANa3mN5p11UuscyOgvTKJlkAAUSda20HV/zRjG1exK6cx1v40OXu4Mlr0/admtDXrnCmIT1h7QGcicDmjUHBJzF1nTFHsZmX8C8hyewfjhxIGhc2+7quA5Cl/B/yYRUgPTePrQSmp8QV7F8P0BFizxOvzlbvq4SxYvfD8RTYXcBuvPzwGRotvJsd3AmxsnngNpnMuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <0c879b3c-1b24-416e-a821-be116bf688f9@epam.com>
Date: Wed, 10 Sep 2025 18:34:55 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] libacpi: Remove CPU hotplug and GPE handling from PVH
 DSDTs
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250910144921.29048-1-alejandro.garciavallejo@amd.com>
 <2c559b3a-9991-4aab-ad65-645ac0cca5ab@suse.com>
 <DCP7XE3F1J8P.3HEG1CKHZW39U@amd.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <DCP7XE3F1J8P.3HEG1CKHZW39U@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::15) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|DBBPR03MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fce04d3-6d31-4047-cc2a-08ddf07f987c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TloybzBtWFRRNWtFbGhBZWNVbDZxR014eVJDQ3hGQ2VVUmZCZUFMVEFSUGVI?=
 =?utf-8?B?NTZ3S1UzM05tbCt2OUVRUVpDaktpdjRVd2NVNnNZZGpua0pQNDU3dEM3SURj?=
 =?utf-8?B?T2Z4MzAzb1puL0l4NUhHc0wrTVVCeVhqMjRyWFF4WW82U2EzNklPNkt0MXRv?=
 =?utf-8?B?bWVuS1V2WXRVU0gvckVNcWNSSlZjazdMOHE0WkV4TTZVWVpRQnZYOTE4Q1dt?=
 =?utf-8?B?VnhwNVU5ZW1WVHVpbzg0eTE2d3NiTWl5eGJYRXU1MnRHa29kb05OME5scXl1?=
 =?utf-8?B?N282MlVWams4ck5WOTNnd2lFSTZZUTZHMENTZ1FQcjJ5TXVhc29VU2pHTndI?=
 =?utf-8?B?VVBwUDRrTUl3L3VkRjM1ZnprZ0VORnI4RjUvc3lINW1lV2NpNnVLcjNzR21K?=
 =?utf-8?B?TmpOVnZtd3QrOVd2ajZrazF0QUVtWElCdTllMXJIS0pPUFJhNkdYK3BLYSt2?=
 =?utf-8?B?Qkp5R2xJVHkvSGs2cU4rTFByWFNUUGhOVDFLaHBGWUExa25ZN0lYYTgydVE4?=
 =?utf-8?B?M0N6TTNDdjhMN01GRFNXdzZyY2grakM0UXBtcXgrcGFhWVI0MEQ1N1AvaHlT?=
 =?utf-8?B?R2ovNW96SEhLOWtlOTMzUFZQRkFXTC82a0ZQUW9BV1Q0c1BBQXZzMEFJTVFK?=
 =?utf-8?B?YVo5b2RQMUxtNmRTZFNwSlFSUnI4ZSsrMkszNnY2Q3dTNTJnQjMwMDRwaDhq?=
 =?utf-8?B?alhCZk9BdExsejh6NFpOVVg3djR2N1pYL1VTMzduQ0FETDhVN1o0OWpuTTJD?=
 =?utf-8?B?VmgxVG1DOWJQUm9wcit3Rm5NU1p1U2ZNS0M3NFRnN0Y5cDJ4RDVjUlF3Y3Bq?=
 =?utf-8?B?NWdvOGI3NzJNV3pndmVqaGJaTGtFdXRuVmFwenVTVVBqVGZZQ3lXRHNoQ2Fx?=
 =?utf-8?B?aU1kcEZOMHdEOGZuODhmdE9Ob0RabmpBQ2xqTW9hcGlRRHQ2WkE5VzZDbmpX?=
 =?utf-8?B?TXk3OHpFSU1uNDhoTUpuLzlKbE5zZUFkdVpDQ2piMTlmMDYvTTExcU1GRFEz?=
 =?utf-8?B?blpWdVFCYmtSV2tqUGtCQWx6SmZEZzJYRlhOYmdsQUsyVGRIeGM5dmp6QVA4?=
 =?utf-8?B?REsvdFBRWS9OL1RTZUR0czFlR1FWNFZwS2ZiTzlIN2VRSjFZM2s1Si9VbFhl?=
 =?utf-8?B?YWF3a3ZHR3BYRDRqbVlrdDZVSEU0T2lCQkZyOEtONkNqa0MxSittdEUvM0Zn?=
 =?utf-8?B?WDdrUGxuTjVLcW0wTC9GQmxSZkNST3RuTjZ1UkZwSmtKYm5OZ1V4SWlIOVNh?=
 =?utf-8?B?VVkwZ0VtSGpkV3U5N0IycXhTYytSb0NVY0ZLRWFwQWYxMmRUVFRiQkxsR3hx?=
 =?utf-8?B?WG82V2Vxb0piOXhMRi8xN0I4M3lkU3ZacUZ3WHlEckpiSzNxN1Jsd1hPdEtQ?=
 =?utf-8?B?V0lyN053ZnhMMm5CL1ZIcEVTdTJBYy9MdmVFdk04TStsSEhHVTZwNCs1M0Yy?=
 =?utf-8?B?Rnp0SGJ3OVgyb1FBZit6clk5N0xCMHZ5eXJBa0JDMWR1YUpGZCtzZzcyMGpw?=
 =?utf-8?B?NjBBY3M3WFNqVEtMeThURDlvMDJKL0FSMDN6SEtkalNTZU9WdE5oY1ROU2xr?=
 =?utf-8?B?bEp1cDVxSUorRG15TnBib2xXVG1iZlNrUHpPd0xseEh5NVJYaUU0MkJFb3c0?=
 =?utf-8?B?c1JmblRnVTQ3bjJBTXhkeVVYTksxZWtqVVE3Q1lRcFRiYXVGNWpFdEVaTmx6?=
 =?utf-8?B?dityQnlhUUI2VThVUXJheTE4RXFxVjVkRktnVHFkM0E1MXlUMEl2cmI0dS9y?=
 =?utf-8?B?c05ESE9BcmpWUnlCeFRFUk41SWplVytZSmo3VkpDQzROUU92akhMdjBWLzNR?=
 =?utf-8?B?UnBhY3lWVlA2c1MxZVdTZVFnalpLUEc1Z1d2TVZiUjBvcEtoZUlGeFNzMjc3?=
 =?utf-8?B?c3RIUGQ5Vlh2NVB2S21XaWFkTmhLbWgvWGl4N1lPTXM4NFBjWjZMSC8rU1lx?=
 =?utf-8?Q?VSKgeuosjAw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2hKaTlOYTdhV0RtVWhQaXBhZnRvMXcwdXI4VzVCUGRBTzV2S0NaTFJyZ3d5?=
 =?utf-8?B?TVJwdklMNG5mWEFxZkxXQU5yYUxvbmFNNTM2V0hzb0Z5UUNwckdYUXpobnR1?=
 =?utf-8?B?eFJ0OTl6R3VsS212L0ZQVmRpQmczd3J3aWMyZjVaazVjR3c1OFNRYnJBVjVM?=
 =?utf-8?B?cGNzMDRiZUFEMGJRQzRjU1BBSVBzTTh1bktKUXFNdzVEY3JRYmN2b0FXM3V2?=
 =?utf-8?B?S0ZjQUMrTmorMmRISjFBM1ozMkxYS1pyRDJkbVMrMU4rVWtBUGUwQ0ZlbXBH?=
 =?utf-8?B?SlZnN3EyWGlSSVhoZTFMU29FTFdYb2dEbExiUHE1eXdXSCtuWEd4dUhCSW1v?=
 =?utf-8?B?cnlQdU9tZWhtVitkQUl1T0pMYzU5R3MrYUQwTlhYR2I0bmpjRUpPb21JMFo1?=
 =?utf-8?B?VVFRdGRZYmRlZWFKdit3YzFGeTIxMU03NEJyTWRVcmc1UWxLZG1xdC9ua1Ev?=
 =?utf-8?B?Z21JWjBuQnpYUWk4ZEl6YXVlYjN1cTErMXhVZ2p0MlNiSTA2VmIwQlViKzJD?=
 =?utf-8?B?cW5GeVhnOWpkTmMxY25wRmRXZFd0RnpiZGlKa201eFhPZ21DeHAvck5VN0tt?=
 =?utf-8?B?WFAwcDlUbXByWlE0anhpOHRIOGZJT2VZZk9hc2NHUFVRbmFmU011c0dmb0pq?=
 =?utf-8?B?OWRyanFUQkFxRHJIamsvY0F2Mjk1cGxTeC91cVR0VUlwakJpRlZDM3FETm1h?=
 =?utf-8?B?UTlkekMxYzNuNHpwOXV5NWY2QnJBbk5xNHBIWFV6RUtkVkYrR3ZIZDFUUzQ0?=
 =?utf-8?B?ZktDZ2dqeHZoSytieVVuWUgrRlJFNytLb3oxNUdmWUlYWk0xMG1sTkg2TDB3?=
 =?utf-8?B?L0Jrd2VYbDdaUDJIMDJvMjk0QXgyVjhwU0RBUHlxWStGWXRid2RoejBXbmZL?=
 =?utf-8?B?d2FvekJTV290MkN5SlI1WkgyOExQUCtleHFoRDZKd2ZsTVUwR2lJUE1FNUU0?=
 =?utf-8?B?WGYvVkhRRXBUTFd5Zkoza2pteWlibTFkM21YRDNMM2hvczRtTkFuWTl4eVND?=
 =?utf-8?B?c2hpVnNiOXN6NlMyN1BPVzRuMlp5TjFkSE1TVjFYRW9SNnh5UjFpR3c4dUdX?=
 =?utf-8?B?SDdjT2FkejdGWWN3YUF6VXlNRHhlUlZFRUY0MHlUT1dnT3gzUWRpS0kvQzFv?=
 =?utf-8?B?aEdORkd0T3pEbjNGMjl1eS83aDRmNXdqT3E5SlFYenVma2pnNHJtcHdWYUc0?=
 =?utf-8?B?L0NwaG1MbU9aemtDWnh6YmxSNUVCL24zR29IMnBxUGdRVGdpcmZsWkxLdVd1?=
 =?utf-8?B?UTlqVktCMWplR1BmU2U0b1d2eFVwbm1tU1hYZ1lzUit1cFY5bk9pTEdRazdZ?=
 =?utf-8?B?VnVLMTd4ZS8zc3JJQnF5b0pOaWdDcHNGbHpRWFN6d2ovb0dTM2ZHZWgyNGx2?=
 =?utf-8?B?Q3hEZDFabUc5QXF5RldQMTZuLzkwMDV0ZUZLNFA5WjRzUHp2UkYyY3hWTFBY?=
 =?utf-8?B?NjB1cWlaWUZrcWdCVlZkZjNKcDlvT3Q5ek83NENsSklXWHM3bUNKRFkzeVYx?=
 =?utf-8?B?bFpuQ2IvdlRKcU90SS9PUHh2UXV0Wjh5OFErTjZTa0NLQ3ZUTVg3M2hYSTJY?=
 =?utf-8?B?VGxjQTkzMi9OV21leU1nMWJUT1AxUlJ3dTl0Q0lnRzcwWmthNEFwVDRiWkRF?=
 =?utf-8?B?WE1yNTlVdmZIVk9xaDhqbUF4M0RlWDEwVUM0T0xENlFpU2pBbDVNZ2Y0S2lH?=
 =?utf-8?B?cUFwT3R2UVBqNTJYM2diMEdZQUpDRFpUUUdzT1Z0eVlhTnZXVjBqZG1iN2ZE?=
 =?utf-8?B?eUpTd0NMaGdrOCt5Vmh3SmJOQzJVdmF1d3ZTZzBhOXVTYWZGaE1uY3lnR1Vm?=
 =?utf-8?B?RnVsWUI3aWhTWGJuemdCbWZMQjlqREVsWnIydmYzc3lad0RsZ3BUS2hNOGxR?=
 =?utf-8?B?WmdKU3BNVjYrVmcyOW1oNSt5aVhCTDNWbmpWVjR4bmptbE1YZ25lbS9oZDQx?=
 =?utf-8?B?KzU2bWpUbUNud0dxSGxuUGJtTTRBUWREemxrdFFRUzZCcCsvTk9UT3Q2NVp0?=
 =?utf-8?B?bFhGM3pWZ0Jhei9kNW9uOHhwSzZWZXFzNldjMlFjM2RtMzlKaXRWbTVscGlP?=
 =?utf-8?B?MmR0QnlBOWhvbUZhZGFPRUF2RGIyb01LN0JVSU9SZEl6Y0s5bm9naE9QTVFI?=
 =?utf-8?B?bXhOS0NJUEtIZlJ1YVVuODZGRVljSXZXQkNSSFBteXVGRHFPb2NDYzIwNG5x?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fce04d3-6d31-4047-cc2a-08ddf07f987c
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:34:56.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m4iAA4unpyML+mkHIu6wcC5xmegwaxKsiCECj1/yTQs12bHACCTPhA2taP5mxp9fNUAwbtE3sqLg5AsJqFp/KgIPkEvgWhPVExwltBT7f1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6956



On 10.09.25 18:16, Alejandro Vallejo wrote:
> On Wed Sep 10, 2025 at 5:02 PM CEST, Jan Beulich wrote:
>> On 10.09.2025 16:49, Alejandro Vallejo wrote:
>>> CPU hotplug relies on the guest having access to the legacy online CPU
>>> bitmap that QEMU provides at PIO 0xAF00. But PVH guests have no DM, so
>>> this causes the MADT to get corrupted due to spurious modifications of
>>> the "online" flag in MADT entries and the table checksum during the
>>> initial acpica passes.
>>
>> I don't understand this MADT corruption aspect, which - aiui - is why
>> there's a Fixes: tag here. The code change itself looks plausible.
>>
>> Jan
> 
> When there's no DM to provide a real and honest online CPU bitmap on PIO 0xAF00
> then we get all 1s (because there's no IOREQ server). Which confuses the GPE
> handler.
> 
> Somehow, the GPE handler is being triggered. Whether this is due to a real SCI
> or just it being spuriously executed as part of the initial acpica pass, I don't
> know.
> 
> Both statements combined means the checksum and online flags in the MADT get
> changed after initial parsing making it appear as-if all 128 CPUs were plugged.
> 
> This patch makes the checksums be correct after acpica init.
> 
> Grygorii noticed the checksum mismatch while validating an ACPI dump on a PVH
> Linux system.

Below is "acpidump -r 0xfc000000" from PVH guest (not dom0) for MADT before/after this patch:

Before:

Firmware Warning (ACPI): Incorrect checksum in table [APIC] - 0x59, should be 0xFFFFFFE3 (20250404/utcksum-208)
APIC @ 0x0000000000000000
     0000: 41 50 49 43 52 00 00 00 02 59 58 65 6E 00 00 00  APICR....YXen...
                                      ^^ incorrect
     0010: 48 56 4D 00 00 00 00 00 00 00 00 00 48 56 4D 4C  HVM.........HVML
     0020: 00 00 00 00 00 00 E0 FE 00 00 00 00 02 0A 00 00  ................
     0030: 02 00 00 00 00 00 01 0C 00 00 00 00 C0 FE 00 00  ................
     0040: 00 00 00 08 00 00 01 00 00 00 00 08 01 02 01 00  ................
     0050: 00 00

After:
APIC @ 0x0000000000000000
     0000: 41 50 49 43 52 00 00 00 02 76 58 65 6E 00 00 00  APICR....vXen...
                                      ^^ correct
     0010: 48 56 4D 00 00 00 00 00 00 00 00 00 48 56 4D 4C  HVM.........HVML
     0020: 00 00 00 00 00 00 E0 FE 00 00 00 00 02 0A 00 00  ................
     0030: 02 00 00 00 00 00 01 0C 00 00 00 00 C0 FE 00 00  ................
     0040: 00 00 00 08 00 00 01 00 00 00 00 08 01 02 01 00  ................
     0050: 00 00

-- 
Best regards,
-grygorii


