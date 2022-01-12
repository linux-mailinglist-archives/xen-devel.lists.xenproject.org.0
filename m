Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D470448C69B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 15:58:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256699.440650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7f4L-0007Rz-Mo; Wed, 12 Jan 2022 14:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256699.440650; Wed, 12 Jan 2022 14:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7f4L-0007Ox-JC; Wed, 12 Jan 2022 14:57:45 +0000
Received: by outflank-mailman (input) for mailman id 256699;
 Wed, 12 Jan 2022 14:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=no1k=R4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n7f4J-0007Or-Qw
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 14:57:43 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe382f17-73b7-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 15:57:42 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-S18FtJLQMsq5rZx8yel6jA-1; Wed, 12 Jan 2022 15:57:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4349.eurprd04.prod.outlook.com (2603:10a6:803:40::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Wed, 12 Jan
 2022 14:57:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.012; Wed, 12 Jan 2022
 14:57:39 +0000
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
X-Inumbo-ID: fe382f17-73b7-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641999462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WlrQJaVuKbLjAc7DiuNHwT5Rir1lD4aH1Fh/EekoU2M=;
	b=EWHScCXFolwbMHM0scihy9WKtIlldqx5hpaejPb2ZVQ06ZDDiIoOaw/1IjbHrYYgYspBKd
	zhbkQ/IkvS/s3BNTdpVVxyrvVNJFrprJ10dWLUw5Il43GyIrT4Oi/CnCmpeSRx6T3jOTgn
	009Kvw0KhlYj6LmylqDT5lovsN9VrNA=
X-MC-Unique: S18FtJLQMsq5rZx8yel6jA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CalGANQkC1wlxvCA+G0IJxNmxpdCKCvtto+08kfGayr3XyDGqKUD/Qxtr1YbojfOXGbt8r9t8V0m6M5IvdX2DBCxJ6BqX4NlyJn5REhgafLnrXIWIPAX1TuMzcIctCspo24Pw8OfceRFndCFApY5a8duN0vfdtqkCweThvHwpcPabjo7bEfi3zXYibihafiN2syMNqS1ww1em9phnX7kqsAL82lWFIO/nvtwdsFEGOsPxl9BnSSq0eq6pl7AlL/7EPMOjzmaHnG24S1pziRAra5p+92f9zrX/4/Oav4O3HIQRQ+hSn99XpoGj7T+pz+eM4Zw78kswR19rYPztXtJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WlrQJaVuKbLjAc7DiuNHwT5Rir1lD4aH1Fh/EekoU2M=;
 b=NAo7PE1unUgRnolNbubzTMGtrizXqIPLhi2nqtNk+qzn6SNAU/7M0Aq7xTzkAfzL2lZ8Ig+9lAwenJs4UMG41dP54dUzaU9lBnuvx2byrRJ1mcHRHOc5b6fd9cske6w38Z7PCVCzY1fHIxa13JONoR5e6fIO+W9gqLtisiIxJ4AUzdQQBU8n0cBouD8xCbWwZHHVAA97UyUjzyHs1FHSqtH5iwxdOy1j88V0EH2heXkBnPNKHRW/EyJLANUfve/UBI56AM+PEhYZuWPMA1Nkb0QXZfVUXnW6yBNynVe6NJ3xnQNUc3v0mKqwzO647E0armVCiozGeRFhTFFiT2h65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
Date: Wed, 12 Jan 2022 15:57:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, Artem_Mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211125110251.2877218-4-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0402CA0016.eurprd04.prod.outlook.com
 (2603:10a6:203:90::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d38188c0-a3a5-4d7d-52ae-08d9d5dbe06a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4349:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4349825F15C2B3BBD5D6FC2BB3529@VI1PR04MB4349.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1NEZAX5grIbE4vNcFj/Kj1k/NP8rGn88E6aGjsDju6AOPbcP7FnhYw0VGAATiqw2rbAIcCqdyOXGWD46Onqwvf1ftvYF1GjIvfH/Nt8qH0dcN8U+/HwnIdKG5pe4T/GkSr+DcSFBaCdFGVpm/kz0LY8m6pvX5bI9HnlHLSQGXWaypv5mTEm7atDraB4u6oJi5l7i23Vrapx6URz+X+kMCmiMM6DSxV0QDtnYvlxhaUY0sm0qgtM3XDjk6si8yTdXt78LyH37Kb4LbQUPPy7lBl3b3EI1uwPv5qTvsebUCKS0P0XPAStbtmXdShFTQIUC2giZK19ZVinLgb9qAQvhH7USrv6x4U0zcMGQeRZ5qNh/YTEj872aUEAGuuzhcmJIWS+SaiToTlngJPlbylK+TVeOn1TvYkdTN633e5SDueGEGK/0da5NNaEsWC69QEMQQ8Iauy9rjgDtzT8m5TkbJ0FYjSqvMPMzuSumsF4X144MksZpsSm6ISS4EPht5Qg0JW5UWcXdpEDV3TT1KxjXDlm3XmKsu8WVUz4u11g+qNniaPwUcRosY2cPAXasot2QMtkMBvRDOAkNVeZoNpXonwetn12J0Wk1oBSBNQbvzGJJn0uJaJpbB7gEt46FmRDpp9fcbKUJHvniOuq/dMUw7PWNd+bvW1D4v0XM7ebi6ETJr2altK8SBtLvVSGsvmiF9wQ7m8b45BbDqekDyThNJBsw2YrdUX4yEOXs37v1CveJjvd2HD6w1YXAUDWxxisw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(4326008)(6506007)(6486002)(31686004)(6666004)(8676002)(53546011)(186003)(26005)(5660300002)(38100700002)(8936002)(508600001)(6512007)(31696002)(2906002)(86362001)(6916009)(66476007)(83380400001)(36756003)(316002)(7416002)(66556008)(66946007)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDgzY01MU29ybXJBZStENXlJbHllMnBmSktLY2xjbE9xR0t0YW0rL1RxN2dt?=
 =?utf-8?B?VHVkVVFwUm83U2x2WmhpbklIN1VyR0tjOEIzc3JsdExWa2Ivb3V5THhZNUxj?=
 =?utf-8?B?VXlPeDYxZ1hoanVrRlhMRkhhQXRqM20ycTdORVk1bm84ZUpwVW5WbGR3ZS9F?=
 =?utf-8?B?cENrbGJYTS9RdzFkajJSaXZ6dnJ3YzZzaUVZYWJ5SlRHbGppOXNLMmRMWkRP?=
 =?utf-8?B?ZHFlSElORkYrSjdFVis2Rlc1ak9tVGVEZHVFUXpjNU5yc1hOdGJrWDFnUXds?=
 =?utf-8?B?b0FvSVhzc3N0ZStSL01vQTJHMXlxU0ZUMVlKRzJ6RXJzcVRNdTBtRzF6TURH?=
 =?utf-8?B?RzRkUDJhYzRvajBPRFZaQktIaG1mUTltVnBYSCtnSDg5RFQ4VFpabi9ITDFk?=
 =?utf-8?B?VXBaWEJtWGFCNURtMUk5d0Q5NG0vTmpaeW5lVmJFenVDUlJ1RGlXRDVlQzVo?=
 =?utf-8?B?ZGNYZmdhYXdvOXdqSjVMME5vZ1hhTW9uRE02dEJDNmx2TmhSbHN0NzAvZmNj?=
 =?utf-8?B?ZXdsdnNmYTBVZGluZDF5cWxXZlBrWkVNZjJ2ZzJFVm1TV0RCeEwxdUJTTzU0?=
 =?utf-8?B?cjRHMURlZ0ZvN1NzdURkWG1NOUpZdlkzMnBkbVQ4VHBJUEVDYnpSTzhGdkFm?=
 =?utf-8?B?TUFqY0tpZE1PZHF2bFBxMVBjR0tLcnA1cTFNRU1wS2Z0MytpOGVWaUsrNkly?=
 =?utf-8?B?VXBQcUlKNkU0V3pBNmtSdjlCUk95bkpnbnlhTzFpS3VXY0ZWNEVPT0dCY09E?=
 =?utf-8?B?Mlc3NlZhODNUbTlxb0QwR1ZZWmFydWYrbWI4QVJMbWJUenIvNVVRbzZXamds?=
 =?utf-8?B?WHZuZXErSndKMTNDeFF5VVlLbm9JeDNxQ04wZnF1eXFYams4eXpYVGY3QjJQ?=
 =?utf-8?B?RjFUM1M4bEQzVWhZUGRaTTFuV0E1eEdUcURUOFNaWC9KTmM0b2taUElOSys4?=
 =?utf-8?B?Lysva3YwTnZBL2VMNC9qeHhyOXlSWmNhMzVUcnpLcDNvNVFySjVSdzY3MTZu?=
 =?utf-8?B?cDlwSHFkTzZUYXFnaldGQzFlUGZ4N0tJTjVSYlkvdGJKUU0zODNncFovK3lQ?=
 =?utf-8?B?czA4bnk1eW5ZVzNJNDR6WngrMWpucEVMMDJjTEEzVHV3YVg0L1k4bkErVjVZ?=
 =?utf-8?B?OVQvMGVZZnIrOUlSZ3JvbWVLQXc3VjNYYXNHQTcwRXQzZjJqSk5xY3VDelhW?=
 =?utf-8?B?QWNxRk5iWUE4Rm1BWTd1R3lpbjBwbnJwd2g3Njd5QXViRklKOUIwUXRpSThG?=
 =?utf-8?B?enRTZUJLNWNWdkp1ZmNTY2pRaTFQRC9BK09DdktCYy95YlBBbldNWkhPbU5N?=
 =?utf-8?B?QlNXdDEwdFYybHRxOGdaQVRub25odlI2T3hVZ21Wbk5RNUd2dkhFRmFzeWhB?=
 =?utf-8?B?Y1VNL1FDUUVIT2g5OU4zSlZaR3hieTl5K0ZQWjczcmxvL0JiOGxIckllNGFL?=
 =?utf-8?B?TWJoVFM2d05ROXE4WVVPUHB0L2x0VWppZmczdHUwMUNJTnBNaS9EVVRna3N5?=
 =?utf-8?B?Mm5mNzF5OWR5QzRmV2N0VTFDSTJOWTJoNTJLaHYxQ2JKRG5KN0tMbTlFYXl4?=
 =?utf-8?B?bEhuK2VxZDNjdzMxaUpDWVdLcGxvV0RpdmJ0cTVYT0ttcDFEQlRxclc1NjdI?=
 =?utf-8?B?TU9sRjd1a2p3VE9yMjgzZkZ1ODhabW1IeDJ6U3dLRjU5WklYYzFIZ0ViY2xq?=
 =?utf-8?B?bStrd21oclN3RkIwaE1iUE9QNWtpWGlvK3pvUXlLUVI4U08xRFc0d2t4WTkv?=
 =?utf-8?B?V0E4UFNxQXJDelBWOWhDb3Yyak1HNThITmpXZk9IUlV5Um1BVjZva2pMTnZN?=
 =?utf-8?B?Y3lFRkZrREhSQmtac3NKeGpQYUNYN2J2MkVST2lYVWZ5eUNaMWYyclUrS0JN?=
 =?utf-8?B?ZjlKRk4zNzVNNE9acHlZdTd6aXJHS1cyMGRrTDI5ajFRVkJzQUwzYXZuZDll?=
 =?utf-8?B?V1BqSlZsTHpwalpIUVh6UWpoV0MzM2JRQ2dIZ2Fsc2s1NWZ0U0RvL09McnVj?=
 =?utf-8?B?UUpsSTM3OXpmcTE5UjVhUGJkNkRtamI4dzFRN3BrZlcvQTIvbVVOajBJdWNo?=
 =?utf-8?B?aWF4MU1neU9nYk5ZOHI5czZDdUFxZ1EyQU1EQXhyd0ZHSFZmZzJRZFdldkYz?=
 =?utf-8?B?S3hhK25RY3BLQmNmTEl5Q1ZNUkRMVlRZVGIvZFBaYmE4V01YSVoyT2NoVXMx?=
 =?utf-8?Q?Xco+tYOymsMujJYFMsRsEwo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d38188c0-a3a5-4d7d-52ae-08d9d5dbe06a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 14:57:39.0563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwXsoMZX+jh5ej8GeC1XlLkzmIyRpITdzmtdHBtH2/a8qlBvIVfgEi8ZfynxhiV6xjzeQuvSVG1oZOz3+j4HOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349

On 25.11.2021 12:02, Oleksandr Andrushchenko wrote:
> @@ -68,12 +84,13 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      /* We should not get here twice for the same device. */
>      ASSERT(!pdev->vpci);
>  
> -    pdev->vpci = xzalloc(struct vpci);
> -    if ( !pdev->vpci )
> +    vpci = xzalloc(struct vpci);
> +    if ( !vpci )
>          return -ENOMEM;
>  
> +    spin_lock(&pdev->vpci_lock);
> +    pdev->vpci = vpci;
>      INIT_LIST_HEAD(&pdev->vpci->handlers);
> -    spin_lock_init(&pdev->vpci->lock);

INIT_LIST_HEAD() can occur ahead of taking the lock, and can also act
on &vpci->handlers rather than &pdev->vpci->handlers.

>      for ( i = 0; i < NUM_VPCI_INIT; i++ )
>      {
> @@ -83,7 +100,8 @@ int vpci_add_handlers(struct pci_dev *pdev)
>      }

This loop wants to live in the locked region because you need to install
vpci into pdev->vpci up front, afaict. I wonder whether that couldn't
be relaxed, but perhaps that's an improvement that can be thought about
later.

The main reason I'm looking at this closely is because from the patch
title I didn't expect new locking regions to be introduced right here;
instead I did expect strictly a mechanical conversion.

> @@ -152,8 +170,6 @@ int vpci_add_register(struct vpci *vpci, vpci_read_t *read_handler,
>      r->offset = offset;
>      r->private = data;
>  
> -    spin_lock(&vpci->lock);

From the description I can't deduce why this lock is fine to go away
now, i.e. that all call sites have the lock now acquire earlier.
Therefore I'd expect at least an assertion to be left here ...

> @@ -183,7 +197,6 @@ int vpci_remove_register(struct vpci *vpci, unsigned int offset,
>      const struct vpci_register r = { .offset = offset, .size = size };
>      struct vpci_register *rm;
>  
> -    spin_lock(&vpci->lock);

... and here.

> @@ -370,6 +386,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>              break;
>          ASSERT(data_offset < size);
>      }
> +    spin_unlock(&pdev->vpci_lock);
>  
>      if ( data_offset < size )
>      {
> @@ -379,7 +396,6 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>  
>          data = merge_result(data, tmp_data, size - data_offset, data_offset);
>      }
> -    spin_unlock(&pdev->vpci->lock);
>  
>      return data & (0xffffffff >> (32 - 8 * size));
>  }

Here and ...

> @@ -475,13 +498,12 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>              break;
>          ASSERT(data_offset < size);
>      }
> +    spin_unlock(&pdev->vpci_lock);
>  
>      if ( data_offset < size )
>          /* Tailing gap, write the remaining. */
>          vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
>                        data >> (data_offset * 8));
> -
> -    spin_unlock(&pdev->vpci->lock);
>  }

... even more so here I'm not sure of the correctness of the moving
you do: While pdev->vpci indeed doesn't get accessed, I wonder
whether there wasn't an intention to avoid racing calls to
vpci_{read,write}_hw() this way. In any event I think such movement
would need justification in the description.

Jan


