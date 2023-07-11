Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C006574F8FA
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 22:22:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561894.878476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJJs5-0004Jk-FW; Tue, 11 Jul 2023 20:22:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561894.878476; Tue, 11 Jul 2023 20:22:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJJs5-0004He-BC; Tue, 11 Jul 2023 20:22:05 +0000
Received: by outflank-mailman (input) for mailman id 561894;
 Tue, 11 Jul 2023 20:22:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y2eC=C5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qJJs4-0004HQ-E8
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 20:22:04 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97094129-2028-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 22:22:01 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF209615DD;
 Tue, 11 Jul 2023 20:21:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19C0C433C7;
 Tue, 11 Jul 2023 20:21:57 +0000 (UTC)
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
X-Inumbo-ID: 97094129-2028-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689106919;
	bh=r4KvtknxjEgU9877fnlBP56JiN2iE8RjT2N8EO/YIqQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mdnASDEyKyvoKXrvCillevUmEXwUNfqcghzUlhdUKKbq7wSGoGkc6wFdy5Mf9D6dV
	 kvwwSyjeyVwTZz+AkdL6P5LZt/PoZIa3p6b6X1HKdGV3Dxk1q20HznQY6D2XXDkJYl
	 tHoKjawEyHCbhxdlC7Ty7fG94+AxaFFuUvZ56XGOCGnI/pLdVbGr9qF2wX61ANLDx0
	 zvGizsEgDkqgP+49xguK68XnIyHUxuwsW4xcdVfYeN6BSZKAigJvwbGy/OX70tT52x
	 SBqhFpYrXX/cAXquZ84sl7HhmMFjRXKxw8RFHNDtE6ctWADKV9uciB0bxPyinjbib0
	 G4ZFL3Vpt38fA==
Date: Tue, 11 Jul 2023 13:21:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <Luca.Fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, 
    "roger.pau@citrix.com" <roger.pau@citrix.com>, 
    "julien@xen.org" <julien@xen.org>, 
    "george.dunlap@citrix.com" <george.dunlap@citrix.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH v2] docs/misra: add Rule 7.4 and 9.4
In-Reply-To: <C67A4472-E79B-4902-879D-29E3E86D6305@arm.com>
Message-ID: <alpine.DEB.2.22.394.2307111314170.761183@ubuntu-linux-20-04-desktop>
References: <20230710202835.2052428-1-sstabellini@kernel.org> <C67A4472-E79B-4902-879D-29E3E86D6305@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1302662958-1689106469=:761183"
Content-ID: <alpine.DEB.2.22.394.2307111321520.761183@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1302662958-1689106469=:761183
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307111321521.761183@ubuntu-linux-20-04-desktop>

On Tue, 11 Jul 2023, Luca Fancellu wrote:
> > On 10 Jul 2023, at 21:28, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Rule 9.4 is non-controversial and we have no violations.
> > 
> > Rule 7.4 is considered a good idea with the caveat that assigning a
> > string literal to const void is allowed. I added a note to specify it.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > Changes in v2:
> > - improve rule 7.4 note
> > ---
> > docs/misra/rules.rst | 14 ++++++++++++++
> > 1 file changed, 14 insertions(+)
> > 
> > diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> > index 622f35410c..67ee8c029e 100644
> > --- a/docs/misra/rules.rst
> > +++ b/docs/misra/rules.rst
> > @@ -203,6 +203,15 @@ maintainers if you want to suggest a change.
> >      - The lowercase character l shall not be used in a literal suffix
> >      -
> > 
> > +   * - `Rule 7.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_07_04.c>`_
> > +     - Required
> > +     - A string literal shall not be assigned to an object unless the
> > +       objects type is pointer to const-qualified char
> 
> NIT: Should it be s/objects/object/ ?
> 
> > +     - All "character types" are permitted, as long as the string
> > +       element type and the character type match. (There should be no
> > +       casts.) Assigning a string literal to any object with type
> > +       "pointer to const-qualified void" is allowed.
> > +
> >    * - `Rule 8.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_08_01.c>`_
> >      - Required
> >      - Types shall be explicitly specified
> > @@ -275,6 +284,11 @@ maintainers if you want to suggest a change.
> >        braces
> >      -
> > 
> > +   * - `Rule 9.4 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_09_04.c>`_
> > +     - Required
> > +     - An element of an object shall not be initialized more than once
> > +     -
> > +
> >    * - `Rule 12.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_12_05.c>`_
> >      - Mandatory
> >      - The sizeof operator shall not have an operand which is a function
> > -- 
> > 2.25.1
> > 
> > 
> 
> Apart from that, I’ve used the file with our script to import the rules and it worked.
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
 
Thanks! I fixed the typo on commit
--8323329-1302662958-1689106469=:761183--

