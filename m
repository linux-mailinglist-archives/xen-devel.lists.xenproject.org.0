Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD071D36E2
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 18:46:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZGza-00085M-EP; Thu, 14 May 2020 16:45:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NlH/=64=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jZGzY-000852-ML
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 16:45:52 +0000
X-Inumbo-ID: 5ef48f16-9602-11ea-b07b-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ef48f16-9602-11ea-b07b-bc764e2007e4;
 Thu, 14 May 2020 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589474752;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=g30fltV70jAfpv2TCl8PWDqrZ24Z2bUhc7hgAkgNdiM=;
 b=c3chgtyja0/D+KGIKR0tEx99m7WOLbnTuOCd892OlBhSITEWsTnjX6S4
 OlGJ/BTR9inKorkQHu6X8PkapL7Ra/MZoOI7vc7TFCo9bw8K5EKee1/2R
 KPn8eGFrkZi3i1GkZ1YO3Vxatq/4b3aqo55erzV8E27KYacWLwldWQkuY 0=;
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
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: n8/8p2G5Dryi0gZb58ogBsI4R6vTaGdIlD50BDtSaWKwE3p5tOg7yCFnye+O0MrEjLjyaJIxYQ
 UzmJ4f38XZtjv+BpdcXXNuK+pl2KoUE3zzZIKGLCaJhBCjulPx/FTPFL+Un2PRhQ2vjk4Pkt2s
 Eps/sQrMCF9+rPV7vWEEStixpcr1OyoBsN8vvN53FfePyx1cDjWGwpmeGs43MGbIALVL0QN1R4
 2j/WpYn2Olx6Y+lHApNlp7/KegUldD3wfMvKoTV5DzVpXyK7AYx/Q0d5nCjW1rEGE2N00bucoT
 ARI=
X-SBRS: 2.7
X-MesageID: 17543549
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="17543549"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24253.30138.601001.944534@mariner.uk.xensource.com>
Date: Thu, 14 May 2020 17:45:46 +0100
To: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [PATCH v5 19/21] libxl: Refactor kill_device_model to
 libxl__kill_xs_path
In-Reply-To: <20200428040433.23504-20-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
 <20200428040433.23504-20-jandryuk@gmail.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Jason Andryuk writes ("[PATCH v5 19/21] libxl: Refactor kill_device_model to libxl__kill_xs_path"):
> Move kill_device_model to libxl__kill_xs_path so we have a helper to
> kill a process from a pid stored in xenstore.  We'll be using it to kill
> vchan-qmp-proxy.
> 
> libxl__kill_xs_path takes a "what" string for use in printing error
> messages.  kill_device_model is retained in libxl_dm.c to provide the
> string.

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

