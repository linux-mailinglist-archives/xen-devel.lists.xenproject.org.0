Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F94272E8AC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 18:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548292.856168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q974E-0006e7-HK; Tue, 13 Jun 2023 16:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548292.856168; Tue, 13 Jun 2023 16:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q974E-0006cA-Dz; Tue, 13 Jun 2023 16:40:26 +0000
Received: by outflank-mailman (input) for mailman id 548292;
 Tue, 13 Jun 2023 16:40:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ia/t=CB=citrix.com=prvs=5214cf225=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q974D-0006c4-AN
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 16:40:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd15ad36-0a08-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 18:40:23 +0200 (CEST)
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
X-Inumbo-ID: fd15ad36-0a08-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686674422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bi74crvnuYP9HbwVoECdXnk8P2w9Sfucs3wEkvHdVHI=;
  b=YOItwM41sA6EcMG3NH0MlfIvoh99UikeTJf3mvmWfG8s4BzbbIdtTRM9
   9j29NZuuNow+pb0INNaVjm6R9LlzE7oCkDdD2rQAjaai5Ed/LbEJBciKe
   UwuFlZ83XB6Ez2IrJ0Ee5hWXQuzm9O4TL2N+Ekw+iMuz3fwD3YaRTnLJV
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113063634
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:QjqUuKOI2gyPprHvrR2Jl8FynXyQoLVcMsEvi/4bfWQNrUon3zJTm
 GpJCmuObv6KYGXyfIh3atni/UgBu5fWn981Gwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5wdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uNrUXlvp
 fZGESgIdha8qqGM55eBQeY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTHp0LxRjD+
 goq+Uz6HVYACNyc0wHc0TGtrMTrwGT+e5sNQejQGvlC3wTImz175ActfVmxrOS9i0W+c8lCM
 EFS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLncAZi5MbpohrsBebT4lz
 FiShPvyGCdi9raSTBq1/6+ZtzqoNQAJLGUJYmkPSg5t3jX4iNht1FSVFI8lSfPryISvQlkc3
 gxmsgA7m+ULrJ4BiZyj+EjBvB/vnL/sdAU6s1C/sn2e0u9pWGK0T9X2uQaFt6oYc9rxokqp5
 yZdxZXHhAwaJdTUzXHWHr1QdF28z6zdWAAwl2KDCHXIG96F33e4Nb5d7zhlTKuCGpZVIGS5C
 KM/VO442XOyAJdJRfUtC25JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZ8z/xuZ
 cjAIJr8VB727JiLKhLsH4/xNpdxn0gDKZ77H8inn3xLL5LDDJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3CYXDjt3s2ddLdzgidCFrba0aXuQLLoZv1CI6QjB+YxIQqJt9E7FYc1N9z7+Yp
 CvhCxEJlTISRxTvcG23V5yqU5u3Nb4XkJ7xFXVE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:O32gyaOrv1B4jcBcT4T155DYdb4zR+YMi2TDtnoBPCC9F/by+f
 xG88566faKskdsZJhNo7G90cq7MADhHOBOkOss1N6ZNWGNhILCFvAA0WKN+UyEJ8X0ntQtqp
 uJG8JFZOEZZjJB4voTL2ODfuoI8Z2/1OSNuM+b9nFqSGhRGtNdB8USMHfkLqWzLjM2dabQ0f
 Cnl7t6TkGbCBAqR/X+PGABQ+/A4/XTjfvdEGc7Li9i0hCKkTSrrJXnEx2Uty1uLg9n8PMZ6G
 3YlA68wa2mv5iAu3jh/l6W1Y1ShNzijv1cA8CW4/JlTAnEu0KTfYF8XL/HhhAZydvfkGoCoZ
 33uhI9OMY20X/LYW2vhhPo12DboU0Twk6n80acnXzg5fP0Xyg7Dc0pv/MiTifk
X-Talos-CUID: 9a23:KeAJBWA3BlqVkxj6Eyx7pFY1Ssp7S2XY1HHvDgyCLkNTQ7LAHA==
X-Talos-MUID: 9a23:FfwmcgXXARO3zoXq/DzzwyteNMRy2P2NS0EnurFb/MynLDMlbg==
X-IronPort-AV: E=Sophos;i="6.00,240,1681185600"; 
   d="scan'208";a="113063634"
Date: Tue, 13 Jun 2023 17:40:17 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/5] libxg: drop dead assignment to "ptes" from
 xc_core_arch_map_p2m_list_rw()
Message-ID: <f33ff657-0153-468f-9140-6aacf72ca2cc@perard>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <fe8cb20f-8541-19a9-a0cf-06e9206b1299@suse.com>
 <33566692-ee42-44af-a94a-5535fdf39930@perard>
 <a22f00e7-d5e4-45e1-652c-bf22ad78f567@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a22f00e7-d5e4-45e1-652c-bf22ad78f567@suse.com>

On Tue, Jun 13, 2023 at 06:08:16PM +0200, Jan Beulich wrote:
> On 13.06.2023 18:03, Anthony PERARD wrote:
> > On Mon, Jun 12, 2023 at 01:46:40PM +0200, Jan Beulich wrote:
> >> The function returns immediately after the enclosing if().
> >>
> >> Coverity ID: 1532314
> >> Fixes: bd7a29c3d0b9 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> --- a/tools/libs/guest/xg_core_x86.c
> >> +++ b/tools/libs/guest/xg_core_x86.c
> >> @@ -210,7 +210,6 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
> >>          }
> >>  
> >>          munmap(ptes, n_pages * PAGE_SIZE);
> >> -        ptes = NULL;
> >>          off = p2m_vaddr & ((mask >> shift) << shift);
> >>      }
> > 
> > Do we have to remove this assignment? What if someone adds code later
> > and reuse the content of the variable `ptes`? Or what if someone adds
> > codes after the loop, and handle an error with `goto out`, we would have
> > a double-munmap().
> 
> Imo it would be at that time when the assignment wants (re)adding. I

I don't believe this is going to happen because I don't think a compiler
will find a mistake. Maybe a run of Coverity would tell that ptes is
reused after munmap(), but by the time Coverity run on the code, it
would be too late.

> fully agree with the tool, and I expect Misra (if it was applied to
> the tool stack as well) would demand the very same change.

I guess the issue here is that there's two paths out of the function, the
error path via "out" and the success path. If `ptes` is check on both
path, then the assignment would be needed, and it would be harder to
make a mistake; which can be done by having only one way out.

If only we could restrict the scope of `ptes` to the for loop, we
wouldn't even need to set it to NULL.

Cheers,

-- 
Anthony PERARD

