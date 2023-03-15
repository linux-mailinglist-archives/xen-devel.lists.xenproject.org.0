Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305426BB77C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 16:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510112.787221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSvv-0000Ak-Uy; Wed, 15 Mar 2023 15:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510112.787221; Wed, 15 Mar 2023 15:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcSvv-00008q-S9; Wed, 15 Mar 2023 15:20:55 +0000
Received: by outflank-mailman (input) for mailman id 510112;
 Wed, 15 Mar 2023 15:20:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hb+5=7H=citrix.com=prvs=431796acb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pcSvv-00008i-2P
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 15:20:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6e987d8-c344-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 16:20:51 +0100 (CET)
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
X-Inumbo-ID: f6e987d8-c344-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678893651;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=B7Kgtocu5DyEdILv2TA0t2HRGSBeMTxd291Z1/Z9yOw=;
  b=U1IV0k8ABLczrH5f9kirBfEsiQISsmVu1SHMWTt8OUjS55BX2rOQW6vQ
   +1+Ns2Y39tLycL8cg2u0p3d+jve/HZMJLbyQMfhL3kGHlQNbJ8Qug4+ND
   TgzJRFv1MyX0iPpVx46Yza26f+RMcDYr3Dg+auBq1/oM1AWRe44myqAz1
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100977448
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xjAsSKIIAeGXmmGuFE+RHJUlxSXFcZb7ZxGr2PjKsXjdYENShjxUy
 jEeW2uOOv2LYWWmKd4nbt++o09Uv8CHndE3SwplqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QVjPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5mGkZe/
 NsjFAsNbzmNrOOskK6bdMtV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHZ0EwRnE+
 jKuE2LRBywDEt+ujhu8+CyWgcrvzQPWVJ0tPejtnhJtqALKnTFCYPEMbnO5q/Skjk+1W/pEN
 lcZvCEpqMAa5EGtC9XwQRC8iHqFpQIHHcpdFfUg7wOAwbaS5ByWbkAGUzpAZdoOpMIwAzsw2
 TehhMj1DDZitLmUT3O19bqOqz62fy8PIgcqeissXQYDpd75r+kbhwrCVN95HIapj9f+Hnf7x
 DXikcQlr+xN14hRjfz9pA2ZxWv2/fAlUzLZ+C3GRUW15yRCWLWlZqWmwlnBvepgEqSgGwzpU
 Gc/p+CS6+UHDJeonSOLQfkQELzB28tpIAEwknY0QcB/qm3FF2qLONkJvWogfBsB3tMsI2eBX
 aPFhe9GCHa/1lOOZLQ/XY++At9CIUPIRYW8DaC8gjajj/FMmO67EMNGPxL4M4PFyhJEfUQD1
 XCzIK6R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+hVYALfN7lhtPzeyOkwz
 zq4H5ri9vmieLemPnm/HXA7dDjm0kTX9bip8pcKJ4Zv0yJtGX07Cu+5/I7Nj7dNxvwP/s+Rp
 yHVZ6Ot4Aan7ZExAVnQOy8LhXKGdcoXkE/XygR1Zwf5gidzPdzzhErdHrNuFYQaGCVY5aYcZ
 5E4lw+oWZyjlhyvF+whUKTA
IronPort-HdrOrdr: A9a23:ralXgqsEOJ35lj08yHcQwOGI7skDSdV00zEX/kB9WHVpmwKj5r
 mTdZUgpGfJYVMqMk3I9urwXZVoLUmsl6KdpLNhXotKPzOGhILLFvAH0WKK+VSJcBEWtNQ86U
 4KSdkYNDSfNykdsS842mWF+hQbreVvPJrGuQ4W9RlQcT0=
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="100977448"
Date: Wed, 15 Mar 2023 15:20:43 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] build: omit "source" symlink when building hypervisor
 in-tree
Message-ID: <6880d302-cc8d-4719-be15-5a0c6bf4c847@perard>
References: <ca9930ee-e6bf-3cf3-633c-02d5f21760f5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ca9930ee-e6bf-3cf3-633c-02d5f21760f5@suse.com>

On Wed, Mar 15, 2023 at 03:56:21PM +0100, Jan Beulich wrote:
> This symlink is getting in the way of using e.g. "find" on the xen/
> subtree, and it isn't really needed when not building out-of-tree:
> the one use that there was can easily be avoided.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/efi/efi-common.mk
> +++ b/xen/common/efi/efi-common.mk
> @@ -5,11 +5,16 @@ CFLAGS-y += -fshort-wchar
>  CFLAGS-y += -iquote $(srctree)/common/efi
>  CFLAGS-y += -iquote $(srcdir)
>  
> +source :=
> +ifneq ($(abs_objtree),$(abs_srctree))

Could you use "ifdef building_out_of_srctree" instead, or at least use
the variable $(building_out_of_srctree)? At least that mean there's a
single way in the tree to differentiate between both kind of build.

> +source := source/
> +endif
> +
>  # Part of the command line transforms $(obj)
>  # e.g.: It transforms "dir/foo/bar" into successively
>  #       "dir foo bar", ".. .. ..", "../../.."
>  $(obj)/%.c: $(srctree)/common/efi/%.c FORCE
> -	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/source/common/efi/$(<F) $@
> +	$(Q)ln -nfs $(subst $(space),/,$(patsubst %,..,$(subst /, ,$(obj))))/$(source)common/efi/$(<F) $@

Instead of $(source), I did proposed initially
"$(if $(building_out_of_srctree),source/)" for here, or it that making
the command line too long?
https://lore.kernel.org/xen-devel/YebpHJk1JIArcdvW@perard/t/#u

Having "source := $(if $(building_out_of_srctree),source/)" might be an
ok alternative in place of the use if "ifneq/endif" which take 4 lines?


Thanks,

-- 
Anthony PERARD

