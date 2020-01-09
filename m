Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D45B3136157
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 20:46:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipdi7-0003BA-MX; Thu, 09 Jan 2020 19:43:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dp4R=26=kojedz.in=richard@srs-us1.protection.inumbo.net>)
 id 1ipdg3-00038Q-Tq
 for xen-devel@lists.xen.org; Thu, 09 Jan 2020 19:41:08 +0000
X-Inumbo-ID: f79b2980-3317-11ea-b89f-bc764e2007e4
Received: from pi.kojedz.in (unknown [2a01:be00:10:201:0:80:0:1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f79b2980-3317-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 19:41:02 +0000 (UTC)
Received: from webmail.srv.kojedz.in (pi.kojedz.in
 [IPv6:2a01:be00:10:201:0:80:0:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: richard@kojedz.in)
 by pi.kojedz.in (Postfix) with ESMTPSA id 6F5E7A0FA
 for <xen-devel@lists.xen.org>; Thu,  9 Jan 2020 20:41:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kojedz.in; s=mail;
 t=1578598860; bh=ZkZsbT9LWCNL86RMv1+8kOBo7RhAa0fmY+XSHLzni1w=;
 h=Date:From:To:Subject;
 b=p0zOKgXPMMQztfms6tmMpkS5zN5D61XaWikQ67EpH3DYYg/MzK10VdugIK9AJQ6eS
 0IkokOKfiwpkeB6Z+nlbVeq8dC2AGdzXx/EUBXTPXy7nuqQu2qwdejtmawPnUU9W2A
 sHeJKMoZEOZxlnhMVVXGgJbKZR2fXjsxjJhVHvym/hO5nAeUEGaa0t49LNmAaURLyZ
 +r0D4mwREZ49goF/4lbtfv4KWApfEux8M+goqRT2qiNoAzKstdrqumADXzqlZ5GUYq
 ufki+oy3utnNSwDvi6CUEP+7CDARxTd32r/2oQrN8RzHyNm5OL9UVL8yVLz/aEqK0C
 IkEbbAjie/KH22bSTLpj7r7edQzYpmLND6FHDRJYFUckMqEklCVBsaBqDNIsm2Tche
 v7OIVE6vYhnGc8utX70q9w+9kQ+nTmzmRWYQryBrga3zMCwK8VCDNNFr4pUDc7qXoN
 SF+GqJbi1bye5YPBb4VWeQkWzY4BYM3mWaN46k18dm5N16rfdtgKBo35ubv+XHiQfl
 M4E6pneuEKXd33sHcmaElxBfUj529vmsHDGu4Bqp72iF02ls96bd0zVAOuN/Z+b8zN
 B3V57hw/wg6CcZkqN24DaSCg7+Wj4ZR35fiAVLNopYzlK3j4mqP4BRrZfAPlZkRI0R
 jjwbKv9QLWqUjP7AsrKVN7Ok=
MIME-Version: 1.0
Date: Thu, 09 Jan 2020 20:40:59 +0100
From: Richard Kojedzinszky <richard@kojedz.in>
To: xen-devel@lists.xen.org
Message-ID: <58431af1ddf1e33711c9850c715cd9cb@kojedz.in>
X-Sender: richard@kojedz.in
User-Agent: Roundcube Webmail/1.3.8
X-Mailman-Approved-At: Thu, 09 Jan 2020 19:43:14 +0000
Subject: [Xen-devel] [BUG] xenstat_vcpu_ns returns invalid value
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBYZW4gRGV2cywKCmNvbW1pdCAyNTI5Yzg1MGVhNDhmMDM2NzI3Y2EyZjE0OGNhZWQ4OTM5
MTMxMWI4IGludHJvZHVjZXMgdGhlIApYRU5fUlVOU1RBVEVfVVBEQVRFIG1hcmtlciBiaXQsIHdo
aWNoIGlzIG5vdCBoYW5kbGVkIGluCnZjcHVfcnVuc3RhdGVfZ2V0KCkgaW4geGVuL2NvbW1vbi9z
Y2hlZHVsZS5jLiBSZWxldmFudCBjb2RlOgoKICAgICBkZWx0YSA9IE5PVygpIC0gcnVuc3RhdGUt
PnN0YXRlX2VudHJ5X3RpbWU7CiAgICAgaWYgKCBkZWx0YSA+IDAgKQogICAgICAgICBydW5zdGF0
ZS0+dGltZVtydW5zdGF0ZS0+c3RhdGVdICs9IGRlbHRhOwoKSWYgc3RhdGVfZW50cnlfdGltZSBo
YXMgdGhlIGJpdCBzZXQsIGl0IHdpbGwgYmUgYSBuZWdhdGl2ZSB2YWx1ZSwgc28gCmRlbHRhIHdp
bGwgYmUgZ3JlYXRlciB0aGFuIDAsIGFjdHVhbGx5IHRoZSBtYXJrZXIgYml0CndpbGwgYXBwZWFy
IGluIHJ1bnN0YXRlLT50aW1lIHRvby4gVGhpcyBjYXVzZXMgdGhlIE1TQiBiaXQgc2V0IGluIHRo
ZSAKcmV0dXJuIG9mIHhlbnN0YXRfdmNwdV9ucygpLiBJcyBpdCB0cnVlLCB0aGF0IHdoZW4gcmVh
ZGluZyB0aGVzZSB2YWx1ZXMgCnRocm91Z2ggeGVuc3RhdCwgdGhlIHVzZXIgc2hvdWxkIHRha2Ug
Y2FyZSBvZiB0aGlzIGJpdCwgYW5kIHJlcmVhZCwgb3IgCmlzIGl0IGEgYnVnIGluIHRoZSByZWxl
dmFudCBjb2RlPwoKSSBhbSB1c2luZyB4ZW5zdGF0LmggaW50ZXJmYWNlLCB3aGVyZSBJIGNhbiBv
bmx5IHJlcXVlc3Qgc3RhdGlzdGljcyBmb3IgCnRoZSB3aG9sZSBub2RlLiBTbywgYmFzaWNhbGx5
LCB3YWxraW5nIHRocm91Z2ggYWxsIHZjcHUgb2YgYWxsIGRvbWFpbiwgCmFuZCBjaGVja2luZyB0
aGF0IG5vIG9uZQpjb250YWlucyB0aGlzIGJpdCBzZWVtcyBhIGJpdCB1Z2x5IHNvbHV0aW9uLgoK
VGhhbmtzIGluIGFkdmFuY2UsClJpY2hhcmQgS29qZWR6aW5zemt5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
