Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A124D98F5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 11:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290721.493141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4aX-000561-9H; Tue, 15 Mar 2022 10:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290721.493141; Tue, 15 Mar 2022 10:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU4aX-00052h-65; Tue, 15 Mar 2022 10:39:37 +0000
Received: by outflank-mailman (input) for mailman id 290721;
 Tue, 15 Mar 2022 10:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GQWC=T2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nU4aW-00052b-0b
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 10:39:36 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34902818-a44c-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 11:39:35 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2055.outbound.protection.outlook.com [104.47.14.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-YKeAfTEHMO-quzbs9WoQIg-2; Tue, 15 Mar 2022 11:39:33 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2304.eurprd04.prod.outlook.com (2603:10a6:800:29::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.29; Tue, 15 Mar
 2022 10:39:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::e8ce:db1c:5bb0:af0%6]) with mapi id 15.20.5061.028; Tue, 15 Mar 2022
 10:39:31 +0000
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
X-Inumbo-ID: 34902818-a44c-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1647340774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s/1wiHtSL0i0MY21LkUrdrI/DRQ0WkbNBRiueP9tmJ0=;
	b=KOF/lJKM3h0LVy92wHTwfuvR2YHu8e6webC2s22wvmpZWnUXDAkVN4w2SDO9iAWioW83YJ
	MYs+A0JC/PbVa9c1uzATmYi6rOWz6NbtRa0rRD7YAcvouT/B93H3QWjXUF9uUMM68nH3Hy
	kt/zXH9VPDPyg1uEiFv8RBJjlQA2MMw=
X-MC-Unique: YKeAfTEHMO-quzbs9WoQIg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ct8ghhXl71XkpH6qQlUQumSOlALqOMrXy9HGUp9E/nZ8wL3Aoj34pKxmKaS1uOmomub92kQUfuCxSycSvAR7OxkqLkMU+kdSFrtro9auAUn+dbCcl18bYd8zD3JbXlTiIXMZz2vmuQ4kvK9duLksal/dlsT0AupUuYqDOvg1hZVhgFij6oeLCeRPIKGTMGLvozbdO11j0J/3roFX9GWew+9W7m/GZRU6VT+Eq+tqCPLrL20LQIx+fSwDtJKVnSKh5Os5+KeQDuSpkbKk+2Qph5GVpGpQ4o0vlWuLGkGQm3vjjUpzHMdduljtmru8BGpntRw/4q9aqjY9WkbL3Ptjsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOlg7nswpJcal2tuosNigguHrBNlq57YL/eqSdJKXXQ=;
 b=QFHkYMS4J/bMgNHRJpONv7PCye4sCSNp+epL5NBne66w+69UfGvKv98OtpsRzmAv6TKSTbbJkgk3mvNU4cbJID2kyZgKPOicmqmudQH52wzGtxh1shYB59X6ITBi11cDxCtd5RuZn1qxbNUhth/MqlalfcGvTjfW3dyuv5m7/oCcxRaNAgPNhxDAGmAAxNg8448/HjHshn8ReQP5Fm3ILKxfP9BQHFVjMr/pzI18InGoDJ8SBSYcBwJVoHJ/MBHULPZmwg6O+J88H35eWcXYjxTSsZYpU3DW0yqWIOqJNJUYGfvNX2wcQVpcyWgcW7LjjBzjqcRyBYoqJ2vNJKt9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd5c9fe4-6065-9c22-1a39-c9a5a77ea01d@suse.com>
Date: Tue, 15 Mar 2022 11:39:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/4] x86/APIC: calibrate against platform timer when
 possible
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <35cb3c72-05ba-24c7-1fdd-3ee1aced3aec@suse.com>
 <cb7dd6bc-79a4-2137-5e82-805b9daf5d58@suse.com>
 <YitSc/Ky6PJb5ndV@Air-de-Roger>
 <d6bcee5b-abbd-5cef-f174-8609df94603e@suse.com>
 <YjBYk+xJMh1I6nrM@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YjBYk+xJMh1I6nrM@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P195CA0043.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d488b16d-ddc5-4665-55df-08da067016ac
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2304:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB230448348FDE333AE25DDA64B3109@VI1PR0401MB2304.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zK6s8mcWu/HCwloTD7HXN59mMqLd3KZ5mPDQ7GC8BKcigVvX2hfj159o/y4iHAeYUxPil8rJKG0WEcpiiZB0EXUcjQUL9pDQswNy6gYoC5S6SvfNRaerAstuuAtST/8rKyxFTgdnigOQPmoNBSKHkB6OdgzdXGZP2bS7Pvyg6L7Alw1jH0/ivx7S7jDGc0WXqqfLZkOVwVtVN6QXEF+ljnn1x9b6Wl1mz8JZUCrtSz8FkUnI9VQHyTVctaxgHO7S2P0uAht9UxExsuBwXV5aYflLJf/M797+TmxWbWOTiWhhcLe73k6WB3Gr1eqK+YbLGE3VYj6YrqT4raGN8C1inwO1oeAgx04D888uYnLTrerONCyn7gzEpQ8s2hrc6mzizY6KBlYKwgH3VFCDAt3fRKjxpsiWDvp1OKMspeblhernHjQIv3tWx+i4XcezawpIUoIa+b+3N2K5OswJm9KV/v/HFdy2DaW5jL/tBae3iJS+KL11sCRCG/kVl/G6Vlc5p6jSWFHKdC+fsLUaIiV4SzkuNRmtB95963pxd17ku4Ehr21dhrH2SY4c8h9FjmMqpbM6xE0j5cOV6uH4yUWzY3Oj2Pk2dhCPxm9JIauW3+wOEHuZjcV7XZ13u6ZWsnnECBvIy3j6xTY72+ECHA35scycwfu83cxkte9elZSQ5rhGrDKIUpi4drG5XWnWS+ASiCN0Ig6dBtSNUL2IBJQNWwJxt37XLjgzIZO+tlHzypM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(508600001)(26005)(36756003)(6506007)(186003)(5660300002)(54906003)(2906002)(8676002)(6916009)(66476007)(31696002)(53546011)(66946007)(86362001)(66556008)(31686004)(8936002)(4326008)(38100700002)(6486002)(316002)(83380400001)(2616005)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kA2H0JyQ1dltETavLkj3OWHZowsC7nOeGv0ikdMXzna7zxKUaJvzMmjFJcvq?=
 =?us-ascii?Q?FvioQXvNp0QYA+uISHAOFwMC7VAbX/q3mYMwVfxlHGVkzpBg39FXAvZZJQBw?=
 =?us-ascii?Q?aH6G7zCt8x896lk6ZrhLG4lHiTaVblAEAoUwFHe4xZflwOmPpxayI9xXqFeE?=
 =?us-ascii?Q?UdwcBXpvPfx9hqq4+QKR4a3WlMB4i5j0aLkbiWOoiKsF9XnLyryefk+3jZU9?=
 =?us-ascii?Q?fqlE2Og+weoOWpHRDrAKU7OSBkT0jk/p6K+GKjCifucA6Sxpui65+v/XtWPX?=
 =?us-ascii?Q?JanttBFczxQmwyvN0nFldyCmMuFDVIrdTgzOubrbiVyDgWvvKy0oGRI5dRAY?=
 =?us-ascii?Q?7VimJ5XZkyssO6E6vyCct/1oWBsb88bJt72CkF2EE4KT9c7TkTjZSpmxXur3?=
 =?us-ascii?Q?6P5yuXP0eKEzdXgj0Boz7CzsgSLDqehgYaPniVZX/IKdaOunLysqfvaK5RTH?=
 =?us-ascii?Q?zcYkMMbODIJKDn87lcJPNQE6LNVMAOEvvAZWy+0hZjFIpHS9ooV1feU7Ag+V?=
 =?us-ascii?Q?NrRLFydhsICfH3mJbELPSDsZSwuMnvE24xoiGFYKIg4P+SSt588vicWnqKEk?=
 =?us-ascii?Q?p/iHvOcnlBBrcRURNagcrSo0sKVRuQPSTGm3gLL6A2Bcvvoo156S5+sdR5gf?=
 =?us-ascii?Q?KrFU9tTx00tAqm8Oh5c5rIBiXQMAPDR54nfLV3nH+bcWhh634htDMSsoo8p2?=
 =?us-ascii?Q?juVItBiMY6RlUaG+fOhZ0ttLGYVaowShNk78ZNexOFitJPKm3MIiQtiBEeHq?=
 =?us-ascii?Q?qYF/SQqac0EVQePSpd1Xbwsf6RO60YPrV2h38o0/0RBtAxIq8rztInExTUOB?=
 =?us-ascii?Q?kwEI84vZyq5toi3m/0BSLA3A017/FaCF0G2CuN8CP/RLaNmIFpNcJa4+xKhZ?=
 =?us-ascii?Q?wm0APAWVTHIlJgc9sxxaVBBbB0058NsdnClaqA3Auq3QQMazzpTXupgQ9KLO?=
 =?us-ascii?Q?l65OQVuiH+pbn19Z3gMESosfZfRgo6VKbuPygyJeR0A02hbOcvwOZkQjI7Gz?=
 =?us-ascii?Q?u5wPvR4JmYm1QNKCP5DvdWtYIAiHxBgajgrxNbw6HCL+wWHNa2vd9SJq6BNU?=
 =?us-ascii?Q?tx/vfHyysBnDl5tK8vIgykeTogYPl3K+pl5jYtR8ge5E4GhKBtysa0RQlhvx?=
 =?us-ascii?Q?PU81E9eOyJrf2K88JhYHfyLkb7UaPIP+o2lL9rYf/+2vRrZkfn8ksarLJ8J4?=
 =?us-ascii?Q?NzQaMYLm031uHXRnpNhDv/yezBGKFKY6dRz+99zASYYBxdNNQHP7SMqy4+TL?=
 =?us-ascii?Q?+j6mtZxnR2UodPqmysldFPvKwmkVu6P0Rv+qTDu/HDf/hmX4s3IUYNK7bDoo?=
 =?us-ascii?Q?GRFQtfAQR7B79t5OTw97gSVsnPse0yA/mpz1gGgqRlewqbv2z+O5MaztTxZT?=
 =?us-ascii?Q?zOGZQHqS7mVvBTCUTt5/zZzz2Yw+59Gl3weMGTG7ReN1vvYVPeLCYzYHx8bu?=
 =?us-ascii?Q?v2z8rzIk9oIe2I8UvjxnVHDyERnQsQYZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d488b16d-ddc5-4665-55df-08da067016ac
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2022 10:39:31.5811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7l3E4qJC+yEsmfSjLpOwgF9sIY3zfoekbZXWGCBm58V25XdIoMWgWii0Ygwe9qZ7sodldZqFrYIyfYMuzGWmwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2304

On 15.03.2022 10:12, Roger Pau Monn=C3=A9 wrote:
> On Mon, Mar 14, 2022 at 05:19:37PM +0100, Jan Beulich wrote:
>> One thing seems quite clear though: Doing any of this with interrupts
>> enabled increases the chances for the read pairs to not properly
>> correlate, due to an interrupt happening in the middle. This alone is
>> a reason for me to want to keep IRQs off here.
>=20
> Right, TSC calibration is also done with interrupts disabled, so it
> does seem correct to do the same here for APIC.
>=20
> Maybe it would be cleaner to hide the specific PIT logic in
> calibrate_apic_timer() so that we could remove get_8254_timer_count()
> and wait_8254_wraparound() from apic.c and apic.c doesn't have any PIT
> specific code anymore?

Yes, that's certainly a further cleanup step to take (saying this
without actually having tried, so there may be obstacles).

Jan

> I think using channel 2 like it's used for the TSC calibration won't
> be possible at this point, since it will skew read_pit_count() users?
> In any case if we disable interrupts those will already be skewed
> because the timer won't be rearmed until interrupts are enabled.
>=20
> Thanks, Roger.
>=20


