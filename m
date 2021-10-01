Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B53A41EE91
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 15:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200612.355147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWIYs-0008HR-LA; Fri, 01 Oct 2021 13:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200612.355147; Fri, 01 Oct 2021 13:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWIYs-0008Ee-Hq; Fri, 01 Oct 2021 13:26:50 +0000
Received: by outflank-mailman (input) for mailman id 200612;
 Fri, 01 Oct 2021 13:26:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KCT2=OV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mWIYr-0008EY-N9
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 13:26:49 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67ccd2e3-a35b-4d06-9cd6-7034d837dc7b;
 Fri, 01 Oct 2021 13:26:48 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2054.outbound.protection.outlook.com [104.47.8.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-X-5VjzGRNQ2-bNzpWWd7rw-1;
 Fri, 01 Oct 2021 15:26:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5327.eurprd04.prod.outlook.com (2603:10a6:803:5c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 1 Oct
 2021 13:26:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Fri, 1 Oct 2021
 13:26:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0056.eurprd04.prod.outlook.com (2603:10a6:20b:312::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 13:26:43 +0000
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
X-Inumbo-ID: 67ccd2e3-a35b-4d06-9cd6-7034d837dc7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633094807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXYUFjcGJFQCjxv4Au0IkJJBheckl/vMH4V+bUlEVUU=;
	b=MX5floONA83MwXeQCPDPkIU97pR1TUu5Wvqmr3UIBJF2Bl3fc5JDZdBEUMIWqXh10buJpH
	4i9O+x1wiyl35Cv9J4SMZLxXjjfz+Z3IGAy5k/BR31PakWgeTQORQ7cPBOaYPAzYWCZeab
	PzvipMy27WSJUouCeqg12yDE7m0/RlI=
X-MC-Unique: X-5VjzGRNQ2-bNzpWWd7rw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFXK3gB9xzb1aJK2KstEPu8el19w5K5boCJiF2U/Z1StXt413/6lmIftG27ZA0N2xtdtb4LM7eW1bYSzxX82KeZ2nZwkLYjgmzp03himKP05aRZppOUSaVXSN0nCOrD0Oo4Xb2wJnWB3pGCkelS3BEQih0Pt4+qHsnPNL3XZNlyiMF5qvn3QAe269wqqg7tOOhUEnTLWaAVyuZQ9myIqziVq/34IWnOFPhgEnFKIF5VOaxWmFjl04ZB83jnGWvZ1S2W5Q14D0SwR/ly330wTa2IV322v3WEMet9mQ3vTbcJ3K84zbRI4ui4JY2uyaH/AhZGhrWLcyAjSuuLpQX4bdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXYUFjcGJFQCjxv4Au0IkJJBheckl/vMH4V+bUlEVUU=;
 b=GI83HN3xHdLbj0Rw9QDNvciXOshYaqUkXWo0spdqnhXg0+44h2inKVpWu+mStgDNtXaR3tGUoWAj2GCvZG8DFJfZi8JCsE8S4Woe03sO0XwiXVBFlR/GOw/jFCDnw1yZwL7ZkLsJ4N5BaBSoh6DywODi8yBcW9fd+59h5KbX5wbM2/uMdYxV+wHMoHMVnZ3x+HVGmF4I7FvttVEj1a0eCDN+lS4rWy85GM93BKSpU1sUS5iGOUzZeorbkR7v4BmAKw95EqfCU/4j/d+48yTar+aGfMZk1vdHZD+kqBD5pC2RaxGK9wYOSqOyRFaxQMBuAVT5kcZplaSyMUov9fnBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 04/11] vpci/header: Add and remove register handlers
 dynamically
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-5-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b575750-83a5-588e-fd6b-dd9cdb9500dd@suse.com>
Date: Fri, 1 Oct 2021 15:26:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210930075223.860329-5-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0056.eurprd04.prod.outlook.com
 (2603:10a6:20b:312::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d352f913-2c81-4481-571f-08d984df1c95
X-MS-TrafficTypeDiagnostic: VI1PR04MB5327:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB532716E9184BECF36032007EB3AB9@VI1PR04MB5327.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AvQjgvFNIvZ2CHLPR5SyglB50dD2fLW//9eik4BV1jdd2l6pDjSZAsb2jkWeiFmEYQOSIRCtYruC5iJhPxNEf5mVhL4WH7aXPcpcoKJ/dTBQQTakKjLfh7U9skVBLl5sQySQydQa3tA8me2UafE6Fkier2uuN13XCKnLXkuSwcTe+IKlcTMB9iTlW57hsAmtlvGW9ri9ZAd5VHKhtMyJSGc2kKdV2NHdH4mvhbRNOm0SCc3LFlHq4XrrEGzs7qBQYxXxGzJKqQFQlsO9kstbEM5s1U2T6Flw1i9YGYCoN17QCXLBi7ETnirYoI8quvJIqkhJKrJDFky0n2lQYDPcdhg3LlC0D151qxdGouT5d5XZwGyp+zvv7N1yn1x9frudY0okHgj159TdDmG1es4p46qD4LmE1py7iqnc5h07YcRJ01E8Qn57dn5e/ytGvgkG+h3phq2lVsicacfiCNonJRUQqALXWGd1jk18m1H751mG4wbXsiJsJyQye8spXYaDCHQ/qKc5gOkCldakoP8rGFenY04IL9v+A+kF+qOy73y3ckdPgawZl/sCZ3ocUzDC70yHA6YVjcQ3P1vIx78LS05EhqPLxBCdqZz7FOxt7P/qq8Jv1wNhFjUTn/PBbsup13hY5PhXAkmbKdvJY3eethj+MqLvcge2ZjXAZxTLTeOg/XXc1+l7B/TBqNh7RPdRFBTn53n7Ks/n9p/tN1d2dlZSDTElTDcJB25yW0IOAvMZabhYOCTSiu4if94DMY9g
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(53546011)(31686004)(5660300002)(8936002)(2616005)(86362001)(31696002)(7416002)(8676002)(4326008)(6486002)(26005)(956004)(6916009)(186003)(66556008)(66946007)(38100700002)(2906002)(508600001)(316002)(16576012)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnpLcFBmWlNKYkVtQ25aN1NnMmJ0elJxMUFoeGRhY1VtYmgvekY4SDZWc1Iw?=
 =?utf-8?B?cnU0UjhBR3FFdGx2Sk9jTzdhdU9BNzVEb1R6S040ZDRMWGl6Umx6N1pmOFFl?=
 =?utf-8?B?QlNKWlh5dEhCbXQxYnJubEsvMVZQNWE0SUlUak43ZnZ1R2s0VWg4ekNmTTI1?=
 =?utf-8?B?c1NZaXF3bGphdkpxbWg5TUY3SXVXaGw1RTFsYzZyWEVvZnJ2Zkd3RkEvSkpl?=
 =?utf-8?B?dHVnUEZIMmU5K2dyTzRSU3ZiUXJWZUFIZXlFZis0UXVxR0MyRC9pU21Ka1o0?=
 =?utf-8?B?QTBPaUMzdjhxTnY1cG1ycTRxR25ORDRMbHVsaEMzbkVWTldwYSswSmM0aDZT?=
 =?utf-8?B?bkkyQjJKODJiRzY4SkRDOFRWM01RMmlwRFpUUG9KTEpJbTM1czhhR3VBOUc3?=
 =?utf-8?B?Qmh4REk2VHhvK3U0dFgxTGw5d2xpRjE0S2NRRGI4bHZEeWcwaFFWbXBSdXZU?=
 =?utf-8?B?NWpxcDBwZjcvekhHOFRxUGUxc3ZMZldFa3BwN29NV3J1TmRpNnBmdXM5OTdW?=
 =?utf-8?B?QVNuTDRoTTJ2RWo3SGVreFMyZ0FTRUhnS3ArcUZTVzNzOWxVSC8yc3hiWDNJ?=
 =?utf-8?B?R0NkdG5nTG1UZ3h0YkZZTlNxa3ZVL1VlOXRpY2EvN1k4QVd1TUMraEM5OE41?=
 =?utf-8?B?ZFRaVUo5eFZDSW10dlEyNU5Ha2cycFVWeGEvZWRNMjJNSHExWmM3bUthand4?=
 =?utf-8?B?MENMM1dpanhaSkd4VWNHRkdRdnJyeDJmR1VqTHZXM2JkbTZFdDFDdDJmRUFs?=
 =?utf-8?B?QnJzQ0I3NituOFBVOUowUGtpTDZ3a0lyWnhERndEdXZvS25uVllKTVpudjRE?=
 =?utf-8?B?QWhVZG1xYzU5OTl4aVk2UlI1ejVzb2hkYVIvMnhkOGNPWUYvNWhNQWtpUVVG?=
 =?utf-8?B?enAzaEZTUmEvZ0Znd3d6OXpHbUw1T3QvQkRaQVVSUjVBNFg4UFNHaWlIMkg2?=
 =?utf-8?B?MjY2dFhZTlJYWVplOTZGREV6QnEwUG5veC9abTBSVSt3LzZadXYxbys0QTN1?=
 =?utf-8?B?S0ZaMmdRczFYNHY4bFRlQU52YnFCQlFEVnpWTmdERGRuWjdtTFEyam5EcVBw?=
 =?utf-8?B?YUw5bW5TVXpLeWRKT2YxbG5nQzVibXdaRXd5Rml5OTg1TzYralBJRGt0a3Fo?=
 =?utf-8?B?OU5hZU5IM1ZUM0pFVk1zZmhWQ29CQzk3UE55MUR3M2gxTFAxZVFzQUlBekE3?=
 =?utf-8?B?aDZ2ZTZBRGhWUFBaWk01UHFtanJvaE4ybmFzVy9INk1LQlF0UzJ6WjQwSFlq?=
 =?utf-8?B?WjhJci9uajVBL3N5VG05WU95WTVMNGE1b050d245YVNyY2pvOFJ2d1pZK0dC?=
 =?utf-8?B?YXMvRFJsZk9qbndZbUpYQ3NSa2ZtTmlZOUIwQU1lOFd0R3UzdWZQMDFKanpT?=
 =?utf-8?B?SVNpRGxCV3hCV1pWdVpLc2QyV1pQUEpjTENoN0tVTmlDS2s3TkVlVXBmeEUy?=
 =?utf-8?B?NDFFTEFmN3FQVlJYZmM4N0dxWmdDb0NYTCtsbmFMeFBycUs5SjRxeE5uOW9Y?=
 =?utf-8?B?WEwranplbmpRK0YveVZxb1BVUUV3aDR2Q0ltQ3hRbWlDeDFCczJhdWFBbVlw?=
 =?utf-8?B?VTAyQi9mekxRV3p4aS94cHVFbDBsZENENWR2UDBrWWx1MVV2eEc0RFhNNHlF?=
 =?utf-8?B?N0dVZlNEdE5JVFNNNlMyL1VpRUhhaDFLQy9JNHVxaThSQ2VTZmlubkNmNXgv?=
 =?utf-8?B?bVpXbWU0M2NOaTRkVjNvWFdmUEh0ZG1yYmZSMCtadXlmRm5wTGpJZGtxcFo2?=
 =?utf-8?Q?JXGJn32lfLWYpyK9VmcOg2ehhLnE9K8wdtYq4qh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d352f913-2c81-4481-571f-08d984df1c95
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 13:26:44.2837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fs5qXrJVhelOftrTNrFybAe7Q6G/MQV43trbO0YW0yYfuutdwdBCKpF/483y4ET9W98ofRCTST5NWRynvyhKzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5327

On 30.09.2021 09:52, Oleksandr Andrushchenko wrote:
> @@ -445,14 +456,25 @@ static void rom_write(const struct pci_dev *pdev, unsigned int reg,
>          rom->addr = val & PCI_ROM_ADDRESS_MASK;
>  }
>  
> -static int add_bar_handlers(const struct pci_dev *pdev)
> +static void guest_rom_write(const struct pci_dev *pdev, unsigned int reg,
> +                            uint32_t val, void *data)
> +{
> +}
> +
> +static uint32_t guest_rom_read(const struct pci_dev *pdev, unsigned int reg,
> +                               void *data)
> +{
> +    return 0xffffffff;
> +}
> +
> +static int add_bar_handlers(const struct pci_dev *pdev, bool is_hwdom)

I remain unconvinced that this boolean is the best way to go here, but
I'll leave the decision there to Roger. Just a couple of nits:

> @@ -593,6 +625,30 @@ static int init_bars(struct pci_dev *pdev)
>  }
>  REGISTER_VPCI_INIT(init_bars, VPCI_PRIORITY_MIDDLE);
>  
> +#ifdef CONFIG_HAS_VPCI_GUEST_SUPPORT
> +int vpci_bar_add_handlers(const struct domain *d, const struct pci_dev *pdev)
> +{
> +    int rc;
> +
> +    /* Remove previously added registers. */
> +    vpci_remove_device_registers(pdev);
> +
> +    rc = add_bar_handlers(pdev, is_hardware_domain(d));
> +    if ( rc )
> +        gdprintk(XENLOG_ERR,
> +                 "%pp: failed to add BAR handlers for dom%pd: %d\n",

Only %pd please, as that already expands to d<num>.

> +                 &pdev->sbdf, d, rc);
> +    return rc;

Blank line please ahead of the main return statement of a function.

Jan


