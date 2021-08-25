Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1603F77F1
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 17:02:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172446.314693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIuPx-00032W-ME; Wed, 25 Aug 2021 15:02:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172446.314693; Wed, 25 Aug 2021 15:02:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIuPx-00030A-IT; Wed, 25 Aug 2021 15:02:17 +0000
Received: by outflank-mailman (input) for mailman id 172446;
 Wed, 25 Aug 2021 15:02:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5IQt=NQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mIuPw-000304-NJ
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 15:02:16 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df625c70-a330-42d3-b7dd-04fa5101ac46;
 Wed, 25 Aug 2021 15:02:15 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-mZFXBry5Pe2ToS19dUsswA-1; Wed, 25 Aug 2021 17:02:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 15:02:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4457.017; Wed, 25 Aug 2021
 15:02:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR06CA0115.eurprd06.prod.outlook.com (2603:10a6:208:ab::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 15:02:10 +0000
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
X-Inumbo-ID: df625c70-a330-42d3-b7dd-04fa5101ac46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629903734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f+WfgAgZLEMTKmk46nhmUnvd441KD9Iv0i2gIh6wpBA=;
	b=LpItDn7jKuCOI57Vgmeyfx05rQyaEMI9oMOUts+uwaJjyT7oPSxauHjdczoT0RlnCnRGJl
	Lyhh5pdDgfuhRx24Gtb7qM9AICv1ZoStCu5xs5zg9Vd5gzax3W2GdadqUZ0ZLp9s1y0d6q
	/7CFI3D72qoRXO8AAWus4CBRlNrVww8=
X-MC-Unique: mZFXBry5Pe2ToS19dUsswA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZ+tLwHYyH6RSydbn6imIMsEHRZjvjYveHT+zLtYxopxGz0a4BCXH6AKfqTWgL51NKe56dFDeSVK2PTFrZqIrHMubuvYgWhVnYuINq8ROEKWEoDJSSJf29yjPZn3ptm7xxh5oGcTiqUkJAUugh3Or2wxdXbwZlfs2pZAJbrFFAklrx5YYhlLRONXikXG3PfSwnnxE7SaMWUj7XkKbKPn7wvzKF/ZsOR/vDb92Xo4zLRjMnQ/sDsnD2yUEG5UURUN104anOHDYhxDlIrEEUs5XE1VhWm5KVkKlWAc1XctUFgZxRLpAGzMdxJlJslSKijo0Hp/nNPnLxiUUmqQ8vdtog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9ubc/t8G4P6EO93vmFcMmj1WhGVTIw3vPuXaI41xwM=;
 b=RJRxo/OWCov+jtkgcIsfwmoG6qBRYtOE7QzmMrwU0e8rEeypd/ObxHnoQWxGPmAErngDL/OW40zU7Zqlu07hroyHSv61P6sGUVz/OGpsRMqgm7Fk10KMfCxSmjZDKFpXML5I3H+xq2oMgKC5PQZ3C80kNCKdvupua7pKP6oF+ldnsl28XWvPuztAV8BjjAZYjUb1CLONLGVp1RdIAG1AYtEcN/7/B2u6y0h33dScq0RSPtAlP6kulnol9hRebbxp5kVzVCGzndvQLZJGgVwuWZZmlFafosXtFdfxWZDU8PqwSR9BB/y4PZczS7WmRHbHApS+ID4MeqTCFm0nJGTwgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
 <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <15fb708e-e03d-bc4a-a0bd-72b81d26c6da@suse.com>
Date: Wed, 25 Aug 2021 17:02:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR06CA0115.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c6b3ee0-1b8c-4ec7-3f8e-08d967d950e0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB2702E763712C6E9C1D609DB9B3C69@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ftos9lgkYhjWj5fUI74BvfSOapzlZdjZJYfso2JuIQm+22rZrA5U3JIt2LV0rPEotmLlOFRbv7Ej3HiK1PO6T5HCs7Ij/TRqShO8Uq9qTkB1XXZd6Nn1V3tIMFxj74btE1Uzhi9HYoKu57eZZtbIDv8W7ipTvJfYvJwjbHHGX21bUOfvKml2czGhZ1HSlJu07RWgDH/P/9z+U0gFvpTmLWzIksrll9aXyYuWOjyNv83mI2d1O3vozBmXrawiryiGyu+dY87s9T5KucDXTF2HsCGs2GRZt+XkLsPaoJ0CqVsWCG0dxQTWMfynfBp/gQu4OLjC88MXfJDVQlIRs2pARmA/SrNMTrj/jVLjGXSMSJwcaIFhtMTkPYxznVJeXproHAHcLih3o5xZdLSnqhIuFG5cDbVFz0WDj9v6NemYS5ByV8FfQ6j8GJH82ki+hQZ3rrfZqQ1G/RbE8jUaBV/aiWMZhtCdLhpk4M3Pz7neUdNqpmqPw1XsjezSy/9xdGku+V/wy/eyn3YPvD4wACdOtiheUzFiAp3QGQWFXdV0cN9CiTo9/BdKQjOW9mqraTJlsr31fLWtXr5RfUxjcY2w2zGSVYZ47peIXX2KAcgMOQtboKcY3b4D0ZFVA+8VATc1VcdVD3zxVk8MyZSk3DJJ4hnDD61i3LJpYgsT99+PL1x7b6+MU2dM85fearv/x5U+V3peS1cv+r1tAAwhltNyaACViLofVw9QfUJ8rZKHZ5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(396003)(136003)(366004)(376002)(83380400001)(36756003)(2616005)(4326008)(66574015)(2906002)(956004)(186003)(66946007)(316002)(478600001)(86362001)(31696002)(16576012)(66556008)(26005)(6916009)(8936002)(31686004)(53546011)(66476007)(38100700002)(6486002)(8676002)(54906003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HuZiVJdpsPB24f6dcup3lUyc0cN+Dpa37aLPRrzFr7ba/k3ImAqFlrSA+nGE?=
 =?us-ascii?Q?H0nHEA0lzTE06AoXiXwt48snyznkK7MHVyU9PzO7rf5qfQurW50cU8SWBKkU?=
 =?us-ascii?Q?56UsP9GFRLkZ5tAXkVTUZyzstkjUDpfMNnLuPYjpj762thIO76dNuHn+UlQj?=
 =?us-ascii?Q?z4MYAYTHMp9I/DnPKreRkbUmKunKuPOfHUvfg3DA5H2eGRSZkZ+lrDZ9vnta?=
 =?us-ascii?Q?d6uZw95fsDaym3vvGa+BXOkEf+OI3cZq5xQ3tevh7GkNfB072Xcy8Gsc1pqB?=
 =?us-ascii?Q?baI7tWxYNrg17uppG0AT1YcCCdb4eEAAUorgV7YgJYYoIuWju4ydx73jEofX?=
 =?us-ascii?Q?W+bqAPGEoSajmnx6Qe/Tj/HkdD6ktHCfFgevrZR+rC0Sdwa/jgir8PeGRcq0?=
 =?us-ascii?Q?OChtqpTq4oxCjgF8uRC+bukMkwDtcXbz56EKDOKyOCQpY/WDMiK91HAd/2l6?=
 =?us-ascii?Q?4+/2giAn3JVRp/MEHCu57cWIuXzdyiBLaKeHRM1QQGmAYiAJJD0R/WbA39kV?=
 =?us-ascii?Q?cR6NTQk6vsaOQbNQzXwZV/9LPnXv7OXYq/4JNvVNlpCW4zNrmG3FAbb2GV/u?=
 =?us-ascii?Q?LQdVR5VofRygd+/Ep30PL0CCl3y1Z3NhEYRjCFvkGJZ10YkF2zGn435hC86m?=
 =?us-ascii?Q?qdGe0SYT0KMF17S0Y4ykjvksnVKY8HoVDlmuQRzWzi7FtxkOwRB0iIN9NNn8?=
 =?us-ascii?Q?MwcYvmkFrIzPKx783vrtAJUtE8oFtrTp7cZaMztVKWbqMWzf6epT3KGzxhV6?=
 =?us-ascii?Q?Meb7aY7x9OmCM1kMEaOwAKRHE6vNCsnA1EsspCxrYDnlh9KaYT18dZINFEh7?=
 =?us-ascii?Q?YiZnxxYWCm09zdw2cWKp4cstDjNxQCC2NH2ur0e8gMhgecJ5jvSmCedd9wOT?=
 =?us-ascii?Q?OxwhkK2rgJOgH+wtabFjfjYNiEE+zs3QFMX/FZQvpvkDR4F93dxsEhTDbUCa?=
 =?us-ascii?Q?gfWaaEKvMzqEFRwMxlkcrqpkM4YaVDSk3Ytgxss2wHv8zK1jhzDTgQiMHBZq?=
 =?us-ascii?Q?Y8o/7m23j6h83n3+fMgl3TAD4qCWz8WDoDhHprmrEM3w603Tgwh4QCAEUVwg?=
 =?us-ascii?Q?X/5KBGyqKslaz9pBjcmbHZu8uLHNr8LO9QlAAeTv6gSlqt4qP9tM9T00+34r?=
 =?us-ascii?Q?YbQmc4/f6qAiyUx43A4EscSXKp007anSDqPDsGN9Cnfe+s1H/sDkghIztTMd?=
 =?us-ascii?Q?5XekU1V2uqN6SrwhQr4ACQr6s7yrdv7zDgM41YqLwrsx1rIaZsHD6+K/FohU?=
 =?us-ascii?Q?q9uiFFxM3/tUQKQ/rYjA7JXmj8/sLuhZkD6ANIJyZmVqWommFlv5j25/eIur?=
 =?us-ascii?Q?xWGplBjJPzjcBEhVCmFumI6k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6b3ee0-1b8c-4ec7-3f8e-08d967d950e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 15:02:11.3043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qkNa35y/Of/GUlp4pViCMB0JdBoCfd5x1w4IDz1XuHaLLwGSOx36CuTtmZ5Y/YjdTTwYVhNk7jzIWlnIw4s6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 24.08.2021 23:11, Andrew Cooper wrote:
> On 18/08/2021 13:44, Andrew Cooper wrote:
>> On 18/08/2021 12:30, Marek Marczykowski-G=C3=B3recki wrote:
>>> set_xcr0() and set_msr_xss() use cached value to avoid setting the
>>> register to the same value over and over. But suspend/resume implicitly
>>> reset the registers and since percpu areas are not deallocated on
>>> suspend anymore, the cache gets stale.
>>> Reset the cache on resume, to ensure the next write will really hit the
>>> hardware. Choose value 0, as it will never be a legitimate write to
>>> those registers - and so, will force write (and cache update).
>>>
>>> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
>>> - set_xcr0() is called few lines below in xstate_init(), so it will
>>>   update the cache with appropriate value
>>> - get_msr_xss() is not used anywhere - and thus not before any
>>>   set_msr_xss() that will fill the cache
>>>
>>> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
>>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>> I'd prefer to do this differently.=C2=A0 As I said in the thread, there =
are
>> other registers such as MSR_TSC_AUX which fall into the same category,
>> and I'd like to make something which works systematically.
>=20
> Ok - after some searching, I think we have problems with:
>=20
> cpu/common.c:47:DEFINE_PER_CPU(struct cpuidmasks, cpuidmasks);

Don't we have a problem here even during initial boot? I can't see
the per-CPU variable to get filled by what the registers hold. If
the register started out non-zero (the default on AMD iirc, as it's
not really masks there) but the first value to be written was zero,
we'd skip the write.

> cpu/common.c:120:static DEFINE_PER_CPU(uint64_t, msr_misc_features);

Almost the same here - we only initialize the variable on the BSP
afaics.

> msr.c:35:DEFINE_PER_CPU(uint32_t, tsc_aux);

And again no boot time setup at all for this one as it looks. Not=20
sure how likely it is for firmware or bootloaders to use this MSR
(and then leave it non-zero).

Jan


