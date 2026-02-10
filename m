Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIQ7LI0Ti2nnPQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 12:16:29 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECF111A0AF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 12:16:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226292.1532829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpliP-0002EB-KG; Tue, 10 Feb 2026 11:15:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226292.1532829; Tue, 10 Feb 2026 11:15:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpliP-0002Bf-G7; Tue, 10 Feb 2026 11:15:33 +0000
Received: by outflank-mailman (input) for mailman id 1226292;
 Tue, 10 Feb 2026 11:15:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tYRw=AO=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vpliN-0002BZ-71
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 11:15:31 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe6fde9-0671-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 12:15:24 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by BY5PR03MB5128.namprd03.prod.outlook.com (2603:10b6:a03:1f2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 11:15:21 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::a70d:dc32:bba8:ce37%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 11:15:21 +0000
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
X-Inumbo-ID: cbe6fde9-0671-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjHTI9FLMDcvN46oEdSlc3VIxGMwpwjbqq8hNT1XpYuRHfk32FG+EbMjtNhbcn2yaGXP79gY8aF4Y4ymVFlaRxrZHCrkaBhemr61FPtj2wCQvTKYXcMD6acpMP0EC+APLP3inmgvcBJydWWlkaF++0EagprPB30cUy7jb8Po3EwrST9NpUklfzi8NcxBPTLvyzMyn4eq2aR5C/cT0XLhLbcHcKaMepkc/RJy0XFl5umnm18m5hSEDEdM/tKhN28PtvO0TkHjRGt/nMYiJD4kkut/EqqZt+X84CcJEa0y0CUDrPZ1uL1iCp1q3dv14uVynJCCwPnH1/OZqX5weKPNJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFW+V4tlPkO41690Rx6DZso/o+PEWzlkq6pyciYOmcs=;
 b=AtyXtOO05x36PYoL5W8iuOafObtHrrY1OZK7w39/HErfU3bEkDgwanyv2hPGBq9U4x+vj2ZFCDVy6khAxMGeSgVNZVb/FGCDnLL9OjIOc8Oy487pNVJQfg4wtBC3RwgfMRR8iXHYeD0NYNNZigViW+ftmD/Fl6ggBhylkV5pEI9T0gVaAXgDyU9PkgJL+XAZoLHC3MvN6A45tKes0bzwz3wuFegLj6VV0j2n1jb2YW8syw8FeuOpLDeMWT77BS+db8+0/ZrKBX7hZ91MznHT3WHjwKgy1mB5IVBDe+87OoIeP3SwZulpf2xSVFK9YXlcGAIpYYbUPxV7AYmWnGFgjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFW+V4tlPkO41690Rx6DZso/o+PEWzlkq6pyciYOmcs=;
 b=MsovdwjERpOMM/c4qYcuPvDlCYSkb86piq7edr9hN+VM0LIar93noOgZfelcnTFcLZDUfqjs2VJXaWm+nK2mCQwQ+GpEiQcA2u7JHHQSLLgd+4Lf6j+FhrbIb4yWSg19n4nazeevZbuFq0jTXoANHR864nor+6yYSaGT/dKPpQw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6786174e-e00e-46fd-8b82-7eb823ad96a8@citrix.com>
Date: Tue, 10 Feb 2026 11:15:18 +0000
User-Agent: Mozilla Thunderbird
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 07/22] x86/traps: Alter switch_stack_and_jump() for
 FRED mode
To: Jan Beulich <jbeulich@suse.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-8-andrew.cooper3@citrix.com>
 <e314d193-79f2-4d77-a2ed-1590375b4b96@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <e314d193-79f2-4d77-a2ed-1590375b4b96@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::19) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|BY5PR03MB5128:EE_
X-MS-Office365-Filtering-Correlation-Id: 75ca0e45-a68a-4a7c-fc29-08de6895ae2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amtTaDhjS1l5ejdTOE1IQjJLdjMzejB0ZDhqaDJjVlZPcEZmYzlweHNhVWtW?=
 =?utf-8?B?Y2JnUnFNMGd6M1l1UkdHMWlHSnM5bFVQemZwU0ZnalpxZjMxanNxMER0ZjJ6?=
 =?utf-8?B?N0ZpQWNOYXoxc3ZKdlhLK3h4cmFCdnJZZFh5anRMU09iOXRFWXVsREJMMDRB?=
 =?utf-8?B?Snk3VmR4MlJRNVBaYkJyTm1SbmNJRFBmR1MyK05FSDdGUFI2V0VmbE15T3FC?=
 =?utf-8?B?OUN5aUt1aURIeGIzZTlmMDBneXozZUo3dE41TkdZbGdCcGpNZlkzNTQwV0JZ?=
 =?utf-8?B?KysreFgxMFhNZFMxaDhhRk9JTk1QejZxSnhyakRQc2llQ2hrVy9EQ09VdnNj?=
 =?utf-8?B?aW85enVwdWZpL0RQdzFjRUx2elE1TXBkT3JINkNFc3pONGhRbzdUUGw5aGs0?=
 =?utf-8?B?Y2RGTEN5QVNRbW1UNXhSUFRmems0aWtEa0gxdVhteEtsT3pnb3FGdkQyLzdz?=
 =?utf-8?B?TVNrZk95NHlQWHFFM0xNZE1VOTlXbkJBRW93eDJWZVpPUFB1eG5vUGhRNEdn?=
 =?utf-8?B?R3duSU1xWm1JN3VHQlpqTU1mbHF4ckVaclJxTzFiVzFkanY0UzQ0WjNaODI5?=
 =?utf-8?B?dnlJbGJLMjhESXRlWTVlS0ttOHVOUmVIQlV3NEYvY3ZYS0NvdkxibmwzUVlm?=
 =?utf-8?B?YnZhdHM0S3hlQzVuTExVR3p3Q0xQUGNOWDdMQUxXUWQycUVpbEhCUkdSR0NZ?=
 =?utf-8?B?dzkwZDIzMDMvSUVhVEJOUEx1TS80V0Z3S1pSNmxpRGtydHhqMW1nR21hTTEz?=
 =?utf-8?B?clVXMWYxTVNwKzd1MnNwa1oyWWVZVTBmODNyR0dpbVpkZ0NBNExYL3l2V0x1?=
 =?utf-8?B?dVpiVXFOTFpaUTBydE94U2dlWEpBcS9zNWl2UXF6MzZwV01GalJudmtFd3A5?=
 =?utf-8?B?c0UzdWxYMmEvc0NpUklocDFUSktVVFloRThra2RtU0NrckppVDhqRys0TExG?=
 =?utf-8?B?b0lJV1Bhd1p5RXY0ckZ2aDJuNUlmblpqRHFCcWNNSjY2dXJtdTlQSFhBUUZy?=
 =?utf-8?B?QUU3d2RMOG5lUHlDYVl3Tk9rN3kzWHlyTEVoMVZobkJibEZSZnpJdDU3NU0x?=
 =?utf-8?B?Ty9TQ2oxVjJqaWZwbVYyL0I4VHlBNE1zRGJIUWpxQVAydHlGRDQwaWRlRnRH?=
 =?utf-8?B?QmEyaXkzQW04UnIycEhPYWdzbDFDRC9LeVdSKzJGa2FaajdVbUpqRE5Jbk43?=
 =?utf-8?B?WUJqU3ZOb3greTdFQkVTOXNHckpjeVJOTWdDTVNrbGozTmhReFNJOUZxbzlh?=
 =?utf-8?B?WkxUV2M2VzBRTnZ6L2FBaDBvZDRGc043ZW9WWjVGVlhWUGVrRWFXVjJYRmNy?=
 =?utf-8?B?T1pnYmFtcEd2aHdvR0Q0WEVDTVpMSFlDU0VmZDJSMFdsckNFQndoWC96WGdD?=
 =?utf-8?B?RjJ6eDhDNEtLQmw3OHdwRUxzbStRdGtJc3Z5YUhyR3BidmZ4SWVrYTBSeEVh?=
 =?utf-8?B?dDdBSlNPVFZXNGtvRVBxbkdHdk9mUzlObjkvdFdDZDY4a1IvQWd1b0RKbk90?=
 =?utf-8?B?RzFEMmZ1MElLZ3hSOENrN0w5MEZwditiUVhlajRPY1NXWFlwR1JMblNSZFVX?=
 =?utf-8?B?SkNwek5KYmorOENmN3hQMWFsdFk0WTlLbVBDR3FQRWVjbU5aeUVZWllJSXBY?=
 =?utf-8?B?NFp2bVpBU3NvVHcrSU1VYk4remNFbDJKUzVKOUZVdm1QQW5OLzB6VHdYTFRN?=
 =?utf-8?B?a3RKVU9aSzFVRFlHdGJlVjR0NWxCMVlOYVZKd3dyYmptRGw2Mjd3cjExNkZH?=
 =?utf-8?B?YnJWcUJLZ2MrVUZIMGdDT0JJV05VWGYzMTFueHB3UksyT2s3Ym1FSlVUSHRV?=
 =?utf-8?B?cmxkL3puMTJYaWZ1S0YzdHY4bXFGV3JNNlU5OHRzc1l6MHVOUVlVREYvN2Vt?=
 =?utf-8?B?ZTNRRGplR0pFWXRaRVdDSFlGVjByMFNMelVoQllWV2FaNEFyeU5wZmVuWFls?=
 =?utf-8?B?T3g0YW5NKzJqOWhsTlR1dHB5cndrUUhBeW1pMi9jUlA0Z1BGVVByalVBZi9K?=
 =?utf-8?B?a2o0QU9VRFR1MlBXOFlHQSthaUlsMWV5SDlxTGVzQ2lCRnlrQjlOTzYzY0NC?=
 =?utf-8?B?Tkt1b1JDRzl2SEVueThCWnF6VEpaTm5WSWswOW1vZ281dk90WUVNRVhZMUNL?=
 =?utf-8?Q?dSJc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?am5TTUJISHJocW05Z2d5SXg4SXhiNEZqcndFOUUwbUhsMnJGRG5pNXliYSts?=
 =?utf-8?B?a1RYS0pXdzVQVmRFbzNUUCtZSGsreFRQWlplaUhHaEVMUnJLT0xZVVdScDh2?=
 =?utf-8?B?cXJ5a0dRVHNoNlRyOG96SUhwY1hkcm4vdERNMmowb0ZSdVhxWnJ1OVc4RlBz?=
 =?utf-8?B?eGtFYkUrSldsVUc4elFnclpVKyswaytMRlJXZW9YWnFvWlBFRmdVRE5icXNV?=
 =?utf-8?B?dGN5eGRTckFPL1NpZkg3ZEw5c0JQeS9MZzdoOWR0cHZxUkpibzZCcTJmczdZ?=
 =?utf-8?B?RlBqTDMwdnFDTDFibEdmQmNlcldqblhTSWhsSmFmY29SbkZGMjFRdlZ2RVp5?=
 =?utf-8?B?S1lDZHdFOEZwVEcwZnVtbkszQ2xrTm91YkloL0QzbzA2YVNyRWRqMWpOeUZr?=
 =?utf-8?B?WXBzWTNsY0g0dmFEaERSaHNPNXpNakE1Slp3S2FTN3hmaEloRlJ0dkMrK1dn?=
 =?utf-8?B?TTlCZVk1TWR5cnBORG12THE3dDd2ckduK3Jra0YzQ2kzWFcxY0luc3dPcThn?=
 =?utf-8?B?UUJ6VkhMSjRaa0RiMzFyMUhzZms2WDF1amNqVEpIcGQwUGFpaDNYZ2lMWHVZ?=
 =?utf-8?B?dkRuOGlPMVVQMzJoUkdaZ3ZGRTJlTkdqUEJ2VisvdHlEdmFObEtQdmxZbTg0?=
 =?utf-8?B?N25CRXVKQnBhdjZPZmZlSWQvV1dSaUgyQ3dLajB6ME01ai9DVkU2LzVnL1JE?=
 =?utf-8?B?TVY5eUZJYm1Iclk0NnNHUzFWbitwMEZTck02WDlPeWpiV2JTNloyMSs0eVd2?=
 =?utf-8?B?K3pPQjM4UndteGZkUWlwUEN3OUVPYTdQeUlwRUVNMWJtK21WMVBIMVRVZ1ow?=
 =?utf-8?B?Nk9WRmcrYzZ2QXdycENiRHh0WE51bFVsdi93bFY4cDRzdlFNeld5SXJkRFlX?=
 =?utf-8?B?VzJVN0l4ZjFMSE5jeU1xaU91S3AzMkR4a2V3Snc0VGJDU0M1clYvSXVEQnZQ?=
 =?utf-8?B?UTBHaEZCSmZyM0x1Yk9zbURvdy8ra1NVUlVjNTFRZ3RYL3lDc2pwSDZMN0JJ?=
 =?utf-8?B?L2ROSmsrcVdHcmorWjhsczI3b2lHS3ZsdzBTWCtFNW52bUE0N3hUUnhCbXp5?=
 =?utf-8?B?cFJjMStVV2lwMG9uR0U3Zjh6SkN5QzZGTkI1K05RWlZzTENseTZZaCs2bE41?=
 =?utf-8?B?eU44ZEw2QkJkQXkrbVZRVTZYSHZGRDcyMVEvNGw1N3BXMzk3QTRWd2xNWTFK?=
 =?utf-8?B?OWdJM2FpZ1paZU5vTi96bDNQclI3ZnZJcXBFd2x5R2pDYjV0aWRjN0JpQXN6?=
 =?utf-8?B?VUt5OHROU3kvVmNST1VNczU5NWliUE52VjVpS3c1aURnemh1NUdCMjZyeVF6?=
 =?utf-8?B?MTBFc1BGMTVLTjJVUlk2TTNnOWQ4V0JWcTRvalJDNlBkZTFiVlJyZUt4eFda?=
 =?utf-8?B?MDBMNEQydHIvMEdoZmE1YUhkQ3QrMVo4aDk0ZVFDejhLSGppbFVZSmNzZlhS?=
 =?utf-8?B?V24xSFd2b2p6UG45TlF2cmZDRjZUdDY5UGNSSnlLUEw4RmR5dENxazFSNFA4?=
 =?utf-8?B?K2N1TFd0Sk4xQURtQTVYZ0loMWlSUEpPVkZKMUNWSkx2K2FjYWFiV0RFaXU3?=
 =?utf-8?B?aU9KODllZElOOW1GV0o0K3dBUlNmNllrL0ZYM2JrSS9LaXlqbFpCdFp3MXBQ?=
 =?utf-8?B?eUdJYzV5V0xHVkViLzgyMmRxZm4vOGRTZG0ycWJvVG9UTDJSZmRNSFlFd2g5?=
 =?utf-8?B?WFlXZzFSdjZ4b28rcVhhQlQ5QVE5R0JIMnE3VFJXYzRKSnVjV2diTExqNjBX?=
 =?utf-8?B?NlEwRXE4UDYzMjZVam5kU280ME5VWVcwckxmSkdqZGxuYnducXhoVit4RWhG?=
 =?utf-8?B?Vk1lbzFYeDd0UEUvVDcvNS9BS1phNkJtbVZuRXRtVHphc0VwbWdrdEgvREQ4?=
 =?utf-8?B?Y2h0dmdkZGRoOGw0cTl5bmVURXpmc0V1eENLQmxscUZ6bHFIMUNNZHRmRms3?=
 =?utf-8?B?OURQc0ttUWZqeTQvckJJMlYvWVdpNlBMSWlDUHo4QU9DMWs0c1p0ZllpdHZJ?=
 =?utf-8?B?SGxWc3daZktkbFZyUGlWb0VaZy9sdkV5NE1FZzE1a0tiUTg0SVBpL0V6OTFw?=
 =?utf-8?B?Z0owSEFnTEkzeEtFTm9MRHNHUXNrMWFWb3B1Z3NGTnBvZU9QUldzcFFDUDVk?=
 =?utf-8?B?a3pxc1FQOVNjSDdYMnVzT2VDdTFtem9sVmR2QTNKblprck9OTU4zTWlsRzZn?=
 =?utf-8?B?VDVuR0NURDR3TzI5cERSWWt5cGlaZkQ5NVZTTHlWVngwV0JEZm5IZkYvTjky?=
 =?utf-8?B?NUt4a2dnQnhySmxNVTJkSHd1K0RYWkVkc3QrV2xnL2VCU0NyZXRNYyttbUxM?=
 =?utf-8?B?ellreVc4TU9Xdi9YdVNJNTdjd2VOcWt1RitEaFJpakpxNHMxWVhMUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75ca0e45-a68a-4a7c-fc29-08de6895ae2b
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 11:15:21.6364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMjwIlDUuay7zdu8ZIfvr04D0U5jkI0pcPobWLCm2PZ/M0RUE3fPJrBz+E7FjCYnywK+nEc8SYDIni0deRBgcPmPwyi9aMBQLwV9B2v8AW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5128
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:mid,citrix.com:dkim,citrix.com:email,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EECF111A0AF
X-Rspamd-Action: no action

On 07/10/2025 4:58 pm, Jan Beulich wrote:
> On 04.10.2025 00:53, Andrew Cooper wrote:
>> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
>> means that switch_stack_and_jump() needs to discard one extra word when FRED
>> is active.
>>
>> Fix a typo in the parameter name, which should be shstk_base.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Leave as $%c.  Otherwise it doesn't assemble correctly presented with $$24568
>> to parse as an instruction immediate.
> I don't follow. Where would the 2nd $ come from if you write ...
>
>> --- a/xen/arch/x86/include/asm/current.h
>> +++ b/xen/arch/x86/include/asm/current.h
>> @@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>      "rdsspd %[ssp];"                                            \
>>      "cmp $1, %[ssp];"                                           \
>>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
>> -    "mov $%c[skstk_base], %[val];"                              \
>> +    ALTERNATIVE("mov $%c[shstk_base], %[val];",                 \
>> +                "mov $%c[shstk_base] + 8, %[val];",             \
>> +                X86_FEATURE_XEN_FRED)                           \
>     ALTERNATIVE("mov %[shstk_base], %[val];",                   \
>                 "mov %[shstk_base] + 8, %[val];",               \
>                 X86_FEATURE_XEN_FRED)                           \

I find this feedback completely uncharacteristic.  You always goes out
of your way to hide % inside macros to prohibit non-register operands.

This is exactly the same, except to force an immediate operand, so the
length of the two instructions is the same.

~Andrew

