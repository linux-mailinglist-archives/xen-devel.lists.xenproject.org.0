Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B7738289
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 14:01:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552692.862900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBwWb-0000oI-FV; Wed, 21 Jun 2023 12:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552692.862900; Wed, 21 Jun 2023 12:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBwWb-0000mP-B8; Wed, 21 Jun 2023 12:01:25 +0000
Received: by outflank-mailman (input) for mailman id 552692;
 Wed, 21 Jun 2023 12:01:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBwWZ-0000mJ-OB
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 12:01:23 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 561b1d91-102b-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 14:01:21 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9695.eurprd04.prod.outlook.com (2603:10a6:10:321::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 12:01:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 12:01:18 +0000
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
X-Inumbo-ID: 561b1d91-102b-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbNWdWGHeT7Orn6uoB8M6zVOJ3Qvm+ALJciuP5T2jn2CO6vkYXKbA5gGL5WHyevquRmNUCdc4zo7KfjFdoYqQwL4QrzHokow83N+zI9onPpcJpIjqtuoyVpVceDeV6v6s4OMuVtPkBCdKwj5EQNPurIqD6VDg3RsRPJtAESMPXWt1GsSKk0gX3hxkex8FHR+f/xlwohyhzIarSR1lX2RV8VLCSUuKAHr9pfsjdsIKTQ1OUjyB0TedNzOww0cxSqrw53G8Y/PR87RAYpRrzoj1uqkW05rk70gB9Nsn53VgQczGnOKvCwMafSTBY6ix9jb1oov0srktMIrCFOsRcFizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qc27JLJOW39TUJfs/mU/xG1kL3Dz735MZYTZHw6s5c=;
 b=FXSyFCKjQ5xn/rmxmkMC56mduFhADe0CgYMXzTkeYntKitAr9SF0cK5HIiGtIZTct1xwq3AhofL0UVjF23Y3AlOldRoLQJZO72fQ+5NhGQp8RFgxPC874rWwQYjGjyhGTshmAgxS4QxnK4//O4snmfq/O/KGHuJQ5iTSJ7UvSW1soHujTRGzidIjgH9orDsL1WlV23b47gfa6FmZarkXIGj2hWDZMEoH3l/xImBy9x+onPJjaEdfV/gsXslGbB0ShV+91T3Ml+vgJfGnRqJzyafoWUIB66BW0NL4IDzfNs05vX4lUD+TeQ26nmToHEMHlY9MPn4Vz/mnmmEdadmRWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qc27JLJOW39TUJfs/mU/xG1kL3Dz735MZYTZHw6s5c=;
 b=OdeTh7KJ/1NK3F2hKDDLFz5S37CbZmSmdZ48RUjXIbwMY4nXJqA4Ben0gIURf+td7Pm5Mmf1X8A8eoe6JD9QCi8XvFggJWS3QeZTwlJ1B4qQEW3J87eoZU+FUYTw2kPnHEuXtAW52SMYpUxu6sKx8Z8Bv1N2gW1WGvmuOF/V2M1eXTKsc3JB0rTAQJNzkqH4eW+z2Ixu7UDNNJDpRevu9D6Va+nOT+BqqNgfY+7U4lvDeg29uvWt7miRIvB/WKeayq38Dm7zXvrSCDjhKEYIKWQNE9+huwiSFBWP7lRFoaloexoWgSF5XCxv6FtlyKlZ6tHoN6UDj6N9vE/MFKJyFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <955e9e77-ccf3-e18d-50e3-7bfc1c43cf9e@suse.com>
Date: Wed, 21 Jun 2023 14:01:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v7 11/12] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-12-volodymyr_babchuk@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230613103159.524763-12-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9695:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b19d8bc-8180-4f09-f7a7-08db724f38ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lqb+HZ2aTehb8sJeGkFV8KVlh+ShbLX/DO9fiiSc/rSjcTyio+t086TE/eSeUMV1NvMK0ffFHIoOAM/fLzYr3KoH8JQfsj6V1Ri46NR+2FdRhjxJHddbTmtjrfMnTFACCSFAlUHA8SEOMRozxZaN4jRTlwN+UKaO/iG9jDnYafn8am6OA82dwhAtGQ5Mc4geFVV+ccjjP2jUCEEw5LCH0nYFi7cI3IKDgo0yCX2oq3DkfiPl1MUqNfPcAPZqohAWMWLYwBwbnIvr80nV8ed/XeCj5sJVQoN714LiqvR3W6WT1W7HJn/PMZ88rPv73kqMd8vXDXsDeVhtIpWsxunu52KwR4+XJPBqtiilRN48INKTcjShCtCFFNShScVRMTe7nrhqoFCAk0jRIUInFDI8jsgoPfHmJ2LRERMHhpz50slbovsn7cEMB2kIQm0qvssg8DNmLOFdc5exYFF1Edel1QzQfjWIVnddwrqpTJOpNJah/mnroQcZwoeCaFxnQSOCE2ui/cFwETHj+QYm4vWAjasjQythvEvKimkQ4J/Gg/69tYzcu7ycdB6Beve11UWrIMB1ptugBHkQlfUygvL2qIzwHEdhbvtTIMRu1Mk2sCFSi/rT0sN1g5MuC4Oz9KW/GvJGaNU4l8LkbTDoJ52X2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(5660300002)(31686004)(8936002)(8676002)(6916009)(4326008)(66946007)(66476007)(66556008)(316002)(2906002)(54906003)(41300700001)(6486002)(478600001)(26005)(53546011)(186003)(36756003)(83380400001)(2616005)(6512007)(6506007)(38100700002)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WkJwMG9LaStyeWFLK2xtUDZ0T2IvVkVLMm5CbDl6azBLTDVTQ0dXV203ZGRq?=
 =?utf-8?B?S3EwSEt4U1FvMnNjcms0eTB4WDZEMzZ0RVZZWHZ1YVRTaUduVTdRUm15dXlY?=
 =?utf-8?B?Y2lqZm5XVVgwMjZxTVNobktvMTlVQk1ZSmJ4QXcrdVNrU3hDNk9Vd1QwNUdl?=
 =?utf-8?B?VVp3VXdjT1pwMTZjV3NhdWN2VWRrWE9PNFRjQkNYc3VkN0VmTytkY2NOck52?=
 =?utf-8?B?N2o5WmNlaHRuTU5FdEQrRkhBRWlickxBQmNqSkIvQTZ4ci9lYlh3WStNQm9S?=
 =?utf-8?B?SjJHdHFnZDdsditKV3A3UDZhQ1lEekprK0FyaWFmdDZSRy8rYjhTVHN5SVBV?=
 =?utf-8?B?SDE4UmlTK3Vady9pWm5aZXMwK0dVajl1a29Hd0d5eE1DNEVEcjErdFYwNjJK?=
 =?utf-8?B?MVI2UXJGbWtKenA0bmNnUW53cnpDdTVGcHN0ZFJLU2dydmFrTk82WllGQWkx?=
 =?utf-8?B?aHFHN2hlVEdyclFDdk1GN2JrbDhHK3hpOVZzQkJuc1JQWnM4Q2cxZ3NEcndv?=
 =?utf-8?B?SFpRMm44MjdNb0xEcGRGcG5rQmIxN2NOSGRLYXUvS2lGVTRJMzhQaE1uSnNz?=
 =?utf-8?B?T3Z3TnBJTDVQL0ljMTl1aTBtcjg4OTVGRHpoRERTdTFubG1maEJyY2lEcWNG?=
 =?utf-8?B?Z3JLUGhlWDY5UEVzNUd6U2FDWGhIMnpFYVdLR3NFZDl0Y2ZEMGJnTWtvc2Fp?=
 =?utf-8?B?cytFL3dkRWh6T3JlWG5rSTFVUXFidno2K3Y2VzdVaFpWOE9BUjJtd01YbzZn?=
 =?utf-8?B?NGlNQUw3WXR1aUtRK1U3MVNHbW1qNlVzNXlPREtGVC96aXJvelBtNUpJYSs2?=
 =?utf-8?B?bGIwcWhQcWhCY0Jzb3dSUllnQlo2Zkl6MHVJYTVDYVovZEV2RFkxenRJeXpT?=
 =?utf-8?B?UThPS3JDaXh4UC9wUFpzUmg3SWF0bFBRdnZvRlQvN29JRXNLWHdJdlNZbi9J?=
 =?utf-8?B?RXNTeEd5OGQ4VTNqcHV0S2VtaExjU0tTcEQyTXdNTVY1b21VbXk5K3FrR2pH?=
 =?utf-8?B?aVNWc2ZwZE1PMG9DRm5NZmhLZGkrZUNvZXdsSHFIR2pTaURtMFMzTm1oRDRX?=
 =?utf-8?B?RFk1ZkVwU2ZZNzk3QWszeHVnN3dibys4ekIyYjQ4TW44RHhFNDBvWnZtelJB?=
 =?utf-8?B?NGVsbkMvaEM2ODNhWE83MGZOMUNiTWE1WmJ3Q0lzS1hEN0xtR1E2T2RGUEl2?=
 =?utf-8?B?MjJObU4xamw0eGFQOTMyWUVGSm9ubXVmMG5kZ2R2MEJKY015U0NHYnhjTURF?=
 =?utf-8?B?R2lTRzJMN0Nvd09JSVpTblpXYWZUU3QzOXpTdkIzdk1hUkdiQm1HZGxrRlpr?=
 =?utf-8?B?R0wrS0dML2diNUxkelFMVDJwbFRwd3JPeHk2ZitReDd5bFlRc0l5ajR6NnFG?=
 =?utf-8?B?UlhvT0p0ZnVXdG92Z3YwSUU1bTNBSFNkZGlDODVPS0oranFkVnArNDR0ejFG?=
 =?utf-8?B?UTlseGY1NlpPUFJyb2pucjAvbFZvWXgvd2lhVnhIbFRSWUhIYjUvajBtTmFK?=
 =?utf-8?B?UDNuQVNIVS8wNDNvTEJnNHNsSjN5OGkzenB3ekVqNno2UDlhMUNPSEk5bWhZ?=
 =?utf-8?B?djYwZ0lwc1gzNG40TXlVai9DQ3JCaWhCT0lnUWd6eFJEYUszZVpJWkFrNlJM?=
 =?utf-8?B?QUMycGx0UGdQS2dZUDNkcDJFNWlEbUNmajFOVlhobVdDUFZVeDh5UGxyK2s0?=
 =?utf-8?B?MUpDS2krZ05Eb1pDd0FkTDI2SXZCRytNYTNmUTVvY2dRT3Ntang2aXZJeDl5?=
 =?utf-8?B?ZWxnOEpqV3cvNVZkR1VuZFBXQjFjM25QZktnQkJ2ekVSTm1CempERzVHTVN0?=
 =?utf-8?B?bHRzV0k0Vlh1Ykd1YTdTSTJzaXJJdVl3ZzBDNGhTd3BSKzljcGNUd0g5UTUx?=
 =?utf-8?B?MG5lUjhTejFQMjUveEd1SnF4bGIrbFdRSWF4N0tJR3lZNGZaUmVqeEF5R2Vr?=
 =?utf-8?B?TjNNSVdnQ1BjVHRRbEN6U1IxV3pWNXlGNmU4bHFSa3lJUWp5aGRiaGdsOTBI?=
 =?utf-8?B?cldIUy9IS3dpc3RQb0RvYXpURzhhWWhMRkpCQnRoM2NobGIyamJXbjcrVlQ4?=
 =?utf-8?B?eVVuUEdkSEVPUFJEN0czMWJqeFcxYk1qNVQ5b2FEd0w1SlRrY2ZWVERTZjZt?=
 =?utf-8?Q?0bDmmTtjEi4XHdQ98OAJp11So?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b19d8bc-8180-4f09-f7a7-08db724f38ef
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 12:01:18.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVqB2z2JeLRtlHG7nQanac/qL5q/3rnUFQbAKkZJRBCHpxRtYH7RdNXij9ZtYWGJ4EP0tQ6d4rpZVFucnSauzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9695

On 13.06.2023 12:32, Volodymyr Babchuk wrote:
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -180,6 +180,44 @@ static void vpci_remove_virtual_device(const struct pci_dev *pdev)
>      write_unlock(&pdev->domain->vpci_rwlock);
>  }
>  
> +/*
> + * Find the physical device which is mapped to the virtual device
> + * and translate virtual SBDF to the physical one.
> + */
> +bool vpci_translate_virtual_device(struct domain *d, pci_sbdf_t *sbdf)
> +{
> +    struct pci_dev *pdev;
> +
> +    ASSERT(!is_hardware_domain(d));
> +
> +    read_lock(&d->vpci_rwlock);
> +    pcidevs_lock();
> +    for_each_pdev( d, pdev )
> +    {
> +        bool found;
> +
> +        if ( !pdev->vpci )
> +            continue;
> +
> +        spin_lock(&pdev->vpci->lock);

Following the description of patch 1, why does this lock need acquiring here?
The r/w lock acquired above should already guard against modification.

> +        found = pdev->vpci && (pdev->vpci->guest_sbdf.sbdf == sbdf->sbdf);

The LHS of the && is pointless here - when acquiring the lock you have
already de-referenced pdev->vpci.

> +        spin_unlock(&pdev->vpci->lock);
> +
> +        if ( found )
> +        {
> +            /* Replace guest SBDF with the physical one. */
> +            *sbdf = pdev->sbdf;
> +            pcidevs_unlock();
> +            read_unlock(&d->vpci_rwlock);
> +            return true;

What use is the result to the caller with all locks dropped, and hence
state possibly having changed before the caller gets a chance to look
at the result? If there are reason why this is okay, you want to (a)
spell out those reasons in the description and (b) document this
restriction in a comment, to warn people who may want to (re)use this
function. But really I think the caller needs to hold a suitable lock
until after the result from here was consumed.

Jan

