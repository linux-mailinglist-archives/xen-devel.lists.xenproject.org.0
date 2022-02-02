Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 612E94A7057
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 12:53:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264093.457067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFECU-0004nb-Db; Wed, 02 Feb 2022 11:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264093.457067; Wed, 02 Feb 2022 11:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFECU-0004l2-AM; Wed, 02 Feb 2022 11:53:26 +0000
Received: by outflank-mailman (input) for mailman id 264093;
 Wed, 02 Feb 2022 11:53:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pBNc=SR=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nFECT-0004kw-3q
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 11:53:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7cedd2c-841e-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 12:53:23 +0100 (CET)
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
X-Inumbo-ID: b7cedd2c-841e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643802802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O/6X3jHKLr8LTR8yzsrI6ghWjdK/+KOdEFRkyxZnB68=;
  b=QV8P+UscRfPWRsKfI8wtYsLL76Jl1PqRBXWsoklRwhtQNvDrQfB1PDl5
   Y8E9pVUdqFV8l9zpIbRbOyAcrGL9+pit5LTtI4YcP2zaCyCevvWgj8Icu
   P7vt4JpmpZZbUyXrfd9a+Mx0izrc2Fpnu/6kDj0tLSEKBoA+WXwPVjwZB
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2GbORDwZQW+g0RHvpGJA2HQ7HnV5DA4zvdQo8KB/kEgA8DQgt0dUgmGgQ1S6UdmsPjX+wZGbRq
 kqrF5YfFWRwTnAGMqh9wlckqL0slBSQyam5W/yVua4LpwtUbu2kfY4fKcbWafRdx8yfH2dFMf2
 xY8LCi0j3i39lYp0sjhQZpIaw0gIxQfM4AsA6Qbq2tA2861mk5G+EJzkjOddHo37pjWwoJiHiZ
 9bTqXUKNsna3D8lgBG3yHJ87lAnYW7M1uw0ElCiExjvoBhqf12EpXjS788AogJlIba9qPcx3c6
 WiqxgdSX2snbdlCJFoYFeQNS
X-SBRS: 5.2
X-MesageID: 63718401
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:pp51uK6GdWpmhPOrdOb0qAxRtMPAchMFZxGqfqrLsTDasY5as4F+v
 jAXXT2COq7bYDT3eopzPoTl9xlXuJ/SmN9lHFc+qS9gHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZj2tQw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z6
 9sd6Ja/GToVGu7cncUbeSdEGRt+BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRqmHN
 5ZBMFKDajzBXR5LNAoNDKlmv+usg2bRQmZTi0C88P9fD2/7k1UqjemF3MDuUt6ASNhRn02Yj
 nnb5Gm/CRYfXPSd1D6E/3SEluLJ2yThV+o6D6ak//RnhFmSwG07CxAMU1a/5/6jhSaWWd1FL
 FcP0jEztqV0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMMinN87Q3otz
 FDhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTQwKHVYP7InenKVwnhfuSPxdDKSPjuSgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7EFgHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vGAWyKRBaJ9sldrVj
 Kj74ls52XOrFCH2BZKbmqroYyjQ8YDuFM7+StffZcdUb556eWevpX8yPhHMhjG8zRFywcnT3
 Kt3lu73VR4n5VlPlmLqF4/xL5d3rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNNcTgicCZqbbir+50/XrPSeWJORTB+Y8I9NJt8IeSJaYwPyLeRl
 px8M2cFoGfCaYrvclTXMy0zNe+0AP6SbxsTZEQRALph4FB7Ca7H0UvVX8JfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:syhGfKCRCGvr6v/lHegosceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPEfP+U4ssQIb6Ku90ci7MDjhHPtOj7X5Uo3SOjUO1FHYT72KjrGSiQEIeReOj9K1vJ
 0IG8MVab3N5DBB/ILHCWKDYrMdKay8gceVbJDlvhNQpG9RGsNdxjY8LjzePlx9RQFAC5Z8Po
 Gb/NB7qz2pfmlSRtinB1EeNtKz6uHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoiy2
 7YiAb0j5/T/81TiyWsmFM73a4m2ecJ+eEzRPBkTfJlaQkEvzzYKriJnYfy/gzd7tvfrWrC2+
 O82SvId/4Dlk85OFvF5icEn2LboXATAjbZuCOlqGqmrsrjSD0gDc1dwYpfbxvC8kIl+Mpxya
 RRwguixuxq5D777VDADuLzJmZXf4uP0AofuP9Wi2YaXZoVabdXo4Ba9ERJEI0YFCa/7Iw8Cu
 FhAMzV+f4TKDqhHjjkl3gqxMbpUmU4Hx+ATERHssuJ0yJOlHQ8y0cD3sQQknoJ6Zp4QZhZ4O
 bPNLhuidh1P4YrRLM4AP1ETdq8C2TLTx6JOGWOIU7/HKVCIH7Jo46f2sRB2AhrQu178HIfou
 W+bLpojx9AR6u1M7zw4HRiyGG9fFmA
X-IronPort-AV: E=Sophos;i="5.88,336,1635220800"; 
   d="scan'208";a="63718401"
Date: Wed, 2 Feb 2022 11:53:16 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Juergen Gross <jgross@suse.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH 0/5] tools: remove include/xen-external directory
Message-ID: <YfpwrHRwcHQHFyw0@perard>
References: <20220130084343.19070-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220130084343.19070-1-jgross@suse.com>

On Sun, Jan 30, 2022 at 09:43:38AM +0100, Juergen Gross wrote:
> The tools/include/xen-external directory contains a header file from
> FreeBSD used to generate Xen header files. This series is replacing the
> complete directory by a single header with the same semantics.
> 
> Juergen Gross (5):
>   tools/libs/light: replace _libxl_list.h with _xen_list.h
>   tools/libs/toolcore: replace _xentoolcore_list.h with _xen_list.h
>   tools/libs/evtchn: use _xen_list.h
>   tools/include: remove xen-external directory
> 
>  tools/include/_xen_list.h                     |  523 +++++++++
>  tools/include/libxl.h                         |    4 +-

Hi,

While this looks like a good cleanup, I'm not sure whether this is a
good idea with regards to the change in libxl's public headers.

The LIBXL_TAILQ_* macro are exposed via libxl.h, and it seems that using
`libxl_event.link` is explicitly allowed (via "libxl_types.idl") to make
a list of event in a application. But there isn't really a reason to use
the macro.

I didn't find any use of the macros in libvirt, so maybe it's fine to
change it?

What do people think?

Cheers,

-- 
Anthony PERARD

