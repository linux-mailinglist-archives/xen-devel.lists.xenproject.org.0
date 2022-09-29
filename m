Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BF25EF4ED
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 14:04:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413708.657524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsGw-00060F-Hg; Thu, 29 Sep 2022 12:04:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413708.657524; Thu, 29 Sep 2022 12:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odsGw-0005xC-EE; Thu, 29 Sep 2022 12:04:10 +0000
Received: by outflank-mailman (input) for mailman id 413708;
 Thu, 29 Sep 2022 12:04:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1mH3=2A=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1odsGu-0005x6-90
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 12:04:08 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2041.outbound.protection.outlook.com [40.107.249.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d150181f-3fee-11ed-964a-05401a9f4f97;
 Thu, 29 Sep 2022 14:04:06 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8381.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 12:04:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 12:04:04 +0000
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
X-Inumbo-ID: d150181f-3fee-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U8HMXv0+rnkx0Pm+t6xrnCDccqCkHnYaN4WNv2971ynbaEoXPNBoTpu49PQflylbUWCMl1sXZoW8upnrBEOo/MzGVLe/aCdXtTJBMJPxquQaTAHIumLm3edKkyoCqOlJryx9evV3uqMBj23xHOAG4GohW8To7ijmOONHCxslMCg43lUt4zM3YFFVBbWxsbraZMQ/A+d8EQUImG4c/WLx8mxhPRUCuf7S4VGXWaA9RSDzuBh6UtKLYpGZEBQS6FtlscVtUYZSOQfDyaeZu/YBxdYydcBt3KI3YZXyINCT+6MT9ueSsltVepwlb+YDKKNxCNXdNtCXUggqJtZYkPHQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/GPkFlpiV1Fn20lTbvZ1wTNglpXT2SVatLeLOg9XLw=;
 b=ZraZ9qlQr9ZWtDXNF5Qvv9ropbPAEp2JUO3/ejDz0mSC1pEdnH4TBueCUKroap0v4ZJflZsnXjpNN1cx4tZvjX3lf8Ult/72+pi/OMI0KvT4qAts9hyWKLqJaB6SDpj4l31KQo4Fgs9Dlv6CyZqDmpO+pK8Lev0uuLHg7T5KHCglULZlIJETFkdKR9B1z7FTYoGG64w6qhOE5q8kFQHn6+KsCC8MB7iPKZr4rVheCjRuj3UW6LRaWNISvhqPSQ4mzQRL0f7RS21cSl9n3QNjCC9opuf0YQBVwnCkhY20bAvcOyxSDxcNAXQvSgefz0Fl8kIYb3ijrXoI94eMNr4haQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v/GPkFlpiV1Fn20lTbvZ1wTNglpXT2SVatLeLOg9XLw=;
 b=hWqariAOE3wTs4MJAKSAybDvk4p9OUpZJ2WWTYmnW4q6cC6MNgQDt5+cJ5lDlaHD2O1PHv+iDzmnfrUlWxVW65hdOTt8Fi6InfFaVDl9OO7PJPopc6Kjz5cKmFIMvY/PFzHDgB5zoyJmeOi720XZl6328dKCBIK8Bn/2V1bwpX4S5nq1goB0jrVv8BEg3gIJYQbzSEnvRTiPiNXA4i5GCuCmZ+b+5frbcmTyKd1Cnyak6bgPozw5BF9FXmWCL1+H40/hB70DT0Udg0oFBYUjxapcnwhnnD0PGbNDoFVPScmRHsjGji5z9l1IQz7V5S4FtPvaskHjELEafiBDv/+OuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d5f6eeab-4937-de70-9462-dabe53be2665@suse.com>
Date: Thu, 29 Sep 2022 14:04:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2][4.17?] x86: wire up
 VCPUOP_register_vcpu_time_memory_area for 32-bit guests
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
 <b5afa774-d6a8-bf18-7412-25fa277d5648@suse.com>
 <YzWDZcsziR0SDGBf@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YzWDZcsziR0SDGBf@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR1001CA0062.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::39) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 78556c5a-3e58-4d16-c6f4-08daa212b45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eNfm0S8R16zSDlyzErKveHC8kpRlFMKAaO8n/qkO0/gIdKQXd//pDs5zUKD4tLvDGKBeblimZm/hD0h2p4anA1iAfm8pOdshRsko7vIgdXt2NKgS3aAFy5N2J3/QwMYbPuzKBDvg8m84+szbeP9q3XE/5E5ghIiHn6L2EpOt/mbLZVVLlVodazm2VZOA3EPG0nTrBHNeeIBB1WnIpQTRIhB6RmOvmrsStWSDBgtVkcyoQx2kK/Fe/cqnu3yGyThcRkRMqO2x5EFEs0iE6ivLmT96EEI+5K0Pa3XeI9kJKVEjFm5uzUnmMEiTRvd2vk+4QbkEFwbpR3HSwci2idBxxVUhVih+ES0LPtqOLr8mcLSf8TOXiNiHEe9tI6MntUVVeITX2NKWZhJe2PC3hO3YUs7gYSlzXnSUKFI2GAOr/4Bs7oVBIi2G3vOv6nLVhVkui8CpD7gM1OmxplN67BitZPIFw24xrwWyYDUaf2yoV6tXtgoRMEMr2tOyXD4lb4zP+je9zVKeO1vR30621+CWq5udCTLU+NzNK5ZihdxHIjrqxgB5PJ1vMnYNu57T5l1/rort3bSc1RvxlFs+NA2xUX34aGb3TrMVQunD56/2lnly0xHw+MAFJrgeHPm7hb50L4RAfmrPofYiGh5VS9KHABxfEWuF5HDJ5JL77RKKhKXqYTshcNJ5ehONAUY6liqM4kCbwKg1bpQvCGR8QY+PhN90RisMZhmMwJPDtNGCr+j05C2YNZ8OQAEGSiACvZ8n8R/51mLokQF4SGGFka/G9l/GOUXP0pFqsLyyYlRM93g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(376002)(346002)(39860400002)(366004)(451199015)(8676002)(36756003)(316002)(83380400001)(6916009)(2616005)(54906003)(53546011)(86362001)(6486002)(6512007)(5660300002)(31696002)(2906002)(26005)(41300700001)(6506007)(186003)(4326008)(8936002)(66556008)(66476007)(478600001)(66946007)(38100700002)(31686004)(66899015)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGZQTWtNTThBaWRha2VCb1VSeW5hNUlwRUNKNTdvNHhPSTBUNDhsN1hhbnNQ?=
 =?utf-8?B?OFNoUkU2aVU5VC9NTDJ0TENnRVZYYlQ1RDRkUWQxcWlKMWFiY3padG12TThy?=
 =?utf-8?B?MTRySm4wNmdJZ1cxdFN6N1l2b0lhMStxazNYczBrK2xpQ2FTc296NkdNaGlW?=
 =?utf-8?B?ZklxWWVDODlpSG94eCt4a0hreER3WGQvdVRDWUY4VmtkMWdVSktESERFZ3dZ?=
 =?utf-8?B?VGtkdzBCdkVLaU9OaTM1RnhSRmd5NlBzZ2t0SVFaL2E4cmxNZ0daNExBZFIv?=
 =?utf-8?B?c29XZ3JmNWNmUEp5MGFLSUREZlNseWMxMUFhK3RoUjVyUUZoRE0wRTBJdnJC?=
 =?utf-8?B?T3RXcm5JeG9WTGJTNUk1bkV4cmlGRmdFcEVyK2VnaWtIYnl3ZEtwK3pzSkh5?=
 =?utf-8?B?UUJNNFllTWp6V1dKclJJODd1K3piL0l0Y09ZL0kwVllOK0dKK3VBWmFwM1VX?=
 =?utf-8?B?QnVCaWlvTVZiVGZPWUg1MmkzZkZWRXlENXU2S081T2FEbC90cnF5ckR6Q056?=
 =?utf-8?B?RkJJTlVzVmxZT0lzT0x4SWpwN2dOeXZtc3kyOG0rd0Y0UUhCeCtoQWJTNVVr?=
 =?utf-8?B?WTRzbHFvMDhMOE5kZ096U29WTzBRaDdUdEd2OUUrS0llUzBGVWZ0YTJxUXd0?=
 =?utf-8?B?emVWejluNk9pYS9BTlRXOFZuTmVUekZjQ0psZmFRN3RnMUc0RGllb25UWm83?=
 =?utf-8?B?aGtUZnAyZWZTL1EzZkpnRitEODdLVVovTDhmYjFsNG94Zis2L3FndHowUlJH?=
 =?utf-8?B?S2dNclRXbWRleUd4ZjFGZTRpTXVaMVdvVVVEZUs0UnNGbk1JU1h4K0N1MWNa?=
 =?utf-8?B?SlhVckxFY3oxYnIzRjhkUlZ1SHJjSFk5bHpkUEdYYTR0d25KeWs1dTNDZGxu?=
 =?utf-8?B?SXZodFFUUVV2d1g0K0RSZyt2VC83TW1RZk0xUk5XZ0xpTS9kUVJ2c1RuWTNm?=
 =?utf-8?B?blhEWmVtdW04bHFRZnZ4cDdrS0p3MUFsZDRkTkQrR21jRTlkVzhJbUhXaWwy?=
 =?utf-8?B?Z0U0UXl3SGhlV25qSDVSZkpqdE8wYzd2bUhIZUVkbmRKRC9GWnRXTmFRMk9t?=
 =?utf-8?B?UGhkdnhDc1QvVEVkTmVVazVXR1BBc0IxbzFWdkN3OG1Va3NRNVZDbmdabGgr?=
 =?utf-8?B?ekF0UkFtMStLQVJ0ZThJRW9mUXBhMitLVFRDYkx5TFhkaXVmb1Y3Z1hNaHlI?=
 =?utf-8?B?ZmFvbUgwdlNJbzYreTZ3dlI1S29VbzZwckZ5OTNkemd1TUtyeGRWODZ1QVNj?=
 =?utf-8?B?a1ordFJDNVE1RGtKNXp0Ulg0SDk5QXcwS0tpQk8xZ1lQUVNYcE5RQTU5RU9G?=
 =?utf-8?B?TG9kWTFSbTZrc3I2aFZiT2RYbDJFMDdta3JYNlNqY0huYlVwcWF6R0JPRVQv?=
 =?utf-8?B?ekV5NGVoUUJLSkxTNjc0bjd0UWh3R1hFUWdVM3R0ZlVUL2dJOXNPbGtBTUY0?=
 =?utf-8?B?OHlreGRRd2dBQWpXZnJyTzFNUTh1YTNMaUNQVjdtSEdTVXlhV0pPc2Rjb2Iw?=
 =?utf-8?B?UlFMTlRSNzN3OWY3UHdUb2Yzb0RZYUVCMFRuTk1aakRQVFhvMnVQaHRlUVQ1?=
 =?utf-8?B?ZnVMTTd1bTVtUlpNUFZGa210Ym5Mb3FWR1B4c01YMUVXQnhJZWwvam5PWVl4?=
 =?utf-8?B?eTB1VWQrbXg5QVUxcjkyeWt5T2dyNHBYR0ZWd1JHcUFjRFNYNkdMeVh2T25Y?=
 =?utf-8?B?UHdEVDR4elNLUnFJQ1NwWkFpSmRiSGlRWVFhQzB6VFZjYjcrYnplV0lKc1Bi?=
 =?utf-8?B?ejhYUkRQWUhvTEQvZzF1V1RDWWZ6TndzRG9lKzJJRkt6MjRjSnRFMUlxZWJM?=
 =?utf-8?B?Tm9tb1F1K3NvSUsvZUI4ZXRpSDhNdlZycGNBVTBwSFZ4WStsU3ZwQ3p1dlpM?=
 =?utf-8?B?ZUtoSkVzdUt4emtzVUhkaDRocXluMjJ2RFB4VVhhZFhqOEJyNVBKSDZ2dFFk?=
 =?utf-8?B?clVETmFIMmlsZDhXSTZOSjVBdFZVVU1OOGhZNHVvdEdqcTNCRlVHTEFNZUgv?=
 =?utf-8?B?VElaaFd3bnkrNGNhaTQyd25sL0gxVU5hOGpKWXVMYmRKOUhkM3FlRFRiQ0JC?=
 =?utf-8?B?cFFGYlVCUkw4dEN0TG8vZlY4WnQ2L1lOdWYzQjF6eWZRSm9xZFJFaFNJNEJ2?=
 =?utf-8?Q?D5USjWsxa8SUXEmpTuS7daSzR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78556c5a-3e58-4d16-c6f4-08daa212b45a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 12:04:04.6555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/HjGaEQrjgoD7M3yfnoNxFrPZVI4Z0yXIDbe9QZjNW+A0yTxAVAfXIDrGWUbjBNjXyOCCsvUpKyCYQoiHojLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8381

On 29.09.2022 13:37, Roger Pau Monné wrote:
> On Thu, Sep 29, 2022 at 11:51:40AM +0200, Jan Beulich wrote:
>> Forever sinced its introduction VCPUOP_register_vcpu_time_memory_area
>> was available only to native domains. Linux, for example, would attempt
>> to use it irrespective of guest bitness (including in its so called
>> PVHVM mode) as long as it finds XEN_PVCLOCK_TSC_STABLE_BIT set (which we
>> set only for clocksource=tsc, which in turn needs engaging via command
>> line option).
>>
>> Fixes: a5d39947cb89 ("Allow guests to register secondary vcpu_time_info")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Albeit I have concerns with the notes you raise below, not sure we
> also want to introduce a (broken') compat version of the same
> hypercall wrt v != current.

Since "compat" is ambiguous in this context - I guess you don't mean
just the variant for compat guests? Independent of that I'm afraid I
don't see how a separate variant would help: If the cross-vCPU
copying is not okay, then existing users as affected already, and
would rather have the single variant work correctly. And if the newly
added variant would be the one with the broken behavior, why would
anyone switch to using it?

>> ---
>> Is it actually correct for us to do cross-vCPU updates of the area here
>> (and also in the native counterpart as well as for runstate area
>> updates)? The virtual address may be valid for the given vCPU only, but
>> may be mapped to something else on the current vCPU (yet we only deal
>> with it not being mapped at all). Note how HVM code already calls
>> update_vcpu_system_time() only when v == current.
>>
>> I'm surprised by Linux not using the secondary area in a broader
>> fashion. But I'm also surprised that they would only ever register an
>> area for vCPU 0.
> 
> Would be better to update locally just when v == current, otherwise
> issue an IPI to the remote vCPU dirty mask and force an update on
> resume to guest path?

Yes, that's the outline of how to deal with this _if_ we determine the
present behavior is flawed. Determination is difficult since, like with
so many things, this is something that's not spelled out anywhere.

>> --- a/xen/arch/x86/x86_64/domain.c
>> +++ b/xen/arch/x86/x86_64/domain.c
>> @@ -58,6 +58,26 @@ compat_vcpu_op(int cmd, unsigned int vcp
>>          break;
>>      }
>>  
>> +    case VCPUOP_register_vcpu_time_memory_area:
>> +    {
>> +        struct compat_vcpu_register_time_memory_area area = { .addr.p = 0 };
> 
> Why not just use { } to initialize?

I wanted to match (a) the VCPUOP_register_runstate_memory_area handling
further up, just without using a separate assignment and (b) this line

        if ( area.addr.h.c != area.addr.p ||

And yes, initially I did consider using just { }.

Jan

