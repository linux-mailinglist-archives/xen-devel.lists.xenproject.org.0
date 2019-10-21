Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 024D0DF24C
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 18:00:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMa3w-0008C4-Lr; Mon, 21 Oct 2019 15:57:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMa3u-0008Bp-S9
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:57:38 +0000
X-Inumbo-ID: 796c0786-f41b-11e9-a531-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 796c0786-f41b-11e9-a531-bc764e2007e4;
 Mon, 21 Oct 2019 15:57:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g24so4755669wmh.5
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LzVJRQ/OrflFRie8Ab9jbbnlLHJRH6wdZOJqJE01vJw=;
 b=cOCott3IlMS4VPQuhS1A9bXCgJ36PqouveqzFIX/xALcgYgN2ITLVknLZ6IskZ3A1O
 yiBDInlLLyUoJ//cZ3Y17Rv6Y/dsgUJBYGGcG5+jH0OsklmFsXHsHJra/aZJmEPuH/Yt
 7KsBkyJrorniwucdYZ6jaEX6f8w3ZY/nzKMUERXaYSFK3lbSKNJDvDcdXC6dAlDjNhXL
 sED7oYncDzZ/kqqkmZRf7Nt536krxYzr25iNpQw7YOVVqgSt0JM0ulMHsxzch2l9sVpQ
 7s7EONkXTZ//Az7AVvirNb0bLL52Ntg4Z2X0EcYKrPjYCChBfxvdvlLLAxV+ZumB2oR0
 c7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LzVJRQ/OrflFRie8Ab9jbbnlLHJRH6wdZOJqJE01vJw=;
 b=a9dVQjvjQKSvQ+YBbEHD7+PKvLeHynlm3BI5360MqvC3/HssDpqG6/RYZYVq4lhHib
 OZrXl00KEKlQtKb3YYvkMbxpoE3VpWR1zDddw94VFm5NBKtWTjSlnWOW7QB63ZlOWZYJ
 8eZlpemBXRjDefBwBdUThIAuoGS0C8Y9uLZKmmYtyjr6TzFXJxe218FGNERaGq6y3drp
 mH3aj2ZLU8/yCfo33YZUI7y3hN4WnpmDJ5qud5MZCIAtH0UY6vmkSGNC4w//ZiawPSDB
 qPVUPT/y2815HIH0EVxFaWuDz2tx0D5wuV7PeXlIGWPSskbMbmHwXqSvgBO+w9gyFaa3
 eNRQ==
X-Gm-Message-State: APjAAAUAdDWRHGTeYTcCvLE89lq8SLztkDyRdVzc3lzjrEO+OJcxaU9/
 YdCMPAQ52x24nC6USq7Vh9pFdoMu7EU=
X-Google-Smtp-Source: APXvYqzz/Kta5VBd7jInxuR3R8kaAQZgp7VU60sA8hcqypb8SutSv4zTfLJHuzmPKcpvp74dnssEqA==
X-Received: by 2002:a7b:cb54:: with SMTP id v20mr18859985wmj.119.1571673444539; 
 Mon, 21 Oct 2019 08:57:24 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id x12sm5667410wru.93.2019.10.21.08.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:57:24 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:57:12 +0100
Message-Id: <20191021155718.28653-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021155718.28653-1-liuwe@microsoft.com>
References: <20191021155718.28653-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v3 3/9] x86: drop hypervisor_cpuid_base
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIG9ubHkgdXNlciBpcyBYZW4gc3BlY2lmaWMgY29kZSBpbiBQViBzaGltLiBXZSBjYW4gdGhl
cmVmb3JlIGV4cG9ydAp0aGUgdmFyaWFibGUgZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyAg
ICB8IDcgKy0tLS0tLQogeGVuL2FyY2gveDg2L3B2L3NoaW0uYyAgICAgICAgICB8IDIgKy0KIHhl
bi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
Z3Vlc3QveGVuL3hlbi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYwppbmRleCA3Yjdh
NWJhZGFiLi43OGZjNjAzOTk2IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hl
bi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKQEAgLTM3LDcgKzM3LDcgQEAK
IAogYm9vbCBfX3JlYWRfbW9zdGx5IHhlbl9ndWVzdDsKIAotc3RhdGljIF9fcmVhZF9tb3N0bHkg
dWludDMyX3QgeGVuX2NwdWlkX2Jhc2U7CitfX3JlYWRfbW9zdGx5IHVpbnQzMl90IHhlbl9jcHVp
ZF9iYXNlOwogZXh0ZXJuIGNoYXIgaHlwZXJjYWxsX3BhZ2VbXTsKIHN0YXRpYyBzdHJ1Y3QgcmFu
Z2VzZXQgKm1lbTsKIApAQCAtMzAxLDExICszMDEsNiBAQCBpbnQgaHlwZXJ2aXNvcl9mcmVlX3Vu
dXNlZF9wYWdlKG1mbl90IG1mbikKICAgICByZXR1cm4gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKG1l
bSwgbWZuX3gobWZuKSwgbWZuX3gobWZuKSk7CiB9CiAKLXVpbnQzMl90IGh5cGVydmlzb3JfY3B1
aWRfYmFzZSh2b2lkKQotewotICAgIHJldHVybiB4ZW5fY3B1aWRfYmFzZTsKLX0KLQogc3RhdGlj
IHZvaWQgYXBfcmVzdW1lKHZvaWQgKnVudXNlZCkKIHsKICAgICBtYXBfdmNwdWluZm8oKTsKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5j
CmluZGV4IDVlZGJjZDlhYzUuLjU0NDFlODlkZTIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9w
di9zaGltLmMKKysrIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYwpAQCAtOTkwLDcgKzk5MCw3IEBA
IGRvbWlkX3QgZ2V0X2luaXRpYWxfZG9tYWluX2lkKHZvaWQpCiAgICAgaWYgKCAhcHZfc2hpbSAp
CiAgICAgICAgIHJldHVybiAwOwogCi0gICAgY3B1aWQoaHlwZXJ2aXNvcl9jcHVpZF9iYXNlKCkg
KyA0LCAmZWF4LCAmZWJ4LCAmZWN4LCAmZWR4KTsKKyAgICBjcHVpZCh4ZW5fY3B1aWRfYmFzZSAr
IDQsICZlYXgsICZlYngsICZlY3gsICZlZHgpOwogCiAgICAgcmV0dXJuIChlYXggJiBYRU5fSFZN
X0NQVUlEX0RPTUlEX1BSRVNFTlQpID8gZWN4IDogMTsKIH0KZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5o
CmluZGV4IDdlMDRlNGE3YWIuLmIwMTVlZDE4ODMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2Fz
bS14ODYvZ3Vlc3QveGVuLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaApA
QCAtMzAsMTMgKzMwLDEzIEBACiAKIGV4dGVybiBib29sIHhlbl9ndWVzdDsKIGV4dGVybiBib29s
IHB2X2NvbnNvbGU7CitleHRlcm4gdWludDMyX3QgeGVuX2NwdWlkX2Jhc2U7CiAKIHZvaWQgcHJv
YmVfaHlwZXJ2aXNvcih2b2lkKTsKIHZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKTsKIHZvaWQg
aHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKTsKIGludCBoeXBlcnZpc29yX2FsbG9jX3VudXNlZF9w
YWdlKG1mbl90ICptZm4pOwogaW50IGh5cGVydmlzb3JfZnJlZV91bnVzZWRfcGFnZShtZm5fdCBt
Zm4pOwotdWludDMyX3QgaHlwZXJ2aXNvcl9jcHVpZF9iYXNlKHZvaWQpOwogdm9pZCBoeXBlcnZp
c29yX3Jlc3VtZSh2b2lkKTsKIAogREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgdmNwdV9p
ZCk7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
