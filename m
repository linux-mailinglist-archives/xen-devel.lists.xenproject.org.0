Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D8F23CBFE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 18:16:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3M5C-00063n-8w; Wed, 05 Aug 2020 16:16:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBnt=BP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3M5A-00063Y-P9
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 16:16:00 +0000
X-Inumbo-ID: 8041c16c-0e88-4c4c-833d-8c4d0c5a0796
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8041c16c-0e88-4c4c-833d-8c4d0c5a0796;
 Wed, 05 Aug 2020 16:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596644159;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qfiJmy/YxqePuWm/akeJFID0CCDl/0vBNinplJX9SXA=;
 b=JU3OBm/tC9SeQGW2dh9XXE18onc8nr+6rAfGr2X6bs22P4EBe9NrgEDi
 Mjde0rnknGMdtTZQWILRu/GfRm744nD7ZX5eL6WNcBO5Vm2ianG3wMyOB
 XrJMNy2yK0PUQ6BzW5b7RaiMLSqTZZ74wKA0ImFHPK1ckrXkMOf+cqksN Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 78/Bts44FYobLCPgbp69v3G1MyIU/aAa4ojlHh24cBBf7mmSXDlcuD6qcvFaic1PQsGwPNJ/Os
 2DEB3EzlPPMy5EOnRTdfiyLNvPrlWMEkWhZBbW3LHqikkLJ6Eyei+c36JYJc0PXkhXzie4MgUr
 IoC/rqrnibRHD/cjNrVlWocwLlqvTsCskzJiFDLQT57fxuDX9iJX8Xw2ykGRZ7UIDoAaetFHtO
 phZJMLVuobCyJGScxQnnKQvsL5s/llzRDfImBbqXA9alPf3VQmNLB6F8UDIHasAZYS3Ap+IIq9
 ieA=
X-SBRS: 3.7
X-MesageID: 23960864
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,438,1589256000"; d="scan'208";a="23960864"
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 <xen-devel@lists.xenproject.org>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <57ab62fb-048f-44ae-f815-9d5054457eb9@citrix.com>
Date: Wed, 5 Aug 2020 17:15:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan
 Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Tim Deegan <tim@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/08/2020 19:21, Oleksandr Tyshchenko wrote:
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 06881d0..f6fc3f8 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -70,6 +70,7 @@ extra-y := symbols-dummy.o
>  
>  obj-$(CONFIG_COVERAGE) += coverage/
>  obj-y += sched/
> +obj-$(CONFIG_IOREQ_SERVER) += hvm/
>  obj-$(CONFIG_UBSAN) += ubsan/
>  
>  obj-$(CONFIG_NEEDS_LIBELF) += libelf/
> diff --git a/xen/common/hvm/Makefile b/xen/common/hvm/Makefile
> new file mode 100644
> index 0000000..326215d
> --- /dev/null
> +++ b/xen/common/hvm/Makefile
> @@ -0,0 +1 @@
> +obj-y += ioreq.o
> diff --git a/xen/common/hvm/ioreq.c b/xen/common/hvm/ioreq.c
> new file mode 100644
> index 0000000..7e1fa23
> --- /dev/null
> +++ b/xen/common/hvm/ioreq.c
> <snip>

HVM is an internal detail of arch specific code.  It should not escape
into common code.

From x86's point of view, there is nothing conceptually wrong with
having an IOREQ server for PV guests, although it is very unlikely at
this point that adding support would be a good use of time.

Please make this into a proper top-level common set of functionality.

~Andrew

