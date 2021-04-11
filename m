Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF05935B223
	for <lists+xen-devel@lfdr.de>; Sun, 11 Apr 2021 09:18:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108406.206966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVULl-0004yE-01; Sun, 11 Apr 2021 07:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108406.206966; Sun, 11 Apr 2021 07:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVULk-0004xp-TA; Sun, 11 Apr 2021 07:17:40 +0000
Received: by outflank-mailman (input) for mailman id 108406;
 Sun, 11 Apr 2021 07:17:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+bzv=JI=riomar.se=rio@srs-us1.protection.inumbo.net>)
 id 1lVULj-0004xk-4o
 for xen-devel@lists.xenproject.org; Sun, 11 Apr 2021 07:17:39 +0000
Received: from mail2.riocities.com (unknown [185.20.14.89])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c213d6b-40b5-4096-a4f0-47b1c22e9e1c;
 Sun, 11 Apr 2021 07:17:36 +0000 (UTC)
Received: from mail.riomar.se (81-230-197-241-no510.tbcn.telia.com
 [81.230.197.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail2.riocities.com (Postfix) with ESMTPSA id 836A4400B5;
 Sun, 11 Apr 2021 09:17:35 +0200 (CEST)
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
X-Inumbo-ID: 4c213d6b-40b5-4096-a4f0-47b1c22e9e1c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=riomar.se; s=mail;
	t=1618125455; bh=4ArJ6D+Yj7veNgG6lempBp9ryVszW2kwiBMlSbVGz0w=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=w+03JBly4kfdz9QrRCTID1K1Ik1hydeiSWwj6rFHGbdfba/71UHNmENC1lgYToKoY
	 mcRNNDqmHkBsq/aQf89xROzcd37NNYlAX1fnzwW3CGQN7ieJJEzRHGQMuYJuYqR2IR
	 n3NeS7Zd2DDjZl3Z2i/LzgXFUSovRgk3r60/G34Q=
Date: Sun, 11 Apr 2021 09:17:34 +0200
From: Henrik Riomar <rio@riomar.se>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: xenstore utils dropped support for -s in 4.15
Message-Id: <20210411091734.09ef653bf97aa954fecac079@riomar.se>
In-Reply-To: <215bcc74-baff-6345-73ed-16f7da266a1b@suse.com>
References: <20210411000215.0d0f4015bbfab8b1f20876bb@riomar.se>
	<215bcc74-baff-6345-73ed-16f7da266a1b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Apr 2021 07:34:16 +0200
Juergen Gross <jgross@suse.com> wrote:

> On 11.04.21 00:02, Henrik Riomar wrote:
> > Hi,
> > 
> > In Alpine and Debian (probably elsewhere as well), the -s flag removed in these two commits:
> >   * https://github.com/xen-project/xen/commit/fa06cb8c38832aafe597d719040ba1d216e367b8
> >   * https://github.com/xen-project/xen/commit/c65687ed16d2289ec91036ec2862a4b4bd34ea4f
> > is actually used in the init scripts.

> > Reverting the two commits mentioned above restores a booting system.
> > 
> > The -s flag was introduced in 2005 or so, so I guess you can say that dropping it should
> > at least be mentioned in the release notices, and an alternative be described, or
> > -s functionally should be brought back.
> 
> The -s served exactly no purpose.

yes its used by dists to check that the socket is actually accessible (without falling back to 
direct access to /dev/xen/xenbus).

> 
> It was meant to force socket usage. A socket will be used anyway in
> case xenstored is running in dom0, so specifying -s won't change
> anything in this case. 

yes reverting the to commits above and using -s, brings back the original behavior, returning
with failure if the socket is not there.

There are two issues here I think:
 1. dists actually use -s to check if the daemon is up (and been doing this for a long time)
 2. Reads of /dev/xen/xenbus (via xenstore-read -s /), blocks for ever in 4.15

/ Henrik


