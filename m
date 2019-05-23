Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2878279B4
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 11:51:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTkLG-0000hy-7Z; Thu, 23 May 2019 09:48:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wok1=TX=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hTkLE-0000ht-Fx
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 09:48:52 +0000
X-Inumbo-ID: f79c0e37-7d3f-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f79c0e37-7d3f-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 09:48:50 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: PVYyFzKMMePtoNVUg/h/Da58TNd0F6Vqa9KP0V/kO4j0ZmDzg5p0650D0RaWIuAcg/VXK2MWAc
 abbAKTL4Sxk4E0P6I4hZppaQmsLdwnldzyCaQgJkYo/+4eile884SAfIHvlbaWU7iSsvbcm3b+
 i38ZyUkX5rwruByWhtsC7juee+hGF0CwYIF5VwFkL2XXyTMrTUZ4qGxvhPq63+ifJJqeGX9FxQ
 kekxBLD5aU13+9lNOcADUgQWAMQ5c4BDkAO0vkYogeOFRsCcrTrfruqoQSByjCvcKSOMdbMWhr
 ycI=
X-SBRS: 2.7
X-MesageID: 818881
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,502,1549947600"; 
   d="scan'208";a="818881"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23782.27740.739024.532029@mariner.uk.xensource.com>
Date: Thu, 23 May 2019 10:48:12 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Newsgroups: chiark.mail.xen.devel
In-Reply-To: <20190220170001.32614-2-roger.pau@citrix.com>
References: <20190220170001.32614-1-roger.pau@citrix.com>
 <20190220170001.32614-2-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/6] osstest: introduce a helper to stash a
 whole directory
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Um9nZXIgUGF1IE1vbm5lIHdyaXRlcyAoIltYZW4tZGV2ZWxdIFtQQVRDSCAxLzZdIG9zc3Rlc3Q6
IGludHJvZHVjZSBhIGhlbHBlciB0byBzdGFzaCBhIHdob2xlIGRpcmVjdG9yeSIpOgo+IFdpdGhv
dXQgY29tcHJlc3NpbmcgaXQuCgpZb3UndmUgb3Blbi1jb2RlZCBhIHJlY3Vyc2l2ZSBkaXJlY3Rv
cnkgY29weS4gIElzIHJzeW5jIGF2YWlsYWJsZSBvbgokaG8gYXQgdGhpcyBwb2ludCA/ICBJIHRo
aW5rIG1heWJlIGl0IGNvdWxkIGJlIC4uLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
