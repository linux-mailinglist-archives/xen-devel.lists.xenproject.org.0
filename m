Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5383710770A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 19:12:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYDMA-0004As-H9; Fri, 22 Nov 2019 18:08:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mZ44=ZO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iYDM9-0004An-8E
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 18:08:33 +0000
X-Inumbo-ID: 1786291a-0d53-11ea-a35e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1786291a-0d53-11ea-a35e-12813bfff9fa;
 Fri, 22 Nov 2019 18:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574446112;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=vXCP5OqNXiF/9erNY2WpAKvdXRdi3PWN659gfuUmDkQ=;
 b=Qiq2yv+JKsrILTb/oGVARFcCQnDB13RlR+oaNHcRvJ2BuNpiWShX9o3e
 Zy5wsPyFDOP3nVmJvmz1spRz9evQosxZNFQHl8dazZQfSo3mLTt+8PTNS
 HPVPqSOASwkX5JxdPMRs/CGTWqiyIIhKUlcubY6hs2znAt8jSnof+08pX 0=;
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
IronPort-SDR: 3D1Lzstbxfj7dvNqfBEpjJ8rm+xnV5aq6WykkFmN++UskxlkUcb7ds4sAjcHbvU9SV2gWI3DnR
 TDHHn3GkjZIJ0q9jzgT1Ne9zd816I6u/d+Ozr5hXzV0JEoGxTOOuR1iQnQ7/tP4jFSOx5DJb9Z
 SkOeVjZYavXK330mnyPefqnt2tqQuAnJk+9750Kz6Xvyc1wVX7GnXipPXlAEf6TTw7AgTsxGeD
 y28DLmAHQlcdFi0BVl+KY9yRYCE9/82vwpNdylCXxg+Rh8tlBmqmacKzDoUZ+iY/w3iSqsrsrb
 X8I=
X-SBRS: 2.7
X-MesageID: 8719311
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,230,1571716800"; 
   d="scan'208";a="8719311"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24024.9229.13361.510891@mariner.uk.xensource.com>
Date: Fri, 22 Nov 2019 18:08:13 +0000
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <20191122164436.3yiivi5apbbwyt3a@debian>
References: <20191121181300.6497-1-al1img@gmail.com>
 <20191121181300.6497-2-al1img@gmail.com>
 <20191122151846.GG1425@perard.uk.xensource.com>
 <673d7677-57c6-8d08-8b7d-d8728b90035e@suse.com>
 <20191122164436.3yiivi5apbbwyt3a@debian>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v2 1/3] libxl: introduce new backend type
 VINPUT
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
Cc: Wei Liu <wl@xen.org>, Oleksandr Grytsov <al1img@gmail.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDEvM10gbGlieGw6IGlu
dHJvZHVjZSBuZXcgYmFja2VuZCB0eXBlIFZJTlBVVCIpOgo+IE9uIEZyaSwgTm92IDIyLCAyMDE5
IGF0IDA0OjQzOjAzUE0gKzAxMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gPiBSZWxlYXNlLWFj
a2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gSSB0YWtlIGl0IHRo
aXMgYXBwbGllcyB0byBib3RoIHBhdGNoIDEgYW5kIDM/CgpJbiB0aGUgYWJzZW5jZSBvZiBhIHJl
cGx5IHRvIHRoZSBjb250cmFyeSBieSAyMTowMCBVVEMgdG9kYXksIEkgd2lsbAphc3N1bWUgdGhp
cyB0byBiZSB0aGUgY2FzZSBhbmQgcHVzaCB0aGlzIHRvIHN0YWdpbmcuICBJIGhvcGUgdGhhdApt
ZWV0cyB3aXRoIGV2ZXJ5b25lJ3MgYXBwcm92YWwuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
