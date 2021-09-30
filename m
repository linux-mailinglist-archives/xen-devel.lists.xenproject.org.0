Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B2441D79F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 12:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199725.353955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtFp-0002n3-1f; Thu, 30 Sep 2021 10:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199725.353955; Thu, 30 Sep 2021 10:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVtFo-0002kP-UT; Thu, 30 Sep 2021 10:25:28 +0000
Received: by outflank-mailman (input) for mailman id 199725;
 Thu, 30 Sep 2021 10:25:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lHSZ=OU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVtFn-0002jv-0n
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 10:25:27 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9209ae5-21d8-11ec-bd43-12813bfff9fa;
 Thu, 30 Sep 2021 10:25:26 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33--h7--FhdNECAqOXXf8Pxtg-1; Thu, 30 Sep 2021 12:25:24 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7151.eurprd04.prod.outlook.com (2603:10a6:800:129::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 30 Sep
 2021 10:25:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Thu, 30 Sep 2021
 10:25:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0144.eurprd04.prod.outlook.com (2603:10a6:20b:127::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.16 via Frontend
 Transport; Thu, 30 Sep 2021 10:25:20 +0000
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
X-Inumbo-ID: b9209ae5-21d8-11ec-bd43-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632997525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lcKUmlalB7FPEGLasEPn2v96X2SEhgV64/x47Ny5XaM=;
	b=iXYQgXyM/7dl/ZTA+S+JcVrVFNavpvPbOA6cnFImuZsjhY3kBtA9jQcVMbte9LlC9mPL/6
	UcvN78TPU57u9BIxodSQ4dTObmWkTKKfELYOSeupCt6VcfkF6MgVqUldA12a9MfX2KDFW7
	BDEBJQXscxlKRFonZXHtiSagGqRn884=
X-MC-Unique: -h7--FhdNECAqOXXf8Pxtg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HPQ5/4UnpE+eONtfczvsVjRYksIikTczeUnxxncADsPwfKxIsyUGoSTixOxbSBRFz6W/6iFAXfySPIT6k8q1fVCjLKLugEgjYB0dePOSFQjXDefdwHtQcHMpivTuJbVqi46BW0WLaBWuEFFi3bfU6A90XtGl9ypGKm3JG9G+ra9xdOsQ6NPBSQVLqLPo946oU19LpXZZhDmBGkGRZ2gOqonojoyaUYN20INN9TxX+w/TSnlXDuv85oI52bqqeXOedIzsjRecUrXM+UHlE1BPqES1mAb6hjN4u9kEfoAY5HyHTb+5aN10baS4rLG0iHSqTUZsmOBxWDvn760XxZ8idw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lcKUmlalB7FPEGLasEPn2v96X2SEhgV64/x47Ny5XaM=;
 b=PTp+96KP+8ehuRU0n4zwQdg1kbvdUEltu0lqoGgyR6TLn00sbgTNcY19GhZOu6wQ3sg31NYv8DvyprfBblF1pFkOKRYm/xHf0YjkzkIIITMSE9H2xyfCaYKl0EPNFNEGn/5DuX95RdPNzOr5sn9icMEugv1sgv7+1wS1gGpeE4w49HXFgP/n1UnJTQYjOiPTaHmSKq74j8F09Hf4KwrOrP03EUs/4FEQ4ZaLC71mc3Z3u/wuuN1sikfN0FX25YAD0y1wu45gzG7qlae4DEl9rd7zjhx0pxxPlTtQc2WhZEbTmy/jFB0FZgVJ0QzxrqFCc/YRVWk32NokUI6cHWCPWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 11/11] xen/arm: Translate virtual PCI bus topology for
 guests
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-12-andr2000@gmail.com>
 <2bbf1de4-75cf-4f67-a96b-52762332d220@suse.com>
 <fcbb082c-d8ee-b59c-64b9-129b20308778@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1b2098f4-a462-41b2-8273-6ade04e737c1@suse.com>
Date: Thu, 30 Sep 2021 12:25:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <fcbb082c-d8ee-b59c-64b9-129b20308778@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0144.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::29) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e334a0a0-618e-4458-d4b6-08d983fc9ba9
X-MS-TrafficTypeDiagnostic: VI1PR04MB7151:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB71510B940309F79F4B80DCF9B3AA9@VI1PR04MB7151.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ycLyrQ6YeJR0Puc3zHYN0m7EHt5lZ1ALUaIPk+UFrMztO3k1ggBzt9/1rx1s6nfaewvwcMZNHC0KfErKXQUHT8Cr9/7IUXSXByufGC0F4y8ijxKF1uMR7xv3muEV1kvwLodKP/ygBHpRVsdMyTDMRguuYfBiueisVLAYU1EqnLPShgHKSFC8pIMAEFN81ZKDgWEb9RW2dUL43LMEFgU57RKqyfxLiH3yVfMOUv+AXjLJtmI5ZOcUhfnjyRTCttTLSlHlY1GkaEKwQAsls5AIsrGNTka6clFpSXo0b/+AeQfKCmiHFEpE6XBi5u6XUA1nzlKsqUMJ5D6PM564XCUHYEOv0vrPegdMvnVCWSehWOSrX1iKqx0zPQak8x0YYipvHNYi7hjrGr8YbBS9Ht0cUSMrz58yDggfRt+fMT0SakXsgh7DVNFOgSmR7DQxYA7GI5ECqDNFeKZbxdiTrPnDxhc5KNDfkSKwTCFy/LHTqluPuMt+oSEk8SnoOZh3bMIyM/fezod3mfNEPCGjdITbYMMZAtO9xuQE0jnrCJ5SdtUQsK2AswJo/XCIcGl4wzMfaz9YedQM6RLw+e4qYcQVrRScCJ5716oc+JTshTpfukGYe0zYfJbnkJh9y1U41ZhjHgvbZ29QHzZwrinqgje78KwluaOAeptYsWpKgSvuvOQIC+H2Uczga9W3NklYjGK8oWXVtl/iUH9OIjTaPmI1hUg1NZgqn2mXd9UyvExfbyI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(31686004)(6916009)(83380400001)(7416002)(16576012)(316002)(2906002)(38100700002)(86362001)(54906003)(186003)(26005)(5660300002)(8936002)(66476007)(66556008)(31696002)(508600001)(66946007)(2616005)(36756003)(8676002)(6486002)(956004)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlE5eDRYWkFtZzNkM0toTVhVOFN1Qm9SRjc5aGk3aG5aa1UyNHhHMXlFWFdi?=
 =?utf-8?B?WFZ2VWtjT2VNaEhQeDdGZXZSOW1sM1JlZUxETHJZdXBEMm9XckxxSjl1OWFD?=
 =?utf-8?B?NEVVcHh4enJJWUVjWVh4a3ROdlovQ2Qvd2YwbDV1T2RmS2FKQnlNUWdBdkph?=
 =?utf-8?B?YVdtTmM0UTQ3UEpzZmhzVUdTNFpmT1c0S21JT0VycVJPSllZOWE0V3NoZm1Y?=
 =?utf-8?B?aytjUjBZbU51ckVCWm85dzhUUGdTMnVlSHowR0tONWV5MzZQSm1IL3NROXNG?=
 =?utf-8?B?bGJYaGIrRk0vbVVrdXhwWWRHS2Q4eno1aW92MCt5eS9YN0d1cHA0N2VKV2x6?=
 =?utf-8?B?Y0VRbXd4MEZMM0Q2WGJwZ0FpUy9oM2N2SjI2K3RPSVV5OTdNd2FQK0xKMXBs?=
 =?utf-8?B?dEt4U3ZUR1hKaDZjcU00OGNpOUdMeUJYRjNONkZ2cm5mYUt6LzJFK1FZUVFQ?=
 =?utf-8?B?L0RaZVVKaURKSjNCRWl0ek8xMEVGOUFZblJseEVlVXNEbktZYjVpcnhpdGN0?=
 =?utf-8?B?ZmQyNE0zaUNvU21ibk14MEJRdXBYcVdtTVptcTRNZ3lVS0t6QkI2enByM2J6?=
 =?utf-8?B?djBtOStCb0E3RWdMd0tzSDZyYVRuZHhHcGlvazZkdXdWZGNOam5FdHpLZU9r?=
 =?utf-8?B?NWhIUzhYNEhJZUZPbUE0cGMvNHd0eE16K3hBZDFZU3p2NUtBZG9EQnVqV0VG?=
 =?utf-8?B?OGJYRnlQSmFCSTEreE5tcm54Qm1MRDkzREVOdUIzRVFsbU92a05zM3psVm14?=
 =?utf-8?B?NVNMS2dhN0NmMU9RWjlNUGlSZGcvS2lFeElQM05Jbm43L2sxRmVDa2xjTE5s?=
 =?utf-8?B?cExaeVlNVk11T0wvdUZaZjB4dTRQYjVVSWh0MnErRTlYR0JMTGUwTEk5WDY0?=
 =?utf-8?B?azZ3TEpkdG9JZHlLdjR1SU1IWFBNaDBrTjlIalo2ajJOVG1SQkcreXVNZXcr?=
 =?utf-8?B?aUlzMVRaY1JzcG9Od1JYZ3MrL3FwWVVpZ2p4bXg4TDZrSm1FNXRqb2M2M3ps?=
 =?utf-8?B?bVBuWC9jYXdIT0RIWVJ5R1dBQkFLK0Y1Vy9xcG8wUnVaN0UzUWc1ZXRWeUh0?=
 =?utf-8?B?MEFNVndTemtocWlaWTdrVFdkWHBSQ2NYUURFL2hmR2cxWVE0NElCQ0lhQ3Vq?=
 =?utf-8?B?SGFCY0ZTbkIzK3N6aW1TbGdZemRMc2l4QlRZTVo3ZTh2NUFCNTdYNjZxMHRu?=
 =?utf-8?B?RzZ4UmVhcDQ1MEsySk1NeE9tbUxvYytTR21STUl6bkV3a3hJQ1NFcElkSjZF?=
 =?utf-8?B?dDJncHNYWllHZjlpRy8vVFBLWVRUN2s2ajVPRkJwQ1E0d3Vib0hJeEx2TW1t?=
 =?utf-8?B?Mkx3VjNhY2FvdGNpNHlySjhFOG1Hb01DNUVEWEFVdEkvODdaU2JsMzRXdWFr?=
 =?utf-8?B?c0NMZ0xjb20rNDU4VHNRSUVNek9xQ2hTWnREOVZ5ZFp6NU1XWHFINS94Qm5C?=
 =?utf-8?B?OTJGTEVvVG1SYkVibWhXaTZrcno5SnRzcU1QbUNrMVRTcHJQZkM5WFJYVHlG?=
 =?utf-8?B?Wk5WUWpnTnZ3Tm9STERyV3k5dllnZEtkaVdzZHRURHJXVTlhWnR3ZXV3U2Zl?=
 =?utf-8?B?OXlJMm9keEdobTNhT3RjM29BQ1lTMkN1bUhIRlRHelNHaWxHUUhwS2syKytY?=
 =?utf-8?B?czlyWXJzV0xKamxFK293bTNQWTBmYm1ya0liL1dRbHJ3d2IzQWFDdU90UUI2?=
 =?utf-8?B?VXpMSnN5U2M5NU5SaEpWNDFBcnRmMEV2aW93YXQvcmxId3hGZDYzMGhDaFNu?=
 =?utf-8?Q?1MEr1XJWQw8UNCLDDKvfM6Q9+waFmHAGgXBKksV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e334a0a0-618e-4458-d4b6-08d983fc9ba9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2021 10:25:21.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2XpHs/aqKbOAUEAWVRxT/+Uu2vRWpgz+ZTNkIT3Q8aORA5VDnNAHmMz1qkko+m/aKzaQjJbsZqa3bVOjls5cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7151

On 30.09.2021 11:35, Oleksandr Andrushchenko wrote:
> On 30.09.21 11:53, Jan Beulich wrote:
>> On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -889,6 +889,31 @@ int pci_remove_virtual_device(struct domain *d, const struct pci_dev *pdev)
>>>       xfree(vdev);
>>>       return 0;
>>>   }
>>> +
>>> +/*
>>> + * Find the physical device which is mapped to the virtual device
>>> + * and translate virtual SBDF to the physical one.
>>> + */
>>> +bool pci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
>>> +{
>>> +    struct vpci_dev *vdev;
>> const (afaict)
> Ok
>>
>>> +    bool found = false;
>>> +
>>> +    pcidevs_lock();
>>> +    list_for_each_entry ( vdev, &d->vdev_list, list )
>>> +    {
>>> +        if ( vdev->sbdf.sbdf == sbdf->sbdf )
>>> +        {
>>> +            /* Replace virtual SBDF with the physical one. */
>>> +            *sbdf = vdev->pdev->sbdf;
>>> +            found = true;
>>> +            break;
>>> +        }
>>> +    }
>>> +    pcidevs_unlock();
>> As per the comments on the earlier patch, locking as well as placement
>> may need reconsidering.
> Other then that do you have other comments on this?

Iirc this was the only thing here. But I haven't got around to look
at patches 4-9 yet ...

Jan


