Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3C11F1A55
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 15:48:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiI8P-0006ZA-7v; Mon, 08 Jun 2020 13:48:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iXsd=7V=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jiI8N-0006Z5-Ji
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 13:48:15 +0000
X-Inumbo-ID: b2f34144-a98e-11ea-9b55-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2f34144-a98e-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 13:48:14 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xf7Y8GjkauFEV1JKERyWjDzhXxM6gjegyDd5m1Z5TX7oNllGB64KSePD6Ge12US2qdZJBIPmjQ
 7FWrhjqKwjDNYXIo5QgMRLj9u4WL+M0grfHGGfwSy18uUPxRALSiHRt4ki2HQ4Stzm6jrf3ccA
 Vw5mocnd0J/I/p/z544DgGRTIazl5IAL6IsM+XzrnB6XEHnDZTbS+mhLUsANaRg4cUBl08iMbg
 nEyl3XyhPnWDMPQtfSMZisaUBKHPR/+RL2MR0TYpJCqhDcPQyVh7hN4LG1Du/1DO0FmWuvBdAW
 SNI=
X-SBRS: 2.7
X-MesageID: 20234231
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="20234231"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24286.16793.101133.543735@mariner.uk.xensource.com>
Date: Mon, 8 Jun 2020 14:48:09 +0100
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 for-4.14] docs/support-matrix: unbreak docs rendering
In-Reply-To: <20200608133433.23659-1-andrew.cooper3@citrix.com>
References: <20200608133433.23659-1-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Paul Durrant <paul@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Andrew Cooper writes ("[PATCH v2 for-4.14] docs/support-matrix: unbreak docs rendering"):
> The cronjob which renders https://xenbits.xen.org/docs/ has been broken for a
> while.  commitish_version() pulls an old version of xen/Makefile out of
> history, and uses the xenversion rule.
> 
> Currently, this fails with:

Thanks for fixing this!

> +    local maj=$(sed -n 's/.*XEN_VERSION.*= \([0-9]\+\)/\1/p' < "$tmp_versionfile")
> +    local min=$(sed -n 's/.*XEN_SUBVERSION.*= \([0-9]\+\)/\1/p' < "$tmp_versionfile")

> +    if [[ -z $maj || -z $min ]];

I would prefer to avoid use of the unusual bash-specific [[ ]] syntax,
not because of concerns about portability to other shells (since this
is a #!/bin/bash script) but because many programmers won't be
familiar with it.

Would you mind writing this instead

  +    if test -z "$maj" || test -z "$min"; then

?

> +    printf "%d.%d\n" "${maj}" "${min}"

The { } here are not necessary but I don't kind if you feel they add
clarity.

You might also want to retain some text in the comment about what
assumptions we are making about xen/Makefile.  Different assumptions
to before, but assumptions nevertheless.

In any case, with or without the changes I suggest above:

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

On IRC:

14:35 <andyhhp__> Diziet: jbeulich: For the docs support-matrix
fix, any concerns with me backporting it immediately?

Having thought about this properly, I don't think we need to urgently
backport this.  In our own infrastructure, the one from staging (or
maybe it is master) is used.  The same script is used to parse all
older versions.

But I think it is a backport candidate.  Maybe add a Backport:
tag and my Backport-Requested-By ?

Thanks,
Ian.

