Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280172B157
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 11:31:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVBwn-0002UL-DO; Mon, 27 May 2019 09:29:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iDkv=T3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hVBwl-0002U9-5g
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:29:35 +0000
X-Inumbo-ID: efd00ce9-8061-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id efd00ce9-8061-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 09:29:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u27so11551384lfg.10
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2019 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=P1gAu1mrglqggSbDLY3YWxRAcdHeoG5hxre+/93oNEE=;
 b=bOUQ+AcDyM0iH8U9DfM+wHAyPwM5FIgHI51Pfw/vnzLK/4YnTGSvt3MjWndfdNuV8J
 NwRjZP823EYDRqsQbBi4aanFL4XesVEb3I3A7IqkMvlMaLhIFljDUxifRMAUPx63wBCs
 zj2iDdjqsTwcxGWqP26h2nRUJoRQPzI/3NZl9UFRSVOM83OTWY3xKZOIj7iBKHEkyr1x
 2fUucH0OJH7iMpFf+BrGAeeeePC9HI8EKCaHw769tCNyenZIFkUFjCUHk0KovPPgb7Ld
 nn7ipq7hMqpHhL09CMHeky5F8oHjUZ3csU0i30N/u4g+TgJB15bl1dlq2a8jJdUeAFPo
 jtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P1gAu1mrglqggSbDLY3YWxRAcdHeoG5hxre+/93oNEE=;
 b=qXvO2Y0hNz6jg5HHSbD6pKAooR5dDcc8wyl5C9mXR3Vs+DFChWn5bCNMqFabhqeSyM
 bpJ2rvy2stPokRclvN79fM8/o/Td/bGZvBTMhTUYrY3waNZ3F6ekzqZQPbcWyS+3y143
 z1Eo3VhiQxYG+z4ZL46mV1az4hpgbA3qSpsTX3zsAz3xayqIrEyv5T5rHsr53A4e7gJp
 fQsjyuJ0xJXc16SsldSZRZWjYCOewREjUm1sMeQUTWRChS9zT2z77CLaNe6p70JoDvsd
 Tz95Gnern2/MWOBYigyhVIQX3VOAbuOObvVT32gF732yRe+E3NvDS7nhFPL36GrKM7/v
 arNA==
X-Gm-Message-State: APjAAAV8IA57U4j2IDIDJSzMtIcmCbP1hGka735I6OT7DEhJXGbEIN4O
 YBpOpa8c+143uejPHC3ipbDGC6sgm20=
X-Google-Smtp-Source: APXvYqzT4yBcjB6gWai6YdDXUoYlbvRzPzZ00Vb3UwNH+Endyt6UFI314rKcq17VJm+i8KObSUBuLQ==
X-Received: by 2002:ac2:46ef:: with SMTP id q15mr1384574lfo.63.1558949372571; 
 Mon, 27 May 2019 02:29:32 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id c8sm2165601ljk.77.2019.05.27.02.29.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 02:29:31 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 27 May 2019 12:29:30 +0300
Message-Id: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on interrupts
 processing
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClRoaXMgcmVkdWNl
cyB0aGUgbnVtYmVyIG9mIGNvbnRleHQgc3dpdGNoZXMgaW4gY2FzZSB3ZSBoYXZlIGNvbWluZyBn
dWVzdAppbnRlcnJ1cHRzIGZyb20gZGlmZmVyZW50IHNvdXJjZXMgYXQgYSBoaWdoIHJhdGUuIFdo
YXQgaXMgbGlrZWx5IGZvcgptdWx0aW1lZGlhIHVzZS1jYXNlcy4KSGF2aW5nIGlycXMgdW5sb2Nr
ZWQgaGVyZSBtYWtlcyB1cyBnbyB0aHJvdWdoIHRyYXAgcGF0aCBhZ2FpbiBpbiBjYXNlIHdlCmhh
dmUgYSBuZXcgZ3Vlc3QgaW50ZXJydXB0IGFycml2ZWQgKGV2ZW4gd2l0aCB0aGUgc2FtZSBwcmlv
cml0eSwgYWZ0ZXIKYGRlc2MtPmhhbmRsZXItPmVuZChkZXNjKWAgaW4gYGRvX0lSUSgpYCksIHdo
YXQgaXMganVzdCBhIHByb2Nlc3NvcgpjeWNsZXMgd2FzdGluZy4gV2Ugd2lsbCBjYXRjaCB0aGVt
IGFsbCBpbiB0aGUgYGdpY19pbnRlcnJ1cHQoKSBmdW5jdGlvbgpsb29wIGFueXdheS4gQW5kIHRo
ZSBndWVzdCBpcnFzIGFycml2YWwgcHJpb3JpdGl6YXRpb24gaXMgbWVhbmluZ2xlc3MKaGVyZSwg
aXQgaXMgb25seSBlZmZlY3RpdmUgYXQgZ3Vlc3QncyBsZXZlbC4KClNpZ25lZC1vZmYtYnk6IEFu
ZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Ci0tLQoKQ2hhbmdlczoKCiAgICBp
biB2MjogRHJvcCBpcnEgZW5hYmxpbmcgZm9yIGxwaSBwcm9jZXNzaW5nIGFzIHdlbGwuCgoKLS0t
CiB4ZW4vYXJjaC9hcm0vZ2ljLmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMuYyBiL3hlbi9hcmNoL2FybS9naWMu
YwppbmRleCA2Y2M3ZGVjLi4xMTM2NTVhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLmMK
KysrIGIveGVuL2FyY2gvYXJtL2dpYy5jCkBAIC0zODYsMTcgKzM4NiwxMyBAQCB2b2lkIGdpY19p
bnRlcnJ1cHQoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIGludCBpc19maXEpCiAKICAgICAg
ICAgaWYgKCBsaWtlbHkoaXJxID49IDE2ICYmIGlycSA8IDEwMjApICkKICAgICAgICAgewotICAg
ICAgICAgICAgbG9jYWxfaXJxX2VuYWJsZSgpOwogICAgICAgICAgICAgaXNiKCk7CiAgICAgICAg
ICAgICBkb19JUlEocmVncywgaXJxLCBpc19maXEpOwotICAgICAgICAgICAgbG9jYWxfaXJxX2Rp
c2FibGUoKTsKICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICggaXNfbHBpKGlycSkgKQogICAg
ICAgICB7Ci0gICAgICAgICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7CiAgICAgICAgICAgICBpc2Io
KTsKICAgICAgICAgICAgIGdpY19od19vcHMtPmRvX0xQSShpcnEpOwotICAgICAgICAgICAgbG9j
YWxfaXJxX2Rpc2FibGUoKTsKICAgICAgICAgfQogICAgICAgICBlbHNlIGlmICggdW5saWtlbHko
aXJxIDwgMTYpICkKICAgICAgICAgewotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
