Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98C199534
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 13:17:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEr5-0006W7-Dm; Tue, 31 Mar 2020 11:14:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eCcS=5Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jJEr4-0006W2-C4
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 11:14:50 +0000
X-Inumbo-ID: d5c0cdd8-7340-11ea-ba0c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5c0cdd8-7340-11ea-ba0c-12813bfff9fa;
 Tue, 31 Mar 2020 11:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585653289;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=SEeDK1XqRyPBtokUzhENoXfVq9FAVwqj4dlCvlsl7BA=;
 b=f/cZ0fZPWjfNq9yJW3oPjkTQYJS0v3se0cBq5okKL6rLoMJudOB3Mb81
 frsL2bQLXNQuUNW3IbbNslqKepqHbecEusYcAYD5TKQNaDIPO8r4leuaY
 rPMzqkfRdQyi5Kn7y1AhcWoxqRxQ3ikoPmj6SVCQGDKjlJjtqHteeGTdg A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LklccslIeuLNbAGYomCiCodm9RMXrGq+KQNLUIKdpczzsBTA4R5hjagWeErtWWdfcNYixC+nf+
 qw1LVPEqT/fvNJdm45OSf0XMTGwKeEm6dasx6r6VFLjb1hUvnVKLTDrNxnOXcF0sRpyjbvBNPU
 QkKEYf3zsLZfbDU5chbsvXS6WEGq+BMTjnMrnUjpn/XbSp+P4O/cGxslJEp+/uO2NiPATtyVBM
 7OeF1erzy1Gv4fy6OKnr8bqoe3jnVqiUYl1zrtjTW4K53t/vE4zuBRsVowveXe5jyyK0ddRl1a
 Fjc=
X-SBRS: 2.7
X-MesageID: 15141021
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="15141021"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24195.9765.937308.644863@mariner.uk.xensource.com>
Date: Tue, 31 Mar 2020 12:14:45 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 3/8] tools/libxc: misc: Mark const the parameter 'keys' of
 xc_send_debug_keys()
In-Reply-To: <20200330192157.1335-4-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
 <20200330192157.1335-4-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("[PATCH 3/8] tools/libxc: misc: Mark const the parameter 'keys' of xc_send_debug_keys()"):
> From: Julien Grall <jgrall@amazon.com>
> 
> OCaml is using a string to describe the parameter 'keys' of
> xc_send_debug_keys(). Since Ocaml 4.06.01, String_val() will return a
> const char * when using -safe-string. This will result to a build
> failure because xc_send_debug_keys() expects a char *.
> 
> The function should never modify the parameter 'keys' and therefore the
> parameter should be const. Unfortunately, this is not directly possible
> because DECLARE_HYPERCALL_BOUNCE() is expecting a non-const variable.
> 
> A new macro DECLARE_HYPERCALL_BOUNCE_IN() is introduced and will take
> care of const parameter. The first user will be xc_send_debug_keys() but
> this can be used in more place in the future.
> 
> Reported-by: Dario Faggioli <dfaggioli@suse.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

