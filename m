Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE924908AE
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 13:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258160.444274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9R7q-0003qt-1n; Mon, 17 Jan 2022 12:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258160.444274; Mon, 17 Jan 2022 12:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9R7p-0003op-Ut; Mon, 17 Jan 2022 12:28:41 +0000
Received: by outflank-mailman (input) for mailman id 258160;
 Mon, 17 Jan 2022 12:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZUQe=SB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9R7o-0003oj-Jb
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 12:28:40 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffe33f79-7790-11ec-a115-11989b9578b4;
 Mon, 17 Jan 2022 13:28:39 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2056.outbound.protection.outlook.com [104.47.1.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-OeFNjSnZOKWq0_8i6fR6vQ-2; Mon, 17 Jan 2022 13:28:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB3PR0402MB3724.eurprd04.prod.outlook.com (2603:10a6:8:5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Mon, 17 Jan
 2022 12:28:35 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.013; Mon, 17 Jan 2022
 12:28:35 +0000
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
X-Inumbo-ID: ffe33f79-7790-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642422519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AvZxWpmaRWj0+6dErva5UGvHDP2syDbguv9eZKqCvxs=;
	b=lasBIHpD6Cl10h9dUZI825/faa7YCjnKgiUMiOEQ5L4ueDegxEj7aSov8vNwBjcjuzqpqe
	W5ru+14SNBZtBbrgjuCWnKgMJO/EKjpXrehCLvtKb3QBX9UH5Ybb69LWwZd/9DvtvacHYJ
	EidEgXdX9ibsMV15IFKMTer/sykP2nw=
X-MC-Unique: OeFNjSnZOKWq0_8i6fR6vQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUeCcl/Dh9Ncuie2wrWgAOCJKGK18EiXXWS9oxcNv+kgKY5ArQ3vRR6Etg/5FDqgB52iSNgrvC+iNdLERtLrjiDMfm6Dml03WB7WZCxwGWIvViUCw24uxlK6K0Nydie7MwZb7yiUWtwJxgorV8K7N/tn0lBwe9L5z5bf6mXDFS24IlyO7mC0qU/zrLUz4cYvhAxKZqGIfPugo6JOZVhOLTdgUpcdGIjAwQHjHWPKPHlAgL133zmkWH5doRru2xCXumgUvM9stsEMjYHMz75JerIc59UFMtOH0ndZ9mzMx1Y+0c+Fv63OrRK2aR3HdRbMmbpn0fCNtL+IGTfwQdnDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtWZEOfJ9AiHdhqjH4nGoRpCIwysbRJTTeRjHzakYi8=;
 b=AmnCHRKVjXVxdAft6Q/razNAf03+R2DnbRbVG4hDzhTt3wDQU4NOSF2x5QAMWjjEx+Fm3F5MI500q2cpbmTRlR8lbSzeuZ3BuD9oU37U2Vh9cFX6EjIaGQl5ekdNJS3IXb21Lbbuxeg6yQto0ZT2Y9rKGd3FRU9gTJPIEH8HAC1MX6ojvGVGqzfipXCOUDkSzxovbUaQtcizOHfF4lDBrVB2H8Eu/rXQWA9n0bu4Vjp2vCTB33ctWXRCCc7E/IcsE7msCwGll5jJE74Fi2dRuMxLUAVoQYxD8F2R6s8Tz08BEV6SlOs/qgi2tvb2OSVhoDcojPnD9llk0UKP4vb1fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eaa3e8e5-3793-78c5-2c29-ec043bad0d0b@suse.com>
Date: Mon, 17 Jan 2022 13:28:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 03/12] libs/guest: allow fetching a specific CPUID leaf
 from a cpu policy
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20220117094827.16756-1-roger.pau@citrix.com>
 <20220117094827.16756-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220117094827.16756-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b21ace1-135f-4cec-c4e9-08d9d9b4e190
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3724:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3724D23F071B6BC914EAA4C1B3579@DB3PR0402MB3724.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UdGuPtjDVv077YY30kDu+yrv1Z7am2HSmECkISxSJRDX8MASNt8meI4clBJQtCrY7GoLcRg3HcSMJYp0pEwL3IlHV2V/hDIOlZQWpBIChnFCQ6DHDJpU867av1rxajywMXgekh8KBgAkLvOQ2Mg66hqFJ93QZc2nVneZWKWGNZpwyO40zu5Ld+XDq4I/1uJYH7lEM9uQH3IcEzHglhtiwj619wrU9UqsW7+ac5hQ6n4qMfif4nmJdaUHJwjrTX3pOM8lggUa4jNUxkVCNWXl1KkkyApYa+7vdQXzuFvWQ+ubWo7TbtVnP9ThoM4saMIdJviR6VsvL1h5MgB6HzMTB2Fzo/CHikmmjubrXCdKovI1ZCytM52b/GuNRmOcUxhYoca2q+7wwrOHYmTHLgMs5zcq/Elo0cGG2q2qIFTNr1h/I5XI27l8k9uiLoLOhh1tUYPaZNnjtYZbzcjM7KmIneqoC55XfCw3lbPonzNOFa6zlkjd47bvTJjWiY9AxngUydafMQ1bx2iOjP75uAv0grZ+DEBRPcxvq4oBE6Au8vp9O4QVH/EtplAh+YwTzJewKluL41/13BE0dPKFHv1IgeFdnKU2QnZoE3+Nd5ZGNyRP8KEqncjvMuKTbk8fNn3q8sPzbVhxKAH7Srmvx5tkS3xCYPoTPlGTe9kmryX6F80QTfrCDyEBZn7WecoR6EFkdZ9P+5tVi1vBetAJ2VugDx2VmQjCz6tabeJvG+bvhmk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(86362001)(31696002)(508600001)(6916009)(6512007)(8936002)(6486002)(83380400001)(36756003)(5660300002)(31686004)(38100700002)(54906003)(6506007)(2906002)(316002)(53546011)(66946007)(2616005)(66556008)(66476007)(186003)(26005)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1MzVH4uMP3ZuWbDg05c7U4nbUXDz3zsKkDu80S72TJX71HoILiMqIoerM0+?=
 =?us-ascii?Q?YTHDbk8mvosS7sSNhT+SXMtEm7Zmo1QCWPmfqKLp42QYyD3Bh3TkPoFTYK8E?=
 =?us-ascii?Q?fl8lowpn4cgd990gmCCCmi09WYcxdOCcNW3wSKoT8xK7naXI3mICLDrW9GDV?=
 =?us-ascii?Q?lhOXGp6VydOnyf+GqWwshGIMmwXKXfme+O7o8d917vDOgLDP9pZtvPXBMgJm?=
 =?us-ascii?Q?z2khHijDNZcPJOk5b0s47Gncu0sPA/WqpXNxZgQg5piVaaGYH0yhgXHHAIZZ?=
 =?us-ascii?Q?AykXWF9ye3gJexOBYslJMkY9TkuLk78z/JBs6mwNgqqLw8ilXn9akTfGtbr4?=
 =?us-ascii?Q?EfaxE0XSXuDB/x7/1KJuMstCuECk7kHgrEEqdpu+DM7KmW2akrXN0EhB/khb?=
 =?us-ascii?Q?lBu24yPzIqsnZ2oWoqXPCJiTdZNhdJMTFxPZwIXAwtq7oP6geFSFe/SsIbRb?=
 =?us-ascii?Q?uSO1URjRcxezVDhZybfPZg02i8MhriUOrl7c4/1f4rkjGxwMXAerI3aGC0uf?=
 =?us-ascii?Q?06muN518sI2ZArM8QJr2kV0WiEXlK2l35tUhWMqgSUPC9Ouv3SYPTtHUTtb0?=
 =?us-ascii?Q?J+B+DS8kyzFvkd7YjxxvOSw5f0j9btLY4YesJ21GaxAXHIWDwKOKQ8yGwK5s?=
 =?us-ascii?Q?MSzpBvK+vB1/Jxk3ByTeZU1uxbVQR0aaAHxjM2Guor4W1xK/sDTmauMdky/y?=
 =?us-ascii?Q?yIadrhrNkdK6Ko1ug1TlQLo+sIsN57O78kpJTx+nRRxZYcfR3AKsFCueQquw?=
 =?us-ascii?Q?+eER5nHgD2umdtO7EnbslpT4DJN8u/fBoNV0Siu91woiXAGma4klc5ksjvSg?=
 =?us-ascii?Q?Kgl/0n1OWQso4mVKNxBrVd6JKHIo5PjZvlcualAbsqV/gBP/OsHncPX70y+P?=
 =?us-ascii?Q?UcyHeMdi5WO0eAMTfDf+qWiUHNuXxeJKmLFHN02DWgVo1Kj8Gw/yr4S8jUoF?=
 =?us-ascii?Q?0djljb4H4eFxUorrKTqxlAGeGntC7kCvyNTw7JJcemTeMHdBXnKrfT0+tzbQ?=
 =?us-ascii?Q?8gP6a4BrSBjFubCtMt733KnTem7GLf5SBCfjZl/8PGN02/bxRC1GmndfTPe/?=
 =?us-ascii?Q?QgNttzkEwBuk1wkXXm39p8139zl5j7cgUPhJGJ7Cm/bcKhFT57Q3+JPVwESy?=
 =?us-ascii?Q?ZTS6BrvBwawT6VkIRCRs115cuPuB9n/UkvExRqj2QgYk1GQjWx+JFlmnNcQt?=
 =?us-ascii?Q?AZFDiRde1aTnHLcTL2eJJ6szwkr8GCODbBVn4600zjJp+lok2wXQbZOh6USG?=
 =?us-ascii?Q?P0QLE22IUwcw7+zo+zAsoF/trzvcTZ5f6lbX6WF1fxsHavwv7Vwwdq15dSgx?=
 =?us-ascii?Q?Dzuq/PBGePgCUwTBUS3kOE83acAgjZmsvah1OfsOdq0+b67mawJs1lPFHUkt?=
 =?us-ascii?Q?hhAdTbprwNlo8627TJjLz9R9W9s9Uctm+8CB35NMmprl0AYN7PC7JkC7TnC4?=
 =?us-ascii?Q?VY+2DHhT/RFUovc2PBJpS8REG9I0O2O1jaNnkyxboBDDSggewHZ6FRCRppTc?=
 =?us-ascii?Q?DAmivKr9+4mZbJYo4754kd3nDYs5Z16SP1GuhfhpROPRg+sG6UdEk4kwaSoH?=
 =?us-ascii?Q?W0hbHJDV1XDIg/2QrP5e2W5e0fyfjH3fW8QUKyJ5Gq7WDp2UuEnqwBOfZa6G?=
 =?us-ascii?Q?L206Iy4Q8I1Hrxm+Fiw/yec=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b21ace1-135f-4cec-c4e9-08d9d9b4e190
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2022 12:28:35.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4oWqQSHi8Eti5AgykzT5NegHd2R8NVOSamDq/G7/mIVDNoLeALnJV3j1D0QQCSO8PDQTRR/b9eor8YgHWb5oQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3724

On 17.01.2022 10:48, Roger Pau Monne wrote:
> Introduce an interface that returns a specific leaf/subleaf from a cpu
> policy in xen_cpuid_leaf_t format.
>=20
> This is useful to callers can peek data from the opaque
> xc_cpu_policy_t type.
>=20
> No caller of the interface introduced on this patch.
>=20
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with a nit:

> --- a/tools/libs/guest/xg_cpuid_x86.c
> +++ b/tools/libs/guest/xg_cpuid_x86.c
> @@ -855,6 +855,31 @@ int xc_cpu_policy_update_msrs(xc_interface *xch, xc_=
cpu_policy_t *policy,
>      return rc;
>  }
> =20
> +int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t *po=
licy,
> +                            uint32_t leaf, uint32_t subleaf,
> +                            xen_cpuid_leaf_t *out)
> +{
> +    const struct cpuid_leaf *tmp;
> +
> +    *out =3D (xen_cpuid_leaf_t){};
> +
> +    tmp =3D x86_cpuid_get_leaf(&policy->cpuid, leaf, subleaf);
> +    if ( !tmp )
> +    {
> +        /* Unable to find a matching leaf. */
> +        errno =3D ENOENT;
> +        return -1;
> +    }
> +
> +    out->leaf =3D leaf;
> +    out->subleaf =3D subleaf;
> +    out->a =3D tmp->a;
> +    out->b =3D tmp->b;
> +    out->c =3D tmp->c;
> +    out->d =3D tmp->d;
> +    return 0;
> +}

Hypervisor style, which aiui also applies to libxc, would prefer a blank
line before the main "return" of a function.

Jan


