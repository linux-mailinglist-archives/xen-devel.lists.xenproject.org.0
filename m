Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5CA1286C58
	for <lists+xen-devel@lfdr.de>; Thu,  8 Oct 2020 03:09:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3845.11447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQKPO-0003JB-1I; Thu, 08 Oct 2020 01:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3845.11447; Thu, 08 Oct 2020 01:07:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQKPN-0003Im-Tl; Thu, 08 Oct 2020 01:07:49 +0000
Received: by outflank-mailman (input) for mailman id 3845;
 Thu, 08 Oct 2020 01:07:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t5hJ=DP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kQKPM-0003Ih-6K
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 01:07:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0fcfd36-877f-4d34-b0df-9c792ed31aad;
 Thu, 08 Oct 2020 01:07:46 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E02D20872;
 Thu,  8 Oct 2020 01:07:45 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=t5hJ=DP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kQKPM-0003Ih-6K
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 01:07:48 +0000
X-Inumbo-ID: e0fcfd36-877f-4d34-b0df-9c792ed31aad
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e0fcfd36-877f-4d34-b0df-9c792ed31aad;
	Thu, 08 Oct 2020 01:07:46 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0E02D20872;
	Thu,  8 Oct 2020 01:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602119265;
	bh=rMLfJWcMmXi0+/xXn3mlI+M9goai9L6dZfHG486iEsQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eO2CVbkpc1n5JZbxM08bS803nUBBKWh1YnKqS6Vq0CjJkU5W9sUUDD9PxO/hdBVOf
	 KyUfIy1lc2Se3htKDhST1c1gEe3zSZQUSoNLNA9VSY267Im04cR4BwlV6irj3WC9Yj
	 qFKQ/pCzsZA49skhIMqdG+9CKvW9ghF84OjNhQ3s=
Date: Wed, 7 Oct 2020 18:07:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
cc: "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>, 
    "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>, 
    "vicooodin@gmail.com" <vicooodin@gmail.com>, 
    "julien@xen.org" <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    "committers@xenproject.org" <committers@xenproject.org>, 
    "jbeulich@suse.com" <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen Coding style and clang-format
In-Reply-To: <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
Message-ID: <alpine.DEB.2.21.2010071750360.23978@sstabellini-ThinkPad-T480s>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>  <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>  <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>  <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>  <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
 <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1082716634-1602119265=:23978"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1082716634-1602119265=:23978
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 7 Oct 2020, Anastasiia Lukianenko wrote:
> On Thu, 2020-10-01 at 10:06 +0000, George Dunlap wrote:
> > > On Oct 1, 2020, at 10:06 AM, Anastasiia Lukianenko <
> > > Anastasiia_Lukianenko@epam.com> wrote:
> > > 
> > > Hi,
> > > 
> > > On Wed, 2020-09-30 at 10:24 +0000, George Dunlap wrote:
> > > > > On Sep 30, 2020, at 10:57 AM, Jan Beulich <jbeulich@suse.com>
> > > > > wrote:
> > > > > 
> > > > > On 30.09.2020 11:18, Anastasiia Lukianenko wrote:
> > > > > > I would like to know your opinion on the following coding
> > > > > > style
> > > > > > cases.
> > > > > > Which option do you think is correct?
> > > > > > 1) Function prototype when the string length is longer than
> > > > > > the
> > > > > > allowed
> > > > > > one
> > > > > > -static int __init
> > > > > > -acpi_parse_gic_cpu_interface(struct acpi_subtable_header
> > > > > > *header,
> > > > > > -                             const unsigned long end)
> > > > > > +static int __init acpi_parse_gic_cpu_interface(
> > > > > > +    struct acpi_subtable_header *header, const unsigned long
> > > > > > end)
> > > > > 
> > > > > Both variants are deemed valid style, I think (same also goes
> > > > > for
> > > > > function calls with this same problem). In fact you mix two
> > > > > different style aspects together (placement of parameter
> > > > > declarations and placement of return type etc) - for each
> > > > > individually both forms are deemed acceptable, I think.
> > > > 
> > > > If we’re going to have a tool go through and report (correct?)
> > > > all
> > > > these coding style things, it’s an opportunity to think if we
> > > > want to
> > > > add new coding style requirements (or change existing
> > > > requirements).
> > > > 
> > > 
> > > I am ready to discuss new requirements and implement them in rules
> > > of
> > > the Xen Coding style checker.
> > 
> > Thank you. :-)  But what I meant was: Right now we don’t require one
> > approach or the other for this specific instance.  Do we want to
> > choose one?
> > 
> > I think in this case it makes sense to do the easiest thing.  If it’s
> > easy to make the current tool accept both styles, let’s just do that
> > for now.  If the tool currently forces you to choose one of the two
> > styles, let’s choose one.
> > 
> >  -George
> 
> During the detailed study of the Xen checker and the Clang-Format Style
> Options, it was found that this tool, unfortunately, is not so flexible
> to allow the author to independently choose the formatting style in
> situations that I described in the last letter. For example define code
> style:
> -#define ALLREGS \
> -    C(r0, r0_usr);   C(r1, r1_usr);   C(r2, r2_usr);   C(r3,
> r3_usr);   \
> -    C(cpsr, cpsr)
> +#define ALLREGS            \
> +    C(r0, r0_usr);         \
> +    C(r1, r1_usr);         \
> +    C(r2, r2_usr);         \
> There are also some inconsistencies in the formatting of the tool and
> what is written in the hyung coding style rules. For example, the
> comment format:
> -    /* PC should be always a multiple of 4, as Xen is using ARM
> instruction set */
> +    /* PC should be always a multiple of 4, as Xen is using ARM
> instruction set
> +     */
> I would like to draw your attention to the fact that the comment
> behaves in this way, since the line length exceeds the allowable one.
> The ReflowComments option is responsible for this format. It can be
> turned off, but then the result will be:
> ReflowComments=false:
> /* second veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongComment with
> plenty of information */
> 
> ReflowComments=true:
> /* second veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongComment with
> plenty of
>  * information */

To me, the principal goal of the tool is to identify code style
violations. Suggesting how to fix a violation is an added bonus but not
strictly necessary.

So, I think we definitely want the tool to report the following line as
an error, because the line is too long:

/* second veryVeryVeryVeryVeryVeryVeryVeryVeryVeryVeryLongComment with plenty of information */

The suggestion on how to fix it is less important. Do we need to set
ReflowComments=true if we want to the tool to report the line as
erroneous? I take that the answer is "yes"?


> So I want to know if the community is ready to add new formatting
> options and edit old ones. Below I will give examples of what
> corrections the checker is currently making (the first variant in each
> case is existing code and the second variant is formatted by checker).
> If they fit the standards, then I can document them in the coding
> style. If not, then I try to configure the checker. But the idea is
> that we need to choose one option that will be considered correct.
>
> 1) Function prototype when the string length is longer than the allowed
> -static int __init
> -acpi_parse_gic_cpu_interface(struct acpi_subtable_header *header,
> -                             const unsigned long end)
> +static int __init acpi_parse_gic_cpu_interface(
> +    struct acpi_subtable_header *header, const unsigned long end)
> 2) Wrapping an operation to a new line when the string length is longer
> than the allowed
> -    status = acpi_get_table(ACPI_SIG_SPCR, 0,
> -                            (struct acpi_table_header **)&spcr);
> +    status =
> +        acpi_get_table(ACPI_SIG_SPCR, 0, (struct acpi_table_header
> **)&spcr);
> 3) Space after brackets
> -    return ((char *) base + offset);
> +    return ((char *)base + offset);
> 4) Spaces in brackets in switch condition
> -    switch ( domctl->cmd )
> +    switch (domctl->cmd)
> 5) Spaces in brackets in operation
> -    imm = ( insn >> BRANCH_INSN_IMM_SHIFT ) & BRANCH_INSN_IMM_MASK;
> +    imm = (insn >> BRANCH_INSN_IMM_SHIFT) & BRANCH_INSN_IMM_MASK;
> 6) Spaces in brackets in return
> -        return ( !sym->name[2] || sym->name[2] == '.' );
> +        return (!sym->name[2] || sym->name[2] == '.');
> 7) Space after sizeof
> -    clean_and_invalidate_dcache_va_range(new_ptr, sizeof (*new_ptr) *
> len);
> +    clean_and_invalidate_dcache_va_range(new_ptr, sizeof(*new_ptr) *
> len);
> 8) Spaces before comment if it’s on the same line
> -    case R_ARM_MOVT_ABS: /* S + A */
> +    case R_ARM_MOVT_ABS:    /* S + A */
> 
> -    if ( tmp == 0UL )       /* Are any bits set? */
> -        return result + size;   /* Nope. */
> +    if ( tmp == 0UL )         /* Are any bits set? */
> +        return result + size; /* Nope. */
> 
> 9) Space after for_each_vcpu
> -        for_each_vcpu(d, v)
> +        for_each_vcpu (d, v)
> 10) Spaces in declaration
> -    union hsr hsr = { .bits = regs->hsr };
> +    union hsr hsr = {.bits = regs->hsr};

None of these points are particularly problematic to me. I think that
some of them are good to have anyway, like 3) and 8). Some others are
not great, in particular 1) and 2), and I would prefer to keep the
current coding style for those, but I'd be certainly happy to make those
changes anyway if we get a good code style checker in exchange :-)
--8323329-1082716634-1602119265=:23978--

