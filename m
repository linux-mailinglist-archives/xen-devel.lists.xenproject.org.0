Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C4E49E562
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 16:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261539.452953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6Jp-0002H4-0T; Thu, 27 Jan 2022 15:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261539.452953; Thu, 27 Jan 2022 15:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD6Jo-0002FD-TW; Thu, 27 Jan 2022 15:04:12 +0000
Received: by outflank-mailman (input) for mailman id 261539;
 Thu, 27 Jan 2022 15:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nD6Jm-000262-CO
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 15:04:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 611e96a5-7f82-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 16:04:09 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-ITSv14fwOvCZ_IueZgcWUA-1; Thu, 27 Jan 2022 16:04:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB6759.eurprd04.prod.outlook.com (2603:10a6:20b:d8::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 15:04:05 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::a1a4:21a6:8390:b5d5%5]) with mapi id 15.20.4930.017; Thu, 27 Jan 2022
 15:04:05 +0000
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
X-Inumbo-ID: 611e96a5-7f82-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643295849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/eJQ7ucRYOgu4tEr/tg4FmbXpCLdpuA78wG+MCPCTI=;
	b=A2ZfYie6TGYwEE0yZ4n0I8QSTWk2gcFvPpmQQ+FBTwk5yLXcvcuw6+PDjTz+MzkAoqrKXA
	ul92MOV3oU1SYOTO54fdgjM93nzz9Wu4EIZ31eWmFb9OrsJiu9dd2k/oRNGq0lNTmlUw3X
	ADxWSdZUFSB5F8LUR6PECtldCGyqwZg=
X-MC-Unique: ITSv14fwOvCZ_IueZgcWUA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eveOxcK4q2qzBsxmfbPv33ucXLQPFOZuwTOpWNLFrlYilyumi0Gryd9sjicfAFfSNhV7yFJ0gElLzyhGhv+sED1JlyoHghzRc6v/vIUDxdVxKq/AJxfTr3AzqoHCVo/KhK4hxCcrUq08jnhdYqpfFI04LLBm+jNBXa8crDDU/D7wjiTCrEhPjL0p7kXjN26vjKh3gVeoW3mn/d7zMAOXhRVuEXQrR/LzCjE3GZwWH6tg0smgMgcKF+9XE9R5TcsID8fHNf5OBa5mo1IJmwas1IbQ1sTFgS7JEK7sp7ELaSaPuiAb9bRQjMVEsjWFe1ORE0sB5T/ESe/IGQHVEFtKFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/eJQ7ucRYOgu4tEr/tg4FmbXpCLdpuA78wG+MCPCTI=;
 b=iiIGRHzSmNccKiecPoE22Vy/wCKySgmTR3ZAenBn61dzGTkSWRdfVdftMbTyl/PXMVKLfYOJPKEpNIbW/K4+B0cuDe/ODMMX9JetYB4070SinO4h5r/73Mqw2Oxho1RNEJsQcRPV97Ni1DH0OlCwBf+wwWlr/+F1UPMghHFf9bv7PLv8mCBKwxWFZpM8bnjwXKKuq32ld89TEt+RNAK77awgHOpOWVLGvUxUhidmLtW8fIwUMi1h7/66F2cVRVqhSBbsg89m8WQ9BaZdGK6gJEkMBYSyU9ZTI5jCZ3b8bN3P1DhQPHOJL/urEYalTI7X7IsJU3bfHgC0gNlnfCRnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d60d879b-faa8-415e-cffa-c7e05da2814a@suse.com>
Date: Thu, 27 Jan 2022 16:04:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Ping: [PATCH v2 1/3] x86/PoD: simplify / improve p2m_pod_cache_add()
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e9257e96-ede9-2809-9a77-fd4dc206badc@suse.com>
 <0c61e460-122c-6486-00b7-22a9a24ee1fc@suse.com>
In-Reply-To: <0c61e460-122c-6486-00b7-22a9a24ee1fc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0d03e8e-b91d-4cca-c313-08d9e1a642e7
X-MS-TrafficTypeDiagnostic: AM6PR04MB6759:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB6759D6A9A4F46A0BDB1D189CB3219@AM6PR04MB6759.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:619;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NlTZacNzYPQcJf9qgNMWw+9Rd+2joRq1iif4h3A9Dug9eH+84e1QniO7B6B8eydnRLXH7/PAP5b0WGuMLywoZIWtsQp9bgiYBUdnPj5sgBjcKsXmhTapAovzydHbJ/Hx8jXvas78BYY1DOK+qBKaBTvxlsWCtBnUEL4jIqjxpuGA1Vxbkq5WWnjPNzWWUP4hItVsPB50TsvO8mu/LmERyIEubDtFP+H8oEtrGjNuVpISQNG+0NfVNbOo3Wwda/86YpLJb17jm6tYuFFbqnWSsbdAJjb4cHL9OzDq0LcKCJhgf9qOmputn06hHVLOZNJ2e9yKb/pMblxws6KXc2YjAMmayLbeaCQEJpZ0yOsHvioQCl4aR1ZJqVBZ1NItOX2QdoCgxx7B7+hUjHm9PeMSyvlH6FxFAeAW33mQNzkDrASm28AWd3rCAsxFjse9LlXgYbvjCDdiFAm9d3kGVjN+LCQ3MjUBB3/sd/GGvs2bHaWTV7TttWbcnczDHnbrI2cZRJmM8D0qcFFu4in/48+AvJJjxtG314MYtMy/cSqUl+VXLUGqCi5eVWchIcrgJB+lk3S0pgveNLwiBVoFjQGXQPsVez85do4O4OUeFpTGHRGzaKNWYRLpWOOYIjWudJg525wVGO70fGVaPkhWb624rIpiCqxBpqrQfXuOPzFz9JoAIOvd5vcy2jBO4g66OydC14NDwgO0JkhbdANPiHNWL71ltVc07iFFcvRVFMLwITgdA6Nu86GRKlLaTuM+340z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(6486002)(86362001)(6916009)(31686004)(2616005)(36756003)(38100700002)(186003)(26005)(6512007)(31696002)(498600001)(4326008)(8676002)(5660300002)(66476007)(66556008)(66946007)(8936002)(2906002)(6506007)(83380400001)(53546011)(43740500002)(45980500001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnVlSW0rd1VRaDJwQmo0TU1McUZkVnBVNlZ6T0tnbFd6VGhkc3dPajZVcFk4?=
 =?utf-8?B?UWlpU0o4VVFSd0tZVGh2LzIzMFl3ckREWFV0NGdBazFMVlE3VjFOWklLSHc3?=
 =?utf-8?B?YTM3d3g1V0pRWW5tUjBZZkEvS1R6a2VWeDdLMTRzSGJ4MFFpcFJ1ZTg3bzNG?=
 =?utf-8?B?Q1oxNmRzOTN6Vkc0b2hsTzRQaE8wdURpWU5lUWpQYjV2M0JvR1l4TFJ6K1dV?=
 =?utf-8?B?QllyeEhKWWJwZS9lRjJLQVpoZzZWaTllVHAzNS9wdU54eko5a2ZiamtFKzM2?=
 =?utf-8?B?akFGOWtsclUzU0VkUFpYRndZQnNCOTZyTGZyc2pmYThZbXlxdTJRNmxxT0xh?=
 =?utf-8?B?WFNNa1FMRmxQajlBSDdKaGgweTZ2bC8zVFZMS3ZJRlMvM2hTL0Y0aFBLVTYy?=
 =?utf-8?B?Z084ekxSbFVaSnloV3BFZW5KQWlXcUp0eWJidXo0V012ZElYWGg4cXVVTnNQ?=
 =?utf-8?B?aVkyT2RvZzRPWmFVMzNCK2JvekpNQ3Z4S2lDakFiU21LUkluQlRYbnlUTTRY?=
 =?utf-8?B?NXlrUFYrZHdVUUhpSlBDYjdTL05rT0dLbGdBZjY5WXVCdi9aK0lxYmtJZDFi?=
 =?utf-8?B?VnBhamdwNzdmdms1d2NKMld2Q2xCcTRqbkNWQkV4OWdzNVJpcUhVR0MwMU5O?=
 =?utf-8?B?VVEva2o0S2ZvU2M3Mm0wSm5LTHErQlYzQW1LeHZwT0ZqaTRrTzkyUDUzbXpi?=
 =?utf-8?B?ck5MeGFKQ1ErZGJNTERsQzg2NFBQcGhOTzBkcmh0b29pZWQrVGVGNHYrQVZs?=
 =?utf-8?B?UUpSbXVFVFlLYzlYeHQ0LytsMWJLakkvL0xNTERSV2NHdVpFeGpvN0tjbFNY?=
 =?utf-8?B?RFFVTEsrTUlHdnpiWEJSMGxDME9jNW9wUW9SaHpMVndMTUZSM2RlRlVIT3pw?=
 =?utf-8?B?a0ljTzhBWnZLeStoSVlGN1Nad0VUSThGTWttSDZoQkptZGlycDRnaVF0blU4?=
 =?utf-8?B?Wm80S1pvYVBRVnlLbDFvdnEwcDBCT0dyeG1mdWFQZ2FkTk5zVDZVOHhrS0c0?=
 =?utf-8?B?L2tzU1FqcnFCR0Y5eFhwWVA0QjgwM29rVitEY012NmVRN1drNGcxd3hUZGU4?=
 =?utf-8?B?UjZ6dXFGcGw2eDB2YzMvUkF6d0h3OVVlYlJuQS8rUnFLNnNPWjRaYjZ5ejhu?=
 =?utf-8?B?VHNSZmVISldYbUQ1MVRnb2Q2WkxXaklxQlN6a3FiZEorak80SXl6ZTRRN3ls?=
 =?utf-8?B?RlNMR01yRmJMTVZSckNtQmVjdk5CeURmSkVna1FRVEhoOHNnZ2tZM3BObXRM?=
 =?utf-8?B?bW1BZi8zZjNxeXZ5RDFTcy9ZQ3g4cmNvQkJhVGM0cE51QzRESnRzVkc3dEpS?=
 =?utf-8?B?K0JjdklvaWFqZUliOFgzQjVzN0t5ZU1HTjBnNGh0Rkx2ZWN6Z3hTaEFUay9J?=
 =?utf-8?B?LzUrQzdKd0xlbG9uWGxoUXR3cE8xdjFUc1ZoWGJaVGZMdjcrMVZzOHNDc1Zp?=
 =?utf-8?B?Zk1IcEZVVTZFWTkrQ2hCSzdLY3FBYk1MQzB0YXJhY0tYUnkwVTRtQzBobzJ2?=
 =?utf-8?B?OU9nRnVKUi9tSnNGTHhoY25wRlZVK1puQ3hxU0x4RThkRnVMWXNYMkZZT0JY?=
 =?utf-8?B?VXRsZkFmN3NvSWtqb01oRGtMdzhOR0lGbjJXR25hQ3ZuSWFHbTVlRGZlSExu?=
 =?utf-8?B?c0NBT2JzazBFM2xaTXQ3QWFLck5nK3Nyd3BubENmRFVwL0o0bkk3dTlia2xC?=
 =?utf-8?B?WDJLbkpKT2VtNkJacjJkTkRPdkpIM3VsMGNVWlVoK1haMzdaQ1RqY2NGR0lO?=
 =?utf-8?B?NjVaLzRMeGdRTDZYVlliS2kzQ0VVSVJzZTk1NnF5M0JvWC9LanNRcnY1N000?=
 =?utf-8?B?a0VGQmIvNjJIbFBOVm9zTGR3Y0srZXJud0lYOGtoU2xVVmZKbUJTaXNlSFEv?=
 =?utf-8?B?VWVlaDlaRHd3QUVtaTJad2liV0k1cDg3Zy91bGFkUVI1TndTSm03MC91WGll?=
 =?utf-8?B?allzMC92RXBUdllHUERIL2ptUnlCd0NGMG80czQvYWI4NE9lemJ2TlpvSVJa?=
 =?utf-8?B?QXk1K3d5VkljbG9pejlQM3BHQTlTcGwzeWI3bnM3VnVjTW12TnI2eUo1UnBH?=
 =?utf-8?B?b1J5YVh4cFk2N2VXUkV5ejBjRWlsQUxDL1JpMjl1aG0yWFZiby9LRmprb0xv?=
 =?utf-8?B?cTZwbGFZNTNPdHhMMlFOVDE4Rm8zYWIzYndYMmRSZWdveURhVjlKWWJJKzAx?=
 =?utf-8?Q?E5C3JyWyZeDknubPvDP9M8Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d03e8e-b91d-4cca-c313-08d9e1a642e7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 15:04:05.4660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Cgcjfk3Klm+cSbZFFxLzPcNVdKbrAudhJPuS3TXTfrdXwMSDNeONbGtBTU4OWqfFT1zZFOxYGJUBJDThLk1fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6759

On 04.01.2022 10:48, Jan Beulich wrote:
> Avoid recurring MFN -> page or page -> MFN translations. Drop the pretty
> pointless local variable "p". Make sure the MFN logged in a debugging
> error message is actually the offending one. Return negative errno
> values rather than -1 (presently no caller really cares, but imo this
> should change). Adjust style.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Return -errno. Drop exclamation mark from log message.

Ping?

> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -58,34 +58,27 @@ p2m_pod_cache_add(struct p2m_domain *p2m
>                    unsigned int order)
>  {
>      unsigned long i;
> -    struct page_info *p;
>      struct domain *d = p2m->domain;
> +    mfn_t mfn = page_to_mfn(page);
>  
>  #ifndef NDEBUG
> -    mfn_t mfn;
> -
> -    mfn = page_to_mfn(page);
> -
>      /* Check to make sure this is a contiguous region */
>      if ( mfn_x(mfn) & ((1UL << order) - 1) )
>      {
>          printk("%s: mfn %lx not aligned order %u! (mask %lx)\n",
>                 __func__, mfn_x(mfn), order, ((1UL << order) - 1));
> -        return -1;
> +        return -EINVAL;
>      }
>  
> -    for ( i = 0; i < 1UL << order ; i++)
> +    for ( i = 0; i < (1UL << order); i++)
>      {
> -        struct domain * od;
> +        const struct domain *od = page_get_owner(page + i);
>  
> -        p = mfn_to_page(mfn_add(mfn, i));
> -        od = page_get_owner(p);
>          if ( od != d )
>          {
> -            printk("%s: mfn %lx expected owner d%d, got owner d%d!\n",
> -                   __func__, mfn_x(mfn), d->domain_id,
> -                   od ? od->domain_id : -1);
> -            return -1;
> +            printk("%s: mfn %lx owner: expected %pd, got %pd\n",
> +                   __func__, mfn_x(mfn) + i, d, od);
> +            return -EACCES;
>          }
>      }
>  #endif
> @@ -98,16 +91,12 @@ p2m_pod_cache_add(struct p2m_domain *p2m
>       * promise to provide zero pages. So we scrub pages before using.
>       */
>      for ( i = 0; i < (1UL << order); i++ )
> -        clear_domain_page(mfn_add(page_to_mfn(page), i));
> +        clear_domain_page(mfn_add(mfn, i));
>  
>      /* First, take all pages off the domain list */
>      lock_page_alloc(p2m);
> -    for ( i = 0; i < 1UL << order ; i++ )
> -    {
> -        p = page + i;
> -        page_list_del(p, &d->page_list);
> -    }
> -
> +    for ( i = 0; i < (1UL << order); i++ )
> +        page_list_del(page + i, &d->page_list);
>      unlock_page_alloc(p2m);
>  
>      /* Then add to the appropriate populate-on-demand list. */
> 
> 


