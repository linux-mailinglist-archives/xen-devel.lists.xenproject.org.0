Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E3765112
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:27:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570991.893732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyDU-0001jd-Dx; Thu, 27 Jul 2023 10:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570991.893732; Thu, 27 Jul 2023 10:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyDU-0001h7-AT; Thu, 27 Jul 2023 10:27:32 +0000
Received: by outflank-mailman (input) for mailman id 570991;
 Thu, 27 Jul 2023 10:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o85N=DN=citrix.com=prvs=5659ebe79=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qOyDS-0001gy-Lv
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:27:30 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ee8a21c-2c68-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:27:28 +0200 (CEST)
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
X-Inumbo-ID: 2ee8a21c-2c68-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690453648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bXBuogiBSSXFmWb2iq5w7ozQSgdS58uuxOYhLD+Umro=;
  b=VyFRl7z2u14EEEZorkqP5QkSWPty22qhVQ3AWYWfC90KgyhP8xqaSVWJ
   OxruZ6o8pxpUIXsadlFMx+PtkVRI0dxhSLnKkcqLfov4xdvKVtWmhN+/+
   s0GJtSfOPtQftDh9HmiW/QTvV1jP64frzw4ediABAYJCNbPuSaDmlboIg
   c=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 117502348
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:MX1h2KzydVGschFF6VZ6t+fXxirEfRIJ4+MujC+fZmUNrF6WrkVUn
 2BNWjiBbvfcY2b8KN8nPd+y/UhUvcXcydExSANq+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhP68T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWF+0
 N48CRNOVzGC3NmfzImRTM5Ditt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+hgGX/dDtJ7kqYv6Mt70DYzRBr0airO93QEjCPbZwMwRvA/
 DmarwwVBDlBDOa0+zOo70uvqeCUogTmAKICBLO3o6sCbFq7mTVIVUx+uUGAifuwjEKkSs9cA
 0MR8ysq66M18SSDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZebPQ2uclwQiYlv
 neLkMnuHidHq6CORDSW8bL8hTG4NDURLGQCTTQZVgZD6N7myKkxkxbOQ9BLAKOzyNrvFlnY2
 CuWpSIzg7ESi88j1Kih+13DxTW2qfDhRxY4/AzNUkq57wlyY8iuYInA1LTAxa8edsDDFADH5
 SVa3ZHEt4jiEK1higSNcMAvOJCKpM+kMWbnqFJUNZ8G2DiyrivLkZ9r3N1uGKt4Gp9aKGeyM
 RSD4V85CIx7ZyXzM/IuC26lI4FzlPW7S4y4PhzBRoAWCqWdYjNr682HiaS4+2n22HYhnqgkU
 XtwWZb9VC1KYUiLIdffegv87VPI7npkrY8rbcqnpylLKJLHDJJvdZ8LMUGVcscy576erQPe/
 r53bpXbk04ODrehM3KPrub/yGzmy1BhW/gaTOQOKIa+zvdOQjl9W5c9P5t/E2Cao0ilvriRp
 SzsMqOp4FH+mWfGOW23hoNLMdvSsWJEhStjZ0QEZA/4s0XPlK7ztM/zgbNrJ+h4nAGipNYoJ
 8Q4lzKoW6sUEWmWpGxGNvEQbuVKLXyWuO5HBAL9CBBXQnKqb1WhFgPMFuc3yBQzMw==
IronPort-HdrOrdr: A9a23:xsxAUK3gI/xQjKdhZeG/7AqjBB8kLtp133Aq2lEZdPWaSK2lfq
 eV7ZImPH7P+VEssRQb8+xoV5PsfZqxz/JICMwqTNSftOePghrVEGgg1/qe/9XYcxeOidK1rJ
 0QDZSWaueRMbEKt7ef3ODiKadY/DDvysnB7ts2jU0dLz2CDZsO0+4TMHf/LqQZfmd77LMCZe
 uhz/sCiTq8WGgdKv+2DmMCWIH41qf2vaOjTx4aJgItrDKDhzOw6LL8DnGjr2wjegIK77c+0H
 TP1zf07KW7s/2911v12mLJ445N8eGRuedrNYijitU1Nj6psAquaYh7MofyxAwdre209VYsmM
 TNpRA7Vv4Dm0/sQg==
X-Talos-CUID: 9a23:XX6YtWOKU6iWGu5DWBlC1mo1OYMcU3yG917cGGW+LkllV+jA
X-Talos-MUID: 9a23:IP7JQAitF6aUWgWJu7IFM8Mpb/9SyJanJV00kroJ4PajKHRQKyeTg2Hi
X-IronPort-AV: E=Sophos;i="6.01,234,1684814400"; 
   d="scan'208";a="117502348"
Date: Thu, 27 Jul 2023 11:27:21 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 04/15] xen/sysctl: Nest cpufreq scaling options
Message-ID: <5a6365b0-7809-4287-96fa-be7809d664c8@perard>
References: <20230726170945.34961-1-jandryuk@gmail.com>
 <20230726170945.34961-5-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230726170945.34961-5-jandryuk@gmail.com>

On Wed, Jul 26, 2023 at 01:09:34PM -0400, Jason Andryuk wrote:
> Add a union and struct so that most of the scaling variables of struct
> xen_get_cpufreq_para are within in a binary-compatible layout.  This
> allows cppc_para to live in the larger union and use uint32_ts - struct
> xen_cppc_para will be 10 uint32_t's.
> 
> The new scaling struct is 3 * uint32_t + 16 bytes CPUFREQ_NAME_LEN + 4 *
> uint32_t for xen_ondemand = 11 uint32_t.  That means the old size is
> retained, int32_t turbo_enabled doesn't move and it's binary compatible.
> 
> The out-of-context memcpy() in xc_get_cpufreq_para() now handles the
> copying of the fields removed there.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> NOTE: Jan would like a toolside review / ack because:
>     Nevertheless I continue to be uncertain about all of this: Parts of
>     the struct can apparently go out of sync with the sysctl struct, but
>     other parts have to remain in sync without there being an
>     appropriate build-time check (checking merely sizes clearly isn't
>     enough). Therefore I'd really like to have a toolstack side review /
>     ack here as well.

I wish we could just use "struct xen_get_cpufreq_para" instead of
having to make a copy to replace the XEN_GUEST_HANDLE_*() macro.

Next I guess we could try to have something like the compat layer in xen
is doing, with plenty of CHECK_FIELD_ and other CHECK_* macro, but that
would be a lot of work. (xen/include/xen/compat.h and how it's used in
xen/include/compat/xlat.h)

Unless you feel like adding more build check, I guess the patch is good
enough like that:
Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

