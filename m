Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091E01509BF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:23:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydXI-00029Z-Ji; Mon, 03 Feb 2020 15:21:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iydXH-00029T-0v
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:21:15 +0000
X-Inumbo-ID: d04018d4-4698-11ea-b211-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d04018d4-4698-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580743273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sByIcCnsEPKyHzAZKHANXFzq+DnMZfpa/4BZbohFaqM=;
 b=cMg1DrPb4Z9WVmcM2oJQ82tquz6sY8iaRRXz/LyBqj2ce8sfg7BtVg51
 hb10d9AURHz4j12sW9pWUCdtL+Uk6IEJ6ui6/4TI8NLFrFbwrNFtkl9Xf
 HSqtxdWLRydVn7j1Oalrplp8EhUie/do2T/jgXphhGnyb+XN8AeR84Myh k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YH+V33dDAkC+y/udWtZTGQkmf/oxUdNJZJURRwKIwVFcBCAh/Q8b/bvTslcy/Ikgv5UhcZgCs5
 wlKxCi9x/U88IeQ+ybG2V2Q+9ezjClXVCCi3Znr0E1llHrZX+y+wOQXLFzPftFrjlg0ZYy0+7K
 yeRIqIxFKJMZkT0CbY+urDbQJ+uHaTSzMv4qwGP0ZdvdspCKGq7CZ/p6cn7GJKLQRwvl2oUjVK
 8Hz3rrZNqiQuFdlkQMo3MtpFK/drQlOxoMS+k/xv+lz78F7Ozoxpz3yEcyVDA5zeSciedFRzjk
 MIk=
X-SBRS: 2.7
X-MesageID: 12220457
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12220457"
Date: Mon, 3 Feb 2020 16:21:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Wei Liu <wl@xen.org>
Message-ID: <20200203152106.GA4679@Air-de-Roger>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
 <20200203150154.GZ4679@Air-de-Roger>
 <20200203150724.bdnhkkyrntsdvxpl@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200203150724.bdnhkkyrntsdvxpl@debian>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDM6MDc6MjRQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBNb24sIEZlYiAwMywgMjAyMCBhdCAwNDowMTo1NFBNICswMTAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDU6NDk6MjRQTSArMDAwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gSHlwZXItViB1c2VzIGEgdGVjaG5pcXVlIGNhbGxlZCBvdmVy
bGF5IHBhZ2UgZm9yIGl0cyBoeXBlcmNhbGwgcGFnZS4gSXQKPiA+ID4gd2lsbCBpbnNlcnQgYSBi
YWNraW5nIHBhZ2UgdG8gdGhlIGd1ZXN0IHdoZW4gdGhlIGh5cGVyY2FsbCBmdW5jdGlvbmFsaXR5
Cj4gPiA+IGlzIGVuYWJsZWQuIFRoYXQgbWVhbnMgd2UgY2FuIHVzZSBhIHBhZ2UgdGhhdCBpcyBu
b3QgYmFja2VkIGJ5IHJlYWwKPiA+ID4gbWVtb3J5IGZvciBoeXBlcmNhbGwgcGFnZS4KPiA+ID4g
Cj4gPiA+IFVzZSB0aGUgdG9wLW1vc3QgYWRkcmVzc2FibGUgcGFnZSBmb3IgdGhhdCBwdXJwb3Nl
LiBBZGp1c3QgZTgyMCBtYXAKPiA+ID4gYWNjb3JkaW5nbHkuCj4gPiAKPiA+IENhbiB5b3UgYWRk
IHRoaXMgaXMgZG9uZSB0byBhdm9pZCBwYWdlIHNoYXR0ZXJpbmcgYW5kIHRvIG1ha2Ugc3VyZQo+
ID4gWGVuIGlzbid0IG92ZXJ3cml0aW5nIGFueSBNTUlPIGFyZWEgd2hpY2ggbWlnaHQgYmUgcHJl
c2VudCBhdCBsb3dlcgo+ID4gYWRkcmVzc2VzPwo+IAo+IE5QLgo+IAo+ID4gCj4gPiA+ICsKPiA+
ID4gK3N0YXRpYyB2b2lkIF9faW5pdCBlODIwX2ZpeHVwKHN0cnVjdCBlODIwbWFwICplODIwKQo+
ID4gPiArewo+ID4gPiArICAgIHVpbnQ2NF90IHMgPSBIVl9IQ0FMTF9NRk4gPDwgUEFHRV9TSElG
VDsKPiA+ID4gKwo+ID4gPiArICAgIGlmICggIWU4MjBfYWRkX3JhbmdlKGU4MjAsIHMsIHMgKyBQ
QUdFX1NJWkUsIEU4MjBfUkVTRVJWRUQpICkKPiA+IAo+ID4gSSB0aGluayBlbmQgc2hvdWxkIGJl
IHMgKyBQQUdFX1NJWkUgLSAxLCBvciBlbHNlIGl0IGV4cGFuZHMgYWNyb3NzIHR3bwo+ID4gcGFn
ZXM/Cj4gCj4gTm8sIGl0IHNob3VsZG4ndC4KPiAKPiBFODIwIGVudHJ5IHJlY29yZHMgdGhlIHNp
emUgb2YgdGhlIHJlZ2lvbiwgd2hpY2ggaXMgY2FsY3VsYXRlZCBhcwo+IGVuZC1zdGFydC4gVGhl
IG9uZSB1c2FnZSBpbiBwdi9zaGltLmMgZm9sbG93cyB0aGUgc2FtZSBwYXR0ZXJuIGhlcmUuCgpI
bSwgSSBzZWUuIEknbSBub3Qgc3VyZSB0aGlzIGlzIGNvcnJlY3QsIEkgdGhpbmsgdGhlIGU4MjAg
ZW50cnkKc2hvdWxkIGxvb2sgbGlrZToKCmFkZHIgPSBzOwpzaXplID0gUEFHRV9TSVpFIC0gMTsK
CkFzIHJhbmdlcyBvbiB0aGUgZTgyMCBhcmUgaW5jbHVzaXZlLCBzbyBpZiBzaXplIGVuZHMgdXAg
YmVpbmcKUEFHRV9TSVpFIHRoZW4gdGhlIGVudHJ5IHdvdWxkIGV4cGFuZCBhY3Jvc3MgdHdvIHBh
Z2VzLgoKQW55d2F5LCB0aGlzIG5lZWRzIGZpeGluZyBlbHNld2hlcmUsIGFuZCBpcyBvdXQgb2Yg
dGhlIHNjb3BlIG9mIHRoaXMKcGF0Y2guCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
