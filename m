Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8B11793AF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 16:38:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9W4B-0003SA-NW; Wed, 04 Mar 2020 15:36:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l4g8=4V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j9W49-0003Rx-GE
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 15:36:09 +0000
X-Inumbo-ID: de32f07c-5e2d-11ea-a426-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id de32f07c-5e2d-11ea-a426-12813bfff9fa;
 Wed, 04 Mar 2020 15:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583336168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=G5NhvDKvPjvQJhnY14fHyEvQ/0myRniZs3nKil3lehY=;
 b=OZycP4FKh0KFiNE0YRVSt8+cz3Q9AXdoH3Pasl2aO3FVZUXAl7XV8oJUr7vCwyXAoO3BCq
 yYWEw863SoyVNT68BSOkQGM9FgNwQ+gLxeZVBNFHIl6v5elxlO7JHhsYLRee0y3a57OSSD
 Ts0jbwZvUuUCPPU3l9EYln9FRfljRNw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-bXnf7nIzNcGBen7LBqerCg-1; Wed, 04 Mar 2020 10:36:06 -0500
X-MC-Unique: bXnf7nIzNcGBen7LBqerCg-1
Received: by mail-wr1-f72.google.com with SMTP id b12so1019801wro.4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 07:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y0p/4JL8TMvLa6UgCA/KzBmR/o65cHnlPhknYfGAHbc=;
 b=M29LAzza/pOy4vEmbI6dDOeTZ+5kgyOp08YnDbti7lTwveZ0iCxGZFbasQ6BdRcfnB
 AyhekPCGpccwkws/9eJXnS4pAGv8WP6x0Pd1A79e1Ci8YFtulPfbhxZH2FhC02eEXUxk
 CFgFQyTYZ3FxPNx2g5tsEKIpqrGm6+7fhZPjXfBHLJKZxmRYJu0UZpcZ2Srq7DLEsMlS
 COAISK4y5HYxxoDE9ZYhFlLb4ZauSj+38bT5diEPSx8INrBxOf/hcqJ/efc/xbPg5mL9
 sitviW1qJp9JPa9iP+oHjmMIEff0bKomPg0eX8j8ZAkaKRNEloPqDqzNZ6pt3G6bTdox
 4+Wg==
X-Gm-Message-State: ANhLgQ1V0X2jVrFG98w6w31Ilhoz0KjJUSbZZFbPp40omnvSOoRzapRS
 /qI3/sKiBoJi3KqEkXLB02EgYDIpU6cFm0v0yE64KssokvYWGReeU43t2qnVMKJBOcpB2sjwPXC
 QzBS5MRGfvrBDDUHBnJx5QoqXMhk=
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr4104672wmf.63.1583336165276; 
 Wed, 04 Mar 2020 07:36:05 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsnixoK4WwsHKStCKoeIJWoF8gsWVwNLxPcy/79wKopAsHeNRdXO/i3sWblxFg1UvZ1xZa0cw==
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr4104628wmf.63.1583336165037; 
 Wed, 04 Mar 2020 07:36:05 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id b10sm4906024wmh.48.2020.03.04.07.36.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 07:36:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2020 16:35:59 +0100
Message-Id: <20200304153601.23423-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH 0/2] misc: Replace zero-length arrays with
 flexible array member
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

djI6Ci0gZG8gbm90IG1vZGlmeSBxZWQuaCAoc3RydWN0dXJlIHdpdGggc2luZ2xlIG1lbWJlcikK
LSBiYXNlZCBvbiBody9zY3NpL3NwYXByX3ZzY3NpIGZpeCBzZXJpZXMKClRoaXMgaXMgYSB0cmVl
LXdpZGUgY2xlYW51cCBpbnNwaXJlZCBieSBhIExpbnV4IGtlcm5lbCBjb21taXQKKGZyb20gR3Vz
dGF2byBBLiBSLiBTaWx2YSkuCgotLXYtLSBkZXNjcmlwdGlvbiBzdGFydCAtLXYtLQoKICBUaGUg
Y3VycmVudCBjb2RlYmFzZSBtYWtlcyB1c2Ugb2YgdGhlIHplcm8tbGVuZ3RoIGFycmF5IGxhbmd1
YWdlCiAgZXh0ZW5zaW9uIHRvIHRoZSBDOTAgc3RhbmRhcmQsIGJ1dCB0aGUgcHJlZmVycmVkIG1l
Y2hhbmlzbSB0bwogIGRlY2xhcmUgdmFyaWFibGUtbGVuZ3RoIHR5cGVzIHN1Y2ggYXMgdGhlc2Ug
b25lcyBpcyBhIGZsZXhpYmxlCiAgYXJyYXkgbWVtYmVyIFsxXSwgaW50cm9kdWNlZCBpbiBDOTk6
CgogIHN0cnVjdCBmb28gewogICAgICBpbnQgc3R1ZmY7CiAgICAgIHN0cnVjdCBib28gYXJyYXlb
XTsKICB9OwoKICBCeSBtYWtpbmcgdXNlIG9mIHRoZSBtZWNoYW5pc20gYWJvdmUsIHdlIHdpbGwg
Z2V0IGEgY29tcGlsZXIKICB3YXJuaW5nIGluIGNhc2UgdGhlIGZsZXhpYmxlIGFycmF5IGRvZXMg
bm90IG9jY3VyIGxhc3QgaW4gdGhlCiAgc3RydWN0dXJlLCB3aGljaCB3aWxsIGhlbHAgdXMgcHJl
dmVudCBzb21lIGtpbmQgb2YgdW5kZWZpbmVkCiAgYmVoYXZpb3IgYnVncyBmcm9tIGJlaW5nIHVu
YWR2ZXJ0ZW5seSBpbnRyb2R1Y2VkIFsyXSB0byB0aGUKICBMaW51eCBjb2RlYmFzZSBmcm9tIG5v
dyBvbi4KCi0tXi0tIGRlc2NyaXB0aW9uIGVuZCAtLV4tLQoKRG8gdGhlIHNpbWlsYXIgaG91c2Vr
ZWVwaW5nIGluIHRoZSBRRU1VIGNvZGViYXNlICh3aGljaCB1c2VzCkM5OSBzaW5jZSBjb21taXQg
N2JlNDE2NzVmN2NiKS4KClRoZSBmaXJzdCBwYXRjaCBpcyBkb25lIHdpdGggdGhlIGhlbHAgb2Yg
YSBjb2NjaW5lbGxlIHNlbWFudGljCnBhdGNoLiBIb3dldmVyIENvY2NpbmVsbGUgZG9lcyBub3Qg
cmVjb2duaXplOgoKICBzdHJ1Y3QgZm9vIHsKICAgICAgaW50IHN0dWZmOwogICAgICBzdHJ1Y3Qg
Ym9vIGFycmF5W107CiAgfSBRRU1VX1BBQ0tFRDsKCmJ1dCBkb2VzIHJlY29nbml6ZToKCiAgc3Ry
dWN0IFFFTVVfUEFDS0VEIGZvbyB7CiAgICAgIGludCBzdHVmZjsKICAgICAgc3RydWN0IGJvbyBh
cnJheVtdOwogIH07CgpJJ20gbm90IHN1cmUgd2h5LCBuZWl0aGVyIGl0IGlzIHdvcnRoIHJlZmFj
dG9yaW5nIGFsbCBRRU1VCnN0cnVjdHVyZXMgdG8gdXNlIHRoZSBhdHRyaWJ1dGVzIGJlZm9yZSB0
aGUgc3RydWN0dXJlIG5hbWUsCnNvIEkgZGlkIHRoZSAybmQgcGF0Y2ggbWFudWFsbHkuCgpBbnl3
YXkgdGhpcyBpcyBhbm5veWluZywgYmVjYXVzZSBtYW55IHN0cnVjdHVyZXMgYXJlIG5vdCBoYW5k
bGVkCmJ5IGNvY2NpbmVsbGUuIE1heWJlIHRoaXMgbmVlZHMgdG8gYmUgcmVwb3J0ZWQgdG8gdXBz
dHJlYW0KY29jY2luZWxsZT8KCkkgdXNlZCBzcGF0Y2ggMS4wLjggd2l0aDoKCiAgLUkgaW5jbHVk
ZSAtLWluY2x1ZGUtaGVhZGVycyBcCiAgLS1tYWNyby1maWxlIHNjcmlwdHMvY29jY2ktbWFjcm8t
ZmlsZS5oIFwKICAtLWtlZXAtY29tbWVudHMgLS1pbmRlbnQgNAoKUmVnYXJkcywKClBoaWwuCgpC
YXNlZC1vbjogPDIwMjAwMzA0MTUzMzExLjIyOTU5LTEtcGhpbG1kQHJlZGhhdC5jb20+ClN1cGVy
c2VkZXM6IDwyMDIwMDMwNDAwNTEwNS4yNzQ1NC0xLXBoaWxtZEByZWRoYXQuY29tPgoKUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgKDIpOgogIG1pc2M6IFJlcGxhY2UgemVyby1sZW5ndGggYXJyYXlz
IHdpdGggZmxleGlibGUgYXJyYXkgbWVtYmVyCiAgICAoYXV0b21hdGljKQogIG1pc2M6IFJlcGxh
Y2UgemVyby1sZW5ndGggYXJyYXlzIHdpdGggZmxleGlibGUgYXJyYXkgbWVtYmVyIChtYW51YWwp
CgogZG9jcy9pbnRlcm9wL3Zob3N0LXVzZXIucnN0ICAgICAgICAgICB8ICA0ICsrLS0KIGJzZC11
c2VyL3FlbXUuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogY29udHJpYi9saWJ2aG9z
dC11c2VyL2xpYnZob3N0LXVzZXIuaCB8ICAyICstCiBody9tNjhrL2Jvb3RpbmZvLmggICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KIGh3L3Njc2kvc3JwLmggICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgNiArKystLS0KIGh3L3hlbi94ZW5fcHQuaCAgICAgICAgICAgICAgICAgICAgICAgfCAg
MiArLQogaW5jbHVkZS9ody9hY3BpL2FjcGktZGVmcy5oICAgICAgICAgICB8IDE2ICsrKysrKysr
LS0tLS0tLS0KIGluY2x1ZGUvaHcvYXJtL3NtbXUtY29tbW9uLmggICAgICAgICAgfCAgMiArLQog
aW5jbHVkZS9ody9ib2FyZHMuaCAgICAgICAgICAgICAgICAgICB8ICAyICstCiBpbmNsdWRlL2h3
L2kzODYvaW50ZWxfaW9tbXUuaCAgICAgICAgIHwgIDMgKystCiBpbmNsdWRlL2h3L3MzOTB4L2V2
ZW50LWZhY2lsaXR5LmggICAgIHwgIDIgKy0KIGluY2x1ZGUvaHcvczM5MHgvc2NscC5oICAgICAg
ICAgICAgICAgfCAgOCArKysrLS0tLQogaW5jbHVkZS9ody92aXJ0aW8vdmlydGlvLWlvbW11Lmgg
ICAgICB8ICAyICstCiBpbmNsdWRlL3N5c2VtdS9jcnlwdG9kZXYuaCAgICAgICAgICAgIHwgIDIg
Ky0KIGluY2x1ZGUvdGNnL3RjZy5oICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGMtYmlv
cy9zMzkwLWNjdy9ib290bWFwLmggICAgICAgICAgICB8ICAyICstCiBwYy1iaW9zL3MzOTAtY2N3
L3NjbHAuaCAgICAgICAgICAgICAgIHwgIDIgKy0KIHRlc3RzL3F0ZXN0L2xpYnFvcy9haGNpLmgg
ICAgICAgICAgICAgfCAgMiArLQogYmxvY2svbGludXgtYWlvLmMgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCiBibG9jay92bWRrLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
IGh3L2FjcGkvbnZkaW1tLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KIGh3L2No
YXIvc2NscGNvbnNvbGUtbG0uYyAgICAgICAgICAgICAgfCAgMiArLQogaHcvY2hhci9zY2xwY29u
c29sZS5jICAgICAgICAgICAgICAgICB8ICAyICstCiBody9kbWEvc29jX2RtYS5jICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KIGh3L2kzODYveDg2LmMgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQogaHcvbWlzYy9vbWFwX2w0LmMgICAgICAgICAgICAgICAgICAgICB8ICAyICst
CiBody9udnJhbS9lZXByb205M3h4LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGh3L3JkbWEv
dm13L3B2cmRtYV9xcF9vcHMuYyAgICAgICAgICAgfCAgNCArKy0tCiBody9zMzkweC92aXJ0aW8t
Y2N3LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGh3L3VzYi9kZXYtbmV0d29yay5jICAgICAg
ICAgICAgICAgICAgfCAgMiArLQogaHcvdXNiL2Rldi1zbWFydGNhcmQtcmVhZGVyLmMgICAgICAg
ICB8ICA0ICsrLS0KIGh3L3ZpcnRpby92aXJ0aW8uYyAgICAgICAgICAgICAgICAgICAgfCAgNCAr
Ky0tCiBuZXQvcXVldWUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHRhcmdl
dC9zMzkweC9pb2luc3QuYyAgICAgICAgICAgICAgICAgfCAgMiArLQogMzQgZmlsZXMgY2hhbmdl
ZCwgNTMgaW5zZXJ0aW9ucygrKSwgNTIgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
