Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB7B19F3AE
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 12:40:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPB7-00077m-7v; Mon, 06 Apr 2020 10:40:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=67tO=5W=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jLPB6-00077f-3S
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 10:40:28 +0000
X-Inumbo-ID: 06fefd64-77f3-11ea-bfdd-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06fefd64-77f3-11ea-bfdd-12813bfff9fa;
 Mon, 06 Apr 2020 10:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586169627;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=tSOjzafDR2Zh/2lViSYHkC7V4IQH+KhVu82itd5Otig=;
 b=HF/oMN2QHt6nhcWUBIhw26/GnHzsF3kSsTZD3P9Bkwt+hoOEd1OcOofB
 J52kvOPkqXvjX4MMUhO4HyeqVRcOqAhlbQQXGTrZwk7EW7WFHVGjFTX3O
 TzgzlQ4S2bH16chVK6fssho4A0ch9nTHXm9WbhVavwY5sQ1Vh5RO3aquz g=;
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
IronPort-SDR: qppJu21dNTtVjJxmXVRKFSiAibCrzziKxUDHe19vu6WE+A23f+tHmTGnwl3rIeqSf6gOvIJ4ZS
 oz4f17R5/2OqP9eOVO6NC2GXBN7DPc5RdRuDZ96ySqE7L6esNrRJP+QBs8oH8ULGbnPlMHWKpp
 cPClGtMzrj4isqZdsVsuzFMNmMZqsoHjyQPCD2WUna5mgXCRQWz7J7jC8LMLUGaDQv1iSsPoQ2
 VAD0Bf8bV3T+hh9azW1qOKxk8w/Ay+PkCRc3L5U1p6y81SOwYB72x/q7Lf7iOt3K6DCJWX2ka1
 jgE=
X-SBRS: 2.7
X-MesageID: 15236009
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15236009"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24203.1813.529481.963091@mariner.uk.xensource.com>
Date: Mon, 6 Apr 2020 11:40:21 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH OSSTEST] linux: enable x2APIC kernel support
In-Reply-To: <20200406081636.78027-1-roger.pau@citrix.com>
References: <20200406081636.78027-1-roger.pau@citrix.com>
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

Roger Pau Monne writes ("[PATCH OSSTEST] linux: enable x2APIC kernel support"):
> Without it Linux is not able to parse the x2APIC ACPI MADT entries
> crafted by Xen when booted in PVH mode, following log is from one of
> the dom0pvh jobs:

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

And pushed to pretest.

Thanks,
Ian.

