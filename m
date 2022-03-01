Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8383B4C8702
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 09:47:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280988.479122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOy9G-0007wD-NZ; Tue, 01 Mar 2022 08:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280988.479122; Tue, 01 Mar 2022 08:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOy9G-0007tP-JV; Tue, 01 Mar 2022 08:46:22 +0000
Received: by outflank-mailman (input) for mailman id 280988;
 Tue, 01 Mar 2022 08:46:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nOy9E-0007tI-Tj
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 08:46:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1000ebaa-993c-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 09:46:19 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-_HzsyLxQPCi3Cmny5iMOww-2; Tue, 01 Mar 2022 09:46:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5424.eurprd04.prod.outlook.com (2603:10a6:803:d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Tue, 1 Mar
 2022 08:46:15 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 08:46:15 +0000
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
X-Inumbo-ID: 1000ebaa-993c-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646124378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0T2Dj9t3eq40h1Iz+f+/8zWi+R815wSe5e6l/W5S/+g=;
	b=dGVogbRfjFxTTMhPtzVSgW10wWJ4Xg0do8d9yWziR5jdzyk+zrZ0/hCDxfGJgQC96vpi5Z
	axF9VoyxQaPrZ85rGpasHr2Gtu/DLn8bgFOXSGUooDdNV+nhT1IGv5DG9UFfAG8e8Zb32p
	EdOFCvJF0Ctxty54jhmM9uuFHzg3lBI=
X-MC-Unique: _HzsyLxQPCi3Cmny5iMOww-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHiQOl9Xpdcx3zQUCtxZnPe1o0vrWqrcZfxiC++CGFH7dk18d9RU686Te2rnT/UGIoqvZLw/hWv/ROXGK4xP5VSODAsxX7lb84UxV4vT5efDGlPcb7E3ZvlBEaDKUN5kaa+uAIFxIGDoNrSNVLIL4hEGINUnMcZDQO2xjvWODEhreRv6JjCL1tEtxefx1Qv79OrmMbp5ALVK11xwsdCGXPL5MfLtibHUsYQFpxEG6mH62/hPOpl0fhA06g251ZqrmeQnoqUyUPFv3xUHjKTIdnjdOcre02TzyHMZCywQCQj4ucLhFr/xPQkviRRmAsyh2szWcyG2YNnosEgPTtJ+hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0T2Dj9t3eq40h1Iz+f+/8zWi+R815wSe5e6l/W5S/+g=;
 b=SurXWv+1bV5kSxfmGEEmwZ0EZXf10pRKdxFDOcvyUfmiGw8H8WU0n0tyBMThRTEbREtcbFmpd2s3VKemlGAZunkLa3ztn66ELXSj3dDNOckm3y1GD0MALLlpb1ZtqRFNvQCJQ9Jk6Jelg3HWQ9HjZZFrXR/ORRBXNtnOKShKIEs2g27LNR4J0LDaw9STpoOj7sRDq7dGeZQrHwSdSdb7fqvHlLCxN1NBJO/lsR0ubnKoAqodWDd/Z78moDOcqynlmglhqtrFDddhref1LBOqOKFDv9P4e7oBkKu0gElOHqpCctYwJ2u08GzEpZ/9Tmaiy9dp0zKOn4/NJaOIAfF1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8597cd20-4d79-0f5f-8370-d2353e7116f7@suse.com>
Date: Tue, 1 Mar 2022 09:46:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2.1 2/2] vpci/msix: fix PBA accesses
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Alex Olson <this.is.a0lson@gmail.com>, xen-devel@lists.xenproject.org
References: <d8da3251985684ab9099ce95a8329a7e35535a7b.camel@gmail.com>
 <20220226100554.2664-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220226100554.2664-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0097.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f64deea-1204-4e80-44f1-08d9fb5ff243
X-MS-TrafficTypeDiagnostic: VI1PR04MB5424:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB542459E527620E9177E148DFB3029@VI1PR04MB5424.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sNKXlSlPJ3AJb+BOJh3EKVNSxdfEU2J2UTfSCzR2lJBi6LY2i/OrhunvrbXAOfxUfO+Tq57RG4B1sGVi4TOk4KEw3iC/VnApr+/wlzjV61LaaPoNdSNwdYyKOUn2Nuc3PMEKyRHC2+CQYRsl9ZJ4PN9bNrJcuTP1Ic9DAQAPY28U0nfXU3HFT/AEkVjkiMXkxlfJB/oeZxJ4OxFVe4NaT7UzQcu+Dmo2AL7WBYN6dQ3dEyZNZSyVmu5TcdY3js6AU+o+Xi5JbPR8xITZWLwjPZwl8VJCy4pzePKyAIRVPm7WfhYXQjC8rxF9WTGkNRrcfks02ObbICUIZSOs7bM/JCSyDhItE6aDqI5hrSmgijHBQZfxXv2NSv3Z4uQxgd4Bf6AKWvyjfJireJ65dErsBOVQPkauEGxqJVUPkMkMSM8VYDTmzjUiD1StMWIGk5ar7X/lvWQdrpvkZ42s/9RlOYoYikWnfOpTYt3BAQSOl2nNKzbnLF5TYdFl++U/sZNWBKxVudetxtHKYIIFA0jpnSqugf8x1jWPviJUA0XFuEuf+6yBPCNGN4oZZOibjeDRBW9i9AH303EXNef4sNIFyOm/jfS8WV8+ZttaCAfSe33zUOgrSATkyVI17wqdBkgZVGckgsS9G7Z7nDd/c2GWeAzOpcPHV+FEBdwMl6VI5zsEkLxTUcCkyZzSbkl6bFFx0fJ88ylWBzBQbjiLpQoyv18EO3cPKh41KtmLctAVfSSnzX/t4rwY5soEJ6Ai3SUO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66556008)(8936002)(38100700002)(66946007)(6506007)(508600001)(6486002)(5660300002)(8676002)(4326008)(66476007)(53546011)(31686004)(36756003)(83380400001)(6512007)(2906002)(86362001)(2616005)(6916009)(186003)(26005)(31696002)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFlWVXlvN1BTR09IN3daam5RTG1vU252allvQnVlTDFtTXY2aHhWRGRhZTZs?=
 =?utf-8?B?TFdoUXdvZWMrRUZQam1HS3V1V25oTm8zWDBHRUxTTzdobENNNWVBaDVrZFdk?=
 =?utf-8?B?UWw5ZG1mVGRrcVJEcjkyNmJoclF6Rm5yQkpZS0VCWGNLanVMaGROOTRNSlBu?=
 =?utf-8?B?cktMY21TVkFjRUUzUGliQyt4WjJaMHB1Y21keFZBN01YdlNFWmtKeUR3cVNI?=
 =?utf-8?B?bkdSQjdCZVlHNGhObDRyYXo1L0JFczNIUE9PeTdpc0hvWERPdll5ZkkzUVNR?=
 =?utf-8?B?VzE4cjBvdGcvN21EYWxwNGRDdDIxWXlDZVIvdEdMQkxzSkhaUDhLR1BpaEhC?=
 =?utf-8?B?WlBMOWNESk40V2RQNnV2RzlkdlpUZU9TRDFxTTZxUzdWS2l5aXJzWDlZR0Zh?=
 =?utf-8?B?VEF2c1IzeE54NXRqRFhkM210VFl5WVNnbTVuQkphcDcvTW4za1pGbHlreVo2?=
 =?utf-8?B?VUgwMzZQcmhTMThLc1dxazhBR0lQSWgwaHA0R3pmYUNGaVB6V25PdUVvRDgv?=
 =?utf-8?B?UXZKckFsc0p6WmkwUERvL0xyT2lRSnRzZVdJZWtDVVhzaUtTaHV1cVc0NmpS?=
 =?utf-8?B?QmJIOVV6eG5admFKQk43cGY2U2Y3SisxV3FKMHdlRFloNmlJc2FTcHR1YStr?=
 =?utf-8?B?S3lzTjZ4OFowNklXL3F6UHdERHliTHJaeUVOaHF4STJpWTZQT1I3K1VqYTU1?=
 =?utf-8?B?VFprWis1M2k1UUVlcEZrc2ZSV05jWXBsM0VwRThGUVBPaU1Td1MzQldqTERV?=
 =?utf-8?B?elFIVnF2cnkxNGpHbEwvblEzaUFlS2hveTNXUUtKbmR3VGVYTlpxZDNTQ1VJ?=
 =?utf-8?B?Um5LejNQeG9KeGdLZkRpRHhIYkZkYlZQVlRGTXAra0hSNm1mZy9NMDdjWjN6?=
 =?utf-8?B?YlkzZEJJSEk0bllyRyszckNUclpFUlRpdVdhc2Q2MlorL0tFRlptVGZnYUc0?=
 =?utf-8?B?UDdNOTNZS3RIbWhoQUxhMjRDMFROWGovUmgvZFpRZkpyUEdPdm1mSXAwcW1D?=
 =?utf-8?B?Mk9hVEJ0bUc5NWdMS2hPdXNvVVFyakhjVHVDN29CcERtR3ExNHBYbzd3UzJN?=
 =?utf-8?B?OGhwUFRVa0VQa1ZGaVhKS09yMGJueDJyNVN0eVVqTlFKL1drRzFrS3lZN1lQ?=
 =?utf-8?B?ZmVna0kxVzdvRGZRcnIyVzVSVVhHbjZoOXdoaktSMVFLWkRpNGJvQmFaenJY?=
 =?utf-8?B?ZTM2SlJLc0g2d1FwVGdmTmhwcWpIaGFaYlNPSUR4U0NOMlV1dGh2MFkrblUx?=
 =?utf-8?B?TzNrVWVGdlJ3cXpENVk0MEJvdXdrbzJnM2U4MFYyK3VlNE04UGEzODBMS2xl?=
 =?utf-8?B?K1BScXlHUmpHUUkyKzU3NWk1clRMV1pDYm16d1lxbjllUmsxdlZNallXeEEz?=
 =?utf-8?B?QTJ0UnFRb2ZIL1lHbTk5clVHZ1JqZlFEMzc0NnJMU3lVOXo4VkVlQWl1em42?=
 =?utf-8?B?bHJRSGY2aGYvSUIxU2pUSmtHcGtjSTQvZi9tdGxDTjdSY09pNkhZUXFlbGE3?=
 =?utf-8?B?T2ZkMTB2VEczMDBqQU1NaGNmY1ZVRXBSNkdFY01Ha2RrS2RwV0hWVWM0QWJ2?=
 =?utf-8?B?WnVDM1p0cUgrbDZtRGVPOVFMWjc3U1BOZE16ZjYxRjE2THNXZk83dVpHYWdl?=
 =?utf-8?B?ZHFORWx1WmZBMjhpNjZ5UVNXdXdwY2JvTkhXK3NwRFUvcHJoVUhpWlhkVFBH?=
 =?utf-8?B?UTZMa3ZvdW1KWkJzUkpwdHdybkN2UTZuZ09WU1haM0hxcU1UcnpITHczNkhX?=
 =?utf-8?B?V2F0cDU5NkhOR2xWQkNUY2lQdVYrZUl5NzJ5M0ZWUHN0bGdDTkJhV0VwMm5y?=
 =?utf-8?B?b2w1YjduMUFrazViVEd0MkM2SGVKclhabEc3VFFMdjU4RUZOVmNsUXZvQ3l5?=
 =?utf-8?B?MklDZWVZOVlIR1QxZjRqSm9vZXl5WUh1Uk95KzVPa1BQRUdiY2tyZDRUUFRZ?=
 =?utf-8?B?MkIyOVRGN0p3eDdVUDhVZWZIZkMxMktNVU5VenZLMGhMdUJXajM0bmlFQXpE?=
 =?utf-8?B?bWNsdDZ6bjQwZG9aeTAxT2F4djNISDlWNUkvNjZPZlpRZ0I2b1R5UXRFS3pt?=
 =?utf-8?B?RHpicFJhMy9UY010b3B1UHI0VGJKVUFUTVBHeGpvd1pFKzZFRmpzVUEvNzdY?=
 =?utf-8?B?eDQrMi8xY3RiV3hBSGpkZEVWcHF4eWhERldNaW1sUDhWN1BZK3V0Myt6Y1hR?=
 =?utf-8?Q?Tjdf55sd5zLobh3GUEPM2EQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f64deea-1204-4e80-44f1-08d9fb5ff243
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 08:46:15.5533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdhDQLFNcgQX4mlRryCXlqovjUkz5WcAh+QZWODcXyQkfL8zaac/3ZraW2sWQo2ISPhI8Yl9HnS6nRbT3c2cJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5424

On 26.02.2022 11:05, Roger Pau Monne wrote:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -198,8 +198,13 @@ static int cf_check msix_read(
>      if ( !access_allowed(msix->pdev, addr, len) )
>          return X86EMUL_OKAY;
>  
> +    spin_lock(&msix->pdev->vpci->lock);
>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>      {
> +        struct vpci *vpci = msix->pdev->vpci;
> +        paddr_t base = vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> +        unsigned int idx = addr - base;
> +
>          /*
>           * Access to PBA.
>           *
> @@ -207,25 +212,43 @@ static int cf_check msix_read(
>           * guest address space. If this changes the address will need to be
>           * translated.
>           */
> +
> +        if ( !msix->pba )
> +        {
> +            msix->pba = ioremap(base, vmsix_table_size(vpci, VPCI_MSIX_PBA));
> +            if ( !msix->pba )
> +            {
> +                /*
> +                 * If unable to map the PBA return all 1s (all pending): it's
> +                 * likely better to trigger spurious events than drop them.
> +                 */
> +                spin_unlock(&vpci->lock);
> +                gprintk(XENLOG_WARNING,
> +                        "%pp: unable to map MSI-X PBA, report all pending\n",
> +                        msix->pdev);
> +                return X86EMUL_OKAY;

Hmm, this may report more set bits than there are vectors. Which is
probably fine, but the comment may want adjusting a little to make
clear this is understood and meant to be that way.

> +           }
> +        }

Imo it would make sense to limit the locked region to around just this
check-and-map logic. There's no need for ...

>          switch ( len )
>          {
>          case 4:
> -            *data = readl(addr);
> +            *data = readl(msix->pba + idx);
>              break;
>  
>          case 8:
> -            *data = readq(addr);
> +            *data = readq(msix->pba + idx);
>              break;
>  
>          default:
>              ASSERT_UNREACHABLE();
>              break;
>          }
> +        spin_unlock(&vpci->lock);

... the actual access to happen under lock, as you remove the mapping
only when the device is being removed. I'm inclined to suggest making
a helper function, which does an unlocked check, then the ioremap(),
then takes the lock and re-checks whether the field's still NULL, and
either installs the mapping or (after unlocking) iounmap()s it.

> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -127,6 +127,8 @@ struct vpci {
>          bool enabled         : 1;
>          /* Masked? */
>          bool masked          : 1;
> +        /* PBA map */
> +        void *pba;

Here (and elsewhere as/if applicable) you want to add __iomem, even
if this is merely for documentation purposes right now.

I think you did mention this elsewhere: Don't we also need to deal
with accesses to MMIO covered by the same BAR / page, but falling
outside of the MSI-X table and PBA?

Jan


