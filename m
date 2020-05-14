Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F201D3602
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:08:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGPC-0002pn-JR; Thu, 14 May 2020 16:08:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGPA-0002pC-Vc
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:08:17 +0000
X-Inumbo-ID: 1e1f15cf-95fd-11ea-a4b0-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e1f15cf-95fd-11ea-a4b0-12813bfff9fa;
 Thu, 14 May 2020 16:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589472496;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=7Cz4xNGLTLSK2Hzii2YeOv1h69cqCsh47KQcOWUtZ88=;
 b=U/TCTBBh+PdwIRbJdYid9s3V6Bc8ONIoXXeB7smFcAZR2jFoUv8eJ+LK
 5x5jS31HUw4ehRJUlQbvKBMmVXsoVQQh1gJr9u0caZEKWXpdS2sD0idnW
 c+t6xqwQ3Yv6Xg+k1tRpdq3bKsWvqWhz4pL+gc5KJcalK4+EMPFPt9Q9K k=;
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
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: eZ6QYcvK0aZKfzBwZQy12xNHwcTC9TF7YN08SisyNTqzuX0t8fuzYJsJhenc2N/zQY8gmDAY5n
 WTPsoFzRoPmn4M59YBy947Y9N2i7xvTlP6NHm27Ph2BKIq1fqczHL96WcZPjdRASqygYSmhV+d
 TjN33lxc8BMewEkSz4v4ekIiFA7/SR4oSvY05KfjfaLcV+2KC5aFJQADSuoJS9T6E39L+1j/Ig
 58WrMUwVuteH2IsENrosgSh78vlXfufespKpssqP4qBtFvkb8pLXc/wtNBxhoMnOErQ+TAZWX1
 mWg=
X-SBRS: 2.7
X-MesageID: 17814097
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17814097"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.27882.665779.471665@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:08:10 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 01/21] Document ioemu MiniOS stubdomain protocol
In-Reply-To: <20200428040433.23504-2-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-2-jandryuk@gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 01/21] Document ioemu MiniOS stubdomain protocol"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Add documentation based on reverse-engineered toolstack-ioemu stubdomain
> protocol.
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

NB I have not reviewed this for correctness.  I don't think I know the
protocol well enough ...

Ian.

