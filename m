Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3991B2F8C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Apr 2020 20:50:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQxxm-0004kc-KS; Tue, 21 Apr 2020 18:49:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CVv8=6F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jQxxl-0004kP-Ir
 for xen-devel@lists.xenproject.org; Tue, 21 Apr 2020 18:49:41 +0000
X-Inumbo-ID: db0e9dda-8400-11ea-9189-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db0e9dda-8400-11ea-9189-12813bfff9fa;
 Tue, 21 Apr 2020 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587494981;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=uZLNAWSjOVHW6mvQrnSk6c0Ya0uaKOvcN4JfeXRphEo=;
 b=hVtVK0dHJJsw12jHHoqZtTHdkiAR22IGlWl3VfMpVPp1X862VP1FFF5V
 4/9LwaVmfxJ/e8MHEdcR38ZAgAx8JqxXbieC9G2svqRmH3DYSQ5zlOOiu
 ebJzUxYSZqVMtAMNbpnNbh2xH61k90knelMX7nVC3k3H7bPdQ+oBRyrvH w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: 93rJBk9yjg7Hx9ygMFH3JGj0lYDJT4exs57KgwxvEDf7nX/9hLNrIh8D7EL2ONXvF4LRX9hpNm
 NDOtDQxAQNdZNmTmRaA+tey4t+7xLzUEFczGw9BjHpCYBy8Uqnlm0zF1Cq4RbciVoRMTKQz59X
 tK9JjJ5cAX5LbnZgFHHv5A+e1FQaHX2bmrxLjYP7CgImiolDJR9Sko+iB8C0n1S6tFA0V7P3D2
 EOJkl1y6yNcyGNwuuFobnL3P4N689R5hACbNtaxl/JoSBo4SwZ1yUGuoibujXixhX75q6oYFhn
 Whg=
X-SBRS: 2.7
X-MesageID: 16273838
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,411,1580792400"; d="scan'208";a="16273838"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24223.16427.427446.817623@mariner.uk.xensource.com>
Date: Tue, 21 Apr 2020 19:49:15 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] Introduce a description of the Backport and Fixes tags
In-Reply-To: <20200421182946.27337-1-sstabellini@kernel.org>
References: <20200421182946.27337-1-sstabellini@kernel.org>
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
Cc: "lars.kurth@citrix.com" <lars.kurth@citrix.com>,
 "julien@xen.org" <julien@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Stefano Stabellini writes ("[PATCH] Introduce a description of the Backport and Fixes tags"):
> Create a new document under docs/process to describe our special tags.
> Add a description of the Fixes tag and the new Backport tag. Also
> clarify that lines with tags should not be split.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Acked-by: Wei Liu <wl@xen.org>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

> +When possible, please use the Fixes tag instead (or in addition).

Do we have any code to turn Fixes: into a list of commits to
backport to a particular stable branch ?

If not it might be easier to ask people to add both Backport: and
Fixes:.

Ian.

