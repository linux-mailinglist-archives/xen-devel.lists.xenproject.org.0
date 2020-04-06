Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C957D19FBD8
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 19:44:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLVmY-0002FT-Nq; Mon, 06 Apr 2020 17:43:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=06X9=5W=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jLVmX-0002FO-KC
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 17:43:33 +0000
X-Inumbo-ID: 220da138-782e-11ea-9e09-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 220da138-782e-11ea-9e09-bc764e2007e4;
 Mon, 06 Apr 2020 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586195012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bphNPG/A+OeRKQoZBapDV/s73PtCWQsb127JQKMzOao=;
 b=F+RmdHBQTFFvzkacoZ3/hXM4lHdqVhQlhLDNjDFEZMtdAclAtlf9pWPz
 I1HvQ6g7p/fg8nuz7E4S0fh9g9db5IuO7lIMVVhOUzIg6LSSlZOhh0xmm
 OBrOQUt7sj9mtfGjJWM/wH8t23ghBmKTth1JO0PTwM8XQjuntye+76OrB w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hlwK8qzoKR3mA9SudDYB7JPSpQopwHfmD0RVWef2oBdIhmk3ijC0+3/s95S//l+6oEL8dsmgt8
 Uawkk1KEd8fi+ZuOC2BZ4QpNt5FC6GCEnEYZVho/chg/F8dlrZg6czj8gXIe8lUROYGsHwZkaq
 j+SraWWkJVFvNOLDyIeXhcspFxknIP0pUJllzFYn+l6GGDxL4WPszJx8A11HSq8WY4tHdX3CRE
 deaNLxX6QujMrG3H3CELbEh71lmlOeoZdd433K4tta+A+L6EstblMI3iZN47kIqjhMffSiFRmf
 4N0=
X-SBRS: 2.7
X-MesageID: 15918507
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,351,1580792400"; d="scan'208";a="15918507"
Date: Mon, 6 Apr 2020 18:43:23 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC] hw/usb/xen-usb.c: Pass struct usbback_req* to
 usbback_packet_complete()
Message-ID: <20200406174323.GV4088@perard.uk.xensource.com>
References: <20200323164318.26567-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200323164318.26567-1-peter.maydell@linaro.org>
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
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 23, 2020 at 04:43:18PM +0000, Peter Maydell wrote:
> The function usbback_packet_complete() currently takes a USBPacket*,
> which must be a pointer to the packet field within a struct
> usbback_req; the function uses container_of() to get the struct
> usbback_req* given the USBPacket*.
> 
> This is unnecessarily confusing (and in particular it confuses the
> Coverity Scan analysis, resulting in the false positive CID 1421919
> where it thinks that we write off the end of the structure). Since
> both callsites already have the pointer to the struct usbback_req,
> just pass that in directly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is an RFC because:
>  * I'm not very familiar with the Xen bits of QEMU
>  * the main rationale here is to change something that's
>    confusing Coverity -- the code as it stands isn't wrong
>  * the only testing I've done is "make check"
> Still, the change seems like a good thing to me as a human reader...
> 
> PS: QEMU's MAINTAINERS file stanza for Xen doesn't pick up
> that this file is Xen related, so it could use an extra F: line.

Looks good,
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

