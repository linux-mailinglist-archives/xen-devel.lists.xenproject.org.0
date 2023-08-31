Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F378E476
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 03:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593307.926288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWfy-0006QM-Lr; Thu, 31 Aug 2023 01:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593307.926288; Thu, 31 Aug 2023 01:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbWfy-0006Of-Ik; Thu, 31 Aug 2023 01:40:50 +0000
Received: by outflank-mailman (input) for mailman id 593307;
 Thu, 31 Aug 2023 01:40:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IFXE=EQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qbWfw-0006OU-TB
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 01:40:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68054525-479f-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 03:40:46 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 06FC4B82155;
 Thu, 31 Aug 2023 01:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8B3C433C8;
 Thu, 31 Aug 2023 01:40:43 +0000 (UTC)
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
X-Inumbo-ID: 68054525-479f-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693446044;
	bh=1eXJTQ0SxzUPQPN7rbTLn6SUCm/LszkdLog00ZbbM4w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jR8xKfX4C04nXslObo0pJd5UD9EVDz2D/nzC99HI8Or/kneNY2RBWzfg5Ocg9xaS9
	 0/VLbbByk9swx5cBWEldAtJlG7rdJVdslNwtW/BPZhEvgU6D8LcXmlxsYRH90Rt7Fb
	 I2Bbnf8mwmVth1wcK4g+dkHZKLBmekfdoANkLHp8USSidiw0fJCQdd1loJzGd7f5Cd
	 Z5EFBn1mzlLFN81h7iEUWuM0gtVVPRvOZT5WF0wpF/ZUvGo+iX2Wlhkk8nfo9GTgKH
	 Pn+4RntbMRYEF3es7oMfPzw5QyIRNrJIdwjjMyhnSc1G4Ozw93V97I3mfT9DfPNoOJ
	 6xPMiI8vLDbJw==
Date: Wed, 30 Aug 2023 18:40:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    "nicola.vetrini@bugseng.com" <nicola.vetrini@bugseng.com>, 
    "roberto.bagnara@bugseng.com" <roberto.bagnara@bugseng.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] docs/misra: add 14.3 and 14.4
In-Reply-To: <C2070A06-265A-48EC-9A67-34D820B2F94E@arm.com>
Message-ID: <alpine.DEB.2.22.394.2308301834400.6458@ubuntu-linux-20-04-desktop>
References: <20230830005950.305085-1-sstabellini@kernel.org> <C2070A06-265A-48EC-9A67-34D820B2F94E@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 30 Aug 2023, Bertrand Marquis wrote:
> Hi Stefano,
> 
> > On 30 Aug 2023, at 02:59, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Add 14.3, with a project-wide deviations on if statements.
> > Add 14.4, clarifying that implicit conversions of integers, chars and
> > pointers to bool are allowed.
> > 
> > Also take the opportunity to clarify that parameters of function pointer
> > types are expected to have names (Rule 8.2).
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > docs/misra/rules.rst | 20 +++++++++++++++++++-
> > 1 file changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index db30632b93..6cde4feeae 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -234,7 +234,7 @@ maintainers if you want to suggest a change.
> >    * - `Rule 8.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_02.c>`_
> >      - Required
> >      - Function types shall be in prototype form with named parameters
> > -     -
> > +     - Function pointer types shall have named parameters too.
> 
> 
> I would just modify to Function and Function pointers types shall be ...

Sure, I can do that.


> > 
> >    * - `Rule 8.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_03.c>`_
> >      - Required
> > @@ -332,6 +332,24 @@ maintainers if you want to suggest a change.
> >      - A loop counter shall not have essentially floating type
> >      -
> > 
> > +   * - `Rule 14.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_14_03.c>`_
> > +     - Required
> > +     - Controlling expressions shall not be invariant
> > +     - Due to the extensive usage of IS_ENABLED, sizeof compile-time
> > +       checks, and other constructs that are detected as errors by MISRA
> > +       C scanners, managing the configuration of a MISRA C scanner for
> > +       this rule would be unmanageable. Thus, this rule is adopted with
> > +       a project-wide deviation on 'if' statements. The rule only
> > +       applies to while, for, do ... while, ?:, and switch statements.
> 
> Didn't we also said that we would accept while(0) and while(1) ?
> Also i agree with Jan, ? is really the same as if so we should not treat it differently.

I took the list of things the rule applies to from the text of the rule
itself. However, I think you are right about the ?: and it should be
deviated together with if. I can also add while(0) and while(1).

