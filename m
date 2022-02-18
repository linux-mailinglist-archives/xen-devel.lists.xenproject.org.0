Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425384BB3FF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 09:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275177.470929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyRD-0001s1-80; Fri, 18 Feb 2022 08:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275177.470929; Fri, 18 Feb 2022 08:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKyRD-0001po-4h; Fri, 18 Feb 2022 08:16:23 +0000
Received: by outflank-mailman (input) for mailman id 275177;
 Fri, 18 Feb 2022 08:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v1rr=TB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nKyRB-0001pi-Nm
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 08:16:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0dbec2da-9093-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 09:16:20 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-8-e_ZUpT8lMZ2GEGNnzNk8Ow-1; Fri, 18 Feb 2022 09:16:19 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DBAPR04MB7397.eurprd04.prod.outlook.com (2603:10a6:10:1a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.19; Fri, 18 Feb
 2022 08:16:18 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 08:16:18 +0000
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
X-Inumbo-ID: 0dbec2da-9093-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645172180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2B/X4O4o6jIa0I9oC1Ga/ELeIuE2O7OqW9XdHsDltsg=;
	b=kzZIfpqcSr/0Nq+iZ/2JEb/YRKkQ1tkErbSw+7uQ3WHhaDTWLpv+tnmRjUzCEYVGa8LIx0
	/RH7IY1Vqje//Ns9SpirfxWM5E8/b5yTCfI4bQiT7R+euE8rFodXXzPw/IedYqsc0c3e4s
	TBjbwMrste/Lmwlk1aLpkWHgyReiYDg=
X-MC-Unique: e_ZUpT8lMZ2GEGNnzNk8Ow-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7ETfLZ3ofpiwB9wh1eTpSXwcnKnM4Ay+6khANElXqruj8f1QweWf7PTkVKUb+dlnQYsIPNjWr3XzdjfQRjv8caHPCaPwSV1F/SmPMFS9IGoUkLLHuWY57GkO0IoSefSiQmTjChtIFiAY1L8MLVelt29brqwNuWtDctwt1XwBOBhUGJxYnflgrLcmu42gNOdSuNQRQ+ARsEo39dsYQcdEntFJiWK2imBQDTltLCEAAn+ZMzbkcToY8mPeiyKxBurxsiyR7Amxu4i3FVukbOdQmtYqDuXJvKSUBEYOz2X5zxGj2eHWO7R0cvwOwizQoeshurzeNKTHMTIUpsGTBSCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4BmVG5Py4dPXp3giiQvp/yxxbBQu2gaQTICH54fiNw=;
 b=KmezueqKrb4CmyBI/9uhu8l0UmWePHGDn4zX/B/I1+K8ZwHqsemP+ccCAqSVZgjDusQAg8BbAMmnn4t4W8Mb/S0EyWx20mv3uj6HdU3Q8ZvQxxrb/guOP/j1CvYylbB8TQJgLd9sh54fC9nS+h5YxctAaEq1XiPT/qkQ8gJiAA8FCNFqGu4P3SuSddXG97eu4XVX5a59gBDS5rCz+/3sQusm6GMgoDeAm+OgG0ngXr17VUQ/XpzvgjVY5kAAE5JV8zumP62dGQbZ73TFq5YLfTmVryk2qhT2hYYH6fB7bj/gqC/EHfXdKnXH9pDq3rWaS0F4HdikugrKj4AtAkC63g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <660b2b8d-7211-46c8-67b2-f53f424910dc@suse.com>
Date: Fri, 18 Feb 2022 09:16:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 5/5] x86/cpuid: expose EXT_DEST_ID feature if supported
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: dwmw2@infradead.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20220216103026.11533-1-roger.pau@citrix.com>
 <20220216103026.11533-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220216103026.11533-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0075.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88bc7f33-0c24-43ad-1a5a-08d9f2b6f073
X-MS-TrafficTypeDiagnostic: DBAPR04MB7397:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR04MB739741EA3A0B9562F875E5AFB3379@DBAPR04MB7397.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KixlApk9/7T/8LlPyK20TpxuPXWvfsB+o179PN/lC2zXBN0hg9kMMY1gztyRpHudtrsUs2YD/UF/+XEDCCoMXcNM/Vwb1EdOk3I7ebL5kerCYXsNKo3G2HIz4Hs7Njep8mldkPlpt1d0JKFeyNyTVoLba7bcBN13NYniiDLMdKwHd4FBPdQ9wfJ7P+9CgQ/mArr5ciYXdZComm0qvFq+DuvlTWFRMcfqAuklLPxD9jXvKFYZa0P9qT8rdlmtQEjz+DorTW3uvueCe36pS/XlgMqMxGXOeVJzJybAyhnNl9CJbjXiAHLlq3nqj3tPAuvMyGxmTjpvLPQ+l63sgq678HPn7adFOH1nG7FNF0DKAa+Gp0jHuIeiFUwU1DjibPs4oZ1FDN+j6BVqVuOUZHnolUe423ehGaRBykaQjMEVNQQdUGcK+ZFMNx6WQVr1k9UINmfxpnn0CIFbVCuYvU5+h1PAZzxgSyiS3SSaMBtbXSBDuWlTTdq150K0dATQBdHHjXg8BkHIi+Lbx0Icvy9xdzkKmkv3Qgyl8Ck8OBneh4/vLKwLsc/CDYRYZlKtHqrcObbdgsd7pi3uHZ0QjVnb1POCK0yIV3Rz/5spe2hKd7fsUICBc06ze6OSJ1NzmK5xNNEorSMKvOIM2w4fS6dLo2Mya/0u+mQ/LinQX7TKw0bxJDrRBMINeItxaqcQOCO+7HAq6IHa8WmSvAj8Z/ITgkl0oFnEwHlLVaJKzdGCNsT7pvyxu4Gjj9nPbJtw99Ug
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(31686004)(558084003)(2906002)(5660300002)(54906003)(6916009)(6486002)(6506007)(38100700002)(316002)(8936002)(508600001)(86362001)(2616005)(26005)(186003)(4326008)(6512007)(53546011)(8676002)(66476007)(66946007)(66556008)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q85zLO5A3+cAMQOqBMlrGSAJKOfJCri+K+pNfMLLPP8A5LR01Bh0gaevPHje?=
 =?us-ascii?Q?qgl0zmgsxwqn43PfU1is4r03NNXG47HHY0Icq5y3Mn0TfIDNPxOCfF00B0Jb?=
 =?us-ascii?Q?jZvL5zVvphvRldidWIZIAIiGJ9SUw0HIeoym+Ah8j79Rl7MvkC6jLZ1JQa4i?=
 =?us-ascii?Q?UV3QNlf89xpBNp3SiXaChTK8ef6M7g8xd7JLXKrH5aCslLDJ0lMF/Ztl3Nuh?=
 =?us-ascii?Q?hRtVeho86IjYhvvLEyFXvMfp7H/34qttpYYEd6WvQ5r5s75vJe8gDM8Lz38s?=
 =?us-ascii?Q?22rG1XiRu5m8r67I9c7DGFt+gwbehO/rJsVZMYKL8KAG6Y7tT/Z/qruEcCt8?=
 =?us-ascii?Q?JKYGJJKeKcKDBrWxxTfUEuvV7ifXjTGeUvDZ/QnMy2MFhp7xXKItyNtRz+OJ?=
 =?us-ascii?Q?x71GnXyEVLra4qXKA64I5tkX4+UMX87OyRFfEc/dvWmr0KAyIhRmAkXyDU/P?=
 =?us-ascii?Q?IyaeIFFsh8IMfFK2wQjkMHg3vIwG5pdwxbDWznAYiE+2yERdG6sM7xQEgIjk?=
 =?us-ascii?Q?98Ms/rkokMkBxnSWbnh+0rmIUSZ7VJfyRqRFGiSZRDOtlXzvWWO7xLv1U9Sq?=
 =?us-ascii?Q?sS/mTmfzHOfPnt86/jxCzbPYsg5Scbz379ZlunDJs1vaWTjDaNKdlJjaZQ+c?=
 =?us-ascii?Q?30D7eXI4vYn/uQcwTE5dszH62Slia0xaNKLdy8eWd5wQtpwhN4t3zi329c4Q?=
 =?us-ascii?Q?NhWPCN4h4SGN607VgMQFQaOxjVW7ENA2aTFtHxTSWXYvlofmel1lndY9Wqi5?=
 =?us-ascii?Q?zH7hEjsuUEXKXLJtufZuWCPlGmqgNfzEkvz5/K4+eukMq0tpqdLOi2CSMrIi?=
 =?us-ascii?Q?TIyNjIOyIqr11AuEl6QJd+QGPfYnUTyBI6IYda3srRWyxwaG1vjwMDA9twTo?=
 =?us-ascii?Q?vURikf5gkp3iNHElC4nsQyZMPNCXqXWtVnNsInRGGMqBOxcXlO2oA2rKvLOv?=
 =?us-ascii?Q?M7WiPN8iaq7xjYnCkRu55DKR6eeoCVMe6AqlwIjUTcpVpWNw/3Z0PEaDi8sP?=
 =?us-ascii?Q?sUNC2WseHgpRaq1xIYriIua6xUmrIUy+2/mg55S5KOiZzBiTwBRiNM1s+Yjk?=
 =?us-ascii?Q?uQEJrVOI/V3CQF2sBEFMgIQ/C43otoXSlrqb4GrF3mA9VGJwg1NTSkVVhxpo?=
 =?us-ascii?Q?m0YC6AM07mmaVS+D0q4sviCSCtEULIYzSrcLjRQjhRWLU2sFRuVfSRJASYDR?=
 =?us-ascii?Q?pj8y1+R/55zGRotR1+1QH/bFJKeBm4oV5johDzRlFyYHS1BDoKRP2JSAfm4H?=
 =?us-ascii?Q?qa2XngUP+ruFRVFXb5zp0TFJU/oo3BG705uaXaOQzSIXiwfd6Suj7+PYR7Ff?=
 =?us-ascii?Q?SSgdQm/KWElXqtOEOKJxKQAm4haMDmjGqRcKwq/ySaJUMGxHtl/qONYd/ix/?=
 =?us-ascii?Q?wG+c8J2H5rC6iJXgj6PDV1HBoBnGftO8IOWJ5Cdg5D/6IDhij7fP7jWlH5YA?=
 =?us-ascii?Q?3craL1AOxHxlVmoRbcmCYy2Ud4SpYsarBaxypM17fudJifg3SYqtyIkYmu4f?=
 =?us-ascii?Q?flba52ynRF4tg/tfUlkBwKObh6K09bM8uIvvqN5RUugJHnbY0x24C1aItaWI?=
 =?us-ascii?Q?yF8Z1fD7VK/XdMz/xb0FbN+LoNlNxij1Sc6VvSg7Z+wsHi+OgAsuF5BZRfrW?=
 =?us-ascii?Q?txcn7coAhFeW0TlNO81gWCs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88bc7f33-0c24-43ad-1a5a-08d9f2b6f073
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 08:16:18.3555
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69/Aidv4wIsNNd+soCmurLOTf244RGgC62529UiOyqwPHszRwC3BxgJtsVEMJFUHOyYUwQJt6Pk03ffHtolSiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7397

On 16.02.2022 11:30, Roger Pau Monne wrote:
> Expose the feature if available for the domain.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


