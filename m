Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41AF757BCE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 14:29:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565166.883074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLjot-0007vv-Aq; Tue, 18 Jul 2023 12:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565166.883074; Tue, 18 Jul 2023 12:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLjot-0007tC-7q; Tue, 18 Jul 2023 12:28:47 +0000
Received: by outflank-mailman (input) for mailman id 565166;
 Tue, 18 Jul 2023 12:28:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g6ux=DE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qLjor-0007sb-6T
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 12:28:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1d75d80-2566-11ee-8611-37d641c3527e;
 Tue, 18 Jul 2023 14:28:43 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6824.eurprd04.prod.outlook.com (2603:10a6:20b:10e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Tue, 18 Jul
 2023 12:28:40 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 12:28:40 +0000
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
X-Inumbo-ID: a1d75d80-2566-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0xJj81S/j8On/MwJ7FfTXURIHQziS38iCRVPTZnBO2SUm9xbuTOEEqH/kM1odAbhlNuSrkuEkz7QKq1w1m9Kab/OPIFXeEPCIWKwVhRdM2r6BXxFTnEkIbxk94/AxFvDKFjEZMmgI9kC+g+RHVc/1hdwXlHjdux75B6p8aGFWfSL5x9WAz28MTzQzS016mqq6pWYuYOPSS8+hU5krDHArQovM/tVdv9jfucYhya08DWpFrku0yGbt5vvbVcGhkm+cLrNVi9aOJjep8BQprLwqKC5aJdaSLrdO4Tgg7cK71xFvsajii5pXlUhCZOuYN9q97mmckn6hD+FVh9oeI+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8bPWAHfb+LPyIbI/ckJfh9FRrzz4ViytW7wCxnj1PM=;
 b=d3hDoItIc84Gevsc+qmzzXOCSn9nCq06KY2kbJP3BbBKzYUdUwKcJNE7r310qlU+Oa3hKDPtcoYo4Y8t26ciaLFmQ3zhTIcyKp3sZXXtybab6xdYX+Aw0Cf7RHu2HNMECuiZi7PbeVjMp8D/bEh+EgxUo/0u36XjVegc+kit2x20WGmnt6kCzp7Fg6cGUFcuxW2vakNtg8CCYCz5UvQwDp3HnfzJnbX1/S/Be5OyCZDcKk3t98hzuTsubT0cldSbnkeZ8Jhmh4QtlPCOw8M/8+j5KMF/rg5G/FfqiDWMfNVJGBfev8P6bzwitouVqUaRThhW3czaqqLNgRety0I5lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8bPWAHfb+LPyIbI/ckJfh9FRrzz4ViytW7wCxnj1PM=;
 b=ipD90Nn+nowQUi11pGBY6Q1OAi64BfWAo2gyCvO6YraQlscYfpizTV4l83DuZQM04389ULwnNr2o0HTtWPFPlZtxIiJ23etX4T7C3DW2+c/vYxz1D4tK+IChQXIAA6FYPfIiRlR/XLsiOetB2Xf2wm0k2gojaWojYxfgZCRAecPFtj+Wz1bbuP4jRulJ90JlaGSYrzu0loaYZw2Yp6SdAdt5t+1KyQfJbwLrp+QQyerHDa3GUaUWWe/rOIEmcTJRtSLgs1uaCYC5bxiC/S/MOwM7zPmVZkj1othT2f0Rk+veYkisNQw8V3TeP6bcH+NNrcp0KSnxzPeB1P2qjpUd+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <39bc9028-cd1b-8dab-f575-8de791414a3c@suse.com>
Date: Tue, 18 Jul 2023 14:28:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 9/8] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Bobby Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <a4907ba1-a247-f96d-54e4-090f27665b20@suse.com>
 <a84dec51-bad1-bb36-9be9-fbf343987e11@suse.com>
In-Reply-To: <a84dec51-bad1-bb36-9be9-fbf343987e11@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0064.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: c9af9bec-47d3-475f-0130-08db878a84ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bgIrpzHL02E/MBXjJU9OAPh/NpPzl6OtmrdGqRbtzyWz895VxGeZR22m5m0nZw4ewRqAJ+8es/twSu1Wx6rmMtxag3WenOHZ1b1z/Amjw4PS0qTJjrA6FLlinQke4wsmenwPQ2+67Ns9pUFuUBgi47Wq8lmP8gKqzRQ7TRmPZDn3PrSEEG1lPZStzpUb1ZZIHFhV4VcqJUeGMWdkoAFrQedSOqv+KFCF8+YmuhQprx6WfmVghhz+xG0zUfn3D8vdIc55n2Ucj1HOyrbzvi7BMoMT2BXJm/8nFY6G205+JnzDeXAio89HFHDAcVY6fOw/FLAGi7m+vHeTkRywrZv70j/2MWsGYieg+RQfVrorK0ti+witqgRabEHRs4ngqkNiiRH4GSbk6aCxqUVY1Rh/54WAFaocETxVFXLXgvM07Epv6x5UdzBt9XZJBHmV5id1uJol09yNlpkFHzPFT18D/Db+HR+HCdiNJz9jGVH4d+k4sXKwkoQT34xJpYUG7FkFiDv+SkDAZqjE1aTAMb+3veYW8LQ8BY5w7s5+H8eLKURPIg+1uccFgbWzHRDvHyhNFxfBO94X5TuBty/4jn4c/WMTkTKMsW7kWBwmQfcMWXWdRaJ1n3NWGWliRNrQsFwfafxEWL3LBiQMfURwRpPSGg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(478600001)(26005)(6506007)(53546011)(6512007)(6486002)(8676002)(8936002)(83380400001)(7416002)(5660300002)(2616005)(316002)(4326008)(6916009)(41300700001)(86362001)(31696002)(2906002)(31686004)(186003)(38100700002)(36756003)(66946007)(54906003)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGVNNGRIRkVzTmFUa09EOXVaL1lpK3ZSR3ZJSy9Ib3pKVlgzOFNST2QrVVhs?=
 =?utf-8?B?YXJ4Qm41VnpkVk54YUZ4am5jSlpaekZndUQ0YkV4aFdoek5lRHFLeTRGN3Y4?=
 =?utf-8?B?UHoySFluSUluZ0Z2bi9uOFd1cVBMeUVUZ25CM1haRFVFYkRVV0VZcFQ2NXZi?=
 =?utf-8?B?TVNYRDcyWSswRGlJSkJkYXJmMVdYODZaQ3piU3liaytnM2FuVThpODZqN3VP?=
 =?utf-8?B?SC9NNEptOW9nZk9xanY1UUdrcDhOOXgrUXRDS3NkZ0Y2UXpKMHNJdHluc2xv?=
 =?utf-8?B?OVJmNU9rbnBPNC9rcGV0VHRuUWhjdHd2UzUzZDJ4RGh4NFBTczNYbUVQSklF?=
 =?utf-8?B?dll1MW0rSHhLVmdZU0NxRXozRG1Vbkx1QWE5WnZrV1J2cHl0UGx6Y29JSGV3?=
 =?utf-8?B?WDR4ZUswNzJnY1lHQ0FwVGQ1REFsd1kzTUR5SnpZVy82endyVElwb1dwTXBY?=
 =?utf-8?B?Vyt0em4vVDU1WWltc2RLNlRQR2lYQ2FBQ3lCZXdaeWcveHFQSy94WWg2K1da?=
 =?utf-8?B?dzY4ZjN1UnAxckxURVJBejhzZHUvczZrdGtFZ3pjNlVPUEszeWhWanIybnY0?=
 =?utf-8?B?RnFFdU1mTFpLRGQzb0Y4SzdGemZ2OFljM0VOQlR2QmhVZnI5NjBTUjA2b3hW?=
 =?utf-8?B?WUNUQklGaEpFTFJBcE9DMGJSUTRBTERRNktGTHRSMU0xVnJ3M3Jkdk5xNzhJ?=
 =?utf-8?B?RHRtY0NPYWlBb3c5NEJBQmpPN3VVd3FGUlBiMWs2YURoSTlHdEdMVS9wV1Y4?=
 =?utf-8?B?RjI1U0lhaEJkK083bGxYdTJuVVg4STY0dzRoTVY1SUlzRFJ1K1h4Q2l3YUVj?=
 =?utf-8?B?cFdNdVRCa1VudzVXYXVzNVZtajBxaWdhZFErdUVTODBKYTZ2K2lYa2dqbThE?=
 =?utf-8?B?Uzdaak1LMDJhZ0dOQTk5QVZyQ0pTS0NYYlhVSk51SFJQbzlkYmh3RnM5dDNk?=
 =?utf-8?B?TmY3UWJwb2JuTmFycDFHVWUrMCtrVWFCQmI0bG9iLzJoMjRuNmJPOVoyUU5B?=
 =?utf-8?B?S0o1bjJyS2EzWTNFT3Z0dmxFblB5cEFQK0pmMG5PYjRoL3ppWTdLb3grZVdZ?=
 =?utf-8?B?VHN5QWQ3S05SdjBEeTA0NzM4UGVVTXdLanpDVjBnTER0OUhHSzVJeHlIaUgw?=
 =?utf-8?B?RCtJcVFHWDIrQWdzQ3lJMjE4d3JITDJQUFBZMjRIVTdrNUxYK1poNzhTRS9y?=
 =?utf-8?B?UmtkejVOZjFBTDZhYWw1Q0lUUFI5ZG82Nk5NR0o5YU5EZjJrZWdkUW9PdVhk?=
 =?utf-8?B?ZTlvM0pzVVNGMWp1cFBSWFhscFF4UkJ5N0oxdnMra2h2d3c1elkxajRJcVQ2?=
 =?utf-8?B?Zkc4SkFrWFVPa3BoaGxxekN2Z3habUJDSkNoMzhyYXVRR2xQTzZiMWJoR0Jq?=
 =?utf-8?B?VXAxV1lUOUdKamQ0WDZ3SnVsSkVLajFsRXFmT1VsbTMxWmlTeUYwMWwvM3RY?=
 =?utf-8?B?bnBhTU94dUplRytLRnpSSk44ZG5sUDkyaEdWNVB3VVpiZ0Nkd05FRDVXeFZL?=
 =?utf-8?B?N3p5elJ2ek1EWUx3cXZtZnhlSERxVTVaa2tXcm9hR0J0cWg0cUt4R2h4N3RK?=
 =?utf-8?B?cEtaMGdtZVFrSERacWhUY3cvcWJweTVyRzZ4U0FVMkVUR2Q5ci91WnpGMVhv?=
 =?utf-8?B?b1pjZnZzd056TjkzZFhLY2Zyc2toZG1MQThISWRyeFNIYkZQQnhLR0hsNk5Q?=
 =?utf-8?B?UktSQ3YzME16K2tIb0FkTldZa3dYdTZaN1BZZ0F4OUFVVEZ1bWh3MS8xcDNN?=
 =?utf-8?B?aHYxcUR2RXhHUUxUaER4YlBZTnV4MXRMZjZhaFJXc204R1VVYU5NVVAwRmwr?=
 =?utf-8?B?MVFDdm9zTHExQW12aWZuVk5ObGRua2V5d1pZZXBwRjlDYUo4OUc5ZlhxV0Zx?=
 =?utf-8?B?RW10S2wzZDMxbEp2WWJNdm1PN1laYTZZcFlBYzl1Wm9TWDlNVDBZSHMyL2Uv?=
 =?utf-8?B?ZFpFdUFUck40emJXOGRSZDYza3p4QVYwNU4zSFBsQnE1UVc3T2lUMmhtRG15?=
 =?utf-8?B?d3lJOWNCN0hlK1BJTVdBblhkVkY3cDNTem9lUnJ0MTZOUC9xZW4zRDN3amM5?=
 =?utf-8?B?RXExK2RzTUpzc2s2cnBHVG5veFJCSTkxN2NjTDlTVW9zaGRpdmNKR2ZiclFK?=
 =?utf-8?Q?NXOeU6HYP1jrD3tsyOYRy5Lzx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9af9bec-47d3-475f-0130-08db878a84ad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 12:28:40.6785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5zNXaLFpA+q7P8Zak+GfG/pB9j251v+6Tird2z7SXW2vmZzqJp+taeKA/6fAsG7xd1UPI5f9iycSpMruQlT3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6824

On 17.07.2023 16:18, Jan Beulich wrote:
> Leverage the new infrastructure in xen/linkage.h to also switch to per-
> function sections (when configured), deriving the specific name from the
> "base" section in use at the time FUNC() is invoked.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

This additional change

--- a/Config.mk
+++ b/Config.mk
@@ -115,7 +115,7 @@ cc-option = $(shell if test -z "`echo 'v
 # Usage: $(call cc-option-add CFLAGS,CC,-march=winchip-c6)
 cc-option-add = $(eval $(call cc-option-add-closure,$(1),$(2),$(3)))
 define cc-option-add-closure
-    ifneq ($$(call cc-option,$$($(2)),$(3),n),n)
+    ifneq ($$(call cc-option,$$($(2)),$(firstword $(3)),n),n)
         $(1) += $(3)
     endif
 endef

is needed for ...

> --- a/xen/Makefile
> +++ b/xen/Makefile
> @@ -399,6 +399,9 @@ AFLAGS += -D__ASSEMBLY__
>  
>  $(call cc-option-add,AFLAGS,CC,-Wa$(comma)--noexecstack)
>  
> +# Check to see whether the assmbler supports the --sectname-subst option.
> +$(call cc-option-add,AFLAGS,CC,-Wa$$(comma)--sectname-subst -DHAVE_AS_SECTNAME_SUBST)

... the pair of options passed in one go here to work (when old
gas is in use). Of course something with the same overall effect,
but less impactful might do. E.g. $(filter-out -D%,$(3)) instead
of $(firstword (3)). Thoughts anyone?

Jan

