Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD066DA8E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 11:05:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479294.743053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHipd-0002B1-3i; Tue, 17 Jan 2023 10:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479294.743053; Tue, 17 Jan 2023 10:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHipd-000286-0V; Tue, 17 Jan 2023 10:04:41 +0000
Received: by outflank-mailman (input) for mailman id 479294;
 Tue, 17 Jan 2023 10:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHipb-000280-9H
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 10:04:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59a23760-964e-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 11:04:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7880.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 10:04:35 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 10:04:35 +0000
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
X-Inumbo-ID: 59a23760-964e-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avxZnmcHN59KSNDwIO1cIZV5JUiJl6lkHNYrq3r6xCOz949gh8CWAshmAuWXxvWHKGr7EzelAPJZw2dN1igVmfmam7McCtuAvANJtnUyliSwUzn29w8oPupvnyERaJPRqAvbX9Jxm7tYAkHziKaAhCijxQNdn4V5Q1d2YfCBTZdD+m3Ct5/ikMFs1XHBcwkgHsijBJ/uvk5XUpyWBfEaZ4hhF/skApipXcuM30nzrfiMR0bYggc62hPndwDvYiH3gNMGaQi0hAvdbavSihE5vMp56Zn4GJm0L1bootyF69WwyaxLTjtYeklNqPqmB5VpjmvVUjAewa45Vsdro3nVRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOYL/pwjgxYdBPQJ9GXZrtMBPjHT5XydBbCvvp9E1TA=;
 b=P4RFG9YLTTT7rKFxCz85Ydwbxt1RUUikk/X+DKbo+Eu7xVl8VPp0IWi/ljf1NRc671shDD82w52U+f65HBrljkzhSl4MIupl2K4LUbEVDQeXMjoIPX+ZSYiD7zPTzhmhIVdcOOhdC/OuT6kpJbWgE3hqnIbVHmM3t5geIbEFm3LGt6GGhPBt6Pkq5zXJcMYvADBocMpPcmbseok6bMwYvrnSX9jGJz8So4vbgZp1hNtzpMk8hCV9Sb9vCsQdF5DF3UY00EnzuOYUctFUX4q8WPz3hKaflb331mWGeqKYu4zL5/xEeMk2yAkfokRNIXz0beWwkDjBAdrM3oDEe6nSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOYL/pwjgxYdBPQJ9GXZrtMBPjHT5XydBbCvvp9E1TA=;
 b=fZvhyJpRgo64CEUeHfR/rF/WoPpYQ/mFlKTwiS9dsppjjsC/PmTQurVgXn/5oGiJLASiQ6X9V5ijrw/eycVeAq8gp9ymlc2dA4Oa5i12MsjppShpLlIms39t2f/NdYYKb6FFFIT5AuC2jYORS24WCv7hu9SxenOEq1X8kNSUWTAkZA4GU7/fAKxbANgxnsCFicTMtmerVGrt3iutE/vstrFJlhz+5xVOjiCUpYDa/Q0DNX+mrTD15eM2dD+veK1C0WGYHWzuKLOZOIDosCew76mD8cyD8oFuAtZpZ39yT0uREvy3k4NKtWqA+YZSpolF1Xt51D/4no+71d66ctNx+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d871f9e2-5f00-1f0d-3297-0084d4a4af27@suse.com>
Date: Tue, 17 Jan 2023 11:04:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 1/4] xen/riscv: introduce asm/types.h header file
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
 <2ce57f95f8445a4880e0992668a48ffe7c2f9732.1673877778.git.oleksii.kurochko@gmail.com>
 <e00512a6-5d32-6dbf-4269-429532f8a852@suse.com>
 <87107d8945c9f1513c305d115f24f488b87e088b.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87107d8945c9f1513c305d115f24f488b87e088b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0125.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d76f08-ae31-42aa-1032-08daf8723c6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s/+4tX1D/4a9m2k7n7Ec21Ct8L43prYP1WuGt9jU2RgQjUKc4FiZk4B2qv342mpoVu9PGP3fq0LTtXOaXn0hw9u/EI8l7fqKTK/S7m1dRU682RSEWK5zhf507htjbqK8rKO/f5W2ciRveC1cikjgQKBpSIUnFOvH9z9dRMZNt6Xc9i/bwRmcoxymUZgs48HGmDOBD2XL1xsQCN8A2vXWoDcrI0ba5GjtdPdzLuCZ+X6FQmCLfwFFeZpnjAJ4tH+Lpq0EB7OVQMmBYpFEXHj+52J7aehrzHH1JV7Og2V4hHuNexSQOijF4gPTJmR/KWW0P8zi/xOK1OgO9A6zt6V9gHH1/I5Wu+2a1COLh2PQw8Efux+HhttlsBl4mzZkFPiRcWAkX5m/3BFDQ6f46tCNdbcJsQC51isdTyLVvgiEiZvZdf+mRp1KsC52H/H3NpGpE3xgi/8PecTzM47Et7CHeR2Ffxvu0+TfYCGOB57t/lFqe1oYxsqMCYd8J6U8aMCjF/JaLY7cQ5d54+QraBJ2uNphRvTTWe9Qci3ZAsrFyMkhcCjkPUN43ZT5hIFq8dzFkvW41NGXUuKELqI6gc26i612Nf3HZ8rtrBzoVGUElOhGpSSLywCFjVRHzEJKZ2Hpze2JGEpdDImsPA+4JLuQ1Z4/oL9rT/+5I/pMlFHv+aO8+T5ynZXLm49X6YDSJ271B5yZoUEcrJG5B/hkI5iMF2ODxKCqwwNbTnrSt5ZDXxU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(136003)(366004)(39860400002)(396003)(451199015)(36756003)(53546011)(86362001)(186003)(6916009)(4326008)(6512007)(8676002)(26005)(66556008)(41300700001)(66476007)(66946007)(2616005)(316002)(6506007)(31696002)(54906003)(478600001)(6486002)(2906002)(38100700002)(5660300002)(8936002)(66899015)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGhQSXd5d0krNnh4c2Q5WVRrL25paURTVGN6K2xQSFlCT3pVM3dmUytVemRU?=
 =?utf-8?B?bVp4algxL0I0eCtIeElWUkpGVmRoMlNkeGtzWDZlczYzdFRva0Z0ME4velNy?=
 =?utf-8?B?WGZNUERJV29BaHhYYlZpUWRnU0cvdTJPdzRyZ0EvTDZhWUFkOXU5eVlsNEYy?=
 =?utf-8?B?M2xFcFpOQURjUW1rQUttdm9hckZVVzR3RFFTMUZJc2RMZEJnbFF0MnhTM1hy?=
 =?utf-8?B?eUgyM1NobkRMTU03U3JQUGh2NGJTZ1ZPeE1ORGJlNXlSdUlnNjB5ZXBxRXRW?=
 =?utf-8?B?eFJ2UElsY0VNanJEU0x4blBodUZrVytNcElOSHBHd3lNOVM5SGVOWjJ3NjN2?=
 =?utf-8?B?aG9GTXJVMmxRNXdZRlBUM29Rc1RMUnVMZWVIekM5aloyRnIxaWdYTW9MT0cy?=
 =?utf-8?B?TVhMYnljK25ZQUJIYW52WTl5VlZGdU5zT25RdzRFOUdrclZWY3lrOEpETndv?=
 =?utf-8?B?UUNPK2xjQko4N2RrM3RHUXpabTlERTZ6MUFxV3NnbHRUcVlLTnNjcjl6Vjc3?=
 =?utf-8?B?d01GdTB4T2k0Sk1GOFRKSDVVeDRiRVRmbHhtYkcyandMbDNWQklkY3R5Rlh6?=
 =?utf-8?B?azBpQXQrS2Vtb0grS3ZBdHJRSHdEeFZkWkZKckRSMWY4RW12UnppTkxuUnJz?=
 =?utf-8?B?TEZHZTYvVVF0Yk14c2N1TFdveTlrRVVJbTVJa1RpbEhuWUlvOGNvYWpaT1Zj?=
 =?utf-8?B?dDdycGo5WHQxRitIaWRCSnJJdm5GY1JIZndTcVhEWEFtb2JJbDczQ3lhenFv?=
 =?utf-8?B?aVMzUTFiZStIalMzYi9waCsrVjJGeVlya0VBanZ3YjhNNDEyTzV2VGZmendW?=
 =?utf-8?B?aVlFNndFL1ZaK1U5NUY5MW9GOUh0aVpDWHV0Q1VPQ2gwb2NxME45Yy8xZ1NE?=
 =?utf-8?B?SGdSb3FBTU1XeUErL1hXbTlVWkE2NVRKZ042eW9FSnlMdDl0Mzk4R21qSXd3?=
 =?utf-8?B?MnNhZWRGaGNxZEZnTm5zMkRvRkc3YmFPVmJhWFduVE5TY08xbjlDRVc1KzQ5?=
 =?utf-8?B?RjZ1THZaS3YyNU04M0h6eGZWRFFySGYvWWtDSkQ5VFVDTmNPSW5uSlZTbml2?=
 =?utf-8?B?elFlOVZwNWNUQy80Y1liaGhiNXhsVFkwMXQ0Qlh0L1hnSGs5YzA1RENhZjF6?=
 =?utf-8?B?TzRzeDkzWjJrQktGMFZXb3VwRzVaS3JIVGhIdTFDUE5CSHYvK1hPR2xIMXA1?=
 =?utf-8?B?N2N2VTBPTmxxaXpXSzFvNlUyZURMRmc1REQyMk9qU1dUZGgwZWlNMGtkUGNi?=
 =?utf-8?B?TVV6NTdtZEU1QnlKWVRDSGV3UzNoaVQ5UFhnS3RsWEJWMDE5V3dkZTdGM0Fn?=
 =?utf-8?B?Y0JQckdiRk03eCtaQktQcE45RUNuUTFTcFFyaWV6dlk4VVcvcWlVVE5xL3VU?=
 =?utf-8?B?MVJVYlZFWW4zZDJydXhVZXhRNlZNb1hZT3EvOElFclhaQkwwUlFhTWp1UElD?=
 =?utf-8?B?enZPZ2ROa2xYWWFlc0s5TVpvTjgycXFnYytyT2FrSEtMSE9Zb1NOZFptQXJl?=
 =?utf-8?B?MUZsZ2Z2YlEyUkxYVXpVNzZIV1pScm9jUEt0MUFnb1R1VFMwditVSlBzRkIy?=
 =?utf-8?B?RnByTGxaYWsybjJHSFB4WDd4SGtUbkM4dk5xMlp3S2Q4NGsvMXdxbE92WVlJ?=
 =?utf-8?B?MUlvRkV6NEJQYUxnZ05hS25CWGtMeGxFVXBZaVNPL2IyRzhXbzdESTZRaVcz?=
 =?utf-8?B?RVhNSHB0VmJUbkFxUzZiTEpRYm5SZ1NWbE9kVXB4NDZrcG5yTmJsODdVUTRu?=
 =?utf-8?B?NVNBcE1JWGNrUnBxRWp4eHZIZDAwNSt0SXEzTHMrU0xTeU5mcGRsNENKemFS?=
 =?utf-8?B?ZGtPM0lhQS9yOGZFR2tJRVFiMmo3dTV5SXI4M1VxdFoyUUthNXdPcHdCdUk5?=
 =?utf-8?B?WW5zeTBIS0xiV1NweXlNKzRnL1ZmQjFQcHliSGFQOHB4S3p2Y3ErS0VkSFZ2?=
 =?utf-8?B?bzJXcXR5SWZiNkVEc3lOMDBCdEhCL2xmcHkyRFBVbnVZSk5yUnJ1YnpaN2l6?=
 =?utf-8?B?WmU4OStFRUpLRytQNEpuVXBXVDRNVHBBRWhCR1IydEZPSjlSQkxBSUo1cTZt?=
 =?utf-8?B?Sk1VMVJ2YVB3Zml6bXU3ZTNIN0xLSDc2UjNSQUZPZ1Iya2p6cFMramlHVEl6?=
 =?utf-8?Q?PUkk35mfWjkCgxZ9bIKiwh25F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d76f08-ae31-42aa-1032-08daf8723c6b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 10:04:35.1674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OidcHR8UMu/+KULvk1DXTMNhVEU0ou4OPvlRQuiKfOqnDKm/CkRSRLjOV1+oZu2ZINZEUVYQncuPGgDmiHdPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7880

On 17.01.2023 10:29, Oleksii wrote:
> On Mon, 2023-01-16 at 15:59 +0100, Jan Beulich wrote:
>> On 16.01.2023 15:39, Oleksii Kurochko wrote:
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>> Changes in V4:
>>>     - Clean up types in <asm/types.h> and remain only necessary.
>>>       The following types was removed as they are defined in
>>> <xen/types.h>:
>>>       {__|}{u|s}{8|16|32|64}
>>
>> For one you still typedef u32 and u64. And imo correctly so, until we
>> get around to move the definition basic types into xen/types.h. Plus
>> I can't see how things build for you: xen/types.h expects __{u,s}<N>
> It builds because nothing is used <xen/types.h> now so that's why I
> missed them but you are right __{u,s}<N> should be backed.
> It looks like {__,}{u,s}{8,16,32} are the same for all available in Xen
> architectures so probably can I move them to <xen/types.h> instead of
> remain them in <asm/types.h>?

This next step isn't quite as obvious, i.e. has room for being
contentious. In particular deriving fixed width types from C basic
types is setting us up for future problems (especially in the
context of RISC-V think of RV128). Therefore, if we touch and
generalize this, I'd like to sanitize things at the same time.

I'd then prefer to typedef {u,}int<N>_t by using either the "mode"
attribute (requiring us to settle on a prereq of there always being
8 bits per char) or the compiler supplied __{U,}INT<N>_TYPE__
(taking gcc 4.7 as a prereq; didn't check clang yet). Both would
allow {u,}int64_t to also be put in the common header. Yet if e.g.
a prereq assumption faced opposition, some other approach would
need to be found. Plus using either of the named approaches has
issues with the printf() format specifiers, for which I'm yet to
figure out a solution (or maybe someone else knows a good way to
deal with that; using compiler provided headers isn't an option
afaict, as gcc provides stdint.h but not inttypes.h, but maybe
glibc's simplistic approach is good enough - they're targeting
far more architectures than we do and get away with that).

Jan

