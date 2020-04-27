Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CA11BA98E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Apr 2020 18:01:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jT6Bp-0001ka-0j; Mon, 27 Apr 2020 16:01:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jrem=6L=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jT6Bn-0001kV-VQ
 for xen-devel@lists.xenproject.org; Mon, 27 Apr 2020 16:01:00 +0000
X-Inumbo-ID: 48418e64-88a0-11ea-97b3-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48418e64-88a0-11ea-97b3-12813bfff9fa;
 Mon, 27 Apr 2020 16:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588003258;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YG0ApSthlCMFZiia2oF76yi2aWS/H+oIXsuYehyDp/E=;
 b=B3LB7gh2Po5JYW689f3IguOWfny6NbPgIBqURIvL8E2XrLXogDHu0E5X
 Guajp8DPlav5xvVNZNzpqhmmVH4FhBH7D+UeNT596NmLs0Yc/tnAjOZc9
 vbS7Muy/lBwrWIJf91Ism3guLfbJELrsfZlhbpKlZDBTtqborRl75xVFD k=;
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
IronPort-SDR: 9zur46vGKK/qFZaEWsAB61CxK9BcPgkJHG8PxvRWcHxXyOKSdlqE9U/w88jxMJX5ISSPUV1tKP
 CyKni0UoSmh/15RkwgeLg4mT9yAgYnsmwwbh23qmkJGm3L+PZQPEHX4BBHcleHJ/zy5LOxd34J
 0s1GkCHhKXxtj0WwqpAu5O9xQDqkA5/w7102dg+JiADTuy3eJawSRr++gYdK3LXhR8Am5V0h58
 kqdcj/ViuT9A548h3gbPQbTHwbMleJV3lucZLObsxcvcYaEAn6qv0lIzVvXOPeIosHNBbc6PQg
 ggw=
X-SBRS: 2.7
X-MesageID: 16328224
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,324,1583211600"; d="scan'208";a="16328224"
Date: Mon, 27 Apr 2020 18:00:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: refine guest_mode()
Message-ID: <20200427160048.GQ28601@Air-de-Roger>
References: <7b62d06c-1369-2857-81c0-45e2434357f4@suse.com>
 <20200427095913.GN28601@Air-de-Roger>
 <40d5c1b8-b68e-1aa8-b17e-77ba9afc6529@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40d5c1b8-b68e-1aa8-b17e-77ba9afc6529@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Apr 27, 2020 at 04:08:59PM +0200, Jan Beulich wrote:
> On 27.04.2020 11:59, Roger Pau Monné wrote:
> > On Mon, Apr 27, 2020 at 10:03:05AM +0200, Jan Beulich wrote:
> >> --- a/xen/include/asm-x86/regs.h
> >> +++ b/xen/include/asm-x86/regs.h
> >> @@ -10,9 +10,10 @@
> >>      /* Frame pointer must point into current CPU stack. */                    \
> >>      ASSERT(diff < STACK_SIZE);                                                \
> >>      /* If not a guest frame, it must be a hypervisor frame. */                \
> >> -    ASSERT((diff == 0) || (r->cs == __HYPERVISOR_CS));                        \
> >> +    if ( diff < PRIMARY_STACK_SIZE )                                          \
> >> +        ASSERT(!diff || ((r)->cs == __HYPERVISOR_CS));                        \
> > 
> > Why not use:
> > 
> > ASSERT(diff >= PRIMARY_STACK_SIZE || !diff || ((r)->cs == __HYPERVISOR_CS));
> 
> Except for the longer (without being helpful imo) string reported if
> the assertion triggers, I see not difference.

Wanted to avoid the empty if on non-debug builds, but I assume the
compiler will already optimize it out.

> > I'm not sure I fully understand this layout, is it possible that you
> > also need to account for the size of cpu_info?
> 
> Depends on how paranoid we want the checking here to be, but in going
> further I wouldn't want this to become sub-page fine-grained if we
> aren't first doing e.g. what I'm mentioning in the post-commit-message
> remark.

Right, leaving it as-is is fine, just wanted to be sure I fully
understand the layout.

Thanks, Roger.

