Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BB952E94A
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 11:47:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333614.557471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzDy-00005Z-Nt; Fri, 20 May 2022 09:47:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333614.557471; Fri, 20 May 2022 09:47:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzDy-0008Un-J9; Fri, 20 May 2022 09:47:10 +0000
Received: by outflank-mailman (input) for mailman id 333614;
 Fri, 20 May 2022 09:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nrzDw-0008Mh-Uy
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 09:47:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d02f52e7-d821-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 11:47:08 +0200 (CEST)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2059.outbound.protection.outlook.com [104.47.5.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-v-aG9JhRNHiqWyFRargKbA-1; Fri, 20 May 2022 11:47:06 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR04MB3018.eurprd04.prod.outlook.com (2603:10a6:7:1f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 09:47:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 09:47:05 +0000
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
X-Inumbo-ID: d02f52e7-d821-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653040027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ctR/k4BEgZRwWAsjZ5XBJxpXkEOU9t98wbo7KbK5c5c=;
	b=UTF5R3o3PI9z3hpz22gYiskI9U8L69v69Z9hoppbiF0EkMFyHzKRRLvf74GkoLNcQrUGFU
	AVHl4/x9VGORC26vsCPOlc8OXhgF6dulVC/u6J/v1xLm5fHNGRpqqJEMLxl9d75F68WoHr
	5LK3NSA69IyN+gIfgbU6pKJAs6KHDEY=
X-MC-Unique: v-aG9JhRNHiqWyFRargKbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOCKLyvlAykeuY0BlJCo2JnocwSi2mQER6Rx+/LNJzxY7wHUgE3vJGWW86ZX1g1rzn+ak/iRQBQbDqjWLkFBh86yq4iGyWH2/Wh3sgmNnvDXk62nZpkkpHfWGLN0bSP3b3HQb81SB7qxd5sbq4G4uJFQJkhE8DeQrx7uQiUl7oY7mzTFQkpw5ndm/LEz6DxsdHbxf+90oHXJQYt+PNzzMPQT9Y1n6Tghf4h1xZNbx3gDWoBVBOtw1r5kg7Ov38/okJNSfB9a4D2st7yOe6Cx9HbB7cEVU3ubhkPJR1Z2m6c16lRCIll+Au4qeOLILhtyBPbqzDuMBeVrzU7Qhynd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5r7iEN+48pW6ircr7WYXa1NE7WzPMOpEtcbzM3LXYs=;
 b=X7+AGaqh2YXCDD7pL3HPzCOj3NmmDofA3yatSAuxmgh7QgeIcSgL3PEN0e9hX+OciAt5/nGxpmqkpyedxqyzSA1aJsdtYn+B0LtvZi+gGkN2gPSITgAiZLQTahZ9UECx9wuKNHlgJ7nHRXI/2kmRhgpCtNce9fgY76TAiw2aIgfISQH7PAuBj/4MIsTXFwEjRELBWdpYgfLjHdLrNRJXAshUVGRBrjilfQg+63oWpbAyIYTv/4jK2pPkNghMqqzDEJlIjH7vOBXxxxK7UbtRMSKSB38+gwo2sCzplYfgvpy67KDagG1Yx2dTrbIPrl6FFmxVnWlfNiN1D4dPpBhqkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <825cbef2-2b1c-b05f-1c4e-cace2eef099e@suse.com>
Date: Fri, 20 May 2022 11:47:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v6 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220520085343.1835866-1-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220520085343.1835866-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0027.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::40) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4c89be0-58c4-47ff-a636-08da3a45b28c
X-MS-TrafficTypeDiagnostic: HE1PR04MB3018:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR04MB301822DA66BA9B1CD421885DB3D39@HE1PR04MB3018.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yvIXSS8Pw2P699pIMFl5WuR7Fa8B0imARlmJZILT4IkBt+ETLKvIIonZplVhMyROC3Fo9E1lg1EnuouVp3yeDXEMM6FKMKqZTjoAm41X64DMbz4FjFuicVpWdzs96f3hcvEoIboNPdnYvL2UrYg8t06hiljAqZbTwCGkxpCWTAdTYVTenyWww1w7pf8ZcODismprRLufBmFB44JVeC+EFw0oH4nbHVN98dxYn96CTuFhUhJPWB+HQC0KNCAX+XxjO9V7Ty85qf2tHxWvYUmtbjsGU2NLXT46xSIq5OcFfjnJvPypxCeGoAH8q4V2b9iRYUxcGzJbcxyvXz14I69cy81QZfxFwg5Y1wUTGSsRPfs4NLSQSzIuUVpEgXsqugqrjH0FqiH2PaQgAAP5UA6yB355mG+uNnml/ErzGn0yWct1MjSPdnKoba8IeLuU5gHxu9hIMtQZhBV1/dGK+VD1M79BT2dDflpyRKzjiLv9Jhw11knfbNAveMbBhzYvC/ruDCyTg64Vmhlwm2Y+wsq9zDCFTXJNX8k49jJW6xebdAQouBM+Bv32kuhq5AcGGjL4oETD46VhH/fpcGO3eoGRW7I0dEUhngpOeTrb8JKTfwxJo6DQox7qiFg+2Lhw1T8WQFiP1ZW2UD7aVbDvZF/YL8HU7q5/PA7pc5k1SdxX6ckzGZ1HZwnZe1h/jKfY6j0efdyuVgQhEX9Zt3KoxmQklZdzwvYa+B11nGul2ztmfhU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(4326008)(5660300002)(8936002)(6486002)(8676002)(26005)(31696002)(38100700002)(53546011)(86362001)(6506007)(6512007)(2616005)(186003)(316002)(6666004)(2906002)(36756003)(6916009)(54906003)(66556008)(66476007)(66946007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ejfUyE0Lwn6xUk9De4mWQfGXHLSKYG1X87Gq61nDJdI8ppON1aVbpB6OAajR?=
 =?us-ascii?Q?73OSG2RrmvEHh+LbJsz+n8qGAO5DerLDS8Zb0rgE4Vl/Q60Xpogo1DmMRgSb?=
 =?us-ascii?Q?/yNuhsZM1VCXk+vEUuaMabdHgzFn8S9zAit69up0hNnV/u6zmcTcIaWxwR2+?=
 =?us-ascii?Q?p9V2niC2lHpBI3t2tWLgI8lPckQotIU75SB7Fo8cMwYH+3ns8xc7OPb7pEqD?=
 =?us-ascii?Q?p1oFczWci5mkUv8bDzLtcoTLXfRskCECJcY6m1l79MT4zRG55iX435++m3wW?=
 =?us-ascii?Q?CpubCC++XYKySWA44JKRcmK8XPoyooHZS76OuQynvDncfTJoqejiOer9a91+?=
 =?us-ascii?Q?OjTOsbL9Q4euDJO4GpK0Rb1bLL7E4TvT2GwdtMGf488q08dm8QwLTXcXpE/N?=
 =?us-ascii?Q?aKeEeUdTrIP2qRIZ9M8E/l9xCkhu1GvzppvMpjz0uVHS1iSzykKxQsgnMTAE?=
 =?us-ascii?Q?znqaqd7bSBl6pMwqlZGFPwx/cL8YDEyTSc0jB7VYC7Nt+o6GdevDY4YxpaM7?=
 =?us-ascii?Q?1BADn2JQi6NdsxUfEGNrOqDp07RxOQNGu/csJqZwpn1M0AMLIgznHnHbdI5o?=
 =?us-ascii?Q?EYuVgMv+KgWptiO8SD7N+1OfsIyrogPdnoWaFWCenRbKApsi+ksVmpHip8aJ?=
 =?us-ascii?Q?e0jsoTCN/NyQzjmiQouAaKldJxxs2mXsUnSYWhlOYsm34kDT9pmqoArF9d+G?=
 =?us-ascii?Q?R4VIDUK9lZ/UONWrQEIB+RSdpqIyFGZkG6sMBGS+aQ7FzSRcQh/aFxY/jjV2?=
 =?us-ascii?Q?ofN/mQPuUCs0kwCDMekICEqD9TZGuyp6I302B/wYP4J8LscB7MP0Gab2YFuh?=
 =?us-ascii?Q?EAEgl79+syMxtGeZU8OkUU1125PyujibaXn+k+G50d8vOdK50FePLM8E4+wE?=
 =?us-ascii?Q?uxA04Buk5D1L+wl2+Dzt8rm+8WnQB5TmcRb8yxOv4nY25bOFYIW5p66aTwxS?=
 =?us-ascii?Q?w/G6LYeGWr8Hlq62y2juVjAzyjo6C8JAYR3xN5CiSDeaqY8I+2GmTArEFbyu?=
 =?us-ascii?Q?Lojyum7ohp90zic5ogaupdyp4CCkIguTeQWUvugYzVQE5rSEN2jZtHo4e3Q3?=
 =?us-ascii?Q?QrdarOp554HavFXAA2LVhHw14XOyHc65n9GriljU5X1cLgIxyUcK4gOPTYBj?=
 =?us-ascii?Q?HsOUMOazIfsT7r8RpttA8RzyjOwvKYy22DZREmYFEa2zuVlbN0HBNw7+vwtw?=
 =?us-ascii?Q?srv9hNmg+TUDpegMynUDHVQ7AwTskyLCUsmuaR1L4lmDEZfsG9whg82pKlT1?=
 =?us-ascii?Q?Hh1M0eJACgJcfbTc5tDW1n0mIuoQVJuKjHCQ7G49n1q06R3s5BS2AVF0qapU?=
 =?us-ascii?Q?SSiCBeNXro2pjumK29WTTn4Kq94fTkSEj0pDhuxTO1NKzSWYdYy7xxzHH2C5?=
 =?us-ascii?Q?33tSyuV6DICRia428z68nYI28wC1FJxeJG84w2ssAaz0nV9a2oC+7oeMonHl?=
 =?us-ascii?Q?ZF4Qtt0N3aorOdwuQItLoZ86c31S5mgU55bKOX1LGozS9wVAbZaHEo8JGKwR?=
 =?us-ascii?Q?R/nbrdxzsU/ZhBWL3PL9vQ7GZKIObxKKE35rXuELqtpb0Cz5/RjEq7YxsjQH?=
 =?us-ascii?Q?OMrFYH4bu1BbXF10VgWwU5fBSks9HIRigWFaO+X3M5UeYh6Uecp/KnxNwBF7?=
 =?us-ascii?Q?q1/ncbXGOVtMd6xeMeUBqlNgwuC6VulMEACtdf425SSQjyCV1Tyvw9gODotb?=
 =?us-ascii?Q?UDKqpIZWl046lQ1420WG5XuSZZOsfwAVKMgRPrQ+nRrH088fHZlBP+5unwX1?=
 =?us-ascii?Q?qwY+Fnhrqg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c89be0-58c4-47ff-a636-08da3a45b28c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 09:47:05.0000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rvvINmzV0WMOX1qAzsKg2IC8N3HO+WbvALkai+fT3ZxCddvI/vxx1zRlirUZjcA3NZ4h1QIStfMM3exv5IRbOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR04MB3018

On 20.05.2022 10:53, Marek Marczykowski-G=C3=B3recki wrote:
> Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
> by the PCI Local Bus Specification Revision 3.0 (from 2004) as
> "unknown"/"no connection". Fallback to poll mode in this case.
> The 0xff handling is x86-specific, the surrounding code is guarded with
> CONFIG_X86 anyway.
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Changes in v6:
>  - wrap the check in additional CONFIG_X86, with appropriate comment

Thanks, albeit ...

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1238,6 +1238,17 @@ pci_uart_config(struct ns16550 *uart, bool_t skip_=
amt, unsigned int idx)
>                              pci_conf_read8(PCI_SBDF(0, b, d, f),
>                                             PCI_INTERRUPT_LINE) : 0;
> =20
> +#ifdef CONFIG_X86
> +                /* PCI Local Bus Specification Revision 3.0 defines 0xff=
 value
> +                 * as special only for X86 */

... I'll have to remember to correct the style of the comment while
committing ...

> +                if ( uart->irq =3D=3D 0xff )
> +                    uart->irq =3D 0;
> +#endif
> +                if ( !uart->irq )
> +                    printk(XENLOG_INFO
> +                           "ns16550: %pp no legacy IRQ, using poll mode\=
n",

... and perhaps insert another colon after %pp here.

Jan

> +                           &PCI_SBDF(0, b, d, f));
> +
>                  return 0;
>              }
>          }


