Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B31EE46FA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 11:20:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNviY-0007t3-SN; Fri, 25 Oct 2019 09:17:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cMeb=YS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNviX-0007sZ-OF
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 09:17:09 +0000
X-Inumbo-ID: 2bfa81cc-f708-11e9-beca-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bfa81cc-f708-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 09:16:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g24so1248653wmh.5
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2019 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RWvHYr4lwnnsyDQq6HwtOl4sm8TXtzS0Bm+BK++h16k=;
 b=d3ElIZtLaWqZS3IppT56DYW6psmlOuvC66A8uKjyQRvd1ExSFqORFPOx/bpuy2ft/O
 KIm1WOFdbtGGl+lV0HqA/9VHrw71csfdkW+9yKITufK2mVvezWA6uGGwmyEPsCrKRH1m
 bUYn8i/cWsgkJU6AQeNtSdyDVBYrhtsrucNz/84GEcMXbXgh/TvKbnQw1OWX80fUeXLS
 VwnWJ9I3sWI7p6nkgwYbCcIj+B/hiqiGa+H/XrqJwt5mJeVN8fslML0VRaFkagRjtKeN
 ya1R0mIb+Is5rr8KmPuvkophsxrG8hG6FmUjiBIgSEoQAKaZsTzqZESpm6KfxRTbVuwA
 LmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RWvHYr4lwnnsyDQq6HwtOl4sm8TXtzS0Bm+BK++h16k=;
 b=T7DHa52/KUg3aGOkqtL22GfQhEFQSsmMIQfFTN8dCqms8PCz63Y9CuqLLmk0hCK9F3
 GtJnumpTEmevaysL7tWz7il16vfpAGQo32K2vpMT2HYuAwB69FBFIIhtJRR8fRmWW5s0
 Sx2bZLecvQ2+3FEWAvLskabCXXrGgJH60HigJW2hRulPZ27SJR0d/cPdl48YT8ANW5vB
 wi4Vcm2gKztO1lmXxOh2p5Gaty1/iLWrEaYHdJojfT4x/wF4bWW6fufggClntP71/arW
 qj68wflcDvYH2TnHcayz2Vi02VjNjVGjjUsTJa8WbXtvChUjWvpwZdh45fDAn+sBRFTC
 wcbw==
X-Gm-Message-State: APjAAAVx7LHHBcC5Nm1h3bwcvigPH0hENPtgZdFqNzkeZ8qQpxQhEYMN
 oqQiwcyNT7sGzy/NBSUIvQQXH0YDruM=
X-Google-Smtp-Source: APXvYqx6JQzQaz5vNVGoDOwICJjW8dz5FDmoXpvAKLe0GXRoyJj1QZdb9o+LXu12KBnPD04UfFbsHA==
X-Received: by 2002:a1c:41c1:: with SMTP id o184mr2466470wma.57.1571995007682; 
 Fri, 25 Oct 2019 02:16:47 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id b62sm1873283wmc.13.2019.10.25.02.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 02:16:47 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 10:16:16 +0100
Message-Id: <20191025091618.10153-6-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025091618.10153-1-liuwe@microsoft.com>
References: <20191025091618.10153-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next 5/7] x86: use running_on_hypervisor to
 gate hypervisor_setup
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGh5cGVydmlzb3Jfc2V0dXAgbWV0aG9kIGlzIG5vdCB1bmlxdWUgdG8gWGVuIGd1ZXN0LgoK
U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc2V0dXAuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gv
eDg2L3NldHVwLmMKaW5kZXggNGFhMGFmNWExMi4uMDQ0YzQ1YmUzNiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTE1NzcsNyAr
MTU3Nyw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcg
bWJpX3ApCiAgICAgICAgICAgICBtYXhfY3B1cyA9IG5yX2NwdV9pZHM7CiAgICAgfQogCi0gICAg
aWYgKCB4ZW5fZ3Vlc3QgKQorICAgIGlmICggcnVubmluZ19vbl9oeXBlcnZpc29yICkKICAgICAg
ICAgaHlwZXJ2aXNvcl9zZXR1cCgpOwogCiAgICAgLyogTG93IG1hcHBpbmdzIHdlcmUgb25seSBu
ZWVkZWQgZm9yIHNvbWUgQklPUyB0YWJsZSBwYXJzaW5nLiAqLwotLSAKMi4yMC4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
