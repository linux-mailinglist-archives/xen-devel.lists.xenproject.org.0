Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B04647D5C60
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 22:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622608.969611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvO07-0005xi-3M; Tue, 24 Oct 2023 20:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622608.969611; Tue, 24 Oct 2023 20:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvO07-0005uf-0J; Tue, 24 Oct 2023 20:27:43 +0000
Received: by outflank-mailman (input) for mailman id 622608;
 Tue, 24 Oct 2023 20:27:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl3Y=GG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qvO05-0005uY-8p
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 20:27:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c49a6bed-72ab-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 22:27:36 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 828EC62CB1;
 Tue, 24 Oct 2023 20:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C033BC433C7;
 Tue, 24 Oct 2023 20:27:33 +0000 (UTC)
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
X-Inumbo-ID: c49a6bed-72ab-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698179255;
	bh=cHKTnmUeR2VrjWc/OSPd2rnr8CJlC0jZrj5hRpfZyeQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RSMnw0I/FJzGrsPfkbqaPDqIGourQE6p2UKn3GCnFnkCYAanPtD1dQE1T3ECFnQYU
	 /daOUh3NL9tppTMrLBiImj5PRIyQ/hPvcpDp7mppnWsrmAiACJ/f9TtUHztOLuogLN
	 rtPwr4huHo+K96smE8Bhj2cv8TnH0zxaO9kaVfL+ShP0rRsQK423BmXfkxUufPwONa
	 WyUGIc22PBWet9RrHHHxnJZfmsGujmJCk4bhWwIoJa6BeRtOPnzGkbtvnWsaUX6XAI
	 cEWTYzEQd3xzi7SvAP2IWGuzMSgWjCWc5ZN4490/sfQRPZq+9CbX2oP5hT56Mhs+Un
	 TdCVWvc5OqqMw==
Date: Tue, 24 Oct 2023 13:27:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [RFC 1/4] x86/ioemul: address MISRA C:2012 Rule 9.3
In-Reply-To: <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com>
Message-ID: <alpine.DEB.2.22.394.2310241317030.271731@ubuntu-linux-20-04-desktop>
References: <cover.1698155925.git.nicola.vetrini@bugseng.com> <76c9f78179a8bb5b4f99b34f163933394f79066c.1698155925.git.nicola.vetrini@bugseng.com> <60e26ad6-7366-2604-e9b2-ed401cee6e73@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Oct 2023, Jan Beulich wrote:
> On 24.10.2023 16:31, Nicola Vetrini wrote:
> > Partially explicitly initalized .matches arrays result in violations
> > of Rule 9.3; this is resolved by using designated initializers,
> > which is permitted by the Rule.
> > 
> > Mechanical changes.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> While not overly bad, I'm still not really seeing the improvement.
> Yet aiui changes induced by Misra are supposed to improve things in
> some direction?
 
I think the improvement is clarity, in the sense that the designated
initializers make it clearer that the array may be sparsely initialized
and that the remaining elements should be initialized to zero
automatically.
 

> > --- a/xen/arch/x86/ioport_emulate.c
> > +++ b/xen/arch/x86/ioport_emulate.c
> > @@ -44,57 +44,57 @@ static const struct dmi_system_id __initconstrel ioport_quirks_tbl[] = {
> >      {
> >          .ident = "HP ProLiant DL3xx",
> >          .matches = {
> > -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3"),
> > +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL3"),
> >          },
> >      },
> >      {
> >          .ident = "HP ProLiant DL5xx",
> >          .matches = {
> > -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
> > +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL5"),
> >          },
> >      },
> >      {
> >          .ident = "HP ProLiant DL7xx",
> >          .matches = {
> > -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7"),
> > +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant DL7"),
> >          },
> >      },
> >      {
> >          .ident = "HP ProLiant ML3xx",
> >          .matches = {
> > -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3"),
> > +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML3"),
> >          },
> >      },
> >      {
> >          .ident = "HP ProLiant ML5xx",
> >          .matches = {
> > -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5"),
> > +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant ML5"),
> >          },
> >      },
> >      {
> >          .ident = "HP ProLiant BL2xx",
> >          .matches = {
> > -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2"),
> > +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL2"),
> >          },
> >      },
> >      {
> >          .ident = "HP ProLiant BL4xx",
> >          .matches = {
> > -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4"),
> > +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL4"),
> >          },
> >      },
> >      {
> >          .ident = "HP ProLiant BL6xx",
> >          .matches = {
> > -            DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > -            DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6"),
> > +            [0] = DMI_MATCH(DMI_BIOS_VENDOR, "HP"),
> > +            [1] = DMI_MATCH(DMI_PRODUCT_NAME, "ProLiant BL6"),
> >          },
> >      },
> >      { }
> > --
> > 2.34.1
> 

