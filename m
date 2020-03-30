Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B0197E35
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 16:17:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIvB1-00051q-Vc; Mon, 30 Mar 2020 14:14:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IY4r=5P=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jIvB1-00051l-2I
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 14:14:07 +0000
X-Inumbo-ID: b6ad8900-7290-11ea-b58d-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6ad8900-7290-11ea-b58d-bc764e2007e4;
 Mon, 30 Mar 2020 14:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585577647;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=HhEus4mHMc6GLiGsfxkILuLxKuV6A8Ag3UsP/8ykGe0=;
 b=dUWSps5QHKXF6XUixcaSNvf3uQGq7MvDiVyR0wLiPQZiMEGqXVOqm1IC
 15UgGp3v25jCr6pFxpDPOy727WIT0ipEHnLGkhQKuqJU3zx+S8sIVTS7Y
 GJM31YV6gQSbAcRXOed48k1QptyxtSYMHlzlPsvfa9mPvAjqvsKo9HTDV o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hLdh5UVCbqlf2Bw4CXddV/3vEhAazDJ8Kw5knIMBlWaZib63PrLC646HbWL/wp23J0TeaJ/wRY
 OwxLLeqzsoD2qTfQFRdNkyu+yiVikS5sKsL6J225XkDKvIkexiEc0cYbm2dFv+vdHMaNDsTZNX
 kXebTObruA12PISkRsByL7E+ZLjHk0UnjPyq5dQ6fpAkxAfinjEDqvlabsxXcdizplZwedklgM
 pu2cw0l2BlMp+nIy4xeFjH8HgyaDzSIHCmfyDqBTb8Tpe+n7vMAgFZK7pIFrgRYISaQJaskiqw
 3aI=
X-SBRS: 2.7
X-MesageID: 14849065
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,324,1580792400"; d="scan'208";a="14849065"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24193.65186.623770.59312@mariner.uk.xensource.com>
Date: Mon, 30 Mar 2020 15:13:54 +0100
To: Julien Grall <julien@xen.org>
In-Reply-To: <0d28fc28-390d-f251-5c3d-e8f4d1e7950d@xen.org>
References: <20200330135735.31512-1-ian.jackson@eu.citrix.com>
 <20200330135735.31512-2-ian.jackson@eu.citrix.com>
 <0d28fc28-390d-f251-5c3d-e8f4d1e7950d@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/3] docs etc.: https: Fix references to
 wiki.xen[project.org
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Yang Hongyang <imhy.yang@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("Re: [PATCH 1/3] docs etc.: https: Fix references to wiki.xen[project.org"):
> Hi Ian,
> 
> Title: Did you intend to use {,project} rather than [project?

I intended to use [project].  Will fix.

Ian.

