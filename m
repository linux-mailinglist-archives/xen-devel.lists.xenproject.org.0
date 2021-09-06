Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E953F401CD1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 16:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179979.326451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFLl-0000Z2-2O; Mon, 06 Sep 2021 14:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179979.326451; Mon, 06 Sep 2021 14:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNFLk-0000Vw-VT; Mon, 06 Sep 2021 14:11:52 +0000
Received: by outflank-mailman (input) for mailman id 179979;
 Mon, 06 Sep 2021 14:11:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WUJr=N4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNFLj-0000Vq-HB
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 14:11:51 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60bd661c-0f1c-11ec-b0a8-12813bfff9fa;
 Mon, 06 Sep 2021 14:11:50 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-39-g9Zj8tjBNdOf4RIkj_6ArA-1; Mon, 06 Sep 2021 16:11:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6302.eurprd04.prod.outlook.com (2603:10a6:803:102::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Mon, 6 Sep
 2021 14:11:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.025; Mon, 6 Sep 2021
 14:11:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0009.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Mon, 6 Sep 2021 14:11:43 +0000
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
X-Inumbo-ID: 60bd661c-0f1c-11ec-b0a8-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630937509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wk5cxx/2uXDEEOICbmsgCL4++M8We3UgJBTequBverE=;
	b=PyZimjdsg7KnKY3N6z9iRGAQkkpXopFnR4p01R85vbfIsSeIUYso/JPfzq5kYZErt+R+nw
	WYKviCGWffwIntw52Go3zhI0NHd0gd1ECS/bmm2iX3jY7ShBpULX+lxSt7Tn2gU6qnp7s6
	0KJeVHPdHO7tM1O79VNeJ949sSmbj8Q=
X-MC-Unique: g9Zj8tjBNdOf4RIkj_6ArA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZW2PYW0XbiG3aDIDg+hQ19vOBv4fnmnjGXayQrUFvRkxfZ/FzRDHSblJMs2hrF6flgYnY5THKFjpIn1oPulDbHZl5egkIY3kAtqLEYGCYHtmIBLv/0x6vVjqjwfu76kncEJHUaGonWSyvypMcKa7wh12p7qoWbsUcyBpb62gkAGHow3iJqqPsfTM6XmZe7RgrJxQhLctDlLqjv2jxtmGQ9le2Hyvzlk29J6OIVsaflqTUnqSYYdHXlj5ySx99C9odrGPqSP1Dpsi4bh8DE9oy0/LMv/zIZh4rwg7Cjg0xhKF4o+sVgS5tSWMYIX9Dr6pmE+gkub+LUFu6jzMUMqn7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wk5cxx/2uXDEEOICbmsgCL4++M8We3UgJBTequBverE=;
 b=JY++zwrXZ0+4C5WT5U9jIgby+YwDfgNw78aWSOd99wQ89otkjr35/AozkHEcNnOnxjXB4e11e2HcCnfKVOsfSQ6AOnA3vnmQD8kKzSmWYWWdPplKM9U/eiasSsEb7lcy+fwu1cUGJ6W/7mqJQtG6Jn7QeeWsLXHZCEg/cnV0m4Gbwr5C+VGrDpQYhsDss6fcWNKJRLBL/Li5uNO/oaIxaytjemykk12009zqKP+sJpq+YKs2hHzrc66gp9sbw+3m9GC7m6pJmirhwxxx1rmFe5iiVm0yyhvKU58g2HyId9Z8g9YnZBnwdW6dzOTqKfQ8tRspAC0yAdZ65Mi1mZzMKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 4/9] vpci/header: Add and remove register handlers
 dynamically
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-5-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8bb58d2d-255b-96e9-50ff-529985c655d5@suse.com>
Date: Mon, 6 Sep 2021 16:11:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210903100831.177748-5-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P193CA0009.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf17f6f0-582d-4da6-60a5-08d971404192
X-MS-TrafficTypeDiagnostic: VI1PR04MB6302:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB630205BA4619EBFEECC5FA75B3D29@VI1PR04MB6302.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gJbQd3rKPYaaWwN2SXBZhLFsr3D6TNULu2PxXCI4Lj3Jh+b4ZHuNMn9aB7lQdcP0aa77N1BUGsm1kQMN3gAe6SQ+tSZK9d9bVx49kq1F+mAcYUgGrEqtgbbt0sNAwj4YXd7w6a4TqWx0GXBwB1/8SO9WFJ2GSTnPviM/0kpW25D2R78VWuX/y74EIxZsWS2fxCfVQUERpEa7mdYWAbB2LLRbQdmPv7iTguovJ4XLsppI/Q/jbRdlNX3VuuVL5GPzf7jkhmeuFu5hXFcxbjrcAWICbjhuM2aPoVyuydJXkrMsWGtHir84c508w3oVgPkw0ZNRzUDxsWPJA6QrlExw3/Ot0tGr8EvNGGdXWVnVj3WhMyoAZXY7IgiosDteEV7xbS+PyVXrcR7dHyoXU0aGtYeS4hf8WkIQpLoUs6nnGncHkIbHlO3GSyVN4Lq0HYQn8Uq26W5YLATdHm28rvlaQ9FzlI4O/arev8kO3eZ9hQPp4IwtQzfQFjo0r5JSjl1M0tOnGGQ5o5BntJpcxCu6B0K0ii8dGGZkFb/33hZ3E2lvsR0aKaiqESItEY8pX/CdGnu2nH2z2StMVk/cejRynJtHNnQymCXez+Zp5Rsv9ZdZzLNTB1UKQwuzIUFVdxxpQKjbQrfhRnQ+2Jp5XVdhjhTjZAod6jsrU0VhcuPTlkEKoXiSPUnfebg5pOmg5PvPivyRbvypkpvyXOKxkrBqTx+kUcOVqAXl6nzmtzkS2PY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(396003)(376002)(39860400002)(31686004)(86362001)(26005)(16576012)(186003)(6916009)(478600001)(36756003)(31696002)(4326008)(7416002)(5660300002)(2616005)(956004)(316002)(2906002)(8676002)(38100700002)(8936002)(66476007)(66556008)(66946007)(53546011)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWpTc0FqdVVTT29EM3R0ZGtLOGNOSUVOOGsvY00vai91MmxSeEdDOWgxYWI0?=
 =?utf-8?B?T3BqR1p0K3hnaUM3czI1K3E4UWg5ZnowelhCRnQyMVVFeFkxK3ZKdHBPcEFF?=
 =?utf-8?B?cEw2bEJiVjlUT0djTHczTnFRNWNYd3VuNXFvbVBWb2dKY2Z0anFPYmFYTUsw?=
 =?utf-8?B?TmJMcVdTYndsbGJrYUQrQ1lvR0k3RjN0Ty9FNTNBT1RCeXUwN2tnQW5IdTNE?=
 =?utf-8?B?WEJhUVpLeVFVb3lDRnVTeEtSSFNkak0vM1RGcWNYcnJiUnpNUUNnKzNybWhV?=
 =?utf-8?B?SVM4V0RKbmpDdTltM1V5bW5ScEliL0JvUVhaV1Y0MHB2a1Uzcm42MEltZFZP?=
 =?utf-8?B?NkRpQzF4S1RNT09qSkNhSGowSTZMUElvUlJHNlRQbHFQZzl0NDNIVHUwa3Zn?=
 =?utf-8?B?cElqVXV5bDNlMEt5aDE4NnBOaGtpMTNkOTNNVmtXMlNXb2orOUZ0ZXhFeWRX?=
 =?utf-8?B?ejZNOUpENVBvcUNtRUNQYldIZ3pXSXl1ZU5oZ2ZZTytmU1pWUk4xbkt0VEhs?=
 =?utf-8?B?V0N6QXp1MWM3QU9QWTBjMExCQTRzd3dSeG0yK1JyNVdkcmVNa09ZMmRpdnpy?=
 =?utf-8?B?R3Z3UVFldHRoWmxhendsclRkejFaNUZqZno4b3pxZU5hUzM4RUdsbXZvRkFH?=
 =?utf-8?B?c3JRWnZZdHYzWGljRDQ4Rnp6MlZqb2xHUFdwdG03bHR2dkNCdnFyYSt6eS9P?=
 =?utf-8?B?ZXZKZHhsNCtGNmdjRjMrQjZPdW03L29OME55SDd0RWQwOEZxS0ZBc05Ob0c2?=
 =?utf-8?B?N1dDenVOUmQ4VEZPcjNqcmpQVkJPMnZMUElvMnl1WXRVeGt6RGk0Yk9kM2RF?=
 =?utf-8?B?L1RoT2paTVY1b1BDbTBKZDhJbWdQeEVWR1RDN0Q0c2NlcEJkcEpLOEtPaFFH?=
 =?utf-8?B?Tk1CRnFUdDhrdzkwMkFVei8yMkRRM3h0TUtESnhEOWpYbVcwTXB5QTlBNk9M?=
 =?utf-8?B?L3VSUkVGbTJKZXJEbHREZ0oxbGQ2QjhITFFJWGpISkJZVlVybHY3dkc5bHBj?=
 =?utf-8?B?Z1M1ZzRhU1cvcEF3Mi9FMHlPUEluSWRwMmFwY1NxcldqZm50NURlNlByOVg1?=
 =?utf-8?B?Q2Z2QkhrbWlWWVlYb2M0SEt4NStheGV3TlBPbmdDNzloVFFGNVNrWFpjSHAr?=
 =?utf-8?B?Y3ZjUGtGWGl1STNMUlhQNzZsdURSVW5TV0JxY3NkUUZobmFaQWp6R1NKUkZC?=
 =?utf-8?B?anJ3UDBQVHdPclVjbGJyZjNVOUJhZHMxZFRqTEpISWdIM2poVXo2eEhBR3hC?=
 =?utf-8?B?ODR5Qk8rWFFRakpaVytsdy9Bc2JxTy9KMVJEMEN5UVQ2Z0Vwb2Y1OTFjYUZa?=
 =?utf-8?B?ZThkbTE2eGJCYnYxaHZsWVV3UWdQTmhVUTZ3NGpFallNejJLNWtDQ1BqWi9S?=
 =?utf-8?B?bElGcTRxeTZyenNlZk9NUUtDOXNZV2pNRWc3VndyYllrQ0kweEVaeUVxb1ZU?=
 =?utf-8?B?WktOeTBuMWxESDlnRTUyQ0NjOE1LOUxVRTJaNHBaSG1wMkFuSDlGOTd4dFFS?=
 =?utf-8?B?MGtEZWRJWmxLVTF2QkxDUWhlYzZUZEdZZmcvalpLbnZxUlpVbmg2djBoOWp3?=
 =?utf-8?B?VmUvZmhBZ05VZm9KTnlpYm9xa3QzWUo2VGlIYW44enJPeDQ3TFhEK3ZFaTVz?=
 =?utf-8?B?eFZLNTgwczQ2LzEyTEdTdjMveDF0cVpscHlkWWFpZkdDcW9GVlB3MHVrYUhS?=
 =?utf-8?B?c0VROGxPbXRya3NYbStyTG5iY0VYUzFMOEFDaW1pMUpUbWtJSS80bmFXaVNI?=
 =?utf-8?Q?4q7q/urLMEpl54WfPpEquZYTNFVwPuZ7LLRn8Mq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf17f6f0-582d-4da6-60a5-08d971404192
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 14:11:44.3472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlnpXi7VmkqPOlu5/3GlsTfGtmk3snBG/srXujd2aGIKInQvQltI+Ox5S0MrN/kjfxcWULp9otJj+XIkqjiXCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6302

On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
> @@ -593,6 +625,36 @@ static int init_bars(struct pci_dev *pdev)
>  }
>  REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
>  
> +int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    /* Remove previously added registers. */
> +    vpci_remove_device_registers(pdev);
> +
> +    /* It only makes sense to add registers for hwdom or guest domain. */
> +    if ( d->domain_id >= DOMID_FIRST_RESERVED )
> +        return 0;
> +
> +    if ( is_hardware_domain(d) )
> +        rc = add_bar_handlers(pdev, true);
> +    else
> +        rc = add_bar_handlers(pdev, false);

    rc = add_bar_handlers(pdev, is_hardware_domain(d));

> +    if ( rc )
> +        gprintk(XENLOG_ERR,
> +            "%pp: failed to add BAR handlers for dom%d\n", &pdev->sbdf,
> +            d->domain_id);

Please use %pd and correct indentation. Logging the error code might
also help some in diagnosing issues. Further I'm not sure this is a
message we want in release builds - perhaps gdprintk()?

> +    return rc;
> +}
> +
> +int vpci_bar_remove_handlers(const struct domain *d, struct pci_dev *pdev)
> +{
> +    /* Remove previously added registers. */
> +    vpci_remove_device_registers(pdev);
> +    return 0;
> +}

Also - in how far is the goal of your work to also make vPCI work for
x86 DomU-s? If that's not a goal, I'd like to ask that you limit the
introduction of code that ends up dead there.

Jan


