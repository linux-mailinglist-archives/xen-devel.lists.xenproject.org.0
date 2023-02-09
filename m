Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1985D690EF9
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:15:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492791.762504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAVW-0000lU-6y; Thu, 09 Feb 2023 17:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492791.762504; Thu, 09 Feb 2023 17:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAVW-0000jG-3i; Thu, 09 Feb 2023 17:14:50 +0000
Received: by outflank-mailman (input) for mailman id 492791;
 Thu, 09 Feb 2023 17:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6rTn=6F=citrix.com=prvs=3970fcfec=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pQAVU-0000jA-5L
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:14:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e885964-a89d-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 18:14:45 +0100 (CET)
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
X-Inumbo-ID: 3e885964-a89d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675962885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jQ1PLlNDwtqU3pjQr0Mg+mLYkOOB2zsi0o8onM3YLg8=;
  b=B3+d25wRUjSKGthJhomsWlaSAvDqQOj61jT+AM4nzFJR7IitxQch75nt
   BNjD/y75IRxiLy5QJ8F7MsPaF522tZ5La6+BwfRLKU3q/MyxC+tUwudVZ
   xYbssSrbvEqHUO908nTogefMcqNtBp7/0nk8/+jEOpRQhrHPCX8cI8CtH
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95798381
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:pScv+6LHcWlcAIenFE+RB5UlxSXFcZb7ZxGr2PjKsXjdYENS1WcGy
 jBLWmqHb/bcamTzfY92boi+oUNV6JGEmt5iHgdlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5ARvPasjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5rDV1eq
 MEVJgwCNB6/2NibnYqEUcZV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TbGJoEzh3I/
 woq+UzaXxwEboKR1QOU+zWIvvLslA/2RNwrQejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 1cP5iMkoKw29UqqZtrwRRu1pDiDpBF0c9NIHvcz8g2l1qve6AHfDW8BJhZDddgnuckeVTEsk
 FiTkLvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyKkxhB/SStdoEIauk8b4Xzr3x
 li3QDMW3utJy5RRjuPioA6B2mj3znTUcuIrzhnbYnL40w53WIH/abD303WG1clbA7/MGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5eIVfUj
 FnvVRS9DXO5FF+jdudJbo24EKzGJoCwRI2+Bpg4gjejC6WdlTNrHgk0PSZ8PEi3yiDAdJ3T3
 r/FGftA9V5AVcxaIMOeHo/xK4MDyCEk3n/0Tpvm1Rmh2rf2TCfLFupVYALWMLFotvLsTODpH
 zB3bJviJ/J3CbKWX8Uq2dRLcQBiwYYTWvgaVPC7hsbce1E7SQnN+tfawK87epwNokimvr6gw
 51JYWcBkACXrSSeeW23hoVLNOuHsWBX8ShqYkTB/D+AhxAeXGpYxP1FLctmJOZ9qLcLIDwdZ
 6BtRvhsy89nElzvkwnxp7GkxGC+XHxHXT6zAhc=
IronPort-HdrOrdr: A9a23:lEmHsKg+FKGNgRQmwLRcnWvDjXBQXt8ji2hC6mlwRA09TyXqrb
 HVoB17726NtN91YhsdcL+7Sc69qB/nhPxICOoqTM6ftWvdyQ2VxehZhOOIrlGOdUyfh41gPM
 xbAsxD4ajLfCVHZKjBkWyF+q4bsaK6zJw=
X-IronPort-AV: E=Sophos;i="5.97,284,1669093200"; 
   d="scan'208";a="95798381"
Date: Thu, 9 Feb 2023 17:14:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] build: move double-$ into as-option-add
Message-ID: <Y+Up9V3Ww4fDYxEq@perard.uk.xensource.com>
References: <6eecd308-b871-7826-a99e-57c6d7d52140@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6eecd308-b871-7826-a99e-57c6d7d52140@suse.com>

On Thu, Feb 09, 2023 at 04:26:45PM +0100, Jan Beulich wrote:
> It's imo helping readability as well as uses a little if properly
> arranging for sufficiently late macro expansion is part of the macro
> itself, rather than all (applicable) instances of its users.
> 
> No functional change intended.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I agree, that's much better.

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

