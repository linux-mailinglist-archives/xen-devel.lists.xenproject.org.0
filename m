Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FE84D1512
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 11:47:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286727.486354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRXMM-0000R0-C8; Tue, 08 Mar 2022 10:46:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286727.486354; Tue, 08 Mar 2022 10:46:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRXMM-0000NX-8I; Tue, 08 Mar 2022 10:46:30 +0000
Received: by outflank-mailman (input) for mailman id 286727;
 Tue, 08 Mar 2022 10:46:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KW+D=TT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRXMK-0000NR-F8
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 10:46:28 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00f2fa75-9ecd-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 11:46:26 +0100 (CET)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2050.outbound.protection.outlook.com [104.47.5.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-1wgleEBHPvO1rW_-4MeDSg-1; Tue, 08 Mar 2022 11:46:25 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 10:46:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 10:46:22 +0000
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
X-Inumbo-ID: 00f2fa75-9ecd-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646736386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WVuaexOvv5GeMIS+/8zCvCLyk6peMWkMfIPEUPZO7SA=;
	b=cC/LtocTkXqOnnZej+BLLy14BC36D2COBEsDbgniJkVFaN9kuXit7HHP17YhOi4NfwmelX
	A+RiU7KifM2TQSSWkqZ9hKS47jLZa6EZRYNbQj1UrNx7kw5zAfKsZB5wn30EbN4sUHZ525
	JkdQIhcFqErXuoBRT4AkL0tc0uswqZg=
X-MC-Unique: 1wgleEBHPvO1rW_-4MeDSg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5FxWul2jJEoUBwP9Mbvr+iKLkX4zAIM1G7Ay8pdFVMl3xM17BlnPEFqRYSn/32fWN9/+ymtwYP8um3VH854QO+4MECibVhUGUahcKg++H0hLGD2n8nsq4zvbp+CWF32TvaQiU2s1BgWe0UPgDYoOpMjbvqD5YkVpSxS61AYHTQ9B03AdUySGS73jX/96JznUJ77roVc9Ae2uF7rDxS0sBtbM9of4SEbHp9sKkNgtAjYJ0dhepCBXKFelXNaN2mOxRqXhkNdt+WUWTsNfCCFQZfQYN4JRdzh9jFN2aQgkYLoQbTvzSazR34Il5mQoHGGmhDRfGy6vBhc9pHgFmRm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evRIC5qTSl1HD3cmRzPh9aztqVRrw9cv5kUjLlqScTg=;
 b=Ly2GyA1C+j5d6MZRzlj9cj0RO6yXn1Fa6LtAXl8HjJ46+oCR9M3Hltd9WPwuRJdpO2BC6cZgNeGYNMoFvq7KTjcnqbZSYIxPe67Wtk1d72z47I2yp2CT00zp5le2MWgQp+dlBeUFzxaI+Ywcw9YMoX1Ncfm/9m36BVfF+u1YOl1TSCedGB27fioZHy0i3CPPUFiIUSp35k2FCrQb7G0BAF6TRtBQu8g+IWI87/mHqyDBhEHb2r7QLaadlahQccs665o+G5aFGWWwKvxdnBbOFe0REG9m/84jOrpPvApycCbaZxzWuO9eyyyrVs7Lpu/G+3YesdzzTgPMaqM7VLIeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b24007d2-1b2c-8358-e72b-2be49e62f065@suse.com>
Date: Tue, 8 Mar 2022 11:46:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4] vpci/msix: fix PBA accesses
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, xen-devel@lists.xenproject.org
References: <20220307163744.74030-1-roger.pau@citrix.com>
 <fbc1388e-8211-f498-b134-4df5b1ccd003@suse.com>
 <YiccSMWbV2StPFB1@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiccSMWbV2StPFB1@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0095.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8df1517e-31c9-4cf5-3494-08da00f0e2cc
X-MS-TrafficTypeDiagnostic: VI1PR04MB7101:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB710176F261A7B8667855F39BB3099@VI1PR04MB7101.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fEYuEkM/LRBZFnD3wKfUmFEs3U5d07JmHNZcGTb/+ffWK+hi6gOLHCisu+81mpxzEpflL4NEjmwflr4iHl4dGQReWGpXXTH/ZvjvpOF12GiqT/IrcYtfjcY1Gvcsyyr1gJaNM+Tzig/FGL/D9FCXHyq8qvGYZo7mqfouHohJF8r01yZDhEGF/TjpUOwfrgxA2Hio9RwcKOXcc8xV/JgXrUQBhqWwSNV7y+4kxyuh60K/JoMu6iDF0j5FYLO5TYOlWLQ9KQWOngDBHL4fT7W5W8j1wcaOwfVrRxXTEj6KK+z6CwVdMYMTR5nphHxePRpyybhmj9GRhdXjCHkaJ0/18NOkzDczx5HhhuZZJ+elFnL50WEkVdHjiqoAAguhfMkgggOuLuUoPGuEcMo3PCW/wzK4LoibjdnFjOQHK+/5WfU8HmQuGLgpNgX6Zah8NC+tRHeKSC82IkPY7fxaNEcPaM6HgIxZfZLYXtZfWtlZAZZgzXNZw/1hMGqLWVRV9AvSAH2cpWXnCdQfxXDYqI+CEG5drQAwQsGghfTR6FbhW2F2HvcKt1Tk+xBclh3IhSyOT1kNlaxsKcY+L6t8b7eLIW2Wf4goykjJvEb+3pfyYj1n5mZjQuJd70RQU73+HpQP6kEw6ywYY9Avq4aFjoNEtU7OSjCoGmuIxyuyZCqBhRz0+5V9efnc2bk7fBXu4ogJJ2XsDq9vq5mLkGaknNbvZAGfjesyUbUc+scnulu4cnI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(83380400001)(86362001)(4326008)(5660300002)(31686004)(66946007)(2906002)(8936002)(8676002)(66476007)(66556008)(508600001)(6916009)(316002)(2616005)(31696002)(6486002)(186003)(26005)(38100700002)(53546011)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?InTKmdHvA1wW2BnEZUI4cCtcT42VUFUF6jKJhTvRe/21kB27R4LElh631gSz?=
 =?us-ascii?Q?cKBBoCdItGhlvcHdzyzhOqyk0WCnmPox1g9verWgkvSK/ugSdkQCC0YQmEis?=
 =?us-ascii?Q?guqBiT7oGhNlvehInqcncvC3+hEASo0Sy34/7HA2YWPVut3CCw6f9UF3Z7g5?=
 =?us-ascii?Q?gnO4vbkZO5Ok34bwmvyO9GJ7RApXA0BOESYDVAE/r9xk2VwlzojgnJY3r9yF?=
 =?us-ascii?Q?uDhilp++B9t9zqCYj7LkHtNsFX0FU+rWW3pAk+wAoHO6Bi51h/Jej4IYfi8X?=
 =?us-ascii?Q?pnpMotMhds789zIiA4nPazwxPMVWimF81WIu+chKGFWkOMsviFGtH4cAWrk9?=
 =?us-ascii?Q?1DpSw/b6o00J/3v70icvh7h0XOVxaBPR1TgNccuQN1UaJiph1MDqMXuaZQAq?=
 =?us-ascii?Q?9vyqZZLcyPvTB59dwr9eS3a7uZptWzY2+JTvfZq8JgFLum1tFWyqzkXUV6pW?=
 =?us-ascii?Q?h5rk2ZGnXIjR428Vo/sWy5OaTuO/DR0edt/j+xXqX5xL2pvH+9OlaMsvtgtV?=
 =?us-ascii?Q?Q24KfYVAuc1MtPBTjby+v4FQvy1UpwyvcnXpLhyky2O1/kS+NCVC1t9kfdky?=
 =?us-ascii?Q?xqyhs21R4t1U2CQWe7X8auQ1I2MnX3p+AiHjSsm37iGNquUn3v5Stw4xji8c?=
 =?us-ascii?Q?VEpX61DKBSjOAz86kd/t+tTS+FO8rmfB3mLwDlXP3z0PWSiWNwQtaYHI+bVd?=
 =?us-ascii?Q?AV7I22dIKWdKKyU/gVC0lRCEAGXVsBuQ+svg3+smmDHYQD3Q37ssjIHhzQ1g?=
 =?us-ascii?Q?eBtddDG3uvYnw1pap0uKaQAjmoPXpeokvCix/Nxxzmj8jC+iL0ujS1RvqExF?=
 =?us-ascii?Q?9Tj7tausmmyUAf/8q9nFa7QvodFDqBtkTeujWszqBp2MJeIOwnFlJgClWYLb?=
 =?us-ascii?Q?lPk3RfNLYdGtdOkOHKLq4QYdZbnNQ721xtOl/cgennlBxjYU0YzONpo4cvd3?=
 =?us-ascii?Q?rQS4MxBPEjHU+ejQxQJwiH+ucNzxGeokmGKszAZU2qwjDsXJcoBmydErKgI9?=
 =?us-ascii?Q?U3+chD0ahPyGrBVn6zdMrfj3BipQdn1XK7ceqOKdKdtDUG3T48yjBT+4jDHi?=
 =?us-ascii?Q?5GeHbM1IufIVpZx4FVx/1bOGsIkTQdsOXKnvbUcH5Pf4gZvvVtNJulcui0eO?=
 =?us-ascii?Q?UqS5QuIvBv9np671OWeDZ2U7lXkcqP+PZt0r5O6aIoJFAvY4BbJiXukiOApS?=
 =?us-ascii?Q?dxmrw8sEFyd2ua1HvxkDJg9B+jWovh0b74HqLUimBOJQJKwElhC0uy6gCBTN?=
 =?us-ascii?Q?FJ0tjyjLn0l1Gs5y6Z05x9W+RYIjSrcZ5ysxlhOo39HPan2D0pUwbq7XDFTu?=
 =?us-ascii?Q?saBJG/6EtUFxM9OtcX1OXqSivGTYSCuKEuhhMIUDMRxMSpVWrfrJSw4/E3c9?=
 =?us-ascii?Q?OILyeu9N0fmVZf/CeOYXRn0xkkGosWCb1/p5IyGYyP4SZa1OA1aDFLTIZ4MM?=
 =?us-ascii?Q?Nu3+EWXv42EBbnBdCJtOmzluhGocZR0OMETIiWm17TVwgWY/IQ1WnWkCsh4W?=
 =?us-ascii?Q?DLb4fsrOrPy2Pm/58r/bGcBPDu+8Xm6nmK6EtU969d+vXHRd1xiIAvRYwKei?=
 =?us-ascii?Q?KA/Hs9ZkjQX2LWCefuuDMC3skuguz4er5V0iG079pjkhjDk0kdhITpwb6wDa?=
 =?us-ascii?Q?bwl6yqM923/5jCEgpVWtX+c=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df1517e-31c9-4cf5-3494-08da00f0e2cc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 10:46:22.6031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n+LFYMTwuYMoy7rQu09F1jF7XioJxc3vdkGISlHmUTU1gJMp+0ibiTS4EI5lj6fMx+In7XQJflylIKzHm4G8+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On 08.03.2022 10:05, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 08, 2022 at 09:31:34AM +0100, Jan Beulich wrote:
>> On 07.03.2022 17:37, Roger Pau Monne wrote:
>>> Map the PBA in order to access it from the MSI-X read and write
>>> handlers. Note that previously the handlers would pass the physical
>>> host address into the {read,write}{l,q} handlers, which is wrong as
>>> those expect a linear address.
>>>
>>> Map the PBA using ioremap when the first access is performed. Note
>>> that 32bit arches might want to abstract the call to ioremap into a
>>> vPCI arch handler, so they can use a fixmap range to map the PBA.
>>>
>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>>> Cc: Alex Olson <this.is.a0lson@gmail.com>
>>
>> I'll wait a little with committing, in the hope for Alex to re-provide
>> a Tested-by.
>>
>>> --- a/xen/drivers/vpci/msix.c
>>> +++ b/xen/drivers/vpci/msix.c
>>> @@ -182,6 +182,38 @@ static struct vpci_msix_entry *get_entry(struct vp=
ci_msix *msix,
>>>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
>>>  }
>>> =20
>>> +static void __iomem *get_pba(struct vpci *vpci)
>>> +{
>>> +    struct vpci_msix *msix =3D vpci->msix;
>>> +    /*
>>> +     * PBA will only be unmapped when the device is deassigned, so acc=
ess it
>>> +     * without holding the vpci lock.
>>> +     */
>>> +    void __iomem *pba =3D read_atomic(&msix->pba);
>>> +
>>> +    if ( likely(pba) )
>>> +        return pba;
>>> +
>>> +    pba =3D ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
>>> +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
>>> +    if ( !pba )
>>> +        return read_atomic(&msix->pba);
>>> +
>>> +    spin_lock(&vpci->lock);
>>> +    if ( !msix->pba )
>>> +    {
>>> +        write_atomic(&msix->pba, pba);
>>> +        spin_unlock(&vpci->lock);
>>> +    }
>>> +    else
>>> +    {
>>> +        spin_unlock(&vpci->lock);
>>> +        iounmap(pba);
>>> +    }
>>
>> TBH I had been hoping for just a single spin_unlock(), but you're
>> the maintainer of this code ...
>=20
> Would you prefer something like:
>=20
> spin_lock(&vpci->lock);
> if ( !msix->pba )
>     write_atomic(&msix->pba, pba);
> spin_unlock(&vpci->lock);
>=20
> if ( read_atomic(&msix->pba) !=3D pba )
>     iounmap(pba);

This or (to avoid the re-read)

    spin_lock(&vpci->lock);
    if ( !msix->pba )
    {
        write_atomic(&msix->pba, pba);
        pba =3D NULL;
    }
    spin_unlock(&vpci->lock);

    if ( pba )
        iounmap(pba);

Iirc we have similar constructs elsewhere in a few places.

Jan


