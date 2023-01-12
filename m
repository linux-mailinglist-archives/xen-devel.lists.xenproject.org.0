Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314FA667207
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 13:23:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476101.738090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwbH-0005fl-SS; Thu, 12 Jan 2023 12:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476101.738090; Thu, 12 Jan 2023 12:22:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFwbH-0005dN-Pj; Thu, 12 Jan 2023 12:22:31 +0000
Received: by outflank-mailman (input) for mailman id 476101;
 Thu, 12 Jan 2023 12:22:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFwbF-0005dH-Ob
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 12:22:29 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2045.outbound.protection.outlook.com [40.107.7.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c7439f99-9273-11ed-91b6-6bf2151ebd3b;
 Thu, 12 Jan 2023 13:22:28 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8242.eurprd04.prod.outlook.com (2603:10a6:20b:3ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 12 Jan
 2023 12:22:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 12:22:26 +0000
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
X-Inumbo-ID: c7439f99-9273-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSYaqlJZiJcbqW9ZYVHAlai7FWzSM0Hh0rcVqvyifVRNnVIgiJx1zJxq+DrTXHNsjJs16z0AfOyExobjaNL5i+TsWhMfQJ0zttLz+g1Go3tIDdrI/Y0XMDjfIq39z2sP4P4fztUQXyw40yUme/Dy2EdveHJtz3ABRKBhXMhkmMQz4uKr44Z9d/uroa/L6CNzusXcw7gMPY6491tadsp6qnQQ0YlhSEoawEX2NjwwG1zkMwkVORo5ufQToeya+Jk9IBmuTkMLgElgyNRCat8SBHHq8Js8nWs7DyNjuPu5UidlwI6M+A2qiQS27MgEqE+fgaVijtow4JPaLRsS2eeUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jua8+qvyFxdva6AeLg6ip2uyjypLjH77n/jmxwE62sk=;
 b=ZyBq0oZLxxJdnrIYJewalSn7MMi5NZRt4PFTaQ3eYDr4CkDVBrU/GzbcwqRHaWHc4KqnHo7Cte78onWU92ihsGSUVQoJCz57Ie0t8XR9E5w/J3Uv2PRUQl2f9EzwifoNe5G7iF4dXlDoZekwNtjxFWh+GH2IPSl0Viu+4Y3GlOqNGeSE7COAtVFkTTwb2FQNtCDrtU7YfBQ4ANs9SE+moKkpiYKV1dz3RF06dcdJavI4stZ3ADZX3k1FqkULTPLAqZtdT/bZFx/q1Ay/XAzryh6tvFhyirOhchj0Br0lmI7HslEjcasrvZDvOkJS7Tz+9ODNK/1fJ+V/7UcK4V1Ojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jua8+qvyFxdva6AeLg6ip2uyjypLjH77n/jmxwE62sk=;
 b=0zHSaJp2RHS+Tz5KX9Dy+8PzuJq48QRwrdV1rGQJ0LsY7uRg5Dz5qZ4hQa+95588Xc0kCv+d614RhIkuAYtJZQRxh4E01rbzSlQqWnvBOUjwUsH0zL7UCP+bJij8LpyTchnHu/pUsyS7iJmqSM/9gaTBrDER3Z0TUdR5+GbGT0C20BhAnWjnkDGUE4ksUBZOoTKnAwKgKrRvtVRX6q8z0E6zTeNyg5mEVbapc20Vc2uQqUozyD3be92X9hoGgfwpzd0SEBtRsXrsTtIqqAbZAAppN5dKQq841cYz9ktdUdzpneldZqqeGax4TnedAMS9uCtKnz+A6Cg2zoIna76Z/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d829f6e1-a032-931c-dd39-865b2f4f09fd@suse.com>
Date: Thu, 12 Jan 2023 13:22:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 7/8] x86/dpci: move hvm_dpci_isairq_eoi() to generic
 HVM code
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230104084502.61734-1-burzalodowa@gmail.com>
 <20230104084502.61734-8-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230104084502.61734-8-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 426fb9b6-27a0-4c27-1525-08daf497aa62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CBa733W5D5Pe6zs8+X9ELfCcuYzknmQKX7uMOnqu+WCvig8sKAPyudu8eM77OlE23o4e6/+h/eDUDzCAmToJWnwIUKKsVkIgeG66INysko5GCIEa3Mq9XzEatk4QqcS3LMI2JRCbflbTzKbs/U2ebS8d4VenkvVmp9L5yuVUFi1g7gk95mwB48shWLa6cllgygcRmd5O28+ZWVX1o8HTE7yzMLSrNp9A5OeX8pT5Ynkwji1GrnUxpnIauqMnSupdgqdDNizUGn4VhyTqKlcR8bHiK0w7mWt1mL5enDyEV8nPWfPsscsgzvlYRlMA2mx4QyfXK2OqaigtGHZr6lEKf/p3J5gpzKvryuE4ZJqqFFHS8QluDT/VNLuJdkU88XmaxddhjVpIBshavLvpPiNxIzOjbPUT0HoM1x7YWE4PHxGZ/PFHiL9phjaQBiwgHLZ4F4IUP8Y7+77mP2WQcJ6LhN9QMjMg59MPd3nPMF+5WICC9hMgdQhxP55F7OejBVa7hAqhRJOn4aOoP46ToHMBofREnuWHLi/llR/ycto/TUIZe029v7SrR6rq4hgJczHBjsbskWUIEtgkJ6ijgKpIJg/m9fJ8zTNyt8FuhFMCXnLOwgLmj3njlYwCm9rSWXdKjSgZcN2hG0V86fKI9cpDYnAqqc04GEHnNl0TX1Kz9n/RETPlzrwKweaXzCWZ2QACQCy5dFAr23iVnnZcViI+0yUx6WEZB6TUQ38QrKDcolcjr78kJkQn4WFa5e4uj2Bn
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199015)(6512007)(186003)(31686004)(478600001)(26005)(66476007)(66946007)(53546011)(316002)(66556008)(54906003)(2616005)(6506007)(8676002)(6916009)(4326008)(6486002)(38100700002)(8936002)(5660300002)(41300700001)(86362001)(83380400001)(31696002)(36756003)(2906002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXk4a1pxYjZnSEtUV3RGcDNkS3NHMllIZ09UcGhTZzlGRGRkUzh4TlFpUEcx?=
 =?utf-8?B?d1BYd0Y5S2JMUmpjUEVkZTNhVEhmdGVyMm9ZWjhLMkNKVGhsQnNKaW1INEN4?=
 =?utf-8?B?RDBLbSs2UFUzRVdiNlVHcEdINDFDR2RJOUdmMUFhaFd0cWd5dVUwZXJ1UjU2?=
 =?utf-8?B?RUpLekpqR3g1MER0SFVaR0dHSnFnOWkybmJhbmVld29qZFpsL0x1OGZKMzRL?=
 =?utf-8?B?c0VLRFNUaDkzbFVKQlhIL0RHTkkzZG5NNndIYytRN2Y0Ukhid3l5bWVaeVVM?=
 =?utf-8?B?bW41NWdQUkpZdVVXaDF5emFCQS9sOGxFRmlxZ0IrNGdqZmMxTUU2OFl6bXVu?=
 =?utf-8?B?dzVIT1I2VWs1SXBTSHJxd0VIeWVCMjB2YUs4YklVMzQrQWVSMmlFQWNlenNY?=
 =?utf-8?B?YldDcHdLOGsyR2R3a2UxQnYwemhDc2NnVGppa29wWlBFcStwWk9KYlpLYmly?=
 =?utf-8?B?c0tCb3lmOHZZUkMyQkZNanpqWVVWbDdqUDB5am9Canh2WHBZVFFFMXUrT0ov?=
 =?utf-8?B?aE14SUUvTmRBem41T2JJblpIWTI2bVQ1WUFJYUs0UE5BL2cxWHVaNmFzSlJJ?=
 =?utf-8?B?QWx2SCtkWUUraDlkYnFNQU1ZUTlyZmJnOWxJbTJtV1h6Nk1sMXlScjJ1SGEv?=
 =?utf-8?B?Zitwbko0dk0vTVI4UWhwSkZ6SnJXZXEycG9weDNGeUlpcmJBdFBWZ1dtVWFo?=
 =?utf-8?B?NnNJQ1Q0OFdDMDEzbldveTY0UGkrVkNSaVI2T1RoQmw5RE1VdnpxSjhTVzg4?=
 =?utf-8?B?dTRuV2pyTFp6OHd5NFJNZlpucnZrcXNNV1gybFBFb3ZDQzJpdXk3cjMrRnFV?=
 =?utf-8?B?TlJrL24rK0U5MmpMdFJ6L2pscVZ5RWRyakNpbVRJSHBSZFVDNFlXZW1xMllq?=
 =?utf-8?B?V2kxSmV4cEQ3UWFnWStZek9SL1BDVjM2Y1o3TmJQU1grNFA3S1poUUZRWWV3?=
 =?utf-8?B?U0liUmZobEpOSUFrdjJyQTVnNGozNGw2OTNGTzYrdGxzcXQwL3VSRVNzcVAz?=
 =?utf-8?B?Y0tQQSs3WGRNb0p6K29aWEF1MFl6VlkwQS92UVVEVWJOYWVPSlNXN2VHTU5M?=
 =?utf-8?B?MzRjZmtPS2xmQStVWkpGeHd0MUM1T0xEc3hreGVGekFXQ1hJb0lRNkZzbGUw?=
 =?utf-8?B?dm5kNnV0SEFjeWF1VHQzQUtqL3JqVE91L3pzcG03K0JXMUhmdEVsTzUxeTVP?=
 =?utf-8?B?NVdaamZPTFl5Smx6NGtqQWpmTFBRNllaaTFRZ3RHM2NoN1BqZlhnenJQVVd1?=
 =?utf-8?B?Qk05RUVvUk5oVStiZHBOTmp3VHZhYVNlTjJqUU9vRkZaczY1VXo3dDFTWkd2?=
 =?utf-8?B?ejV0dFRXUFhzZ1BnR0RjZFdwS2tLNzdWRUxNK09jdTBEZk9YWEpyZUxIV2Vz?=
 =?utf-8?B?MG5EK3BlWEU1MFN1R1BtbVN5VFJ0Sk4wNzUzRjhNdnB0WmVReDh2NzZMNi9l?=
 =?utf-8?B?UEdYQkhyZDl6RkFBYUNXNWFtUEsxV0R5ejhiaEg3R3duOWZqS0hveFI3Vkll?=
 =?utf-8?B?ZzJEcU1CSzJwRUpOcmk3MXIzTTYwK3JFWFhvQzlBMm5PZ0ZGek82Zzhmb09S?=
 =?utf-8?B?WHlRdXRSdng3R1NZd3dJTHhwbHVLSlZVZldEQ0kxbEFYdlVxMlRVeXdiYTY1?=
 =?utf-8?B?ejlwd2tuOUNyaTJzYmJzZFVDZGp6ZldTL1VFMzUzNHV6dGFNSmcyclhJaE0z?=
 =?utf-8?B?Y2l3bVBxL0FBR0REMnFHSVVKaXZ2cXdYMFpyMHFsQTRtaXNvNGV2S01OMUVs?=
 =?utf-8?B?Z0tTSlQyMjFPZElPTE9hd1BNVTlhbTBsYVp6b3U1MUJRVXE2b1dESFFRMUZQ?=
 =?utf-8?B?YlUyY0p2R2psN3JhVTJ4TWNycUM0QlBWOTIyYXdOSFFodGlDRlo4SnNUU3Qx?=
 =?utf-8?B?VXBkNmNkVCt0UU5UL052REg5R1dsbzVBNVRsSUI3enp5Q0p5a0cvc1o1WFlo?=
 =?utf-8?B?SnlzcjhXQVlvT3BFM1RjNHNrNTRlN1Y0Z0pTU2NWKzkyTzFkTWpaTWp3Zk94?=
 =?utf-8?B?TWNVZTN6S0IzL1YwQ1ZYUlE5a2tjRnYvdWdTa3EveE1OY0gyT3RsUWVZdy9K?=
 =?utf-8?B?SzJrSW94aFlPZ2NBR0FmRlNQeGhjQlJ2R01kWGNVaG0ySUZmdG8zWmtvSVg2?=
 =?utf-8?Q?pXB0n38Jkkja/0j6ykedCBk9B?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 426fb9b6-27a0-4c27-1525-08daf497aa62
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 12:22:26.3546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKic1qhwsTsQ/qaT0BTl/JJGBK1iASHxF15qVMrgrURTe/Tug+Trx4T2EWOGsjZPkDtjK61suOwwV0BJxAwkoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8242

On 04.01.2023 09:45, Xenia Ragiadakou wrote:
> The function hvm_dpci_isairq_eoi() has no dependencies on VT-d driver code
> and can be moved from xen/drivers/passthrough/vtd/x86/hvm.c to
> xen/drivers/passthrough/x86/hvm.c, along with the corresponding copyrights.
> 
> Remove the now empty xen/drivers/passthrough/vtd/x86/hvm.c.
> 
> Since the funcion is used only in this file, declare it static.
> 
> No functional change intended.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a couple of cosmetic suggestions since you're touching this code
anyway:

> @@ -924,6 +925,48 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi)
>      hvm_pirq_eoi(pirq);
>  }
>  
> +static int cf_check _hvm_dpci_isairq_eoi(
> +    struct domain *d, struct hvm_pirq_dpci *pirq_dpci, void *arg)
> +{
> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);

I think this could become pointer-to-const.

> +    unsigned int isairq = (long)arg;
> +    const struct dev_intx_gsi_link *digl;
> +
> +    list_for_each_entry ( digl, &pirq_dpci->digl_list, list )
> +    {
> +        unsigned int link = hvm_pci_intx_link(digl->device, digl->intx);
> +
> +        if ( hvm_irq->pci_link.route[link] == isairq )
> +        {
> +            hvm_pci_intx_deassert(d, digl->device, digl->intx);
> +            if ( --pirq_dpci->pending == 0 )
> +                pirq_guest_eoi(dpci_pirq(pirq_dpci));
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static void hvm_dpci_isairq_eoi(struct domain *d, unsigned int isairq)
> +{
> +    struct hvm_irq_dpci *dpci = NULL;

And this too.

> +    ASSERT(isairq < NR_ISAIRQS);
> +    if ( !is_iommu_enabled(d) )

A blank line between the above two would be nice.

> +        return;
> +
> +    write_lock(&d->event_lock);
> +
> +    dpci = domain_get_irq_dpci(d);
> +
> +    if ( dpci && test_bit(isairq, dpci->isairq_map) )
> +    {
> +        /* Multiple mirq may be mapped to one isa irq */
> +        pt_pirq_iterate(d, _hvm_dpci_isairq_eoi, (void *)(long)isairq);
> +    }
> +    write_unlock(&d->event_lock);

For symmetry with code above this could to with a blank line ahead of it.

Jan

