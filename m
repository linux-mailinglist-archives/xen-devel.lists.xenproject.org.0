Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F028156864C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 12:59:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362130.592048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92kZ-0003JD-LW; Wed, 06 Jul 2022 10:59:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362130.592048; Wed, 06 Jul 2022 10:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92kZ-0003Gz-Ik; Wed, 06 Jul 2022 10:59:19 +0000
Received: by outflank-mailman (input) for mailman id 362130;
 Wed, 06 Jul 2022 10:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o92kX-0002RD-Ma
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 10:59:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad9b3746-fd1a-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 12:59:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7139.eurprd04.prod.outlook.com (2603:10a6:208:19d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 10:59:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 10:59:15 +0000
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
X-Inumbo-ID: ad9b3746-fd1a-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7cDyus65AbztAygQsrO4QWOzoUHlyIGVyvah8tcvufbxxCl5iC9kaxTea0qfATvSaUZXHXGJNeGWulngHzwT66S/nxMoHWm/8D0gvOYNqn283xXqc4DJ+fia5WCNYaX6dX3KLdWdMp41iZCNxwN2ZvZeBWNmh4dW1NlM12g77izJ5wUwItZef8tGUw7EVcVshPV+J2rPUYggEhRdnoJNbB6v1NpTS43SInwFmzh+GwICwkFdYWHv4zk4c5+5kcUQFGYd3HzF7MAP8/p5gQLXl6IaAj7hn1klaGQh48W+nzLpaZAukLBEkXpbCDPnmXx/6UIDosD290fJjvniUK33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WSB1M4P3ugheaXogNqtwf3c7T+etBrYrVKxCBMoqzY=;
 b=JrGjl5Kb6XccLwdbGMzeUnDpql8YMR+8/kfNJtNxS4I9n9ni2/v2QKjzs3nOCTQEjaoWPTu3E+2BH9kjAgjdUBmCzemBy7D8QLPvVaBRm/z7nyhh8zyrO2IZV5F2pgmYMgAbYWW+j9hOCSepwwP7ACjXoI5qTHsNhDZainwCVf9N3ylpRcDg3yKX3dNIILFC0CiJDRVtiRJY2g8aSmLZrDEk+fxZXDDi4c4bZzznQvd03tecZiWDp7MCr/mKDb0wXPYeG+Yb55sTiJnO98XZbqJOPVJFCFs/eO4lvIeNUZ+YzSyvm4leHM6qufaAJeM5dnpkqV3zxsfqTUZ3+rfPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WSB1M4P3ugheaXogNqtwf3c7T+etBrYrVKxCBMoqzY=;
 b=DYP4H48W/w2oebJ4ebJmBDC2sELZQyEsLCzUXIi+iceXr+S4CAeQ9GzCL6qsGcHhI/bFD0QmGp61EgoLih2OIbw84J22P6eEpbUJ1bpKEzsqM/ScENgfc+vDv9Sd8gHvT3DDyUdpg7Shl648EqXAi4JZ6d8BJY0ATMA8EJdSrSlFMIe5QUVysgZ4URZnnt9iUPPAyLKc0UwRmbYTIuCJ6VJp6OBVZUVbSmKD14vai3qvOAbI5JhjLD1eJSZUsIc0KzKOt5ux6eZh+3dy/Zb93rpvATzGKnqgVgwERwqE4Qr6VbxNW102nej/1YKS/BWLGAkLShdLNTNQEvaT1e5QFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9d0af4c-b89a-fd50-64eb-9b8161295e1b@suse.com>
Date: Wed, 6 Jul 2022 12:59:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
 <863733AF-212D-4059-B780-3DDC0AC58FD7@arm.com>
 <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>
 <ef9cde4f-be13-134b-3c26-194484d165de@suse.com> <YsVqwbZ9dOz8WG5E@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YsVqwbZ9dOz8WG5E@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb148bbe-3998-4f83-4bcf-08da5f3e9139
X-MS-TrafficTypeDiagnostic: AM0PR04MB7139:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CsJ9qGnjbjC19c976zP+ICUszJpLR/0IvdBet3SdKCDPV0VeLbFGebkhJCukksjzzqXxh8d07jQVGSJtTXUDrr8tfybrMNuOZ3/QupCiMyU7s40xmr8JGf2FRzjJQCAEszMjCNT5QbG8EJsuGtQ1I1cdl+fkJ0t45sdq4ZOd0co8Tm70yt2CfVqd9K2iGQPQ/BOm/hGSg6+SzvfWfjyM4TWcJRWnvVyaQ9ggpxuHG3jPf1k5zJL8+Toa2ULhyHzgl7FFx3alUw5t2e9XhBmzZyH93Qh5dyXws/NzBc8ztixhVH4Jys0+ol2RvnIIkECAtV9g46bWftcJJI08msl1LOrQI7XMEQAbSD92vr3MRWL8bEKUhpJws867Sr7iRJY1YIrzgeo4+HEqahyHZxAG/oLyiiklEDxcD+ndArTvznBqfRdsAxUftUnFNl5axGEnfozFbplxPwByIW0DO24G+KHDubbXkZWfAQO+NcxVhvG5WwHD3HxbNqMHrCFu6FYYL45Ze6+5oZ9/mDx4d5RvfeMfcVlXP1Y0y9v1N2d2oLs+mYw1TZ15dyQCsvLLMIC2gK7LPePMILqlrNDvbXWSTsXNaUBn+3hG7PbrX6wJH72EY2dTBmKJHuMuMaU5ZozlFCsyDnSlFv61rZDzdJr2uO4XMtvoZ8NsM2r7/URVVBeCjIzb4mt5UqnIfsv4gq9/IzBEkJcqEJSKtJ62q2qdOr4PwXOCEfSskhJvZ1SPGB3NOVDMQK2N2QHD38KM5GBPHPBZqkvgpzotVmCkijv51huI0QASMr3W7p0YIgOLwh0GyB78Bjz8UhHkUMsuhM1DGWxaVsBGUwXM2q/yyZ69iOgV/BgId+QjnUP6LUeJYiI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(366004)(396003)(136003)(2906002)(41300700001)(2616005)(38100700002)(316002)(31686004)(36756003)(53546011)(54906003)(6916009)(6506007)(6512007)(66946007)(66556008)(66476007)(8676002)(4326008)(86362001)(31696002)(478600001)(186003)(83380400001)(26005)(6486002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTBLN3lJd3h6VWZqYWRxUFYzL2NaSzdzdUx0Y2paRmRqMWpoM01pcFRjdE41?=
 =?utf-8?B?NVNLbWd3MGFja0xDNkxjcWE5QStYcjcrTisra3lVV2g0aFJrWkoxdTJ0R3Fi?=
 =?utf-8?B?bWxYVmYxalNqSlZhb3J4a0Q5ZFJHWTRseitGdjF1YTNjNVI4ZU1kdHJUcUVM?=
 =?utf-8?B?ODNhSit0LzYrWXNJQVBaRWMwNHA2dXJTWkVJWU9WRWJWanNlOXpmdjRqTzFT?=
 =?utf-8?B?eTJVajdXc2ozQlQxUjhWR0FGL0p3em55UGJCemtPTDZxYWlHaWRlUVBxc0Ex?=
 =?utf-8?B?NTlLR09xd2xBdFhpRmxuT0ZMQlJzdkNBUUxVOXJoSWJNNFJlVmx6UHJ0STdp?=
 =?utf-8?B?cjJHOVdkU1dDdjcxQXRZam9Sd0lUaW9vRG5sdXVZUlBybGxsRmVSUFUvVWRh?=
 =?utf-8?B?N05malZsWXNGbWk3TUthd3hXdW9pMXptQ09mSS95RU0zTTlwem5vMTFDRGdk?=
 =?utf-8?B?bzBrbjJ0WnBib3g4MzdNQ3QwZXF3UmhvRkhZZVk5WWYvblpIblR1MVB6YmxG?=
 =?utf-8?B?TTRxbmlVTzhXZ2pTU01oTG1NVFpvWjk5WGhiWXVmVnhUU3hyQVhwRVBITzRx?=
 =?utf-8?B?SXdtSnc0WEFmY1BkVEltQmpITDZQNDUvbHhRVEQ3ZnQrVVU4bzQ3QUxmS3FO?=
 =?utf-8?B?MGtXREFBT0VUWEVnQ25QZUVXWkhVUTd4UHdXY085bm9iUGFCU3YzemYreDQx?=
 =?utf-8?B?ZXJ3bmozMTZwVkxKR0VGdDRESWk1U0pWRnRIcHUwTXZHdi9PNEcremd3Y0M2?=
 =?utf-8?B?clN3ak5FcDlIbFZ2Q09EQnpMOW1iRkkvTnRyTHcrYWk4VjFJTitoZW0yZS9M?=
 =?utf-8?B?TGc2N2JWL2tvaHlQZ0Z3OFJTMTYyRjJwKzhib1J6RlhDT0FmSlpRajNrazZv?=
 =?utf-8?B?VUJ3V0RUZzFwcGV5TkRmMlg5ZlE0elh6WWtsV2dxVE5iUW40MXk0cmR1VTdh?=
 =?utf-8?B?RmxtUFdoNDFmTzFMZmhtYzVxbDJraG8zYW9hZXpTa05qS1dMblozSkNFNnFr?=
 =?utf-8?B?eFR4RDcxakI2TDZrcXUrL0lLYlh2dnlrZ2p0UFFmQVNxUHAzNWpPQW8zT0tM?=
 =?utf-8?B?SEovN1VPWXFGcmZENWVGdDloWk1PK2VTMHpBZHQwMTNvUHk5bms0ai9GT05u?=
 =?utf-8?B?WWtZSDhHc2JHa1hlcnpNbytrM29HMnRMbzh3SUxTR2UwMlRtSC9lNDI1WVpQ?=
 =?utf-8?B?NWk0M2JuK1ZaMmYwU2I2UXhTUUhKd3VLNlBQUzEzUll2dmxnWFdaOGdlMEVX?=
 =?utf-8?B?WlQ3QjJwTmpVUURsRnVlalRlOWd6SmZuY3NpcCt5ViswUEVaenMrMUQ2ekZX?=
 =?utf-8?B?bm1ZRzFRNUhnS2RmSHE0U0hCNXQ0d1M2eXZoNnNCWHZTbUUrNHY1alRPcWUr?=
 =?utf-8?B?d1BabGUwM1pGWGlSR1VVbEoyUUJuQ2ZmK0EwTlZIWkxHbXdYNEs4bTVoekZn?=
 =?utf-8?B?MUlBTWVPNnQ0M2Z1bllxcEZuUFhZeVkySDdpNDNBbmZQZndmTDhlVE5LS1BZ?=
 =?utf-8?B?RWJKbVhPUFdLRk10THVKa2s3WkJFZ0pKV1l2ZzdYbGR3QVdDSndJVFJjUFla?=
 =?utf-8?B?RzF4T0ExbWJKcExRSzd5N0VFbDh3V09yRldmZ2Z4NURFWDNkVmFBNjUwaTFS?=
 =?utf-8?B?T3JMMHZSNVRzZnBMQkdESFVqbHZOd2ZhMGNNNDZSZklMTnExNWlqa1QveGVD?=
 =?utf-8?B?aFRxQ0tpWlBLMU9QRHpnSDVldVo0T3crUnRMT0xjMm1GRlZCRUk5U2NMTzJh?=
 =?utf-8?B?Ly8rM2lDRnY2Nm0yZlduTEIxZVFYbzNiVmthbjdxaStNaUZPUmQreTNmRmlZ?=
 =?utf-8?B?b0Y5elhkWEg2a3htRmp1UmprNHYrOVYycE8vQk9DNXZKdm52b1oyK0NtUFNX?=
 =?utf-8?B?MkR6WGtKVktLVXh6WFBHVUZJb1N2dDhydTNwYlBtTXpIbWk2MkdjUHNpY29V?=
 =?utf-8?B?a1JnNFd6MmZsaUtMM05YVnp2NGx6ais5VWVoRU8wd2dCTXQ1ckk0WUFJNnMv?=
 =?utf-8?B?UGJrZEhZTHVVSGFIN2FZYkY4SFNFbFViT3RaTmIycFh5bmFVU2g2SnZrcGJY?=
 =?utf-8?B?VjFJRkNXVTZWMTZJRzV0eG91WWx2Y0pXYW1Ubm9EbURESzFSRVpwcGozZmtz?=
 =?utf-8?Q?ZVQ+OMdUbV/hbi6iV/URDFAqf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb148bbe-3998-4f83-4bcf-08da5f3e9139
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:59:15.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjnL9SPf3HIQFHyi+b4m1hr/YFLTmEaLbNX9nGXMvE+KYKMc1IZHNKze3bFsd0HKVzUfy5dgnns3jl39SEgD2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7139

On 06.07.2022 12:58, Demi Marie Obenour wrote:
> On Wed, Jul 06, 2022 at 12:55:50PM +0200, Jan Beulich wrote:
>> On 06.07.2022 12:44, Andrew Cooper wrote:
>>> On 06/07/2022 11:32, Luca Fancellu wrote:
>>>>> On 24 Jun 2022, at 19:17, Demi Marie Obenour <demi@invisiblethingslab.com> wrote:
>>>>>
>>>>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>>>>> index a25e1d29f1..f6f34aa816 100644
>>>>> --- a/xen/common/efi/boot.c
>>>>> +++ b/xen/common/efi/boot.c
>>>>> @@ -567,6 +587,41 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>>>>> }
>>>>> #endif
>>>>>
>>>>> +static UINTN __initdata esrt = EFI_INVALID_TABLE_ADDR;
>>>>> +
>>>>> +static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
>>>>> +{
>>>>> +    size_t available_len, len;
>>>>> +    const UINTN physical_start = desc->PhysicalStart;
>>>> Hi,
>>>>
>>>> From my tests on an arm64 machine so far I can tell that desc is NULL here,
>>>> for this reason we have the problem.
>>>>
>>>> I’ll have a further look on the cause of this, but if you are faster than me you are
>>>> welcome to give your opinion on that.
>>>
>>> Given this observation, there's clearly ...
>>>
>>>> @@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
>>>> #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
>>>>                                  (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
>>>>
>>>> +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>>>> +{
>>>> +    EFI_STATUS status;
>>>> +    UINTN info_size = 0, map_key, mdesc_size;
>>>> +    void *memory_map = NULL;
>>>> +    UINT32 ver;
>>>> +    unsigned int i;
>>>> +
>>>> +    for ( ; ; ) {
>>>> +        status = efi_bs->GetMemoryMap(&info_size, memory_map, &map_key,
>>>> +                                      &mdesc_size, &ver);
>>>> +        if ( status == EFI_SUCCESS && memory_map != NULL )
>>>> +            break;
>>>> +        if ( status == EFI_BUFFER_TOO_SMALL || memory_map == NULL )
>>>> +        {
>>>> +            info_size += 8 * efi_mdesc_size;
>>>> +            if ( memory_map != NULL )
>>>> +                efi_bs->FreePool(memory_map);
>>>> +            memory_map = NULL;
>>>> +            status = efi_bs->AllocatePool(EfiLoaderData, info_size, &memory_map);
>>>> +            if ( status == EFI_SUCCESS )
>>>> +                continue;
>>>> +            PrintErr(L"Cannot allocate memory to relocate ESRT\r\n");
>>>> +        }
>>>> +        else
>>>> +            PrintErr(L"Cannot obtain memory map to relocate ESRT\r\n");
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    /* Try to obtain the ESRT.  Errors are not fatal. */
>>>> +    for ( i = 0; i < info_size; i += efi_mdesc_size )
>>>> +    {
>>>> +        /*
>>>> +         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
>>>> +         * so that the memory it is in will not be used for other purposes.
>>>> +         */
>>>> +        void *new_esrt = NULL;
>>>> +        size_t esrt_size = get_esrt_size(efi_memmap + i);
>>>
>>> ... a NULL pointer here.  And the only way that could happen is if
>>> efi_memmap is NULL.
>>
>> Incomplete refactoring - this needs to be memory_map, not efi_memmap.
>> Of course efi_mdesc_size also needs to be mdesc_size. Didn't check
>> for further leftover from the earlier patch version. I'm going to
>> revert the commit.
> 
> Sorry about that.  Want me to submit a v9?

Yes please. And please make sure you have tested this at least on x86.

Jan

