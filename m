Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A2919796B
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 12:39:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIrnW-0001Gs-LF; Mon, 30 Mar 2020 10:37:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vI0s=5P=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jIrnV-0001Gn-4w
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 10:37:37 +0000
X-Inumbo-ID: 75a444e5-7272-11ea-b9bb-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75a444e5-7272-11ea-b9bb-12813bfff9fa;
 Mon, 30 Mar 2020 10:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585564652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jCi8njfntM9Xbg3bgFe36eYzLEvBSG/LqLnAI07jFEU=;
 b=d+K7oaqB3SfTwcJgPc/f/GIs07g5ZImnCkY2yFqgiGlfnhN5Pqm9yqAL
 pgnkO65nXAuP3QQaS/fwOkHTVx8VdGAKUf7M+n+Ek2hKSxPnl/EGDUvTg
 koYR1XXABzLkreAeKxaUIOxZu6IyNCkrhnyYpRGUirh99IQhfYMAY/seF Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jdo+YKdoxgmM86zg2JpZG6rvKym2f4ac1vJYFOvSpoMMWMn51YnvQfgjfmtdLjaXIcYxgXaP91
 eRYfI6AjZ3Ta1oXwq26UXVc3sgTx4+1Ao38BQUOVTaQ3CxLiXBPOahY9R0BwugYPtQN3yi4Mr/
 qZeZX4R4NNdTYvX9QQW7OO/jgZLC5lkPtXpDG0H2rWFZYIZGp4NI6d2eFO7rc/kh3/ajtIyJnT
 2BLmigbLotr277vU4ju4kAV6nH/RsEMR8UsoHpQsWeWtEKoyNZiZIWxlB6oLlrXran1BaPt0S5
 PNw=
X-SBRS: 2.7
X-MesageID: 14861979
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,324,1580792400"; d="scan'208";a="14861979"
Date: Mon, 30 Mar 2020 12:37:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200330103724.GQ28601@Air-de-Roger>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-3-julien@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200327190546.21580-3-julien@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 2/3] xen/x86: ioapic: Rename
 init_ioapic_mappings() to init_ioapic()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>, Wei
 Liu <wl@xen.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Mar 27, 2020 at 07:05:45PM +0000, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The function init_ioapic_mappings() is doing more than initialization
> mappings. It is also initialization the number of IRQs/GSIs supported.
> 
> So rename the function to init_ioapic(). This will allow us to re-use
> the name in a follow-up patch.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I've got one comment/request however.

> ---
>  xen/arch/x86/apic.c           | 2 +-
>  xen/arch/x86/io_apic.c        | 2 +-
>  xen/include/asm-x86/io_apic.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
> index cde67cd87e..c7a54cafc3 100644
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -978,7 +978,7 @@ __next:
>          boot_cpu_physical_apicid = get_apic_id();
>      x86_cpu_to_apicid[0] = get_apic_id();
>  
> -    init_ioapic_mappings();
> +    init_ioapic();

I would rename this to ioapic_init instead since you are already
changing it. I usually prefer the subsystem name to be prefixed to the
action the function performs instead of the other way around.

Thanks, Roger.

