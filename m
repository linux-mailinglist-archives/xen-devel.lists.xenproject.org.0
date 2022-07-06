Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58056863E
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 12:56:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362113.592015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92hJ-0001H7-L4; Wed, 06 Jul 2022 10:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362113.592015; Wed, 06 Jul 2022 10:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92hJ-0001Ee-HK; Wed, 06 Jul 2022 10:55:57 +0000
Received: by outflank-mailman (input) for mailman id 362113;
 Wed, 06 Jul 2022 10:55:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o92hH-0001EX-PT
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 10:55:55 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 351372e0-fd1a-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 12:55:54 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7139.eurprd04.prod.outlook.com (2603:10a6:208:19d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 10:55:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 10:55:52 +0000
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
X-Inumbo-ID: 351372e0-fd1a-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TajT2OS3ALG4V44oFEBoUGwNQ4uqbGPp/WVsI9sgX0BBTHvfBjtsvtOkZDbBHGNjjHmRH4LMlfmwg6oLr+dY3tvH1NHswabRDz5J45XlN6xgPBcCI2ZquErtKrxOFgVnF0sefoCvCjEH+Mm1240ZNa6Wf0zyUIn/7JA+7bKboiX6xkDOvQ4auvNbt5sdfBSouZH8MRH4DjhTDgzB2rPID0j0cNP5GqwmxR8H49O7kBtcAPt9OnXexCGgOZbROZcTPpvm1MJeEbDiFYcmKiIVjCoe441FreNadgqHaZvt7yz9b0qyw/pWaWzbYtPuMMEwCSsecU5NAa5O7iVVPC3V/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dy74e9UxsClQ34n9reJ3A7fRNsPSLVhBat+prWBIMnk=;
 b=erFt95chKKnFLLc4DsgC5dHFPTStOyIeggvnJMLsLLfJxmARnH0L7u+PBAfTG55x9+eCf3As31bGrRrLBBhsUPKgQ7Ke6WzyOu01rjHROzAPEzz14z/CiW7VzCThEEzMzJiQ5vzt4fMWDabQSzgX0OGC5Y6Aw6wNHlwaoXXS6N4C7yffIXssVvidC4YdvA1L/CFlD3Np2H+BcryY1D1rM4GcspNiOPnFvsvLN/2etjnfpYIr/qn3MP1B1MT72/zGCW9e7EiEwSmO1/xPP4TMIfCm1K/rXriaN6MoA6rTrWvJTw7Pumq1bESfWp2Q2vtY4d53YhtKEMdtGQmcNn1lgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dy74e9UxsClQ34n9reJ3A7fRNsPSLVhBat+prWBIMnk=;
 b=pIX7jnEcUQ2xXOuFiVkLI7hYqabQERR3S0GD1Aclr9/dD/L5A/pkBge/1Ac0AwHMIyZ4Qv0luPogLXyUAvti7aINR7TuXo5qBXBiepCVHTaCVi/C1wXRRHeUiYAx1sK+LfcUaPEjC8IGhJX+XIbRPFwP68c3nOIX7tde+HAYTMfhxH19QFqRq+oCjitth40TDplEd5tutwtMp7eonCOviTlKNZ/xyasMWAYGlRH5MFK6kkEYvPAAZe6O0yzj0pGq8qNY1F+T+Tnkw/ad7uPN+OF3xxAjgfG8dFfNm4ZM624S1NImzvreQ+BJgJuzTkTd4pyYn7UVochQYTiLAEu4RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ef9cde4f-be13-134b-3c26-194484d165de@suse.com>
Date: Wed, 6 Jul 2022 12:55:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
 <julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>
References: <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
 <863733AF-212D-4059-B780-3DDC0AC58FD7@arm.com>
 <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P194CA0017.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abfa91c2-c57d-49ec-ad3b-08da5f3e17ef
X-MS-TrafficTypeDiagnostic: AM0PR04MB7139:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cxqRbac7TiYgCrpQfaqCiupCVfl6VQBVgAxyVPB9HDisrdFZc8IuablWOaph1qpaSNwSfsScUM/vIdbKBdnDZ18U+Oho1MYu0xiJYKUuDOXKDRiMiYXGy41HyiL6yKy+BR7BleCcJHAgUpb+vvQNhaR9j3r44JHrBiVel96cYCVNts/rLWD/V/H6ku/o8phOUGXdTPhRbxmGHwkS/zSuJ1Sz9uaa69p7q7tUEGuKMt6f0tgUm1UE01Iv1GaR9tJpE+mNIusgdCtcJbN+yjhPLFwQVzlMXvam3IdunLmyeK69BxeoV0zw9M2CcdnLDnVYr8awZ9Pz1F4/V5C4vUx4LlJW6RbgztQUjOgP/fR+VCfHOh853tAA6xvZs+6F4IqSSGeqdUp8/u3gTx8mN5K210o/dtOMqpx2UKv6BrLMVrMbJn1wDCWFz6SDSDTtY8ku3yF3D9+8ZS/e+5fFFDqeGOhLabQHmhx4HGll4njycnUr8WXKfNFNkjlDKAT3cHLLrlQsDxCNdbYqqugfIhQXixuo3jnLjOnBBG8vU5ifOTRa5quxg6NcMCA6iBXZLGqvhS38HHZLzSEBE9Cpvym+A6yNk74WfGw/0fQH7vrjA1bFtYEhTjUlJCZAY5SWlKWj4pApCNCYsl3KyonmlzxgyW+qKY+ZxxMo5z/c0622GZQ/XxgiaeE/EM6F5WCZmCEQ/sUpPZZAO/77bx2MnBXO6ND7ErxKJvPhYL9OonDXRYjL/cHzfEjSWr8RmmPw9lDIbiFVTiOKh/8e/l45XjhgdsumDrk3yt+e1YILZIToVTyMkP+QHfT5rzCnTxrOzG4ZPrf+XKm3gNv45L3Nxl/3svAN79AxSRKBl6NrGCdLpHs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(346002)(366004)(396003)(136003)(2906002)(41300700001)(2616005)(38100700002)(316002)(31686004)(36756003)(53546011)(110136005)(54906003)(6506007)(6512007)(66946007)(66556008)(66476007)(8676002)(4326008)(86362001)(31696002)(478600001)(186003)(26005)(6486002)(8936002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1NZOUFhbG9lR016bjNGZUl1RDd2QzFiam9lL1R6Zm91VXVseGNnNVh5bkRM?=
 =?utf-8?B?QnFhR014RUpUMzA0MzRHelh6NjlhWkN3eFNTNExpQ3JCWi9pOURRVVBQbGE1?=
 =?utf-8?B?UDdQOTB2bmJGN3ZlRHRTQW85RVo2OHJjN3lybXNyZFgxMC8wdTJsUWh1VndQ?=
 =?utf-8?B?YjNWVUk3S0RZTTdlNE1GVkJSbGhjdjBYN245SklWYjZmQXdJU3RiLzRlcmNq?=
 =?utf-8?B?TnVMNjU4OW1Xbm52Qzg4bU10L2IyWEJ3Uk52UXFRSlBQQWhzS1VXMGR6Y2N0?=
 =?utf-8?B?Z2JoMEFheWx5V3Q0Q1M3YS9KRXBYNzY5Mmx1dTZUNkVGMXF2ODRCbHNOWG5k?=
 =?utf-8?B?enFOQlZlcy85YnVTSk5pMXJqZGZoNzU0OC9oTnkyV3JaN3FDOHVrNTdlZ1FD?=
 =?utf-8?B?dXpveG9wWWl1dk5ucGN4QTBpN0hGT09WMmQydlc3cUg3MHBUMXBkVjVPM0hH?=
 =?utf-8?B?QmQ5MXdKZVBPTXpnRHI3ZEQvYnlzU0ttTWFvYTJrUm1jQXpxWkZaa1hGb2oy?=
 =?utf-8?B?emJPYjMwYjBNcHJzNjlObjNPUmlmTXhMS0NCZjdJVmJWUDhkazRTVGYycHlH?=
 =?utf-8?B?TnVuUG95VTFLRmZpeW94dG40OTFrS1VxM2JnU0pvejkyVW42N3BPRnhMNmU3?=
 =?utf-8?B?NUc2dmlaVWZYNXB2R2VlTjkyYTRNbUVDbDBzS1YyT0NJbmR1SlhRWGg2NHI5?=
 =?utf-8?B?c1hleUhrd0pKbWhyb2RmQm13U1FaRk5HMVJTRGUvZm5LSUx2TnV6dEllZUZQ?=
 =?utf-8?B?RjZaWXZBZ0xiYTdUYUU3ZTVtanBsZytFbEFPRldZd2o4T0NsTHdDZFVwbjVI?=
 =?utf-8?B?ZkE2ZlU4akRKanQ2Z3ZCclMzMFA3SU9FWkRITlcwT2h4Qml5Y2NkTUVQbEZu?=
 =?utf-8?B?OGEyZWtJZEhoM3hWRUs3aVB0SVBSY0N3WFgyL25NdVhMSlRjZWtRNllCVDYw?=
 =?utf-8?B?MmV1WE5UUUdmODMwU1hUOCsrdFdZK3Q2TklLMkp2a1hsS0d0UTFTL055dEF5?=
 =?utf-8?B?R24zSG14dXVsczJQL3NoTHg4SDZFbHdIc0IrR3NZTFozMzdXaEpuemhrL01a?=
 =?utf-8?B?NEpOTTI1Nm1MNVlYZmh2S3d5cGVQbDNHUEkyVmJNMFN6SWw3cnd0aTFWbUVY?=
 =?utf-8?B?T3ZoWVdxWVF4bFpmellxZmdJZVV6Y2t0OXkyRVVEUG1iVjBYMGtlcWFWd0pK?=
 =?utf-8?B?cDFRdzM5MWRDTFZIM2xXRTN2S2Qwa2RlaGNzVXdxVW9vS3RuMzNMRGZtejBN?=
 =?utf-8?B?K0k4S3ZncGFxTUxSOHZjWHRjM212ZGQyY2doMk5zTXhmaks1a2JlaVU3MjJ5?=
 =?utf-8?B?T2RPa3RsL3AvL2cwSDBWWG1SNXdJT1JCcmx5WDVVemppQVdUWElZbTVIbERa?=
 =?utf-8?B?dFhFekNlSDQxdUFXY29uYldLZ3ZlUHhLYkU2SXVHU0Y0MXVnSkdOS1lvcVpo?=
 =?utf-8?B?c0pGa2d0TmcrdzB4ZTQyenhWWHVnbjVDeFhsSDdLcjZwS21wSS81T0RvNGF5?=
 =?utf-8?B?MVZsbWgvZGdhbXlLL3A2aDBDMGdleXZkdEc0eUZnSDJTR2Q3dWozck1lbUpN?=
 =?utf-8?B?R1RVQUVuRzNxdGFYaDVGaUNYSldrRUNCc3N6K1U0Y3owajlnN3NCbU45Vi9q?=
 =?utf-8?B?UlZtR0F2eFNXWlgrYXRQMVY4R25haUE5TzBCcHBqNU5WSitnRlBjSVora3ha?=
 =?utf-8?B?NTZyT3plTmVEZjVlU25BcE9rNHNMY082dHBIaVJWSUVmM0QyekhmWnFGRVBU?=
 =?utf-8?B?c2hoT3lDWHJSTkFqeXkxZktIYzdmSFN3Qkc1bi9WU3VReEVpODN0SjRvaWhu?=
 =?utf-8?B?dFpZRXQxYmo4N0Foa2cyNjdkVUhRRUJrODFPNmxOMHRObkpCWk5oK2ZuVHlR?=
 =?utf-8?B?bWZoZ0d0MndadnMyN3FYNVRROEJSeldUQzVlYkZveGxuRzJoWSsrZFo3RFhn?=
 =?utf-8?B?T3YyRDM4ZGowSXMxTzZqTTNCM1V3TTZ3azZVZUFoSGZXMldKZXJWYmdlM3pa?=
 =?utf-8?B?OHJMUjF2M3JyczR2L1hsQ0JoNGIxYzc1TG9mbU9TeTFkMDZqVlpwWjlWNEo5?=
 =?utf-8?B?ZlowSVYzK0Z5dHluenNDNWdSR3Bad2huYTc1Tm9FVUhDRlR0OG1zbDFkNkov?=
 =?utf-8?Q?C0GMTwRZUUtWTMkFfSJKadvE/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abfa91c2-c57d-49ec-ad3b-08da5f3e17ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:55:52.1790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ft3Wh1tguH48DGGZwnNih6T8G5j6eLcKE3rYyhWsi0ysNB1eGmcpC3pfcBzu7YL6AjM+Lj4jn7t6TU1cXPr1cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7139

On 06.07.2022 12:44, Andrew Cooper wrote:
> On 06/07/2022 11:32, Luca Fancellu wrote:
>>> On 24 Jun 2022, at 19:17, Demi Marie Obenour <demi@invisiblethingslab.com> wrote:
>>>
>>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>>> index a25e1d29f1..f6f34aa816 100644
>>> --- a/xen/common/efi/boot.c
>>> +++ b/xen/common/efi/boot.c
>>> @@ -567,6 +587,41 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
>>> }
>>> #endif
>>>
>>> +static UINTN __initdata esrt = EFI_INVALID_TABLE_ADDR;
>>> +
>>> +static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
>>> +{
>>> +    size_t available_len, len;
>>> +    const UINTN physical_start = desc->PhysicalStart;
>> Hi,
>>
>> From my tests on an arm64 machine so far I can tell that desc is NULL here,
>> for this reason we have the problem.
>>
>> I’ll have a further look on the cause of this, but if you are faster than me you are
>> welcome to give your opinion on that.
> 
> Given this observation, there's clearly ...
> 
>> @@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop, UINTN gop
>> #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
>>                                  (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
>>
>> +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>> +{
>> +    EFI_STATUS status;
>> +    UINTN info_size = 0, map_key, mdesc_size;
>> +    void *memory_map = NULL;
>> +    UINT32 ver;
>> +    unsigned int i;
>> +
>> +    for ( ; ; ) {
>> +        status = efi_bs->GetMemoryMap(&info_size, memory_map, &map_key,
>> +                                      &mdesc_size, &ver);
>> +        if ( status == EFI_SUCCESS && memory_map != NULL )
>> +            break;
>> +        if ( status == EFI_BUFFER_TOO_SMALL || memory_map == NULL )
>> +        {
>> +            info_size += 8 * efi_mdesc_size;
>> +            if ( memory_map != NULL )
>> +                efi_bs->FreePool(memory_map);
>> +            memory_map = NULL;
>> +            status = efi_bs->AllocatePool(EfiLoaderData, info_size, &memory_map);
>> +            if ( status == EFI_SUCCESS )
>> +                continue;
>> +            PrintErr(L"Cannot allocate memory to relocate ESRT\r\n");
>> +        }
>> +        else
>> +            PrintErr(L"Cannot obtain memory map to relocate ESRT\r\n");
>> +        return;
>> +    }
>> +
>> +    /* Try to obtain the ESRT.  Errors are not fatal. */
>> +    for ( i = 0; i < info_size; i += efi_mdesc_size )
>> +    {
>> +        /*
>> +         * ESRT needs to be moved to memory of type EfiRuntimeServicesData
>> +         * so that the memory it is in will not be used for other purposes.
>> +         */
>> +        void *new_esrt = NULL;
>> +        size_t esrt_size = get_esrt_size(efi_memmap + i);
> 
> ... a NULL pointer here.  And the only way that could happen is if
> efi_memmap is NULL.

Incomplete refactoring - this needs to be memory_map, not efi_memmap.
Of course efi_mdesc_size also needs to be mdesc_size. Didn't check
for further leftover from the earlier patch version. I'm going to
revert the commit.

Jan

