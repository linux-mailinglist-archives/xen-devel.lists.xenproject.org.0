Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB89968A45
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 16:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788021.1197475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8ML-000479-Ss; Mon, 02 Sep 2024 14:48:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788021.1197475; Mon, 02 Sep 2024 14:48:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl8ML-00044V-PZ; Mon, 02 Sep 2024 14:48:49 +0000
Received: by outflank-mailman (input) for mailman id 788021;
 Mon, 02 Sep 2024 14:48:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VyMp=QA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sl8MK-00044O-7O
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 14:48:48 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20628.outbound.protection.outlook.com
 [2a01:111:f403:2405::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 748dec1e-693a-11ef-a0b2-8be0dac302b0;
 Mon, 02 Sep 2024 16:48:46 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 14:48:41 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 14:48:41 +0000
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
X-Inumbo-ID: 748dec1e-693a-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6ZXMw2t3xLnw7KeNEBTerx+zUKZ11SBJqFEURD+eDjuuFeCDxMqZNuaUGGdkW346Axzzaqivhr+KB+88e+mj3AsfsgGPQ0wS9rYRfJ0nSprjMhMLXBpfzMSe6bnX1ayHbMr3LZjBU8m7OCMbefW6F1Mu7Mi0MSMOrZ/vS02UyWp6wT2Ea2zPfOk7wurlXaVOjbSSCkAr8eDwtZgVoNRiYDUVmqWesHg0x2jGq9DTM0GXKa8bIv9zCdoI4RwhdANFoKpJaL9QoqH3Vl5kVpN82scKIL2DYIL05TlmSIbTmB5Y+DkzUeZ7WuJKZwSFScVIrG6gs/BlChvi50Cb7AqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6MaBUxTTXx9HyfDra/DaVewpk34LLspRHwSYAFgGQr4=;
 b=V38ETybWZ5p9bppUuHoElTGPemsJ0/7szilmZXWEA3X5FcksUdllXWq7FUYIlmq+Ph0QDbPiU9Az5d/DnqKHUbS1VmDUFIAlq34ZfHoKxg1i+t1WVB7TRnN4Zb9hmKsRWzCimfgJ2uKlmTXaDY86DzwrbECbmWbK+zc5kRr4eQ0fmTDo3ukjsnFtmAqPE1WTcfTvRumDQaA19vjIwrav6cr45fjZPeHWJdMJzsc1XBQH+s063vUE0zVG3V9/XVzdv+/hWnKNwUqmcuonej678tDyT24y+Ejb+dbKkmqgil8S5eRXJYh/mX/MoqW6nNFP8tn2vwcV+22gT8EEIjlKhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6MaBUxTTXx9HyfDra/DaVewpk34LLspRHwSYAFgGQr4=;
 b=rGLyfNQr5kIYdABRTlMfnK8kgXgQCi2GyepqJbuqS3gNpaoaNGGoNlYWe40MiPq1+zpgGIFA6Heh0gHgI0VpZ5smG8LaZ6AwS7Kyul2y6ydwvIzfMGuF2AbtNpTonWUZEFmvlato/luECgQYRxR4asE7KZRo6En7isCrs5Yg900=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c0de7e6c-43d0-46ec-8cf7-ba1855caac82@amd.com>
Date: Mon, 2 Sep 2024 15:48:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
 <efc024ad-1e1c-45d0-9511-cc0c082dfef7@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <efc024ad-1e1c-45d0-9511-cc0c082dfef7@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0325.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::25) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: df54ca88-d1ff-46fb-6339-08dccb5e55d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUczQmRyaHpJaHUwSmVWUjJtTU5MRjhLSVE4QTRra3BEYytjNjN1NUNCUkNF?=
 =?utf-8?B?WVgwVHd6aCt2Q3RRbkJRM2NBSmhqNFQzMWNVcGE1dGdHNW5mRFdCUnBaaFpI?=
 =?utf-8?B?WUNWSnhnU3lSUmNaL0ZUUFI4UlhxS216VFV0N2RtUDdsdjZCTldTSlV2bXQr?=
 =?utf-8?B?blQ2WjVibjNIMkV2K0FjOUg2SnZaeWVjbWJpTjU5MzJRTHJUek1QVW1YTlc2?=
 =?utf-8?B?ZFVENWRUcjFwekxmR0tQUDhhTjJKRVNTSTU5cWxDTHJQV3A3Z2F3cFZTTmlX?=
 =?utf-8?B?UlBhMWQ2TE5MemFkSU5iUWMvbm9wYnh3VXdhYXVLdUNITmxZNHNKMUU4cUJ1?=
 =?utf-8?B?RVpxNlRhdjk1bkFsMXdUZldDeFBTQTVmSGpaZUZsdDFNSlU1Z2g0MklGRktp?=
 =?utf-8?B?dEdadnB4bVlkYVJiVVUxc055dTluZXVpM0hERlZlSkUwZi8reVpKTUxadlJ0?=
 =?utf-8?B?MGhlNEpNSy85enN3NVYvM0xpb1BTZ0k3ekE1Z2t4cXErYVpOb3pyT1I4SXVI?=
 =?utf-8?B?Z09vcHJ4VEFpeHhXMTRaV1RGaThaK1FSMEFPc2loVUpEb0ZzYVhJek9FKy9Y?=
 =?utf-8?B?eG1kUkQzSlNlREZlU3JuZGNvWktKc3BndjN4ajBadGlGa2gwbEIwcjY1N2NP?=
 =?utf-8?B?cHJPRnNGdktrUEswSlJoRVdmYm51MUxzLzhCcE5wZCtGWGw1elV0QXNQb0Uy?=
 =?utf-8?B?NXRzeElKY1l1R2haL3J2dVVvSUI1RmgybDZUd1lXc2dzN0FpZktCK1NKSzRB?=
 =?utf-8?B?UnZSZ3gxRHI2TGFKc1dDS3RQNkRveGFaNmlXYUgwOGg0czM5NUhPS0RQNlFT?=
 =?utf-8?B?b2J4emNqaGcvRkY0MXdpcXo5dzZxaE9YN1kwSG8yRmRXbDl1TGNwTXNkQUht?=
 =?utf-8?B?a2l2QndmRmJLZ0tqRHZjNFVDNkVVZDZKSDVPUFNpQ1dIeG1vK1BQQWdESlhn?=
 =?utf-8?B?dzkzb3Z2TXVpREt2M0tyT3JHRjBwV3lweGVDR3p1NTRFWm01ejlSemgwS1JL?=
 =?utf-8?B?NnRoTHZNeUFMaFgrd1hPSzRqY0pXQ3A1Rkw5SjZvQ1E4U1RIQ21BQWlIU0lS?=
 =?utf-8?B?enEyKzVwZ05KVWZyZ0lreDVvbVFKbU1RUzU4c0FraW93ekNNdnJBZUtKVjRt?=
 =?utf-8?B?eTVERDlIalFIelE0ZW5NclhTU1FIaE1Lc3Y3YzhZSW1WRHNML2RZZFd3enBY?=
 =?utf-8?B?UnMxTzNaUEp3U3FXRVF3TTBjQ2JaREM2dkxweDIvRGhuUzJTa0paazNpd0Zy?=
 =?utf-8?B?MCtpcWcwK0c1MFI4SUp1cTBrTlllZnVkN1Y3TVNmUE1mVkpFU3pDY2pxZ3BI?=
 =?utf-8?B?Z0VaMkE5T0hhRk04R0owVHBVYjZLMkdhSmpaRE56cGcxKy9KZXJObTEyWTFD?=
 =?utf-8?B?L20vMDRZZWF3b1BhVHowNHMxcUdTaG9nclA1Sjgrc3lzTjZuNm1iZ3JCRzY4?=
 =?utf-8?B?NFZPSmV4REhnV21iN3hHMG02TXMzczN3YmU0bHBNN05IUzJzVEcxK3pwK0ZN?=
 =?utf-8?B?SFVzSHV6YlNsY1FuNy94bGlUYmRQem9SUGlYNkwxZmZrSzRJWXFoVG5DTFUx?=
 =?utf-8?B?NXlPUjRxQnVvY1RRUVFwNEpCcnVEWHc3ekFiMXNJWEJ3SGwvd2pTRG9wcGNJ?=
 =?utf-8?B?S21YUUdKLzY4SWdpVEU0ZG1YcU5oVWlkSW5pbk55cHhrSDlrKzMzMEgwMzh6?=
 =?utf-8?B?d3haOUIvWlZyMFJxMEdYYWpDaGt0RzdlZjJ5VWp1c3RXU3VBM0tJb1lKVHNk?=
 =?utf-8?B?SXdpUFJLNHV3djl0djVBY2xPdGU3cFV4MHpoUjFJS1QrVlQzQ0UwSWErMFBT?=
 =?utf-8?B?aHg2ZkpIckFMMUo0bVZEdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3VGU3pGTXNFU1NqajVRcFpteVlRekZ3cGVoNW1wWDRSRU9kMUN1K1daTi9N?=
 =?utf-8?B?cVJHS3pxTDdqVEgrUTBkRkF1U2o3UVVQRjNNMkdBUElBWFQ5UlFjZjB3Tmxi?=
 =?utf-8?B?aFhMeUhYN0p1dkRpSjRxUnhjNFVNbGY5d2p1aXRPTzhkdi8vUWxSSU1XazlH?=
 =?utf-8?B?bTB1RytkazR2VFYzamRhUUtYVFJuUC9PYXlUNE9Jb3dLNWtWdUo4bEp6bFFv?=
 =?utf-8?B?Lys5dzlaSW0xc1pQYnJTOUdncU1Zem1SS2NrblNVODQ4SmV2bStQRXVBWWRw?=
 =?utf-8?B?dWRBeGVKUU81WUMwa1FIT2lHdVBqME44T1VERTAwbS96U0ZlSjh1MHVmczV0?=
 =?utf-8?B?SVN2TmJSQkhFdnRaTWRtZG5yK0tzalo3bjMvSno2N3B2cThxRUFxeFAwc1NI?=
 =?utf-8?B?U1NmbkdJMG1jK0J6WUpLT0R4VnpaSjNCMmg0aVFVMUZNVXFRYkxWb0lEZnVG?=
 =?utf-8?B?d2VMcC90SFFPRDBmc1BYTUJnWWhmalRzUGcya2xvZWJzeVZhQ2xMMVFUVGkr?=
 =?utf-8?B?blYveXFTMVpMVGdxTzRzQ2VOS2x5MHdZNzlYQUliOXpjRHBGZFVLbTVINWdP?=
 =?utf-8?B?dlZBRUVQbHl3T3hya29XY3pyeDVucHdjTTZwbWRVZXhlbC95TFBLblRRZXgx?=
 =?utf-8?B?eGZSZTBUWTJ5QkpsVkhORmYzT293UDRMaVkvZVBic0dCVjcyaS9nL1d6Nndz?=
 =?utf-8?B?M0RTZ042NHlMbEdxRmZPSFJRMllycFR4L0ZIZnMxQWNPOWxoS0VVamNxbFp2?=
 =?utf-8?B?ZmExMi9zMkFkNEU3VTgwU0ZZWnJFYndyWW5DSThCOFlqWkZEUWY5TWQ0aE50?=
 =?utf-8?B?NWtBS1JBRCtYVVhGVFlqTkpjUlhBNVJ1VE16TGZaTVFOcCtYdGY5WlNhL0Yw?=
 =?utf-8?B?MzdVZFFDUzdQZFU0NWdYRlJtSGtqMmxSeUI4NWo3OXlkUUNHaVFDWGwrdFVS?=
 =?utf-8?B?OTRRcDVWMUVOdEdndE9ITkMvV3lhY0JZZnJrOGhpWUdBeE9md1BrVXJJTHJX?=
 =?utf-8?B?WVJtWENSc09QNDVqQVd4NjZTUTQ4bllXc00zc2NzNDVVMTZNdGNhaEs1eHF1?=
 =?utf-8?B?c2VmTmpJT2xOcTYwVzNRQzBPZytTSWpPd2prUFNtcTZ3OUdqWXc5Z3FGbjhz?=
 =?utf-8?B?ZWxveGl5QlBzUCtXUG5YOEZwdjdMa3JnSUZKc1Q5TkI4aGRmQjBDZEtaOVZ0?=
 =?utf-8?B?aWh0S3NhRE83eUVWZ1JhODVzc2wyZmVVN3RRdWRTcGhVQmE0QW43MktJUzVr?=
 =?utf-8?B?UjdRS3dYd0FoS1o1VW1wM1F6WGdjMC9YMXU4bzhGQ3VhMVpqOVNzV3FUY2NO?=
 =?utf-8?B?dUJUbml6akhtaFBrdVdDdFhjTE5kckErcDJGamtJM1JnTmFiSHloYS9VdlRE?=
 =?utf-8?B?SXdZelNpa2x6STZIS3lJWGNWcXlseG1GZDUycnFDRHpaVkZMOUlHYVdJb21K?=
 =?utf-8?B?QW55dTZmenBNR2REajgydE9KUTd4bnZ1MFArcmlaRzFaWlBDV2J1VUFpazFW?=
 =?utf-8?B?TWs5UENwdFdiWEhjeUlmOTNmQ2dweEJXdU1lQk81Slp6Y0MrUWVGQVhJMEFr?=
 =?utf-8?B?b0NtVGt0Sy9Oa0V6TUZtRTdpNWt5TFhYSmx1RzBuTjUyZ2dkcE4rNUFMKzVt?=
 =?utf-8?B?Wlc3Nk1lVXl0emVGM3l5T0wyOU9TVm5GVGlVRlNtSy9yTWtUV1NvVjgzUXIz?=
 =?utf-8?B?VGJvMXBrMmlXYjNWRlh2TGR2WVpXMVVMTFN6UE54Qk5GL2FmNWY1RENXc3JJ?=
 =?utf-8?B?akhxb2c2cXhnbS9vVEoxSFBOQWFzd2R5eC9NbHc5OFdPaHQ0a0NNMkdLQzd6?=
 =?utf-8?B?K3FlYmZFUjVkMVZnbVNPTE9pQ3FCUm85T0ZORHUzT2xiWTVaZStOQitkNmNO?=
 =?utf-8?B?NGNNWncxNHZ5TWhZdExpS2gwampyRWo5Y2hoSjU0Nm1EbHlHUTZMcWZXNXdV?=
 =?utf-8?B?RDVMd3VhMGVONk9teTdhY1NzRW9tNlRCYUdINEFWZ2t0OWZUdFpCRWE2MHN5?=
 =?utf-8?B?aGlLYU5CSi9uQjE4cnBXT0ZwandUTEtydGlBTWN4cFlRRXNORVU3OWUvYnZj?=
 =?utf-8?B?N0EzTks5Mi9Ta0U0MVJjRVlmVUU5ZmxQZGdBdGJIR21icUlyeXE4NS95Z0VV?=
 =?utf-8?Q?UVz1/V+bdoCKwuv0GnNsz0tiI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df54ca88-d1ff-46fb-6339-08dccb5e55d0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 14:48:40.9322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ar81xGv0Jxda80QYitQ/vofg1IiQB+ByE2MwVPwc+pZo8OTbSHte1z7+aFBAowR+Byj3YbJqxn1H3Et07xy5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909


On 28/08/2024 15:49, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 23/08/2024 17:31, Ayan Kumar Halder wrote:
>> From: Wei Chen <wei.chen@arm.com>
>>
>> On Armv8-A, Xen has a fixed virtual start address (link address
>> too) for all Armv8-A platforms. In an MMU based system, Xen can
>> map its loaded address to this virtual start address. So, on
>> Armv8-A platforms, the Xen start address does not need to be
>> configurable. But on Armv8-R platforms, there is no MMU to map
>> loaded address to a fixed virtual address and different platforms
>> will have very different address space layout. So Xen cannot use
>> a fixed physical address on MPU based system and need to have it
>> configurable.
>>
>> So in this patch, we reuse the existing arm/platforms to store
>> Armv8-R platforms' parameters. And `XEN_START_ADDRESS` is one
>> kind of MPU based platform's parameters. So we define default
>> `XEN_START_ADDRESS` in the MPU specific header file.
>
> This seems a left-over from as previous work?
Yes, this needs to be removed.
>
>>
>> We also introduce one Kconfig option for users to override the
>> default Xen start address of selected platform, if they think
>> the default address doesn't suit their scenarios. For this
>> Kconfig option, we use an unaligned address "0xffffffff" as the
>> default value to indicate that users haven't used a customized
>> Xen start address.
>>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/Kconfig                  | 11 +++++++++++
>>   xen/arch/arm/include/asm/mpu/layout.h | 25 +++++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>   create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
>>
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 686948cefd..d722ca690c 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -23,6 +23,17 @@ config ARCH_DEFCONFIG
>>       default "arch/arm/configs/arm32_defconfig" if ARM_32
>>       default "arch/arm/configs/arm64_defconfig" if ARM_64
>>   +config XEN_START_ADDRESS
>> +    hex "Xen start address: keep default to use platform defined 
>> address"
>> +    default 0xFFFFFFFF
>> +    depends on MPU
>> +    help
>> +      This option is allowed to set customized address at which Xen 
>> will be
>> +      linked on MPU systems.
>
> I don't quite understand what you mean by "allowed".

I will rephrase this as ...

"Used to set customized address at which which Xen will be linked

on MPU systems. This address must be aligned to a page size.
0xFFFFFFFF is used as the default value to indicate that user hasn't
customized this address."

>
> >  This address must be aligned to a page size.> +      Use 0xFFFFFFFF 
> as the default value to indicate that user hasn't
>> +      customized this address, and Xen use use the default value 
>> that has
>> +      been defined in platform files.
>
> At least in this patch, there is no default set. Instead you will 
> throw an error.
Ack. See above.
>
>> +
>>   menu "Architecture Features"
>>     choice
>> diff --git a/xen/arch/arm/include/asm/mpu/layout.h 
>> b/xen/arch/arm/include/asm/mpu/layout.h
>> new file mode 100644
>> index 0000000000..82a74b8b5b
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/layout.h
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>
> Coding style: /* SPDX-... */
Ack
>
>> +/*
>> + * config_mpu.h: A Linux-style configuration list for Arm MPU systems,
> > + *               only can be included by config.h
>> + */
>
> I don't understand how this description match the content below. Also, 
> shouldn't you include it from xen/config.h?

My bad. This description is incorrect. I will remove the description as 
it is not needed at this point in time.

>
>> +
>> +#ifndef __ARM_CONFIG_MPU_H__
>> +#define __ARM_CONFIG_MPU_H__
>
> This doesn't match the name of the file.

__ARM_MPU_LAYOUT_H__

>
>> +
>> +
>> +#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
>> +
>> +/*
>> + * All MPU platforms need to provide a XEN_START_ADDRESS for linker. 
>> This
>> + * address indicates where Xen image will be loaded and run from. This
>> + * address must be aligned to a PAGE_SIZE.
>> + */
>> +#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
>> +#error "XEN_START_ADDRESS must be aligned to PAGE_SIZE"
>> +#endif
>> +
>> +#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
>> +
>> +#endif /* __ARM_CONFIG_MPU_H__ */
>> +
>
> Cheers,
- Ayan

