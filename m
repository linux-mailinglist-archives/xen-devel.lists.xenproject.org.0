Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680524D03E3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 17:18:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286271.485726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG3e-0002nj-5k; Mon, 07 Mar 2022 16:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286271.485726; Mon, 07 Mar 2022 16:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRG3e-0002ku-2k; Mon, 07 Mar 2022 16:18:02 +0000
Received: by outflank-mailman (input) for mailman id 286271;
 Mon, 07 Mar 2022 16:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XxC1=TS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nRG3d-0002kk-Fl
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 16:18:01 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28429e2b-9e32-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 17:18:00 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-P_Y70i7lN3K0vq9ejTZTsw-1; Mon, 07 Mar 2022 17:17:59 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB4359.eurprd04.prod.outlook.com (2603:10a6:209:3f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 16:17:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 16:17:57 +0000
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
X-Inumbo-ID: 28429e2b-9e32-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646669880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGP2DtfD0+6oVih3NIBMUZprjwBzRdT+uQ+son0t3Sk=;
	b=SW8DIYoCuJq84B0d/Agyx++4nhBZCKGBe5MSQGKC7acjF9GItpCPgcFqsZeSFEL53ruCGT
	dQnrMk2lsEqsLyGO8fjkSY6U1m5rgx8Pj7bPXiYLJyCLrF/eUPqSaAsw00RttMtitio2j+
	ZQEaLDUQHTFGthXmdvmA0FfM9cMYxx8=
X-MC-Unique: P_Y70i7lN3K0vq9ejTZTsw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLjdFXBJ4fRxNgJ1L5vC53jRtyvwt1bhhNd/Ti7rsyV66zM1sKSh3b2WkXbdIIrK+ILpg2IHa+eVDZSLSYiTU6lA/blMfn16Qg/NNrfFQA5ruD7BCeS7fOhHtVm6IVL/USUCaS8mdhZvGJzkZYnNNyVtE1HYWelchiLAUr8bCyxEqIBBHR1zVnPflEdjMKxIk+uSdBw/abyx1M8UGTCp7IzdGR3OZJcUod9X98ycu//HnFQCz39bfbkuNTZ428VNo7MBGokg0Se4q2tNcovBJ3Wy3hLJ1wnSwm37xr1YbJmyHjwytfWVynz696s0xnL0dM6CX//f92bIwYDPRWZnLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+4XvI9Cxx+nhR5CYFbw6cyhfcUZCOR3VuOE9EzBy+cE=;
 b=f6tulXgUJmuf8+B8Ye7D2Yd3CT+l4pyXzzAhxgC7Wknh8R1pSRcaaH15s85CNyxWj7P6YbYTZeIJPL+L4tT4GMLkp0zk9hOduuVm/jStpcIDT5h4rYAG0ei0bIWIYxLP3zs7qR59UDfBykOilsa8tjd0b1e6zGv3Dn5tH+bfKpDUxoEPGVWVg/STpBWBLAQG89ndQnsrVtsZcwZeMahGMyC36Iuq0y0tY60q38cyPITFKauDT55F6pb+wr5ps4ouXALzLUaQPyOOrL2oXvox7bbfiZEzEvSFj88CH9YyczNRmstk3XUey8lnFHwFAxBcIq6v3gHBpd6Zoiex4/8YNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <758ed960-3e26-e63d-d0f0-be01bed3e4f9@suse.com>
Date: Mon, 7 Mar 2022 17:17:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3] vpci/msix: fix PBA accesses
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Alex Olson <this.is.a0lson@gmail.com>, xen-devel@lists.xenproject.org
References: <20220307125347.71814-1-roger.pau@citrix.com>
 <1480fa5d-bcee-e945-6b2f-9db7931c63af@suse.com>
 <YiYtoxcpi/KalGqg@Air-de-Roger>
 <62bc3030-496a-5d33-9278-614350df94d1@suse.com>
 <YiYvltzDBzPCHzFx@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiYvltzDBzPCHzFx@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0601CA0044.eurprd06.prod.outlook.com
 (2603:10a6:203:68::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ecaecc8-ea64-44de-1565-08da00560aed
X-MS-TrafficTypeDiagnostic: AM6PR04MB4359:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB43592BDA02F7D5CC80873FB8B3089@AM6PR04MB4359.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+KZTTXX/ZfaOiuN+ZiQiYPiaXW4SAauayI6GGHjwz/w0aC60kkYhjJI9anOOcGyIdUvD9t7UrDiGFuH5PSuUoBiAq2udIjSSngIBdVp+BmSVlidJV71fHz4a5Zd9ILmUAskNCWkEcNzIUSKKN6Xu6+R0v01Q/SaIvzrHLOTQtEYVuqBa+3R6Xix5g17y0VCFKPOGnt+h3zTQRAHLOf0b0VGR4Mjtol+OxP6VUrBy3f/6DVaLPDU0T2jhmYof6KEpTL2K4vPyKtixy3vT83KjhjfGy/KZ6p9Xz1+Ow3TbdQZc1/lpjSQXD2gWKf20yzhuVemPSEU4wpvNKuj15pgWQsGq0HvuXTBuCcKiJzbfWjWy3c4teaMPGdywmeJSeKh6ypvDk3pS4mqkMIGd69LLnsO/hfzjG2U94TN8myOzNDQbqQF1AEnY6Hen37LHWUiKdShZp7aXPZ1uMtJwiMK9oPrHDfPPcIjKUlBij0+mEdEFhBHhNakOcEFLHvLg+X9Zyr1eSmryc1YnEwrkom5f5HiPDywMos8iVUNmxXfRRAGUP5KhUs1MXSU0AHLxzs64+jQylJubLngb91zX5KPXhmHcNP1hLumby/XV6OZIvz5ewM6smWw8T2gE+w6W4LArR2XDP8VtH6hPp4xSC/D+54sDOrSsMciu3SlifB40bR6bJEO/VrxR0J/FX9HsNf4mWaC5BMEv8uXCPGrGcAncKx6m/xt+IEX7lORpL41TTd4bNPkCc3bXLKxTNotXZKxo
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(2906002)(26005)(6486002)(36756003)(508600001)(6512007)(2616005)(53546011)(31696002)(86362001)(6506007)(66946007)(38100700002)(31686004)(5660300002)(6916009)(316002)(8936002)(4326008)(83380400001)(8676002)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SwLf32dtaVFmn391/DXoRMrmpGd3fH3Qs2MV0XQCF7Jc0ApgnW9cbbfwSGBf?=
 =?us-ascii?Q?KAmdrtvs1bIEq1i+ARJlWpXAkqTHRAe30/26ZwSOJLcOYeWBjhQLwEn6y++Z?=
 =?us-ascii?Q?LG4p59HthCt7dCAoO9odjEn/lVm01GkjOEAH/O9l/xYqg19FGqDU0Ww9iFX6?=
 =?us-ascii?Q?aFr795ZQq6ig2LzgAXzrtVr0lQ88hGeTji1PzH4J3K4qFv3mTdxoJK+YRZkS?=
 =?us-ascii?Q?NOByT3SrZym7eglMgDwG1bDDwfxBqQq9iala8BboHzbqUVYSWILqT2S6QmMG?=
 =?us-ascii?Q?ilAqhjAh3khlkDs1UB4d+fupZ6TQ+wtsSQD0xj5PYiv34b9MWIC3qPLN6u7P?=
 =?us-ascii?Q?kqto8BUMbVWmetoXweZKhlEMHJPLSEoiTLMSbgGfrRYR0FFptdXzH8bR9c1p?=
 =?us-ascii?Q?UTBn8EU0FyZxmKtKTeEbYvLhR3CyGbrkXEyvpVYIlu6H1oXJCfjjBPVOTjDI?=
 =?us-ascii?Q?VpybQT44hK1F+EZa58MSfh29sGW5RC/1dW8yxt9KZa9S1Sju5xcAf31A3eYB?=
 =?us-ascii?Q?hqmscOq4r5ANF4EN+3P2ltiVyXqaL4SmOL5av0GyJ5S9fC+T305k3nQVpJqI?=
 =?us-ascii?Q?DhRNjKcvu1p9C9g4AVvfJJOBNrHmP38tkF2QWSnRkwESSM8XnXhxSGFdQmLq?=
 =?us-ascii?Q?pYl/S/cg0k8iLuNAzcJ77x0OWF4sdKban09NK8t5I7m1G8uiM55ibt13PRXQ?=
 =?us-ascii?Q?NpvtWuwgI6xoBuju4els6QrZgLNmFoweFqNyzOzg4L1OTR/sxOftGZokxtEo?=
 =?us-ascii?Q?59N1m2iNETupelPepsLEhRVhyc6ALGsXRyL/vuETjFx4EPx3dzYGrvN53Z9L?=
 =?us-ascii?Q?sW/rjknoMpjyN/VpnxrTQ7U7qiyvnWAre4JXc5j1PBiaOCMnsmDOgLZ/nAcL?=
 =?us-ascii?Q?vf4hcAT9uvRremwrHyzoGtBH/KZMRLJ9CF5+5LHf0+svmw3kasfAVqQHQPML?=
 =?us-ascii?Q?e7Y7aQ9cCQUMqUCXKLXdYzhFVl5E5G3RxKNWtEHXPHQ4Z9a1bRVcblsTBGNE?=
 =?us-ascii?Q?F6vGpaCgqP/K8EnDXvCsDXCyuuNynOFJCq5a4+hoBZ9suV5QqmYPxSvdHz3M?=
 =?us-ascii?Q?aff0SstdeZg2QryTQQdBAUBhCkiGjm6cyn/cZ6mVUcvITBcDkTaRIEgFfikp?=
 =?us-ascii?Q?yUjyrVGm0JjLxoAPM7sAlhacIWVAnBmMksmYOAn12pupPGeRvkHqMDWPCj+8?=
 =?us-ascii?Q?FbhvRyumQ8Iwh4g1Qdjy96EpF8JKFondGKnnuziYBc0SXebeLiTORXFDqEL0?=
 =?us-ascii?Q?CF4N97drQyUQPxz1f2cqik7Ebe4lFTES0tiqz4Y23WsT1SjExobxiOJ4j9xM?=
 =?us-ascii?Q?5xugLUIGRolqKA5P/0uF6FzwROnUVbbrpKYTn468O8vives9/WcSWkndlgJE?=
 =?us-ascii?Q?bFzHu7ePtyqh0+Gxm53agFYKo/34u8mrJiFahwxNAsrVVE2KxuawkhaZEUyL?=
 =?us-ascii?Q?xIm4LR27hAymDcyt3O7cIrg4RtkhGjjNGm2YhvXT3UmMrthF++JQ/Qnb6n1i?=
 =?us-ascii?Q?XaXfwuLYf/php/2src9hlQGEx9I4fJ4OUAf/NK/CFK6QWAno0lA8NtpPtcb4?=
 =?us-ascii?Q?CuvBWVR+CyH8o4buHY9LUDVwxkWpeH0BRRNdN7BBUjmw5H264y1b7Bo8Fpc6?=
 =?us-ascii?Q?BVlymyS1jldp69M8qaZhHEw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ecaecc8-ea64-44de-1565-08da00560aed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 16:17:57.8406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ni9K1EoRKMpIQG5QFr7Tulqt9gTaU3dymYYVRtw0Qp/d5RonEnkx/4ACZQtm7yXlX9LrLQTwvvWqyAW1ElUIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4359

On 07.03.2022 17:15, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 07, 2022 at 05:11:34PM +0100, Jan Beulich wrote:
>> On 07.03.2022 17:06, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Mar 07, 2022 at 03:12:32PM +0100, Jan Beulich wrote:
>>>> On 07.03.2022 13:53, Roger Pau Monne wrote:
>>>>> --- a/xen/drivers/vpci/msix.c
>>>>> +++ b/xen/drivers/vpci/msix.c
>>>>> @@ -182,6 +182,33 @@ static struct vpci_msix_entry *get_entry(struct =
vpci_msix *msix,
>>>>>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
>>>>>  }
>>>>> =20
>>>>> +static void __iomem *get_pba(struct vpci *vpci)
>>>>> +{
>>>>> +    struct vpci_msix *msix =3D vpci->msix;
>>>>> +    void __iomem *pba;
>>>>> +
>>>>> +    /*
>>>>> +     * PBA will only be unmapped when the device is deassigned, so a=
ccess it
>>>>> +     * without holding the vpci lock.
>>>>> +     */
>>>>> +    if ( likely(msix->pba) )
>>>>> +        return msix->pba;
>>>>> +
>>>>> +    pba =3D ioremap(vmsix_table_addr(vpci, VPCI_MSIX_PBA),
>>>>> +                  vmsix_table_size(vpci, VPCI_MSIX_PBA));
>>>>> +    if ( !pba )
>>>>> +        return msix->pba;
>>>>
>>>> For this particular purpose may want to consider using ACCESS_ONCE() f=
or
>>>> all accesses to this field.
>>>
>>> Hm, I think I've asked before, but we do assume that ACCESS_ONCE will
>>> generate a single instruction, or else we would have to use
>>> read_atomic.
>>
>> Yeah, that looks to be the assumption. It has become my understanding
>> that ACCESS_ONCE() is generally favored over {read,write}_atomic().
>> Personally I prefer the latter when the goal is to have single insns.
>=20
> Oh, OK, so I should use 'ACCESS_ONCE(msix->pba) =3D pba;' rather than
> write_atomic then.

To please others, perhaps. As said, I'd be fine with you using
{read,write}_atomic().

Jan


