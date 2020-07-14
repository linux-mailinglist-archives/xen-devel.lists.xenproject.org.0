Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F1421F5C9
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 17:06:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvMVK-0006tU-Pd; Tue, 14 Jul 2020 15:05:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CaI7=AZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvMVJ-0006tO-Ft
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 15:05:57 +0000
X-Inumbo-ID: 849cfe5e-c5e3-11ea-9322-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 849cfe5e-c5e3-11ea-9322-12813bfff9fa;
 Tue, 14 Jul 2020 15:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594739157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dJQoIV9pNeRqJsoQNrNGEJdhBKWs5EPfNOlMfrHHwhU=;
 b=Ue71bs+jc8KBaPiN8wxwq0RykUCN+r90lOSvKHUDsszZ8SdV6rMnW4+y
 esgwcpIZKcx7HtgsUyl1OnlLqLwYGWgB3UVaXPR4WibAFNqhNWtM7lCEO
 mgsp3ffJqMamKIWlqlIbN1gjw1MphXTqGLqeWz46oqmJ6+QRTAfIii0v/ Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tAalSOLjbJ2ZM3IueLa3z4mYTIqgwuTXydjV8WZD7B+wfd01YjOsXgRDph5qm02QIQDJnerORQ
 qLQvyhq1N6GYkLWV+T2nTQLKeuS6oVMYm5f22iN7CgllsTrHxHlonFM5dXFFxtGea4SOw6iJod
 LhQwWbF+MH7k9Ga0cjgMFKdOCnOysd7p5/IvmsfKR/cnGjVtA38sDcsM+pcvVQuhe0B1+AF3hg
 VqnK8cvNarB/XTSq+vsMV0Pnt3OVLmuzSkX8KjNax8oFnIjDD2xijtl1Hh3jtVBZxWsEwE3Twu
 oSk=
X-SBRS: 2.7
X-MesageID: 22350201
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,350,1589256000"; d="scan'208";a="22350201"
Date: Tue, 14 Jul 2020 17:05:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 00/11] Implement support for external IPT monitoring
Message-ID: <20200714150548.GQ7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <878376484.57739222.1594732315968.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878376484.57739222.1594732315968.JavaMail.zimbra@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: Kevin
 Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei kang <luwei.kang@intel.com>,
 tamas lengyel <tamas.lengyel@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jul 14, 2020 at 03:11:55PM +0200, Michał Leszczyński wrote:
> Kind reminder about this new patch version for external IPT monitoring.

It's on my queue, but with XenSummit I haven't been able to take a
look, will try to do between today and tomorrow.

Roger.

