Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F4F519964
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 10:14:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320432.541155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmA98-00022S-DL; Wed, 04 May 2022 08:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320432.541155; Wed, 04 May 2022 08:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmA98-00020e-A6; Wed, 04 May 2022 08:14:06 +0000
Received: by outflank-mailman (input) for mailman id 320432;
 Wed, 04 May 2022 08:14:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nmA97-00020Y-4z
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 08:14:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 290ef415-cb82-11ec-a406-831a346695d4;
 Wed, 04 May 2022 10:14:03 +0200 (CEST)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-Ppc2BRGaNA68eMiyvgHHRg-1; Wed, 04 May 2022 10:13:59 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM6PR04MB5878.eurprd04.prod.outlook.com (2603:10a6:20b:a2::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 08:13:57 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Wed, 4 May 2022
 08:13:57 +0000
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
X-Inumbo-ID: 290ef415-cb82-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651652043;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DQs3uBZfO9npD8/kSlAwlsaWzBFngKYYBHskg+vPm5c=;
	b=dlTlrqKwld79yrfL3SE8ld/ggCgGwxT75i+yPsvEDqTFcJJpuYgjwzuw29v0moidGqobfX
	k5659bXeK/JKecukQwGJDKmM2XzeWTsRwdSbGTqqyOB1Mq8heyiwTIE/yii66b2LuP7kTx
	Xj+/QIj7zkcAemzUsR4s5NVvWGS3kJw=
X-MC-Unique: Ppc2BRGaNA68eMiyvgHHRg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMN1efV8sFPLIqOWJ2dPbOqa+feueJZMWzt4kVbYWnTXpn29z1Adnl2ByZ3d6fH7v3GB5+WzmcbwEyl2pMhtdEwFjFzvhojw21G7ofPRi1ADq2LLorATvfY7RIa0MUkIf84nwx3Z6rZ9q50EkEI9VWicRo3yBsTyM2iTj2T2ea3iQupmBHkFMmhsAuLr9b1sOJZEgbSrRxqBbHAElVMnxyCnXXrd9iY/SyPo2wxh7DLlSi3TRuz/g/zaTnfbF0oz0E3b9MxlRg4BQVH4+1RYk2uXNiga3LWyk9wUL3p+tG6mn3U6sTAAAakajLFU2y8UzM3KBz35dRoknD5wT69F8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4eT6ziFmR+oEmt5PfVan7mIVFt45G6awZJDDsAjaG+Y=;
 b=kqYsNVXAlBworOWZhlUlpvR7s+655dbsp9BlORQ9JLsaCC0ARAsi/0tUE5sX+01M/tGjLJX2PY+D6ipJrX+/n4zWXH+68fiygNZ1xHg656huWdW2Z+EgrOtECEsYDQv73l0xipNT/+EFXeb+B8FHFc8HMmWXaLUENFpCYMcUw0ZmhUMH/cUTflbhim4OOuwRgiX2osvg9tn3oFPvpnkH3hRbCkDThklqztPuQUTx6Ud7C1A5jStcwkwHZVobXkaPoN35FUovCcMTqGLbXKhSjU02Cv28CEhmFX5O5efJnmZtFblRk8ZhpzRDRnBHa0k0rfnH8WE4A1n8lxMEEh85Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fe933877-b995-f3da-2701-ae25a73e49db@suse.com>
Date: Wed, 4 May 2022 10:13:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] xen/arm: gnttab: cast unused macro arguments to void
Content-Language: en-US
To: Michal Orzel <michal.orzel@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20220428094625.382970-1-michal.orzel@arm.com>
 <074a5ae8-cade-3343-0c18-8122c85fecc3@xen.org>
 <87eb6f25-c940-8aa2-bab3-dea9bcf1760b@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <87eb6f25-c940-8aa2-bab3-dea9bcf1760b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0015.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed955d99-673f-4be4-471b-08da2da60989
X-MS-TrafficTypeDiagnostic: AM6PR04MB5878:EE_
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB5878DD3B5F3A073C69D38D1FB3C39@AM6PR04MB5878.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dUJ8whW7IKJTKtJNZmVAS2iutSiBW3r+FPtG3No5TChrFLKpCiaW6ESDvcJ+2PKV3g6jKwX59BdR7BGoyEccjaJkT07xp54JQYnBDItDb8Cz+n0AnFcZhbT6W9VOG8kY6tRpgav8Z0G+XDe+6qDmDVEVUuDoON2YeqKobM8XQS1sosqNgmnhnuLqrpMdk35PH7QH4IcmSvl5JJfgxsegkpFGUpOSKdvClP0cU+omcrkc2rXHfWnKdTwlm8wA6webt03rytuaVU1rRcl/eu3EdnM8uk0NNjpSk09FTjlgJmg4Yi3qcmF2gbTdfMATRDGtZ4u7/+cAZIpCBmLhxDuOlbs2aIKWvD5QODw9dS3vSscWveqth20AzwyA2L41U26SWKwLpWD+H8PkHqU03l6s2q7c6ZalXVBqPZShB+wEzFkf1o+Kr1hjHHkKS4zyZUfo8U8BiicuDwM8QbTKVX+163iRNP3LCvikxuCwUNKU/BO7EFQfVurBtNSS7BU8qWeR+wyOUu9OS4lffQawEQ3W7NGpMfoFQoX5KRSu6fxZnpSputW4B1Iv7XkuRwnzLjyoisgmON+84dvObuXVjTfjBsyWSHnLEtTKf+KzUzZ0/zeucdICaM7hoeawNAUAw4Scinp8s4AdYUpr5qrkgDTsXK3zJtyHo5MXn3YnWn9IMlrJa94O3J/Kkcaf08HQnx/hK3x/KuYVfBbpblKqkWHKPAOC4MOm+jzC1ZWYbwDPVnQ0UDLugkD8ozqrmrHT4wCc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(53546011)(6506007)(31686004)(2906002)(36756003)(8676002)(26005)(508600001)(6486002)(38100700002)(66946007)(4326008)(6512007)(66556008)(66476007)(86362001)(8936002)(316002)(31696002)(5660300002)(186003)(54906003)(83380400001)(6916009)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DeY/cPtvS4FRS7tV0Zjf8k+wzDRBP0OGcuKEcVdkbUKHuCW0QuH5nV8lGBpy?=
 =?us-ascii?Q?Xh0wjt0o37PldBnaTcLSQx4pOkmNgPrRNq8qbZSxvYAyrlj0FaGex1dfJJp3?=
 =?us-ascii?Q?UAiTHH+qMc1w4H3sAem7ub+aV9mUX2iLGQaO2wrdVALrf6ZZ5IkP5k11yBkI?=
 =?us-ascii?Q?D9w5YdNQoaUWLKQQPTos+y8JIQGPdP87FCNSOxeVQo/+d26LL6bKvN+BZ496?=
 =?us-ascii?Q?LcQiUh9rsb8t0g6r5zBuC2loZF3Rjq5M9spdL1iNR0eHHpa13o9pE2RhpfXO?=
 =?us-ascii?Q?jvR082wc2ME1iDz3pDc+J6FITnTVikiebMKNh2f4iEv8Mm1GnXCLl/VW8EUS?=
 =?us-ascii?Q?00LOm49alwcJxnmgZ6iVZzzJ2gzF7Bn7rE3SVh+0SAAqkSGa/+PEDnZ8JzNJ?=
 =?us-ascii?Q?m66flAEeB+QGJultcy8PaBygsY/y2Flrm2QBrJjIgpGZ0pzqjw2SpZe9038W?=
 =?us-ascii?Q?l+U+CGRmWUuBEyp+INDc4sWo1JCyEzA/El6yljlvLFH5YEaEIEFC5ZRjOcar?=
 =?us-ascii?Q?vNPxk4p0QfdCQrLmxCbNSmGQknhP4HiLtnp4OtI2Q3+VlcajjRjxg3DAvUAX?=
 =?us-ascii?Q?DeBD7Fokb+hdCVs7+d1xm8RDd+xb8bBMHV6BN5mGQVz93sTQmjdeat5T9ZUl?=
 =?us-ascii?Q?4lyXXvzxD/NhpQHK9Pu+D7ZwjDQUSLDQDxtaNf3nKR2JnPj730/xLmziH+tk?=
 =?us-ascii?Q?VsvpuuI/BX8xsguJa37H/iT8mhkqkVdJ7XonwYxTbJrEE92kKIPWkXriSiHc?=
 =?us-ascii?Q?HEGEREgwn3yGdx0xEgh4RYlZBZbyj3d08m+LxGxAAr5da+A+4JJGe+yk9wLY?=
 =?us-ascii?Q?w1E7kTk1Gz8Ogd1PW4REGpymLocqDTN0EPDIByZ7H4LxdBV2RFwwVSZaqUAf?=
 =?us-ascii?Q?DlQSPHQP2yiBbWMNy5FQa2/Ek1xv65Flz6IsshXOeSFBu/y8sYuuFQAJ8pU/?=
 =?us-ascii?Q?bde849PZF0beZXWaW0pNcVjvKLje6D7pYBGGX5lNzf0uS9cLRYq6GkODVfK5?=
 =?us-ascii?Q?VFf2juoKFdVbs3jZToBLU/V4KFnvb0TNM1IDC/N0LEn9eYVuuEa8TgaCwOip?=
 =?us-ascii?Q?JOYbLQO5sZ0mVVdGFT/kVrm8CMPp9br3cc/7HviGW0y+WDAFmRvnmVLjwNm/?=
 =?us-ascii?Q?HP+4Eijpq0cPPTGG7GdoGjXDuYdilR6y3SkNSPhZetPq//ET3XFa/M1P8wPy?=
 =?us-ascii?Q?7Po8fK2A6PwZrAIIdTBJeiFaVyZ2VRVfQI0uD+HUDclpC2aJHGEWVmQS1Lp2?=
 =?us-ascii?Q?NSZzzyWeP/coHhzWFv9iFHr4jpIyQ186yF7U+sU8OwI4xXAG/hXgQwlbv85Y?=
 =?us-ascii?Q?U3MPT2iZxxVi0ZUHbl3ALthshFH91Y7ze/io5c+jJZnnfbRLt3RTPvMGs9nh?=
 =?us-ascii?Q?CI29tDaLsgCKRCs8Yd6xe/wPXUDpVstPwGxcE4Jx2aqs/Lp7yS1TpEg5hSpC?=
 =?us-ascii?Q?6CZ9ei4EG/Ce8zyxxJ7lo49bB4Or76HPBd9bhEl5sZnf9qskMq4AjfAhJO7p?=
 =?us-ascii?Q?9HehsOGG+j3KZhpxAJovzoHB9wEXsRyJClYLc9jjeNoUaC1td2MDQLUOdOA+?=
 =?us-ascii?Q?wdAof12Wf8MoJpr/brNa7VoV7X7Qzr4fGG7Gey/9DyjfnDlb7OQI6Qkf8ysM?=
 =?us-ascii?Q?afMFcfznomDAEnn9zorl1iC/D+OV0KUE0s0g3K7DHFyTdT09YxdhftSd6dpi?=
 =?us-ascii?Q?o6qK5XsUCqvck8j1bxChemXSR9vUnaxg3KSP0XhjuLV56jv96ARnwRE+Nocg?=
 =?us-ascii?Q?PelK70IPWg=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed955d99-673f-4be4-471b-08da2da60989
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 08:13:57.5565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/LQE+DX96Fkvy/NujTWoKuEIFNPerltzDQ2I/TDnoedB4RDCO3nZPAyij8xZkOCSJuVixbq7vKOYbBlQLvqqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5878

On 04.05.2022 08:41, Michal Orzel wrote:
> On 03.05.2022 19:44, Julien Grall wrote:
>> On 28/04/2022 10:46, Michal Orzel wrote:
>>> @@ -89,10 +90,12 @@ int replace_grant_host_mapping(unsigned long gpaddr=
, mfn_t mfn,
>>> =C2=A0 })
>>> =C2=A0 =C2=A0 #define gnttab_shared_gfn(d, t, i)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> -=C2=A0=C2=A0=C2=A0 (((i) >=3D nr_grant_frames(t)) ? INVALID_GFN : (t)-=
>arch.shared_gfn[i])
>>> +=C2=A0=C2=A0=C2=A0 ((void)(d),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ((i) >=3D nr_grant_frames(t)) ? INVALID_GFN :=
 (t)->arch.shared_gfn[i])
>>> =C2=A0 -#define gnttab_status_gfn(d, t, i)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> -=C2=A0=C2=A0=C2=A0 (((i) >=3D nr_status_frames(t)) ? INVALID_GFN : (t)=
->arch.status_gfn[i])
>>> +#define gnttab_status_gfn(d, t, i)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0 ((void)(d),=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ((i) >=3D nr_status_frames(t)) ? INVALID_GFN =
: (t)->arch.status_gfn[i])
>>
>> I share Jan's opinion here. If we want to evaluate d, then we should mak=
e sure t and i should be also evaluated once. However, IIRC, they can't be =
turned to static inline because the type of t (struct grant_table) is not f=
ully defined yet.
>>
> Then, we could do like this:
>=20
> #define gnttab_shared_gfn(d, t, i)                                       =
\
>     ({                                                                   =
\
>         const unsigned int _i =3D (i);                                   =
  \
>         const struct grant_table *_t =3D (t);                            =
  \
>         (void)(d);                                                       =
\
>         (_i >=3D nr_grant_frames(_t)) ? INVALID_GFN                      =
  \
>                                     : _t->arch.shared_gfn[_i];           =
\
>     })

Please avoid underscore-prefixed names here; we've started to use
underscore-suffixed names in a few macros.

Additionally please consider using typeof() instead of spelling out
types. This may help to avoid surprising behavior.

Finally, instead of merely casting d to void, please consider using it
in e.g. ASSERT((d)->grant_table =3D=3D t_), which ought to also take care
of the unused variable warning. After all the explicit passing of t is
only an (attempted) optimization here.

> However, if we start modifying the macros to evaluate args only once, sho=
uldn't we also take care of the following macros in this file?:
> gnttab_set_frame_gfn
> gnttab_init_arch
>=20
> I'm ok to do these changes but I'm afriad we are losing the origin of thi=
s patch as we are focusing on macros not related to the issue.

Indeed - I'd leave further ones to a subsequent patch, or make
conversion of all of the macros a prereq patch to the one you're after.

Jan


