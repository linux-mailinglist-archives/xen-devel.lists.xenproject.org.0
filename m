Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E75FABABD2
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 20:19:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988432.1373221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGM6s-0004J6-4Z; Sat, 17 May 2025 18:18:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988432.1373221; Sat, 17 May 2025 18:18:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGM6s-0004GZ-1i; Sat, 17 May 2025 18:18:10 +0000
Received: by outflank-mailman (input) for mailman id 988432;
 Sat, 17 May 2025 18:18:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WZkN=YB=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uGM6p-0004GT-J2
 for xen-devel@lists.xenproject.org; Sat, 17 May 2025 18:18:08 +0000
Received: from 4.mo581.mail-out.ovh.net (4.mo581.mail-out.ovh.net
 [178.32.122.254]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44d2cb35-334b-11f0-9ffb-bf95429c2676;
 Sat, 17 May 2025 20:18:02 +0200 (CEST)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.139.3])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4b0ByK4sLJz1Ndv
 for <xen-devel@lists.xenproject.org>; Sat, 17 May 2025 18:18:01 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-5gtgt (unknown [10.110.113.153])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4F4111FD3F;
 Sat, 17 May 2025 18:18:00 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.100])
 by ghost-submission-5b5ff79f4f-5gtgt with ESMTPSA
 id 2pBnBNjSKGjmQAkAAGl5dQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Sat, 17 May 2025 18:18:00 +0000
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
X-Inumbo-ID: 44d2cb35-334b-11f0-9ffb-bf95429c2676
Authentication-Results:garm.ovh; auth=pass (GARM-100R003bb8f4099-de98-4f44-9343-efc1adac344c,
                    E5B6778283FB85F5FEF284FAF1BF1665328034AA) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
Date: Sat, 17 May 2025 21:17:51 +0300
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	trenchboot-devel@googlegroups.com
Subject: Re: [PATCH v2 09/22] xen/lib: add implementation of SHA-1
Message-ID: <aCjSz6QXHiFtAjFP@MjU3Nj>
References: <cover.1747155790.git.sergii.dmytruk@3mdeb.com>
 <7fcab16c3efbc0eb28e0f8ec0d9c9d3188881ad4.1747155790.git.sergii.dmytruk@3mdeb.com>
 <fdc5b712-4c93-42b4-a1b7-d992c720c387@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdc5b712-4c93-42b4-a1b7-d992c720c387@citrix.com>
X-Ovh-Tracer-Id: 15193174821536576668
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -110
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudeifeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlqddutddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhepgeeiveevteeguddtheegtedtffelteehjedugfelhfegudffkedtgfevkeettefgnecuffhomhgrihhnpehnihhsthdrghhovhenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekgedrvddvuddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=TYGktWuYeB1G2viZC9Qm3dwDd88Cb4PEVL+Pp5yMTtk=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1747505881; v=1;
 b=mFK1Yjj/Tpfy8w12pe23R9N+OtoABxu+ZxXnFFE9R1Mwlb4gkEgw6DipzLpzRdfb0dSjdMoX
 lJ0RiYv5wa3aKcjgSByikLwG0yg6NQ+m6n5mQEwUfzkkbAyFVl9lxxVeea4A72cx+3XPV6h/Ppi
 CMHvgOzLh52sJkJ2zbG1x8nLU+u0llCnMebfbyqk0XgL0BF4cCzrrPKBIc9ZixDWAVfpc0L9NK/
 Z9h8GAg+aep+GfEkscyT4DvZuFRvPnZKICx48AO9bbmgrCN0EE3yWHWeMSIemvDgwP82tNbvCa+
 MTKs97wRpI35W4rGPjIZkMJz5SVmz8MNiaUhYD6v4bLHw==

On Wed, May 14, 2025 at 05:58:59PM +0100, Andrew Cooper wrote:
> Please crib from sha2.h as much as you can.  Use xen/types.h, drop the
> double underscore in the guard, and provide a link to the spec.

Until yesterday CODING_STYLE instructed to have 2 underscores, so I
thought sha2.h is outdated.  I'll switch to <xen/types.h>, although it's
overkill there and only grows header dependency tree (it also brings
extra symbols thus hiding missing includes elsewhere).

> I think it's https://csrc.nist.gov/pubs/fips/180-1/final

Looks like https://csrc.nist.gov/pubs/fips/180-4/upd1/final is the
latest for all SHA algorithms.

> > +struct sha1_state {
> > +    uint32_t state[SHA1_DIGEST_SIZE / 4];
> > +    uint64_t count;
> > +    uint8_t buffer[SHA1_BLOCK_SIZE];
> > +};
>
> As it's uint64_t, the count field needs to be first to avoid padding.

Will swap them.

> > +/* This "rolls" over the 512-bit array */
> > +static void set_w(uint32_t w[SHA1_WORKSPACE_WORDS], size_t i, uint32_t val)
> > +{
> > +#ifdef CONFIG_X86
> > +    *(volatile uint32_t *)&w[i & SHA1_WORKSPACE_MASK] = val;
> > +#else
> > +    w[i & SHA1_WORKSPACE_MASK] = val;
> > +# ifdef CONFIG_ARM
> > +    barrier();
> > +# endif
> > +#endif
>
> This is horrible.  I think the problems discussed are created by having
> the loops in sha1_transform() broken in a wrong (read, unhelpful) way.  
> The 5-way shuffle of the chaining variables probably is beyond the
> compilers' ability to unroll given the multiples of 4 currently used.
>
> See the implementation in SKL where I spent a while optimising the code
> generation.  Admittedly that was optimising for size rather than speed,
> but the end result look to be good for both.

I tried just doing regular writes and didn't notice any massive
changes in the disassembly with GCC 14.2.0, in fact the function got
shorter by 41 bytes and its stack frame size decreased by 8 bytes.  That
comment was probably addressing misbehaviour of some older version.

> > +    /* Round 1 - iterations 0-16 take their input from 'data' */
> > +    for ( ; i < 16; ++i ) {
>
> Xen style has this { on the next line.

Will fix.

> > +static void sha1_update(struct sha1_state *sctx, const uint8_t *msg, size_t len)
> > +{
> > +    unsigned int partial = sctx->count % SHA1_BLOCK_SIZE;
> > +
> > +    sctx->count += len;
> > +
> > +    if ( (partial + len) >= SHA1_BLOCK_SIZE )
> > +    {
> > +        if ( partial )
> > +        {
> > +            int rem = SHA1_BLOCK_SIZE - partial;
>
> Unsigned int please.

Will do.

> > +static void sha1_final(struct sha1_state *sctx, void *out)
>
> Please make this uint8_t digest[SHA1_DIGEST_SIZE] straight away.  This
> was an oversight of mine in sha2-256.c which was fixed when exposing the
> function (c/s aea52ce607fe).

OK.  I skipped that intentionally because it really only adds an
explicit cast in the body which is not much different from casting to
`void *` and back.

Regards

