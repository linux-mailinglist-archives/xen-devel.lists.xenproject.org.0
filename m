Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C591B464A6A
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 10:15:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235706.408863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLhg-0004SL-UE; Wed, 01 Dec 2021 09:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235706.408863; Wed, 01 Dec 2021 09:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msLhg-0004QY-Qq; Wed, 01 Dec 2021 09:15:04 +0000
Received: by outflank-mailman (input) for mailman id 235706;
 Wed, 01 Dec 2021 09:15:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gc09=QS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1msLhg-0004QS-15
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 09:15:04 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58456d99-5286-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 10:09:34 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-_kTKD8e8Nu2Q0lJbJTTCHQ-1; Wed, 01 Dec 2021 10:14:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 09:14:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%5]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 09:14:04 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0051.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Wed, 1 Dec 2021 09:14:03 +0000
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
X-Inumbo-ID: 58456d99-5286-11ec-b945-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1638350047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pl1uorcJhBIB+n9XqJQwSjGHIIgVWj825OedBrXJNGI=;
	b=YkhmPmBqTQnaXFjLxbHZ0nJpO0kkBAPFprleUQRC8IrlvbjLOkud7DOpsW3D5DWgZ7vWiL
	G7RNAcOi/6ssd9zPBhSqwAEKpiZZwL0vi3hd/ykR+37t3yX3cqcF1Sptd2/EfkrhLzt3ZU
	064r21ScQIY8LoP1hUWePO7b0nXcYm8=
X-MC-Unique: _kTKD8e8Nu2Q0lJbJTTCHQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1YoReuJgpFBdB/sA0dVmvec9Mb9sCoPn8ToIFO8wQY+B2TrBpmwumZ7Ve1LoJVOAzux/D2aZI4Lm/LkMH9OcloMg9n3fGqDE3XpUJvlACZrO6sGJezMInrJfNONwlL2GgPg29MZxcF9zp3jr0T5jVKiStypgV8BqJ0jlncnhth8obNxto+lyrIDwxMdYWgXWunztbh1UIX3bA7JIA3DeIntJ14QYMuRtO1JHOuTgW6y60UziTeqTjAJwM3PjYYqrZ03Ro4sxuw1TLjyV79oQVhhPzJsjmZzMLylwqZ6gUwgmpzLJE75A/C53X00tpbegjmIsifbdEvi50DVD0oJew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92nX0NpUIZgB14Meh7c6HXGtrdKnqZBaQ6cnYmWqbJ0=;
 b=HejIxc4gXm0AzpdEFJbj7Ox6n5zWD7KiZ1SZm9oO7/px9gCojLSH2xByEEMBTAk1UM74b9q/4qsZx9yrlu1qaZAQN8mY2kjueIq8qTbG7T6JZGiXtxRvI977YMUXGQyE/LUCvgwj5RT9WmeMgADPAnfLY3TKapJA/5dFAUeGKIqiki6+lyACILNjX+tSMqqq4/dUwhf7CMG3gaYXqZIuO+izQxJ+emDZDiaiYhEBvXDEkW1+BeCp92elKKJB0Zkvm5Zftky+6oYglR89Ii6aIn3Roe6m7IwrN4Eo4/4HDypXtfQH2LFXYrVOojxWYap3i6N6QK5lRMiLmvxD9B51tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <037802f4-d28b-62bc-e830-78149f1cc2ff@suse.com>
Date: Wed, 1 Dec 2021 10:14:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] x86/hvm: Rework nested hap functions to reduce
 parameters
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130181139.14398-1-andrew.cooper3@citrix.com>
 <20211130181139.14398-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211130181139.14398-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0051.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d305efb8-1885-4395-691a-08d9b4aaebc0
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53287ADC1AF6CC536CBA1226B3689@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tdm/8V8rpJhqrGv68seuAVtTbegnqtCJ7Th25jYR2A5rfkTZfTPTkivUAqoftvXcuuKSy1uAOfBZj1t1PKPZFTmatfxB7X/OPPmXhflkTnjfXYzzuYCTJ7yOU5BFT2vWE2FJy0sZvTGWPZ/XVqJLLHI8+/dyzR0xAgiY1QIW1VeJbveT9KiJWVsFTpzkfcGY46GDiwMSwotC7cYVvKtWtHUdnWg4CceI6zGDkuBdmx6+wooKHNAreqT/PnjlME44RZzgIQ6FVTGQJQJj83aIUXN5I75rC63By0H4GmrxdU8G1Bl3Yfew5X0RBJi0hJNDbCrip66OcgLDv9v2zprrp8pumPEojWAial6lzQ9YV6K9S2saIdxykA0oss4hOT2TKcqWVzUnqggOAPDCbhN8bIqdGeaYPOx3ZBDSjuqJKMWw4Jo8aqeThB4UqQvYKKyfdx0PTlr7lIFWbzBaS3sQsZlVJOND3o79K+KhaP1yPEfSDHoYd14RvwKnrxy/IlnGoP2Wv7pdVVs3CDaGv5zmWMGB5LvX9Ab12aSeu0nysbrJdgjFNtS08ZukZiXrcnEqAdOTnGHpCn1NOLhHXbChtHB7V0PQJtTNjF+TGBPzJysdfy1TIIeIqyN7oQ/HbmdNsKZVsC7oeSZN/zl/TuRO6MXHmJ7UYMejGFOad5Ty+sPoQO6qBAOzaUJgdMYvGAzegVQcnFNDDfpIFZx0wwWJd7ndGeMTvQ8EZFUxGsPZTMM5T6dOBDJWeHSy2aPqsmwu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(36756003)(5660300002)(316002)(31696002)(2616005)(66476007)(26005)(6486002)(186003)(4326008)(956004)(86362001)(38100700002)(8676002)(2906002)(83380400001)(16576012)(66946007)(8936002)(6916009)(66556008)(508600001)(53546011)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RTLwbwHh9HF7+stya1GUDlacvp5ZcDe0oSf8sfd3zVMxs4nk752hocPaV5Uz?=
 =?us-ascii?Q?XsD9Th5kb3AFOcVmNScHRhPzmLA34KJ+XPn2gyKkE2sZSa1VNh7Ty0v3WyFR?=
 =?us-ascii?Q?y5CQtMgbHU+U7ioobtVM3GIwyF+hX4r/AOmwJq7JYcqXTJj/dp/ANTzOPJD4?=
 =?us-ascii?Q?JFL9Bc5gSa/x2z99WKPId/1n4kieq03LT27YAtsR+jf8k66HSBDhRlcGRvlR?=
 =?us-ascii?Q?7M2y0yMM/yHkbF9NXwbf3qFhJJ7jg7hKmpiIP1yObQnLQ39Ut7fKkfVPeIUb?=
 =?us-ascii?Q?BFkIh65TnUaVyFy+lUMgqjgnnsCxtTLhtoW5TeSXoZQWEnYhK2n2xziT/drD?=
 =?us-ascii?Q?k7lS0AB/8c49jCw+/0oowTocer4I/y8dxHWKOrK5uM+QoQWTAFurBM5XLZde?=
 =?us-ascii?Q?A+RsdS0zfoEz6APo1bGagWXpzVtNTEtK15EiJ6YxFFexQsbUH7/89zpByIun?=
 =?us-ascii?Q?pNLwf+5XZ5nLof9L+9j6AR0ccbOK8HhU81tK9vGa/cHG9TFX1gfsTHytxP1O?=
 =?us-ascii?Q?nGhRktxNs1cpZETVibwRZ5GqXWVq4TT7r7ThuR120cIZLFEu4/Di5a+QcuNl?=
 =?us-ascii?Q?/3Lnyv3+/y9CIesGNqAea9/o42lqmTHWWUOXsOzgs4fYueaEPZU72z7WddKD?=
 =?us-ascii?Q?gzP/dv+SGrRsSjazzZ0w/VDX7BmVf+SsMHdz4L6yWkykfd+TDn9j61SuyJq9?=
 =?us-ascii?Q?QFEXRwBrZcluae3ForNonTQxj5cdk2JFglZeAR5RLnWahfLIXKjeK0vhL/RQ?=
 =?us-ascii?Q?NSjlGtRxaR/TqUtaYfuBXK/1w2AI4JZaVhj+PB1LiOeRQWhUB1+cl3FHOlzf?=
 =?us-ascii?Q?Yntd/g1XU/aXz2ikA5kXeC1gQgOt4xbajtnlXDXryV3kBYQq9RIJcP2ktyP5?=
 =?us-ascii?Q?oSYD4LQnZFCSBPnirrSIRcRiREhFuxp07YIgRwZkJ2AOZoNq5byPYcD1KXow?=
 =?us-ascii?Q?zWljEBB5WjnuLfYVgrcK8/LsArplIUL/8LYs47bTNTJ1Qah2ogNfj80rT2KS?=
 =?us-ascii?Q?mcyTuEEXCpon7tSRiROMEBNNfGV6l7kay2yc2TyV5J2M3xJ2lMZD3uIuEBy5?=
 =?us-ascii?Q?2H9qEN+82nDv78Z1WsPP/OHZbzamTtearYNsfBGpghTd30SraFeMasNpsys0?=
 =?us-ascii?Q?ZUnLjEWuGU0jwor8i+oVBBhVDObfBdA/SoTbKSUqPs9pLVG68SYG9zELjdEb?=
 =?us-ascii?Q?0oW7Es2rFjvv3lwOB+dA3aH74tuU8UPdN99A5gHddZpz6mQz1kvNu2YN52FU?=
 =?us-ascii?Q?Sa6ZRd2VjgKV9+MSY/xTuNT+rQebUfINmk+0xsz9gp47FmVjWVIsjX0XNLYd?=
 =?us-ascii?Q?0c4JPu+cepX3rShLGSpLpVfxA9KPX0slbBexCyHpMY8JX0y7FiIyhGr0wvdu?=
 =?us-ascii?Q?lXH+NsYKNMFRjMcwvUB5ai6YaHDfQSOZNmdoqSnuQUOnKY30ggJxlWBK/mHz?=
 =?us-ascii?Q?peqeAckvv8vlp+HuhXK68uUEsj38Ep6M2mMd2viYAD+51q8VxO31YNVg5T5j?=
 =?us-ascii?Q?Bj+Bc5JSs4GvykomDwe47ce8d/g9GzqQC7cLz7LxsHVhze5npHlJ3UmuAbsp?=
 =?us-ascii?Q?zw1D2cq+7FGg5qyHrjiT7aZqa0NnJL55htwlIJ277FtBF46Qb3xkus1+wm2P?=
 =?us-ascii?Q?5+zbpZkic0ONxoaX1DEAHyw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d305efb8-1885-4395-691a-08d9b4aaebc0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 09:14:04.4610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t7enNhALdVZoPbAm2GSvdAr2EsmuMAu+QqdxeWjoBAp1mQ7FNqmZny0+61uEEY9EpwNdGowstOh+KVrBHKUVww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 30.11.2021 19:11, Andrew Cooper wrote:
> Most functions in this call chain have 8 parameters, meaning that the fin=
al
> two booleans are spilled to the stack for for calls.
>=20
> First, delete nestedhap_walk_L1_p2m and introduce nhvm_hap_walk_L1_p2m() =
as a
> thin wrapper around hvm_funcs just like all the other nhvm_*() hooks.  Th=
is
> involves including xen/mm.h as the forward declaration of struct npfec is=
 no
> longer enough.
>=20
> Next, replace the triple of booleans with struct npfec, which contains th=
e
> same information in the bottom 3 bits.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Tamas K Lengyel <tamas@tklengyel.com>
> CC: Alexandru Isaila <aisaila@bitdefender.com>
> CC: Petre Pircalabu <ppircalabu@bitdefender.com>
>=20
> I don't much like this, but I think it's the least bad option in the shor=
t
> term.  npfec is horribly mis-named/mis-used (at best, it should be consid=
ered
> npf_info, and probably inherits from the same API/ABI mistakes our regula=
r
> pagewalk functions have) and is going to have to be untangled to make nes=
ted
> virt a maintainable option.

So why use struct npfec here then in the first place? It could as well
be "unsigned int" with constants defined for X, R, and W, couldn't it?

> --- a/xen/include/asm-x86/hvm/hvm.h
> +++ b/xen/include/asm-x86/hvm/hvm.h
> @@ -25,6 +25,7 @@
>  #include <asm/current.h>
>  #include <asm/x86_emulate.h>
>  #include <asm/hvm/asid.h>
> +#include <xen/mm.h>

Nit: Typically we have xen/ includes ahead of asm/ ones.

> @@ -631,6 +630,14 @@ static inline enum hvm_intblk nhvm_interrupt_blocked=
(struct vcpu *v)
>      return hvm_funcs.nhvm_intr_blocked(v);
>  }
> =20
> +static inline int nhvm_hap_walk_L1_p2m(
> +    struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_=
order,
> +    uint8_t *p2m_acc, struct npfec npfec)
> +{
> +    return hvm_funcs.nhvm_hap_walk_L1_p2m(
> +        v, L2_gpa, L1_gpa, page_order, p2m_acc, npfec);
> +}

Is there a specific reason you don't switch to altcall right in
this patch, making a follow-on change unnecessary?

Jan


