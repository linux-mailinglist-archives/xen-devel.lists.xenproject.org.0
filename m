Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1BC51D619
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 13:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322899.544374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmvg1-0003Zc-Dw; Fri, 06 May 2022 10:59:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322899.544374; Fri, 06 May 2022 10:59:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmvg1-0003WV-Ab; Fri, 06 May 2022 10:59:13 +0000
Received: by outflank-mailman (input) for mailman id 322899;
 Fri, 06 May 2022 10:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmvg0-0003W1-9z
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 10:59:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e092485-cd2b-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 12:59:09 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-s5J9htH7MD-Hvj3PNEPl-g-1; Fri, 06 May 2022 12:59:08 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by PA4PR04MB7919.eurprd04.prod.outlook.com (2603:10a6:102:c1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Fri, 6 May
 2022 10:59:06 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 10:59:06 +0000
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
X-Inumbo-ID: 8e092485-cd2b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651834749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHgJ52YHejUk3gYauOHYjxRwapqI9poP6xLYhR0n7V8=;
	b=TNuUfvdrmk3wvZ9SniNVSKoq4WyGfWyfaCyuJZaH9tY03i8VZDDBWOA4W+U0HbZXovMWIZ
	PWu7J8ENG4tBJMGAe3zt3IESiUTtEp1O9U62sb58q3zO+G0yT327R/6yFv6YTl9HylXUTq
	8sn6d0S+JonZBmj8zYuQuhSlSKa+ooM=
X-MC-Unique: s5J9htH7MD-Hvj3PNEPl-g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVIjcMKZdD/xdE3C1BFY1w8rgOIul7IF/WEbKthxPMpKSe2kxJ0agnQf7YMO2yQAA/o2zrmTXljauOxUxLqwBEZ4UWw/7yMrzeuuqJ+m5XHXRMaDVgxJx5G34mMrOpGlXF9DifaYCz03R9PQOE/qs0beSL0WZAdpe2wH0sKkIRGzIyPMkSyDvAVteMogN3/BtCBH9gtri0J+cyHEIvi1V7hLtSDb1IbSIIQS8GHd+/HZUzKQEQfmVGEjohNLlqkNOR0315hwXOiMW1KaQKbfUcjOiqGwMXrgt2r1818j+rdDxpDdhknpMlMU4GS2D7NnBgP5td5YWwzX3ad+REh3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHgJ52YHejUk3gYauOHYjxRwapqI9poP6xLYhR0n7V8=;
 b=eFSjbQ3MGpgdLuXMNl5Ubazwid0hV/Z9HZJVMzTUP3ZcKlUIU5T4IWKQhIWY7tWmR6mzv282u3IeDvAp/18k6geNFQTq7H7pv/GkeJUq521B30uaE5+neMQVnpOfYdBQHXfuf6MBUPyknQ3uOLO3aoyOSR+Ikh/mY8WjZiDKMng9q0QBxreoO3xanz+7SCVqjwUsG0lGZeEFoNwm0hEZ3TLC9Z2Z2dpuSneMZLO2KLWqy4NJouMNXuGwV0eZhy4ywm2HCDvAvpikN9oQ1LuGY5qIwgLqMPRhz3YzXbvtheHxKj0iBGRaMW9Q42+8BRURLTMfZOdiO0wPViHk7yoWeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f06cbdd3-06d5-dd72-88d5-477cabf65b45@suse.com>
Date: Fri, 6 May 2022 12:59:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <YnNi7iW2s5jsJIiA@itl-email>
From: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
In-Reply-To: <YnNi7iW2s5jsJIiA@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0003.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::16) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cb93258-8f15-46bd-de65-08da2f4f70c5
X-MS-TrafficTypeDiagnostic: PA4PR04MB7919:EE_
X-Microsoft-Antispam-PRVS:
	<PA4PR04MB79195326EF81C4912E8D2A40B3C59@PA4PR04MB7919.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lNRu/hDhOCB6ZWfeIsVLrzuwmkzeY1cDZZbcn1nP9h3jtI94h7/ctwfJ+YbXXYdI+HhWI5R6QPTE3tTIHgbQIw//tNhJJL2a0/nQS517EfaAy5kIEc+2JjOrs7ckM4AKnJTBq8MaPhEnq22dwCis/5B85Es1FV8xY7FxqGkwQ+OLaNF4YPAyiA5sZn3I/9n+OidbmbbCuuauz9z9niOEuP1vLRmyYStGzfJG4UQv2qwPh7T43dGA6ziHRFBXFC4DBXu6j3TH/P/kUmNcpkEBK8vg+gcAWNizIvqvhC0UJDxkgyF1CUuvrY6EW0wdhnM4guxvrhlHebW8iA/H75fvjWdtOqwFRN8qKyxHCYlrpM90pXvbaEdedIe9Hp2aGdRowPEIKnpDjQEaaFRVnTmg6t4ZhJkQpCSWy2l3asNZj1KCOnQroUNNQmmlUuIdTlrhWfTgCbYh686Wzw8RFp+FLyl7oZsQu0Aq+70k6Ko3efpt7pirMG5pc1lJKpy9UifaFDD+J8UA/EJCuyuZGFKb+UO+ZzCoLmxT/wTeCa2zq4JugY9sR4TyINumMmr8GtDdN7rnBaRhYX9fsAEefVxy2pXzKgW38R02fqMv118x9JfGwT9KHOPPNu4kQ/yFz8yDCUdV2IuBYjJqm/Z+z+DsK7J7kTwGwwRYkzCEJTW8pxSIGI1Sn/apYTM7hVErPB7Z8t6cRZYqW8Rq66YZf6enNUpOwXZZs6AAJootK0jk4z0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(186003)(36756003)(316002)(2616005)(508600001)(53546011)(6916009)(31686004)(38100700002)(6506007)(8936002)(83380400001)(26005)(6512007)(6486002)(2906002)(31696002)(4326008)(66556008)(8676002)(66946007)(66476007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzZpMmNtQlB4R0k2SXJEMkxiRXRYTDZKYUNybWw5c1A4ZU1sQnVxUmRCRGRO?=
 =?utf-8?B?ZGF0NmFwK2J6eC9SeE1WYkVjbzVHcTBWOVlTcmhodXpwSHBNNm5KVzd1NzFZ?=
 =?utf-8?B?Mm9CUVFPOW5aNDkrSFpBOENBRkRocDlCazkveDRVVDBvd3BMZ3REUzN1TWEv?=
 =?utf-8?B?bSt6VElKSVlYdmdCRnFGUnpFTXdTc1h4eStaV1ZzODlXY1ViWGFNdHB1M2V3?=
 =?utf-8?B?SVRRTTk1SEpZNUY4SG03bmFDZ29uOGdVT3VFdkhYZlFXMDhUM0NSK0dpR3NF?=
 =?utf-8?B?MUNSRWZ0R2I4Q1l1Y1hacy8yT3E5Nit1WDlxTVVSYUdPVHBHdk5LdXg5Y0JR?=
 =?utf-8?B?aTZhcWFpZXpHT0pnVExRMExyVmI4WEZScGVMbnVvS1FkUG41TTZSZWJKdkNo?=
 =?utf-8?B?U0ZOZW1CbGswUG5WOFQ5WGNXdFMxYUxxQlhtdDZSUkx4cVRkdUVCSDhUWmZK?=
 =?utf-8?B?ci9YVkpiWkpYbkFHa3NURHh3UmkxRzBWbC9FTkZTU0YwNXlPdVNhYStBVUha?=
 =?utf-8?B?bktGL2h6QWVmL2FmZnFDQ1dPMzh3QWVRcW5GeEV2TTBJekhEMTFUelhaV2ti?=
 =?utf-8?B?d0xiUENiZlRRTHgrc0lHQWpkSm1EcVJGQURwZVM5cXVrQVU1TWcwZ1RKM1dJ?=
 =?utf-8?B?MWxXdC9hUHNKNCtOVEVrZW5TbEgyS2ZBL0Rlcll6OWFLWVBGbjdOYkZyQ21v?=
 =?utf-8?B?eG5ZNkw1dXU5b0t1cENyb2p1aEJnRGFvR3V4MndjcmRnWXNoNWdqMTJMRmxq?=
 =?utf-8?B?Mk5vTk8xTk51UXFUTDBrL1VnN2NiUDZEd2hLMkljTjIxZ2lFT1ZlOXFZTkMz?=
 =?utf-8?B?N2U3MlU3OXhpd0o5OGZmRTEvQUtaa3F1MTNnSUkwV2RnZEZpc0Z5ZGx4cC9X?=
 =?utf-8?B?L2dPVE51TUR4d1BhYWJFbzlsNlNBcnZURlpNQXlsSHczQ1EwZkhPNUJTV3hY?=
 =?utf-8?B?SWRwTGxaYnNPOW1UQzk1OVlhU2x0NGJCWk1DMW1LbVZ1OXF1SGFxQzRjdndN?=
 =?utf-8?B?dUp4WmNhVWZVRzZoZjI0ZmFxTnR4YUd5OE1DTlNCblNTLzEzK1BJSW9kOFZK?=
 =?utf-8?B?ZkRyYzJMdUpPaUxiU1ZMTiszVHlaQzhmallJdXIvZy9GSURLMExhMkNvMG9R?=
 =?utf-8?B?cHgwZXN6bHltQ0V3blZ6ZnkrazMvS1RNTGgvSjc2bGN3SEdDNVFncEJxWHd3?=
 =?utf-8?B?R0hTV0V0Ym5jK0FxZTZsNnZYRUY2Y3RReExOM05rOC9GUVhma0FnVzkzUmkx?=
 =?utf-8?B?Q0NsekpkQXdnOHpMTWVKR2ZoVWJMdzdndGQyaWVtd1hYNXpmUlN6MnVGVVRO?=
 =?utf-8?B?YjhuOTQxTDMzc3lvQWJnZ1FsbVAzM1ZyMDJGMEl4cGp0azhkZHZzbzJWditj?=
 =?utf-8?B?VlV2MXNyUTlvK01IR2hYQUhWcXA5akM0bXpwMlkrNkdDU0NYeWlldG03emh3?=
 =?utf-8?B?M2JUbkFlQjZjTndjcDVOV1FaR0JRWlVpbzlDMFdTYTZuUE5TNEFBdVRMN2E1?=
 =?utf-8?B?STJaaGFtMlM0Wmxkc0tkMWx4aE9wcG41M1ZLdDJoS0NIUElpZEsvYWNmZ0N1?=
 =?utf-8?B?T1lqL2xhYzZTdVBMZFhRY1JGTzJjc0dXbWp1VkVBZkZrL2pxMEYyVFpvUlZI?=
 =?utf-8?B?SmFhUGNIMDY5NjE1NjN5UmxiRzV6Smh5WW94Mjk1VUJMN04zN2JxSjJiL1FQ?=
 =?utf-8?B?RUpRODgxeVFFclVvTWc5M1JHWlFZVHJnRkprTDVtVkgvSGRyenJhUnN4T0kr?=
 =?utf-8?B?MVdLVUtpK2Qzc05pdU02SHZ1Q0JnZUZFOGdxRHNuK3EyNURPMUJGU1FYUWZH?=
 =?utf-8?B?Y1U0Ym43U2xSNHlua09aaTNML2FuTUpLbjhhK2w3Y1Jsc3ZIQUU1anBvR3E3?=
 =?utf-8?B?dTJWUTZhVHJDa3pjV1cyaEtaT2dkbmtDZnI5ZEc3eExWeUc1RjhCWDVObzZJ?=
 =?utf-8?B?cEIyZllDOEI1aXR2NDdoODNnd2p0eVdMaGlmbDduUGZzNG1LWTNZOG1DMDhJ?=
 =?utf-8?B?endWayt1RllqeUUyMXN4SkZiU29sWWk1ekdLdlFxM2hEYTh1TUZUYkQrU2Z0?=
 =?utf-8?B?Zzg3aUZSQjdtOXlIemIwVkh5enQzMFFVd3ZNTHhUaDVWb0t5WGpPU3BkQ1Fl?=
 =?utf-8?B?aWVOd1d4U2V0TDZia1lDcjlRVEVxMVc4OTZwYTRYN2RFdzE2SlBrTlVlc3h3?=
 =?utf-8?B?VGx0RnlPSW1oT2ZmaXlRTzllRmppOGdudFVFSEVRMEdkQmdIUlpMbVFvOTRL?=
 =?utf-8?B?dTBXS2pEai9wMG5XTmRJN3R1ZDVkOTFicnk4UCsySHdoTTE0QmNacUFuSW9v?=
 =?utf-8?B?dGt0cGJuNENRbG5YNnJXYkFIRVg4YjFsaEFScmhBdHJhN01kcVZ3UT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cb93258-8f15-46bd-de65-08da2f4f70c5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 10:59:06.8690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xi14XCzSrrA6kjWM1HqOXIxoxKSCzncV5PScSypnnQY34Syh6O2Oj3Nn544dADAChnJ+QwSUebYDbAKGiTiI1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7919

On 05.05.2022 07:38, Demi Marie Obenour wrote:
> @@ -1056,13 +1091,11 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>      EFI_STATUS status;
>      UINTN info_size = 0, map_key;
>      bool retry;
> -#ifdef CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP
>      unsigned int i;
> -#endif
>  
>      efi_bs->GetMemoryMap(&info_size, NULL, &map_key,
>                           &efi_mdesc_size, &mdesc_ver);
> -    info_size += 8 * efi_mdesc_size;
> +    info_size += 8 * (efi_mdesc_size + 1);

I think I did ask on an earlier version already why you're making this
change. It continues to look to me like a leftover which was needed by
an early version only.

> @@ -1077,6 +1110,35 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>          if ( EFI_ERROR(status) )
>              PrintErrMesg(L"Cannot obtain memory map", status);
>  
> +        for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
> +        {
> +            if ( !is_esrt_valid(efi_memmap + i) )
> +                continue;

Instead of repeating the size calculation below, could you make the
function (with an altered name) simply return the size (and zero if
not [valid] ESRT), simplifying things below?

> +            if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type !=
> +                 EfiRuntimeServicesData )
> +            {
> +                /* ESRT needs to be moved to memory of type EfiRuntimeServicesData
> +                 * so that the memory it is in will not be used for other purposes */

Nit: Comment style.

> +                size_t esrt_size = offsetof(ESRT, Entries) +
> +                    ((ESRT *)esrt)->Count * sizeof(ESRT_ENTRY);
> +                void *new_esrt = NULL;
> +                status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size, &new_esrt);

Nit: Please have a blank line between declaration(s) and statement(s).

> +                if ( status != EFI_SUCCESS )
> +                {
> +                    PrintErrMesg(L"Cannot allocate memory for ESRT", status);

Neither this nor ...

> +                    break;
> +                }
> +                memcpy(new_esrt, (void *)esrt, esrt_size);
> +                status = efi_bs->InstallConfigurationTable(&esrt_guid, new_esrt);
> +                if ( status != EFI_SUCCESS )
> +                {
> +                    PrintErrMesg(L"Cannot install new ESRT", status);
> +                    efi_bs->FreePool(new_esrt);

... this ought to be fatal to the booting of Xen. Yet PrintErrMesg()
ends in blexit().

> +                }
> +            }
> +            break;
> +        }
> +
>          efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_size,
>                                      efi_mdesc_size, mdesc_ver);

The allocation may have altered the memory map and hence invalidated what
was retrieved just before. You'd need to "continue;" without setting
"retry" to true, but then the question is why you make this allocation
after retrieving the memory map in the first place. It's not entirely
clear to me if it can be done _much_ earlier (if it can, doing it earlier
would of course be better), but since you need to do it before
ExitBootServices() anyway, and since you will need to call GetMemoryMap()
afterwards again, you could as well do it before calling GetMemoryMap().

> --- a/xen/common/efi/efi.h
> +++ b/xen/common/efi/efi.h
> @@ -10,6 +10,23 @@
>  #include <xen/spinlock.h>
>  #include <asm/page.h>
>  
> +typedef struct _ESRT_ENTRY {
> +    EFI_GUID FwClass;
> +    UINT32 FwType;
> +    UINT32 FwVersion;
> +    UINT32 FwLowestSupportedVersion;
> +    UINT32 FwCapsuleFlags;
> +    UINT32 FwLastAttemptVersion;
> +    UINT32 FwLastAttemptStatus;
> +} ESRT_ENTRY;
> +
> +typedef struct _ESRT {
> +    UINT32 Count;
> +    UINT32 Max;
> +    UINT64 Version;
> +    ESRT_ENTRY Entries[];
> +} ESRT;

I'm pretty sure I did indicate before that types used in just a single
source file should be put in that source file, unless we obtain them
by importing a header (e.g. the ones in include/efi/) from elsewhere.

> --- a/xen/common/efi/runtime.c
> +++ b/xen/common/efi/runtime.c
> @@ -269,7 +269,7 @@ int efi_get_info(uint32_t idx, union xenpf_efi_info *info)
>      case XEN_FW_EFI_MEM_INFO:
>          for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>          {
> -            EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
> +            const EFI_MEMORY_DESCRIPTOR *desc = efi_memmap + i;
>              u64 len = desc->NumberOfPages << EFI_PAGE_SHIFT;
>  
>              if ( info->mem.addr >= desc->PhysicalStart &&

With the restructured approach I don't think this stray change should
be left in here anymore. Or am I overlooking anything requiring this
adjustment?

> --- a/xen/include/efi/efiapi.h
> +++ b/xen/include/efi/efiapi.h
> @@ -882,6 +882,9 @@ typedef struct _EFI_BOOT_SERVICES {
>  #define SAL_SYSTEM_TABLE_GUID    \
>      { 0xeb9d2d32, 0x2d88, 0x11d3, {0x9a, 0x16, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d} }
>  
> +#define ESRT_GUID    \
> +    { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }

Like above I'm pretty sure I did ask that you do not alter this
imported header. If gnu-efi now has these definitions, we should
import them all in one go (i.e. then the two struct declarations
would also want to go into their appropriate place under include/efi/.
Otherwise this wants putting next to the other GUIDs defined in
boot.c.

Jan


