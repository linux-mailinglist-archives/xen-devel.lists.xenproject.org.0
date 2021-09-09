Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A98A404821
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182913.330767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGog-0007kE-N9; Thu, 09 Sep 2021 09:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182913.330767; Thu, 09 Sep 2021 09:57:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOGog-0007gw-Jw; Thu, 09 Sep 2021 09:57:58 +0000
Received: by outflank-mailman (input) for mailman id 182913;
 Thu, 09 Sep 2021 09:57:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOGoe-0007gq-Nb
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:57:56 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6764c71e-1154-11ec-b1aa-12813bfff9fa;
 Thu, 09 Sep 2021 09:57:55 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-OeYDtL1-Pza57_bz_DDN-Q-1; Thu, 09 Sep 2021 11:57:53 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB7375.eurprd04.prod.outlook.com (2603:10a6:800:1a8::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 09:57:52 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 09:57:52 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR04CA0141.eurprd04.prod.outlook.com (2603:10a6:208:55::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 09:57:52 +0000
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
X-Inumbo-ID: 6764c71e-1154-11ec-b1aa-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631181474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eEL9qNvSrPO3a2KYULh+dWzPR46hwF5kM/seQC0Iyus=;
	b=LTezPbAnViKKLsoQ/eA7Z4IxGvxrXoSEcTw3kYDDWWVj9ZZexnsrE/P1euzUD8GksV22ah
	nsbyFuIAwW26l6fJX9v6foH3yMbGklDsyJ/HEKM67INF/qgCA7IgxLR9oIEFevuJvGxvLb
	GzxdLOZAzmmsVjLZogFbiYxOGCFm9UY=
X-MC-Unique: OeYDtL1-Pza57_bz_DDN-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9vzmnOWx4dfdCVunZ2TH7Ts+ORsAs533phdQ8czWF/gVnnbCEIAP6JN1X83G9OwpSRu3ERQOfvyn5K0scYZbYQAHACyj8ybrOR1fo43d3Is98iGsQrm/IA0LpK4iOLX9MnKNa6+7pIWUagUcXGW0P9rxYKUnTxrOc46DMfq5PoexiS9vcJ+GpeO60eOs6/AdTtbRfo3fMobFYWfhPpe2REObkSB4QRwH5gt1J/isPK4TCRrywaSWjqli8PHGliJTcsR/QS6og0dvnwhzvYjwi8ZTcL4MUrcSuw75MRUs7rXEArHeZni8hkotAfFI5+l/L/u6Rg+hFILlSLl5RJFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=A86rnhXZOE1JDW4J3/2PB7wdjmEoc211vRmY04sxYjc=;
 b=NVV2na+bWcRJRmjkvgyi9jqTzbjfd73HII6tbJXF3zmrziHCqcV3ENVCAGJ31aXwKQIHqbOGngHRY5woyDAJrec6NKeHmh4xrkSoxmvI+/H1YwL7u5Usgr1s0FnfMaqxixOhJUdgdm/5znMkQk+6lwn3xB0ZIYfegwmzIQ4EzY6IgTZjlRNFYfxcfE9mV39kDCINZ8OAUXF07IOyUiuf1V4caW+ibxNg2QL8IQeGafzVtDyB99oJngTliWAClxxJpjW4nPb+asHLOMBuQCoUe2QRWpH37EruZFA/4VkDMR6aeIeLHr0DnvZm4zxfHXQzaQfq3C9bWv9mNzXBO1nSWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH] x86/svm: Intercept and terminate RDPRU with #UD
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210908161918.25911-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3f272ea6-02ab-8f70-19cf-28a92421531e@suse.com>
Date: Thu, 9 Sep 2021 11:57:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210908161918.25911-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR04CA0141.eurprd04.prod.outlook.com
 (2603:10a6:208:55::46) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 573a0c99-a700-4b48-9efc-08d973784a10
X-MS-TrafficTypeDiagnostic: VE1PR04MB7375:
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7375CE0155D888BEF07CF62EB3D59@VE1PR04MB7375.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	myzAP1Cxp0rTDCvzmEiB9+v0AwE2u9LuCXnIMbDyaJN4dI7Y3m/EUePjsH9igWro9HwOpxJqQHM3pac4GsLOPIyWbs0DEgJbQI6yE/8ihgNZj1mnHaUPT5MwSMMR22kUyi56iis+dj4Sn9OqUmsDYMWnD56pr2p9ka9XnhhBpgV8CNxIc0ALZkUqFUwp6QOmYtKvK2f+YS8ub5J1dfAmdQg7e5HD96CrfiXfGglRzA1pgO2GQKZVVAmk1OvbAPXcNnMU8jVNLv2Hgkm1mzz1o6IgGBRNUoBYgPZIFfnNMgmQnNBV3uBaRjY+C3yh9r8qYUQleEbzuYBl3jYHfqHqEOlx/QUXfpnmRNGmSB13XJkY9sXRj5PSbytrrNFPIWtg9Z+gWokTpjBDDv8CacEJ+snwZ4xddpFokZu+jv87GpUOHOppoxuPXl7sRJ7ErKdfhSvHv6YKkQsEmB2RETrjgLH9g644PvrtuQkO+O3/m5KGCI+8xHgPTDSz/I4TtvZV0w2CH4mZjcFyJO92FVPDTI83wKA9K7Kk2cToZZIIgvHAqw+82pf6jwGaB30SvZxOwrzIeaImfczcqxusbsVfyCsXxleCUdE+4ShhhG2pFayYUIn0BCixg5j+cvieT/i44AwQznZ+yM/QcFVtVN0RsOJ8MUQSbB6z5i3j0IDpdKPT5h+Ju75T6opSg5J4eOyobc0ZcRVwac8PMU5aYxZcsoo7k8ulNmroxgp05zT18ng=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(39860400002)(366004)(346002)(376002)(8936002)(6916009)(38100700002)(5660300002)(86362001)(26005)(83380400001)(36756003)(53546011)(2906002)(2616005)(66946007)(186003)(66556008)(4326008)(31686004)(16576012)(316002)(6486002)(8676002)(478600001)(31696002)(66476007)(956004)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AtKoyOuafpcFb0CYp4jgN/gThEMf8evGjpKIMstW3/FUytEm933aGUWODVi7?=
 =?us-ascii?Q?KqbifIWetXrSm8dUP1xL2GOEE4iy39WZaTTU6XVKqQ9Dpr++wV/vSkeIaSQH?=
 =?us-ascii?Q?ZhIInZ6mwMprMGgGt8cQBrIVpOFqxe0+ZBlHx/8xYiSt6nEYX8VBlf2EOQPh?=
 =?us-ascii?Q?9Gxc1EUe1mTpW4qvTn+Q2h9N9o9w4ZhBSfBi1M/F2OVRqHARun1rLyiFAeE7?=
 =?us-ascii?Q?7YTx39uVUjWWA3p2QHMqYU9JdzeZu8bSftaq+J2MGDegR09TZ6beMJAMFtXo?=
 =?us-ascii?Q?c1d6blvWyvC1ZmtmkN0850MlT4oVxH1jtfL3V6U1hrJNZdA6/USIdU7BneQm?=
 =?us-ascii?Q?v9/Fn3ElW1vAGzzQcQiCUwW3QYd4azpdLhTmXkseuCpcwTiE9dG7I0qY/N5q?=
 =?us-ascii?Q?B3H0FlwTc6BE6jrbxw838J4mdntRvVovjvgB7iwcXMVeLOSpd0iuBQjVEWFc?=
 =?us-ascii?Q?Te7VBiAZ0eTtYB1BCAoGZNT+REKuHdvhT0lGtCnK7IVImyueFUx/M/t1KbsQ?=
 =?us-ascii?Q?4r1FDjF7CE6HTcfbnfdbp78TGVZTVX+CxSQAJue1sJFlamk1XKDE/uzRMSVw?=
 =?us-ascii?Q?ivcqJF1gNvI05ZG6sHkC8jt3tod4GVXqGd+EYraWwVVPpVsB9Rmu3JMs3iMG?=
 =?us-ascii?Q?aw5Aq+kLlbz/DgLNxzRgsenNQxxxvKPcmWl+yRR/SCbbXxdIBhAJMBwoWV1z?=
 =?us-ascii?Q?ALbPfNTaL3imKTgon5YQ1lkzGa0rwzy2oTkBXuX5S9G5ryka8ro8M6mZ3BP8?=
 =?us-ascii?Q?6E6lnCrgoZHMA1YZIODYM+5JIZm/X/eTYvsnAIY1fnpAahPUwTso1pD1lxxJ?=
 =?us-ascii?Q?aDYjsR25HJFRX7yPfx5UstxhOWPIouXdL/A2OUxR9fE2qpV7d03za3Trg1SN?=
 =?us-ascii?Q?EYt+TW8K/NHCsD428TNv/tCoOSNyAKbYosE3bG6WoKYTSCHlWtH/Oriv+MiU?=
 =?us-ascii?Q?xXOVKNIYptQkTnZQk7wC1HBvpN3ohbsbMp8mWu2XbJYw4J23yimLZScQd4OW?=
 =?us-ascii?Q?TalOS95Ij8BHioe83jENGoN2iH9VOomIXEEpFazFFsdQdf5ngmOg5iiQHYaZ?=
 =?us-ascii?Q?LMq1UIVvN+uJ5C7i9vxO0d4oUPXWkYa/rFNhBvMtKXSuL/iR6ERMjAtcnLHd?=
 =?us-ascii?Q?7Td8DrLFkF7+xq0MA5h9jcS6BlAd0fASqwAL3mX+6XDgD8vXojR6v1fXEsBQ?=
 =?us-ascii?Q?YsT0PkUSvX9pHZaos7XB3k02RgzG09Ikmp+yLpODkvGLuo2f5tWppoHy6rV8?=
 =?us-ascii?Q?mRNnCrG0UvrdYqeZ+LF8NgHPoec5RXloJRxMCEhB/Eankb4g5bYWsOfxRYVl?=
 =?us-ascii?Q?n0PD8dKUKI/X7SHhCwLTMcKX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 573a0c99-a700-4b48-9efc-08d973784a10
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 09:57:52.6658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kfeemXsUcyEAWRbkWHRd9m8OqsVR/4eD3c1lzNulpyHCxqcfum2H5xADNt+TYfgy7tvruxXa+JWXoTf3xNDZZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7375

On 08.09.2021 18:19, Andrew Cooper wrote:
> The RDPRU instruction isn't supported at all (and it is unclear how this =
can
> ever be offered safely to guests).

An implicit hint to me to consider "x86emul: support RDPRU" rejected? That'=
s
still in my queue waiting for ...

>  However, a guest which ignores CPUID and
> blindly executes RDPRU will find that it functions.
>=20
> Use the intercept and terminate with #UD.  While at it, fold SKINIT into =
the
> same "unconditionally disabled" path.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
>=20
> I could have sworn that I'd posted this before, but I can't locate any
> evidence of it.  I've got a separate patch adding the CPUID infrastructur=
e for
> rdpru, but that is better left until we've got more libx86 levelling logi=
c in
> place.

... this. Which - if exposure to guests makes no sense - would seem pretty
pointless then as well?

> --- a/xen/arch/x86/hvm/svm/vmcb.c
> +++ b/xen/arch/x86/hvm/svm/vmcb.c
> @@ -70,7 +70,8 @@ static int construct_vmcb(struct vcpu *v)
>          GENERAL2_INTERCEPT_STGI        | GENERAL2_INTERCEPT_CLGI        =
|
>          GENERAL2_INTERCEPT_SKINIT      | GENERAL2_INTERCEPT_MWAIT       =
|
>          GENERAL2_INTERCEPT_WBINVD      | GENERAL2_INTERCEPT_MONITOR     =
|
> -        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP;
> +        GENERAL2_INTERCEPT_XSETBV      | GENERAL2_INTERCEPT_ICEBP       =
|
> +        GENERAL2_INTERCEPT_RDPRU;

Some of the other intercepts here suggest it is okay to enable ones
in the absence of support in the underlying hardware, but I thought
I'd double check. I couldn't find any statement either way in the PM.
Assuming this is fine
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan


