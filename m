Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883152A306
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 15:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330842.554243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx4H-0001DE-LT; Tue, 17 May 2022 13:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330842.554243; Tue, 17 May 2022 13:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqx4H-0001A2-Ho; Tue, 17 May 2022 13:16:53 +0000
Received: by outflank-mailman (input) for mailman id 330842;
 Tue, 17 May 2022 13:16:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nqx4G-00019w-SC
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 13:16:52 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d529705-d5e3-11ec-bd2c-47488cf2e6aa;
 Tue, 17 May 2022 15:16:51 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-lEG5yN8YPsq7iN166P-AQA-1; Tue, 17 May 2022 15:16:50 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4953.eurprd04.prod.outlook.com (2603:10a6:10:13::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Tue, 17 May
 2022 13:16:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:16:48 +0000
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
X-Inumbo-ID: 9d529705-d5e3-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652793411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v0UZ/OLygyxf38LEAdm98Ux14EuOFQE+8OC+NMGCUQI=;
	b=IOtnoFrl5l/k1XshdlhxlGjKeUGE/Fkn5zoh/gYtfvHZJ8ck5eBsaOqF2Cwk54x5fwulIp
	rNc+2kCkoxGMpSFlmm6+ZXxI8mqiOhYhktTuAO/2XIVoPbOKKP8NwHLr1x7lzUUwsAVIeI
	GlJcDTGQDulxbfiyGDIw81hT/HVURc8=
X-MC-Unique: lEG5yN8YPsq7iN166P-AQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5+BvwRAbB6ybPNfHiHWH2Ol+d6m1qBbDtG6MzPG7q4+xIZoFD8PiWlc6W1TkF1zqkcMvmwvWtl3KEjWPwOWUZRS+A2Ad5Bdf9niJ+17McaoUTcOa/5rSwN5H3uwcv5VLSmiVmh1IfJGCPp8el0iZz6XOVhtf/FSkeNzR99mt+ZlmqgLzks0vQPom0NxBObu7eC5UQJ4oduYSj7S4idhTbV+16bZ6X8iIfMNj58w4hQeF44O/yur7ARGaPajHJEGdbbFkCEstzt7O/Bm8+JCwUGaCPF7lsl0KQX+fWDlNzgv7OhpTRhaxFoj6+982PZJQS21hQtBfKUDzk6IuuhzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0UZ/OLygyxf38LEAdm98Ux14EuOFQE+8OC+NMGCUQI=;
 b=Qhrt6K0xjV6G8UcsZKsWQqaEagcRb9oKUxArllvu4EmKu2M7a3wIhnIz/H1EyO1DBp/LWNOMn06o0BvHjgWFJ5RkK2/Lk4UXTA95pTru7YqQWIgUeHvgS05C/OSKZnzsVqLuWxIXinAPxPWrSydQzdvFOApk43xKcG0tMTRtzE7u9CbKot7/69hkX78BFflqePsLbmQ6jwXVDG6EY/bY/FFMmw67MedrHz7fgs+Y72KdLoKRZItQebORO202zHCHxlvC3XUJgA1JLnDLUB2rDNyBTLI8/hI0qTC+niuO8mPA4aIfxdZPQEWux9diZ/plt0u1K3gmRBv7fCvRVf8dQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c9f5e61e-7d42-c488-eee1-d987fdee3ccc@suse.com>
Date: Tue, 17 May 2022 15:16:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org
References: <YnNi7iW2s5jsJIiA@itl-email>
 <f06cbdd3-06d5-dd72-88d5-477cabf65b45@suse.com> <YnX1CxHVBT2jNE45@itl-email>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YnX1CxHVBT2jNE45@itl-email>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a5aa943-e0eb-49cb-c446-08da38077fdb
X-MS-TrafficTypeDiagnostic: DB7PR04MB4953:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB495337E95831AE5BAC407C6DB3CE9@DB7PR04MB4953.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	I4x8/psxZyMCmtku2mZerIodmYqKgrH6zhhk+DF9ireYujVnWMV0J5enOU81kxtA8nVDzeNPVJfE/rwHe7zUFKH/8hGNC5d/vUjCTOtSLdQmi9KsCh9Y8deC/34Wcf5ip1NgcQphrdzO65tvIOB24+nP+arSfYMpPmD+zMylIB4pd2fa6az+TAuKwgEYS9Q/WpV4dAlv+xQ8QRM7ETOfNqs/Kl6STex4IxP0LoFdG2F7CXdee6c3beWbYAgZg+jQLjDC9KeUunlKU3LTgt3C35j2/BByWd9Duputg2HDVlgx4icdDZVomxbDgcYbzenF+LsjU7LhugQ6xGVfS7C98tYUdUw8o2Xpy14Wgimc73QXgMqQIn9D0sCuvMs3RC+vvwTntdwo747M6+4sEooP/L7EXhJfBj7AVvXlo8btrj8NeV5hJrqOBhimr8GfcfFun9NPkSLr3sXggSVd83yclpUtVd66JY2g3k2lyt3VGB6e9Lp4BKlV/YSNiU/uL63Zx9m10Ewv9yGU75cD61uwAdannKelKwYh3QUzKoqmhSevRRpDNrWpYg7A0dZ102axF/7hT8+lCzjt6mVa4dhmqrSLaA79oroVwIAikY/P21UGgRKm/3f7750x7j1aPRSyW6/JZWXASMGY/w0fYblWzBrOJXBww1PEK20Q6nqnlsYNg3fQ/MGEPHk0TapwJbn7yJ5FCnd5NZ9XKKp5D/XYwk0HMXZSYgw/9qsJwrbvbPk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(6486002)(5660300002)(508600001)(31686004)(38100700002)(316002)(66556008)(8936002)(4326008)(8676002)(66946007)(6666004)(31696002)(6916009)(86362001)(83380400001)(26005)(2616005)(6512007)(186003)(53546011)(6506007)(66476007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0NxMVp4N09kdWRWU2NTSzJ1UDlmK0ZQNXdIbmNLYXo1NVpvL0FkcVNrV1d0?=
 =?utf-8?B?WmVUbHV2UEVVRDZPVndXZDRxdFY4ZEpORlZicXVUd21GQTRmWm5TSWNYUGJX?=
 =?utf-8?B?dmRBY2k0Um0wS045T1V6MHJ3OTNGYWtjek1lOTdXOXVBQklFK1E1RmdpQXgv?=
 =?utf-8?B?RFJ5WFdhR0tjM3hXc1krZ0Nrb3phZUlkUUNPRXFmcnlZYURrRWdvZEtjcCtC?=
 =?utf-8?B?RlB0cE1Nc0JQQ2NGM3BJUFo2aFZnQTRVZlhqNTVIamcyTWtiN0UvOG10VmV2?=
 =?utf-8?B?RldKRGNNVS9CZnNvSjIwbnVSUHVoSmxPaVZha3Y3N1ZPaUo3NlJMNTVWV09k?=
 =?utf-8?B?TmhMVUs5UW04REVYbUxNK25xMjhiZjcraWJlZkpFaGNPbDdqR2NMZ2xaUzZ3?=
 =?utf-8?B?eVQrRitKOFJRcE5nZFl4dGJHbWszTE9wUDRaYnUyeWoxNTY0cXhua3Fta0JL?=
 =?utf-8?B?M3cxdE9taktnTmRxWVNUa041RzR1cmpVK3ZnY1dEY084S2hSbnhBdDQ4SldJ?=
 =?utf-8?B?UlRGdmIvRDhKdTF0QnprS2hlTFRkRFZsc1NmTXVUNDZrZGVWTUc2RGFreHJS?=
 =?utf-8?B?U2VjMmZZQVllajFFWHRXcG1vM0N6bC9rQTZmT0RPb1pQMEE1US9oaTN0SkdW?=
 =?utf-8?B?T3Q5OWVDQTBwWkhsbmRyejFWNks1bFUzaGliNUtHYWlwb1V2czMyNFlzOTlP?=
 =?utf-8?B?TVBpVjJId3lxQTVBbEFTV3RyU3cyQjlldVdKZFpNOUM1TFAvK2M2QUxGQ05U?=
 =?utf-8?B?YnFQdVBTaWZ0MlJ4NWFyemlKSXZPSDYxeWJTMWxPdjFjZVhkVWYweW8rVThp?=
 =?utf-8?B?MkFUZjVJOWdhOXNlbVVNbjE1N1IxOUt5ejltb1hMdUVQRnIxZi96a3JjR2Zq?=
 =?utf-8?B?UVV5ak5MZFdaRFJ3cXRxS1F2T3NSZis2WW5BZGxhTWNsRHVaUjZpY2w1N3VJ?=
 =?utf-8?B?ZGpYZjlwdjdIS2tHNHdXY3BQc2VCSGpjTVVlUjRveVFuWTQvMUpxNDVBa3VU?=
 =?utf-8?B?VjVDV1RrVEcwTXBEZEdpTVFHRVlrWStURWtqNVAyUGNxWmFYUlFmUFVGQUVt?=
 =?utf-8?B?N2dxQmNUZW9YeGFjN25GV2NzeTE3c1RpbzdaQ25rMDBtcmZpUFFSTDFhOS9L?=
 =?utf-8?B?bjdLcXRmbFJqOExsVWVyZWxOa25ncWFTOFdoN3oyRHBBVHRwMitUbGw0RW5S?=
 =?utf-8?B?MTA4S0F1bnlpNFdrM1Q3SjVybElZb2FRZXdDdE9zQ3Y1UWwxeDB5YTA0eGFP?=
 =?utf-8?B?TFhXZ3RmRmljSXd1cnByL1JPZkp5WlQ2dVdYNHJ1dTN6WlZCeS90djVNZHJj?=
 =?utf-8?B?Q2YrNXU0YkZCK1FsanpNeDk2R3dXemNBRmVqbU5jM3NVOGd5bzlVdDkvMENk?=
 =?utf-8?B?TWxIMnVwTU1uNzl5UStCMkZHemJkRUh3S1ppamI4WkwzMVJYQ2JLV2l4eldW?=
 =?utf-8?B?cGJkSDNmVmVUM29KQitrVDZ1MGw5OXozMTBKTFdLdllLSWV0bWpTbjFIbldp?=
 =?utf-8?B?V0tNRmZSemFudzBVSGFCei80eStuTFh4Y2liVTZkNzVQa0I3M1MzOEJPeFRh?=
 =?utf-8?B?TFJwcEJadFpQaTVhQ0h6MnFBYU9kK2EvZE1RdC95dnhGL3pMdTVUaW5JTXMv?=
 =?utf-8?B?SnUyUkNhdnBsS1dWaS9QdkgzaVRYQWZIRlNMUk03aitBd1BMQTVkNlBIMG5o?=
 =?utf-8?B?bDA0dmZDalRuVStEbkg1dnhJT0hlVEtzME5ZU1RuQ21oanF5ZXVsaEpwWFB6?=
 =?utf-8?B?NkVwVXJoWW1LKzBzeTYxaW9pWXd2clNzR1B6NHR1Vm9BdnR3UTk5L244R2Rk?=
 =?utf-8?B?dUFQT0ZUckp3ZVFITFVydmdBTWtvVjBrNTdJbTEvL2hzLzNUb1BMWTdaMnJ5?=
 =?utf-8?B?SmZnZmw2U3RYYklUYThBQmtkNE1jUnYrenllRmE0ZWZ0ZU1aQVpLcjBScGFB?=
 =?utf-8?B?UkVUTEZhekl3cXFBUzRka1JiTEdhSGRkNExsRkRCRlZZdzZZY3lac2pUcXdj?=
 =?utf-8?B?amJCQ2ZTQ1kyMUtmYjdqUngyaVN2aVZqMmlNYXprcHpZUHlRWDFIUmZYMi8w?=
 =?utf-8?B?T1BidC9MVU92RHdRU09BOWxHM0ZIU2tJMk0rMWN3S0Q5Mkx1dTFlckhTTlpJ?=
 =?utf-8?B?TkVIR0pMRHAxeVRvd2RzS2FBaGRUVGxKUEYyTng4MDB5VnQwWUFwaCtlQkYw?=
 =?utf-8?B?S3dTWUVrMUdLN0dyMUhoZkVJYUNBRnplZUFoN0t3NHFuUTZPN25TOEdDMllr?=
 =?utf-8?B?cS9ES21zV2Fzc0xnOVZHK3h0OEduYUJ4QWpUaWdTbE5IYUhOcUNwRHlGeU12?=
 =?utf-8?B?YWtaNWdMOGx0Z0VYTUhsbFZNUTB1MlN2dC9FaGEvVlNRT2oyTnNpQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5aa943-e0eb-49cb-c446-08da38077fdb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:16:48.8632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyGsG6Mr4/HSEq9cif/yw8T5elTEr1+GLLT5rLeeTVSL0LBUMdyxvnzWr/UhyqV3zR9W20Pl13tDoQF33qqMPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4953

On 07.05.2022 06:26, Demi Marie Obenour wrote:
> On Fri, May 06, 2022 at 12:59:05PM +0200, Jan Beulich wrote:
>> On 05.05.2022 07:38, Demi Marie Obenour wrote:
>>> @@ -1077,6 +1110,35 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
>>>          if ( EFI_ERROR(status) )
>>>              PrintErrMesg(L"Cannot obtain memory map", status);
>>>  
>>> +        for ( i = 0; i < efi_memmap_size; i += efi_mdesc_size )
>>> +        {
>>> +            if ( !is_esrt_valid(efi_memmap + i) )
>>> +                continue;
>>
>> Instead of repeating the size calculation below, could you make the
>> function (with an altered name) simply return the size (and zero if
>> not [valid] ESRT), simplifying things below?
> 
> Will fix in v5.
> 
>>> +            if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type !=
>>> +                 EfiRuntimeServicesData )
>>> +            {
>>> +                /* ESRT needs to be moved to memory of type EfiRuntimeServicesData
>>> +                 * so that the memory it is in will not be used for other purposes */
>>
>> Nit: Comment style.
> 
> Will fix in v5.
> 
>>> +                size_t esrt_size = offsetof(ESRT, Entries) +
>>> +                    ((ESRT *)esrt)->Count * sizeof(ESRT_ENTRY);
>>> +                void *new_esrt = NULL;
>>> +                status = efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_size, &new_esrt);
>>
>> Nit: Please have a blank line between declaration(s) and statement(s).
> 
> Will fix in v5.
> 
>>> +                if ( status != EFI_SUCCESS )
>>> +                {
>>> +                    PrintErrMesg(L"Cannot allocate memory for ESRT", status);
>>
>> Neither this nor ...
>>
>>> +                    break;
>>> +                }
>>> +                memcpy(new_esrt, (void *)esrt, esrt_size);
>>> +                status = efi_bs->InstallConfigurationTable(&esrt_guid, new_esrt);
>>> +                if ( status != EFI_SUCCESS )
>>> +                {
>>> +                    PrintErrMesg(L"Cannot install new ESRT", status);
>>> +                    efi_bs->FreePool(new_esrt);
>>
>> ... this ought to be fatal to the booting of Xen. Yet PrintErrMesg()
>> ends in blexit().
> 
> Whoops!  I did not realized PrintErrMsg() was fatal.
> 
>>> +                }
>>> +            }
>>> +            break;
>>> +        }
>>> +
>>>          efi_arch_process_memory_map(SystemTable, efi_memmap, efi_memmap_size,
>>>                                      efi_mdesc_size, mdesc_ver);
>>
>> The allocation may have altered the memory map and hence invalidated what
>> was retrieved just before. You'd need to "continue;" without setting
>> "retry" to true, but then the question is why you make this allocation
>> after retrieving the memory map in the first place. It's not entirely
>> clear to me if it can be done _much_ earlier (if it can, doing it earlier
>> would of course be better), but since you need to do it before
>> ExitBootServices() anyway, and since you will need to call GetMemoryMap()
>> afterwards again, you could as well do it before calling GetMemoryMap().
> 
> This would mean the allocation would need to be unconditional.  Right
> now, I avoid the allocation if it is not necessary.

Hmm, I guess I don't see (taking into account also my own reply to that
comment of mine) why it would need to become unconditional then.

Jan


