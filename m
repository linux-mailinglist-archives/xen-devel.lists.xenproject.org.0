Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5E91793C3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 16:40:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9W6N-0003tW-Dn; Wed, 04 Mar 2020 15:38:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l4g8=4V=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j9W6M-0003tP-Pp
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 15:38:26 +0000
X-Inumbo-ID: 305fd3ed-5e2e-11ea-a426-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 305fd3ed-5e2e-11ea-a426-12813bfff9fa;
 Wed, 04 Mar 2020 15:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583336306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OSTKkYQFHVn5wzazJD9/YYpsUv76LJ3wFO/XEgQH2oE=;
 b=LEVjExWYKpSRUemYcZ79kKYnqs5wGSOQExNxSGTLmPO0M9GwJhFSo71AoFyI7ZCCVl/rq7
 sVScTLkzp+hIpdIgzJ8/r4hK1+bO2AWkr5OZR/AlOEy1NTZfWG127268rE7Y5eelK3Gti2
 PYSvTQ7v4djqtLya7B+r52GFWiyHOKU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-ODToqk9fMnW_Qo3tvcpq-w-1; Wed, 04 Mar 2020 10:38:21 -0500
X-MC-Unique: ODToqk9fMnW_Qo3tvcpq-w-1
Received: by mail-wr1-f72.google.com with SMTP id j14so1005359wru.8
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2020 07:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hMC3Q7PnsRY64PBv4jXo0JqVzh5Jib6A4fNKHOxhCBA=;
 b=pn4lBoNqYsK4vI9vSTCgM038/TiLZFl0E5obdNq/yFrjQAXhGpA6FA8TQMRo3+njwb
 caCvKLYrb3YIxuq2omQ+NpYevAGyBkqVZsL325UQPxPK0AcHIfdeZzjU5eWnyjEH0M5m
 61G3GWERDVmHTpn2BUjYUHfxXNR4WM+Q5snQWZUp4VqTb1eBGIRBRn8TAsC4Ftqchb3N
 oWa7cayNpHjx+3Y6Iiyy05UNwmsHCsPCe0dwOUUKDhG0dyf5KAgfu0MfRakav/Hg8XEi
 zLwliNN77XJd3Bp3YK+Vl6k6pzkIbRT6mIiL7qbmgt5Wr322VS/PDPYAtbPElw+9QKhq
 LcKw==
X-Gm-Message-State: ANhLgQ1xUApCU+2AuUlHrgXmK+31nSOmwdeVhwGlV4cXplen/4hnePu6
 exhNv10mjzhh8nn9Dpba3QAUApiFluVMsJD+XsDBVC+hZmMlpfhRCSYORLq7n/CCWqU6+BwrJbj
 oMkapSU5bB3DTbjOQxHs9eKuK3UM=
X-Received: by 2002:a5d:49c6:: with SMTP id t6mr4590427wrs.218.1583336300626; 
 Wed, 04 Mar 2020 07:38:20 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvzvjQ+3ctpKS8T4AcaaJ8m1iRiiaHyaZVx3N1cF53P83A6GlD1mycXmK26Sd7fyHVDn/iXrQ==
X-Received: by 2002:a5d:49c6:: with SMTP id t6mr4590398wrs.218.1583336300391; 
 Wed, 04 Mar 2020 07:38:20 -0800 (PST)
Received: from localhost.localdomain (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id u20sm4407548wmj.14.2020.03.04.07.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 07:38:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2020 16:38:14 +0100
Message-Id: <20200304153816.23636-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v2 0/2] misc: Replace zero-length arrays with
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
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 David Hildenbrand <david@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

djI6Ci0gZG8gbm90IG1vZGlmeSBxZWQuaCAoc3RydWN0dXJlIHdpdGggc2luZ2xlIG1lbWJlcikK
LSBiYXNlZCBvbiBody9zY3NpL3NwYXByX3ZzY3NpIGZpeCBzZXJpZXM6CiAgaHR0cHM6Ly9taWQu
bWFpbC1hcmNoaXZlLmNvbS8yMDIwMDMwNDE1MzMxMS4yMjk1OS0xLXBoaWxtZEByZWRoYXQuY29t
CgpUaGlzIGlzIGEgdHJlZS13aWRlIGNsZWFudXAgaW5zcGlyZWQgYnkgYSBMaW51eCBrZXJuZWwg
Y29tbWl0Cihmcm9tIEd1c3Rhdm8gQS4gUi4gU2lsdmEpLgoKLS12LS0gZGVzY3JpcHRpb24gc3Rh
cnQgLS12LS0KCiAgVGhlIGN1cnJlbnQgY29kZWJhc2UgbWFrZXMgdXNlIG9mIHRoZSB6ZXJvLWxl
bmd0aCBhcnJheSBsYW5ndWFnZQogIGV4dGVuc2lvbiB0byB0aGUgQzkwIHN0YW5kYXJkLCBidXQg
dGhlIHByZWZlcnJlZCBtZWNoYW5pc20gdG8KICBkZWNsYXJlIHZhcmlhYmxlLWxlbmd0aCB0eXBl
cyBzdWNoIGFzIHRoZXNlIG9uZXMgaXMgYSBmbGV4aWJsZQogIGFycmF5IG1lbWJlciBbMV0sIGlu
dHJvZHVjZWQgaW4gQzk5OgoKICBzdHJ1Y3QgZm9vIHsKICAgICAgaW50IHN0dWZmOwogICAgICBz
dHJ1Y3QgYm9vIGFycmF5W107CiAgfTsKCiAgQnkgbWFraW5nIHVzZSBvZiB0aGUgbWVjaGFuaXNt
IGFib3ZlLCB3ZSB3aWxsIGdldCBhIGNvbXBpbGVyCiAgd2FybmluZyBpbiBjYXNlIHRoZSBmbGV4
aWJsZSBhcnJheSBkb2VzIG5vdCBvY2N1ciBsYXN0IGluIHRoZQogIHN0cnVjdHVyZSwgd2hpY2gg
d2lsbCBoZWxwIHVzIHByZXZlbnQgc29tZSBraW5kIG9mIHVuZGVmaW5lZAogIGJlaGF2aW9yIGJ1
Z3MgZnJvbSBiZWluZyB1bmFkdmVydGVubHkgaW50cm9kdWNlZCBbMl0gdG8gdGhlCiAgTGludXgg
Y29kZWJhc2UgZnJvbSBub3cgb24uCgotLV4tLSBkZXNjcmlwdGlvbiBlbmQgLS1eLS0KCkRvIHRo
ZSBzaW1pbGFyIGhvdXNla2VlcGluZyBpbiB0aGUgUUVNVSBjb2RlYmFzZSAod2hpY2ggdXNlcwpD
OTkgc2luY2UgY29tbWl0IDdiZTQxNjc1ZjdjYikuCgpUaGUgZmlyc3QgcGF0Y2ggaXMgZG9uZSB3
aXRoIHRoZSBoZWxwIG9mIGEgY29jY2luZWxsZSBzZW1hbnRpYwpwYXRjaC4gSG93ZXZlciBDb2Nj
aW5lbGxlIGRvZXMgbm90IHJlY29nbml6ZToKCiAgc3RydWN0IGZvbyB7CiAgICAgIGludCBzdHVm
ZjsKICAgICAgc3RydWN0IGJvbyBhcnJheVtdOwogIH0gUUVNVV9QQUNLRUQ7CgpidXQgZG9lcyBy
ZWNvZ25pemU6CgogIHN0cnVjdCBRRU1VX1BBQ0tFRCBmb28gewogICAgICBpbnQgc3R1ZmY7CiAg
ICAgIHN0cnVjdCBib28gYXJyYXlbXTsKICB9OwoKSSdtIG5vdCBzdXJlIHdoeSwgbmVpdGhlciBp
dCBpcyB3b3J0aCByZWZhY3RvcmluZyBhbGwgUUVNVQpzdHJ1Y3R1cmVzIHRvIHVzZSB0aGUgYXR0
cmlidXRlcyBiZWZvcmUgdGhlIHN0cnVjdHVyZSBuYW1lLApzbyBJIGRpZCB0aGUgMm5kIHBhdGNo
IG1hbnVhbGx5LgoKQW55d2F5IHRoaXMgaXMgYW5ub3lpbmcsIGJlY2F1c2UgbWFueSBzdHJ1Y3R1
cmVzIGFyZSBub3QgaGFuZGxlZApieSBjb2NjaW5lbGxlLiBNYXliZSB0aGlzIG5lZWRzIHRvIGJl
IHJlcG9ydGVkIHRvIHVwc3RyZWFtCmNvY2NpbmVsbGU/CgpJIHVzZWQgc3BhdGNoIDEuMC44IHdp
dGg6CgogIC1JIGluY2x1ZGUgLS1pbmNsdWRlLWhlYWRlcnMgXAogIC0tbWFjcm8tZmlsZSBzY3Jp
cHRzL2NvY2NpLW1hY3JvLWZpbGUuaCBcCiAgLS1rZWVwLWNvbW1lbnRzIC0taW5kZW50IDQKClJl
Z2FyZHMsCgpQaGlsLgoKQmFzZWQtb246IDwyMDIwMDMwNDE1MzMxMS4yMjk1OS0xLXBoaWxtZEBy
ZWRoYXQuY29tPgpTdXBlcnNlZGVzOiA8MjAyMDAzMDQwMDUxMDUuMjc0NTQtMS1waGlsbWRAcmVk
aGF0LmNvbT4KClBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpICgyKToKICBtaXNjOiBSZXBsYWNlIHpl
cm8tbGVuZ3RoIGFycmF5cyB3aXRoIGZsZXhpYmxlIGFycmF5IG1lbWJlcgogICAgKGF1dG9tYXRp
YykKICBtaXNjOiBSZXBsYWNlIHplcm8tbGVuZ3RoIGFycmF5cyB3aXRoIGZsZXhpYmxlIGFycmF5
IG1lbWJlciAobWFudWFsKQoKIGRvY3MvaW50ZXJvcC92aG9zdC11c2VyLnJzdCAgICAgICAgICAg
fCAgNCArKy0tCiBic2QtdXNlci9xZW11LmggICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0K
IGNvbnRyaWIvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11c2VyLmggfCAgMiArLQogaHcvbTY4ay9i
b290aW5mby5oICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBody9zY3NpL3NycC5oICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCiBody94ZW4veGVuX3B0LmggICAgICAgICAg
ICAgICAgICAgICAgIHwgIDIgKy0KIGluY2x1ZGUvaHcvYWNwaS9hY3BpLWRlZnMuaCAgICAgICAg
ICAgfCAxNiArKysrKysrKy0tLS0tLS0tCiBpbmNsdWRlL2h3L2FybS9zbW11LWNvbW1vbi5oICAg
ICAgICAgIHwgIDIgKy0KIGluY2x1ZGUvaHcvYm9hcmRzLmggICAgICAgICAgICAgICAgICAgfCAg
MiArLQogaW5jbHVkZS9ody9pMzg2L2ludGVsX2lvbW11LmggICAgICAgICB8ICAzICsrLQogaW5j
bHVkZS9ody9zMzkweC9ldmVudC1mYWNpbGl0eS5oICAgICB8ICAyICstCiBpbmNsdWRlL2h3L3Mz
OTB4L3NjbHAuaCAgICAgICAgICAgICAgIHwgIDggKysrKy0tLS0KIGluY2x1ZGUvaHcvdmlydGlv
L3ZpcnRpby1pb21tdS5oICAgICAgfCAgMiArLQogaW5jbHVkZS9zeXNlbXUvY3J5cHRvZGV2Lmgg
ICAgICAgICAgICB8ICAyICstCiBpbmNsdWRlL3RjZy90Y2cuaCAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KIHBjLWJpb3MvczM5MC1jY3cvYm9vdG1hcC5oICAgICAgICAgICAgfCAgMiArLQog
cGMtYmlvcy9zMzkwLWNjdy9zY2xwLmggICAgICAgICAgICAgICB8ICAyICstCiB0ZXN0cy9xdGVz
dC9saWJxb3MvYWhjaS5oICAgICAgICAgICAgIHwgIDIgKy0KIGJsb2NrL2xpbnV4LWFpby5jICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArLQogYmxvY2svdm1kay5jICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCiBody9hY3BpL252ZGltbS5jICAgICAgICAgICAgICAgICAgICAgIHwg
IDYgKysrLS0tCiBody9jaGFyL3NjbHBjb25zb2xlLWxtLmMgICAgICAgICAgICAgIHwgIDIgKy0K
IGh3L2NoYXIvc2NscGNvbnNvbGUuYyAgICAgICAgICAgICAgICAgfCAgMiArLQogaHcvZG1hL3Nv
Y19kbWEuYyAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBody9pMzg2L3g4Ni5jICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGh3L21pc2Mvb21hcF9sNC5jICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQogaHcvbnZyYW0vZWVwcm9tOTN4eC5jICAgICAgICAgICAgICAgICB8
ICAyICstCiBody9yZG1hL3Ztdy9wdnJkbWFfcXBfb3BzLmMgICAgICAgICAgIHwgIDQgKystLQog
aHcvczM5MHgvdmlydGlvLWNjdy5jICAgICAgICAgICAgICAgICB8ICAyICstCiBody91c2IvZGV2
LW5ldHdvcmsuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIGh3L3VzYi9kZXYtc21hcnRjYXJk
LXJlYWRlci5jICAgICAgICAgfCAgNCArKy0tCiBody92aXJ0aW8vdmlydGlvLmMgICAgICAgICAg
ICAgICAgICAgIHwgIDQgKystLQogbmV0L3F1ZXVlLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCiB0YXJnZXQvczM5MHgvaW9pbnN0LmMgICAgICAgICAgICAgICAgIHwgIDIgKy0K
IDM0IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDUyIGRlbGV0aW9ucygtKQoKLS0g
CjIuMjEuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
