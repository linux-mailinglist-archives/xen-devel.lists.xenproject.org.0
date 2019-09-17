Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C21B5473
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 19:44:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAHUW-0002df-IC; Tue, 17 Sep 2019 17:42:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAHUV-0002dU-EL
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 17:42:15 +0000
X-Inumbo-ID: 7b945bee-d972-11e9-961c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7b945bee-d972-11e9-961c-12813bfff9fa;
 Tue, 17 Sep 2019 17:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568742133;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=8w07rX+7j6ay8+HfsrdBabdSwElDQn+h+bs+/pErlww=;
 b=Aa13PON0mes1eyYN5R6aVEGvzK81c0C7lxS0APbDoG9cH4YcFxLP/ibE
 /DaYg5oCso07VJrKq9gTF+TAQnX7QPG3Hg3QkIm22naj7dzGMfRIIN+VT
 rXbLMxn71AKrPIseQtn5Wan6Ev62ETvDKeQ+5TWN/CGTfuNTme5hAQArU w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XhNVd6vzUsMnWAgzSKlFUaSJenpt1PIhoH89CjPGPtZcooJ1A4uLEhUkTeKjDLWtLG9ezSqiz5
 R3V9Il506wiWSIjH9WSe9ZKCmmvO6znV8vsPCRutxjJ3TXiN0kGw5JMakMoij31EQ1eZRPDqTg
 mggChUjWBGoD7cYPnNDzocJuWumYLXa8d5gmoJCkf92ZtTaHT06+8PYZaztOCMPXV4maIqww0e
 AubXzK0WXi57s2aDcfV9lLa2LQupSaHHIFvgttyf2AmuYv4WVUMGd8cL/UcvCgNwmilNT1vuFf
 HO0=
X-SBRS: 2.7
X-MesageID: 5939173
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5939173"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.6898.699406.584772@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 18:42:10 +0100
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20190802153606.32061-34-anthony.perard@citrix.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-34-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 33/35] libxl: Extract qmp_parse_query_cpus
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1BBVENIIDMzLzM1XSBsaWJ4bDogRXh0cmFjdCBxbXBf
cGFyc2VfcXVlcnlfY3B1cyIpOgo+IFRoZSBRTVAgY29tbWFuZCAicXVlcnktY3B1cyIgaXMgY2Fs
bGVkIGZyb20gZGlmZmVyZW50IHBsYWNlcywgZXh0cmFjdAo+IHRoZSBhbGdvcml0aG0gdGhhdCBw
YXJzZSB0aGUgYW5zd2VyIGludG8gYSBzZXBhcmF0ZSBmdW5jdGlvbi4KCkkgaG9wZSB5b3UgbWVh
bnQgdG8gd3JpdGUgIk5vIGZ1bmN0aW9uYWwgY2hhbmdlLiIKCklmIHNvLCB0aGVuIHdpdGggdGhh
dCBhZGRlZCB0byB0aGUgY29tbWl0IG1lc3NhZ2U6CgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
