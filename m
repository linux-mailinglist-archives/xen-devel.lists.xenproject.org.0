Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658184CBD00
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:43:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283222.482176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjrV-0000pO-1u; Thu, 03 Mar 2022 11:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283222.482176; Thu, 03 Mar 2022 11:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjrU-0000lb-U5; Thu, 03 Mar 2022 11:43:12 +0000
Received: by outflank-mailman (input) for mailman id 283222;
 Thu, 03 Mar 2022 11:43:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPjrS-0000lV-Sr
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:43:10 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1802f362-9ae7-11ec-8539-5f4723681683;
 Thu, 03 Mar 2022 12:43:07 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-39-aG7gw-8rPWCqcplm_4g50g-1; Thu, 03 Mar 2022 12:43:08 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4031.eurprd04.prod.outlook.com (2603:10a6:803:4c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 11:43:07 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 11:43:06 +0000
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
X-Inumbo-ID: 1802f362-9ae7-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646307789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKzoZ4ikj8dUJsJtdG/imGrTBGfplO1pGS1yEi7i/WU=;
	b=eQIorU6rtSKpa2M4aY29k7As0E/ePsdkBwwjCsxqlf72ByJUc70HhwhLKVTVs+35XVZY+N
	kLGuyHDyzzmIhRew4NFulpOLrlLR6Ybf9dO6GN/iFqA0HR/R8wVl2eY7lZsjIoKREpwNed
	Sd5hmzE/K+mnJM//zEkvT/vTiNt1ePw=
X-MC-Unique: aG7gw-8rPWCqcplm_4g50g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtN7/LetXhOAjee4DII3w1r39Xl9AM5t6POQxXWYjcIXVXLADm9pR/Y661Ss2G7PThKI6OC6ntZy+98iw77zwDFPjdeKWceNkBha3iDn+n3JtICNAeuPmRGr14Q7L1/VgKvZ0Kwx4+OsBRdL6V4Z973uCMdGYaN5htJvvuoVuTCUqcFHq4Oz8pwoW56ezty7WtuTC7Qji8epmsKJ3suM3wtDoEFusGVr7ahBPrpDIGStRg03ozAJLFP0ilkUJFWwveJxSDp6nZwcuVSS5c8PLtSol33HGjd6+6S7biU38wnlbkeaMy4zapamzV//u/SjyIrxJ4T6yi2XFoyT4jqwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olDlsQ0qXoghAxpSEMDWh2NF/+smfYSez6y5C9Z3n2M=;
 b=Wsb8W7R4P363EzJelpeoaMgs0SweId6l+Tju3TnQn0u963LbqfFvSz4R1g3RP65EbOMoym/ECPLsf4ONe44rC08wl2cf8tvGWJ3hqWnuvS7D36OsjQtifU0jC4HKMlvVn2LvEIiUc5h4NRicwFOJWzeccS+Ev0sQlu7pbJrjyMvRsDhPEV5fRxRTT4IlsmnSdeQ7vPmiYU/0C6XqfHlNOJJSMdLB9IWg2XbglGOwXEdbPSkf0tnWC81ady2zi6ps+8Y9LrUVDDw4S2y6Jnmv6MAG8IU9/2KDCIDBv48XSx8BsVuBpXIckOOYU90mEVFLTMahJV4tnYDXsLiGsOnlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3a65ef0e-9b95-af5e-946c-9cec45ceeec5@suse.com>
Date: Thu, 3 Mar 2022 12:43:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/3] hvm/pirq: allow control domains usage of
 PHYSDEVOP_{un,}map_pirq
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Alex Olson <this.is.a0lson@gmail.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20220303103057.49181-1-roger.pau@citrix.com>
 <20220303103057.49181-4-roger.pau@citrix.com>
 <c1fafc74-d4d2-5fc5-db38-c75f076d8405@citrix.com>
 <YiCpJfnAskieK/p4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YiCpJfnAskieK/p4@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0023.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 076b4aed-3c14-4c2a-b4b8-08d9fd0afbde
X-MS-TrafficTypeDiagnostic: VI1PR04MB4031:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4031ECEB55283323BFF7E1EEB3049@VI1PR04MB4031.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hNC5ff2b+3IhwrhU6Qq5pfIMcDxrMTGhkH0kA2pdI1Y8w5mt+GxOvpHasI75sNs8m4406sCfn50JVF64DuuUdblJ268fRHLxIq9Ji0wM1x3dV/4H+sDZsNrPJ7SoJFs8cgtvLKbVYnfFDszjdID1O5R0GQKoxryBHVJsgIycnFOU7lvYnaoAVQiRvdI+GYvg3tNkv9TroH7I2F6JWZqf2Qzyv9aUZQ8nAqcIwurOsGhQBJQtM4kQV5K9Z/GevXANPoNO1YnAJNQ29/BLWd2uiPZe6TbDFaL9OUpIUhDxQKGJAFAY4UNCLyPEvX0Z3J2zW4A8piBpRcKREomfLNayMP5+MG0zvQFcJfhE3g2z8qi1weJrRUheVBn0Okjn7zE4uqtKjTwls3/RZZZ413zm3bKxCwcoFUleBQ31RFsJhhEI0SaZNeb1kaar6QLB38XUpE/L8YXRaLnFAOKAWyiFuUzn/fo1GoyyUKWXp1lEq/m7cemgHffMsNBqylqrBYQ2tLDBugxNOIjJzxNN0EMfnIJ1AIZQZ7FQdGUUdGR5V8sC89xMcbYkMOQlP9vo4kkgDXgY7PKbPuGw/2dA/5ust8dmsVO00s01ENFzr4Zeg3Y9S5hD98PiLh+23wnQIGxhMo98qYxQBb3BUS02PNsDN8gL2sBscr+q3jG2Urs2mjpry3jRvuvGoIloPdq2Xkm83KPUmBgTcS7yJBbmQL7AZvoR6ZX/C4pYmKuap3n3Iss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(26005)(53546011)(2616005)(6506007)(6666004)(6512007)(36756003)(558084003)(2906002)(31686004)(8676002)(38100700002)(6486002)(8936002)(31696002)(86362001)(508600001)(54906003)(6916009)(66946007)(66556008)(66476007)(186003)(316002)(5660300002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lqRLTzLon8ahDRnsT5aOuDGUFC2k914GkEsO+mGE7nmu4QVTKD7hD43DMG+W?=
 =?us-ascii?Q?1RlCs2q0U8PPVUyVvyWqAfyCxqWXYoT4ObMjMeQiiCKVytfuo7VghAFWpJSi?=
 =?us-ascii?Q?kG41xrKYZg8wB8g87GXEReW72k156mt5Xg0BGwDDz83lU1X/TD0qwVXI8PQ5?=
 =?us-ascii?Q?P0PJHFfUAgIJOcikHOZOeiCNx5rYrpZC+/ltvYoCKW6id3bbzm8Y/oBjx3sI?=
 =?us-ascii?Q?mMGKNyHDIdz10yilPJKWxn1Rrg8THDXuD4Got0Zj0DkG4EP1m10WtW6VLmRr?=
 =?us-ascii?Q?KS1wip9zsmZDO5D2zh3Zm+95P66lwdbhPMWRDqi0vYxwO4Drnh4SVsrtUr9O?=
 =?us-ascii?Q?A0Ef4guZyjiXL0/6XUSbdcCnF2J232rO9uufIau9w2gsuGBClxQElnZB7icw?=
 =?us-ascii?Q?cNeGHZlr9IDVy0CRtoEOzVd2DRYvGU5ltZFRc70nNoWWaJRclXYCgmbq/XBh?=
 =?us-ascii?Q?rcE5+zoPiwWsy6ZUGbg+wtHwMFTsp8BKC+MjVUgRuSbmzq3po+M7cBJ89KBF?=
 =?us-ascii?Q?LwO0lG1V99V3twAlCZOlctgoXq3vyatZsRijbFyJq2BhXwiyhkr9BSzoA9dt?=
 =?us-ascii?Q?kihU70J2Ezsfrw6HFtZM6s9TQH2UUmFyzqx1WVbWEYUr5wL4VFHfA8t58+wF?=
 =?us-ascii?Q?R9E/GvkOdYDc4hRSTFRWMW+iz/HYlQ+16MrLPdkAfzs5DHd7Uqpic1AzhBKG?=
 =?us-ascii?Q?eWKOn9pzNkeqNag7uBD6v4h+uON/YlsO3aHtQTYb16x4jxCgj2eMejCrJWuv?=
 =?us-ascii?Q?w4EKbY4dxCepiVG0K/t+lnUT4LiKVZiCjixZIMaFEvso5JVIL9jKJKLVZSps?=
 =?us-ascii?Q?EtsIoPTaGqO6ZPZGNdJSgR8bZ6O+rIgIc5G3E6P+4xHrKCWprqpEU1idnso1?=
 =?us-ascii?Q?/mO+DxIlGocYy1DH6u00mh1fvE3X7tP3t6z/7lsfbZSDcNAoQf3I7UtHl7VQ?=
 =?us-ascii?Q?iEFdmTrKEUlMsSsS2rBeRp+r0EEbhm+F4ZSe8lSAEBQII2yO9Tgz5VvwbsjF?=
 =?us-ascii?Q?XuDhgKd/Z7jNyqc2JuyJyb86tHtr4vVTq/7Z2rkdO7k8cY8qVBY5XpuejeF/?=
 =?us-ascii?Q?z3YPNaKqIeVPxo6VW6tAU2ZpvpIy3nme3wH2+45Jo9ZFawwfwdPJDv5g1aPX?=
 =?us-ascii?Q?e4V1BEuyu45pgVSZ3Ks/z4WOTNgtQq/HTxqKjXADh/6baKU66XtrLEmjzuwV?=
 =?us-ascii?Q?0TvQhRug/BmYSjBLkGVd67jr1ZMEAv5lUJNVkT1Mnd+GtgLV7t7rTlM8gTuQ?=
 =?us-ascii?Q?R7I9IXnUAWoxM7+vvtQUQCcYdeRRoeRGG82Rf6e85RIp8Co+oqeQDoiZ/fVk?=
 =?us-ascii?Q?o2jFAQhEsm0bktdFjiartrVbNtHZYFRsx1jtBKtxUCbIFgr2AeSR8Gho3G39?=
 =?us-ascii?Q?T2VJ6d0nYD2c9BQ2Fm2HKtxpnbl8CbktpYR0xUgEjV/Hzc4dLqBKuzjXprJe?=
 =?us-ascii?Q?p9okCF8knXLNoKvlbw5151Sh99CjTpbxxRMmMVfwEoRnPvrXQQ4KEVB4urlU?=
 =?us-ascii?Q?DuHdhPE7vAukQ0SWUZRxXCGPMRyp6xiDcNaOThWQxt0lNYn3sFnck8bKmKWs?=
 =?us-ascii?Q?wiIH0i1dc350ErIREML0XyIFw32yR3KOpmzdxrqRoSjUqK7xXfglg0lNIodZ?=
 =?us-ascii?Q?Gwg2IcXLO7LJ4UUh9VDPOu0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 076b4aed-3c14-4c2a-b4b8-08d9fd0afbde
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:43:06.8531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7KEdmMT+Vvrn9YMY+ENvGMrJ5EfqxXxieWZkemAPGiLACw+NR1dHdWJj6xGiEPdXCBvxeDnA9t85MLJIyJL4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4031

On 03.03.2022 12:40, Roger Pau Monn=C3=A9 wrote:
> Or do we just require people with split control/hardware domain model
> to also use a different XSM policy?

I've been under the impression that this is the intended model, yes.

Jan


