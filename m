Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71D3AD122
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 19:26:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144939.266716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luIFB-0001FZ-9W; Fri, 18 Jun 2021 17:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144939.266716; Fri, 18 Jun 2021 17:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luIFB-0001D3-61; Fri, 18 Jun 2021 17:25:25 +0000
Received: by outflank-mailman (input) for mailman id 144939;
 Fri, 18 Jun 2021 17:25:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ssXN=LM=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1luIF9-0001Cx-Ua
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 17:25:24 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2415bc1d-5d72-43d9-a2eb-b4bb224ca01b;
 Fri, 18 Jun 2021 17:25:22 +0000 (UTC)
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
X-Inumbo-ID: 2415bc1d-5d72-43d9-a2eb-b4bb224ca01b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624037122;
  h=subject:from:to:cc:references:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=n0FAyM7R+rLorLB6FP2+ZWWPUiaY/7Ucfuo58u8bK7w=;
  b=Jezv9xWSgkib2FFr6IDDNEFnQO+G9Y4JXUDtGFsMx0XF4UVHvJygD5BU
   sELbJS3sZfwwrkV6QJWme8IIs6yw7zsK/E6sbTx52O8eQzryhnA3Tu710
   I/TBW+1GuBiC60dhRcLao5IK8RX2YKfGZJzu6OCFiWjIPIGPGrl73y15I
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: DZQknM9K3i8mRakznPiQUeQfK9FxKYFiPyznlTVxkHnQIIeL+MhdVmW99eEZm0j0gr5sGkMKAO
 HT6KQR/eu4P4Mp1ZjuETPJXLn7EX4AlWME8YbD8SbHerXxan9allkaQfB3UxmLrtXT2iqUr8Xe
 ToZXF+oSo8oTMVJrQrZikU8DkJeUvy35c4OFuAgVlIpofk5LM5QhgTn9RS8wTIpwyqVCcLXWgm
 /tDsdpoh0Kxyg8a0EodqbD0k7qbnfhgmAHC9s/tjQkBbsXZWhnBgPEgdu43HTauvoHc7Hml//i
 AwE=
X-SBRS: 5.1
X-MesageID: 46848126
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/NDAA6tOG/EG5uiYjCLX3ojH7skDjNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd0ZJhEo7q90ca7Lk80maQa3WBzB8bGYOCFghrKEGgK1+KLrwEIcxeUygc379
 YDT0ERMrzN5VgRt7eG3OG7eexQvOVuJsqT9JjjJ3QGd3AVV0l5hT0JbTpyiidNNXJ77ZxSLu
 v72uN34wCOVF4wdcqBCnwMT4H41qf2fMKPW29+O/Y/gjP+9Q+V1A==
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="46848126"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCIo83evMgyIa6x7ZXj9kzN0NEVX60dwF8732j6mK3QbEhhlRx4NJKzHMgO1kdhtSj7VjcugfADc/5YOCFIaO5XJcy9sssESQNPqis15V9K40ngPvoRcIgInh3I3zEqvQlHrQvaDJK2Hu8D4Pdn/EUnXtwRum+0RwRB4an4JdAa2NkmerCf4PgxEqsw/CHA9lB8x/Zvj5hOjr1JDC1usLf0aATyetMTmxgDsrAwVTt/o3woEHgIODq/YI6nLs1zGR8TyPxJylunFTa9aYw66889kea4BepA+7vFHIpsnCkNhcHXdsxA1FOAEKskRqtpKjjzl5LMa3WZU4sMZEMIxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89VJQLXCF12yB6848z6j6LbU4nssVh1otDcC+GyiXQM=;
 b=ecwRWGhv3vWVkDwRRa3ZIllx1JPcpkOt74hNyc1kp3CmR47kW5dt21PYJ0c+7sXOP6p+HL6dw8g9u1jNxtpqrGCMX4ComX2MmMYpPMqJ0pvWe6VDGlmOnaccu2XdrUK+BIUF2bFHPCSHXKYsYGd4aFj0sMJBTcU3AmmMk5Fwx3O0grBDYUfp0T9egQsUUodNUkPjJwdv1clquVCwmjCmmsJup8OAe0cEV9H1usANw7skW6xS9bILQZnhGWhN5XRjud4ruXCuPv12RJ6nBk0XYTKGNhDPGLflA41h5vpH/PNUFct6FCl/2Zqk+ZXWPuOyrBBhGhnUjPvlLmQs+rZhnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89VJQLXCF12yB6848z6j6LbU4nssVh1otDcC+GyiXQM=;
 b=mQJpnoMfe3zECdFEfNkzIhBrerzBTWwO0QiG5bYQSccGzY7xhrEkLOrCkN8yDjNbWLPjkf70EPYkuLu5+c0mDZ6MH9e17QfwCOTh6EmbH1gzo1qkiCyJ7HSb+xDID+zr1Hi5Ig/Pfif8xroH7rVf1ZeNuhyTjOwpbpVN6afa+po=
Subject: Re: [PATCH] x86/AMD: make HT range dynamic for Fam17 and up
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4f46f3ab-60e4-3118-1438-10a1e17cd900@suse.com>
 <1eb16baa-6b1b-3b18-c712-4459bd83e1aa@citrix.com>
Message-ID: <d057818f-4542-7305-ad95-61996385968e@citrix.com>
Date: Fri, 18 Jun 2021 18:25:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <1eb16baa-6b1b-3b18-c712-4459bd83e1aa@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::18) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c60c010-3fad-4058-fdd4-08d9327e0b2d
X-MS-TrafficTypeDiagnostic: BN3PR03MB2212:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN3PR03MB22124EF6CA5CCEFFDE612482E40D9@BN3PR03MB2212.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zgJ8lzze5nxA8d646J2G9FubUUAY5RhYeDnvIIrJOBEO/uL5ajenAWPpn/CZ9OiBLRzUQ6GoDxE1grjrQw6uN3cVJ8ADdAQuFjnKHC9Kjp2X/rpNflgMNInw1LezSQfC+DJZFrdp6wPT7XQEH1c3kezrsavMAAWQHR9hcxxZ+emDErP/OoLa10zvdtW0AhE2lzqyAmMaQ/lV+/FTbs8eIUjbw4v2UAzMQs/i3N07L3wbGmguQRFYmxqWs4ovmCq+fsP8AgVSRQ/IC9qozzu2MJRzuvESe20dHkvUkh9iEZy+DWr0Vp6umqafiVFNFh71gDvcQy64Td3EitKpuWCrfpC2Q2jSR/ssNpFnz3s9DN+RSxRyuA0fFhi+KI5UfQwHfMGqt/t5L+LJ7DOd3qD6rfaqvwCcH7AWY+1uB1CpySousrXne0L8ZPHDolRIcmPAfo9JsQza+dzazMTQjjJOm7mHrsa4oJoNep/z0COTXt2ZxTwDjOTI5fZZsVfAIueTW1428dlBtYSsE3JWwNOyuqzgAag8fo+f4xBrKgdoj1oZoUp722AbKdUtGTV1To4IWrMbd34dQoC6Ohno5aDEcAkEm/MjB/x1zKBG23fbUBC7hU9+oWUp2GexS+Z7eXcvlwhx4AEBgq1D6L++7k0FpWlTA0/OaeJ3Vas+4UOXsJxiMg4LPT0H2ZkHyh4udTBRAKTH78bk3TEWO0VzqRG8vpSfVZ6oh7DzMGLl+fnqpgnLHNulDfCUXWhNeABq2Uq0Am3rEWYA9HTpzCxcS6mCYFQl1LBqyGvABuxkaGCq+5Ls4AQqQxbhUwK16dQu3qC8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR03MB2401.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(5660300002)(2616005)(44832011)(110136005)(16576012)(86362001)(316002)(956004)(31696002)(8936002)(8676002)(66556008)(2906002)(66946007)(31686004)(478600001)(53546011)(38100700002)(966005)(107886003)(186003)(26005)(4326008)(6486002)(36756003)(54906003)(66476007)(83380400001)(16526019)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NkIwU0FVaDR6NWFVTzgzVjZabUZFdUpWa3Q3UlNPMEsyYjBaTWxzMnd1SFlY?=
 =?utf-8?B?bnJQZnhBZjJ5eFBCYTJ2eEJSTHV2cVgxUVg1STJuZmpQMGVEOXN1Ym5VRC9U?=
 =?utf-8?B?S2ZwK1VVQmRDM3EvOFFiZzRNZXI0V0NpK2cwU3VGZnF5YlNoeDFKa1JnMnBj?=
 =?utf-8?B?bHNiRGpobEJMQU1RalJtT09KajlJTlRJdG8zeDM2a3Bnd3N1MGIvK3NISTk5?=
 =?utf-8?B?YWRUUzg2TFJseUk1aklKU3paeFVSeVAxRW05YXhaREZBTHdSSUVvWGJXaEM0?=
 =?utf-8?B?TmNqQ2owemVBeGtQNE1idUZ6aGo2dGN5OE9hNEZVSk1CclM2RWdRdUhBRFhH?=
 =?utf-8?B?ekdEVU5yRTg2aVZhRUJva1B4YzloS3h6bjRxc1ZVbFl2MmNicXVVRDRPRHE5?=
 =?utf-8?B?eTB6djFjaWEzVDFQVElRTnpReHdRUkp4Z2pDZEpaZHlES1llRlVxMVR6Mis2?=
 =?utf-8?B?RkhoeExvam5TTTBsWXRSV2NrL3JCRHgxcmdIR3B6MVVZSkhHckIzTEtNWTlJ?=
 =?utf-8?B?NFAwcEFycEtVb2VOVSsveDFwcnNyVVNiWUQ2dktkWnVWY2l3cXpiMjd6TGZv?=
 =?utf-8?B?eFN1Z3d5VjgwK3F0TEIyRmxOcUwyWk9NVC9CVkM1akRFRkczUCtGakNHU3Vw?=
 =?utf-8?B?bUZsVVFFSjliVTNCaENBemROUUp5TjVlNXhUV2ZUQ3R5WW5zUGY3MVhiMFNi?=
 =?utf-8?B?dW5kYXNwZHdITG9pLzFnSzZpOWVyeW9hckd1ZXJZcmZKYndtZEZ3R0tDZlBO?=
 =?utf-8?B?ZVVBUk13dlo4TnBMdnd2dTQ0aXR2a0pTZG1aRzBSeWF0ME04MDFCQVJ5UHZi?=
 =?utf-8?B?dlR5L1M3Nysza0o4d0syVWxuUFoyVCtaTU12eEpLa3VzV3Y3SkZ6cEtuZlFJ?=
 =?utf-8?B?U0ZUc2dvZTdYU0FzWU5pQjAyU1JaYm03T29HWW5qTEsydjdSbC9ZUDh3NTBm?=
 =?utf-8?B?SVFiSlRGaXdVQVRXVVd3ZGxvSVFMKzBadDAxeW1HNE1sb3Y2NDR4d0k4T2hx?=
 =?utf-8?B?ZFEwMzY3QU1FckxlR0xYcm13OEROMmRNNlZPMUk0Z2xab1hFaFFiSWdrL3lu?=
 =?utf-8?B?M1RzaFVsODRRL3lSaWN3azFQZWlWRGxQMjk5QnJ0aFc4UWhVRUkrZDhISHZM?=
 =?utf-8?B?enJhREczTFpDMXpaenVyeTR2YUtBU1o2YXpRek0vVW0rSUdJdXVjUlRzVTlH?=
 =?utf-8?B?K2ZmYklvaThBMEZ5ZU85WldmbTBQVUlRNkxUc3kzUUtZcEk1RURHRTFwcklO?=
 =?utf-8?B?cE5UN2VDU3JtWHBiZ09hYnAxdDV3R0Z4d21ibXAxZjZxL0VKc25oMDgwNUZv?=
 =?utf-8?B?a0ZsSHA5ZzlQNmJMbXpCRnlSdVJ6NWlHZmd6YjJBQkZlbjdRaTVwUjZpZ0tz?=
 =?utf-8?B?WURTcHIzWE9oS0F2YnhnUEx4cVY3V1dINE9CbkZLVWVzMU5Xd1p3YmtPakhM?=
 =?utf-8?B?aExwTGZJZWFVRlFzOVNUN042U2krandKK1F5VmxzbG9rTU92NSt1OEMyQWlF?=
 =?utf-8?B?bmgwcFRIL0FWRXFJQkg2K2ZDR1VzcVJoYm95cGRlQXNGQUdoTXZBNjRyekJE?=
 =?utf-8?B?WjlqaEl5aFROcFlXUTVPSGMxcmNOTm9kYnB6MTB3VWhZKzNTN0VOeXM1bUxC?=
 =?utf-8?B?Q2d3VVpRQVpkTGNPc2R0MURjd05tVkl4NFRmOVFyQlVPS1dXSnZDTEdzRDJU?=
 =?utf-8?B?MDZLT0VRa2YvK3M0c2JxU2JBRm1uNmlZRmI5d1o2WkxGVVBhL0poZ014OWEz?=
 =?utf-8?Q?VNfcOdNcjuWHhwucxtV8qY4wZXMB22RPKNqRuK/?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c60c010-3fad-4058-fdd4-08d9327e0b2d
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 17:25:18.6696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLU+wiFB0F11ah/w5hB+xATSIzeC0SsoxFnEcOmqQip07nBNa/8AWiDM8CSvnfFZZ8gr+dT3pKYZporgYBvn/S2k1tRmfdtAXYeb/JR2C2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB2212
X-OriginatorOrg: citrix.com

On 18/06/2021 18:15, Igor Druzhinin wrote:
> On 18/06/2021 17:00, Jan Beulich wrote:
>> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
>> address range") documentation correctly stated that the range was
>> completely fixed. For Fam17 and newer, it lives at the top of physical
>> address space, though.
> 
>  From "Open-Source Register Reference for AMD Family 17h Processors (PUB)":
> https://developer.amd.com/wp-content/resources/56255_3_03.PDF
> 
> "The processor defines a reserved memory address region starting at
> FFFD_0000_0000h and extending up to FFFF_FFFF_FFFFh."
> 
> It's still doesn't say that it's at the top of physical address space
> although I understand that's how it's now implemented. The official
> document doesn't confirm it will move along with physical address space
> extension.
> 
>> To correctly determine the top of physical address space, we need to
>> account for their physical address reduction, hence the calculation of
>> paddr_bits also gets adjusted.
>>
>> While for paddr_bits < 40 the HT range is completely hidden, there's no
>> need to suppress the range insertion in that case: It'll just have no
>> real meaning.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -349,13 +349,17 @@ void __init early_cpu_init(void)
>>       eax = cpuid_eax(0x80000000);
>>       if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
>> +        ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
>>           eax = cpuid_eax(0x80000008);
>> -        paddr_bits = eax & 0xff;
>> +
> 
> I understand Andrew has some concerns regarding changing paddr_bits but
> some comment explaining what's located at 0x8000001f:ebx[11:6] and why
> we're doing this might be useful.
> 
>> +        paddr_bits = (eax & 0xff) - ((ebx >> 6) & 0x3f);
>>           if (paddr_bits > PADDR_BITS)
>>               paddr_bits = PADDR_BITS;
>> +
>>           vaddr_bits = (eax >> 8) & 0xff;
>>           if (vaddr_bits > VADDR_BITS)
>>               vaddr_bits = VADDR_BITS;
>> +
>>           hap_paddr_bits = ((eax >> 16) & 0xff) ?: paddr_bits;
>>           if (hap_paddr_bits > PADDR_BITS)
>>               hap_paddr_bits = PADDR_BITS;
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -524,8 +524,11 @@ int __init dom0_setup_permissions(struct
>>                                            MSI_ADDR_DEST_ID_MASK));
>>       /* HyperTransport range. */
>>       if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
>> -        rc |= iomem_deny_access(d, paddr_to_pfn(0xfdULL << 32),
>> -                                paddr_to_pfn((1ULL << 40) - 1));
>> +    {
>> +        mfn = paddr_to_pfn(1UL <<
>> +                           (boot_cpu_data.x86 < 0x17 ? 40 : paddr_bits));
> 
> That doesn't really follow what Andrew gave us, namely:
> 
> 1) On parts with <40 bits, its fully hidden from software
> 2) Before Fam17h, it was always 12G just below 1T, even if there was more RAM above this location
> 3) On Fam17h and later, it is variable based on SME, and is either just below 2^48 (no encryption) or 2^43 (encryption)
> 
> Do we need (1) to be coded here as well?

Ignore this last paragraph - I lost your statement in comment description.

Igor

