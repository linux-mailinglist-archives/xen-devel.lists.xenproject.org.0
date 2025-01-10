Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 947B6A09C31
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 21:11:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870003.1281448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWLLd-0007sh-KA; Fri, 10 Jan 2025 20:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870003.1281448; Fri, 10 Jan 2025 20:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWLLd-0007qF-HX; Fri, 10 Jan 2025 20:11:13 +0000
Received: by outflank-mailman (input) for mailman id 870003;
 Fri, 10 Jan 2025 20:11:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RTL5=UC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tWLLb-0007q7-E9
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 20:11:11 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 058d9265-cf8f-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 21:11:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 50311A4287D;
 Fri, 10 Jan 2025 20:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83159C4CED6;
 Fri, 10 Jan 2025 20:11:03 +0000 (UTC)
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
X-Inumbo-ID: 058d9265-cf8f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736539864;
	bh=vyjcdsLa6PRt3lYhW4vysftDH2HNiVW6dG52oxM/ci4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=axKn1aj7ZwkXX1JVWvtAnAAbxKCvbUPLGLXCAuyv5hs2DMuffuGnlHKJUTgVxc76q
	 uzuVhW9fdPKO9ZkWjKYKqJxe6EXieGnUKGI9LLXdi0FwQsnQgxoxBDNIxcvjQBP93E
	 0p06Oj4kBPgrwDA87EShcCkiroeAzvyhzew7/L7+XXwO2s9DKpdc/q76F17OjAXy9h
	 J+/R6I1C35sl3iheCFPYooZIbNKhVIOV6fYSIDZMaZSw9OBUVtl2av+jVUhwOyoIwM
	 zdVxXpYp7C7VN2383ZJtjk790REx3b3Fd+bgDh8S3k0/wsdi1sx6O97RIGFxuR5mH1
	 8FTHGKZLWmwkg==
Date: Fri, 10 Jan 2025 12:11:02 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] CI: Add an x86_64 Clang Randconfig job
In-Reply-To: <D6YJY56LLW9U.1JHBJ5DF1A8UK@cloud.com>
Message-ID: <alpine.DEB.2.22.394.2501101210570.1731534@ubuntu-linux-20-04-desktop>
References: <20250110160217.183887-1-andrew.cooper3@citrix.com> <D6YJY56LLW9U.1JHBJ5DF1A8UK@cloud.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1405474099-1736539864=:1731534"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1405474099-1736539864=:1731534
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 10 Jan 2025, Alejandro Vallejo wrote:
> On Fri Jan 10, 2025 at 4:02 PM GMT, Andrew Cooper wrote:
> > This was recently identified as a hole in testing.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Roger Pau Monné <roger.pau@citrix.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > CC: Anthony PERARD <anthony.perard@vates.tech>
> > CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >
> > https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/8820980201
> > ---
> >  automation/gitlab-ci/build.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
> > index 3abd2a0c6575..cb84f379b754 100644
> > --- a/automation/gitlab-ci/build.yaml
> > +++ b/automation/gitlab-ci/build.yaml
> > @@ -551,6 +551,12 @@ debian-12-x86_64-clang:
> >    variables:
> >      CONTAINER: debian:12-x86_64
> >  
> > +debian-12-x86_64-clang-randconfig:
> > +  extends: .clang-x86-64-build
> > +  variables:
> > +    CONTAINER: debian:12-x86_64
> > +    RANDCONFIG: y
> > +
> >  debian-12-x86_64-gcc:
> >    extends: .gcc-x86-64-build
> >    variables:
> 
>   Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--8323329-1405474099-1736539864=:1731534--

