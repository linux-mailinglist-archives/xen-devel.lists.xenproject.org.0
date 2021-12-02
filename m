Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C04466258
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 12:29:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236486.410234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskGf-0007yA-L4; Thu, 02 Dec 2021 11:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236486.410234; Thu, 02 Dec 2021 11:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mskGf-0007wK-Hm; Thu, 02 Dec 2021 11:28:49 +0000
Received: by outflank-mailman (input) for mailman id 236486;
 Thu, 02 Dec 2021 11:28:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mskGe-0007wE-1V
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 11:28:48 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0363f8e6-5363-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 12:28:46 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-dZFyUQVxOn6enhfELvDVYQ-1; Thu, 02 Dec 2021 12:28:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6384.eurprd04.prod.outlook.com (2603:10a6:803:126::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Thu, 2 Dec
 2021 11:28:41 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Thu, 2 Dec 2021
 11:28:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0139.eurprd06.prod.outlook.com (2603:10a6:20b:467::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Thu, 2 Dec 2021 11:28:40 +0000
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
X-Inumbo-ID: 0363f8e6-5363-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638444526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=As8Rc21Rac+oaa+5Ny4M3duxYQkygiwB4vmSvtH+e1w=;
	b=J+94XsNgFoIeFXrxvb4I0Ul9mScIUQooeh6XYHD2dUvjUIxICskllR0GNdDXR5WeyDCa3F
	ilKaubv1VF4OUSeM2ma2gfsZi4Xp3n5ce+UShsNE4nrRy/lxXjx5VWay76o53u8yhDgVTY
	YAqtX6FrqaWScqCbAbqyNA0DZD6BrxQ=
X-MC-Unique: dZFyUQVxOn6enhfELvDVYQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gh9sQ1RvvQ4U+PwEE9IeXuZUyV+JIbg/KhIb7Sbw1R7WCj+ZF6qAgX1MKAnB0E0Uw32lxygxSvPW0qAN1U7NCR6vIvXGtOICdjTJtSFvy4aUpg7ll9Mu7gkjIcNsbSZAOzfKoeNY7QUfZPN1SgKKGTK3e/nGZ+KEKZVF2ctlp7V8YBfGnsmLC5/LnagyW3yD1xllYODGis3GCYR9/R7kmuGE4DNmha5O8z1HsPpV2CLwpZeHzFusB9qwJnIB9Ln3YFcN0y5NVivISFIUKgRuScbckvkSNZIIzouSwOhQDuofigTNmJxcdZnWKcWk//LN3EAYJ904QB0MrRfPuVVjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfMUgWkwhuc1Awis3HnVZ7TrZivKWDi3kMQnxfLnlS0=;
 b=JTjXyR91w8GWrJWEGr40rawhZ3pw+eSq7rmLHCYC2IZajfc+A1D3Ar39nYxf52T0PVPoNw1ukttM3F/ojxO8SmMk77OktHRiHPEgTsbM8Ox3XhJtCMlkc5J3cuWZnBEG/HQu2NypHxDmh6lEBappJ2FgVm4ac5LWUP+MrXt770auxBD8Tr1Jnfn1EunF1qeKQPdfqr/3xxqXMXnx/IABtoN/k1g0+5OUgCbRgVIl4wc+Rbw1S9u2KSmW2qzXKlkEgn6hllmtdVtG2JR5cXHrUowHKjZcXsZ/+Df4Y94s4PIOZEvpLhvrZCEleqRhI2q4EgLemnoZI1CYMBbKngFM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d90a40d9-eeb1-5c76-3beb-31577e37fc4e@suse.com>
Date: Thu, 2 Dec 2021 12:28:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [xen-unstable test] 166960: regressions - FAIL
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>,
 "osstest-admin@xenproject.org" <osstest-admin@xenproject.org>
References: <osstest-166960-mainreport@xen.org>
 <ec11daf7a998ae63c9a34578ec4224bf900232e3.camel@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ec11daf7a998ae63c9a34578ec4224bf900232e3.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3a9d68a-33f7-428b-9b12-08d9b586e43f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6384:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB63843A76601DB466067D6FECB3699@VE1PR04MB6384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ClwiioAVVL3SGVdRChLmfgyNxRiD/kUQbRGNsLXouG0yJoFnnNEPW3ZhRpSDa7jXqShQ58sVH8KTh4dG2BOeXhEvsIWd0M6vBWuUEUWMyEdK5FLnpJRA+xmNQerpfqaSeF6SLOUP1VhKUcYvCsaJYZALH7ovU8GlTZnqUU6cJASMFgrF/DqTGSS4x+Nfh8kvX3ArPFZriXXj4aOIBo8xh84SKlCTM8cKKXNR2XgHA58vBMpKIlsBVq/P+VJd17mD/aRegDN0zK2QOP4kN9tAwJ61wTE/h0GFku+WSQSYVVC2uMD9dic3ar4g97r+cvSATCc9VQsBTbr2D91HIRCspXo2CddLpozw34cafaFF2ObyY5QofWHko/TzP57pIDYm4PLmPJCagbnZ4BlwiaN9w3rdAQtQrxT77A3x3bHxJTdYbZaCZkJjRCgvvPJUxvv2H4p127vaHTBAV3M/ih9Rb6J85FJU6ojNACDrXihW7qE1F8eVesO0mdn/nsCSrApUizT7tVYUrObGEA4rpn7A8DZOywYJppUa8zjVa7GPrmSzcMBOoIgY7Z9OLzdHUv9R8kNYzuO1sGg4zm/Xtv3oY/Ju+yb35U0DWBnYHfTjLFlM01qbFt7GiTzP3DH/2PO6uNar8EmaH3LUkchMQ3Np18LgKJwxbu68GVB6ez1BgIMV6FODAKircU2byQ5TtmzfDoYr18yL8Mw6eiqJjykBTI4V8sjpw2Sqzp+aCYQbJg0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(83380400001)(4326008)(31696002)(5660300002)(31686004)(2906002)(956004)(2616005)(86362001)(38100700002)(110136005)(36756003)(186003)(6486002)(66946007)(316002)(16576012)(26005)(66476007)(53546011)(66556008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gEcSVB2e/0FDGHw+g2SpI1de3ukTrEK6MjacbqkSwOLX8slAzCnXLcHbBpYZ?=
 =?us-ascii?Q?K/Ote/i1f1qjtCgkC7zbN9+wvCd2UrWRZb4g1ekhc51hwXxOW0j+Op1Wi66W?=
 =?us-ascii?Q?ksp8Liphy8GPqv/L12nTgo4rvqPw/z6hwKlzdMnGTMaEW+ivXMPVlOkP6jeo?=
 =?us-ascii?Q?u2J/fSgIEiXn88yq0O/sSRvq0vtZP4sy0+HQSyNWdQ1shK442OUOSihT6qU5?=
 =?us-ascii?Q?HJmRlEdSju45AkYYcmHEODpuL/PM5C+ncPG3BmsbbEAXcJrmLztGSoXXEeHY?=
 =?us-ascii?Q?n1Vb0BjukIF2U3CLlAO5FdXCjzC7zuiColkmsqbPgMLO/Jz9fEzw0wbhFLC0?=
 =?us-ascii?Q?SC6a3s2CFUNIJLVTvusMoAzGDIOngH0brdb6Fqi8g8wOBI+rWNKoejzZ0Suu?=
 =?us-ascii?Q?R6espdDrUgx3mrlAjWtBwDUsbvzGa+h07fujJjWU1j/Jgic+4zKbAOb+sXri?=
 =?us-ascii?Q?p4CFd+x+15UmPvsLinaXFFuj1GO6l98mRfFHeRw48AFK9L7n5puHXoNbtcYU?=
 =?us-ascii?Q?VEI8n3oTH5dRs+jETp1gZNWY7/QFHHF7H02NjjyYc7JntQwigWXo2hCDILfS?=
 =?us-ascii?Q?Bc44r2rHp8QE8HGIX/9EprBOT/dRTSdpNB4AFNR1eDgMMG9mT2a4rMp4uVnM?=
 =?us-ascii?Q?Uz2DjJLQzuujjM6kWs+RgPU9N8CmMgW64vme1IqAI/12CLhJSJ02wGTQvsq/?=
 =?us-ascii?Q?+ZLug44jS2aKiN0eTv8uIKDBJ/TmjVIt4/O637Kf8ZK7BEdwED4knijasa/+?=
 =?us-ascii?Q?T3MqAXi5C7FWmZ6QN+EmG9DTffUWYuG8RasJj0TTfHrLa1U+DRvR92xNZYHe?=
 =?us-ascii?Q?nU9mxqWw/RB/P8xtJMPp0kiC4aILelNzSCsnKILgpjxz9CACpjewVu8n9QwC?=
 =?us-ascii?Q?ezaltNd2PGHXIXujUB4/GU4Wj8GPKXegHXqUGp0mwFBlcMu54DjHPJ+yHy/G?=
 =?us-ascii?Q?Swv14OXmDk9PpFUNAiAljgR4fgWxt8Acd4C/OIP08kHQYD9J+ZvgNlSJdg50?=
 =?us-ascii?Q?1oQjbz1qm5rvxsc9fw/oJ0ZenpXSGu34heXJsEq1TXm/n61lj3qHHNhFP9PW?=
 =?us-ascii?Q?DIuySwTg9spt3u0y0q3VzaMqh9zmP/UwWOoouuCKqKQQfoa44pxSq+W2FV/r?=
 =?us-ascii?Q?/choGFLU0tKGk2c5fLi8FVz25NmF4kHWYm/n7To/t0YTUOgH0MshI1p4yw2v?=
 =?us-ascii?Q?+9VGCtT4UjtaeuaZIygSbjYO80FflU9FV/sSV8KJAFK7uQrJok/ginanQAyd?=
 =?us-ascii?Q?mtL/ZTmrMxBYwHFv85/YHNiXGvA+ioEmukAGmfTUr2x81n1wcQyBPoiegSuz?=
 =?us-ascii?Q?aKs2anTkM9rT3PJFxam9uSAAFELtRZMCQQmMc19+XSaZdZig54sSkWOZajRy?=
 =?us-ascii?Q?zvcvm0sYw4uk8u3067PMB5AkpkPsLTUtoVKwGWTe0LTSQgEtNhXG6TOm7mcz?=
 =?us-ascii?Q?pU3NuHR9wefNeD5/QED/NkIaAwSat05pTXe4Nl7xwrLMWopK39A1/TZYADOp?=
 =?us-ascii?Q?t5twfs1yT+R96jfM7/fGDZGKwpIfTpxrdeUfckNh7yhFzefv7qphuc7Zt4iU?=
 =?us-ascii?Q?JoiKEr7s/40ulo5ly9JM9h0Cjitdms0A6WsriqxugSI5GxaEbekmz89xCwea?=
 =?us-ascii?Q?+10ZjSewBBFKAG+iAwVrbDM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a9d68a-33f7-428b-9b12-08d9b586e43f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 11:28:41.1123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buqNYEXtzu5mz9N/fXnngjZeOeRpPx+MgeKhSAG1oNg2fmBXpgqMYOOYqCIeO0uNepbfMyK8JQhJgqkLS65rnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6384

On 02.12.2021 11:44, Dario Faggioli wrote:
> Hey! So, I noticed this osstests report and got curious about one
> thing, which looks weird to me... If I am missing something obvious,
> sorry for the noise.
>=20
> On Wed, 2021-12-01 at 05:43 +0000, osstest service owner wrote:
>> =C2=A0test-armhf-armhf-xl-multivcpu 18 guest-start/debian.repeat fail RE=
GR.
>> vs. 166941
>> =C2=A0test-armhf-armhf-xl-credit2 18 guest-start/debian.repeat fail REGR=
.
>> vs. 166941
>>
> It's about these tests above.
>=20
> In fact, from, e.g., [1], I see that we have 2 pCPUs:
>=20
> nr_cpus                : 2
> ...
> cpu_topology           :
> cpu:    core    socket     node
>   0:       0        0        0
>   1:       0        0        0
>=20
> At the same time, in [2] and [3], I see that we're trying to run a
> guest with 4 vCPUs. E.g.:
>=20
> Name                                        ID   Mem VCPUs	State	Time(s)
> Domain-0                                     0   512     2     r-----    =
 468.5
> debian.guest.osstest                         3   511     4     -b----    =
  21.1
>=20
> Isn't it the case that a guest that has more vCPUs than the host has
> pCPUs is conceptually wrong and, even if it sometimes works, prone to
> (heisen)bugs?

Imo this should conceptually work, as long as you don't go too far
and as long as the workload isn't overly timing sensitive.

The debian.repeat step has first started failing on the full staging
test, but this now has extended to smoke flights as well. I haven't
been able to spot anything in the logs ...

Jan


