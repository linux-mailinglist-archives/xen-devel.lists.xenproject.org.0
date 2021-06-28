Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E93B5D93
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 14:06:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147829.272881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxq1i-0000Hn-G5; Mon, 28 Jun 2021 12:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147829.272881; Mon, 28 Jun 2021 12:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxq1i-0000FZ-Ck; Mon, 28 Jun 2021 12:06:10 +0000
Received: by outflank-mailman (input) for mailman id 147829;
 Mon, 28 Jun 2021 12:06:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxq1g-0000FT-LM
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 12:06:08 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f8c1bc5-4631-4a9b-ac7c-3bc439cbd65d;
 Mon, 28 Jun 2021 12:06:06 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-GKcPtTwuMFmAq-G3FHurzw-1; Mon, 28 Jun 2021 14:06:04 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2445.eurprd04.prod.outlook.com (2603:10a6:800:55::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Mon, 28 Jun
 2021 12:06:03 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:06:03 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 12:06:02 +0000
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
X-Inumbo-ID: 3f8c1bc5-4631-4a9b-ac7c-3bc439cbd65d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624881965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IjQoxJqvDTIywswmk+AZI3gMAaaJFna4jZzpW+tVyJI=;
	b=I2wJkOjnfTRFQw2SgonXOyDR3NUn68hAHNyfHYVAttBg3RlXaJLIA4WP8PpA524XSfoVwL
	iQtwm82Rj63JOo2kcCavwlzfTpF7cZqHjWHzGGZcToZA98mJebqp6fz4LCyskjvukd0yJW
	LUhLd3SvFqg7hTogSLNyz9TSU/thRSY=
X-MC-Unique: GKcPtTwuMFmAq-G3FHurzw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jVJHOJ0yNQjFut7NNRFVZLidDis+5kSp01pcOKYt7zkO/1IvxXm6gwupBuvclWMvIJPLT1lEGa2CN2oED70Tyq+KqtLPil9h8f9wKC811qbhvXld3vISvypArrBVjT2cfczfXcowGBiTU6s0AmlF6IomFb4bv5RNRs1VRxLUysQs9shIn3+uiZVpSCaA0h+CIbj+kM5GyG1jd0pNCouptQPgxDOhRc7eNsT8klXovFX7nqyH1BVAo2JgvAuAcMXfzcvBPxG5fXz0EeZvoh48EYaIUGpl+Ba8HpK/DCEkbK7Ywv1IYsbHNrrbmLaRk4BJR/5wnQEnRwli63dg1h6Ypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjQoxJqvDTIywswmk+AZI3gMAaaJFna4jZzpW+tVyJI=;
 b=gJYzcupEwHBjuCXSY0SWe/w7v/n2WtXMiImJ2ypihGV88iXlV7bVTIacLmjqCBmjbGW2kerxG1g73kEXWzf1KQbRDJeJCOvatf2q5bSbd2TeKhM/hMrtE1QkPC1Wwo61LwKzMoKTjWA6N8q3V5m2Cmy2S13cBpfIrfaL1nKnlVabgeXwvfRXI2vG0vUP8SUKYCVYBmAhpwDdFxB4Ek5bfTWqInkNR9RfKd3ve9PFOIaTfjli1mcrTZmpXDrjp1DGonz4HIlkHJzBd+U4ZVr+mi1KGcIHkoBNdAbvPwQL7gJkYTbvgrWqsgaAAitfqiHre401rF2TJpHxDLsSO8pPrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: A mismatched type error found
To: Rroach <2284696125@qq.com>
References: <tencent_D17B77D71E5C6FE0BCB2559C7C59459FEF06@qq.com>
From: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <3d6938de-f7c3-5cd4-b3e2-0d06635cd3c6@suse.com>
Date: Mon, 28 Jun 2021 14:06:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <tencent_D17B77D71E5C6FE0BCB2559C7C59459FEF06@qq.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR3P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::34) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af2404f3-802a-4697-7dd2-08d93a2d19b1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2445:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB244510003BE09C253F9DA681B3039@VI1PR0401MB2445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sMjW2r698yi1bZgS1GDYwqfynA2cTy7lN2bqsNJ/NDthqYtY6RcuJRTbPpaNPDdKtCXzLMJLPYIjSGoi7QMja3FtQfD/xu5eGkWKJ1DlHF31xePVE9eAMMMWdGa+1V1vTG8Odkk6D9nj/hswTdUetqePD4aO0jqyQj7eMcHOzw5nW/vUrqGZlNe8sGZpOi2QOOd647ilzpoET3gDSb0dWoGaqRtjWVESGREpyzhcrpEAK85doif1DVpo3GekukT5MoT7Iuy1IbPWdShevOQfS6Y3/wvSKpVEctlIWcQGjp0bVzkjg6ZXnDAS74z+x4NMBz2isJ4fbvIE8ceqwbDnV/sUhwBNG4rGPRh8zSqz0LrTVhzhEZBF1pZ9gWPlwrpT6Hx93FmqnJkY771Uc4CH8k8IYA+bJ9hgzMzT/Ms28PoESKTvWCD7C809UCriUOM6wAdRZeyjkmZCjHc3Cy7LlL1LudS4fwWvVADYQ3ddo8U++H5bS2mnbYRLh4536QYXTlbQFi891gYCQGGcNmo3X8TTMi41hINNO3va7sJGV3DiIIKIae7ll6U79M1s1BP8mUhcTqfGzBdzQ1K8UPbmXes9h8YdAW3cN5XjnZeQxTOb69FCioTlu6Hf4lo+WQ/LxHflhpJXSTFLytJSJ8lSjl0EkFFYguKH/bn7Ss1At1Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(16576012)(6486002)(316002)(478600001)(2616005)(956004)(8676002)(6916009)(5660300002)(31696002)(2906002)(36756003)(86362001)(38100700002)(4326008)(66476007)(66946007)(16526019)(53546011)(186003)(26005)(8936002)(66556008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?Windows-1252?Q?wV9wDhJ/fNg+jiuyDrf8SL2U1KSzxyGCpV+ishXM3+4Sk9Q8tBopkvjl?=
 =?Windows-1252?Q?XuipRqnt4jwRaOg8vl9mpwpyiQFiSuYEOJn65V+DWOtZUdO9CV2EQrjo?=
 =?Windows-1252?Q?13WxqTsW8Do7ZmDjHnsx3YPFJ4dBAO9+7EIclZ8k8QAdDBHiKiptK0YR?=
 =?Windows-1252?Q?ozGKvFFNQyozpm3V9FYT4+oGPNZReKPji00JosljDmbyddzhdhAFO+Ke?=
 =?Windows-1252?Q?Qbx3hsKIjfaio/+yFKZv3vYJrU1cbsm1gMuxMM4JJ6n9HdbmXXU3KR3S?=
 =?Windows-1252?Q?DSsnF5EJ7rVLMt4JjyHDVagpHyHUyw/wi7w38mdqP+fLVv79mzxdkt5S?=
 =?Windows-1252?Q?z0GATeAvsjwHLFz1Qsduw2gwdiXPOuH8jsXIybeYMuBI1ydw4Ihq25sm?=
 =?Windows-1252?Q?pZIKZZZoX+BObrH0f9fegb4U5gNcPNjwF0Mi0FB/cyQ2fZfbdBtZnzl6?=
 =?Windows-1252?Q?/5WUt70XfshZWEFIMwoasvxIC4pluIMqTCEWaoEZlbeb25LGFmu4onZQ?=
 =?Windows-1252?Q?PeLEzCP4qGNuNcI5N1xXi/nrVXHbjlrmyZBWxv8KimidQAkOo9o/lBAQ?=
 =?Windows-1252?Q?n0Ql+v3Wy6SS+0PNlru7lIlX545Otwnro9s+67ZJuUm81cff3GsTKJu1?=
 =?Windows-1252?Q?h4usbwfk0cXypjnCIZCdf10O8jTXCR5JHHn+v0d0ei9PWqlgY/RKgRmX?=
 =?Windows-1252?Q?QTsH4+IGl7Hp0wjwyhcIoB610Tt86LKf+oKJkTQrjnmvQlwvlTKzXXag?=
 =?Windows-1252?Q?tn2LdfCg30zvAOylktXLVqgVSZ6+IwpR5gcOPluIR2RZwrOINdF0lP3T?=
 =?Windows-1252?Q?NJKS66Gr7QtKcbVhb+I6zV0tDGOAEWwc6rc3YfRPcDRrL5s5vW3MiwJ9?=
 =?Windows-1252?Q?7FdAb4ZgPKyMUcoS82rlgaaUF+o41rlpVPgnMiVh5ygM+8GcmCGl9fDu?=
 =?Windows-1252?Q?YYjrto7QE87V03BFNwsSx3tAdlXO5G6VdxKgZi6WT7/Kec/fZl1EAwPG?=
 =?Windows-1252?Q?BauRKXXJoRZLKV4BhHRmbu+5epS66fJApsse1H8i6kr/6+P2FYTb5TwL?=
 =?Windows-1252?Q?4xyw52quIurOB4bfFo1bT/sa52ACNTq+CxTkRpz2zLtdstmDyNbITAco?=
 =?Windows-1252?Q?RPYdycqdU4bDoXuh6EbHNiqAQ6Ts0jeQBG6jbRSZpSquuC472D3ySQKO?=
 =?Windows-1252?Q?upgthEX7muTrGYEW0wDpb3U+I1WEoqnB5xTTMi9AXnochVEwWiUFuC1z?=
 =?Windows-1252?Q?4NsOVJLqU+SdLAsCsm39TI9qotztmwpWQw3DemriTeC0KPSc/KMz3J6j?=
 =?Windows-1252?Q?7vVkT1NgrDpCk4cYqTsSeyg+r2H8KpMP2CORX9OhqoPPP3XAYTzSYx5g?=
 =?Windows-1252?Q?puXYEj48EbFS/NqfpKtYZgCD6Bf1BSiwg+qg3AW/ju2uS0upTcLG3u1O?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2404f3-802a-4697-7dd2-08d93a2d19b1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:06:02.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75TwASef+b5DcRD3FQ1eZ5z4q7Wbv21aPgrRnpaPYzN/spiWA63lFxEM2wtX/2TU6KwDwAbCEqGIB0ZXet3ibA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2445

On 26.06.2021 17:36, Rroach wrote:
> Hi, when I look the source code in Xen-4.15 source code, I found a type mismatch.
> 
> 
> In detailed, in xen/arch/x86/msi.c:find_msi_entry, there is a comparison between entry-&gt;msi_attrib.type and cap_id. However, according to the definition, the type appears to be __u8, where is a char variable, and the cap_id is defined as int variable, hence it seems to be.a type mismatch.

unsigned char, uint8_t, and alike promote to int when used in an
expression. All callers pass values known to fit in 8 bits. Plus
the hardware field where the ID is coming from is also an 8-bit
one. So while I would welcome a change of the function parameters
from plain int to unsigned int, changing them to uint<NN>_t would
actually make the code worse imo, not the least because of it
then violating ./CODING_STYLE (section "Types"). And using a type
wider than what's needed to hold any valid values in a structure
with perhaps many instances is not a good use of resources.

> Despite this error do not affect system operation by far, it still affect the code's quality, as such error could result in potential bugs in the future.

In this case I'm having a hard time seeing any such happen, for
the reasons above.

Jan


