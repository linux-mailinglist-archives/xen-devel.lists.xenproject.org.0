Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3D6D4378
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 13:27:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517391.802636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjIKo-0001GF-TI; Mon, 03 Apr 2023 11:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517391.802636; Mon, 03 Apr 2023 11:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjIKo-0001DD-Q3; Mon, 03 Apr 2023 11:26:50 +0000
Received: by outflank-mailman (input) for mailman id 517391;
 Mon, 03 Apr 2023 11:26:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dypz=72=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjIKn-0001D7-4O
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 11:26:49 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a376de6-d212-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 13:26:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8199.eurprd04.prod.outlook.com (2603:10a6:20b:3f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 11:26:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 11:26:43 +0000
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
X-Inumbo-ID: 6a376de6-d212-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+hdoDww5qWu7/IpzNtygOSq9A5/NQ1j0WN3va4/nUtqo+qscEVXYo/l5MkAqg9mAq2tlp0ABwyn7g+k5OOgilMTXD9mHvf0hC6e6YJFLTyriFEY87MxvReUexsowPb2ON7RgCuVxrnPDHGOpPhQqlXgz3h10Du5yFcWRv9Yv3Yr13L75zXyl+UX1oJIkLSQI8F40QliD06/nTHB2jnHYVF0eLszK5LiZIXtexdxMRb8T8h2AUp7RqRhwMVj77kdNsYgfQfuUREskXUJcYIBxNVPf3SGQ9dbpqvyEsc9jcM/eTbr7qBtLCk+sVspm/LyVEFlPvyr6Tb3mQJlSeuXJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8q0afLa22hTjaRnK3m9EodQhb1yTAjxZx4IUbIHkaM=;
 b=GZZLp0wclcMIbZpiCGr00m8ELQES7QzUVvGnPkA/f7/ORbO2eahMJkTnazvPYBBPjhVdrQ19Ux7gRjwfR5FBVK490brdhqbZ73tOiPCYjDf48Ji7aNWtfTlQYcdw9uGU7JZHXgKOrxzcU3kpK2E/N+YJyqsOVvjLlXkksiHy/BZ1JkaGEN03ekhcm92pvB+KMZJeUdkO9Or8CZ+9NByBRg1/wUCAEqWnx8dCHUHiqJA8k5UQK+7ZdwRzW1j6NBjk4GAbF3b70FDsHCXcT2Rewy0tIe6vSeuyaqmZQXOJRCTT+itjCgdMA5YDJ6zC9W2xlCUqcW/3Wkq8K5PLklY65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8q0afLa22hTjaRnK3m9EodQhb1yTAjxZx4IUbIHkaM=;
 b=IZxR0y3YHXIJpSLbODqGMcs4WvelFlgm1crboySZnhSlV2I/zZC8Xh3os2bfxkKSiHMTDuF6M4FHHMyQ2OOA4GAWei/cA5iKmbNaQe/44aE4HTVepqA40PRZEGF1t0dF+plgtLrtAvacgYpVi5ZFERHhpF0IDCO6qrcT4u7I/DmsxGCU1IEokBTnubVHwcdnD5DCkUrl3OtD5aEhOEaE4lZ34vWr5GkkysA21OI7yjTn6c18jAmrq8tOKBJTVwcVS1j4YMgHAwPe3+so4Znx82BRWjA6vprN5WeVvZH9BbjVzBpZOiLekFoxi6+ziwMz67zO/26Fxop49cD3Xs3vrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <be49b5d2-f4a0-44f7-0f6e-56c0e63e9da0@suse.com>
Date: Mon, 3 Apr 2023 13:26:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5] x86: detect CMOS aliasing on ports other than
 0x70/0x71
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>
References: <5426dd6f-50cd-dc23-5c6b-0ab631d98d38@suse.com>
 <8f2fa47d-89b7-b39c-e60f-edee1de5ca82@suse.com>
 <ZCqz0YCFUifIlthC@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZCqz0YCFUifIlthC@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8199:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d89e8ec-6986-410e-9c1c-08db34364d1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iGa+gFBuan6KwoxqIjLD07BUMtvuyypTCL3f28CUB9ZH1u4m+BMNsN+xJYlO5tDSmli+ZsAkdRFT5b1hpzeKq8toHJXSFSmRmmMpfJFDxW3hnehR4pIn3lcs/FPhtp106/4HeNUNvM0wlBCoBLU54Y+t/rfYXmVlgHIsNT75i4Tz0WqZyKTW4mi0q0BlKCMBCYrcFbyc7lu6QjYIhQMM5R7KyOy+yt8IAvqLInyrbnfCaopLYfKtBMwO4O02uiMGCu4yEyc03XrnGguRIahqkvUzqpZpcCbjIpCj7eSvoCKFDvdSiO6KVvqwqChWngbna9d1m1O+G7P9/tT75RaV9NGDPVPHvr2ZUoDMg8lK5HI1aWMwPkApzXVOZeW+/MgKyppbzR3a8jnmJnQUDiWkqe6c5P8XPLoZwbkCtanD8QcS3uZ+YDQUBOfpoVF8vXuXTd5gSGn1WTddK/4I8RVT8yOxCL+Pt7q3RZ3R/sitL8FrbFuDDsbHhOnmHwhuTH1I/jHlG9h1LZjc83WZH3cj4XLeIoYZQHCWD9JcQlXHpcB5Vsq+yW1w811xIQmshJpnm3mt2s0V0AW2RpINYn3GQeKNItj5UA5bifkhEFQQ8XBF8uQ93BBW5/lN58sgSH/31FrSjupehoRE6YqH8ssbCA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199021)(8676002)(6916009)(66556008)(66476007)(66946007)(54906003)(316002)(478600001)(8936002)(41300700001)(5660300002)(38100700002)(4326008)(53546011)(186003)(83380400001)(2616005)(6486002)(26005)(6506007)(6512007)(86362001)(31696002)(36756003)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUtQKzlXVUZEb3hVTUtCUTVVTE4rcmhxWnVxR3FFQjR2bHRBemxmVmxiQWRx?=
 =?utf-8?B?TFlGRGlYSTZwN0U4RkhuZWRKSzhCM2pnWTdUdFo5bCtlaWtrbWdzUlAwdkhy?=
 =?utf-8?B?M29nWXM2WnorMVdTWXRqUW9wbE1PNFRVTWgwdmRZZ0Y0V2preWdSdmFLczJY?=
 =?utf-8?B?aW9mR210V0p4V1ZLTkhsTTlxQW9OdHJTQ1ZrUWFmbFB5Mk1JQXBVdExqdmRK?=
 =?utf-8?B?Nlo5ZVYwcHBLa2ZMTXFYR3JFR3hYTTFPUHY2cjEyQmMwRWxZMTJFL3QzS05D?=
 =?utf-8?B?U2hJWmxlZVV4UHJkUnVsZmZUWSs2ZG9CcHljbXVZT3B1RGtKTFE1ZlJ2dlV0?=
 =?utf-8?B?dEFBZ1F3eHFIRm41V2RBTTgxQlozaXdTZ0NHbXhveStNdGQvWUtvT29pVXoz?=
 =?utf-8?B?bU95UXdxUnNBZU9sa0M3bmtpU2R0bHMzdDkxNUlPajVBRldSSy9pV1JaZ2V0?=
 =?utf-8?B?b0dtaTFYUU5ablFtbURMVUNGL3VDUGpZNE44WGh0ODFzaC9JVE8xWVFvQWg3?=
 =?utf-8?B?MkNocmRHQTM0STJQOVF2VGUvOEM0T3JrdHllMDJOVy8yT3IrRWEveXgzQWxC?=
 =?utf-8?B?R3crTVlUSmp0ZEdDNEd5ZDZoUTdma2tqMVpsSGhvKzVBZDhqZG9OWFpJcFU4?=
 =?utf-8?B?TTRvOWxDSUl4STdLVUlTbXpkc0c4Qk51V01Mc1FVYWl5TmluRkVuNWIxRDhE?=
 =?utf-8?B?Z2ZiN3I1R1BiblhyOUxKeU96M3RGalZZWnhhS2FLdzduOXI3QnBLUDV5dGJ2?=
 =?utf-8?B?S3Z4c0xZL2NFcWpCa243RUJWSmdDcWxGNlJTZEE1WEM1cm9RalhzMnBwTDBB?=
 =?utf-8?B?Wk8wRC9UWjFUQnVJZWs0SkM5d0tHNG5TWTBFZjBRd2N5d0VDTEdaeFFmNXds?=
 =?utf-8?B?U1pKTitHYWVDcWxtbTVXMVhTZ1pEcjV2bEwySms5NG9EL2d2RDRsbSt5cDB1?=
 =?utf-8?B?M05UM1RPd0RoRmRqNXNWdXY2M3pBRk11SS9GaUdIaGZQTjR5MkZyTklISzhn?=
 =?utf-8?B?UHpoOHpjQmRmQjZGNUdhTHJFT2VWSWl4ZVZzbTlldGhsd1JOV0Q4TjFENG9K?=
 =?utf-8?B?RHFCdTNEaUMzU1pSZElJQkZzdTJhRDRWVHRmbXl3VndnT0ZlZ3ZBbVBSL1kv?=
 =?utf-8?B?U3JhNXM4d0k2RThiL3VhM05lb1RVOXprSy85bE40OThPTXV6ZnRMKzBNNlp1?=
 =?utf-8?B?ZlZOWXZBRzlKWktUVU54aVh0L0FSV1B4L3cvc1E4M1daaWJ1bEs1eExuNGhU?=
 =?utf-8?B?NUZxK2x1ZERaQ1ZvbHY4TUdFOWdFOFJiWGo3NXJWeVVqT0grdnBNSEs3QkVW?=
 =?utf-8?B?RjQ3c2ZNeXZ3aG05QUxSVEVxaUtsWWJaR2JJaHFjbXp1TzlYbVNFOHBVR1kv?=
 =?utf-8?B?V0hta2M5U3VYbnFZMFBrcFJpK1BhbTVJTFFNK2U0R2hveDhIVUwya0FpektC?=
 =?utf-8?B?cWlDYXdvclgyakp3WnE0SmhXcU5nK3NTcml1LzF0OUk1Uzl0OE43MWQ1YjVh?=
 =?utf-8?B?V1hLdGFKSXVTMVh1cEdXME4wdGlmZHJBUUVsbldta3dHUTh2R3Vtczg1VVJh?=
 =?utf-8?B?NlgwRXBHcEhnSi9maUhydHZDbFUrcERqS21tbmo0WXlHZmVTSC83SURCWWlv?=
 =?utf-8?B?aWFrenFLTm5ZQ3QwME9jVnhvVkU2RzNxZk81cWRIUHJINEg3bzdWM1JXWkJO?=
 =?utf-8?B?dm9LVmJmdllxUXIwTGxtRzRQM2VxSldlMTdzOXBHMy84d1B3YkVsWFVjU1RL?=
 =?utf-8?B?aTFFdU5Fa1ppTHdOT2FnU1FpMkEwOUZHMW92VkxLVk1vcVVZZjNlT2s1dTVO?=
 =?utf-8?B?VWJlenpzbTlEWW9ZTVBwVVNQQ2JQcktObU1iUTAzbWxiSEJwdXFDZ1A4N09q?=
 =?utf-8?B?YXI0ZTU4Nlo2Ym9Gd0lOSU1VOTlpZ0k1QnhGb2dWWVVlWktVWGQ4Q1hRb2dQ?=
 =?utf-8?B?MnJRQ29vdi9lbXlIcWg0R00wb2ZESFFUZTIyd1JtVGloM3R6QmxKMWdJNDQz?=
 =?utf-8?B?M1BPM0FFSngvSU8vR3ZET0NtWVI1aW5tZk9kSER1RlhKSXJQaEVMTWd1ejNk?=
 =?utf-8?B?aDUxTTdTTW5xbFlRMjJmMEw5R1lEQ0ZKSk56Z1k3MnNJbFNKNVo4Q0Z1WGY3?=
 =?utf-8?Q?mI6eHeHor+E2V67KVEXhLSmak?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d89e8ec-6986-410e-9c1c-08db34364d1d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 11:26:43.1181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOECWLr8hShqeiNXC7KvpCn9/n/lqF44JenNROx9YJ/XcvM4XgaQ0T9r9D3ZdLr0rUwfdoDZm4o1aYeEu75crQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8199

On 03.04.2023 13:09, Roger Pau Monné wrote:
> On Thu, Mar 30, 2023 at 12:40:38PM +0200, Jan Beulich wrote:
>> ... in order to also intercept Dom0 accesses through the alias ports.
>>
>> Also stop intercepting accesses to the CMOS ports if we won't ourselves
>> use the CMOS RTC, because of there being none.
> 
> So it's fine for dom0 to switch off NMIs if Xen isn't using the RTC?
> Seems like a weird side-effect of Xen not using the RTC (seeing as we
> would otherwise mask bit 8 from dom0 RTC accesses).

I haven't been able to find documentation on this single bit in the
absence of RTC / CMOS.

> Also I'm worried that when Xen doesn't intercept RTC ports accesses
> from dom0 could be interrupted for example by the vCPU being scheduled
> out, so a vCPU might perform a write to the index port, and be
> scheduled out, leaving the RTC in an undefined state.

I did specifically add "because of there being none" to the sentence
to clarify in which case we avoid intercepting.

> I've read claims online that the RTC is not reset by the firmware, and
> since it has a battery the state is kept across reboots, so
> interrupting an access like that cold leave the RTC in a broken state
> across reboots.

I can easily imagine such firmware exists.

>> @@ -836,10 +836,18 @@ void rtc_init(struct domain *d)
>>  
>>      if ( !has_vrtc(d) )
>>      {
>> -        if ( is_hardware_domain(d) )
>> -            /* Hardware domain gets mediated access to the physical RTC. */
>> -            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
>> -        return;
>> +        unsigned int port;
>> +
>> +        if ( !is_hardware_domain(d) )
>> +            return;
>> +
>> +        /*
>> +         * Hardware domain gets mediated access to the physical RTC/CMOS (of
>> +         * course unless we don't use it ourselves, for there being none).
>> +         */
>> +        for ( port = RTC_PORT(0); port < RTC_PORT(0) + 0x10; port += 2 )
>> +            if ( is_cmos_port(port, 2, d) )
>> +                register_portio_handler(d, port, 2, hw_rtc_io);
> 
> You seem to have dropped a return from here, as for PVH dom0 the
> initialization below shouldn't be done.

Oh, indeed, thanks for spotting. (The excess init is benign afaict, but
I still shouldn't have dropped that "return".)

>> @@ -1249,6 +1252,77 @@ static unsigned long get_cmos_time(void)
>>      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
>>  }
>>  
>> +static unsigned int __ro_after_init cmos_alias_mask;
>> +
>> +static int __init cf_check probe_cmos_alias(void)
>> +{
>> +    unsigned int offs;
>> +
>> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
>> +        return 0;
>> +
>> +    for ( offs = 2; offs < 8; offs <<= 1 )
>> +    {
>> +        unsigned int i;
>> +        bool read = true;
>> +
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
>> +        }
>> +        if ( i == 0x80 )
>> +        {
>> +            cmos_alias_mask |= offs;
>> +            printk(XENLOG_INFO "CMOS aliased at %02x, index %s\n",
>> +                   RTC_PORT(offs), read ? "r/w" : "w/o");
> 
> I would consider making this a DEBUG message, not sure it's that
> useful for a normal end user, and printing to the console can be slow.

Can do, sure.

>> +bool is_cmos_port(unsigned int port, unsigned int bytes, const struct domain *d)
>> +{
>> +    unsigned int offs;
>> +
>> +    if ( !is_hardware_domain(d) ||
>> +         !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) )
>> +        return port <= RTC_PORT(1) && port + bytes > RTC_PORT(0);
>> +
>> +    if ( acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC )
>> +        return false;
>> +
>> +    for ( offs = 2; offs <= cmos_alias_mask; offs <<= 1 )
>> +    {
>> +        if ( !(offs & cmos_alias_mask) )
>> +            continue;
>> +        if ( port <= RTC_PORT(offs | 1) && port + bytes > RTC_PORT(offs) )
>> +            return true;
>> +    }
> 
> Maybe I'm confused, but doesn't this loop start at RTC_PORT(2), and
> hence you need to check for the RTC_PORT(0,1) pair outside of the
> loop?

The loop starts at offset 2, yes, but see the initial if() in the
function. Or at least I thought I got that right, but it looks like
I didn't (failed attempt to try to address a specific request of
yours, iirc).

>> @@ -1256,23 +1330,25 @@ unsigned int rtc_guest_read(unsigned int
>>      unsigned long flags;
>>      unsigned int data = ~0;
>>  
>> -    switch ( port )
>> +    switch ( port & ~cmos_alias_mask )
> 
> Given that the call is gated with is_cmos_port() it would be clearer
> to just use RTC_PORT(1) as the mask here IMO.

Hmm, personally I wouldn't consider RTC_PORT(1) to be reasonable to
use as a mask (even if technically it would be okay).

Jan

