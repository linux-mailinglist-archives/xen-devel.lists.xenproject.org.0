Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F029DDA
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 20:16:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUEgj-00076W-C1; Fri, 24 May 2019 18:13:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qNey=TY=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hUEgi-00076P-BI
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 18:13:04 +0000
X-Inumbo-ID: 9101c14b-7e4f-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9101c14b-7e4f-11e9-8980-bc764e045a96;
 Fri, 24 May 2019 18:13:02 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y10so7815863lfl.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2019 11:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1VhFGqpRzYi36j0UdsAC5u3jd3GfJ2G+kRwRwEcdc1s=;
 b=SSg6jnrLlQg9Gdu8xPp7SwIaxEFRHE7ImaNawJ5oAhJRpxWRJlQhI00kwWOKIeWjrt
 Kdi9NcTTvPZCP8CJT8u22+/c2Bp14cqS1ICaKH7r9vj9aqJ5eLJE6ChPA5aaGO1WTItF
 MrKg+jrSR6RcDFILMRHPcLlmo0UJaGxTTfWJ1IlmmpBxqR4Dps60lTqEoIJ2iSQpMbAK
 Rs5DWzkeXkUYCgs+k4yKdSk65ok+b0bvNuyZbIOyOF5wO2wnZn4ngEB8s/Tx94Dul9ly
 gcz/6jh52tBFNJlT7dOVKriWNqlLWaRRXYjXQdAK182csUZ0zwPjZhK//MhBT5/TzqS6
 Lixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1VhFGqpRzYi36j0UdsAC5u3jd3GfJ2G+kRwRwEcdc1s=;
 b=GVct12bcM2boDKmOV78TGujtmTdfpCX5k2YD7tLtbDNZyQS3ebIjeM2U81k/TQx/sG
 fIWcFF5HYs9+0bFvb9vPMAetONjuzcZ2IUBoCtAm7AUbtk/EEkGk26F/XgAnQd0cH3pe
 JUIk6pHN+7tCRehsg0QZALIT3sDoUxCu3bhInM6UHEPejXHY+R23jnZBXVttRgcg0DSD
 lIK6UJVNCCOr8mJJL/ABjCkB5jNfJqRu3OnSm/HlcVyevHWxSbBVvCL0P3K3oPUFMrL3
 mDFetAiqCZEmtVjl5De6eD9vI8nlulAGD9CtEgl9+ODZ7nr9zAOK4mUBo59B4LkuKoot
 Z1eQ==
X-Gm-Message-State: APjAAAUumn5QXsS3FhpI0xotCG8kJYHjpoXT+i1YVWyJyI2mteTz+Nxx
 KeWGCikVm3yNxXfemF6El/k=
X-Google-Smtp-Source: APXvYqwQXezgNJ4ZHOtmb0vBiUcYIaKn7Eo0PNkuaif5t0zFk9vUMaqukHqO1WLc3yl+xqZbqJg5uQ==
X-Received: by 2002:a19:6b04:: with SMTP id d4mr23648108lfa.57.1558721580500; 
 Fri, 24 May 2019 11:13:00 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m25sm629438ljj.92.2019.05.24.11.12.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 24 May 2019 11:12:59 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: 
Date: Fri, 24 May 2019 21:12:54 +0300
Message-Id: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH RFC 2] [DO NOT APPLY] introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkFuIFJGQyB2ZXJz
aW9uIG9mIHRoZSBydW5zdGF0ZSByZWdpc3RyYXRpb24gd2l0aCBwaHlzIGFkZHJlc3MuClJ1bnN0
YXRlIGFyZWEgYWNjZXNzIGlzIGltcGxlbWVudGVkIHdpdGggbWFwcGluZyBvbiBlYWNoIHVwZGF0
ZSBvbmNlIGZvcgphbGwgYWNjZXNzZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyaWkgQW5pc292IDxh
bmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9kb21haW4uYyAgICAgfCAg
NjMgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIHhlbi9jb21tb24vZG9tYWluLmMgICAg
ICAgfCAxMDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQog
eGVuL2luY2x1ZGUvcHVibGljL3ZjcHUuaCB8ICAxNSArKysrKysrCiB4ZW4vaW5jbHVkZS94ZW4v
c2NoZWQuaCAgIHwgIDI4ICsrKysrKysrKy0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTkwIGluc2Vy
dGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYwppbmRleCBhOWY3ZmY1Li4wNGM0Y2ZmIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMKKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5j
CkBAIC0yNzQsMTcgKzI3NCwxNSBAQCBzdGF0aWMgdm9pZCBjdHh0X3N3aXRjaF90byhzdHJ1Y3Qg
dmNwdSAqbikKICAgICB2aXJ0X3RpbWVyX3Jlc3RvcmUobik7CiB9CiAKLS8qIFVwZGF0ZSBwZXIt
VkNQVSBndWVzdCBydW5zdGF0ZSBzaGFyZWQgbWVtb3J5IGFyZWEgKGlmIHJlZ2lzdGVyZWQpLiAq
Lwotc3RhdGljIHZvaWQgdXBkYXRlX3J1bnN0YXRlX2FyZWEoc3RydWN0IHZjcHUgKnYpCitzdGF0
aWMgdm9pZCB1cGRhdGVfcnVuc3RhdGVfYnlfZ3ZhZGRyKHN0cnVjdCB2Y3B1ICp2KQogewogICAg
IHZvaWQgX191c2VyICpndWVzdF9oYW5kbGUgPSBOVUxMOwogCi0gICAgaWYgKCBndWVzdF9oYW5k
bGVfaXNfbnVsbChydW5zdGF0ZV9ndWVzdCh2KSkgKQotICAgICAgICByZXR1cm47CisgICAgQVNT
RVJUKCFndWVzdF9oYW5kbGVfaXNfbnVsbChydW5zdGF0ZV9ndWVzdF92aXJ0KHYpKSk7CiAKICAg
ICBpZiAoIFZNX0FTU0lTVCh2LT5kb21haW4sIHJ1bnN0YXRlX3VwZGF0ZV9mbGFnKSApCiAgICAg
ewotICAgICAgICBndWVzdF9oYW5kbGUgPSAmdi0+cnVuc3RhdGVfZ3Vlc3QucC0+c3RhdGVfZW50
cnlfdGltZSArIDE7CisgICAgICAgIGd1ZXN0X2hhbmRsZSA9ICZ2LT5ydW5zdGF0ZV9ndWVzdC52
aXJ0LnAtPnN0YXRlX2VudHJ5X3RpbWUgKyAxOwogICAgICAgICBndWVzdF9oYW5kbGUtLTsKICAg
ICAgICAgdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSB8PSBYRU5fUlVOU1RBVEVfVVBEQVRF
OwogICAgICAgICBfX3Jhd19jb3B5X3RvX2d1ZXN0KGd1ZXN0X2hhbmRsZSwKQEAgLTI5Miw3ICsy
OTAsNyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcnVuc3RhdGVfYXJlYShzdHJ1Y3QgdmNwdSAqdikK
ICAgICAgICAgc21wX3dtYigpOwogICAgIH0KIAotICAgIF9fY29weV90b19ndWVzdChydW5zdGF0
ZV9ndWVzdCh2KSwgJnYtPnJ1bnN0YXRlLCAxKTsKKyAgICBfX2NvcHlfdG9fZ3Vlc3QocnVuc3Rh
dGVfZ3Vlc3RfdmlydCh2KSwgJnYtPnJ1bnN0YXRlLCAxKTsKIAogICAgIGlmICggZ3Vlc3RfaGFu
ZGxlICkKICAgICB7CkBAIC0zMDMsNiArMzAxLDU4IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9ydW5z
dGF0ZV9hcmVhKHN0cnVjdCB2Y3B1ICp2KQogICAgIH0KIH0KIAorZXh0ZXJuIGludCBtYXBfcnVu
c3RhdGVfYXJlYShzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqKmFy
ZWEpOworZXh0ZXJuIHZvaWQgdW5tYXBfcnVuc3RhdGVfYXJlYShzdHJ1Y3QgdmNwdV9ydW5zdGF0
ZV9pbmZvICphcmVhKTsKKworc3RhdGljIHZvaWQgdXBkYXRlX3J1bnN0YXRlX2J5X2dwYWRkcihz
dHJ1Y3QgdmNwdSAqdikKK3sKKyAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvICpydW5zdGF0
ZTsKKworICAgIGlmICggbWFwX3J1bnN0YXRlX2FyZWEodiwgJnJ1bnN0YXRlKSApCisgICAgICAg
IHJldHVybjsKKworICAgIGlmICggVk1fQVNTSVNUKHYtPmRvbWFpbiwgcnVuc3RhdGVfdXBkYXRl
X2ZsYWcpICkKKyAgICB7CisgICAgICAgIHJ1bnN0YXRlLT5zdGF0ZV9lbnRyeV90aW1lIHw9IFhF
Tl9SVU5TVEFURV9VUERBVEU7CisgICAgICAgIHNtcF93bWIoKTsKKyAgICAgICAgdi0+cnVuc3Rh
dGUuc3RhdGVfZW50cnlfdGltZSB8PSBYRU5fUlVOU1RBVEVfVVBEQVRFOworICAgIH0KKworICAg
IG1lbWNweShydW5zdGF0ZSwgJnYtPnJ1bnN0YXRlLCBzaXplb2Yodi0+cnVuc3RhdGUpKTsKKwor
ICAgIGlmICggVk1fQVNTSVNUKHYtPmRvbWFpbiwgcnVuc3RhdGVfdXBkYXRlX2ZsYWcpICkKKyAg
ICB7CisgICAgICAgIHJ1bnN0YXRlLT5zdGF0ZV9lbnRyeV90aW1lICY9IH5YRU5fUlVOU1RBVEVf
VVBEQVRFOworICAgICAgICBzbXBfd21iKCk7CisgICAgICAgIHYtPnJ1bnN0YXRlLnN0YXRlX2Vu
dHJ5X3RpbWUgJj0gflhFTl9SVU5TVEFURV9VUERBVEU7CisgICAgfQorCisgICAgdW5tYXBfcnVu
c3RhdGVfYXJlYShydW5zdGF0ZSk7Cit9CisKKy8qIFVwZGF0ZSBwZXItVkNQVSBndWVzdCBydW5z
dGF0ZSBzaGFyZWQgbWVtb3J5IGFyZWEgKGlmIHJlZ2lzdGVyZWQpLiAqLworc3RhdGljIHZvaWQg
dXBkYXRlX3J1bnN0YXRlX2FyZWEoc3RydWN0IHZjcHUgKnYpCit7CisgICAgaWYgKCB4Y2hnKCZ2
LT5ydW5zdGF0ZV9pbl91c2UsIDEpICkKKyAgICAgICAgcmV0dXJuOworCisgICAgc3dpdGNoICgg
di0+cnVuc3RhdGVfZ3Vlc3RfdHlwZSApCisgICAgeworICAgIGNhc2UgUlVOU1RBVEVfTk9ORToK
KyAgICAgICBicmVhazsKKworICAgIGNhc2UgUlVOU1RBVEVfVkFERFI6CisgICAgICAgdXBkYXRl
X3J1bnN0YXRlX2J5X2d2YWRkcih2KTsKKyAgICAgICBicmVhazsKKworICAgIGNhc2UgUlVOU1RB
VEVfUEFERFI6CisgICAgICAgdXBkYXRlX3J1bnN0YXRlX2J5X2dwYWRkcih2KTsKKyAgICAgICBi
cmVhazsKKyAgICB9CisKKyAgICB4Y2hnKCZ2LT5ydW5zdGF0ZV9pbl91c2UsIDApOworfQorCiBz
dGF0aWMgdm9pZCBzY2hlZHVsZV90YWlsKHN0cnVjdCB2Y3B1ICpwcmV2KQogewogICAgIGN0eHRf
c3dpdGNoX2Zyb20ocHJldik7CkBAIC05OTgsNiArMTA0OCw3IEBAIGxvbmcgZG9fYXJtX3ZjcHVf
b3AoaW50IGNtZCwgdW5zaWduZWQgaW50IHZjcHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2
b2lkKSBhCiAgICAgewogICAgICAgICBjYXNlIFZDUFVPUF9yZWdpc3Rlcl92Y3B1X2luZm86CiAg
ICAgICAgIGNhc2UgVkNQVU9QX3JlZ2lzdGVyX3J1bnN0YXRlX21lbW9yeV9hcmVhOgorICAgICAg
ICBjYXNlIFZDUFVPUF9yZWdpc3Rlcl9ydW5zdGF0ZV9waHlzX21lbW9yeV9hcmVhOgogICAgICAg
ICAgICAgcmV0dXJuIGRvX3ZjcHVfb3AoY21kLCB2Y3B1aWQsIGFyZyk7CiAgICAgICAgIGRlZmF1
bHQ6CiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
ZG9tYWluLmMgYi94ZW4vY29tbW9uL2RvbWFpbi5jCmluZGV4IDMyYmNhOGQuLmYxNjdhNjggMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9tYWluLmMKKysrIGIveGVuL2NvbW1vbi9kb21haW4uYwpA
QCAtNzAwLDYgKzcwMCw2OCBAQCBpbnQgcmN1X2xvY2tfbGl2ZV9yZW1vdGVfZG9tYWluX2J5X2lk
KGRvbWlkX3QgZG9tLCBzdHJ1Y3QgZG9tYWluICoqZCkKICAgICByZXR1cm4gMDsKIH0KIAordm9p
ZCB1bm1hcF9ydW5zdGF0ZV9hcmVhKHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gKmFyZWEpCit7
CisgICAgbWZuX3QgbWZuOworCisgICAgQVNTRVJUKGFyZWEgIT0gTlVMTCk7CisKKyAgICBtZm4g
PSBfbWZuKGRvbWFpbl9wYWdlX21hcF90b19tZm4oYXJlYSkpOworCisgICAgdW5tYXBfZG9tYWlu
X3BhZ2VfZ2xvYmFsKCh2b2lkICopCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICgodW5z
aWduZWQgbG9uZylhcmVhICYKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfTUFT
SykpOworCisgICAgcHV0X3BhZ2VfYW5kX3R5cGUobWZuX3RvX3BhZ2UobWZuKSk7Cit9CisKK2lu
dCBtYXBfcnVuc3RhdGVfYXJlYShzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IHZjcHVfcnVuc3RhdGVf
aW5mbyAqKmFyZWEpCit7CisgICAgdW5zaWduZWQgbG9uZyBvZmZzZXQgPSB2LT5ydW5zdGF0ZV9n
dWVzdC5waHlzICYgflBBR0VfTUFTSzsKKyAgICBnZm5fdCBnZm4gPSBnYWRkcl90b19nZm4odi0+
cnVuc3RhdGVfZ3Vlc3QucGh5cyk7CisgICAgc3RydWN0IGRvbWFpbiAqZCA9IHYtPmRvbWFpbjsK
KyAgICB2b2lkICptYXBwaW5nOworICAgIHN0cnVjdCBwYWdlX2luZm8gKnBhZ2U7CisgICAgc2l6
ZV90IHNpemUgPSBzaXplb2Yoc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyk7CisKKyAgICBpZiAo
IG9mZnNldCA+IChQQUdFX1NJWkUgLSBzaXplKSApCisgICAgICAgIHJldHVybiAtRUlOVkFMOwor
CisgICAgcGFnZSA9IGdldF9wYWdlX2Zyb21fZ2ZuKGQsIGdmbl94KGdmbiksIE5VTEwsIFAyTV9B
TExPQyk7CisgICAgaWYgKCAhcGFnZSApCisgICAgICAgIHJldHVybiAtRUlOVkFMOworCisgICAg
aWYgKCAhZ2V0X3BhZ2VfdHlwZShwYWdlLCBQR1Rfd3JpdGFibGVfcGFnZSkgKQorICAgIHsKKyAg
ICAgICAgcHV0X3BhZ2UocGFnZSk7CisgICAgICAgIHJldHVybiAtRUlOVkFMOworICAgIH0KKwor
ICAgIG1hcHBpbmcgPSBfX21hcF9kb21haW5fcGFnZV9nbG9iYWwocGFnZSk7CisKKyAgICBpZiAo
IG1hcHBpbmcgPT0gTlVMTCApCisgICAgeworICAgICAgICBwdXRfcGFnZV9hbmRfdHlwZShwYWdl
KTsKKyAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgfQorCisgICAgKmFyZWEgPSBtYXBwaW5n
ICsgb2Zmc2V0OworCisgICAgcmV0dXJuIDA7Cit9CisKK3N0YXRpYyB2b2lkIGRpc2NhcmRfcnVu
c3RhdGVfYXJlYShzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICB2LT5ydW5zdGF0ZV9ndWVzdF90eXBl
ID0gUlVOU1RBVEVfTk9ORTsKK30KKworc3RhdGljIHZvaWQgZGlzY2FyZF9ydW5zdGF0ZV9hcmVh
X2xvY2tlZChzdHJ1Y3QgdmNwdSAqdikKK3sKKyAgICB3aGlsZSAoIHhjaGcoJnYtPnJ1bnN0YXRl
X2luX3VzZSwgMSkgKTsKKyAgICBkaXNjYXJkX3J1bnN0YXRlX2FyZWEodik7CisgICAgeGNoZygm
di0+cnVuc3RhdGVfaW5fdXNlLCAwKTsKK30KKwogaW50IGRvbWFpbl9raWxsKHN0cnVjdCBkb21h
aW4gKmQpCiB7CiAgICAgaW50IHJjID0gMDsKQEAgLTczOCw3ICs4MDAsMTAgQEAgaW50IGRvbWFp
bl9raWxsKHN0cnVjdCBkb21haW4gKmQpCiAgICAgICAgIGlmICggY3B1cG9vbF9tb3ZlX2RvbWFp
bihkLCBjcHVwb29sMCkgKQogICAgICAgICAgICAgcmV0dXJuIC1FUkVTVEFSVDsKICAgICAgICAg
Zm9yX2VhY2hfdmNwdSAoIGQsIHYgKQorICAgICAgICB7CisgICAgICAgICAgICBkaXNjYXJkX3J1
bnN0YXRlX2FyZWFfbG9ja2VkKHYpOwogICAgICAgICAgICAgdW5tYXBfdmNwdV9pbmZvKHYpOwor
ICAgICAgICB9CiAgICAgICAgIGQtPmlzX2R5aW5nID0gRE9NRFlJTkdfZGVhZDsKICAgICAgICAg
LyogTWVtIGV2ZW50IGNsZWFudXAgaGFzIHRvIGdvIGhlcmUgYmVjYXVzZSB0aGUgcmluZ3MgCiAg
ICAgICAgICAqIGhhdmUgdG8gYmUgcHV0IGJlZm9yZSB3ZSBjYWxsIHB1dF9kb21haW4uICovCkBA
IC0xMTkyLDcgKzEyNTcsNyBAQCBpbnQgZG9tYWluX3NvZnRfcmVzZXQoc3RydWN0IGRvbWFpbiAq
ZCkKIAogICAgIGZvcl9lYWNoX3ZjcHUgKCBkLCB2ICkKICAgICB7Ci0gICAgICAgIHNldF94ZW5f
Z3Vlc3RfaGFuZGxlKHJ1bnN0YXRlX2d1ZXN0KHYpLCBOVUxMKTsKKyAgICAgICAgZGlzY2FyZF9y
dW5zdGF0ZV9hcmVhX2xvY2tlZCh2KTsKICAgICAgICAgdW5tYXBfdmNwdV9pbmZvKHYpOwogICAg
IH0KIApAQCAtMTUyMCwxOCArMTU4NSw0NiBAQCBsb25nIGRvX3ZjcHVfb3AoaW50IGNtZCwgdW5z
aWduZWQgaW50IHZjcHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpCiAgICAg
ICAgICAgICBicmVhazsKIAogICAgICAgICByYyA9IDA7Ci0gICAgICAgIHJ1bnN0YXRlX2d1ZXN0
KHYpID0gYXJlYS5hZGRyLmg7CisKKyAgICAgICAgd2hpbGUoIHhjaGcoJnYtPnJ1bnN0YXRlX2lu
X3VzZSwgMSkgPT0gMCk7CisKKyAgICAgICAgZGlzY2FyZF9ydW5zdGF0ZV9hcmVhKHYpOworCisg
ICAgICAgIHJ1bnN0YXRlX2d1ZXN0X3ZpcnQodikgPSBhcmVhLmFkZHIuaDsKKyAgICAgICAgdi0+
cnVuc3RhdGVfZ3Vlc3RfdHlwZSA9IFJVTlNUQVRFX1ZBRERSOwogCiAgICAgICAgIGlmICggdiA9
PSBjdXJyZW50ICkKICAgICAgICAgewotICAgICAgICAgICAgX19jb3B5X3RvX2d1ZXN0KHJ1bnN0
YXRlX2d1ZXN0KHYpLCAmdi0+cnVuc3RhdGUsIDEpOworICAgICAgICAgICAgX19jb3B5X3RvX2d1
ZXN0KHJ1bnN0YXRlX2d1ZXN0X3ZpcnQodiksICZ2LT5ydW5zdGF0ZSwgMSk7CiAgICAgICAgIH0K
ICAgICAgICAgZWxzZQogICAgICAgICB7CiAgICAgICAgICAgICB2Y3B1X3J1bnN0YXRlX2dldCh2
LCAmcnVuc3RhdGUpOwotICAgICAgICAgICAgX19jb3B5X3RvX2d1ZXN0KHJ1bnN0YXRlX2d1ZXN0
KHYpLCAmcnVuc3RhdGUsIDEpOworICAgICAgICAgICAgX19jb3B5X3RvX2d1ZXN0KHJ1bnN0YXRl
X2d1ZXN0X3ZpcnQodiksICZydW5zdGF0ZSwgMSk7CiAgICAgICAgIH0KIAorICAgICAgICB4Y2hn
KCZ2LT5ydW5zdGF0ZV9pbl91c2UsIDApOworCisgICAgICAgIGJyZWFrOworICAgIH0KKworICAg
IGNhc2UgVkNQVU9QX3JlZ2lzdGVyX3J1bnN0YXRlX3BoeXNfbWVtb3J5X2FyZWE6CisgICAgewor
ICAgICAgICBzdHJ1Y3QgdmNwdV9yZWdpc3Rlcl9ydW5zdGF0ZV9tZW1vcnlfYXJlYSBhcmVhOwor
CisgICAgICAgIHJjID0gLUVGQVVMVDsKKyAgICAgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJmFy
ZWEsIGFyZywgMSkgKQorICAgICAgICAgICAgIGJyZWFrOworCisgICAgICAgIHdoaWxlKCB4Y2hn
KCZ2LT5ydW5zdGF0ZV9pbl91c2UsIDEpID09IDApOworCisgICAgICAgIGRpc2NhcmRfcnVuc3Rh
dGVfYXJlYSh2KTsKKyAgICAgICAgdi0+cnVuc3RhdGVfZ3Vlc3QucGh5cyA9IGFyZWEuYWRkci5w
OworICAgICAgICB2LT5ydW5zdGF0ZV9ndWVzdF90eXBlID0gUlVOU1RBVEVfUEFERFI7CisKKyAg
ICAgICAgeGNoZygmdi0+cnVuc3RhdGVfaW5fdXNlLCAwKTsKKyAgICAgICAgcmMgPSAwOworCiAg
ICAgICAgIGJyZWFrOwogICAgIH0KIApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3Zj
cHUuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy92Y3B1LmgKaW5kZXggMzYyM2FmOS4uZDdkYTRhMyAx
MDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3ZjcHUuaAorKysgYi94ZW4vaW5jbHVkZS9w
dWJsaWMvdmNwdS5oCkBAIC0yMzUsNiArMjM1LDIxIEBAIHN0cnVjdCB2Y3B1X3JlZ2lzdGVyX3Rp
bWVfbWVtb3J5X2FyZWEgewogdHlwZWRlZiBzdHJ1Y3QgdmNwdV9yZWdpc3Rlcl90aW1lX21lbW9y
eV9hcmVhIHZjcHVfcmVnaXN0ZXJfdGltZV9tZW1vcnlfYXJlYV90OwogREVGSU5FX1hFTl9HVUVT
VF9IQU5ETEUodmNwdV9yZWdpc3Rlcl90aW1lX21lbW9yeV9hcmVhX3QpOwogCisvKgorICogUmVn
aXN0ZXIgYSBzaGFyZWQgbWVtb3J5IGFyZWEgZnJvbSB3aGljaCB0aGUgZ3Vlc3QgbWF5IG9idGFp
biBpdHMgb3duCisgKiBydW5zdGF0ZSBpbmZvcm1hdGlvbiB3aXRob3V0IG5lZWRpbmcgdG8gZXhl
Y3V0ZSBhIGh5cGVyY2FsbC4KKyAqIE5vdGVzOgorICogIDEuIFRoZSByZWdpc3RlcmVkIGFkZHJl
c3MgbXVzdCBiZSBndWVzdCdzIHBoeXNpY2FsIGFkZHJlc3MuCisgKiAgMi4gVGhlIHJlZ2lzdGVy
ZWQgcnVuc3RhdGUgYXJlYSBzaG91bGQgbm90IGNyb3NzIHBhZ2UgYm91bmRhcnkuCisgKiAgMy4g
T25seSBvbmUgc2hhcmVkIGFyZWEgbWF5IGJlIHJlZ2lzdGVyZWQgcGVyIFZDUFUuIFRoZSBzaGFy
ZWQgYXJlYSBpcworICogICAgIHVwZGF0ZWQgYnkgdGhlIGh5cGVydmlzb3IgZWFjaCB0aW1lIHRo
ZSBWQ1BVIGlzIHNjaGVkdWxlZC4gVGh1cworICogICAgIHJ1bnN0YXRlLnN0YXRlIHdpbGwgYWx3
YXlzIGJlIFJVTlNUQVRFX3J1bm5pbmcgYW5kCisgKiAgICAgcnVuc3RhdGUuc3RhdGVfZW50cnlf
dGltZSB3aWxsIGluZGljYXRlIHRoZSBzeXN0ZW0gdGltZSBhdCB3aGljaCB0aGUKKyAqICAgICBW
Q1BVIHdhcyBsYXN0IHNjaGVkdWxlZCB0byBydW4uCisgKiBAZXh0cmFfYXJnID09IHBvaW50ZXIg
dG8gdmNwdV9yZWdpc3Rlcl9ydW5zdGF0ZV9tZW1vcnlfYXJlYSBzdHJ1Y3R1cmUuCisgKi8KKyNk
ZWZpbmUgVkNQVU9QX3JlZ2lzdGVyX3J1bnN0YXRlX3BoeXNfbWVtb3J5X2FyZWEgMTQKKwogI2Vu
ZGlmIC8qIF9fWEVOX1BVQkxJQ19WQ1BVX0hfXyAqLwogCiAvKgpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAppbmRleCBlZGVlNTJk
Li44YWM1OTdiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAorKysgYi94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaApAQCAtMTYzLDE3ICsxNjMsMzEgQEAgc3RydWN0IHZjcHUKICAg
ICB2b2lkICAgICAgICAgICAgKnNjaGVkX3ByaXY7ICAgIC8qIHNjaGVkdWxlci1zcGVjaWZpYyBk
YXRhICovCiAKICAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvIHJ1bnN0YXRlOworCisgICAg
ZW51bSB7CisgICAgICAgIFJVTlNUQVRFX05PTkUgPSAwLAorICAgICAgICBSVU5TVEFURV9QQURE
UiA9IDEsCisgICAgICAgIFJVTlNUQVRFX1ZBRERSID0gMiwKKyAgICB9IHJ1bnN0YXRlX2d1ZXN0
X3R5cGU7CisKKyAgICB1bnNpZ25lZCBsb25nIHJ1bnN0YXRlX2luX3VzZTsKKworICAgIHVuaW9u
CisgICAgewogI2lmbmRlZiBDT05GSUdfQ09NUEFUCi0jIGRlZmluZSBydW5zdGF0ZV9ndWVzdCh2
KSAoKHYpLT5ydW5zdGF0ZV9ndWVzdCkKLSAgICBYRU5fR1VFU1RfSEFORExFKHZjcHVfcnVuc3Rh
dGVfaW5mb190KSBydW5zdGF0ZV9ndWVzdDsgLyogZ3Vlc3QgYWRkcmVzcyAqLworIyBkZWZpbmUg
cnVuc3RhdGVfZ3Vlc3RfdmlydCh2KSAoKHYpLT5ydW5zdGF0ZV9ndWVzdC52aXJ0KQorICAgICAg
ICAgICBYRU5fR1VFU1RfSEFORExFKHZjcHVfcnVuc3RhdGVfaW5mb190KSB2aXJ0OyAvKiBndWVz
dCBhZGRyZXNzICovCiAjZWxzZQotIyBkZWZpbmUgcnVuc3RhdGVfZ3Vlc3QodikgKCh2KS0+cnVu
c3RhdGVfZ3Vlc3QubmF0aXZlKQotICAgIHVuaW9uIHsKLSAgICAgICAgWEVOX0dVRVNUX0hBTkRM
RSh2Y3B1X3J1bnN0YXRlX2luZm9fdCkgbmF0aXZlOwotICAgICAgICBYRU5fR1VFU1RfSEFORExF
KHZjcHVfcnVuc3RhdGVfaW5mb19jb21wYXRfdCkgY29tcGF0OwotICAgIH0gcnVuc3RhdGVfZ3Vl
c3Q7IC8qIGd1ZXN0IGFkZHJlc3MgKi8KKyMgZGVmaW5lIHJ1bnN0YXRlX2d1ZXN0X3ZpcnQodikg
KCh2KS0+cnVuc3RhdGVfZ3Vlc3QudmlydC5uYXRpdmUpCisgICAgICAgICAgIHVuaW9uIHsKKyAg
ICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEUodmNwdV9ydW5zdGF0ZV9pbmZvX3QpIG5hdGl2
ZTsKKyAgICAgICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEUodmNwdV9ydW5zdGF0ZV9pbmZvX2Nv
bXBhdF90KSBjb21wYXQ7CisgICAgICAgICAgIH0gdmlydDsgLyogZ3Vlc3QgYWRkcmVzcyAqLwog
I2VuZGlmCiAKKyAgICAgICAgcGFkZHJfdCBwaHlzOworICAgIH0gcnVuc3RhdGVfZ3Vlc3Q7CisK
ICAgICAvKiBsYXN0IHRpbWUgd2hlbiB2Q1BVIGlzIHNjaGVkdWxlZCBvdXQgKi8KICAgICB1aW50
NjRfdCBsYXN0X3J1bl90aW1lOwogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
