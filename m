Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D00134850BE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jan 2022 11:11:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.253551.434722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n53F0-0004U5-C0; Wed, 05 Jan 2022 10:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 253551.434722; Wed, 05 Jan 2022 10:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n53F0-0004R7-8P; Wed, 05 Jan 2022 10:09:58 +0000
Received: by outflank-mailman (input) for mailman id 253551;
 Wed, 05 Jan 2022 10:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WMgQ=RV=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1n53Ez-0004R1-61
 for xen-devel@lists.xenproject.org; Wed, 05 Jan 2022 10:09:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f71a980-6e0f-11ec-81c0-a30af7de8005;
 Wed, 05 Jan 2022 11:09:54 +0100 (CET)
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
X-Inumbo-ID: 9f71a980-6e0f-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641377394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eBEzcXKe+9NiNBHjwqKnGq6pRO1Ha3JWQJayodoM8bQ=;
  b=a02s6ogcuxvSGh6dV4OSM+bXHDDea8V5IawUbvurmE9eW8+wRcBKbnPf
   CXapFelN8Q9ShJv/QFWXkMHR9fNJUS7Ga5l5LiT3EzizteXal/xYPQIwv
   M+5aU2WPW6/5fhbmteJQtc4xjDUXf1Jeetq011YUNNyTRy5KG3GTMroPR
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EYSsd1DylTSc2aP11lq0xMy6HJgAUEIBFqIOlrLdPX2OYyZaMGu9q/FZDazQ6vhqyvhYloLTCZ
 f4FnleWWaTTDTxnZtoCtG5Y+rlwjHTKykoU/zUKtqeLBvlg1r64aA3DJQ7oL0Jom+T+H67I/JW
 P2z/1cSeV499+NlLxxuNaVgttu+nVK5EAjojQGxPO3W+ZZnLw41LfwUuT3Hu4bBFOCQ6a01Hrs
 1MlkCmufEyuH5lEA0CT9c5VSWzseHg2gmrwQoXEKsuWz49nUHBDnBB10M+ZgKX2gyCL34VUdI/
 h0Jiw8gp70rHTLQB4OwEiVJj
X-SBRS: 5.1
X-MesageID: 61273475
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FdsW9qNZoqetQ//vrR12kMFynXyQoLVcMsEvi/4bfWQNrUp31jdWm
 jEfCGGEO6reMWH1fd0nbYSzo01VuZ+DxtU3Gwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En150Eo+w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxWTvMkul
 oUdj7nzEiF0Ao7ut+oydQYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YuBqmsQkKtitJI4Fs2ts5TrYEewnUdbIRKCiCdpwgm5q2ZsSQqu2i
 8wxcgZwNU7daRh2B3xMWcohnv6o2kDnbGgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m6aq
 XjB5H/RGQwBOZqUzj/t2n+si+qMjS79cIdPDPuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySWosLVBkPi5iTe51hFBoQWQ7ZSBByxJrT8wxy6HzdaHm57TZ99kpIKZh4F2
 HCvgIa8bdBwi4G9RXWY/7aSiDq9PykJMGMPDRM5oRs5D8rL+99q0E+WJjp3OOvs14CuR2msq
 9yfhHVm74j/m/LnwElSEbrvpzu37qbEQQcujuk8djL0t1gpDGJJimHB1LQ60RqiBNrJJrVil
 CJd8yR70AzoJcrT/MBqaL9XdIxFH97fbFXhbadHRvHNDQiF9X+5Zpx36zpjPkpvOctsUWa3P
 BaI41oBvcEJYCXCgUpLj2SZUJpCIU/IT4+NaxwpRoAWPsgZmPGvoUmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNEiU5GHeegvp6pdynnpW7TqKHfjTlk37uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 r6zwePRkE4BOAA/CwGKmbMuwacicSJmWMuo8pMPLYZu4GNOQQkcNhMY+pt5E6QNokifvr6gE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:zi6elqHor382075qpLqE7seALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZMgpHjJYVcqKRQdcL+7VZVoLUmxyXcx2/h2AV7AZniFhILLFuFfBOLZqlWKcREWtNQttp
 uIG5IOceEYZmIasS+V2maFL+o=
X-IronPort-AV: E=Sophos;i="5.88,263,1635220800"; 
   d="scan'208";a="61273475"
Date: Wed, 5 Jan 2022 10:09:43 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Elliott Mitchell <ehem+xen@m5p.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [PATCH 1/5] tools/libxl: Mark pointer args of many functions
 constant
Message-ID: <YdVuZyvwrDUxn4O4@perard>
References: <cover.1640590794.git.ehem+xen@m5p.com>
 <80dd561339dbe54f1ed2c2302ace389e87d445fe.1640590794.git.ehem+xen@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80dd561339dbe54f1ed2c2302ace389e87d445fe.1640590794.git.ehem+xen@m5p.com>

On Fri, Dec 18, 2020 at 01:37:44PM -0800, Elliott Mitchell wrote:
> Anything *_is_empty(), *_is_default(), or *_gen_json() is going to be
> examining the pointed to thing, not modifying it.  This potentially
> results in higher-performance output.  This also allows spreading
> constants further, allowing more checking and security.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

This patch doesn't build.

    libxl_cpuid.c:510:17: error: conflicting types for ‘libxl_cpuid_policy_list_gen_json’
      510 | yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    In file included from libxl_internal.h:89,
                     from libxl_cpuid.c:15:
    /home/sheep/work/xen/tools/libs/light/../../../tools/include/libxl_json.h:30:17: note: previous declaration of ‘libxl_cpuid_policy_list_gen_json’ was here
       30 | yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Also we talked about this patch before, in
    https://lore.kernel.org/xen-devel/YImXfc4oaPgWzkeT@perard/

Cheers,

-- 
Anthony PERARD

