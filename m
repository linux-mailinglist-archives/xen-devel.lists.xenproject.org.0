Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC951B7123
	for <lists+xen-devel@lfdr.de>; Fri, 24 Apr 2020 11:44:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRusL-0003tg-64; Fri, 24 Apr 2020 09:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G6AF=6I=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRusK-0003tb-HZ
 for xen-devel@lists.xenproject.org; Fri, 24 Apr 2020 09:44:00 +0000
X-Inumbo-ID: 1f70ec56-8610-11ea-83d8-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f70ec56-8610-11ea-83d8-bc764e2007e4;
 Fri, 24 Apr 2020 09:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587721439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VXZGjgryJrae1JtfoT5Q7za4OT21LbeIlL/lR6RuX4E=;
 b=WJ4RVZKMpDeVUjPeSJyCl9DJLe9sSWYDiwf4h1ACU9IXpWu1fx1I7ORF
 hyFoO50ytvl27uw4bcCnTVeiEk0cLuGTSDHsUop3ALMQkG+N/khce13vK
 jz8LqoR+NK8r5nrVaZYWsXuJ139d+vtpFxlUboSRQU4YbJpfgaoZcbIuK A=;
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
IronPort-SDR: aboi8SqV/+Uz1ny+2+ge0Er2dV8Wg5JARXJRRkOaquDZxwW6VBNBbIxTlMtLIPHSm8XHam5CuJ
 0X2Vt7VNdfa9F6jsvIALllQJP/xDUQW/m8+LyNRgdB9BSo8WRlBojuRgqTdb/F1TG0o6pncAgR
 +uqplfdfUvl+0QhnOJxpQuan+YKqgAbQMqCpe8nKoDDg9YVaC9IRnnNb/BVJ5eHx++iwWEvzaE
 pj5oloat/HZ7sspWK+dPYnipI8Wv30YqzQPAARLzQH+BOfh498AoslfEEqjAFfwrRowBDYO4st
 2pk=
X-SBRS: 2.7
X-MesageID: 16591118
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,311,1583211600"; d="scan'208";a="16591118"
Date: Fri, 24 Apr 2020 11:43:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v17 1/2] mem_sharing: fix sharability check during fork
 reset
Message-ID: <20200424094343.GH28601@Air-de-Roger>
References: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Apr 23, 2020 at 08:30:06AM -0700, Tamas K Lengyel wrote:
> When resetting a VM fork we ought to only remove pages that were allocated for
> the fork during it's execution and the contents copied over from the parent.
> This can be determined if the page is sharable as special pages used by the
> fork for other purposes will not pass this test. Unfortunately during the fork
> reset loop we only partially check whether that's the case. A page's type may
> indicate it is sharable (pass p2m_is_sharable) but that's not a sufficient
> check by itself. All checks that are normally performed before a page is
> converted to the sharable type need to be performed to avoid removing pages
> from the p2m that may be used for other purposes. For example, currently the
> reset loop also removes the vcpu info pages from the p2m, potentially putting
> the guest into infinite page-fault loops.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I've been looking however and I'm not able to spot where you copy the
shared_info data, which I think it's also quite critical for the
domain, as it contains the info about event channels (when using L2).
Also for HVM forks the shared info should be mapped at the same gfn as
the parent, or else the child trying to access it will trigger an EPT
fault that won't be able to populate such gfn, because the shared_info
on the parent is already shared between Xen and the parent.

Thanks, Roger.

