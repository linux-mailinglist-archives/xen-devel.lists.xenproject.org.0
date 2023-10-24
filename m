Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986687D4726
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 07:58:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621675.968361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvAPn-0007HJ-9p; Tue, 24 Oct 2023 05:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621675.968361; Tue, 24 Oct 2023 05:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvAPn-0007Dw-5W; Tue, 24 Oct 2023 05:57:19 +0000
Received: by outflank-mailman (input) for mailman id 621675;
 Tue, 24 Oct 2023 05:57:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvAPl-0007Dq-KG
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 05:57:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2dc3eb61-7232-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 07:57:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9907.eurprd04.prod.outlook.com (2603:10a6:800:1d4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8; Tue, 24 Oct
 2023 05:57:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 05:57:10 +0000
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
X-Inumbo-ID: 2dc3eb61-7232-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4hdG1udFDN1S1wsJCuGg0ckoHWjLU4jSubwKFIDBkLNk9PUAV5chMUx4hwScyO0lwGf9bCBKaAFaG+fephZ66Ghzp11HjWk0qSw4rjKayy7DfckOBOVkjUtbsBYXvTYhMDhuuYx7cKU53HmKTX+W4rTdfGqJ5DT8/pU18UjtogmR/ro7G4BxqR+R3IGQHps+t4u7iy88Hou7QurJSAcZiCr/VeZNI/YVuC8QZeruASlrYi8o6Rvtqqt9oSwOKvDKJfDcgtwiXYUsdS19jwCghrjFudbBgxycw7o/Mm4mHc4MKZrjZG/cglwYLBDORU40Ax3pMgVrT6uMXHDQuXFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKJta4hhz0jZnJh/RLsH7N+nISzocWcSGuVbzGVMbxg=;
 b=i4FdiKrnw/uY1SSLgz7CQecnHjGRaSb8IGqN9fRFmi1WvU5rdlbsfW74ZQqJu7mCrukssH0DCDTWnEIJR/x/ctBb7rKw3JjX0Pi4LUeNWpLHajYQxLFNN4/K+hdrAvFPoyBNEdbvgvtyc/Rt19lC3faUncD3eFQCz8xIhpRCkHJToqkg4C/MAb2dXa95jk7TGTngtCLoaqfdo0OKQzp28uWfVTZKkVScyh5B1TrwAvNbGy1ppls82z6U9KS00lwZlcb78CpsE/tGVfriis9pYWZnZSV5v96vBdA6ppVQWMf+eDFVcn6e+Ajx5u+iZDUjmvHB8Cdt6m6ZX0K89qZ/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKJta4hhz0jZnJh/RLsH7N+nISzocWcSGuVbzGVMbxg=;
 b=L8WXnp+sho+zlgo0pv9Nxh5vTANiirXS07I0zxkes1to7IyUUMs3Q7D3obYrV6R8G5/cFdLw9nEYIMtO9HwLsyMdlY9LQj5fieQwaCLQFCHPLoK3l+5LQnwoplLnnZizTZ+B0O6AoHVtqCP0zxAk3BlrdCBGQ0A4FTySwGaYqwXnRGHIEpFOxNPrgFNsb8D/cmJ1jk3aX8/Z0L+jqtfwUrFfy6jnkgdquhLDNO9xJbmQ1g0XTXeHUVXX7elKW0Q6FZETCchVbfiHQlrMVwoP4ygAFf/azu9Jbypj5pRye641Ej0HWnqDbZAd0T9KFYbV8Dw/Rf8x1YHUwFWl412LhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c6cce29-7aa0-6d3e-e7bb-cb6955fcb50b@suse.com>
Date: Tue, 24 Oct 2023 07:57:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Refactor arm64/domctl.c 'subarch_do_domctl' to avoid unreachable
 break.
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <6c118d318d68ea3613d9a0a79d75c0c9@bugseng.com>
 <a63ded4f-09b0-41c8-a9c9-832a12fc9133@xen.org>
 <7e72632b-43dd-d2c5-f46a-d0c6de6bc81b@suse.com>
 <0f176fee-4ce9-4197-95d6-11eadb67df9d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0f176fee-4ce9-4197-95d6-11eadb67df9d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9907:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1338c3-b710-4dc3-0fda-08dbd4561004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9hnPL1NUdl4yOkBdyowYfuxCZZptS01IS+b2D6LbbZtf/XDsY5bHDdrg2JARWXsUlyyZakZurfxb5h9TXu4g7h2wnksF2KUUkG2b50Q//6kCNu3QN6Oo+jKZf7oTvSxCsI/su2MUXTfjBmmog0V0VunkioJ656ew+Z9k7guS7Xrlax8i3JiWCDg1AdGhfr2nsyCsLBv4/47+DCQBKVuNBQuhLHDeFwhwrWWc3qzaLpW/NxfOoTfGmlctCf7YHyTL9uBEHRgdXQH5VqLkq+6cl7pZ+LaDCHgI7SfAsdLxTh6h+gp/UJJ9KviiGCMBat7iwBsA28uHv6R/aq3y8gRX5TlSiMzS3+oDwIEMbGfZC4HWY69F7P5IG3KIEmnT+md7dNZsNuOZlqrVXb3CyrnbhqiFv+uIAyb0eZPo6tTbWrZf1xh6oZra8GiwKVngEPXeMa8s3GRko54oMF+ZxoQBXL/3pF5fjhaYXPMAcZBOG48PLNlX3vII4OqwN7f8TMH6GnojIH2CWQk8ZWZ3uN6Pz6FYIKpWoNQa9VzaxjmjChXsaH7CooRCBITI5f+2dlOD9nilSDTRP5L5ZnuosOik2BLXCifjklCe4dgbw48T8yNubZMhyrQA2CDJIgiEIIubF8BaOOouyp4/oyZxO64eVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(66556008)(38100700002)(83380400001)(53546011)(41300700001)(6486002)(5660300002)(66476007)(66946007)(6916009)(54906003)(31696002)(478600001)(86362001)(316002)(2906002)(2616005)(4326008)(8676002)(6512007)(6506007)(26005)(8936002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGMxUmc4Y25EVlJjWEtiL1BkUGZrU2pTQXZ4c2FXNVh5Q3E0WFhEUStuYWZS?=
 =?utf-8?B?THllSlJzMkJnZ1hnclBvdStKRkpDZG9lQ0EvVzVYV1ptNEdsMFdMNlp3Q3lU?=
 =?utf-8?B?MTF6cGZqWktQaEhqYk11TkhCWUtmTVlBOW9TNlB2dzRqaXdZV1o4MVlFWDVL?=
 =?utf-8?B?T2FTRW9QZXIvSTdEOU1pRm9OOEU3RUxvR0QzQTVwRVdsdlhuaDdDYzJOaWhq?=
 =?utf-8?B?MHRiQzdkejZHM3pML0RZK3BZY3RtUlFXSmZNVGxjbmZqZnRkT21kdnpCRzJZ?=
 =?utf-8?B?Z2htY2pOZW00TVBwWElTRjdYUVVYOXNaN0E3Nit2cTFkaVlMcGlUWml2dS9v?=
 =?utf-8?B?TlkyQXlFYWhxSnRsWjZ3VERGYktSSy9qTkhMYXFuaXhjSnFHRW4xNlhaK2M5?=
 =?utf-8?B?N2Nxb0xkU3pEVC9jM0txZWx3eFlqTkpRZGRqeksxZW0xdjN2Nm03YjdNNW5v?=
 =?utf-8?B?QU1yKzBzbTJ5eGlsNUdiMWlCc0lHQ0JBeDBZZG0vcDJDV2EvRUcyUVNjOXl4?=
 =?utf-8?B?cmZZUDgzK2J3dzRUYjlxaXYzb05SL2RaTG8yU1lDQVl2aUs3ZFNsbStOZjJP?=
 =?utf-8?B?Zm9ZQmlvQmJGa1ZsNS80WHVVbk1Gd3I1QW5yRjhiSHdwR29FZytpanczS2xK?=
 =?utf-8?B?Y2FPbXF6SnVvZkh6b0NlaHdrcmVzMmJwMTk3VTN6bnFXL0JGcGx0WVMyY2Vk?=
 =?utf-8?B?TWlVemVGVE9uRVpjNXYvbU9reTJka2ZXQjcxSy9xRkdwV04wTlZacFVtWkJq?=
 =?utf-8?B?MzMvMTBqV1FWbFhheDNBNmNVN09UOU85bFYwVVNSVXdiQ1NPdlR4WTFmd2Nj?=
 =?utf-8?B?S0E2cnk5Q3dma2ZiNWRzaTJSbkcwSGhPajJnQmYzMElFb0I1UEo5NCs2a0pt?=
 =?utf-8?B?THRLaDQwZ3MvVE83M0MwTkc4cGtsbVZYdkUrQzlHTkVMVmg5b1c1eW9sVTl1?=
 =?utf-8?B?dUtSZGVwQjdHbUZWK2RZWCtJUjVKclJHL1p6Ni9ZRTdRV2hoaWMvVmthNy91?=
 =?utf-8?B?OWk3OHA0NEh3RUJpbmpmV1Q2ZWVXc282aDNkUGpxOVRuZzZmOG9GSkpLWXU2?=
 =?utf-8?B?ZGFTeGNjYkhBNjFTcnNZU2FLanJsQ2dZc0t3TkR6Tm5QNHptdjRiMnRpc2Za?=
 =?utf-8?B?U2szMEw0dUh3N2tCbW5uZjdMY1dRbi90a2Rsd1docFQwTVNWdVAwVHlEVHRs?=
 =?utf-8?B?bjk2OVpoWXM5emNyV3JDNHIyUCtYcms1Wmh3SlowZWFwZU91SEFvWk1hN25B?=
 =?utf-8?B?Ny9HS3h0Q05FaXorSjJvTGhJdDNHOWFVRnJCZGNvN1JMdnpxVGFMNHNJTmNq?=
 =?utf-8?B?L0R2UGpBbldKV3BMTjBSM0JFbnVNM01SOTNwUnhqTGpKSlFNSXEvckZ3bTli?=
 =?utf-8?B?RlQrZWNBWFdOejlHclVVbjUvQXdjeWhXNE9MbDlpQlNFWDUwWTQ2QjJSaHlv?=
 =?utf-8?B?aHhHYXhUTTNVb3lHdEw1YzVMSWNKOXVOSHF1eExaTzQwcXRyZStjMTU0UmVz?=
 =?utf-8?B?c2VJYmYwYjJOdmdkaVk1MkwzUHFKcHlvd3h6L0xqU0txYXJDaXNCM2ZBNDAv?=
 =?utf-8?B?Z0lldVQ4TjNTRGQxMlBtOWtPbXczMnVsTzkzUFh1MGxrNmx6UStrQXBDN1Rn?=
 =?utf-8?B?Z2k2VUxrR1JRWjhDdmIyZEkzU1pZNThPcmR4RDlIOXBmNS9uQ1pxaFJvUnI2?=
 =?utf-8?B?Yy9XNXdydXQxSXdzTllvcnFGY1pTZ0hnZ1ZRTUhWSHBOUUNnbHpQeG5qMkZB?=
 =?utf-8?B?M0NmZlVma0g1cjYvcFdvM2wrZDdlMVhaZ0h3YTJIUmZlNlJiYmdxdjV3MlZj?=
 =?utf-8?B?ZW40eW9IUWdRdTkrVUFyS3dDYlBEOVlVWjMvSmFGMlFvUzJzd01WSk0vSTdQ?=
 =?utf-8?B?U0tFcDR6MDdLa0RnK1MxYVhSeklvek5tSk9uVmRudnU3aDZNcVhLRTRIdTBX?=
 =?utf-8?B?NzlkaWxTb1EzMVpycFNNQXdnNnkzdTFaOG56VzBhM29JY0ZLako1NmJJNkxQ?=
 =?utf-8?B?YTlxUFBSSXlrdkJEMjQ0TDlyV2pPUlRDdXNDMlJBQ0gxak11RGtzU29kKzE4?=
 =?utf-8?B?RzJKMkpMSFNjenpLY1J1SEtZYytNNGJrdkMrVDFRdlhObDhUbS9rcXIxQnc4?=
 =?utf-8?Q?jxwReqz7SdVax7HkhfWl2XPtQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1338c3-b710-4dc3-0fda-08dbd4561004
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 05:57:10.6778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAx6krFgMhHE5vY8Lb6fC/Q99eWWnCsY4qz0ZZu0bjnGU4IdLG6t1J6IUAdeXBlTVrYt3WhOv2zRwmQRjAuINg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9907

On 23.10.2023 18:07, Julien Grall wrote:
> Hi Jan,
> 
> On 23/10/2023 16:15, Jan Beulich wrote:
>> On 23.10.2023 17:00, Julien Grall wrote:
>>>
>>>
>>> On 23/10/2023 15:51, Nicola Vetrini wrote:
>>>> Hi,
>>>
>>> Hi Nicola,
>>>
>>>> while taking care of some patches regarding MISRA C Rule 2.1 (code
>>>> shouldn't be unreachable), I
>>>> came across this function:
>>>>
>>>> long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>>>> {
>>>>       switch ( domctl->cmd )
>>>>       {
>>>>       case XEN_DOMCTL_set_address_size:
>>>>           switch ( domctl->u.address_size.size )
>>>>           {
>>>>           case 32:
>>>>               if ( !cpu_has_el1_32 )
>>>>                   return -EINVAL;
>>>>               /* SVE is not supported for 32 bit domain */
>>>>               if ( is_sve_domain(d) )
>>>>                   return -EINVAL;
>>>>               return switch_mode(d, DOMAIN_32BIT);
>>>>           case 64:
>>>>               return switch_mode(d, DOMAIN_64BIT);
>>>>           default:
>>>>               return -EINVAL;
>>>>           }
>>>>           break;
>>>>
>>>>       default:
>>>>           return -ENOSYS;
>>>>       }
>>>> }
>>>>
>>>> here the break after the innermost switch is clearly unreachable, but
>>>> it's also guarding a possible fallthrough.
>>>> I can see a couple of solutions to this:
>>>>
>>>> - mark the part after the switch unreachable;
>>>> - introduce a variable 'long rc' to store the return value, and
>>>> consequently rework the control flow of all the switches
>>>>     (e.g. rc = -EINVAL and similar);
>>>> - remove the break, but I consider this a risky move, unless -ENOSYS
>>>> would be an ok value to be returned if some case
>>>>     from the switch above does not have a return statement.
>>>
>>> - move the nested switch in a separate function, so the code in
>>> subarch_do_domctl() can be replaced with:
>>>
>>> return set_address_size(...);
>>
>> But that would help only if inside the new function you still re-
>> layout the switch() (or replace it by, say, if/else-if/else),
>> wouldn't it?
> 
> I am not sure why I would need to re-layout the switch. This should work 
> (untested):
> 
> diff --git a/xen/arch/arm/arm64/domctl.c b/xen/arch/arm/arm64/domctl.c
> index 14fc622e9956..8720d126c97d 100644
> --- a/xen/arch/arm/arm64/domctl.c
> +++ b/xen/arch/arm/arm64/domctl.c
> @@ -33,27 +33,31 @@ static long switch_mode(struct domain *d, enum 
> domain_type type)
>       return 0;
>   }
> 
> +static long set_address_size(struct domain *d, uint32_t address_size)
> +{
> +    switch ( address_size )
> +    {
> +    case 32:
> +        if ( !cpu_has_el1_32 )
> +            return -EINVAL;
> +        /* SVE is not supported for 32 bit domain */
> +        if ( is_sve_domain(d) )
> +            return -EINVAL;
> +        return switch_mode(d, DOMAIN_32BIT);
> +    case 64:
> +        return switch_mode(d, DOMAIN_64BIT);
> +    default:
> +        return -EINVAL;
> +    }
> +}

Well, yes, if you're happy to have a function returning a value without
a return statement at its end.

Jan

