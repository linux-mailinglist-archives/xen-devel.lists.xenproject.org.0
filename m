Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC6AD0926
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 22:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008864.1388035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNe0p-0006vj-99; Fri, 06 Jun 2025 20:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008864.1388035; Fri, 06 Jun 2025 20:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNe0p-0006t0-60; Fri, 06 Jun 2025 20:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1008864;
 Fri, 06 Jun 2025 20:50:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRk0=YV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uNe0n-0006Zl-N6
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 20:50:01 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf619af4-4317-11f0-a303-13f23c93f187;
 Fri, 06 Jun 2025 22:50:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 62A254A004;
 Fri,  6 Jun 2025 20:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21248C4CEEB;
 Fri,  6 Jun 2025 20:49:57 +0000 (UTC)
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
X-Inumbo-ID: cf619af4-4317-11f0-a303-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749242998;
	bh=xAy6gZUzwwIuy9i+E0bR+GSdhMng2kiIqWPC2S9quIk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kv6hC3yYXEo3j9YzmQZAzC46fIpzTdVbfy++M3Bcw5k8iGFmeJKFb7voDlU6QY6bn
	 jmWV25qqXF1EsJqJ/8e3ANtilF9HUsse6w6TfdnRc7huO2100IP8LvWmvIM1XOaiRJ
	 b7ZO4AamEZbJ9CqiB6ZldbI18xtnv8V0MCiZxGE3gMp3t18WL33ek2qKeSXxXV02eX
	 9+TQfsH5qVxy42lkKpJpKhG7xRF/+GXFA/upAOUHyIcgTagwreiOvl5w6sWhUzWdg5
	 OItIQDCddDwcsqoy1BeNq180akgMn4U5KqhyTj+R/42yeiJciSmZA0m9XTOfuA+3sR
	 f1irPngEc9BOw==
Date: Fri, 6 Jun 2025 13:49:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <stefano.stabellini@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>, 
    xen-devel@lists.xenproject.org, federico.serafini@bugseng.com
Subject: Re: [PATCH] x86: remove memcmp calls non-compliant with Rule
 21.16.
In-Reply-To: <13ad335c1868bcc02e2dc0a8da521f6d@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2506061347230.2495561@ubuntu-linux-20-04-desktop>
References: <20250604233537.2892206-1-stefano.stabellini@amd.com> <c252a43a-4e00-4584-bbb1-05347aa9b49f@suse.com> <alpine.DEB.2.22.394.2506051624050.2495561@ubuntu-linux-20-04-desktop> <13ad335c1868bcc02e2dc0a8da521f6d@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Jun 2025, Nicola Vetrini wrote:
> > > > Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
> > > 
> > > Missing your own S-o-b.
> > > 
> > > Also (nit) may I ask that you drop the full stop from the patch subject?
> > 
> > I'll add the S-o-B and fix the subject
> > 
> > 
> > > > --- a/xen/arch/x86/dmi_scan.c
> > > > +++ b/xen/arch/x86/dmi_scan.c
> > > > @@ -233,7 +233,7 @@ void __init dmi_efi_get_table(const void *smbios,
> > > const void *smbios3)
> > > >  	const struct smbios_eps *eps = smbios;
> > > >  	const struct smbios3_eps *eps3 = smbios3;
> > > >
> > > > -	if (eps3 && memcmp(eps3->anchor, "_SM3_", 5) == 0 &&
> > > > +	if (eps3 && strncmp(eps3->anchor, "_SM3_", 5) == 0 &&
> > > 
> > > Unlike the last example given in the doc, this does not pose the risk of
> > > false "not equal" returns. Considering there's no example there exactly
> > > matching this situation, I'm not convinced a change is actually needed.
> > > (Applies to all other changes here, too.)
> > 
> > If we consider string literals "pointer types", then I think you are
> > right that this would fall under what is permitted by 21.16. Nicola,
> > what do you think?
> > 
> 
> While I agree that the result of the comparison is correct either way in these
> cases, the rule is written to be simple to apply (i.e., not limited only to
> those cases that may differ), and in particular in the rationale it is
> indicated that using memcmp to compare string *may* indicate a mistake. As
> written above, deviating the string literal comparisons is an option, which
> can be justified with efficiency concerns, but it goes a bit against the
> rationale of the rule itself.

Also looking at Andrew's reply, it seems that the preference is to
deviate string literals. The change to docs/misra/rules.rst is easy
enough, but I am not sure how to make the corresponding change to
analysis.ecl.

diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
index e1c26030e8..56b6e351df 100644
--- a/docs/misra/rules.rst
+++ b/docs/misra/rules.rst
@@ -813,7 +813,7 @@ maintainers if you want to suggest a change.
        shall point to either a pointer type, an essentially signed type,
        an essentially unsigned type, an essentially Boolean type or an
        essentially enum type
-     - void* arguments are allowed
+     - void* and string literals arguments are allowed
 
    * - `Rule 21.17 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_17.c>`_
      - Mandatory

