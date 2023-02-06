Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F9F68C88F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 22:24:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490730.759551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP8xY-0002DL-48; Mon, 06 Feb 2023 21:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490730.759551; Mon, 06 Feb 2023 21:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP8xY-0002B0-1A; Mon, 06 Feb 2023 21:23:32 +0000
Received: by outflank-mailman (input) for mailman id 490730;
 Mon, 06 Feb 2023 21:23:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53dg=6C=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pP8xX-0002Ae-9q
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 21:23:31 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d7a0642-a664-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 22:23:27 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2A0FB81625;
 Mon,  6 Feb 2023 21:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88617C433EF;
 Mon,  6 Feb 2023 21:23:22 +0000 (UTC)
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
X-Inumbo-ID: 7d7a0642-a664-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675718603;
	bh=/L6vScwanHXQkqlWWq3WvENVOhp9UJBsxYcGY9TovNA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kJy22NLlEYDFYl5LC9EYy1W8ZkkJr0WmEg2ATI7r2Z/Jf0EItt01iJtJFb7MW1hY/
	 Mt0snoE83/ahw55qGIfBmaxbtlIJ+P4NjNSnNxUshowVEwaq0Q9IT9SAFGpA6KtPBn
	 mpg61oCAxOHyL5TslO414HY7jZtdVwy7cKtL59vlC0LXX9jKGiSIOEMhC4p9lZjnC0
	 SdKngky7TtWlBYCUe1jKB5BHbdjAQEcCeU4SNnv7SIvwgpPa2kWY+pL825RIeU5D2O
	 SraFqFHDognpL9WDNSy4N0LNhnJ808sPPVnaHuLIT3T0HrJ8vikF8FMkNoXP0DpigQ
	 a6drYlCQ6PcKg==
Date: Mon, 6 Feb 2023 13:23:21 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Luca Fancellu <Luca.Fancellu@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: Proposal: List files in Xen originated from external sources
In-Reply-To: <53371bbc-ea78-4c2b-a84e-e888ae090d3a@suse.com>
Message-ID: <alpine.DEB.2.22.394.2302061323130.132504@ubuntu-linux-20-04-desktop>
References: <BC3ED7B9-4917-491C-934A-EF112849CBF1@arm.com> <alpine.DEB.2.22.394.2302031145530.132504@ubuntu-linux-20-04-desktop> <53371bbc-ea78-4c2b-a84e-e888ae090d3a@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-268053785-1675718239=:132504"
Content-ID: <alpine.DEB.2.22.394.2302061317480.132504@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-268053785-1675718239=:132504
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2302061317481.132504@ubuntu-linux-20-04-desktop>

On Mon, 6 Feb 2023, Jan Beulich wrote:
> On 03.02.2023 20:55, Stefano Stabellini wrote:
> > On Fri, 3 Feb 2023, Luca Fancellu wrote:
> >> And then, if the file is not subject to backport and now we “own” the file, there is no more the need to list it
> >> in the external file, a commit search can reveal when it was converted to Xen codestyle and removed from
> >> the external file list so we don’t lose the history.
> > 
> > Yes, I agree. If a file is coverted to Xen coding style and follows
> > MISRA rules, then there is no need to list the file in
> > docs/misra/external-files.json.
> > 
> > 
> >> So we would end up excluding just all the file listed in external-file.json by the analysis.
> > 
> > Right, I think so too
> 
> Personally I think this is too focused on Misra.

We are trying to do two things at once:
1) list of external files with their management info (backports, origin, etc.)
2) list of files and paths to exclude from MISRA checking

From this discussion it became clear that 1) and 2) are very different,
have different requirements, and different info attached. In fact, the
two lists of files and paths don't even match: not all external files
exclude MISRA checking and some non-external files also exclude MISRA
checking.

I suggest we go forward with a MISRA-only exclude list with files and
paths to exclude from automatic checking, and without any implication
about external files. The list could be a json file called
"misra-exclude.json" to avoid any doubts.
--8323329-268053785-1675718239=:132504--

