Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AEA10C94A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 14:12:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaJYk-0006xY-UA; Thu, 28 Nov 2019 13:10:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FDGh=ZU=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iaJYj-0006xP-CY
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 13:10:13 +0000
X-Inumbo-ID: 694ee642-11e0-11ea-a55d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 694ee642-11e0-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 13:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574946612;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ggGnXVd1YPb9mhd8wxazhsINWw9qq1m1AJ04RcK+7jI=;
 b=KTlA4O3dPKCjhpSHDBpNEqFCTPSnK5JZ3UjZD1/yTm0+LXMn67Sv3/ax
 VJizO8/pNbxRtpp33mRNi3XTpm6TFL2Z0L8/+YHGz3ogBqDxxvorfFNJ9
 AHq7rmsmP2w3Q8tyW4jG//0pgfAoxB62Sz47+bKxr13ofPozg+5Z+r5Lh 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7ZJVxPh80TJqYyMVS8cvHv4wMePLnO44tQ5AzdidzGA3dcRM1ZbNYu9DYgbqaqtyTMujSksx+g
 NX2iLpTluE8mL56Y3JpOOQcOcAaHPqb1HX+tJb8qiUakO4jW5YmLZUKGxo5BxBP/CXqwJKSDBN
 cCuTzdFDn2yUAozhMO+fdrFFHTe8AoVG2i5bIiTc/klxYBrutfe36vZV39QUHf2xwrr0AwDAI4
 JsgC0ZBro43WcRyYrDvEhsIT39ND6rNjMMFZ5IeRWDnG/fV28MPA43v0B8kfN3vN40ZEqSmhns
 Ll8=
X-SBRS: 2.7
X-MesageID: 9365115
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="9365115"
To: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <7e28eb9e-f15a-af61-aad5-1ea80876fbe3@suse.com>
 <41a60a35-3413-5e33-47ea-60a8864224e1@suse.com>
 <4c2222e1-23b7-609d-1a72-7ee193182815@suse.com>
 <cb0c6279-278f-e037-53ef-e5514742842e@citrix.com>
 <8149ffd4-3b6f-df12-3de5-8e64419e3b78@suse.com>
 <0abb0ca5-82b9-7d59-00c0-5a9e0ddfb572@citrix.com>
 <bba7474f-a9f7-0486-627d-16841436714a@suse.com>
 <8406B39C-7C6B-47CE-865D-76E591AEBB1E@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a6682041-3a08-d003-27d3-8f7117300876@citrix.com>
Date: Thu, 28 Nov 2019 13:10:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8406B39C-7C6B-47CE-865D-76E591AEBB1E@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Ping: [PATCH v2] build: provide option to
 disambiguate symbol names
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 WeiLiu <wl@xen.org>, KonradWilk <konrad.wilk@oracle.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjgvMTEvMjAxOSAxMDoxNywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gTm92IDI4LCAy
MDE5LCBhdCA5OjU1IEFNLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+
Pj4+PiBIYXMgYW55b25lIGFjdHVhbGx5IHRyaWVkIGJ1aWxkaW5nIGEgbGl2ZXBhdGNoIHdpdGgg
dGhpcyBjaGFuZ2UgaW4gcGxhY2U/Cj4+Pj4gQWN0dWFsbHkgLSB3aGF0IGlzIHlvdXIgY29uY2Vy
biBoZXJlPyBUaGUgZXhhY3Qgc3BlbGxpbmcgb2Ygc3ltYm9scwo+Pj4+IG5hbWVzIHNob3VsZCBi
ZSBvZiBubyBpbnRlcmVzdCB0byB0aGUgdG9vbC4gQWZ0ZXIgYWxsIHRoZSBjb21waWxlciBpcwo+
Pj4+IGZyZWUgdG8gaW52ZW50IGFsbCBzb3J0cyBvZiBuYW1lcyBmb3IgaXRzIGxvY2FsIHN5bWJv
bHMsIGluY2x1ZGluZwo+Pj4+IHRoZSBvbmVzIHdlIHdvdWxkIHByb2R1Y2Ugd2l0aCB0aGlzIGNo
YW5nZSBpbiBwbGFjZS4gQWxsIHRoZSB0b29sCj4+Pj4gY2FyZXMgYWJvdXQgaXMgdGhhdCB0aGUg
bmFtZXMgYmUgdW5hbWJpZ3VvdXMuIEhlbmNlIGFueSAodGhlb3JldGljYWwpCj4+Pj4gcmVncmVz
c2lvbiBoZXJlIHdvdWxkIGJlIGEgYnVnIGluIHRoZSB0b29scywgd2hpY2ggaW1vIGlzIG5vIHJl
YXNvbgo+Pj4+IHRvIGRlbGF5IHRoaXMgY2hhbmdlIGFueSBmdXJ0aGVyLiAoR3JhbnRlZCBJIHNo
b3VsZCBoYXZlIGdvdCB0byBpdAo+Pj4+IGVhcmxpZXIsIGJ1dCBpdCBoYWQgYmVlbiBjb250aW51
aW5nIHRvIGdldCBkZWZlcnJlZC4pCj4+PiBUaGlzIG1pZ2h0IGFsbCBiZSB0cnVlICh0aGVvcmV0
aWNhbGx5KS4KPj4+Cj4+PiBUaGUgbGl2ZXBhdGNoIGJ1aWxkIHRvb2xzIGFyZSBmcmFnaWxlIGFu
ZCB2ZXJ5IHNlbnNpdGl2ZSB0byBob3cgdGhlCj4+PiBvYmplY3QgZmlsZXMgYXJlIGxhaWQgb3V0
LiAgVGhlcmUgaXMgYSB2ZXJ5IHJlYWwgcmlzayB0aGF0IHRoaXMgY2hhbmdlCj4+PiBhY2NpZGVu
dGFsbHkgYnJlYWtzIGxpdmVwYXRjaGluZyB0b3RhbGx5LCBldmVuIG9uIEdDQyBidWlsZHMuCj4+
Pgo+Pj4gV2VyZSB0aGlzIHRvIGhhcHBlbiwgaXQgd291bGQgYmUgeWV0IGFub3RoZXIgNC4xMyBy
ZWdyZXNzaW9uLgo+PiBJdCdzIHBlcmhhcHMgYSBtYXR0ZXIgb2YgcGVyY2VwdGlvbiwgYnV0IEkn
ZCBzdGlsbCBjYWxsIHRoaXMgYQo+PiBsaXZlIHBhdGNoaW5nIHRvb2xzIGJ1ZyB0aGVuLCBub3Qg
YSA0LjEzIHJlZ3Jlc3Npb24uCj4gQWZ0ZXIgdGhlIGRpc2N1c3Npb24geWVzdGVyZGF5LCBJIHdh
cyB0aGlua2luZyBhIGJpdCBtb3JlIGFib3V0IHRoaXMsIGFuZCBJ4oCZbSBub3QgaGFwcHkgd2l0
aCB0aGUgcHJpbmNpcGxlIEFuZHkgc2VlbXMgdG8gYmUgb3BlcmF0aW5nIG9uLAoKSSdtIHNvcnJ5
IHRoYXQgeW91IGZlZWwgdGhhdCB3YXkuCgo+IHRoYXQgaXTigJlzIHJlYXNvbmFibGUgdG8gY29t
cGxldGVseSBibG9jayBhIGJ1Zy1maXhpbmcgcGF0Y2ggdG8gWGVuLCBmb3JjaW5nIGEgd29yay1h
cm91bmQgdG8gYmUgdXNlZCBpbiBhIHJlbGVhc2UsIGJlY2F1c2UgaXQgaGFzIHVua25vd24gZWZm
ZWN0cyBvbiBsaXZlcGF0Y2hpbmcuCgpUaGlzIGlzIG5vdCBhIGZhaXIgY2hhcmFjdGVyaXNhdGlv
biBvZiB3aGF0IGlzIGdvaW5nIG9uIGhlcmUuwqAgSWdub3JlCnRoZSBzcGVjaWZpY3Mgb2YgdGhp
cyBwYXRjaCAtIHRoZXkgYXJlIG5vdCByZWxldmFudCB0byBteSBvYmplY3Rpb24uCgpBcyBhIG1h
aW50YWluZXIsIGl0IGlzIG15IHJlc3BvbnNpYmlsaXR5IHRvIGVuc3VyZSB0aGF0IGNyYXAgZG9l
c24ndCBnZXQKY29tbWl0dGVkLgoKQXMgYSBjb25zZXF1ZW5jZSwgaXQgaXMgdXAgdG8gbWUgdG8g
anVkZ2Ugd2hldGhlciBJIGJlbGlldmUgdGhhdCB0aGUKc3VibWl0dGVyIG9mIGEgcGF0Y2ggaGFz
IHByb3ZpZGVkIGFkZXF1YXRlIHRob3VnaHQvdGVzdGluZyB0byB3aGF0IHRoZXkKYXJlIGNoYW5n
aW5nLsKgIE1vc3RseSB0aGlzIGlzIGp1ZGdlZCBvbiBjb21tZW50cyBwcm92aWRlZCAob3IgdXN1
YWxseSwKdGhlaXIgYWJzZW5jZSksIHdlaWdoZWQgdXAgYWdhaW5zdCB0aGUgcmlzayBvZiB3aGF0
IGl0IG1pZ2h0IGJlIGxpa2VseQp0byBicmVhay4KCkluIHRoZSBjYXNlIHRoYXQgSSBkb24ndCBi
ZWxpZXZlIGFkZXF1YXRlIHRocm91Z2gvdGVzdGluZy9ldGMgaGFzIGJlZW4KZG9uZSwgSSdtIG5v
dCBnb2luZyB0byBhY2sgdGhlIHBhdGNoLsKgIEknZCBiZSBmYWlsaW5nIGFzIGEgbWFpbnRhaW5l
ciBpZgpJIGRpZC4KCkVyZ28sIEkgYW0gbm90IGluY2xpbmVkIHRvIGNoYW5nZSBteSBwb3NpdGlv
bi4KCgpJbiB0aGlzIGNhc2UsIGFsbCBJIGFza2VkIHdhcyAiaGFzIGFueW9uZSBkb25lIGEgbGl2
ZXBhdGNoIGJ1aWxkPyIKCkknZCBiZSBlbnRpcmVseSBoYXBweSB3aXRoIGEgcmVwbHkgb2YgInll
cyBbSSBvciBzb21lb25lIGVsc2UgZGlkXSBhbmQKaXQgc2VlbXMgb2siLgoKSSdkIGV2ZW4gYmUg
aGFwcHkgd2l0aCAiVGhlcmUgZG9lcyBzZWVtIHRvIGJlIGFuIGlzc3VlIHdpdGgKbGl2ZXBhdGNo
aW5nLCBidXQgSSd2ZSBlbmdhZ2VkIHRoZSByZWxldmFudCBwZW9wbGUgaW4gdGhpcyBvdGhlciB0
aHJlYWQiLgoKV2hhdCBJJ20gbm90IGhhcHB5IHdpdGggaXMgIkkgaGF2ZW4ndCBldmVuIGRvbmUg
YSBzaW5nbGUgYnVpbGQgdG8gc2VlCndoZXRoZXIgaXQgbWlnaHQgaGF2ZSBwcm9ibGVtcyIsIGFu
ZCB3aGF0IGlzIGRlZmluaXRlbHkgbm90IGFjY2VwdGFibGUKaXMsIGFuZCBJIHF1b3RlOgoKPiBB
bmQgSSBkbyBub3QgY29uc2lkZXIgaXQgbXkgcmVzcG9uc2liaWxpdHkgdG8KPiBkbyByZWdyZXNz
aW9uIHRlc3RzIG9mIHRoZSBsaXZlIHBhdGNoaW5nIHRvb2xzLgoKWWVzLsKgIFllcyBpdCByZWFs
bHkgaXMsIHdoZW4geW91J3JlIG1ha2luZyBhIG1hdGVyaWFsIGNoYW5nZQpzcGVjaWZpY2FsbHkg
dG8gdGhpcyBhcmVhLCB3aXRoIGEgaGlnaCBjaGFuY2Ugb2YgYWR2ZXJzZSBpbXBhY3QuCgpJIGRv
bid0IGV4cGVjdCB5b3UgbmVjZXNzYXJpbHkgdG8gZml4IHRoZSBpc3N1ZSwgYnV0IEkgZG8gZXhw
ZWN0IHlvdSB0bwpoYXZlIHNvbWUgaWRlYSBvZiB3aGV0aGVyIHlvdSdyZSB0cmFkaW5nIG9uZSA0
LjEzIGJsb2NrZXIgZm9yIGEKZGlmZmVyZW50IG9uZS4KCj4+ICBJZiB0aGV5J3JlIHNvCj4+IGV4
dHJlbWVseSBmcmFnaWxlLCB0aGVuIEkgdGhpbmsgdGhpcyBuZWVkcyB1cmdlbnRseSB0YWtpbmcg
Y2FyZSBvZgo+PiBieSB0aGVpciBtYWludGFpbmVycy4gQXMgbWVudGlvbmVkIGJlZm9yZSAtIGhv
dyBleGFjdGx5IHN0YXRpYwo+PiBzeW1ib2xzIGdldCByZXByZXNlbnRlZCBpcyB1cCB0byB0aGUg
Y29tcGlsZXIsIGkuZS4gbWF5IGNoYW5nZSBhdAo+PiBhbnkgdGltZS4gQXMgYSByZXN1bHQsIGFu
eSBjaGFuZ2Ugd2hhdHNvZXZlciB3b3VsZCBuZWVkIHN1Y2gKPj4gcmVncmVzc2lvbiB0ZXN0aW5n
LCBubyBtYXR0ZXIgdGhhdCBJIGFncmVlIHRoYXQgYSBsYXJnZXIgc2NvcGUKPj4gY2hhbmdlIGxp
a2UgdGhpcyBvbmUgaGFzIHNsaWdodGx5IGhpZ2hlciBwb3RlbnRpYWwgb2YgdHJpZ2dlcmluZwo+
PiBzb21lIGlzc3VlLgo+IFRoaXMgaXMgYW5vdGhlciBhcmd1bWVudCBJIHdvdWxkIGFncmVlIHdp
dGguCj4KPiBHaXZlbiB0aGUgY2xvc2VuZXNzIHRvIHRoZSByZWxlYXNlLCBJ4oCZZCBmYXZvciBj
aGVja2luZyBpbiB0aGUgcGF0Y2ggdG9kYXkgb3IgdG9tb3Jyb3csIHJlZ2FyZGxlc3Mgb2YgdGVz
dGluZyBzdGF0dXMsIHNvIHRoYXQgaXQgY2FuIGdldCBtb3JlIHRlc3RpbmcgaW4gb3VyIGF1dG9t
YXRlZCBzeXN0ZW1zOyBpdCBjYW4gYWx3YXlzIGJlIHJldmVydGVkIGlmIGl0IGlzIHNob3duIHRv
IGJyZWFrIGxpdmVwYXRjaGluZyBvbiBnY2MuCgpPaCwgYW5kIHNob2NrZXIgaW4gd2hhdCBpcyBh
cHBhcmVudGx5IGEgc3VycHJpc2UgdG8gZXZlcnlvbmUgYnV0IG1lLi4uCgpTZXJnZXkgd2VudCBh
bmQgZGlkIHRoZSB3b3JrIEphbiBiZWxpZXZlZCB0byBiZSAibm90IGhpcwpyZXNwb25zaWJpbGl0
eSIsIGFuZCB5ZXMgLSB0aGlzIHJlYWxseSBkb2VzIGJyZWFrIGxpdmVwYXRjaGluZy4KCkRvIEkg
ZXhwZWN0IEphbiB0byBmaXggaXQ/wqAgTm8sIGJ1dCBJIGRvIGV4cGVjdCBhIGRpc2N1c3Npb24g
YW5kIGFuCnVuZGVyc3RhbmRpbmcgb2YgdGhlIGlzc3VlIGJlZm9yZSB0aGlzIHBhdGNoIGdldHMg
YW55d2hlcmUgbmVhciBzdGFnaW5nLgoKfkFuZHJldywgcXVpdGUgaXJyaXRhdGVkIGF0IHRoZSB0
b3RhbCBsYWNrIG9mIGR1ZSBkaWxpZ2VuY2UgYmVpbmcKZGVtb25zdHJhdGVkIGhlcmUuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
