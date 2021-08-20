Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E293F26EA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 08:40:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169242.309165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGyCJ-0005Gm-0A; Fri, 20 Aug 2021 06:40:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169242.309165; Fri, 20 Aug 2021 06:40:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGyCI-0005E0-Su; Fri, 20 Aug 2021 06:40:10 +0000
Received: by outflank-mailman (input) for mailman id 169242;
 Fri, 20 Aug 2021 06:40:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nWHd=NL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGyCH-0005Du-Lp
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 06:40:09 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 759029d8-0181-11ec-a68a-12813bfff9fa;
 Fri, 20 Aug 2021 06:40:08 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-10-fCj145E9PJqm_jerp_iqlw-1; Fri, 20 Aug 2021 08:40:06 +0200
Received: from DB8PR04MB5594.eurprd04.prod.outlook.com (2603:10a6:10:a3::31)
 by DB8PR04MB7082.eurprd04.prod.outlook.com (2603:10a6:10:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 06:40:05 +0000
Received: from DB8PR04MB5594.eurprd04.prod.outlook.com
 ([fe80::2c99:6a5b:2940:533b]) by DB8PR04MB5594.eurprd04.prod.outlook.com
 ([fe80::2c99:6a5b:2940:533b%4]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 06:40:05 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM9P195CA0005.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Fri, 20 Aug 2021 06:40:04 +0000
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
X-Inumbo-ID: 759029d8-0181-11ec-a68a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629441607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TaKctkKB4VvZMCL/0IEKkxclFK5cqJrlEUp0IFG0fYU=;
	b=hPzIAYOcc3SmYkwNa/tbU+QLq7D6EPdr58r2ulIVv876wK5x4E0aSA1mV7BovQreUw5ZLQ
	WYf7HCZvzNYRerCGEFNce3KJ35otsS68XnqMFC3dwC/IGIMOoKMqK3x6/elx3rWtA6FI3M
	k2Pg7GOJuCq1ijpcwtrDrNlx76G4neE=
X-MC-Unique: fCj145E9PJqm_jerp_iqlw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ikosnk9bsa9iMdCmy8/IgK3adfmpt6yvKyS7erNXK5rHqfM0AjLmgToivkY3zYYybPWEvVfYqiBRy6Rnt6GIXc5G5xkt9ut1VrDo4H7IVtVO0mF3rEFxJMlMUzu4sVhfV8io7uZc6fkihGICFAKG5nRsDl/Yf9i6pdfK9Z7wNULpD3OfJOks6IyD1KtpPk/kDJff+rsjWxCiaB2MRc+cwnaEsg4PuIxBv2c3vpBAZnWTCllywLyMxkWxnglaC0/iUGzzgaf+HFoArfDYfs5uWvBg+wibZSd7HhadsWgADY7lzHmx1T2+W3tSZBc30vcPfRvFcd5H1qFGAzGtwFLbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rmqe9DklQavUFmXKaYnR4ceDv5aqg9bft7To23E1xTU=;
 b=UyjtMHdMZbyGK0hH+Li8ayx5hC+LLYf1m89hgEquFDFD5gdRlm1eBbr9od3h1ddUg4v4tZpjIb+y5WAvmurjQoFb9zFBRe8krz0Pp/Qi7CnN4ciCgsggypYSnJMbZbuRFefl8//+2C8hRgnGeUQcgH26u47qF9ONVjFEgTn9gt9hQfTzYnQRjJyQML15VUpZ7Hc1k2EaX8gBKnj2U5kOv00pSKj1tWVmPt3uMVykNQTK/InLX52+/qYMpj4UdLmxX8fwrpAkzjJsM2ecSmhvvCIQTHz0UD1Z51KzUkGSgci9w5Uj1JTchiwdZEZa0qTw/gY9vy+LYWPSHVOsDy304A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 2/2] ns16550: add Exar PCIe UART cards support
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210819190625.476165-1-marmarek@invisiblethingslab.com>
 <20210819190625.476165-2-marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <400c6129-bf27-ccdc-ce56-e7e56c91face@suse.com>
Date: Fri, 20 Aug 2021 08:40:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210819190625.476165-2-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::10) To DB8PR04MB5594.eurprd04.prod.outlook.com
 (2603:10a6:10:a3::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e59b566-e3fc-49eb-c46a-08d963a55813
X-MS-TrafficTypeDiagnostic: DB8PR04MB7082:
X-Microsoft-Antispam-PRVS:
	<DB8PR04MB7082F27BDDCA6AC3534A3556B3C19@DB8PR04MB7082.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5f/vHUF5Tgv17xtQ8Cn4i3jzpba6VqSfF97TF8wjObwZ8QO5KLhz9F//20HsFsqvzrajECLdkUET/CmV1n+H3McOyjIt3S8oTslwxE11vwPljKu7r2dHhxTj6y5oT5g6bX6raSew4oUoNTZMzVKyE+/RJr1E4UnNt1UQ1kVsnaFr5+YYKjvFa92s6JkXrE6SSzCkSKtv0Zv1+S6VrHYPjqtr1I6MWewJAzsnYJTtb1gqDbrFVgTA+X3TUH2pYZpsOKXHkKnYJgj2jANKt98v7R1Iz1xufD8D5fIUgYXnf3pr80ys7BucI6bwb4vSWScXEQdpeiPUpNqvuYbLDtjGrubz8Ia7LFu92WrKtaQTw/h3K86CqtEjGMucYIaAdTPNFaieedt0f7WW1gclmBUjACAC/y9rBU6K3kfbbM9PvyE5Y3Gn10J2BJsZOm1kFj62vTPNsLZMhRNrP2o6aEp9pxjGuafxPrP3w5QIwyrd0fAmjcJZf784Gnrd7ceFoz57FjCAW33I1waDKPY5Z8VrTD+4W4KYHkBtD7r60iJHHb+OUD9TmdbiQiDAu887DVZ6BOAbaOLOO88WTaFZf7Nzw46YcsfE/uSSS6Qsy9lwSC1bXEC2rKukVAF2mYBuJwHUPyuGjk2+RCd7Z98FfmTyafrcYBcqs5eRcAONDEdCXZ2DA03g13hokcvKo1FYsuaarXEMfiW5rlbV85s7IR3iB+ZIpTUnlx/z4dgHz+Ualft4+/XwGdYjuOiXgKaXzUsJbV6vTt8kw0GJ3Xw+MTH09UnnDagtk1nAeLvsKlAWY9o5D7KE1J6Eux60v4lSeX2h
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB5594.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(396003)(376002)(136003)(39850400004)(26005)(8676002)(478600001)(2906002)(66476007)(66556008)(6916009)(53546011)(186003)(36756003)(54906003)(38100700002)(966005)(66946007)(6486002)(4326008)(8936002)(316002)(31696002)(16576012)(86362001)(5660300002)(2616005)(956004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/N/5QqrHrXb7Fns42VNHpnsQxBQnrGl5GbJeoabVEjlcKvqx0aN7TmvCdUjo?=
 =?us-ascii?Q?/Ieh4lw/McbJvuf2gl6aVzTg4WW7pJyfrgs6+LW71U0hlXB6aUZSgLlMCRoe?=
 =?us-ascii?Q?6SmgX8lLfPLCIxJI76wwCSYA05YGkbxBxABpzL5caa37opfolkF/hsI9PUBu?=
 =?us-ascii?Q?H8tPMVrj5I99ZhUlLpgu90Ex3pHIGaAcAItM2AT519bS80WpCUdAXqKEnORn?=
 =?us-ascii?Q?1dtqkekN6uwomzd+/kNkriEuWxT0Kf7yG3HbqwjPUa3DX/Y20N6FezOB9Tyj?=
 =?us-ascii?Q?/pAkDbBlcZEcD1FnQ0eBggOiYt96h3huAmqc1AiIl55xXQrvIEWYlqzzahFm?=
 =?us-ascii?Q?lRp1h57Ho9o5yC/fHQXHlEPOBr6NU2Ge2YbHWjkzm8qg5Ty+kyAR/BhZA1Qw?=
 =?us-ascii?Q?bRHH+fm53gN7tbeR5KNmPJX3ONumJQgeunA3LDxgsIIWnu9rH/nDcXIv1gsv?=
 =?us-ascii?Q?lmKN2J8pW2x64L4iLNYS51xbopn461MYGE/Y+F2naGf9/IcWiNTjO/cxnDHq?=
 =?us-ascii?Q?RF4SQ2sRduDAW4mE2+YIAUOhLp7lcxgUx/PJ3ddC+JanDUayALaX3oSyLlAu?=
 =?us-ascii?Q?467lO/HrvAVJGv056ph8MzsuMqxy9LM6LYVGB65DRHWg8mxvfJoHFfpYp3VZ?=
 =?us-ascii?Q?fPaZe2sKfYliTn8u61Xv1e22W2QRdo45t+fybNC5cB6MUfYYeNrYuv+INJyf?=
 =?us-ascii?Q?Zs/xHnTO7VwAEiEK+bQ4PIveD1IbBqtKj56G1EtghuUOfO8Mp5t1opDGHLuk?=
 =?us-ascii?Q?3RaNbQH7ChpSIj6xQOtvs3lwrfWhCDeITu+hiYzb8Al+yqByD9eNF14z8528?=
 =?us-ascii?Q?vdF030R+JJcXvFAPbR1UsFRXrR/Xz3OTc/VglMahwR+g6MXZ1wDm6oONhYRN?=
 =?us-ascii?Q?Gyj5+/a3hdAn9RVo7J4XPTrhqKm0Gns8Ytxp15NugWvsmlROUW59jz23s7Wu?=
 =?us-ascii?Q?tSQL9UoJ/6cCW/GCQWD8zkE20x50Xn0ugXONEiVEyzdYWNZKcLfRHM8g32co?=
 =?us-ascii?Q?6Vg+LAZ3K4rB1hxJaLqNY7BgQJijUxExHWCAH73OwriQW+2I6BgssuQ+Tgrc?=
 =?us-ascii?Q?x02dCPyAyhML6xQapKeujH7PQ1f4eZBRVyPvtxGOME6tf6Ul5czb/YJADQxF?=
 =?us-ascii?Q?nFqzgluzEI0k/H+BQmXalEx5vaX9XpuWR6lZQxToVutF0iUsuFuuMK2vvxEG?=
 =?us-ascii?Q?TALj6TH5jLjQFZMsIQaa5XdHtCw/kS8Gh0KlZCA1rV0uTZyElP8iAz4GgnJm?=
 =?us-ascii?Q?ymgpuJras2r8esr2wcN4BKUkHmgdvbAxXz8FDtrPp9t1sSPqU8drIhnSIdjt?=
 =?us-ascii?Q?1Jp3DbfVLTlzqh/tOpzZJEBm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e59b566-e3fc-49eb-c46a-08d963a55813
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB5594.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2021 06:40:04.9309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gJnH5PYpQ31/vEVBmgPSdrrwhZivKJvv703DDtqDFNasg3W9OUJIbZNgqN6ZpBH9yw83CxGvWIFnilPkL+SMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7082

On 19.08.2021 21:06, Marek Marczykowski-G=C3=B3recki wrote:
> Besides standard UART setup, this device needs enabling
> (vendor-specific) "Enhanced Control Bits" - otherwise disabling hardware
> control flow (MCR[2]) is ignored. Add appropriate quirk to the
> ns16550_setup_preirq(), similar to the handle_dw_usr_busy_quirk(). The
> new function act on Exar 2-, 4-, and 8- port cards only. I have tested
> the functionality on 2-port card but based on the Linux driver, the same
> applies to other models too.
>=20
> Additionally, Exar card supports fractional divisor (DLD[3:0] register,
> at 0x02). This part is not supported here yet, and seems to not
> be required for working 115200bps at the very least.
>=20
> The specification for the 2-port card is available at:
> https://www.maxlinear.com/product/interface/uarts/pcie-uarts/xr17v352
>=20
> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one line dropped (see bottom of mail).

> I've opted to move the #ifdef into ns16550_setup_preirq() itself and
> move the whole enable_exar_enhanced_bits() into appropriate #ifdef too
> (need to move it anyway, to use uart_param). But if you prefer the older
> structure (#ifdef inside ns16550_setup_preirq()), I can do that too.

That's okay for now, I think. When we gain more quirks we may want to
re-arrange this some. The only thing I don't like (but which is
unavoidable afaict) is ...

> @@ -104,6 +107,8 @@ struct ns16550_config_param {
>      unsigned int uart_offset;
>      unsigned int first_offset;
>  };
> +
> +static void enable_exar_enhanced_bits(const struct ns16550 *uart);
>  #endif

... this added forward declaration.

> --- a/xen/include/xen/8250-uart.h
> +++ b/xen/include/xen/8250-uart.h
> @@ -35,6 +35,8 @@
>  #define UART_USR          0x1f    /* Status register (DW) */
>  #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=3D1) */
>  #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=3D1) */
> +#define UART_XR_EFR       0x09    /* Enhanced function register (Exar) *=
/
> +#define UART_XR_DVID      0x8d    /* Device identification */

The latter line can now be dropped again, as the symbol has no use
anymore. I'll try to remember to take care of this while committing.

Jan


