Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C20178745
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 01:55:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9IFs-00049g-UN; Wed, 04 Mar 2020 00:51:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l4g8=4V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j9IFr-00049Z-CK
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 00:51:19 +0000
X-Inumbo-ID: 4154ee35-5db2-11ea-a2bd-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4154ee35-5db2-11ea-a2bd-12813bfff9fa;
 Wed, 04 Mar 2020 00:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583283076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fTB4PkJpoI9InVrdaWS/fwZsgOY3Q/wWHqny5EuksC0=;
 b=TDp932It+cpyMYS03nvAHKOkxhbl4jZ8uede2FjB9tFMYW8a1FG25dLvlhnmjbHAj/ZUPQ
 /wAxjCHTwO8YwhjoCzIlUu2SJsBEKefi43Ej2sTZs6wIzpguho1LrOFc3xk3ACvuepY7vJ
 q1LoXg/wEIf8XqY7pn4xmUg41Rje+Io=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-X83FH9BnMZyamTXa3dNO5g-1; Tue, 03 Mar 2020 19:51:12 -0500
X-MC-Unique: X83FH9BnMZyamTXa3dNO5g-1
Received: by mail-wr1-f70.google.com with SMTP id w18so155566wro.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2020 16:51:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X9KElX+HCIEUXdZrQtbAVqlZtknhV8M376bxhgxQN28=;
 b=SRRCKjbmEzmN4hVWZMvag43lsqt6hnkuYK4snO9CCnaQPngThnSdVrQXJpf68PSeWS
 uHob0nKWlQDR5upacHqyETNy/i3MrwMbflmhyywrlkeMpRaaQmsYAAjw12wwdiJ8KPct
 m0JqBlzM5GllYQjo0JUud5dj08R7pvItuw0rKMEjS4YW/zyB1+ZJzcBgBngeH4FzVVGo
 9nWbWN+dU5cB+mdNqLUOxdyc4lHaR8nL1qbo286GpX3ootBRq+IU2EyVkuhVAnThK5qD
 UDh1KdyI3hJ/P5D9vF/YWExVbmDtJYpJQSJnOWpXhvle8GPbfahO+1WaXPcZ9cP6knn4
 d5/Q==
X-Gm-Message-State: ANhLgQ2Ucc5M3dLmSKRPHcF0C2SuzRdE91lSE+wWsYDaV3FqgnHZ7r0v
 Cc+rN4c4cpWwLRFRS0rXjNHlH2VSxZXxIMx9VMrvriQL8apSjl0vMLeqSMMAYm1aMf1Ws2om3jR
 8msNPfEYSBVIvc3hD0g3cSpF8Qjo=
X-Received: by 2002:adf:eece:: with SMTP id a14mr692360wrp.311.1583283071739; 
 Tue, 03 Mar 2020 16:51:11 -0800 (PST)
X-Google-Smtp-Source: ADFU+vs8T1V4T7T9WKL2MAEXfQH0Ex/te4IlcB+SnP7L+t6rHN58dakSCl5po9C56FTyJUhBXz27GQ==
X-Received: by 2002:adf:eece:: with SMTP id a14mr692317wrp.311.1583283071453; 
 Tue, 03 Mar 2020 16:51:11 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id m19sm1242650wmc.34.2020.03.03.16.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 16:51:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2020 01:51:03 +0100
Message-Id: <20200304005105.27454-1-philmd@redhat.com>
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Eric Auger <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBhIHRyZWUtd2lkZSBjbGVhbnVwIGluc3BpcmVkIGJ5IGEgTGludXgga2VybmVsIGNv
bW1pdAooZnJvbSBHdXN0YXZvIEEuIFIuIFNpbHZhKS4KCi0tdi0tIGRlc2NyaXB0aW9uIHN0YXJ0
IC0tdi0tCgogIFRoZSBjdXJyZW50IGNvZGViYXNlIG1ha2VzIHVzZSBvZiB0aGUgemVyby1sZW5n
dGggYXJyYXkgbGFuZ3VhZ2UKICBleHRlbnNpb24gdG8gdGhlIEM5MCBzdGFuZGFyZCwgYnV0IHRo
ZSBwcmVmZXJyZWQgbWVjaGFuaXNtIHRvCiAgZGVjbGFyZSB2YXJpYWJsZS1sZW5ndGggdHlwZXMg
c3VjaCBhcyB0aGVzZSBvbmVzIGlzIGEgZmxleGlibGUKICBhcnJheSBtZW1iZXIgWzFdLCBpbnRy
b2R1Y2VkIGluIEM5OToKCiAgc3RydWN0IGZvbyB7CiAgICAgIGludCBzdHVmZjsKICAgICAgc3Ry
dWN0IGJvbyBhcnJheVtdOwogIH07CgogIEJ5IG1ha2luZyB1c2Ugb2YgdGhlIG1lY2hhbmlzbSBh
Ym92ZSwgd2Ugd2lsbCBnZXQgYSBjb21waWxlcgogIHdhcm5pbmcgaW4gY2FzZSB0aGUgZmxleGli
bGUgYXJyYXkgZG9lcyBub3Qgb2NjdXIgbGFzdCBpbiB0aGUKICBzdHJ1Y3R1cmUsIHdoaWNoIHdp
bGwgaGVscCB1cyBwcmV2ZW50IHNvbWUga2luZCBvZiB1bmRlZmluZWQKICBiZWhhdmlvciBidWdz
IGZyb20gYmVpbmcgdW5hZHZlcnRlbmx5IGludHJvZHVjZWQgWzJdIHRvIHRoZQogIExpbnV4IGNv
ZGViYXNlIGZyb20gbm93IG9uLgoKLS1eLS0gZGVzY3JpcHRpb24gZW5kIC0tXi0tCgpEbyB0aGUg
c2ltaWxhciBob3VzZWtlZXBpbmcgaW4gdGhlIFFFTVUgY29kZWJhc2UgKHdoaWNoIHVzZXMKQzk5
IHNpbmNlIGNvbW1pdCA3YmU0MTY3NWY3Y2IpLgoKVGhlIGZpcnN0IHBhdGNoIGlzIGRvbmUgd2l0
aCB0aGUgaGVscCBvZiBhIGNvY2NpbmVsbGUgc2VtYW50aWMKcGF0Y2guIEhvd2V2ZXIgQ29jY2lu
ZWxsZSBkb2VzIG5vdCByZWNvZ25pemU6CgogIHN0cnVjdCBmb28gewogICAgICBpbnQgc3R1ZmY7
CiAgICAgIHN0cnVjdCBib28gYXJyYXlbXTsKICB9IFFFTVVfUEFDS0VEOwoKYnV0IGRvZXMgcmVj
b2duaXplOgoKICBzdHJ1Y3QgUUVNVV9QQUNLRUQgZm9vIHsKICAgICAgaW50IHN0dWZmOwogICAg
ICBzdHJ1Y3QgYm9vIGFycmF5W107CiAgfTsKCkknbSBub3Qgc3VyZSB3aHksIG5laXRoZXIgaXQg
aXMgd29ydGggcmVmYWN0b3JpbmcgYWxsIFFFTVUKc3RydWN0dXJlcyB0byB1c2UgdGhlIGF0dHJp
YnV0ZXMgYmVmb3JlIHRoZSBzdHJ1Y3R1cmUgbmFtZSwKc28gSSBkaWQgdGhlIDJuZCBwYXRjaCBt
YW51YWxseS4KCkFueXdheSB0aGlzIGlzIGFubm95aW5nLCBiZWNhdXNlIG1hbnkgc3RydWN0dXJl
cyBhcmUgbm90IGhhbmRsZWQKYnkgY29jY2luZWxsZS4gTWF5YmUgdGhpcyBuZWVkcyB0byBiZSBy
ZXBvcnRlZCB0byB1cHN0cmVhbQpjb2NjaW5lbGxlPwoKSSB1c2VkIHNwYXRjaCAxLjAuOCB3aXRo
OgoKICAtSSBpbmNsdWRlIC0taW5jbHVkZS1oZWFkZXJzIFwKICAtLW1hY3JvLWZpbGUgc2NyaXB0
cy9jb2NjaS1tYWNyby1maWxlLmggXAogIC0ta2VlcC1jb21tZW50cyAtLWluZGVudCA0CgpSZWdh
cmRzLAoKUGhpbC4KClBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpICgyKToKICBtaXNjOiBSZXBsYWNl
IHplcm8tbGVuZ3RoIGFycmF5cyB3aXRoIGZsZXhpYmxlIGFycmF5IG1lbWJlcgogICAgKGF1dG9t
YXRpYykKICBtaXNjOiBSZXBsYWNlIHplcm8tbGVuZ3RoIGFycmF5cyB3aXRoIGZsZXhpYmxlIGFy
cmF5IG1lbWJlciAobWFudWFsKQoKIGRvY3MvaW50ZXJvcC92aG9zdC11c2VyLnJzdCAgICAgICAg
ICAgfCAgNCArKy0tCiBibG9jay9xZWQuaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIGJzZC11c2VyL3FlbXUuaCAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogY29udHJp
Yi9saWJ2aG9zdC11c2VyL2xpYnZob3N0LXVzZXIuaCB8ICAyICstCiBody9tNjhrL2Jvb3RpbmZv
LmggICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGh3L3Njc2kvc3JwLmggICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNiArKystLS0KIGh3L3hlbi94ZW5fcHQuaCAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQogaW5jbHVkZS9ody9hY3BpL2FjcGktZGVmcy5oICAgICAgICAgICB8IDE2
ICsrKysrKysrLS0tLS0tLS0KIGluY2x1ZGUvaHcvYXJtL3NtbXUtY29tbW9uLmggICAgICAgICAg
fCAgMiArLQogaW5jbHVkZS9ody9ib2FyZHMuaCAgICAgICAgICAgICAgICAgICB8ICAyICstCiBp
bmNsdWRlL2h3L2kzODYvaW50ZWxfaW9tbXUuaCAgICAgICAgIHwgIDMgKystCiBpbmNsdWRlL2h3
L3MzOTB4L2V2ZW50LWZhY2lsaXR5LmggICAgIHwgIDIgKy0KIGluY2x1ZGUvaHcvczM5MHgvc2Ns
cC5oICAgICAgICAgICAgICAgfCAgOCArKysrLS0tLQogaW5jbHVkZS9ody92aXJ0aW8vdmlydGlv
LWlvbW11LmggICAgICB8ICAyICstCiBpbmNsdWRlL3N5c2VtdS9jcnlwdG9kZXYuaCAgICAgICAg
ICAgIHwgIDIgKy0KIGluY2x1ZGUvdGNnL3RjZy5oICAgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQogcGMtYmlvcy9zMzkwLWNjdy9ib290bWFwLmggICAgICAgICAgICB8ICAyICstCiBwYy1iaW9z
L3MzOTAtY2N3L3NjbHAuaCAgICAgICAgICAgICAgIHwgIDIgKy0KIHRlc3RzL3F0ZXN0L2xpYnFv
cy9haGNpLmggICAgICAgICAgICAgfCAgMiArLQogYmxvY2svbGludXgtYWlvLmMgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstCiBibG9jay92bWRrLmMgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KIGh3L2FjcGkvbnZkaW1tLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNiArKyst
LS0KIGh3L2NoYXIvc2NscGNvbnNvbGUtbG0uYyAgICAgICAgICAgICAgfCAgMiArLQogaHcvY2hh
ci9zY2xwY29uc29sZS5jICAgICAgICAgICAgICAgICB8ICAyICstCiBody9kbWEvc29jX2RtYS5j
ICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGh3L2kzODYveDg2LmMgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQogaHcvbWlzYy9vbWFwX2w0LmMgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCiBody9udnJhbS9lZXByb205M3h4LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0K
IGh3L3JkbWEvdm13L3B2cmRtYV9xcF9vcHMuYyAgICAgICAgICAgfCAgNCArKy0tCiBody9zMzkw
eC92aXJ0aW8tY2N3LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGh3L3VzYi9kZXYtbmV0d29y
ay5jICAgICAgICAgICAgICAgICAgfCAgMiArLQogaHcvdXNiL2Rldi1zbWFydGNhcmQtcmVhZGVy
LmMgICAgICAgICB8ICA0ICsrLS0KIGh3L3ZpcnRpby92aXJ0aW8uYyAgICAgICAgICAgICAgICAg
ICAgfCAgNCArKy0tCiBuZXQvcXVldWUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIHRhcmdldC9zMzkweC9pb2luc3QuYyAgICAgICAgICAgICAgICAgfCAgMiArLQogMzUgZmls
ZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
