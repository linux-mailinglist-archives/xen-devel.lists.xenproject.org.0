Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA14E77DA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 18:51:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP99A-0005r1-NV; Mon, 28 Oct 2019 17:49:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=es4G=YV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iP998-0005qw-Vk
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 17:49:39 +0000
X-Inumbo-ID: 4b5467e0-f9ab-11e9-94fc-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b5467e0-f9ab-11e9-94fc-12813bfff9fa;
 Mon, 28 Oct 2019 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572284972;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pmmudSAbBflET9cD2bphmIUfORInkwZpYgFgFw7aIK0=;
 b=Od9aGsnvLhAHCpAhXDlPypLZOFEtBN97IuysvcaxxhwhffXWk1oJhNTJ
 TZNvZrT3+o5YIyrXHx3/PRO+kk1XqYltbqX8nTE5GDumNXMvIMbeLGWyB
 Sx1MwX0L9aMEzUyoavrMzVa6OGMGGZII4J8S6LYKJ/HL/GZ2w7DC0Uuvv w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a4o90tsSJPqWEo7Oy2moUYACoyzOEwTDrQ9vZOeol2m8xXTN8m7MZys0DtA5vhgkqOyClF1605
 lpj2/2IUSo525dC1XkRdX2doxBMae2c45CFSrxJ7bjeGqKL8t/0qV0BEn0ervT5EqUiMbW9uEl
 AAZ6Y1cO/YWCIJI8cSlrvfAiixYlSZVCYr4YwEMC3GEEeEafYXeYWbUXe+LRpKsVfRF7Nv2z7W
 zwdB1oKyEr2eZIOGKih6VqJRAWPF7VzhaeZbVBJOJvTZRaM1qs7RflLYxXJNnRkDpSXJz81uCK
 gFw=
X-SBRS: 2.7
X-MesageID: 7517304
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7517304"
Date: Mon, 28 Oct 2019 17:49:28 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20191028174928.GE1162@perard.uk.xensource.com>
References: <20191028152948.11900-1-ian.jackson@eu.citrix.com>
 <20191028152948.11900-3-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191028152948.11900-3-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 2/3] libxl:
 libxl__spawn_stub_dm: Call domain_config_setdefault
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
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDM6Mjk6NDdQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUHJldmlvdXNseSwgZGVmYXVsdGluZyBhbmQgY2hlY2tpbmcgb2Ygc29tZSBhc3BlY3Rz
IG9mIHRoZSBkb21haW4KPiBjb25maWcgd2FzIHNraXBwZWQgZm9yIHN0dWIgZG1zLiAgVGhpcyBo
YXMgYmVlbiB0aGUgY2FzZSBmb3JldmVyLgo+IAo+IEluIGFkMDExYWQwODg0MyAibGlieGwveGw6
IE92ZXJoYXVsIHBhc3N0aHJvdWdoIHNldHRpbmcgbG9naWMiIHNvbWUKPiBkZWZhdWx0aW5nIHRo
YXQgd2FzIG5lZWRlZCBmb3Igc3R1YiBkbXMgd2FzIG1vdmVkIGZyb20KPiBsaWJ4bF9fZG9tYWlu
X2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQgdG8gLi5fY29uZmlnX3NldGRlZmF1bHQgd2l0aCB0aGUK
PiByZXN1bHQgdGhhdCBmb3Igc3R1YiBkbXMsIGxpYnhsX19kb21haW5fbWFrZSBmYWlscyB3aXRo
IHRoaXMKPiBhc3NlcnRpb246Cj4gICB4bDogbGlieGxfY3JlYXRlLmM6NTgyOiBsaWJ4bF9fZG9t
YWluX21ha2U6IEFzc2VydGlvbgo+ICAgYGluZm8tPnBhc3N0aHJvdWdoICE9IExJQlhMX1BBU1NU
SFJPVUdIX0RFRkFVTFQnIGZhaWxlZC4KPiAKPiBGaXggdGhpcyBieSBwcm9wZXJseSBkb2luZyBh
bGwgZGVmYXVsdGluZyBhbmQgYWxsIGNoZWNraW5nIGZvciBzdHViCj4gZG1zLiAgVGhpcyBpcyBt
b3JlIGNvcnJlY3QsIGJ1dCAoZXNwZWNpYWxseSBhdCB0aGlzIHN0YWdlIG9mIHRoZQo+IHJlbGVh
c2UpIGl0IGlzIG5lY2Vzc2FyeSB0byBtb3JlIGNsb3NlbHkgZXZhbHVhdGUgdGhlIGVmZmVjdHMg
YnkKPiByZXZpZXdpbmcgdGhlIGJvZHkgb2YgX2NvbmZpZ19zZXRkZWZhdWx0LiAgVGhlIGNoYW5n
ZXMgYXJlIGFzIGZvbGxvd3M6Cj4gCj4gT25lIGFjdHVhbCBmdW5jdGlvbmFsIGNoYW5nZToKPiAK
PiAqIFRoZSBuZXcgcGFzc3Rocm91Z2ggZGVmYXVsdGluZyBpcyBwcm9wZXJseSBkb25lLiAgVGhp
cyBpcyB3aGF0IHdlCj4gICBhcmUgdHJ5aW5nIHRvIGFjdHVhbGx5IGZpeCBoZXJlLgo+IAo+IEFu
ZCBhIGxvdCBvZiB0aGluZ3MgdGhhdCBtYWtlIG5vIGRpZmZlcmVuY2U6Cj4gCj4gKiBzaGFkb3df
bWVta2Igd291bGQgbm93IGJlIHNldC4gIFdoZXRoZXIgdGhpcyB3b3VsZCBiZSBjb3JyZWN0IGlz
IG5vdAo+ICAgZW50aXJlbHkgY2xlYXIuICBJdCBzZWVtcyBiZXR0ZXIgdG8gbWFrZSB0aGlzIHBh
dGNoICh3aG9zZSBwdXJwb3NlCj4gICBpcyB0byBmaXggdGhlIHBhc3N0aHJvdWdoIGRlZmF1bHRp
bmcpICpub3QqIGluY2x1ZGUgdGhhdCBzZW1hbnRpYwo+ICAgY2hhbmdlLCBzbyBoZXJlIEkgaGF2
ZSBpbmNsdWRlZCBhIGh1bmsgdG8gZXhwbGljaXRseSBvdmVycmlkZSB0aGlzLgo+IAo+ICogRkxB
U0sgc3NpZF9sYWJlbCBpcyBwcm9jZXNzZWQuICBCdXQgdGhlIGFjdHVhbCBzc2lkcmVmIGlzIGNv
cGllZAo+ICAgZnJvbSB0aGUgZ3Vlc3QgZG9tYWluIGJ5IHNwYXduX3N0dWJfZG0sIGFuZCBzc2lk
X2xhYmVsIGlzIHNldCB0bwo+ICAgTlVMTC4gIFNvIG5vIGNoYW5nZS4KPiAKPiAqIFdlIHNldCBp
b21tdV9tZW1rYi4gIEJ1dCB0byAwIHNpbmNlIHBhc3N0aHJvdWdoIGlzIGRpc2FibGVkLgo+IAo+
ICogY3B1aWQgcG9vbF9uYW1lIGlzIHByb2Nlc3NlZC4gIEJ1dCB0aGlzIGlzIG5vdCBzZXQgYnkK
PiAgIHNwYXduX3N0dWJfZG0uICAoQXJndWFibHkgdGhpcyBpcyBhIGJ1Zzogc3R1YiBkbXMgc2hv
dWxkIGluaGVyaXQgdGhlCj4gICBwYXJlbnQgY3B1cG9vbC4pICBUaGUgZWZmZWN0IGlzIHRvIGxl
YXZlIHBvb2xpZCBzZXQgdG8gMCBhbmQgY2FsbAo+ICAgbGlieGxfY3B1cG9vbGlkX2lzX3ZhbGlk
IGJ1dCB0aGF0IGFsd2F5cyBzdWNjZWVkcyBmb3IgMC4gIFNvIG5vCj4gICBjaGFuZ2UuCj4gCj4g
KiBWYXJpb3VzIGV4dHJhIGNoZWNrcyBhcmUgZG9uZTogcmVqZWN0IFBDSSBwYXNzdGhyb3VnaCBm
b3IgSFZNIHdpdGgKPiAgIFBPRCAoc3R1YiBkbSBpcyBQVik7IHJlamVjdCBwb2QgKyB2bnVtYSwg
b3IgUFYgKyB2bnVtYSAoc3R1YiBkbSBoYXMKPiAgIG5vIHZudW1hKTsgcmVqZWN0IG5lc3RlZCBI
Vk0gb3IgcG9kLCB3aXRoIGFsdDJwbS1odm0gKGFnYWluLCBzdHViIGRtCj4gICBpcyBQVikuICBT
byB0aGVzZSBjaGVja3Mgd2lsbCBhbHdheXMgcGFzcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDQzogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
