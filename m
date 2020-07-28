Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDEC230623
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 11:08:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0LZg-0000f8-2I; Tue, 28 Jul 2020 09:07:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZWt7=BH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0LZe-0000f3-Ea
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 09:07:02 +0000
X-Inumbo-ID: b25e04ae-d0b1-11ea-8b1c-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b25e04ae-d0b1-11ea-8b1c-bc764e2007e4;
 Tue, 28 Jul 2020 09:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595927221;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PBb4O1ZjcnYgIxh0EQAN7soMcQ53JITdPUUJn86Y/z4=;
 b=Tb/YRNURN0atgUV8ELQ0XNP6lHTZb9B0UcdoxGOdBJ/vME8N2RmQEj7T
 zK6NtJrOEoU8jE7aSFunpHGGkWH6eE/cgTZNHH3oblCSGqXuSboS49p+g
 FdxnZqQ6wznpufjJuHuFFgNgmO3b5niALvAj5XCPDZWSKc4GZdMLOweVq g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: uTmgI8PxOzjXzTKFv/wuH25kCpkMuPEwq+7BWgPZv2kPlz8v6EpZPXhdFEz2dNXOmtaPEzonHB
 DCqEQ+nr//gDEkJQQkWdv5HeExG4xCv+cPStmbGxdX6oY7kLO/wx94zJtSzt1e18eM0iTb/+CJ
 CCVBwOV1uUQL77JM6ap2ZVHm4vhtZX8xhWPV8WtaKVYcRVeykIdBOWJLRbMRs3meBxi4EygrUB
 wetHtNoxdoHKPRp0MLQDcOMEp5Gr2o2wXG3wvww6WsdwtU5AnVQP3uzqFsoVXyjW2CLC34QUYs
 jQ4=
X-SBRS: 2.7
X-MesageID: 23658075
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,405,1589256000"; d="scan'208";a="23658075"
Date: Tue, 28 Jul 2020 11:06:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
Message-ID: <20200728090618.GZ7191@Air-de-Roger>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
 <20200727145526.GR7191@Air-de-Roger>
 <b29e4b17-8ec2-a0db-8426-94393e9eb2c0@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b29e4b17-8ec2-a0db-8426-94393e9eb2c0@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 27, 2020 at 09:47:52PM +0200, Jan Beulich wrote:
> On 27.07.2020 16:55, Roger Pau Monné wrote:
> > On Wed, Jul 15, 2020 at 12:48:14PM +0200, Jan Beulich wrote:
> > > --- /dev/null
> > > +++ b/xen/include/asm-x86/asm-defns.h
> > 
> > Maybe this could be asm-insn.h or a different name? I find it
> > confusing to have asm-defns.h and an asm_defs.h.
> 
> While indeed I anticipated a reply to this effect, I don't consider
> asm-insn.h or asm-macros.h suitable: We don't want to limit this
> header to a more narrow purpose than "all sorts of definition", I
> don't think. Hence I chose that name despite its similarity to the
> C header's one.

I think it's confusing, but I also think the whole magic we do with
asm includes is already confusing (me), so if you and Andrew agree
this is the best name I'm certainly fine with it. FWIW:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Please quote the clac/stac instructions in order to match the other
usages of ALTERNATIVE.

Thanks, Roger.

