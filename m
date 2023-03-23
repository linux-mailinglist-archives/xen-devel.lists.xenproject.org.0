Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BE06C6CF3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 17:09:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513956.795756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNUh-00014y-He; Thu, 23 Mar 2023 16:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513956.795756; Thu, 23 Mar 2023 16:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNUh-00011l-ES; Thu, 23 Mar 2023 16:08:51 +0000
Received: by outflank-mailman (input) for mailman id 513956;
 Thu, 23 Mar 2023 16:08:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pfNUf-00011f-Q4
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 16:08:49 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faab491f-c994-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 17:08:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8785.eurprd04.prod.outlook.com (2603:10a6:20b:42c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 16:08:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 16:08:45 +0000
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
X-Inumbo-ID: faab491f-c994-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BGwznpFIg1YS+KM6AfJT+NHMiWkcI/AGxrfDrJk0MHhartBEXgzg9zTmSxGeXgTf8T0VJRF8hgmF18NgkarIR8u6LUBYFUg5r8qkwBwjm1i1mQ5YSR0nmiHDJy+wFAz6kDGryPLar3OiBXoYng1XHscUnu0zuDOkEQO14XdZLUDrLaheM4dqYe/Jr8lYYIID3wq3Gkz7RTGv2NBosMXHfzWZgFZHMLnHcL33TuzKrpJamTGOUlQUkVyW8zM4qG7+fp/KAY/kSYuD/wADe+7+VRb0NBZAgk8b6LZTY1F4/z21YuW3LWp0umEhYaQhhCryiwG6FBIC+WCHfVVsp3hQRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5KGbWRMeXB/HEfnVy05olxDbyexB/RwBgQndtqSlIs=;
 b=JQx5uGE1A5iAHigI00O52SP+5IOM5LJix2sTvZPjL1/4ucl548pihA5XbDBbENa1Tk2MAPPYu+ch4iWxZgQRJ36bLRfSpNcULo2Pcsnhc1yAc2PU4Uu4qvWpfuyhv/5geyj0gaMPE5aTIFDeS1c2I25aio3DRkXpx/cXZQ+zJUIb9t0fyoqvCTdIQ1l2nQlbF+UwWYpbRlQwFWtBjvW5PKzkGPTdIkYCgVPE0W1Vjen3W6Ozw1Hw9/b2TmW9bFTO624ws48tjw8VwDN16xjh1HsztgLHVjcdTP2g91QFcg20Dc1EZJwCDLME5sVGjoRymydu283hscCKktXkItAEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5KGbWRMeXB/HEfnVy05olxDbyexB/RwBgQndtqSlIs=;
 b=KboGGfiwTL92lXQ9xAhbeKy+ggd2mXHZoxxkCUWXyOX5Vnzmi4+OpF2gGVWLN0Ine6opa1hahF3BbMPQxgQCF4TCZ7LTNvKI5Bh/z45pyCPzGscq+d+zPE4h4DW8NvhGHqte15FO2TbFq3jur59Yj92swmtLMGb5eZjCkc4ZbmqTki4ewZJuVKA9cJMbUJ7Qeos5SN0+49yU4PtmjEmHSGqkMSafYncxThHIHsZ7Gap/ZCUK7hqiWwTqczA3IrRWNqfXxfa/RDVS/lwVhUmuON8P4nkerYdbTitQRFZKLhofKgm20NBFc1X5XxI1/csx29yJMHMFua2lVgjrQWOyFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <62e5d8fe-df2e-eb95-bc8f-631dad4204f2@suse.com>
Date: Thu, 23 Mar 2023 17:08:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <367d0223-d481-b7a3-3b79-a9bc6f00531e@suse.com>
 <ZBxm+7/ldyHclXwc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBxm+7/ldyHclXwc@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8785:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bb42c7-f31f-46aa-e823-08db2bb8e103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IbjuSlMEEzIUP5XnrPNO2JqG/oDFe8VPjzjqBF+D8CrzBcyPE3KfyMHqzlCVF5TCJY1SJB8ETrf6Ee2Y5UeZTe99ZU+eg3ApouGQQE45oszK4p+YykgbzsxbNNOS7pAnu8S1oHpr3EimTveY2r1Hphm1Cw4uC0Yj5JXdAVVtm2sd5hoErVQMTqvCz8p5BchSw2oxdHX8Tn25j6ubyFS5nVC5ubfVwIZXNhzf8yMzOcsCNrEnOsD3BXlGLUKHbL1L1ZRhSE8vdbE2Osc2aSs/IzjMwuYcqgqXVHYwTxm10OA2QTB0/t4oAUtBbY6IuTLyWeqiyQmTl2GrSlHu7QPh+yo/D6EjM9YdQ5IxoWSnNdLuneC4OwSLYYZEEwGMhLKX/kXMg2W2zAAI1q5PT9EbXOcjoQQtH5yrquxPlahMXoZTqQawcZVM/poAYmbt0aN3hv0ioZ4/T+6R/oA/kh4CrBoT9dcfyJv8tBxt3PkOCW6BGQC6cCo3PS4yqQibEC3taVcsXZ2rLlMPZS5Zzwe7DpRRpIWX1qmoBROOu1bhQbnd+KyuPMeZnSmsK1YBlVfgK+mgzrr4MohJx1+y/kJBaIWHc7FNs+NmsuM7dDLPETux+QolJtPwr5JL+hgNUpbkvk+P6cThA8t+ukgTJcOB5AOqVlRJpANnIIJYKXGV5WCbpCiUmXe+2H/i+kZvxaOHLyH6fKRpL/odo9dFw0OJ1JCRTvIUuxr+1qQ2ImvL4gk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(396003)(376002)(39860400002)(346002)(136003)(451199018)(31696002)(36756003)(86362001)(38100700002)(2906002)(66476007)(8676002)(6916009)(5660300002)(4326008)(41300700001)(66556008)(8936002)(2616005)(66946007)(6512007)(53546011)(186003)(83380400001)(6506007)(54906003)(478600001)(316002)(26005)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1Mc0srTUlpeGZrazBCK1NQYjdRMEFWeWdIa0w3UlNRNEdxSVRtQ1BUVG80?=
 =?utf-8?B?bER2ekRlbWJUT05yM01yYlN5ZVdjekhzclAzaGJFRm44cHUwQitpc1RKSDUw?=
 =?utf-8?B?NnR5aWJBOUNKbjlXZG5TNVoySHVDK0lDUk1UL2hKUGp5RTNiTVNuVlFDRzhm?=
 =?utf-8?B?WWxLZEN6KzcrVTJzSVcwWG1SbUJtQ282N25XaXlOU3VGNUZnOGNnRnRHS2lG?=
 =?utf-8?B?R0d2Y0FnZVQyL0hrWDJRY1pyNjJPMTlCMUxGUHRWd1plYkJ4K0JraUlhc2ZI?=
 =?utf-8?B?SXdUdURHKzB3V0VDU0FLQzhYTzFYNXZVbjFVY1liWmpCdXBmckx6SlliNWRE?=
 =?utf-8?B?TkdiQm9QbUMvU3BYTTJDMG5mbVlKRmZLaUtwQnR0ekttRENkL0RaeXN5djNK?=
 =?utf-8?B?TmdXUFlkU1ZSZ0lVaW9yWlNSOXcxdDljRFNHZ1Vjd0d1UklzcjlkUTNtY2Qz?=
 =?utf-8?B?bVEyRDBCSDNjaWJvUXBRcHUrZG95aHNhaWFiU0xyVnJtaFVCSXVGRkFZNW9N?=
 =?utf-8?B?ODMvc0VhRnBBKzBTY2dCQXRMTFFVRnI2RHJLYzByVGFwTm9ZMU9MaWgwK0RS?=
 =?utf-8?B?blNoV1FPUHVidDg0dTNPT09sc05xdjkwN2E0ZHJoRTFZZ21nRjY0RzJMeEh4?=
 =?utf-8?B?bytjNk04UWVTTTkxbElVMnFHNk4xWXFtTWU1TG90RytHNUViSGtDeng2UzhD?=
 =?utf-8?B?Z25hK3QrVXl1UWxlZmtrMkRaanYwd0NKcU55TmNzcFlwQkduM0xYZ09waWha?=
 =?utf-8?B?VEhoTkkyeGtnTnByZ3pNV3V2T05ZVDhleFN3b2d0dmFVUzB5VmZFWkJuc3Rs?=
 =?utf-8?B?U0l5bjdWV0VpQ2pTMk51RkZyQXJjZDI2VVI2Z05RRUhMY0RKY3RoOS9FdHRR?=
 =?utf-8?B?TGR6Y1ZCZDVkWkQ3ajErZ0pYQnIxOHluU2x1dDNNazlTbmhJN0lNNmVJUFpx?=
 =?utf-8?B?VERrMjE2RGdNL09uT3EyaUZtbFZKVDBNM0VoeW0xTEMyV0VPNlhwSWlKek53?=
 =?utf-8?B?amZzNDAxN0l1bzFIaXBGZGozTFdzbGFvbURNYzNFTEl0cWxVVlBrTnpuRHBx?=
 =?utf-8?B?LzdVeTZxcHNFNWx0U2Z1c2FVQU5MMTBNb01SeXk3SnNGTE9SNndoSW1vYXJP?=
 =?utf-8?B?UDAxMzl4ZGJIcTRpWGFIWUozNXdxbkRxYmZxSVY2T09DL3pnT1Vab2hCL1hk?=
 =?utf-8?B?dm5QZDhCZTJUanpjdERSSkU1eEs2dndpYUM3cG9oTHQxQ0orR1VpODJXT1U2?=
 =?utf-8?B?azdNOVIzN1FUVXpNZXJuSjRJeEpXSituNWhrcUZ6cFlhSmlYNkdhbG5aRi9q?=
 =?utf-8?B?VXFRYWtKekZUSXE3SmhoV2FOdWZQR0lMMHFraVlSQUV1OFRJZFZ3UjRFSmdD?=
 =?utf-8?B?TUxIdjVuNWRnS1pacHdwdFE5Z2dXd2d1VUIxRlhoVmtBTTkrWFVadDJpRWZw?=
 =?utf-8?B?RGdiUGMzYnpKTXNXOUdvM09XREk2YTdsVytRVmx2QTlQSTc2UlFyWnFBUnNq?=
 =?utf-8?B?VVZrY0g0eFNWOERPWHdNRnZDM1VzL1FZWEVuS1NmajdCVjlyeE1sZTJ5cVZt?=
 =?utf-8?B?cS9wa3c1Wi82WjNiZW9XbDBxUzFyaDA1Rm54NmNRVW94UVErY0wzU3lWZDc0?=
 =?utf-8?B?UGVOTlpJMGVYeTltY3d3UXluVTRjc1hNRzlmbWhUVUQ5WU0xckRKZjBDSm9O?=
 =?utf-8?B?cENzUGRuWWhyMVBNUVdFUTBFS050b0NoSk1ZYWFVS0M0Ynk5d0FyRW9KaHFE?=
 =?utf-8?B?SDZ1Z2UvR0doWXRjK3A4MTZaY3NPMXU1MjJwZ0RGWUNMWDVLbWJYMGxhaGs2?=
 =?utf-8?B?MVBPS25SU002QzlrMHBScW50RERMQXJCWHBVNWQvalZGYXd0UitHVVZGV01j?=
 =?utf-8?B?dWZKOVVQemQ2b3d3VXJXTHBlRjUvaUxjOWtrQkdFbzQvK0tzdzZRQ2NnMkJy?=
 =?utf-8?B?Q2ZRUzhpVFc4TjVjUnZaZHMyRlZFWXY1V01DSVZHTVlpUi9iaGd4ekg0WkZR?=
 =?utf-8?B?a2EyQmVFK0JJVUlZMU5JbThDUWw3QTRUT1ZyeHJ0WmJvWWllUFVuRlVvSEMy?=
 =?utf-8?B?U2puaTgvQWh1eTVldmRnY3Naam9pUE1Qc0JwZG84dzhqVEVnd0FTNnhyQWc4?=
 =?utf-8?Q?3R8w4O0xp1+ZA6kbf8QCsFSpN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bb42c7-f31f-46aa-e823-08db2bb8e103
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 16:08:45.3569
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qz4jYAPtN3w8uawbRtHOCg5Whq0Pxgd32lCAl9ubwxmSwCiNkaaX4j3wMYIsVRNAScD86lLeKRSxY65tGFZc1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8785

On 23.03.2023 15:49, Roger Pau Monné wrote:
> On Mon, Mar 20, 2023 at 09:32:26AM +0100, Jan Beulich wrote:
>> --- a/xen/arch/x86/include/asm/mc146818rtc.h
>> +++ b/xen/arch/x86/include/asm/mc146818rtc.h
>> @@ -9,6 +9,10 @@
>>  
>>  extern spinlock_t rtc_lock;             /* serialize CMOS RAM access */
>>  
>> +struct domain;
>> +bool is_cmos_port(unsigned int port, unsigned int bytes,
>> +                  const struct domain *d);
> 
> We seem to usually name this rtc rather than cmos, any reason to use
> cmos for the helper naming rather than rtc?
> 
> If not I would rather use is_rtc_port(), so that we can keep it in
> sync with the existing RTC_PORT() macros and the handler names
> rtc_guest_{read,write}, hw_rtc_io.

Already when talking about just ports 70 and 71 there's more CMOS
behind them than RTC. With extended CMOS accesses the ratio further
shifts. So I view using "rtc" here simply as increasingly
inappropriate.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -2072,37 +2072,36 @@ int __hwdom_init xen_in_range(unsigned l
>>  static int __hwdom_init cf_check io_bitmap_cb(
>>      unsigned long s, unsigned long e, void *ctx)
>>  {
>> -    struct domain *d = ctx;
>> +    const struct domain *d = ctx;
>>      unsigned int i;
>>  
>>      ASSERT(e <= INT_MAX);
>>      for ( i = s; i <= e; i++ )
>> -        __clear_bit(i, d->arch.hvm.io_bitmap);
>> +        /*
>> +         * Accesses to RTC ports also need to be trapped in order to keep
>> +         * consistency with PV.
>> +         */
> 
> More than to keep consistency with PV, don't we need to trap accesses
> to that concurrent accesses between dom0 and Xen (when also using the
> device) don't overlap, as the RTC/CMOS space uses indirect indexing.

That's what I read "consistency" to mean.

> And likely to avoid dom0 from disabling NMIs.

I can add that to the comment, but as you say ...

> I see that you copied the existing comment, but not sure it's fully
> accurate?

... I've merely moved it.

>> @@ -1249,6 +1252,80 @@ static unsigned long get_cmos_time(void)
>>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
>>  }
>>  
>> +static unsigned int __ro_after_init cmos_alias_mask;
>> +
>> +static int __init cf_check probe_cmos_alias(void)
>> +{
>> +    unsigned int i, offs;
>> +
>> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
>> +        return 0;
>> +
>> +    for ( offs = 2; offs < 8; offs <<= 1 )
>> +    {
>> +        bool read = true;
> 
> You can limit the scope of i to the inner for loop.

Sure. It has been long ago when I wrote this, so I guess I was after it
being one line less of code.

>> +        for ( i = RTC_REG_D + 1; i < 0x80; ++i )
>> +        {
>> +            uint8_t normal, alt;
>> +            unsigned long flags;
>> +
>> +            if ( i == acpi_gbl_FADT.century )
>> +                continue;
>> +
>> +            spin_lock_irqsave(&rtc_lock, flags);
>> +
>> +            normal = CMOS_READ(i);
>> +            if ( inb(RTC_PORT(offs)) != i )
>> +                read = false;
>> +
>> +            alt = inb(RTC_PORT(offs + 1));
>> +
>> +            spin_unlock_irqrestore(&rtc_lock, flags);
>> +
>> +            if ( normal != alt )
>> +                break;
>> +
>> +            process_pending_softirqs();
> 
> You adding a call to process pending softirqs for every loop
> iteration makes me wonder how long is each of those accesses expected
> to take, since we could be performing a lot of them (0x80 * 3).

It seemed best to me to keep things simple here, at the expense at a
few too many calls.

> I don't think so, but there can not be any side effects from reading
> from the CMOS RAM I would assume, even for cases where the CMOS ports
> are not aliases?

Well, one of the fundamental assumptions is that these read attempts
won't have side effects. Without that assumption we simply can't do
such probing.

> I would assume ports to be either aliased to the CMOS, or otherwise
> reserved.  What makes me wonder if it wouldn't be simpler to just
> passthough accesses to all the possible CMOS alias ports.

But we need to intercept writes to 70 to track the index. IOW we
cannot simply pass through all of them, and we also cannot simply
intercept them all and treat them all the same.

>> +bool is_cmos_port(unsigned int port, unsigned int bytes, const struct domain *d)
>> +{
>> +    if ( !is_hardware_domain(d) )
>> +        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
>> +
>> +    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) &&
>> +         port <= RTC_PORT(cmos_alias_mask | 1) && port + bytes > RTC_PORT(0) )
>> +    {
>> +        unsigned int cmos = RTC_PORT(0), nr = 2, step;
>> +
>> +        while ( cmos_alias_mask & nr )
>> +            nr <<= 1;
>> +        for ( step = nr << 1;
>> +              step < cmos_alias_mask && !(cmos_alias_mask & step); )
>> +            step <<= 1;
>> +        do {
>> +            if ( !(cmos & ~RTC_PORT(cmos_alias_mask)) &&
>> +                 port <= cmos + 1 && port + bytes > cmos )
>> +                return true;
>> +            cmos += step;
>> +        } while ( cmos <= RTC_PORT(cmos_alias_mask) );
> 
> I would use a for loop similar to the one used in probe_cmos_alias()
> to check for aliased accesses?
> 
> if ( port <= RTC_PORT(1) && port + bytes > RTC_PORT(0) )
>     return true;
> 
> for ( offs = 2; offs < 8; offs <<= 1 )
> {
>     if ( !(offs & cmos_alias_mask) )
>         continue;
>     if ( port <= RTC_PORT(1 + off) && port + bytes > RTC_PORT(off) )
>         return true;
> }
> 
> return false;
> 
> So that you can also optimize for the more common case RTC_PORT(0) and
> RTC_PORT(1) are used?
> 
> Or there's something I'm missing?

I'll have to check carefully, but to be honest I would prefer to not
touch this code again unless there's clearly something wrong with it.

>> @@ -1256,7 +1333,7 @@ unsigned int rtc_guest_read(unsigned int
>>      unsigned long flags;
>>      unsigned int data = ~0;
>>  
>> -    switch ( port )
>> +    switch ( port & ~cmos_alias_mask )
>>      {
>>      case RTC_PORT(0):
>>          /*
>> @@ -1264,15 +1341,16 @@ unsigned int rtc_guest_read(unsigned int
>>           * of the first RTC port, as there's no access to the physical IO
>>           * ports.
>>           */
>> -        data = currd->arch.cmos_idx;
>> +        data = currd->arch.cmos_idx & (0xff >> (port == RTC_PORT(0)));
> 
> We do allow read access to alias ports even when the underling
> hardware does do so,

I'm afraid I don't understand this, so ...

> which I think is fine, but might be worth a
> comment (since we already detect whether the RTC_PORT(0) alias is also
> readable.

... I can't really derive what kind of information you're after to put
in a comment.

Jan

