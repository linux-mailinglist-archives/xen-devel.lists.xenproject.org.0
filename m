Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2A24721E5
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 08:47:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245857.424124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwg2n-0007Sc-J9; Mon, 13 Dec 2021 07:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245857.424124; Mon, 13 Dec 2021 07:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwg2n-0007Qp-Fl; Mon, 13 Dec 2021 07:46:45 +0000
Received: by outflank-mailman (input) for mailman id 245857;
 Mon, 13 Dec 2021 07:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RwxN=Q6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mwg2m-0007Qj-0E
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 07:46:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d00953a0-5be8-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 08:46:42 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2053.outbound.protection.outlook.com [104.47.9.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-19-WnM68vulNiC01f98cSKu8w-1; Mon, 13 Dec 2021 08:46:40 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VE1PR04MB6479.eurprd04.prod.outlook.com (2603:10a6:803:11c::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.14; Mon, 13 Dec
 2021 07:46:39 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 07:46:39 +0000
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
X-Inumbo-ID: d00953a0-5be8-11ec-bf02-3911bdbc85ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639381602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HO2HJ1Gesjir/O9FT9Du6cXXqL8p+AibTlpxVWjogU4=;
	b=RR3HqgMAHfZAl/mqXAf03x/qPk5QxmAULmfldHiwjoGJeqWgv6/RD1cyywn30NJwJZRoAn
	s6yJD55An4x8Fc74hAZy/Wunz60SEOUHMw+Mx7IUalIAmyfQwKQYKk39lBSq+EvGGpXGYP
	qy6JL6TAJ1+wWogW3or3fBIhYXMfzjU=
X-MC-Unique: WnM68vulNiC01f98cSKu8w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT+ucT4SQewdx6SQHlId0gV5x6FDFNuiCuRpcFuLtzXrOBCUC0ynI4ApBvcfXlPhdmbtOzEsJhc197YBa758aZi4rfDESyzBTTb+r8XzT5JVDBc456zBBFfgEPNNXTntd6dFa5MZLF/jft2GOglExGFPv8raUtAE28OOPpknIdOnKoxHwumu2v2YGDcgidwd3VRywOP+QvDzi/0UmvPGe3/jqexFZHWYaNkBXLxHxDORDy/DXoI2I/ldxHKukZ6MGeNzur9ABekcSGPtRStReybX/x7VmN/e4suBr+/6lDnN+SloXAYiEY/pINcd4aHtg7SSK5xEr3HWTaqnPuPBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e649gei7eQyg68ariLZ7D6yQJEYsBIEInU5nnHRWWWo=;
 b=PC+lbcB0m3WgyyOIq9G8OhCN/2ZqayDZZzjskhcP+nmivnQ8FEdXmy1HP8a5axV4LY+B424Ds0kU2QCzrlg38pQTNHJa1lDGkyGuf7vO+hkcDUlJAYxqbke3pyLUIDmfYEwXRJnHjpE2ZgoLsSGMDSktKtianVDjUDspoLTjVzdg9DrNmGjG+cgB+/2l3nplO5jU2Aq8IyDaN0gmE0HFpHh8y6B+mQ+2lUoZBVWGmtl3G/4cqMrVuO7O8V+1PGjwXTx0/GHn0VBdQl84laGivysCxH+3oetE6iAqAl6ie/6LVUgM570M8rIwomfc67ND67whG54hvBhih3DK/M/YLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e52af4aa-4542-24de-7191-955a4206f5da@suse.com>
Date: Mon, 13 Dec 2021 08:46:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 08/65] xen: Annotate fnptr targets from acpi_table_parse()
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-9-andrew.cooper3@citrix.com>
 <bddd9fc4-d442-9272-0fcd-4472c83e36e7@suse.com>
 <dac66683-a2b1-e548-9d19-3a0e9a74c5cb@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dac66683-a2b1-e548-9d19-3a0e9a74c5cb@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0132.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91a765df-bd87-4fea-5b79-08d9be0cb237
X-MS-TrafficTypeDiagnostic: VE1PR04MB6479:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB64793DE1B928A1F5786C3B61B3749@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X82CKI3B9MkYFdwCOuctGRmr1ZTT5nR2TZ6MajkuIBmm/VE5IB+3ygSFamJnS7XB/XdAWgi8lgnyGJXdrjk2Uq86VBas5OkDRce+rimlH77O+A9VRmRa27irzfLI0h9XySJmraCmcgl+TjyYDUK6v3hZDc3CsPXSONP6BUYv+knkKq7LB9mMZCz5Fsi2ZShbttE3SgOkqoD56jAECsjxVKsJ/8Hcd8DX4i/r9cvL3FPs9kSnBf50mur6rO3h6KRAkn4OA/4TPLsHu9A3Ww7lH78mEOj0r5c981/BtmsbJ6CmR4DRuox7Hrgrmgsf5GsK+aKw6c94KnntQcmeRdi1im3Mo5f5D6PLF/fXSPDuL5hEgCYPDOTHo5z6ccB6hJvng3yIAIJXVnEwDw81Byl5/dLqLVbRHf+o2+bYoAXJ7JLTwboun4qKB1Bxu6sKyoYZ7UQeEBLQ+DyuNadblvEHycZq4shXejE/ostLhWGC94W+7USeQgK2MHBbGanVZD1OdHC8yP4U7JbXikMFnXgknqUQvIMyJlNp7dOrbRNoxrKSkjjSqpv/hM6ld39LWnsnTBsOIKo4r4V7LtFOMuOK62uRE5mA6yNvgT8RzViFYFJKWne1MyLltrypJWCLYf0C70AQbUesqGR/9rM9/pbp9afuNz72irMgbEnYe66Q4JsyiDmSJRqPUp1rjgvgHfFMB3SbLnCJzedx/kKlzTflgbSH4NIZeGmhHf6a+yzw+tQIjlW+lhBSuDWRhvGybgWU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(6512007)(508600001)(38100700002)(45080400002)(2906002)(66946007)(186003)(31696002)(2616005)(36756003)(6666004)(6506007)(26005)(31686004)(5660300002)(86362001)(110136005)(4326008)(83380400001)(53546011)(8676002)(6486002)(316002)(54906003)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G/pPdJvVijdkeTLkhc4HX3qwGfsMe3uwrjwfwstdO2FwNIn6ShxnXu7qBzf7?=
 =?us-ascii?Q?gyqvYJEVy6jSM4h6F3bZjXqJ5Ll4ED20Tz6nZerJJzLNfI++rvPk9qmPKh3m?=
 =?us-ascii?Q?5g8nQ5FzbxE5DcdL7kdmB5GJo2Kue07tXZvkvP19+d+U3JP9jls/2+8Vnw86?=
 =?us-ascii?Q?ENgob2Ss4bZJQLnzkniSQIFYQlv06yx9KHyPhmmD2CmJjR8IcmvyKByvVkeU?=
 =?us-ascii?Q?UaDYYUnTl47u9wBn/89oSvQwqpz8zxSYO0u1Jw47lH4ftXDnc71ivXmdKlh0?=
 =?us-ascii?Q?mgZV2DaWbmyl1CeORd4NTxHA061LDR3ciKvb20nUyFwb/IObWWiTF8uUiPQz?=
 =?us-ascii?Q?wJc5i4nZEHi4cnTOdtTdC9ju8QBwvc/Cc9DlAXVlEgL733t2KVwNfQXctnJR?=
 =?us-ascii?Q?XY8bs6SuWX+sjWgfe6sp0EOtYhzz4wQRVpYKu7XbaiEj9kgGBvT5Phx24kPc?=
 =?us-ascii?Q?0F7pWsnw08IlrhJZmLk13qZZ2DnqZZ8i9yt2HoIpZ8UxiJ1TCgFajlWddyrI?=
 =?us-ascii?Q?MOJW/nZUCb62pQpi8rlmvBZ9u2RJY8pzOnQ5LRlbZZCjxOckEl/YXS/Mag/h?=
 =?us-ascii?Q?4rr0SstMGf3EunVEVpn5scalolI0qwQiP/Kh+GnYEDnVGI4q6dqRu7tHlJ7z?=
 =?us-ascii?Q?tZZvEtM0lEcSU+VNI3Z5YTWSuJDW9mQ7VHAnzM7PeilT774iH7ISN+7mk/QA?=
 =?us-ascii?Q?aZZYly1uFiyZNJ/RTlfnWbVGQTwJ/yeTk4LjqNxz2KSkfcNtebT+mR3gaZaA?=
 =?us-ascii?Q?okbsSrE52PZY9yq9q638hyqkXh9f61wKiATIA8HEBYqYSRlXyGafDiDIzGn0?=
 =?us-ascii?Q?LHs+wwPc6umYaMp+JqQys0XPsgnqN7uGfdvLRvRkmntU2takXIR5h1X8ofx2?=
 =?us-ascii?Q?J++OOig3WYXHatyCcpGNiDu3b0kt2FfcwA9LAYdszMEh1uBs5KhpgDJnrFNv?=
 =?us-ascii?Q?xVoHqUfZzPyj3YX4T6cbzhalvolf+VlsDju4KoElhbN+PWh8fzvTaqFaJ2Mr?=
 =?us-ascii?Q?MnQX0MCwHjkKEQO7tMFGdlDgu7dk9C4NmkzdNQIfDHqD2niN2zY+ukBYeg2t?=
 =?us-ascii?Q?00GZND9eZGqmO36uY9KpV4xEsHGUID8VRfwtT3IblXcYLFUhUiqNDfydqNJA?=
 =?us-ascii?Q?Dz4E/x0DnXliagTzbmjJZfRcQh94wwQ24y36jXQDDKh4SJgayH+m0o+76Njb?=
 =?us-ascii?Q?SNQJ7JAdE1eM84Ns6tOGAC3SSvIuU0S2PW4w+gFR6+CslA/Bm9bH+TywpwwI?=
 =?us-ascii?Q?sk0uaGQcSile+8Frs9ZtkIXGYnw5TS7F96asv3f2Rz3Lz1HrU5jQdjTIaLcQ?=
 =?us-ascii?Q?r2n15DPrkUPSsE+PNLFVRVlJBPLKN3K3+fl3twpZo2pspUaG2zZ+S8j8WWb4?=
 =?us-ascii?Q?KUUavz1He1UYU+x40FjUbPkoRfDTz/lnmt/VEhIzE2Vgblhu3tTdFH5TOIy8?=
 =?us-ascii?Q?myaa2zJz6zZo80NSjwgjcVsrFkUW6WUDwmEcQWzAoZpIqi6/628ubtgP4Ye/?=
 =?us-ascii?Q?cWws0A3jRinOJDTl2wmJdjRLPvT6EKgHFHnJNg3xfRCFhaF2QZLqqLTwWGAR?=
 =?us-ascii?Q?r2hYpzkrXlv2o8I5LA2dZw6HNRSFNy7JhBEcbQ4vGRfqTABVeFqdjUO9m8L1?=
 =?us-ascii?Q?ZornP/pnNVZCk70Kt9cyYs8=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a765df-bd87-4fea-5b79-08d9be0cb237
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 07:46:39.0222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /guuIFxG/qGdALdrG9a4CHntFTkJYMkwSzYrx9Knzm6RsORgXq6XzCVct9ogj3Tf/roCxY1Z98CUZ6FiK4g5xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6479

On 10.12.2021 15:44, Andrew Cooper wrote:
> On 06/12/2021 08:36, Jan Beulich wrote:
>> On 26.11.2021 13:33, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/hvm/dom0_build.c
>>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> Elsewhere in this file we have
>>
>>         rc =3D map ?   map_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn=
))
>>                  : unmap_mmio_regions(d, _gfn(pfn), nr_pages, _mfn(pfn))=
;
>>
>> which has been in this shape only as of commit e3b418ac4919
>> ("x86/pvh-dom0: Remove unnecessary function pointer call from
>> modify_identity_mmio()"). Aren't we relying on the compiler not
>> transforming this back into the earlier
>>
>>         rc =3D (map ? map_mmio_regions : unmap_mmio_regions)
>>              (d, _gfn(pfn), nr_pages, _mfn(pfn));
>>
>> ?
>=20
> That old code was especially dumb even before retpoline.=C2=A0 See also t=
he
> damage caused by c/s 245a320ce2.

I must be lacking context here - what damage did that one cause again?
Or which subsequent fix of that damage am I overlooking when going
through the further commits on top of that one?

> Yes, we are relying on the compiler not to do transformations behind our
> backs, but it won't of its own accord.
>=20
>>  And aren't we further relying on the compiler not transforming direct
>> calls into indirect ones for other reasons (I recall Microsoft's compile=
r
>> being pretty aggressive about this when the same function was called
>> more than once in close succession, it at least certain past versions)?
>=20
> That sounds like a broken compiler.
>=20
> There are legal cases where a direct call has to turn into an indirect
> one, and that's when we need to traverse more than disp32 distance.

Right, but that's certainly not happing anywhere in (relevant) practice
withing a single compiled binary.

> But without going to a larger mcmodel, we'd get linker errors before
> that becomes a problem, because R_X86_64_PLT32 relocations can't be
> retrofitted into an indirect call at link time.

I guess I don't see a connection to a PLT reloc: There wouldn't be any
if the compiler chose to make an indirect call out of a direct one. It
would be simple PC-relative relocations (generally coming from a RIP-
relative LEA) instead.

Jan

>> Is the widened effect of the annotation intended to also guarantee that
>> indirect calls will not be produced by the compiler for any reason when
>> the annotation is absent on a targeted function's declaration?
>=20
> That would be one for the clang and gcc developers.
>=20
> I don't see a plausible problem here.
>=20
> ~Andrew
>=20


