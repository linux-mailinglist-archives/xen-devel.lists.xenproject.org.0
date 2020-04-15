Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D84E1AA2C2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:06:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOhk9-0001Jx-8S; Wed, 15 Apr 2020 13:06:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RJH9=57=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jOhk8-0001Jp-1K
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:06:16 +0000
X-Inumbo-ID: e30cc6a6-7f19-11ea-b58d-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e30cc6a6-7f19-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 13:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586955975;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=c5C3O4DQWQWnKvdfxBn1JnwkNHvHOdD5NuUuLCzLZbk=;
 b=bP2XhgbH2NcAU4cD8Y/gy58VLRxvsqxqgxz/Ulzju1+eSjUYCKIRElIM
 zWtvxd7yWdQeGtq/OSAaZ/pnRTxqu0HzBTgiOBYNrwNXFTKoJK+BK5z0G
 ivLi0uD8apPJobBDUlpT/wq6NXNejEjnsPfhJclYp2XjSeLnB0qOVFtJs g=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Doz4JmH4vMNYy482yESTydNSqcnBhFu/kBIqRiW/DTUitZal3NcDtySbiR2w3ttvskjaR8Gauc
 MmLwuwvL4mpI6s4RQ/QLwsUsXZvkLeOFXfWXD0KrxqKDexEWtLZnJfrIhRXwLYfaRih6LYVgVZ
 hS1iJPKSrN3SwQn237KLnD7M8uWBPKi67EzMr1gPmIbE2BCNlr1iPwiTZKTKv2kuCOIGW+8n2a
 C6zZxrKUBmMzmXqCJ1O3DzsTnpm5vWSZZ8JCiKpYCIpBQxcq1vy8XReuN13m0v6hXV/g9S0wmD
 VD8=
X-SBRS: 2.7
X-MesageID: 16031417
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="16031417"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24215.1729.892903.300149@mariner.uk.xensource.com>
Date: Wed, 15 Apr 2020 14:06:09 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH OSSTEST 2/2] make-flight: add a core scheduling job
In-Reply-To: <20200415085246.7945-2-roger.pau@citrix.com>
References: <20200415085246.7945-1-roger.pau@citrix.com>
 <20200415085246.7945-2-roger.pau@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("[PATCH OSSTEST 2/2] make-flight: add a core scheduling job"):
> Run a simple core scheduling tests on a host that has SMT support.
> This is only enabled for Xen >= 4.13.
...
> +  # Core-scheduling tests are x86 only
> +  if [ x$test_coresched = xy -a $xenarch = amd64 ]; then
> +    job_create_test test-$xenarch$kern-coresched-$dom0arch-xl \
> +                    test-debian xl $xenarch $dom0arch $debian_runvars \
> +                    all_hostflags=$most_hostflags,smt \
> +                    xen_boot_append='sched-gran=core'
> +
> +  fi

This seems fine as far as it goes, but all it does is check that
things still work if sched-gran=core is passed.  I'm not sure whether
anything more sophisticated is needed, and in any case this is a step
in the right direction, so:

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

(subject to my comment on 1/ about the flag name.)

Ian.

