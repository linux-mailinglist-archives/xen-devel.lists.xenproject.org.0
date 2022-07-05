Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A56C566335
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 08:36:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360635.590035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8c9e-00007R-6x; Tue, 05 Jul 2022 06:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360635.590035; Tue, 05 Jul 2022 06:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8c9e-0008Vy-31; Tue, 05 Jul 2022 06:35:26 +0000
Received: by outflank-mailman (input) for mailman id 360635;
 Tue, 05 Jul 2022 06:35:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8c9c-0008Vs-Ja
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 06:35:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80053.outbound.protection.outlook.com [40.107.8.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4e973ca-fc2c-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 08:35:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS1PR04MB9383.eurprd04.prod.outlook.com (2603:10a6:20b:4d9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 06:35:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 06:35:20 +0000
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
X-Inumbo-ID: a4e973ca-fc2c-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnYv2f30HsSQvGl2YrCXOo9QGy7ObimnrLAZsJg6s+IbFATTuwf+P5BQTG2i7UJoq0sM5PhTV2hEY3xFnZ9tORByuhDBEqtTWeST+k7/1tyEI47k6O61u2OssU1i5+4RW3uFZx/Ory7vSa+Y5FLEweCyRKXHAdxaGXF1BoWpNh5liioamqIJ/WFF4XZW2/AhK9ZPHyzG+AjVy0VtWU3ows5x5NmgDaRqIar5ey2wJUj8VjsLBTLELpbKFK8pEr0w4zMwjLEmC+LXL6VhWQqkZVD2Zwv1SGO3ewLrdQMoodvUTFNejyVTLOAMVTnc3MwAVoOzoLHT2gr0lD7cl3DXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sp8abS3+tsf7nUJ/VYSeltBUMjhNqWJSycmerGV1wc=;
 b=EGBVv8Q3P6lVM+apHxQemUsjjD1DHC3s4w6u59hfdX4pyeCaL40QKY1SdxUqrSJuzveii6IlQQm6QLpf+nMvKIXjbgWnbjr26cw3Ptegi2czAuuUqSNUsw4y+kQx/Q9vrS8lWxmq2wEw+lSF0x7rovHtAFRxGJNRQk+m+hqtkZX8iS5Gg1OI+3dDB3AJZebmQCNqeX1WduvYflfc2zwTJyEctbsCRp70Qzfn2bV8JDSVflgKM3XHoefLna7PRINny+5RxRX3BcDBny7N26ZKzoDcULwbq66GmzkKkW2etds78c5+lblWyrKLo+b3wZqGdYv9Yg3PlXOBo32biCgRWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sp8abS3+tsf7nUJ/VYSeltBUMjhNqWJSycmerGV1wc=;
 b=EPmyLHVUWVSmowN+5C9VJjCMqaszCWto3CUBWwPaQcaAeFGE/J6cdtRIWZDbt44NpoVuqWLhvTFBkIAKrLrByR9aEyo8rg8sn/ZafY9iQmR/hIgue1Joo8gzLlAxLwv4ZJjetvG4GY5fvs+CIThrFjNNuL28K5638bUhb4ouOxUqA/mFoFbXQQvUUMfzTmwD5QSsn8TkqBMDYDj9Z3s9FtuLkJ3i34weTIlFuHkiouK+f+EHGNY734aYn1Orqycf8tfcKHyCO4YxTkYqj1Qvt1uAuUGsOGGULLzIZUO1NEdbmoEVV+v1pnofK/vh4W8rjcTTNpPd1OG9PafT8YZVYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7843fd16-d2bd-1280-3513-11bc590aa55f@suse.com>
Date: Tue, 5 Jul 2022 08:35:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] Xen: fix EFI stub wchar_t size warning of arm32
 building
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220705035405.1283032-1-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220705035405.1283032-1-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM7PR03CA0025.eurprd03.prod.outlook.com
 (2603:10a6:20b:130::35) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f8b6286-1074-4d20-39e8-08da5e50887e
X-MS-TrafficTypeDiagnostic: AS1PR04MB9383:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5SzbEusUXyLlwlSlkAGVPOtRLGaxUvUqG29qUR0gQolXk4y9SBlWyLt/vXTRwjZRRgKsoPeigTGMwPPanY6CTrh/MVy9o2REufp1hvz/IW7rLRYKD6zwMY3jIWBQtCsAGsuDySAmntAMsF11LSdPG6LmE8hWaY64tF2FSbDcR+QFNRJRqbrBrHnImzaIwtAeeBrb6TUPphM3FAnuaGHK56EYQRg3ROBMqNlfMVBU0Jotq9CY/T2KzwPcu5wnNScXGFZ14NM8IybaEI91qUif+0mTfh/VEoP6SxzntaeYcfxzcRsPm5OJsBYy0KvxGsXUOzfIVHoWxnt8cytt7a0u2ogChNi+19OD++D8pOVSqx4vd7mU+ltrj7g8QrajitiWwws5+2EwJYiOTI9T0IHY1GIAJHWDypiQwzwrrvAM2uib8EI1Gc44T5+9K7RSkFU0JYWRj4hb2+FwU5Cs0l52bCtC1LyWPyHY1rtkVaqclJADW6kg0FSTlPvFx/HC1kT2hzXNjsy5xwXTKAr6pvunZuxTkMQRANrMvreWmIM2MlM+GjuxzbkOlQj2v1+6twOVJGK/MX7dUXSZN1mzLqvDXhNFF9CuK8uAeBEFd15UScd/1Tbg1pHwxtwpYHcwbOTUtaSMieaLtsLSCghgVk3WSSNWjdq2Au/G7qS5npkiYSSQELb0c713SIgotqaBXKZZ52N8HG63dCvkPs1dq85gD0E7OwAe81xymkTbc87e+LUsDORTzRA29SyX6MW+Hfh/7bjvQHf9gs6VdCUMmFP4kSDJGBzMDzYYPKri1YXokV4myCb+n9PuTV3jaGe6qEolb2yId/4QM2CuIX12p6t999tnpqcQp3r6HK8jgz/rLXI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(39860400002)(376002)(136003)(8936002)(6486002)(5660300002)(478600001)(186003)(6506007)(26005)(86362001)(2616005)(53546011)(6512007)(2906002)(31696002)(41300700001)(38100700002)(6916009)(66556008)(4326008)(8676002)(66476007)(66946007)(316002)(36756003)(54906003)(31686004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z29pYnVLMjcydmkwMllMSzNJM3p0WlBIaCszeCtia2djei9TQUZ6L1ZCVzE3?=
 =?utf-8?B?eVRsQ3hMcURlREJrNlU1WWswcm9mdG5KMHlLcTB4VkZaMklSREp6eWtkYVll?=
 =?utf-8?B?QzF0VlRNUjNrbXhWUHVLYnc0VzR0TWZUVEtQT2ZoM0FxMFVoZVlUcUhjZS9V?=
 =?utf-8?B?ZklwMTdaUVJMc2hQQ0x2Z0UrVDgrZzlYdDFXVWVOTklZNVR5dDRMTWZ3QkJB?=
 =?utf-8?B?YVlNUE10ZXdVZzNWdk5kSlJ2U2FlU1ZnUnQrTVUvRmtlWTZiNFl3NVB2bTNN?=
 =?utf-8?B?OXhmTkp1TUcrVjRNdUdnek9tZzY2U0c4Q0hGenJWTkNvbVp4UG9ZMVVPQjRE?=
 =?utf-8?B?b2RJcUlnU01wZk9CRnlqNnJYams2Znd0Tk5rUmovU3JLYnJQSXV0UERvMjNv?=
 =?utf-8?B?YmdDMklwMW5RcEV4OFpOMzcvM2Mya0hlOW9aOFo1WWJwQ0c5TEJjeFN3bkRp?=
 =?utf-8?B?dkQ4YmxlRWlDd2I5SWExWmNjZFBXcFo1aDFWUHVMRGs1bktIejNrVmRhSGxk?=
 =?utf-8?B?a0pRN3I4YzBETUhpZjhYMEEwNCtHbnV0Vm4wNW55ZzVFNXYxQkI2aUV1aTE3?=
 =?utf-8?B?ekg3ckpHRzBXVi9uejBZUGNCOHlzMmp6V2kvdEFPVHRTTXMzaFp2RkQ1MTlt?=
 =?utf-8?B?UExXQnNFMTQ3ajM3K3NmSU1UeFBvN3RYMW9hMG9OZTNXSXZzMDJyViswYnZQ?=
 =?utf-8?B?blNmN0MzYXFlQWdVWW1GcUJrVmJRd2JQOUNHbUg0ZTA3WDJmakpXZEQxUW1n?=
 =?utf-8?B?akVUS2FWdC9yYzVaRmttcEZFMkQ5YXZkMUdPWWg5WlFrOG1qOWlLKzNsVlJy?=
 =?utf-8?B?Y0M2ak9PY1lPSW9EeGhGMjZUdzRvUUdhRzFCQVFCbEJCTVIrZDRCQ01ZbmE4?=
 =?utf-8?B?YmdwOE9YbjdZTWVPMmx2VkoxSjYzQlJxOWNtMWZnRy9VV3B4NHRlY2hhbUVI?=
 =?utf-8?B?bDZya1JTQmVHaXpGTWJTdnl4RWZTOGowTnRqTUE5em9sanViOWFJNytWYldG?=
 =?utf-8?B?UThuOG14LzQ0RXA1cTgrNW5xSXBqT0J6azZWZ2lmL3hvek5rd0NZRk5reUxj?=
 =?utf-8?B?M2FYUjBCQkZIQXpubW1GZnBBdURjb20rQXNYbkhCZXF6YlBuQzFhV2E1RmJE?=
 =?utf-8?B?UUtMT2t5cm1RcXJKQ1FNTEhNTkJ2LzBOdTVzVXM0Qnd4b0hCSGVwN0FIbm84?=
 =?utf-8?B?aDlZaXNUVHZCaitWVDJuZFVtaTRrTFFseGVoY2oyYVg1K1V2b3FtVWJaYVRq?=
 =?utf-8?B?TDZycXhuckMvOFBveUIzRko0clJaQVgxMkZQYXgrbGNyZ3RsWGNzWkl5MWdE?=
 =?utf-8?B?ZU1jVnMwR3ZFN2cyMnJPNUxBem5pWWRnUDlzeVVvYUljTHYyeDltVG9uVUVD?=
 =?utf-8?B?QXZZWnB4QXA0aWdGUGVHUUNHdHpiMzBYa3NnTm5mV1NZTC9IL1Y1bmR1YlY4?=
 =?utf-8?B?d1BhYS8wWmVicCtEMDFLQ01yd3BmMjY2bitqOFl4eG1vT2Jlb25MREE4ZGp5?=
 =?utf-8?B?ZXRzOVNKRms2TzNhL1dtcW1ZNGx4YnNORWs4WlRCRUlHOWE0b2MzTmNReTN6?=
 =?utf-8?B?WGgzMlEwcmx3YXREWjdHbkNkSmRHZE9ZRVdRc1ZTb2JKYlBzblRNemxucTZS?=
 =?utf-8?B?UmtSaDVlekdUZ2srOHoxaG5QQ2tsRXZMb2p1ZHE2UmhEWUNQTmRNUnMzbXBm?=
 =?utf-8?B?Y2FDZWpNaEFrWlMwWWVxQUVodSt3VHZiRWJPamZwbmlXbGZteFdLTUtldlM2?=
 =?utf-8?B?ZlE4NnhHaUxwTTB4YkNNNVB0T3NvRDkwTDJrN2lnNUllVkV4RTZ5bVp0NkpD?=
 =?utf-8?B?WWNWRC83SjdOL2d6Vm5EREl1bHRKdnFGOXFGTGRBNVQ5dFVtVFVJaUNZNDJU?=
 =?utf-8?B?eDV0WnlwSjEwOFlaaVNRTEVCQWJWZ0J0ZHMveDZVNTIvS0pOOEdWU3BwQldC?=
 =?utf-8?B?WnVIc3lTSnRFbC9ZUWJpeTB2eVkvRWpNK2VVNStGOUdPdU1BRVM2NiswR3My?=
 =?utf-8?B?aTIvcWtpdXJqYkRkZ0ZuOGI2TnEwMTRnTlJHN3JUV29lQ2pLeHpFd2lDcDhH?=
 =?utf-8?B?Qm1qb1B0T2VrZlYramthVmRORVdES1Q2NGhwNUJNZmZ3M0RsZDVCK0E3TkhK?=
 =?utf-8?Q?LQ9y3pnOnr7bnJv70EiI9v50Z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8b6286-1074-4d20-39e8-08da5e50887e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 06:35:20.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwQ5Eov9rZi5p/eK69xiHoSQ0ukZMMMDb35GpS/8lzqVfXZeXh1EFByRrzbTwv1nt6Ki2NHdc67Lniq20m56Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9383

On 05.07.2022 05:54, Wei Chen wrote:
> Xen uses "-fshort-wchar" in CFLAGS for EFI common code. Arm32
> is using stub.c of EFI common code for EFI stub functions. But
> "-fshort-wchar" CFLAG will cause a warning when build stub.c
> for Arm32:
> "arm-linux-gnueabihf-ld: warning: arch/arm/efi/built_in.o uses
> 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of
> wchar_t values across objects may fail"
> 
> This is because the "-fshort-wchar" flag causes GCC to generate
> code that is not binary compatible with code generated without
> that flag. Why this warning hasn't been triggered in Arm64 is
> because Arm64 does not use wchar type directly in any code for
> parameters, variables and return values. And in EFI code, wchar
> has been replaced by CHAR16 (the UEFI "abstraction" of wchar_t).
> CHAR16 has been specified as unsigned short type in typedef, the
> "-fshort-wchar" flag will not affect CHAR16. So Arm64 object
> files are exactly the same with "-fshort-wchar" and without
> "-fshort-wchar".
> 
> We are also not using wchar in Arm32 codes, but Arm32 will embed
> ABI information in ".ARM.attributes" section. This section stores
> some object file attributes, like ABI version, CPU arch and etc.
> And wchar size is described in this section by "Tag_ABI_PCS_wchar_t"
> too. Tag_ABI_PCS_wchar_t is 2 for object files with "-fshort-wchar",
> but for object files without "-fshort-wchar" is 4. Arm32 GCC
> ld will check this tag, and throw above warning when it finds
> the object files have different Tag_ABI_PCS_wchar_t values.
> 
> As gnu-efi-3.0 use the GCC option "-fshort-wchar" to force wchar
> to use short integers (2 bytes) instead of integers (4 bytes).
> So keep "-fshort-wchar" for Xen EFI code is reasonable. In this
> patch, we add "-fno-short-wchar" to override "-fshort-wchar" for Arm
> architecutres without EFI enabled to remove above warning.
> 
> Reported-and-Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Tested-by: Jan Beulich <jbeulich@suse.com>

As to the description: Why the reference to gnu-efi? I don't think
it matters how they build their code? All that's important is what
we do, I suppose.

As to the title: I think the prefix would better be Arm32: (or
alike). Hence how about "Arm32: avoid EFI stub wchar_t size linker
warning"?

Preferably with respective adjustments also:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

