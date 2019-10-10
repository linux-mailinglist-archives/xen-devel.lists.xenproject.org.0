Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45ABD2B62
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 15:33:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIYVr-0003zW-4w; Thu, 10 Oct 2019 13:29:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5VA=YD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIYVp-0003zR-0C
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 13:29:49 +0000
X-Inumbo-ID: 0715c18e-eb62-11e9-bbab-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0715c18e-eb62-11e9-bbab-bc764e2007e4;
 Thu, 10 Oct 2019 13:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570714187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DFUMz5HxVCjaVs1YqyzFKNqUkBMI7mZkac2E0pUZlI0=;
 b=eDuZAEp0dC/LqT5lkLi9L6BJsqlcBrLowrsIwAHB7A9zq1r6cZwG/Hw1
 DillaEDh2ilsiqgwoXeOvAYS0th3tn7PqMOG78VpLKTQGaethFbtKgLDy
 X062iFSf/UBtNIDJKehZEF3S1EYDckHQbJ4hKMuuirvN7mkJ6XaoWO7Tg Q=;
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
IronPort-SDR: zHXzsfB7Lh+YmqSJRnDYZwWEeZ1BMZPQSVQsAb9ucTki806ZdrzXoRQGl/EnkO6XFkkastMZnH
 5ivK04VIUJJXQAyAj/9aW1D8dfvUMMd2elC6E9fnjQol9M8u15W9/MFq2pam37YPm7ds4+Wm0t
 lB2jmzFfOAELEFyluG2UQoxdLuwdL/+g8CSuUp4r4UqFfcKLq3i8541sjBSxMnRtSxGKwL9fGp
 GK+LCDRbSIA4wwGC9DMWwZCI+n9PUqz6h2QHdECe9+tfeh5j32cz8MHhU9qhrpc5cX6IKyXLGh
 9ik=
X-SBRS: 2.7
X-MesageID: 6980947
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="6980947"
Date: Thu, 10 Oct 2019 15:29:36 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191010132936.GH1389@Air-de-Roger.citrite.net>
References: <20191010113345.6867-1-roger.pau@citrix.com>
 <20191010113345.6867-2-roger.pau@citrix.com>
 <b1e9fac5-a476-638c-e550-c179146ecf7f@suse.com>
 <20191010121302.GF1389@Air-de-Roger.citrite.net>
 <39f2d60b-e371-1646-dc79-cf1355a81afa@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <39f2d60b-e371-1646-dc79-cf1355a81afa@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 1/2] x2APIC: translate IO-APIC entries
 when enabling the IOMMU
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMDI6NTU6MDJQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTAuMTAuMjAxOSAxNDoxMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBUaHUsIE9jdCAxMCwgMjAxOSBhdCAwMTo1NDowNlBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAxMC4xMC4yMDE5IDEzOjMzLCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IFdoZW4gaW50ZXJydXB0IHJlbWFwcGluZyBpcyBlbmFibGVkIGFzIHBhcnQgb2YgZW5hYmxpbmcg
eDJBUElDIHRoZQo+ID4+Cj4gPj4gUGVyaGFwcyAidW5tYXNrZWQiIGluc3RlYWQgb2YgInRoZSI/
Cj4gPj4KPiA+Pj4gSU8tQVBJQyBlbnRyaWVzIGFsc28gbmVlZCB0byBiZSB0cmFuc2xhdGVkIHRv
IHRoZSBuZXcgZm9ybWF0IGFuZCBhZGRlZAo+ID4+PiB0byB0aGUgaW50ZXJydXB0IHJlbWFwcGlu
ZyB0YWJsZS4KPiA+Pj4KPiA+Pj4gVGhpcyBwcmV2ZW50cyBJT01NVSBpbnRlcnJ1cHQgcmVtYXBw
aW5nIGZhdWx0cyB3aGVuIGJvb3Rpbmcgb24KPiA+Pj4gaGFyZHdhcmUgdGhhdCBoYXMgdW5tYXNr
ZWQgSU8tQVBJQyBwaW5zLgo+ID4+Cj4gPj4gQnV0IGluIHRoZSBlbmQgaXQgb25seSBwYXBlcnMg
b3ZlciB3aGF0ZXZlciB0aGUgc3B1cmlvdXMgaW50ZXJydXB0cwo+ID4+IHJlc3VsdCBmb3JtLCBk
b2Vzbid0IGl0PyBXaGljaCBpc24ndCB0byBzYXkgdGhpcyBpc24ndCBhbgo+ID4+IGltcHJvdmVt
ZW50LiBDYWxsaW5nIG91dCB0aGUgRXh0SW50IGNhc2UgaGVyZSBtYXkgYmUgd29ydGh3aGlsZSBh
cwo+ID4+IHdlbGwsIGFzIHdvdWxkIGJlIHBvaW50aW5nIG91dCB0aGF0IHRoaXMgY2FzZSBzdGls
bCB3b24ndCB3b3JrIG9uCj4gPj4gQU1EIElPTU1Vcy4KPiA+IAo+ID4gQnV0IHRoZSBmaXggZm9y
IHRoZSBFeHRJTlQgQU1EIGlzc3VlIHNob3VsZCBiZSBkb25lIGluCj4gPiBhbWRfaW9tbXVfaW9h
cGljX3VwZGF0ZV9pcmUgdGhlbiwgc28gdGhhdCBpdCBjYW4gcHJvcGVybHkgaGFuZGxlCj4gPiBF
eHRJTlQgZGVsaXZlcnkgbW9kZSwgbm90IHRvIHRoaXMgcGFydCBvZiB0aGUgY29kZS4gSSB3aWxs
IGxvb2sKPiA+IGludG8gaXQsIGJ1dCBJIHRoaW5rIGl0J3Mga2luZCBvZiB0YW5nZW50aWFsIHRv
IHRoZSBpc3N1ZSBoZXJlLgo+IAo+IEknbSBub3QgdGFsa2luZyBvZiB5b3Ugd29ya2luZyBvbiBm
aXhpbmcgdGhpcyByaWdodCBhd2F5LiBJJ20gbWVyZWx5Cj4gYXNraW5nIHRoYXQgeW91IG1lbnRp
b24gaGVyZSAoYSkgdGhlIEV4dEludCBzcGVjaWFsIGNhc2UgYW5kIChiKQo+IHRoYXQgdGhpcyBz
cGVjaWFsIGNhc2Ugd2lsbCAoY29udGludWUgdG8pIG5vdCB3b3JrIGluIHRoZSBBTUQgY2FzZS4K
ClBsZWFzZSBiZWFyIHdpdGggbWUsIEkndmUgdGFrZW4gYSBsb29rIGF0IHRoZSBFeHRJTlQgaGFu
ZGxpbmcgZm9yIEFNRAphbmQgSSdtIG5vdCBzdXJlIEkgY2FuIHNwb3Qgd2hhdCdzIG1pc3Npbmcu
IFhlbiBzZWVtcyB0byBoYW5kbGUgYm90aAp0aGUgRUludFBhc3MgYW5kIElWIGZpZWxkcyBvZiB0
aGUgRFRFIChzZWUgaW9tbXVfZHRlX2FkZF9kZXZpY2VfZW50cnkKYW5kIGFtZF9pb21tdV9zZXRf
aW50cmVtYXBfdGFibGUpLCBhbmQgdGhhdCBzaG91bGQgYmUgZW5vdWdoIGluIG9yZGVyCnRvIHBh
c3N0aHJvdWdoIHN1Y2ggaW50ZXJydXB0cy4KCklzIHRoZXJlIHNvbWUgb3RoZXIgaGFuZGxpbmcg
dGhhdCBJJ20gbWlzc2luZz8gKG1heWJlIGluIHRoZSBoYW5kbGluZwpvZiB0aGUgaW50ZXJydXB0
IGl0c2VsZj8pCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
