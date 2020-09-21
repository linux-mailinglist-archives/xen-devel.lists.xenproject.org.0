Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158B273399
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 22:34:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKSWO-0001Sd-FG; Mon, 21 Sep 2020 20:34:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIeE=C6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kKSWM-0001S7-RS
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 20:34:46 +0000
X-Inumbo-ID: 72ba40b8-b8e2-4a29-aebd-e653223906f3
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72ba40b8-b8e2-4a29-aebd-e653223906f3;
 Mon, 21 Sep 2020 20:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600720486;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ZYUvee04j2heAqbtOalg6aDsC6imyQhcvAD3gz1E+5M=;
 b=T1FQV4tpA0XBbOl0eh3SEZqNVLzefR1JMOgH6NO5QuaS7Ot9Xje1fOmY
 I5XdNJMYTIABmuwT1E9sCldO+CmOmUeIKXpk8HhTHZSxuGUkC3GIgiD61
 +Pq0jB/g9j1iGlN/VLMZoJwiL09nJGC5KOLHYIn4F12gpj6PUw5r8B6PA s=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UklDgMt6pD81Ss8zhelVfAFz+UVPlrEj+1sCKY4EkayatPC8e9nMsk0dz9HBmeVArhaA3LDeqO
 YWVyF4g9v+fAmMnV2LrsgoN8b3gh4wZI6A72VwSGfU61sV6o6N2ejA1lGObDGjdfh3zZS2KBaj
 e0zTvXeBXRyV+jzbS4i4Revy0+Q/FmqvJetqHXiV/RhHbzf3hTwPmipcXoJzByw6lj0mmi+Pp4
 jsm3lHrdbzWpCKHNqDuzNlPYJ+ezLfU47Ikav6ET3+dAX6P0tJ/BMNB8hn/S92KS6INTZCdqrs
 fnA=
X-SBRS: 2.7
X-MesageID: 27537140
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,287,1596513600"; d="scan'208";a="27537140"
Subject: Re: [PATCH v4 3/4] xen: Remove mfn_to_gmfn macro
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien.grall@arm.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jan Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
 <20200921180214.4842-4-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e0783993-50b0-cdf4-895d-45ef8f40450b@citrix.com>
Date: Mon, 21 Sep 2020 21:34:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200921180214.4842-4-julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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

On 21/09/2020 19:02, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
>
> On x86, mfn_to_gmfn can be replaced with mfn_to_gfn. On Arm, there are
> no more call to mfn_to_gmfn, so the helper can be dropped.

The previous patch dropped the mfn_to_gmfn() call from the domain shared
info path, but without a hunk adjusting the innards of
memory_exchange(), this is going to break the x86 build.

> At the same time rework a comment in Arm code that does not make sense.
>
> Signed-off-by: Julien Grall <julien.grall@arm.com>

To save a round trip, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com> with the appropriate hunk to memory_exchange().

Alternatively, it might make sense to fold the adjustment into patch 1
which is perhaps more obvious, given the insertion of an is_pv_domain()
check.

~Andrew

