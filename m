Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8F8B2D01
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 00:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712303.1112906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s07Sz-0004bU-7E; Thu, 25 Apr 2024 22:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712303.1112906; Thu, 25 Apr 2024 22:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s07Sz-0004ZE-4Z; Thu, 25 Apr 2024 22:21:21 +0000
Received: by outflank-mailman (input) for mailman id 712303;
 Thu, 25 Apr 2024 22:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s07Sy-0004Z6-5a
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 22:21:20 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 222343ae-0352-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 00:21:19 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 231E1CE1A71;
 Thu, 25 Apr 2024 22:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CF2C113CC;
 Thu, 25 Apr 2024 22:21:12 +0000 (UTC)
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
X-Inumbo-ID: 222343ae-0352-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714083673;
	bh=OywBcdZvXhJ0MSAJ0qSpTUpskrZCQuOA2U9prHZok3w=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XyHAZf1OcnHcFgEarcIvcVnR3HVYxzBr93FEe+lVT0KO3edarG7MtYi13HUTEW096
	 Sem/NVbhjKhKByhjwYOXD8HenX4gdfEydw0QFCQcxuD1XorIgA/3TF4D4qK/YFqbzA
	 7VAYWd160beVQWkJAhSMI67Xh15JrmQhwtkPJrZQm97iLyPNJ7w3YuTTW5G8nrifqi
	 99DQ5+CkGaP6brU4cEhiYzBqwDDv5sMYQSt2rOBnI0aB0n6tQS/XmlD9gEoXalFBQU
	 xxOwJXWSrxWw0IodrZsqWCiZOeGMqVfTaz0ty50RoecOEdH2u6Z4UaLTjljgBpEbSd
	 9ZHpEApOlJ4Gg==
Date: Thu, 25 Apr 2024 15:21:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v1 13/15] x86: wire cpu_has_{svm/vmx}_* to false when
 svm/vmx not enabled
In-Reply-To: <5363530b-fbdb-4d7e-afcd-b71b1e681e5a@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404251519070.3940@ubuntu-linux-20-04-desktop>
References: <20240416064606.3470052-1-Sergiy_Kibrik@epam.com> <fb54fefb-404f-43a4-aea9-28649927c353@citrix.com> <5363530b-fbdb-4d7e-afcd-b71b1e681e5a@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-828189335-1714083554=:3940"
Content-ID: <alpine.DEB.2.22.394.2404251519350.3940@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-828189335-1714083554=:3940
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2404251519351.3940@ubuntu-linux-20-04-desktop>

On Thu, 18 Apr 2024, Sergiy Kibrik wrote:
> 16.04.24 16:26, Andrew Cooper:
> > I'm afraid this is going in an unhelpful direction.  We want to move
> > both of these files to be local to arch/x86/hvm/{vmx,svm}/.
> > 
> > cpu_has_svm_* isn't actually used outside of svm/; only the plain
> > SVM_FEATURE_* constants are, and that's only because they're not
> > expressed as plain cpu features yet.
> > 
> > cpu_has_vmx_* has a few more users, but most are unlikely to remain in
> > this form.  One critical set of changes to fix vulnerabilities in
> > nested-virt is to make almost of of these decisions based on per-domain
> > state, not host state.  The aspects which are host state should be in
> > regular cpu features.
> > 
> > I already volunteered to sort out the SEV feature leaf properly, and I
> > was going to do the SVM leaf while I was at it.  If you can wait a few
> > days, I might be able to make half of this problem disappear.
> 
> I guess it can wait, surely if a better solution is to be crafted at the end.
> 
> Stefano, what's your opinion on that?

I think Andrew's suggested direction is cleaner. We can certainly wait a
few days for Andrew to make progress. We can also follow Andrew's
suggestion in the next version of the series ourselves.
--8323329-828189335-1714083554=:3940--

