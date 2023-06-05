Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E167226E8
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 15:08:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543711.848909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q69wW-0001Gf-5I; Mon, 05 Jun 2023 13:08:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543711.848909; Mon, 05 Jun 2023 13:08:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q69wW-0001EH-27; Mon, 05 Jun 2023 13:08:16 +0000
Received: by outflank-mailman (input) for mailman id 543711;
 Mon, 05 Jun 2023 13:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q69wU-0001EB-HX
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 13:08:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 061ba0e1-03a2-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 15:08:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8712.eurprd04.prod.outlook.com (2603:10a6:10:2df::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 13:08:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 13:08:09 +0000
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
X-Inumbo-ID: 061ba0e1-03a2-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESQdP8tA3dvkqHZlC2+C/3RrlJUpXMh5/6Tab6q9SKwIxiWr9AuU0UC8i0bYRKYUZFYblqBMfqSwZ+E/kRUVHGKIXFrVFiSxuK6JEs3yJeqGH8g9/Tmtjt/tpas2SEoMccfvPiMCDXpOQPKYH4Irf5QVw2fPmabJuj1rYZxQgTV4WiTzFCiu2/2MnHikLwSDkw3FosOQcafZBRxx1ChGmMqCCkjZPeToGOjbxhu74QKAWs0NtnbV93eOjYYbnFuJwOLaUgSDB8XT1Pi6dSpq+OzgTZiJkVGbnUAfSLlajTS/JIxp9q1MeEXCO+HYL7Wv5ENgb/1GOA84bLQZGPtV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuk1bhs/EnaYmeIu/QE2LxWdhWRLyqzVl/kK7/rIUck=;
 b=e2ck8m3aDJh86fBRf5Dd06qL67eSP/mAw24pQwYA+yQJBOucCFT/7viqpep5f/jP53vKY5RVBJ/FOB4Q68nE7NCLKl36vLEeKG4PuFhcMpA2A5aZ0utSLKa7pJsbXaKCxnZeNZGo/qakVavkF/ZAwBAHoYRgdDfY37x8gHOGtxG+0oP+NfcUm+/ioPmMtM/eWhVuAAwSF5PhH6oWmsEi6HGfekfad0au3ok0Z66JOZnsFPe4c6Cx/Fdzq/eLqwkA4GYmJtsYvetpAFPV3Eef8TxvKlUqv7mqps5c8ICIWMxu69GWNXb8xlXOEAQyXcDxTLVsobmKxk5u2CJrIdbrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuk1bhs/EnaYmeIu/QE2LxWdhWRLyqzVl/kK7/rIUck=;
 b=33Vfjil+hocP+ZwsL7pNY4ic5DfxLvCx6FJHkj+We1RYqa/fT+lXlXkh2pgkrZp7f4MXkm4r/Gpj5mYBrhkZiPV4XbHxPKd5s8d3ClvUKZwzDfpeNmgHMdJMggWiqYHleTBA2xEfxhYTsq6KIRTQ1m+5wyY6M0dUeaV6g8pcK93GiDDM1cnLHE5/nxCEjioHiOadXQEU6wSRkr+Zggr9tPF986BlYMhO6fmJ65HcVmTqWOEcaxDabkmj8Vr4Y9jP2RVDTQ8zyNIhapB1i/i60ANkJFHviCEe9W3S23hnht2zwlPVH5Gt0lJB5WDZBKwPauDwmPs21l+Mgg42pm24cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd67e5ba-0113-5cff-f3d0-f6eac2cdbe59@suse.com>
Date: Mon, 5 Jun 2023 15:08:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 10/10] x86emul: AVX512-FP16 testing
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
 <bf8fa747-d2df-8340-5f7c-6b29ef3bb543@suse.com>
In-Reply-To: <bf8fa747-d2df-8340-5f7c-6b29ef3bb543@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a0fdc16-e00c-4d06-b17d-08db65c5e8f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jywYzQmq9EUoOmyUp/kjkYCSjXEDSy1pf80jWjWyd+/s1Ebv+2TC6rB6RMLB+lntBVduIRfZzcFAMHZ5CbGuofDGuqNHKCfwtv4gmYrqHK2JtJwA4b6mW505ZpgnuaRiuftzPVcvopj6N1aeLBMzhZenC8BhfSZvgpBZq3qW4kU5UQV6TvXNSkGeJZVs1wbl/Po1WG+DzzHviVSMOV56O43kbx80oUVSQRI9cXzmYxw2uqTaYTNjH8DNT7ztKAthhIc8mjUma8hlnG8lx0H9TgQJqt1P3hhWItM0aQX2LyoFfd813+8jDflKhZQHVeYu89h0aX+mLwxVFHAHQzwOsvo/xzHO7Q3s5YLy6cb//yzlNCrIb6uarzyN8DtXM+PHMdwkEp0CAmSutOzUDXuJrBPKPhCq46Gv2TE15M6wWrhPmfOagtfWBIvqjwDRg5OXnBe13dPa0tyV92CB2e4p1UiPLMqOHNJyopk3vKgpXl4miTxBDImbzU86D9mqJ2tnbKCaMDN4TBgTlnt0hui/MPN2LsxBLB3hh/yi8Pcmjb+p8QnfO5RijO0cEs9nVlpspwNH38pcdzPOQLIULhLCiWUbLwdQZS5FI/QoXPNzlt2u6uio2g4gUrzGHsIZOmsUh2asV9cWEiNEjqjXU9Um5w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(39850400004)(346002)(136003)(451199021)(53546011)(6512007)(6506007)(38100700002)(2616005)(41300700001)(31686004)(6486002)(186003)(26005)(83380400001)(478600001)(54906003)(4326008)(66476007)(66556008)(6916009)(316002)(66946007)(8936002)(8676002)(5660300002)(2906002)(4001150100001)(31696002)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG9YSGg0Rmxsc2tsNWQxRG13Q3FEbWVDT1REVkhXOGUyWENtaXpoYWZBVmZN?=
 =?utf-8?B?YTBnL05CM1ZXQWdBdUQxRUVvRnBTQjVHOUdZaWcwY2ZLUmszMkt1dFhUVHJT?=
 =?utf-8?B?Z3hFcmhoVG5Sa25BUktJZVhVYTlnY0hPU3Y5L3pwTCtSdU81K2pDRFVTakJJ?=
 =?utf-8?B?dGVZQ2Y5MnRscGFhdFR5RnJaek1UNEhJK0VycFdSMzJNa29QN3RFVjJoTE5T?=
 =?utf-8?B?M1g0R3RkN2UyTDlUZU9YL0ZkWVdqYkNCT2xpSDZTMTVnamp3S0JVMTZvNHNE?=
 =?utf-8?B?L2JuK3h4K3V3T2cwSkVXbEd1Nktzb0ozZFFhR01zSmUxVzBCZkhYWEc0TW4w?=
 =?utf-8?B?MTZONCsvL2ZFMEcyYmwyeFdCS3JGVUc1SVg5VWVNcGtFV2NiRDVMbGdLNjQv?=
 =?utf-8?B?QTIwRmNJYmNSY2Z1N2ozNWErb1UvQTJZMFcrMWUwZlNzWjhqZzVLMTAzOXdJ?=
 =?utf-8?B?RzlqN1dEOFZiRFNwTmE4emdxVVlmeWJGdGZJSldoYUtxZUxtRkNiMjlEYnZO?=
 =?utf-8?B?a0JUUTc5UGZBK04zZ3pIK1dlSHhaRUhueXI5eEViZUpONTdZdHQ2c1dIMDRK?=
 =?utf-8?B?S2VqVTBQWC9qN2ZFQjRXL201b1BTUDBuYjlRLy9ZMXBjS0V1aW00cHdwdzY5?=
 =?utf-8?B?Z1ZDMjFtTk1RL2tiZDg5eUNkV2VZTm5ETlVGd0ZLL2t3VHhQNGZLakZpNUVq?=
 =?utf-8?B?TURDZkgwVWFHWnJsK0xVZllTQm94RVlsZ3VHK0ZvRU5ubWR5T01EWDRqWndm?=
 =?utf-8?B?Z2dFbVBWU1pnSjRwb01uQjRZQkQ5KzU0Y29ISHRIbW5FQzY1V1o1U2Nuai9B?=
 =?utf-8?B?RmFTdGVKYlppai9paG9VaUpHTzZTTit1RVBweHdic0hwYW5xZ1FBWENQVHhP?=
 =?utf-8?B?ei9wbmd3TlQ2YmgwdTJ1bitDL0FJaVNmR2pCaEtKSWJCUGllNFo5c1BWVzdR?=
 =?utf-8?B?dFB0TUs0UzlIdWN6blhHK0F5SkpqT1F0eTU5TG0rV0ttOTIwVU5oZEFHVVRv?=
 =?utf-8?B?OHNCdHVMV1ZTMDduVU43K2tTOWNrR0pIbVhRSDlRdW4yck9VTWl1TTVRcC9W?=
 =?utf-8?B?dm5oM29jaU1mRDVPVGt1R24yblZaMFdpaGJ6VjljUUtjNmJ5K2NIVDUyLzlF?=
 =?utf-8?B?UHZNc0xFa3pNUXdBTFA4dTF6emNNNTB0MVBwZ1MyQ3h1akE4b1BSWU1kNkhy?=
 =?utf-8?B?Wi9MTElUU24rd21QYms2MEVSdjkzTS9KQjRnUHdwNFcrd1lLQzArZVJkaVdK?=
 =?utf-8?B?dVVCRDlaL1RQWE1ud00ycWJTRFdNeVFoZ3p4VlpmUk5XQWwvY084Z1hsUU05?=
 =?utf-8?B?UVR5Vk9kWHBhb3RGa0FjejJ2WlU0VzNlKzNkb0RxREpWTHZUSUt1Nk1ib2lX?=
 =?utf-8?B?ZFhMMkZsVGZ2ZUxkdFhFc255Y3MxTWpLZDdRVGdGLzFuWFZyUmNIQk5acVFN?=
 =?utf-8?B?M0F2TTc3cFFXVExBYXFPVVdzV3pRMmJEOWh3ZUhaU0tFQ3BDSUVlSmErRS9X?=
 =?utf-8?B?S3lOd29HbDhmZzBDUjF0b3pzRDhUQ3dSYzJEUVlQclE1Q3UwM3YxNXB0Rk8y?=
 =?utf-8?B?bTFSN251V3VCZDZrZVk0eGVuYnpUU2JncnVERjFrYlNRaWx2REJoYW43Qzli?=
 =?utf-8?B?M3FYMU8vdThFMlFvZG9KOXlFL1Q1djhTMmxuMWg1N2xtdHh1Q1ZhUjRsMFhk?=
 =?utf-8?B?RFptbGswd29GdC9sZW56YWIyKzFJc2xTZmsvRk9TcWFRSFN5Y2NzcytmNksr?=
 =?utf-8?B?bFBPNUZxS3ljNHBITlo0RUQ5Q3FoQWVuRWZZZWlucXQ4d2czT2Z1a1dhUEVs?=
 =?utf-8?B?SE1DM2hCeWd6M3Z0aUFhd0lCYjJSa20zNXU0ZUdNWFUyZ1FkaXlyeVZuSWJ0?=
 =?utf-8?B?anBmYklMLzR2MjlrekVqS2dyRjlteGNHam9vYVJ0Q2pmNmZNWk1oZWpnVlJV?=
 =?utf-8?B?MWZ2cVFRT0pEamFMbTdaV2ZYYU5IRkkzeThUVkEwdUxPYjJ4V2lycThCelFt?=
 =?utf-8?B?YTdlcDJxTHFTU0RxS1dXU3ppSy9YWVl1bldrTFptdEJYeitRUXlZUU5sck5F?=
 =?utf-8?B?cUZlTldGWC9FSzZwVTMyMXhzTnlXM3EyMkI0aDBTVlJmekNXcDNSejd1SzFL?=
 =?utf-8?Q?2cIPQSEGxT8Rg378fzqDHZjVF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0fdc16-e00c-4d06-b17d-08db65c5e8f9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 13:08:09.7339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOsqtQWrGl7TKN5JcHC4Dmq75Do1kPxoNn0bTkb10mgWVSn95ZIAq+iZpHIxwJFPKn4AsUrLBHf1CNG9/jEbaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8712

Henry,

On 03.04.2023 17:00, Jan Beulich wrote:
> Naming of some of the builtins isn't fully consistent with that of pre-
> existing ones, so there's a need for a new BR2() wrapper macro.
> 
> With the tests providing some proof of proper functioning of the
> emulator code also enable use of the feature by guests, as there's no
> other infrastructure involved in enabling this ISA extension.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Add CHANGELOG.md entry.

I notice I forgot to Cc you on this submission, with said addition.
May I ask for your ack (or otherwise), please?

Thanks, Jan

> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,7 @@ The format is based on [Keep a Changelog
>     - Bus-lock detection, used by Xen to mitigate (by rate-limiting) the system
>       wide impact of a guest misusing atomic instructions.
>   - xl/libxl can customize SMBIOS strings for HVM guests.
> + - x86 AVX512-FP16
>  
>  ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
>  
>[...]


