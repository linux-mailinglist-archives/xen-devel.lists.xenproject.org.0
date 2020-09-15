Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC04126A47A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 13:57:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI9ZN-0000HH-58; Tue, 15 Sep 2020 11:56:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SF/R=CY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kI9ZL-0000HC-IQ
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 11:56:19 +0000
X-Inumbo-ID: e5991fdb-b035-4948-aa25-15be40180e51
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e5991fdb-b035-4948-aa25-15be40180e51;
 Tue, 15 Sep 2020 11:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600170977;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MQHm4ReQThgSRiYkfoKeh15JRSe8w1STtkjQ620Kgz8=;
 b=dIUhUwjWzZzall+OyCDES19MdGJvhNAKGBHx1GbmSzEBEarMyzbPjsDH
 /jGj/auD3VUizKJeoc2zu6i9NuNrneVkXw7seLX3INRgilOjHBCq9TQSL
 Gt1cJKyYMrsVKuGCgDmFCNWcV6HtyjpBBF5iSdf8rgrypu7NBANpk1Yso g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: p3spvpsFai60Znai4TnShpJhKFdeq15U7iEwyeRON8s6WHVuZMFBex/l1WE4wpP+HdIUob30Sx
 Q6DU0ffG6woEgTuD0F4isMrzE3V/Z8S8yr7hr+ihCG2wF4HC0rHicZANgVoHvaXPnxJ3IykDYE
 pvw2mmuhJwO7HybcFRKvdBtQFCHbdOjhx62SG+99P7VmOAbSy0BVaLg+wgtZywxlZAmFYSA111
 O6xWoOSYHUqbYv2e/lFApYvP3VluYEJZrvXaX0JMzhgbmdJSk8bc1u+dHkEQMZr79kYRkZCl0l
 VLM=
X-SBRS: 2.7
X-MesageID: 27691002
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,429,1592884800"; d="scan'208";a="27691002"
Date: Tue, 15 Sep 2020 13:56:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, George Dunlap
 <George.Dunlap@eu.citrix.com>
Subject: Re: [PATCH 1/9] build: use if_changed more consistently (and
 correctly) for prelink*.o
Message-ID: <20200915115603.GL753@Air-de-Roger>
References: <aabca463-21ed-3755-0e8d-908069f40d6e@suse.com>
 <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <75d94bf1-b419-8a82-2d15-fb02e56109d8@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Sep 14, 2020 at 12:15:39PM +0200, Jan Beulich wrote:
> Switch to $(call if_changed,ld) where possible; presumably not doing so
> in e321576f4047 ("xen/build: start using if_changed") right away was an
> oversight, as it did for Arm in (just) one case. It failed to add
> prelink.o to $(targets), though, causing - judging from the observed
> behavior on x86 - undue rebuilds of the final binary (because of
> prelink.o getting rebuild for $(cmd_prelink.o) being empty, in turn
> because of .prelink.o.cmd not getting read) during "make install-xen".

I'm not sure I follow why prelink.o needs to be added to targets, does
this offer some kind of protection against rebuilds when doing make
install?

The switch to if_changed LGTM.

Thanks, Roger.

