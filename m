Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D73D19D948
	for <lists+xen-devel@lfdr.de>; Fri,  3 Apr 2020 16:39:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKNTY-0005cx-3V; Fri, 03 Apr 2020 14:39:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okFK=5T=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jKNTW-0005cs-AE
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 14:39:14 +0000
X-Inumbo-ID: e2a317e8-75b8-11ea-bd27-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2a317e8-75b8-11ea-bd27-12813bfff9fa;
 Fri, 03 Apr 2020 14:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585924754;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=2nvEJHeM+uXlBJ87GOBlwG0eiQdSw+zqUjpprZ9Q7aE=;
 b=d19B4Kilbryt20Wr1TFptUqeUvyPRy9uBqAdyC6oiP0DQSw8V4yniawE
 l2q6w3+vy3+CGljewS6eOswYIGmpZAqWmKgU8n1OToFl9VYkRvmZJepvn
 OAMlsbdA2QxDQLFe1cCniW4twtJu5Z6AM10mwwSdAZwkt/kKFmRxQ/1pg w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2MPmqgVlZ3I3Ef6wR0V47l6Ex1G2VK82QZn/C8Kc7am+zLeN+xHjG7eyYquoo2BIPnl4O1Vu14
 Q/+jgLe4tkwONcxkkQtLVJsPUZkRlBaZOwBRhDrAWsZkNVkEhUX2Ve3kECRqtxdWxdLa/csgbc
 FCXm+YeMwZujLg59sfGTTl1Yas6KKH168hBf4KJfXJ0xpTGWqaKXLPWP1xz634fKPHm+fDThyF
 hCkAIcpKIhGtGgtnNNDp8PlYgYZsvcGV/wU0EaE7tWelMtJfyZofa3gpksj7eD2CHf13z1oTps
 Bwg=
X-SBRS: 2.7
X-MesageID: 15148598
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,340,1580792400"; d="scan'208";a="15148598"
Subject: Re: [PATCH] hvmloader: probe memory below 4G before allocation for
 OVMF
To: Jan Beulich <jbeulich@suse.com>, Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1585844328-30654-1-git-send-email-igor.druzhinin@citrix.com>
 <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0faaee38-e314-24a8-b97d-9f000251a63e@citrix.com>
Date: Fri, 3 Apr 2020 15:39:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <66ee36a9-b525-50d4-17e8-8a10f6afd55f@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org, ian.jackson@eu.citrix.com, wl@xen.org,
 roger.pau@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/04/2020 14:53, Jan Beulich wrote:
> On 02.04.2020 18:18, Igor Druzhinin wrote:
>> The area just below 4G where OVMF image is originally relocated is not
>> necessarily a hole - it might contain pages preallocated by device model
>> or the toolstack. By unconditionally populating on top of this memory
>> the original pages are getting lost while still potentially foreign mapped
>> in Dom0.
> When there are pre-allocated pages - have they been orphaned? If
> so, shouldn't whoever populated them unpopulate rather than
> orphaning them? Or if not - how is the re-use you do safe?

So this is a mess.

OVMF is linked to run at a fixed address suitable for native hardware,
which is in the SPI ROM immediately below the 4G boundary (this is
correct).  We also put the framebuffer there (this is not correct).

This was fine for RomBIOS which is located under the 1M boundary.

It is also fine for a fully-emulated VGA device in Qemu, because the the
framebuffer if moved (re-set up actually) when the virtual BAR is moved,
but with a real GPU (SR-IOV in this case), there is no logic to play games.

The problem is entirely caused by the framebuffer in Xen not being like
any real system.  The framebuffer isn't actually in a BAR, and also
doesn't manifest itself in the way that graphics-stolen-ram normally
does, either.

~Andrew

