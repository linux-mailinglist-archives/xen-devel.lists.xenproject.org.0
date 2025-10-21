Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE41BF7AB8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 18:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147497.1479813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBFH0-0005um-RP; Tue, 21 Oct 2025 16:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147497.1479813; Tue, 21 Oct 2025 16:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBFH0-0005rv-ND; Tue, 21 Oct 2025 16:31:46 +0000
Received: by outflank-mailman (input) for mailman id 1147497;
 Tue, 21 Oct 2025 16:31:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pTU=46=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vBFGz-0005ro-4p
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 16:31:45 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cecba1a-ae9b-11f0-980a-7dc792cee155;
 Tue, 21 Oct 2025 18:31:43 +0200 (CEST)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 BLAPR03MB5636.namprd03.prod.outlook.com (2603:10b6:208:297::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 21 Oct
 2025 16:31:35 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 16:31:35 +0000
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
X-Inumbo-ID: 6cecba1a-ae9b-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9URm5qOg1lm+yYnnrcsD+Wxet1k6PomYClq7N31H5yuUrYCYkRuIGkG+hP04VNtuUarjQ4KymVUP8x84mN/62yxvj7065Mr/gFmNad4Z5G1D8qsIxhnYqaZoYyGSe31dl9IBD5KWncv6QUUHVGEKiCU6ORwIEpbDI6CsaadLYqH5Vlo8y2enNRKXZT0JwSL0Q1h8P3g7dPspAzgd8C/ZjJSu8BW+Vd3LGfcCQvc37H9crlffK+8ch30gPIeJ916DZQl/VGAMWVmXT+b5g3HxEJdSdldIkEzJeYHkebozxWPSnuGIUlMjYX74RiGuPgdF0CYYLMlePlpJx9ZhsMNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SdSXyLrSvM8ncmCAP1pz+qYDIyNcDbgZ4liEgKk3Uk=;
 b=Z/HKoyvJuHIpV87PBIiY1hLhl4GWQaKe8Uf2Gv0fXjftrSO+foP32HMYLMGZUCgrTUzigzSRwfpwB+adq5I4iRn1T3fVhJqAEq4HvRpls8SzTRNNmpskq489ER+9Oef+815lJxhsNPjy+impH+iPtUQi5TQCpW8gPrQX5yQKi7xo8skVuzsbOA0G0wEKT2H8lEd1zGa9fPgwLIX826yq9FYaKjVl7X25iIcPwaTcN3Oh77IF1UwQxKkCkJGOeBsur82b/kC+BBWMjJZcc6CUaiOfcGqqSrpflXSQy6sfRVGmhwvDoBYShfbqlqF7Py0hCs2jB60E/t/80UZ2uDCHZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SdSXyLrSvM8ncmCAP1pz+qYDIyNcDbgZ4liEgKk3Uk=;
 b=ITNovcMEICENECJwmwz0v0amaNeGJ+9Sgcw1zrpOvTUa80MghgQSWb7XQffGHlP3amuoACbID6GnXxyw9e2EmFnEGTcuIItiCp2Vp46+hW7Lqz2/fwAQ/IVNBI4b3rQ2kUvvQ7bSDVbuhBO3c/K4+pAYEsh/76AnagU2mpIwV5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fa9cf040-7acc-4bfb-bef3-5da5f9f5a558@citrix.com>
Date: Tue, 21 Oct 2025 17:31:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/libxl: Make gentypes.py compatible with older
 Python
To: Anthony PERARD <anthony@xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: jbeulich@suse.com, anthony.perard@vates.tech, jgross@suse.com,
 oleksii.kurochko@gmail.com, xen-devel@lists.xenproject.org
References: <81c56c9c-882e-4433-b41a-6952315efa25@suse.com>
 <20251017020613.79855-1-jason.andryuk@amd.com> <aPezgmtiRHlDqFLE@l14>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <aPezgmtiRHlDqFLE@l14>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::21) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|BLAPR03MB5636:EE_
X-MS-Office365-Filtering-Correlation-Id: c0da0f43-9f87-4897-4157-08de10bf4cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVVVWlYzaUVUbEdJamYxd0szRy9MZW1uNFV1SHhzN3pBeVZmaHlMTm54bm5I?=
 =?utf-8?B?OU56L2xBbmJJWGJlNkxGWVo4QnRRbU1FMHhadk1RdTdTNzdhS3B1bzVXUjRr?=
 =?utf-8?B?L0lUKy9VZ2ZldXRKTG0vMlQ0Z1dpaW5hUHBrWGN2S1I5bnJ1OWY1ZnNJV3da?=
 =?utf-8?B?djRQS0FIT1loU0JRcGNxRzZReGVwVFZNN21ObGZqa0EreUxrVEdGUFJZUlNK?=
 =?utf-8?B?R2ZZQmI4UjVnK0ljaHV5Q3JaQXJoVXJhemgybWF4Q0QzMW5JbUh3RFEzVzZt?=
 =?utf-8?B?cVl4R3MxNWFDZXd1bGkyaHlUWEtsVDNvT0NVUUtnNmFwZDQ3amlDeDFVVlRJ?=
 =?utf-8?B?Z3BNYjNMNEpNSG1HTmltaDBab2p2Mi81c2NhOFROazVWdTdRbThSdkZQTm9w?=
 =?utf-8?B?SUxZcStDOWxZdjlZdVhLOHc2V1VWUlY4enppYWZrRU5YdElxY2tnVjNBWTk5?=
 =?utf-8?B?NDA0aUxaRkRPbEExSXA1Mm9yOThtWUp4TjJpYlZVUWVxTlNYYXhJUmtvUEhR?=
 =?utf-8?B?eEFCbjNoNXE0R28rZE11T0YwV3dlbEVpVGFWSXk3amF1U2Y4RU1mWmorbURo?=
 =?utf-8?B?SXdFb0ZCZjZ1YWlReEhLcnhhQVQ0T2NCeFowMlB1ZXd4bmpyR0Y3aXc3NWdX?=
 =?utf-8?B?d29MUlJsTTRiU2gwTXZjQUlYd0F3QTNMYWczTjdEMXJRYjBBeUxUb2d6bzZm?=
 =?utf-8?B?ZHVUU2NnclVXTzg1ZUpVTEp0STcrSGxvb0pXa3ZUSU9iQjllamxDc3JLSjdK?=
 =?utf-8?B?dTZXOS9pcFBQd09NdkFFWlN2ckJRTFJqbFBWQVQvSjREMHFzMVFYL2M3cmxm?=
 =?utf-8?B?aVpVU1NtcTU0OHJuZVFJcmJTUnphd292a2NzamVBQ2o2eWRUSkxFM3M4SEtU?=
 =?utf-8?B?WnlTYTNKRDViRDhXNVBjblpUWks2cFdQY1I4MitpeUFPeE4rZ001SWx4OVFI?=
 =?utf-8?B?VWs3bHBQVCtrcGducmRVNGxsYStiSUg2ZjM2RGVXZzdiUktnakNETk1HS3M3?=
 =?utf-8?B?QjZCOFBOR2lXdjBFL2tLZEowOVkxUHBLU2F2QnVvUXR0VXJXTkRNTmVrK1Br?=
 =?utf-8?B?bk1veG9GNUYyY3hKSFJNWHBoUUExZ2IxWGhoUFJJL3lXeSt3Vk1xSitsOXRX?=
 =?utf-8?B?WGs3eDQ5SmsrQTZTSWFDRWhUbEtJNDJaMWlBeExGMHE2TjVraXNjMmM3WktF?=
 =?utf-8?B?UXB3UC93cDkxZndwODFTdjlEYTI0cnBLNHRjblo4OHVlNUJVSUJDWjFZVC9K?=
 =?utf-8?B?ZUNWajErNXJMNktXcnN4S2wwTHd2eW0rUVFaaDlQOTlud29iT0UybGFDTGda?=
 =?utf-8?B?WVVvUGF6UitjdlM1RWN3bGdPdXFrOHNGcjNRS1RjVG1CVHZJODJuZ1lVVmUr?=
 =?utf-8?B?ajVvcFdLL0M5QWd2OEliWEo2RGYydmo1Vy9HMUpVVHhYcS9pWVdJNXBrUVp5?=
 =?utf-8?B?Q2VrMk9yY2FrRnBuUjdKbTFiUmFOTHY3ait1OUdPK29Ta2VBdWR2ZEpXZito?=
 =?utf-8?B?M2RkRFRCcy9KdkJVTURVb3V3QStCQWJnaFRtYTBuSmJxWVpsWVFYd1FLVFh1?=
 =?utf-8?B?c1dCb1Y1T3ZTdDZkTm8zenFnMVRnOVQrTC8ybG8zbzZXc1l5OXVWYzZaWm5v?=
 =?utf-8?B?RXgvRDZnUzdCTDRva0ljTGl6WGF2aVh2WW9zQmcweG9EcUp6Y0hQQk9NRXJV?=
 =?utf-8?B?YWRJbGdhTktnbHRtS2ZaOTJtR1YwR2Z1czdOZ3VVeXJSaW5tK1RxZTBDVlJl?=
 =?utf-8?B?c3UwSE9RMWFlaFNpelV3Vi9ORU15S3M4UE50RW1sbk0vR2tJVU1uZDNnbmF0?=
 =?utf-8?B?OW11NlhrekRrbUJqems2S2lEWm55Mjd1NkZWUG16bWdzcERxK05acjQ0SE1W?=
 =?utf-8?B?MXJGY1ZKY1pLS1hyRG1NTGdRV1lZZ21pMUdydmc2Z1hJKzN2QWxKTXBoNXQ2?=
 =?utf-8?Q?wDaKlfvka7FdGtlvzFNj8/NrH2YJStfy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHU2Y2dINmNPejlMYng2LzdmSGNZcERUQ0R3ZDRBczJFakFxa1JCeHc1K3B1?=
 =?utf-8?B?RGtJZWdVR3AzR0hZc0FTaFpDUE13TjFyYlArRW1DLzJ6Mzg2aUJSeEZOVEF1?=
 =?utf-8?B?bFRvQkdsOWFnNjZ3SnVVaDc5bkc0bnJsNGJtc2RPajZmN1ZQMnpVM2wrSUhm?=
 =?utf-8?B?cFZKcWIwUzJPS1VTRXF2c0pIRjc0L0MzNGVSbzcrZk4yL1hUODlzcHltdVdU?=
 =?utf-8?B?OGtNdmFEU2p2SkcvKysrejBYdWN4RDkzVi9KUzdUQlpyWldNQVhlZE5KV1Zt?=
 =?utf-8?B?blVlNm8yWk1zeUpQMzJRUS91UnNLb2FpeWN0cEZYQm9jeUxHaXRhSHlsb3BL?=
 =?utf-8?B?ajVXNW9uTlJOV0RlL3hSbVlITkdocWdTVC9KOXZBZGMwbjVrMTFGRTZ5SlZ2?=
 =?utf-8?B?RFRMR3NmVlB5di90TGJvT01JVTdTZFEyQXV2akJHMlBaM2RnbUw5TGY0UUJN?=
 =?utf-8?B?bmZ3cUtpWXJraEFSMWY1UFF4cWZMTzB3WVVuTGErNldmd25ucndjVG5jcGhM?=
 =?utf-8?B?THJQSzVmcjREcFIwRGxZdi9BUXY5TnU0eTBaNkFiTEc5RG11UjA0K1pnN3N0?=
 =?utf-8?B?SGh5NFl1Nkk4VzYrREd5V3Awb01SVW5MRXBKNWJsN1ptcGpoZUJKT2kxOVRH?=
 =?utf-8?B?Q2tHcml1cDg5OXV0dGZZWHc5U0ZxWEZJbVlnbk5ET0NGc1VsK3dlU1VsVUgr?=
 =?utf-8?B?ZDhvcmhBT0lTbVNqY2lPa1dsM1ArZm9TWW1JSDE5bVd4dElCb2x3b0JmLzJn?=
 =?utf-8?B?SlB4c1ZSRkpRY25lWmpRaTFxSzNMQml2SFpicEVQMUF5TThLTmlCWHBXTFYv?=
 =?utf-8?B?Mnl3bVl5Q0pwcHZKYzhtSTVEOERZVHNrc25YbVphcjhIL0ZHdUl6NXhFb3do?=
 =?utf-8?B?bUFSaVpnM01vQ1RlVDRZVE9zWjgxeGJsS2dJMDNZdDgzTFl1bkpDbDFTS3Fy?=
 =?utf-8?B?Z0w2TGE5WWdMcCtIK2I0UVZRaVRpdXc5b21UYUZtU2FKM0VBaTk4ZDZ5K3Fv?=
 =?utf-8?B?cmZKMTYvcnc2T2dQUm1sUnQyb2tYZTkvZGgrbEQ5VFlYdzVITm8rb3k5VHpl?=
 =?utf-8?B?UzIrbzlBSEIxdW1ST0ZsUThxcmVLZWw1MDNjeXpUQ2twSU1nYTNnKzhFYSs4?=
 =?utf-8?B?WmErQlE2ZFJPUGl0WVhYV2U3K2xWTmpxejNOTGF4L0NBL0s1UzJqL0ZhWGRV?=
 =?utf-8?B?WFVlUjhDNEJienNobDJqbXUzY1U4VlBGODg2dzlqcXMwNmRhbEg2bnFLMDE2?=
 =?utf-8?B?UWNmeU4vUzNKa0t4djN1UzBJbzZBZ0lSU1ZRUmIyUlZacGh2Z0ExMmZDNmYw?=
 =?utf-8?B?T3NrVnorSW8wSGhzZzZkeUFjM2VPV2hZWVYrTVJxQ1BqcXhBcnBIcGZDTGtL?=
 =?utf-8?B?L3FMUno0bUtudSttdUVUR2J3Zi90dzN0VmxSNHBLQzB2M2xIZEg5M3lTVlN1?=
 =?utf-8?B?MTNuR29vclpUS3JpYXM2TGNlWEdYOXlJVy9MM1ZpMDhjOXBCL1F6TWtBMlJH?=
 =?utf-8?B?RnpSMFhHMTFSK1dXVUxIRFN1SDR3NFFRV0FTaEI1cktiZFFTSFZZdkN5NTJp?=
 =?utf-8?B?bWJHNStETGRoSnpIbk1Ma1VNSG5hQVZLMTFUSVJwUmpySnRVUUZFMEY5M1di?=
 =?utf-8?B?ZENGVGdUQU1lYWFHMjc0NFk4TnlPdlpCY09QNnBBK3NUaW9Rb0U4TUE5aTZx?=
 =?utf-8?B?U1pMbjJsaldmRDNtU0t1UGpyQWY2SjRiTlRKSTBmNnE4MjVmQmtmam05c0Ja?=
 =?utf-8?B?d0dsREswa2FVWDBwRXZZbmE0SkFhNno4K0pvdXVZb05UMm9aNVkwc3BqRWpn?=
 =?utf-8?B?M283Z2VRRnRQbFROVS94OWQwZG5qQkhwdmZyeW5ZVHFYdWZ2aUVwb2hDa3JN?=
 =?utf-8?B?K0pkR2tvaUhrZEo2NEdRLzcvaHVYK0lRUE16ZjJjVTNkT0VaWUF1ZUlzVUxP?=
 =?utf-8?B?Ylp2cE1QUUJmNWpocEViSlYyazBoQU5uRUEyKzFnc08yS3IxRDJqMkNRdURS?=
 =?utf-8?B?NEZucnFweDZ3TGZUZmsyUVgyTVFVaVpGUWxZcFZHejM4TzRWWGY0NHFORmZp?=
 =?utf-8?B?MFVXYU1Jd2c0RUtCYkordllmVHZmUld1SUxvMWl2VU9MK1pyai9jcCtuREVt?=
 =?utf-8?B?eHFrdkUvbzhRSndiSmxpcjF2Z3pRajE5bjBnSjZZRC83ckx3dm55c0FIeHYw?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0da0f43-9f87-4897-4157-08de10bf4cd3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 16:31:35.1514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvvUWh37rjLKEK3WrTDE/3uOEKBmSSUrdgXaFNk+srqZ8/OoDBp23VSz9gNWzNyureQL7e6CxLn8IJfoKMM1+39uFTbYbCRvAZcRE/q+hDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5636

On 21/10/2025 5:23 pm, Anthony PERARD wrote:
> On Thu, Oct 16, 2025 at 10:06:13PM -0400, Jason Andryuk wrote:
>> removeprefix is only added in Python 3.9.
>>
>> Instead of the prefix removal, switch to passing in a "depth" parameter,
>> and incrementing it for each level.
>>
>> There is a slight change in the generated _libxl_types.c.  instances of
>> KeyedUnion increment depth without outputing any code.  The net result
>> is some cases where jso_sub_1 is followed by jso_sub_3.  As an example:
>>
>> _libxl_types.c
>> _libxl_types.c
>> @@ -5535,12 +5535,12 @@
>>                  if (!jso_sub_1)
>>                      goto out;
>>                  if (!libxl__string_is_default(&p->u.pty.path)) {
>> -                    json_object *jso_sub_2 = NULL;
>> -                    rc = libxl__string_gen_jso(&jso_sub_2, p->u.pty.path);
>> +                    json_object *jso_sub_3 = NULL;
>> +                    rc = libxl__string_gen_jso(&jso_sub_3, p->u.pty.path);
>>                      if (rc)
>>                          goto out;
>> -                    if (json_object_object_add(jso_sub_1, "path", jso_sub_2)) {
>> -                        json_object_put(jso_sub_2);
>> +                    if (json_object_object_add(jso_sub_1, "path", jso_sub_3)) {
>> +                        json_object_put(jso_sub_3);
>>                          goto out;
>>                      }
>>                  }
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> Here's an alternative approach to workaround removeprefix.
> Yeah, this version is less obscure about what's going on. Let's go for
> it.
>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks.  I'll take this version, and take the liberty of assuming that
the Release Ack is transferable to whichever solution the maintainers
prefer in the end.

>
>>  tools/libs/light/gentypes.py | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/tools/libs/light/gentypes.py b/tools/libs/light/gentypes.py
>> index 006bea170a..0e45c04f49 100644
>> --- a/tools/libs/light/gentypes.py
>> +++ b/tools/libs/light/gentypes.py
>> @@ -377,15 +377,16 @@ def get_default_expr(f, nparent, fexpr):
>>      return "%s" % fexpr
>>  
>>  # For json-c gen_json functions
>> -def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso"):
>> +def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso", depth = 0):
>>      s = ""
>>      if parent is None:
>>          s += "json_object *jso;\n"
>>          s += "int rc;\n"
>> -        sub_scope_object = "jso_sub_1"
>> +        depth = 1
>>      else:
>> -        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
>> +        depth += 1
> We could simply do `depth += 1` regardless of the value of parent, it
> would have the same effect, since depth start at 0.

That makes the code even more simple, because it takes out the else. 
The net hunk is:

@@ -377,15 +377,14 @@ def get_default_expr(f, nparent, fexpr):
     return "%s" % fexpr
 
 # For json-c gen_json functions
-def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso"):
+def libxl_C_type_gen_jso(ty, v, indent = "    ", parent = None, scope_object = "jso", depth = 0):
     s = ""
     if parent is None:
         s += "json_object *jso;\n"
         s += "int rc;\n"
-        sub_scope_object = "jso_sub_1"
-    else:
-        sub_scope_object = "jso_sub_%d" % (1+int(scope_object.removeprefix("jso_sub_")))
 
+    depth += 1
+    sub_scope_object = "jso_sub_%d" % depth
     if isinstance(ty, idl.Array):
         if parent is None:
             raise Exception("Array type must have a parent")


~Andrew

