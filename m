Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8971344AC78
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 12:19:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223893.386844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkPAG-0006Rb-87; Tue, 09 Nov 2021 11:19:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223893.386844; Tue, 09 Nov 2021 11:19:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkPAG-0006Ov-4v; Tue, 09 Nov 2021 11:19:44 +0000
Received: by outflank-mailman (input) for mailman id 223893;
 Tue, 09 Nov 2021 11:19:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mkPAF-0006Op-Cf
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 11:19:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef69d75e-414e-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 12:19:42 +0100 (CET)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2051.outbound.protection.outlook.com [104.47.4.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-31-tH2t5thlNweaIbpa9Nwiig-1; Tue, 09 Nov 2021 12:19:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4605.eurprd04.prod.outlook.com (2603:10a6:803:65::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Tue, 9 Nov
 2021 11:19:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 11:19:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6P192CA0089.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.16 via Frontend Transport; Tue, 9 Nov 2021 11:19:39 +0000
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
X-Inumbo-ID: ef69d75e-414e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636456782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfPhLruYjOCa3U8YgYc0tA4C4vvSxTnDRem1yOKuIjk=;
	b=m+F1A+mvExoI1/oGUNgetBSUclN0zQhj/oycc79mk37TNfFdvSwoi7fbJLPhuMbv/Y3EAc
	AxHzGPK0kl9nm5hxDWV5XTkc1jmohNAbOoJ9YjK0Xg5C8SaFDatKJl5SYncNc/8GkbyDLd
	P5N+Zt7+pw0zaI8zSH7rHnI53UrMuB8=
X-MC-Unique: tH2t5thlNweaIbpa9Nwiig-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpQCMQRs0q3JeXPtLeYrdNdeC6W0fd9JxrfqUhaMYS5aindeRh47t5ICFspZM57z6t51Za+XGmRWfc/wIhazDG4eHfXt4rRqC4phIDp9RjviJD6kiTEn6azNjOaKPA3u++ZJIP3YVlukULI+svbQP+akIGvY5BrFyhvGdom96asLmocLEdyo9ZPc+cEMBEmDgc6FEjuXdRedfMd0KVNqyhVHd1YuU0iJDYS8NzWByE1fbw5wKwh0X4Kxy89NFfhNR+VFJl0sYFsqRnagXrJChlBwnJQMFQ8zT2VA+9NA46fl/eThql6pvXY/gLfhkJ7Fc3OYXLklOx3L8Nom+DxxsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cfPhLruYjOCa3U8YgYc0tA4C4vvSxTnDRem1yOKuIjk=;
 b=O23I+Ufus2xAveOr8+hERcwRr4RygIsDMoSxM4+FQGj+Xd6e7a0/Cy8VlXYetp+oS8QvfRsAp5nc672imxkHl2gVdvOa04NibNXlH0Vwfrae+DbszPXmHb/h0NN0dJi46ebJb09nUc9ob7N2JG+q9Ud13Q4Pvg0jTEiqUKtV6wlwM1ugmc8xg13NGGQ4vqO7rZXQkNvTGsid8j+Jvbkz5bxo4XTpAM8qkw5WuWLbjFy09Rkc4dVBALXkVtON2aQzzClUzNRhW5JzVqO0kkAYG3nbvefxOTxqenKCdqpWA3r7tYp/U2gFmCCtQr57or80vXyOYfvuUoaYZ/ibXKZw1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a984eede-878f-d9b5-da63-990e2e2e57b5@suse.com>
Date: Tue, 9 Nov 2021 12:19:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [XEN][RFC PATCH v2 09/12] xen/arm: Implement device tree node
 addition functionalities
Content-Language: en-US
To: Vikram Garhwal <fnu.vikram@xilinx.com>
Cc: sstabellini@kernel.org, julien@xen.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-10-git-send-email-fnu.vikram@xilinx.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1636441347-133850-10-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P192CA0089.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13623e68-be61-42fc-1627-08d9a372d22a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4605:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4605D0D1F44315990147622EB3929@VI1PR04MB4605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a1QzYa4hbWdCsTpd911Au5Vh3kjGUTJmyIiAN7NlyQDpgfSyOxvasOAQzXb5F/tV36V76rHTgbQkq6nFlbb782u+/lY/2vz64SNturNmq/9cebDQh8Mh73d2LfDr9KWFnSI2PMkPe5bujW+o0GewCrd9Q2dvLzKfaTCjcW2VCyWDp15eFcSErtdxp+WJtj6TQ8Vg7jZjxEmxbdvxKt0RFsKrdPqmj2u4jeYvoCH/0TBaTmADzkjAA92fenQVAWNQ5AYK8RSULKmuFQ13eFf0m1C3R2eMjMgE+C7k4N9Os145Ho373nRLd3mwVeg5XXOHlP9mt9RxCwasAg3nRG7GvdaN6EsEOFC/ngHRtqYV8mU1FS+s3HMDGRRctV2llz6SDVLvtI9Xa/Fv35DNBVqCKsh92oN9dxOa3lqCanhJ/8PP9kK+pmsAU1QoxcEtgV8UinrbyGF42zCIlwP7uUyD1/1TojgtMG1/X7uGeckuQGXt2RGkI1IITAKhTrNdGgITMLBLE5eSXkVpd0Nlze2/X8OAHYMFMgD5bzWTvMYKtVuq8rpbzfMBQZn52BF8ZyPeAiISN7Vu7X73vvPulJNLEZiRkTTne4c/I+XjRToZ6SW/FwMS8LXz9l1rlcXFSEHKGKtmr7smSuEmCqPO+SnqoBWxkDvEucsSjKlzTBRm/efZgiKCvC1XZnRNr51v8OcFmL4ite0VzGxD+tFFOarQovaVgCQLQASxqu5sMwQAVzkcLuwfU5U9cDCMZDlePs2p
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(6916009)(26005)(4326008)(8936002)(31686004)(186003)(956004)(38100700002)(2616005)(7416002)(86362001)(6486002)(5660300002)(2906002)(66946007)(54906003)(31696002)(316002)(16576012)(508600001)(36756003)(66476007)(4744005)(83380400001)(66556008)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHFyQUE5QTNtOVI4UVBCb2VZQmxTd280RlpwYmM3d3RGVWdqOEF1NFB5TDRU?=
 =?utf-8?B?YmN3Ui9ESnUvMGY0ODh2UEwxR0pFUFhxUitXUkhHTXUrY25jbkk4OWM3Q01i?=
 =?utf-8?B?ZVdXVVY3dzJ5SVppUkEyYUVKS3Y2bHU4L3IzQ1A4RnlWUmE1ZDVuNUNVUDMr?=
 =?utf-8?B?QXMrSzdRQ1p1YWNmMXg0bEYxeFBuVjZoYnl2QXVzRGt5R1kxOFBkSU5icVdX?=
 =?utf-8?B?UEpkRkYvcE1iZHNYOWFmZkFLckJCWlRieEQ2Tk5XVERXK01RWmtrMmxjckZP?=
 =?utf-8?B?Vlpodm5mb3Y4Q0wwbm5PNGR6enpmbW42Z2JnY0hZdUlkVnhWRUV5ZjF5U0I4?=
 =?utf-8?B?bEpYMEllU2VuMkMyU00vbE1kczFqVmwxMFU5RHA5VmtRRFUweDQyRCtZWFdY?=
 =?utf-8?B?eXJKbGtOeXZzcndMT0d3L0o3cE1DbHpmd2dCaE9zV2VXdUViNnZuSVBCa0hs?=
 =?utf-8?B?blZLUWowTzZudzkvbWVxMWI5MnhCalp6TFVVMm00ckVLWFhuWGptMFBEYnEz?=
 =?utf-8?B?U0t0QUo4VGlycUxRN2ZWR09CN01zUlpVYXd0ZDhMcEZocUVqZUNrVUlBZFJL?=
 =?utf-8?B?NmU0WXlGSjl1UVJvWG14VnNLS29LaVNGRElrRHJocHNOVExJazJRZlJKV3Ja?=
 =?utf-8?B?OU1uOWllZjdVVE5menNYUzhhb2VTTXBFU24ydjViaEZrK2JDYURUbTY5YU5S?=
 =?utf-8?B?bG5iUjQzWnplMGtJNGdYU2FWVjFtVVI5MGRxWkxrd2FPa2Y4L1EvRzlMTFRF?=
 =?utf-8?B?RjlyRGhhWFFMdWhIZDBscGs3c0JZM0UySWpEYkxJWjB6aW15dG54OVhSWEZ3?=
 =?utf-8?B?SzRqdzQ4d1ZId2tFYjZJOXQ4THE2TFpiN3NlblJaNGUxUk9keFVDQ0J3Ni9m?=
 =?utf-8?B?OEZSQTNlV3BoOUIzT1dTaEZMQmtmMTN1b3V6QWZQRzc1Q2ZSMEZhbmUwNU5F?=
 =?utf-8?B?b24vK2dCQjdtMWR5ZCsvTy9rdHhRQ1Z0ZEpsV0dUL29WMzZRUVhIdktpa3VN?=
 =?utf-8?B?Nkl1SW1PUlI1ZEhDRy9jTW9kNTRCLzl0R0VGRzBjclNSSGhHRGZBTzA0R1RN?=
 =?utf-8?B?bEZmTm9tR0dYYlNWZ0hUNmIrQ2lCc0pML0Vhb1liOFBpazJ4MFFoK0tRbFh2?=
 =?utf-8?B?OW1tNTE2Yy9maHF0TlY4Q2dLc1RaZ1FqZFR4b0RmakRXd0cyWnU4MG1HanZO?=
 =?utf-8?B?QmJRamZOaDNraUd4aXlJK2JST0N0a0tJUU5TeUJRZTl1T0RwODdPK3YrRERH?=
 =?utf-8?B?Ukl5Tnl4dk5vWG9MZXFsbnNtYjNWaEQ3bW5IbHEzZXpyZDRvaGtlZDVZeVlV?=
 =?utf-8?B?ZWJ0eExvelE4ZzFzTER2L2ljSlQwb0RnV29zOGRvdmhhN2d5cFpxTnIwNGZJ?=
 =?utf-8?B?RFNNaWhUSVZ4TStUWW5kbHhjUDRGZldtRzIrTXlFcUgvSHZxY3p3dzhhYXNP?=
 =?utf-8?B?cERmckpNelBxcmpiakp3UTQ5QUQydU1EWFUvN2hPQnNMSjEzYW42V2V1MEFh?=
 =?utf-8?B?bWdCYjNOVEYzaDNHTVZIZ0lmWUNSL2dIMEZMNlU5OFYzYjhzK0ZFNEhtdTM3?=
 =?utf-8?B?TStUdm81NXk3UlhkM3hNNWJXdXY3Mk1WcXdxYjFpTm1SSE05QXNodEJ1Sldy?=
 =?utf-8?B?Zi9DZkpENXhESWVta0d0ZDN5ZG5ZVUdwc1p0Y2JubG5UMmhZbC8rQ2k2RlZI?=
 =?utf-8?B?cG1OZ2kza2NlT0tvd3grSC80cnk5bXh1S0ZoNFBvUUNDWEpOdDg1MXU2cGsw?=
 =?utf-8?B?V1NLUmlmWTN0a1JrMWpMUWlJZWd2NmlXcS9ldUJBZklBUlF2NW9RRU04QkJM?=
 =?utf-8?B?STNGaVVSWkZTR0NSUmg3ZG0vbitWR3JyeTBzVUJzdER2UjRIbGlFdnFvc212?=
 =?utf-8?B?MEdXZ0gxNGZSc3A3OHdmcU52N1B3c096TlF2ZFNDd0JEb3hqdTNjbXdhNE4w?=
 =?utf-8?B?VmJlVXFmYkhwTTFta2dDS2ZpQnRmUlV2b0VCVU82U2xZTFpPTUFURXlWemlI?=
 =?utf-8?B?eWtKSmI0czA4eEttWWdYOWE2SzZ0THMveDRlaEJ0WHZvamNrWmw3SzB6Y0px?=
 =?utf-8?B?VHQyekM3eUpQa2xKYUNhQXYyU0NiWXp2RGhzQTIzMFV6SldJTUR6QjRWKzJP?=
 =?utf-8?B?TERpRUNiOWpqVmFuL2Ryb0hybytIb3BUYVV4Tks2bEJ5a2E0RDJGZWhnSmZp?=
 =?utf-8?Q?J97fu8hh2LlUgbaMn4SmhBw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13623e68-be61-42fc-1627-08d9a372d22a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 11:19:39.8387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j/6SLwOQfk06Q2TW+gjD1QlAnRdtaObOkTuoqzCamWL4Dq4lY4Arxs34n7cxMGnJBew8pqX0SXl2yO4VSns3SA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4605

On 09.11.2021 08:02, Vikram Garhwal wrote:
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -331,6 +331,205 @@ out:
>      spin_unlock(&overlay_lock);
>      return rc;
>  }
> +
> +/*
> + * Adds device tree nodes under target node.
> + * We use dt_host_new to unflatten the updated device_tree_flattened. This is
> + * done to avoid the removal of device_tree generation, iomem regions mapping to
> + * hardware domain done by handle_node().
> + */
> +static long handle_add_overlay_nodes(void *overlay_fdt,
> +                                     uint32_t overlay_fdt_size)

You adding a static function here without any caller got me puzzled.
First I thought you'd be introducing a build failure this was, but
it's really patch 8 which does by introducing a call to this function
without the function actually being there.

Jan


