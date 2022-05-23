Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA0530E7C
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 13:00:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.335819.560020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5nK-0002wF-KA; Mon, 23 May 2022 11:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 335819.560020; Mon, 23 May 2022 11:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nt5nK-0002u5-FF; Mon, 23 May 2022 11:00:14 +0000
Received: by outflank-mailman (input) for mailman id 335819;
 Mon, 23 May 2022 11:00:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ASRr=V7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nt5nI-0002tz-Vp
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 11:00:12 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84007a64-da87-11ec-837e-e5687231ffcc;
 Mon, 23 May 2022 13:00:11 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-9-dulwta_iP6C39fGuvozhJQ-1; Mon, 23 May 2022 13:00:08 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3324.eurprd04.prod.outlook.com (2603:10a6:7:83::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Mon, 23 May
 2022 11:00:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 11:00:04 +0000
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
X-Inumbo-ID: 84007a64-da87-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653303611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kmRdzYkfMb/oYp4c9nDzwccXLX9ZljQ66qGb4s21slg=;
	b=bm7Qt3Dtssn1kWVaJOfr27f5KUyGTcQo77zBV6dA4dDwpf5ADu92n2toVX8xxLCifq+gXC
	lGh5KViPQtevF2k8DiTlbuO8SPFeyAKFxrsQ/DmVLoyoGUZbBWcfs4NDtl3JGzoIOwpOiX
	FwbrQoAi4hu++hcP3kkhXVCkJyifVHU=
X-MC-Unique: dulwta_iP6C39fGuvozhJQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgDR1PhN+JvD/MfNdMhuHT9HmfWV6Pk3y4nMc2ZBGgRK1vPRA/PUftHjYYbOkOyuLCuc3P80njMPjOpYHOdOrlm95b70yqZ9bhK3YoBTKijZri5zPeyLmLUgG3SsMsBJXHJpux6QHiZuOYXbaMEjgGwAp7iaNf4qVgGbpOQsY80YkWwKj+aykpBKSHjQzTg9QfZCh93VX6iUvvFlSd27bZt9XAARjwz3zGrcM/8uGdxnPb0zdNWYpd9cqWii/5mgnvNE/RGtgva6OD7gfCqJsTVY9UFLBiB5kWfrWueetmSd/49UUfxAzK4DHws1CNDFtLKSCaXbPBoJ2V4YUUdkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQKzw+5fuPAhnUSaQnwi4psZFPcsGoT6Os08Bnau7og=;
 b=a7a3LQE9WHRDv3/B+atonFuDmjqFA92EUTonFZzNnCTcCwiF6Nl6jTb0dGX9XTM3wh6Pws144Wt3myH4J7/w4AGUJIvUttVxPJmxtevPHr+xCfkEEiCBvkiLHML4vryDnrfYJzNbAcqq/IkNpJL4HrfEIMK4SHZRp4hI/IRbN6tX7LjYuqzAcQfoGmGTNdbPvaiy/zjPy/juXcBSTti7StqYaKhcYhg4YEwR4N3kQ73+CWWuXDw3WjJ5t5gBsAzYSIxCHhGpjRMiLtE2OxrAihf2Ittvhu8YuTNYGDI+Iq0MRtoMY+R0GlqokBw7HW1yqAzvBAjmLFueuwVyPLibtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4ed6ac07-b6c1-e7cf-b8f8-154da425357e@suse.com>
Date: Mon, 23 May 2022 13:00:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 1/6] xen: implement byteswap
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Lin Liu <lin.liu@citrix.com>
CC: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <89b15afe026a84748ac0d9ca28e8608085454e78.1653295437.git.lin.liu@citrix.com>
 <YotcxufG467QSLab@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YotcxufG467QSLab@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91c72fb5-817f-4446-e8ff-08da3cab640e
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3324:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB3324BDD99C6698EF1DA1F047B3D49@HE1PR0402MB3324.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cRhanK5/PSK3hzEIdG7bWOP0SwCTH6SEIUAqKBiN7AqrKE7ypVgjXhQmvzzg+CV/MiFdKxBuKaDhIj5jHts5VXt5NKeHZNqSywntk61TKdYQO0mWgbN6eEHS9zoV6sqtgKg9ieKERUGasXMZeBYwcK+l6m2mOrq0cNA6cetzs9dDrpTsy29rW9kqW3u58la1+z/AtQXE7iU+p6IazYf0eoUJx74/AoFO2uybz8yvDxCXA77Km/V8mXEFI469vYCh9TmYBlpUfJdMoqDGZXzzEwtx7xP068tLcJXjuZf/Y8iYQE5i7mK8UzNTHsUey64Dkhr4OBZgFpn6llstKvWOqYdcEgWx0UMV3CfKpSO47DAVdyYaskXRrE3lgjfB5smgIpoGAALS58AOfBofHB3z2xVV0m+Yw2lEFr2CAbJB8oYmC4V0wpGOy4q/gixXy2iEoljho3q075NwJMu3Gmg4VEkUvxQzbSIQFBN4ugOXXnbOq938tW76ML+KnrWLdtrFKwIdCv+TaC0JJ5Rvf4bhOCCG2E6PYJQHVJL8Ftl5n7bW31dCXbpQ3FEXCA3GCb3ZrqdSzk/rF+lSkjrjq1UhalB44iG34ctJj36HFXCDADvG/gupGMizfP3fXzsQQjhIZhEG4lpb4aMbekYhqAlBFM+xKOeAEba7wTVEMmPFptiWLKGrTN1xDN2w37MbjgOvx7IyoD3n84m218q/IlZGXjtL8CLsgEMSzbGThNi8GxScDg2GMg39MUfWgIIJB4Ok
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(38100700002)(66946007)(6486002)(6506007)(53546011)(31696002)(6512007)(316002)(5660300002)(186003)(36756003)(8936002)(508600001)(8676002)(7416002)(2616005)(66476007)(66556008)(26005)(83380400001)(4326008)(86362001)(110136005)(31686004)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MtNUMUMrjGPgIPefOUQkQmEkX0G0CzEWkPI/wD3KSzD3aYeCvSK0xK9tXMIY?=
 =?us-ascii?Q?GFPnhBcU6Zn+oUp4+J/ooVrbwYVp+IWSgqxq4cwtP3jggYoYZTc94LI4HNXN?=
 =?us-ascii?Q?/SNY+MqjM+0zaf0WAaxVGNmnVNobk92c2LXLkEvLNnWsoW69S9djm63S/Ngn?=
 =?us-ascii?Q?vKVIqo0mmgSb3D6F4AtPEFbX/T/W2hOYODEJWwn40VoM1KQUe9/IpzYGJnwk?=
 =?us-ascii?Q?P4R//3HkeXxGXSCU3LZcSPliHKQil6Y6mD2t37OSKQVVXlQos8yU0ci8upi/?=
 =?us-ascii?Q?rnsHJY87DWXBG2A5bGvINUJihlItr/VbY/3Ak10CFZgRjxYYXvD5l/rgsQO3?=
 =?us-ascii?Q?W9yc4pe5v58SKN/UspsbN/od+33lRRk98mF18QTI7YsdelUf2lDwP4zBUjq0?=
 =?us-ascii?Q?A+u4Nb+U12TOV8Ib6TxNwr3fmd0nuSY8z4mHgQ9SPPsme+BPOvKYOqKgA3/L?=
 =?us-ascii?Q?wZ++4hmG3bCVX300Fpnszb+XhJaKABtDw1IrUj7w5qrpdzO0ql94Sbnk5Bbu?=
 =?us-ascii?Q?kB8g8xyHuEUMTf6xnmJxOCuToR63UO4NP5qDiF093JKi5qfLQIVwNqmLrCLB?=
 =?us-ascii?Q?RW9c1n5ZjGGCZavUbrKKG6r11Se0TKya9DPPJiOk5lyz1svNlmeVw5EBzGTz?=
 =?us-ascii?Q?RyT6TEZEgNfGCh/Z2sH+XvrPuvu3Zd0kVELIx5hwv5b+esBoQihO02w8UeK1?=
 =?us-ascii?Q?a2Wm6PmDB6NztnfqwZJJ77CrguH+bwCBTWj9VEvjRe+6CzP8motwWWdMXj+b?=
 =?us-ascii?Q?LeFERGnlvr/NinCbPu2s6NoWi9LmBAefMNnhqSjRsxUITzKOWet+W8XhGUIV?=
 =?us-ascii?Q?E6zt+n8WN3LoDJvviX9D+NxyDIFSsDk3UP8WC0keADeeHIgP6qaBTuH3DQgF?=
 =?us-ascii?Q?Qgvf8ptyZ3puClAd3k7i6bS/dW3PZE9dmhgWouGHdgUhRqkyK8S3m2KxqP7V?=
 =?us-ascii?Q?4r60xCVQUH/nt/+kv+MGO3KOc4xivckTL+5srTGO2oowbWWJrMk/Zu8/Oepc?=
 =?us-ascii?Q?qh8673qYorBwrMPOlVFcblxRZfsQvabB1PAQ4a3JdGA+A5w1Za8BMZeHdaaX?=
 =?us-ascii?Q?On0LqxMBAA4pOdxCh+XGgibv0IScyOyV9+0kgfo3qRrc7aRhXi47Mrp0rM4m?=
 =?us-ascii?Q?YyJc020HgFGdC6sVLIupBVvghMfRMdECasmR4fn7k+v1WOtyd9Pk0NYWiIHR?=
 =?us-ascii?Q?E6zcjJBFyQkTpOcK/jKope79SoOwivclB7CeTUBwq9YDWdn5e0KJOhMCoM+P?=
 =?us-ascii?Q?ljZdGb9O+HYlH2dhIjxQaIT/m/hbTKJRQaUN5Yo/5z+SnnItPxH3GtVPO7VB?=
 =?us-ascii?Q?Z7GD8xfE28V/CO/OnqiXm+rGhtABEkmhq3KzfrOK9PUEMGou2ZNCsk7+/6n6?=
 =?us-ascii?Q?1ecOPddw+H0mWRtcKsPvoVLYy8/vwwiWeu8M6PQHs+Tmmu7kA3n32SX4fvgb?=
 =?us-ascii?Q?oIzagJVZEIV1nNCYIB00pwVQA0MkLpDe3hWzaKoVkgerafdWaaenI/jketek?=
 =?us-ascii?Q?R0+1H3kL32UR9fZcuXyxhZDj0XrOC7Axgm5wuERfKFIpXVNKKyi2y69FJYlW?=
 =?us-ascii?Q?+HIB8EqOD4d7Yv+3HYhYPjPf/x2XE5qGFNgKAuSlS2RyNA0G8n8N34TIw5mS?=
 =?us-ascii?Q?SBPToQbX2L0dwpLhJC3T5pSbPMyZ36YWvCDeZNcqu/9KKFw6lq2hft4UJIva?=
 =?us-ascii?Q?LuiJVk2Zo4zi+g7D9K4oAkp0YYtCC2Og5avYsyHVtbvRDkirv2ZAoTaq2Tc1?=
 =?us-ascii?Q?k7v0BdUMOw=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c72fb5-817f-4446-e8ff-08da3cab640e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2022 11:00:04.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZLELXUrxYEYeIxNWzyTnN7tRlR82pyK0qKxa5WO/pwuDqzQKm0yC/KqwwAzt+6QnUh5hUcg5ICBUsjjgai1vYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3324

On 23.05.2022 12:07, Roger Pau Monn=C3=A9 wrote:
> On Mon, May 23, 2022 at 05:52:17AM -0400, Lin Liu wrote:
>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>> index 933aec09a9..ae029afa14 100644
>> --- a/xen/include/xen/compiler.h
>> +++ b/xen/include/xen/compiler.h
>> @@ -185,4 +185,28 @@
>>  # define CLANG_DISABLE_WARN_GCC_COMPAT_END
>>  #endif
>> =20
>> +#ifndef __has_builtin
>> +/*
>> + * Backwards compatibility for GCC < 10.
>> + * All supported versions of Clang support __has_builtin
>> + * */
>> +#define __has_builtin(x) GCC_has ## x
>> +
>> +#define GCC_has__builtin_bswap16 (CONFIG_GCC_VERSION >=3D 40800)
>> +#define GCC_has__builtin_bswap32 (CONFIG_GCC_VERSION >=3D 40400)
>> +#define GCC_has__builtin_bswap64 (CONFIG_GCC_VERSION >=3D 40400)
>> +#endif
>> +
>> +#ifndef __ORDER_LITTLE_ENDIAN__
>> +# define __ORDER_LITTLE_ENDIAN__ 1234
>> +#endif
>> +
>> +#ifndef __ORDER_BIG_ENDIAN__
>> +# define __ORDER_BIG_ENDIAN__ 4321
>> +#endif
>> +
>> +/* Indirect macros required for expanded argument pasting. */
>> +#define PASTE_(a, b) a ## b
>> +#define PASTE(a, b) PASTE_(a, b)
>=20
> I think it would be better if byteswap.h included lib.h, rather than
> moving the PASTE define into compiler.h.

+1

> Likewise the __ORDER_{BIG,LITTLE}_ENDIAN__ defines would be better
> placed in byteswap.h itself if possible IMO, since it's not strictly
> related to the compiler.

These need to live in per-arch headers, i.e. asm/byteorder.h.

Jan


