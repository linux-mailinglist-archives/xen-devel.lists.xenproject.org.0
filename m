Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A871C8AFBF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 17:34:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173084.1498175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOISz-0005tv-S5; Wed, 26 Nov 2025 16:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173084.1498175; Wed, 26 Nov 2025 16:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOISz-0005rz-P8; Wed, 26 Nov 2025 16:34:05 +0000
Received: by outflank-mailman (input) for mailman id 1173084;
 Wed, 26 Nov 2025 16:34:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOISx-0005rt-RF
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 16:34:03 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b645edbf-cae5-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 17:34:01 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by MW4PR03MB6619.namprd03.prod.outlook.com (2603:10b6:303:12a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 16:33:58 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 16:33:57 +0000
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
X-Inumbo-ID: b645edbf-cae5-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZkT1fXGR3OfZS927NyRCswK6b4Y4gWxnehzQaJ6VOxQu/H+Yl+2ram1G0pwbDle2Nax2KUlNrdxXcpdJX5PqtuL+yFkm1wnBV7dZixDIDlE3aNwQ3F5Z8P1hYZtcCzgtBlEBviV/+77AXGzC4jovzpnggXMAgxENCyNuCrtVtCpeqoQ3INdAArJI3u3YvCAFmK/7aTUxFSlSwC/9StES7OrED7ZcoN/pjU+Pip1cX/CMoPuMJw53ZeV/i/wtMnfm5Z7uonCOhlXA8DXHMU8r13YGqo2Z62mTLTM8K9ZIvtw5Cem2LI5peVR+0rYwhTiJCorfofYMhTJzpD5NGXhQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLfKCpG4/xw1gThi9mjBpYROA4/JDXaMtxiJFo6uvUk=;
 b=FJU17opMwNJ9IdExFHgQqZqsdOK0J9ZBk18AmNE5oeaSAA0Ecq4mB8rvAs8/AzcNoeRuleGfhSMe+A05bfZOka1k3s/82BSHMNWS1iDvFP30dbutWqECu3QU7wt4yu4G2q+ohY+xVpG94UxjRFGyuK7k8MUomypHcGgZeKMpT1shxAUyfGKeewXRO2AVXYq0enLF9QN0cW/XZz2+KD03xxaTRL2GPreNzNJS6bYn0y4+xJD41zBO9qSFaErbKpYMJQf1e47Yclo/wqCMF/LqLiIJC9MIUK9WCT2/wUqdeZXHHe1t1Kf39wqh4zhxp+scY8sgO/TUa68cbArC/ZQjlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bLfKCpG4/xw1gThi9mjBpYROA4/JDXaMtxiJFo6uvUk=;
 b=ZZ+UTf4wTmeoWpYE38ydy4euDjV/hy33Nygv0l6wMpAff9UJ4PZrPsV1v8qjMAffQaQMNdUnl8lXNjqoxDGtHjX/JtbgK1RU7z8ukezyN6iRadfB3uKeZcXuVsXrtS/w7SIj3DmX4wqfrzkLdWi7Ws0kOv+oYTmXz9pOSZiaoQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b86968a2-0e61-4d35-a54f-71dc0ce3877c@citrix.com>
Date: Wed, 26 Nov 2025 16:33:54 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/3] x86/amd: Use setup_force_cpu_cap() for BTC_NO
To: Jan Beulich <jbeulich@suse.com>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-2-andrew.cooper3@citrix.com>
 <ab8dc060-7707-4ff3-a413-730555aefeee@suse.com>
 <fc9adc57-bb95-484a-9461-0751dc91cb1b@citrix.com>
 <9c72cfb3-ed12-4955-817b-84d7c33587af@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <9c72cfb3-ed12-4955-817b-84d7c33587af@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0238.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::9) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|MW4PR03MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 3587a8d2-8717-4fc5-fc66-08de2d0998f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHB0QzBWTTd6YytzTHlkaDZTRmh3RTVIM1QxUVlHdGdNNEJaMUZud0xGNnBK?=
 =?utf-8?B?Rm5yZUN4ZzRHOFVrNDNQMm94VjQvRmR3V1Bab3MyMUZCN0JOU0VFRVZpYjIx?=
 =?utf-8?B?d2JBWXdmYTAya2IxcWNEdVdvbEpPSTI3dTBUVkN0TTFYTkVlcEJ3b3g1U3ps?=
 =?utf-8?B?R0lnUGVRWUw2emtjMGdpdVQxVTNSV251VmZMRHRMcmhqRUFZd3FPZ2YyWnB1?=
 =?utf-8?B?VTkzTGlSc3hIVm1LblBNa0o5NTVnVkIwd0pLVTJpY2todkViUi83QkZpWWRv?=
 =?utf-8?B?S1E4b2RaTTFMZU52Zjl3aEp3Z1lBbFhmRzFldm1nTTAvRVN2SFNLNXVuRy9k?=
 =?utf-8?B?YnZ0UzhYWFp3MjBuekNJbVNhazkyTkM4Ry9ZWUs5V3dOMUliR1oveCt0dnlJ?=
 =?utf-8?B?ZHhsekZweU4wdHY2ZnVQb3RQTVk0VjZwQndBT1U1Vkt3TmZUZ3dtSjJGcGs2?=
 =?utf-8?B?NjhXRFoxRHUvVkxwRWozWHAycHBUNGVYRHdRSEV3bVgzbDZTdHhyQ0g5OVZI?=
 =?utf-8?B?a25ma1czR0RtcmFLMUhDU29aRVUvMjVJaE4xOG9HRVlaRlJxUUhDb0dNQ0ND?=
 =?utf-8?B?aXZrbXJUUy9WVmhlYk1kTkN3VC9pcVk0R0kwcjFKSVNtL1k2Rm9uNklrSWUw?=
 =?utf-8?B?MWVuL0t5YTNRaWhPKzREa0JVYVBudk1DU3JOWmZueVJKcjY3WDlxcit2bk15?=
 =?utf-8?B?Zlp6SlVuaFJYejZiWkhFV2Y3UTJjdU03STc3bzFTT0ZDL2JkaHM3ZzBPcnU5?=
 =?utf-8?B?TWhyZTVEMHdWd0V1b0JvempwU29TRjJVaGIxT3JDbzZZVzRJMXlMSDZZNXNC?=
 =?utf-8?B?NUI3bHpCdnExaGIzZGFKMUZoOGl4dGV3bEFaY3lLVTV4UzJ6Y2pRdkp5TFZS?=
 =?utf-8?B?U2tocmptTEMyRUlVU3lUMWhJdW1iRm5GTCtuNExLWmRzQkhHeWJLdENVZHdO?=
 =?utf-8?B?VjEyTXRKRUdIZGFCOUl5NlA2bXdURnBnT015M0QvMklwbk51TlFuYWZ5bWtF?=
 =?utf-8?B?RVdudnJNSEZHaW5LSkdiY0xMRGU2NXBwWGJjU015RFRUY0VEbFJhckFRcS82?=
 =?utf-8?B?bUdDU3hTakwzTUh2SlhBMVo0L1o1L0NyeCtySk8ybHVDeWRLUHRudWdESURa?=
 =?utf-8?B?YzFyTzNSTHh5czFUSWpFOXZ0NldFOVdyelVkbEtIWStEL1FielVVczBQMkpJ?=
 =?utf-8?B?VUZUTllHaXdPMmNqUStsTkRRM3NKYVUzMCt6TUpLYjdZRjhCVjltQWdjRXZl?=
 =?utf-8?B?S3loaXRsSW1nZU5sMmx3RnFMa2JyaW9NZjFpTGxaN0w4ZXRoSTdDVHpROEZw?=
 =?utf-8?B?MjJ1ZEp6U2ZodGh4RW5qSm0xMmZHVmFxWUdibXVBZzJpNVlqcGFTRHBjK3NY?=
 =?utf-8?B?cTUyb3F2aWpnT0ZrT2xuRUhLSHhUSHl2UVVUZ0lnZWVrNkV4ZG9rdnJUZXN6?=
 =?utf-8?B?M0puYXBvQUMzdTR3Y21EZmowKzgzRWdlbTJxbW5NWEdoaVpGbVRzR0ZpbDhy?=
 =?utf-8?B?N1J5b20xMWVsVzhUNDBkTzJ0UTRYVnFRaU80WGN2ek52b0dDS25sUWtjajlC?=
 =?utf-8?B?cUQ0YnFXcitEU05SbE1BclVXNWN5d0pNV09vdjd1SW9vR3BHTkppZjg3Z0tO?=
 =?utf-8?B?WXZzSFdYZzF3MFBvQkt4ZUlJbTVXeXV5bjdzb3VKTUFqMTVrUisrK1BQQW52?=
 =?utf-8?B?Y0FVNlZVQW5NT0xjV2d3L2ZmUG1IMnhNcmhsVUJ1bzJsZ0ZtOURRd3h6aTFH?=
 =?utf-8?B?U0h1MExvMmJSTUIxcjgrRThVUUNMZkdadkZFcGxWb0VzMmR6a1NsaXRCNk5V?=
 =?utf-8?B?NCs0eENDdmkvSjYrSm8yVk5rTjlXcmxzZm1zdjBVejR5QzFjVFM5SHc4UDFT?=
 =?utf-8?B?VnhnekxidEtLeUY5dTZpb1VlNFdnNS80WEJ6ZjhNTGtGR0wwd0NHdnB6MW1w?=
 =?utf-8?Q?PQjHz4n1z9Te0Im0SOCo8w4G8uqWglnc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmlTT29WbGJHMVlNSGpJbmhEbExNRldjYmNXQXdkbTRab3dDcDltdzY4VTJh?=
 =?utf-8?B?L3dwOUIvZ3N3N0FSb2RVNDl3Q2NUQ05ZNktqbVF4TVl2YVBuRGdxa0k3YWlv?=
 =?utf-8?B?Y0hod2ROQWVnQmdpK0hKOGtpclR3Y0QrUW5VZ2N6R0hLL0hlYXdpY0FxdVRj?=
 =?utf-8?B?WHhGWEsxQlhsTGFUbWY3N1o0M254MlZ0Z3g1NG1oMU0wM1lBa0w1NFB5SUpy?=
 =?utf-8?B?VHBFUnZ4bm1zbnU4bkJUTjcydVc4dVFxNGc1bkFjclNXWk92cVlINDFvVnVC?=
 =?utf-8?B?UUJvVEVHa1BNczhzNVRZRGJYNVl3ZmJPN0VIaTBxTWdtMFl6Unl4eW5mWWdH?=
 =?utf-8?B?THlWWkVEMitaYVd2YTA1LzkyYXBVQnJOZWl3RDJJZFBVYjg0VENnR1I2UnZq?=
 =?utf-8?B?MlZlRWwxRGNXNFltSVRVODZVeDhTUXpjTmUwbGp6T1NNbFZkZzdXbFdVMTJB?=
 =?utf-8?B?MlN0UCtFcXlLc3VTanc2dGRFcE1BeHpYaEc3RzBrYlpERnM1MDJDcmVBL1lL?=
 =?utf-8?B?UWtMeUJLSjNsVXRPSFpEN0tsL1BveEJ6a05qMGc2MzllVm1pbzRjUDRGUG5D?=
 =?utf-8?B?K1VsemM3dFB5UWlSSlFDdEpLa1IzSEhmU0NQWWRqd05LbjlUMkVpSXUrOXVi?=
 =?utf-8?B?bEhpUjZaN0w3K0tqT3FTUlp3aFRXb1ppTFR2OUllUUg4cjFoUkp4OTcvRU5z?=
 =?utf-8?B?bE5DUjlHQlhQMGloOHRnMHhuUTh4WGEvd2FpTWt2Z3AwbDkxNTNmcW1YRzlz?=
 =?utf-8?B?eVRBMkR4eko5bDcySXBVU3Q5QUxudk4zM2tYdWw4U3pVbXlWM3l1bXdVWXNG?=
 =?utf-8?B?RUVZKzBIRW01d1JzY0E2N3cwM1N5OXRmdVBDUFMvMElwWTZ6N1QySUtrVmtS?=
 =?utf-8?B?bTRaUlk4RFlucENNYXcvSHJxQ3YrNFp3UWZ3ZzNwN0Jzam5xQ2x4ekluWity?=
 =?utf-8?B?ZldvbjFGYlpQVWtsa3FCcWVtVERzQTRzRWw0SW9sVVhENEdnelVad0tBK1Nm?=
 =?utf-8?B?YmtzVDUranBQRXk4N1IzaDNnSmtjQ2FHOU51eE9UeUVhVzRqZDZDbTVJS2Yx?=
 =?utf-8?B?aVhoRXFxbVBPcWM2VnRPczQ5ZXZraGNOWFhvejFNUHA5N3ZSaTg1Y1VZYlIy?=
 =?utf-8?B?YmxpVW40QUNQNFNoUEZzOHIxTm9OQ21CUVRPWXVmT25HTlBEN0NPT003MWlP?=
 =?utf-8?B?MUVSa0gxaGdiWVNSOUhCdW5IS2Nub0xnRWYxYkI4b3llTWhPOGJMYmk0RGsy?=
 =?utf-8?B?ZmRyeFdjVkJGQmwvQ1BFY2dtVEtYMDJTR05rYTNkUlBuUGlEMmhjUjFyb29w?=
 =?utf-8?B?ZUFLaWczZm1CSzZLYkdFOGFhRTRDRFRtK0hkZlE2M2IzYWMzYXVyT2lBbjJJ?=
 =?utf-8?B?Qm5PMVlsN05KdjVRUEc3KzYwUm5wU3hPcWdUVmJKVnJPZjQ3T0tWMlhFTEhN?=
 =?utf-8?B?M0JuamFQVTRTYm4zVkxjb2ZvWXo5TWRjSmlheEQvcHkyV0tQcTRKWW9DSFFu?=
 =?utf-8?B?U3NQaFlZM3pGa3JnUTVwWGVSUUJGRUcrNXdTMENiVzZvbVFxMGExYWROcE5C?=
 =?utf-8?B?OXZOd01sdmhRTGFUL0x0OHJKVDBQRHQ1cnRSQk5XOWVqL1liaTNUMHJENVFK?=
 =?utf-8?B?SUtZR1BlaTlMWDRRcGxYYXlNakllcXNObVRhcU1DT0VXU3ZUMG51dXNFUmtT?=
 =?utf-8?B?aDBod2ZhSWwwdnBpMEpBUlBqNjlzWGFRSWV3aDhBQ0hadVdLajBNRW8vZHYy?=
 =?utf-8?B?S0c2R0pCYUprcEZyWGpvS1RCWjlRb0dvbDRjMnA2RjNZU3l6cW01TWVXM2RV?=
 =?utf-8?B?MGFEVlZMTnQ0S0NqRUE5SkxvSEhGRHRxZnlqajFKMzlDT3RISThwYmlWZ3BY?=
 =?utf-8?B?N2dHeWZNTit3QzBlU0dUUUhhRnhZbUZsU1Fld0lZdEdoTUxSWHQ3cGVjMVA4?=
 =?utf-8?B?QlRlSjMxL3l4MWpFcE5CeHlablpzNitFV3lERXIzbERiVWtkYkVCd2tpbUcy?=
 =?utf-8?B?clVKL0htOXJFZlNJc3BZUW5IemJvOHNxRGZlWE4rM0xkZXp6bDNKbXJ5Sndv?=
 =?utf-8?B?dFQzS3MvUzFuZnRKYUpVc3RpMGxCeFpvSWZ6UVI4amR2ajduU2VrbVMyMUtv?=
 =?utf-8?B?My9vMzd4MjF1TUUvOWhQUlNpUkswMXIzZ1p3TVpDRVEzYWRvNnpkb2Z0UVNK?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3587a8d2-8717-4fc5-fc66-08de2d0998f8
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 16:33:57.8297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6vPEXZty4SFuRG/iobWHrZ5cWWexge7kWcnhudc3yPr5f7D9/Gemu9iJY7yga0S7Vv1+hmX+JuwVORNbq/nnDBEpvHdxv8v4D4YtwX2i7hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6619

On 26/11/2025 3:25 pm, Jan Beulich wrote:
> On 26.11.2025 16:12, Andrew Cooper wrote:
>> On 26/11/2025 2:19 pm, Jan Beulich wrote:
>>> On 26.11.2025 14:22, Andrew Cooper wrote:
>>>> When re-scanning features,
>>> What exactly do you mean with this, outside of XenServer (i.e. upstream)? The
>>> only thing I can think of is recheck_cpu_features(), which calls identify_cpu()
>>> and hence init_amd(). Thus ...
>>>
>>>> forced caps are taken into account but unforced
>>>> such as this are not.  This causes BTC_NO to go missing, and for the system to
>>>> appear to have lost features.
>>> ... I don't really follow where features might be lost.
>> Well - it's a feature that we started upstreaming and I still hope to
>> finish in some copious free time.
>>
>> Already upstream, we rescan the Raw CPU policy after microcode load. 
>> That has had fixes such as dis-engaging CPUID Masking/Overriding so the
>> Raw policy comes out accurate.
> Yet that doesn't take forced features into account afaics. So at the very
> least this needs to come with a description which more accurately describes
> what (if anything) is actually being fixed / altered upstream.

I don't know what more you want me to say.  It's not a problem per say
in upstream, but it does come about because BTC_NO is handled
inconsistently to the other FOO_NO bits.

recheck_cpu_features() papers over the issue by re-invoking
identify_cpu().  It's necessary for S3 resume because all of
init_$VENDOR() really is needed, but it looks bogus in
smp_store_cpu_info() because it's repeating work done immediately prior
in start_secondary().

~Andrew

