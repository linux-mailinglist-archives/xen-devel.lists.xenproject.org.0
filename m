Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF234A94C8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 08:56:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265126.458429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFtRw-0007eH-TT; Fri, 04 Feb 2022 07:56:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265126.458429; Fri, 04 Feb 2022 07:56:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFtRw-0007bt-On; Fri, 04 Feb 2022 07:56:08 +0000
Received: by outflank-mailman (input) for mailman id 265126;
 Fri, 04 Feb 2022 07:56:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gJ0=ST=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nFtRv-0007bl-KP
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 07:56:07 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e83ecbeb-858f-11ec-8eb8-a37418f5ba1a;
 Fri, 04 Feb 2022 08:56:06 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-7-KXk5w3xJOO6xLu8wBRx2kw-1; Fri, 04 Feb 2022 08:56:05 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR0402MB3762.eurprd04.prod.outlook.com (2603:10a6:208:3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 07:56:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 07:56:03 +0000
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
X-Inumbo-ID: e83ecbeb-858f-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1643961366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k7GYhuJCbNjhx0WIlcWn5Rn1mDYkjm0tooRLJ8Lgu4U=;
	b=mgg0t7SaZFTzft2sBD/xoWePeD2BDjX6VltL5mb19JBTnOv/rT2Lra/b2YelL3LhiGtCOW
	TxrxxtJW1fX1OBeZL1agB2g7CjZ+jViA0UtqkQNfH9NAA+E1f9c9k0TA0nAIZDHS3qm8JF
	Nz+YHUB85cVb9kbqn9f0WEUQfe2dx2g=
X-MC-Unique: KXk5w3xJOO6xLu8wBRx2kw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hmg68HKQ/927D6fcprksQCtrSIb3HekjOyb6Lz6hQXEx7ir5fe1LVmz7jY80JpAIX6WuutLZdNRtJzBmIECQMm3suxVSwECOUtQbdOaBxOIqQTraKg9vbTY+xvH3Cn24Q5hqR7zAKDNo4UqqhBg8lT+C3X6lAnB2L1qaFAZJ4pmPUXJYe7GhNdIB/DahHE3G52uCVGTEG7ry/AzYo5akA3IV5w2Ok7oOz6W6StosQ6otLFwU+jufDthCGVasXqvzTZuyZwPl6IYij2LE+VaQQ0i/GjdKeyh+0/N4jNPEPv+tGFSboB2P0bS6MwDry/3j0cwD673wnA2wcO0rKTFZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k7GYhuJCbNjhx0WIlcWn5Rn1mDYkjm0tooRLJ8Lgu4U=;
 b=K5Mxae1F1R6liyBvmEXypYgRXBWkaXJ4tuvxqjHCjRc/I063RNuSghP9i1cITuO/BfWsbLyQpcq4AdKYQJRwdG8DXcBJQsZ/bN//UxQW6JHgI5v5mCqoNrHOM0jFQxY+ZOKrKNjZuzQ+9eTewRP4KNs10raOYqlaFmGaSOv9GUPtxuJav41HvatWMlfwlH8L9QnaAxwDc1eTuq6nbsERbZO5rtXJWGb1B75UNK32fLY/yYQM5zf+BsEKWiyyK1SDj7hu4JxIU/At8q0vaOCz4+H0Ebufw/UmiWtLmRe+3uZCutJMxMjCsoIV2NHECFrLziQ/WY6daaJYCrIA1cbPmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c8de0575-b2c5-48cb-c579-e1d2b7be5bd0@suse.com>
Date: Fri, 4 Feb 2022 08:56:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 12/13] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-13-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220204063459.680961-13-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0017.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69006095-aaa5-4cec-7796-08d9e7b3cad4
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3762:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR0402MB3762A341ED5CD1E4903EB99BB3299@AM0PR0402MB3762.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TmXJCQed/U8bjvnDVfX9Qsl8gQLxsWmAALwKt8c3n00+m8pwYJiWVCnFOoIInzj0tl8r1QI1tzY4P+3SJyBCiFQFpZEahojQDPOAyi4Av72sQa2gvyv5Svx5hcCwPrMbEg0sTCJZ64E0VqRDlUsfLrRp7p3hU+XFUcsqTX27pAgskiPQUd/daQtZSRS8BSjpht2TlfS2lQcLgq/Uxbo/O2SmHSP1OgCPGYX8/girnfy2iTrZgVk2X8Q0MdhHp7xxD5QtPdgaT2BJTVW1M9YRXava8k6X2jnPB42cMRs3eAiRsio1HasaSlcwdZV4G0wsl9JXFwahdG7wKhBKn1vxzhUPx8YYu63O8Nu8363BnpZiE3P4ozuWRrLEAt+05l6xVdFiMi6J1BVHN+bPbK9DqkfjP1/vYWzjhAM0gAaOfsygJ2eXQFw3DsoBf8pRRoDPY9FAmLw25v2VdhLuQb4L2i8WJSi2pd4TcOJPAtd1BvKfdGL13uryJvSs6Mo5eTnqKhhlpd2UWyp8FWTPfad0/gBdvpKYf9ZIkq11sfLWMN7vMJ2eHMhyY65aFk0dI0Yl5TxyJQQ5FljLFlepM9KtxkV0S6+7+sIuiFCJ0wFg3fdyyd+I5ofH2F8VHPm8pC90hLKZCKF/0mwjTReNjPq941T43RFcE2MaAXnOy60Y3PE4/S8falMCOx1/ziNrJQHYDk48v5RDwCD7pvRgSnMSIeiJKGEYsTktOfckCqI4rZk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31696002)(508600001)(38100700002)(6916009)(316002)(6486002)(7416002)(5660300002)(4744005)(66946007)(66556008)(4326008)(66476007)(83380400001)(2906002)(8676002)(8936002)(6512007)(6506007)(53546011)(2616005)(26005)(186003)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkJuOGtzVGdsQk9SSUY4K2ZBVitySGNsWnhVTDJQTTcwcUpLV2I1SzlRSUlJ?=
 =?utf-8?B?VWVIU3VTM0dYcWVXdmVEMVhzUS9QcDJ6RkFnL3BBeWtTU3RMQkpNVzY4a2Zi?=
 =?utf-8?B?Zk9idk4zczZyQ1VlVEgzRUlwaHBEQlN0dHd6OFRxK0R4UklJY3hvLzVLOFZj?=
 =?utf-8?B?QkpJKzJqZ1c4OEdoZG42dEpjMHNqYlRkQ3Y0U1RxalNMU3FIWmNvNXh0L2xZ?=
 =?utf-8?B?aGczVzdXbTJ1K3BYMEZwV1BQQzJrckg5K055NkF0SW9DQXFlQk1XS3FZNnZh?=
 =?utf-8?B?ZWE1N2dJU0YxVWcxdlBOL3lKSFd0MHJjTWVlZ01hWVVVV29DcUFVSEQxOEM4?=
 =?utf-8?B?bjNGNWFNdEg5QkRWdnZDazVUZnVVdVRnS0xOR3N2NHhnNitkQ3RzM3pBZ3Bh?=
 =?utf-8?B?Wlh5Z2Z1M2Zmd1RWK2pWdk9VZlpXd2MxTlpwbUF1WTRiSjh1VkhScURSTFY3?=
 =?utf-8?B?K0hPRVFNdDkvUVRIcjJMbGNVbDdKV2l0RzN1alVGRGZvVGFIbmRlMStUdHBR?=
 =?utf-8?B?WEx6aFpjOXVWd3NZaW04cGdGSkZsdVpmaVhOWkxOT1NKYW42MWNkbXBWT0tI?=
 =?utf-8?B?Qmlpak8vVWR6aTRxdnFCUUNHeklZQ2hzZDlOdGhvMGFwSFY2MTN6MjdWMlgr?=
 =?utf-8?B?OExYMWpIZlAxMFlJL0NySklOWkV2dzdqQlRIR2x1Q1BDMkdtbVZ4b2ZRaDl3?=
 =?utf-8?B?azZkZ3RxYkM4MXQ3dVY1TWU1dHIwK0xsWkE3RlZkR3hTMDE0VGh6Q1J6WkEx?=
 =?utf-8?B?ckRyT0tCM0Eyb09pZW9HRmxGWFpCYUd1b09BNWQ1U3hEUnU5RlZQbEx0Q2l3?=
 =?utf-8?B?Mm83WEN0UHgyQjM3TCt3VGczRWlSRkZVU2RMclJFTEdXTjYwd1Y3OWRKcG01?=
 =?utf-8?B?enZsbWI2QlhzRzJPTTc4UWoxdUx5enJZVGJsVkUydHRITUUyekhuTFFtWkFD?=
 =?utf-8?B?TEhuTk5WSGc3dHZRWi9HRVFNOHhFRGJzSkFJYk1EWjRwbWhKbWtIclN0WUpY?=
 =?utf-8?B?cDlIRFZIZHFvb3dOeUJ0MDlFYXRnRjhOS3oxQXRnNThKL1FHUGxYWElRRzNh?=
 =?utf-8?B?VHJjMXMzdEFkdFRyWWo3blBQaXpnZVg1c3EzRUhTVUppU2pXK0s3YmxaMVhC?=
 =?utf-8?B?QkV6cGNDVE56VzUwbjA4c1I2dzNqWDVkZkp6eTdLTFg3QWtnU0REZVllQXpy?=
 =?utf-8?B?NUhGNnNtV0p6NWUvN2hNSDY5ZmFXbGd4WXpzVjRnOTFidW01SjlBWU1CR3kz?=
 =?utf-8?B?MGM4YjFvVHZkR0ZWQ2tpZC9LQyt2Z0drcEZZb1VrV1Z6QldZVWlwOUN2a2M1?=
 =?utf-8?B?YUw3dGR2T3JHMzRlS3h6R0ZJU2tCRGxNQ3lmYnlJWU5jMWhzQ1BuMnV3K0xr?=
 =?utf-8?B?RHUvMUdFNFZPTzJQc2JiNWF3bGR0dmxDV1NyNEROZnJyQjhYeDVHblhRZjhW?=
 =?utf-8?B?RzBjZTFTalYrbFZ2RXJoTHZEMENGYUQ4Qlp1U1FtQ0R5bStTVXVZZEpQVnRs?=
 =?utf-8?B?NnJmWVpKWkhzSXgvUjlqR2hTWDJCQkMycXlJUXNyclRIRW8rcjV2N3E5RjFO?=
 =?utf-8?B?cnNaMFdSZVJWVU1ydzA4TEErOVptSUh3eXlFMTFaeHJkQnZma1dodndnVFFW?=
 =?utf-8?B?WWRmWDh0MFFSUS8wTlRmSzY2R1BJVjJOZkk1bVQvbytMTnlLMUJRdVBBVm5Y?=
 =?utf-8?B?ZkFpYW1jejlOSmZDcXpyVHNhZUdhZFpZa2s0NE43TCsycmcwMTlUTVBTd295?=
 =?utf-8?B?U0U0NGZwVjhpZUpEQ1ZmbTk0Y25pVm4yak1ZZlNpcEMrTXFLSUVEcHFET29K?=
 =?utf-8?B?aklPbjZMRTd0OE1OUDBNMlRMMm9VbThTbVBCNk81aWp2VVRZaDNRc3dZMjZn?=
 =?utf-8?B?dzVBNS9MVEZ0K2NrR0dYOWw4TXhHOXJwemdFVENrNUUyL1l5YkVnbEJMbmZH?=
 =?utf-8?B?SjlUY3FqN3VCZTBQTndnalNqSm5BSFZZTE5CU1NqSVg1M2tGcnAyWkFoSVJq?=
 =?utf-8?B?V1k1dzcxT2F0RGptS0FmZ3dJV2thUDErOFAwV2NXd0twQWJBektTNWhYelUr?=
 =?utf-8?B?ckhjWFg4Y3NvVjhOVzgzb2FjS3JXNWNhaWcxK0d1SXFmSzFna1dRWVJTYmRv?=
 =?utf-8?B?aUJkZ0ZGVmhFMFpaY2tyUWNVV0pKa0Z3dktKRGJ6NVBXN0VESk9HVmowcjJl?=
 =?utf-8?Q?2TRwZIRSwAh7Fx0TKIo6G/4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69006095-aaa5-4cec-7796-08d9e7b3cad4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 07:56:03.8813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IWgFR1JRaDXwi2EcYh1pvENMo7ZJAXtqLGuPMsIbgBCvSl8qo9qqqzxMA8oy3zZcJ7KcWcMJ6tY0Rtk9vkG1aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3762

On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -168,6 +168,35 @@ static void vpci_remove_virtual_device(struct domain *d,
>      pdev->vpci->guest_sbdf.sbdf = ~0;
>  }
>  
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool vpci_translate_virtual_device(const struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    struct pci_dev *pdev;
> +
> +    ASSERT(!is_hardware_domain(d));

In addition to this, don't you also need to assert that pcidevs_lock is
held (or if it isn't, you'd need to acquire it) for ...

> +    for_each_pdev( d, pdev )

... this to be race-free?

Jan


