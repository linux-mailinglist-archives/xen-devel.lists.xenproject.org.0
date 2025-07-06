Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665F6AFA6B1
	for <lists+xen-devel@lfdr.de>; Sun,  6 Jul 2025 19:08:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1034871.1407222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYSqT-00089H-0e; Sun, 06 Jul 2025 17:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1034871.1407222; Sun, 06 Jul 2025 17:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYSqS-00086e-TV; Sun, 06 Jul 2025 17:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1034871;
 Sun, 06 Jul 2025 17:08:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHaa=ZT=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uYSqQ-00086Y-Fc
 for xen-devel@lists.xenproject.org; Sun, 06 Jul 2025 17:08:03 +0000
Received: from 19.mo550.mail-out.ovh.net (19.mo550.mail-out.ovh.net
 [178.32.97.206]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c21b647d-5a8b-11f0-b894-0df219b8e170;
 Sun, 06 Jul 2025 19:07:55 +0200 (CEST)
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.58.249])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4bZv2L6mFkz6TBs
 for <xen-devel@lists.xenproject.org>; Sun,  6 Jul 2025 17:07:54 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-76ppr (unknown [10.110.96.185])
 by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id BB2A88163F;
 Sun,  6 Jul 2025 17:07:53 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
 by ghost-submission-5b5ff79f4f-76ppr with ESMTPSA
 id t0GeIWmtamiVAQAAyoZJ2A
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sun, 06 Jul 2025 17:07:53 +0000
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
X-Inumbo-ID: c21b647d-5a8b-11f0-b894-0df219b8e170
Authentication-Results:garm.ovh; auth=pass (GARM-108S0026b1d5047-69b6-4606-8963-20d1071b4368,
                    FF3279A5BAD606DDEEDDFD371ACA0117F5CC5AB0) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sun, 6 Jul 2025 20:07:50 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 09/22] xen/lib: add implementation of SHA-1
Message-ID: <aGqtZny6f5GXfara@MjU3Nj>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <a63da5121827a25189db4704326addd8dc10aad6.1748611041.git.sergii.dmytruk@3mdeb.com>
 <06dd48a5-f9f8-4504-b580-e9609dedab27@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06dd48a5-f9f8-4504-b580-e9609dedab27@suse.com>
X-Ovh-Tracer-Id: 12495800116330214489
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepvdfgveegtdffhfdugeevieehkeetudevfeefgedtleejledvfeeutdetudeiveelnecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=ZcsZ6+ff9WwR0SMm9MMw1nkmYGTF6gTxZ1gB87cFGVo=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1751821675; v=1;
 b=JtUsZ7vyCQBDCZYOBT7NSet+FTTMqQKGF7RxETMar5tjPrYrHTEkcoV820Kbw3gDfqo/tf91
 jkfe6tCTynk0kPIcBCg2rss10tunVHHOl7yPHPdIr4WUeUkQCecD5tuH6iogm90YaX/WKivWGKy
 b+xkvQ1ypLwS8Dl359F1wNTYLn/nVxMbATI9FV9+E4Qb289N45/Zd8naB6zBJhzJJD496nHgbWW
 Yg0QZ5RM51c9Rhl+ukw6Tm1Qi8fXf9H+/isN08bLhw3YkGym2EShhEUon9rXDdewR/T3yDUv5t7
 PUvyvwPIphjzpYN1fFI/ON595re4v+m5DrbV/aZ9IR0DA==

On Wed, Jul 02, 2025 at 04:45:44PM +0200, Jan Beulich wrote:
> On 30.05.2025 15:17, Sergii Dmytruk wrote:
> > +static void sha1_init(struct sha1_state *sctx)
> > +{
> > +    sctx->state[0] = 0x67452301UL;
> > +    sctx->state[1] = 0xefcdab89UL;
> > +    sctx->state[2] = 0x98badcfeUL;
> > +    sctx->state[3] = 0x10325476UL;
> > +    sctx->state[4] = 0xc3d2e1f0UL;
>
> ->state[] is an array of uint32_t, to the L-s here look inapplicable.

I did that trying to stay close to sha2-256.c, but will remove Ls.

> > +static void sha1_final(struct sha1_state *sctx, uint8_t out[SHA1_DIGEST_SIZE])
> > +{
> > +    const int bit_offset = SHA1_BLOCK_SIZE - sizeof(__be64);
> > +    unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
> > +
> > +    __be32 *digest = (__be32 *)out;
> > +    unsigned int i;
>
> Please can you omit the blank line in the middle of this (not overly large)
> block of declarations?
>
> With the two adjustments:
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
> Jan

Sure, will be gone in v4.

Thanks

