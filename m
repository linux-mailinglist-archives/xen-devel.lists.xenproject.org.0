Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FAA52D09B
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 12:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332821.556586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrdSV-0005MS-Kv; Thu, 19 May 2022 10:32:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332821.556586; Thu, 19 May 2022 10:32:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrdSV-0005Jm-Hu; Thu, 19 May 2022 10:32:43 +0000
Received: by outflank-mailman (input) for mailman id 332821;
 Thu, 19 May 2022 10:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrdST-0005Jg-Tm
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 10:32:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 020c6488-d75f-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 12:32:40 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-16-Fiy5J7WUO7iDUpTAfkAEpA-1; Thu, 19 May 2022 12:32:38 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB2907.eurprd04.prod.outlook.com (2603:10a6:3:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 10:32:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 10:32:36 +0000
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
X-Inumbo-ID: 020c6488-d75f-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652956359;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eRcYCD5M3FR7ndpQdaBQaABts0RuTBNmeFNj4DwBthE=;
	b=gTpFlVwTunlxex1V/9/wTLPtF/qyzii5SLGm3k94PQ5/VcQ75GUPKBH6c0tR9+rB7Gehag
	zeibQJvN2PuLPaOF9ocRy7BPTW3erRfgkj/sPKSStMDTcDxI0BDZ4XVphG1j4eqgCpD9Vf
	w7U0QzAvnMHNrUaV8mtKSym8DMNnXfU=
X-MC-Unique: Fiy5J7WUO7iDUpTAfkAEpA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is8R2LvF2RoF+WKAcSupsewKMncEgpSPDgC4u57SbMzJIMH2se9Sw40TXIaCz/BJ3uZ1AnwvY/BGlUMWAqfiAYgEv6n2k78mNrA+czUvPRHN6B09r+E0q8P9b5G5YedkXsdKDFFGfbZKJRyB7zpvHeWRSa6MkHL1LUvsXMngtlUuK7aa6761FbL/k/V4cb9WH39GJS+WghQQKBufq3bbIt4OzBBlb5ffcn//pL0vFOGO6jT1izkYpQgipCizNnxh2ypncGkOdPfu7JZ7MTDhNhrNLoAJ9xjRpjX9/7LMXuo+lAIoz6PaXDqRTRRjLDt9X0CFMXRRwPBueIQrqnYbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eRcYCD5M3FR7ndpQdaBQaABts0RuTBNmeFNj4DwBthE=;
 b=HhaW+hrQjA0PBmbYsQZ6iVHg/RFJxVBP8mQYFwCeIX7FyPdpFJB/3wu3e+4+qSQoSKD/BAqgb/bDUyo15KiY6Idex0048yurC9j2HjKVb9RZkQW1Rrb6FzU3TJzmJP6ddMxh7xKdx/tBJtt4Iv8Yfunxf7Ecpe26RHCJSjHHV8Q7CwltQBqOx73I3KtymeBcibS0DIDkr9/krlsMFmF/B1gqGMqBJuYy509MHBHr0vlSDMHXTz81l9+GzAphoN90PbMjUJCeK4pVh7h3/5qXOBiFjuLchtyZKD49DH/WMYK8EZzw4eYgzdMZeMgcLzTYfIrfnLhyzUU0sZkxXDr7OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2add184c-04a5-3ca0-876d-e354f35df62a@suse.com>
Date: Thu, 19 May 2022 12:32:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YoUtuDhVimlP7r8F@itl-email>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoUtuDhVimlP7r8F@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0031.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b1f48de-0c34-4125-d2ce-08da3982e3f5
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2907:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB29074CC0B8F1FDD0EF867282B3D09@HE1PR0402MB2907.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ch7EimI0CdASbDEjYtS61/f58RZjBummLSoI3k9P5+lOLswtPo7NwRsdesHRR+JktDGz1HMzPdnh3M0WX1QjM5wyURwQmSk3QvdI0q8kfXD8v2Prluu3u62kIjWtrHi7sQLAqqnCuFDuf4Xtn9/jYzIWOm84WhlMim4jV6sYUBMfptMLwFvQjb+1XHJmb2ABY2zh0UdaTkDd5np3OBILmOwfHo1ORlnZTmwOyYvITHeDAynRpkFDuMlkHq1/2WK2hz3VtgmmB5NcKdEFVC1JbVeQ2GD55FcLBNJLgx8Y9HqCmKwJHlLQbMymKaFQQCSYAPMZ6HY7ht9xLvPFqrh+VoHd023i8fAl8f48nLEYyOhIEahfoHKPxF89ztyYtPjhk7uV+jXxv+BRCql4JiolTOPY9Eh4pJgU8KZg/Fs/1aRnaKydQITN95E6C+r4Zid/ss+1d2tGFv5SMfOUlwIlU7xjwhysoFyG7mEt7cI2BX3cZSEU65NskfT2DPaWbpJzEdV4NR0N0gk6SZZ+nHPO5zEfBNV8BGANvFUb9R6EXBXjoo40eX0KpQx7Pd4sA+10iQl35u+tqiDxB0eunvDoGe4TsQQ4bomXIa9WDFZMpL+iYBeNzXckEs/1BpVdrOXDvzQ/9inGWx90UKkcPPXbeptwyzoENSF5y7ApPJ+VDDJwVOGkQ0QH5wXsBCc1oJhRwNlz2qpWW5ofdVMKF/duRee4nrkrw4FbZQTafV18Bj8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(186003)(2906002)(6666004)(53546011)(2616005)(38100700002)(4326008)(83380400001)(6506007)(6512007)(26005)(31686004)(36756003)(5660300002)(8936002)(6486002)(508600001)(316002)(6916009)(8676002)(66556008)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXVPNUk4NGVoRGVVa3JNNHlxVnZoQ2tlYmlNUitGT1Q1M1dwOWlNMGJIOUpK?=
 =?utf-8?B?RU1ybFZaY3hkWHRJNFQ5V0x3anF0dWZEd253dDVabVpqU0dGUDgyU1RjOG9i?=
 =?utf-8?B?bElTaU4yN3gza0NOMFJsZTNBWjgvYU1VbDlPZG5GOUQ1MWM1RnlWUzlybXZM?=
 =?utf-8?B?bzZORmFEQ0M2MVJpekF4eXV0ZU9MSzJIOEpXeHR1NXl4RmxkVXJsRnZ0WVlx?=
 =?utf-8?B?RXIwdjE3aFQ3K2cwYXFVZWhETVVQalFBMHVHYUFXK3VpbzhRYzhnaUsyTnhJ?=
 =?utf-8?B?SjE5UzkyRGZMNTZQSVY3b2p1eHdPWHJaVEh3YjNsVVRKcUZ4cURaNndKZ1ND?=
 =?utf-8?B?QzI2cnNxNW9pWFBEeTRYMk1yQmxLMytXcVVXTGtlZGlPcDR5OUkva1Z4NG5y?=
 =?utf-8?B?VFI2d3ZzaU1HRThSUjl5eFFPSDcxaWVYWDIrNEM2cFNmNXpNd09FUzgveXk5?=
 =?utf-8?B?cUxtektUM3pyQkJnM3NkOXZyU2Jqbm1FcTFEQ1RZemdqSkttaGpPMkp4aWxI?=
 =?utf-8?B?dUtQNmQ5ZDBxK0pubklwMlQ5Q1g3S09IczVjUHB5QTNYTUVyOXJLcnRnK2VM?=
 =?utf-8?B?ZWxCMWtyanhZUWhPTnV0dng1Zm9hV0ZpWUkxU0Y2QlQ1eDZ0UVEwSWVQVTdY?=
 =?utf-8?B?VFJ2SExPQmhxSXEwbS9mZVA4eHhUNUxadHUzV1ZtV05Vd0huTDlGazlJMk95?=
 =?utf-8?B?NHRVUzN0Mk5aVm1KZ1BKZ3VBTjVjTzBkZ28xSkVRTXBOU2xjM1FLdGhGUkFJ?=
 =?utf-8?B?dmZLaEdBM0kvajhRWkZYdzRMOFpZOWtnTGxTUmFYaVZnU2FYdHBxUzY2U3RN?=
 =?utf-8?B?aGIzblpLZFpSWTRCclJ6OEIzU1FOa2tqRWI2VkhxTDIxeStJeFZoby9wbEpx?=
 =?utf-8?B?OUFYOUtFbnh1c2JIZjlzTGp4U09aemp1aDRtTUpmOU9lSTNCMWg0cWNwLzVB?=
 =?utf-8?B?enFPZmgzOSsxSldJdHNQa3IyNFUwQ2hXQlllcGlnZlBqdnA1RDV6b2FZdzhq?=
 =?utf-8?B?dW4vbnY0V2tqSnhYVEhaekVtcjMyUjR5dWhHSS9uYUlmTVVKVWJ1YUFTMGh3?=
 =?utf-8?B?alFpYXplUUdqNW0raFgrQi8yMHZBbUN0Vi9kQThpR2g0bHdlalppVmdoU2hl?=
 =?utf-8?B?NHl0dC9IQk5pY3B6a0hZQklaRzZyUjZoaklwTzkwWGdDNVR3ZnFKQTc1MVFz?=
 =?utf-8?B?bytRazhBeGd2OVZqTzJ6dlk4RTFoMmFqZGc5RGU1eTNSNktMYUFsaGU2M0l2?=
 =?utf-8?B?YSs5enhSN3Zqd0dOUXZ4TG1aMjlUbUh4NThJU0hCWnE5dXZuZElmVk5xdVZD?=
 =?utf-8?B?MDFKanR3eEFEdnd0YW1xaGRNb3lHbVZWK1lVcEJiNFozMXgvOWhqYmZoWENS?=
 =?utf-8?B?dFpEU2gvRUVodE5uRVBBUUFFRmJ5eUN1SjVnaE9OMlFDak53Vkp3VWhFR3JJ?=
 =?utf-8?B?NVJiUmc2WmFzbVhza3hUcTRieW9sQmgrQkFTVDFFR2tWWXQ5aXZTSXdydTg1?=
 =?utf-8?B?L0dCYk0va2J2TW9maTFQNFhLdjlGWHZHWTQ2WVVDOUxpMUI4MHRCVUJ4di9O?=
 =?utf-8?B?NlpwVy9OeTg4cm0zNEhzWmRTL0dUZ0VMdFFkZ2thcnZvKzlFVnoxbEZodk5F?=
 =?utf-8?B?cWVYcnRTckZsN2JOSmJZRDFuVFhnSGJldnlmb3lEWUhMOWNMR1hPVmhYbXFp?=
 =?utf-8?B?OHRNUHo1OFRyMGN1Z1BpRDRraXUwaFJtMGxoaFZSUGNUMERnU1ZvczdicUs0?=
 =?utf-8?B?NnZYZm52V2U0dCtHU3dDcmtaUnlmL2hJYzRRNHVBMXRMRGc3aWUvb0tVbS8y?=
 =?utf-8?B?eXhlNE16U0hEdkNXQk5GQlRrOCtHMi9jQlRpWFYxUlA1eFZ3UUgzTlA4QzBs?=
 =?utf-8?B?U0JJVng3N0VaZ1N4aTZmQkQxWHRlaDA5dGxBb0FqNWdDOGpNemFuMlJSekky?=
 =?utf-8?B?WlkrK2kzREI4VkxKWm9nTWxxZnI4MWtrRWd4YU5FYWhOS1pBT3ZCdzV6NTZW?=
 =?utf-8?B?TWVMSnJ6NjZsS1FCbUV5K2loOFNRd3Q1YzZ3OFBMcnlyeEVLU1FRcmV3TDht?=
 =?utf-8?B?MWw0d1ZiMHFTYXV1YmdpTVBTSWRickozVENUL2pEWWtTUjlVbmFudExCaCs0?=
 =?utf-8?B?d1drTVl1OHZTMVJkc2QwRjB0N0tzUHY2bkxrVjZrYVlzd0syM3hyVFNObG5v?=
 =?utf-8?B?WjVsUWg1STFGRmlBaFpxYy9zbXE0NWxrMTFNdGIybVVueEJJeUhBNHJRRWN1?=
 =?utf-8?B?UzFnMXdmb1dBOVZjUUIzNnJCK0NaYmpDelh2am8rWXhZVnB4Z2EvZzNDaWtL?=
 =?utf-8?B?TmNReE9aTHJ6RVdGTnc1L0lnZkg5cU1JQXJGOFR3MDMrYUFCYTVDZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1f48de-0c34-4125-d2ce-08da3982e3f5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 10:32:36.1916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LvhZJ9WEkzT5UFnUlUDCqIe5LT1AZkCJb8nib+0hN+XSKMGUsh50hPolsbkIm1hj92CI/G1qmbwrTDqMD6yxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2907

On 18.05.2022 19:32, Demi Marie Obenour wrote:
> @@ -567,6 +587,39 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>  }
>  #endif
>  
> +static UINTN __initdata esrt = EFI_INVALID_TABLE_ADDR;

Just out of curiosity: It's an arbitrary choice to use this initializer,
i.e. no initializer (and hence zero) would do as well (with ...

> +static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
> +{
> +    size_t available_len, len;
> +    const UINTN physical_start = desc->PhysicalStart;
> +    const EFI_SYSTEM_RESOURCE_TABLE *esrt_ptr;
> +
> +    len = desc->NumberOfPages << EFI_PAGE_SHIFT;
> +    if ( esrt == EFI_INVALID_TABLE_ADDR )

... an adjustment here, of course)?

> +        return 0;
> +    if ( physical_start > esrt || esrt - physical_start >= len )
> +        return 0;
> +    /*
> +     * The specification requires EfiBootServicesData, but accept
> +     * EfiRuntimeServicesData, which is a more logical choice.
> +     */
> +    if ( (desc->Type != EfiRuntimeServicesData) &&
> +         (desc->Type != EfiBootServicesData) )
> +        return 0;
> +    available_len = len - (esrt - physical_start);
> +    if ( available_len <= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) )
> +        return 0;
> +    available_len -= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries);
> +    esrt_ptr = (const EFI_SYSTEM_RESOURCE_TABLE *)esrt;
> +    if ( esrt_ptr->FwResourceVersion != EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION ||

Nit (style): Overlong line.

> +         !esrt_ptr->FwResourceCount )
> +        return 0;
> +    if ( esrt_ptr->FwResourceCount > available_len / sizeof(esrt_ptr->Entries[0]) )
> +        return 0;
> +    return esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
> +}

Nit (style again): We generally put a blank line ahead of a function's
main return statement.

> @@ -1067,6 +1122,46 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      if ( !efi_memmap )
>          blexit(L"Unable to allocate memory for EFI memory map");
>  
> +    efi_memmap_size = info_size;

I don't think this global needs setting here, yet? The local will
do just fine here, likely yielding smaller code. But I realize that's
connected to how you did your change vs what I was expecting you to
do (see below).

> +    status = SystemTable->BootServices->GetMemoryMap(&efi_memmap_size,
> +                                                     efi_memmap, &map_key,
> +                                                     &efi_mdesc_size,
> +                                                     &mdesc_ver);
> +    if ( EFI_ERROR(status) )
> +        PrintErrMesg(L"Cannot obtain memory map", status);
> +
> +    /* Try to obtain the ESRT.  Errors are not fatal. */
> +    for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
> +    {
> +        /*
> +         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
> +         * so that the memory it is in will not be used for other purposes.
> +         */
> +        void *new_esrt = NULL;
> +        size_t esrt_size = get_esrt_size(efi_memmap + i);
> +
> +        if ( !esrt_size )
> +            continue;
> +        if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type ==
> +             EfiRuntimeServicesData )
> +            break; /* ESRT already safe from reuse */
> +        status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
> +                                      &new_esrt);

I should have re-raised the earlier voiced concern when reviewing v5 (or
maybe already v4), and I'm sorry for not having paid close enough
attention: This may add up to two more entries in the memory map (if an
entry is split and its middle part is used; of course with an unusual
implementation there could be even more of a growth). Yet below your
addition, before obtaining the final memory map, you don't re- obtain
(and re-increase) the size needed. As to (re-)increase: In fact, prior
to the allocation you do there shouldn't be a need to bump the space by
8 extra entries. That's a safety measure only for possible allocations
happening across ExitBootServices().

And yes, in earlier versions you had

-    info_size += 8 * efi_mdesc_size;
+    info_size += 8 * (efi_mdesc_size + 1);

there, but that's not what would be needed anyway (if trying to avoid
a 2nd pass of establishing the needed size). Instead in such an event
you need to bump 8 to 10 (or at least 9, when assuming that normally it
wouldn't be the middle part of a new range which would be used, but
rather the leading or trailing one).

While I'd be okay with addressing the two nits above while committing,
this allocation size aspect first wants settling on. Personally I'd
prefer the more involved solution, but I'd be okay with merely
bumping the 8 (plus the addition of a suitable comment, explaining
the now multiple [two] constituent parts of a seemingly arbitrary
number). If you want to go this easier route, I guess I could also
make that adjustment while committing (and adding my R-b).

Jan


