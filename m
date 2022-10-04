Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFCD5F3E67
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 10:31:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415250.659775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdKq-0001xk-Nh; Tue, 04 Oct 2022 08:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415250.659775; Tue, 04 Oct 2022 08:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofdKq-0001uy-KE; Tue, 04 Oct 2022 08:31:28 +0000
Received: by outflank-mailman (input) for mailman id 415250;
 Tue, 04 Oct 2022 08:31:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofdKp-0001uI-1X
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 08:31:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60042.outbound.protection.outlook.com [40.107.6.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef6d0071-43be-11ed-9377-c1cf23e5d27e;
 Tue, 04 Oct 2022 10:31:26 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8206.eurprd04.prod.outlook.com (2603:10a6:102:1cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31; Tue, 4 Oct
 2022 08:31:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 08:31:24 +0000
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
X-Inumbo-ID: ef6d0071-43be-11ed-9377-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ngoAp4Iy9k4+5EKft1lzmJ2oDYl9W6MgP64XykLi60zdILPcH+kzHYNZdgjhPcbmAhe7ekRGd5wBoH59K/80bYsZlGPg0HAiFe7+xhXc2m9A+RTo3tXpgUk8fIWgAr58g62olJ/+1vjLkY/VWLGgZ9Ggkgvcw2J2eZZBHLTMeLQCAYDWYgztvJ4LFluKhuiSubRq923ILJX3kN9cGbP3D8yhcmEJkJzMNq5JvUKXVk5C/f9+jYsHCco+gn3GdaVDreyG0N3F6nmoxEIsegTzs+nz7qfjumbFqOt/VZiGC3WduGLlIiej+ZRN/0uNJ/Zy5g1y7lysJxyw9ojG0QS0ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=67hzZqxB4QTGLBeIr51HNNernqc0uOlWH5XYOthjQQA=;
 b=Mx89XbPAmPqycHCh9CthBlZVz6rj7t+tcn70YfBz1MGj6lBRq5T/ec3Lsy1kW4/RoNoqyEDNjU/q3YvJ7Myjh4YHubNoqY/ZPpPkaI7ExcqoAn2HK7wV8LCf0BhSu/CCtphoyhwPY1F5H4fRiEZqU3bHvBJRUgHokRoUK1u23qa0T/TS0mj/q95OyLo15/+zT7MvmKgef7MJqi3o7jF+++SGfV1dlzzefvvHXx6IRukoC1TZGatFOQsP/xT/1nNneaA8cKGabnWsk4Of17utARyPVVQUXMKTPWJEIsQpTJAvr8gNQMKV80gdXEJcKebOLJeAqbQ6OxJzks/96fEwPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67hzZqxB4QTGLBeIr51HNNernqc0uOlWH5XYOthjQQA=;
 b=wGqUCuA91QL+9foN2LDKK4j1PEE1G38o0fx8jfx5KPWepeA/uPyaH/tWtuKubWq1Wr2KGtGUC7PHFQLLfEcgw7XSEgFyks6xiZIYWNrjS4FdVjlp2VDk9NzyIjxK/jIhtwufRpkWT0S7BRBMZx3JMDuO+vHBIkEpelg4rB80Tz8JyoAo4BcMZqLRmDIMJzTtory9uj5waCGuV4m9f0z7Ejha1GBt0Y4gZFIw+8LvX6SH23ksf+NxL8HOnRf/VNX/JnJrDxYDGaexgIbGQ4Lt3d33oAk9gFXEaHopa9O4HekRm2MYD1A7U60Q0ErLReJRf3iRLGBlcdh3M1PxiwRDhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e42a2312-10e8-87f3-10c4-bb8e0bd765b0@suse.com>
Date: Tue, 4 Oct 2022 10:31:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] Use EfiACPIReclaimMemory for ESRT
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <2561c7fc38d9b4d17cb0205fec49b941894cfcc0.1664570575.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2561c7fc38d9b4d17cb0205fec49b941894cfcc0.1664570575.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0003.eurprd04.prod.outlook.com
 (2603:10a6:203:90::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aed417e-caba-4b9c-450b-08daa5e2d293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ushUk5PHCYcWrsFSdB7GkyL80+x1ZE98ymtmioChczqVR5zYU5E5HkYZeP7FM54ZbtCzBT3mSNmOdoRgwfe6RYQH0vE/uxYiNQK0RP/s/t9OlYoGjaEPUMdhIRhAAAqfDyYm4NEG/cGYscCul1S++RmlBvYD28iSjAIT4jfmXlqvOcRB3LZLe9Sc/9gwcEcivceqJeIZRRmtZkkO1OreE44fqZLItLDHyMTVxiova5WUBv64lBarMivuUAq4gbW4tt6Vx1QjS4nAk15sXupdJsPR+QNB0PF3cC6ZYfCQjESlEUS1qRutHI4Q3G7qXNtjpMk5txCHnQuadPRE+mrQYvOtBEq8iGCTUKgIdX0UHO5leylyzhFUT8kZieoF7rjylDZmthEe+bgKpj/eB1pLSyVwAhUQ8YXFmC6T27jueZWw9oTctrhzJ8Wr8uh86Ii07bxyZwxWUesxQ8JSdMiXWw7LwnC0N8KcZJCVioC/8MdvqSjLNv7kzm4VQhlj7zSBX46wO+2fhjgCceyDYrGwhp440fV7rUdWPYaEV5kijd6eP5iXYuP8ZmkVubas/JL11qJWBC+eLEasfu9LrGncz7286bYcSsrO87uILYxbn/JAgj+taU0E3cfy9YQk5uUWgamRD2Dq2mvwtCw1GW/d342AlpAYqsJGogCLUMbnHuGHr+W6Mh1RknKNrRh7180x8mq6doX70yRH1pbp/D4ZeRvEZgHKdn7yy2VZcndCpjwsk+YmdXcIdxRXDumZfHx/MJc5H5X4R4v8ZyRWK559NiHtRk2zEy4ZKhINs9LSdGw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(31686004)(2906002)(38100700002)(478600001)(31696002)(36756003)(86362001)(66556008)(83380400001)(6506007)(2616005)(26005)(6512007)(53546011)(186003)(8676002)(4326008)(5660300002)(41300700001)(6486002)(8936002)(66946007)(66476007)(6916009)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME1UZzNQM2U1dTNsU1BNV2lWczFLV0N3NlJXUkgwSVE2M3hNb2crSHJyVWxR?=
 =?utf-8?B?aU5HWnBzQ2VOY0tGdm01QkcyTWJJV3Y4OE5tTytLRFFKb294OWNrZERIYUww?=
 =?utf-8?B?OGNJelY4d2x1SmcveEY0OU5GWTFEOEpNTUM5SGJoVGYvTitoSTFTZFFCZ0Zx?=
 =?utf-8?B?K29EWk5iVlI3cUMyc0gvY2tKVWNRcjFmaXhUWEE5QlAyV0ptT0thZVdqbFY1?=
 =?utf-8?B?S1dqYU9mdkIvcCtBNnRCZStnejNFQnNDYi8zWEZiTDBIdXZBK0dDckFBS3dj?=
 =?utf-8?B?bkhlc0svcDloZjRWL0lzUHFzVy9uTE8rajhMeE5jK05rMWdERCtlYktXSmJO?=
 =?utf-8?B?R0hiV0U2Ymlvc3I4MmlHZkU0TXpwbFlnKzhDZWJyQnZ2RVEybllvcENGZG1M?=
 =?utf-8?B?a3NqdHR0WjJIaVJPS1FzNFVhRWhiNlZGZVJSUDUvUStDZWVPU2d0RzFsOS9v?=
 =?utf-8?B?L01GekJwTjFJNG5TN1FzV3l6a3c1YU9wUVgvbHp1YWdsZGY2Zk04aDBkbUkw?=
 =?utf-8?B?cU1WT1ZqdWpNNjdvTUlTRWIydmFjQ0VPakVuWkd3L0JuVVZRZXVsd0xQNWhJ?=
 =?utf-8?B?aVZ2U1hKYWNhdUtOcXNMKzFLL25kVlQ5WU9OZTBOWjM3azZ4U0hTRFBPQkNR?=
 =?utf-8?B?eEVEZ3E1V2VNOFlGbEpLMjZ5UWJvMHU4aU9lN0ZWcW14d09LeUdTM1N5ZVI4?=
 =?utf-8?B?YThRbHIyenh1WTBhTjRhM0h4NFFncC9KWXkyblZrQUJId3MrREZBeFZxY0p6?=
 =?utf-8?B?VEk4cmlHNGthRGVJNll5WG5jTnIyMjdWN0tEU1ovcmx4TnpJYlJTWEw2YVd4?=
 =?utf-8?B?TjJYdktmSWliNDZWb0FmNzF4WTF2Wk1RRGtDbVpLeWdBYzdFOTNCYjRzekJH?=
 =?utf-8?B?NWZWYUhnL2phOGd3SmhkSWY1WGdtRjkwYlhqQ0JYTXZRR1FteVhxWEdSQVZi?=
 =?utf-8?B?aUxVb0MzdXJ4M1p1YXRra3VVMTYybkZUeWp3R3FXZEcvWkRSNnhraEhwNjR1?=
 =?utf-8?B?VCtEdGx2VjNLUTlwbTFPSVJaWmZvRU94cXhuSkZrMzlFNTR4UlZzV3M2NDRW?=
 =?utf-8?B?Q3BQRlRPT3BKSlJ1UTFXaENheG1tSkN6QVBubTdvRzRWYlo5N3Fsc2FJNmQr?=
 =?utf-8?B?dDYzTUc2QnNHRElhUWFyMUZYeURvVEZsUVJ3WkVNR1ljQTFaa0dkSmZMTHln?=
 =?utf-8?B?b2s5bUhhL2x1a0tHTWdqRUhZT0cwUWg4azBOSWI5d0E0MUpkbEQ3T3ZWYi9y?=
 =?utf-8?B?WnBsR01OQllrNDBORWU2VWRFL3VWdUZRcXdPUmNWZDRoRzFFd0JIdzFqRCt5?=
 =?utf-8?B?U243TW0wallxcitiWXg2NHNRaGVIdG1SeFQxeC9FRW1BbDhzUEF6RFpmSmhh?=
 =?utf-8?B?c2kwRDJuZkVZZXg4dE4rQmVHK0VMMWpXb1Rza3V1RFNpRFlrYVRNeXNXL25a?=
 =?utf-8?B?S2YwUityVjJTd0l1Wk5YTXdUcEZzK1RlTERuNHdNUEJRWDB4ZXA3V1RROFhL?=
 =?utf-8?B?bnZtWGhURVUyOW1iNytscTBLcC9EMGRhTkY3VTJPMCs0YUVXN2swMDZnR0Np?=
 =?utf-8?B?SHpFYUp6a29pNzhUOFN2WTBvYlkyVU9MQUlmZVNUbTFUbXBqK2UzNEFzczU4?=
 =?utf-8?B?VENnc2tkdC9oaVF6RG1FSUpiSVE5Q0ptQ3dESmRoa1J0a1pOSzcxMW1PbUFi?=
 =?utf-8?B?Y2JEN1FNZFg1MFpuSCtRbUJ6ZEQyMFgxdk9QUWMzNWgzU0cxVHZPbzZSai9U?=
 =?utf-8?B?M2dudUFYL296WTl4dUwzanVKUUd1Tlh3WDNyLzFMSHl5d2liWjRNci9uU3JN?=
 =?utf-8?B?K0c1Zkw3Y0w5WDY2TEtubjJaS2VZWDlaU2pkSkc1NURaY0taZ2NiazkwVVRG?=
 =?utf-8?B?KzBDVTdQR0VPNU1lWndhNG55RVZ5d041QThhanBONytQOER4emZ0OExBaysr?=
 =?utf-8?B?Yk9WZElyOXlvdjVPV3JHTi9UUkNyRUlEZFdTTkZ1dHpyZDdYUnA4cUNsbU5R?=
 =?utf-8?B?Ly9ma21jUldTZVpPaEJMTjg0SlJQdFd2T0djVDhKdW1XYWZicUdFNzBHSDBn?=
 =?utf-8?B?ajF2STQ0T3A5OGlQRmlENGZ5VldGTks5VmJoeU1NeTg1RDI1VVFRNm1uY1NX?=
 =?utf-8?Q?Ni8UnAmqSfLEm2N3a8QrpueuG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aed417e-caba-4b9c-450b-08daa5e2d293
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 08:31:24.1655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVk83NQV6xGr4kRhjCKdIriO8KHWSrN++43M17sqadTNGT+R33DtOZcoC0ZWspS8yAF9hjpyGfIy0BAwIhoBKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8206

On 30.09.2022 23:02, Demi Marie Obenour wrote:
> As discussed on xen-devel, using EfiRuntimeServicesData for more than is
> absolutely necessary is a bad idea.
> ---
>  xen/common/efi/boot.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index db0340c8e2628314226c618dda11ede4c62fdf3b..dba23439758d1e842d267dcd19448e0f9113b115 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -601,11 +601,13 @@ static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
>      if ( physical_start > esrt || esrt - physical_start >= len )
>          return 0;
>      /*
> -     * The specification requires EfiBootServicesData, but accept
> -     * EfiRuntimeServicesData, which is a more logical choice.
> +     * The specification requires EfiBootServicesData, but also accept
> +     * EfiRuntimeServicesData (for compatibility) and EfiACPIReclaimMemory
> +     * (which will contain the tables after successful kexec).

What's the compatibility concern here? We haven't released any Xen
version yet where the table would be moved to EfiRuntimeServicesData.

Jan

>       */
>      if ( (desc->Type != EfiRuntimeServicesData) &&
> -         (desc->Type != EfiBootServicesData) )
> +         (desc->Type != EfiBootServicesData) &&
> +         (desc->Type != EfiACPIReclaimMemory) )
>          return 0;
>      available_len = len - (esrt - physical_start);
>      if ( available_len <= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) )
> @@ -1144,18 +1146,19 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>      for ( i = 0; i < info_size; i += mdesc_size )
>      {
>          /*
> -         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
> +         * ESRT needs to be moved to memory of type EfiACPIReclaimMemory
>           * so that the memory it is in will not be used for other purposes.
>           */
>          void *new_esrt = NULL;
> -        size_t esrt_size = get_esrt_size(memory_map + i);
> +        const EFI_MEMORY_DESCRIPTOR *desc = memory_map + i;
> +        size_t esrt_size = get_esrt_size(desc);
>  
>          if ( !esrt_size )
>              continue;
> -        if ( ((EFI_MEMORY_DESCRIPTOR *)(memory_map + i))->Type ==
> -             EfiRuntimeServicesData )
> +        if ( desc->Type == EfiRuntimeServicesData ||
> +             desc->Type == EfiACPIReclaimMemory )
>              break; /* ESRT already safe from reuse */
> -        status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
> +        status = efi_bs->AllocatePool(EfiACPIReclaimMemory, esrt_size,
>                                        &new_esrt);
>          if ( status == EFI_SUCCESS && new_esrt )
>          {


