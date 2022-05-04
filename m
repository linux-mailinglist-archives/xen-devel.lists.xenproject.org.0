Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6C051A0E6
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320742.541631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmF2G-0004t4-5X; Wed, 04 May 2022 13:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320742.541631; Wed, 04 May 2022 13:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmF2G-0004px-2X; Wed, 04 May 2022 13:27:20 +0000
Received: by outflank-mailman (input) for mailman id 320742;
 Wed, 04 May 2022 13:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmF2F-0004pr-7Z
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:27:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaf7eca7-cbad-11ec-a406-831a346695d4;
 Wed, 04 May 2022 15:27:17 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-yR9Von1QMPu5BFq5gj-nyw-1; Wed, 04 May 2022 15:27:15 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM9PR04MB8422.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 13:27:13 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 13:27:13 +0000
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
X-Inumbo-ID: eaf7eca7-cbad-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651670837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BvJtktjFkyufefyAbwFObafdz8RoPHDnq29l09RLCdc=;
	b=PDorknEX25LpFoutFghmlYfzvXDQrm76nXwXuqNJcR7BLZBj7yGDRsnN13a2XkiGncIHNl
	H1uxXR1fVdyx5LwGaMG9JgQuhn+O6SVDih+J76OZ6R2Bzsm210p7xUwFfcdPoOfRAWadCm
	mH8PZKXWgIJpd8/j9UFl/GQH1kn/geI=
X-MC-Unique: yR9Von1QMPu5BFq5gj-nyw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TFIuwjTcUhYabI9+YXqQJKgw9k/yDpVSTl64eEwUosTPdiH8ZanueazlHy3MEyMPAfuCzTwBXXviEbZBQ8H7eWtboiisNKZ2HlimACs7Ic+1r8cl7GDFTGkJ+ERIxvG7UQR2NghR2Rjrz0WcT3P2S6eN2i8No0ceHvbAHXHfIWZKt08ME2unayFnjjMluvJ8/vyI4bs0NW+gGDzcrBDdN8e/trIq8kQ8c6i8YANUfsXizgzZ3u+fTl8hoKiXEYtNW5NRtAgx5l8fv/omMCRFWj2KP2qp4x0PwUzQkJtjhsmQU+ih6PTrvhlSd0Y2gOyN/LmGEbCmZ8Y7Y32ye+2isA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvJtktjFkyufefyAbwFObafdz8RoPHDnq29l09RLCdc=;
 b=QLnH9kZSlYv39iPKAew6pfobYkXt9EnYf1LxORwQiXVd/tGVwDQK+eZnwPH/9aDDr3+9U8a61WHF3/bbxV6DfTQcJNRLD2d9S6Rqvs4MXM6QV2oYwrNBQXhi59AGkypB1sNEc9ncMGCOOJaWIv7AiaX7Idbt8SgaKKJL/3m04o+nSj7ceZ9fP3eJEp3dJ8P0SOjrfWHETvwaPMnA5wuK/XnPF7t/QztrKUZenkPKd6JgXdI/9p2OEbTB6KZq9pHJqiANpvbrj6TWume6pfknjg4T4tj791dBKMVqo3fDvujLWDOcwozGTKcTpXBDwXXqMxO0zn2tWOEsEIOYi9NJLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5de2f283-f6fc-95e7-808c-4f3d96b25926@suse.com>
Date: Wed, 4 May 2022 15:27:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 1/6] xen: do not free reserved memory into heap
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220428030127.998670-1-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220428030127.998670-1-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P195CA0097.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::38) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e18091ce-2b71-4349-9ac9-08da2dd1ccc0
X-MS-TrafficTypeDiagnostic: AM9PR04MB8422:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR04MB8422CBA80FA7B067E493B19AB3C39@AM9PR04MB8422.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JpsPJWXzAfGOocAbvnRCqjdJXKLFp2LYZYrm94XAsML9cq+bSKsoYZkAH/Y+ucRSnYPh7Xs9/MAjbcqOu1wozqz/BAFFsaBs8F0unonlOq4pb+4JDL3XcrVGfjZj9ZqT0Q/S0h6miZvL3M4Wom41gLNbBpGcaVVF6JgS9DJfBwG+K7ZIKCYrp4TxDnWzOOHBs2zXNFezGCDcrmw+Ki2PHPbrFiOCdtULNqnG4ZM6cM/TyeP7Yz8Zzknq7NyXHvh4ELAQeLJrFf2fgYsKxEsbcIuO9ZuHf9hEjicRILgSYvLndcc+J1cC6XEE2DEZTsIpUGIzCoGxa3uByZVxkQrrDeg+VAzAMWIWFNZ9UFe4STMsn1FS7YoJlOxdyLybTp2FYrxMBhtDPkpYjecB8KFEQB/YkYxPCelT7Ccs13pe9PEQQe+M6+AnHmU543srvagkcqtnv1Q31ZS9FNblGAvQqIu97csvei87x4B7zyWpM7URLa7lMGNF7n7DzvbG72UgFBj6s/zPFHGVumnuZuiqV0zoPGzrEViaJoYo7T6Q1M4DEkRCRQshVwQa7U/LYmDgfn7wThNxCiMm6oEpsZV0VuRqM+eD7JHoJySkMZy6VfhdfjE6zp6YGt17lzXLEl6A0aVRxbKFOTviNLGF/+Gg0Foe9CsYSnNumvo5v0fGHcwes0Qa9SMuVbSyT/th6+riS+oPJiJphlHlTwIpTePxd+0MIKBoIUAS2kIWtTo/9TC3wjPN6jYB+jSk387XB834
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(66476007)(4326008)(8676002)(66556008)(66946007)(6486002)(86362001)(26005)(508600001)(53546011)(38100700002)(186003)(316002)(2616005)(31696002)(83380400001)(31686004)(54906003)(6916009)(2906002)(4744005)(36756003)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEM4cTIyT3F6eVhBcjhXcEh5b2o5QWJTNm5nWmVIakVRQldJWHdMRzIwd1R4?=
 =?utf-8?B?RS9JVFRmeVAzSlNKVk5hbXdjNGZXaVcyQSs5K1gzbkRxMGVpc1hDKyt0bElT?=
 =?utf-8?B?QjR2RFhkdUt1UGN5WmRuTGlCTnloTUg2LzZCamE2emgrS3FXbS9mRGJvOGNh?=
 =?utf-8?B?NmI1TVFodHVleTlhbkJUZzNVSUhwOUtYRjlCSDFtejZFTTUzL0JPYlpONEVv?=
 =?utf-8?B?YjZJZVY2YkJXSlJBT3R2SnF6T1hEVlBuWHBWRHZFVHY0dSs2YnF4dmttVUN4?=
 =?utf-8?B?M3llQlhoa0p5amZ0M1BrNkdXaEp6MnJyeENFY2IwSjAzQmRkY3hQd3Vsc1NK?=
 =?utf-8?B?d01MeERldWZtUEMyOTBWZURqRGZlS0U5c1RYVXNhWVUrclBrS3BZVlM1MDVo?=
 =?utf-8?B?WC83Nlp1MzhSV3ZRSW11aUpFVmFHZzlDTlRwMnBMb2I3RHpXMWdvU0RUQVdp?=
 =?utf-8?B?TkVURnRYYkp6NktHVExlUmdyZERKMjUxMml5Z1l2SkNQRVVtM1BvN1drWURP?=
 =?utf-8?B?cy9mZjB1cTVJaElvZXh0ZWZNSXJnQTFBaVpLTGI2ZHpvaFN6QzNDaXJXNC9Y?=
 =?utf-8?B?WlUzeFdUUFJPUTBaa2lwU2ZtcmZaOStFTEtLaHd2NGMwZ2FiTGdaR3lsU1RQ?=
 =?utf-8?B?MGY2V3FyUGNLREsrcVgxbGpJTTIvcmlqM3NTS3A4aHhDYXFJc3pVbW5KSVFi?=
 =?utf-8?B?aUVnQ0pqeHZsMnZpdTgzVUUvbnhIT01hOGFRUWUzWXlYclJCZmF5MTE5QnJH?=
 =?utf-8?B?UFk5ZTlCUDlxRXdEeHpJTS92RWNzemR2Ui9rTm1tYWc5NGYvdHBMVktwbXJG?=
 =?utf-8?B?VWs4dDFCNFdvN003cDMwR3RrRVFjZzhWMDZpcGNta0dqK3ZOUTE3V2VaM3lB?=
 =?utf-8?B?U1RHZlIwT05Qb0pBYnIxZmxoY0xsc1FleUhhMTBmdnNWZnd2Yi9hQkpOc0E3?=
 =?utf-8?B?d05DV3lKTWJhL3hjNHBZYnV5dFY4TjVtM0lCeTBscFRZcXFCRVpRZDExcExo?=
 =?utf-8?B?RzJ2NWxjSW1FUjduYkNVUEpHeDlrS1Vnb3BDUjd2bTg2dlI3Qk1KcU1KVE85?=
 =?utf-8?B?WkhneUJ3a3VPVXBxTlU0ZlRYSWpmOVU3VXZsM3U0bzdDekhxdlVQc0plWVhW?=
 =?utf-8?B?ZHZURUNZRCtYc29iNUtOdXZVSEsrZG53RXhLVXVBcExVU2IxQkxMN01JcC9P?=
 =?utf-8?B?R3liKzNKcEdia0dJdjhQOTlWeVBvNUNjZFRNUWFSeWtyZlZtdTdQd1h1N2E5?=
 =?utf-8?B?MFc5SXVqZDdsQkgvRlgxdjFwa3ZIRWEzbXlmcXZwM2JXZGdFY1BiSERSNTBv?=
 =?utf-8?B?M0d6bElhWFphVHdtRFhUZ0d4SmdkK2liTkxkWlhYM1lNZ1FrODFXZU9qcVpy?=
 =?utf-8?B?WE9QMWR0UGJwamk1OWdSMEJVTGc0aFdUNFhXNHJGNGFPT1lnUmxwNmtIQURs?=
 =?utf-8?B?RHNiZzk1cDAwVGdTTXhuZnVndEVBNlU4bis0YWhPTlJIUmRCK1FURWNybWVK?=
 =?utf-8?B?Z002S0NmQ3ZaSzdZR2hReTVxOUJrZ1dKMXJSV2p5QUI0dVlYK29nemJKeE1M?=
 =?utf-8?B?bWQ3N0FVRVhmQXduSXhuY25wMEE3UjVCZXQzbWcxVDJ1NmJYSmx0M3VMTGpw?=
 =?utf-8?B?VEdVamhnMXMvQW56bzd2VWJoMTdsbU5SQWd4Um5HWk82U2VvQk01L1IxQ25v?=
 =?utf-8?B?VVQ5M3NDNThnSWtlazF6NytoUWFtZ056c29wSE9OS1FDc2JsR21RS2RoT0xK?=
 =?utf-8?B?MHNXMWxoN1Z1QUE2dTN5K1JzWkRXeDV3bDZMZFUzN1ZIa1poejJsQStUcEMx?=
 =?utf-8?B?SUlBZS9hOWFneUZBR3g2djVhNkRyQWxVRGwyeVZnMDFoUktqTWEzR2U2UFJj?=
 =?utf-8?B?bnRaRTNvdVhuYVNjdDlFdEhXa1Q2RFcyd1dCc09SZy9nOEUrdTVwdS8wL2NG?=
 =?utf-8?B?b2RXWjNqV3JaZ2F4Z01PS1pCT0pNUVQ5aFpJVEFrVWFpckFNSWNoaURnejFz?=
 =?utf-8?B?aTZEa0pXUXdYdjlHaWlNY21BN0o5ajRCeUZCMXZYeG04cE51U1dhZTJ6c2ZJ?=
 =?utf-8?B?elJHWDYwMVZYSzlhQjNkaUc1LytsMkFLb1dYcTBjOUIyUlVVM1lOSVVCY05z?=
 =?utf-8?B?bGNKMlJiYlhoUFdQQXFNaStld3lCVEM0eitZMnBRQ29LUkVuNUZ0cXJNdU96?=
 =?utf-8?B?dk1SOTFxRzBTWWxXWENDeHd6c1YzblQzUGVhWlZpZnpPQXh2eVNYelBWRG4x?=
 =?utf-8?B?NEJtWGJORFhoTzRmVE14dmdGSHlqMUpBUzQyMWtpbldiWWpGREJZU0tQbVho?=
 =?utf-8?B?NnA2TDlRMUdvWTFjWjM1RW1tRDVNTnV2SVI0c2pLUnErODd3cnQ1dz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e18091ce-2b71-4349-9ac9-08da2dd1ccc0
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:27:13.4810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /U5/PR8KD2IzScYrWXdiHy1jQq0+WaH9ovy/x/bMviG/d8JrmSJxLGKpmycjM6P9i1FCKNmK/W6D3KBOUCi8Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8422

On 28.04.2022 05:01, Penny Zheng wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1443,6 +1443,10 @@ static void free_heap_pages(
>  
>      ASSERT(order <= MAX_ORDER);
>  
> +    if ( pg->count_info & PGC_reserved )
> +        /* Reserved page shall not go back to the heap. */
> +        return free_staticmem_pages(pg, 1UL << order, need_scrub);

With PGC_reserved being zero, the compiler should CSE this call. Hence ...

> @@ -2762,6 +2767,12 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>  
>      return 0;
>  }
> +#else
> +void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
> +                          bool need_scrub)
> +{
> +    ASSERT_UNREACHABLE();
> +}
>  #endif

... I don't think this is needed?

Jan


