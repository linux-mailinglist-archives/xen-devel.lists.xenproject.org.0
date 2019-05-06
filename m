Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DC41503B
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 17:29:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNfW1-0007SK-3u; Mon, 06 May 2019 15:26:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IX9s=TG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hNfVz-0007S7-EJ
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 15:26:51 +0000
X-Inumbo-ID: 5d0dab58-7013-11e9-975c-53dbcdc262a4
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5d0dab58-7013-11e9-975c-53dbcdc262a4;
 Mon, 06 May 2019 15:26:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1AD5A78;
 Mon,  6 May 2019 08:26:47 -0700 (PDT)
Received: from [10.37.12.89] (unknown [10.37.12.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A87023F575;
 Mon,  6 May 2019 08:26:46 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1905031347520.3722@sstabellini-ThinkPad-X260>
 <1556916614-21512-3-git-send-email-sstabellini@kernel.org>
 <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4d68ea2c-ee87-6ae4-41d5-502bf475bdb4@arm.com>
Date: Mon, 6 May 2019 16:26:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CCFF915020000780022C158@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] xen/arm: fix mask calculation in
 init_pdx
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNS82LzE5IDEwOjA2IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAw
My4wNS4xOSBhdCAyMjo1MCwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+PiBA
QCAtNDgxLDEwICs0ODEsMTUgQEAgc3RhdGljIHBhZGRyX3QgX19pbml0IG5leHRfbW9kdWxlKHBh
ZGRyX3QgcywgcGFkZHJfdCAqZW5kKQo+PiAgIHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X3BkeCh2
b2lkKQo+PiAgIHsKPj4gICAgICAgcGFkZHJfdCBiYW5rX3N0YXJ0LCBiYW5rX3NpemUsIGJhbmtf
ZW5kOwo+PiAtCj4+IC0gICAgdTY0IG1hc2sgPSBwZHhfaW5pdF9tYXNrKGJvb3RpbmZvLm1lbS5i
YW5rWzBdLnN0YXJ0KTsKPj4gKyAgICB1NjQgbWFzazsKPj4gICAgICAgaW50IGJhbms7Cj4+ICAg
Cj4+ICsgICAgLyoKPj4gKyAgICAgKiBXZSBhbHdheXMgbWFwIHRoZSBmaXJzdCAxPDxNQVhfT1JE
RVIgb2YgUkFNLCBoZW5jZSwgdGhleSBhcmUgbGVmdAo+IAo+ICIuLi4gcGFnZXMgb2YgUkFNLiIg
Pwo+IAo+PiArICAgICAqIHVuY29tcHJlc3NlZC4KPj4gKyAgICAgKi8KPj4gKyAgICBtYXNrID0g
cGR4X2luaXRfbWFzaygxVUxMIDw8IChNQVhfT1JERVIgKyBQQUdFX1NISUZUKSk7Cj4gCj4gUEFH
RV9TSVpFIDw8IE1BWF9PUkRFUj8KCkhtbW0sIEkgYW0gbm90IGVudGlyZWx5IGNvbnZpbmNlIHRo
aXMgd2lsbCBnaXZlIHRoZSBjb3JyZWN0IHZhbHVlIApiZWNhdXNlIFBBR0VfU0laRSBpcyBkZWZp
bmVkIGFzIChfQUMoMSwgTCkgPDwgUEFHRV9TSElGVC4KCj4gCj4gSSB3b25kZXIgd2hldGhlciBw
ZHhfaW5pdF9tYXNrKCkgaXRzZWxmIHdvdWxkbid0IGJldHRlciBhcHBseSB0aGlzCj4gKGxvd2Vy
KSBjYXAKCkRvIHlvdSBtZWFuIGFsd2F5cyByZXR1cm5pbmcgKFBBR0VfU0laRSA8PCBNQVhfT1JE
RVIpIG9yIGNhcHBpbmcgdGhlIAppbml0IG1hc2s/CgpOb3RlIHRoYXQgdGhlIGxhdGVyIHdpbGwg
bm90IHByb2R1Y2UgdGhlIHNhbWUgYmVoYXZpb3IgYXMgdGhpcyBwYXRjaC4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
