Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FD71D36EB
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:48:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZH1Z-0008Iz-RU; Thu, 14 May 2020 16:47:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZH1Z-0008It-8V
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:47:57 +0000
X-Inumbo-ID: a85ef8c6-9602-11ea-a4b3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a85ef8c6-9602-11ea-a4b3-12813bfff9fa;
 Thu, 14 May 2020 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474876;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Hwiy3ed45RImGOwT2s2uoZACuwopz6Cd4PBM7vCb5AY=;
 b=I07rGclWTt4XQZA0Z+KUkkUCa6DTtNaEvLq4fw44cLNP+yR8HN3hi9qD
 u/85h5UtAFkNLAhEJoDAY9ZcMP6K+FPS5tLthc8Dv5UOxcTRzTjDwT/3a
 W8nYAkVTvG4x8lWrF56Nkamdi/UvZIz0zjIchorL7hQgcoR+ZF7FJPMBt A=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: tl9wFKBrf1Q34ZijM7/EpjMQBtVfrEgxxiR/AlTRU6QlFRcwWfKRd7HJKSm8eFKMstIGUjDI1o
 q3nPzp5CozavOQeL4JQ/m3yqnQzWQJyLv8DwNTHES5GDCMGw9vPRNEhgLDdiw/hCfi4c5fiZBS
 C9zDb5PyIkxN2urC2Yn92JpleQKoLQTr4aLRVVe0TQ7DEtPy6vXclKbTN4buVef3lL27xyTthR
 vBx/sgN/XADHW4q+UylU8U45MPrO2YmIwDNt7unOhRJRW8FuDJNwAkk2Ad/Y+58Rm3TTPXc3Kd
 NMc=
X-SBRS: 2.7
X-MesageID: 18246029
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="18246029"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.30259.427251.49728@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:47:47 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 20/21] libxl: Kill vchan-socket-proxy when cleaning up
 qmp
In-Reply-To: <20200428040433.23504-21-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-21-jandryuk@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 20/21] libxl: Kill vchan-socket-proxy when cleaning up qmp"):
> We need to kill the vchan-socket-proxy so we don't leak the daemonized
> processes.  libxl__stubdomain_is_linux_running works against the
> guest_domid, but the xenstore path is beneath the stubdomain.  This
> leads to the use of libxl_is_stubdom in addition to
> libxl__stubdomain_is_linux_running so that the stubdomain calls kill for
> the qmp-proxy

In theory maybe this patch should be folded into the one that
introduces the vchan proxy.  But since this whole mode of operation is
new, having a point in the history where it leaks these is OK I
think.

Do others agree ?

For my part,

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

However, if possible maybe this patch could be moved to right after
the one which spawns the proxy ?

Thanks,
Ian.

