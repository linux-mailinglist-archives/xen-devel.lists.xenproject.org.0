Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB31152D685
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:56:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333084.556867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhYe-0001UM-HH; Thu, 19 May 2022 14:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333084.556867; Thu, 19 May 2022 14:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhYe-0001SI-E3; Thu, 19 May 2022 14:55:20 +0000
Received: by outflank-mailman (input) for mailman id 333084;
 Thu, 19 May 2022 14:55:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrhYc-0001SC-Fz
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 14:55:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b20d1209-d783-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 16:55:17 +0200 (CEST)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-xOugt2u7NICp0fvNlc1SRw-1; Thu, 19 May 2022 16:55:14 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5997.eurprd04.prod.outlook.com (2603:10a6:803:d0::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Thu, 19 May
 2022 14:55:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 14:55:13 +0000
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
X-Inumbo-ID: b20d1209-d783-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652972116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=528nIOCAJHjIXQ1X77cUjEYGlCmFSVGpMWemLO9XUbg=;
	b=AqeVaSTEWbtBmxHAc7XqsepLMPO+16sZSd3LYFfXzrX7+jxqm/OmgvFsYDbhzSMmkSlc1o
	v4Pcz3pqUwpDO9mkIH0+WhhbEB6S36s+64vqrmJ1pSR2cj4QFBmdzkg53TQFgZT4b7gmv0
	DlFbMZCx8JpwKqrvICJ/CDrYPhZ7WsQ=
X-MC-Unique: xOugt2u7NICp0fvNlc1SRw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPP1pNrwIQ2kz7O7Iziq33+HuNlkPi/Aiw2CABNHRkgSQY6YIdW3i1TyU14Vt6ReRPn8HLb8LWs6DnhC56p3WOOFkivjTtcPfg6pKmkpR/NUiz5SYoxi0FmjaqKzBA+GaW3f55QbcY3tvgxl/+/CnUAUn0TI1OYeXAk8HrqClcAdcyh6N7e9SuJcYTYaWuR0pixievcTd1GpzIWEJhZBqIkzp6fpfLG4VrEd6DXzWzn6kmJqIpysEI68KqosAmUr2C00WQAsDkni3YRVILiNinO8E4Bukd1bn/Demm58N4LEMaKOsNwiWhf5TPRCe/IAbcDgLBbxO4bXeHcs1shupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=528nIOCAJHjIXQ1X77cUjEYGlCmFSVGpMWemLO9XUbg=;
 b=eJlbXxqevrVDGvswI4Orv5FlmO05y38kFEZ95BVqEGfylrodkykUjwHuAMDeFjZL4RZPyFDQUyXESI+mWtiQ7O3kmOSiz39qNikhrHgW0QfTH0sb5o2lmNtrHfieFcV+WU0jgq0RFVDP06MtPuB2AF2PjFhTPo4bffJypt+RyZdnnRoXzB1wFUd1MHK3+av2SlIQgs9oCsyunUNLRqq4vKa8/8/l01+ASzhTgRx88dVk8oEZXGmud65Ggt6F3urzdhZlJ0Q3WgK3PnfgGwJGL/EH4zi8TQVpDoJNvJKVVf+/AwEmseClxmYByjEtc+49Jq0JxGdqPyiZAIS5vls0Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <05d4fa5b-78d6-96e6-b643-a98d26ec954f@suse.com>
Date: Thu, 19 May 2022 16:55:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <YoUtuDhVimlP7r8F@itl-email>
 <2add184c-04a5-3ca0-876d-e354f35df62a@suse.com> <YoZYI9ZJzkd4WqFf@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YoZYI9ZJzkd4WqFf@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dafa2650-9b18-467a-7487-08da39a793df
X-MS-TrafficTypeDiagnostic: VI1PR04MB5997:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB59971EB75B1C5492DF7F5349B3D09@VI1PR04MB5997.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dopoXURTIB/jQCUEFIgsGbSvgwCxFUwWjeb1dxu2oGvqAXMRMhByCYwW0qOoE9KC+Ba4HaJIXE01Zj199CdVOuNPHdEgxO6ZVqgGydvENQzCpjTGdq3VA59/fTSnycllmodzLpi8CsZEiJLKQl6ItuOfF+LNZT2Xf6lbubcliAiJE+snqIHDexuMUbusGiN4JH/KwDpYnnJoIDDY00giH+Qrmoyh/WOhOP1+2sjsvnASGJWIIJQJaEyx5vaSKi0xvy8eCj/r7cfh66Fcj4/z7V76n3APw6Zqoje2lS+ifXf/5FC7t3RHixmnEWi20i9JBC0IV3DJGTyQAGwTC7ZpApsgr831SNKUBuYXNulDLeBJirxss24F4vxRySqAHYsXjrjJkQ/78JRMzNGlk57Ed0xAksJHyFHwujkVwynj60WAPLgV6vC3JVElIQ8fQJbLMr8gMl2BbCPWNtdtb/cEXDqwDfjhEftVMN03P38XgEQ0mVArxVrIa/ldRyGehK8sNjt7aj4yuXul0iPVO384eWjTETSIcAV4/7tVcU57WT1CPMCvBSnskL3nqQ5rB/fo8YM7J8sRP6ob+vpI9A0NkWuuj0FadU31+ivX1PgvpC0VoIa5HIn7VyB2uY7h9pdS+qf/T+EiVSo2TtHm3O+Cr+Ajap9TpZXBQxjRbplkN4BBajyTc676eA3xDQVs5y2EL97psRSTNCmQbB2QfXdJCZL+rqcvnHWmgAcqwT4GIxgHi8okowB5wVcGkE6eZqm1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(5660300002)(83380400001)(86362001)(6486002)(31696002)(6512007)(26005)(6506007)(508600001)(53546011)(2906002)(6916009)(2616005)(186003)(66556008)(66476007)(66946007)(316002)(8676002)(4326008)(31686004)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0w0UHJoM3FlcVd0RkxCYy9VTXAzOWNGcjhQR0hIZkdBRVl1c1Y4WVRMY0lE?=
 =?utf-8?B?bllFVDlFTFFzZEEwWmVkSmJvZU5HbmFzYmlsNWxNTm9namJTaGJFOTEzTFdC?=
 =?utf-8?B?U1gwbVgzNy96alV4VjUrcWtaZ2hPeEl4R0lxb0RMblZTMnNmaG5icEVxZ2lX?=
 =?utf-8?B?Y1NFM0FyeTVBSDd6bG1qZ1dKUzhneHVWcWI2Njh2aUI5MW12VWEzeFBwQk5y?=
 =?utf-8?B?dE4yVTZZNXA5ck5EaTNXRWpPMTJVTFF6QzBobTA2Q05ValI2ZndlVkNzK3NG?=
 =?utf-8?B?S3ZHd1lYdk9MeWpxbFpaaFJwOExSWmZqMEpnN2pOQUhxb2lsR3FPOVByeFpP?=
 =?utf-8?B?T1gzNGtMandKVGdRWDdHeDJFSTdVZjc0WUY2bm1MSDUzN3NZaDIzVnpHMWht?=
 =?utf-8?B?enQyQ05TQ3QwU2F0ZGR3NVA2TVM3a0ZGQ2FJcEZXUFJsbVpMbEtOcFlNOWdr?=
 =?utf-8?B?OUpzT1ZlZUVKa1pvbG1LeWRxUFNlSXpLRUtoMzE0Y1FQbFdDSzliQ21xTkcr?=
 =?utf-8?B?alU0YVJMcGQ5NVJUYklOOWhHOExPMHJDLzIvVFI3SmpIM2VFVHRrWFdBVDhx?=
 =?utf-8?B?SGowQjNDaGlGUHpnekVzMnpvanV4cDNvQVJhVWJRajFTbHJ0UU5xbzNhbDJk?=
 =?utf-8?B?cktzcmVZS2wyZFcwVUwwQlc4blFjRzh5aDErSjN0VVJoaDVadlRKVHR5N2xx?=
 =?utf-8?B?V2tCOGJzelpQem40am1lajV6THFRYUM3c2Nsa0hSYzNYNVdSZkc5ZmpDb0xH?=
 =?utf-8?B?V1lMLzNMam1weUlQczZoK21JNTRZM1lmU1BKMlhVSG1LK0lVQit3N2ZzckNk?=
 =?utf-8?B?UUJYUy9ZaW9hai9jbmJXRy9paThSdCszWStKbmdONFZWRHY3cGl2MHZuSUhy?=
 =?utf-8?B?eDhCZE1mWS9qZVd0em1jN3ltREJTTzNiME0rQUJXZVN0YnNWbTJIRlhtemxR?=
 =?utf-8?B?cTloTGlUUzNKdEpDYXo3eTE1QWlrbXJXcklEQkN0b0hmSk1JSGxQMnZlYysy?=
 =?utf-8?B?eGdoSTRJUmRwcnNQSGcwSXk4R2MwTUpkNGJPNHFERGx6L09vZW5kNW1JL0Zv?=
 =?utf-8?B?WEROcC9INXFnb1dVelZNUUhxdzFNcDJ0NjlxMjVsZFJDMlhzd0hqU2Z4Q1Zw?=
 =?utf-8?B?Qm1ZYnIxTlF2aTFLd3JxVGdlQjd1OG4zb005eUNQZk5YSDRsdG1nMzJHNUo1?=
 =?utf-8?B?dHFGTVdtZjdDaGJZWG0yOXJacUMreVNJTEQxaDAzUVI0ZEUweXhaS2N1N3k3?=
 =?utf-8?B?aEoyS2FUeVRmMW9hZHEwdkhFdE9IVEh6ZmUyYStSdWttcVJtZXRISXFibld4?=
 =?utf-8?B?ZDR5aVpaMFlINDlnM2I1a2ZDcWtVaEpZT3N0NUdORFZxZTEzYjhPdi9LNVVs?=
 =?utf-8?B?YU8zUTlsTXpKa05yWTQ2SDBuRGNJY0pXWitSa0pLdXcvWDlBem1COUZvMnYr?=
 =?utf-8?B?OEtxZUk1QkptYis4REVuanFSdGhQOVZwU0dlQnFvTzdSSUF4bGRTdllzN01T?=
 =?utf-8?B?VmU5R2hsb2x0Y0lnMUdBTmhIekx6Q01PcjA0SEQ0cC9ETFQvZm9OTnpVRjdm?=
 =?utf-8?B?YVAzMTJUL25zdFVVOGlTcmg1YnNCUDJEeUNSK202NzdPd21YdXlEUkN3SXlU?=
 =?utf-8?B?Wjg4R2gzS0FnaWN1dHBUNndOdU9hUjBiZWhyNXYxVCtVWE1MSCtKWTVPcFo4?=
 =?utf-8?B?ZnhNNEwrZDI4UTQvTnBXdEJ3TEtZSnBPcnBwMDZaT1Y1U3BMNWFXWTFGTjhZ?=
 =?utf-8?B?Q1V4R2xQN2F4b3pGc2xTUkxPeitYNC81RUpycGhYcHY2THQ0eDZHTE9EcGND?=
 =?utf-8?B?Q2ZEeW13ZHcwWmx5cHkrZHpEalNZcU1xVjB5SVg4QjlOUkF1NGh3Tm5xWUpG?=
 =?utf-8?B?SXg0NjhmbXBscU83TFlFNDFJOEZKNHFpZTVtRjlrbnpKSmlYT1Bmd2FjT3Nm?=
 =?utf-8?B?NWc0MjVnM2dnNWJqU3NoQnh0cVhKUGo2L1RCYk1hVVZEODlwdUdKSG8wOFZJ?=
 =?utf-8?B?MFFsVGFNQzZFVXRiRWcwL0tXVUpCUGJGcDRqWm9tZkNGNmQ1N3pMZkV6OHd3?=
 =?utf-8?B?QnlqUGVCVnhPTStDM2dDWlZzRVkvU1VSSU5mZEg3ckVTcXVSaXpDSkErTHNY?=
 =?utf-8?B?K3ZhdHdLWDZGSmlWZDNZcnpIaHgwSmFUYkRRaVdPZTlnOUNBZHB4c3puS0ho?=
 =?utf-8?B?R0N6cXhNWDAycTlseWh2MnBWNHd6dnd5cTd5L2xTNGtXT1ZtYkhQQlArUUZJ?=
 =?utf-8?B?WXdmSVpCUFhSNU50MHhNQTFHL3pqdjhrc2Z6NC9KMFpUWTVBbkIydmpzN1RX?=
 =?utf-8?B?SVRVaU5WNURDelFjU1I0RTM5eEhjcDZzVjZ1R2daVUU1Ny9TU0IxQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafa2650-9b18-467a-7487-08da39a793df
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 14:55:13.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMg65Jzj56Q+8kPeBGtamwajg6MaaQt8XtHZvl9ji8VPgBnAAGI64z3Py9DUwsD8ByqbfLAbd+GGnPzuh0pAJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5997

On 19.05.2022 16:45, Demi Marie Obenour wrote:
> On Thu, May 19, 2022 at 12:32:33PM +0200, Jan Beulich wrote:
>> On 18.05.2022 19:32, Demi Marie Obenour wrote:
>>> +    /*
>>> +     * The specification requires EfiBootServicesData, but accept
>>> +     * EfiRuntimeServicesData, which is a more logical choice.
>>> +     */
>>> +    if ( (desc->Type != EfiRuntimeServicesData) &&
>>> +         (desc->Type != EfiBootServicesData) )
>>> +        return 0;
>>> +    available_len = len - (esrt - physical_start);
>>> +    if ( available_len <= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries) )
>>> +        return 0;
>>> +    available_len -= offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries);
>>> +    esrt_ptr = (const EFI_SYSTEM_RESOURCE_TABLE *)esrt;
>>> +    if ( esrt_ptr->FwResourceVersion != EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION ||
>>
>> Nit (style): Overlong line.
> 
> Where is the best place to split this?
> EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION is a rather long
> identifier.

There's no good place to split; the only possible (imo) place is after
the != .

>>> @@ -1067,6 +1122,46 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>>>      if ( !efi_memmap )
>>>          blexit(L"Unable to allocate memory for EFI memory map");
>>>  
>>> +    efi_memmap_size = info_size;
>>
>> I don't think this global needs setting here, yet? The local will
>> do just fine here, likely yielding smaller code. But I realize that's
>> connected to how you did your change vs what I was expecting you to
>> do (see below).
>>
>>> +    status = SystemTable->BootServices->GetMemoryMap(&efi_memmap_size,
>>> +                                                     efi_memmap, &map_key,
>>> +                                                     &efi_mdesc_size,
>>> +                                                     &mdesc_ver);
>>> +    if ( EFI_ERROR(status) )
>>> +        PrintErrMesg(L"Cannot obtain memory map", status);
>>> +
>>> +    /* Try to obtain the ESRT.  Errors are not fatal. */
>>> +    for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>>> +    {
>>> +        /*
>>> +         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
>>> +         * so that the memory it is in will not be used for other purposes.
>>> +         */
>>> +        void *new_esrt = NULL;
>>> +        size_t esrt_size = get_esrt_size(efi_memmap + i);
>>> +
>>> +        if ( !esrt_size )
>>> +            continue;
>>> +        if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type ==
>>> +             EfiRuntimeServicesData )
>>> +            break; /* ESRT already safe from reuse */
>>> +        status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size,
>>> +                                      &new_esrt);
>>
>> I should have re-raised the earlier voiced concern when reviewing v5 (or
>> maybe already v4), and I'm sorry for not having paid close enough
>> attention: This may add up to two more entries in the memory map (if an
>> entry is split and its middle part is used; of course with an unusual
>> implementation there could be even more of a growth). Yet below your
>> addition, before obtaining the final memory map, you don't re- obtain
>> (and re-increase) the size needed. As to (re-)increase: In fact, prior
>> to the allocation you do there shouldn't be a need to bump the space by
>> 8 extra entries. That's a safety measure only for possible allocations
>> happening across ExitBootServices().
>>
>> And yes, in earlier versions you had
>>
>> -    info_size += 8 * efi_mdesc_size;
>> +    info_size += 8 * (efi_mdesc_size + 1);
>>
>> there, but that's not what would be needed anyway (if trying to avoid
>> a 2nd pass of establishing the needed size). Instead in such an event
>> you need to bump 8 to 10 (or at least 9, when assuming that normally it
>> wouldn't be the middle part of a new range which would be used, but
>> rather the leading or trailing one).
>>
>> While I'd be okay with addressing the two nits above while committing,
>> this allocation size aspect first wants settling on. Personally I'd
>> prefer the more involved solution, but I'd be okay with merely
>> bumping the 8 (plus the addition of a suitable comment, explaining
>> the now multiple [two] constituent parts of a seemingly arbitrary
>> number). If you want to go this easier route, I guess I could also
>> make that adjustment while committing (and adding my R-b).
> 
> I would prefer the more involved solution too, but I am not quite sure
> how to implement it.  Should Xen call GetMemoryMap() in a loop, retrying
> as long as it returns EFI_BUFFER_TOO_SMALL?  If I do get
> EFI_BUFFER_TOO_SMALL, how should I allocate memory for the new buffer?
> Should I ask ebmalloc() to provide all remaining memory, and then tell
> it how much was actually used?

Well, there are certainly multiple options. I was thinking that you'd
add a new call to size the memory map, add a few (again 8?) extra
entries there as well for the allocation, and leave the present sizing
call effectively alone (and sitting after all of your additions).

Jan


