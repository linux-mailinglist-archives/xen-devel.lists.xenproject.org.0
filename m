Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1F142DB53
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 16:19:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209403.365853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1Zs-0000LL-5e; Thu, 14 Oct 2021 14:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209403.365853; Thu, 14 Oct 2021 14:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mb1Zs-0000JG-2L; Thu, 14 Oct 2021 14:19:24 +0000
Received: by outflank-mailman (input) for mailman id 209403;
 Thu, 14 Oct 2021 14:19:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i4ou=PC=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mb1Zr-0000JA-9B
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 14:19:23 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9bc168c-2cf9-11ec-81c4-12813bfff9fa;
 Thu, 14 Oct 2021 14:19:22 +0000 (UTC)
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
X-Inumbo-ID: b9bc168c-2cf9-11ec-81c4-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1634221161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r3pfHY/13FEq43u1gQO09W8tsI3hlUFY01vkjJETQjk=;
  b=HPCmYGux+CumDzjIxYf/iY+FEVPcOi2GZBgqQRhZXsxn9cjPsuwu08Dl
   mXFGKy5G0HFayUmb4O2zArG36sgKO8Fo0nPP/MBqVWCVbfMgZnDsXpNfW
   w0GTVPzYS+JZJQleA/41z23YgYv6Qz6Lq5PfjNgFyLJkqBTZlQPJuN6Ci
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bko/flN8xlLEW1VlFnKSOPjIuBt74HoOMoWHBST6ItBMu7xwaqQvaDrwmCKuIIRccDuc85H4A1
 3qRjmFjiZyaGJTrIENcbadb554eDWFxlIVJ+dL1a/Q4/jTfOkkeF9GvK0P7qh5PIuBB5n8NOlQ
 YSShk1hLAnWPaLtdWfMr+c3Kqx+PJ0dLh0TtWBYyeK6UNnob6t61Dhvjqw8KHnc/HLXKr7IFB3
 +SH4CBHI0SP3Gd7nL8IES0HQ6iL91TABWMDM7k8g2bUeAvTFCqG8BWFA0krWEMIo4sxDotZ8Gy
 czKjdxHZZXRF0yF+4LP8vpg6
X-SBRS: 5.1
X-MesageID: 55182001
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:0DMFK6x0+HJKvmOmCBV6t+e6wSrEfRIJ4+MujC+fZmUNrF6WrkUOm
 zQfUGyBPPqJYWL3KIglYNy3/EsP7JPRmtJiGgI+rCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dl2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt8l1y
 pZIkZmRcBkkHqDQu6NASxMHTj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVors0lMMnsOpJZonx6xCvVJf0nXYrCU+PB4towMDIY250XTayGP
 5NxhTxHMCmfbi10Hk4uDrExlealhHWjLyNakQfAzUYwyzeKl1EguFT3C/LOYcCDT8hRmkeep
 0rF8n7/DxVcM8aQoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80igkoLU29UerZsLgRBD+q3mB1jYdRNh4A+A88BuKyKff/0CeHGdsZjxcbN0rsucmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XiYkD5MFPuewcdSQlG5v3mgbgtgzLCUvUkTba/0YDqTGSYL
 y+xkAAygLAajMgu3qq9/Ezajz/EmqUlXjLZ9S2MATr7tlIRiJqNItXyswCCvKkowJOxFwHZ5
 BA5d96iAPfi5H1nvBeGR/kRB/mX7vKBPSy0bbVHTsR5qWrFF5JOe+ltDNBCyKVBbplsldzBO
 ha7VeZtCHl7ZybCgUhfOdPZNijS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9kZ
 c7GKZjzXChEUcyLKQZaoc9GjNfHIQhklAvuqW3TlUz7gdJymlbEIVv6DLd+Rr9gt/7VyOkk2
 91eK9GL231ivB7WOUHqHXooBQlSdxATXMmuw+QOL7LrClc2SQkJVq6KqZt8KtMNokigvrqRl
 p1LchQDkwSXaLyuAVjiV02Pn5u0Bs8k9yhlbXJ8VbtqslB6CbuSAG4kX8NfVdEaGCZLlpaYl
 tEJJJeNBOphUDPC92hPZJXxttU6Jh+qmRiPL2yuZz1mJ8xsQAnA+9nFeArz9XZRUnrr5JVm+
 7DwhBnGRZcjRhh5CJqEYvyY0F7s72MWn/h/XhWUL4ALKlns6oVjNwf4kuQzf5MXMRzGyzbDj
 1SWDB4UqPPjuYgw9NWV16mIo53wS7l1H1ZAHnmd5rGzbHGI8m2myI5GceCJYTGCCz+kpPT8P
 b1YlqiuPucGkVBGt5tHP4xqla9utcHyo7J6zxh/GCmZZVqcFb49cGKN2tNCt/MRy+YB6xe2Q
 E+G5vJTJa6NZJH+CFcUKQcoMraD2PUTlmWA5Pg5Ohyntip+/b7BWkROJRiczidaKeItYo8ix
 O4gvu8Q6hC+1UV2YorX0HgM+jTeNGEEXoUmqooeUd3ihQccw11fZYDRV33t65aVZtQQakQnL
 1d4XkYZa2iwEqYaT0cOKA==
IronPort-HdrOrdr: A9a23:xwOlGKn8hg/e8nZvorJZdIZ8wCDpDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.85,372,1624334400"; 
   d="scan'208";a="55182001"
Date: Thu, 14 Oct 2021 15:18:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [XEN PATCH v7 32/51] build: Remove KBUILD_ specific from
 Makefile.host
Message-ID: <YWg8Stdk2sybDuf4@perard>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-33-anthony.perard@citrix.com>
 <d61fa6ad-6a05-6ad4-4ce0-711b55e0827c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d61fa6ad-6a05-6ad4-4ce0-711b55e0827c@suse.com>

On Mon, Oct 11, 2021 at 05:47:29PM +0200, Jan Beulich wrote:
> On 24.08.2021 12:50, Anthony PERARD wrote:
> > This will allow $(HOSTCFLAGS) to actually be used when building
> > programmes for the build-host.
> > 
> > The other variable don't exist in our build system.
> > 
> > Also remove $(KBUILD_EXTMOD) since it should always be empty.
> > 
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> I wonder though whether their use of KBUILD_ prefixes doesn't match
> our XEN_ ones (e.g. KBUILD_CFLAGS vs XEN_CFLAGS), in which case
> replacing rather than stripping might be the way to go.

Well, at the moment, HOSTCFLAGS is defined in Config.mk, and xen/ makes
use of it. I don't think the other variable that I strip KBUILD_ from
exist, so maybe for those, changing prefix for XEN_ would be fine.
But for HOSTCFLAGS, I think we would want a new patch to set it in
xen/Makefile, and use it in xen/. But I don't think we need to spend
time on it at the moment.

Thanks,

-- 
Anthony PERARD

