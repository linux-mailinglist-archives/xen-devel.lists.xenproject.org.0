Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D7C4B9F70
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 12:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274719.470292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfNN-0007TX-If; Thu, 17 Feb 2022 11:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274719.470292; Thu, 17 Feb 2022 11:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfNN-0007Qt-FM; Thu, 17 Feb 2022 11:55:09 +0000
Received: by outflank-mailman (input) for mailman id 274719;
 Thu, 17 Feb 2022 11:55:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKfNM-0007Qk-GA
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 11:55:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70b7dc7b-8fe8-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 12:55:03 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-VkWHycLAPfu6R8MSsdqw7g-1; Thu, 17 Feb 2022 12:55:01 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR04MB3219.eurprd04.prod.outlook.com (2603:10a6:206:7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 17 Feb
 2022 11:54:59 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 11:54:59 +0000
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
X-Inumbo-ID: 70b7dc7b-8fe8-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645098902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YnPS9/nD8c4KRFmp7yJHwrM/rXbMzTFeSeEuIKsSMe8=;
	b=ZCwgfBk2G1uowHPwiXtLoBiXUfHPoNuX1Dgl3C9yIZGWJ47E1gktvvjBKTrtHcLLXEiSRQ
	CV2KYQ4nLQPxwb9QMS02aChmgQeG7dpIveekF3/PeCl9XpGrNms/X1A1tE2Itj4Z+ePC3b
	9ZilWnF5MgfzD4dBXmbDA4sc1iIR7wI=
X-MC-Unique: VkWHycLAPfu6R8MSsdqw7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=as9HYgTqW+suX3UHm34nCBnaMUIg1J45YcMzYZ1jHYw7IvpEmkMz1Ul7all5L0qmcy0CA39AUuprvUBPYrGxNmNcJuUnpAsT6gG7aW7evqIxcC9u9M6OnJj+FrBFALtgk1Sj/eL+g5aMuf68qq5nSOCMsGPLRVlMkq2lq2d86xsl7Bp26xC2bgk3T0Fg92yqcACYTOi/NrYx2/06nv+JqSLG0zXEUU6A5pI/PBvEHYo4kFTzapyrgQOIWXs0tIMbWZ6L5mrpryJd2kYEeXwQZBkUvz2hHvsnEiTWWLKh1A/cgfLLohy+Hs6HHLu/1r6DpSBzxHdAvxBq55n04YjiTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lwCmrc+OOp3j0OsjVgwI0AAxApvQODONnngGicqeoXc=;
 b=Kj9hehfodl+8MuwoizzB7NGZyEWY2PcPIqk2/MwtNzPORMwFc1av8XiBj1KmV2kQkTEFC2EbmBxJ1WUiChJEsVWl+E1FiCdMzaEX9m9FkvDK+0CTDfgJORUHI2zAW+nkW1Hm9ZftZIoWJYoVPBxc6Ek6l4zm6o7wEqg4ZRYNqG9s5u0Hx+oStokiq2O4u9/pu5OKJQXIwoaRlnuiJQzVIhabaJ/KcKwy3y6nS7kkmaiB7hMupcP+eC6MYM+zItFy+2ydLputYzwZJjgrkVhTgda4jZF3PyeWuPh1P6PZdEGxPmpLNB5BU7eUWJXuVi/cXwa4C/eXGFuzxetil2+0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <16386211-4909-da40-3b0f-c76d64289cd3@suse.com>
Date: Thu, 17 Feb 2022 12:54:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/console: process softirqs between warning prints
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220217082850.19407-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220217082850.19407-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0329.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a5c6f3a-5d89-43fe-c5e3-08d9f20c530f
X-MS-TrafficTypeDiagnostic: AM5PR04MB3219:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB32198E73AC84B27A32C20B20B3369@AM5PR04MB3219.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:142;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VE+zzzjYnSUtOn6XJAqJyXxv3uZ/qaSFq6P9WkVDKVEVrKufaz5en5DLvxPYXjvIsWEsU2K20j+gdNRLZhtdL4aa7QFCjmt3//89Spkwrx2LsegRryGrLHauBK+sA0a/jOhelyT/vqkhxln9/2CUCCVApXuviqJDnp2tsghC1HTCuEiIbM8h+g2WgiCWZ/0hfBqoSERZo4n/y2FQ/SG2s95+nwUt9CXQLqixJyiVlwmh+RHik7UWQzHLZgG62/8hGTbIHexFPxznDsx3R8sCOhgbGXk6WGmMcH26bkdVkWgYZoLi7zRw2vxU11MkN6RyRMOesWNIFH/M5vVhvXYcPn9e0vMLw3WZG7L4+aGwvV/SDzbSadkdYc0DTS4dGFKQ7zlbKmz4X1YVFd0Rt704Vk1tFrp1i0Q9obNkQbm3/TxP8HF1YZNwmBoTdeLjG2zdNeTYY2DcmPb0mEVUzTym/ZpOPPduspYt85ddVJDlGl9AI3D923cgnOocN/Kri8wdvNJHRflPWSKYgu6uDmuP4HeCqT6Gyf+FfVGw+Ax+06i7gE/OY4911odIMXR+2/rVIhU0dNRVpJUZqZO7LxzqPn7nfaaITrgH4yVWQq57PeKwg+rYxvFvW8cdSvMnKAscWwLayMa+iMovMAqU4B+TnA9oI6ooE2GjA+j4+6TooYMPG2HaZuXWn4rGarKlvjz+mEKahgQvMUbZnNCcQczLFczcI9Yl9xr5fSIbgBSFey3wE9/Z7XkicioMgb6Q92Kk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(66476007)(4326008)(186003)(8676002)(6916009)(83380400001)(316002)(36756003)(6486002)(26005)(2906002)(31696002)(66556008)(5660300002)(53546011)(6512007)(6506007)(38100700002)(66946007)(31686004)(2616005)(508600001)(54906003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n+8SQUWEVLiRxa1G+ULgjYrjGJkewdmyKkFazoKttmV8L7nve8YVPUx5wO7C?=
 =?us-ascii?Q?b7EdnDP5p/ljs4l2vgXXyNb9V1EBQbYsIzbpKNxvyX5g8k5fm+6IQJiMP5c1?=
 =?us-ascii?Q?jSuTS+F2eTvYypulTZrUCeIfw6h9xMKjjYTCnijT5cmVuMR3Z0cBztIp8heF?=
 =?us-ascii?Q?jX8NBkKDS50uDsi0A//0bWg+NJbHU+EV7Wmj5jJauir24/uIqBgxKg8FtoPM?=
 =?us-ascii?Q?pEw4i5tSrD4fP8BHCMraA6q8HEt1l36jLO4HTM0CeNSszyh4mo9gHL6WVvLk?=
 =?us-ascii?Q?aPUyWlu9wM/E04ZOsUBuiuBEqsfXhnI3mPTylGsc065E5LD1DCgt+Jvr6iuc?=
 =?us-ascii?Q?Kv8sviGXIUWMshyjliacEQ5L5HnN2fxYhvUb+bolNhjqJWXK3fC5fxnt+Bhf?=
 =?us-ascii?Q?tT6wQM5LFAmmfXNVCyHtIAJ26neOLN3Ja5lfQg61jTpZXBC7MG+bJl1lmBf9?=
 =?us-ascii?Q?JWYLqOqcyKVMX3LwPJ8E8LLoo4he0Zfxd5ZirWhzU55LkZDfhKYYksWkXPXU?=
 =?us-ascii?Q?2P58LmEmUZzR1yl9iZGKDRHqrbY3J1e5DfW8+i94/7Fsu3dwtXtfoZCyP94H?=
 =?us-ascii?Q?4LgN0drMiuMlFes8A9qT4EfcmilBUSMNoMrrvGCJDCRK+1DaZ5kk7e9spKE9?=
 =?us-ascii?Q?uG6/2LLQ5toY++Hy1cThu96VHAxux4xK7ZP9b7EE9EoyVSZotYQ3dRfz0h7m?=
 =?us-ascii?Q?0DIKjfoFz5EiQJBucC0JkAn3wgUHkkvv81/9CXuAS7o7x9BdaH45hCfmaf5j?=
 =?us-ascii?Q?mad/TFb5VT85go3XnLC4scARH1R9iaJHqoWMMJ7RVTDa3r+UwQQlxncYneqc?=
 =?us-ascii?Q?zyb6e51VljbHBRlyiXpk+IWML6PO4Ly2N3HkhCdmegvTEhGQi2cTkfLthNSr?=
 =?us-ascii?Q?C7LtXFFQPWkJiK3tN4lI8nObwb7dkYM3si3Sz9yOpdAPFY0qALr8Ix5VbtDm?=
 =?us-ascii?Q?9QAc/VtynAon3CJ5EUWCfluPbzWfGdVjSFVIt3VWDPyg7xfFKBRjje3yEqp7?=
 =?us-ascii?Q?YkafRa8Ouut7Yp/oCdozA6RgFhAV7jLU3srZU526gOwUKkcEh3U97EpfBs7+?=
 =?us-ascii?Q?kV721ywmsM0qxF1jm30Pvf7NlTtzWUYJZglHqwNOabKiTKEDH+S/P1WPRgOc?=
 =?us-ascii?Q?Cez8VfN+tW3mAe71vsYmkg3FfN3T/eDRpnus7dabz+7hwaTagKaGnfhsFLDt?=
 =?us-ascii?Q?avFd3SHQf0o7uwvYQ8aFNtrXcCme2ECfzNUtGNAYZ4NwAT7gXxeVaz5KD56P?=
 =?us-ascii?Q?QcgBFrPUkh3nKaFzS0/zHTsG8M/2lE1VBf+uf0HTb0PF3aP2kGGhTXieK2C4?=
 =?us-ascii?Q?I3b8pGbWF8bEJsVg2Av3Yh2E/yWw5Oep2lRYS7TzdlJsRzOhHe2JnA3cs6V9?=
 =?us-ascii?Q?9nJU/OXwawegf3NPoDeC/ycqwg84Xkzlit/zdtJPRt4QeIqtmmhjixSsJHf5?=
 =?us-ascii?Q?Clxetna5EWn+vfP6RFTLlHKGp8J5lgPRmn/vQshDgRcDKC8Ag0KQcGs7DIqy?=
 =?us-ascii?Q?n3+mHgngZCbqYsi9INnM4csDmDMLBoAgY543Ap76MOJIKvfK4wYSPmdk4tNo?=
 =?us-ascii?Q?QrIhHfLGfdBuXLPVkO/huU6lAGDbeDu3CX7sf1QRHQ+m7GKBGAp0cn5tCK2n?=
 =?us-ascii?Q?XMgJaVl0bjhFGTot8am4S1Y=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5c6f3a-5d89-43fe-c5e3-08d9f20c530f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 11:54:59.8113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQOoJR1OnraT/wJQtsxAtuXkvRD0jbM6+b476CvUWZcFGMokwn/gvtvxUxbAvwSqBjpM51FjLYJ79WzohhJwog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3219

On 17.02.2022 09:28, Roger Pau Monne wrote:
> Process softirqs while printing end of boot warnings. Each warning can
> be several lines long, and on slow consoles printing multiple ones
> without processing softirqs can result in the watchdog triggering:
>=20
> (XEN) [   22.277806] ***************************************************
> (XEN) [   22.417802] WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
> (XEN) [   22.556029] This option is intended to aid debugging of Xen by e=
nsuring
> (XEN) [   22.696802] that all output is synchronously delivered on the se=
rial line.
> (XEN) [   22.838024] However it can introduce SIGNIFICANT latencies and a=
ffect
> (XEN) [   22.978710] timekeeping. It is NOT recommended for production us=
e!
> (XEN) [   23.119066] ***************************************************
> (XEN) [   23.258865] Booted on L1TF-vulnerable hardware with SMT/Hyperthr=
eading
> (XEN) [   23.399560] enabled.  Please assess your configuration and choos=
e an
> (XEN) [   23.539925] explicit 'smt=3D<bool>' setting.  See XSA-273.
> (XEN) [   23.678860] ***************************************************
> (XEN) [   23.818492] Booted on MLPDS/MFBDS-vulnerable hardware with SMT/H=
yperthreading
> (XEN) [   23.959811] enabled.  Mitigations will not be fully effective.  =
Please
> (XEN) [   24.100396] choose an explicit smt=3D<bool> setting.  See XSA-29=
7.
> (XEN) [   24.240254] *************************************************(XE=
N) [   24.247302] Watchdog timer detects that CPU0 is stuck!
> (XEN) [   24.386785] ----[ Xen-4.17-unstable  x86_64  debug=3Dy  Tainted:=
   C    ]----
> (XEN) [   24.527874] CPU:    0
> (XEN) [   24.662422] RIP:    e008:[<ffff82d04025b84a>] drivers/char/ns165=
50.c#ns16550_tx_ready+0x3a/0x90
>=20
> Fixes: ee3fd57acd ('xen: add warning infrastructure')
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> ---
>  xen/common/warning.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/common/warning.c b/xen/common/warning.c
> index 0269c6715c..e6e1404baf 100644
> --- a/xen/common/warning.c
> +++ b/xen/common/warning.c
> @@ -30,6 +30,7 @@ void __init warning_print(void)
>      {
>          printk("%s", warnings[i]);
>          printk("***************************************************\n");
> +        process_pending_softirqs();
>      }

To be honest, I'm not convinced. This gets us pretty close to needing
to process softirqs after _every_ line of output. If a console is this
slow, the problem imo needs dealing with there (and according to irc
we appear on a helpful track there already), not by sprinkling more
process_pending_softirqs() all over the code.

Jan


