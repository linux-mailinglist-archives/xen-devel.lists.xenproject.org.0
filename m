Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CD27CECFF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 02:55:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618852.963062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtHJ3-0008Cw-BZ; Thu, 19 Oct 2023 00:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618852.963062; Thu, 19 Oct 2023 00:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtHJ3-0008Al-8p; Thu, 19 Oct 2023 00:54:33 +0000
Received: by outflank-mailman (input) for mailman id 618852;
 Thu, 19 Oct 2023 00:54:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtHJ1-000897-Gx
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 00:54:31 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f279688-6e1a-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 02:54:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 7C6B8B8255C;
 Thu, 19 Oct 2023 00:54:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B6AC433C7;
 Thu, 19 Oct 2023 00:54:26 +0000 (UTC)
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
X-Inumbo-ID: 0f279688-6e1a-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697676868;
	bh=uKeNYQwAKnp5SXyY7crlpoaPoKUENkes0QvlVqflHrk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gGtKMMlyIcJawus6ev0aPtJ5HDR9c6Gqxi2EpUGAkVvE0wY5J5Zs3eof/TvEs2pdE
	 c3fDn+VLdiXxD/N2meCG0Owtb0vrfBd3xFGVega8AMcoKSKOwvPSYq4DNoQOYsLCR+
	 43t/4G95A0ibcncy1RhOzSV2FFmSijLKaXQmKo9qgI0nPx6s0dQoL/zvWnrVPW+j4z
	 9VpesuSb40MCtRLfh2LGZVFtz29ybI6O7xnBrhqaWJ58UbYSEK7FqkJ3ZAMPsLE+VM
	 +O9fwX+DKtbp5UtooQxQeik6yg05Y7ttw17tymaVB3C+XDuKnzd0XzkwWpBXWqP12L
	 4kVVFK5+wUCjg==
Date: Wed, 18 Oct 2023 17:54:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: andrew.cooper3@citrix.com
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v3] xen: address violations of Rule 11.9
In-Reply-To: <35abc556-2f66-4498-b567-87e6a3216d50@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2310181745300.965337@ubuntu-linux-20-04-desktop>
References: <d760ef0c088dc15ecc411b83640735123444f887.1697636446.git.nicola.vetrini@bugseng.com> <35abc556-2f66-4498-b567-87e6a3216d50@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1979245646-1697676384=:965337"
Content-ID: <alpine.DEB.2.22.394.2310181746290.965337@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1979245646-1697676384=:965337
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2310181746291.965337@ubuntu-linux-20-04-desktop>

On Thu, 19 Oct 2023, andrew.cooper3@citrix.com wrote:
> On 18/10/2023 2:42 pm, Nicola Vetrini wrote:
> > diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> > index ee7aed0609d2..1b00e4e3e9b7 100644
> > --- a/docs/misra/deviations.rst
> > +++ b/docs/misra/deviations.rst
> > @@ -199,6 +199,11 @@ Deviations related to MISRA C:2012 Rules:
> >         See automation/eclair_analysis/deviations.ecl for the full explanation.
> >       - Tagged as `safe` for ECLAIR.
> >  
> > +   * - R11.9
> > +     - __ACCESS_ONCE uses a 0 as a null pointer constant to check if a type is
> > +       scalar, therefore its usage for this purpose is allowed.
> 
> This is still deeply misleading.
> 
> There is an integer, which happens to be 0 but could be anything, used
> for a compile time typecheck[1].  In some cases this may be interpreted
> as a pointer constant, and is permitted for this purpose.
> 
> ~Andrew
> 
> [1] I know I wrote scalar typecheck in the comment, but I suspect that
> what I actually meant was non-compound-type typecheck.

To help Nicola find the right wording do you have a concrete suggestion
for the text to use?

Reading your reply, I am guessing it would be:

* - R11.9
  - __ACCESS_ONCE uses an integer, which happens to be zero, as a
    non-compound-type typecheck. The typecheck uses a cast. The usage of
    zero or other integers for this purpose is allowed.

Andrew, please confirm? Nicola, please also confirm that this version of
the text would be suitable for an assessor.
--8323329-1979245646-1697676384=:965337--

