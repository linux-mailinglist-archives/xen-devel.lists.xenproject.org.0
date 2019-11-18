Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C31002A0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 11:38:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWeO1-0000WY-EM; Mon, 18 Nov 2019 10:36:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=67+Z=ZK=ffwll.ch=daniel.vetter@srs-us1.protection.inumbo.net>)
 id 1iWeO0-0000WS-7O
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 10:36:00 +0000
X-Inumbo-ID: 35b6384c-09ef-11ea-b678-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35b6384c-09ef-11ea-b678-bc764e2007e4;
 Mon, 18 Nov 2019 10:35:59 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so15592089wmk.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 02:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jjDLxOz7IsbnL7t2/1Ejysn56H4IEYN8ktzvCCiHtFg=;
 b=BXixQVq2k/7tC9dPX/bMsg1etG8/LX8ir3zvqVJdCRc9RkrCObDs6PrdHtTu/EuVbP
 kXNiyijwPNqrzOCCwygOzMmden/lVtzOEhP5DGJclsF+p6uup6MP4o7LzYQxt9v+bRE7
 Fh9x2wWvTXXnQf3phCJdqLRs5xDWQ/1s4FmnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jjDLxOz7IsbnL7t2/1Ejysn56H4IEYN8ktzvCCiHtFg=;
 b=qjPWn9aVeHjy5x2kyZpbdWJ9LjYbeVCfLL9ppEYdtRFQbPT405tYO9WrRQO0Ede989
 mPlHmy+q7BWxr9XBu7snkNgqtWkCDaKgO9QxhzhAnbH/x6o11i738DZlt1bAb4pFZCZ5
 h4DP8RSUo7uJbDBsFvQ/HxEcJiqdzokItxHAEhovG8KZiDTNLQHRo7OlsaA8l3GJj/6+
 68lM+DM7+Z916blcq5SS8Ui7JQtGCP43dUO3STo7BuP+8H5ca4R1qCD7qsO1eyrx1bQe
 WVgBu8rGw7NqHBCHFLn5GBVcVlrI2oCy9FY+1yJJAVQUPWQNTW2ACjU94xIOFBeF5Adf
 VpRA==
X-Gm-Message-State: APjAAAVOXgUQ7Vbn4tb6SOGwrakmztwifAhD++0tULO6o5qpH/IFfHt4
 HrMKDgUUznt/20qEOrjc80TGow==
X-Google-Smtp-Source: APXvYqxuf8Z1g6JRhix6c1l9qTmhAZvxcDDPcHNmw/YqNTYy8nEysXzPhnZ/YuoW4u1Ee+f/OudQtQ==
X-Received: by 2002:a7b:c255:: with SMTP id b21mr29898342wmj.39.1574073358651; 
 Mon, 18 Nov 2019 02:35:58 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j2sm22749200wrt.61.2019.11.18.02.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 02:35:58 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Mon, 18 Nov 2019 11:35:34 +0100
Message-Id: <20191118103536.17675-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
References: <20191118103536.17675-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 13/15] xen/gntdev-dmabuf: Ditch dummy map
 functions
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBubyBpbi1rZXJuZWwgdXNlcnMgZm9yIHRoZSBrKHVuKW1hcCBzdHVmZi4gQW5kIHRo
ZSBtbWFwIG9uZSBpcwphY3RpdmVseSBoYXJtZnVsIC0gcmV0dXJuIDAgYW5kIHRoZW4gX25vdF8g
YWN0dWFsbHkgbW1hcGluZyBjYW4ndCBlbmQKd2VsbC4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jp
cy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwotLQpBY2sgZm9yIG1lcmdpbmcgdGhpcyB0aHJv
dWdoIGRybSB0cmVlcyB2ZXJ5IG11Y2ggYXBwcmVjaWF0ZWQuCi1EYW5pZWwKLS0tCiBkcml2ZXJz
L3hlbi9nbnRkZXYtZG1hYnVmLmMgfCAyMyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL2dudGRl
di1kbWFidWYuYyBiL2RyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYwppbmRleCAyYzRmMzI0Zjg2
MjYuLmZlN2JkNjlkNjk1NSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vZ250ZGV2LWRtYWJ1Zi5j
CisrKyBiL2RyaXZlcnMveGVuL2dudGRldi1kbWFidWYuYwpAQCAtMzQyLDM1ICszNDIsMTIgQEAg
c3RhdGljIHZvaWQgZG1hYnVmX2V4cF9vcHNfcmVsZWFzZShzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1
ZikKIAltdXRleF91bmxvY2soJnByaXYtPmxvY2spOwogfQogCi1zdGF0aWMgdm9pZCAqZG1hYnVm
X2V4cF9vcHNfa21hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZiwKLQkJCQkgdW5zaWduZWQgbG9u
ZyBwYWdlX251bSkKLXsKLQkvKiBOb3QgaW1wbGVtZW50ZWQuICovCi0JcmV0dXJuIE5VTEw7Ci19
Ci0KLXN0YXRpYyB2b2lkIGRtYWJ1Zl9leHBfb3BzX2t1bm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1h
X2J1ZiwKLQkJCQkgIHVuc2lnbmVkIGxvbmcgcGFnZV9udW0sIHZvaWQgKmFkZHIpCi17Ci0JLyog
Tm90IGltcGxlbWVudGVkLiAqLwotfQotCi1zdGF0aWMgaW50IGRtYWJ1Zl9leHBfb3BzX21tYXAo
c3RydWN0IGRtYV9idWYgKmRtYV9idWYsCi0JCQkgICAgICAgc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCi17Ci0JLyogTm90IGltcGxlbWVudGVkLiAqLwotCXJldHVybiAwOwotfQotCiBzdGF0
aWMgY29uc3Qgc3RydWN0IGRtYV9idWZfb3BzIGRtYWJ1Zl9leHBfb3BzID0gIHsKIAkuYXR0YWNo
ID0gZG1hYnVmX2V4cF9vcHNfYXR0YWNoLAogCS5kZXRhY2ggPSBkbWFidWZfZXhwX29wc19kZXRh
Y2gsCiAJLm1hcF9kbWFfYnVmID0gZG1hYnVmX2V4cF9vcHNfbWFwX2RtYV9idWYsCiAJLnVubWFw
X2RtYV9idWYgPSBkbWFidWZfZXhwX29wc191bm1hcF9kbWFfYnVmLAogCS5yZWxlYXNlID0gZG1h
YnVmX2V4cF9vcHNfcmVsZWFzZSwKLQkubWFwID0gZG1hYnVmX2V4cF9vcHNfa21hcCwKLQkudW5t
YXAgPSBkbWFidWZfZXhwX29wc19rdW5tYXAsCi0JLm1tYXAgPSBkbWFidWZfZXhwX29wc19tbWFw
LAogfTsKIAogc3RydWN0IGdudGRldl9kbWFidWZfZXhwb3J0X2FyZ3MgewotLSAKMi4yNC4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
