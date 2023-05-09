Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3FA6FC8FD
	for <lists+xen-devel@lfdr.de>; Tue,  9 May 2023 16:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.532246.828344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOKZ-0001iy-G5; Tue, 09 May 2023 14:28:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 532246.828344; Tue, 09 May 2023 14:28:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwOKZ-0001gH-Bu; Tue, 09 May 2023 14:28:43 +0000
Received: by outflank-mailman (input) for mailman id 532246;
 Tue, 09 May 2023 14:28:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S+Ht=A6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwOKY-0001g7-Ae
 for xen-devel@lists.xenproject.org; Tue, 09 May 2023 14:28:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2050.outbound.protection.outlook.com [40.107.7.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca5d7d86-ee75-11ed-8611-37d641c3527e;
 Tue, 09 May 2023 16:28:39 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8943.eurprd04.prod.outlook.com (2603:10a6:102:20e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 14:28:11 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 14:28:11 +0000
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
X-Inumbo-ID: ca5d7d86-ee75-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQDjRF/Cxw7ML6Ch8Ua5pDbmScLjmLUA7o6EHKRnr8YXDpAH2kLHEIF2mrdoeMEqTKBYolLNTpGYli7lYOmZ5cOqDX0e/Y1JhQWr40V4BIi7IowLwsYxZ3tzMdoloW6XMbWcenaJCzoRtLMCEjj7A3Th0gl13tsGLdMepeClKI0CcmB9h9/oxdqYUR6N2UjwrVnLSOn+PTwyiT0RD2bIyM8zni2EiBElnlZHE4DtBclNbpXuOLaZfM6HBJpZvdgSFztSEkrU9rVT5k1K5BGtYmiEIRpQlLnqyKS+upKl0Z83KekWkxCQqsk97eSvzOu60OrTlKUtWwpgZMS3KA3AhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pljH4mRZhaIosXef+zzUdjXC2LaBSHD20eiATYnOl3Y=;
 b=KNzSvf9bHZIutt2F8EUPPORaretEU0UhGOs4X7rlw26MOV2crnFo9hHnVLp+/9rlcPxxpi9BlflzTXBKdivv4sGwX0KyWxn7mguGuzNNp6DoffolU6IE+fGwx4jjJOeEB1XmIQK7QuDkrZHgFa2rXcbdGpFVCPrvStZ1gsZUXuNdYCcw0HAsjqbGQGIeGUfA1FDJ8ayg4kK1vSBvTxiz9LcUrpWyx8DXVqmeIGvFTecsAJFBtk0/dizyPEMPmR88PCKpCBfk+n9VGLDS4BvPKQscwiNCUkxgRCuChWUxaYLrVpZwUVqlgtRO+xNnB8QWl1j++oOJNCv+1u8uGdFktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pljH4mRZhaIosXef+zzUdjXC2LaBSHD20eiATYnOl3Y=;
 b=V8b/7CV4gFxIXizMScp2bmyYyc0LBY9DPVJPavCM0DxE79yeEEitRzH9B1K5j+Zzj+roJ78ClzRIZDRTlAkyiocniDf2FVi2tF0TJujHiTVdd69SQk2fRTfE2jZQk+PtJY8P9WU0bDtpCpSg7GzZcaMMNyH8NJFcTxIzTWIhtaizm+tZwLTLzNyArGLnfMopHAreitfh//VE/XJfEhGYdRJNNhxkfMghUFEj8EN7y6l36F75VX2wzRE3/3dFfS8V3EJ/ep/P5Ew991iCjaB5XfzEM5xuWIK8D7AHsAMseGx3Qyjmb8lX/AM/TPBAaoo528w7fZnrMQf8J3H3u6kxpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bbbd4c8b-e681-f785-b85c-474b380d6160@suse.com>
Date: Tue, 9 May 2023 16:28:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/6] x86/cpu-policy: Drop build time cross-checks of
 featureset sizes
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
 <20230504193924.3305496-2-andrew.cooper3@citrix.com>
 <6531df09-7f7f-a1e2-5993-bd2a14e22421@suse.com>
 <18090224-6838-8ed4-6be5-ae10a334e277@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18090224-6838-8ed4-6be5-ae10a334e277@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0230.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8943:EE_
X-MS-Office365-Filtering-Correlation-Id: b26aa67b-1559-4361-4acb-08db50999db7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OmkrM6cBglK+BzLlqLLfKLH1Q4+VOQrBZJ9+BEHDTYM709HtjDRVCQEaP5bQcCXlpyXBNUV1cCxJX3jSPUhsd4Gq4DWZuL/jjMaNHf/DhMLlMwAyb+o+/Q9b6RrUGZpj0vSDGGZrteX9Izry1qsM5+AsVvE86OUsvkVesdZNtGNNaih10WRvQhHo/OZdpwmJpKlHg7AoetC8vQtvQrxYFGD8gq8l9harjdoRDjUxP7BT0L4lPAJlWyKZRIOj5Kv5JwqnnzRVMKrtaC5xanhDAAHbV81jyPciBNUsgQmuBJbNAjIHEuTAOIuX030KYijmPN86Z4eX8230ckVxa/vmMHHdBYY6x+WwCtltVsQSpgL/ERsY/lYpdsG9ZnSA5RX0i29AJ2borGW0flTUq19QlY+iW+aDPuirUtGgBFdy0X75p/4AwpyiFGAi4dXubyTvoycNScrkRNZgdZSEQGquSlRt1upp9B+MfEjSXj6Dnp26zU3IGyO1jLTqwJQ+RH3FOuF2XBzPvw0DET8l6Su6OmgVGPLqrU30ODnK8+UW7q69aEBk1uU5+Yy6QUE+Hvt6AkC6d4zKtIp9OfPdb4R2h8EGobFs+98A7e+XCDtY48bxTNYt5ZSsPmUafHGWM0mbgOj0B/XM1CS9+LNyDQgLRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(36756003)(316002)(83380400001)(66946007)(66476007)(66556008)(4326008)(6916009)(478600001)(54906003)(2616005)(6506007)(6512007)(186003)(26005)(53546011)(2906002)(86362001)(31696002)(41300700001)(5660300002)(8936002)(8676002)(6486002)(38100700002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d1lpRWFtdzQyM3lUaTZELzJJeDB5eXl0RytnQVFvSVF3YmNkWVVMb0F2UzRX?=
 =?utf-8?B?Vkx3YXNkSGRZcDFVWWIxNk40MmdhVEFNcTVQQndKSnZrVjIxWVBsMG5SaWpR?=
 =?utf-8?B?U01PakRjdnBOY3BlTGhvNWdIam53b081bkFaY2hpbnVKTFd1cnFlSkprb0Nz?=
 =?utf-8?B?MHpHVXdJc3REdGkrOUd0eVVpL1RpQVFkME1nNmNVOFA5Y1ptWUQrZ3kwOTFv?=
 =?utf-8?B?MndmVW9vZW1ONHpNY0d3STF4WDNZZEJUZGJPaWlSaFd0cmU2SWpETjEvMGVX?=
 =?utf-8?B?ZStSeHkrT2lORXFmU2RUWG1mMmpTN3ErSFVGTDY2ZGZnSUpBeHU1U0xTaVpQ?=
 =?utf-8?B?cURsSWU5a3dFTTk2OUNuWGlpYzdpc2xKMzJiM3RaWmlhcm9mWURKNWplMllC?=
 =?utf-8?B?eWZPWnN1Tm4rRXpjem5hclp3bEhLTHNMK0g3UEFoYXpTSFN6OFZmREs2UlpV?=
 =?utf-8?B?QUh0Ynk4YnlCQmdZOU9sL215bkt6Z1B5Mi9iQ3RSWC9UMkN5dTRYK1VHU1h3?=
 =?utf-8?B?VXBVYXdWOHRuQU5KL2tURlpRUDdSYzJja2l4VHR4K1haYzJ5YXUwbWZ3VEFE?=
 =?utf-8?B?VlhXMTNsSmRScWh1VXpJaU1ObmV6WDJmSUR5SEV0T1RZdnNUZkJZMHhTZ2tJ?=
 =?utf-8?B?K0lSdnhoa0RxTDUyaWlCWjNNSlcyY2p6ekVlTkRLWkdEVk1HUTB0OG9wSnpP?=
 =?utf-8?B?L05KK1RQV0VXTFYvVVNDb0xsRGxMV0t3dXRGZDNicmdOS0xrU0Z6bmlHdjNi?=
 =?utf-8?B?VFRITS94NTR4R2pjN2xFL0NjUlpCTXBjWkZiMEpBMzZuRytvRExIQ2sxTGps?=
 =?utf-8?B?em9wVnluRlJGc2FkYUxVR1MzaDlweFlpUWJRMVJtcnBRK0doOVQyUWRHVHhC?=
 =?utf-8?B?dDVSMThETzNKTllBY09lYzhYTTlWMFhKbWFxY0I4WklIazJ1WmFaYWp6RzVp?=
 =?utf-8?B?TmZlYmJod21HRDBGY0Q5TEIrSzZqRjUrdkZ1VHRNbURvS2E3RnhrVXdWVXd2?=
 =?utf-8?B?ZDRXWFZHcVlIU05scXgxQjBkamQ3cEh6bWlibVhUYlJXMU9uS0NIUW9oMUpN?=
 =?utf-8?B?NjRnOTY4dzMvL1VOd3J5alJocGYwTHcxdndBNFk0YjJXdkQ3L082Zk4xeU9M?=
 =?utf-8?B?bCtrTDZSM20ycFRQbXRTVlN4ZklpbWFZQmNKYVBhVnV1RmtRUXZRSGZuT056?=
 =?utf-8?B?dExyQnY3Si94LzJkTElUVHI5dE81UEFxb3JZZFlaS2srYS9zN1RIR3Fjakta?=
 =?utf-8?B?L3p3SEplM2E2VUYvYjA4UkFBZWtSaVMrVnJKa3pkQ0gwWENpWTFqa0U1MVBT?=
 =?utf-8?B?VndGT1hPTGpXSXFiaW82Nk40QUtVNHNqeTNiTG5UeWRoZzJNdkFUdHpxNTQ3?=
 =?utf-8?B?TmtuWGFJS285MVVMZVFocEVJeHFGTEl1eDh0Skx4bTgwQVREQXVDRmZoQXdO?=
 =?utf-8?B?bVQrNzVhUTlQMTRya0ErODFCNldmVUtXZUZlQ3lCaGZ5Zk1jWmZUcjY4d0VJ?=
 =?utf-8?B?VWJWT2VVakdNbnhkRzJHSGlqYnVyYUkxam9DZzJ2c1cza0pWTC9YTzVJM2RP?=
 =?utf-8?B?TDRLRm1RMytmZjNuaWEraFlycmZtS3UrTUkwOWRQcnpHMjdxQk52aHQzY0tN?=
 =?utf-8?B?dXpWb2NnWllUSTJtTkdVeU0rTi9wQ2FsTEdYbk4vcGdOV003R3MzTWJ0b3pT?=
 =?utf-8?B?eGx4UmN4V3cxaWxBd295bnliUDhsc2tsMnBLbWZqb3dTUW1UcGhJNHBOMUwx?=
 =?utf-8?B?ekhEMXhpRHRsUEp5R0dOUERURW5nbzVWMHJidlE5UUhteTA4dzJobWpQbHJW?=
 =?utf-8?B?emhWSkFoYjRWVld4YzFhUFc1Vmh1ME5YcVhMeGZZTUF2RXRoYVI2OElmUmND?=
 =?utf-8?B?V3B5RFVoQVRORlU3MHJqRGV1ZlA0dCtYYUpZWGhKU2djZ29RU09GeHRHK002?=
 =?utf-8?B?VWp4ZU5hNGREVDJCYVVSSWtBOHU3RXg3bTYvWnVQNWlDL0pJQzFBUE96cldN?=
 =?utf-8?B?U1VoRXQ4M29Nc1lKUUlKblNEVUhjS2N4TGhBSUg2VGs2YTk4T1NXV1VDRFpr?=
 =?utf-8?B?T2R0c3lqQ3RqYUlKeGhzT1pnd05TVTJsNHdRM2hHZm9uakJjTzNIWmlBWTYw?=
 =?utf-8?Q?G6p9uw6SBPCGMz7qOyWqTB5I1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b26aa67b-1559-4361-4acb-08db50999db7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 14:28:11.1400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGsB2tO0agpJFXxd1kaaOu/bppvon3Iqwfosg1KEn5UD71n2IFdx6b94JUeC4QqhUKlmEOKxJVQvaZ+hJZBwDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8943

On 09.05.2023 15:04, Andrew Cooper wrote:
> On 08/05/2023 7:47 am, Jan Beulich wrote:
>> On 04.05.2023 21:39, Andrew Cooper wrote:
>>> These BUILD_BUG_ON()s exist to cover the curious absence of a diagnostic for
>>> code which looks like:
>>>
>>>   uint32_t foo[1] = { 1, 2, 3 };
>>>
>>> However, GCC 12 at least does now warn for this:
>>>
>>>   foo.c:1:24: error: excess elements in array initializer [-Werror]
>>>     884 | uint32_t foo[1] = { 1, 2, 3 };
>>>         |                        ^
>>>   foo.c:1:24: note: (near initialization for 'foo')
>> I'm pretty sure all gcc versions we support diagnose such cases. In turn
>> the arrays in question don't have explicit dimensions at their
>> definition sites, and hence they derive their dimensions from their
>> initializers. So the build-time-checks are about the arrays in fact
>> obtaining the right dimensions, i.e. the initializers being suitable.
>>
>> With the core part of the reasoning not being applicable, I'm afraid I
>> can't even say "okay with an adjusted description".
> 
> Now I'm extra confused.
> 
> I put those BUILD_BUG_ON()'s in because I was not getting a diagnostic
> when I was expecting one, and there was a bug in the original featureset
> work caused by this going wrong.
> 
> But godbolt seems to agree that even GCC 4.1 notices.
> 
> Maybe it was some other error (C file not seeing the header properly?)
> which disappeared across the upstream review?

Or maybe, by mistake, too few initializer fields? But what exactly it
was probably doesn't matter. If this patch is to stay (see below), some
different description will be needed anyway (or the change be folded
into the one actually invalidating those BUILD_BUG_ON()s).

> Either way, these aren't appropriate, and need deleting before patch 5,
> because the check is no longer valid when a featureset can be longer
> than the autogen length.

Well, they need deleting if we stick to the approach chosen there right
now. If we switched to my proposed alternative, they better would stay.

Jan

