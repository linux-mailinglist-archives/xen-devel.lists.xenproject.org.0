Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3474363D58
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 10:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112694.214928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYP8y-0006fs-P0; Mon, 19 Apr 2021 08:20:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112694.214928; Mon, 19 Apr 2021 08:20:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYP8y-0006fT-Lb; Mon, 19 Apr 2021 08:20:32 +0000
Received: by outflank-mailman (input) for mailman id 112694;
 Mon, 19 Apr 2021 08:20:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6e0X=JQ=riomar.se=rio@srs-us1.protection.inumbo.net>)
 id 1lYP8x-0006fM-7a
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 08:20:31 +0000
Received: from mail2.riocities.com (unknown [185.20.14.89])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b415107-6a44-4747-a3bc-714eba19c6e4;
 Mon, 19 Apr 2021 08:20:30 +0000 (UTC)
Received: from mail.riomar.se (81-230-197-241-no510.tbcn.telia.com
 [81.230.197.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by mail2.riocities.com (Postfix) with ESMTPSA id 2C7E6403B2;
 Mon, 19 Apr 2021 10:20:28 +0200 (CEST)
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
X-Inumbo-ID: 3b415107-6a44-4747-a3bc-714eba19c6e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=riomar.se; s=mail;
	t=1618820429; bh=dAvRtOAtF82txCYx8CqXAHZFc1ZLErZRiETcAItRFaM=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=TmwRxydKlvXSY8dmyIlOj7F27Gbjk2fe0ZXnspmk5M0Bs22RkODtCJVS52jr7bRqD
	 Hibp52vKDlT+9sdcnWrKyZmndNH66a+QAd/4fqlaE2mUK0LCvw0xCFI9/4Rs19rrcO
	 yZG7l6lhOs6VgZPB7UMQFG2Fu52ActWkRTerq55s=
Date: Mon, 19 Apr 2021 10:20:28 +0200
From: Henrik Riomar <rio@riomar.se>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: xenstore utils dropped support for -s in 4.15
Message-Id: <20210419102028.2159633400d98830a54d4d0a@riomar.se>
In-Reply-To: <6340da5e-a604-1ca3-4d89-0319e6ad12bc@suse.com>
References: <20210411000215.0d0f4015bbfab8b1f20876bb@riomar.se>
	<215bcc74-baff-6345-73ed-16f7da266a1b@suse.com>
	<20210411091734.09ef653bf97aa954fecac079@riomar.se>
	<6340da5e-a604-1ca3-4d89-0319e6ad12bc@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 11 Apr 2021 11:17:38 +0200
Juergen Gross <jgross@suse.com> wrote:

> On 11.04.21 09:17, Henrik Riomar wrote:
> > On Sun, 11 Apr 2021 07:34:16 +0200
> > Juergen Gross <jgross@suse.com> wrote:
> > 
> >> On 11.04.21 00:02, Henrik Riomar wrote:
> >>> Hi,
> >>>
> >>> In Alpine and Debian (probably elsewhere as well), the -s flag removed in these two commits:
> >>>    * https://github.com/xen-project/xen/commit/fa06cb8c38832aafe597d719040ba1d216e367b8
> >>>    * https://github.com/xen-project/xen/commit/c65687ed16d2289ec91036ec2862a4b4bd34ea4f
> >>> is actually used in the init scripts.
> > 
> >>> Reverting the two commits mentioned above restores a booting system.
> >>>
> >>> The -s flag was introduced in 2005 or so, so I guess you can say that dropping it should
> >>> at least be mentioned in the release notices, and an alternative be described, or
> >>> -s functionally should be brought back.
> >>
> >> The -s served exactly no purpose.
> > 
> > yes its used by dists to check that the socket is actually accessible (without falling back to
> > direct access to /dev/xen/xenbus).
> 
> There are Xen configurations where the socket is never accessible,
> as it is not existing.

sure, but this is in the start script for the daemon it self we use "xenstore-read -s /"
so it will also work if that script is used in a domain only running xenstored, right?

> 
> >> It was meant to force socket usage. A socket will be used anyway in
> >> case xenstored is running in dom0, so specifying -s won't change
> >> anything in this case.
> > 
> > yes reverting the to commits above and using -s, brings back the original behavior, returning
> > with failure if the socket is not there.
> 
> And returning failure when Xenstore is running fine, but not in dom0.

sure, -s means access via local socket so yes.

> 
> > There are two issues here I think:
> >   1. dists actually use -s to check if the daemon is up (and been doing this for a long time)
> 
> This should be changed, as it is based on wrong assumptions.

changed to what exactly? check for a pid file? that also only works locally just like
-s.

> 
> >   2. Reads of /dev/xen/xenbus (via xenstore-read -s /), blocks for ever in 4.15
> 
> So you are basically saying that you'd like to have a test "is Xenstore
> running", and this test should work with the "-s" flag.
> 
> I can look into that, but reverting the "access via socket" removal flag
> is not the way to go.
> 

Ok, so what should dists packaging 4.15 do? can the release notices be updated with this?

Thanks,
 Henrik

