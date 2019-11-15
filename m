Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF580FE265
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 17:12:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVe9Y-0002fv-SF; Fri, 15 Nov 2019 16:08:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ISM0=ZH=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iVe9X-0002fn-7l
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 16:08:55 +0000
X-Inumbo-ID: 384b6322-07c2-11ea-a277-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 384b6322-07c2-11ea-a277-12813bfff9fa;
 Fri, 15 Nov 2019 16:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573834134;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=HZ7WjHrOoLkd8QKQ1gKR8Mn/PI2YCDNtfg1rsxEG2Kg=;
 b=M/pf6QfqbQoJqtNl6obahSbxir9WDNglDGiRlWK0p961MpxJ+N8ehIlQ
 IujIcy4P6ROrgn4XgQBRj4SLfEkCOn96NnUc3OJoDAVyKHIP9egAlUb4N
 eMMY+g1C1LhAm20Llzv6+UjxGKhQcQKIZhBqHgEkeiSZDcj/PvCYK99t4 E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yiVFdGytUrUE5A0Orf5YczmyaU48VmYYgCJzxMGS2AKBIbZHsunTHzW9ZfMS+jnAsd2S7u7WsQ
 zp0g+ZS5X5RxM8k9nYWpgIRDt9M9b5hxv4MLyo+EJsgeNQWj/uu9HV71qyYa1Zxe+2rgXtiIZ+
 1gBnylJyhQiJjSpCltLCduqnmv2oAa52n99ndLn8eQ9Zk1GFQtJ0Zck8VHc8t5p02pb6HSxPWa
 1alzhivx56X5njU746plTYTxbscUENQIpUsVsDgsG+YfMYvubhjc0rkAHyamWTzNzsoFwhZqWV
 ess=
X-SBRS: 2.7
X-MesageID: 8927693
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8927693"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24014.52626.919431.849242@mariner.uk.xensource.com>
Date: Fri, 15 Nov 2019 16:08:50 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
In-Reply-To: <20191030180704.261320-5-anthony.perard@citrix.com>
References: <20191030180704.261320-1-anthony.perard@citrix.com>
 <20191030180704.261320-5-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v2 4/6] libxl: Introduce
 libxl__ev_slowlock_dispose
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiW1hFTiBQQVRDSCBmb3ItNC4xMyB2MiA0LzZdIGxpYnhs
OiBJbnRyb2R1Y2UgbGlieGxfX2V2X3Nsb3dsb2NrX2Rpc3Bvc2UiKToKPiBXaGljaCBhbGxvdyB0
byBjYW5jZWwgdGhlIGxvY2sgb3BlcmF0aW9uIHdoaWxlIGl0IGlzIGluIEFjdGl2ZSBzdGF0ZS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4
LmNvbT4KCkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
