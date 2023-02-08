Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F60468F1AB
	for <lists+xen-devel@lfdr.de>; Wed,  8 Feb 2023 16:11:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491874.761216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPm5x-0004eQ-Gk; Wed, 08 Feb 2023 15:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491874.761216; Wed, 08 Feb 2023 15:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPm5x-0004bf-Dj; Wed, 08 Feb 2023 15:10:49 +0000
Received: by outflank-mailman (input) for mailman id 491874;
 Wed, 08 Feb 2023 15:10:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3n9e=6E=citrix.com=prvs=396e25764=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pPm5v-0004bW-CF
 for xen-devel@lists.xenproject.org; Wed, 08 Feb 2023 15:10:47 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0a1de91-a7c2-11ed-93b5-47a8fe42b414;
 Wed, 08 Feb 2023 16:10:43 +0100 (CET)
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
X-Inumbo-ID: c0a1de91-a7c2-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675869043;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gL91Uy1XfA0sijNXu9PWt94U4qjtLgeeQ+pIBM3hSGc=;
  b=SJa/IdDFAOEh4RqfGhWbWexD4qWEeB6wLZZfrVMDxqsEaFEWZk+/q//J
   fZZ2BeGcZ7ixavqao5L++5LK3KAKO94ku2dBXdFYXUPTzXJHi4LydZKAJ
   TUs+hnvzl+4H9fQ6FcX6ZxDruXG42HtRsLZ1kERh9660C61ZIFjzfqVpY
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95604727
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:h+jw7q4Dhfwp4Kqn5yx9xwxRtBXHchMFZxGqfqrLsTDasY5as4F+v
 mcYXTrXaK2LYGKje4hxPIy+o0lUsMfXnIVlSwporS8yHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+45wehBtC5gZlPaoT7AeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5my
 dI8cDkIKSy4uM2J7q7hSdlQrO0fM5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrnD5bz1frkPTvact6nLf5AdwzKLsIJzefdniqcB9zxvG/
 j6ZpTuR7hcyOMSH9TCvqyOQvtDJwTP2UogyEIHn36s/6LGU7jNKU0BHPbehmtGmjmauVtQZL
 FYbkgIntaUo/VanZsX8VRa/5nWDu3Y0WdVKFPYhwBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pEXFLdylYP3ZCFFZbpYC5++nfky4jUP5fPorth9iyJQrP7
 A+ksHI9t4k5pPIUgvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K3741s5CHx7ZiHCgUpLj2WZVawXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8jGLpfwUyhHU/s5pNZTewv7+eVzrszZ7TqMLa0XMjz9iebODJJrYedt3KSyghARs/rf/VS9H
 yd3PMqW0RRPONASkQGOmbP/2WsidCBhbbiv8pw/SwJ2ClY+cI3XI6OLkOxJlk0Mt/g9q9okC
 VnkCxQGlAKg2y2vxMfjQikLVY4DlK1X9RoTVRHA937zs5T/Se5DNJsiSqY=
IronPort-HdrOrdr: A9a23:sxcuL6ovZLagQtWXGptiuWIaV5rdeYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VAssRQb8+xoV5PufZqxz/BICMwqTNWftWrdyQyVxeNZnOjfKlTbckWTygce79
 YET0EXMrbN5DNB/KLHCWeDcurJwLO8gd+VbeW19QYScem9AZsQnjuQCWygYz1LrBEtP+tBKH
 IFjPA32gZJfx4sH7yGL0hAZcfvjfvRmqnrZBYXbiRXlDVn3VuTmcXH+wHz5GZlbw9y
X-IronPort-AV: E=Sophos;i="5.97,281,1669093200"; 
   d="scan'208";a="95604727"
Date: Wed, 8 Feb 2023 15:10:18 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH for-4.17 v6 5/5] tools: Rework $(xenlibs-ldlibs, ) to
 provide library flags only.
Message-ID: <Y+O7WntT11toKyH/@perard.uk.xensource.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-6-anthony.perard@citrix.com>
 <fee42999-a31c-3b12-9148-81b0898fac78@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fee42999-a31c-3b12-9148-81b0898fac78@suse.com>

On Wed, Feb 08, 2023 at 08:48:33AM +0100, Juergen Gross wrote:
> On 20.01.23 20:44, Anthony PERARD wrote:
> > LDLIBS is usually only the library flags (that is the `-l` flags), as
> > proposed in GNU make manual, while LDFLAGS would be extra flags such
> > as `-L`.
> > 
> > Rework the make macro $(xenlibs-ldlibs, ) to only provide the library
> > flags. $(xenlibs-ldflags, ) already only provide the extra flags like
> > the -rpath-link flags.
> > 
> > Also fix "test_%" recipe in libs/light as "libxenlight.so" in
> > $(LDLIBS_libxenlight) is been replaced by "-lxenlight". Instead of
> > just changing the filter, we will start using the $(xenlibs-*,) macro.
> > For LDFLAGS, we only needs the one for libxenlight, as the one for
> 
> nit: s/needs/need/
> 
> > toolcore and toollog are already in $(LDFLAGS), they are dependencies
> > to build libxenlight.so.
> 
> I don't like this very much. toolcore and toollog are used directly by
> the test_% programs, so I don't think we should rely on libxenlight
> depending on them.

Ok, I can add them back, it isn't much of an issue to have duplicated
flags on the command line.

Cheers,

-- 
Anthony PERARD

