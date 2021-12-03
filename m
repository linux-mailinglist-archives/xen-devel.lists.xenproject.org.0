Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC184677FC
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 14:18:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237634.412168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8Rv-00076f-Jr; Fri, 03 Dec 2021 13:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237634.412168; Fri, 03 Dec 2021 13:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt8Rv-00073Y-G2; Fri, 03 Dec 2021 13:18:03 +0000
Received: by outflank-mailman (input) for mailman id 237634;
 Fri, 03 Dec 2021 13:18:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mt8Ru-00073S-H1
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 13:18:02 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70b088be-543b-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 14:18:01 +0100 (CET)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2057.outbound.protection.outlook.com [104.47.8.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-33-4VAkWZnjND62joS597Uqwg-1; Fri, 03 Dec 2021 14:18:00 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3295.eurprd04.prod.outlook.com (2603:10a6:802:f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 13:17:50 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.028; Fri, 3 Dec 2021
 13:17:50 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0407.eurprd06.prod.outlook.com (2603:10a6:20b:461::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Fri, 3 Dec 2021 13:17:47 +0000
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
X-Inumbo-ID: 70b088be-543b-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638537481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dk7g7pKTgvSk4erLP9gyvcK/63CC8Tw0S3OEfmyM7og=;
	b=GLCb8ioClphLgUPXp9vRyvZvZC+6nxNQRNTIKOaSWYw+6060O4UZwAlSffEUHPMHWnAqRk
	Kp9AzGWt/Y+PBPL4jM1jq9CEdkHm8hBegsg/6kYhDac5WvhqB8IPy6OfsyUgmiey0tkXCK
	UZWfo4fB7KcgpcwX99SwhL59o5cZ1XM=
X-MC-Unique: 4VAkWZnjND62joS597Uqwg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWOoLeNCL/EgPxud9lB6L7LNgD1LQihjVvp+g4EC+34/oBuToXND4+FNoGl7S3kfFYMGVSY4a3mU33GBTOVH9XYfAObyXdBKREJZuaaZZaBUISEdP4b35L7vakQVv/OXTf1MPXJdSV1Qb+7ii/1i9GIYFqRZjDrV3w1dx6SaX6ddic8O3pg9hjRbHj2RE6hn7/TsAA68WeE6TzdWp5ynSz9Bm8AlnSp1SOILhLpVZIMbmhQe0RLJrnsNSVemXJ8jPq3YbfdiFBlFKOIV4OQKPHGY5nW+LlPPbBWnXZOT0aofDs8Eee4MKDXY32hfgjP8NXNkuO6u7ny0O/tNLLdB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=We+YTmrpzElMidYTz8f2f3DZP3Q1/nzvwAU2jGItKiA=;
 b=GzB8zfyIcsVNbXoO1/XG0bpkmmV2WZiZPyC/U3GRUHXL6r0cDXJpgkftCOLJTOgx9cxa7TETVJiMDp5uVGG7ZrmrtXEvnZQbG99nSVG1xYGOjFgsyRM8+69anYbxsT1ADZbH5/1X8dfOsQ5XPmDnS4dUtCtnr0qRdFJR/7VBcd57nTlvkT2QAA1v/m85qNs75jsR8smwGQHzA5hjpc1v7BhJiykAWivFZhFuTFAEkU9Dn79OIOd9/vZiJ2kInxb8r1UmEDpMpr4zwO0Q/AU+9Wl9dQ9QJkZla8bDByacKLOPjR+PCCP+s6hmD3eMPaeohoRksRWfGOt0mBBR7T+HFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8434878-129d-8207-09e3-4909e638a4d0@suse.com>
Date: Fri, 3 Dec 2021 14:17:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 59/65] x86/traps: Rework write_stub_trampoline() to not
 hardcode the jmp
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
 <20211126123446.32324-60-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211126123446.32324-60-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0407.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aaf2f789-36e7-48eb-286f-08d9b65f4e72
X-MS-TrafficTypeDiagnostic: VI1PR04MB3295:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB3295A52ECCE2193AA30ABDFCB36A9@VI1PR04MB3295.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6/fj/i7OUHNW8lPTkjwqSNALbiguZTtX+wd3JiVa31nv8O7iDSUHLk96Hv0473lWzt85bElI4vvnU73M3JldGaCMSQnaEX1U1mHBgNGQ5GOr5CZ6sghjUvfjX7azZBzNp1HKwF83v2trWZal+G1mdDbvXaUg3fHBq/fDDu20y2xkG4xhg7Uy5T8tbMQx0xoU2aQ77DSZCrOy0On6WbDjYyE3LdHtoxW54FppHOBaV56TG2NDucU49P8Z2utHqLukZiKg3PFV0x5GI++H8TGeZ+vNMBuUhhaBYHivxzywImJw/LqGwjTh6WtW7Mr8VAsviuexxBKpL5MdgVSOVeufPwQyK4WSVav/537pja+WcIltSlfB9ablZ09G0d8gBUIiXuQSzULmuiyCgLqCNgsoZuFzzdI3uD56a2SyF1NY6gO3RMAs+Ij1izE7G7KdTMsNLpUqwTLhZtBrPmFWH42pQqg0oF5ZIL1zKYkQTm5aG19CecNtkV+RBds4s3Ha7tLSXVVZ0O14/jOtlfO6pC1MYYfjkKhOzQi/i4sNIHsiefMkdTlrvZmxF8NioGUHvlCI68d8xhwhu6fkidaCSTfyv0tRufcqn/Un7esCDvZ9ySS9rumAhlGyiO/pddiy1xVitcKQFX3cl/cK31Zt2IamfSVciX7hedyvbEbm9S7Xg0UbvesFXjccgcZ2VTcSHJlAmBgpy0kJMbkQscz0kaAWjybkgT8Q1+1BAzhKL+dwMsI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66556008)(16576012)(5660300002)(316002)(8936002)(83380400001)(66476007)(6486002)(66946007)(36756003)(4326008)(53546011)(6916009)(508600001)(38100700002)(956004)(26005)(31696002)(86362001)(8676002)(31686004)(2616005)(2906002)(54906003)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4sE/1gxvyyjkxABPI1lt7WckZV6P/puP0PIjiIlH/vWxS0QbLn+4X3pDN9Wu?=
 =?us-ascii?Q?lNC4K54XVZdsdBAqK7Qpf9CDa22kgxXTEdKfVjnay7G1oJNx6kDkUYeHiqoc?=
 =?us-ascii?Q?diiLHkVFetFG/TDN91KMcdt4jy1vu3spU3rlpOg5siY+hwkTtVyWVENaasCm?=
 =?us-ascii?Q?mq1BBijcBsE/avaT36FN0nVoG57K4tS3clByfq8rlfmRdVfog3c5O0+BCBNi?=
 =?us-ascii?Q?Zr9tH3DqxHmdt/pFMcplpCLgvCRPiQZMgsKVeNogkdrgLWdpKkB5hLqDsgiH?=
 =?us-ascii?Q?fZ4CfKXDWQv0th22BCiIdcRTyoNJW321spxxay/q3r82YYjLBXYRSLEyKUio?=
 =?us-ascii?Q?PsRCZgU+CyAPP1WSS9I5EbU9OfrYpLgkaN0f8BroImU6auLo5eRvN2W/kxeW?=
 =?us-ascii?Q?I6qFfWhEyeYLzHjnDitGs2C1m3Vm5rFCQI2FpjXqiAfL2HaGXQc9wd0/Wubp?=
 =?us-ascii?Q?y9nxKa4VCuexrQ8A3K13dkTAfSMOCudpCiT9HmO5FnoBqbz3iDZplywuatoh?=
 =?us-ascii?Q?7C0ZCYy+jautCzjCrTuwZKF1/SThI2dH/NmlYoaA3Vs/drgdvhxzunygMpPc?=
 =?us-ascii?Q?bOp7NxVgMVMIu84HMPEeazV0Tg524ogK73fD4e7D4hITo67XkNDjcrYfkIw6?=
 =?us-ascii?Q?8RWYfIka2Ym6M8U+Oj2CT1scQvL9IpqueeFUs8+QQnb0NHRkg9PfG0Mf24X9?=
 =?us-ascii?Q?iRNtC8tm/kAyIxVkolIIlgtcn2QRoMbhFhC3qh5iT/5jzaCMsNGYK8OZEXAp?=
 =?us-ascii?Q?21pvH0wowD4MgAPBmbghSG7jq+fxHpZ32rtkf89isapzahk0hqsi9jNWb0oF?=
 =?us-ascii?Q?IA7xsFcy8ghl1YBnu7fejhG/9R9hSLHFkHrDD1Zq/sQBnG9YDIGW5Ou9tImw?=
 =?us-ascii?Q?67yY5c+2RqIdTPTxaNaizdIT8zkZcUowaiY+J+YhkKqglzLw0uYQs8fkb3ZA?=
 =?us-ascii?Q?vh/IfBKEqKWcSrna+GOK/Hy36XeHCYn4sgl06vzDSItHTxRAw3STWVZFtZVf?=
 =?us-ascii?Q?Wlm0ItTH1DMsladze60r3VSMu+Zt2Li3tw2Ss4CEOeX0QLhYgK3qiJ9RsVVW?=
 =?us-ascii?Q?VRsrCW9rSq5wjjSTe5MgkQMExfnKQYqvyRtbKG/ThE24TE8aWFkvsrNUiHDK?=
 =?us-ascii?Q?hPG9mgo5PdCi4B77B1kSGQYk9hEMua0d+8SqBms64k7kX4hDN9TZCQIxXbPs?=
 =?us-ascii?Q?bTUupq7k2L2SZNkfDs4W1Je0djmVegYUQW8eE7QNTHiQKKhJ8cV0x4IaeWIZ?=
 =?us-ascii?Q?RV41S82Ez8Ti1Te1cAOMU0BzRhpBEqRe1l8bzMtWprzka91+Ec3NbKk51VZ3?=
 =?us-ascii?Q?okKQFOHjEkkP8C7NhYCYlVprcXGgMzr5HzXuBBWemqidnOS/Jl6zphFceMr8?=
 =?us-ascii?Q?LVGfhPAJAMQ+jF0WUWk/Beda1nFVahR8K289Wi/xLoOJjZqduzOseUmdb1of?=
 =?us-ascii?Q?DdXLuKLr56lAw8E7/Syay0zlwjqUX5nCarNehJJiUB7UYFlwpECEUl7mqjSo?=
 =?us-ascii?Q?EfRzsDkKt6MbdAqYcUoy1Xe6owLMZCD0Hi0jiU/Ugwf+pGcaxkwypPnYoA7Y?=
 =?us-ascii?Q?85i61rickZIX8y/A8eWqO2cR7aiTjUaTM1GEPHlXd+Ud3da1JGgFCvj/xJ6M?=
 =?us-ascii?Q?5ixc95UVqyo4Bxte7GOjyzs=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaf2f789-36e7-48eb-286f-08d9b65f4e72
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 13:17:50.5587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVvniTPxARyI8l3xEBM/G88oZwrANbagf5mnzqatyIlv3pw2ULvZDQMwrdBDenMDW6l8OxmOS91YNvNuCEzpDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3295

On 26.11.2021 13:34, Andrew Cooper wrote:
> For CET-IBT, we will need to optionally insert an endbr64 instruction at =
the
> start of the stub.  Don't hardcode the jmp displacement assuming that it
> starts at byte 24 of the stub.
>=20
> Also add extra comments describing what is going on.  The mix of %rax and=
 %rsp
> is far from trivial to follow.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  xen/arch/x86/x86_64/traps.c | 36 ++++++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 14 deletions(-)
>=20
> diff --git a/xen/arch/x86/x86_64/traps.c b/xen/arch/x86/x86_64/traps.c
> index d661d7ffcaaf..6f3c65bedc7a 100644
> --- a/xen/arch/x86/x86_64/traps.c
> +++ b/xen/arch/x86/x86_64/traps.c
> @@ -293,30 +293,38 @@ static unsigned int write_stub_trampoline(
>      unsigned char *stub, unsigned long stub_va,
>      unsigned long stack_bottom, unsigned long target_va)
>  {
> +    unsigned char *p =3D stub;
> +
> +    /* Store guest %rax into %ss slot */
>      /* movabsq %rax, stack_bottom - 8 */
> -    stub[0] =3D 0x48;
> -    stub[1] =3D 0xa3;
> -    *(uint64_t *)&stub[2] =3D stack_bottom - 8;
> +    *p++ =3D 0x48;
> +    *p++ =3D 0xa3;
> +    *(uint64_t *)p =3D stack_bottom - 8;
> +    p +=3D 8;
> =20
> +    /* Store guest %rsp in %rax */
>      /* movq %rsp, %rax */
> -    stub[10] =3D 0x48;
> -    stub[11] =3D 0x89;
> -    stub[12] =3D 0xe0;
> +    *p++ =3D 0x48;
> +    *p++ =3D 0x89;
> +    *p++ =3D 0xe0;
> =20
> +    /* Switch to Xen stack */
>      /* movabsq $stack_bottom - 8, %rsp */
> -    stub[13] =3D 0x48;
> -    stub[14] =3D 0xbc;
> -    *(uint64_t *)&stub[15] =3D stack_bottom - 8;
> +    *p++ =3D 0x48;
> +    *p++ =3D 0xbc;
> +    *(uint64_t *)p =3D stack_bottom - 8;
> +    p +=3D 8;
> =20
> +    /* Store guest %rsp into %rsp slot */
>      /* pushq %rax */
> -    stub[23] =3D 0x50;
> +    *p++ =3D 0x50;
> =20
>      /* jmp target_va */
> -    stub[24] =3D 0xe9;
> -    *(int32_t *)&stub[25] =3D target_va - (stub_va + 29);
> +    *p++ =3D 0xe9;
> +    *(int32_t *)p =3D target_va - (stub_va + (p - stub) + 4);
> +    p +=3D 4;
> =20
> -    /* Round up to a multiple of 16 bytes. */
> -    return 32;
> +    return p - stub;
>  }

I'm concerned of you silently discarding the aligning to 16 bytes here.
Imo this really needs justifying, or perhaps even delaying until a
later change. I'd like to point out though that we may not have a space
issue here at all, as I think we can replace one of the MOVABSQ (using
absolute numbers to hopefully make this easier to follow):

    movabsq %rax, stack_bottom - 8
    movq %rsp, %rax
    movq -18(%rip), %rsp
    pushq %rax
    jmp target_va

This totals to 26 bytes, leaving enough room for ENDBR64 without crossing
the 32-byte boundary. But I fear you may eat me for using insn bytes as
data ...

Jan


