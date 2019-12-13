Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6238F11DC51
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 03:56:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifb2c-0000eF-Ks; Fri, 13 Dec 2019 02:50:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xLeZ=2D=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1ifb2b-0000e3-9X
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 02:50:53 +0000
X-Inumbo-ID: 57fc502c-1d53-11ea-b6f1-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57fc502c-1d53-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 02:50:40 +0000 (UTC)
Received: from ws19.umd.com.au (2407-e400-b000-202-0-0-0-3-cpe.spintel.net.au
 [IPv6:2407:e400:b000:202::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id E420B2006ED;
 Fri, 13 Dec 2019 13:50:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1576205434; bh=ADbmgjdex1YdG5H7zvVLlb7dKaNh3rNzRyAa5oq3YV4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fxnutyrs7426cK//HBgsOrjdWEvQAvqZuzTuKVuivjuAeBXZbHXGawM86eSPcEDc0
 rDfeS//i3gHG68TtI94NkvwweW3OYvXhMzD+aTLMZDIMU6ReKzQCvsoL0N3bE7ME1P
 SPcqPTwGnzDhXk6wA9HmUhXdB1CIfyky3ZdtqfcI=
From: Steven Haigh <netwiz@crc.id.au>
To: netwiz@crc.id.au,
	xen-devel@lists.xenproject.org
Date: Fri, 13 Dec 2019 13:50:24 +1100
Message-Id: <db4f16a10db216ab2ae71b82ddbe27e11b57eb98.1576204748.git.netwiz@crc.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1576204748.git.netwiz@crc.id.au>
References: <cover.1576204748.git.netwiz@crc.id.au>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] Use ip for bridge related functions where
 brctl is not present
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

U2lnbmVkLW9mZi1ieTogU3RldmVuIEhhaWdoIDxuZXR3aXpAY3JjLmlkLmF1PgotLS0KIHRvb2xz
L2hvdHBsdWcvTGludXgvY29sby1wcm94eS1zZXR1cCAgICAgIHwgMzAgKysrKysrKysrKysrKysr
KystLS0tLS0KIHRvb2xzL2hvdHBsdWcvTGludXgvdmlmLWJyaWRnZSAgICAgICAgICAgIHwgMTkg
KysrKysrKystLS0tLS0KIHRvb2xzL2hvdHBsdWcvTGludXgvdmlmMiAgICAgICAgICAgICAgICAg
IHwgMTIgKysrKysrKy0tCiB0b29scy9ob3RwbHVnL0xpbnV4L3hlbi1uZXR3b3JrLWNvbW1vbi5z
aCB8IDE1ICsrKysrKysrKy0tLQogNCBmaWxlcyBjaGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspLCAy
MSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9ob3RwbHVnL0xpbnV4L2NvbG8tcHJv
eHktc2V0dXAgYi90b29scy9ob3RwbHVnL0xpbnV4L2NvbG8tcHJveHktc2V0dXAKaW5kZXggOTRl
MjAzNDQ1Mi4uNjkwMDIxZDEwYSAxMDA3NTUKLS0tIGEvdG9vbHMvaG90cGx1Zy9MaW51eC9jb2xv
LXByb3h5LXNldHVwCisrKyBiL3Rvb2xzL2hvdHBsdWcvTGludXgvY29sby1wcm94eS1zZXR1cApA
QCAtNzYsMTAgKzc2LDE3IEBAIGZ1bmN0aW9uIHRlYXJkb3duX3ByaW1hcnkoKQogCiBmdW5jdGlv
biBzZXR1cF9zZWNvbmRhcnkoKQogewotICAgIGRvX3dpdGhvdXRfZXJyb3IgYnJjdGwgZGVsaWYg
JGJyaWRnZSAkdmlmbmFtZQotICAgIGRvX3dpdGhvdXRfZXJyb3IgYnJjdGwgYWRkYnIgJGZvcndh
cmRicgotICAgIGRvX3dpdGhvdXRfZXJyb3IgYnJjdGwgYWRkaWYgJGZvcndhcmRiciAkdmlmbmFt
ZQotICAgIGRvX3dpdGhvdXRfZXJyb3IgYnJjdGwgYWRkaWYgJGZvcndhcmRiciAkZm9yd2FyZGRl
dgorICAgIGlmIFsgLXggIi91c3IvYmluL2JyY3RsIiBdOyB0aGVuCisgICAgICAgIGRvX3dpdGhv
dXRfZXJyb3IgYnJjdGwgZGVsaWYgJGJyaWRnZSAkdmlmbmFtZQorICAgICAgICBkb193aXRob3V0
X2Vycm9yIGJyY3RsIGFkZGJyICRmb3J3YXJkYnIKKyAgICAgICAgZG9fd2l0aG91dF9lcnJvciBi
cmN0bCBhZGRpZiAkZm9yd2FyZGJyICR2aWZuYW1lCisgICAgICAgIGRvX3dpdGhvdXRfZXJyb3Ig
YnJjdGwgYWRkaWYgJGZvcndhcmRiciAkZm9yd2FyZGRldgorICAgIGVsc2UKKyAgICAgICAgZG9f
d2l0aG91dF9lcnJvciBpcCBsaW5rIHNldCAkdmlmbmFtZSBub21hc3RlcgorICAgICAgICBkb193
aXRob3V0X2Vycm9yIGlwIGxpbmsgYWRkIG5hbWUgJGZvcndhcmRiciB0eXBlIGJyaWRnZQorICAg
ICAgICBkb193aXRob3V0X2Vycm9yIGlwIGxpbmsgc2V0ICR2aWZuYW1lIG1hc3RlciAkZm9yd2Fy
ZGJyCisgICAgICAgIGRvX3dpdGhvdXRfZXJyb3IgaXAgbGluayBzZXQgJGZvcndhcmRkZXYgbWFz
dGVyICRmb3J3YXJkYnIKKyAgICBmaQogICAgIGRvX3dpdGhvdXRfZXJyb3IgaXAgbGluayBzZXQg
ZGV2ICRmb3J3YXJkYnIgdXAKICAgICBkb193aXRob3V0X2Vycm9yIG1vZHByb2JlIHh0X1NFQ0NP
TE8KIApAQCAtOTEsMTAgKzk4LDE3IEBAIGZ1bmN0aW9uIHNldHVwX3NlY29uZGFyeSgpCiAKIGZ1
bmN0aW9uIHRlYXJkb3duX3NlY29uZGFyeSgpCiB7Ci0gICAgZG9fd2l0aG91dF9lcnJvciBicmN0
bCBkZWxpZiAkZm9yd2FyZGJyICRmb3J3YXJkZGV2Ci0gICAgZG9fd2l0aG91dF9lcnJvciBicmN0
bCBkZWxpZiAkZm9yd2FyZGJyICR2aWZuYW1lCi0gICAgZG9fd2l0aG91dF9lcnJvciBicmN0bCBk
ZWxiciAkZm9yd2FyZGJyCi0gICAgZG9fd2l0aG91dF9lcnJvciBicmN0bCBhZGRpZiAkYnJpZGdl
ICR2aWZuYW1lCisgICAgaWYgWyAteCAiL3Vzci9iaW4vYnJjdGwiIF07IHRoZW4KKyAgICAgICAg
ZG9fd2l0aG91dF9lcnJvciBicmN0bCBkZWxpZiAkZm9yd2FyZGJyICRmb3J3YXJkZGV2CisgICAg
ICAgIGRvX3dpdGhvdXRfZXJyb3IgYnJjdGwgZGVsaWYgJGZvcndhcmRiciAkdmlmbmFtZQorICAg
ICAgICBkb193aXRob3V0X2Vycm9yIGJyY3RsIGRlbGJyICRmb3J3YXJkYnIKKyAgICAgICAgZG9f
d2l0aG91dF9lcnJvciBicmN0bCBhZGRpZiAkYnJpZGdlICR2aWZuYW1lCisgICAgZWxzZQorICAg
ICAgICBkb193aXRob3V0X2Vycm9yIGlwIGxpbmsgc2V0ICRmb3J3YXJkZGV2IG5vbWFzdGVyCisg
ICAgICAgIGRvX3dpdGhvdXRfZXJyb3IgaXAgbGluayBzZXQgJHZpZm5hbWUgbm9tYXN0ZXIKKyAg
ICAgICAgZG9fd2l0aG91dF9lcnJvciBpcCBsaW5rIGRlbGV0ZSAkZm9yd2FyZGJyIHR5cGUgYnJp
ZGdlCisgICAgICAgIGRvX3dpdGhvdXRfZXJyb3IgaXAgbGluayBzZXQgJHZpZm5hbWUgbWFzdGVy
ICRicmlkZ2UKKyAgICBmaQogCiAgICAgZG9fd2l0aG91dF9lcnJvciBpcHRhYmxlcyAtdCBtYW5n
bGUgLUQgUFJFUk9VVElORyAtbSBwaHlzZGV2IC0tcGh5c2Rldi1pbiBcCiAgICAgICAgICR2aWZu
YW1lIC1qIFNFQ0NPTE8gLS1pbmRleCAkaW5kZXgKZGlmZiAtLWdpdCBhL3Rvb2xzL2hvdHBsdWcv
TGludXgvdmlmLWJyaWRnZSBiL3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmLWJyaWRnZQppbmRleCA2
OTU2ZGVhNjZhLi5lMDM1NDExOTM0IDEwMDY0NAotLS0gYS90b29scy9ob3RwbHVnL0xpbnV4L3Zp
Zi1icmlkZ2UKKysrIGIvdG9vbHMvaG90cGx1Zy9MaW51eC92aWYtYnJpZGdlCkBAIC0zMSwxMiAr
MzEsMTMgQEAgZGlyPSQoZGlybmFtZSAiJDAiKQogYnJpZGdlPSR7YnJpZGdlOi19CiBicmlkZ2U9
JCh4ZW5zdG9yZV9yZWFkX2RlZmF1bHQgIiRYRU5CVVNfUEFUSC9icmlkZ2UiICIkYnJpZGdlIikK
IAotaWYgWyAteiAiJGJyaWRnZSIgXQotdGhlbgotICBicmlkZ2U9JChicmN0bCBzaG93IHwgYXdr
ICdOUj09MntwcmludCQxfScpCi0KLSAgaWYgWyAteiAiJGJyaWRnZSIgXQotICB0aGVuCitpZiBb
IC16ICIkYnJpZGdlIiBdOyB0aGVuCisgICAgaWYgWyAteCAiL3Vzci9zYmluL2JyY3RsIiBdOyB0
aGVuCisgICAgICAgIGJyaWRnZT0kKGJyY3RsIHNob3cgfCBhd2sgJ05SPT0ye3ByaW50JDF9JykK
KyAgICBlbHNlCisgICAgICAgIGJyaWRnZT0kKGJyaWRnZSBsaW5rIHwgY3V0IC1kIiAiIC1mNykK
KyAgICBmaQorICBpZiBbIC16ICIkYnJpZGdlIiBdOyB0aGVuCiAgICAgIGZhdGFsICJDb3VsZCBu
b3QgZmluZCBicmlkZ2UsIGFuZCBub25lIHdhcyBzcGVjaWZpZWQiCiAgIGZpCiBlbHNlCkBAIC04
Miw3ICs4MywxMSBAQCBjYXNlICIkY29tbWFuZCIgaW4KICAgICAgICAgOzsKIAogICAgIG9mZmxp
bmUpCi0gICAgICAgIGRvX3dpdGhvdXRfZXJyb3IgYnJjdGwgZGVsaWYgIiRicmlkZ2UiICIkZGV2
IgorICAgICAgICBpZiBbIC14ICIvdXNyL3NiaW4vYnJjdGwiXTsgdGhlbgorICAgICAgICAgICAg
ZG9fd2l0aG91dF9lcnJvciBicmN0bCBkZWxpZiAiJGJyaWRnZSIgIiRkZXYiCisgICAgICAgIGVs
c2UKKyAgICAgICAgICAgIGRvX3dpdGhvdXRfZXJyb3IgaXAgbGluayBzZXQgIiRkZXYiIG5vbWFz
dGVyCisgICAgICAgIGZpCiAgICAgICAgIGRvX3dpdGhvdXRfZXJyb3IgaWZjb25maWcgIiRkZXYi
IGRvd24KICAgICAgICAgOzsKIApkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC92aWYy
IGIvdG9vbHMvaG90cGx1Zy9MaW51eC92aWYyCmluZGV4IDJjMTU1YmU2OGMuLmUzNjA3MGNiYmIg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2hvdHBsdWcvTGludXgvdmlmMgorKysgYi90b29scy9ob3RwbHVn
L0xpbnV4L3ZpZjIKQEAgLTcsMTMgKzcsMjEgQEAgZGlyPSQoZGlybmFtZSAiJDAiKQogYnJpZGdl
PSQoeGVuc3RvcmVfcmVhZF9kZWZhdWx0ICIkWEVOQlVTX1BBVEgvYnJpZGdlIiAiJGJyaWRnZSIp
CiBpZiBbIC16ICIkYnJpZGdlIiBdCiAgICAgdGhlbgotICAgIG5yX2JyaWRnZXM9JCgoJChicmN0
bCBzaG93IHwgY3V0IC1mIDEgfCBncmVwIC12ICJeJCIgfCB3YyAtbCkgLSAxKSkKKyAgICBpZiBb
IC14ICIvdXNyL3NiaW4vYnJjdGwiIF07IHRoZW4KKyAgICAgICAgbnJfYnJpZGdlcz0kKCgkKGJy
Y3RsIHNob3cgfCBjdXQgLWYgMSB8IGdyZXAgLXYgIl4kIiB8IHdjIC1sKSAtIDEpKQorICAgIGVs
c2UKKyAgICAgICAgbnJfYnJpZGdlcz0kKGJyaWRnZSBsaW5rIHwgd2MgLWwpCisgICAgZmkKICAg
ICBpZiBbICIkbnJfYnJpZGdlcyIgIT0gMSBdCiAJdGhlbgogCWZhdGFsICJubyBicmlkZ2Ugc3Bl
Y2lmaWVkLCBhbmQgZG9uJ3Qga25vdyB3aGljaCBvbmUgdG8gdXNlICgkbnJfYnJpZGdlcyBmb3Vu
ZCkiCiAgICAgZmkKLSAgICBicmlkZ2U9JChicmN0bCBzaG93IHwgY3V0IC1kICIKKyAgICBpZiBb
IC14ICIvdXNyL3NiaW4vYnJjdGwiIF07IHRoZW4KKyAgICAgICAgYnJpZGdlPSQoYnJjdGwgc2hv
dyB8IGN1dCAtZCAiCiAiIC1mIDIgfCBjdXQgLWYgMSkKKyAgICBlbHNlCisgICAgICAgIGJyaWRn
ZT0kKGJyaWRnZSBsaW5rIHwgY3V0IC1kIiAiIC1mNikKKyAgICBmaQogZmkKIAogY29tbWFuZD0i
JDEiCmRpZmYgLS1naXQgYS90b29scy9ob3RwbHVnL0xpbnV4L3hlbi1uZXR3b3JrLWNvbW1vbi5z
aCBiL3Rvb2xzL2hvdHBsdWcvTGludXgveGVuLW5ldHdvcmstY29tbW9uLnNoCmluZGV4IGFiNzY4
MjdhNjQuLjc4MzNkZWFjNmMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2hvdHBsdWcvTGludXgveGVuLW5l
dHdvcmstY29tbW9uLnNoCisrKyBiL3Rvb2xzL2hvdHBsdWcvTGludXgveGVuLW5ldHdvcmstY29t
bW9uLnNoCkBAIC0xMDgsOSArMTA4LDEyIEBAIGNyZWF0ZV9icmlkZ2UgKCkgewogCiAJIyBEb24n
dCBjcmVhdGUgdGhlIGJyaWRnZSBpZiBpdCBhbHJlYWR5IGV4aXN0cy4KIAlpZiBbICEgLWUgIi9z
eXMvY2xhc3MvbmV0LyR7YnJpZGdlfS9icmlkZ2UiIF07IHRoZW4KLQkJYnJjdGwgYWRkYnIgJHti
cmlkZ2V9Ci0JCWJyY3RsIHN0cCAke2JyaWRnZX0gb2ZmCi0JCWJyY3RsIHNldGZkICR7YnJpZGdl
fSAwCisJCWlmIFsgLXggIi91c3Ivc2Jpbi9icmN0bCIgXTsgdGhlbgorCQkJYnJjdGwgYWRkYnIg
JHticmlkZ2V9CisJCQlicmN0bCBzdHAgJHticmlkZ2V9IG9mZgorCQkJYnJjdGwgc2V0ZmQgJHti
cmlkZ2V9IDAKKwkJZWxzZQorCQkJaXAgbGluayBhZGQgbmFtZSAke2JyaWRnZX0gdHlwZSBicmlk
Z2Ugc3RwX3N0YXRlIDAgZm9yd2FyZF9kZWxheSAwCiAJZmkKIH0KIApAQCAtMTI0LDcgKzEyNywx
MSBAQCBhZGRfdG9fYnJpZGdlICgpIHsKIAkJaXAgbGluayBzZXQgZGV2ICR7ZGV2fSB1cCB8fCB0
cnVlCiAJCXJldHVybgogCWZpCi0JYnJjdGwgYWRkaWYgJHticmlkZ2V9ICR7ZGV2fQorCWlmIFsg
LXggIi91c3Ivc2Jpbi9icmN0bCIgXTsgdGhlbgorCQlicmN0bCBhZGRpZiAke2JyaWRnZX0gJHtk
ZXZ9CisJZWxzZQorCQlpcCBsaW5rIHNldCAke2Rldn0gbWFzdGVyICR7YnJpZGdlfQorCWZpCiAJ
aXAgbGluayBzZXQgZGV2ICR7ZGV2fSB1cAogfQogCi0tIAoyLjI0LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
