Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E691940F3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2020 15:06:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHT6C-0006zW-VR; Thu, 26 Mar 2020 14:03:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4pkz=5L=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jHT6A-0006zQ-Rp
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:03:06 +0000
X-Inumbo-ID: 83b8bb6a-6f6a-11ea-92cf-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83b8bb6a-6f6a-11ea-92cf-bc764e2007e4;
 Thu, 26 Mar 2020 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585231385;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0rhzoRGTrhbOBqUcZ+QKqHrnMSqc5SoAmZDkBO/WRgg=;
 b=AbTsH4b9v1ztVrE5d2uvPQ1WyY1aQ4KOW+ZTGzywt97eHCeEXAoTzMVJ
 3IYQuKbLfZYMYjcJX8CTv8z+XbNMLnd6qByplb/a+7gycGvsV6scMXAm5
 D+K7u9m6UPAnhOnCE++f3PyZNPmLDnuciYf3LlQ0ezMYePpmzg0mZLaFx I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /MEh0epryCm1JVIzddZHv5qRF9nmlFZ5Y0ZmfHlAunGD1bjZ4Z6sea0BE194HfVF+jAifNr/Ux
 MN3ztIOugHGagLi3pDXnt3IRYVZ7PcySumg3IRNlR8mW7lnEDeCdOgdcpT65GRH5os8llfx8rk
 WaFkj1/plqz80vv9QLj99GP14FyIHk8RJmZAdRHc6T1JF9vkm2VR1ilLNf7mWR6UhFDwaZIpqX
 Alt9a1RUtoO4V7S4zfvkj+F2BJpcIufZLqguBgvBdYhyi8oELIwfB+ljO9wSQBtFbh15wnAH98
 M58=
X-SBRS: 2.7
X-MesageID: 15094521
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,308,1580792400"; d="scan'208";a="15094521"
To: Anthony PERARD <anthony.perard@citrix.com>,
 <xen-devel@lists.xenproject.org>
References: <20200326135621.687685-1-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d925ee1c-10ff-6099-bde3-c571075cf579@citrix.com>
Date: Thu, 26 Mar 2020 14:02:43 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200326135621.687685-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [XEN PATCH] build: detect compiler upgrade to rerun
 kconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26/03/2020 13:56, Anthony PERARD wrote:
> This simple comment allows to detect when $(CC) changes version.
> Kconfig will be rerun in this case. (Rerun is forced by
> include/config.auto.cmd which detects changes of CC_VERSION_TEXT
> value).
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

I'd suggest s/upgrade/change/ in the subject.  When developing with two
different compilers, one half of the transitions will be a downgrade.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

