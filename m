Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C22C1C5844
	for <lists+xen-devel@lfdr.de>; Tue,  5 May 2020 16:12:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVyIW-0001tC-Rp; Tue, 05 May 2020 14:11:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWWA=6T=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jVyIU-0001t3-U8
 for xen-devel@lists.xenproject.org; Tue, 05 May 2020 14:11:46 +0000
X-Inumbo-ID: 59f351d4-8eda-11ea-9887-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59f351d4-8eda-11ea-9887-bc764e2007e4;
 Tue, 05 May 2020 14:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588687905;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mt9W80B1cr2KdxQEtpC2LWjZtPVcOMOx1aAqW1ajV0k=;
 b=aRSI8zOL/BJF5nTNL20mk32SA762ksj+sMRWA6cA8VE7zQeT2IPK40HZ
 xPG/DfMCJi4lD/6qxH6DYG0OHI5Z+4b+AKY68OvgnDvREEpZb1/bEFIYM
 zoM1awkDCqds42PYQK58zmhAFlozEFRpYmGCQx2on89YzDv3mWHbcBbjJ A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: w+cUjwm19U3XJkb1qVAJ5lIOTxogNuQ5K+AfTTU8v3T/wnkZkVRA+AcSZzGDlAZeDA63LFRW0S
 ygZ/v9Oz/lvpZX1FLDgwnkUCNm6C2sr6Hz7M6LN7CrrHz2IoBjqmhcaFdQNIO/buTLXmLBNYOK
 XfhIi/o2rCOAmHVGKeYsQY+GRqTEq5xh5eHfBJaAClSZDpTXi+BxnoHxk/I5+5ln9FRzJTDnJC
 HWcq2SFv+/zX7S93801l2vQF/9DBe++c+kAhgEQMfS2MzRT/3dN7wNJJl6xosge+TUto69ePK5
 2e8=
X-SBRS: 2.7
X-MesageID: 17164708
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,355,1583211600"; d="scan'208";a="17164708"
Date: Tue, 5 May 2020 16:11:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/3] x86/mm: do not attempt to convert _PAGE_GNTTAB to a
 boolean
Message-ID: <20200505141138.GC1353@Air-de-Roger>
References: <20200505092454.9161-1-roger.pau@citrix.com>
 <20200505092454.9161-2-roger.pau@citrix.com>
 <20332b18-960c-a180-8150-55fae60bdc6e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20332b18-960c-a180-8150-55fae60bdc6e@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 05, 2020 at 03:47:43PM +0200, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> On 05.05.2020 11:24, Roger Pau Monne wrote:
> > Clang 10 complains with:
> > 
> > mm.c:1239:10: error: converting the result of '<<' to a boolean always evaluates to true
> >       [-Werror,-Wtautological-constant-compare]
> >     if ( _PAGE_GNTTAB && (l1e_get_flags(l1e) & _PAGE_GNTTAB) &&
> >          ^
> > xen/include/asm/x86_64/page.h:161:25: note: expanded from macro '_PAGE_GNTTAB'
> > #define _PAGE_GNTTAB (1U<<22)
> >                         ^
> 
> This is a rather odd warning. Do they also warn for "if ( 0 )"
> or "do { } while ( 0 )", as we use in various places? There's
> no difference to me between a plain number and a constant
> composed via an expression.

Using plain 0 is fine, they just seem to dislike using << for some
reason that escapes me. Seems like it might be useful to catch bugs
where || is wrongly used instead of | when setting flags, ie:

https://github.com/haproxy/haproxy/issues/588

> 
> > Remove the conversion of _PAGE_GNTTAB to a boolean, since the and
> > operation performed afterwards will already return false if the value
> > of the macro is 0.
> 
> I'm sorry, but no. The expression was put there on purpose by
> 0932210ac095 ("x86: Address "Bitwise-and with zero
> CONSTANT_EXPRESSION_RESULT" Coverity issues"), and the
> description there is clearly telling us that this wants to stay
> unless Coverity changed in the meantime. Otherwise I'm afraid
> a more elaborate solution will be needed to please both.

Clang is fine with changing this to _PAGE_GNTTAB != 0. Would you be
OK with this approach?

> Or a
> more simplistic one, like using "#if _PAGE_GNTTAB" around the
> construct.

Yes, that's the other solution I had in mind.

Thanks, Roger.

