Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94864FC20D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 18:14:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.303174.517242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndwfx-0000yT-5l; Mon, 11 Apr 2022 16:14:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 303174.517242; Mon, 11 Apr 2022 16:14:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndwfx-0000v8-2M; Mon, 11 Apr 2022 16:14:01 +0000
Received: by outflank-mailman (input) for mailman id 303174;
 Mon, 11 Apr 2022 16:13:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fGF=UV=citrix.com=prvs=09352fbbd=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ndwfv-0000v1-QA
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 16:13:59 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 623a465c-b9b2-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 18:13:56 +0200 (CEST)
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
X-Inumbo-ID: 623a465c-b9b2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649693636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g3Dfwn4w1/xGuwF2gVmGTQVILZVa/GsBPT2QW5sT/NI=;
  b=HWaGd53sIOpF2RveROThUFizX1Ye+uDCvyahravW6aXaCe/molpKqiSv
   zoTD9bpufuznXMcB61iSAPu5dGgz06nI/XZdDlJxJ4A26W9wjBxverxxG
   sC5uB24xtvWa++dYoJdR783LE0SpwgtaKrCy4cR98UuL+e3qdwlQNQQAz
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 68583968
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TiE/yqKkjUhbZrtvFE+RL5UlxSXFcZb7ZxGr2PjKsXjdYENS0mYBm
 mdKWm2DMvnYZGLxeYp1O9y+pEIBvpSAxoc2GQFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tcx2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 N50rrCsRQQKApLNydQPY15HSzNPB5QTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQ6aDN
 5FIN2oHgBLobkwWCFY2GcgCpsDrr2W4fTNg9XWFnP9ii4TU5FMoi+W8WDbPQfSVQe1Fk0Deo
 XjJl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJW0+fJnj0ea7nACAx0RE12gqL+2jVDWc9FYL
 VYd9mwxrKwx3EuxR9L5Uluzp3vslhwBX9tdFcUq5QfLzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 zehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/Hhr5s6ihbnR9NqAqmzyNbyHFnYz
 yiRqSkih50alcMRy7ig5lfDni6toZ7SCAUy423qsnmNt10jItT/PsrxtAadva0owJulokept
 0Eft9SS78MyMpDcpD69B/pVDoCT3qPQWNHDumJHE54k/jWr3nese4FM/T1zTHtU3tY4lSzBO
 xGK514IjHNHFD7zNPIsPdrtYyg/5fK4fekJQMw4eTanjnJZUAactB9jakeLt4wGuBh9yPpvU
 Xt3nCvFMJr7NUiF5GftLwv++eVyrszb+Y80bcqmpylLKZLEOBaopU4taTNilNwR4qKeuxny+
 N1CLcaMwBg3eLSgPniJqNBIcAlVfCJT6XXKRyt/LLDrH+abMDt5V6+5LU0JJuSJYJi5Zs+Xp
 yrgCye0OXL0hGHdKBXiV5yQQOiHYHqLllpiZXZEFQ/xgxALON/zhI9CJ8pfVeR2r4RLkK8rJ
 8Tpju3dW5yjvBycoG9DBXQ8xaQ/HCmWafWmY3L+MGdiJcY5L+ELk/e9FjbSGOA1JnLfnaMDT
 3eIi2s3nbJrq9xeMfvr
IronPort-HdrOrdr: A9a23:XpQEq6DIItmfwxTlHemu55DYdb4zR+YMi2TC1yhKKCC9Vvbo8P
 xG/c5rsSMc5wx8ZJhNo7+90ey7MBXhHP1OkOws1NWZLWrbUQKTRekIh+bfKn/bak/DH4ZmpN
 5dmsNFaOEYY2IVsfrH
X-IronPort-AV: E=Sophos;i="5.90,252,1643691600"; 
   d="scan'208";a="68583968"
Date: Mon, 11 Apr 2022 17:13:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>, Julien Grall <jgrall@amazon.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Roger Pau
 =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Ping: [XEN PATCH v10 7/7] build: adding out-of-tree support to the
 xen build
Message-ID: <YlRTu/5yIaxJF9Z3@perard.uk.xensource.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
 <20220322112238.1117737-8-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322112238.1117737-8-anthony.perard@citrix.com>

Hi Ross,

Could you also ack this livpatch change?

Thanks.

On Tue, Mar 22, 2022 at 11:22:38AM +0000, Anthony PERARD wrote:
> This implement out-of-tree support, there's two ways to create an
> out-of-tree build tree (after that, `make` in that new directory
> works):
>     make O=build
>     mkdir build; cd build; make -f ../Makefile
> also works with an absolute path for both.
> 
> This implementation only works if the source tree is clean, as we use
> VPATH.
> 
> This patch copies most new code with handling out-of-tree build from
> Linux v5.12.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> Tested-by: Julien Grall <jgrall@amazon.com>
> ---
[...]
> diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
> index ddb07371315e..c258ab0b5940 100644
> --- a/xen/test/livepatch/Makefile
> +++ b/xen/test/livepatch/Makefile
> @@ -11,6 +11,8 @@ endif
>  CODE_ADDR=$(shell nm --defined $(1) | grep $(2) | awk '{print "0x"$$1}')
>  CODE_SZ=$(shell nm --defined -S $(1) | grep $(2) | awk '{ print "0x"$$2}')
>  
> +CFLAGS-y += -iquote $(obj)
> +
>  extra-y += xen_hello_world.livepatch
>  xen_hello_world-objs := xen_hello_world_func.o xen_hello_world.o note.o xen_note.o modinfo.o
>  $(obj)/xen_hello_world.o: $(obj)/config.h

-- 
Anthony PERARD

