Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974AB1AA2BE
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:05:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOhid-0001EO-Pi; Wed, 15 Apr 2020 13:04:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RJH9=57=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jOhic-0001EI-Fu
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:04:42 +0000
X-Inumbo-ID: aaf5a9c2-7f19-11ea-b4f4-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aaf5a9c2-7f19-11ea-b4f4-bc764e2007e4;
 Wed, 15 Apr 2020 13:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586955881;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=79d8KqDNuAXqMFomukL7xmb6KtL6IOkDjGNslzZ/fmg=;
 b=PD8yhyJTbGPXdONhTNH9acbXmuItc8Qo5QoQzVReBcikemOYUWlfyhr5
 ulzSIWFWtXuWa5CmG4TEjXrL5VupVGMI5w2EsLlueYM50/3xlvNcLTgSy
 cXQCYO8EWfi0qYU+OztINqXDMFcoei/92qM8swbIzKgZdD2Zv7gs6jgUX k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: saWE+cP21grtGkWqvoUsDsRNa4nZGeVL56CCv14lsWiE/aZQJzzKWXa56GfbyyyT+IhP3Xmwhe
 +o2mInfrTVqYO0Y5/564uoL4i4KDmmbvkk4luYxskBf044WshZ/3cb/BZWlKfYlZBLq7/I8rLb
 6Pq3zWenZFxbH5B9qPTY5/5B3pIu/4Xrno2VaW6gazExKM7cqwnjPeZahrWgBBiFwwN3Ks2ic1
 fUKLhrLfKZF61E7zDfnOXBxjiww+xTbP8v93jnkXHy5o9pHE/YWJyDESVL4HaEJYkWNfvk4hZM
 fe4=
X-SBRS: 2.7
X-MesageID: 16387079
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,386,1580792400"; d="scan'208";a="16387079"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24215.1635.613926.945930@mariner.uk.xensource.com>
Date: Wed, 15 Apr 2020 14:04:35 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH OSSTEST 1/2] exanime: test for SMT and add a host flag
In-Reply-To: <20200415085246.7945-1-roger.pau@citrix.com>
References: <20200415085246.7945-1-roger.pau@citrix.com>
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

Roger Pau Monne writes ("[PATCH OSSTEST 1/2] exanime: test for SMT and add a host flag"):
> Check if hosts have SMT based on the number of threads per core. A
> value of threads per core different than 0 implies SMT support.
...
> +logm("$ho->{Ident} threads per core: $threads");
> +hostflag_putative_record($ho, "smt", !!$threads);

This code LGTM but I wonder if it would be a good idea to start
namespacing these kind of hardware feature flags.  cpu-*, hardware-*,
feature-* maybe ?  Would you care to make a suggestion ?

Ian.

