Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF52145D13
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 21:26:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuMXz-0006Ny-8P; Wed, 22 Jan 2020 20:24:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vKfK=3L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iuMXy-0006NU-0H
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 20:24:18 +0000
X-Inumbo-ID: 1b43a186-3d55-11ea-8e9a-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b43a186-3d55-11ea-8e9a-bc764e2007e4;
 Wed, 22 Jan 2020 20:23:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so528341wro.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 12:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BC91hdyPWV2hM/+wf0AJs+FRr6HNGJISWFhaN0f9Tb0=;
 b=AqG8fBZPBYp8jfoKXSZCsN7epFOY5v1w1Sa8ukbc/KRcnw+8Y0iCtlLfPHukMrxsR8
 7Tg+g0RTIVCdvr1DyjVAKduyBqGHQC/jGvGM4zLd6trMoUFWGyzu0TDreHCPUz0926c8
 MFElRQPtJE4IC9Tn0upJPkm+BOlAoosqpFTiGqexfiUfjYPh6Qv2r85iaE7CKKbieI2T
 l9mfdBt4a7pKHXYtO5RCV75aTGVxxHaoOaBA4hRMKpDLuTC0qWN2IVDLo5qX0lVe1d2q
 uGGXwerQKD44cz4+HMOQtnY8lXiUCeB/c3cO76abhRm+UozcFuEZ8WmHIZwtF0OEcs9J
 LFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=BC91hdyPWV2hM/+wf0AJs+FRr6HNGJISWFhaN0f9Tb0=;
 b=PQ/zurYpf/Y4nXPhvwxwFD+8Lmf393zZ4cZVfLJtgm3n2KDlvUeM+1wjwbpS6hBTOp
 RfxUvxcEsLwLkvsdvMc7hXoiS4gsqwJKQCN9yGNGI7z1DqA7NA6YqV+15LLkiy2jWoo8
 Lw85nJqKVNKTBD0ePX4ELqxTlneM4Mn5M2CHiR0YEgvjmGKDarE9xSMECxD/dlTDnyUT
 YH/7zX+MbiwcsAUNj5aIpqWXaxXvfG2AsJlnIjHcEsugsVpHhOC+H5bL+ZjnPmEGNWY9
 UxwiursGS6ljiqzXDOOCHIosV9yJ3w9eU8Bks6VsIc2UxAlvidRKhiFwo9ooXL4p8tfA
 HZDg==
X-Gm-Message-State: APjAAAViPLb5oqT/Yo9Fudp2IIdprv4uZBfDsSfthZwE45Wn7OtgK8qA
 CSy5eLPY7kTk1/Fqn6O4c4+R8dU/j1fJ6w==
X-Google-Smtp-Source: APXvYqwk6HQpf+44L7I2MA22dHt5tir2BvnV1QjBKthOuxwqexeCAGNnBdYOsvYCBn4ao7WqLwa2ag==
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr12965981wrs.200.1579724632194; 
 Wed, 22 Jan 2020 12:23:52 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 r6sm60267992wrq.92.2020.01.22.12.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 12:23:51 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 20:23:42 +0000
Message-Id: <20200122202343.5703-7-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122202343.5703-1-liuwe@microsoft.com>
References: <20200122202343.5703-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 6/7] x86/hyperv: retrieve vp_index from
 Hyper-V
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3aWxsIGJlIHVzZWZ1bCB3aGVuIGludm9raW5nIGh5cGVyY2FsbCB0aGF0IHRhcmdldHMg
c3BlY2lmaWMKdmNwdShzKS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KLS0tCnY0Ogox
LiBVc2UgcHJpdmF0ZS5oCjIuIEFkZCBQYXVsJ3MgcmV2aWV3IHRhZwoKdjI6CjEuIEZvbGQgaW50
byBzZXR1cF9wY3B1X2FyZyBmdW5jdGlvbgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
aHlwZXJ2LmMgIHwgNSArKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgg
fCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvaHlwZXJ2LmMKaW5kZXggYzUxOTVhZjk0OC4uMDg1ZTY0NmRjNiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L2h5cGVydi5jCkBAIC0zMSw2ICszMSw3IEBACiAKIHN0cnVjdCBtc19oeXBlcnZfaW5m
byBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZv
aWQgKiwgaHZfcGNwdV9pbnB1dF9hcmcpOworREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodW5z
aWduZWQgaW50LCBodl92cF9pbmRleCk7CiAKIHN0YXRpYyB1aW50NjRfdCBnZW5lcmF0ZV9ndWVz
dF9pZCh2b2lkKQogewpAQCAtMTI1LDYgKzEyNiw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1
cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQogc3RhdGljIHZvaWQgc2V0dXBfaHlwZXJjYWxsX3BjcHVf
YXJnKHZvaWQpCiB7CiAgICAgdm9pZCAqbWFwcGluZzsKKyAgICB1aW50NjRfdCB2cF9pbmRleF9t
c3I7CiAKICAgICBpZiAoIHRoaXNfY3B1KGh2X3BjcHVfaW5wdXRfYXJnKSApCiAgICAgICAgIHJl
dHVybjsKQEAgLTEzNSw2ICsxMzcsOSBAQCBzdGF0aWMgdm9pZCBzZXR1cF9oeXBlcmNhbGxfcGNw
dV9hcmcodm9pZCkKICAgICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKIAogICAgIHRo
aXNfY3B1KGh2X3BjcHVfaW5wdXRfYXJnKSA9IG1hcHBpbmc7CisKKyAgICByZG1zcmwoSFZfWDY0
X01TUl9WUF9JTkRFWCwgdnBfaW5kZXhfbXNyKTsKKyAgICB0aGlzX2NwdShodl92cF9pbmRleCkg
PSB2cF9pbmRleF9tc3I7CiB9CiAKIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cCh2b2lkKQpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAppbmRleCBiNjkwMmI1NjM5Li5kYTcwOTkwNDAxIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAorKysgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaApAQCAtMjUsNSArMjUsNiBAQAogI2luY2x1
ZGUgPHhlbi9wZXJjcHUuaD4KIAogREVDTEFSRV9QRVJfQ1BVKHZvaWQgKiwgaHZfcGNwdV9pbnB1
dF9hcmcpOworREVDTEFSRV9QRVJfQ1BVKHVuc2lnbmVkIGludCwgaHZfdnBfaW5kZXgpOwogCiAj
ZW5kaWYgLyogX19YRU5fSFlQRVJWX1BSSVZJQVRFX0hfXyAgKi8KLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
