Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D91DBA6B
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 19:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbS4n-00076i-VG; Wed, 20 May 2020 17:00:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N77=7C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbS4m-00076d-Cj
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 17:00:16 +0000
X-Inumbo-ID: 5f7d14ea-9abb-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f7d14ea-9abb-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 17:00:14 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UsxlX1X7VTEfq6+h6MalDh9nt0ZhtNSXX5fYOoHqBiJc2h+85Kl+KLUDe4XrnxNh+HPoBwTZRo
 IOi0c+7PPnW3bU+6auttrhQg/h9WUeKA7WF1Z37pZyYDWQP3rTAjHO4DK05YqsM2Ep8PLbT5pX
 T7r/unLZOCZni1Qvpk+/97nfvDlVox9Q5BxuNocjKbItmqimxAzDRJaSkD6ZbpEadpgFkfs/p5
 0c8rk7KgAtHYdajo3UoQdrE+CWfPSBO2JCOHmcd3m89H/5M7hyW0Sb4WFiYzm6atuByY2weEdI
 C/Q=
X-SBRS: 2.7
X-MesageID: 18293887
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,414,1583211600"; d="scan'208";a="18293887"
Subject: Re: [XEN PATCH] tools/xenstore: mark variable in header as extern
To: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200520163942.131919-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d13a7f0b-8d19-9f11-6f52-adde304b3c07@citrix.com>
Date: Wed, 20 May 2020 17:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200520163942.131919-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/05/2020 17:39, Anthony PERARD wrote:
> This patch fix "multiple definition of `xprintf'" (or xgt_handle)
> build error with GCC 10.1.0.
>
> These are the error reported:
>     gcc xs_tdb_dump.o utils.o tdb.o talloc.o      -o xs_tdb_dump
>     /usr/bin/ld: utils.o:./utils.h:27: multiple definition of `xprintf'; xs_tdb_dump.o:./utils.h:27: first defined here
>     [...]
>     gcc xenstored_core.o xenstored_watch.o xenstored_domain.o xenstored_transaction.o xenstored_control.o xs_lib.o talloc.o utils.o tdb.o hashtable.o xenstored_posix.o      -lsystemd   -Wl,-rpath-link=... ../libxc/libxenctrl.so -lrt  -o xenstored
>     /usr/bin/ld: xenstored_watch.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here
>     /usr/bin/ld: xenstored_domain.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here
>     /usr/bin/ld: xenstored_transaction.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here
>     /usr/bin/ld: xenstored_control.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here
>     /usr/bin/ld: xenstored_posix.o:./xenstored_core.h:207: multiple definition of `xgt_handle'; xenstored_core.o:./xenstored_core.h:207: first defined here
>
> A difference that I noticed with earlier version of the build chain is
> that before, I had:
>     $ nm xs_tdb_dump.o | grep xprintf
>     0000000000000008 C xprintf
> And now, it's:
>     0000000000000000 B xprintf
> With the patch apply, the symbol isn't in xs_tdb_dump.o anymore.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Ah - this will be a side effect of defaulting to -fno-common now.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

