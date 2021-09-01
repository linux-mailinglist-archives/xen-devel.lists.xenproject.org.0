Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF2D3FDDBB
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 16:20:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176488.321140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLR5g-0001Hc-GS; Wed, 01 Sep 2021 14:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176488.321140; Wed, 01 Sep 2021 14:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLR5g-0001Fe-CG; Wed, 01 Sep 2021 14:19:48 +0000
Received: by outflank-mailman (input) for mailman id 176488;
 Wed, 01 Sep 2021 14:19:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=18Fz=NX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLR5e-0001FR-Le
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 14:19:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6bf3524-59be-40ec-a7af-5a65a7662838;
 Wed, 01 Sep 2021 14:19:45 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-pO-0Ug3aNSKlsbxObN8-zQ-1; Wed, 01 Sep 2021 16:19:43 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Wed, 1 Sep
 2021 14:19:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 14:19:42 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.23 via Frontend Transport; Wed, 1 Sep 2021 14:19:41 +0000
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
X-Inumbo-ID: a6bf3524-59be-40ec-a7af-5a65a7662838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630505984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tQvyW9DZnTbNz1g08eDHxiiv3P155ZpR0UZdx8FIPGY=;
	b=XcHdqP7S2a4Ka3OzIdYDDFCELdnzpDskxnc+IuFxRO4f+eSejIVDR19t73C6cp8tqWsSa6
	kRGKTrz7/ZbOe2SEFIxgd+jrZ+7bX9TyjEvlwiCHlQQvOGT7gfcYSlEufs0DRyGoPRYKNJ
	KCLos0K7CJh7GLH2FdHwdL9uIQYkfrs=
X-MC-Unique: pO-0Ug3aNSKlsbxObN8-zQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1JwmWHmVkxC17IAWtWsXZ6e/7Yn/j2Mfg1mvPh++ppSeFFMXhdR2nwaoYuWFPDERhs8WCsRdB3vuPiR8AenBRtoTcyDbMbHWpPE+RrD40MSbAEaTQhst89fhJH4Bl1xfrvLjmwDl9hlf9SXNw9J3uCa9la7yWX8JxHA0XB0yrRaz2xZVD5+3tIfrgteji1HjWDLV708RUOmas3KlSyxxAXooHKjSut8kiCns4EtKoDyuSQ/e5Q+ZC+9J4O4iVtVa1sF5gM8pRIqBNz71GvbCYu1i2wK9ZA9iYuQ3gA93vJpba8dihS91H/FxgBgsbAiS/br3pMWFvR4txK3FkKEEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PmraVwts6NZHguDo6kFeRqkMKWV84aKR4N5NB7fnG4Y=;
 b=Y+pNbrhgjZ2lzkIpKUA27VJVoraviRC/tTOVuKwxa6GKd1GIUBAmPy9bxgjSLyis/afO3aXzdMw6A6yGX3TLAvf5Y9ppEWwRbLdtU/Cbxn8zc3lxsSLPe3HmHfTMLsZuiHd11EKfTdvplk/rqdjVLqzTTswrFpQIrydmgrjxp1RFurkQRPwRFLoV5HzBWP3uVHD6TbQX4TlpxsjvPqqhJUME/y1Iofv92g6EXt8zp7Tq03q9b2LP9yLojtspmW9QaAEYxjQJ9Q7wMPpYurEHanO0/lELezJNu4+g+5SQ3XvkCxA9BuL0wKjnvHTlIp2rWeX1pbubVT21+Dp4htvy2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH 0/4] x86/PVH: Dom0 building adjustments
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <aae19abb-e88b-8bf8-6f1d-502ac6645d6b@suse.com>
 <a2b8421d-e608-2abe-b78c-924ab0bf529b@suse.com>
 <YS+GmC7IjxoODTu+@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <17c5ce48-11e6-ac97-fa67-294cbb8b79b7@suse.com>
Date: Wed, 1 Sep 2021 16:19:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YS+GmC7IjxoODTu+@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR1P264CA0008.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18118962-76fd-4960-2a47-08d96d538a41
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB3933AB7E3994D820FD3BE7C4B3CD9@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	99wmS3++441NMUm23N7P34rGaiR7JqlOaYSJDF18MlTHLNJRYdM+HHYhZG4PgZ35g9zGXnfC3DWduPfD62Er14lQEt47IkC94aF3enKm0nnxZKMMp9v3hfOR5KwsYpI+/wXHlmVPHAYZou6Hkf0KMJXPkpOTEqDmktOrOZAt4Ts2s7lTlBxalVhrcegr3/yMLDLPjEgLhfhReugiMkzV5GfqbX3hpd62TEhgIP+Ai9X1ct8knDODHnO1vz6JW+PUAuDJzrBzMZ85DQKaQopnBcvVBGJJektmODFb/q96T+grNhRw68oCEJXrhsJWzVPKQ29RPiYu2rIsULzTeqlJ0k87d/4gaNF83GpoiZMXYsorRKuGy6zCAaJUPqrG3epstNK51XLVweS/2wa7QHUWQgQcviOVDibDgLgSZ+Vqs+SmqPDjNoMk9fI3gvwV2Kv7YaYQwXlAr7ELUnW4fdKvwyDMnJ2T5LaIhPAHDbd1MORTAhZ9Xmfz7u8waugXA7j7IuQex51nbdKHXmnjFbqVg30sNPMg4WqgmuQPP8SJWz6/y13hOh8hIyoW9H3nSGRsULc3r3rfaN1c6WPqo7/6Nw8Susn4iJB9m/Y4BKT4kdWcIHp2AXpFmbFcXjjolEa7xkXJAJsixct4POrYiC2LlGYKznjy80ImQ418V83Ik6ZCb79y3WBAGOGwnVbS2CHiI2X59ZSHWkw2pJgxix7cCAFSGDzMJ+nGAMCoYrgI3Aw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(376002)(366004)(136003)(396003)(8936002)(31686004)(4326008)(36756003)(26005)(186003)(6916009)(83380400001)(956004)(2616005)(66476007)(2906002)(66556008)(8676002)(53546011)(38100700002)(31696002)(316002)(478600001)(6486002)(16576012)(66946007)(86362001)(54906003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XFEJSOHv4THPSg81W2K6anC7cOpTYyckTO+8CMB95Tiuqa1M8wi6APyVfXQd?=
 =?us-ascii?Q?CcvfRCCtl1jAwDstEUVcxm8kKFDhVkyVSnd+53n5vmSfT2XmjcqH+owkc/zh?=
 =?us-ascii?Q?cwO/M6BtWTngj47xS77Rt1X0fDQwSdjWsigsM9Hyoy/MPS9TtjkSe9GB1OPI?=
 =?us-ascii?Q?Hg/XP5YtKT7o0Ax8XrtymCfuiLBu4qOlinpRMqrmNmRUrUqUmWHQaXBShSsm?=
 =?us-ascii?Q?lsiTqjKS3BYDs5pcjMM4HHnBpBc3+vcN/6bzDF3RpkvotU7MqarubPG9ZcVv?=
 =?us-ascii?Q?DmnQH7uTzBM374MBP0asBVPkg6fJqU4tvDDtxNQgrh2X689tHHd1iyLIB5D7?=
 =?us-ascii?Q?gpUoO+T9hFK8BO5QOPIv8sHQlu0A5f0xG7hV9ovK/d/oFMrx0+qpJOdSUMpd?=
 =?us-ascii?Q?/kw2wpHB+ZB8sS7WzVfynngOjSzMWEIcBdnAjiK8tOwzzm70Nv0nHDP0AG6g?=
 =?us-ascii?Q?gO4pgUuywimOjvIlwm9tz49B+tfksw1I9urGoDiTRrRqebt6dYtr3pox2FyE?=
 =?us-ascii?Q?gI5hqRmeLwEWdDDfi/OMP+aTEdSASUmAShbni9t4kog5nDjT1LBS+5cOXt2P?=
 =?us-ascii?Q?/JhoRhGtzrH1Ij3eI0+pXA57R8wYLbLvyFOh2ONNPqVy3hCecVdV/jzROyZx?=
 =?us-ascii?Q?RHqzhoa7+uggMObF56ZjjgU/noYJjlrIZmPRtQ1IlQAPt+H6xjgy4BNbHz5L?=
 =?us-ascii?Q?SkTxT/ppAt4cqnsRhENN3/BEVzqUm95ctp9ickmN9W2zMaeBLw1h9bix2z6d?=
 =?us-ascii?Q?L1GXKPJ/iBMlRa1WNm+rfSaP2wrr9gpYqG/nGxz6MW0deg3ajCjWoymTDPFl?=
 =?us-ascii?Q?3L1BsE8WZ7ZPNl9BJ2AN2pMefihpMGxfqVLX93aKpVJQHyvyYCiI8RvLkSz+?=
 =?us-ascii?Q?NpmM3nNRjBq4E0JdzQXWI2Y83qNCfd3KD+IJqKaXk4YTgUnoZq/29iLLnMvl?=
 =?us-ascii?Q?LNN7X8NrbMyv/FVycHhFloGFzqScCYVPXA6sF8OOg2Jj7SYwGRNpxORG+c3f?=
 =?us-ascii?Q?r7/C6NIk07jNturre0twO/usWrmXR5RQ5x/UWuIdx5pd6pJOKJrxk38ahMvA?=
 =?us-ascii?Q?QnZ4Wf6uNutDfEjGNhsZ8k2khLc4E6psor04ixVwjUNZPmVWhabdSW/fjGQE?=
 =?us-ascii?Q?mba5oYP2uZJZit8pRLasmdfPLvsBJ/YCf++Mm2pgP6Zaa/rbEaPFkyjsQRmx?=
 =?us-ascii?Q?ZDcgqLX0rzZZbGpnZzYvRkuw5dGXg/eDPIU0NbldQSBWh+cwvMs7UFFZSwfG?=
 =?us-ascii?Q?cpSnFNmRfxyDfinpQiOSd6xShtPbhlLYUEym/Dawl4nBDUZ86Hm7OKqtqBUh?=
 =?us-ascii?Q?eKv/Sj5zODiAuB62GNbUuYjq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18118962-76fd-4960-2a47-08d96d538a41
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 14:19:42.0074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MNN04Ce+d1dSEimCtB8IPK+zoD/+YoB14W17VtEmOnDmweG18petr3AoDuFzcpFe3VSkV5fJhHEcnDtXttgdhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 01.09.2021 15:56, Roger Pau Monn=C3=A9 wrote:
> On Tue, Aug 31, 2021 at 10:53:59AM +0200, Jan Beulich wrote:
>> On 30.08.2021 15:01, Jan Beulich wrote:
>>> The code building PVH Dom0 made use of sequences of P2M changes
>>> which are disallowed as of XSA-378. First of all population of the
>>> first Mb of memory needs to be redone. Then, largely as a
>>> workaround, checking introduced by XSA-378 needs to be slightly
>>> relaxed.
>>>
>>> Note that with these adjustments I get Dom0 to start booting on my
>>> development system, but the Dom0 kernel then gets stuck. Since it
>>> was the first time for me to try PVH Dom0 in this context (see
>>> below for why I was hesitant), I cannot tell yet whether this is
>>> due further fallout from the XSA, or some further unrelated
>>> problem.
>=20
> Iff you have some time could you check without the XSA applied? I have
> to admit I haven't been testing staging, so it's possible some
> breakage as slipped in (however osstest seemed fine with it).

Well, I'd rather try to use the time to find the actual issue. From
osstest being fine I'm kind of inferring this might be machine
specific, or this might be due to yet some other of the overly many
patches I'm carrying. So if I can't infer anything from the stack
once I can actually dump that, I may indeed need to bisect my pile,
which would then also include the XSA-378 patches (as I didn't have
time to re-base so far).

>>> Dom0's BSP is in VPF_blocked state while all APs are
>>> still in VPF_down. The 'd' debug key, unhelpfully, doesn't produce
>>> any output, so it's non-trivial to check whether (like PV likes to
>>> do) Dom0 has panic()ed without leaving any (visible) output.
>=20
> Not sure it would help much, but maybe you can post the Xen+Linux
> output?

There's no Linux output yet by that point (and either
"earlyprintk=3Dxen" doesn't work in PVH mode, or it's even too early
for that). All Xen has to say is

(XEN) Dom0 callback via changed to Direct Vector 0xf3
(XEN) vmx.c:3265:d0v0 RDMSR 0x0000064e unimplemented
(XEN) vmx.c:3265:d0v0 RDMSR 0x00000034 unimplemented

> Do you have iommu debug/verbose enabled to catch iommu faults?

I'll try to remember to check that, but since Linux hasn't
brought up APs yet I don't think there's any device activity
just yet.

>> Correction: I did mean '0' here, producing merely
>>
>> (XEN) '0' pressed -> dumping Dom0's registers
>> (XEN) *** Dumping Dom0 vcpu#0 state: ***
>> (XEN) *** Dumping Dom0 vcpu#1 state: ***
>> (XEN) *** Dumping Dom0 vcpu#2 state: ***
>> (XEN) *** Dumping Dom0 vcpu#3 state: ***
>>
>> 'd' output supports the "system is idle" that was also visible from
>> 'q' output.
>=20
> Can you dump the state of the VMCS and see where the IP points to in
> Linux?

Both that and the register dumping I have meanwhile working tell
me that it's the HLT in default_idle(). IOW Dom0 gives the impression
of also being idle, at the first glance. The stack pointer, however,
is farther away from the stack top than I would have expected, so it
may still have entered default_idle() for other reasons.

The VMCS also told me that the last VM entry was to deliver an
interrupt at vector 0xf3 (i.e. the "callback" one).

Jan


