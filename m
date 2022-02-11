Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAC54B23ED
	for <lists+xen-devel@lfdr.de>; Fri, 11 Feb 2022 12:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270353.464611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITkI-0006cF-U7; Fri, 11 Feb 2022 11:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270353.464611; Fri, 11 Feb 2022 11:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nITkI-0006aQ-Qp; Fri, 11 Feb 2022 11:05:46 +0000
Received: by outflank-mailman (input) for mailman id 270353;
 Fri, 11 Feb 2022 11:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jrYj=S2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nITkH-0006aK-P0
 for xen-devel@lists.xenproject.org; Fri, 11 Feb 2022 11:05:45 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8efe54df-8b2a-11ec-8f75-fffcc8bd4f1a;
 Fri, 11 Feb 2022 12:05:44 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-31-YqVv7aDUPRK54OLsu3iYsQ-1; Fri, 11 Feb 2022 12:05:43 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM6PR04MB5893.eurprd04.prod.outlook.com (2603:10a6:20b:af::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 11:05:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Fri, 11 Feb 2022
 11:05:42 +0000
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
X-Inumbo-ID: 8efe54df-8b2a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644577544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9fj4HX6Kc01yafvXKV4apai7LtrZXN/X8RGz/oPFqU=;
	b=hSnDeZpLOM8+60B5ymVF6uSOuJk8tnke1AjcwdnZvts6APl/rwuropoMHuV4b7lT0VlZa5
	uVlStlTqh42xJ5rkj5HOh955YtEMkn8HJdaO/ev15pcS53i4UQMW2/HL/Zafp6DRdgfhOB
	82S6cPROv4LXvFWXTOI82aVhhX3vE3E=
X-MC-Unique: YqVv7aDUPRK54OLsu3iYsQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1yMJNkCKZZ0K17W0P3LKS12Nx+UnCPqorCFLC6L6VoTDTxOxPXIBMsf85n8nYOEkjsDq2a8o8RYb8cdsrHwYZM64vc6pekocZ+nCUXfbNZU/E1W1Bkze3Dmmdgtz0Y08lcxq0TKQmZ/pu7sNWPLOrSV49CXPYoX7b9Vav/GkU5AiduBpkNYo1oRrFXn83symi4dCHS8kZaf/u/wVVy8FyWsOdHmz4Ih04j9i9RKMaoPmEVhksmXCdCZ/WKeTTj+cP5Q1xqEu+FX4x6OJIplp3qhPWL+RAabUYcYCTJzViAEcvkPgVRsKKn43bJbBs2e7MZRU1jWwMGBFYrelt8y9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npim5LqAP5/y355XR0wWSnzCG2KxB7erRmW8EKAG2MQ=;
 b=e2oZrrIgIq/Q7rk00yxevEfsnAkmMjOQjanbAkP2ugbRP9ybJp3SaKbLZyMQr82+Sg9mnzmoqWF7miQbbuQS0aYHLb1fVIbD5/rehzDYm989yWNtp26PC51DzWjQgNc7ivld2nFvdCNEV9SbDehKd6v53+ENuv9nHV6p07Q03ZuAeIUz3H77XsJk91vVbR/uFiYrYoFV+zaU+woT5MSB8Wz+5NgmeRJmnSIvilnKItP3QJCtw9RMaswqdPy/5+bYp1xwZm+dnGm7Q+mrsXOTm4DBbqsRQu2vESbwR3wgTkD4kNGX32YfcU7Dmsf1TE5mU2BIAo6Kz7n4FMFUEb0sIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0efb2210-88de-a4a9-a5f9-0e321445cce5@suse.com>
Date: Fri, 11 Feb 2022 12:05:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 2/3] x86/Intel: skip CORE_THREAD_COUNT read on family 0xf
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <5d275d7a-7751-af19-db4f-d91e3592d30f@suse.com>
 <1c16c2c4-0943-1db5-e22d-a6e1ffe5d00e@suse.com>
 <YgZBQQFxx5dSZQfg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YgZBQQFxx5dSZQfg@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0301CA0023.eurprd03.prod.outlook.com
 (2603:10a6:206:14::36) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2af5925f-83f8-4a1f-d48c-08d9ed4e71e0
X-MS-TrafficTypeDiagnostic: AM6PR04MB5893:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5893C5C202172A89E2277965B3309@AM6PR04MB5893.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xSLs/ax3WK5UbfVVGD4h0KCThHL2S6TsWaO1ZQ1X+zMpK75LMDRNlNE/VCqy4u+jCnoYcgdjoqDmiOgMsuZ+w4a0fZjJDizISSOjHmVVUr7iKuYCSSVkmO5eCGYraymHxfcsp91kiKsIRUmQT4McGCFFc70UUJwr82FTTmfqPqCDQVLXms/eQgVWpAALjCdhphUdACZ8a0ZpNor6FmFXv4Rs/rR0bzau5JfT0TXfiudxDOIEC2+NXTC6JDyQvcpCeVMZnIJg1ZhxUccxvpQz8Tf53u9M8yQBWe1uEhedIbUgxB2rwNPTSqF/JseZI5BnYXj16RCQLJkpMfhBIcA85QP7EpuKPDD9aAvO7ms3XeHw4rsrRwEHk1koMURzyQI9uIT4r73oRA2/ahAbyIJaxep85RSw03QsCDLX47ZghphGjtfRE8SjpxxaZoCRQYLQx3EsdKIsKhlm4osC+AH2Oo7WhQ6i/2pK4DM+mb4eQJm16xP9E0BEuSFMIqIrX4XZ/62geqnbcBfKrXW+MJbaXRZwvzKkKOVCv4d1sqLaBdy1NT/mkIJ6OU4mYWa1zm/TJ852+psGumgl7zo5e1C4ScoP+rvZUuGQE2a+jESEkzd9anVJDlfjILa6tk6R7n6dBuYJDzVRUX6aCJ49kaJbJVz91Hk6WC83Ds3nI21rmsga7KfHMLcQsjCVMfPsQFWuhFzUhq4brG71l56P7UiZ5KI4dTsmtFhkUDkWdcgBrliWIStgXzPYa/qAwjGOmnem
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(66556008)(86362001)(66946007)(6506007)(5660300002)(66476007)(8676002)(54906003)(8936002)(508600001)(53546011)(6486002)(31696002)(26005)(186003)(4326008)(6916009)(31686004)(36756003)(2616005)(83380400001)(316002)(4744005)(2906002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L+qLDQbecV0SSpI1o501riSpeBHktXlBvHmf2g80Z7+xkyhX4LnHEBNHA5Vu?=
 =?us-ascii?Q?So5QGMFr/9p0oLa0Nt/ns2OCz+v6K75Sj/3FVpYlmcM0gEMZIYutV4ra0W1v?=
 =?us-ascii?Q?+xwJxkaIXGnP1uaT13d/fGl2iis/7Nanxe4fQPWt8nb21BcpKSmvHvxsHZF3?=
 =?us-ascii?Q?vyzO+I3wdFEYfwWpG6wVwjiUqysLLYN8emBrHSbJge/5IK8hnI8NJKAdDccf?=
 =?us-ascii?Q?93BMfgbU7weG+B5WEDB10U7//p65gurCA39VshjP7Uck6/C5UUGXoxE+1Vop?=
 =?us-ascii?Q?x8WOly9M943h39xquTebVm6Hvl3QAmuP0B+By0631oagnkVb0UKiIkdjTddS?=
 =?us-ascii?Q?P7BVjode1ZnNzJbIpAFNG7/MaAb1Oe6nkvPjys8TrDLdsTcH9J4Cl0DlST8N?=
 =?us-ascii?Q?MkOGQiIlc+qudDCTlCbagXid+jlX9CkxaMrLmG157/Igpb3mzBZUCspLBHbG?=
 =?us-ascii?Q?An6zj5qFBBexyvKQLmPpjZR44U3b9vudl61+0wIyd5I4ul6/dViU1drE0Stm?=
 =?us-ascii?Q?PFoCoBGpS+1QCjESONTVuIcTUKPJBnkRg+rWNgse8AhYOKjrzjDm+CWor2fO?=
 =?us-ascii?Q?9/MeldBzoHUnjwwBAP0oeTFfxixnT2u+jTfDONAdUJ9Kn0G9njHSVg1msXwb?=
 =?us-ascii?Q?0OcnoEW1zIuSdtP+SgpLW3Hl2/jgRt3B6/p+CLSdVVYEEV87AayMMQs7uX/6?=
 =?us-ascii?Q?IXCO8bjZ1M2+7z1XUXVUfrT2RPtW8dtkaRgpLr/ATcF6a9rUQY3jZT5SNbMd?=
 =?us-ascii?Q?hh3xFo8/DEE56sSEAEla6KEJsFAek8RvRTmGi/2Cahgx0hZ14jSrNdDtpL1p?=
 =?us-ascii?Q?sFsofnz0UY4QCkKUEs/sJ9ypfp8tH2V9fa0h1hBDxRohenR5Ac0yWSoMdgRk?=
 =?us-ascii?Q?cse2sXUmYyrIdmg2IIvjqcjepG0RLrPTjZVgJe6DECoGVvBNjFLmCyDpS7k1?=
 =?us-ascii?Q?78F5+0q5uRo7oDTAUR4cknCBEKPw2FevBU4/NdwnUng0cv5oa55fXx9vDTp2?=
 =?us-ascii?Q?zo1VjA0was8dTiYf88keXGKJiUIl9T1vUFnnW6PsdS84F4j7fRR7j4jQLY9B?=
 =?us-ascii?Q?9dUmXhm1yLEuduX/knMxrHjmCsA2EJcclzogrR4bBHM3UyX1GZ6htaP291bA?=
 =?us-ascii?Q?+uW5HybWS86k52kzlgqsX4WyWQmMm+w6f0OeE46iDqvHuFhSq0/qU38gzYjj?=
 =?us-ascii?Q?XzD/fFOLJ5yyzKN0ZW0nWNNAiGEe6c0TUpYPb7RmK6dPU0GK7tAJ1t0KENO0?=
 =?us-ascii?Q?v/4x4nHmr2Wl43hkxrr3CH7e+O5XiRAKa+IikVdLrqGoREjfXdMn2/XM3C4F?=
 =?us-ascii?Q?28TdGymCByZgqGG+8vvho5d6d0ov0REvVNa1NR5x0eiq3ZgY1xWExQNInsmY?=
 =?us-ascii?Q?Jb7D6T0HVpZuA4f0jiDFb/uVfD2/5DC1oGym+RG3rFJZfePwJrvd69YJkNux?=
 =?us-ascii?Q?Uz0owK0PwBDE2TgEHFg7OF1HsekZfirQFU+sfplO5lANdbFePjq8KMDuqpfi?=
 =?us-ascii?Q?mJFf1qs5Uw/0RZ/nLnB4VkImZuwXMKhDrcnCl4hbbHvPlwcXbrQwyuuxO9aF?=
 =?us-ascii?Q?TQWsa+Wx71w4JEJ8x1ApeRVfBhCC8hN4EyHJfdW80HXeX8gLdr1GOxEeQLTF?=
 =?us-ascii?Q?Tj2S7qjtA4eqnsTlxuL9o84=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af5925f-83f8-4a1f-d48c-08d9ed4e71e0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 11:05:42.4208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgvCPHCBpRHiLzvzXmhut6ljngRPuuncOYNtjOUZ0X+VqJAY46mDPVKJjkSlRRiL9TxGvvR1+5HtfIDb0zre/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5893

On 11.02.2022 11:58, Roger Pau Monn=C3=A9 wrote:
> On Thu, Feb 10, 2022 at 03:56:12PM +0100, Jan Beulich wrote:
>> This avoids an unnecessary (and always somewhat scary) log message for
>> the recovered from #GP(0).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Thanks.

>> ---
>> Perhaps even use "=3D=3D 6" in the family check?
>=20
> I think it's best as is. Even on family 6 this seems to be supported
> only on model 3f? (Haswell Xeon E5 v3 and E7 v3?)

Well, ...

> The comment also seems to note this is mostly undocumented.

... this same comment says "Nehalem and later". And this also
matches my observations (and, given he has written the comment, quite
clearly Andrew's as well), no matter what the (notoriously incomplete)
SDM Vol 4 may say.

Jan


