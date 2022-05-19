Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6697C52D25D
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 14:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.332908.556685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrfAx-0003qa-4f; Thu, 19 May 2022 12:22:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 332908.556685; Thu, 19 May 2022 12:22:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrfAx-0003ok-1P; Thu, 19 May 2022 12:22:43 +0000
Received: by outflank-mailman (input) for mailman id 332908;
 Thu, 19 May 2022 12:22:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zL4X=V3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrfAv-0003oM-HE
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 12:22:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d62b990-d76e-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 14:22:35 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-s3qADb2RMcWpGDcK7cgaNw-1; Thu, 19 May 2022 14:22:38 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB5913.eurprd04.prod.outlook.com (2603:10a6:10:ae::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 12:22:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 12:22:37 +0000
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
X-Inumbo-ID: 5d62b990-d76e-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1652962959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QDj8nOLE310Yg9AXe/JiJsw5AnGEe1qU8aPSS6+/iTU=;
	b=XXEFeFW7ZFxW2bNFugi4Be3cy1NinfaCn4q2rybxY1GefDvJ2/q7kyD29z2a3MItYgIeMJ
	wXVEVvLKGjlaBoubi3wDg8YoGGsMRXxQPAw626IpUE7etWghEd0a/gdxgUHZwDp/E/Gs+G
	IOOwpvbvTet8TznI6iBZaTJmyNwuVww=
X-MC-Unique: s3qADb2RMcWpGDcK7cgaNw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2MATuYi1MYHwt35YauMLDrGJy3bwHdMRaLDlN7jpxK8k7WpTNm9ProHG3hc4+gkl2wsAow5ljj/q/uQBwY1H4ka9ewXHxZ/GK9Yl5+IO8r4f8iYH1QwHk1lG3PH9Kii+/wDIGqVFMmEP0hO7Xs4Oh9DqSXuysirKWzAhAyTCYrbaV04eCCRF2SLaCyw1SXIyRNe3tvj17X79mHL/9HbwS23pSa9cmGGAoAj210Yc7s56tTcyVz3YSDkG+oFzgcL8FVxZQts58y5Wb8FBY/WqYXQBKiNLDnRx8dn+9uX45x7WnkjEghSbPgjHCwkgAEqPlnl3mhsXe7f3FFqeKs2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSVvAn9AgHGc4nGZhUV6MD2LeqinleQj4ejUP9yl9XQ=;
 b=ktwgxTMhe7FilWTZ/fYA5JtFWH2mxRHqHXKuGyCMRsYUZ5bcXa2wHbLDj2z5+Ohzcrd+QtD4tX7Z9MFOmGasg9IXJqEGWM38hRcR2LCkkvGl0589p5es40kGqxi0f/CCV9eWRmj89trjqM9RNYtgLv93W+bJy6j0ThbyIGg0wt3Kn5NBYCtUMTj8a62v3yPu8UGE6sLJXn/iOLpFNcuObpoTCqEKlZyM4qdMS6jp5NG+a6cytaGLlinKt1SJVhZs6HywqOQGvnAo+mCRQauBK4Vw4RDl42caKwn/BkfBv59O/35Cknh96AhMfnyeA4RsU4NT6u+zqLu2jUYqqtYxbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <176ef608-6114-d1f6-1772-982d2e7297ff@suse.com>
Date: Thu, 19 May 2022 14:22:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] PCI: don't allow "pci-phantom=" to mark real devices as
 phantom functions
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <02804746-c5e3-aada-7096-fbb9d04ca952@suse.com>
 <cf8f2a73-f464-fb60-27d8-238996b50f55@citrix.com>
 <3e7eef54-975f-4c2b-2ab0-bcd16289a0c1@suse.com>
In-Reply-To: <3e7eef54-975f-4c2b-2ab0-bcd16289a0c1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0174.eurprd06.prod.outlook.com
 (2603:10a6:20b:45c::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bfbfe79-7bdf-4472-d34d-08da399242c0
X-MS-TrafficTypeDiagnostic: DB8PR04MB5913:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB59132BE8CD9C75B702B9EF36B3D09@DB8PR04MB5913.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ii//CggxkeyByZPgO7pmo78KLlYMDQxeEQlzT92P0g7LwTjiqHtWEnelCjdVtFSOD8i1yWCwv5fV6mIB4gTcRSSuJFG+cxtrDPio2wTtcTt8jlaZt/i0x0fw1OY0BRm/3NvYUorLREGWVVT6+9cvf4JuPl7V7ycFXD36p0vYRpKxJlqU5X48TVxVtGzb6lufkI99ToRT+OiK0Hgj2NJsfEe6eC8W1E4lDKYaJSjKpCP7XnsACVGONbRkd6Pya6qm4sX9irm34LGRqlH7DTc7rY9U6Lf6qII8Lp5+E7eLuhJJMXALiRXvcdRWRBOZCbiaekRxYLBkuTC+nbEqWDCskmckUiHXOmDgLiP05aLBt6Ww0V9dec+wlstOuM7gggnnD8iRlkktZGkWtZcKoGRKPUxkEte1c2IiYmNFhDpxqYG69E1cyNU1WfqLyGb1zCejryfqe5Hgb81vD3NYuJChg8D6Le+gATZ3dswPUW5znn18BmS1Y3Tr0WQBf/w226NookwKvPeofB+fG8kl3Da/Y5jevTABjnYa4DmjGFjbearKZMu0LOCu3whoAwFqjsP7PcllO6VrQapbuhW8O+JvQYYiQKV/GZs7gmqIZB5+YA9tWT12LpkwmJdJhmqguNREGUPjZvl0TFhLfquGX99t3InG5YVxGhEUfI8BTinzYmU4fevbqX/xeLpfLNS2i/SrPOcJwX9gCMswDyLG7SxNmqwwx0Cf//dkd4U2/XVSG25h0xUnkP9MIvaaO1Dq/wab
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(6512007)(4326008)(6506007)(31686004)(2616005)(38100700002)(186003)(2906002)(86362001)(66476007)(66556008)(26005)(53546011)(8676002)(31696002)(5660300002)(36756003)(508600001)(8936002)(83380400001)(316002)(6916009)(54906003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nFqlUMlHj+h5Md2Y3HwKGcrpPxrB8TZWr6oMZuVjah4GuKs8TF1bkfi9Zz8e?=
 =?us-ascii?Q?XOnvFTTM/rrEbBHsnuUDxwBQWm8+/1PUXfe21lfYXfqoj/zhNYxoySgzTMYc?=
 =?us-ascii?Q?++6+VUQ19HkUlngKZNh235BNNYSPkbEVUsRCrAz7G4t3GQG8uMkmZqanOst4?=
 =?us-ascii?Q?/mU1JdwtiQeYuJV8ca9h0Cnd7k1gSw1YYnK3F6Gq0bTNd18k0a5YlpJATk9x?=
 =?us-ascii?Q?/KfEsWLAO5GcktOB2a00peC/i1VaCrvXA/Ok68UgP2R8LwunVOom8W61F7iQ?=
 =?us-ascii?Q?7ACZ2XoGaEjJqOOqLVEPWEiBPtYQzYrmRwUWWvcCQ+YZse7zhtAoksjFU1eQ?=
 =?us-ascii?Q?aKoaYG/AnsThMglyV6BLlnprHHM9YJIyjN8ql5AOITH59RI5WlrAjG2jlqlm?=
 =?us-ascii?Q?ovQV6EVDRiMmFLKIlBNj/HkhoVQNug91oDZkqQdhP1aR4Dop8DIUEh5mL943?=
 =?us-ascii?Q?lGdL/vwAOOL5KRTFt75ObBXui1t4D0FYwEzdDUtHLh5igzdyOBj3tAAYVH/a?=
 =?us-ascii?Q?7qVFOmYF2PqXkLK41IzjMZ/p2WFqKDlAWKKpUml3slYF+7HojiPvVinfow/C?=
 =?us-ascii?Q?J+vN+VU6xGBahxJDnJ0OQTun+AHwPfc/xSgqwBwU6F30NH0jqdaD8cDCznjx?=
 =?us-ascii?Q?75/dQhILGJZdc9R84rGUySoWnwFo+Y8Noifc4qNwPboKwr2Um8FatGX+6vjb?=
 =?us-ascii?Q?oz8qLGD/Ip9B3s+zn0K/MlobDDvKyJZh11CcN/JprTnPqRtuAHLVPuX07NEJ?=
 =?us-ascii?Q?JJGtsKf82GfxxxLQ35KgNJjzIkBKus83YE+hwbbp2ghwhYCO6NGo6GJ7nsvU?=
 =?us-ascii?Q?L4T9g26i8/gksOpvnXqdg1zb/JQYkofS+kR7zooQGw403J+dmfS5geybC2Yy?=
 =?us-ascii?Q?mqkNra/b0oSpCP7jJVbKmLLkD+W5zrZdWbkRQVQ9qxL3ev+bGYgQDkaxdO4Y?=
 =?us-ascii?Q?XtOjds+3srUjyQdohipjoY4kRQofqh9k0AQfB3AtohFnBo2jP8jp2if/FXsT?=
 =?us-ascii?Q?sSuetZFaACQ9tQTEqLlqaxnX3Zo+9YlGSA2ncfrBfZ4DeOycpKRA6MERPkSM?=
 =?us-ascii?Q?aEwWKKZXsL158xsEwoD3wE7wMTR+bSl8CYiIqbWmFwq5Tn5AU+6g8HzTyx7J?=
 =?us-ascii?Q?sFPyJ98IrUb491VNb5BI/ON19JUUnOCyO7S/oxysjw11HTk/zX0TYU5TOR78?=
 =?us-ascii?Q?uJwnAqpbq7oz2lOiuHpQKcIrTOQbyLLPenyI2bnzoVjZKi/3LBAG/B5H8pTO?=
 =?us-ascii?Q?cuoH0f9Lbwdrm0SXIfct17S+HRBcHJSjFiVMYnM3c0CySMeDSInx2fh9IjeX?=
 =?us-ascii?Q?I422Ql2f3J7A5dqZOugodOUYcjOf8ZtKFxpE0rP8653qC6y8QI1brJLh5knU?=
 =?us-ascii?Q?tUYs1xAMxB8vGA4dVplA1IoP+V6t45KI0t/bQz68BVytZiVR6i+HuQV1/9PB?=
 =?us-ascii?Q?CSzyaLnmXhuPvgKW3wqFuB+Hjxmvk3y9vXk3F4x0vviJh8Uz3DErqDHGztul?=
 =?us-ascii?Q?OTvvGnD16Uhl6zUbjPm1hRzIo/ii3pWw9VnOIp4UonzzLRrXHCDexX9Nyt6v?=
 =?us-ascii?Q?eqTEKvOIR05s8Vg++chXbgzUGt8R7YFJxtc0lxzcxCeTHcBSiXHs5TU/lgwi?=
 =?us-ascii?Q?CuKiS3F2Jc69ZQPlhfhj5mnwaahhVcDlHausoAXoYlDNjnROqT5ZJ5qvyVTt?=
 =?us-ascii?Q?sylNHWzsG08rNKVlSeb1xfdeS+/WdmPT5krP711r+PVz95iT/ZfIqY6k2uWJ?=
 =?us-ascii?Q?QdRumPesyA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfbfe79-7bdf-4472-d34d-08da399242c0
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 12:22:37.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hBRXwEZ3CYEmuu7z5Z9pQ1EvwXYE2YfSXoiIjYX5u6IbrxmO49zNXnO+YBdAlGpBRIY+4QxgIuLVgxA+SfNDVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5913

On 06.05.2022 08:21, Jan Beulich wrote:
> On 05.05.2022 21:10, Andrew Cooper wrote:
>> On 29/04/2022 14:05, Jan Beulich wrote:
>>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachmen=
ts unless you have verified the sender and know the content is safe.
>>>
>>> IOMMU code mapping / unmapping devices and interrupts will misbehave if
>>> a wrong command line option declared a function "phantom" when there's =
a
>>> real device at that position. Warn about this and adjust the specified
>>> stride (in the worst case ignoring the option altogether).
>>>
>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -451,7 +451,24 @@ static struct pci_dev *alloc_pdev(struct
>>>                           phantom_devs[i].slot =3D=3D PCI_SLOT(devfn) &=
&
>>>                           phantom_devs[i].stride > PCI_FUNC(devfn) )
>>>                      {
>>> -                        pdev->phantom_stride =3D phantom_devs[i].strid=
e;
>>> +                        pci_sbdf_t sbdf =3D pdev->sbdf;
>>> +                        unsigned int stride =3D phantom_devs[i].stride=
;
>>> +
>>> +                        while ( (sbdf.fn +=3D stride) > PCI_FUNC(devfn=
) )
>>
>> I'm fairly sure this doesn't do what you want it to.
>>
>> .fn is a 3 bit bitfield, meaning the +=3D will be truncated before the
>> compare.
>=20
> And this is precisely what I'm after: I want to stop once the value
> has wrapped.
>=20
>>> +                        {
>>> +                            if ( pci_conf_read16(sbdf, PCI_VENDOR_ID) =
=3D=3D 0xffff &&
>>> +                                 pci_conf_read16(sbdf, PCI_DEVICE_ID) =
=3D=3D 0xffff )
>>> +                                continue;
>>> +                            stride <<=3D 1;
>>> +                            printk(XENLOG_WARNING
>>> +                                   "%pp looks to be a real device; bum=
ping %04x:%02x:%02x stride to %u\n",
>>> +                                   &sbdf, phantom_devs[i].seg,
>>> +                                   phantom_devs[i].bus, phantom_devs[i=
].slot,
>>> +                                   stride);
>>> +                            sbdf =3D pdev->sbdf;
>>> +                        }
>>> +                        if ( PCI_FUNC(stride) )
>>
>> This is an obfuscated way of writing stride < 8.
>=20
> And intentionally so, matching a few other similar instances elsewhere.
> An open-coded 8 here doesn't really make clear where that 8 would be
> coming from. The use of PCI_FUNC(), otoh, documents what's meant.
>=20
>> Given the printk(), if we actually find an 8-function device, what gets
>> printed (AFAICT) will be "bumping to 8" when in fact we mean "totally
>> ignoring the option".=C2=A0 I think this really wants an else clause.
>=20
> Yes, "bumping to 8" is what is being printed in that case. I did
> realize the slight anomaly when writing the code and I observed
> (verified) it also in testing. But I didn't see a good reason for an
> "else" here - 8 being mentioned in the log message is clear enough
> for anyone vaguely understanding phantom functions. But if you strongly
> think we need to make the code yet larger and indentation yet
> unhelpfully deeper, then I will (begrudgingly) do what you ask for. But
> please explicitly confirm.

Like for the first few patches of the IOMMU large page series, I'm
going to put this in (with Roger's R-b) by the end of the week on
the assumption that my reply (above) did address your concerns.

Jan


