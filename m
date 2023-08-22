Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9431F784D58
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 01:32:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588787.920394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYarN-0006Lb-Oq; Tue, 22 Aug 2023 23:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588787.920394; Tue, 22 Aug 2023 23:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYarN-0006Ji-M3; Tue, 22 Aug 2023 23:32:29 +0000
Received: by outflank-mailman (input) for mailman id 588787;
 Tue, 22 Aug 2023 23:32:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gk3p=EH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qYarM-0006Jc-TR
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 23:32:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 269e8362-4144-11ee-9b0c-b553b5be7939;
 Wed, 23 Aug 2023 01:32:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05277639FC;
 Tue, 22 Aug 2023 23:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387E2C433C8;
 Tue, 22 Aug 2023 23:32:23 +0000 (UTC)
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
X-Inumbo-ID: 269e8362-4144-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692747144;
	bh=/LmPNMp2lqWs2FiJacKfkAUWQLIiik16dBKmml8Bqb8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=abw1XUk345OKKiB1u5rlbGdnkm8Y4PNCGcJUofLneoTDXy/8t74OE2J0Ii+91QD92
	 MNMfxdbAd7eSHeFIQqPGnPT1Dj93jv0Cc7A0407yIfNY24EtvfOIh2drwa/08uBT4A
	 /N1ENkzljzD+AG1vHx/2IMQENGP8PRLhTRJTu8W8nJfp+SmAZodIhoA9m2DJMy2nvW
	 QqT2V+Nb04RZ49vknC2IOwvMR89ek9E1yuI7sef4+ab5YpSv4upqmdjJo0YCTGqlAe
	 4ZWzAYmT/kMrh2tu9XCHBdBcq6mo6baovPjMHGWbhmv/BVcZaR+oNLSKNd/5Xz3YPW
	 qpBWCKlxGaHbg==
Date: Tue, 22 Aug 2023 16:32:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, jbeulich@suse.com, 
    andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    nicola.vetrini@bugseng.com, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] docs/misra: document gcc-specific behavior with
 shifting signed integers
In-Reply-To: <de59a660-1566-44eb-8fd8-b99499e97e99@xen.org>
Message-ID: <alpine.DEB.2.22.394.2308221624280.6458@ubuntu-linux-20-04-desktop>
References: <20230822010228.2517542-1-sstabellini@kernel.org> <de59a660-1566-44eb-8fd8-b99499e97e99@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Aug 2023, Julien Grall wrote:
> Hi Stefano,
> 
> On 22/08/2023 02:02, Stefano Stabellini wrote:
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > v2:
> > - split << and >>
> > - do not use the word "shift" instead of << or >>
> > ---
> >   docs/misra/C-language-toolchain.rst | 9 +++++++++
> >   1 file changed, 9 insertions(+)
> > 
> > diff --git a/docs/misra/C-language-toolchain.rst
> > b/docs/misra/C-language-toolchain.rst
> > index 785aed1eaf..4c4942a113 100644
> > --- a/docs/misra/C-language-toolchain.rst
> > +++ b/docs/misra/C-language-toolchain.rst
> > @@ -200,6 +200,15 @@ The table columns are as follows:
> >        - ARM64, X86_64
> >        - See Section "6.29 Designated Initializers" of GCC_MANUAL
> >   +   * - Signed << compiler-defined behavior
> > +     - All architectures
> > +     - See Section "4.5 Integers" of GCC_MANUAL. As an extension to the
> > +       C language, GCC does not use the latitude given in C99 and C11
> > +       only to treat certain aspects of signed << as undefined.
> > +
> > +   * - Signed >> acts on negative numbers by sign extension
> > +     - All architectures
> > +     - See Section "4.5 Integers" of GCC_MANUAL.
> 
> I noticed that all this document is referring to GCC. But we also support
> CLang. Did you confirm that CLang abide with this behavior?

Hi Julien,

No, only GCC. The analysis and documentation so far has been done only
for GCC, as you can see from all the various mentions and pointers to
the GCC manual scattered through C-language-toolchain.rst. Actually I
think it would be very useful for our users to do the same also for
CLang, given that some safety compilers are based on CLang. And it would
be very useful to know if there are any difference. If collectively we
start to find corresponding references to the CLang manual we could add
them one by one to C-language-toolchain.rst as we find them.

