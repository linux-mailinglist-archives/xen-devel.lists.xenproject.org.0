Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8107E31769
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2019 01:05:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWqWv-0000iY-KF; Fri, 31 May 2019 23:01:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zAi+=T7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hWqWt-0000iN-Jf
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 23:01:43 +0000
X-Inumbo-ID: 0c56a036-83f8-11e9-b638-eb18405e49a0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c56a036-83f8-11e9-b638-eb18405e49a0;
 Fri, 31 May 2019 23:01:40 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: /i4Ou4TjwcqsYrRod8BHkOXQGSTgev4DIPNF1Ky54EoaMub/1BJxkLBLk0CvfZJlyHHXeX/DIg
 7GC2jBg1pvPyb8Xm6Qi1kL6qXflInZniBhwq2Ye07d3B2PNWSUppdtE0hkvbBSS+3LEBY+GEen
 N/MvTjPz3Y6KxHq3X0Z7rHPcxKvv6RrMFeuyOalrgu37QVtTw05EJCiZUxup1D7KhLIdZ8ujlT
 Ct8aJk/mb5Vh9p7/r8qyIVZUIvB8Qs4qw3Up7l9TJOSrO2lfRhfR6Rmw8LiURyZr4XFen5F7cn
 4hU=
X-SBRS: 2.7
X-MesageID: 1184992
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,536,1549947600"; 
   d="scan'208";a="1184992"
To: Petre Pircalabu <ppircalabu@bitdefender.com>,
 <xen-devel@lists.xenproject.org>
References: <cover.1559224640.git.ppircalabu@bitdefender.com>
 <a7acd18a3c4bcd288338de12d13ce1cb9fb6d8b2.1559224640.git.ppircalabu@bitdefender.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <9119ed35-e90c-c91e-2138-e2f9afa17d6f@citrix.com>
Date: Fri, 31 May 2019 16:01:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a7acd18a3c4bcd288338de12d13ce1cb9fb6d8b2.1559224640.git.ppircalabu@bitdefender.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/9] tools/libxc: Consistent usage of
 xc_vm_event_* interface
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDUvMjAxOSAwNzoxOCwgUGV0cmUgUGlyY2FsYWJ1IHdyb3RlOgo+IE1vZGlmaWVkIHhj
X21lbV9wYWdpbmdfZW5hYmxlIHRvIHVzZSBkaXJlY3RseSB4Y192bV9ldmVudF9lbmFibGUgYW5k
Cj4gbW92ZWQgdGhlIHJpbmdfcGFnZSBoYW5kbGluZyBmcm9tIGNsaWVudCB0byBsaWJ4YyAoeGVu
cGFnaW5nKS4KPgo+IFJlc3RyaWN0ZWQgdm1fZXZlbnRfY29udHJvbCB1c2FnZSBvbmx5IHRvIHNp
bXBsZXN0IGRvbWN0bHMgd2hpY2ggZG8KPiBub3QgZXhwZWN0IGFueSByZXR1cm4gdmFsdWVzIGFu
ZCBjaGFuZ2UgeGNfdm1fZXZlbnRfZW5hYmxlIHRvIGNhbGwgZG9fZG9tY3RsCj4gZGlyZWN0bHku
Cj4KPiBSZW1vdmVkIHhjX21lbXNocl9yaW5nX2VuYWJsZS9kaXNhYmxlIGFuZCB4Y19tZW1zaHJf
ZG9tYWluX3Jlc3VtZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNh
bGFidUBiaXRkZWZlbmRlci5jb20+Cj4gLS0tCj4gIHRvb2xzL2xpYnhjL2luY2x1ZGUveGVuY3Ry
bC5oIHwgNDkgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHRvb2xzL2xpYnhj
L3hjX21lbV9wYWdpbmcuYyAgIHwgMjMgKysrKystLS0tLS0tLS0tLQo+ICB0b29scy9saWJ4Yy94
Y19tZW1zaHIuYyAgICAgICB8IDM0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHRvb2xzL2xp
YnhjL3hjX21vbml0b3IuYyAgICAgIHwgMzEgKysrKysrKysrKysrKysrKystLS0tCj4gIHRvb2xz
L2xpYnhjL3hjX3ByaXZhdGUuaCAgICAgIHwgIDIgKy0KPiAgdG9vbHMvbGlieGMveGNfdm1fZXZl
bnQuYyAgICAgfCA2NCArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIHRvb2xzL3hlbnBhZ2luZy94ZW5wYWdpbmcuYyAgIHwgNDIgKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQoKU28sIHRoZSBkaWZmc3RhdCBoZXJlIGlzIHZlcnkgaW1wcmVzc2l2ZSwgYW5k
IGp1ZGdpbmcgYnkgdGhlIGRlbHRhLCBpdHMKYWxsIGFib3V0IG5vdCBvcGVuY29kaW5nIHRoZSB1
c2Ugb2YgdGhlIEhWTV9QQVJBTSBpbnRlcmZhY2UuwqAgT3ZlcmFsbCwKdGhpcyBpcyBjbGVhcmx5
IGEgZ29vZCB0aGluZy4KCkhvd2V2ZXIsIGl0IGlzIHF1aXRlIGRpZmZpY3VsdCB0byBmb2xsb3cg
ZXhhY3RseSB3aGF0IGlzIGdvaW5nIG9uLgoKQUZBSUNULCB0aGlzIHdhbnRzIHNwbGl0dGluZyBp
bnRvICROIHBhdGNoZXMuCgpPbmUgcGF0Y2ggc2hvdWxkIHJlZmFjdG9yIHhjX21lbV9wYWdpbmdf
ZW5hYmxlKCkgdG8gdXNlCnhjX3ZtX2V2ZW50X2VuYWJsZSgpLCB3aXRoIHRoZSBhc3NvY2lhdGVk
IHhlbnBhZ2luZyBjbGVhbnVwLgoKT25lIHBhdGNoIHNob3VsZCBiZSB0aGUgZGVsZXRpb24gb2Yg
eGNfbWVtc2hyXyogb24gaXRzIG93biwgYmVjYXVzZQpBRkFJQ1QgaXQgaXMgYW4gaXNvbGF0ZWQg
Y2hhbmdlLsKgIEl0IGFsc28gbmVlZHMgc29tZSBqdXN0aWZpY2F0aW9uLCBldmVuCmlmIGl0IGlz
ICJpbnRlcmZhY2UgaXMgdW51c2VkIGFuZC9vciByZWR1bmRhbnQgd2l0aCAkWCIuCgpPbmUgcGF0
Y2ggKGFsb25lKSBzaG91bGQgYmUgdGhlIHJlcG9zaXRpb25pbmcgb2YgdGhlIGRvbWFpbl9wYXVz
ZSgpCmNhbGxzLsKgIFRoaXMgZG9lcyBjZXJ0YWlubHkgbG9vayBsaWtlIGEgdmFzdCBpbXByb3Zl
bWVudCBXUlQgZXJyb3IKaGFuZGxpbmcgaW4geGNfdm1fZXZlbnRfZW5hYmxlKCksIGJ1dCB5b3Un
dmUgZGVmaW5pdGVseSBjaGFuZ2VkIHRoZSBBUEkKKGluc29mYXIgYXMgdGhlIGV4cGVjdGF0aW9u
IHRoYXQgdGhlIGNhbGxlciBoYXMgcGF1c2VkIHRoZSBkb21haW4pIGdvZXMsCmFuZCBpdHMgbm90
IGF0IGFsbCBvYnZpb3VzIHRoYXQgdGhpcyBjaGFuZ2UgaXMgc2FmZS7CoCBJdCBtYXkgdmVyeSB3
ZWxsCmJlLCBidXQgeW91IG5lZWQgdG8gY29udmluY2UgcGVvcGxlIGFzIHRvIHdoeSBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2UuCgoKSSBzdGlsbCBoYXZlbid0IGZpZ3VyZWQgb3V0IHdoYXQgdGhlIHB1
cnBvc2UgYmVoaW5kIGRyb3BwaW5nIHRoZSBwb3J0CnBhcmFtZXRlciBmcm9tIHhjX3ZtX2V2ZW50
X2NvbnRyb2woKSBpcy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
