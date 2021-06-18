Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0983AD107
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 19:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144933.266705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luI5Q-0008F1-Cm; Fri, 18 Jun 2021 17:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144933.266705; Fri, 18 Jun 2021 17:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luI5Q-0008CH-9U; Fri, 18 Jun 2021 17:15:20 +0000
Received: by outflank-mailman (input) for mailman id 144933;
 Fri, 18 Jun 2021 17:15:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ssXN=LM=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1luI5O-0008CB-W1
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 17:15:19 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21d4ff3c-e749-40dc-99c9-b1ab254133dd;
 Fri, 18 Jun 2021 17:15:18 +0000 (UTC)
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
X-Inumbo-ID: 21d4ff3c-e749-40dc-99c9-b1ab254133dd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624036518;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dMSVwPPBIbnpDgqBTvEOWZ2ZifdfiU8iW1yPnQuBO/Y=;
  b=I76iihOyLGewvPU7qA0S/uyuOYB7imik1lFFaBA1G3logza24i70EQyT
   54a/at04s1QHCHaRANEx9k80/VAGMnIrghAHr/Yb1sh5AdbHPS6v+qXsx
   T7s4a806WF+Yj+gP65tj9KuNPZJX+d/HSBRaK0SZnRELd015IowcHx+RD
   c=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 15ps8/VAlFS9sB/F6ODQfuppQyx3q094sFxMEgBwPh6OQ/+X8wl2Ip9Gyofv37DPIAuhajVsZv
 lymfDs1Jhol9AaP3DahttXvqMH8Uh1Qbf18Y/VA6sU3SzkoJEdDgQHvOygRFNHTeqf/IvSr8Hg
 M7TP0sAi9rwxk3xkl84RzkT8pIbFUsx868OdulCbODIIPBuaakgkGxwXZwvIh0JyFVexRt7dRQ
 tEOsxgU2LYTD5cUZB+9inEIywZiZPAWEGoU2c2liAVAI3HksI3BhUhdRr3ObgbjO//WA+qk/Nc
 nH8=
X-SBRS: 5.1
X-MesageID: 48067209
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:FkDc06g6GxTBfq2heOzsUiPlfXBQXzh13DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3I+ergBEGBKUmskaKdkrNhQYtKOzOWx1dATbsSkLcKpgePJ8SQzJ8k6U
 4NSdkZNDS0NykBsS+Y2njKLz9D+qj/zEnAv463pB0MPGIaHp2IrT0JbTpzencGNDWubqBJdq
 Z0iPA3wgZINU5nFfhSURI+Lpn+TpDw5d3bSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK5bs562
 DKnyHw+63m6piAu17h/l6Wy64TtMrqy9NFCsDJos8JKg/0ggLtQIh6QbWNsB08venqwlc3l9
 vnpQsmIq1Imj3sV1DwhSGo9xjr0T4o5XOn40Sfm2HfrcvwQy9/I9ZdhKpCGyGpqXYIjZVZ6u
 ZmzmiZv51YAVfrhyLm/eXFUBlsiw6dvWciq+gOlHZSOLFuK4O5lbZvuH+9La1wWx4TsOscYa
 9T5YDnlbZrmGqhHjXkVjIF+q30YpxbdS32MHTruaSuonJrdT5CvhMlLGF2pAZIyHsHcegy2w
 3zCNUiqFh/dL5jUUtDPpZ2fSKWMB2BffueChPfHbzYfJt3c04l/KSHnondotvaI6A18A==
X-IronPort-AV: E=Sophos;i="5.83,284,1616472000"; 
   d="scan'208";a="48067209"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tfwn6ZJuKxbl0jjdMTnrUO1e0emSX5LbGVpa7YF8GNRfYneXQWXU9Gc7qVPqUSYAlRn6Fjti68BDOcZo+8eBGtG8SWZJ98OHA9CPFXvL3+e7QpTKVTqsOO9Zb9+GRGxVluL7zCBsZ9vyfV1uZUdpAgg51k7mkRctIl3Zt+8W2qIiMb8Gypa8GZhObHJnBNlZ8IjHjIgzu4nSUfkz5ZO26RZ14ZUDJieN4MOi7y5bZ7kcrKxMQV547lKiBhXfQAehXZiDxO1+EhxvM9KoP75aaNWRbZbq9i5Asd6hpArFUK1dG3A5rqqFHqHeKdqgfl3ov97Kbwins2PieEURUPe95g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsplhcTyofF7vdbssvmn1EOhC8L9VOs7HZ+acT1iFP4=;
 b=PSi4NNux1ahWaARg1brEJM/zU0Nlb8BAwEvNBN9QfINOFcvfjI3hpvooqwQSg5TtwqMjzUkEw56EUx+pZ7YcEN2YyUZnz/29oo3GpYSKsCnrDHCJCNtqfew6e0zRo45OT7LZAyJqBgtk3R/HUue6q5fnsEwrgwVhLooQAIh81WvZrncTTrAdM6WTZeHQ71L2JGqdQv15s0j1ZqH57gOQADzd0aJMK+DklZi8Xm3dOLWVeLgPAxIG5kvfGYvahb39ORaWxk6mz/lJrlGMWY/UcEuHw3dnQedOj3xOThetLni9QQNyHP6JJKCxXDGwKR40ifIXuVj2Z74Zg+PT5+rtMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsplhcTyofF7vdbssvmn1EOhC8L9VOs7HZ+acT1iFP4=;
 b=pHnfbo8Ko6eXoXXaiDI/sLAEV2OMAHxUDWUpk+obEWQGA+qegahqeurHnEsyru5YL1sStUoiUuBDYm9cgkfpVjHUZJ8k0ZiQzuqvQYrDuXWtqQc6xtMEoGJ/rvNlTnX88S/20xUXVMvFbdSpTl7Xq51Ujeo6QjSXPLRTxqyTHJg=
Subject: Re: [PATCH] x86/AMD: make HT range dynamic for Fam17 and up
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4f46f3ab-60e4-3118-1438-10a1e17cd900@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <1eb16baa-6b1b-3b18-c712-4459bd83e1aa@citrix.com>
Date: Fri, 18 Jun 2021 18:15:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <4f46f3ab-60e4-3118-1438-10a1e17cd900@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::34) To BN3PR03MB2401.namprd03.prod.outlook.com
 (2a01:111:e400:7bbc::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bad206aa-65bc-4a62-6d2b-08d9327ca22b
X-MS-TrafficTypeDiagnostic: BN6PR03MB3316:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB3316AE1ACC01025318007A89E40D9@BN6PR03MB3316.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CGrH4c5DPE1sW3NNCHv678cGwVHOX0Uzb1ovC1MUcWSAR/Cz+SFbOM3JSc09i2G7j9L5U6TzWmfrPMxGAoYAD5fr+c5NeIiAG7F+uK9CLMruLGNWMMK5n0davvGMDvvPOo3u4pEIJnbD4nUGdpvvxDRlwT8c8bPOgu8DAv5GdRvokKv7VpuyS3r/hJurpqYQo863eu4mt1vCd+mfQGmoDxY0+Md1y1my3trt7vpVv3UT8dgq19EDgG4U5dwBlIfAcd5XQm3VKUvsdnXtaiWlG7PLf8t0yPVKtqkJw3811UX6WASjp5GeURTl/1841L9r7xvDSAw3ANSXz4533b66qbARZMu4cSG0v//an/FpTqQoZCiX5MUAdvT9rcSxngQyKGZwEfx19WkfWe3byDHtOtpzngE6j2BPcJ9eBRG8TnifJJkWPHZmb+KXYveuC6682Se4JuW5vuVQlyaCD/XndwwuvUtkiXzypX2EhbDFvCtEf7bYSWljgksR3GFytX66bM+MdFYqWOQMlpjgcX2yKjJzX6kf/Pvt9y7ieLcdksu8albR9WTmBCrfaenjG2Q7Vu0rX/y1w9KR4qKLx8OBFJuExYRF7bWx4lnd1tHCEol2W9rb4kNKOev9zHnxuMWGu9UQdmqu0l9oH8Pu9hORvp8HRI5iqKYzeG8YegMiNzKq8UUUWcFbyFtF2ykMmzflBW6MBXiNtxFyCuc4kNcsrLN0eY19BI4Btgj7OB2uEIQG/72e79URnMdtT858mxFbRMHB2Kbn1iaGR8RIjQw2ksqJPr5TUxo3WqSTV6hOtiAru3iaUnhJMg0rNrd7QxsR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN3PR03MB2401.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(38100700002)(54906003)(316002)(4326008)(53546011)(107886003)(8676002)(16576012)(26005)(2906002)(6486002)(31696002)(2616005)(83380400001)(86362001)(8936002)(66476007)(66946007)(966005)(110136005)(186003)(478600001)(36756003)(31686004)(5660300002)(16526019)(44832011)(6666004)(66556008)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajBodEhCTTJBZWRaMmx2KzQzeFh3Q2JtMjZTYmJNc0lZRnN5RGYwcWF3SkpO?=
 =?utf-8?B?RVUxbUxKR0swZmxzaTRETlVIbXRWZmR0a1VPR0xFaDJocmlaeWk3bkwrWWda?=
 =?utf-8?B?MkdiMW1XdXFMTE9hNnoyOENaNkRtSTh1dGkyMVRvOUxzVVREc0l6N1duV01t?=
 =?utf-8?B?ZGN1bEtyMEs0SitOc0g1ZCtNOVUzcmhHMUF2R3o4S1FWNjltbU9sT2hRbDlS?=
 =?utf-8?B?ekx6NzBzRjJiSGZjT3VWTGFGalZERGk4RmxKYjdBN29HT3dBSGl0YmU0N0p3?=
 =?utf-8?B?bGtNTzJROU0xb2F3MjdwVjVCN2dHem5nVklGaUVVOTRPVE1iZUhXTVBBMTRO?=
 =?utf-8?B?L0tHeGE0ZmdoQ2dVNHNPV0tFWXR6dXRWd1lOVXRWVE1lakYvL3A5VUw0M1V4?=
 =?utf-8?B?ZHZCRVVudW5kYnJLNS81TEJ0U2NmSUhlOTNmWFJSOUxRNExXUWVtMFo1MnU5?=
 =?utf-8?B?NmhJUHRUall2RWU5OWI2SVlGNUQ4a1ZCSWpaYWpMQlRYbU1IdjNrY3RvWjJK?=
 =?utf-8?B?R2JqbmtKUnJicW9obXU3MzhMNUxhQVloM2hjTWVXL0Nnd2tEMnFWNjRQRlBt?=
 =?utf-8?B?VjdrRTdDa3BzRVNuclZpZHorcW40TlBsUEVCY21PZ05tZXBnaE5TdUZZMkRy?=
 =?utf-8?B?c0dKTXZrQnhsNlZlR1BsK09hSWRLZ0JoYTZMY0JKWUxMdUVwdklubDNNSjVH?=
 =?utf-8?B?SmRlYWMydlFDUkdrMlBTZmlZYjRBaHFXNHg2cXFJaXREUGI4N21XU3A2c2Fz?=
 =?utf-8?B?NXF3S0c0MXJtK1hGdER2amdqWXMwN3J5ajRFNE4wOVVSRG84N1FnL3V3L0Yw?=
 =?utf-8?B?cjBrYmZNdE4vQnZ1UnMxTEtyeHRLRHJsNk1NQ3FoUGhzUzkwWWNNeFltcVVu?=
 =?utf-8?B?K0lTak8vazA0UmlQL3Y1WERoK1pXbHkzd3FnejZuNDNCMDhnU3lHSkxOTUlj?=
 =?utf-8?B?WmVVek1UUUVWeUJKZklubGZUTDhEeCs3NHJGZ2cxOG9ZU294R3VneGN1WGky?=
 =?utf-8?B?V0hlYm5KWTBGMWNYNVViVmVqVG9QR2cwVUlwN0ZONGVSUkdDOEs1ekkvL250?=
 =?utf-8?B?TnpwTVgrQVdkaUZJa3lIcDJEM1E2andpQVFYK3lxWHJsTzh3RXZoOHdSbUQ0?=
 =?utf-8?B?K2xSMGE4Q21WaDduZFRuSTg0Ukx3L1Fjb25zclYvc3ZyV0QzNzV3ODdDbm11?=
 =?utf-8?B?OFdpRVoxQlRJcGFUV0p2TXpYUTA0TVAxcXlKZGloZEFUa2xoa0NCQ3ZPQWxv?=
 =?utf-8?B?WXVHSnVxWTlMYU1qWC9pMW93SGtlMlZPcDV3S3BsZ2F0WS80MFQ4Z3hSS2wz?=
 =?utf-8?B?aUwxZTYvN0QvN1NmWlNjeTVVNTk2d0FVT211UmgxSyt4a1dlQTVodkNnbEM3?=
 =?utf-8?B?eFdHSklrUTJFN0t1MXpxUUovUVZ5U3dEZjB6SStRYWtyQ3BXbmRYdlppR1pZ?=
 =?utf-8?B?dkwrSzVNWFpoWjVhL2NReDdqb2dsOWdYSmVSV1V5T1BtQ0pmenU3d2dNcE5W?=
 =?utf-8?B?ZXJYd1p3czY1VEIvM09qV1d5WXUyMWkveDlsL1VIZXFoTkF4dFZiU1Ntc24y?=
 =?utf-8?B?T2lXMkJZVEE3bVp5L3dlcy9lNGExNFphaUFHMm13MFJVNGE0eUJnaE9UQkZn?=
 =?utf-8?B?UzlVcWVUV245WCswV2dqY2o3WFhVRWgzZ2hpN0d0QmxDYlA2ams0ekhIS00w?=
 =?utf-8?B?bHFrVFlRN21XWkFiVzZUZzByY2VtS21TY1NsYi9ndUJta3NWWWVIbkJpSVRD?=
 =?utf-8?Q?s+I/9GmHFMObEahRpp1o29tXkhxf2KntL92omh8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bad206aa-65bc-4a62-6d2b-08d9327ca22b
X-MS-Exchange-CrossTenant-AuthSource: BN3PR03MB2401.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 17:15:13.0203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wxgkQNFA00mnHvwhBUf2jrdsomCV3ghZO8nHGCgCT033pID1Karw3icslLSvmQFM/fSr8VxgsGH94Ar4/Cj+o7LEqxkQNb6oxZm6l3LT3Oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3316
X-OriginatorOrg: citrix.com

On 18/06/2021 17:00, Jan Beulich wrote:
> At the time of d838ac2539cf ("x86: don't allow Dom0 access to the HT
> address range") documentation correctly stated that the range was
> completely fixed. For Fam17 and newer, it lives at the top of physical
> address space, though.

 From "Open-Source Register Reference for AMD Family 17h Processors (PUB)":
https://developer.amd.com/wp-content/resources/56255_3_03.PDF

"The processor defines a reserved memory address region starting at
FFFD_0000_0000h and extending up to FFFF_FFFF_FFFFh."

It's still doesn't say that it's at the top of physical address space
although I understand that's how it's now implemented. The official
document doesn't confirm it will move along with physical address space
extension.

> To correctly determine the top of physical address space, we need to
> account for their physical address reduction, hence the calculation of
> paddr_bits also gets adjusted.
> 
> While for paddr_bits < 40 the HT range is completely hidden, there's no
> need to suppress the range insertion in that case: It'll just have no
> real meaning.
> 
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -349,13 +349,17 @@ void __init early_cpu_init(void)
>   
>   	eax = cpuid_eax(0x80000000);
>   	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
> +		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
>   		eax = cpuid_eax(0x80000008);
> -		paddr_bits = eax & 0xff;
> +

I understand Andrew has some concerns regarding changing paddr_bits but
some comment explaining what's located at 0x8000001f:ebx[11:6] and why
we're doing this might be useful.

> +		paddr_bits = (eax & 0xff) - ((ebx >> 6) & 0x3f);
>   		if (paddr_bits > PADDR_BITS)
>   			paddr_bits = PADDR_BITS;
> +
>   		vaddr_bits = (eax >> 8) & 0xff;
>   		if (vaddr_bits > VADDR_BITS)
>   			vaddr_bits = VADDR_BITS;
> +
>   		hap_paddr_bits = ((eax >> 16) & 0xff) ?: paddr_bits;
>   		if (hap_paddr_bits > PADDR_BITS)
>   			hap_paddr_bits = PADDR_BITS;
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -524,8 +524,11 @@ int __init dom0_setup_permissions(struct
>                                            MSI_ADDR_DEST_ID_MASK));
>       /* HyperTransport range. */
>       if ( boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON) )
> -        rc |= iomem_deny_access(d, paddr_to_pfn(0xfdULL << 32),
> -                                paddr_to_pfn((1ULL << 40) - 1));
> +    {
> +        mfn = paddr_to_pfn(1UL <<
> +                           (boot_cpu_data.x86 < 0x17 ? 40 : paddr_bits));

That doesn't really follow what Andrew gave us, namely:

1) On parts with <40 bits, its fully hidden from software
2) Before Fam17h, it was always 12G just below 1T, even if there was more RAM above this location
3) On Fam17h and later, it is variable based on SME, and is either just below 2^48 (no encryption) or 2^43 (encryption)

Do we need (1) to be coded here as well?

Igor   

