Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF243199540
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 13:21:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJEu8-0006kA-6c; Tue, 31 Mar 2020 11:18:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eCcS=5Q=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jJEu6-0006k4-7y
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 11:17:58 +0000
X-Inumbo-ID: 45e83574-7341-11ea-83d8-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45e83574-7341-11ea-83d8-bc764e2007e4;
 Tue, 31 Mar 2020 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585653478;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=LDYFvMW7OWmjn4KhqyByVwCZQsY6tBODJ8lVCKRq31s=;
 b=TmxirStyPhxSy/BIYihkD8AwjYzafXQiDdDcCeuCFkH58v2mMFQ2kqLm
 rkJyHQEMOwQMs0cTx6jBoGAr4RNZEnjLQv8t/WJSDRYXw6UV0W4TgFS9C
 Zi4psj8LS/+uer4gF/I+cJYXVat7QJylmBg3x9HpJoOjDZm7beAZX96e+ A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 12Nf3kBLyFSN81od+sOi+N/4226yO86rD9RYADvPCXr91ajDueicon0aPsltuzHD3CatEDxWz/
 J8iwnhs+q9TBEMRjiw7zHmz8tqop72xUs4r54iIYsrbQRwLoqS4Ye+CKngnzvPoXFPUrbO1s53
 eMuU6og/AYVykUMTgTxzs/JE34jEKDQK+zX7A1rGtivqybIK6+TUno5Hj05q2bWCulDy/lGUxG
 lOYX4UvXIpLFrAjIn40FJ5AeNz0v6vkGMftoozgNufrkidIH9eIjY+76dkA3HRAr2eVRaVYl+o
 Mes=
X-SBRS: 2.7
X-MesageID: 14905977
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,327,1580792400"; d="scan'208";a="14905977"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24195.9951.944818.756019@mariner.uk.xensource.com>
Date: Tue, 31 Mar 2020 12:17:51 +0100
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 0/8] Fix build with using OCaml 4.06.1 and -safe-string
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>, Christian
 Lindig <christian.lindig@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 David Scott <dave@recoil.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Julien Grall writes ("[PATCH 0/8] Fix build with using OCaml 4.06.1 and -safe-string"):
> This series is meant to solve the build issue reported by Dario when
> using recent version of OCaml and -safe-string.

Thanks.  I have reviewed the C tools parts here.  I think the ocaml
parts ought to have a review from someone familiar with the ocaml FFI.

> I took the opportunity to harden a bit more the code by using const more
> often.

I approve.

Perhaps we should start building our C code with -Wwrite-strings,
which makes "" have type const char* ?  Result would be a giant
constification patch, probably.

Ian.

