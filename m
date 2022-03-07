Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0484D00D5
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 15:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286076.485426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRE6G-0007SA-4K; Mon, 07 Mar 2022 14:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286076.485426; Mon, 07 Mar 2022 14:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRE6G-0007Q8-12; Mon, 07 Mar 2022 14:12:36 +0000
Received: by outflank-mailman (input) for mailman id 286076;
 Mon, 07 Mar 2022 14:12:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRE6E-0007Q1-Uq
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 14:12:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1bbbfde-9e20-11ec-8539-5f4723681683;
 Mon, 07 Mar 2022 15:12:33 +0100 (CET)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-HQvrv3vaNAK1Yb_1AjLqag-1; Mon, 07 Mar 2022 15:12:32 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AS8PR04MB8658.eurprd04.prod.outlook.com (2603:10a6:20b:429::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 14:12:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 14:12:31 +0000
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
X-Inumbo-ID: a1bbbfde-9e20-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646662353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKUf4j+vtRwEuE8r7CIp+76QvTBHVqvnLlWbMSqE0Uc=;
	b=WNrZdGMCV9UjUw9mc/cda/WzlCiKJjdPZqMoy/mjUVq/xcCSNBTKfpErpbN7tUxmJZnKhe
	5wR+VeSTfv43CL2KKpjmR9yRpAjNV6NQ5NagJFzbB7TZKF/17w8oWdBzvXsVUQiLlIuP0a
	Mtn6kZv5JZn/dkBYB6Ry8WMH3ZlC43I=
X-MC-Unique: HQvrv3vaNAK1Yb_1AjLqag-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWc9fTI5G+j5PXiAqTzteipMU6jOuKUEY5Y44jva43hricldkgNZeHzgbNwHv7VaY2PNFn+gKRT/Y0ISQN7FHDPQ6NfNS2OWp54Hi89R19vOI3CBwt8AZgHsO8dLGR1fSUFXGg0pn8eglTNkH61vWTSHvdSLckVMsnwiVuDuX+W5wh6Tra1bwgBM7g6xeFoO+r5Y8SZ94huQIhr2JHyu8yXAibyPNZTZboQCO8ohdvbnffkdm9Wibw63VxcZnVztZWyW0b8EOJokeataPApJvSb6tD8pJ49WR1FgD1KN3+TmjWCqWwd++Tl07ovZQkxSs9EC1a89UV2dJpWwVt+WCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKUf4j+vtRwEuE8r7CIp+76QvTBHVqvnLlWbMSqE0Uc=;
 b=C8AZ8IrCsYuIcKIo1ebSm6H6H4Xt7UjcV+JbnaFjhbBd6qYdwyVVZJrO8wl816uwufguYYT5KthI4lBKWY5tOlyadfkGJQ32dXj2YisyGBilE6yFX9UhGfUio3I/6yNeu/FhPK2BOHPHwyqUIxyuaVzow1/ph3nn3HYKdR9wNHO+7FsRKWFNJZUCR7E5OKwIeFL2jDIKIcZPTLr1GW765A43W9/E49e/+2gA/oLX7Y7hxEtck7yxoaPRIO4c6PMwg7LBmoWZXgn7Nh5+xz0d6KOt0H5HUNIWyJdTRd++/H4nnoD0u2pspNAnRg9CeO2410oprZFxJDHIVC/0XbABew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1480fa5d-bcee-e945-6b2f-9db7931c63af@suse.com>
Date: Mon, 7 Mar 2022 15:12:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] vpci/msix: fix PBA accesses
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Alex Olson <this.is.a0lson@gmail.com>, xen-devel@lists.xenproject.org
References: <20220307125347.71814-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220307125347.71814-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0145.eurprd04.prod.outlook.com
 (2603:10a6:20b:127::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f8acef97-1a84-4b1c-3023-08da0044848a
X-MS-TrafficTypeDiagnostic: AS8PR04MB8658:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB86588E964F4FB8A49C9BF742B3089@AS8PR04MB8658.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LI9COhIdddlersQEgBZlWMa7iGEZhcxTc9hOEkYzpLFDml+hnHxK6oS5UN0S4xJprKqFQIIZVDsiM/FCObtrEBYp+PyZq70H6tNYuABOL9dx25fWElXcEgdx8GD+J0VEnChmeMayEqdY/8U6ehZrnfuHnXHWSV7Kw3n6vlgFpTtgxsiY2pEINxDN0aQNuPeV2mG2t6MFDGFwjuz3ihJ9V7ytPvAJigjk+LZJjb/hEDFHk1OkT37fseijkdcOzmRuKwCUrdroc8Wf8fqFZM4tUtL3ctXfjNoDapuzmIspL12aiao9RjoXoAscLAGxCANAcxaZL+fWWDZT2sOiKP+tzCz2VIGJPvbbFY7yWvCKMaRG2XbwsY+bdPPVphx/lPE11PLXt3C89wbnMk0iWHmqefdEM6pGGLStMuAAMBMQmGawaO35fSK+AYYmp1LQs0mmnQFH51KMOboty44ro21HbuUMQ6YxyYLXJYmBuAZQ7UHpPeITv584mlK02rYjm6nBd7/5v2fXcaP8XESICz2k8JnXn5p7BJqbN3nQL54uBqrC/D4vSlxBdmbAwDZSlpzJlDKK5CvX6+2wXXoKOyUVexLI73WOmhzSp+Jgs7NwnzQY3+VJvgaxqugbw1TBWckMJSDR8/V0VBSeSpeXTDEEMOHDeAkl6I5q4fGGoj2fGma4dmsrQW3ljylu65ZSkiDZE+eWFLjyTAz/XOkCmihu3pgxSXSsReFOGkwuOV0kFfQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6916009)(83380400001)(316002)(31686004)(26005)(186003)(2616005)(508600001)(6486002)(36756003)(86362001)(38100700002)(5660300002)(6512007)(66476007)(66946007)(66556008)(8676002)(4326008)(53546011)(6506007)(31696002)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N2JQNE9DWksxSUJIT1RsSkN6WHFEK2s3Q3NnZlc4ZmlOMUZnVi9PS2lPeVla?=
 =?utf-8?B?R2lyMGVMNk43cUI0dWR1VThZenpheTVkSU5wdktkeHJuaWJxZCtaZjZDNHl1?=
 =?utf-8?B?eWg1RHZ6S2ZoTUxwYVVEV0FPWk9NdmUzeUtIb1liWmpwYXFxVWRlK0t2Y1hn?=
 =?utf-8?B?V0JhOUZaMk11M2MwdXpRbDFEWVZwQ011S015ajVuR1M4ZkdEZEUwZDlNdVMr?=
 =?utf-8?B?ZVp1eFBNaU04clQ2QTRGeThqREJKb0xHaktMYVc3L1FlaEtleWV2RzluQjBw?=
 =?utf-8?B?SlhueU8yejNXK2ZZb3dhTXNmbnpteG5QVjFyOSswL0V0Njc2MzR2K1dvUW5a?=
 =?utf-8?B?Zys3TXA1aFRGK05EUDZ1NzhmcGFlQXFjbFVGRFhDOU10S2FwSVZJWWVSczE4?=
 =?utf-8?B?SVJPM0xvMjFnUmd6ZHpzK0tiQTZmQXpoMXdFNTJMcTJBeXNReVRoTmRKZjhv?=
 =?utf-8?B?ak9SNXluODR2aEFuQ3oyTnlueG9KeVI2WEdpKzcwOVVxenplT1B0Vy9rRnd4?=
 =?utf-8?B?RmVWZ3hpeThqdmFXenR6Ym5Hcks4YnVqOEM4MFM3KzRmM3VZS2NDWThaSE0r?=
 =?utf-8?B?VHVzVEcveW1KeVZIcjliMzRwV1F4dys0SVNXTGhMazNLWHE4NU1LYjBMWHU5?=
 =?utf-8?B?azA0bzVFVGl5MzQzRVBRWDMwUFltQWVIVEFZcjhHcFhJV3NhSUtJd3NzMnVR?=
 =?utf-8?B?UTFRYXUvc0JMSVdVWjRHdm9pTmFGaGY4ZjY0ODB6VllxcTBqOXJ1b25jWGk0?=
 =?utf-8?B?TXM2SXN3dExIYWdmZTVWQUlDTUNpN1JrNzRGSktuN281RDhxK3pDWTFPZ0lk?=
 =?utf-8?B?RHdKd1NTdHc2VW03UG1uL3hxOGE1azNsTHloRVE1TGlUYVFXS2drRkZoR2pr?=
 =?utf-8?B?VitOU01nUnlQeHpOS1JPck5lWHBmVGt3c2M5YnJlczhtN2Rqd2pSQzZCVEIx?=
 =?utf-8?B?Zko0VWlicjFnNThSMmFJR2lyN2NqUjdlVjFEYUwwVCtRYlZxZmdJZWxZV2Z5?=
 =?utf-8?B?QVczKzY3VzhZWFM4QmJzdEU5VXFqR2JxMW1OWFdWTHhYMXFFRzFqZU5ZZmVu?=
 =?utf-8?B?ZWt2TEpoNHM2amVtR0EyTlJvV0lobFo0S3JlLzRXSHpwUDgzdldrLzh4K0tt?=
 =?utf-8?B?UkMxSk16Q3hLWC9NMU9VWmNoeWdDdk9Hbkd4dnBUNzFyWDQ2SS9PRDUzYmVN?=
 =?utf-8?B?WEhaeVprdlEvenFMWTVUb2ZZeXYwV2puZkoxTGZGUXUxbGZrSjBnN0I2WGp3?=
 =?utf-8?B?T1RlZEY4MHN2VGRzdDN0YjA0NHZFcnVOMTZEZGxiSFVjeVdIRkxqengwcExr?=
 =?utf-8?B?QWhnajdBaHJHMFByU1RwLzVsQmdDRjI0emw3M0JCOGFpU3Ixd2RRVmthV20w?=
 =?utf-8?B?TDNrdk1YR29xMC9CZkZXYTVIQzA1dXlJMS9Vbm5uRnNrRHgzMjVrNVZIR1Bm?=
 =?utf-8?B?RktMbUxKU0FuN2kvVytnTHdURTUzaDEyM1dvQW8zYTNPUWxPTWhQSFpDRWl5?=
 =?utf-8?B?dnI2a3oxNnJRSE12UjlrY01GeVV0aVpDZlQ5MDk2WEkvNFF0Z3hoMlBMQndX?=
 =?utf-8?B?UStEcWIxREdwc2d0NXJoRi9VSVhMbUxSUDBzWlBnQnppa1dGaXoxMHpPdldV?=
 =?utf-8?B?bjBoMEFNUTd1dmhUcFpsL1RZR3BVdlNic0p1dFp6SURuNm1wTitGVWpNWjNE?=
 =?utf-8?B?S3VtQTJKWm9YaGhUM2FBalNhRGpWdXJuMEZNTDV1SDBwTGVnUGJlSXNQRnFl?=
 =?utf-8?B?OVhVbUFoWithU2N5Ynd2SnNITHdoV1JPYjFzSE5JUkJiWWszamt3V2NHVkhR?=
 =?utf-8?B?bzZCOWlsZHUvR2FrblE5eDlMOTRsekdXdUxvTVM4SVNEeGpQT0VWMFI4TFBW?=
 =?utf-8?B?bHFrOU94Q2I5MzRaODJ1aDdXc01QWk5LZnlWcnYzUGlzbVhnemo0dHhYeGZj?=
 =?utf-8?B?ZFpWeGRRM09HM3RZMU85MHAvQmp3RGVPMEhQR05SOTVpZTZsdVMraVUyTTVE?=
 =?utf-8?B?VW5XYjNNeHU1RG91RTZ4S1RqRU1DVWV4YmhwOTVzcm8weHpvaW8zbHlZYWdR?=
 =?utf-8?B?U2k5TEJNc3Z0NHAwaVVGSFpPSWlpM2R1MVJGcklFYmhoQ1BlV1Axdm43Mk9L?=
 =?utf-8?B?eXUvblAyeEdDOE51bXlUaFpzYUliTENyTklOeTFsc01LejhEUTBrK2NWSUxK?=
 =?utf-8?Q?ZwK+/u5qUHEU6g/IyN66+pA=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8acef97-1a84-4b1c-3023-08da0044848a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 14:12:30.9333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnFrIGYGcMiUx/yOJsQspYGPm6MeH76FkAaPDzJ1LS6KlhIjYmTKtrBaxQvboKp3vdfcxU6QeIODmbLSk0ot3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8658

On 07.03.2022 13:53, Roger Pau Monne wrote:
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -182,6 +182,33 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
>  }
>  
> +static void __iomem *get_pba(struct vpci *vpci)
> +{
> +    struct vpci_msix *msix = vpci->msix;
> +    void __iomem *pba;
> +
> +    /*
> +     * PBA will only be unmapped when the device is deassigned, so access it
> +     * without holding the vpci lock.
> +     */
> +    if ( likely(msix->pba) )
> +        return msix->pba;
> +
> +    pba = ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
> +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
> +    if ( !pba )
> +        return msix->pba;

For this particular purpose may want to consider using ACCESS_ONCE() for
all accesses to this field.

> +    spin_lock(&vpci->lock);
> +    if ( !msix->pba )
> +        msix->pba = pba;
> +    else
> +        iounmap(pba);
> +    spin_unlock(&vpci->lock);

Whenever possible I think we should try to do things, in particular ones
involving further locks, with as few locks held as possible. IOW I'd like
to ask that you pull out the iounmap().

> @@ -200,6 +227,10 @@ static int cf_check msix_read(
>  
>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>      {
> +        struct vpci *vpci = msix->pdev->vpci;
> +        unsigned int idx = addr - vmsix_table_addr(vpci, VPCI_MSIX_PBA);
> +        void __iomem *pba = get_pba(vpci);

const?

Jan


