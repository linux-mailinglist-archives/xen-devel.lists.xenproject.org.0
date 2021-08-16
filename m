Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FFF3ED0EC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 11:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167241.305245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFYlT-0005kG-Au; Mon, 16 Aug 2021 09:18:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167241.305245; Mon, 16 Aug 2021 09:18:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFYlT-0005gn-7m; Mon, 16 Aug 2021 09:18:39 +0000
Received: by outflank-mailman (input) for mailman id 167241;
 Mon, 16 Aug 2021 09:18:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3tuO=NH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFYlS-0005gh-JX
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 09:18:38 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dec79e47-6a5d-405a-9673-6c5e73f4277c;
 Mon, 16 Aug 2021 09:18:37 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-oPpCPJEwNUqeeI9mfL6USw-1; Mon, 16 Aug 2021 11:18:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 16 Aug
 2021 09:18:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.023; Mon, 16 Aug 2021
 09:18:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM4P190CA0023.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:56::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Mon, 16 Aug 2021 09:18:32 +0000
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
X-Inumbo-ID: dec79e47-6a5d-405a-9673-6c5e73f4277c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629105516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqb/rbn5ujRn5w3B0hTPkYnWMlkb4WEBUQ6ZcUlJtYY=;
	b=L8DbAjfsF9I/9nyL6FPe5qJ3oGMmpKnbKkVnuUsLV1fPgZhPJ3OuQNJOEpiOkN66+JLGS2
	TBrDuJZvj6w9olrNGGb3UtZusVT/Dk3GHjig6ZRuKFFUOmTBzGRU69xjbQbwIfSPrz+EBi
	WlHU6pIh1jk3AF9n9N8cRa8nhTPlXkE=
X-MC-Unique: oPpCPJEwNUqeeI9mfL6USw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LclOxcO/DOFglve1TXOdXJUYwEXGQalP8DYC9vZKbaZ7aFEHGTF4UGosU/n8aVEJ5A7oDvVLo4wW2fpwvBsrSl0srKUiG1jMc3GM+IbwnQ+JsbemUlgwIvAO3HQKc6/GpOoJ0C2KLYXjGxwsusU7LSB5NhuUKTy91Aq7qCtdci4O92txZi9nER2gJpUujVYwUNbDQXBtVPyJ4i2Sd1PBt9eRVOUjXfNmfgdTn1lVsvsSMRCJvaWDgfQUZUfT3JCNcXtReojoqyvr5RsFyIp0WfYRPQ4zI2wRqbaheM58d4qLU6+fFaORRU+78+cz0LBP5TojDMfREdMR45h65vmfww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MlakNnHzr1nAjIYUHdvxbM8XKy3vYgEQkQoY+C2m2Qg=;
 b=KwFuJrXSuJeSDNZ3oskxxOm0fPHaip08toFhI0vSg+cISEj+Vgk8rB653MpkbcpD0hl+GOgRqYMfEI772iPZTnnfMq/NU5fkA2AZe/+tuMd8M11BCdufDbenKPJgqwUEzsA03KbZ1jb/5b6KRFheXM3Lh4stc1Hm4CYZhrPrVLkgmQjbhxaGUzD4UbmEVFxaSU7AtnGqySomI0Z+eHkrLmLxmPLCMDrtXE1xWIPIpmqP7K/X5falnwy+U3PcdqScKnA1EcydN7mpxEUg6iPBVFXS0ksZMGDv5ZK3g2lDlpXsHGDXmnxleqJWbJYda1tNCTSrH37p6ogX1o+jR8+/yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 2/2] ns16550: add Exar dual PCIe UART card support
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210813183139.391546-1-marmarek@invisiblethingslab.com>
 <20210813183139.391546-2-marmarek@invisiblethingslab.com>
 <0326eebe-2ec8-1c2d-bf2c-8cb4c16312af@suse.com> <YRokMeJ2bMLAZFD4@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e88f6f7-afd6-d12c-8a14-a5c3853d0a90@suse.com>
Date: Mon, 16 Aug 2021 11:18:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YRokMeJ2bMLAZFD4@mail-itl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM4P190CA0023.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73b5e704-53cc-4620-d01e-08d96096d19d
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7375F4F2FDF16288F68D3287B3FD9@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4zlGml+6s5LGsANAbCMBsrM4vPpYePbCWSvNmSOOh65g9fRnSJllw0XrSn1nS5uIN1KhEpr3VPfjlfO4MMAzdiQy2bmIcQBUaP+4e0zTO2K+EDBQlK5Wvo74A9UQYLRC/ZyGJYjDGKBjHk2Cro5xsB0p75xFlRmdCBdczeDXTLjmR26ZWleKZkdk+VAHyimLMMvSXJqsA4vMHM+0Jj6HMMLVdugi8fOw4I5Df2cY2CgBX0aPHlkLQnvfS7uWglNKsepX3Toi1yZdrCQpO/MHtHl4+nntr/d1KbdfW0FxFs9vpUc5Ef93a6A6S2Ss+J7pT3+6y4JwYf+++FoImYiGRcsYWckGtVJipZWYk6FcmrOFmXLZkhlFkeUejuUZ9iiYSqmv4C4O+3Y8VN8j+tlftFwKgjGh6QNeuJJgobv3r2gOhY23BR7gCJl99w3cZtjY4gWyd1w3UJau62xm0ischpmCkoE3I1rVWYxFUHTh/qGUlGWZSiZg/uHx5BPD7BONz8TsFA7rxIPqXVCcVwzRK7/31TB1+FQr7XyN7iP+BH45UUG4vt23N8RYgwYhelrNtub8cwHvT4SGQbh2NS50qeKg2ZN03AbahKO2RwsnGjrjTPpLk2tp8vOZlWezh7hdtLeKaMpRzEAkx+XPXZa57dSxO+ItkxZncv/lCsnX1j5i6fydC0Lfy55n6YC5HQ7AKoUL/DpsJC1jUhN5YbSm/hiWCR5kU6iSZmAq1+XlVno=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(346002)(376002)(136003)(366004)(5660300002)(53546011)(6486002)(26005)(186003)(2616005)(36756003)(956004)(66476007)(66556008)(66946007)(478600001)(6916009)(316002)(54906003)(16576012)(86362001)(4326008)(31696002)(31686004)(83380400001)(2906002)(8676002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ss39cG7CvHUjESXYmorBgvKRU5XRcCrtXVrfwQNNFOtDc7vl69x9AClEQFAl?=
 =?us-ascii?Q?DnTEw6zl8beLYdqyODANyr5gcbD4lDlnn+zaTzQ1Deke0pZJlK9xlS3/u022?=
 =?us-ascii?Q?4IDKttJ9jZfBP5QcFheGcmlnlaaHwtZMwOhoikB6wWWmcm4/FF2zhVnFWxk9?=
 =?us-ascii?Q?5h6CBPlfk9FSNMwUW/5l+riusrp6Z30GTHdORVqrtePsoSU7gNVbg1V2iyZJ?=
 =?us-ascii?Q?7/UJC3RPV+bK6IhxjEDmtM6c0umntJzUDDhtX+JggLssQHooJ/zP0R5Dpujc?=
 =?us-ascii?Q?EJuUxmXg7WyVLKS/WTJEFECczjZxmvbvhLiPBx7upTvKlYQuiJsDQPuH7sZF?=
 =?us-ascii?Q?nbQsYIb+gr8kGW9LtSKRKmu9/ldoIDagvMB5/1Td2Y0I9OdNe6Y9gGcKzHAu?=
 =?us-ascii?Q?cWawwoHX1Z0SRIALNTFiZvIf/+g0SvoP1qQ1Ogq1EjrZS3/hDxBPtA8TAMac?=
 =?us-ascii?Q?UcRMblnWjylhXj5/CTZZn9guvbBbHyn0LXmoPotkbARZrjGCovFTv57PLokL?=
 =?us-ascii?Q?0EbpJFydWZ6bQac6HUUMzCwf8MgXwB+8N4krZvlaovh92s0byr7wAZ2ILde0?=
 =?us-ascii?Q?Q7WGskvWNrGxa5/FXrwojiUw73apb8kvvryI10h9BsB6d3okSA4gCfGyWutN?=
 =?us-ascii?Q?axoBDc2B3xpmFi4O8RVx0FLUNuCRKwNAnv70pBK+6gldwOa7ztdA5Q22tvSM?=
 =?us-ascii?Q?q4h5soz1sgHANkiTszhEKiPof1upLNoc8MWEyxNuUdaZxfu/Tj7ElxYagdRs?=
 =?us-ascii?Q?dzJVpGzE+8agwkEBA/jT8fJYmcriHFylNgGM4/jb6lsP5cVf+nX3v/PO6CFS?=
 =?us-ascii?Q?CF5wf5i2FO7hwX49G6NQpz2ES2zVVayT2GU3yXRtxVE0unHGhnZJlzB/yPk+?=
 =?us-ascii?Q?o+rxFztRD7do72Aq4ZywvlTbPpSauhgGwi/SgZfUUR8lSPGB8tPBLMO0zUY5?=
 =?us-ascii?Q?831FiMsQsFBIJRCnza+NJNQnXsnkpYFmitEtjlgqxwusFlRwVadL6W5YNQYx?=
 =?us-ascii?Q?byUrwoFC1HGCJHAeIo/KBmfcp8PgkKmBPuQQMsnvWnsIg8CnC9d/yKnPT0h7?=
 =?us-ascii?Q?M+QduprzmbnWNyInD/hawAyTv58To20HKlyUGYM7YYU05aQkuFUOli1oxQZ8?=
 =?us-ascii?Q?GX/47yX+nh/lxqhdhD4ZaUB/8xUw/6d7IWGfPJYSnC/ojHhDTOZJ+VoubGDV?=
 =?us-ascii?Q?RezSmL3QeCynvB9SVtCkS9xZJ4elanfVdUUIvSeHwYA7fmQv0+EJPV/Qe5sq?=
 =?us-ascii?Q?cdK6dN6xSS7+VZ+tm3Fy90pkloPuR8TD3SLQx6DbyIuAPtuBTjnvRA8Yn5Hi?=
 =?us-ascii?Q?/NO3tLvnSajd6Rk+IYhqYKoN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73b5e704-53cc-4620-d01e-08d96096d19d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2021 09:18:32.8836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YLQ9ltB0yCwlRz4ITTeIDCIIrzVr9C1HadZLWcHHkMgtB3dRl5FG2hrOMGHbhqK6WJ4XCaK9XKcg4DizC066Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 16.08.2021 10:39, Marek Marczykowski-G=C3=B3recki wrote:
> On Mon, Aug 16, 2021 at 09:55:16AM +0200, Jan Beulich wrote:
>> On 13.08.2021 20:31, Marek Marczykowski-G=C3=B3recki wrote:
>>> Besides standard UART setup, this device needs enabling
>>> (vendor-specific) "Enhanced Control Bits" - otherwise disabling hardwar=
e
>>> control flow (MCR[2]) is ignored. Add appropriate quirk to the
>>> ns16550_setup_preirq(), similar to the handle_dw_usr_busy_quirk(). The
>>> new function act on Exar cards only (based on vendor ID).
>>
>> While on IRC you did say you have a datasheet or alike for the specific
>> card you have in use, may I ask that you clarify why the logic is
>> applicable to all (past, present, and future) Exar cards?
>=20
> The spec I looked is specifically about 2-port variant (XR17V352), but
> there are also 4 and 8 port variants (XR17V354 and XR17V358) and the
> Linux driver applies this change there as well. But indeed applying it
> to all the future cards may not be the smartest thing to do.
>=20
> The Linux driver checks Exar specific register to identify the device,
> instead of using PCI product ID, for some reason - I guess they use the
> same chip in different devices?
> Would you like thing like that (after checking vendor id), or turn it on
> just for this product id I have?

Hard to tell without knowing whether the extra reg - as per the spec -
is connected to any of these. Is the spec you have publicly available?
If so, could you share a pointer? If not, are you permitted to share
the spec?

>>> @@ -169,6 +170,21 @@ static void handle_dw_usr_busy_quirk(struct ns1655=
0 *uart)
>>>      }
>>>  }
>>> =20
>>> +static void enable_exar_enhanced_bits(struct ns16550 *uart)
>>> +{
>>> +#ifdef NS16550_PCI
>>> +    if ( uart->bar &&
>>> +         pci_conf_read16(PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[2],
>>> +                         uart->ps_bdf[2]), PCI_VENDOR_ID) =3D=3D PCI_V=
ENDOR_ID_EXAR )
>>> +    {
>>> +        /* Exar cards ignores setting MCR[2] (hardware flow control) u=
nless
>>> +         * "Enhanced control bits" is enabled.
>>> +         */
>>
>> Style nit: /* belongs on its own line as per ./CODING_STYLE.
>>
>>> +        ns_write_reg(uart, UART_XR_EFR, UART_EFR_ECB);
>>
>> Wouldn't this better be a read-modify-write operation?
>=20
> Honestly, I'm simply mirroring Linux driver behavior here. But also,
> all the bits in EFR are 0 after device reset, so it should work fine.

Firmware or a boot loader may play with hardware before Xen takes control.
I'm also not convinced there would have been a device reset in all cases
where execution may make it here. (Note in particular that the function
and its caller aren't __init.)

A plain write might be okay if the spec for devices with the specific
device ID documented all other bits as "must be zero" ("reserved" would
not be sufficient imo), and if the function was invoked for only such
devices.

Jan


