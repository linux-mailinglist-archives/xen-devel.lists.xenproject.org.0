Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA288B058
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 08:59:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQjk-0004Uw-Oa; Tue, 13 Aug 2019 06:56:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hgkg=WJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hxQjj-0004Ty-1a
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:56:51 +0000
X-Inumbo-ID: 459acf9e-bcf5-11e9-a7f3-5f506ed91c5c
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 459acf9e-bcf5-11e9-a7f3-5f506ed91c5c;
 Mon, 12 Aug 2019 11:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565609723;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YIj8ehCpx7aydr4cgUYk/Ur7DFzl90qGZEqq5TzgxJc=;
 b=es91eSCIL3aPU3znnwoQDlDSbDh0rq25xafSM5gnNiaZa2SdGEJ3h6Gy
 HfYJWuol7wCKawgB26ZhRaODy1gcIH0Y6IKc9oTOeqxsa9z8v8n2SUKQ/
 KlvI235PZ/1SIQKczM0WJfdTMQyjvcGiGsB3DnIUll01afITr96gW2M+v c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: EtycUyuK/LoonguuGvc5KIaUJBEzt5yXMVdvaOrfbUKsFNuAif3XPuXeWemQavseUHDlxm9XO2
 EDJGaSil25JteJcXKKdQOUdpZXe7498iaZ386w5rYoVoRvjERAdxwUXUUPuD+iVrILZ/M3QoMd
 bvNGP80dhJ1OMEx5Ow473xYSKU5HAeWHVoGKzmX/j750wu3Av0rN5GS2geUJSe9d4gIt8E7yTG
 QyE4FhCyMUz9Lr3diYNtXcUfHPsiFoe0SYI+jYlv6VL0rzI+GHaRrRnoFuzRZA9yK4SYxqg0L6
 6sQ=
X-SBRS: 2.7
X-MesageID: 4347469
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4347469"
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>, "minios-devel@lists.xenproject.org"
 <minios-devel@lists.xenproject.org>, "mirageos-devel@lists.xenproject.org"
 <mirageos-devel@lists.xenproject.org>, "win-pv-devel@lists.xenproject.org"
 <win-pv-devel@lists.xenproject.org>
References: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com-0>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <32e7f4cd-78e9-dd43-a677-958d838f4f65@citrix.com>
Date: Mon, 12 Aug 2019 12:35:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <AB34D39A-A120-440E-9309-3950E7A465A5@citrix.com-0>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] Code of Conduct
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
Cc: "committers@xenproject.org" <committers@xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC85LzE5IDY6NDggUE0sIExhcnMgS3VydGggd3JvdGU6Cj4gSGkgYWxsLAo+IAo+IEZvbGxv
d2luZyB0aGUgZGlzY3Vzc2lvbiB3ZSBoYWQgYXQgdGhlIERldmVsb3BlciBTdW1taXQgKHNlZSBo
dHRwczovL3dpa2kueGVucHJvamVjdC5vcmcvd2lraS9EZXNpZ25fU2Vzc2lvbnNfMjAxOSNDb21t
dW5pdHlfSXNzdWVzXy4yRl9JbXByb3ZlbWVudHNfLV9Db21tdW5pY2F0aW9uLjJDX0NvZGVfb2Zf
Q29uZHVjdC4yQ19ldGMuIGZvciBub3RlcykgSSBwdXQgdG9nZXRoZXIgYSBkcmFmdCBmb3IgdGhl
IENvZGUgb2YgQ29uZHVjdCB3aGljaCBjYW4gYmUgZm91bmQgaGVyZSBhcyB3ZWxsIGFzIGlubGlu
ZWQgYmVsb3cKPiBodHRwczovL2RvY3MuZ29vZ2xlLmNvbS9kb2N1bWVudC9kLzFObldkVV9WbkMx
Tl9aenhRRzZqVTlmblkyR1BWQ2NmUEpUNUtZNjFXWEpNL2VkaXQ/dXNwPXNoYXJpbmcgCj4gCj4g
SXQgaXMgYmFzZWQgb24gdGhlIExGIEV2ZW50cyBDb0MgYXMgd2UgYWdyZWVkIG9uICh0aGUgZGlm
ZiBpcyBhdHRhY2hlZCkuIEkgdG9vayB0aGUgc2NvcGUgYW5kIGVuZm9yY2VtZW50IHNlY3Rpb25z
IGZyb20gaHR0cHM6Ly93d3cuY29udHJpYnV0b3ItY292ZW5hbnQub3JnL3ZlcnNpb24vMS80L2Nv
ZGUtb2YtY29uZHVjdC5odG1sIGFuZCBzaW1wbGlmaWVkIGl0IHJhdGhlciB0aGFuIGludmVudGlu
ZyBzb21ldGhpbmcgbmV3Lgo+IAo+IFlvdSBjYW4gcHJvdmlkZSBmZWVkYmFjayBieSBjb21tZW50
aW5nIG9uIHRoZSBnb29nbGUgZG9jIG9yIGJ5IHJlcGx5aW5nIHRvIHRoZSBpbi1saW5lZCB2ZXJz
aW9uIGJlbG93LiAKPiBJIGV4cGVjdCBpdCB3aWxsIHNvbWUgbW9yZSBkaXNjdXNzaW9uIHRvIGdl
dCBjb25zZW5zdXMuIAo+IAo+IE5vdGUgdGhhdCBJIGFtIG5vdCB2ZXJ5IGF0dGFjaGVkIHRvIHNv
bWUgb2YgdGhlIHRlcm1zLCBzdWNoIGFzICJYZW4gUHJvamVjdCBDb0MgIFRlYW0iIGFuZCBpbiBz
b21lIGNhc2VzICJwYXJ0aWNpcGFudCIgc2hvdWxkIHByb2JhYmx5IGJlIHJlcGxhY2VkIGJ5IGNv
bW11bml0eSAKPiBtZW1iZXJzLiAKPiAKPiBCdXQgSSBmZWx0LCB3ZSBzaG91bGQgaGF2ZSBzb21l
dGhpbmcgbW9yZSBjb25jcmV0ZSB0byBkaXNjdXNzIGNvbXBhcmVkIHRvIHByZXZpb3VzIGRpc2N1
c3Npb25zLgo+IAo+IEEgQ29kZSBvZiBDb25kdWN0IGlzIGEgcHJvamVjdCB3aWRlIHBvbGljeSBj
aGFuZ2U6IHRodXMsIGFsbCBzdWJwcm9qZWN0cyBsaXN0cyBhcmUgQ0MnZWQKClRoYW5rcyBmb3Ig
ZG9pbmcgdGhpcyBMYXJzLiAgSSB0aGluayB0aGlzIGlzIGEgc3RlcCBmb3J3YXJkLgoKSSBoYXZl
IGEgY291cGxlIG9mIGNvbW1lbnRzLCBidXQgb25seSBvbiB0aGUgd29yZGluZy4KCj4gCj4gUmVn
YXJkcwo+IExhcnMKPiAKPiBIZXJlIGlzIHRoZSBhY3R1YWwgdGV4dAo+IC0tLQo+ICMgT3VyIFBs
ZWRnZQo+IEluIHRoZSBpbnRlcmVzdCBvZiBmb3N0ZXJpbmcgYW4gb3BlbiBhbmQgd2VsY29taW5n
IGVudmlyb25tZW50LCB3ZSBhcyBjb21tdW5pdHkgCj4gbWVtYmVycyBvZiB0aGUgWGVuIFByb2pl
Y3QgcGxlZGdlIHRvIG1ha2luZyBwYXJ0aWNpcGF0aW9uIGluIG91ciBwcm9qZWN0IGFuZCBvdXIg
Cj4gY29tbXVuaXR5IGEgaGFyYXNzbWVudC1mcmVlIGV4cGVyaWVuY2UgZm9yIGV2ZXJ5b25lLgoK
VG8gbWUgInBsZWRnZSIgbWVhbnMgInByb21pc2UiOyBhbmQgSSBkb24ndCB0aGluayB3ZSBjYW4g
cHJvbWlzZSBhbnlvbmUKdGhhdCB0aGV5J2xsIGhhdmUgYSBoYXJhc3NtZW50LWZyZWUgZXhwZXJp
ZW5jZS4gIEkgbWlnaHQgc2F5LCAid2UgLi4uCmFyZSBjb21taXR0ZWQgdG8gbWFraW5nIHBhcnRp
Y2lwYXRpb24gLi4uIGEgaGFyYXNzbWVudC1mcmVlIGV4cGVyaWVuY2UiOwpvciAid2UgLi4uIHBs
ZWRnZSB0byBtYWludGFpbiBhIGhhcmFzc21lbnQtZnJlZSBleHBlcmllbmNlIiBvciBzb21ldGhp
bmcKbGlrZSB0aGF0LgoKPiAjIFVuYWNjZXB0YWJsZSBCZWhhdmlvcgo+IEhhcmFzc21lbnQgd2ls
bCBub3QgYmUgdG9sZXJhdGVkIGluIHRoZSBYZW4gUHJvamVjdCBDb21tdW5pdHkgaW4gYW55IGZv
cm0sIAo+IGluY2x1ZGluZyBidXQgbm90IGxpbWl0ZWQgdG8gaGFyYXNzbWVudCBiYXNlZCBvbiBn
ZW5kZXIsIGdlbmRlciBpZGVudGl0eSBhbmQgCj4gZXhwcmVzc2lvbiwgc2V4dWFsIG9yaWVudGF0
aW9uLCBkaXNhYmlsaXR5LCBwaHlzaWNhbCBhcHBlYXJhbmNlLCBib2R5IHNpemUsIHJhY2UsIAo+
IGFnZSwgcmVsaWdpb24sIGV0aG5pY2l0eSwgbmF0aW9uYWxpdHksIGxldmVsIG9mIGV4cGVyaWVu
Y2UsIGVkdWNhdGlvbiwgb3IgCj4gc29jaW8tZWNvbm9taWMgc3RhdHVzIG9yIGFueSBvdGhlciBz
dGF0dXMgcHJvdGVjdGVkIGJ5IGxhd3MgaW4ganVyaXNkaWN0aW9ucyBpbiAKPiB3aGljaCBjb21t
dW5pdHkgbWVtYmVycyBhcmUgYmFzZWQuCgo+IEhhcmFzc21lbnQgaW5jbHVkZXMgdGhlIHVzZSBv
ZiBhYnVzaXZlLCAKPiBvZmZlbnNpdmUgb3IgZGVncmFkaW5nIGxhbmd1YWdlLCBpbnRpbWlkYXRp
b24sIHN0YWxraW5nLCBoYXJhc3NpbmcgcGhvdG9ncmFwaHkgCj4gb3IgcmVjb3JkaW5nLCBpbmFw
cHJvcHJpYXRlIHBoeXNpY2FsIGNvbnRhY3QsIHNleHVhbCBpbWFnZXJ5IGFuZCB1bndlbGNvbWUg
Cj4gc2V4dWFsIGFkdmFuY2VzLCByZXF1ZXN0cyBmb3Igc2V4dWFsIGZhdm9ycywgcHVibGlzaGlu
ZyBvdGhlcnMnIHByaXZhdGUgCj4gaW5mb3JtYXRpb24gc3VjaCBhcyBhIHBoeXNpY2FsIG9yIGVs
ZWN0cm9uaWMgYWRkcmVzcyB3aXRob3V0IGV4cGxpY2l0IHBlcm1pc3Npb24gCj4gYW5kIG90aGVy
IGNvbmR1Y3Qgd2hpY2ggY291bGQgcmVhc29uYWJseSBiZSBjb25zaWRlcmVkIGluYXBwcm9wcmlh
dGUgaW4gYSAKPiBwcm9mZXNzaW9uYWwgc2V0dGluZy4gCgpTaG91bGQgd2UgcHV0ICJzdWNoIGFz
IHBoeXNpY2FsIG9yIGVsZWN0cm9uaWMgYWRkcmVzc1tlc10iIGluIHBhcmVudGhlc2VzPwoKQWxz
bywgSSdtIGluIGZhdm9yIG9mIHRoZSBPeGZvcmQgQ29tbWEgKHNvIGEgY29tbWEgYWZ0ZXIgJ3Bl
cm1pc3Npb24nKS4KCkkgbWlnaHQgc2F5ICJvciBhbnkgb3RoZXIgY29uZHVjdCI7IGZvciBzb21l
IHJlYXNvbiBpdCBzb3VuZHMgbW9yZQpuYXR1cmFsIHRvIG1lLgoKPiBBbnkgcmVwb3J0IG9mIGhh
cmFzc21lbnQgd2l0aGluIHRoZSBYZW4gUHJvamVjdCBjb21tdW5pdHkgd2lsbCBiZSBhZGRyZXNz
ZWQgCj4gc3dpZnRseS4gUGFydGljaXBhbnRzIGFza2VkIHRvIHN0b3AgYW55IGhhcmFzc2luZyBi
ZWhhdmlvciBhcmUgZXhwZWN0ZWQgdG8gCj4gY29tcGx5IGltbWVkaWF0ZWx5LiBBbnlvbmUgd2hv
IHdpdG5lc3NlcyBvciBpcyBzdWJqZWN0ZWQgdG8gdW5hY2NlcHRhYmxlIAo+IGJlaGF2aW9yIHNo
b3VsZCBub3RpZnkgdGhlIFhlbiBQcm9qZWN04oCZcyBDb0MgdGVhbSB2aWEgY29uZHVjdEB4ZW5w
cm9qZWN0Lm9yZy4KPiAKPiAjIENvbnNlcXVlbmNlcyBvZiBVbmFjY2VwdGFibGUgQmVoYXZpb3IK
PiBJZiBhIHBhcnRpY2lwYW50IGVuZ2FnZXMgaW4gaGFyYXNzaW5nIGJlaGF2aW9yLCB0aGUgWGVu
IFByb2plY3TigJlzIENvQyB0ZWFtIG1heSAKPiB0YWtlIGFueSBhY3Rpb24gaXQgZGVlbXMgYXBw
cm9wcmlhdGUsIHJhbmdpbmcgZnJvbSBpc3N1YW5jZSBvZiBhIHdhcm5pbmcgdG8gdGhlIAo+IG9m
ZmVuZGluZyBpbmRpdmlkdWFsIHRvIGV4cHVsc2lvbiBmcm9tIHRoZSBYZW4gUHJvamVjdCBjb21t
dW5pdHkuCgpJIHJlYWxpemUgYnkgc2F5aW5nICJyYW5nZSIgeW91IHByb2JhYmx5IG1lYW50IHRv
IGluY2x1ZGUgdGhpcywgYnV0IEkKdGhpbmsgc3BlbGxpbmcgb3V0ICJ0ZW1wb3Jhcnkgc3VzcGVu
c2lvbiIgYXMgYSBwb3NzaWJsZSBjb25zZXF1ZW5jZS4gIEUuZy46CgoiSWYgYSBwYXJ0aWNpcGFu
dCBlbmdhZ2VzIGluIGhhcmFzc2luZyBiZWhhdmlvciwgdGhlIFhlbiBQcm9qZWN0J3MgQ29DCnRl
YW0gd2lsbCBpbnZlc3RpZ2F0ZSBhbmQgdGFrZSBhbiBhY3Rpb24gaXQgZGVlbXMgYXBwcm9wcmlh
dGUgYWdhaW5zdAp0aGUgb2ZmZW5kaW5nIGluZGl2aWR1YWwuICBUaGlzIG1heSBpbmNsdWRlIGlz
c3VpbmcgYSB3YXJuaW5nLCB0ZW1wb3JhcnkKc3VzcGVuc2lvbiBmcm9tIG1haWxpbmcgbGlzdHMg
b3IgY29tbWl0IHJpZ2h0cywgb3IgZXhwdWxzaW9uIGZyb20gdGhlClhlblByb2plY3QgY29tbXVu
aXR5LiIKClRoYXQncyBhbGwgSSBoYWQ7IHRoYW5rcyBhZ2FpbiwgTGFycy4KCiAtR2VvcmdlCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
