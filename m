Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17968AFA79
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:34:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zvK-00005M-2k; Wed, 11 Sep 2019 10:32:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiaO=XG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i7zvI-000059-97
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:32:28 +0000
X-Inumbo-ID: 731d45e0-d47f-11e9-978d-bc764e2007e4
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 731d45e0-d47f-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 10:32:27 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id q64so8938299ljb.12
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hviWMLdr06u4eT19wJOyn3Rxh1dmcmj/jL5IMjSt0HM=;
 b=hylIDiGEKzZKhvxX7ZfvD1NLsz2zDkGAx0aTTrBGvnO2WFadXhrAJWciE+MmSY9voV
 46HJ1InM5aU2rfAAA2WeYoWFk9YoPMDVlsnQJcVyD5I08Iaaa4totD3SfIk4ZHwoflrR
 3NMO08gUQhAUujnwfWVd+V86arlVjt5S8DtXeFXW+HJXdhZSCEixLGdK7pUFQXfKYMJz
 XtblOj81qAX1GOq6OZp21gmNHelz2cYIHy85u4mjUFOaFTpvG5Jn73NY63zCTLr1teRz
 xFZ/kHmlG/ilzfcyoQrDSIkvYGhwlCMDqyPEIWCvumCnCDiF581TUSJsxH4XPvhYHp2g
 ZIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hviWMLdr06u4eT19wJOyn3Rxh1dmcmj/jL5IMjSt0HM=;
 b=rZ3ynXfpA15HmmdPHj3taDbHJ66fPS6bvj6Xc4i95n0fHQbEiFli6ZOxlB903wMpuo
 aZrYsSmU0GQFh7QAkIp1AZhOovxy4DvZ6SQ1nHkCNWuIw3lIfFhb/CppmUwyl13DABgm
 SV2jxlgqQx/29hQ6xfTvnP3CcLV3BdxIQ5wbYO8d4mQIxQj1EcdTLfQFPEdJDAFtoXlc
 a3jmJ6HxfQj9y2YssAcGveo8HqyGAKu7i0yi7IGUig2xu9ybRAabdKbYWgPoiBIAcJLB
 k9hLhBmcPIRUU5A5vp8UkTvPUL3U71eWvRMcriFV6MSwZ935cSYQ1MFquelWUHVHE1Yg
 WZvQ==
X-Gm-Message-State: APjAAAWduQb/odW20LgaHWbn6/+XSFCx2DkGJfu5Y9d4wWhblagEsb4T
 OftADEM2KOJvBn0Zf1qIsyHHUZbCc7M=
X-Google-Smtp-Source: APXvYqw7R+q0NbK+qOCF25zpMlwAoZLN385TpygU3n+b6oeHXvQV2xW6kIRWLUOdTR/0KRxagSDx1w==
X-Received: by 2002:a2e:b0d2:: with SMTP id g18mr17936253ljl.91.1568197945882; 
 Wed, 11 Sep 2019 03:32:25 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w27sm4585275ljd.55.2019.09.11.03.32.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Sep 2019 03:32:24 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org,
	Dario Faggioli <dfaggioli@suse.com>
Date: Wed, 11 Sep 2019 13:32:13 +0300
Message-Id: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [RFC 0/9] Changes to time accounting
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
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoYXQgaXMgdGhl
IHNlY29uZCBhdHRlbXB0IG9mIHRoZSBjaGFuZ2VzIGZvciB0aGUgdGltZSBhY2NvdW50aW5nIGlu
IFhFTi4KVGhlIGluaXRpYWwgdG9waWMgaXMgaGVyZSBbMV0uCgpJbiB0aGlzIHNlcmllcyBpdCBp
cyBpbnRyb2R1Y2VkIGEgdGltZSBhY2NvdW50aW5nIGluZnJhc3RydWN0dXJlIHNlcGFyYXRlZApm
cm9tIHJ1bnN0YXRlcywgYW5kIG1hZGUgYW4gYXR0ZW1wdCB0byB1c2UgbmV3IGluZnJhIHNvbGVs
eSBmb3IgdGFraW5nIApzY2hlZHVsaW5nIGRlY2lzc2lvbnMuClRoaXMgc2VyaWVzIHN0aWxsIGVt
cGxveXMgaWRlYXMgb2YgdGhlIGluaXRpYWwgc2VyaWVzIGFib3V0IHdoYXQgaHlwZXJ2aXNvciwK
aWRsZSBhbmQgZ3Vlc3QgdGltZSBhcmUuCgpZZXQsIHRoaXMgc2VyaWVzIGxhY2tzIG9mIGNvbm5l
Y3Rpb24gYmV0d2VlbiBuZXcgdGltZSBhY2NvdW50aW5nIGluZnJhIGFuZApydW5zdGF0ZS4gVGhp
cyBpcyBUT0RPLCBjdXJyZW50bHkuCgpUaGUgbWFpbiBnb2FsIG9mIHRoaXMgd29yayBpcyB0byBp
bXByb3ZlIHRpbWUgYWNjb3VudGluZyBwcmVjaXNzaW9uIGFzIHdlbGwKYXMgYXZvaWRpbmcgY2hh
cmdpbmcgZ3Vlc3RzIGZvciB0aGUgb3RoZXIgZW50aXRpZXMgKGd1ZXN0cyBvciBoeXBlcnZpc29y
IGl0c2VsZikKd29yay4KCkNoYW5nZXMgZnJvbToKCkluaXRpYWwgUkZDIHNlcmllcyBbMV06CiAg
ICAtIFRpbWUgYWNjb3VudGluZyBtYWRlIGluZGVwZW5kZW50IGZyb20gcnVuc3RhdGVzIGluZnJh
c3RydWN0dXJlLgogICAgLSBEcm9wcGVkIG9kZCBwYXRjaGVzIHRvIEFSTTY0IGNvZGUuCgpbMV0g
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5
LTA3L21zZzAxODM5Lmh0bWwKCkFuZHJpaSBBbmlzb3YgKDkpOgogIHNjaGVkdWxlOiBJbnRyb2R1
Y2UgcGVyLXBjcHUgdGltZSBhY2NvdW50aW5nCiAgc3lzY3RsOiBleHRlbmQgWEVOX1NZU0NUTF9n
ZXRjcHVpbmZvIGludGVyZmFjZQogIHhlbnRvcDogc2hvdyBDUFUgbG9hZCBpbmZvcm1hdGlvbgog
IGFybTY0OiB1dGlsaXplIHRpbWUgYWNjb3VudGluZwogIHRhY2M6IEludHJvZHVjZSBhIGxvY2ts
ZXNzIGludGVyZmFjZSBmb3IgZ3Vlc3QgdGltZQogIHNjaGVkOnJ0ZHM6IGdldCBndWVzdCB0aW1l
IGZyb20gdGltZSBhY2NvdW50aW5nIGNvZGUKICB0YWNjOiBJbnRyb2R1Y2UgYSBsb2NrZWQgaW50
ZXJmYWNlIGZvciBndWVzdCB0aW1lCiAgc2NoZWQ6Y3JlZGl0OiBnZXQgZ3Vlc3QgdGltZSBmcm9t
IHRpbWUgYWNjb3VudGluZyBjb2RlCiAgc2NoZWQ6Y3JlZGl0MjogZ2V0IGd1ZXN0IHRpbWUgZnJv
bSB0aW1lIGFjY291bnRpbmcgY29kZQoKIHRvb2xzL3hlbnN0YXQvbGlieGVuc3RhdC9zcmMveGVu
c3RhdC5jICAgICAgfCAgNTAgKysrKysrKysrCiB0b29scy94ZW5zdGF0L2xpYnhlbnN0YXQvc3Jj
L3hlbnN0YXQuaCAgICAgIHwgIDE1ICsrKwogdG9vbHMveGVuc3RhdC9saWJ4ZW5zdGF0L3NyYy94
ZW5zdGF0X3ByaXYuaCB8ICAgNSArCiB0b29scy94ZW5zdGF0L3hlbnRvcC94ZW50b3AuYyAgICAg
ICAgICAgICAgIHwgIDM2ICsrKysrKwogeGVuL2FyY2gvYXJtL2FybTY0L2VudHJ5LlMgICAgICAg
ICAgICAgICAgICB8ICAzOSArKysrKystCiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyICsKIHhlbi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDUgKwogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyAgICAgICAgICAgICAg
ICAgICB8ICAxMiArLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQyLmMgICAgICAgICAgICAgICAg
ICB8ICAxNyArLS0KIHhlbi9jb21tb24vc2NoZWRfcnQuYyAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDQgKy0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgICAgICAgICAgICAgICAgICAgICAgfCAx
NjggKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNCArCiB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgg
ICAgICAgICAgICAgICAgIHwgICA0ICsKIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAg
ICAgICAgICAgICAgfCAgNTAgKysrKysrKysrCiAxNCBmaWxlcyBjaGFuZ2VkLCAzODYgaW5zZXJ0
aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pCgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
