Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAEF165E44
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 14:08:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lWm-000107-9m; Thu, 20 Feb 2020 13:06:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=OTtJ=4I=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1j4lWk-000102-Sx
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 13:06:02 +0000
X-Inumbo-ID: be4a00f8-53e1-11ea-8526-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id be4a00f8-53e1-11ea-8526-12813bfff9fa;
 Thu, 20 Feb 2020 13:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582203961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gs0Sx5MSe2ZHpufIPviwETvw5yj3kxXeAW695lKR/TM=;
 b=A04WDmT7du6YAyESCnsSFaoBhgshBttIxV2o/ek3kFqyvmXf+qEKtR1Q3hX9baegTuUXCn
 dt4tkthCmcD6+X5rv5+5mAS0ljOOGhn10GW1R6Y4pOx5DsPMyAEpbAcTde439f4FNMzqtD
 dq6ShylSvvrF6GdZ9wSGN4vilJ5liyQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-ccuY-e0gN7eZjnQ56ReGtQ-1; Thu, 20 Feb 2020 08:05:55 -0500
X-MC-Unique: ccuY-e0gN7eZjnQ56ReGtQ-1
Received: by mail-wr1-f72.google.com with SMTP id 90so1711273wrq.6
 for <xen-devel@lists.xenproject.org>; Thu, 20 Feb 2020 05:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gu1OfO+Xr177r6zD7C+F/TxHFq6mosreIYv9UCpXME0=;
 b=QfSyygPn0Po8IiPrMaq8tr3ygbQxWO13/A1PH/648ARcROaudVPoAjv6m+tG14Adqq
 fJaO+uzv6U/TQqQ3cVBUdxndSBJa7uDlSfFU4yvUquBppqI11dKkHXhxhNnbNBVJOp0+
 gCqn8gUjpeeJP7V74P2B73CPnPD5eUTLkIA1Kt4JQW0QoCPr6ZENG59913oN+caNot+b
 vrCAzScHPXjSlfmXao9hijrnA85wPg45d1UE/syGgOsR+QfIsgbzlIGfXffJe4e8vIvA
 C2afKeYCNDKLsTLdrDfd21zbFE2XFJxkRHuCWAVPCfOq9arlujHT+Op9SA7xeK4hX2hp
 qikw==
X-Gm-Message-State: APjAAAUpShrOBkRu+D9T00xz78GAtMZxSam+TRZZDHq0As+CIZ/YVtqo
 eaOqQM0Q5WnFOnqmgdHM/73UnL9nuNUCjaSEV5wtHGV4wcE52BBv7JbV6vxqDj0QtEUS9FOXc/L
 CUpR6DYSkJoRz3ItCoIzlJd9RNPs=
X-Received: by 2002:a1c:f713:: with SMTP id v19mr4357663wmh.113.1582203953758; 
 Thu, 20 Feb 2020 05:05:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqzh9hNepHCOwe2XDVm3wY3ajt8F8GOM+lVXRr3SymvEGFarpB4eXHypTAiBAMMl7y3VSmAESQ==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr4357638wmh.113.1582203953503; 
 Thu, 20 Feb 2020 05:05:53 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id b67sm4594690wmc.38.2020.02.20.05.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2020 05:05:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu, 20 Feb 2020 14:05:28 +0100
Message-Id: <20200220130548.29974-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 00/20] global exec/memory/dma APIs cleanup
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
Cc: Fam Zheng <fam@euphon.net>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Paul Durrant <paul@xen.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgaXMgaW5zcGlyZWQgZnJvbSBQZXRlciBNYXlkZWwgY2xlYW51cCBwYXRjaDoK
aHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNjgw
NjI1Lmh0bWwKCi0gQ29udmVydCAnaXNfd3JpdGUnIGFyZ3VtZW50IHRvIGJvb2xlYW4KLSBVc2Ug
dm9pZCBwb2ludGVyIGZvciBibG9iIGJ1ZmZlcgotIFJlbW92ZSB1bm5lY2Vzc2FyeSBjYXN0cyAo
U3RlZmFuIFdlaWwpCi0gUmVwbGFjZSBbQVBJXV9ydygpIGJ5IFtBUEldX3JlYWQvd3JpdGUoKSB3
aGVuIGlzX3dyaXRlIGlzIGNvbnN0YW50CgpTdXBlcnNlZGVzOiA8MjAyMDAyMTgxMTI0NTcuMjI3
MTItMS1wZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+CgpQZXRlciBNYXlkZWxsICgxKToKICBBdm9p
ZCBhZGRyZXNzX3NwYWNlX3J3KCkgd2l0aCBhIGNvbnN0YW50IGlzX3dyaXRlIGFyZ3VtZW50CgpQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSAoMTkpOgogIHNjcmlwdHMvZ2l0Lm9yZGVyZmlsZTogRGlz
cGxheSBDb2NjaSBzY3JpcHRzIGJlZm9yZSBjb2RlIG1vZGlmaWNhdGlvbnMKICBodzogUmVtb3Zl
IHVubmVjZXNzYXJ5IGNhc3Qgd2hlbiBjYWxsaW5nIGRtYV9tZW1vcnlfcmVhZCgpCiAgZXhlYzog
TGV0IHFlbXVfcmFtXyooKSBmdW5jdGlvbnMgdGFrZSBhIGNvbnN0IHBvaW50ZXIgYXJndW1lbnQK
ICBleGVjOiBSZW5hbWUgcmFtX3B0ciB2YXJpYWJsZQogIGV4ZWM6IExldCBmbGF0dmlldyBBUEkg
dGFrZSB2b2lkIHBvaW50ZXIgYXJndW1lbnRzCiAgZXhlYzogTGV0IHRoZSBhZGRyZXNzX3NwYWNl
IEFQSSB1c2Ugdm9pZCBwb2ludGVyIGFyZ3VtZW50cwogIGh3L25ldDogQXZvaWQgY2FzdGluZyBu
b24tY29uc3QgcG9pbnRlciwgdXNlIGFkZHJlc3Nfc3BhY2Vfd3JpdGUoKQogIFJlbW92ZSB1bm5l
Y2Vzc2FyeSBjYXN0IHdoZW4gdXNpbmcgdGhlIGFkZHJlc3Nfc3BhY2UgQVBJCiAgZXhlYzogTGV0
IHRoZSBjcHVfW3BoeXNpY2FsXV9tZW1vcnkgQVBJIHVzZSB2b2lkIHBvaW50ZXIgYXJndW1lbnRz
CiAgUmVtb3ZlIHVubmVjZXNzYXJ5IGNhc3Qgd2hlbiB1c2luZyB0aGUgY3B1X1twaHlzaWNhbF1f
bWVtb3J5IEFQSQogIGh3L2lkZS9pbnRlcm5hbDogUmVtb3ZlIHVudXNlZCBETUFSZXN0YXJ0RnVu
YyB0eXBlZGVmCiAgaHcvaWRlOiBMZXQgdGhlIERNQUludEZ1bmMgcHJvdG90eXBlIHVzZSBhIGJv
b2xlYW4gJ2lzX3dyaXRlJyBhcmd1bWVudAogIGh3L3ZpcnRpbzogTGV0IHZpcnRxdWV1ZV9tYXBf
aW92ZWMoKSB1c2UgYSBib29sZWFuICdpc193cml0ZScgYXJndW1lbnQKICBody92aXJ0aW86IExl
dCB2aG9zdF9tZW1vcnlfbWFwKCkgdXNlIGEgYm9vbGVhbiAnaXNfd3JpdGUnIGFyZ3VtZW50CiAg
ZXhlYzogTGV0IGFkZHJlc3Nfc3BhY2VfdW5tYXAoKSB1c2UgYSBib29sZWFuICdpc193cml0ZScg
YXJndW1lbnQKICBMZXQgYWRkcmVzc19zcGFjZV9ydygpIGNhbGxzIHBhc3MgYSBib29sZWFuICdp
c193cml0ZScgYXJndW1lbnQKICBleGVjOiBMZXQgY3B1X1twaHlzaWNhbF1fbWVtb3J5IEFQSSB1
c2UgYSBib29sZWFuICdpc193cml0ZScgYXJndW1lbnQKICBMZXQgY3B1X1twaHlzaWNhbF1fbWVt
b3J5KCkgY2FsbHMgcGFzcyBhIGJvb2xlYW4gJ2lzX3dyaXRlJyBhcmd1bWVudAogIEF2b2lkIGNw
dV9waHlzaWNhbF9tZW1vcnlfcncoKSB3aXRoIGEgY29uc3RhbnQgaXNfd3JpdGUgYXJndW1lbnQK
CiBzY3JpcHRzL2NvY2NpbmVsbGUvZXhlY19yd19jb25zdC5jb2NjaSB8IDEwMyArKysrKysrKysr
KysrKysrKysrKysrKysrCiBpbmNsdWRlL2V4ZWMvY3B1LWFsbC5oICAgICAgICAgICAgICAgICB8
ICAgMiArLQogaW5jbHVkZS9leGVjL2NwdS1jb21tb24uaCAgICAgICAgICAgICAgfCAgMTggKyst
LS0KIGluY2x1ZGUvZXhlYy9tZW1vcnkuaCAgICAgICAgICAgICAgICAgIHwgIDE2ICsrLS0KIGlu
Y2x1ZGUvaHcvaWRlL2ludGVybmFsLmggICAgICAgICAgICAgIHwgICAzICstCiBpbmNsdWRlL3N5
c2VtdS94ZW4tbWFwY2FjaGUuaCAgICAgICAgICB8ICAgNCArLQogdGFyZ2V0L2kzODYvaHZmL3Zt
eC5oICAgICAgICAgICAgICAgICAgfCAgIDcgKy0KIGFjY2VsL2t2bS9rdm0tYWxsLmMgICAgICAg
ICAgICAgICAgICAgIHwgICA2ICstCiBkbWEtaGVscGVycy5jICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgNCArLQogZXhlYy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NzUgKysrKysrKysrLS0tLS0tLS0tCiBody9hcm0vYm9vdC5jICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgNiArLQogaHcvYXJtL3NtbXUtY29tbW9uLmMgICAgICAgICAgICAgICAgICAgfCAg
IDMgKy0KIGh3L2FybS9zbW11djMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEwICstLQog
aHcvZGlzcGxheS9leHlub3M0MjEwX2ZpbWQuYyAgICAgICAgICAgfCAgIDMgKy0KIGh3L2Rpc3Bs
YXkvbWlsa3ltaXN0LXRtdTIuYyAgICAgICAgICAgIHwgICA4ICstCiBody9kaXNwbGF5L29tYXBf
ZHNzLmMgICAgICAgICAgICAgICAgICB8ICAgMiArLQogaHcvZGlzcGxheS9vbWFwX2xjZGMuYyAg
ICAgICAgICAgICAgICAgfCAgMTAgKy0tCiBody9kaXNwbGF5L3JhbWZiLmMgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArLQogaHcvZG1hL2V0cmF4ZnNfZG1hLmMgICAgICAgICAgICAgICAgICAg
fCAgMjUgKysrLS0tCiBody9kbWEvcmM0MDMwLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
MCArLS0KIGh3L2RtYS94bG54LXpkbWEuYyAgICAgICAgICAgICAgICAgICAgIHwgIDExICstLQog
aHcvaTM4Ni94ZW4veGVuLW1hcGNhY2hlLmMgICAgICAgICAgICAgfCAgIDIgKy0KIGh3L2lkZS9h
aGNpLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiBody9pZGUvY29yZS5jICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQogaHcvaWRlL21hY2lvLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKy0KIGh3L2lkZS9wY2kuYyAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAyICstCiBody9taXNjL3BjLXRlc3RkZXYuYyAgICAgICAgICAgICAgICAgICB8
ICAgMiArLQogaHcvbmV0L2NhZGVuY2VfZ2VtLmMgICAgICAgICAgICAgICAgICAgfCAgMjEgKysr
LS0KIGh3L25ldC9kcDgzOTN4LmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDcwICsrKysrKysr
Ky0tLS0tLS0tCiBody9uZXQvaTgyNTk2LmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAyNSAr
KystLS0KIGh3L25ldC9sYXNpX2k4MjU5Ni5jICAgICAgICAgICAgICAgICAgIHwgICA1ICstCiBo
dy9udnJhbS9zcGFwcl9udnJhbS5jICAgICAgICAgICAgICAgICB8ICAgNCArLQogaHcvcHBjL3Bu
dl9scGMuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIGh3L3BwYy9wcGM0NDBfdWMu
YyAgICAgICAgICAgICAgICAgICAgIHwgICA2ICstCiBody9wcGMvc3BhcHJfaGNhbGwuYyAgICAg
ICAgICAgICAgICAgICB8ICAgNCArLQogaHcvczM5MHgvY3NzLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgMTIgKy0tCiBody9zMzkweC9pcGwuYyAgICAgICAgICAgICAgICAgICAgICAgICB8
ICAgMiArLQogaHcvczM5MHgvczM5MC1wY2ktYnVzLmMgICAgICAgICAgICAgICAgfCAgIDIgKy0K
IGh3L3MzOTB4L3ZpcnRpby1jY3cuYyAgICAgICAgICAgICAgICAgIHwgICAyICstCiBody9zY3Np
L3Ztd19wdnNjc2kuYyAgICAgICAgICAgICAgICAgICB8ICAgOCArLQogaHcvc2Qvc2RoY2kuYyAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTUgKystLQogaHcvdmlydGlvL3Zob3N0LmMgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDggKy0KIGh3L3ZpcnRpby92aXJ0aW8uYyAgICAgICAgICAg
ICAgICAgICAgIHwgICA3ICstCiBody94ZW4veGVuX3B0X2dyYXBoaWNzLmMgICAgICAgICAgICAg
ICB8ICAgMiArLQogcXRlc3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNTIg
KysrKysrLS0tLS0tLQogdGFyZ2V0L2kzODYvaGF4LWFsbC5jICAgICAgICAgICAgICAgICAgfCAg
IDYgKy0KIHRhcmdldC9pMzg2L2h2Zi94ODZfbW11LmMgICAgICAgICAgICAgIHwgIDEyICstLQog
dGFyZ2V0L2kzODYvd2hweC1hbGwuYyAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHRhcmdldC9z
MzkweC9leGNwX2hlbHBlci5jICAgICAgICAgICAgIHwgICAyICstCiB0YXJnZXQvczM5MHgvaGVs
cGVyLmMgICAgICAgICAgICAgICAgICB8ICAgNiArLQogdGFyZ2V0L3MzOTB4L21tdV9oZWxwZXIu
YyAgICAgICAgICAgICAgfCAgIDIgKy0KIHNjcmlwdHMvZ2l0Lm9yZGVyZmlsZSAgICAgICAgICAg
ICAgICAgIHwgICAzICsKIDUyIGZpbGVzIGNoYW5nZWQsIDM2MCBpbnNlcnRpb25zKCspLCAyNjYg
ZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgc2NyaXB0cy9jb2NjaW5lbGxlL2V4ZWNf
cndfY29uc3QuY29jY2kKCi0tIAoyLjIxLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
