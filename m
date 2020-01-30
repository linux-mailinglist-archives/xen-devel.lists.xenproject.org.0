Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BDD14DFA0
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 18:08:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixDFS-0003Dk-Dl; Thu, 30 Jan 2020 17:04:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m3I1=3T=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ixDFR-0003Db-2O
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 17:04:57 +0000
X-Inumbo-ID: a3b56058-4382-11ea-b211-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3b56058-4382-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580403896;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=rdLHT7by368B/ctZcJcPATiJEP2ohOWQ0JvsSWHcL/s=;
 b=MLULmAhoMVaALwiNd5prJPr38448dIbOnvWHIITSyajegz6NhNy0sF+Z
 B66rQAv27rEZi+DhtTuJ2hbYnh/6acYaUhPjRoi6oUXVhcpIyNXJL3puE
 ZSGssx3RTGArso//Pm4oSe5DzBlrFv294YACkT6s72qvmyRzk1Y+W4xzz Q=;
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
IronPort-SDR: oGePpE4NGOs8NeXQJgYkzeMdy6AVkuzU9iQ9Fn6+WUB1ChevjbImZ1FvUM5XuOO30Wn2ouZBoD
 c+og2lVZZ+2mmiDgZNFGUqSCjKYu7EWJkHN5TbfEjk+IoK/sjkyJX5icDRwJnNZm8NswD/ePDh
 YmDhd5pPbi+izGTtNDAiMKw+g2EF1g2iJc0EDniGRyD8JQI0DyRLr6vCeO3plh+WnU/U4X2AnI
 LxN0Hoz1tCAWBSxPu/CjNuM/PbcoSJUTFfvjFxngNGyHvUHT/lO0xmHASl+jeba1gA4KMpxcVn
 DBU=
X-SBRS: 2.7
X-MesageID: 11867717
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,382,1574139600"; d="scan'208";a="11867717"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24115.3252.938370.166977@mariner.uk.xensource.com>
Date: Thu, 30 Jan 2020 17:04:52 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200122144446.919-4-pdurrant@amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-4-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v4 3/7] libxl: generalise
 libxl__domain_userdata_lock()
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NCAzLzddIGxpYnhsOiBnZW5lcmFsaXNlIGxp
YnhsX19kb21haW5fdXNlcmRhdGFfbG9jaygpIik6Cj4gVGhpcyBmdW5jdGlvbiBpbXBsZW1lbnRz
IGEgZmlsZS1iYXNlZCBsb2NrIHdpdGggYSBmaWxlIG5hbWUgZ2VuZXJhdGVkCj4gZnJvbSBhIGRv
bWlkLgo+IAo+IFRoaXMgcGF0Y2ggc3BsaXRzIGl0IGludG8gdHdvLCBnZW5lcmFsaXNpbmcgdGhl
IGNvcmUgb2YgdGhlIGxvY2tpbmcgY29kZQo+IGludG8gYSBuZXcgbGlieGxfX2xvY2tfZmlsZSgp
IGZ1bmN0aW9uIHdoaWNoIG9wZXJhdGVzIG9uIGEgc3BlY2lmaWVkIGZpbGUsCj4gbGVhdmluZyBq
dXN0IHRoZSBmaWxlIG5hbWUgZ2VuZXJhdGlvbiBpbiBsaWJ4bF9fZG9tYWluX3VzZXJkYXRhX2xv
Y2soKS4KPiAKPiBUaGlzIHBhdGNoIGFsc28gZ2VuZXJhbGlzZXMgbGlieGxfX3VubG9ja19kb21h
aW5fdXNlcmRhdGEoKSB0bwo+IGxpYnhsX191bmxvY2tfZmlsZSgpIGFuZCBtb2RpZmllcyBhbGwg
Y2FsbC1zaXRlcy4KPiAKPiBTdWdnZXN0ZWQtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4KClRoYW5rcyA6LSkuCgpBY2tlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
