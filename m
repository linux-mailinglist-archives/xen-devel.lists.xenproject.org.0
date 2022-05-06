Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E3E51D707
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 13:48:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322966.544473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwR1-0005Lq-I5; Fri, 06 May 2022 11:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322966.544473; Fri, 06 May 2022 11:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmwR1-0005Jb-DY; Fri, 06 May 2022 11:47:47 +0000
Received: by outflank-mailman (input) for mailman id 322966;
 Fri, 06 May 2022 11:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmwQz-0005JV-OZ
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 11:47:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57660ed7-cd32-11ec-8fc4-03012f2f19d4;
 Fri, 06 May 2022 13:47:44 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-28-Uyc_Q3PNPpOlIRvDEebKUQ-1; Fri, 06 May 2022 13:47:41 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU2PR04MB8503.eurprd04.prod.outlook.com (2603:10a6:10:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 6 May
 2022 11:47:40 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::84b:e9d3:8906:8b9c%6]) with mapi id 15.20.5227.018; Fri, 6 May 2022
 11:47:40 +0000
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
X-Inumbo-ID: 57660ed7-cd32-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651837663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uHj7kxwdA7oUVypSDJu19yI0OKWwgUQFQbOc/diBkww=;
	b=XO7FvvIBcsE4sk1SpiuQIg5wmSFM7LuztnBP3bZFDJrHaeszulHXMIr6uZZp/xcLN/WGhV
	Ug0pWhiI2WgFaENAU6MhyaXToTgHHzYkAO1A2Lfqnd1ONaabw/L/KdTx4Zp3zH9FfM+x2v
	f8SwwU72h/dPTHF8qiFYG5snAvynuyQ=
X-MC-Unique: Uyc_Q3PNPpOlIRvDEebKUQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FO5ZFrVFFiahHpz9wA9f93JRQ0pAtldNYb7hMxjyJrs/WelJWdfzUTH/LWxwJ42gZMdhUjciD+BW1hJXiSVzYJ8mw/JxGiEXNq3WiurSQOHjvun4xSdYyq8MA2BtG8mKPcGDqdoMtPvhTpBbVIUugA0fE8AlFiYOLWK106sRNXj7eduYG8eOWa1sXduocrwfU68ImRgLvKsP7jSDkEFaxHhTy78ZsqYEwXEuGgZxBdXVWbop0ycd7kjWxvqP6WnYmtfJrzG5+PpqB5xfGr+pRd+rmf/x0BALMOuomap1Qngjd/wwY9EtU9x31g2T34rB0XclDFbzETJr1qEpitODFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHj7kxwdA7oUVypSDJu19yI0OKWwgUQFQbOc/diBkww=;
 b=ZcjKRMwKX1AkXeHWH9PPU1IQNOeXfpEqolfjNZeq5iTC392pYs6lRqMqtsjdxMHaL+IgQQ2eWdr4Wxk1DgUtBq3/SBOkdan8j6jklhDIJl4udI2Tpgtj4sUTgTy/AfH4T7expIJMA32AgPpZ6cE0Eep8b8K0BmxOPc6qA/MxQpA6I8Qew3ubY7CenIZ52NEroh1bneIh95F21O9QdCfxEvv2yBfR4Se31sW8WcJIBO/7haDy6BJwSRQLK5vmOn1JSn/s3KsaXJXWiNOncoRe5Edxalt0gUaaOEnwl01cQ2HuKFr/pYNeapf3LvW059bZ7/kre43Hf/m8vp6/by08vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e729605a-84d6-9016-4659-92de2b523052@suse.com>
Date: Fri, 6 May 2022 13:47:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org
References: <YnNi7iW2s5jsJIiA@itl-email>
 <f06cbdd3-06d5-dd72-88d5-477cabf65b45@suse.com>
In-Reply-To: <f06cbdd3-06d5-dd72-88d5-477cabf65b45@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0014.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::19) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99ec0333-917c-4051-7da7-08da2f563929
X-MS-TrafficTypeDiagnostic: DU2PR04MB8503:EE_
X-Microsoft-Antispam-PRVS:
	<DU2PR04MB85031A1A30633E56FDA0CA15B3C59@DU2PR04MB8503.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5rHF6Bsqgo+FjjAcEOJWUG4GHWZFWzJ8zy8ncCVcRnUFxnBR8NEmBui/p1UfDJ/0p4l5HHBc4GRdset+tSjUmyYqyzFHTCxd3d99JrJPdfxYMTJhCCBpLStYOfS7afeXWL1u8a6pgjWU9mrDdVgpBkGbSz5qEASrzsAKxRQL5HPGEBK1nBGgSCfydXEkmZLhGzdODk53y+a5/hUqc6nd/EEKFfihHdP8L/dXmyG4z8aqqJfHyHSLu/+MZ2yrSDJqhEES6TWSFBiIAY8LEbPEbjW4WWvMoPlOCpnL5MLwwSCEpU6w7buseGxJsw1muiaM/p+JzDo1bg2/IyJxTJ86ZAilkj5WLzA28bXG704p8f7/mXgfZB1iW6a6CZi0uC8nVHUsx/QOz3GrKWcUwHixwNN0mGEEeU1bnp2dre2FBrye80OgYRXJcn8nmv9NjZI//SI3QT6FVTUBxF66G+dXWujiQ5MG5gceV8dM/UnGua4yEGw38mqU40dnbgnKk/Jqio2z3we1bk6AHg2gIkLQMmKu+w0xo2QmUj10cIvU/zJhheM8m+JCEQbCy+tXF+tVOZn3Wyi04cOTtZUiXQcm9jlUcQ882B68oSQma3Bu2tzknLxjaPexofR/E53w3uefU0E0vXHCszTMjgr6SmZYg7XpEHZFEPeFA8T0DjWBHujyWfN5H+TkG1nRxNDwOBdRm+cQ84o3BpsjEesZXm0ZHyBwdR1t0iWXGzooqQs0Qqw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(5660300002)(31696002)(508600001)(86362001)(6916009)(31686004)(186003)(6486002)(36756003)(316002)(53546011)(66946007)(8676002)(4326008)(66556008)(6506007)(2616005)(83380400001)(2906002)(66476007)(8936002)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0QzRWdYdmYrUHp5cjdBU1NCWWMyeTBxM1ZPWUhDM2FSUEs3Z3VyM3kvMVY4?=
 =?utf-8?B?bk9YU3RyV3JMTFBldEF1OXI3ZnQvV0hsV05tUmdZUzJLYTRrNVdyUW9HM0dO?=
 =?utf-8?B?ekNpRWo5Q1BDdzNBK2ZUa0RaS3pXSFhteGRZQXNKSGg1MGRLeTdSbTJpSFhF?=
 =?utf-8?B?dGpMSlpsMG5TR1dra2ZaM0k1S2gvYndqL3RYb0RGWS93Y3RESk9ueWNSWGU4?=
 =?utf-8?B?b0lWVmVPRzhFdFN3UnR4VExJUmhNMDh0Unl4M202Z21La2ZzYUtvMlBBckpy?=
 =?utf-8?B?Mmg5YzNxTklvck45NEUxT0xJbTBHYUlGeWgzK3ZwWXg4dXp0ZGZUL21hQlBI?=
 =?utf-8?B?eUZua0N2bHNnZG0wbHJKRTFNOTBHZW9Tc0ZSL0NxQ0lkZFdvZWRWaFJLKzBE?=
 =?utf-8?B?UWhWbGxJUU1mMDVIT0pwSFl5a1F3TnprTDk5WTdCU3RmSkdmL2xtb1owMktC?=
 =?utf-8?B?M1NocU1SUnFGUld4R1UvNDljTUdiaW5EZmxyellIK1BMZk1OalR0WE8xWTZ5?=
 =?utf-8?B?SXgrVVpjQlo4dFNQSTAraUVyZ3JCemxJSzhmTE5wNDhiamRkRjlTNVpzUHd1?=
 =?utf-8?B?UTl6V1lQajh0VGdZYUlPRzE5VVhqNUdhZVh4VklnK2I1R2RFZ3Q3UW1NS0RQ?=
 =?utf-8?B?RlhPQmhEeG9DM0NkQzVSekFiNmc4QzVsbTlBSFlTZ281ZmlvelY5U0xReTBU?=
 =?utf-8?B?RzFYVXhtbDVVeExFT1UrczIzVU1PVG4rK3RIeHVhRUVrWEMrVFd3UC9ET29x?=
 =?utf-8?B?NlV5a1NELzIycHRseW93Mms1MG85WTR0NU9KakE0WWV6NnIxaU9UelJzMXZh?=
 =?utf-8?B?WXNFR2hDSVZkYmU3OVZ6RGdodnFHU2dSZ2R2eWNkRlIvRjJpcEUwY0ppWVpl?=
 =?utf-8?B?YUw3ME1PM2Y4aUtLeCtyTTF2R2t2N09BaCs1aTh3elBCN21NeTRXYUZQbTJ3?=
 =?utf-8?B?SFAxUWJpK2Q1U2VmWXBySFUzT3llMGNrOWJUQnBMTU05ZDh4Wno2aXg5Z2Q5?=
 =?utf-8?B?MEc4bkQwaDlHV3RnWFdHWm9xSkRWOXB6Wk9BZkNOL1pjbytIUXRwU2owTS85?=
 =?utf-8?B?Zkl1b3RXcGIzU3phWHZQamZXRGowOEJGbGF3b2FrOEhNVVFsTXNGY1RYc3Bh?=
 =?utf-8?B?b0RjZ3lGa3V6ZEtwMUdMRi8ycjVxaFRWMHFBNGZUNlVkUVh1QXlEWm1KTXJT?=
 =?utf-8?B?ZTZ6ZVRHZ1czWHgvbENvdDYzNjh4eUZMb291NC8wZmhQS1ZON0ZSSmErSllu?=
 =?utf-8?B?Z0pJL0tYR3E1L2w5VndWMTBtNlFkRUhNSzgremtRRGUyQU9xS3locnBuVzBL?=
 =?utf-8?B?bC9qdk1iTmdTL0l0UXpieXB3T0xoV3U5cHdtdnlxenlqOFNHTFBEb3gvYVVQ?=
 =?utf-8?B?R00rYVdIOFcvbUF6MnRORVVSVGV3b1M0VjZFNENoZGN4bmZQSW55SEZZRFZ0?=
 =?utf-8?B?bHV2ZHlzNHlhL3NGM3dmUE5xakwzbUdyaDdlQnFEQWVPNmJWMmdmUlU3K2J2?=
 =?utf-8?B?TVNuOUdmVlFralU3VUZ0Vk5wdUJhSndKek42aXhlemkzSnNSbEM0dmRBV0xk?=
 =?utf-8?B?ZFlWOWt5bFRWUDV5LzlGMng4NVZtOHZTMFlQRWQyRW1FRDlRM0hNd0VscHQ0?=
 =?utf-8?B?U0VTaURMT2FOYlNlQUZJb1IrendrU0d6OXJxZVp2QVltc3I1T0ZuMldzb0Z5?=
 =?utf-8?B?SWZkMWlUUmJGeGR4a2R3dC8yK2lpM0xQOTNUaHhaTm0rS1VXMXhMM0NsWjl6?=
 =?utf-8?B?QjRzNHpibytFN1pJUXFmR21lNDdOZ0kzejFDOUYyQjliUFM0eWhmeHRUeXhT?=
 =?utf-8?B?clNSVFJXZHE1MGhmUzhjVEt6N3pEQ2g0OElUcjVxY0FuMkRLRG82SWhDUlAx?=
 =?utf-8?B?bVp6czlnb1QrRVo2WGV4b1lhbVVYQTNCbHdMTGtwVHBIQi80bUN5dm5mYVNR?=
 =?utf-8?B?SEQyMTFMUTNGNmRLb1kwQkxlS2I4bHg0TStyaHIzMGdXL1Z2bXRFa3QzUjBo?=
 =?utf-8?B?OEh0UERtcUVtanZlZmxGVVpiVk41VC9IMiswby9la3RKR3VVcDJ1dFp3Zm03?=
 =?utf-8?B?TE90bTJDa2d0SW93bS9HZHJ5N25sVXB5VFkwbUJzK296SEdGc1p3U0Z1eFNB?=
 =?utf-8?B?QU04N29PRUlWRWJzemhsQXREM0Y4elppV1RkVFRwZ1Y0UGd3SW55UjhmakJZ?=
 =?utf-8?B?MTg1bUVNWmllM3Nwc3hsK2VZM05RcVczeG1VUUxqTUhUV2xiR1NkS3YxeDBa?=
 =?utf-8?B?S1NuU1BtbXBkajZlYWl1cER5VlczMXZnT2grT2xUcnJBZ2trMENIcndpd0ti?=
 =?utf-8?B?VlhJNWpqSDhmekVKYXdHSEFVTEdEZk1UYW4vTTQyTjV2UlVwelJlUT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ec0333-917c-4051-7da7-08da2f563929
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 11:47:40.0947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: up+/+dRWt6LxUcs0ygMLKamZps0fgvPYCL6SVqRc7MH2SPfuJFqbbt5+7H2EJnf//dsUX1NjfHqG/FyOz9dHRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8503

On 06.05.2022 12:59, Jan Beulich wrote:
> On 05.05.2022 07:38, Demi Marie Obenour wrote:
>> @@ -1077,6 +1110,35 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>>          if ( EFI_ERROR(status) )
>>              PrintErrMesg(L"Cannot obtain memory map", status);
>>  
>> +        for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>> +        {
>> +            if ( !is_esrt_valid(efi_memmap + i) )
>> +                continue;
> 
> Instead of repeating the size calculation below, could you make the
> function (with an altered name) simply return the size (and zero if
> not [valid] ESRT), simplifying things below?
> 
>> +            if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type !=
>> +                 EfiRuntimeServicesData )
>> +            {
>> +                /* ESRT needs to be moved to memory of type EfiRuntimeServicesData
>> +                 * so that the memory it is in will not be used for other purposes */
> 
> Nit: Comment style.
> 
>> +                size_t esrt_size = offsetof(ESRT, Entries) +
>> +                    ((ESRT *)esrt)->Count * sizeof(ESRT_ENTRY);
>> +                void *new_esrt = NULL;
>> +                status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size, &new_esrt);
> 
> Nit: Please have a blank line between declaration(s) and statement(s).
> 
>> +                if ( status != EFI_SUCCESS )
>> +                {
>> +                    PrintErrMesg(L"Cannot allocate memory for ESRT", status);
> 
> Neither this nor ...
> 
>> +                    break;
>> +                }
>> +                memcpy(new_esrt, (void *)esrt, esrt_size);
>> +                status = efi_bs->InstallConfigurationTable(&esrt_guid, new_esrt);
>> +                if ( status != EFI_SUCCESS )
>> +                {
>> +                    PrintErrMesg(L"Cannot install new ESRT", status);
>> +                    efi_bs->FreePool(new_esrt);
> 
> ... this ought to be fatal to the booting of Xen. Yet PrintErrMesg()
> ends in blexit().
> 
>> +                }
>> +            }
>> +            break;
>> +        }
>> +
>>          efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_size,
>>                                      efi_mdesc_size, mdesc_ver);
> 
> The allocation may have altered the memory map and hence invalidated what
> was retrieved just before. You'd need to "continue;" without setting
> "retry" to true, but then the question is why you make this allocation
> after retrieving the memory map in the first place. It's not entirely
> clear to me if it can be done _much_ earlier (if it can, doing it earlier
> would of course be better), but since you need to do it before
> ExitBootServices() anyway, and since you will need to call GetMemoryMap()
> afterwards again, you could as well do it before calling GetMemoryMap().

Over lunch I figured that this was partly rubbish. Of course you need to
do the check after GetMemoryMap(). But I still think it would be better if
you moved this out of this function (or at the very least out of the loop)
and not piggy-back on the ExitBootServices() retry mechanism. I'd be
afraid this could end up in a single retry not being sufficient.

Jan


