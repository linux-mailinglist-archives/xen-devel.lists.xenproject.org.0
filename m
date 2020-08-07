Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6708C23F192
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 18:57:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k45fa-00042e-Hg; Fri, 07 Aug 2020 16:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tr6f=BR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k45fZ-00042Z-BR
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 16:56:37 +0000
X-Inumbo-ID: 893ed4c8-0c39-429e-8975-f20b523d7f7f
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 893ed4c8-0c39-429e-8975-f20b523d7f7f;
 Fri, 07 Aug 2020 16:56:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C48920866;
 Fri,  7 Aug 2020 16:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596819396;
 bh=L4Oo2e9/6G/FSJhkz8IPjwKYaQ0EbVwCkTFCedj4wbg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=hbqQRAcqeRAIK1Pip7I+BPWcgWaSSbDBQEA9p1KOM2bNPvCMF1KrrgnNFw5DffbwN
 q/ti0TCOEzMXEFhbe+CZQxfcb7QMPqB+tYySqYqfMPwp6mze4dckzl+B4BFTgbCple
 uADLkJ9QotGDM4lx8H2aZC+drxBJ34fiv6Ut8vfY=
Date: Fri, 7 Aug 2020 09:56:35 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 00/14] kernel-doc: public/arch-arm.h
In-Reply-To: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2008070953090.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
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
Cc: julien@xen.org, wl@xen.org, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

I am replying to this email as I have been told that the original was
filtered as spam due to the tarball attachment. The tarball contains
some example html output document files from sphinx.

I have uploaded the tarball here for your convenience:

http://xenbits.xenproject.org/people/sstabellini/html.tar.gz

You can read the original email below.


On Thu, 6 Aug 2020, Stefano Stabellini wrote:
> Hi all,
> 
> This patch series convert Xen in-code comments to the kernel-doc format:
> 
> https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html
> 
> 
> # WHAT WAS CONVERTED
> 
> I started from the public/ header files as I thought they are the most
> important to generated documentation for.
> 
> I didn't cover all files under xen/include/public/, but we don't have to
> boil the ocean in one go.
> 
> For the header files I addressed, I did cover all in-code comments
> except for very few exceptions where the conversion to kernel-doc format
> wasn't easily doable without major changes to the comments/code.
> 
> The conversion was done by hand (sigh!) but was mechanical, and only
> stylistic: I didn't change the content of the comments (only in a couple
> of places to make the English work right, e.g. when a comment has been
> split into two comments.)
> 
> 
> # THE KERNEL-DOC KEYWORDS USED
> 
> I used the "struct" keyword for structures, i.e.:
> 
> /**
>  * struct foobar
>  */
> 
> "struct" makes kernel-doc go and look at the following struct in the
> code, parses struct members comments, and generate a doc optimized to
> describe a struct. Note that in these cases the struct needs to follow
> immediately the comment. Thus, I had to move an #define between the
> comment and the struct in a few places.
> 
> Also note that kernel-doc supports nested structs but due to a quirk,
> comments for nested struct members cannot be on a single line. They have
> to be:
> 
>   struct foo {
>       struct {
>           /**
>            * @u.bar: foobar
>            */
>           bar;
>       } u;
>   }
> 
> Otherwise for normal struct the single line comment works fine:
> 
>   struct foo {
>       /** @bar: foobar */
>       bar;
>   }
> 
> 
> I used the "DOC" keyword otherwise. "DOC" is freeform, not particularly
> tied to anything following (functions, enums, etc.) I kept a black line
> between "DOC" and the following comment if multiline and no blank line
> if it is single line.
> 
>   /**
>    * DOC: doc1
>    * single line comment
>    */
> 
>    /**
>     * DOC: doc2
>     *
>     * this is
>     * multiline
>     */
> 
> DOC doesn't generate any cross-documents links but it is still a great
> place to start as it makes the in-code comments immediately available as
> documents. Linking and references can be added later.
> 
> 
> # HOW TO TEST IT
> 
> Simply run kernel-doc on a header file, for instance:
> 
>   ../linux/scripts/kernel-doc xen/include/public/event_channel.h > /tmp/doc.rst
> 
> You can inspect the rst file and also generate a html file out of it with
> sphinx:
> 
>   sphinx-quickstart
>   sphinx-build . /path/to/out
> 
> I am attaching two example output html files together with the static CSS
> and images to render them correctly. Note that of course I haven't
> worked on the CSS at all, clearly the style can be vastly improved, but
> I wanted to give you an idea of how readable they actually are even like
> this.
> 
> 
> Cheers,
> 
> Stefano
> 
> 
> The following changes since commit 81fd0d3ca4b2cd309403c6e8da662c325dd35750:
> 
>   x86/hvm: simplify 'mmio_direct' check in epte_get_entry_emt() (2020-07-31 17:43:31 +0200)
> 
> are available in the Git repository at:
> 
>   http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git hyp-docs-1 
> 
> for you to fetch changes up to abbd21dfa0ff14a7eb5faa57aaf3db24f83a149f:
> 
>   kernel-doc: public/hvm/params.h (2020-08-06 16:27:22 -0700)
> 
> ----------------------------------------------------------------
> Stefano Stabellini (14):
>       kernel-doc: public/arch-arm.h
>       kernel-doc: public/hvm/hvm_op.h
>       kernel-doc: public/device_tree_defs.h
>       kernel-doc: public/event_channel.h
>       kernel-doc: public/features.h
>       kernel-doc: public/grant_table.h
>       kernel-doc: public/hypfs.h
>       kernel-doc: public/memory.h
>       kernel-doc: public/sched.h
>       kernel-doc: public/vcpu.h
>       kernel-doc: public/version.h
>       kernel-doc: public/xen.h
>       kernel-doc: public/elfnote.h
>       kernel-doc: public/hvm/params.h
> 
>  xen/include/public/arch-arm.h         |  43 ++-
>  xen/include/public/device_tree_defs.h |  24 +-
>  xen/include/public/elfnote.h          | 109 +++++--
>  xen/include/public/event_channel.h    | 188 +++++++----
>  xen/include/public/features.h         |  78 +++--
>  xen/include/public/grant_table.h      | 443 +++++++++++++++-----------
>  xen/include/public/hvm/hvm_op.h       |  20 +-
>  xen/include/public/hvm/params.h       | 158 ++++++++--
>  xen/include/public/hypfs.h            |  72 +++--
>  xen/include/public/memory.h           | 232 +++++++++-----
>  xen/include/public/sched.h            | 129 +++++---
>  xen/include/public/vcpu.h             | 180 ++++++++---
>  xen/include/public/version.h          |  74 ++++-
>  xen/include/public/xen.h              | 567 ++++++++++++++++++++++------------
>  14 files changed, 1564 insertions(+), 753 deletions(-)

