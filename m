Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED475431842
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212123.369885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRF3-0002Ra-1U; Mon, 18 Oct 2021 11:55:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212123.369885; Mon, 18 Oct 2021 11:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcRF2-0002Os-U1; Mon, 18 Oct 2021 11:55:44 +0000
Received: by outflank-mailman (input) for mailman id 212123;
 Mon, 18 Oct 2021 11:55:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcRF1-0002Om-Pr
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:55:43 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a217a018-f1c6-41b3-b2ef-5056a1b37cbe;
 Mon, 18 Oct 2021 11:55:42 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-ZZWvwXydMUiNBQ1inxCJgA-1; Mon, 18 Oct 2021 13:55:40 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6671.eurprd04.prod.outlook.com (2603:10a6:803:11f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 11:55:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 11:55:39 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0193.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Mon, 18 Oct 2021 11:55:38 +0000
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
X-Inumbo-ID: a217a018-f1c6-41b3-b2ef-5056a1b37cbe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634558141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rb+fApBEx5UC5Is9TuifRX2UO+t/BM6AlHArKX1Vuns=;
	b=hza2qPJX3r6xsli6Y+YFxtlSxs0/FL/PdmzmtPHCCs63AFwlvjCWVIxJSIq6P5TTIAnMS0
	ygetX1aTngNja03XNdpdgHGYzUPPkhNIWg2l6PIbblc4ZrtaQjCvbzOna/FiHlzvYA566W
	2PyfxYUANjBp+siJQ/019b/j3hSI6XI=
X-MC-Unique: ZZWvwXydMUiNBQ1inxCJgA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hH696DlPey0fEbPTv5DKlbHuj+OJfDzrfcGIZ3lzEeQrETmS4Su7k5va3aXj3MmL6QNdsiTy9tTE7sU3PkuQYpXziBBC7Hdpn/sU0bDgmwiORT7ePjIM2nbHIEM1cJM2uBE+7KGwFN9LBwUWtMfMxp2d4AwJCZ5SaoctiJEysDaXAFjx+2fSegjQl/ETGFE6raKqEuNgCdg7z39p0dnRdpRL3qAxmMYhdnmle0v4xXlTIemGQdlQb9om98PVxwL7wP4eHMTfnoZz2r/Iw8KhhoQguIgpVoB3t8uuWyqi3cEIzULUEo6loG3BCMtC/5rpWRDTGN35e/6bnHrmAuRRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i8zk3t+dfpxnXB7FJdCT7izv/1Zlgb6vKX4NvXTFIA4=;
 b=XP2XJbwKynnh4Wkq6w4rWJhO2SKtPiOBOcDGd1YoTlZDGGw9O+UNewTNRVX948lE8LnRj2fhEv1LfI/uNWDXLMOrZFs8+l5yfwrHe3MzqM42YS4jroM3p7hGtTDsLeOmIOujnkH//EYTFtCba2oPMN6yA0rVawyWWT905LpEo005RPsOEjEhTVwemOBaAm0Vwllv2mqBtC7SD+AhvyTqJI8f8FMPZD6smplZBQZYnGbLMS1hJZMGX2xdZA8g+uIz4Zgoq8Ea67yVk4ui7EpDV6b7P7LPjwKdI7RmXpdYNODYFs+InZ7tl1WSl2UHg6xn5pD+pEc5nRk4kYpwqVfaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 03/12] xen: harmonize return types of hypercall handlers
To: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7bd0cff1-6e88-f8dd-d857-229e75dd2772@suse.com>
Date: Mon, 18 Oct 2021 13:55:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211015125152.25198-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0193.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc021764-0299-46fd-7825-08d9922e3406
X-MS-TrafficTypeDiagnostic: VE1PR04MB6671:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB667196943B762B22D1F33FA1B3BC9@VE1PR04MB6671.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iIS4SfmTszQbpFuIKiJOeGG/CjnlPJtdufEXqqH2ogflPfqXgZx1DH+jwtpiNEu8G1jleMHNBAug0M+7TCYkRAHtm9isYtICtDbnALk7IrH0Ak7BKmgRy8kqEfhGnVGYQHMJsM5+oIWepoDkMotD0uI7IlfwvXFtXnwQfsfKVdCNgB9K/UD0W0PWM1Juj0V/j2N3RCAQsm0DNCzhifIYLEl9xWKV0kf4J3rtZuMXiymAhnxu+9FIWurn9UJPGIQzpZETg4ZHQso+XRTGtlBqp/GhCCAGrKF/U1g8yEXgomFrqPonXL2WtNBRa2Yij02idS3Cwc3qvGIOWNHs5+Nag2iFF/Ut1RyJUe+Gbuwt5FVCAkFBTsfTIRdT8H4J4JPdn842Qn7mW272Bt2NyqhlVA6y3/1xpDhXVUCheOTrVtkdH/ojlhJj+gbLbLpiX86mK6ZcN4c/i6/sE9OMWfLIe4q8/p8TqVwwm5QGexmltVlF/kuLxwZcCSXtIWsr2Noq0zTUTwE2fNELqrhf+W4Ee7pgGyAdI5mmCshT3dMcar3s+Nl1XZtxXDXaYUvNZ9TLmeWS/zHg5lVEqb2WGicMW2g9lMkgGKwVXYhlT2AzvGCS0Mhuo6UfnQ0db29KRMeAnjZAiqZWEyF17FixpUAuXHpPIkNaLjhEYKjA1T6JzXeBOiwWaGRmpoe09BIKHIRTYCvuaWseStjACcjhJ3At4AKLKhWEVj5sT1SZlB96gLfsmWMLg2Q9KQcfOc/PxpXx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(53546011)(5660300002)(4326008)(6486002)(83380400001)(38100700002)(6636002)(7416002)(508600001)(8936002)(2906002)(86362001)(31696002)(66946007)(16576012)(31686004)(66556008)(36756003)(54906003)(26005)(66476007)(37006003)(316002)(8676002)(2616005)(186003)(956004)(6862004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pvtOB5VwBn27rrTAGomSms54Hz8ZPWXDlSaJsR+bK1pXbGhlsfVBksAmHl9w?=
 =?us-ascii?Q?JILH9DAKf1GD11RN6twKOdm0QYYs8XFam61DWFiUgOfRzZPgPzdqqo2tPYjf?=
 =?us-ascii?Q?lQ5QwAMiNEXK3aa9SlMcYm7BMgD0T6EQ+81LsMPiKo7JPLbTZzHbBeZdaUcG?=
 =?us-ascii?Q?BP4zjTKRCNjtnCoul3pd2XxfqDGosptG80a6mA3Hy/gYIul/gPiX5KZxqY3d?=
 =?us-ascii?Q?6fhuOK7P8FI1zBQGqvqSEEhQpM64o9wHqurfE6O+r7hg+Bsp9qfQzdm6lMpF?=
 =?us-ascii?Q?PxGRCrw2J/ci91JjoUa4r3fpFCODyY4MewCCaYwyLiQ0YkHFdVWAIWpeVjO0?=
 =?us-ascii?Q?PwcmD9tNsjjjgydjFADvVv5o8gIV54BEvRMg65b5ImwD+JeBECLIUjtb15mB?=
 =?us-ascii?Q?AtSkENmngiyyIT0uIqBqWUSn1wQ/msIArG/YrgX9DznAtfj2+BWjnAqPw9zl?=
 =?us-ascii?Q?7/jiP/xtFgIx+zmLl93cFAzDiW8kjLioVpYqj1coI5Cerenyt9k3KE6fXkqv?=
 =?us-ascii?Q?NZn5YHv8Oa5j0AG86dsWwAndoIedGMDUyQh5me+RD1clLYNnAXRcKu+fd9kR?=
 =?us-ascii?Q?17FP1VvEP9SLY0RqgxiW6e/ShQ6ass6nNkWNzj33xcn8mlYScn0IPoYKKtDc?=
 =?us-ascii?Q?wNnRDvWO0tGQTklNgOErpBFTJPuDOVKS2aZII1Euz1oQc5wobO7KqSXwwmOq?=
 =?us-ascii?Q?YehRnuMzv1Hj1Ie6ykhdHavR/bAy9KeKZFj0kAcs5pGATRgukiJ/8DemhEO1?=
 =?us-ascii?Q?eNJvz8tIb54mGaiGkHMTfkCHx4aJUw3ChMSSqpEi7qLVcpo3XJBLrEXYNWIu?=
 =?us-ascii?Q?/ws/1pmY4RDEOJWPId6X5gmX2GxeZgp5Bpzofa3dY2p+F5pptISOluQHRtfT?=
 =?us-ascii?Q?kq5noHMM1uYiuifgQfDEPQ8W0QsKFSb2iKoIMzm7mzGXeSdqg/r2ZwCteASE?=
 =?us-ascii?Q?2/TbNIWvGuXIX/JIpLweMSFByxF/u8iUNQs4nU1R0GGw3UkpLOvWuK+pwqV8?=
 =?us-ascii?Q?EHj8BePFm2a5JwR8T0PNGRSru18INlgXfLS2LWSP9RWg+p2M9unsauum27dH?=
 =?us-ascii?Q?k2+7ztxS3n9c3KYLb8GmjYYDBNntqFidvQFyWiCqThljEkpD+BbCWUse5d4x?=
 =?us-ascii?Q?7WGYiDXDytaJ/+tUgzVVqwrsoYtoTe6nYPfqjrD8SOjNnp4F67MxggNcRH+n?=
 =?us-ascii?Q?2T0/7FHHg5w+JA/vIsF79nkK7Hsv9Gk1BlPFk9vC3n/oPH/v7aPya0EWZJQm?=
 =?us-ascii?Q?n2VFzqDs1dzOBDiKYn+fJaJyJi3R3NSfakd9ynab6mwNu690OE7odYif9nLW?=
 =?us-ascii?Q?FYOS+Ad0siF2+fW0IV/K+Rig?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc021764-0299-46fd-7825-08d9922e3406
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:55:38.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFNPv9eOaWkFpdigMFh/y6qE8gjKAbCmp670JbK4VBC516uyhozhRqxizn7FcbuQ1MM6xVhs0LHpgBV71wpNSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6671

On 15.10.2021 14:51, Juergen Gross wrote:
> Today most hypercall handlers have a return type of long, while the
> compat ones return an int. There are a few exceptions from that rule,
> however.
>=20
> Get rid of the exceptions by letting compat handlers always return int
> and others always return long.
>=20
> For the compat hvm case use eax instead of rax for the stored result as
> it should have been from the beginning.
>=20
> Additionally move some prototypes to include/asm-x86/hypercall.h
> as they are x86 specific. Move the do_physdev_op() prototype from both
> architecture dependant headers to the common one. Move the
> compat_platform_op() prototype to the common header.
>=20
> Switch some non style compliant types (u32, s32, s64) to style compliant
> ones.
>=20
> Rename paging_domctl_continuation() to do_paging_domctl_cont() and add
> a matching define for the associated hypercall.
>=20
> Make do_callback_op() and compat_callback_op() more similar by adding
> the const attribute to compat_callback_op()'s 2nd parameter.
>=20
> The do_platform_op() prototype needs to be modified in order to better
> match its compat variant.

"Better" in what direction? So far both have been using typed handles,
which I consider better than void ones. You also don't seem to have
had a reason to switch e.g. multicall or dm_op, where (different)
typed handles are also in use. So I wonder what the reason for this
change is.

> Change the type of the cmd parameter for [do|compat]_kexec_op() to
> unsigned int, as this is more appropriate for the compat case.

The change for the compat case is fine, but for native you change
behavior for callers passing values equaling valid KEXEC_CMD_*
modulo 2=C2=B3=C2=B2.

> --- a/xen/arch/x86/pv/misc-hypercalls.c
> +++ b/xen/arch/x86/pv/misc-hypercalls.c
> @@ -28,12 +28,16 @@ long do_set_debugreg(int reg, unsigned long value)
>      return set_debugreg(current, reg, value);
>  }
> =20
> -unsigned long do_get_debugreg(int reg)
> +long do_get_debugreg(int reg)
>  {
> -    unsigned long val;
> -    int res =3D x86emul_read_dr(reg, &val, NULL);
> -
> -    return res =3D=3D X86EMUL_OKAY ? val : -ENODEV;
> +    /* Avoid undefined behavior due to casting an unsigned long to long.=
 */

Nit: unsigned -> signed conversion is implementation-defined, not
undefined.

> --- a/xen/common/argo.c
> +++ b/xen/common/argo.c
> @@ -2207,13 +2207,13 @@ do_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PAR=
AM(void) arg1,
>  }
> =20
>  #ifdef CONFIG_COMPAT
> -long
> -compat_argo_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) arg1,
> -               XEN_GUEST_HANDLE_PARAM(void) arg2, unsigned long arg3,
> -               unsigned long arg4)
> +int compat_argo_op(unsigned int cmd,
> +                   XEN_GUEST_HANDLE_PARAM(void) arg1,
> +                   XEN_GUEST_HANDLE_PARAM(void) arg2,
> +                   unsigned long arg3, unsigned long arg4)

Strictly speaking arg3 and arg4 also ought to be unsigned int here.
But that's perhaps for a separate patch at another time.

Jan


