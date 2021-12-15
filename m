Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAD4475455
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 09:35:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247230.426265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxPkI-0003Tb-Qf; Wed, 15 Dec 2021 08:34:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247230.426265; Wed, 15 Dec 2021 08:34:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxPkI-0003Qj-NV; Wed, 15 Dec 2021 08:34:42 +0000
Received: by outflank-mailman (input) for mailman id 247230;
 Wed, 15 Dec 2021 08:34:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E5lv=RA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mxPkH-0003Qd-9k
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 08:34:41 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d78476d4-5d81-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 09:34:39 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2050.outbound.protection.outlook.com [104.47.9.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-95-IjKZ8NlaN7ix_0e6n9g-1; Wed, 15 Dec 2021 09:34:37 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4384.eurprd04.prod.outlook.com (2603:10a6:803:6f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 08:34:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.018; Wed, 15 Dec 2021
 08:34:36 +0000
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
X-Inumbo-ID: d78476d4-5d81-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639557278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bHjquGZBxT29+rV3DyLXhP66ZZNGhOFNu6NrVqAHeww=;
	b=lhw8u6ps4HJp5XiE2IiLo/0pRTZydRAsja3z/uYfxdaBX8NWYDCqIcmd/wXXBpirNQjbn/
	SkJ4LIL+F850NRE3I3LCC7io+9YX+MjL83Ed5PQdyUhdEfuLTOHcTZX+6p2ccze2NEmBpf
	+7rccGZmkvdCRAVLHSXMiRyGNekyV+M=
X-MC-Unique: 95-IjKZ8NlaN7ix_0e6n9g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnAZ5Gbl4+Q+1dJ06x6pxShyR5rjktq1GZXcQZfLSSJVIQAgX8XQLvXCQ8HosiwRqpvwQtS45sGTcoVaIGe5TCYpg09m5HR4i2iJ7l5r4zGaJIyFIMKmjayuJNJUQpxnc93PrlpWjzJZQQDka2HlZleWQIrhgwtYzvOddVhHsccgH+5GxtaFSPQiB4h+8NavaxCAP9PhFZ6ADHwoQDZyXWGqNzeQaoeJ77wYcj0VJMtzXAKA/bVcNXm9uVe+EKT2v/1TsrlJJ482SSeBkbJu/im5KnvXl/H5vdFTBG9B/cExeOiHsCT3NnlY9y7/+I9/BE2kd43bX6k2A3iSsLk+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EntNobZw59qZauAyRBO6b0T0b+lzqTdU7cIWKa5tkNE=;
 b=mFSBe7zA2B/BglHEXJjJQkZhDBropXb6HaymfbAPHuvWWbIuFzTRqtuXBR0LC+9/Uu+U0ue7xHeogOusTh0qAg/NNLpl55BbWSr57VCF7JWSFW5tVp4AHdO0rJxOqR6FYzyx+40M/p0PutThXxTgXCTCqZODBUbdTOlIZ0CST00ZajYDgzp3rczDL06ERWaG7+Q36f0DqTcxwDwlfbHt7b6x4sfa+/XPImnltTROGvf+QtMT4U07uC3yorrZWou5Pj+r22/MLQKW5kqOE1fdRJD0lyh3di+ZknIPdVA+xqYBGCd/Y+UNtRtAZjjygAhrWJM6ZSoG+dkZcOi27K2kJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b187ef25-bbfa-1880-0a10-462c2ba64e72@suse.com>
Date: Wed, 15 Dec 2021 09:34:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] x86/cpuid: Introduce dom0-cpuid command line option
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211214211600.2751-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211214211600.2751-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0048.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d4fc218-d32c-4678-d8ad-08d9bfa5ba17
X-MS-TrafficTypeDiagnostic: VI1PR04MB4384:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB438471FE5D1CB9980FFFCE52B3769@VI1PR04MB4384.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PdV/scv4zMZrEJe9n7ZWforVwd66H9bp9tGtl9EzlpAmn/FJkSf8rBxWq/HVoBorCk+8psdNRJ9B9W744+Os/R3ISJeHelclEtcXaGcU4uR17Bz7dpKscyUIsHX9h+2Qdwa6RUi+cKB504flEUBoxYcNj6rOIkGMyVMadSFKbJub8rq+bFN0c6St8LdKWcuI6ax8ahCjB8kgdgzBWqA3HnW22G+2ZDlguqSEJ396GO/uT0zp5j3SiJaknW4nFIKKackiG5gnFWnGgBsHiOB2YOUlQghI4/3VCVoonmGDdP+P5s0sT9WAuvxKIG4HdOYZk4WffPm8dmUp7u4RRYKXIF0tEoHQXi1ql3DfwFgbT5GivSQI/kz0F0nsBIIGdJX9qIPLGfvCDy48P7gYCatzL8hR6chwpMBGRe2t3k7un9RetVHDVWOpSs1842Ja21dW0ITU2rhOygbC6W/eHxCGtfYch5++CezA54W3rvUmD/lCjoUNggoLgtbGdphXBZNVUlhyRNmo7Q39jhSvvesUez4zZTjzcmfYUqv+Rt+dnSx4aOP3YU2gmDfB/N+xJIJrxtEWBYcZ+ML3kLi5r0MH4r3+7PapznO71/W0PgV8GEOWN396WXkR8ANTYcQSU5arG5BFUg5F9dhWntOSWsarAphD9ISB8EQ+A4zSoWwW4ANYbV0BjwU0XB39eTesHP5pVOr+7AYjRMCPIHcAI+E/ca6Kdk3h+v7igVfO6r6c4H6PqNqsaJysLEk/wRJLn2Wl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(6486002)(83380400001)(186003)(6512007)(26005)(53546011)(6506007)(31696002)(5660300002)(2906002)(8676002)(6916009)(508600001)(8936002)(66946007)(2616005)(31686004)(54906003)(316002)(38100700002)(4326008)(86362001)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2BRiXN/UWeVxzHr0GhjhkmnPEFrbmVAUzpbWt1zl5nGgYqAwYMFPJMONfNcN?=
 =?us-ascii?Q?k6/R5OfaH0rFZOveEfWQmMGfjDWaqehbLta5Rzrg265D3fj01maoDisDfqBq?=
 =?us-ascii?Q?abqzc80PJWydC3ppDyvlsqgQ9zyhQsaRSv87DuMT4u45utAOIvwZ24VU/pxq?=
 =?us-ascii?Q?gdv1eFSnFSZEHpE7JQFIudYlehzkelUsdrl2cUjKAZXqmXboGRDVSR7GFgo/?=
 =?us-ascii?Q?vIXGTJQhDepFhrJPeu7jIHWt9fPOZydCWorp92mdw0XZdCOoiBkB7FccIGEn?=
 =?us-ascii?Q?4INCdC251AX/DnhO3IBAKumILvlSkwFOi5Ag7FLaN/ceSpHToTGX+efp+dXd?=
 =?us-ascii?Q?VG7ADR//wpUQdj8NQP1qaLW/K6eJAnUwjBGz8K8X0mlqD+AIcn2fKhC6W+oM?=
 =?us-ascii?Q?p0oarMqpQteSlM4q10Z4XBM0bZB7A6J7dOfvqJJq5kGdWJO4Fu9AjeOu8igX?=
 =?us-ascii?Q?Ay/AolOE1tSJW8edKfp2QwKNudQ70cRblHr8TAGxfFOvswZ1KxG2/tCTXhay?=
 =?us-ascii?Q?NL6PhhL2XcNFrOtuSCpMEGfmpdUKgkptr+/lfOjZL42PaNAWlh/x8oX+L5n8?=
 =?us-ascii?Q?6jag/YVKeOMPE0vEbTZMZU9qewxcJ59wET8oveHRuVZl1MuPi/mjAkkQQ77K?=
 =?us-ascii?Q?ol9xIMexGJSFo2rwEOLjz9OALf4taVM5zFPdKDsqgHtSXWH8TlmKv/LP9jNi?=
 =?us-ascii?Q?0VKocFV9oKM6YDnG4wotztyqRy6RtS8Rv+Es1spHVHQPkIxYymUTxnFCWL+0?=
 =?us-ascii?Q?XivNXjxQxj6EMhQsDmMKaz33jYWtS9ZuNYyz+C2Th1tuKawdbzMQWo7Ameme?=
 =?us-ascii?Q?y/ZooaM05uEsGRj1dHxCTItE/QB5FZN5h0t93GfCbKEt6gxknCEIue4ViYOK?=
 =?us-ascii?Q?99qpBnDnBM/W4OmtWOF6nxhLuV109CNTSiM9coYzBhGkL3mxKif1am3D78nA?=
 =?us-ascii?Q?Caz+KwYNxAhUMqCF3StDA68XfX8SsNGBJdhniaL43PoTNAz751mme8Bb2ki5?=
 =?us-ascii?Q?UPvqUX651XOktCan+IBxZ8ZKHR1y/wUVfpTWFHgo7AvyhhLcHYczHuCdPAd1?=
 =?us-ascii?Q?twmaDn2N7asg3nRFsYKDeoqT8mDc8DLfTxp5CPwo1a1N5L92OdyWBcMTQGo3?=
 =?us-ascii?Q?LSIcnhp9rBqIyDxp8iRnJvcQCBjr9Ntv9eSXsaeiy0+7+kOskhP3l0vdJbK0?=
 =?us-ascii?Q?/D9WfAQ3h+IA5PwuSK1bYlGMlPwlVre+VmJIn4MEqIG7KMsDruslBR2LtRNL?=
 =?us-ascii?Q?T2riENRDIf7XwVwhiw3v+dxKVAnw/5+i8Eb0QYtQwCgnOAkvpovyR567V43m?=
 =?us-ascii?Q?A14ltDQRwB9v+yNtR/vM/nmRXmEa/tu6uzt6DsTtmJrZPt+diq+uSbkgN+8u?=
 =?us-ascii?Q?ZbONEDdD+hc6eVyGE0lZ6pHsimEg/FJEVvwhvEK81B+BYhgd0+8vXjAwrps8?=
 =?us-ascii?Q?p7xd1zcrBDJmGHmy6kkzRKW4M3kfRbKQ0H304MEIso3Sa6yaj/hzUVDqqJ+z?=
 =?us-ascii?Q?nfZc1rnHcD+XEKpFK2f9fJsxtnfCFOd8pLhhvHhkWy5QpyyQtuwEny+swn7o?=
 =?us-ascii?Q?KlhmkU1qfrvCfJYxXBn1A2t0vD9xP/A7CPqnql/IRU7reN0rfF+ZcVrU938w?=
 =?us-ascii?Q?od/waeSnS5nNqz9TP/w1aoI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4fc218-d32c-4678-d8ad-08d9bfa5ba17
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 08:34:36.3938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NinluKVxlqWCVqBc4ZOhA79MOJdd835SNUjrrirf/vRS6oYhB852OWYVbR/p1uH1qOUGNCEFs6EQ+oUN2VRPAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4384

On 14.12.2021 22:16, Andrew Cooper wrote:
> Specifically, this lets the user opt in to non-default for dom0.
>=20
> Split features[] out of parse_xen_cpuid(), giving it a lightly more
> appropraite name, so it can be shared with parse_xen_cpuid().

With the latter one I guess you mean parse_dom0_cpuid()?

> Collect all dom0 settings together in dom0_{en,dis}able_feat[], and apply=
 it
> to dom0's policy when other tweaks are being made.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Daniel Smith <dpsmith@apertussolutions.com>
>=20
> RFC, because I think we've got a preexisting error with late hwdom here. =
 We
> really should not be cobbering a late hwdom's settings (which were provid=
ed in
> the usual way by the toolstack in dom0).

For ITSC I think also covering late hwdom is at least acceptable. For the
speculation controls I'm less certain (but as per the comment there they're
temporary only anyway), and I agree the command line option here should
strictly only apply to Dom0 (or else, as a minor aspect, the option also
would better be named "hwdom-cpuid=3D").

> Furthermore, the distinction gets more murky in a hyperlaunch future wher=
e
> multiple domains may be constructed by Xen, and there is reason to expect=
 that
> a full toolstack-like configuration is made available for them.

Like above, anything created via the toolstack interfaces should use the
toolstack controls. If there was something dom0less-like on x86, domains
created that way (without toolstack involvement) would instead want to
have another way of controlling their CPUID settings.

> One option might be to remove the special case from init_domain_cpuid_pol=
icy()
> and instead make a call into the cpuid code from create_dom0().  It would=
 have
> to be placed between domain_create() and alloc_dom0_vcpu0() for dynamic s=
izing
> of the FPU block to work.  Thoughts?

As said above, I think the ITSC special case could stay. But apart from
this I agree.

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -801,6 +801,22 @@ Controls for how dom0 is constructed on x86 systems.
> =20
>      If using this option is necessary to fix an issue, please report a b=
ug.
> =20
> +### dom0-cpuid
> +    =3D List of comma separated booleans
> +
> +    Applicability: x86
> +
> +This option allows for fine tuning of the facilities dom0 will use, afte=
r
> +accounting for hardware capabilities and Xen settings as enumerated via =
CPUID.
> +
> +Options are accepted in positive and negative form, to enable or disable
> +specific features.  All selections via this mechanism are subject to nor=
mal
> +CPU Policy safety logic.
> +
> +This option is intended for developers to opt dom0 into non-default feat=
ures,
> +and is not intended for use in production circumstances.  If using this =
option
> +is necessary to fix an issue, please report a bug.

You may want to state explicitly that disables take priority over enables,
as per the present implementation. Personally I would find it better if the
item specified last took effect. This is, as mentioned in other contexts,
so one can override earlier settings (e.g. in a xen.cfg file used with
xen.efi) by simply appending to the command line.

> @@ -97,6 +98,73 @@ static int __init parse_xen_cpuid(const char *s)
>  }
>  custom_param("cpuid", parse_xen_cpuid);
> =20
> +static uint32_t __hwdom_initdata dom0_enable_feat[FSCAPINTS];
> +static uint32_t __hwdom_initdata dom0_disable_feat[FSCAPINTS];
> +
> +static int __init parse_dom0_cpuid(const char *s)
> +{
> +    const char *ss;
> +    int val, rc =3D 0;
> +
> +    do {
> +        const struct feature_name *lhs, *rhs, *mid =3D NULL /* GCC... */=
;
> +        const char *feat;
> +
> +        ss =3D strchr(s, ',');
> +        if ( !ss )
> +            ss =3D strchr(s, '\0');
> +
> +        /* Skip the 'no-' prefix for name comparisons. */
> +        feat =3D s;
> +        if ( strncmp(s, "no-", 3) =3D=3D 0 )
> +            feat +=3D 3;
> +
> +        /* (Re)initalise lhs and rhs for binary search. */
> +        lhs =3D feature_names;
> +        rhs =3D feature_names + ARRAY_SIZE(feature_names);
> +
> +        while ( lhs < rhs )
> +        {
> +            int res;
> +
> +            mid =3D lhs + (rhs - lhs) / 2;
> +            res =3D cmdline_strcmp(feat, mid->name);
> +
> +            if ( res < 0 )
> +            {
> +                rhs =3D mid;
> +                continue;
> +            }
> +            if ( res > 0 )
> +            {
> +                lhs =3D mid + 1;
> +                continue;
> +            }
> +
> +            if ( (val =3D parse_boolean(mid->name, s, ss)) >=3D 0 )
> +            {
> +                __set_bit(mid->bit,
> +                          val ? dom0_enable_feat : dom0_disable_feat);
> +                mid =3D NULL;
> +            }
> +
> +            break;
> +        }
> +
> +        /*
> +         * Mid being NULL means that the name and boolean were successfu=
lly
> +         * identified.  Everything else is an error.
> +         */
> +        if ( mid )
> +            rc =3D -EINVAL;
> +
> +        s =3D ss + 1;
> +    } while ( *ss );
> +
> +    return rc;
> +}
> +custom_param("dom0-cpuid", parse_dom0_cpuid);

I wonder whether it wouldn't be better (less duplication) if the bulk
of the code was also shared with parse_xen_cpuid(). In return moving
features[] wouldn't be needed then.

Jan


