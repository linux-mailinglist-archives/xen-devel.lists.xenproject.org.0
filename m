Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119534BA32B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 15:40:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274812.470403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKhwa-00034T-7L; Thu, 17 Feb 2022 14:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274812.470403; Thu, 17 Feb 2022 14:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKhwa-00031f-3t; Thu, 17 Feb 2022 14:39:40 +0000
Received: by outflank-mailman (input) for mailman id 274812;
 Thu, 17 Feb 2022 14:39:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzkl=TA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKhwY-00031Y-9u
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 14:39:38 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6db386ac-8fff-11ec-8eb8-a37418f5ba1a;
 Thu, 17 Feb 2022 15:39:36 +0100 (CET)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2052.outbound.protection.outlook.com [104.47.0.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-ih_-3N9dNI64B5ZMD5aDow-1; Thu, 17 Feb 2022 15:39:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by HE1PR0401MB2346.eurprd04.prod.outlook.com (2603:10a6:3:23::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Thu, 17 Feb
 2022 14:39:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Thu, 17 Feb 2022
 14:39:32 +0000
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
X-Inumbo-ID: 6db386ac-8fff-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645108776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dP1p/T8Bhac5jKrK8H6jCmoDnc3lGYrdmo5Lu7G2Uc4=;
	b=PsKbFz9nCusdpeGJtuUFPr7IaZQ6gSadD2cejqXnI7uCvwc0L4ZsecnH0zgkBNW2klF0I5
	FUDT5mPNRmODGC3ssigOstif7MencGJOEFYbhog/+psvEo/YgFJ+Z2zA7wj3xDMO0QK06c
	E0JaIrvzyUJkDrjDMgiVNOgSaMw1AgE=
X-MC-Unique: ih_-3N9dNI64B5ZMD5aDow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESqX0Am2z5yuoxVuzCXXycuND6agExhNGqtIFws0vNBHDeFLKA2D1JbyF1Jcz9w5/mbL/1IZXeIyUxmoikghRn7r+1EopdbEye5iD4Sys9CmAI180mD9zoGuLehKTnRH4WG6tEJw1N3fmwgnZKxozEls9qF3/rYpZXFneQMy5Lml36LbLDrdaEoFCchenFnd5uvVepFW9m4qUmZtkdH9nbC0Lr7Ng5ZdhBwDtAZzJOo6D4z7awOr0yzsXsTSMZIzQ27i8CRzH5W+0RXqZHdeCmCXKftAE6Lhra1PisjPe2OhDKagii+bmx6Vzru0VEPYDPhPT5e66JdxLT6s4N++Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8qfcCKNg6fcvSUgvLIzGViEgbFFi9JhMHMAPhxCAyM=;
 b=ebDMyWAw8AvPgYiRbd2B1IvzyvJUmnAKWXtGasgtGdJVWc2TaUExk/8eZwgE0OzHgaSG3ZcSnfkCSgqCyJMk/GLXiXMVA1ROub31t/QQrr1GYZmJBnoHNJqz6eTGL7YKE5W0pmNM3uwSgwUn/JaMLTcnaIDcvxN2fKML8tnABUZPpKOzcTzXuu7fKO8RIPOFM6oVlZ7A/aecZnHER6QP8/XffvNbwgOSO5hHfvnOCaG71/PbvLASjs8/6BgAq72A34K6MqahUB2RyQB9Zk/0DqetZaT7IsioTKPmE4QFdLjCKh7yyGRj4PtDGuWNEA676sf+XxkMlbgG2eOOA/VGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4faeba1f-1062-e08f-1a5a-0b8bb383fe7e@suse.com>
Date: Thu, 17 Feb 2022 15:39:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/console: process softirqs between warning prints
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220217082850.19407-1-roger.pau@citrix.com>
 <16386211-4909-da40-3b0f-c76d64289cd3@suse.com>
 <Yg46HsntJztYBQS0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yg46HsntJztYBQS0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0043.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::19) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e9744da-4596-4ff8-6685-08d9f2234fc2
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2346:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB234614AC6A1E7FA130EC22ACB3369@HE1PR0401MB2346.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:335;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N/Ek+vfH/0TllQaavT3GjyGex+VPUIYXanWvBzgqMK0iW6xOT1Wu/3iJEb4DhuCL5OjD25+uurB7l4B5HzRre5KHU46Jx2Gig+Qro/CT5cDqKLE3rxUNgjC/I37nl7MlqnSAYJIHUvMgMn3tW7NHZuFh3LnHMoi+MGBwVpXMrfQd0QkyO4zyqYBLkKdNFCx+hMp8kE6ef1GJ6wFx1Apph6BbPf6KVcIRfbmDx22zU+hC+Q9Xa49jJdzQi8w2vJ65U2ODD6Tj06jrxkiVSt7e6YX/TMK0BqrLGwtidgupfVgbuPQ7WqAo/9AUV1Nc2kzl6XgINH1z5ia2EZJsAtrdg6B/WieyyE6OlXdtago0egoyFkM2YTRpgffEP+5K9brqiWA9GRviReX8B9pO42k6meVZzaW1R9z/uFf1btOMirXXh23jc1NuHVc5oq5Yu3U0fF7HSvAHfSzEW3hgce6NQ74SIf1/Np8Uhmksj0jxXiaIh3zezeJGn6h/oKU8KQgJfr9SvyAVv32mwJVQXb/u0ZXHu811sutD14hX9RWyPlAe8DeJ3VhWFNrD9Jaig3Cs+RUgrEMi/X5rysAM3pwnzz0KGX24/+P8qzafYDp6vCg6STdt6auVdopRbM1TunzuHedwMFN2g/zBv/AdoZ+9kKJgWXae0SF8LTfLgR3kT8a+n0i1f3WzQU4D4s9HEI2efOPCwVlB8kPoAlw+IvLnwLB/BUTzASj9YfFFIdkrkDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(6916009)(31686004)(54906003)(38100700002)(83380400001)(8936002)(5660300002)(2616005)(186003)(6506007)(26005)(508600001)(31696002)(6512007)(86362001)(8676002)(6486002)(4326008)(36756003)(66476007)(53546011)(2906002)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rgyE6f4FtaKBEMvDOTuKwP79urvYxWPURynpM0UaAfn2UCJq9xvALDA6FO92?=
 =?us-ascii?Q?GFUlIMuEe3Xk8Zow3/rUH7blpVy2cB2Vrfi/S31zsk/fKzF52YaF3djYjszz?=
 =?us-ascii?Q?WKfzZAvDUKDu8H1TOze/zvoG3XHzdNRNN3vhVoVFDs6zkLEYTrVk4FXQr6qM?=
 =?us-ascii?Q?FwfUtHM6IHMVS9sIQGhWj3FDBL8fjHogC9Jxsdy9PdsSqtvlwxF1ojjrEmZw?=
 =?us-ascii?Q?hhkP8rSy3AWtTmmnlW/R1l0zinHqtl8lrMvK4gsa+XZ6HLLyxi67n69Kq6ZY?=
 =?us-ascii?Q?bEXLLnuXNIKWn5y/x2nH5cxhFb25wrzA6VabfEyeu/Z6XOuB2phJBYqQcNB8?=
 =?us-ascii?Q?KWa2qR4X7iqHVnLZXmvFQh0YM2C7h3kPB/FyoswfkXF3D5I1djWdmcqi1Hk9?=
 =?us-ascii?Q?251OEwhh+VuVFYrX5tOO2Lq/rbTZi0naW2kgkLM+ogcn/+D6HMvyzE0DcgrI?=
 =?us-ascii?Q?I4ZfJMqcpHXOHyob207MoQPbsEKDj4EENKmQlAgR9J7yBpMcD9v9ZVCB5Wh7?=
 =?us-ascii?Q?r4q6auAHtvnRdtxNyF7LRiHFay8U8oUuZkaGYUOqSFTrIY2P5fiBb+tGLkmp?=
 =?us-ascii?Q?uy9ICNJz1koG2wZjdF5XQX3CNCC8XGivP180b77UafiinOCDg9HnwLmjjQqg?=
 =?us-ascii?Q?3QWqCtiHq8DSaddnUXOOZGBMR22DXWF0hg4+qFiwp2d/Y+JLb9RhknIaofdd?=
 =?us-ascii?Q?VKKEASd9dFoif3MzQ0XmM5UCHsqMvLy6HLFhP9VJVR1Uv53OvPYmElM0GozG?=
 =?us-ascii?Q?+3nFw2XHK/GQl3Gsjhz5xL9a35Ii6h169McIxx/WPnsOBd7Q6bb3Z1DKVRD2?=
 =?us-ascii?Q?omEKyv3Z77er9USVOaX/Z/9MIP0bnLHoMRSwtFAqLdyBASy/nkRI+FNyfZJo?=
 =?us-ascii?Q?lW4wdHNjzn4LnZnjWjOF5w/XvS3GZj21X+oOTdukIluM0O8dvvwhmz8E6MeL?=
 =?us-ascii?Q?L3RXuqqvP7aKK11t6HpkodUD1zxpuutQx/vcRqvqpp1UsDCUdZl4RVBTzndF?=
 =?us-ascii?Q?5PDQ4VzjVRx77KkGB6CYWgETrpzdJW7DDnLwk3f8/YQlAHhfktnq/PCckyxD?=
 =?us-ascii?Q?DlKstxLvpPHNs0/4zpxIzCterrCSlwu54gI0oEQnKcONnuzeGaefhBgorpYI?=
 =?us-ascii?Q?/SRwBlLRYXVBuYmNyofXpFEqVqTLBBdIdvlBG2wxmx380tFsd9FAIwgMHz7K?=
 =?us-ascii?Q?lbParrUIDHXegGmBBofBxg+ACJID1RXj+DBrCLfz/DFe+O2ppk+zBB2Wg2oA?=
 =?us-ascii?Q?wiBGoM9ueb3ArEGi1AxTEDQ67E0ra9jR9zFeHO/QveB21JCqxs+U2XoT2NcS?=
 =?us-ascii?Q?DlUoN/sxCZ4umURAXSeIs2fHXqna2DqFupU3y/NKu0tpJqSRoDz/lgt/NaxK?=
 =?us-ascii?Q?UbngtqfooGyZlM7kG/sd/WhDjNMXamCXcAVyoJdQ2Kbgj4RyyMS40ZGlRW6I?=
 =?us-ascii?Q?nxusc/0gIlQiArOWFsgkmK7z28xUG0eikUHJM4bfsrmI2ZQfDV0erOTbSkrK?=
 =?us-ascii?Q?YEXxWQWS9xH6O+e3q94eEo2okGvgQhLxYMNoQStM5ANBNVK6moaoBPt0ga+E?=
 =?us-ascii?Q?VJCNEOsKoUIYWBb/u8vcKcO6A6H9viaVwTiEoaRDUUMGPYzzb4ccxJWkq+XK?=
 =?us-ascii?Q?SCCIZRnN1b5nFHJU/E37uCc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9744da-4596-4ff8-6685-08d9f2234fc2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 14:39:32.8053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIs6QBlRwAdh8mTEPyla3SAem7GI5dl6fd2sO5URik739pzCVu2MUp8SEZ3rGeXS+97w19QvvJl/jplUAWkrxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2346

On 17.02.2022 13:07, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 17, 2022 at 12:54:57PM +0100, Jan Beulich wrote:
>> On 17.02.2022 09:28, Roger Pau Monne wrote:
>>> Process softirqs while printing end of boot warnings. Each warning can
>>> be several lines long, and on slow consoles printing multiple ones
>>> without processing softirqs can result in the watchdog triggering:
>>>
>>> (XEN) [   22.277806] **************************************************=
*
>>> (XEN) [   22.417802] WARNING: CONSOLE OUTPUT IS SYNCHRONOUS
>>> (XEN) [   22.556029] This option is intended to aid debugging of Xen by=
 ensuring
>>> (XEN) [   22.696802] that all output is synchronously delivered on the =
serial line.
>>> (XEN) [   22.838024] However it can introduce SIGNIFICANT latencies and=
 affect
>>> (XEN) [   22.978710] timekeeping. It is NOT recommended for production =
use!
>>> (XEN) [   23.119066] **************************************************=
*
>>> (XEN) [   23.258865] Booted on L1TF-vulnerable hardware with SMT/Hypert=
hreading
>>> (XEN) [   23.399560] enabled.  Please assess your configuration and cho=
ose an
>>> (XEN) [   23.539925] explicit 'smt=3D<bool>' setting.  See XSA-273.
>>> (XEN) [   23.678860] **************************************************=
*
>>> (XEN) [   23.818492] Booted on MLPDS/MFBDS-vulnerable hardware with SMT=
/Hyperthreading
>>> (XEN) [   23.959811] enabled.  Mitigations will not be fully effective.=
  Please
>>> (XEN) [   24.100396] choose an explicit smt=3D<bool> setting.  See XSA-=
297.
>>> (XEN) [   24.240254] *************************************************(=
XEN) [   24.247302] Watchdog timer detects that CPU0 is stuck!
>>> (XEN) [   24.386785] ----[ Xen-4.17-unstable  x86_64  debug=3Dy  Tainte=
d:   C    ]----
>>> (XEN) [   24.527874] CPU:    0
>>> (XEN) [   24.662422] RIP:    e008:[<ffff82d04025b84a>] drivers/char/ns1=
6550.c#ns16550_tx_ready+0x3a/0x90
>>>
>>> Fixes: ee3fd57acd ('xen: add warning infrastructure')
>>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>>> ---
>>>  xen/common/warning.c | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/xen/common/warning.c b/xen/common/warning.c
>>> index 0269c6715c..e6e1404baf 100644
>>> --- a/xen/common/warning.c
>>> +++ b/xen/common/warning.c
>>> @@ -30,6 +30,7 @@ void __init warning_print(void)
>>>      {
>>>          printk("%s", warnings[i]);
>>>          printk("***************************************************\n"=
);
>>> +        process_pending_softirqs();
>>>      }
>>
>> To be honest, I'm not convinced. This gets us pretty close to needing
>> to process softirqs after _every_ line of output. If a console is this
>> slow, the problem imo needs dealing with there (and according to irc
>> we appear on a helpful track there already), not by sprinkling more
>> process_pending_softirqs() all over the code.
>=20
> There could be up to 20 warning messages of unknown length, so I do
> think we need some processing of softirqs in the loop.

Hmm, yes, you have a point there.

> If you prefer I could do softirq processing only every 4? messages,
> but I'm not sure it's worth it. Also there's no indication of the
> length of messages, so IMO it's safer to just process softirqs after
> each.

No, that's indeed not worth it.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan


