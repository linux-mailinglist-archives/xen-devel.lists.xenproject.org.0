Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C733EAE709
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 11:33:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7cSk-0002Nl-OI; Tue, 10 Sep 2019 09:29:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G+U8=XF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i7cSj-0002Ng-AU
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 09:29:25 +0000
X-Inumbo-ID: 79d88570-d3ad-11e9-b299-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79d88570-d3ad-11e9-b299-bc764e2007e4;
 Tue, 10 Sep 2019 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568107764;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=d5xsy8vNnK7EJ25ULM7KMqIcNSqmQVcOk322+pznOVM=;
 b=f8aM7W0LmdhYfqYysU31Et4cfhvlQIj3R3wAoOgIYEuhWy/ooKbnOl8o
 nCcQ6ojm6eltwJU+f11idkjipS4riOEYj7FMsAeooT/EMCzHClJEOASBG
 bv6roK+cld0kB/p05BrCT3fvf1ydZvlPiOEWyicDC5SlJqXeC2Nw11G7P 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: emy+h7wpiPHzDEKNsnFGivM84z4eka/3xW3RKcF2EL+SABH1EqczLGoJK05oA9zL3ilzJyhWiv
 i1MuapvknCyDnlhPRgnOB6+mSqec9D+d71Jc56/6DoN9m3srnCfyZ9M6nXo/ErGBErVexiutux
 XVruPf7WFXLM6LHDsmifcWiFy6lWPVap5/4ZX5PCObitB3lax8yPC/IVVkZMnOYkUyWY9lltTT
 qCD+aYQZEL5EwXiIi1A4ILaXnwRUcsDgpLjc3fM65GMFGe0ZiXFhb/gqMLVgFYsGseGWYpaB9S
 OSM=
X-SBRS: 2.7
X-MesageID: 5644160
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5644160"
Date: Tue, 10 Sep 2019 11:29:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190910092912.s2seglrzng22zhjm@Air-de-Roger>
References: <20190909155124.19942-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190909155124.19942-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/cpuid: Fix handling of the
 CPUID.7[0].eax levelling MSR
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMDksIDIwMTkgYXQgMDQ6NTE6MjRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA3YTAgaXMgYW4gaW50ZWdlciBmaWVsZCwgbm90IGEgbWFzayAtIHRha2luZyB0aGUg
bG9naWNhbCBhbmQgb2YgdGhlIGhhcmR3YXJlCj4gYW5kIHBvbGljeSB2YWx1ZXMgcmVzdWx0cyBp
biBub25zZW5zZS4gIEluc3RlYWQsIHRha2UgdGhlIHBvbGljeSB2YWx1ZQo+IGRpcmVjdGx5Lgo+
IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogV2Vp
IExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gCj4gRXZlbiBSb21lIGhhcmR3YXJlIGhhcyA3WzBdLmVheCBzdGlsbCBhcyAwLCBh
bmQgdGhlcmUgaXMgbm8gc2Vuc2libGUgcmVhc29uIHRvCj4gc2V0IG1heF9zdWJsZWFmIGhpZ2hl
ciBhdCB0aGlzIHBvaW50LCBzbyB0aGlzIGlzIG9ubHkgYSBsYXRlbnQgYnVnIGZvciBub3cuCj4g
LS0tCj4gIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyB8IDEzICsrKysrKysrKy0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2RvbWN0bC5jIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCj4gaW5kZXgg
MWU5OGZjODAwOS4uMzVhZDhjYjUxYyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tY3Rs
LmMKPiArKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKPiBAQCAtMjE4LDExICsyMTgsMTYgQEAg
c3RhdGljIGludCB1cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oc3RydWN0IGRvbWFpbiAqZCwKPiAg
ICAgICAgICBpZiAoIGlzX3B2X2RvbWFpbihkKSAmJiAoKGxldmVsbGluZ19jYXBzICYgTENBUF83
YWIwKSA9PSBMQ0FQXzdhYjApICkKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIHVpbnQ2NF90
IG1hc2sgPSBjcHVpZG1hc2tfZGVmYXVsdHMuXzdhYjA7Cj4gLSAgICAgICAgICAgIHVpbnQzMl90
IGVheCA9IGN0bC0+ZWF4Owo+IC0gICAgICAgICAgICB1aW50MzJfdCBlYnggPSBwLT5mZWF0Ll83
YjA7Cj4gIAo+IC0gICAgICAgICAgICBpZiAoIGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmIChY
ODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pICkKPiAtICAgICAgICAgICAgICAgIG1h
c2sgJj0gKCh1aW50NjRfdCllYXggPDwgMzIpIHwgZWJ4Owo+ICsgICAgICAgICAgICAvKgo+ICsg
ICAgICAgICAgICAgKiBMZWFmIDdbMF0uZWF4IGlzIG1heF9zdWJsZWFmLCBub3QgYSBmZWF0dXJl
IG1hc2suICBUYWtlIGl0Cj4gKyAgICAgICAgICAgICAqIHdob2xlc2FsZSBmcm9tIHRoZSBwb2xp
Y3ksIGJ1dCBjbGFtcCB0aGUgZmVhdHVyZXMgaW4gN1swXS5lYngKPiArICAgICAgICAgICAgICog
cGVyIHVzdWFsLgo+ICsgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgaWYgKCBib290X2Nw
dV9kYXRhLng4Nl92ZW5kb3IgJgo+ICsgICAgICAgICAgICAgICAgIChYODZfVkVORE9SX0FNRCB8
IFg4Nl9WRU5ET1JfSFlHT04pICkKPiArICAgICAgICAgICAgICAgIG1hc2sgPSAoKCh1aW50NjRf
dClwLT5mZWF0Lm1heF9zdWJsZWFmIDw8IDMyKSB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICgodWludDMyX3QpbWFzayB8IHAtPmZlYXQuXzdiMCkpOwoKV2h5IGRvIHlvdSBzZXQgdGhlIGhp
Z2ggYml0cyBvZiB0aGUgbWFzayAoNjM6MzApIHdpdGggdGhlIG1heCBzdWJsZWFmPwpBY2NvcmRp
bmcgdG8gdGhlIGRvY3VtZW50IEkgaGF2ZSBiaXRzIDYzOjMwIGFyZSByZXNlcnZlZCwgYW5kIHRo
YXQKc2VlbXMgdG8gbWF0Y2ggdGhlIGV4cGVjdGVkIENQVUlEIHJldHVybiB2YWx1ZSwgdGhhdCBs
aXN0cyBDUFVJRApGbjAwMDBfMDAwN19FQVhfeDAgY29udGVudCBhcyByZXNlcnZlZC4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
