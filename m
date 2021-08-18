Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ABF3EFBF3
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 08:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168094.306883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGEtb-00073Q-Ru; Wed, 18 Aug 2021 06:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168094.306883; Wed, 18 Aug 2021 06:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGEtb-00070d-Ot; Wed, 18 Aug 2021 06:17:51 +0000
Received: by outflank-mailman (input) for mailman id 168094;
 Wed, 18 Aug 2021 06:17:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m5uW=NJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mGEta-00070X-6Y
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 06:17:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04c5af06-23f6-4ad0-808c-4111843fc568;
 Wed, 18 Aug 2021 06:17:48 +0000 (UTC)
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-OtQ2HFPlM4KUY-OiWdkZ5w-1; Wed, 18 Aug 2021 08:17:46 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2702.eurprd04.prod.outlook.com (2603:10a6:800:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Wed, 18 Aug
 2021 06:17:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4415.024; Wed, 18 Aug 2021
 06:17:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0098.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 18 Aug 2021 06:17:44 +0000
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
X-Inumbo-ID: 04c5af06-23f6-4ad0-808c-4111843fc568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1629267467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWASQnneuM9cgCGxTTuZFfHEt91mLfOH3Y35hMkb+/8=;
	b=Bsi7jQYbxJER+5ECtsO4VZOzr1btHXdd9O3bJWhZQgA7da5OOuExVlrlhfkZT9FgM0/hO9
	0Q4gmRO/XpBOXoDZp7kqN/RcLp6PN7OUAOiUmvHLZ9ZV8u0GQglSFqgfF/C1ZKXxIdJFTJ
	vAiJboCRR4HasrhjWEzCJwgbMqaMAzQ=
X-MC-Unique: OtQ2HFPlM4KUY-OiWdkZ5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDC6w+XPHGaQsxHZb83huZoED7xse0DK3GO25RQrHbYSfSDNZrlN/OYzNZS3kbdykbI2bO9rzLsThoLHGiwZ69RAcGEQf2Yb0IgMbFmpEGZ/GejclK5zEbMA7GxX3VkRgMYE/apXHTIBEQXuITsDiqs4FTteyo9hEX+y0qXvUj56D7CuRwH99tIsffcHa0+xKr0T2+sQpwS80mnPWPIBNXqB7ZvvgS8P0/juPcvfLBpgSnuecl63KdxeJcWCJA2f4NxKzQNNeMTrFGEXaM1rebXnOhR/NmenJmRDdO00sXaKGQPxkCaY889iUZw3IyJa1LqKjUk5t4bXoLtw2JoFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+G49FQJKYWnI41qMhbtslsWd5uw5CnBykHg6pV9yXc=;
 b=lGDGm4yDOnHgCGmrEOTN+K23aORayjNoxhosdVX8twXi4fbaiYpaCaMBrMiZGLhvbxZ5YUV0V4KTW9nnffchaIWFOKhV3XVZtwwBzCFqEdBNrSzMHiVdIuIY+Lqw330vfvKzU3Rkj6BY6buXhKS+au196z1DYFaXL3tAJBvnQ0QJwTcOU3QMpJxMV3/2mnsuygzT0rt1rpwqzrtc2KXVaXjbEdCT9LadEkEiT1Hd+sNLveWYYfwnb5Px3NdFvmK6100fRpE3AWYzvMjy0NTa3nzIe58IXUUI9nt9qNcSbR+/WpbNPDHW4QKb3Yf8tRaoB2RrQUHeGojPHOK8ECyX2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2] x86/PV: assert page state in mark_pv_pt_pages_rdonly()
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <929e4299-c9b3-0714-3c0a-3c3d1c0c14de@suse.com>
 <85333613-4425-9f27-fd0e-fe4a65e2860a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <db7d2811-0f14-5398-e39c-6439484dcb62@suse.com>
Date: Wed, 18 Aug 2021 08:17:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <85333613-4425-9f27-fd0e-fe4a65e2860a@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0098.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3681d30f-6770-47fd-04eb-08d9620fe44d
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2702:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB270258B00B8976E5E9E82F5DB3FF9@VI1PR0402MB2702.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sqgyJtmixX25KWw0rHz45iTEo4/sdniNNHz95T6nQzR2e/El03l1+3Z0h2nH+USF3IU8AP05X6Egpyd7qt8UV93hrpHxdsM34ZFs89S54pA4kyVpMb+4DnIc88GarirpNq7ngyxyj0S2jecNWL2fo5A+sg7nNuI5Gr/JZQdIoiF6yQG/Uknj5IlXFObDZC6Pu/iD5+v4kwuc4iOQepikdFCNS8GUt8wiHhriF0REVBvj5tk7A7Qz9yc7/K9WpFy7IaHmWexyJNLwPk/KNd6uilFbeupsmH9S93AvCa2hHZETkWQ65hG98p5S9b5bWu0HRQzxcUbW3i9gkee/b7TVgZFIPvuB8/DnYJLVdt9dTDGj1e1dv+fehfF8R6wMPF72DGPCavyoZWXOqZDChrw0WQ7IEWbBni94PEcp/ogQLkfiVEGad7VxcC5rAOjY7Jxz8L94AzFXesIMLkN2jgZxSHz9rabjbx3mOJSbICLRa7LSng/1k5jWjbZmIwZDMI4BrGz8Lwc2COAWeKL/qBD/+XA/DddpNNhL09N7mDuwo85fIRmOxW+7FcQaMDFi/+8p/ORDesygiLIcJdaCv2ydmq/KyBZoBl4YUzm5rsop0oM4pWwxA/8sPY0tHXUFdEIM4+RVg3MaSntx1n6uXvihTijEevd/pN0e0i++KGxWBiuhzACNNf70fpaNkTzI4zqYNPg6CXNj6ZxhBkPPoEUfHn86NxJ9Y0+NwYH9pQ2f+tk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(376002)(346002)(396003)(366004)(66556008)(8676002)(66476007)(2616005)(66946007)(2906002)(956004)(53546011)(6486002)(5660300002)(186003)(31686004)(54906003)(4326008)(26005)(8936002)(478600001)(38100700002)(83380400001)(16576012)(316002)(86362001)(31696002)(36756003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iB/aVb1mxmU2na64fZdsYtl5Wc3jLvisa3in9HDrFLHNT0g24YsmmsK8cVzI?=
 =?us-ascii?Q?EeNYHL2SMygQoXRLoZJyF8Tc811d/faivvrzvO8J3A4yCC7JvAOOpppuOKBD?=
 =?us-ascii?Q?xZ45uM399OvNk7I2aniizKFdn6JP0/6+pSoC1LQhszO+aB0y7Yn3tDIEaU9Y?=
 =?us-ascii?Q?+WHIb0BonfbD3qi19WoMq8798w8TNnbosyT40PmlZ4QflRN2Q4rjBRfay+ad?=
 =?us-ascii?Q?XA+e3LFpj+x6/JxgdrZ0wdl0GBiDloapo4GPeH9WXUsShk1Fg1KnblVA306G?=
 =?us-ascii?Q?W6Hjeo10Psw99oXX6VKgHLQeoVcI50PvD9bkOSRz1OGg00xaY5Ivqm3ZJd/d?=
 =?us-ascii?Q?J0uYoXKAKFbjXrshlM51jMG5Mce2eaghSfsniGlnvIiVFzn28d6xdPFto9IM?=
 =?us-ascii?Q?z6/0EKMlsEXYr0ccEfI64zbcvVYWtW/E8c1lZPk7ld18OKWsxbVOr5Ed/w/F?=
 =?us-ascii?Q?tNbASaOWri8riDh6D8cRbJbkTYCVoY3GGWv57ChQ0IIZtGraX7+Gc/Ql6lgY?=
 =?us-ascii?Q?jv56W5A+KxsY72aY0t/K9NRwXVODwHwSPxQhetzrFadqdv/lay1ST/Z9rfNr?=
 =?us-ascii?Q?mi/UJGq+90bOYyjQuEdOFmozsN2gcld+cUC7VuKIc3qaVPucqWEGOnprZnma?=
 =?us-ascii?Q?sNqqUr9/j8F/WyFU1e5oohWLikIlboMWWzNJ2p7z6exZrx4nHVwLwEa/sWw+?=
 =?us-ascii?Q?VoxuBJdkErs0y2eBcFoS2dUqmAQrLvF3ocLGD+pPM7HPysFNNLDQSC0ofQ66?=
 =?us-ascii?Q?P4ETomO4PxL8Ih9IFocaPGIzw7+Un+aHpJV6yeNTLZ57eIakD6DTHOrlK3S2?=
 =?us-ascii?Q?o4wU58mXdbEjkNz7xrTktsMdWrqr2exdOntEd27BzsA/ZDreZLLCVyO269y9?=
 =?us-ascii?Q?6uafWWHFGUcuwilzxSAmwMEF4V7smAmQGaMP9aY5NkREX7LValv6emmNBcNa?=
 =?us-ascii?Q?8FptUnwk60XYWl7ONbtZNdWL43iugl7pKTnN3IeWc0raF86lC1SGj2nXt3Wz?=
 =?us-ascii?Q?ZGI+qmj1dmf4tuehHwehiuewSv3n//hy4wuPL1k6c5cspSNb4dD8B3N7t06D?=
 =?us-ascii?Q?5zXtec9lOero/OT+mLsq5yDDpxLEWtQzLNkD5z/KxfmkIoUKja7vCFRd0dIa?=
 =?us-ascii?Q?WTSyplO2FZbpX7HOXJ/Ng9NdWmLv3GlfhSIUPI3p4PIpv7qBqak6LUl0PveN?=
 =?us-ascii?Q?CLmPbuG2swhAIG+qL56X12MF48+d6deSpnCt8jeTqOvGGDxhs+7YnaLgXOlp?=
 =?us-ascii?Q?A9HLbBWhrmVnu+Aw0Qi3TXhfLBhnX68xPy85518PeOL084sGQFulwAcKKAwJ?=
 =?us-ascii?Q?atgUaw/2MZqf91mpN4f5M285?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3681d30f-6770-47fd-04eb-08d9620fe44d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2021 06:17:44.6108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mJsg6R8ULj2Hx9OyVd1pKK+xFjHv/w7BjmmToNb4XY/1nAqdC4rwr7mWL2VHyXXndVmB+aJ+jYLQvYGTjCwbhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2702

On 17.08.2021 19:25, Andrew Cooper wrote:
> On 17/08/2021 15:29, Jan Beulich wrote:
>> About every time I look at dom0_construct_pv()'s "calculation" of
>> nr_pt_pages I question (myself) whether the result is precise or merely
>> an upper bound. I think it is meant to be precise, but I think we would
>> be better off having some checking in place. Hence add ASSERT()s to
>> verify that
>> - all pages have a valid L1...Ln (currently L4) page table type and
>> - no other bits are set, in particular the type refcount is still zero.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citirx.com>, thanks.
>=20
> Are you planning further cleanups here imminently?=C2=A0 If not, I can
> probably shuffle some of the easy ROUNDUP() refactoring in the direction
> of an intern or grad.

Not any cleanup, I don't think, but quite a few further changes to make
Dom0 use large IOMMU page mappings where possible (without introducing
logic yet to un-shatter split pages, not the least because relying on
just that would then undermine the secondary effect of improving boot
time). The two changes posted so far were really just fallout from that
work, with it seeming reasonable to post up front to reduce the size of
the actual series, which has grown quite a bit longer than I though it
would.

Jan


