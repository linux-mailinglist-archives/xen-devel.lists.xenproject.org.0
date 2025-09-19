Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3746DB8A950
	for <lists+xen-devel@lfdr.de>; Fri, 19 Sep 2025 18:33:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1126962.1468195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uze2c-0007hB-IG; Fri, 19 Sep 2025 16:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1126962.1468195; Fri, 19 Sep 2025 16:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uze2c-0007f4-FM; Fri, 19 Sep 2025 16:32:58 +0000
Received: by outflank-mailman (input) for mailman id 1126962;
 Fri, 19 Sep 2025 16:32:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qZGy=36=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uze2b-00075O-Bb
 for xen-devel@lists.xenproject.org; Fri, 19 Sep 2025 16:32:57 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b81c796-9576-11f0-9809-7dc792cee155;
 Fri, 19 Sep 2025 18:32:55 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB8865.eurprd03.prod.outlook.com (2603:10a6:20b:554::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 16:32:53 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 16:32:53 +0000
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
X-Inumbo-ID: 4b81c796-9576-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swIvZdjsTb+JLzkx4tHwcqslBs1DWT/qSvo2sEB7Su4zMA4Nqr1YtaKQ7mmgQJige7cHRacTUeVMZSdUfsUcnaEPTPLVk8zr/ZciGDwoomh9AXO/Am2pmpd9nWlfpliZtIROc6qW0Izzt7iMu7wknoCDCcbHg8Laaz0MZ74VilQXJaHvaAwOyRGDdqisyWRjkuyFeeowXHL6cRG47Ixn4stJMUgeypz6ZWPm3PHKZNctF7bP5Aa3+8UQFDtOTBYSwI2Bm63os1cpjTTB+5LKmjW1kHIu2rDM9IiW/gpOlxYb6umWEjpVZbynLQqwvfDTuzzpSmu7at0D8W1/4Oao+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgM0Wrl4PWhfRRDHmVgho+tLgEimXUfGsH20wH2d8BU=;
 b=u1N+DEEeQKWARLjw1XFW3jGBoMSrgwQv9zgfWuan8mD+uNdV73t4HDmf6HUHK1J8bHrNoZAECTRk11xlY2ZCAnzErndnHB1fTsLFDEeJ4N4ExLYP9Kkxjdu56UFH29JOPuqLkGbeIkQ6mVkXkweeqnOTy4ay5h1LaC4KKHosIOuctrQgZFiz1KFOP7OIh1oeTVBomrSk2fUz2ykysXT1jSCMx8v9rlhCnZfEky2BihAEV7SfPlaFmZumpVKkg+ISHg+ARfeYXAqsuKpq6RfXYqyE4/NnU3dagsQFIoogGbBZ2xoDbdcRZhWhh1Iy1UU4ohHgXYzkUbhicjEbw9Q1KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgM0Wrl4PWhfRRDHmVgho+tLgEimXUfGsH20wH2d8BU=;
 b=D9oh3j6CEOt4c1RQJkQkBI6UVi9J6bdWeo8XEb03KY71ve2xvSflXWvbD0ur6sh3my8wIYpz3dkdmTvoILNl+OUQ5Vuevxws+efCBTO/8wEpl2JSQnaALnYFwpvBX2GR7ahM51oWZZ8yZ73cNAcDzd+tJYdMEd9hKbnxwsMwRU5tOO5w0W+NHXbMdAlfDSx/M3RkWUHI97u5Ixvj56XZUxbThqIxWqWVsSFNZ7DJ4W29l0wt77oMB87IaBZKFlRqoCNgaJg6prShYVUkmNIisWxzX0IgjiwN8644AZgz6iF/IWkYacOvuWUf9y/uCQHVDUyO/InPk4fCtc9q2A+q3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <20faa8cb-5251-49f4-9f09-cc9abdad310f@epam.com>
Date: Fri, 19 Sep 2025 19:32:52 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] x86: make Viridian support optional
To: Jan Beulich <jbeulich@suse.com>
Cc: Sergiy Kibrik <Sergiy_Kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250916134114.2214104-1-grygorii_strashko@epam.com>
 <0e1a6339-a4fb-4697-acfa-392168b391d4@suse.com>
 <2d6e5cc6-15c1-40ce-8742-1b77b32203a9@epam.com>
 <146fc872-2ba5-4dc5-9e0f-2d10e2836a2e@suse.com>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <146fc872-2ba5-4dc5-9e0f-2d10e2836a2e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0288.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e7::19) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|AS2PR03MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b9af6e-33e3-4eb1-2a39-08ddf79a2e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGYwUDJBcjJZczFJYkJJaHlQdTVJWm53U2hsSkxhVzEzZDd1SFVzNkJBV3VZ?=
 =?utf-8?B?L2hEdUozWmpnOEkyQXZLWGhVeC9kWkduUFNzVUwyZ3lpaGpIUXdnZStEQ2xu?=
 =?utf-8?B?MmJCL0tadVY1VUU1SVJKNXBNc0swNFJyenNDZEx1NFk5WXZkdmZ2dkRQcUpY?=
 =?utf-8?B?NExKZ1hjelVOODgyamVpNmpxb1l3dlowdm1Zb0FHWExEU0tZMjZOd2F3WDgv?=
 =?utf-8?B?VlhzOVlCU0JvdXBSVyszRGRvZk1nRlJIM3BWZDMzQ3o5aE1EZFZ6MmVnYTk0?=
 =?utf-8?B?UWQrM3hndnFOYnZaZkd0dDQxT1hCWFB0cEQxcENCc0FiRko4NHdZLzFDbHFw?=
 =?utf-8?B?MHdFY1IzTVhkakZsTDJxai83MitJdGlObEFtMFNZeU8xbVJGcFVLZUpCQ1h1?=
 =?utf-8?B?V0hLbUE3WUlNYS9yKzd2TWRMclFUamZtQVlpeUt1SmJKVDhNTmtlaWF3UVpr?=
 =?utf-8?B?M2ZtUS9EeUxHbzZPWk5yOUY1QktCVGxjT1FQd3RNcGZUUTJlckF5SWVQc0hl?=
 =?utf-8?B?Y242OG82ZHRjMk4rMXpKMk1tZ1JBZ2RJOVBrcDgvUlAwcXA2OU1sK3VpZGVy?=
 =?utf-8?B?RnB6cDN3bTBObjEzSWF6cmduTkNYU0F2a1ZsSmhhQkk3NWMrV1RaaUJLZDI2?=
 =?utf-8?B?SEVoOGJsdjRVdnN4OHVMN2RyM0UzeC9kU24vdkJvd2JVOGpaZkMyRnF4RXE4?=
 =?utf-8?B?TVNQTVpUUUgvUU5SMGsyUk9XRit5V21BNlEvd2xyN1pvVjE0RGJzS1d1MjFF?=
 =?utf-8?B?a0V6RUlEMU43aVg2REcvYWhBNGFGWDV1K2V6OTNablZ3TW0yc3cxdURiZHRH?=
 =?utf-8?B?dlBRQjVUZWo0NFVIaVk0dEgxS2VzWmZGMWg3STF2eW43ZWJMVk1VSHo0NGpo?=
 =?utf-8?B?RnkrcHNiUVB2SzlwQ2dQQ0lzUE5YdU92SGlaU0tuNWYvUHhueExuSXZUN0cv?=
 =?utf-8?B?c1BKdCtNTkc1akV1dmVpZ2YyNWxDbHpWcDFkaUhiNmpQdUxGeFBVbHJWTk9u?=
 =?utf-8?B?Z3pTcW9zM0kwMHZxb0xiYXhxMEE4a0t4b0NzRUNLSWN5NU82YzdUNFcyNWpS?=
 =?utf-8?B?ZlVKSTRCNGxhZzBmQWtqYjZPb0VvSklUS3ZFdldEZ3l2UGNjMTY3NFEvaWJx?=
 =?utf-8?B?RE9RZjJvREFoSGtveE0vZzVFWmR1QVBoNGJ5cVpZT0RCSmFQUGNxb0dJQW85?=
 =?utf-8?B?TDg5UENmdTdXbC9YMEozUWwzU05KdldqZ1U4S290Wjd0NTBFNGZ6WlkxKzJJ?=
 =?utf-8?B?NHUvU0N2ZkRSeTdPTGxFenJPSFpCc01qcXE2WXpJOVNmeUlNM3QyRllOQms5?=
 =?utf-8?B?TnY4WTNkblcwR1g3cHpkQ2l5RnJYK2hreTBDS201Y0VVbE5rUE1leTBWZ3F5?=
 =?utf-8?B?SndvMUpCK2FJZG1wcVFlWXhaV0JPSUpYajhWdE9sVXBQMnlweWtxMURGNkcr?=
 =?utf-8?B?c3JGc1BWNG1wVTQrVUs3anRucEFybVcwcnloTmZXTDNIRm80UHVNeDFVbXhI?=
 =?utf-8?B?OHRQejBGNC91M0VuZGtYaHpLdHpvUHZxbEs0bms5THVxK1hYUDE5TEt0RDNY?=
 =?utf-8?B?T0x1NlhkN2RLZWgzeDY5MlNDQUNDbHVYTDhDZGxMYVl0OHEyYnJ2YXkxdVMy?=
 =?utf-8?B?S0Npa2g0UkpuSTF0Qk54djNSK3J6RWM0ak50dUZSYnU1aWdXSldDSmRzdHk4?=
 =?utf-8?B?V3NwV0N1aWtvY2VnK2kyT0JoYTVUR2k3MGtPY2FZZHB1VTY4VnhtNFNQMHBk?=
 =?utf-8?B?N3RaOUxRRGRYbHMwMkJvcFdMTXEyK0NvVzFMNk9QanFONEthSng0QU4wNmFH?=
 =?utf-8?B?dUJwb2dlbUI2blkyYUlNQ3lzU3lGenFNZVdQUzJ0VHlhNGxBc0srdkJyY3kv?=
 =?utf-8?B?MXF2a3oyQWtRZVE3cis1Z095YVZHVU5aa2lzdnZBdldwejhnd0lkYStDeG5E?=
 =?utf-8?Q?vr4SqKBPkZQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0xreUh6MTBUR21XUTRiUExzMm9lVU5jbSt6Y2Y5dnV6d2VJdWE3WXhOMDMr?=
 =?utf-8?B?WkhOSzZHWUQ3VGN1Zmw4WWpkb0Z3MXBSSE9ReS93RjFDbUdYc0xNU2w4Rnl6?=
 =?utf-8?B?bnpjaC9zUDJia2NiS3E2bXFXVkJjVjZkbHEvOE1LZlFLMVIyVFpxTWg1MFh2?=
 =?utf-8?B?NFVRV2tYK21Nc1lmc0RKM2xXK1NWL0ZsR2xFWHFZbEsxRWRvK0g2UmFab1FC?=
 =?utf-8?B?eVNtOTFMN2NqR2ZZU2lRM1pQZzR6NVJJam9pT3pZMUxTbG56dDFMeEREV1lj?=
 =?utf-8?B?LzVpeFVGVG1VTXZFaVNjN1NGREw4bEdWQnlsRnRtQUJpemFwUHBCd1pOUENw?=
 =?utf-8?B?MlpjTDV2VG8rTXFmekxMM0gwaG9kUEtJWWlaa0NVd0Q5Kzl1STg4Y0JDaWEw?=
 =?utf-8?B?azJaSzNxYlB0Yzh3ZnVNelFoRmNqL2NxSktnaEZmaWF6bzJ5YmpCbU00RndP?=
 =?utf-8?B?cUpMYjlvTzhRUjZWY0VpRzR3L0lWRnJ4aEpxT2xBOHJoVFZqSVgxeGdvbFI0?=
 =?utf-8?B?eTRvSkxLNDZHOE1mTnlzUGxjSGxPOVBOVFpHeGV4cnFkMkRSN2gwL2dOeUMv?=
 =?utf-8?B?anVzTFJaNmVSNncwTzNBVC9VNFovak1KVmlyVXkydVZjQlNqTWJZM0VIT1oz?=
 =?utf-8?B?amMwNWsvR1I3a01aNTJtUHJ1bmJod09wTVNwR0N3MXppRExrdFNOZlE3aERu?=
 =?utf-8?B?S0ZMSzBMalhyQkJ5anVCUkV0SjVZOVhxUGx3OFd6eElQd2U0NFBRNFg0ZjhJ?=
 =?utf-8?B?Z2dFQnZEZithQXU2cWhzMFdPR3FSVjVPdGQ2Z2sybzkrcm94MlBnZUhObjR6?=
 =?utf-8?B?NjZrOGVhTEhJOFBmSysva2h1Umc2VWMyOHYwUlpueGM3NW1uNi9xSTZtSjZm?=
 =?utf-8?B?YWdycW81bDN2VkZiQVZVNDVROFhSdjZveE5VVVd2UklqTkZRcGlqcFU4Nk53?=
 =?utf-8?B?cXk1bDR2aTk4aENZaXVGS1grRTBRVWVlSWpqRy9MZHNHeS9vSWhwZU9vbXM0?=
 =?utf-8?B?R2hrd0NsQlhvRUtPend0UmxESDdRWFRMNFlKSkltME1vS1ViRmVzRloybEhR?=
 =?utf-8?B?UXlJRGNvSVQ5TkRWYStlVXhZRUJjUHBGek9ZWHRaV3k4c3dQR29rQWJNVkdr?=
 =?utf-8?B?KytCbkRaZFF6bjR6SEg0eWhwV0pMS0ZDTEgvMHhRZE5WV29pbkFMU3FaSU5V?=
 =?utf-8?B?cnE1V0dxZk9yYVlMb3grWVpCZDdrVnFaM2pDazEvVnVRU1hTL2lMRG5Ic2g5?=
 =?utf-8?B?ai9meWlYZHZuQXFaSmtOZDNuY3N0MzRhYnlGWDlWdWVSaXVDajYwVVNlN3dq?=
 =?utf-8?B?eW5xYkdWQ3QrNmErR0R6T0JEdjVuNG1MWHlWbVJJUTJyUmh1YmpJRHNnb1ZW?=
 =?utf-8?B?NXl6WktmZnhobTVMRkt1cmVnM0VyL2hjcElEUmwyNUNFZ0VYeUhoR2NValAr?=
 =?utf-8?B?eERGVU9JdzM5cDgzQTNOMTNnU3NiTGFaRXdyekwwQVBkQ3puQXdRZnMraEVm?=
 =?utf-8?B?MC9Kb0R0aldMdmZUSnpRTXovaDZuUVZ4a1JvYlNJbmJ6L2JtNHZnSXJvZXdN?=
 =?utf-8?B?Ly85WEZDcHAyTUpnTzdpSXh0S2FwMkdQQ0RFU0I1Mk5scVM5enFoTjlDbDJB?=
 =?utf-8?B?OHQremdIeTFoYmQweWVLem1jMGFCdmNaOWhtTUl3MEh4d09EQkxsb3dFWHBK?=
 =?utf-8?B?a3MwVFA3OXRLdkw2T243NXZaallZOEtjbSs1WDJlWGlueWdhekdqZ3hScHNm?=
 =?utf-8?B?ZkRnY2hBMWJoZDhSR3cvNTk2Z2J2eHRRclVjK2RYT05zNnFYLzdGRkpPTG9Q?=
 =?utf-8?B?WlZyKzhDZjBuL0IzTnNHQXUvd0xLemV3UEhhankxRGxjaFV0TUNtREFoMXhv?=
 =?utf-8?B?eUgzN1BVektPblIxV3d4YnVDZWhCaTB6dE9Jc2VrZzFpOHFhcExSVXdGQWlS?=
 =?utf-8?B?UDdobDhINy9iT0t4UUFoeVVQQ0NvV2hkTFJ4R2hnU0hjRDg3d25neVdMeU4z?=
 =?utf-8?B?NW9tZUNUVjVBRjVlSW1jVmpGVFNxZkR2UXJFWmpReGdEWmNHMHdBVlhPY2xE?=
 =?utf-8?B?emd5eVQrdXZVM2JIS2tQV0FOcndhRnNKb0oxOVJjTGEycXlPR2h1QmRCUVlu?=
 =?utf-8?B?SERQSnNTcWM4ZmdoRlB6RkV3bFROUGJsNDMxVzV5RHpFQ2g2VEY4RGd2ZjlG?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b9af6e-33e3-4eb1-2a39-08ddf79a2e9d
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 16:32:53.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vM1prvGuxK9mbKDYf2F9MM8pR03hJY4+K5ifdxMAe4/fKzNXYb8StrfBAdYCMqpGuwNsKjaCQqbD8ZwwvGt9u2O2J2bUk6Z5NTviGVKd1x8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8865

Hi Jan,

Thank you for your comments.

On 19.09.25 18:29, Jan Beulich wrote:
> On 18.09.2025 19:17, Grygorii Strashko wrote:
>> On 18.09.25 18:41, Jan Beulich wrote:
>>> On 16.09.2025 15:41, Grygorii Strashko wrote:
>>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>>> @@ -1116,14 +1116,14 @@ static int cf_check viridian_save_domain_ctxt(
>>>>    {
>>>>        const struct domain *d = v->domain;
>>>>        const struct viridian_domain *vd = d->arch.hvm.viridian;
>>>> -    struct hvm_viridian_domain_context ctxt = {
>>>> -        .hypercall_gpa = vd->hypercall_gpa.raw,
>>>> -        .guest_os_id = vd->guest_os_id.raw,
>>>> -    };
>>>> +    struct hvm_viridian_domain_context ctxt = {};
>>>>    
>>>>        if ( !is_viridian_domain(d) )
>>>>            return 0;
>>>
>>> This check doesn't check for vd being non-NULL, so this still feels a little
>>> fragile, even if it looks correct now.
>>
>> Hm. May be I missing smth., but
>> - if is_viridian_domain(d) and viridian_domain_init() succeeded
>>     then d->arch.hvm.viridian != NULL, like always
>>     (otherwise domain will not be created)
>>
>> - if !is_viridian_domain() then code will not go further
>>
>> so I'm missing to see how !d->arch.hvm.viridian (!vd) can happen here.
> 
> Well, as said - it feels a _little_ fragile, as it's not the NULL-ness of
> the pointer that is checked.
> 
>>>> +    ctxt.hypercall_gpa = vd->hypercall_gpa.raw;
>>>> +    ctxt.guest_os_id = vd->guest_os_id.raw,
>>>> +
>>>>        viridian_time_save_domain_ctxt(d, &ctxt);
>>>>        viridian_synic_save_domain_ctxt(d, &ctxt);
>>>>    
>>>
>>> Just below here we have viridian_load_domain_ctxt(), which I'm pretty sure
>>> now also needs to gain some check: Save records coming from user space, we
>>> can't really rely on there being none of this type for a non-Viridian domain.
>>
>> As per my understanding:
>> viridian_load_domain_ctxt() calls hvm_load_entry_zeroextend() which
>> should not succeed if context was not saved (which shouldn't happen for
>> !is_viridian_domain(d) case).
> 
> I don't understand what you mean with "was not saved". To be free of security
> issues, we need to cope with any (bogus or not) record appearing.

I've posted v4 with additional check added.

-- 
Best regards,
-grygorii


