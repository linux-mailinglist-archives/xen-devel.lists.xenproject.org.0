Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32895645D96
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 16:26:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456434.714238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2wJQ-0007Pv-88; Wed, 07 Dec 2022 15:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456434.714238; Wed, 07 Dec 2022 15:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2wJQ-0007O4-4n; Wed, 07 Dec 2022 15:26:20 +0000
Received: by outflank-mailman (input) for mailman id 456434;
 Wed, 07 Dec 2022 15:26:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NsCr=4F=citrix.com=prvs=333ae5379=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p2wJO-0007Km-Dn
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 15:26:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bfbd079-7643-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 16:26:15 +0100 (CET)
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
X-Inumbo-ID: 7bfbd079-7643-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670426775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8zOgQZAGMxgVnZgOxCUGdMt5RDn6BEWB6LaksDvuMTg=;
  b=bXqlm45jVYrecLWj9C+5qIoGZ6CcmxMLLcbuW6gJUgP+/vXFKEXDtysj
   fiTqCkmskuoC5awZg1AMmeuHVnucMTh9BYG5e3vZwhHIiZAIxJBzcfUPc
   5Y4VY3ntmdVlXLJx0TGjesUmpdVtE4uGqHQYJOuu0grs5MylTfbmlAP6p
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87473511
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sZdQeKIWSJYf6L6WFE+RF5UlxSXFcZb7ZxGr2PjKsXjdYENShmFRy
 2YWDzjTPKuPamagedl1PIuzoB8AucDTyYQyQAFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHv+kUrWs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPdwP9TlK6q4mlB5ARhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5WLmpD+
 M4pBQpXZ0iGl8my+aq8WrBz05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpPE+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUozVGZoOwx/Bz
 o7A12H8LSwHZdia8GWmzV2XmcjRxwT8BatHQdVU8dY12QbOlwT/EiY+Sl+TsfS/zEmkVLp3K
 UMO/TE1hbMv70HtRd74NzW6qXiIpA8BWPJfFuQ77EeGza+8ywOQHG0NVDNCQN0gqs4tRDYu2
 0OJntXmHjhmuvueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8aIYsbdQG+qh
 WrQ9W5n2utV3ZVjO7iHEU7voh2nq5X7fyMPvAyPW3KO6jphY578eNn9gbTE1spoIIGcR1iHm
 XELncmC8ewDZa2weDyxrPYlR+/wuavcWNHIqRs2RsR6qWzxk5K2VdoIiAySMnuFJSrtldXBR
 EbI8T1c65ZIVJdBRf8mOtnhYyjGIEWJKDgEahw2RoAWCnSSXFXdlM2LWaJ39z6FraTUuftjU
 ap3iO71ZZrgNYxpzSCtW8AW2qIxyyY1yAv7HM6kl0/6iOTGPSDNFN/p1Wdiichgvcu5TPj9q
 Y4DZ6NmNT0AOAEBXsUn2dFKdg1bRZTKLZv3t9ZWZoa+zvlOQQkc5wvq6ep5IeRNxv0F/tokC
 1nhAie0PnKj3yyYQehLA1g/AI7SsWFX9y1rZH1yYgr1gxDOo++Htc8iSnf+RpF/nMQL8BK+Z
 6VtlxmoahiXdgn6xg==
IronPort-HdrOrdr: A9a23:BqTOGqEYI+eT4xp/pLqENMeALOsnbusQ8zAXPiFKOGdom6mj/P
 xG88506faZslsssTIb6LW90dC7IE80rKQU3WBzB8bBYOCFghrREGgK1+KLqQEIfReOj9K1vp
 0OT0ERMrHN5BdB/KLHCaSDYrEd6cjC2pqBwc3Zy25pTQlsYa0l1QFkEQyWe3cGJzWuQaBJcq
 ah2g==
X-IronPort-AV: E=Sophos;i="5.96,225,1665460800"; 
   d="scan'208";a="87473511"
Date: Wed, 7 Dec 2022 15:26:09 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>
CC: <xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>, Wei
 Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/2] tools/libxl: enable in-band reconnect marker for
 stubdom QMP proxy
Message-ID: <Y5CwkZPizLKguGls@perard.uk.xensource.com>
References: <20220905135019.3749982-1-marmarek@invisiblethingslab.com>
 <20220905135019.3749982-2-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220905135019.3749982-2-marmarek@invisiblethingslab.com>

On Mon, Sep 05, 2022 at 03:50:19PM +0200, Marek Marczykowski-Górecki wrote:
> This enables stubdom reliably detect when it needs to reconnect QMP
> socket. It is critical, as otherwise QEMU will not send its handshake,
> and so libxl will timeout while waiting on one. When it happens during
> domain startup, it can result in error like this:
> 
> libxl: libxl_pci.c:1772:device_pci_add_done: Domain 3:libxl__device_pci_add failed for PCI device 0:0:14.0 (rc -9)
> libxl: libxl_create.c:1904:domcreate_attach_devices: Domain 3:unable to add pci devices
> 
> See vchan-socket-proxy commit message for details about this reconnect
> corner case.
> 
> Stubdomain side needs to use --reconnect-marker=1 option too.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

