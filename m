Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E92FBD77
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 18:23:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70985.127050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ujL-0006Ve-EC; Tue, 19 Jan 2021 17:23:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70985.127050; Tue, 19 Jan 2021 17:23:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ujL-0006VF-Ax; Tue, 19 Jan 2021 17:23:47 +0000
Received: by outflank-mailman (input) for mailman id 70985;
 Tue, 19 Jan 2021 17:23:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1ujK-0006V9-Bk
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 17:23:46 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26c93213-ae17-4105-a580-ef690f5003ba;
 Tue, 19 Jan 2021 17:23:44 +0000 (UTC)
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
X-Inumbo-ID: 26c93213-ae17-4105-a580-ef690f5003ba
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611077024;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qvIsweeQZZzbejOqJfFaF/B+S4Cj3215JxaZ6bqfxYw=;
  b=fM7Cv5LPtpgk6GWzRVdx5ho/bxzDW7yQ2TNgjldn8fAOv4cjmygunc4o
   ZQ/opntQSNpdW1iLoOr+kpEpx/v/GDcjN7ruhr3E+V2a13xSR7AowDcPt
   syarKVVP9pd/aAdU6v6R3GX/wUR7jmuklhLKOw5dW03yKH53SmAonRlOE
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mGeQYOpTm8JQ9Y3vM8JFGEYk4X4puqc/mLa0DSU6p5rFEHZ3VQ5v4wKtf9hyodpq7k4QVgl3+L
 qsEmwH3GfD7v2otJaeip+zEr+Ld3FWZ8/lNCWpLeybuTuSUcIx+AfFz3kee6yTCvGxB8Zd0tHg
 tudcF4E0N4q/HM3/ZB05mdiRD4pdxpt5H1o1E0BpDLnvlNU228OentWh+Z1K1uLG6I/0UWGfmC
 JqCdswatNC+cnrDfVkMUtWDPYqLe1uiVPDpVqLrugknmtFAufGyfzE+pI19ysXasgLhW9SRE5L
 kEE=
X-SBRS: 5.2
X-MesageID: 36696572
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="36696572"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+CHX/xu3R1tKREsRyQkEGEn7OnZ+1k8S9qDulOe3QGJXUtBluJAYolqZ8AftRnnBIUMYo9W9xQoMYr7VLTFkUzRX2flXABhmxg02SzNKy1c9UflLSd6/uIRMgC8jFH3Q+sirGMRf7j3g9Sslv+0Wml8+IbhhuecHNDdnpaeq5xQ5JUiF4JDFJYDED2+YKnm2FrjmyUJu362y0+W/iSKRx5uZw/wLzu/jOxsyVUSdFsbdBoKpTcn3jT+lJH3Xk8gbwUNPrFHpa5gbU9fUr8mDsegO1/FKyEyF1NJYrr7hfqpJldrDOXst0z6YuNJllble3CTquWP8VWq4M8uKTEuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMH4T31LkA+DNfW/f+REc9EN5HwFf31uPqesCD9LZoM=;
 b=Abgi5Z36601rQgaU2uMiX4VF7uTyLxAiD38y+FuzBV58YfNHLWCzOaSrGsK8y9/PxlOcHLgMjx6DxkQCoRcBQN6ngF6L3HWVQ1MM8ZDsZ1ekQGIk7AqvZ4V6ibkI2Lk1CTK+u46EBUfEQulDli9ueHJvWGjWBVWWVIo4mfYydGIM9A0RxT4XcRAdNu4v7e6yQx2e9tDWLXMbl4QKcYsSWWwAkXQnEg3+8fBTtYajG4qagksCFNa6HV6pOb9VjIWRpMbTIaEVsiv6VW+cC/GWUT1v+++BkxabC9Aps+ajDFs1M/ii5prccdsVT0ccS7yZm/6+LS/rXyylju5AjQ3ivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMH4T31LkA+DNfW/f+REc9EN5HwFf31uPqesCD9LZoM=;
 b=Cq0aMt5T9n88or/Q0z7rSgtbF3xIL8N9NEExAzjJReMVif2ANZk+8LK3gyKcB32NV4/aNfJuT7XJAvVXQGIZmPELX9HaOCF6B+T/tBpL3P4KzJ8rz/J3gIFEuxld9u+Whi0T0JY3uvCZQswCNY6XB7RcMb4mvlGjnXiTEh1mG5U=
Subject: Re: [PATCH 3/3] x86: Support booting under Secure Startup via SKINIT
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Norbert_Kami=c5=84ski?= <norbert.kaminski@3mdeb.com>, "Marek
 Kasiewicz" <marek.kasiewicz@3mdeb.com>, Jan Beulich <JBeulich@suse.com>, "Wei
 Liu" <wl@xen.org>, Michal Zygowski <michal.zygowski@3mdeb.com>, Piotr Krol
	<piotr.krol@3mdeb.com>, Krystian Hebel <krystian.hebel@3mdeb.com>, "Daniel P
 . Smith" <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
 <20210115231046.31785-4-andrew.cooper3@citrix.com>
 <20210119154856.hghgw3ob4evxgl7h@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3cb5c943-d61b-2ed1-235b-e87f6d6922e3@citrix.com>
Date: Tue, 19 Jan 2021 17:23:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210119154856.hghgw3ob4evxgl7h@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::17) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b104b68-b71f-4ea4-09ce-08d8bc9ef4db
X-MS-TrafficTypeDiagnostic: BYAPR03MB3416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB34163A4F3E14AB668478A9EEBAA30@BYAPR03MB3416.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GHENTd87Os7osr656rpLR0QlqPzGgyXEJw/n1KxL2dw+9XfoABLIv08e0tLUVGE2xt3mgqxK6UyVeVo8t07dpuaY5U2CD/xlu1CRSeTCH6LK9WAWXqL3jjYtBju6jN6ev3MtW0fQB8wrEy9Ig4lZtgiu6E7+m1KzpiKPI74JA3CMTdKMHtdnKcuODdX+fonTjBcVQ2UK6a1MQn7xba1ZK6AwX1AOaWtz+piNvb87QlFE02rR3PNt6B926CUeoXVzG83E/o1TJa/oQE01Fc8fPn907ite7yWz8YZQffV2UGimhlQ4A3xzZtkXP3dvk0X9CQ7y6HgAS4ooYsB9AbPvWb1X/PhjJEFjFdpwUkLkdgzXxqiKzYcRzOWGFB/7zaTllC+6SIJxFeEgOjdHIj0I73D4sBJL/hduJDeTlxB7bDIX5wyCi6BVjXEcf+OFk7I74y5JJPuECoK7XBFUH43zlziKnD/IbCwFj+3M1mAomApZcPBt/A5yvLCt2Y297ptjXrQfxtFVlHYIgbPxLSs9Jkwdw6f6tpYds4scYCqFreTQQajorwdFmbUYGzHYBeCj
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(7416002)(31696002)(6486002)(66946007)(6636002)(16576012)(478600001)(6666004)(2616005)(86362001)(54906003)(66556008)(66476007)(316002)(966005)(31686004)(66574015)(5660300002)(37006003)(83380400001)(6862004)(16526019)(53546011)(36756003)(8676002)(2906002)(8936002)(956004)(4326008)(186003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dkNqVDY2b3RQWVhTd2dnMkRPZ2xBUldYem5jSHdTQVlTN3I3QkFnV095Yi9w?=
 =?utf-8?B?dFA4NlVUZlNOUElJUmhXQm9yb3F1Z1BBZzlVYk9laERXY0R3OHlucVozYXhL?=
 =?utf-8?B?djgzZ1pLY3ZFNzlYMGxCdkZEOW40YzAweW13V0dGdlZIVGlncEpjYXIyUDlo?=
 =?utf-8?B?V0RRNVluc3NFQWkwOFdGU0MvMncvMmt4Q1NNTTB4NEtvVklaaitLcGdpbDRt?=
 =?utf-8?B?UEVyWndLL3pnY1VmMzN5NTNMNU96YnFjL3JmZUdVZ0szYzk4WEt6OXZ1YUhk?=
 =?utf-8?B?WGtBM3hPWHFxak5XSy9sSmhRWkVCWWVaM1hCWFJSbWdBQTg4ckpZdVdOL1dr?=
 =?utf-8?B?SFBnZC9qRTJsQjdXVmtTbkloeWdXdW9hcmVCd01BVExrbUlCbW5KSGtnQXVi?=
 =?utf-8?B?ZTkzSjkxeHc2dmVYUTRodVliWG9aZTBWaWxtSi91MlZYVmZMcVFlbnVDQXRJ?=
 =?utf-8?B?a3h0ckNaWGJ2T0R5cWwrZllJNTNNUlA0UUYrdCtEUmFSTzM0ZjFaWFVGeDVB?=
 =?utf-8?B?OTVEV1ZRamJSRWhEMFI1SC9TSys3TUtyejhTSWJLVHdtRlhTNVdUckF0QTFq?=
 =?utf-8?B?aXIxMTVjcytLenNrME54ZmVTNlBNWXFwTEsrMmswWFdCM1hzNzhDNXI2Tms4?=
 =?utf-8?B?YzR4K3dTdWkwN3o4dVVLaWwxeWNuYmZTcEl1L1E5UHU3Y252Wmx0R3gzN3ps?=
 =?utf-8?B?VjNWSzVlR1RZRVhUdG1rRFQyRk5pMm5NRGRpdE1BaFdFZlUwRTVCRjQ3VXVj?=
 =?utf-8?B?cnRrSDlkOXIrUUprZ29WbmtTOU9uUnJoK0UzbU8yUDJ1VUVucDliY0tNM2Jm?=
 =?utf-8?B?SjlhbEMyMkRnenZZdTFRNy9JMmR3c21hQng1RUIzUVJPa09XR3Eya29kVUpL?=
 =?utf-8?B?NkVhZCtqUkRMUUd1ZlVwQWdnV1ZKRXpHaHE0M2g0VkFYWDFjZkQrRnRHTHlk?=
 =?utf-8?B?MDFDLzQzL0RRMmRaeE5zR2VIS0V2eWdmSE1ISDd5TWpzVnoyWU1zZXVvWmxk?=
 =?utf-8?B?YjJiL2MrVlFoYkprUmZsTkhsdkFmdk9hRVN4NjlreDBZc0FGeThiME5xQitZ?=
 =?utf-8?B?NWxIUzJvZFlRckMyajdGL0VodGNhVXEzZU12aEVDTk9vVktPdDRqUjZOQ1lS?=
 =?utf-8?B?MmExM25CUkFzOVhCck5ibmZjblBrTGhMNTRiRURZQmVQeFVIRG1KQmMzdXQv?=
 =?utf-8?B?eHRHZGNaTFdyb1V4d0grS0djMUhjUXdITDYwT0pUazA3ZFNwQ1YzNGVYOFgv?=
 =?utf-8?B?ZEpVdWtQdUJOanR1MUZnZWE1NHlleUtFZUNJQVdoRkF4elFGeGVjTms2UGFV?=
 =?utf-8?Q?2a1caN9A8OYMJf2DJkGxYJ/v8TUkeVkrSz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b104b68-b71f-4ea4-09ce-08d8bc9ef4db
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 17:23:37.3234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZ4Ik5gObDtoJzYlNS0jLVW2C3jILQv56vOOO2P5qYY++03zatqB08JFUz6PSBscIPSTeD6DdNkiTwwkfeoJW5/Bkw2YLa3YRsqfQvIbneY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3416
X-OriginatorOrg: citrix.com

On 19/01/2021 15:48, Roger Pau Monné wrote:
> On Fri, Jan 15, 2021 at 11:10:46PM +0000, Andrew Cooper wrote:
>> From: Norbert Kamiński <norbert.kaminski@3mdeb.com>
>>
>> For now, this is simply enough logic to let Xen come up after the bootloader
>> has executed an SKINIT instruction to begin a Secure Startup.
> Since I know very little about this, I might as well ask. Reading the
> PM, SKINIT requires a payload, which is an image to boot. That image
> must be <= 64KB and needs a special header.
>
> In case of booting Xen using SKINIT, what would be that payload?
> (called SLB in the PM).

The SK/SLB is implemented by https://github.com/TrenchBoot/landing-zone/
which does all the low level platform stuff.  It is the logical
equivalent of the Intel-provided TXT ACM which is a blob as far as the
world is concerned.

From a "system boot" perspective, the plan is something like this:

* Grub puts xen/kernel/initrd in memory
* A final stanza line of "secure_launch" changes the exit of grub to be
a DRTM DLE (Dynamic Launch Event).
** For Intel TXT, this is the SENTER instruction, provided that the
firmware loaded the TXT ACM properly
** For AMD/Hygon, this is additionally loading landing-zone into memory,
and using the SKINIT instruction.
* TXT blob, or Landing Zone, do low level things.
* They enter xen/Linux/other via a common protocol.

With this patch series in place, Xen's Multiboot2 entrypoint works just
fine as far as "invoke the next thing" goes.  Linux has a
work-in-progress extension to their zero-page protocol.

>> During a Secure Startup, the BSP operates with the GIF clear (blocks all
>> external interrupts, even SMI/NMI), and INIT_REDIRECTION active (converts INIT
>> IPIs to #SX exceptions, if e.g. the platform needs to scrub secrets before
>> resetting).  To afford APs the same Secure Startup protections as the BSP, the
>> INIT IPI must be skipped, and SIPI must be the first interrupt seen.
>>
>> Full details are available in AMD APM Vol2 15.27 "Secure Startup with SKINIT"
>>
>> Introduce skinit_enable_intr() and call it from cpu_init(), next to the
>> enable_nmis() which performs a related function for tboot startups.
>>
>> Also introduce ap_boot_method to control the sequence of actions for AP boot.
>>
>> Signed-off-by: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
>> Signed-off-by: Norbert Kamiński <norbert.kaminski@3mdeb.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
>> CC: Norbert Kamiński <norbert.kaminski@3mdeb.com>
>> CC: Michal Zygowski <michal.zygowski@3mdeb.com>
>> CC: Piotr Krol <piotr.krol@3mdeb.co>
>> CC: Krystian Hebel <krystian.hebel@3mdeb.com>
>> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
>> CC: Rich Persaud <persaur@gmail.com>
>> CC: Christopher Clark <christopher.w.clark@gmail.com>
>> ---
>>  xen/arch/x86/cpu/common.c        | 32 ++++++++++++++++++++++++++++++++
>>  xen/arch/x86/smpboot.c           | 12 +++++++++++-
>>  xen/include/asm-x86/cpufeature.h |  1 +
>>  xen/include/asm-x86/msr-index.h  |  1 +
>>  xen/include/asm-x86/processor.h  |  6 ++++++
>>  5 files changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>> index a684519a20..d9a103e721 100644
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -834,6 +834,29 @@ void load_system_tables(void)
>>  	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
>>  }
>>  
>> +static void skinit_enable_intr(void)
> Since this is AFAICT AMD specific code, shouldn't it better be in
> cpu/amd.c instead of cpu/common.c?

Hygon will get sad...

It's deliberately not in AMD-specific code.

>> +{
>> +	uint64_t val;
>> +
>> +	/*
>> +	 * If the platform is performing a Secure Launch via SKINIT
>> +	 * INIT_REDIRECTION flag will be active.
>> +	 */
>> +	if ( !cpu_has_skinit || rdmsr_safe(MSR_K8_VM_CR, val) ||
>> +	     !(val & VM_CR_INIT_REDIRECTION) )
> I would add some kind of check here to assert that APs are started in
> the correct state, ie:
>
> BUG_ON(ap_boot_method == AP_BOOT_SKINIT);

At the moment, it really doesn't matter.  This change is to simply let
Xen boot.

Later changes which do the TPM and attestation work is going to need to
know details like this, but it will be elsewhere on boot, and one
recovery option is going to be "please just boot and let be get back
into the system", in which case a crosscheck is not wanted.

>> +
>> +	/*
>> +	 * We don't yet handle #SX.  Disable INIT_REDIRECTION first, before
>> +	 * enabling GIF, so a pending INIT resets us, rather than causing a
>> +	 * panic due to an unknown exception.
>> +	 */
>> +	wrmsr_safe(MSR_K8_VM_CR, val & ~VM_CR_INIT_REDIRECTION);
>> +	asm volatile ( ".byte 0x0f,0x01,0xdc" /* STGI */ ::: "memory" );
> We already have one of those in smv/entry.S, so I would rather not
> open-code the opcodes here again, but I'm not unsure whether there's a
> suitable place for those.

I deliberately didn't.  SGTI is not something we should have a helper
for - it's not safe for general use.

With this codepath added, we've got everywhere it is legitimate to use.

>> +}
>> +
>>  /*
>>   * cpu_init() initializes state that is per-CPU. Some data is already
>>   * initialized (naturally) in the bootstrap process, such as the GDT
>> @@ -865,6 +888,15 @@ void cpu_init(void)
>>  	write_debugreg(6, X86_DR6_DEFAULT);
>>  	write_debugreg(7, X86_DR7_DEFAULT);
>>  
>> +	/*
>> +	 * If the platform is performing a Secure Launch via SKINIT, GIF is
>> +	 * clear to prevent external interrupts interfering with Secure
>> +	 * Startup.  Re-enable all interrupts now that we are suitably set up.
>> +	 *
>> +	 * Refer to AMD APM Vol2 15.27 "Secure Startup with SKINIT".
>> +	 */
>> +	skinit_enable_intr();
> As this doesn't seem to be mentioned in the PM, for confirmation, is
> it fine to do this before updating microcode?

Of course.  (I also need to complete my series allowing us to move boot
time microcode loading far earlier.)

>
>> +
>>  	/* Enable NMIs.  Our loader (e.g. Tboot) may have left them disabled. */
>>  	enable_nmis();
>>  }
>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>> index 195e3681b4..0f11fea7be 100644
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -49,6 +49,7 @@
>>  #include <mach_apic.h>
>>  
>>  unsigned long __read_mostly trampoline_phys;
>> +enum ap_boot_method __read_mostly ap_boot_method = AP_BOOT_NORMAL;
>>  
>>  /* representing HT siblings of each logical CPU */
>>  DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
>> @@ -424,7 +425,16 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>  {
>>      unsigned long send_status = 0, accept_status = 0;
>>      int maxlvt, timeout, i;
>> -    bool send_INIT = true;
>> +
>> +    /*
>> +     * Normal AP startup uses an INIT-SIPI-SIPI sequence.
>> +     *
>> +     * When using SKINIT for Secure Startup, the INIT IPI must be skipped, so
>> +     * that SIPI is the first interrupt the AP sees.
>> +     *
>> +     * Refer to AMD APM Vol2 15.27 "Secure Startup with SKINIT".
>> +     */
>> +    bool send_INIT = ap_boot_method != AP_BOOT_SKINIT;
> Since send_INIT is used in a single place in the function I would just
> use ap_boot_method != AP_BOOT_SKINIT directly instead.

I did it like this, with an expectation of how the TXT logic is likely
to mesh in, without unnecessary churn.

~Andrew

