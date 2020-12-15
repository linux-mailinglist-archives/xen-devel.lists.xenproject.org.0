Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A51C2DB350
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 19:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54747.95280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpElJ-0002F2-Bl; Tue, 15 Dec 2020 18:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54747.95280; Tue, 15 Dec 2020 18:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpElJ-0002Eg-8K; Tue, 15 Dec 2020 18:09:25 +0000
Received: by outflank-mailman (input) for mailman id 54747;
 Tue, 15 Dec 2020 18:09:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ufw=FT=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kpElH-0002Eb-NG
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 18:09:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 519c9373-4cdb-40f7-bc39-7dced4e25519;
 Tue, 15 Dec 2020 18:09:21 +0000 (UTC)
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
X-Inumbo-ID: 519c9373-4cdb-40f7-bc39-7dced4e25519
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608055761;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=uRlhFGp0BOyW4m4+IOML7lSSobqn6PHuWxZvG4M2uxI=;
  b=DLEp4X9wPKhj9DoAz196Xi74MsTBsC+6a+IQL/uFQIywqaw9oV1qwh0I
   z4NfGXqX8hi0hMEKruaIQOT6ZKFCXKWesZaisxTBJwnxZ6iGgUtJvMUcp
   WFnPT0cgC9TPtcBoVCbt8tWqbVG3/q1MgZ+0k5dxc3uV1oHi9fAV0SuX5
   8=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KDUDwgAs5IG1brpXMjRQilrzyahVUQVB574hx8NxgS+z+hbb7ZBO4OgFqkndlbiFbt/jck8L4t
 125EDEZEjqIqiId7J4UFRnX1fKvjqkI05UakjGfUhcTIXHgVSzqrf08Tp14coFYTwyEBfRzIaS
 SJc2GKepZOyGP63Y3QunqKrR74F3taI3t42l5SvGhZRoaR6uAgzQWBC4CjvEZHDYKd+Zlb7mX7
 SIy3kSZL59v9NwpKJcWgAdoHmvmbROX4eV2uc6qmev48WSjPLUMijC8WWHK2u1QuJtzFR5Qk4X
 FmM=
X-SBRS: 5.2
X-MesageID: 34499476
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,422,1599537600"; 
   d="scan'208";a="34499476"
Subject: Re: [PATCH v10 04/25] tools/libxenevtchn: add possibility to not
 close file descriptor on exec
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Julien Grall
	<jgrall@amazon.com>
References: <20201215163603.21700-1-jgross@suse.com>
 <20201215163603.21700-5-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <3c8ab988-725e-2823-23f6-d9286a04243e@citrix.com>
Date: Tue, 15 Dec 2020 18:09:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215163603.21700-5-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL03.citrite.net (10.13.108.165)

On 15/12/2020 16:35, Juergen Gross wrote:
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Wei Liu <wl@xen.org>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
> V7:
> - new patch
>
> V8:
> - some minor comments by Julien Grall addressed
>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Various of your patches still have double SoB.  (Just as a note to be
careful to anyone committing...)

> diff --git a/tools/include/xenevtchn.h b/tools/include/xenevtchn.h
> index 91821ee56d..dadc46ea36 100644
> --- a/tools/include/xenevtchn.h
> +++ b/tools/include/xenevtchn.h
> @@ -64,11 +64,25 @@ struct xentoollog_logger;
>   *
>   * Calling xenevtchn_close() is the only safe operation on a
>   * xenevtchn_handle which has been inherited.
> + *
> + * Setting XENEVTCHN_NO_CLOEXEC allows to keep the file descriptor used
> + * for the event channel driver open across exec(2). In order to be able
> + * to use that file descriptor the new binary activated via exec(2) has
> + * to call xenevtchn_open_fd() with that file descriptor as parameter in
> + * order to associate it with a new handle. The file descriptor can be
> + * obtained via xenevtchn_fd() before calling exec(2).
>   */

More of the comment block than this needs adjusting in light of the
exec() changes.

> -/* Currently no flags are defined */
> +
> +/* Don't set O_CLOEXEC when opening event channel driver node. */
> +#define XENEVTCHN_NO_CLOEXEC 0x01
> +
>  xenevtchn_handle *xenevtchn_open(struct xentoollog_logger *logger,
>                                   unsigned open_flags);
>  
> +/* Flag XENEVTCHN_NO_CLOEXEC is ignored by xenevtchn_open_fd(). */
> +xenevtchn_handle *xenevtchn_open_fd(struct xentoollog_logger *logger,
> +                                    int fd, unsigned open_flags);
> +

I spotted this before, but didn't have time to reply.

This isn't "open fd".  It is "construct a xenevtchn_handle object around
an already-open fd".  As such, open_flags appears bogus because at no
point are we making an open() call.  (I'd argue that it irrespective of
other things, it wants naming xenevtchn_fdopen() for API familiarity.)

However, the root of the problem is actually the ambiguity in the name. 
These are not flags to the open() system call, but general flags for
xenevtchn.

Therefore, I recommend a prep patch which renames open_flags to just
flags, and while at it, changes to unsigned int rather than a naked
"unsigned" type.  There are no API/ABI implications for this, but it
will help massively with code clarity.

I'd also possibly go as far as to say that plumbing 'flags' down into
osdep ought to split out into a separate patch.  There is also a wild
mix of coding styles even within the hunks here.

Additionally, something in core.c should check for unknown flags and
reject them them with EINVAL.  It was buggy that this wasn't done
before, and really needs to be implemented before we start having cases
where people might plausibly pass something other than 0.

~Andrew

P.S. if you don't fancy doing all of this, my brain could do with a
break from the complicated work, and I can see about organising this
cleanup.

