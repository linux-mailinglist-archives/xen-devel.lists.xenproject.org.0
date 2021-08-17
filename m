Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79793EEDED
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 15:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167874.306492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzck-0007Pl-Iz; Tue, 17 Aug 2021 13:59:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167874.306492; Tue, 17 Aug 2021 13:59:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzck-0007NY-EF; Tue, 17 Aug 2021 13:59:26 +0000
Received: by outflank-mailman (input) for mailman id 167874;
 Tue, 17 Aug 2021 13:59:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tbpc=NI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mFzcj-0007Kg-4M
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 13:59:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53840a78-ff63-11eb-a4c1-12813bfff9fa;
 Tue, 17 Aug 2021 13:59:24 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2057.outbound.protection.outlook.com [104.47.5.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-xY2A75C-NAKyvxAnq4s9hw-1; Tue, 17 Aug 2021 15:59:21 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4383.eurprd04.prod.outlook.com (2603:10a6:803:6b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Tue, 17 Aug
 2021 13:59:20 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 13:59:20 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P189CA0032.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:53::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Tue, 17 Aug 2021 13:59:19 +0000
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
X-Inumbo-ID: 53840a78-ff63-11eb-a4c1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629208763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4gpQJBuJl2NKZHpolVe81uZljZdgJ878t6inM1I1fw=;
	b=Bf5tidrKEmbJ76Fq9qvBvGZcaXl1XJhmRknA8bk+llBYJnoY66Cw6LYiVkyGLpajMNKEiV
	3Y3A0UniP7DEDvAb3TRLuHUfEQDVFHaZ8P1zDSQv3v64FDrE7cXoLYpHMb2omisVrckilq
	T1C7SrCaPvSN534ioQ2xYOnUN2M/o04=
X-MC-Unique: xY2A75C-NAKyvxAnq4s9hw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoJ+4rHsJFLocWUENOZJCcIs2P0sXg1mkt/6Pp8qKjtEnxSkgDrqmekVUeBH1zcVIiVX5Tw8V6M+YNgltyqKXG3U4jbEtBtnYAwHIwzDOi76KZ3cqiTrIRvgExSz6y5TgAtrIFJhI6czv9Y+U5kSiojQyEILM9mrbo2OiVfJrLuCV/cP5nVKDmTPdUitdIeUmAZvhAmO/1d4BiI0L56W/xVdcA32X/JwkbKprDw4baHmoOi6NMZOwG+ysjQyut+w65Vub4XnSBrFn6W26pC7jIld9mDy/aXxHJweLFSMyHgeFBZtCcHlGx/PngFXOLMOfyqmW4wPAPTx9tzup34k4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0JyphNTTv/wgVjq2nBMZmFDueXKP14PKfVU1yUXoOo=;
 b=Rrcy20qCtGQ7lUnIsL+TXwPWiVHDiuDtwk/WJfrM/LMYpdCyMfEbBnVDsogsfQy3Hi3TK5I03bfuArCumvQjDZQsk0SYiTA6R3b7Yia+VWvZ+o9Z5NRvalyFvSvTNlwPlPNMCPlr6xxUQ+/u9xIs4aPmmuiWIm40RBzAk7I7MCnButyRY/dFMd97S78PoLlgTGeBIkEpzpEh3RKpFm248Q1OZBNbe9vefzq4IoIC4/voYB8uHgiqDc0TlQYC7aNs8LJBXusQ4LGXsMo9rN7V/HMSWIZI2MyFSxNT5el52unD+ZcfIuwaHi/DrBFTYvrcjfTayUze2NUF/VcI97MKlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: invisiblethingslab.com; dkim=none (message not signed)
 header.d=none;invisiblethingslab.com; dmarc=none action=none
 header.from=suse.com;
Subject: Re: S3 resume issue in xstate_init
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <YRsQArpQcpLB/Q5h@mail-itl> <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com> <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
 <78eb61ad-45ba-51f0-a5ba-624408d60cc8@citrix.com>
 <a704d6c5-c818-e47b-32b6-f57b2d9670f5@citrix.com>
 <96fe5a22-d1d2-1e74-313a-c5377e9899d1@suse.com>
 <b631b56d-6048-c900-a47c-f87df9dc1a5a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef72f474-c605-9878-dfc8-7c473076d014@suse.com>
Date: Tue, 17 Aug 2021 15:59:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <b631b56d-6048-c900-a47c-f87df9dc1a5a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:53::7) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 180f7c30-106d-4afe-94a8-08d9618735b1
X-MS-TrafficTypeDiagnostic: VI1PR04MB4383:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4383072EA08BD34272BF4089B3FE9@VI1PR04MB4383.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ew6hIYGNWbfAorH9qwTJPtDUPAJIurfXWu8mslka2qSrLXSGCjEd/BQXgqvH7SFIOsOyHqqQgbvXlOR42ZrKmHWdg9JqoNxkjkbC9U3CbDg3n+o9/iibHMgXeamn53UkufjbUIwiEvW8jJITWpC5aVUz5J3qS89U0gxD5kNjBPRsa1S2Bbu4ZPO181Z5bWCP3cqkikvrB+BeyAhiLVB0ckEki4mBa1r6biwVS88Cej3PyUTsiLbFmtd1ahEy7Xo9jxAq88E8yG8RrQDhyrVb/lm/C1RzKC2p5tNYpzHTRzPrVu+xWMdfwDef7GphnEh1uC6FFBn5KQ4TwUUsG0hdLq9qj6C7bgKrCSOGyGU0+pUd5oqfzUAkZ/ugA4oPyllZDGt6zGbRO4MYtEel6EwWTO2CDOPbP9lvB5sY2/9ji7wBsOu1EEK4u2kit4Eb+A+nVBEEERi9ZkGUWqNL7Ulf9pD4f1YdERFeq3yPIobrIhiZoeR/Q4q4c6Ez09NEFk83U4qOPCk46Y5CEf6/qeCTLJDCyHbiGbG6W2v9Qy/RCSKMiuLj011hkV1heSVKB/6mYhKEb+HTQs81vgw40HgBAowVbsnLoT76tTFy6SuSzpJv8L6bF5G2UUwGt+laTLHik4pq8g7Ri8jKNESGtwIo4mJi9zAk8p3/EqNLWu8IZFLDgRNRUikP4XbzYlIqxWl9maDlC8HZCfJTwWG7AHcIxvWHLlf0QW4rt9VdGYVJjeA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(39860400002)(396003)(136003)(6916009)(31696002)(2906002)(8936002)(38100700002)(186003)(31686004)(5660300002)(4326008)(86362001)(478600001)(36756003)(83380400001)(6486002)(66946007)(316002)(956004)(16576012)(66556008)(66476007)(54906003)(26005)(2616005)(8676002)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8NbtZ3tBhAGhSlQzmwhDBXxzOl2voi3jV0eEkRFEJzPH6T5/C3OiW+YvSLVO?=
 =?us-ascii?Q?ay8If48U1iCvC0XjXlzSPheH6s1ukMnbZvf8xVhPQPHx2P/sRMlckm4zBUtI?=
 =?us-ascii?Q?gamylDpu8OEexfnoL+DjdszXuEndwITdBxXEC0p8FxHqB9zvUcnzIFMtyPcv?=
 =?us-ascii?Q?wyTgA20+phmJNhSqD44XafOgv8GcWWXf4why6R+7ziek0pg7t1mM9C+Lw9/b?=
 =?us-ascii?Q?6FruIe1PyWex0BSZWtLDp9ZApvPyUrLU5xDmrYwZKkoXCx0KtuC9uOLRkSSg?=
 =?us-ascii?Q?toGZ8fk969QTKZk09RIAUnMN7bUJSCG5meWtoN4HW2Gvd/l9eb/RYsXUPJgA?=
 =?us-ascii?Q?uSCe2GpREAv745SWy/xzAivFHV0IxM3BUVMymYNAjejB4nU9UTt1uKRfmsSx?=
 =?us-ascii?Q?6fIiaBUe90a49ArxxM+8LX2R00TQfnE+oqM2nF+PAS7d0CceOlxg3LEiESCH?=
 =?us-ascii?Q?TlxKoC6kYn0j6odIfPIkHr97aHjthS3pnxKxrn8HTtwbS8rzN1s4KqP4EJE2?=
 =?us-ascii?Q?gCsdrTgLnTG3ekddhZxr8cVlbrpj0lw4QSq/V6x1r6QYZXDXho9L2WoWkGZZ?=
 =?us-ascii?Q?hsnNaXZC/DkMQCbUSW7rHTazuKoqQedcm9kuVoNFJhQP3EPfzFFinoMxvsa/?=
 =?us-ascii?Q?+y+iOTzTSeP0zv1+eilB2hr6urMVmCNf7y7sFr9LS6y0FqEX7OEVbMlDxHt/?=
 =?us-ascii?Q?/4bEX83Cojsci9zHcMGhs1MT4tcPaJCUTU28Pqg3Fmlb3Xnwa/Oo0TQqpv3h?=
 =?us-ascii?Q?hQQ97y1y3nIQQmC1IqHjxyAv/QzDxKcLN1i5MAaWMknhXpOzp5RFMBITB93r?=
 =?us-ascii?Q?vdM14h8UrvbzEgNV75+kNszlgDr81Df0tCQO6m8Q1nDfbwZ5HbCI8skCZ3ct?=
 =?us-ascii?Q?jmuCak7FM1hewIcv/LHEzvM+e/Ng4ATnK8N1MiR81i/W0b+SJsA2VTk13PF7?=
 =?us-ascii?Q?LQkDuX/r0SCmSnFJF64PVXbr/YRFnwKcWI/6RU0+o3QOocY6vt4yboFs66p5?=
 =?us-ascii?Q?XzGBv7HQWJHyvmPqB0VDcMfwitC+PzXBrrue1SKW2UMyvPKBX+Di/nkr88sF?=
 =?us-ascii?Q?y4DNJ5xUBATiwr2v069tViD5C5xE0eYXUdujwZhgoMCc3tig6YJsDpKx3cOp?=
 =?us-ascii?Q?qyAm8QttVhOh4Cj5sw0hx/XBpgxWmVoqzeYyKMIDPs9Agp6ZGHMO9yq5ksiV?=
 =?us-ascii?Q?OQErjrxkXuE9O7nAKXzHehWwVGo9fbd/5fbZHciaYZLOoA8cutdo/0WwmjiS?=
 =?us-ascii?Q?vnbGjqCSZwGVjRLoViIMqmT4n8YMsejw0WF5X5l8yhyNky8/YDZstSCnUx2d?=
 =?us-ascii?Q?EDCv6nUz3PLqKJ6hTBKslsBL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180f7c30-106d-4afe-94a8-08d9618735b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2021 13:59:19.9934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JWOW4G3vXmJVgBzdRKXGCV5DgVw3oT2RHjhg5Yu4XLJfjYpyPAuKKJoDm0xuDjKVp/wBn/ISRNLFVQ19eQd8gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4383

On 17.08.2021 15:29, Andrew Cooper wrote:
> On 17/08/2021 14:21, Jan Beulich wrote:
>> On 17.08.2021 15:06, Andrew Cooper wrote:
>>> On 17/08/2021 13:53, Andrew Cooper wrote:
>>>> On 17/08/2021 13:21, Jan Beulich wrote:
>>>>>  I guess an easy fix would be to write 0 to
>>>>> this_cpu(xcr0) directly early in xstate_init(), maybe in an "else"
>>>>> to the early "if ( bsp )".
>>>>>
>>>>> I'm not sure though this would be a good fix longer term, as there
>>>>> might easily be other similar issues elsewhere. IOW we may need to
>>>>> see whether per-CPU data initialization wouldn't want changing.
>>>> We've got other registers too, like MSR_TSC_AUX, but I don't think we
>>>> want to be doing anything as drastic as changing how the initialisatio=
n
>>>> works.
>>>>
>>>> The S3 path needs to explicitly write every register we do lazy contex=
t
>>>> switching of.
>>> Actually no - that's a dumb suggestion because the APs don't know
>>> better, and we don't want for_each_cpu() loops running from the BSP.
>>>
>>> Perhaps we want the cpu_down() logic to explicitly invalidate their
>>> lazily cached values?
>> I'd rather do this on the cpu_up() path (no point clobbering what may
>> get further clobbered, and then perhaps not to a value of our liking),
>> yet then we can really avoid doing this from a notifier and instead do
>> it early enough in xstate_init() (taking care of XSS at the same time).
>=20
> What we actually want to do is read the hardware register into the
> cached location.

Would you mind explaining why? I did consider doing so, but didn't
see the point when the first thing we do is write the register with
xfeature_mask (which can't be zero, and which hence would always get
written through to the register when the cached value is zero).

>=C2=A0 %xcr0 is possibly the only lazy register we also do
> extra sanity checks on.

I don't think we do?

(All of this is independent of my "x86/xstate: replace xsave_cntxt_size
and drop XCNTXT_MASK" I think, despite its reworking of the logic, and
which I'm still hoping to get reviewed at some point.)

Jan


