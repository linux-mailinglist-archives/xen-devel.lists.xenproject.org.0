Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21469277A25
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 22:24:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLXmh-0005PO-Dc; Thu, 24 Sep 2020 20:24:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oT5B=DB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kLXmg-0005PJ-9e
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 20:24:06 +0000
X-Inumbo-ID: e20569de-928a-4ff0-98be-3e5fe2d73d64
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e20569de-928a-4ff0-98be-3e5fe2d73d64;
 Thu, 24 Sep 2020 20:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600979043;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vrsUMuCSqi23XJ0Xy09Z0CHs3L8+lcfKCfX6//biWKg=;
 b=UxvoI45WGSIzH679qNJErYA9AKIydWtoYMr3lDCztcd+DV6tqDBzH0eE
 a2kPp6TtoKxDLgKIoXHNJMCwHnrFWctlP0PVPJAwiZ8y0ZC8KINs8zcp1
 Ss1gQh59T36J91sEEi4OqOb2VJ51o1hZOPeHA/oTxxb0HuIr8EtN71O/C w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: B7VWk2xeSsxvj4f/e1LuDpnX7K5nwfgh2hcZXE7L5VVb78gJYpyKLyajyWmjPo0/FvoVXUlJ8y
 EPOi0BX8wSNOZHu7KXZSz31i3eNtbup1f4dHA2v8fpn/cdSXlMUyBo3YGi7rCTaJK6/07xQIfY
 NbWT2+JQZaG/AxXc7Cyzts6IjBxIqaageRtd3VjuBwdUGo0nzJZfE5raa6OpuVzf1yN6KkKm3r
 Sa3SwKiKJb3febIDaRIsQ7g1gXiKA0P9/j5MQwTWkEwyAyzI5b8hYUaV45nxhPKa4HawomMorc
 JyQ=
X-SBRS: None
X-MesageID: 28526152
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,299,1596513600"; d="scan'208";a="28526152"
Subject: Re: [PATCH] tools/libs/guest: fix out of tree builds of libxenguest
 users
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200923052401.24917-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a99b7ed3-cd1c-a63d-cc9b-66749ac94ce4@citrix.com>
Date: Thu, 24 Sep 2020 21:23:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923052401.24917-1-jgross@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23/09/2020 06:24, Juergen Gross wrote:
> xenguest.h includes xenctrl_dom.h, which is including the Xen internal
> xen/libelf/libelf.h. This results in build failures for components
> using libxenguest when being built outside the Xen build environment.
>
> Fix that by guarding the include of xenctrl_dom.h with
> "#ifdef __XEN_TOOLS_".
>
> Fixes: 7e0165c19387 ("tools/libxc: untangle libxenctrl from libxenguest")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  tools/libs/guest/include/xenguest.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/libs/guest/include/xenguest.h b/tools/libs/guest/include/xenguest.h
> index 4643384790..5cd502f644 100644
> --- a/tools/libs/guest/include/xenguest.h
> +++ b/tools/libs/guest/include/xenguest.h
> @@ -22,7 +22,9 @@
>  #ifndef XENGUEST_H
>  #define XENGUEST_H
>  
> +#ifdef __XEN_TOOLS__
>  #include <xenctrl_dom.h>
> +#endif

I have to admit that this doesn't feel right to put into a public header.

Can't we split xenctrl_dom in half and merge the relevant subsets into
xen{ctrl,guest}.h ?

~Andrew

