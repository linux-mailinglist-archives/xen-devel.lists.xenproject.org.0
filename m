Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18EDA403D6
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2025 01:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894713.1303429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tld0m-0007XD-Ue; Sat, 22 Feb 2025 00:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894713.1303429; Sat, 22 Feb 2025 00:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tld0m-0007VU-Rf; Sat, 22 Feb 2025 00:04:52 +0000
Received: by outflank-mailman (input) for mailman id 894713;
 Sat, 22 Feb 2025 00:04:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tld0l-0007VO-5q
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2025 00:04:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1a697f9-f0b0-11ef-9aaa-95dc52dad729;
 Sat, 22 Feb 2025 01:04:49 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 405765C4BD5;
 Sat, 22 Feb 2025 00:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E869C4CED6;
 Sat, 22 Feb 2025 00:04:46 +0000 (UTC)
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
X-Inumbo-ID: a1a697f9-f0b0-11ef-9aaa-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740182688;
	bh=msPNEsSEyDE+zk7oj4SGmn0LkQGFOkuQDOrEZyZ0Gvk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oQm7+RHy+oF9Cl4TQEXqNf9HEG7aG+RX9j5pDOA3+1aNhZneZqbMidt+J0XDm6ORZ
	 /ddlYbD3s68ocJTjCKJXgSr2U3ASw4hyJu9CJxpemErwym6YNCoCFhEoAh4tk/KgQz
	 d9fijmfa9r9q/mdNdLr8W6hSDhrDxi23QSI7mGxHK5hJg4y7480igvkcuVsyqaNTTO
	 aaYtUV5iU27RDq0aRKQG+WuBtIxDbp+bHrCEH8FqI4K0Dj7SSa/SOAlq1VeeQidYyF
	 CRK/4TKKNmhKLHkQrj1KZDci9ZG19oE7QHmoUwu1NXn3eFs+hV8qSZ+dzjpmoj9MTs
	 z/B2X7/wtg3BA==
Date: Fri, 21 Feb 2025 16:04:45 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: dmkhn@proton.me, andrew.cooper3@citrix.com, anthony.perard@vates.tech, 
    julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, 
    sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/console: introduce console_{get,put}_domain()
In-Reply-To: <2238f00f-b5b4-4382-9045-09dc6b7cee6b@suse.com>
Message-ID: <alpine.DEB.2.22.394.2502211604390.1791669@ubuntu-linux-20-04-desktop>
References: <20250218083048.596012-1-dmkhn@proton.me> <2238f00f-b5b4-4382-9045-09dc6b7cee6b@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 19 Feb 2025, Jan Beulich wrote:
> On 18.02.2025 09:31, dmkhn@proton.me wrote:
> > @@ -546,31 +555,23 @@ static void __serial_rx(char c)
> >           * getting stuck.
> >           */
> >          send_global_virq(VIRQ_CONSOLE);
> > -        break;
> > -
> > +    }
> >  #ifdef CONFIG_SBSA_VUART_CONSOLE
> > -    default:
> > -    {
> > -        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
> > -
> > -        if ( d )
> > -        {
> > -            int rc = vpl011_rx_char_xen(d, c);
> > -            if ( rc )
> > -                guest_printk(d, XENLOG_G_WARNING
> > -                                "failed to process console input: %d\n", rc);
> > -            rcu_unlock_domain(d);
> > -        }
> > -
> > -        break;
> > -    }
> > +    else
> > +        /* Deliver input to the emulated UART. */
> > +        rc = vpl011_rx_char_xen(d, c);
> >  #endif
> > -    }
> >  
> >  #ifdef CONFIG_X86
> >      if ( pv_shim && pv_console )
> >          consoled_guest_tx(c);
> >  #endif
> > +
> > +    if ( rc )
> > +        guest_printk(d, XENLOG_G_WARNING
> > +                        "failed to process console input: %d\n", rc);
> 
> Wouldn't this better live ahead of the four shim related lines?
> 
> Also please correct the log level specifier here. I realize you only move
> what was there before, but I consider i bad practice to move buggy code.
> gprintk() already prepends XENLOG_GUEST, so instead of XENLOG_G_WARNING
> is should just be XENLOG_WARNING. (Line wrapping is also odd here, at
> least according to my taste. But since that's not written down anywhere,
> I wouldn't insist on adjusting that as well.)
> 
> With both adjustments (provided you agree, of course)
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Given they're reasonably simple to make, I could once again offer to
> adjust while committing (provided an Arm ack also arrives).

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

