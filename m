Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4441679D2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 10:50:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j54uR-0003Kv-Bh; Fri, 21 Feb 2020 09:47:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nwZw=4J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j54uP-0003Jy-S2
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 09:47:45 +0000
X-Inumbo-ID: 34fa8ce3-548f-11ea-860d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 34fa8ce3-548f-11ea-860d-12813bfff9fa;
 Fri, 21 Feb 2020 09:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582278464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GGvy69JckNgFz+hczURopPTJOBE9gpMRPOIkan44JhQ=;
 b=D7BX+FiBan1Ej9iS6zTvPPtPJCwmFJyxiARRzlOUEBx3zrm12lsbxNyz
 Ebr43GlWubrHYUAsjna1O8RcjZfg6pmprHX/B+r4Wp240lWj/IqUQEhtY
 OMEuhbYeNyv1PUzMPnL+T+DxK27RUs9sJd1m20LH+cfT19doIrDEGHGc1 o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: RbCXnuRrHuq0rKPJfUulfq14400bSrZsUVVOUEIBDlqmlN8pUmdWOt6Bofx+4GBNKTj7tXep72
 9vxVJK+d0ivzIZkgMrlGXeox5zAu1OCeEr2Ez4mnpXvI5PIgQ1hTg8ewMgvN1n8c2bl48r5ETn
 7JSiKBwC4qAktm3GNIEwjNvzqWy+D/Pjf4pr8wWc2sJoRDpZ6VqXhZpJu6EM01eFLHZixtanzu
 4kLP5nzJUewYYv90/U34x9c3+1srhcr+v+hpLMGf+rXn1PkrRxSVxMp1R3+2iSbpig8r41NJzc
 xbc=
X-SBRS: 2.7
X-MesageID: 13431981
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,467,1574139600"; d="scan'208";a="13431981"
Date: Fri, 21 Feb 2020 10:47:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anchal Agarwal <anchalag@amazon.com>
Message-ID: <20200221094735.GV4679@Air-de-Roger>
References: <20200217230553.GA8100@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200218091611.GN4679@Air-de-Roger>
 <20200219180424.GA17584@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <20200220083904.GI4679@Air-de-Roger>
 <f986b845491b47cc8469d88e2e65e2a7@EX13D32EUC003.ant.amazon.com>
 <20200220154507.GO4679@Air-de-Roger>
 <c9662397256a4568a5cc7d70a84940e5@EX13D32EUC003.ant.amazon.com>
 <20200220164839.GR4679@Air-de-Roger>
 <e42fa35800f04b6f953e4af87f2c1a02@EX13D32EUC003.ant.amazon.com>
 <20200221004918.GA13221@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221004918.GA13221@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [RFC PATCH v3 06/12] xen-blkfront: add callbacks
 for PM suspend and hibernation
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
Cc: "Valentin, Eduardo" <eduval@amazon.com>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "hpa@zytor.com" <hpa@zytor.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "fllinden@amaozn.com" <fllinden@amaozn.com>, "x86@kernel.org" <x86@kernel.org>,
 "Durrant, Paul" <pdurrant@amazon.co.uk>, "mingo@redhat.com" <mingo@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Singh,
 Balbir" <sblbir@amazon.com>, "len.brown@intel.com" <len.brown@intel.com>,
 "jgross@suse.com" <jgross@suse.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "Kamata,
 Munehisa" <kamatam@amazon.com>, "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "davem@davemloft.net" <davem@davemloft.net>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMTI6NDk6MThBTSArMDAwMCwgQW5jaGFsIEFnYXJ3YWwg
d3JvdGU6Cj4gT24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMTA6MDE6NTJBTSAtMDcwMCwgRHVycmFu
dCwgUGF1bCB3cm90ZToKPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiA+ID4gRnJv
bTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+IFNlbnQ6IDIw
IEZlYnJ1YXJ5IDIwMjAgMTY6NDkKPiA+ID4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFt
YXpvbi5jby51az4KPiA+ID4gQ2M6IEFnYXJ3YWwsIEFuY2hhbCA8YW5jaGFsYWdAYW1hem9uLmNv
bT47IFZhbGVudGluLCBFZHVhcmRvCj4gPiA+IDxlZHV2YWxAYW1hem9uLmNvbT47IGxlbi5icm93
bkBpbnRlbC5jb207IHBldGVyekBpbmZyYWRlYWQub3JnOwo+ID4gPiBiZW5oQGtlcm5lbC5jcmFz
aGluZy5vcmc7IHg4NkBrZXJuZWwub3JnOyBsaW51eC1tbUBrdmFjay5vcmc7Cj4gPiA+IHBhdmVs
QHVjdy5jejsgaHBhQHp5dG9yLmNvbTsgdGdseEBsaW51dHJvbml4LmRlOyBzc3RhYmVsbGluaUBr
ZXJuZWwub3JnOwo+ID4gPiBmbGxpbmRlbkBhbWFvem4uY29tOyBLYW1hdGEsIE11bmVoaXNhIDxr
YW1hdGFtQGFtYXpvbi5jb20+Owo+ID4gPiBtaW5nb0ByZWRoYXQuY29tOyB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc7IFNpbmdoLCBCYWxiaXIKPiA+ID4gPHNibGJpckBhbWF6b24uY29t
PjsgYXhib2VAa2VybmVsLmRrOyBrb25yYWQud2lsa0BvcmFjbGUuY29tOwo+ID4gPiBicEBhbGll
bjguZGU7IGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tOyBqZ3Jvc3NAc3VzZS5jb207Cj4gPiA+
IG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZzsgcmp3QHJq
d3lzb2NraS5uZXQ7Cj4gPiA+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHZrdXpuZXRz
QHJlZGhhdC5jb207IGRhdmVtQGRhdmVtbG9mdC5uZXQ7Cj4gPiA+IFdvb2Rob3VzZSwgRGF2aWQg
PGR3bXdAYW1hem9uLmNvLnVrPgo+ID4gPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1JGQyBQ
QVRDSCB2MyAwNi8xMl0geGVuLWJsa2Zyb250OiBhZGQgY2FsbGJhY2tzCj4gPiA+IGZvciBQTSBz
dXNwZW5kIGFuZCBoaWJlcm5hdGlvbgo+ID4gPiBGb3IgZXhhbXBsZSBvbmUgbmVjZXNzYXJ5IGRp
ZmZlcmVuY2Ugd2lsbCBiZSB0aGF0IHhlbmJ1cyBpbml0aWF0ZWQKPiA+ID4gc3VzcGVuZCB3b24n
dCBjbG9zZSB0aGUgUFYgY29ubmVjdGlvbiwgaW4gY2FzZSBzdXNwZW5zaW9uIGZhaWxzLiBPbiBQ
TQo+ID4gPiBzdXNwZW5kIHlvdSBzZWVtIHRvIGFsd2F5cyBjbG9zZSB0aGUgY29ubmVjdGlvbiBi
ZWZvcmVoYW5kLCBzbyB5b3UKPiA+ID4gd2lsbCBhbHdheXMgaGF2ZSB0byByZS1uZWdvdGlhdGUg
b24gcmVzdW1lIGV2ZW4gaWYgc3VzcGVuc2lvbiBmYWlsZWQuCj4gPiA+Cj4gSSBkb24ndCBnZXQg
d2hhdCB5b3UgbWVhbiwgJ3N1c3BlbnNpb24gZmFpbHVyZScgZHVyaW5nIGRpc2Nvbm5lY3Rpbmcg
ZnJvbnRlbmQgZnJvbSAKPiBiYWNrZW5kPyBbYXMgaW4gdGhpcyBjYXNlIHdlIG1hcmsgZnJvbnRl
bmQgY2xvc2VkIGFuZCB0aGVuIHdhaXQgZm9yIGNvbXBsZXRpb25dCj4gT3IgZG8geW91IG1lYW4g
c3VzcGVuc2lvbiBmYWlsIGluIGdlbmVyYWwgcG9zdCBia2FjZW5kIGlzIGRpc2Nvbm5lY3RlZCBm
cm9tCj4gZnJvbnRlbmQgZm9yIGJsa2Zyb250PyAKCkkgZG9uJ3QgdGhpbmsgeW91IHN0cmljdGx5
IG5lZWQgdG8gZGlzY29ubmVjdCBmcm9tIHRoZSBiYWNrZW5kIHdoZW4Kc3VzcGVuZGluZy4gSnVz
dCB3YWl0aW5nIGZvciBhbGwgcmVxdWVzdHMgdG8gZmluaXNoIHNob3VsZCBiZSBlbm91Z2guCgpU
aGlzIGhhcyB0aGUgYmVuZWZpdCBvZiBub3QgaGF2aW5nIHRvIHJlbmVnb3RpYXRlIGlmIHRoZSBz
dXNwZW5zaW9uCmZhaWxzLCBhbmQgdGh1cyB5b3UgY2FuIHJlY292ZXIgZnJvbSBzdXNwZW5zaW9u
IGZhc3RlciBpbiBjYXNlIG9mCmZhaWx1cmUuIFNpbmNlIHlvdSBoYXZlbid0IGNsb3NlZCB0aGUg
Y29ubmVjdGlvbiB3aXRoIHRoZSBiYWNrZW5kIGp1c3QKdW5mcmVlemluZyB0aGUgcXVldWVzIHNo
b3VsZCBnZXQgeW91IHdvcmtpbmcgYWdhaW4sIGFuZCBhdm9pZHMgYWxsIHRoZQpyZW5lZ290aWF0
aW9uLgoKPiBJbiBjYXNlIG9mIGxhdGVyLCBpZiBhbnl0aGluZyBmYWlscyBhZnRlciB0aGUgZHBt
X3N1c3BlbmQoKSwKPiB0aGluZ3MgbmVlZCB0byBiZSB0aGF3ZWQgb3Igc2V0IGJhY2sgdXAgc28g
aXQgc2hvdWxkIG9rIHRvIGFsd2F5cyAKPiByZS1uZWdvdGl0YXRlIGp1c3QgdG8gYXZvaWQgZXJy
b3JzLiAKPiAKPiA+ID4gV2hhdCBJJ20gbW9zdGx5IHdvcnJpZWQgYWJvdXQgaXMgdGhlIGRpZmZl
cmVudCBhcHByb2FjaCB0byByaW5nCj4gPiA+IGRyYWluaW5nLiBJZTogZWl0aGVyIHhlbmJ1cyBp
cyBjaGFuZ2VkIHRvIGZyZWV6ZSB0aGUgcXVldWVzIGFuZCBkcmFpbgo+ID4gPiB0aGUgc2hhcmVk
IHJpbmdzLCBvciBQTSB1c2VzIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGxvZ2ljIG9mIG5vdAo+ID4g
PiBmbHVzaGluZyB0aGUgcmluZ3MgYW4gcmUtaXNzdWluZyBpbi1mbGlnaHQgcmVxdWVzdHMgb24g
cmVzdW1lLgo+ID4gPiAKPiA+IAo+ID4gWWVzLCB0aGF0J3MgbmVlZHMgY29uc2lkZXJhdGlvbi4g
SSBkb27igJl0IHRoaW5rIHRoZSBzYW1lIHNlbWFudGljIGNhbiBiZSBzdWl0YWJsZSBmb3IgYm90
aC4gRS5nLiBpbiBhIHhlbi1zdXNwZW5kIHdlIG5lZWQgdG8gZnJlZXplIHdpdGggYXMgbGl0dGxl
IHByb2Nlc3NpbmcgYXMgcG9zc2libGUgdG8gYXZvaWQgZGlydHlpbmcgUkFNIGxhdGUgaW4gdGhl
IG1pZ3JhdGlvbiBjeWNsZSwgYW5kIHdlIGtub3cgdGhhdCBpbi1mbGlnaHQgZGF0YSBjYW4gd2Fp
dC4gQnV0IGluIGEgdHJhbnNpdGlvbiB0byBTNCB3ZSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IGF0
IGxlYXN0IGFsbCB0aGUgaW4tZmxpZ2h0IGJsa2lmIHJlcXVlc3RzIGdldCBjb21wbGV0ZWQsIHNp
bmNlIHRoZXkgcHJvYmFibHkgY29udGFpbiBiaXRzIG9mIHRoZSBndWVzdCdzIG1lbW9yeSBpbWFn
ZSBhbmQgdGhhdCdzIG5vdCBnb2luZyB0byBnZXQgc2F2ZWQgYW55IG90aGVyIHdheS4KPiA+IAo+
ID4gICBQYXVsCj4gSSBhZ3JlZSB3aXRoIFBhdWwgaGVyZS4gSnVzdCBzbyBhcyB5b3Uga25vdywg
SSBkaWQgdHJ5IGEgaGFja3kgd2F5IGluIHRoZSBwYXN0IAo+IHRvIHJlLXF1ZXVlIHJlcXVlc3Rz
IGluIHRoZSBwYXN0IGFuZCBmYWlsZWQgbWlzZXJhYmx5LgoKV2VsbCwgaXQgd29ya3MgQUZBSUsg
Zm9yIHhlbmJ1cyBpbml0aWF0ZWQgc3VzcGVuc2lvbiwgc28gSSB3b3VsZCBiZQppbnRlcmVzdGVk
IHRvIGtub3cgd2h5IGl0IGRvZXNuJ3Qgd29yayB3aXRoIFBNIHN1c3BlbnNpb24uCgo+IEkgZG91
YnRbanVzdCBmcm9tIG15IGV4cGVyaW1lbnRhdGlvbl1yZS1xdWV1aW5nIHRoZSByZXF1ZXN0cyB3
aWxsIHdvcmsgZm9yIFBNIAo+IEhpYmVybmF0aW9uIGZvciB0aGUgc2FtZSByZWFzb24gUGF1bCBt
ZW50aW9uZWQgYWJvdmUgdW5sZXNzIHlvdSBnaXZlIG1lIHByZXNzaW5nCj4gcmVhc29uIHdoeSBp
dCBzaG91bGQgd29yay4KCk15IG1haW4gcmVhc29uIGlzIHRoYXQgSSBkb24ndCB3YW50IHRvIG1h
aW50YWluIHR3byBkaWZmZXJlbnQKYXBwcm9hY2hlcyB0byBzdXNwZW5kL3Jlc3VtZSB3aXRob3V0
IGEgdGVjaG5pY2FsIGFyZ3VtZW50IGZvciBpdC4gSSdtCm5vdCBoYXBweSB0byB0YWtlIGEgYnVu
Y2ggb2YgbmV3IGNvZGUganVzdCBiZWNhdXNlIHRoZSBjdXJyZW50IG9uZQpkb2Vzbid0IHNlZW0g
dG8gd29yayBpbiB5b3VyIHVzZS1jYXNlLgoKVGhhdCBiZWluZyBzYWlkLCBpZiB0aGVyZSdzIGEg
anVzdGlmaWNhdGlvbiBmb3IgZG9pbmcgaXQgZGlmZmVyZW50bHkKaXQgbmVlZHMgdG8gYmUgc3Rh
dGVkIGNsZWFybHkgaW4gdGhlIGNvbW1pdC4gRnJvbSB0aGUgY3VycmVudCBjb21taXQKbWVzc2Fn
ZSBJIGRpZG4ndCBnYXNwIHRoYXQgdGhlcmUgd2FzIGEgcmVhc29uIGZvciBub3QgdXNpbmcgdGhl
CmN1cnJlbnQgeGVuYnVzIHN1c3BlbmQvcmVzdW1lIGxvZ2ljLgoKPiBBbHNvLCB3b24ndCBpdCBl
ZmZlY3QgdGhlIG1pZ3JhdGlvbiB0aW1lIGlmIHdlIHN0YXJ0IHdhaXRpbmcgZm9yIGFsbCB0aGUK
PiBpbmZsaWdodCByZXF1ZXN0cyB0byBjb21wbGV0ZVtsYXN0IG1pbiBwYWdlIGZhdWx0c10gPwoK
V2VsbCwgaXQncyBnb2luZyB0byBkaXJ0eSBwYWdlcyB0aGF0IHdvdWxkIGhhdmUgdG8gYmUgcmUt
c2VuZCB0byB0aGUKZGVzdGluYXRpb24gc2lkZS4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
