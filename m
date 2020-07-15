Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA38221335
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 19:07:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvksd-0007eW-2z; Wed, 15 Jul 2020 17:07:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3pvp=A2=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jvksa-0007eR-Ny
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 17:07:36 +0000
X-Inumbo-ID: add44c0c-c6bd-11ea-8496-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id add44c0c-c6bd-11ea-8496-bc764e2007e4;
 Wed, 15 Jul 2020 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594832857;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=FbX8MjGKU+Jfj1e6lWUlUNKCQU6B26jDQrRmqinAWoI=;
 b=FsERpbvM4wF+rYh1AOG13MjJTRidrivsie2Pm1yaDYV+9uu/8DVhE6Ju
 cw5ohQ1qi2rar7bRX73rsd5BvTc47Iy7a7zufwcziH5cnByBIFTWl7+Wh
 z1/4HfphDS7Cx7ZG2N3edoswBNeKEK1hpMpY+kLhwNGCYUX/sdyt2Bnwj A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: D/DN2EO85rxYrB9J08pvpyvYW26JREQWaJAbgsFzLG69gc4OmjyR4KldJNsUye+fN17yBVse0W
 prHEHU1JUzMTPBNdthMXHfK7n8nMfrhgd8on6j5ufvELg6merpQ7E45UowWvok967oZnZHP0Rx
 saRi1ByNNnrILOmKPAeiZ6N0uSAKBv284+LNjWbSDn8bLU8SBre4coTmb36QV/lPGuhzGXGmSN
 QCjqVgq1BIJWbs37VixQi4ez5ieQqmIY1eGYYcr2PL4GOKYgtdRTt9EaBIBkI/HUg2Qwc+dS3w
 ok8=
X-SBRS: 2.7
X-MesageID: 22776360
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22776360"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24335.14276.232430.125457@mariner.uk.xensource.com>
Date: Wed, 15 Jul 2020 18:07:16 +0100
To: "incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com"
 <incoming+61544a64d0c2dc4555813e58f3810dd7@incoming.gitlab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 07/12] tools/libxc: untangle libxenctrl from libxenguest
In-Reply-To: <20200715162511.5941-9-ian.jackson@eu.citrix.com>
References: <20200715162511.5941-1-ian.jackson@eu.citrix.com>
 <20200715162511.5941-9-ian.jackson@eu.citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ian Jackson writes ("[PATCH 07/12] tools/libxc: untangle libxenctrl from libxenguest"):
> From: Juergen Gross <jgross@suse.com>
> 
> Sources of libxenctrl and libxenguest are completely entangled. In
> practice libxenguest is a user of libxenctrl, so don't let any source
> libxenctrl include xg_private.h.
> 
> This can be achieved by moving all definitions used by libxenctrl from
> xg_private.h to xc_private.h. Additionally xc_dom.h needs to be
> exported, so rename it to xenctrl_dom.h.
> 
> Rename all libxenguest sources from xc_* to xg_*.
> 
> Move xc_[un]map_domain_meminfo() fnctions to new source xg_domain.c as
> they are defined in include/xenguest.h and should be in libxenguest.
> 
> Remove xc_efi.h and xc_elf.h as they aren't used anywhere.

Reviewing this is quite difficult.  Is there any way it could be split
up ?  Perhaps some of it could be generated automatically ?  (Eg you
could send a patch whose commit message had the perl rune you used to
generate it, which would enable a reviewer to see what was supposed to
be going on.)

Thanks,
Ian.

