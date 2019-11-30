Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3E10DD8F
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 13:00:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ib1OE-0004xn-GW; Sat, 30 Nov 2019 11:58:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rqrT=ZW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ib1OD-0004xP-Li
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 11:58:17 +0000
X-Inumbo-ID: a0a926be-1368-11ea-a55d-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0a926be-1368-11ea-a55d-bc764e2007e4;
 Sat, 30 Nov 2019 11:57:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z7so34679617wrl.13
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 03:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cP76/cS0Q1i/wf27JixlotPAM1oHWVpKqPMlb1E5RNc=;
 b=qgqFzb61/MwHekLL2zc4ueue6TPByWS9JAf32t5kfixkfOCbNjsUG6K2ZUg5QgUyi8
 J8clL0cUPRVN79qyNn6E4FHyv4AsMUF8OjZKy20pIa8VxCm1N8CbBB+3HkCnUiD3ZcyL
 3j2+QJ9OoWTvp70kraX2lHGKJRyHt2BroXucX3iTpGM9UBF1m1pW/7HdUX82LqUU079X
 uiRJ8e8ldoYOM/9hiGFLY+m5g7DiKZ/qFOqgXRojKkEqyPmfD4/TF441dqyooqzRkeTA
 PLHKByNy/S3fXVCNDd7or/vmx6TxpmSa7sddOn80y/XwgOkHodd3SjKALhGmwwD6bPE8
 5LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cP76/cS0Q1i/wf27JixlotPAM1oHWVpKqPMlb1E5RNc=;
 b=kcQuN2nM2Om7N0L8vj7c5KdnliA6BztuK0pdfu9YDL7G7RPQs8NqScamBoQherMuQI
 Wv75Pikonp/5PmNFA7MCiBSgtTrYw/7HCLWgPaYuY0M1gfbtm4BspP/oDwVl/DSsuzzO
 4xAGeRgX54fgLb8p12swAEHBGPekiMTRo/sJPlymR9fVVGNXYP1uaW4LufUc1kZDToAY
 Jx89s+4fcNdN0k4yXFeAYZ1evxrLsXMEleumtnH1EJUhHGDdOlY9faz+EOkFsh+IDzJz
 DGpp31uUCpIaGzbhoxPgpi7PYjpEfdWAACHKYXU7vkZ7DSx/yuFwDVeGORo+M9Qg/a7B
 K3Vg==
X-Gm-Message-State: APjAAAW9C2zAxqBLh3uPBd3OVv7BVg6GJqWARqUnCQXnmWshWVitx31C
 qUKj594fKYhiq4ZwBDngJ/1DxlztiQk=
X-Google-Smtp-Source: APXvYqznFFz48yz0+q63EbYkN35ihorBYWGIKgtFa1LRaQaW0nxkC8VjXUyhRoF4DSXGXcfah5pbvA==
X-Received: by 2002:a5d:4b08:: with SMTP id v8mr56413524wrq.338.1575115067710; 
 Sat, 30 Nov 2019 03:57:47 -0800 (PST)
Received: from debian.mshome.net (122.163.200.146.dyn.plus.net.
 [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id z11sm2227769wrt.82.2019.11.30.03.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 03:57:47 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sat, 30 Nov 2019 11:57:36 +0000
Message-Id: <20191130115737.15752-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191130115737.15752-1-liuwe@microsoft.com>
References: <20191130115737.15752-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 7/8] x86: be more verbose when running on a
 hypervisor
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

QWxzbyByZXBsYWNlIHJlZmVyZW5jZSB0byB4ZW5fZ3Vlc3QuCgpTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KQ2hhbmdlcyBpbiB2NToKMS4gQ2FjaGUgYW5k
IHVzZSBoeXBlcnZpc29yIG5hbWUgaW5zdGVhZAotLS0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jIHwg
NyArKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVw
LmMKaW5kZXggYTZiMzU0YzI5Zi4uZmMwNDllYWFjOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTcwMCw2ICs3MDAsNyBAQCB2
b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAg
ICAgICAubWF4X2dyYW50X2ZyYW1lcyA9IC0xLAogICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1l
cyA9IC0xLAogICAgIH07CisgICAgY29uc3QgY2hhciAqaHlwZXJ2aXNvcl9uYW1lOwogCiAgICAg
LyogQ3JpdGljYWwgcmVnaW9uIHdpdGhvdXQgSURUIG9yIFRTUy4gIEFueSBmYXVsdCBpcyBkZWFk
bHkhICovCiAKQEAgLTc2Myw3ICs3NjQsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0
X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgICAqIGFsbG9jaW5nIGFueSB4ZW5oZWFwIHN0
cnVjdHVyZXMgd2FudGVkIGluIGxvd2VyIG1lbW9yeS4gKi8KICAgICBrZXhlY19lYXJseV9jYWxj
dWxhdGlvbnMoKTsKIAotICAgIGh5cGVydmlzb3JfcHJvYmUoKTsKKyAgICBoeXBlcnZpc29yX25h
bWUgPSBoeXBlcnZpc29yX3Byb2JlKCk7CiAKICAgICBwYXJzZV92aWRlb19pbmZvKCk7CiAKQEAg
LTc4OCw2ICs3ODksOCBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25l
ZCBsb25nIG1iaV9wKQogICAgIHByaW50aygiQ29tbWFuZCBsaW5lOiAlc1xuIiwgY21kbGluZSk7
CiAKICAgICBwcmludGsoIlhlbiBpbWFnZSBsb2FkIGJhc2UgYWRkcmVzczogJSNseFxuIiwgeGVu
X3BoeXNfc3RhcnQpOworICAgIGlmICggaHlwZXJ2aXNvcl9uYW1lICkKKyAgICAgICAgcHJpbnRr
KCJSdW5uaW5nIG9uICVzXG4iLCBoeXBlcnZpc29yX25hbWUpOwogCiAjaWZkZWYgQ09ORklHX1ZJ
REVPCiAgICAgcHJpbnRrKCJWaWRlbyBpbmZvcm1hdGlvbjpcbiIpOwpAQCAtMTU2OSw3ICsxNTcy
LDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlf
cCkKICAgICAgICAgICAgIG1heF9jcHVzID0gbnJfY3B1X2lkczsKICAgICB9CiAKLSAgICBpZiAo
IHhlbl9ndWVzdCApCisgICAgaWYgKCBoeXBlcnZpc29yX25hbWUgKQogICAgICAgICBoeXBlcnZp
c29yX3NldHVwKCk7CiAKICAgICAvKiBMb3cgbWFwcGluZ3Mgd2VyZSBvbmx5IG5lZWRlZCBmb3Ig
c29tZSBCSU9TIHRhYmxlIHBhcnNpbmcuICovCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
