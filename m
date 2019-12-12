Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A886411C9D7
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 10:49:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifL35-0001py-2z; Thu, 12 Dec 2019 09:46:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EVwC=2C=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ifL33-0001pt-PW
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 09:46:17 +0000
X-Inumbo-ID: 3d25fe72-1cc4-11ea-8d08-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d25fe72-1cc4-11ea-8d08-12813bfff9fa;
 Thu, 12 Dec 2019 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576143976;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dhXc0hzpDoP0LP4NSBAMjDZwUwr/XdPCcsPghJX+ijI=;
 b=XbEEPEateQdih/2IXwzEFFOM5OJBLjnryNZTgB8xiefW24xzYm3MpfAN
 HcVAGGHbo3eFzUCQk9H3j2D7v3ZY5Ovrye4X1B/pdDxGHcOTHGQ7zftFP
 KMNRUEszOFBotZUmoWAexVRqUya82Y7lo3OnVgTIRwfy+JblA+VGbwGI2 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sZq+6Bqqho6dJH0ffNG0utzQUqfntE8WwDXagBrPi7yOImVchjjDnJ0Mgr+DwacELCKTWXP72Z
 RExnWQaI+o8qRO0fcfw3ThsOPkrf0TGVCURTUd9LOJo06Ljpbb+oRxHc3trlR/Z8ZxNQ+tiWfk
 8a52pDLzYuXGKaSOFzWSsJzrHef8//cG9BMag8gfBED/rWhGdjvsutJi/Rys/nfwWbPvemsJN0
 Ux2SJ1Mf4UxEL6099h7iJzqHX3iK/rm+FBKSpKWdx0hBvN+g91sJdABtoeGoc3Qd0Xo+08M5fW
 7EQ=
X-SBRS: 2.7
X-MesageID: 9705820
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,305,1571716800"; 
   d="scan'208";a="9705820"
Date: Thu, 12 Dec 2019 10:46:00 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: SeongJae Park <sj38.park@gmail.com>
Message-ID: <20191212094600.GA11756@Air-de-Roger>
References: <20191211181016.14366-1-sjpark@amazon.de>
 <20191211181016.14366-2-sjpark@amazon.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211181016.14366-2-sjpark@amazon.de>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v7 1/3] xenbus/backend: Add memory pressure
 handler callback
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
Cc: jgross@suse.com, axboe@kernel.dk, sjpark@amazon.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTEsIDIwMTkgYXQgMDY6MTA6MTRQTSArMDAwMCwgU2VvbmdKYWUgUGFyayB3
cm90ZToKPiBHcmFudGluZyBwYWdlcyBjb25zdW1lcyBiYWNrZW5kIHN5c3RlbSBtZW1vcnkuICBJ
biBzeXN0ZW1zIGNvbmZpZ3VyZWQKPiB3aXRoIGluc3VmZmljaWVudCBzcGFyZSBtZW1vcnkgZm9y
IHRob3NlIHBhZ2VzLCBpdCBjYW4gY2F1c2UgYSBtZW1vcnkKPiBwcmVzc3VyZSBzaXR1YXRpb24u
ICBIb3dldmVyLCBmaW5kaW5nIHRoZSBvcHRpbWFsIGFtb3VudCBvZiB0aGUgc3BhcmUKPiBtZW1v
cnkgaXMgY2hhbGxlbmdpbmcgZm9yIGxhcmdlIHN5c3RlbXMgaGF2aW5nIGR5bmFtaWMgcmVzb3Vy
Y2UKPiB1dGlsaXphdGlvbiBwYXR0ZXJucy4gIEFsc28sIHN1Y2ggYSBzdGF0aWMgY29uZmlndXJh
dGlvbiBtaWdodCBsYWNrCj4gZmxleGliaWxpdHkuCj4gCj4gVG8gbWl0aWdhdGUgc3VjaCBwcm9i
bGVtcywgdGhpcyBjb21taXQgYWRkcyBhIG1lbW9yeSByZWNsYWltIGNhbGxiYWNrIHRvCj4gJ3hl
bmJ1c19kcml2ZXInLiAgSWYgYSBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQsICd4ZW5idXMn
IHJlcXVlc3RzCj4gZXZlcnkgYmFja2VuZCBkcml2ZXIgdG8gdm9sdW5hcmlseSByZWxlYXNlIGl0
cyBtZW1vcnkuCj4gCj4gTm90ZSB0aGF0IGl0IHdvdWxkIGJlIGFibGUgdG8gaW1wcm92ZSB0aGUg
Y2FsbGJhY2sgZmFjaWxpdHkgZm9yIG1vcmUKPiBzb3BoaXN0aWNhdGVkIGhhbmRsaW5ncyBvZiBn
ZW5lcmFsIHByZXNzdXJlcy4gIEZvciBleGFtcGxlLCBpdCB3b3VsZCBiZQo+IHBvc3NpYmxlIHRv
IG1vbml0b3IgdGhlIG1lbW9yeSBjb25zdW1wdGlvbiBvZiBlYWNoIGRldmljZSBhbmQgaXNzdWUg
dGhlCj4gcmVsZWFzZSByZXF1ZXN0cyB0byBvbmx5IGRldmljZXMgd2hpY2ggY2F1c2luZyB0aGUg
cHJlc3N1cmUuICBBbHNvLCB0aGUKPiBjYWxsYmFjayBjb3VsZCBiZSBleHRlbmRlZCB0byBoYW5k
bGUgbm90IG9ubHkgbWVtb3J5LCBidXQgZ2VuZXJhbAo+IHJlc291cmNlcy4gIE5ldmVydGhlbGVz
cywgdGhpcyB2ZXJzaW9uIG9mIHRoZSBpbXBsZW1lbnRhdGlvbiBkZWZlcnMgc3VjaAo+IHNvcGhp
c3RpY2F0ZWQgZ29hbHMgYXMgYSBmdXR1cmUgd29yay4KPiAKPiBSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFNlb25nSmFlIFBhcmsg
PHNqcGFya0BhbWF6b24uZGU+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
