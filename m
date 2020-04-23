Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502171B5E8A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 17:02:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRdMf-0001qF-5S; Thu, 23 Apr 2020 15:02:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGxR=6H=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jRdMd-0001qA-T7
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 15:02:07 +0000
X-Inumbo-ID: 6581c2bd-8573-11ea-9393-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6581c2bd-8573-11ea-9393-12813bfff9fa;
 Thu, 23 Apr 2020 15:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587654127;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+FJYamY5N8lDCyiPzDv2r4r51C2UiEmlW5dUQBTAE5w=;
 b=MaEsKG9bJYB2N33kVKBeS6geOHoAFEnErILps9KpJ3uLPWEHItAmqwOg
 hGysbQe6zCLfsL56II0R0tw8PCQWr4EXgysL6OcxJkInNhyswLBsKk1Y2
 Mwt6sBFHO95T3PxCOyxDxQQ+hriEdr1B7Xten0/Ftlb4P8Y/SFP7ZiEPR k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: MS5ylVDP91qji9ffDWq+9i7tJ6p3RZa5C/VtyXvb9qjx+UYC4Guiu6WLULcJZEAX1zlYqMZsCq
 WoUbDSAtcZnvIFk1o2K2Uv8qxoMNUB9Z6wNHO7VRQDo83wt+bXENE9/pjT9NLeyoP7tYtQZYwm
 NajVELk7IW9336hAg2PWDpUiVEP+2kKkrBxcgiMrrL+RQvP1HHopDw4xrsv/dEiVOUpIdFmY1F
 W9YQ413J/BTPfHMymeBO82qyXmeHs5hjT/rvGnCREw43SOsRzpHDw8C2SclOQcTS7VSuZKDBL/
 wj0=
X-SBRS: 2.7
X-MesageID: 16154205
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,307,1583211600"; d="scan'208";a="16154205"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24225.44521.720035.672690@mariner.uk.xensource.com>
Date: Thu, 23 Apr 2020 16:02:01 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH OSSTEST] examine/cpu: fix fetching number of threads
In-Reply-To: <20200423144303.55251-1-roger.pau@citrix.com>
References: <20200423144303.55251-1-roger.pau@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Roger Pau Monne writes ("[PATCH OSSTEST] examine/cpu: fix fetching number of threads"):
> The way to fetch the number of threads from the output of xl info is
> wrong, as the result of =~ is either true or false, but will never be a
> numeric value.
> 
> Fix the regex to have a capture group in order to fetch the number of
> threads, and store the capture in the threads variable.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

I will push this to pretest.  Hopefully it will go through quickly...

