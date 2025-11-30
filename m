Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F2AC9503C
	for <lists+xen-devel@lfdr.de>; Sun, 30 Nov 2025 15:31:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175276.1500108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPiRh-000827-UF; Sun, 30 Nov 2025 14:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175276.1500108; Sun, 30 Nov 2025 14:30:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vPiRh-00080G-RO; Sun, 30 Nov 2025 14:30:37 +0000
Received: by outflank-mailman (input) for mailman id 1175276;
 Sun, 30 Nov 2025 14:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k3In=6G=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1vPiRe-0007zP-F7
 for xen-devel@lists.xenproject.org; Sun, 30 Nov 2025 14:30:35 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1be8afce-cdf9-11f0-980a-7dc792cee155;
 Sun, 30 Nov 2025 15:30:26 +0100 (CET)
Received: from TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:24c::11)
 by TYYP286MB4078.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:155::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sun, 30 Nov
 2025 14:30:20 +0000
Received: from TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fb7e:f4ed:a580:9d03]) by TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM
 ([fe80::fb7e:f4ed:a580:9d03%5]) with mapi id 15.20.9366.012; Sun, 30 Nov 2025
 14:30:19 +0000
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
X-Inumbo-ID: 1be8afce-cdf9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyKto/DYoFy2YnSSg1nEooYTWUjHaof6hWXOU8QjHDRqtJfDI0mDPNFJnarzAgEhX2VFOBfOlWpcTC0gAYhRDW9636Yf4N7pyWMw64OPx0gKIoW6/i7/jfKujdW2ioEJjVTMqyg0fE/8dNaGiTPkI5KVuIvimD5Ziw3KefUqCLnZyojiauAdauFaJPyCxdDljPbCacKWeEK0s65z5+9z58DPgeuERkltHTRLEPtmcP38yOxNyFS28Z7q7MwyTGnJ2APWVkzFqvBLOAft6TPVXrDieex+z6tyqRC+sjmRH/n0dHb/psq7/DhxvtckAiUf02nmDBT1DEG8487QRw/lXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZM6gIeCjZALUY7BBHCzEIGqDm+AiG9jQjjnzY4Pack=;
 b=eNcJLtT4jDEi9QsDPXq1zcDao44dDWnzGgh2cFVtaPiJ/BqzIesLqgZV/8OOX9NAuRdwLF4ShKLlAtRSKBvqqq3xc0/NW2L7gpzdNOt/QaTqH4GzMGU9zkwRgPXSWFGGG2NJn5JMMIRlHEsIDr/EcIRfzbX9qde2AO3GpuwucjUepfbfiemPDANcmo06OVZYwzht1Fhuavy3HkgZD+ax0lsjW0V/MMPcat8b9RmJtOkxu1eBmPdrkopEbayTaEGeWkcCafzaiEJd5jtN+l+le+QI9PgJQInzFni/Xsrc3/Rk4rXo0o2AAK30mjzu6U3XHxTNfY8TYrZnWJd5VIn2ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZM6gIeCjZALUY7BBHCzEIGqDm+AiG9jQjjnzY4Pack=;
 b=XJLewDQaiW+exxiKRvQk+p9WJl74R7e8vD42HvAolLlPu3xlIkj0uqCDwgYzLp5eKiqXD9ZC5qd4ctxajvvamfaad5mnmEUstT5IWz9htTiJgskZ4QOSTEqbnZmlpwTGI7TzOjd+i3ZLElwE3B3EMt3GCmbS4PZKxoJ1R1XkCvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Sun, 30 Nov 2025 23:30:17 +0900
From: Koichiro Den <den@valinux.co.jp>
To: Grygorii S <gragst.linux@gmail.com>
Cc: xen-devel@lists.xenproject.org, dfaggioli@suse.com, jgross@suse.com, 
	gwd@xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, 
	Ayan Kumar Halder <ayankuma@amd.com>, Julien Grall <julien@xen.org>
Subject: Re: [4.21] REGRESSION: [PATCH] xen/credit2: factor in previous
 active unit's credit in csched2_runtime()
Message-ID: <uwoaj27nf7qk7z4ki3d6nbvut6yhfn3e2bdhmggqajwpicsng4@yrylm22q57fd>
References: <20250621141411.890250-1-den@valinux.co.jp>
 <3dfd6d2d-fb56-4ecd-a86b-8c6068b2e470@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dfd6d2d-fb56-4ecd-a86b-8c6068b2e470@gmail.com>
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:24c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYWP286MB2697:EE_|TYYP286MB4078:EE_
X-MS-Office365-Filtering-Correlation-Id: e56a3be2-63e7-4310-3ad2-08de301cfca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1jIas4UCtV8EHNBJi7OLnCEtqgTK5JTAaoNqVJ1JWNEZkxkZKnyf4vsQa03k?=
 =?us-ascii?Q?PFGSkciBig7ZCosgbWHtSv9lUAxDaVMNqUhl1KKoUXyHb41j72eQyBsBtgAq?=
 =?us-ascii?Q?4K4c34t2lwHcy8q1rLzUPVIWgtIxjCkQr52XTOihB3oqjAPYDYjsrX5yM+y5?=
 =?us-ascii?Q?x1IfgsGxEtUnXJeqIDZEdXyLBDqZUkOKF9bseEcHcAXLFScooISMazCClzTT?=
 =?us-ascii?Q?j6u8Ck3QeO4cQkMlC9+sql0FzNzl+ErqnSTrofKRUovfwN2QG5k1ESCeadTX?=
 =?us-ascii?Q?jpw5ubqpGfgEeLuFY+ZAPCBPwzhWiZeGk3MjZnY+k3NLyuMH1bEn6r5+H74n?=
 =?us-ascii?Q?GgP8wOn241XacgNziuwAh41VgGcCLnU39w67e38Req0mzW1Io8BEufEoCOm/?=
 =?us-ascii?Q?41eiNEF0+0q3mIWLbyI/uiQS/aJKhztRLnZ70un8LHVOyBjj5pLoIulADmOF?=
 =?us-ascii?Q?P3bQM4QTMRxzhwS+A74mM2cpdCFDB67WlIQJ9e2rOtsVWIVLc64d1AW3F0mg?=
 =?us-ascii?Q?Fedi09cHvuk52df2lxfZxVPhIIswkMFH79f47Ts0Zult1f5upy02D8CFjtBP?=
 =?us-ascii?Q?AnDKPqeEMM5ep1tlTgPYF2FGAqp3MPTu8rgm+mdul01f75wb9PKIwU8SzL+5?=
 =?us-ascii?Q?5nTWiSZqlkq2Gv9aXnsXCGausEELKd6Srqq3YCSbOLhzUosz3Uv/vCpDD3iB?=
 =?us-ascii?Q?neIC5o9VeN81/V1y24Nyr3I+ooTnxAMoeiK6eIB6Pb2XyBmF9qCKTdhfsbbU?=
 =?us-ascii?Q?8+u4FOBfSrVL82TVBj8gHvBUEK/IBK32ViBnYTzoHfxJwu1WGQZTagpWJI8L?=
 =?us-ascii?Q?67+Qo9HMwUVjh5iUwdh0+28mZDlJ89NujmnR+g8e/i/QPZOAhWw2QzeuZLdm?=
 =?us-ascii?Q?ysifj71E1Y1j9LILQ81lHVjum0X5hWZp//ts5SrKhzyk/5so9FJJY06Ldf2H?=
 =?us-ascii?Q?ZTF49K2egE5dI1Zv7NGmTzIjbj49v4wJTPaBGoKoXcpw9lmLS2uPPp2B7K7z?=
 =?us-ascii?Q?o8QKenCSwHlqowZKU+3Wh1eJYfyQxx4Wo7LYE0BbYf6krNYGqmFIQyNPPY02?=
 =?us-ascii?Q?xaxtyUAAA/XJsnEF4gitV8JTiD4e/WMLlKoYrbP/gX04RfyvrKB7QtKsXX3L?=
 =?us-ascii?Q?5eQ9eI9NW5goKiDD06zCTMSC0WOrA9Ar7zn7pG3qXS/D4WLXgWmDImYCVSHS?=
 =?us-ascii?Q?T71bfqE/U7safo1jhGuZ0Ka1vIrRQwcgp+8nzOTbeJBLQ8RwmlyP+ei0urb2?=
 =?us-ascii?Q?iGbnoTy2g5MIdYu18tLLTf4MHe/3KlBTqibYBVNrCFB6t/d0F/p2F5ezStuP?=
 =?us-ascii?Q?q4DGRtSSfRkHY8OjMRkVYzxs5OuD3rDxhxMunU20gBPQQej8ofWJ9pNw4+8x?=
 =?us-ascii?Q?cqmVvw937b2kr0DYgGy81a4EX2rwLcVa/jpGqYbWZMBtykowS9Lr8shPGpcr?=
 =?us-ascii?Q?LgCpM6K1QPex+ab68X7DMreMumoGNhuZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GmKasEDpZ1heJ8kB8DskazN/GYYAHmwic1uCTOv1jOq5b3jLqdMWdRf3o7g/?=
 =?us-ascii?Q?/+e0EBrCWAFl5oAmqEdb2WwuZpTNcPWb1heMTLpD4gQ3He5O5g2rk4pHwnW8?=
 =?us-ascii?Q?816WSBgbO9BGBAFThLAaJ2IpYxzMHr4Pjr/LrHnWcDdgLzDD2311NqC7k18H?=
 =?us-ascii?Q?WjHno9t/lGiamhj9gjwCldgUJf5+ODXaXPML6SIPRo4AmnDmjCN+h3gBnaNj?=
 =?us-ascii?Q?6IO3egw2VDMAS7c7KuPPuED/0BTcvCMcpmkjhjbFhRhGpgC3tYi6OD6gQ0rz?=
 =?us-ascii?Q?RlHHkgVInRQksBB0rn5r4KDgOuPbGhD5+RIIcDdU5noHbkNKAXcEMCw9KBRZ?=
 =?us-ascii?Q?i2gGKcP4K++YOG0akhVpYvVZuS0OW3Lh9npiexYdRc9JvwEsBNLbiPeZSDZn?=
 =?us-ascii?Q?3D2nILcGVvhZr60qerNuNPlExDuoetC5fUqv01ImtrxJ2XAKN0MfwPCFDZF9?=
 =?us-ascii?Q?+HRrySPk629voyZUr6sGQFS5XaC0spxjvz1/991ttEHQRQ7/7UdBqKwFa5nH?=
 =?us-ascii?Q?KBdpQjseBWMDz392g+6/WF/aASRxVsTs0XXgNs2O6yBMHLKMUiYo4FgaLatH?=
 =?us-ascii?Q?cuseHxBt07QydvIt0O1DaRAiM7e2hsMCfDDYe53T6bnyf/Wo91FTW6X7zunY?=
 =?us-ascii?Q?hOyvGRXcPVC/L0V8g45fNRAzk2kzIvCLNhxLZoIu0SeQEWGsL2pYNGK7CvsP?=
 =?us-ascii?Q?KUKr2tDPpZe2cXwJb4UZuXOqBby2THaqck6vE0XQOqgF3+L4zGVl8rH7jATC?=
 =?us-ascii?Q?mjDIagYf7UPe5RZAL0WHhYFfyGCJ1Pj2VTB7bA5lXuCdJAO4eCgXUc1ptWZe?=
 =?us-ascii?Q?g4eC/Lv7DGQ8Cn5FAXcQr/G1aVPNeerehrMwq3hTzahqXz2jqN1L7ak5VDuX?=
 =?us-ascii?Q?9yGR8CegLOnS2y7FkcFvEZxpZNdIa90LL9aSDjGQZQYGOFB6CtSYWoVcvnEL?=
 =?us-ascii?Q?Wke2IPOhLoNJBiJPoBJyLsY77//x3XmFrBJ6zlpiKn7Ezmq0HUJv09X+UQ12?=
 =?us-ascii?Q?YbxHegoiuNqAJ6frRZ8FCLWuJLcbSqd/Z7UEQFk+x0zAr8Lp774/JzFa8bLj?=
 =?us-ascii?Q?bZlOOomQcO2kyq1KDGC+jPb0NtLy3Apkn/F4B0yEzx6CZJmVcxNE1YpYEhUT?=
 =?us-ascii?Q?YkbA73+pGRyQqDQGj4MbBMePF5uByZd1vwpP3hwIIVp7ufRx5K6eMFE9Kes3?=
 =?us-ascii?Q?a8okN3CA/Lw+Ng64nnSnEdzK8He8zhsMaqab/de1laB3rHw5WKYhD+iGa6ap?=
 =?us-ascii?Q?YgriUFR5Znuo+OHkH+8+4LErlgAgVTVoYNXl0mGx9KZ0tDdoef1Oe2u1MMg+?=
 =?us-ascii?Q?/wCgWWay35bG/4Nxgf4jCvYfX9/dBd94Iq49HgVHP5R5cBIhJsv2TnzxS7hn?=
 =?us-ascii?Q?27CNsbexO47rARHd7XJb/aTryMslB94SMWNUD3HxXmCJEop0h+/OTIfybytH?=
 =?us-ascii?Q?9oxj1uMX8SrzqbVKtD16SwVw5RP00V1TYgDdp9d4SgrYU5+WlhdlnN8+8vV1?=
 =?us-ascii?Q?WS46Y+gBrcOorlGpsTXfoZArkoIEtcUlMygR1cSLrFSEw61RtkalBzm8gxDY?=
 =?us-ascii?Q?eXvJfzpFKM2Iq01sSMB2VNn1z5qaT+ctTLu14uH3r8JX2yr6x+X0c+nL9GKt?=
 =?us-ascii?Q?vLDLUoegXa00b5zuFK/nVZU=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e56a3be2-63e7-4310-3ad2-08de301cfca8
X-MS-Exchange-CrossTenant-AuthSource: TYWP286MB2697.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2025 14:30:19.2052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpXHYit41oS4v4Hf1aCnYgHVNldjpJAvAdz00mNzsaACfIGzw0frdgCnsg5LAo7uH81oXfovxBhBW1/mBN6l+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4078

On Thu, Nov 27, 2025 at 04:55:17PM +0200, Grygorii S wrote:
> Hi All,
> 
> On 21.06.25 17:14, Koichiro Den wrote:
> > When a running unit is about to be scheduled out due to a competing unit
> > with the highest remaining credit, the residual credit of the previous
> > unit is currently ignored in csched2_runtime() because it hasn't yet
> > been reinserted into the runqueue.
> > 
> > As a result, two equally weighted, busy units can often each be granted
> > almost the maximum possible runtime (i.e. consuming CSCHED2_CREDIT_INIT
> > in one shot) when only those two are active. In broad strokes two units
> > switch back and forth every 10ms (CSCHED2_MAX_TIMER). In contrast, when
> > more than two busy units are competing, such coarse runtime allocations
> > are rarely seen, since at least one active unit remains in the runqueue.
> > 
> > To ensure consistent behavior, have csched2_runtime() take into account
> > the previous unit's latest credit when it still can/wants to run.
> > 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > Reviewed-by: Juergen Gross <jgross@suse.com>
> > ---
> >   xen/common/sched/credit2.c | 28 +++++++++++++++++++++-------
> >   1 file changed, 21 insertions(+), 7 deletions(-)
> > 
> 
> We observe regression on ARM64 with this patch.
> commit ae648e9f8013 ("xen/credit2: factor in previous active unit's credit in csched2_runtime()")
> 
> general observation:
>  This commit causes Linux guest boot time increase  >5 times for some of our the credit2
>  specific tests.
>  Reverting it makes issue gone.
> 
>  - normal log
>    (XEN) DOM1: [    6.496166] io scheduler bfq registered
>    ...
>    (XEN) DOM1: [    9.845108] Freeing unused kernel memory: 9216K
>    (XEN) DOM1: [    9.874792] Run /init as init process
>    (XEN) sched_smt_power_savings: disabled
>    (XEN) NOW=16800131328
> 
>  - failed log
>    (XEN) DOM1: [   37.281776] io scheduler bfq registered
>    (XEN) DOM1: [   61.856512] EINJ: ACPI disabled.
>    test: timed out
> 
> Run Details:
>  Platform: ARM64 (Device Tree)
>  Execution platform: qemu 6.0 (2 pCPU, 2G)
>  Boot: dom0less, 1 domain (2 vCPU)
>  Command line: "console=dtuart guest_loglvl=debug conswitch=ax"
> 
>  Dom0less cfg:
>     chosen {
>         xen,xen-bootargs = "console=dtuart guest_loglvl=debug conswitch=ax";
>         #size-cells = <0x00000002>;
>         #address-cells = <0x00000002>;
>         stdout-path = "/pl011@9000000";
>         kaslr-seed = <0x5a7b5649 0x9122e194>;
>         cpupool_0 {
>             cpupool-sched = "credit2";
>             cpupool-cpus = <0x00008001>;
>             compatible = "xen,cpupool";
>             phandle = <0xfffffffe>;
>         };
>         domU0 {
>             domain-cpupool = <0xfffffffe>;
>             vpl011;
>             cpus = <0x00000002>;
>             memory = <0x00000000 0x00040000>;
>             #size-cells = <0x00000002>;
>             #address-cells = <0x00000002>;
>             compatible = "xen,domain";
>             module@42E00000 {
>                 reg = <0x00000000 0x42e00000 0x00000000 0x000f1160>;
>                 compatible = "multiboot,ramdisk", "multiboot,module";
>             };
>             module@40400000 {
>                 bootargs = "console=ttyAMA0";
>                 reg = <0x00000000 0x40400000 0x00000000 0x02920000>;
>                 compatible = "multiboot,kernel", "multiboot,module";
>             };
>         };
>     };
> 
> Investigation:
>  It was narrowed down to a specific configuration with cpupool assigned to the domain (100% reproducible):
>  Host has 2 pCPU
>  Domain has 2 vCPU
>  cpupool_0 has 1 pCPU (cpu@1 credit2)
>  domain <- cpupool_0
> 
>  if Domain is assigned 1 vCPU - no issues.
>  if cpupool_0 is assigned 2 pCPU -  no issues (seems slower a bit, but it is on a error  margin level)
> 
> I'd be appreciated for any help with this (or revert :().
> 
> -- 
> Best regards,
> -grygorii
> 

Hi Grygorii,

Thank you for the detailed report. Could you please try increasing the
ratelimit_us (the -r/--ratelimit_us option), for example to 5000 or 10000
microseconds, and see whether the long boot time issue disappears? That
would help determine whether the previous behaviour (before the patch) had
simply masked the effect of the default 1ms rate limit in your setup. In
other words, after the patch merged, you may need to set -r/--ratelimit_us
explicitly to some appropriate value, which is larger than 1ms.

That said, this change touches long-standing credit2 behaviour, and we
probably should've discussed backward-compatibility more carefully. I'm
completely fine with reverting it if maintainers think that is the best
choice for now. (To be honest, I hadn't even realised that this had been
merged until receiving your email, since it only had a single Reviewed-by.)

Best regards,

-Koichiro

