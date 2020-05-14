Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6051D3678
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:28:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGiR-0005Mf-J3; Thu, 14 May 2020 16:28:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGiQ-0005Ma-8S
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:28:10 +0000
X-Inumbo-ID: e594690e-95ff-11ea-a4b1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e594690e-95ff-11ea-a4b1-12813bfff9fa;
 Thu, 14 May 2020 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589473689;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=pOok6b23FY270oMqz6LZdIAUiaV37a5LjYdYuXO6wKM=;
 b=fnAS2omlg9YkemPrvvshl2wMG8OBoKO8w0II2MbpGIUjXkO5rD87nElx
 RvQyxovZsex6Md2bmawHiIAtf43f90b/ioFHVZClxFXPg0cpt0bZqctnR
 Eao7yfklzY7fJLhaeftboxssi40MClEmKEgQA+1/OhPsSU7s+sbgm0INh 4=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: DKj042E5dnZrFhVSFrubRPzWB64nxT4IhLzYy5G3jJSzis0I01N0KFwVmOyxRbH29ylav1vLC5
 eSFy6yluU9BYkpxUThaVav5ABv4cYe+1qDF/Pm3rzmcHCkx1KjatbKbiFHwWfz3m/7zlfaw8p1
 5h9qRzhRUjUV3+3bM2rVSh0I3V/Vi67ESY0Vpr8GOpbzzcg99wEHiZ40MbL4NvikGn6K6NM8ae
 f1UWXnm81ygiUHPVaEQiK5G1e6n/KGmzgy6h3fXjPyjNx3/FXgPiTuHRLNWJU59jtcYp9RilFk
 91E=
X-SBRS: 2.7
X-MesageID: 17909104
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17909104"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-ID: <24253.29066.32494.314618@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:27:54 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 08/21] tools/libvchan: notify server when client is
 connected
In-Reply-To: <20200428040433.23504-9-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-9-jandryuk@gmail.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 08/21] tools/libvchan: notify server when client is connected"):
> From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> 
> Let the server know when the client is connected. Otherwise server will
> notice only when client send some data.
> This change does not break existing clients, as libvchan user should
> handle spurious notifications anyway (for example acknowledge of remote
> side reading the data).
> 
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Replace spaces with tabs to match the file's whitespace.
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> Marek: I had this patch in Qubes for a long time and totally forgot it
> wasn't upstream thing...

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

CCing Daniel De Graaf in case he feels like having an opinion....

Thanks,
Ian.

