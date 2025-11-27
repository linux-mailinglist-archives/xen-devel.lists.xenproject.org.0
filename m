Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A87C8FE71
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 19:22:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174313.1499265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOgcz-0003BJ-P7; Thu, 27 Nov 2025 18:22:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174313.1499265; Thu, 27 Nov 2025 18:22:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOgcz-00039s-KI; Thu, 27 Nov 2025 18:22:01 +0000
Received: by outflank-mailman (input) for mailman id 1174313;
 Thu, 27 Nov 2025 18:22:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjm=6D=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOgcy-00039m-5F
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 18:22:00 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f649e8d4-cbbd-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 19:21:59 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by CH7PR03MB7786.namprd03.prod.outlook.com (2603:10b6:610:24a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 18:21:39 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 18:21:39 +0000
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
X-Inumbo-ID: f649e8d4-cbbd-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eHMhsj8oYjkQ83c9c1dD2QCwpU5qsfD/mCrshe6YSxPjkmBspQ5W5zC8U/8THqGtfXP3nXZAEt1A4qKs6/amgQbIhWsMfDjIskl9S+zgWm1lktiHu8JGcGC9PTwxYL9uvNawWj4zIfVDBj0/dSwNO923zPw+TmkM23eJMa0D0jUsr/SLpXWLT3r0SgAj2wzdpayQEeObi/O1dx589lW/hvSUz5xvV+lYb5LiWKtgV3u34NGXKQfqOoxOk4PyPvRjV+pX6x0nu3smPZTxM+kgael1I0GvOzYMbsYrvG0gVIyQ0dLerczrJVpQQEY+uIDHkmB1wNbUGTH0o3bYY7CTKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcEwWd3xzdC7eQUR6Drz9RkwNP3m1aUhUqCqI6AFl2Y=;
 b=LSzsaYKWgZ2iwXS5y97/59YVg1mCPkFciI32hiW4UUmbfsuGebRU4Go2c5NJ2VwcqhOJ3Q9P9ItMZt2H/JqTpxhrYljBt3kv1wsirn+3yX+fjVstxYV5ktX6mTrpa6qUYcKic+ciWoVtkLPehRR7FqVpilNWfPnwdW4V7DXe7PiJIjYsRV2jVwTRD405fUrBP7S0e4gYTgoj7uff5Rxa+ve6gyQPBuVkPurtBIWbA6PmAec1T3EjWFxkAl7kXcjtEuQea1YPHST19bkf36tKhQ6K6cAXUDFU8ZAEY0v06tqyO3t0zJqcTqvbBQ68yHn27Y1MzX9NVG8H8thuSZ1n/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcEwWd3xzdC7eQUR6Drz9RkwNP3m1aUhUqCqI6AFl2Y=;
 b=jGJixpLOE0FcMmEafq3yHPGZmcuB6rAoNv3m4vTRlCrZIEbtZOu0pt7LchfRqOW3d7i4Zr68pS+mGvjKTj5DDOWORctwsUI2MBfC17v8XYKH1DBvPaWVcScba9eylC6XKoWuUXHIKTSbbOnNm+huFTcFYcXsSSAjq0CMT2CoNN4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6d6084c0-0f0d-4783-8ec1-d84a7b9eb955@citrix.com>
Date: Thu, 27 Nov 2025 18:21:35 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/3] x86/amd: Drop vestigial PBE logic in init_amd()
To: Jan Beulich <jbeulich@suse.com>
References: <20251126171539.890253-1-andrew.cooper3@citrix.com>
 <20251126171539.890253-3-andrew.cooper3@citrix.com>
 <9e8ecbc0-2dd1-4744-878d-9b09d019041e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <9e8ecbc0-2dd1-4744-878d-9b09d019041e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0420.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::24) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|CH7PR03MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ab4a43-16c3-4946-f3f9-08de2de1ce8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmgzUGNibERrM1hydXAybnJ5bzA3cjBINU1RYURINDVLeGNsWUpFM2pnamFL?=
 =?utf-8?B?c3dNOHVpU3l3L0JBR0JFeTBtSUcvSzBSVDIrM1dwQUp4RkFZWWZyVndJdlVr?=
 =?utf-8?B?VENzY2R3RW0wR2dHTWNwNFV1cXQwLzhIS3cxYUM2NitxZG9UNm5uM205R2JO?=
 =?utf-8?B?NURlSlN4L3VRMkJXZGNxdVNnUktnT1p0alp0RFF4azZpRkFQcWc5UVZxak1s?=
 =?utf-8?B?elZPK2tJbWtCYXkvKzBxeTJLMFVNVEU3Z3Q3WXREcGpRMUZkdDl1cVAzM05h?=
 =?utf-8?B?ajlHTFcwWC9XeHFDbXRQMjlLSlpyZHJLRVJvQTA3L01FVGVnbnVRalhWbGJu?=
 =?utf-8?B?ejFqbFFoVEpGbklmRnhUQmc5YlpQaURIdXFRZEtFaEJrenpjdGo5SDlYekJW?=
 =?utf-8?B?aWpTczREQjNzclpSNXBTaThPQmJBN25JWkkvOE1PUURMRVNheDhZMUV3a0la?=
 =?utf-8?B?VVp2bXZEVUNDZmxLMk9IYUZHZzZJYzVBU0p0cTZ6NUZOS2dBNWZlbVJwRjlL?=
 =?utf-8?B?NGZ5cmNmVXpPVkE1NytJVXcrTmorT21OTWVVZXVkaHhuZlRFSExTRW12Vnd3?=
 =?utf-8?B?MEtLZG0zazdNbVlrQzVOeFhjaGpsV3cydnYvRytBQXlMOWJiS1FadjNZbEVQ?=
 =?utf-8?B?V1p0MlhYVzUwbnpTN000NlRXbGdxaXVEaE1mUWU3ZWxJT0Q0WHlQSXg2VGRQ?=
 =?utf-8?B?TjFMczBRbklUcHZqL0xXdzRmNXVlb2MxamlieXhuREE0bUFFZHNBRXY2YjVz?=
 =?utf-8?B?QjRqdjdibTlmeUw4VWFmWDluWFRKNURYQjhSbWlPamVsMTQvVkp3cE9QYXAv?=
 =?utf-8?B?SXFPVms3YXgwSFV1ZDNmaytiakRGai9BZFRIYnRlTm1GVUg0ajlLNDRKOWVN?=
 =?utf-8?B?ZGMvNnVtb0RiU1N1Z3VaYVBidEgyMTVPczFSVFduWUhoK24xTmlVUWUraEFh?=
 =?utf-8?B?TnVMaks3ZklpRndXSFI3QkNGQmRFakpHb1l2Qkw2T25QekJHV2VYa1U2eWFt?=
 =?utf-8?B?RFFaRzcwdkZON1U5MDQxWGlxWXlsRTZXTkpXQ0dJbTR4a0JqV1haUE1qQzIz?=
 =?utf-8?B?QjkrZmtJbGNxUFJoWTNVZWNCbEptOHJvaG1PSWFNQ01xVUFFVG0yTk1lVDN0?=
 =?utf-8?B?Ylg2K1BTQ2I4N0kvOXRWZndFWHdVaE4vYno3QnhRNzc4b1NOMTZiLzFUR2NI?=
 =?utf-8?B?eWpLUGdESjRxMmVuM1ErTHg4YW11UjNIZDdad3ZNUUlYTWlzMWdxaDhuaWM0?=
 =?utf-8?B?bHVPY1NTYm1OSHNOUTh6eXhVdXhQQTVITHI3QytDQjlDSmNnVTUvZXQ2QURs?=
 =?utf-8?B?M0FuTW9wZzd6VWJMRS83VENlcUpMdWk5cHdGbzAra05iRVNaNGMvci8yVFlO?=
 =?utf-8?B?K25PcE9QNklucExxdFBtU056SS8yalM2T1VhNUxiLzJUWGtMeEdvQTJXa0hY?=
 =?utf-8?B?RXl1RERUNXZYQitPTTE2eWd4dUtjSEllbFJRblRKUXFrZVVSc01Pb0QwZTJp?=
 =?utf-8?B?Z0tFUzhJWkdZU1VHVlRLNnljMTIvNFQ5S0RhWU1HVWwrQUZDN05tRzVVbnFl?=
 =?utf-8?B?ZFFIK0dSZWM2Rm5RdVdXd2QrMjdzZXB6UjRKb2xoMmorcHU2bFJPR1ZnSFdQ?=
 =?utf-8?B?QUoyenZkU0FZYVZLTEhzZGFMckxvYXVNVk42Vi9LczZ6R2RYdThZbkVqWTMx?=
 =?utf-8?B?b1Y5M00xc2FlU3cwMEhxOGhxSEdUT3QyQ3dkTE12d1J0UEtsRk9KbTFOeC9X?=
 =?utf-8?B?bmhleWdDYmI3TlF5SUE1SFVKQllSMnQ3VkZQck1hbWVBUjJhSDRQb3lqN0d1?=
 =?utf-8?B?VWhBTGFWV0VnQWRhMUR2UFZzdHVxVFZvT1JzaDB6WkNTVldRYkFPNkFuVzhS?=
 =?utf-8?B?d3FtSy83K1pkR0RGelRvYTJZM1ZLZXZSTWh0ZUxZS3NvbFgvQXBTMG1iWDIz?=
 =?utf-8?Q?gqKUbeL4K+SzvJJTBTdFP6DEUBAgIo//?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djRGZGxGRFd2RU1wdFQyWnRqUFh5TmlMd3NUaE5wU0hZWnlacWhyQ1IvajZN?=
 =?utf-8?B?WlFweEd0WThvMFgrVUwrY3BoaHZJZXlrOEhPWmdtVFRscUhiQlZybkVRK2F0?=
 =?utf-8?B?MXcyWGVCK25reTJ6NHkwMmtGTjU0ZW5GQmRGMGRMYmRQL24xNElCSzhRK0wr?=
 =?utf-8?B?OUFGVkxPL2tUZlpLQ0hGcUhJcE5vNE5BRzl0Ykhwa3N6U3VFRGxlaDhHdWFm?=
 =?utf-8?B?T2FENG5NbVhqaHRrMVdkU0x2R0FaTEVueFQxYlpNWVpmS3hQRVNOU1R6YnpX?=
 =?utf-8?B?dTBFNVRXSEVaUFNDbGZkejdhK2FQQXBOa2JmVlZNbE1uS0RVaVhjYW9OcDMr?=
 =?utf-8?B?N3RPK3N2N2R5ZVlCMHNTQmw1MkVnMnVTVjk2cXN2eDZCWlBNWFFMdUhXbkJD?=
 =?utf-8?B?dGRTWGlvM1dmM252Z2lMK3lRWDJobjFUYUFWSk42ZFNGL2pjY3RwTVJGa0pU?=
 =?utf-8?B?QnJNUDNQY3VpcW02K1ZBOVRDSzE2cXJrWWVhVDhUYXlRUU12WFJnWG9FU1hm?=
 =?utf-8?B?NEgyV2lhM2RkQXdNYkhjNEZhQXRXTDk4VjNkb2ZpdWdPMGNmZnlNV2RTYnF0?=
 =?utf-8?B?TnA3NllqcVpLVnRsYjJXUEhaZUcraVZHaGxNQk5KV0pJcmY2T2FGUWJJZ1VZ?=
 =?utf-8?B?VU5DV3AvMlpaUVE3dXVNdnhvUVhNcW91UjVRdHVNZW94amRESWpwQWcrVndz?=
 =?utf-8?B?YWhoWWxpU1UxMW05YUZwRXZCKzEwWnFjS1d5MDRiS3RUNkFHcXVNZ3FhMExq?=
 =?utf-8?B?K2Uza2dNNzJEVVo5c3FaM1B0eGNjeitoSGVpaERXZ0dpRlI4SmFMRlZERDVR?=
 =?utf-8?B?UDFjRXpiWDA5Um5JUVlnWEdMV3NMWENzaFpaS1pMUFFRWENaaExPVUtTeE5m?=
 =?utf-8?B?b0pINlhBZk1tdGttUEJIcUM1OVZNV0VmTUthOGJQaXhpMURkU3NCN1M3VklL?=
 =?utf-8?B?Nlp5V0R6ZmpXR3Vvc2ZNMUkxYURXNjI0aERablR2eGNFY2lHakVnU1FCNzEx?=
 =?utf-8?B?dStVSSsrUlVzVnNKNmJSZTAxWCsvaDdha2hUNXkyUTlGMkJqNTArU0tTbjRL?=
 =?utf-8?B?ai85U2VJZDdnYzR3dUhIMVp5Vzg3elJEWVNSUisxelJnZ3lIZm80eExxWjZz?=
 =?utf-8?B?OFpKL1RNd0NWRm9xSG45MWJ0RlV3ajJpRStpS0xSdEczNS95R2JWMTJ3M2NM?=
 =?utf-8?B?V1BtUG5WdmtGYWMzM0doYXRzYkxVOGZNUGlIZzRRRWI0WlFkS1RrcjFaVjM4?=
 =?utf-8?B?VGlXNmQ4OThhZy9Ed3BEWGhKOWw3T3lTWnFtQlk2WitTM3NvUnlxUThKdGpi?=
 =?utf-8?B?SWVZZzZScGNnZWxQMTZuTnNRMCtSM01jUnNxRTNOdFZoNXBvT2pnVjE5ckI1?=
 =?utf-8?B?MWtwT2R6ZDkxZ1N0dC9qTWFuQVFVRUJZdTdFb0lZcmJDMjBRZ1d2MUxOUzQy?=
 =?utf-8?B?WU1BS0xRM2lOdHFmejRKbW56S2FJZ1dpaXliWXRPcy8xeDF1d3JtSVRUS2NF?=
 =?utf-8?B?ck1LNE50cnJNQ0tLNXlaREhlbWpUS0tncVRGYXd6WWs5RWNCMHRreHJnMXdQ?=
 =?utf-8?B?dDB0WUNqUGNnWmlNZzdLUUxrS1dzamZISDZFK2tBQytsYWNsbEtYMkEwVU1L?=
 =?utf-8?B?WXJweTQ1Y1ROMkFLMTJ6N0UrdkJaSVdybzlmUEYwcGdwSDlrc292cmhvVlBX?=
 =?utf-8?B?OVYzWjVubm1oZFFpbGRSamJTZEpPa3dEYWhoS08zSitCQ0Z5Zkg3ZFk3Mmxl?=
 =?utf-8?B?Q3phaWd6dVp4K3RHRklmLzEwMlczSGpDNmdHNWMrcTdlRmFXU2k4SkJ6Tkk4?=
 =?utf-8?B?RDA0MEgwdVBMaFhIQUFocnlFajVRMCt1cnJFTkhnV1VkVVVZU3h3NWtlVlZU?=
 =?utf-8?B?YzR6eEt2WUp0THFucEJTNHBsQWw4QWRTbGtOcHVGa1BSaXRvYzl1MnZmTy9p?=
 =?utf-8?B?QzdOVEdrVXJnSWxMbGlkZ2haQnNwZDlsczlhdWdKdVB4VW54Y2U1bmVIVnpC?=
 =?utf-8?B?VURKV1dGRFhhSHNiejBqZFlZU1JSOHBqM3BVRHFwVDRXOXJDN0htdGdXTzdB?=
 =?utf-8?B?ZXpkVEI2dkVqZWFHNG5nd1RNTUFoUFcxTThRaG1JcHA0VFRRUlhlNmxFVDNR?=
 =?utf-8?B?U0I5Y3BqdFQ3aXdLdmxYM0x0OG9qNmU4TlZ4TnNGaGlncitiZWl6YTdsWjIy?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ab4a43-16c3-4946-f3f9-08de2de1ce8d
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 18:21:39.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxasZkNxdTPQhs7LUbHBJY8cWABTWtEONLrntVGpKSrywAxki5pWeHn2IuU4+GJHY++6b9fVBSNLia0BXCWZFlndvRjt9EYXvvb94N4FJ9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH7PR03MB7786

On 27/11/2025 8:44 am, Jan Beulich wrote:
> On 26.11.2025 18:15, Andrew Cooper wrote:
>> The comment was adjusted by myself in commit 51bd4bbdfdba ("x86: drop
>> X86_FEATURE_3DNOW_ALT"), on the presumption that the underlying logic existed
>> for a good reason.
>>
>> Having done further archaeology, it turns out to be vestigial technical debt
>> from the leadup to Linux 2.4 in November 2000.
>>
>> Prior to "Massive cleanup of CPU detection and bug handling",
>> c->x86_capability was a single uint32_t containing cpuid(1).edx,
>> cpuid(0x80000001).edx, or a synthesis thereof.  X86_FEATURE_AMD3D was defined
>> as the top bit this single uint32_t.
>>
>> After "Massive cleanup of CPU detection and bug handling",
>> c->x86_capability became an array with AMD's extended feature leaf split
>> away from Intel's basic feature leaf.
>>
>> AMD doc #20734-G states that 3DNow is only enumerated in the extended
>> feature leaf, and that other vendors where using this bit too.  i.e. AMD
>> never produced a CPU which set bit 31 in the basic leaf, meaning that
>> there's nothing to clear out in the first place.
>>
>> This logic looks like it was relevant in the pre-"Massive cleanup" world
>> but ought to have been dropped when c->x86_capability was properly split.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> albeit I think that, along the lines of a comment I made on Matrix, that ...
>
>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -1131,13 +1131,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
>>  		wrmsrl(MSR_K8_HWCR, value);
>>  	}
>>  
>> -	/*
>> -	 * Some AMD CPUs duplicate the 3DNow bit in base and extended CPUID
>> -	 * leaves.  Unfortunately, this aliases PBE on Intel CPUs. Clobber the
>> -	 * alias, leaving 3DNow in the extended leaf.
>> -	 */
>> -	__clear_bit(X86_FEATURE_PBE, c->x86_capability);
> ... while the justification applies to what the CPUs surface on their own,
> the basic leaf masking MSR could (likely) still have undue bits set, and
> hence may want pruning in exchange / addition.

As said, the ability to control CPUID in this way postdates by a decade
this logic in Linux, and this logic came about because of a logical
issue/shortcut taken by Linux, not because of a CPU which really
mis-reported this bit.

We do have logic which adjusts the override MSRs on AMD based on errata.

~Andrew

