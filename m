Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAE87725E1
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578435.905934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0Nr-00007M-Tu; Mon, 07 Aug 2023 13:34:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578435.905934; Mon, 07 Aug 2023 13:34:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0Nr-0008WU-Qg; Mon, 07 Aug 2023 13:34:55 +0000
Received: by outflank-mailman (input) for mailman id 578435;
 Mon, 07 Aug 2023 13:34:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Szp=DY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qT0Nq-0008WO-98
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:34:54 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fb393b0-3527-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 15:34:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8430.eurprd04.prod.outlook.com (2603:10a6:10:24f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:34:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 13:34:50 +0000
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
X-Inumbo-ID: 2fb393b0-3527-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HaRD8f9dvnihAT1d5wB0L3W/5S6n0x9kFVuKr8SlOlya24vyGtMqM7OT32tD/YxVEqLYjxnyYMQpCvc3WHmW+9OHRED5H/NDnV7BrtJFY3TJP1yYWSqWXfAtGlwl5/4JR7/8zDhswsX3CHNj30aueY7ar64/P6Iiohgy1nafA1r6sXw+1ZiWNjal5Q1APsZw6pceNxkmxJDLiYpOHYMv1392X+4kW5jLnPOQy0bIwamwrzEG5rLfRN1mvKyu5JrBmAJdmkG8+3p58SVgqfCBuKFocl4NG8eTF/03NukvTlC/mTOWQ+ZyWVrMtdSqZEBjM+SRrDIfLZxHoeaUuTeBZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuR/yXzgObQkOkfjqMqrl7fUw83LDbISQvnngw+mSLg=;
 b=kwkpcuRzKZR+QHiAK39uX9xRrU9f2OSMCRne4ggG3szQ1+nZjmx1wEaBTAI7qb0xQcxhXfvSMF5FFbr+Raj7DyEFmDXcqYeV3y7rRFeEoFV/TG6cAkuF01fWQ5pm7nQVjo673drx2NG5Cgs0Y7SWkosN5ZKQrZFEkdPgO871tZewGXogufuyhOaCSzgZZxt2iTBXoCh9OPOmSFR4Qnog7AjCcIZNRRSIrTMh9DBiv0Ks/OodNraQQy7LL0nBTsUXYFPORF8jRn6h3DZazXNva8SV/SxLr5MS8slxTFj1+PNC/+tmX54H1x4wmUQEahu4Uhz5y4cAb6H84IsoDZJ+Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tuR/yXzgObQkOkfjqMqrl7fUw83LDbISQvnngw+mSLg=;
 b=Hvni0r5UBgnK9lBPLOnmYZcdIPLLnDTwi7IdY+P6I10ixa6C28ElntYeakWsueKDqtgnT0mpAuc2sJDMEUwksvEli/FVZAxeIjSErr8vNgXfzT2ZoZdqVFwrvAxOg22ONFfelKRo1wIMk9rIOtzyF3hgOqlZ7SYpUj8065Wu3HWGpR0TrYCypfd2PsKfflIcfQfcbS0RMECmtAlAjIVs7Wq05ehIvbyrUouA8kGLIsEhjZMr79ps6ISSJxIVAzn8w+q78kO0Fvp823NyT77EcvpiQiW6I7bt6sM3akgaBIMG0TZT4/KH5KeBmsKWutaDefzgeCJv1Q914a/LiyA6zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04e7a7a4-8926-9e5b-c872-caba8d43d563@suse.com>
Date: Mon, 7 Aug 2023 15:34:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] x86: Drop opt_pku entirely
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230620174704.3907275-1-andrew.cooper3@citrix.com>
 <3daf5b51-cf5f-b9c7-b02e-0db5b48aa03f@suse.com>
 <6a22f4d7-e0f6-67f5-ba44-af0a07523c4e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a22f4d7-e0f6-67f5-ba44-af0a07523c4e@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::9) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 39886cf3-8446-4af0-ebe4-08db974b12e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yyii2OTmfXEfBI3MKKjK/XessFAVJKaRrzNrfgBOScyaUt8E39oMJNkznosmtWmn1OJ6OXk+VcnVwiYufAamLzJ3fU0fkWUGwuWotCu/UNc3PFdlPHVRNBLT+8tmWyTETjzYlhBjDM6M+AtswNO1gCsUY3dp+pbM4DA0WtSXstcHMKqRe0Pn0dBDOuWPit0gDl7NU7GmucpgYhp07exMvnOD+VLxaQ1sILTyvgz/+yWdjwou+EKUaHwKjLRRpkVXeof0JrReShQ9yfGeNgwwEy68fnvKj5UDSjNtQ+gYEV+8GW9rR3P/4WBHuxjAeF6r7tum2Zc45MydCLuOOYXCfrKH5bDjdi9jm6wshnJaOxiSzQvkt8vQQ2zYbqpT/fuqGuDKcvtljMDSGdw6xmYpTZPvGN3xYBF1/h30yAYMTcQbCwLjKIpwDu4Jbk0ULAxihwaz8q4w50YCyVE3CCSbCA8goLzdRHmWOlIBGfXhqpdv9YGgTZjjPtkfyysLwQbUyoRq8QpiupS/dUvMGImVDQy5Qy8q56bQ9d/uAWCCXMs0WjImMn3Hn1Qfs+FnG+C5L1q8N4AaH+AfiRdbwmhvs5232fukJAhCvRWF7bYW9Zk7v0bnYGbqL2+H2GnyyXt++vqPOOArEiwXuhXe/rxL0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(376002)(39860400002)(366004)(396003)(1800799003)(186006)(451199021)(41300700001)(26005)(2906002)(5660300002)(31686004)(83380400001)(8676002)(8936002)(2616005)(6916009)(86362001)(316002)(478600001)(31696002)(6506007)(53546011)(54906003)(38100700002)(6486002)(66476007)(66556008)(6666004)(66946007)(6512007)(4326008)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0hoNk1IRUtGSVVkK3VkZVdGcDNzaWtTS3cwdmxWQ2N3UEl3ZGVMYjdzUXZs?=
 =?utf-8?B?V0lmWUNqTXF5VTMxdnR6VHNNdnZzSHBaK2dHRmFuSjRrSENqWThZOHhyUUpa?=
 =?utf-8?B?UEhhWWxLYVF4YzBkRXFsZVI0bm11VEpqbFN2RG02UnpkektTemNvY3ZhNnhR?=
 =?utf-8?B?TGlKS1BheDUvVUVmREJlZFJNQzVCdmtjb2JaZlhEVmJ3Tk90RGhld2FXbkIx?=
 =?utf-8?B?UzZZQXFXZ3hnV2FyampueEVqOFFLbnN0WUJ3WU51UlQ3ZmJoUjM3c1NEN1Ez?=
 =?utf-8?B?dU9jdHg0c0srVFJVSkVXVVJIaDVEMjVwa2tUa0NCRWd5T3ViRkpJd2JJT0h2?=
 =?utf-8?B?eGJUZm1CNjFLenFBdy9raDVOeG1SQURSNEtQZW5zMWFpMmZFODFXb1ZMQnBa?=
 =?utf-8?B?dGR3SHhzdGZDVUFDVTBqMG8yOXBpUkZnZzF3OFd4RzdYb1RVQmZYWkg3TER6?=
 =?utf-8?B?SEpoUHB6Mm1yWk5mdHU1M1FSZzZhcXVoR2w4NU93clFFRzVIa3VhcDNyODRn?=
 =?utf-8?B?UncyZG91NTBlWHRzQUVsc2p6c0VTeWVkQzkyR0JKTStJU3RYbzg1Z3A4czhM?=
 =?utf-8?B?Y0Ewc08vak1VMEYwdG5TV0lSRmFDNmlZU1dha1ZBY3hCckxId3ZsYTVmK1o2?=
 =?utf-8?B?cTFSS2Z2enVHdHBGQmNHTEtldnZzNHdSZFlZenpHa2xIZ25ZK0t0SWFOcW5M?=
 =?utf-8?B?b0VvL2llcmxneU1OaXVOWXdLKzFUOGZaeFZ2TUR3OTdsRHk2b3VZZ1ZyWFNF?=
 =?utf-8?B?WlFXSGhYVHBEd0lJMGg4NytsSTlMRkJhQWQvc1ZoeGdVVFF1TS9ncGNTekQz?=
 =?utf-8?B?QmRhZ3ZjUnV3b3dlQzlybFFlWHBIeGNQMmZlN3BZV1ZDOGJleHBKL0R1NE9x?=
 =?utf-8?B?MkwvSG01bDl4cHBrSE12YzRaeXh1eDJqNXZUelRiK0hJU3AyYnZYRkl0OUZi?=
 =?utf-8?B?OURKb2pQMkJBUWdwdDNIM3VWUlNnV3ZQRHhYUEY1WDJENWxjVlFsUkZ0MWJH?=
 =?utf-8?B?WEhZTzJac1d5UWRMQXBnV2p6bzRuSi8zRC9MYUgyL0VsUmhFN1ZjRk5YQWpq?=
 =?utf-8?B?Q2RBRUQzWkcyM09WNmlpdnBYeWtVU3JxYmZBMWRvcEdBb0VNdy8xRURHMUZx?=
 =?utf-8?B?a2NRVUxKZ0wyVTdVWmYyNFFXMVZMZndSa2hhY0FVSkZjVG5KRVhYcnNRYWFu?=
 =?utf-8?B?MTJiYS9LdVdiRlE2OE9teU42VmhoSDBIS2tUTGFKQi9aOWF2ZVlTeDVrai8x?=
 =?utf-8?B?a3pJbkFPa1ZQRDZ4Vkk4TXdIY05RK3oyTUh3UTVsYUgxbXRMclBKbnhhVUNp?=
 =?utf-8?B?c0U2cnBqaTNlU0YzS2lheHJBTmJVbVBsakZYaXloN3U1VWxJVnVoam5hWGx5?=
 =?utf-8?B?SktNVVBvalFXeWJwMVZEUy9JUjRPODFYVnZlQlBkWml6OTFWcUVNN1pUcWg4?=
 =?utf-8?B?YStodUVuY08zYnJqNlZNZGJYVWVFSEFSMzBncVJva3JKNkt2T0VaV0FXRlpY?=
 =?utf-8?B?ZTlmblBWVE1TVlFQMFE1SnBJRWFDOStkemRxV3BFaU5qTFNDSFJ3Z05NVFVk?=
 =?utf-8?B?RVFzbVNIUmFTN2Fady9YYnVpZ0pnNmNDUy94dnA0WGdsbW80b0Y1RXlPNDI4?=
 =?utf-8?B?N3dSUWdoVDRsazFDTUVQUlE0SytpWkFsUVhBY2k4NlJIZTY3a21sSGJGc3FL?=
 =?utf-8?B?bFRuUGczK1lQcDh2U0MyeU1BaFdLY3VmUmMvbU51UG5zTkV2dHlYUVk0NXhL?=
 =?utf-8?B?eFBtbm1rWVpuRllBQk5ONktLVUZFcnZvQ2dDZHFWTmkzd1VVNUt0SjE5NnpY?=
 =?utf-8?B?M2QrT0E2MEhFVFgxOVo3TVZGZXZ4aEFwWEtNdGNCT3hrM3FTY1hlY1ZQMjl3?=
 =?utf-8?B?Y3Q2VnF5R1dkOHpObldhcGJNTXQxSXlVVFZvK2NyV0RlN0o5YStTamNaOERS?=
 =?utf-8?B?SkM2RHUxemUxLytUbmpPWTg5YUpGdk5oK2pXR01Zc3hRb21XdVpRZEtHQS9N?=
 =?utf-8?B?VnVNbmI1QndWVDloc25NNXVqdVQ4TGFiWEMxMjJrVkNMZkNEU0IraEpzRWZl?=
 =?utf-8?B?elZobXMxM0UzYllkVjRkaFp4M1RWSXpjNkZ4Y0lzdXR5bVg2SHY3ME5RVldS?=
 =?utf-8?Q?yL+BjDrm5fbEytCS58TUBQUJ6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39886cf3-8446-4af0-ebe4-08db974b12e7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:34:49.9845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKXzs0Sv7QWw9o6T1r0uMC2O7aodLvKPPug4gySWFsf7yR0lo07HEIx6jdKkwcvb7oZ4X+WgHv0IFKqzul2Qww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8430

On 07.08.2023 15:21, Andrew Cooper wrote:
> On 21/06/2023 8:37 am, Jan Beulich wrote:
>> On 20.06.2023 19:47, Andrew Cooper wrote:
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -25,6 +25,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>   - Add support for AVX512-FP16 on x86.
>>>   - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
>>>  
>>> +### Removed
>>> + - On x86, the "pku" command line option has been removed.  It has never
>>> +   behaved precisely as described, and redundant with "cpuid=no-pku".
>> Nit: Missing "was"?
> 
> Fixed
> 
>>
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1950,16 +1950,6 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
>>>  those not subject to XPTI (`no-xpti`). The feature is used only in case
>>>  INVPCID is supported and not disabled via `invpcid=false`.
>>>  
>>> -### pku (x86)
>>> -> `= <boolean>`
>>> -
>>> -> Default: `true`
>>> -
>>> -Flag to enable Memory Protection Keys.
>>> -
>>> -The protection-key feature provides an additional mechanism by which IA-32e
>>> -paging controls access to usermode addresses.
>>> -
>>>  ### ple_gap
>>>  > `= <integer>`
>> Elsewhere you said that we kind of imply that only the explicitly named
>> sub-options of cpuid= are supported. If that's the case (which could do
>> with saying more explicitly), you will want to add "pku" there in order
>> to not regress what is (deemed) supported.
> 
> I disagree.  I can say it was equivalent to X without X being an
> explicitly supported option.
> 
> PKU shouldn't be adjusted by either of these options; it should be
> controlled in the VM config file (if at all).  I'm unwilling to make any
> suggestion that this is supported.

Hmm, so you're suggesting "pku=" use was unsupported, too? If so, perhaps
worth adding the word "unsupported" to the CHANGELOG.md entry. At which
point I'm fine with no adjustment to cpuid= doc. And then also
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

