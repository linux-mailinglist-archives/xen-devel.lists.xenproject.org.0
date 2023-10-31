Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8107DCAE6
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 11:31:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625608.975062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxm1x-0000B6-UQ; Tue, 31 Oct 2023 10:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625608.975062; Tue, 31 Oct 2023 10:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxm1x-000080-RE; Tue, 31 Oct 2023 10:31:29 +0000
Received: by outflank-mailman (input) for mailman id 625608;
 Tue, 31 Oct 2023 10:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxm1w-00007u-V9
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 10:31:28 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe12::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a51613aa-77d8-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 11:31:26 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8777.eurprd04.prod.outlook.com (2603:10a6:20b:408::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.16; Tue, 31 Oct
 2023 10:31:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 10:31:24 +0000
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
X-Inumbo-ID: a51613aa-77d8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUPMtFkZRtr3VElYj0OV2MUCQHij77nau3xThWUxIWJd/kgliv5BpFIPcWzjEAil8XJZt/iBd5iEITSbpreRp7OB6AoHOzbr+KybP89wW44SJvj7TDUa0N1sXgPI3Sh1/FLUCVBXRJyV2ei//DVBiCTVSegsg+7qetA/PgGTa23ObtWJwanVUTiyoZ92lijT1xTuGbZjFdE4ZSmP9gpFKYCRyb/KTjUDkQpBiDLZpnqcjyYd/uO/KjOiXpwkvhqpUwqxmDoVfyZFSc6nujzmJJt8EcL9/esrO8q7vPd6/d79YxAlvztmK6hevozd/3AXDhrJ7MpUfemost7YrECIKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn5zbQ057cednY7dro7pNMDRXidD+HcvHCt1RMvGwXE=;
 b=Dw/Vblws6K4ARoNQlA+GZ6fJmeci59bYo/fiyX4wftO2UsLDQoGwZk2CibUarDVdAoMs8WItida07WVjFa5RhJfsgf2t5qqbHToWutYw722TDEZwacSsFPhgLGtqp4LnAA88VcAQXdEZkfgh4nuRmsDS03ClKUaup5w8aIk/bn5BIIbIQsVkoIiXLt/oVFL9p1RPIgAtL+JVMzgGe89PjNRii4DTJ5ec/gW6tnTpStBeQ5pT19BRCAlc3HRkrLFN+DOUURvSBgawdDYhfEZeTsEMOc9cVIx19k0dm3iWOJ9d7wnebuOGRr6uzPlZt1SKFJWLt/cb9Sl9vXD75duRsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn5zbQ057cednY7dro7pNMDRXidD+HcvHCt1RMvGwXE=;
 b=emwO97UFlhhDTlZ3L6hLQ28ifcJMPZ8G/ka8Eb4OgwzERKTYuTfwWHCJz0S7HxeC7HeCqdUSU09Q3Yey5I+gvYbMCtozdoJbg0g8aJG1/vJ2W6g4567zmffvX7oCpr4MaV6PrTcn1wUIGcwOS1uaOhULeeqD17EYMn9OGQ9P1phUY5TvNalOCFG8TtRZR9fuwJtqR00ExXqcT5UsiEt5T+9jyYk3kYI9JWr8O4he4iOqutyndATayOQpy4XJr4AcnX4C0svCxeY+TTu9vxhlHvMoX3EyihYgqNNaSYs75sNSzqR5cVl90SbGLfk7n5irODMOKQM3HbrEi00dtofFFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8aa755d3-7cba-9543-95fc-056f397c18ae@suse.com>
Date: Tue, 31 Oct 2023 11:31:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2] xen/domain_page: address violations of MISRA
 C:2012 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <d70e8e6b00f7b08ed4b360d38113e6a1460ed3ab.1698743361.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d70e8e6b00f7b08ed4b360d38113e6a1460ed3ab.1698743361.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8777:EE_
X-MS-Office365-Filtering-Correlation-Id: e2dfbd60-4511-4b3e-30aa-08dbd9fc8810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Q4aGcaCw5oIJIK/KjmGw97mmIULubbgy5cZ37QFT8tJzgCocByvSd6XZ6+HFw+GihbjfCxeV6hdJnTQYfy846Elkh13ex7diee4Q/+wFL02Qk9YnDlP+CyW+rV7OV7V4yzA3BJSBTZ+BxAIVo13xdeugl/PJSB/8Fs7MW6hGsZeSfgKd2A+qI40sLW7BFIJD5NsBrdOzbfyxdu+sMHPGF/3H/SHVkZWgkTzu6reZjYRa6QYdW76fAPjArM/KNElRp80MEMsXaB9xvSqii/dJJ5JMATJQrLWasxdlvA6ijAU+ZQGrjbSRv0IB8zHM7bTjN9gxYbuDhfwzQ2Oop9IDXWhyM371t8bgY8k9gpoVEfLXeRKkrO5bNH7M5NW4RTFvOzyBfy7Ec/rcWyKemN+Oilhx/RzHMc+DwozVK8cBRh/R47dIQnWXfre89sihDzvWhLG5Iwe9KYU5BWwCryX4gzfvvBcU844T891yEkpiNJGLfyfDgpn+qhAZJNvcq9ZajiKoGBTbg2rBpI2gkHw2gSeP7K/f6Xz06x6YMMlOFcf2x82wieJ4gYE2+vhI1MQNtAJ0E+aKhgMszzZCqCyWHuJ/wdJF99RC0w22IreeYgh0UVrblSuNNRy2nNtOx7iC6ePhPqfBxwoTdWw7ig051w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(376002)(136003)(366004)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38100700002)(2906002)(6666004)(66476007)(66556008)(54906003)(66946007)(316002)(53546011)(6512007)(6486002)(478600001)(6916009)(6506007)(26005)(2616005)(41300700001)(5660300002)(7416002)(4326008)(8936002)(8676002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDJSdTlqTVVrZERnMS9VVnptU1NuWHF3bWtXSDNwa2xwLzdDWUE4VTZneWdk?=
 =?utf-8?B?VVdaMUdPR1RkRnNtL1B2Vk1kVDI4bjNJaEc4RlBJZHFTVjdmcmlGeGhabjBk?=
 =?utf-8?B?b0F5N1VjYmRIWTRoTmxFcklYTGJaT0RsdzV4aURKcjZvNEkyQmxEcE5FZU1V?=
 =?utf-8?B?RUVFcGtlemZpN1ZRcHQyaDA4c2poT3cremdNMkhqd2Y3bXNmWGhuZDR2cE9E?=
 =?utf-8?B?N1ZvTjNzTVZuZEFyMnVhOHR4Wi91Z0ZtQlRZSTRiZzJZQ1ZhcUhiTVdqVjVk?=
 =?utf-8?B?QXZGaGJpblRrMXI5RERqWm13WXpSM0IwKyswWTJSaHViSHA3d29LVVlOaVU3?=
 =?utf-8?B?Sy84clJBK2ZXeTJNSmV0VWhod1FmRGRFOXo2djh5dC9rY0R5eC9tdnRoY0FZ?=
 =?utf-8?B?SjdjVmhZTktnWDRLNy9xZkxOMTE5SFArdlloQmRFZE1KK1pWWGpaUzhOKzhE?=
 =?utf-8?B?czQ4TmZHenoxd3NoeXV0UmM1ejdMVkxtQ2hKRFZkK0hIUGo1ckkxaE9ldFdy?=
 =?utf-8?B?bXVJTm8vV2JKRnpuR2huUEV3Zm9VSGdXYWxLdGFFNUhWN1Q3MFZFVGZLdVZP?=
 =?utf-8?B?aHVSWkxNaEFSVnc0dm5yQUJEWm1RSkc3cExHRnVaQkU1TFk3eUNJa2p1MnhD?=
 =?utf-8?B?MjRDdUJ5VE9XSDNjbUFpZHZTaGVtTUVXWVNTZHh5Znpjays5Y08rQW1QZ09P?=
 =?utf-8?B?ZDNkVjY1UGhaZWFFTnU1N2FMb2VZRDFxUXJ0bG5ybW53RXFhSld3Z2hhRVkz?=
 =?utf-8?B?SGoxb3ZFYW55UjdHRHpHdmNOZThVeFZyU2MydTRwMXIydnllYVlWM1c3RldE?=
 =?utf-8?B?UWxHVWw1d1oydGpqYjNKTDNwK1JqSkkyWlNQWm9VWncxeVVRditMc2FONXdx?=
 =?utf-8?B?T1BPUE5JUk1aM1FMaGZFRWtHWFQ4TFowZEtZNnl0VmlIcXNEZmNlMy9DYVYw?=
 =?utf-8?B?TVRQR2pSUW51MHNQVTNROTdYd0huR3FZRVFTeWloZGY1WEJkTms1VzJrd0E2?=
 =?utf-8?B?SVErakNXZ0hhdWVrRUk1NytPLzIrY2ZQNDVoaVJlM0hpUTF2Q0IySWE0M1Bx?=
 =?utf-8?B?VVIxRkJVbjl6cTVkZVlScDdzM0hnMVllNWV6RmpZYVdUc0pGT3ptVThsZnVv?=
 =?utf-8?B?c29FQVdBMHdVVTlCdEhMQlZJT0lHbGNENlMzaGNFa1RITEs0Q093ZE5VQ3lw?=
 =?utf-8?B?S1NBR0V1MFdGUVdYU0hkWDN1bytjaEIrUEJnblhYMUdUT3UwTXN6bWlrNm1T?=
 =?utf-8?B?TlRsK2NieHg3cFYvaXNyeUJuWDBvU3o4YnpUNGRqbzdUTUtZaFhOblpTVnpk?=
 =?utf-8?B?c0pSYVJrRC92bTQ3dUd0SVNva0d1bVg5MDU2bHJxWGIyb0Y2WFpQQ2NGVVRX?=
 =?utf-8?B?N2VocE5mcnVRNjhjUk9GUTlGVzRvQkhKVjkvU0QwKzFXVlFJcmF1NTNxd0pF?=
 =?utf-8?B?dkxsWmNDa1V4OVduSXY3SkE0ZWY1UEQ0NWlTOTNsWDMyZktqdlE5dUJNZXdk?=
 =?utf-8?B?VDBZQ3lHYXpZZjdqSk55bWZGQzlRQ2wraXliWElFVllDcGJnU1Uxa2owQ2xR?=
 =?utf-8?B?d0VKQjZSdzhYRU9TbmFHL3Vjbk1tbEpDakNXVFlHSUpjVFdZK0tRSlF1L29v?=
 =?utf-8?B?NGtNcXhWTXVqbTBuKzFGREZwbThxZWFPUDdsQlBvb0hTVzV2Q3Q5OXJaa2ZZ?=
 =?utf-8?B?bVR0U0s5bmZqcTB4bVR5Y054STN1aFBZYUVkVnROTjFtTlUrRitiQ0JrU3ZL?=
 =?utf-8?B?djYyRGY3Z0tSKzJBQUY4ZFE0NzlIT3RiSExXN1llV2xUamJuckxJdjBycFJp?=
 =?utf-8?B?QjkweER3S2VnOEtwQXpyYjZDKzRMTVJJaVJ1NEhQMGcrOUFPR0JvR0lMT1Jv?=
 =?utf-8?B?Tlh4eUlwb0VYVkl5cGZlTVM4cTRidWU0c2lEV1V0aUFucDVTY0tiTXIvbjQy?=
 =?utf-8?B?VHFEblltRGtCc2VnNmRjUHZiUGo3UExDMXQxL1ZWeEp6M3BxNDNKUFQ1eDlo?=
 =?utf-8?B?cjViMjlibEhKTDFUMWpHNFYwdmEzMWswKy9oZmtMcFh1MFkxNzc4RksrMzd2?=
 =?utf-8?B?a3htalJnTDRPYnNLcXdzTmlwb3o1YjlZYUFWQWRkKzFEOHZlOUZGekh2Nkg1?=
 =?utf-8?Q?yaQXCFVgxQvN1NrqUSQOdtlW2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2dfbd60-4511-4b3e-30aa-08dbd9fc8810
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 10:31:24.1883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsTCHrRfqB3VikmUsW3TI2T0VqaxHlZvn1pFzsNHIiNFDc16fEDQVgXvrpWwoJTM377aIJ25OPX3a7HaKJIdSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8777

On 31.10.2023 10:25, Federico Serafini wrote:
> Make function defintions and declarations consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

However, ...

> ---
> Changes in v2:
> - use 'ptr' do denote a const void * parameter.

... not even this (let alone the description) clarifies what the
inconsistency was. I had to go check to figure that x86 already uses
"ptr". Such things could do with spelling out.

> @@ -55,8 +55,8 @@ static inline void *__map_domain_page_global(const struct page_info *pg)
>  
>  #define map_domain_page(mfn)                __mfn_to_virt(mfn_x(mfn))
>  #define __map_domain_page(pg)               page_to_virt(pg)
> -#define unmap_domain_page(va)               ((void)(va))
> -#define domain_page_map_to_mfn(va)          _mfn(__virt_to_mfn((unsigned long)(va)))
> +#define unmap_domain_page(ptr)               ((void)(ptr))
> +#define domain_page_map_to_mfn(ptr)          _mfn(__virt_to_mfn((unsigned long)(ptr)))

Padding wants to not be screwed by the change (one of the blanks will
want dropping). I guess this can be taken care of while committing.

Jan

