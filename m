Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B01C4AC6BC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 18:07:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267285.461015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH7T3-0000eK-49; Mon, 07 Feb 2022 17:06:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267285.461015; Mon, 07 Feb 2022 17:06:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH7T2-0000c5-Vv; Mon, 07 Feb 2022 17:06:20 +0000
Received: by outflank-mailman (input) for mailman id 267285;
 Mon, 07 Feb 2022 17:06:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nH7T1-0000bz-B0
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 17:06:19 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43b8a1a4-8838-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 18:06:18 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-EpD4W0BoNQizTdK9xpGtlQ-1; Mon, 07 Feb 2022 18:06:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR04MB3307.eurprd04.prod.outlook.com (2603:10a6:7:23::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 17:06:13 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 17:06:13 +0000
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
X-Inumbo-ID: 43b8a1a4-8838-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644253577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eak0n+eKgYksPTt8z/Zey1HNNYwAIEU4CabgD8aYCic=;
	b=H8jNTQ8MzXdBMZASNOPzTYPnVNETvYk3/eTPS8ZNzYe4qrhtEXp12qe0H1Oy3W5RC+aU1O
	FAlGRZ0nEB0Xuvj91ASuvX8+tNdWgq1G84pkODSK7m/7wT4hip0hdcDQcCIrzEEbDd7aA0
	mes//zS15WPx5OIRTmGCl5laV73hZuw=
X-MC-Unique: EpD4W0BoNQizTdK9xpGtlQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHH2YIysjoC9lYoti0unk3dYLgIp670699Xm+aFdSvhlg420GV9T5kv3O+E5RYbyYv86Nt2lJT97Ri0UKcJGA8pUM3nawiYLx8pZtZqTjkSPkivbMHjY/CAyDzXPd7hr6nrUg5UQu08OXsBKrcqeu9BtqtWoB5bt5vkUAJEzooaOyDoLbwNgKSzvyKDpmPZfaX6GtxrTC+71VZWVFUayRTNZ8hEnnGh4v2lDx95N1aadaKSLBTt0YAqiKEUxVrJMJvcJCPgAv8M3oMO3gzZahF38FropV/Lf1uqHxTDSDAksYzMgyfogpy/PD7V+mVtOrKZyRrfM23HMGpxP4DLQLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eak0n+eKgYksPTt8z/Zey1HNNYwAIEU4CabgD8aYCic=;
 b=HFgJo4iQCebTrZAUBdLcVHNBnjMbbLI5DgPr3feH7cYbdkfLD80VlJ7i4E0PCVdCXog3ZW8ycz3llchDMroo6tZIKMpEMjBqDbA+B92JkEyvNk65k90H24YKoPZKuxB1M775Tn+fHGUS1W3d71QNwm/B9XdHyHgf1a/1qDMapO2Kzq6aBVL2gZxlR1x79EqnzUS2z9u9VYgbBce/3NK+M8ZRvh8ZEQXzfSBbatLtV6+91SDH0IgaaFEJcqtxoLgDgDKkdhj+16FptHx4RUxbkpvqww0g5L1/vcG1EWGhbVJIdJGB4Bv1zhXVewAoInmvavoO54bBwi+h0VG87VB3RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <61d85343-9a37-6409-449d-a662ae5258c5@suse.com>
Date: Mon, 7 Feb 2022 18:06:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Content-Language: en-US
To: Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: julien@xen.org, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com,
 volodymyr_babchuk@epam.com, artem_mygaiev@epam.com, roger.pau@citrix.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, paul@xen.org,
 bertrand.marquis@arm.com, rahul.singh@arm.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220204063459.680961-7-andr2000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c9bce83-bf17-41aa-f6ec-08d9ea5c2535
X-MS-TrafficTypeDiagnostic: HE1PR04MB3307:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB3307ABE811EE3EDCC1FDC27EB32C9@HE1PR04MB3307.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dys1/aG/08dxPhKi4zUiVX0/JLdQnW8MA6OBaSxdjZpRjfnl+ncp+3cug+iRxkmNyWzBbvsg7IWajU1ega6yf8aNHZ1PYjiypYOW+n3fNUJfN0yLrhPgfgOfRsJA47ZP9XAJCNW50RStc2boBGMI1LRDkBfBHEvRlIhqMdbtEJmZxRsgpMkS0aWU8zaueJdk/xew23LN+nV+C4BhfaEp/X3092hAVylWOwfSfvzDdfPTNgUxZWkkdGfdaQ8A0rLIeRBWEKpuVAztGVu4mnUApkSbHBmI3IQhR/Krtlx58KMQbL6wBtInSfCGVfuql10m6XxvScBBn4233vJvlmUC8omxr8CpS18RvW2w4M9cJS34T88vDrSN0CsJcCtZBooM3qbYoojRhwJSCju4JTJP2lWuqxbOyloGTnD1TRoelLkUSNcCXWDCOD8vDi8QGvFTfXM9rC5nfmpr9s7gB/FZx0D3DyO2y8niwDS/hrKXssmXs2/tu7Ht0Gx45X3lxZdjWxCzl4pMujmoBGOgVpLEzF/q/L2zenj2AxRNHZOPtD04IMb6v+yiNsGzdkZfkwklDvp7K3SXNxZgG92UGPhBmQjgCuzmcVYWL7Qb1eOYOOs1e70049PYzcF5lcWtmfI5h/scnbuBmWBeCErMCho8wQ+/uhM66UiM6djb9/OYp546BeW0DBSAqZZi+ULxSnPlOe4zwqnnC9SAYXaUlCTGHAFBjhpEmvldXtwy9ehUWu4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(5660300002)(2616005)(36756003)(7416002)(83380400001)(186003)(2906002)(26005)(508600001)(53546011)(8936002)(316002)(8676002)(4326008)(86362001)(66476007)(6506007)(66946007)(31686004)(6486002)(66556008)(6916009)(38100700002)(6512007)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dHNwd0RzT21PUHhQaS9CdXp4MDg0OWFudWxWZWt5WWxwR3ZHcmg3UUZoTkNl?=
 =?utf-8?B?RDFMVWZhRXJISDh2VkhlcWsyK2FjSzJlNlU4N0FBZUFIWkJvaVoyM1lTM0dD?=
 =?utf-8?B?Y3hpSzk1RURaWlIyTnd4WTFjZGtUTkhxTWN2N3o4aU44M2hyczVLb3o5djhB?=
 =?utf-8?B?RkRoU1VOUHYxekhsRENzL29FWWlNL1ByQWxaazF1dDhsMS9TdDZIeUhHbEg5?=
 =?utf-8?B?enhGVWVkOWVMckVyQWNrZ0lmTW1oQUJTQTRNcWk2Q0I1MUVNV1I2Slh2VWdN?=
 =?utf-8?B?QVM4eU9FWllRdVVEUXFNODViczdXQVZ2MGFkd3RnUkp5SzFRM2xFemhJNXlC?=
 =?utf-8?B?TkxuWS9PRmF3TXd6RHJRSWhBWmdFR1JTTmFXNGpKL3hqMjFMTmd6RHJ0S1p3?=
 =?utf-8?B?OHFsWEQxZUpwMlFxbmVEL0xYU2ZDZnhkTU01ejVIMW04ODgzbFE3UTZ4MzJL?=
 =?utf-8?B?NGd4VFJtNCtOcE95YmJDVytlQzUzaEtyWkhnVUtjTlNMK01XcXlSSHFiaktX?=
 =?utf-8?B?eEJDNlBBREpzdW1vY1JNT2lweEFUUmFtWXBNN3RIYUlEV2ZEakF3UFoza05J?=
 =?utf-8?B?NUNGek1FUkR4M0FQcGpsOGVJc2dRRDRqbWs4UjBLa3NJNEF3VFFYcURiakVa?=
 =?utf-8?B?RzN4dmgyMEI1WHdaYnExaDBMd1BjazUvVkMxejZtMlEwRVg4Wncwc0NZa1pV?=
 =?utf-8?B?Wnlqa240Vktlb05IemtXRFdsczVpSC91RVRjVlM0MFpPVFU5Yks4b1VOUERP?=
 =?utf-8?B?eDZEMWgwaCthRmg5WDljUlJqOENSVEFHaExaZlVZa04xSHdSSVNsQ0pDT1Yw?=
 =?utf-8?B?ODgyTDdUVUlxcy96ejI2TThLZHBONHd0YXdxOVYrZ3I3bzdtKzljc2hyTkxl?=
 =?utf-8?B?MzJRaUZSVUZMZDNUNjFMRFlVZ1pYeks1dmtiY2YwWXhBbndPT1BsV0hESzRn?=
 =?utf-8?B?MTRvSzZmRkUveW51Tk5zcWtmeFlMSk5BNnkwOW5hU243ekVvSlJVVmc0bzRQ?=
 =?utf-8?B?d2FJQkt3M2dQblErZDBYeWNlU0ZmamY2cEpNMzJaaVFCdzM1WlBmbFBnRFZa?=
 =?utf-8?B?ZDRDMHE4M0llbWNnb2V2Ly92cHJ6NVVOTWJyaEFPdWpWYTZNdUZNM1ovMGlw?=
 =?utf-8?B?N29EWWN2dmhvSGY5NVR6dDhON1BSMU9FbCszL0s5WTBMbVZxeFVQZ1QvbVFH?=
 =?utf-8?B?Z0xWSll1WjRLTGM1ZFJRTHNGcEViZllGemZmSkdHVVh3Z0R4RS9FUkpPcG1v?=
 =?utf-8?B?UGxodFRRaksra1ViMVVzRUVHRXBCMUIzQXN4dlFJNW1IOFB0bmM4UU1ST0Rk?=
 =?utf-8?B?dXhrSzFjTzk1K24rWCtyUHJUNzFNMUhFdWxPTGdGWjRNZXhxV3FubkNjU0ZS?=
 =?utf-8?B?d2JadUhqSXpJckRnK0wyUlp2Vi9oVUpnQUs3ZzJ5U1F3eWNTTTZaSFNPQTEv?=
 =?utf-8?B?d1F3b1pLU0g3UGd1VmY2YUVuR1ZDN1JjTXdiOS9SbEhPSGNhTW9KeXh3dENE?=
 =?utf-8?B?emxYZFJOdmFGNjRxMGI5cEU1dGxFMFBaQ2s0TlJia3VsY3BUcWpORkpJT1JU?=
 =?utf-8?B?aHd5ZENFZ2RGbnA3SktJYklCVnEwbllNMm1mbGdLMUdnempIaDU2QlpjMlJK?=
 =?utf-8?B?Y0xHSURKNHhDNVliOXdiMmh6TTVteWkzcnJocWk3cWZBaGFQSHhXUGM0SCtO?=
 =?utf-8?B?NkxEVm9PU2dtd2pYNXQrYlA3bjZwVkhUTDYvVFdRenpybEhua05hbzlJUWpE?=
 =?utf-8?B?N21WWDE4YjRoZkxLalFySXBOVGVsTCt1R2RhZmswcTFpQ01PN1FlMjlIZGZN?=
 =?utf-8?B?ME9Sc0x4b240N01xVkJYa3YzWFNtYTc5cXR3SDBCUElrWktSU29wL25qYWwy?=
 =?utf-8?B?WDJlTitTSlJadzhsNnNSU1VnNzh5YWF5SVR2ZklhVnM4YmpySnRiWHpuK0lM?=
 =?utf-8?B?cWtHTzNWOHVWTkEwcTlkSVdwZkViL0RtWUpuOVBNZmVzZDZqbTZFbmlEQTNV?=
 =?utf-8?B?RUNvRGJKcnZmU0U5bkhzNElRZmtuU1FCdXNCU0UwSEtzaFA3eTRjK0pMazZ3?=
 =?utf-8?B?dWRMNThXSWZvRHQ1UkQxcE9NV3BUTGxPd1RmME9tK0w1bkdiS3RGZHh0ckk0?=
 =?utf-8?B?R0hRSHVYNnFRMFF4UHh2aEhBbHVBek1xdUVMYjA4Vmt6QnpabTkzazVNRHBp?=
 =?utf-8?Q?Kq9SVxorEd2W9wbY4QJpHoY=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9bce83-bf17-41aa-f6ec-08d9ea5c2535
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 17:06:13.4007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70bmkCArd6aSNWDGXJOcaSy6IBUheMkiJa3sSqf53MA28NOPZu6SQLAr5emZgI/UW47U0WnsUSbdN3DIkdnLsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3307

On 04.02.2022 07:34, Oleksandr Andrushchenko wrote:
> +static uint32_t guest_bar_ignore_read(const struct pci_dev *pdev,
> +                                      unsigned int reg, void *data)
> +{
> +    return 0;
> +}
> +
> +static int bar_ignore_access(const struct pci_dev *pdev, unsigned int reg,
> +                             struct vpci_bar *bar)
> +{
> +    if ( is_hardware_domain(pdev->domain) )
> +        return 0;
> +
> +    return vpci_add_register(pdev->vpci, guest_bar_ignore_read, NULL,
> +                             reg, 4, bar);
> +}

For these two functions: I'm not sure "ignore" is an appropriate
term here. unused_bar_read() and unused_bar() maybe? Or,
considering we already have VPCI_BAR_EMPTY, s/unused/empty/ ? I'm
also not sure we really need the is_hardware_domain() check here:
Returning 0 for Dom0 is going to be fine as well; there's no need
to fetch the value from actual hardware. The one exception might
be for devices with buggy BAR behavior ...

> @@ -516,6 +594,11 @@ static int init_bars(struct pci_dev *pdev)
>          if ( (val & PCI_BASE_ADDRESS_SPACE) == PCI_BASE_ADDRESS_SPACE_IO )
>          {
>              bars[i].type = VPCI_BAR_IO;
> +
> +            rc = bar_ignore_access(pdev, reg, &bars[i]);
> +            if ( rc )
> +                return rc;

Elsewhere the command register is restored on error paths.

Jan


