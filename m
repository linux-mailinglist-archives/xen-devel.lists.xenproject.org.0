Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 770C85573B9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 09:17:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354444.581537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4H4i-0004kN-Ck; Thu, 23 Jun 2022 07:16:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354444.581537; Thu, 23 Jun 2022 07:16:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4H4i-0004hz-9f; Thu, 23 Jun 2022 07:16:24 +0000
Received: by outflank-mailman (input) for mailman id 354444;
 Thu, 23 Jun 2022 07:16:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CRa/=W6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4H4g-0004ht-LC
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 07:16:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6135f368-f2c4-11ec-b725-ed86ccbb4733;
 Thu, 23 Jun 2022 09:16:20 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8329.eurprd04.prod.outlook.com (2603:10a6:10:24c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Thu, 23 Jun
 2022 07:16:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 07:16:18 +0000
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
X-Inumbo-ID: 6135f368-f2c4-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nk3kMSdt9SsMHqiK+3P6Kzz0oRoIglibiGBSPLO57TEeqKJUyJ9kE0I8wpyWwazU2xJkwBLOv+M9+R4/dcOoDiHdfMs+KOSTKcaN8C8EEPBubRXPD4HEsYfm+iC7MQvEUJPgLz/HDpIgzfVZ0h8Wkv3UK3gnAZqo8DeIkoJToVPfXoMYYM7zad9ecM6EmoLlUNzdIiT4s7CKLrm6lRrpwx3WwwcxXQp54gCajBtbRSVEsuzLyJtVZ2sAfhOawuTmsN6yJ9qrPNT+J/BK8AHEJoIgt3b+Q7oGclG1kUNmBkA3BPKu2B1t8nJzXwJjLxxpw7H7ZfLfpIbftgayYmNaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDgs1HB882nMw2vbqio/+G1oDHLLiit74yvDM7dk/N0=;
 b=V8520zKTOp3BHiXWm5Jh7gLMeNMksoLg2fzjibTfTYCItrafKrZyinGZfjn8VlJPcPagcko8HRG9ec4fMwd2yXmkdW6omdEyi6I4e11rFHpeZfpV/HxcshCSPQRYboz+L4zfvN/UPnQAvkZpFSBZOkmTJjkuRTeGfZ5navBPMM+4tSkoKGce2esvvdCvZ/vNhR10SBunaWVly5VnZIKqL3UzDpe33U0VOOZu1vKPGenwCDO5nPg/lPYF8J9+EDGhmu5XSwfTxlK8zmd28Nwh+k+SmFw5t8cF38EEHAnFsy5IqFp1gOSW3lh3b39o3lLyWcN+6FycR3QxFl5xO84f+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDgs1HB882nMw2vbqio/+G1oDHLLiit74yvDM7dk/N0=;
 b=LYrQWJSz0m3eDeiAE7c/pG4wvL4R9mepizO/kqm4w+Ir14+w+/nO3BxIjauofxLeT+y2L5Sikmh0Rn9SVHqflEUpCVpfhaFfq/Z5aCfpoUEHPBeJCa391ciRmPQ9bEO2l1vDDRg7rfTu2MZgIsStlxkhn28zRo9iPzijmkstgCDQGASumepgebDYZz3B2a0xuLPVIfhG4X4oJT+NR7GK8vwipyLCMebWfxjAdEbRcZu0ZJovUZdUo+q4Z2hnSfSF7iljPcesYYmq+FV2dUq4lciLjLZ3/brmu3mpCKvKeHbN7L6qr3DzIkPcFwf/QHADt00FcwxhfEc4+sjAPeb/ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0114927f-ac77-83c0-5a58-4eef712b4fc8@suse.com>
Date: Thu, 23 Jun 2022 09:16:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v7] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <7b2f97eda968d6db368c605ff0350d732554c39b.1655860720.git.demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7b2f97eda968d6db368c605ff0350d732554c39b.1655860720.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR0301CA0050.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 023eab80-4c6a-479a-592d-08da54e8446a
X-MS-TrafficTypeDiagnostic: DB9PR04MB8329:EE_
X-Microsoft-Antispam-PRVS:
	<DB9PR04MB8329938E80498CDE53BB4886B3B59@DB9PR04MB8329.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RSgYxLM0kDjKQgHsbjPoCoxnnq7qDIYi3uYlCybvIU9AFroGTsWzq0yKZWwqz90aQfQ1aTjtIZEVy9xrBnxrBe1AzpVxYSIYg8ZKfj3cPKM5/5m7cB+bhltGojpoHqA+XTH8j0PN+h/CyRliP0zTyFUzLCnXthCbytP1Qfa3zWgODCTEcu5NUL5ZunyPoxws7ytfe15/FoAH88Kw+onM5JEPNEFnsi/3Rf1CTKziAgLfnL0vj1BikjzyjRCDRzLzo600cwK/cTJAwm7EzNwu9PmdN3NeGJaowiN8u/K8kD7Ffh0dMfNwDK83L7eiG0J568j/qbJsdkmmk7Rg3QWpdJBo3SRTyy9dmWILl4kV3ghbd1xVpljrDctJkEk+y2c+oCBnPz7yDAU795ARdqWSFD3vtYQEj6tKfaDcU16NHd8TdVmYGY9xIiyFvLBZZCcfwuLgRmcAEB5Lc00SRreVuxriqrHBneoU3Lc71QU6CbIFzl2SfWBqL2qOiTMAU38Ww8TP74mPB1FzBWQ7ZCCBeVNMnXZ7CKKsVqnHTS87KRQ5LO957MLkRSg32iyJFNKuB/TZboPGl5Isf/1PSpM+i1AA3tCYUbmoBbRYMa+lJL9+s6e4jcVNd8WE6ydjrcnsoi+wldX1cuJZhAY6sacqHWnmtlnistKAm3XSk7Fr8nYImR8bpH+IlvoHiQ3vRm3Z0Wr5jTfYGra9PlgdfKoc87tuiFD/ygvD0K+3QrWr03h1s9k5C7IWM6SEg8qA1N4hvcRZHCHExzu8o3JBumL3Vv2N+vi9/i20o0ToB1X49yM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(346002)(136003)(366004)(39860400002)(31696002)(36756003)(86362001)(31686004)(6916009)(186003)(6506007)(26005)(38100700002)(53546011)(6486002)(8676002)(66946007)(4326008)(41300700001)(316002)(5660300002)(66556008)(478600001)(6512007)(8936002)(2616005)(83380400001)(2906002)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzNoc2xWS05Fd0xtR0JTNkxCSDB0NEsvNEU1WGJ6c0lKdXZqMENCbTFCdU1T?=
 =?utf-8?B?S3dsWkhxbmVkeWF4VXFkcElkNUxKYlA5WDdOcG1qdit4ODVjeHlBQjN4VHNV?=
 =?utf-8?B?MW16alk0a3dNbE9NZ2lWU25uL2l1ZUhrVjVOOE5xZjBuQ2M4clRLaTV1dW13?=
 =?utf-8?B?SDhnZzFJclk3Q0Z2ZW13bUFDS1RoUVR1ZmV5QXRVdUVRVXFwQ05PaTgzWGlG?=
 =?utf-8?B?cHArMTJQSEY2aS96VDRxbGpkRXk0Y3VvZlR5WWk4Q014aXhuV3dBYWkzeEFs?=
 =?utf-8?B?S2pTYm40UDhMMUpYYnkvVGE4WkxFMjBrNTRza1MyY041eHozdWM1Qkh5WEZi?=
 =?utf-8?B?VDM1d0o5akgyYW5KSyt0WldWeGhYR0lzalJ0QXBab3VURmZLVDYvdWJZY3lP?=
 =?utf-8?B?Y1RWZzd3NnVlQitnYXMvNU1EREZVbER2d1hBWkhYaktwTFRWVCtJWUlnMUxS?=
 =?utf-8?B?azZxb216NlFkdXZlZ0E4WHhjWGczWFhQRzNURy9vaThRS3BOS0IxWXBaZHBN?=
 =?utf-8?B?LzlHM250ZmViT1ZheXFBN3hoQlVNVnFnd1FiU2MycU05OXoxeFBaaDZ2bk1K?=
 =?utf-8?B?WFdQZEN5S1pEMHltaXJzSXNOWmRQZUtQVHhyRTNuanpWbXBJZWNnZGxvOVpH?=
 =?utf-8?B?SFNiSEpnM0lYeUE5L1lZbUkvZnRZN0o1a3JBSjZiY1NMTTdHUXU4enZocEx6?=
 =?utf-8?B?V0tEZnh0dnV5NmVDU1JZOWVDdWE4MGIxaGlJY3dYcXArbTNtZitUL2R1T1FR?=
 =?utf-8?B?NjJPRm1RRis2MGpYL3o2MThhTlBmOGltMlVNV1lnajlBSGNweHV4QktLYUpB?=
 =?utf-8?B?SngxMTA4ZmhkbUZlbnIwbDN3OGszN3FzaGREZXNjaHlRWk5DbUUrVkhsWGI2?=
 =?utf-8?B?TTMwbllPcDl2LzFoOTFyMnhkS1o1MitHWjZya3prbTdvRGgxQ09GcUo4ZjNM?=
 =?utf-8?B?T2tyS0NhbG5lQUgwL2RWMkI2YnhsM0RubWxkdFRqaVhrZDgzNjl5QUdCL3dH?=
 =?utf-8?B?WGE4V0ZwWmdwSnVtTm0zSC9LRDZCTDR1KzU4SlFENURXbTNTeUpUSGlaYjFV?=
 =?utf-8?B?TjI1eVpWQ1VmK2FPVWp3RFFxVmdWVWJOcEpEcC9ZYWNkMkFwSlBncFJURE1v?=
 =?utf-8?B?REJGb05CUlFzTmY5RDRhTDNwb0VCR0tWUG9EMXJsbFB6ZktIUGkzUzZVZkwz?=
 =?utf-8?B?T2ZhUWNaQWN0amc4dE1BY2lpTEp0YUdvcDFTTHVyZS9WcU15dHgyL0hLcHY4?=
 =?utf-8?B?Um83WmVRU2p4WjdmMGk4R3JRU2JteXZ1bVRtUWtaMnR5MjFGMGtBeUkvUGt3?=
 =?utf-8?B?QjBtM1QrL3RGSEhKTkQ3SVhPdjhzLzhMQzhjK3ZMU0dkcFVYUlFXbmVJcWZR?=
 =?utf-8?B?Z1RONVVzUU95R2k1QnZvdnNwcnpYK3ZPa2ROWVZ0bjErZ2dYYXd4M055Tlhl?=
 =?utf-8?B?SlFGZkoxQmxrRXVxR3VOZnRTUkdsQzFCQ3dGS3A0bXY5S1Q2ZUlNYXhEMzU3?=
 =?utf-8?B?aGZxUWhMcHhnanoxZ1lKSXNKdGcyZW5WZTBGRnAydXF6c2h0K3U1VzY2QndT?=
 =?utf-8?B?cWxtUFRmT1FKTHpWL1FQdTQycnhmZVcwTG9yU1ROb3hTY3hEUEFNUlRqdThQ?=
 =?utf-8?B?SGIvbGJWb1ZFRi8yMHphTXdlbTBTbDdZVGZhWFQzRURLRHUvbHRldjQ3STdH?=
 =?utf-8?B?SjVwMDIydE5mSjdDTnh0bk9DN0wwc04rSm5TZW9pTS9ySGp0MEtyVlA2aXJN?=
 =?utf-8?B?WWhZdnFVby9ZV1ZLd1JqZVdvSzNFb0xVV1gzN051aExNVFRiaGZDeGZ6QXF6?=
 =?utf-8?B?UnZxeXVycmxwWjFNdkYvYytFaWJ4TWRNSFNxWjlSdTBDL1g4QlYxcHpwMFQv?=
 =?utf-8?B?eUVST3lLYWdma2c2dGNPdkdOOElQVkpkL3E0TW5DeGk0ZEkreVZvZ1BwVGpE?=
 =?utf-8?B?SzgzUzJJK2ZiQW94REZkYU93S3NValBFRWRISE03b0lHcGhudENaWG93TjRx?=
 =?utf-8?B?c1JsMlhnU2NhR292bkNHOWgrQVk4Ym4xNkpmNmJBWWcrUFpCWC9qNDUwV1Ix?=
 =?utf-8?B?dkgyWEM5TE56cmxCSjZSZlBKSHVPSE9EeWlMWElKTUJLSERKR1ZiY0NWUFRE?=
 =?utf-8?Q?6RQS3AQmQEiTDuM/a27PgECD4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023eab80-4c6a-479a-592d-08da54e8446a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 07:16:18.4562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W53SCu0ldH3VE3jJ0rTDPvBqr/H9KWavxLZzZu22r4FZS9qv0eBHR3/6XE9syF844aqQx8l0TTUD5VIH5Lri+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8329

On 22.06.2022 03:23, Demi Marie Obenour wrote:
> @@ -1051,6 +1110,62 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
>  #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
>                                   (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
>  
> +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
> +{
> +    EFI_STATUS status;
> +    UINTN info_size = 0, map_key;
> +    unsigned int i;
> +    void *memory_map = NULL;
> +
> +    for (;;) {

Nit: Style:

    for ( ; ; )
    {

> +        status = efi_bs->GetMemoryMap(&info_size, memory_map, &map_key,
> +                                      &efi_mdesc_size, &mdesc_ver);

Unless you have a reason to (which I don't see), please don't alter
global variables here. 

> +        if ( status == EFI_SUCCESS && memory_map != NULL )
> +            break;
> +        if ( status == EFI_BUFFER_TOO_SMALL || memory_map == NULL ) {

Nit: Brace placement.

> +            info_size *= 2;

Doubling the buffer size seems excessive to me. If you really want it
like that, I think this deserves saying a word in the description. As
said before, the same increment as in efi_exit_boot() would look best
to me, for consistency.

> +            if ( memory_map != NULL )
> +                efi_bs->FreePool(memory_map);
> +            status = efi_bs->AllocatePool(EfiLoaderData, info_size, &memory_map);
> +            if ( status == EFI_SUCCESS )
> +                continue;
> +        }
> +        return;

Perhaps emit a message?

> +    }
> +
> +    /* Try to obtain the ESRT.  Errors are not fatal. */
> +    for ( i = 0; i < info_size; i += efi_mdesc_size )
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
> +            return; /* ESRT already safe from reuse */

"break" here so that ...

> +        status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
> +                                      &new_esrt);
> +        if ( status == EFI_SUCCESS && new_esrt )
> +        {
> +            memcpy(new_esrt, (void *)esrt, esrt_size);
> +            status = efi_bs->InstallConfigurationTable(&esrt_guid, new_esrt);
> +            if ( status != EFI_SUCCESS )
> +            {
> +                PrintErr(L"Cannot install new ESRT\r\n");
> +                efi_bs->FreePool(new_esrt);
> +            }
> +        }
> +        else
> +            PrintErr(L"Cannot allocate memory for ESRT\r\n");
> +        break;
> +    }

... you can free the memory map here.

> @@ -1067,6 +1182,13 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      if ( !efi_memmap )
>          blexit(L"Unable to allocate memory for EFI memory map");
>  
> +    status = SystemTable->BootServices->GetMemoryMap(&efi_memmap_size,
> +                                                     efi_memmap, &map_key,
> +                                                     &efi_mdesc_size,
> +                                                     &mdesc_ver);
> +    if ( EFI_ERROR(status) )
> +        PrintErrMesg(L"Cannot obtain memory map", status);
> +
>      for ( retry = false; ; retry = true )
>      {
>          efi_memmap_size = info_size;

What is this change about? If it really is needed for some reason, I
further don't see why you don't use efi_bs (it cannot be used inside
the loop, but is fine to use ahead of it).

Jan

