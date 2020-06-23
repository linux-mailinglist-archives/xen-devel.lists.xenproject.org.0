Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B95622062BF
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 23:10:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnqAl-0003rL-AQ; Tue, 23 Jun 2020 21:09:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pvsx=AE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jnqAk-0003rG-DM
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 21:09:38 +0000
X-Inumbo-ID: d87a9ac6-b595-11ea-bb8b-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d87a9ac6-b595-11ea-bb8b-bc764e2007e4;
 Tue, 23 Jun 2020 21:09:37 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EBBB320702;
 Tue, 23 Jun 2020 21:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592946577;
 bh=7hujf2lotec8Cu1SgpMN9oVDoN3aKH0nMa9Mcnr1Hqg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=A9joj/6XnubA5K4QmAxR8Krh6IeCkNViU+b/F5tKdtsnEMB5JZS8VoFAI2jCfLqoT
 Qv6TMmrUwVGMoi97vqFvKyPFIc5FAz09bqhAsicW56ejpIf1CE/EzsfU+EsgjnO4ml
 LM41Xp1zGRNyQwga/jtq0z3jN1Tq68Q+WelhZAaA=
Date: Tue, 23 Jun 2020 14:09:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 2/2] optee: allow plain TMEM buffers with NULL address
In-Reply-To: <2df789f3-e881-36a3-51f4-010b499990f5@xen.org>
Message-ID: <alpine.DEB.2.21.2006231403220.8121@sstabellini-ThinkPad-T480s>
References: <20200619223332.438344-1-volodymyr_babchuk@epam.com>
 <20200619223332.438344-3-volodymyr_babchuk@epam.com>
 <alpine.DEB.2.21.2006221809380.8121@sstabellini-ThinkPad-T480s>
 <87ftampkd7.fsf@epam.com> <2df789f3-e881-36a3-51f4-010b499990f5@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "pdurrant@amazon.com" <pdurrant@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 23 Jun 2020, Julien Grall wrote:
> On 23/06/2020 03:49, Volodymyr Babchuk wrote:
> > 
> > Hi Stefano,
> > 
> > Stefano Stabellini writes:
> > 
> > > On Fri, 19 Jun 2020, Volodymyr Babchuk wrote:
> > > > Trusted Applications use popular approach to determine required size
> > > > of buffer: client provides a memory reference with the NULL pointer to
> > > > a buffer. This is so called "Null memory reference". TA updates the
> > > > reference with the required size and returns it back to the
> > > > client. Then client allocates buffer of needed size and repeats the
> > > > operation.
> > > > 
> > > > This behavior is described in TEE Client API Specification, paragraph
> > > > 3.2.5. Memory References.
> > > > 
> > > > OP-TEE represents this null memory reference as a TMEM parameter with
> > > > buf_ptr = 0x0. This is the only case when we should allow TMEM
> > > > buffer without the OPTEE_MSG_ATTR_NONCONTIG flag. This also the
> > > > special case for a buffer with OPTEE_MSG_ATTR_NONCONTIG flag.
> > > > 
> > > > This could lead to a potential issue, because IPA 0x0 is a valid
> > > > address, but OP-TEE will treat it as a special case. So, care should
> > > > be taken when construction OP-TEE enabled guest to make sure that such
> > > > guest have no memory at IPA 0x0 and none of its memory is mapped at PA
> > > > 0x0.
> > > > 
> > > > Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> > > > ---
> > > > 
> > > > Changes from v1:
> > > >   - Added comment with TODO about possible PA/IPA 0x0 issue
> > > >   - The same is described in the commit message
> > > >   - Added check in translate_noncontig() for the NULL ptr buffer
> > > > 
> > > > ---
> > > >   xen/arch/arm/tee/optee.c | 27 ++++++++++++++++++++++++---
> > > >   1 file changed, 24 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/xen/arch/arm/tee/optee.c b/xen/arch/arm/tee/optee.c
> > > > index 6963238056..70bfef7e5f 100644
> > > > --- a/xen/arch/arm/tee/optee.c
> > > > +++ b/xen/arch/arm/tee/optee.c
> > > > @@ -215,6 +215,15 @@ static bool optee_probe(void)
> > > >       return true;
> > > >   }
> > > >   +/*
> > > > + * TODO: There is a potential issue with guests that either have RAM
> > > > + * at IPA of 0x0 or some of theirs memory is mapped at PA 0x0. This is
> > >                                 ^ their
> > > 
> > > > + * because PA of 0x0 is considered as NULL pointer by OP-TEE. It will
> > > > + * not be able to map buffer with such pointer to TA address space, or
> > > > + * use such buffer for communication with the guest. We either need to
> > > > + * check that guest have no such mappings or ensure that OP-TEE
> > > > + * enabled guest will not be created with such mappings.
> > > > + */
> > > >   static int optee_domain_init(struct domain *d)
> > > >   {
> > > >       struct arm_smccc_res resp;
> > > > @@ -725,6 +734,15 @@ static int translate_noncontig(struct optee_domain
> > > > *ctx,
> > > >           uint64_t next_page_data;
> > > >       } *guest_data, *xen_data;
> > > >   +    /*
> > > > +     * Special case: buffer with buf_ptr == 0x0 is considered as NULL
> > > > +     * pointer by OP-TEE. No translation is needed. This can lead to
> > > > +     * an issue as IPA 0x0 is a valid address for Xen. See the comment
> > > > +     * near optee_domain_init()
> > > > +     */
> > > > +    if ( !param->u.tmem.buf_ptr )
> > > > +        return 0;
> > > 
> > > Given that today it is not possible for this to happen, it could even be
> > > an ASSERT. But I think I would just return an error, maybe -EINVAL?
> > 
> > Hmm, looks like my comment is somewhat misleading :(
> 
> How about the following comment:
> 
> We don't want to translate NULL (0) as it can be used by the guest to fetch
> the size of the buffer to allocate. This behavior depends on TA, but there is
> a guarantee that OP-TEE will not try to map it (see more details on top of
> optee_domain_init()).
> 
> > 
> > What I mean, is that param->u.tmem.buf_ptr == 0 is the normal situation.
> > This is the special case, when OP-TEE treats this buffer as a NULL. So
> > we are doing nothing there. Thus, "return 0".
> > 
> > But, as Julien pointed out, we can have machine where 0x0 is the valid
> > memory address and there is a chance, that some guest will use it as a
> > pointer to buffer.
> > 
> > > Aside from this, and the small grammar issue, everything else looks fine
> > > to me.
> > > 
> > > Let's wait for Julien's reply, but if this is the only thing I could fix
> > > on commit.
> 
> I agree with Volodymyr, this is the normal case here. There are more work to
> prevent MFN 0 to be mapped in the guest but this shouldn't be an issue today.

Let's put the MFN 0 issue aside for a moment.

From the commit message I thought that if the guest wanted to pass a
NULL buffer ("Null memory reference") then it would also *not* set
OPTEE_MSG_ATTR_NONCONTIG, which would be handled by the "else" statement
also modified by this patch. Thus, I thought that reaching
translate_noncontig with buf_ptr == NULL would always be an error.

But re-reading the commit message and from both your answers it is not
the case: a "Null memory reference" is allowed with
OPTEE_MSG_ATTR_NONCONTIG set too.

Thus, I have no further comments and the improvements on the in-code
comment could be done on commit. 

