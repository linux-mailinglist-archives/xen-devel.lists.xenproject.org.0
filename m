Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D60C7E46F2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 11:19:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNviT-0007qa-H4; Fri, 25 Oct 2019 09:17:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cMeb=YS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iNviS-0007qL-OW
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 09:17:04 +0000
X-Inumbo-ID: 2b629ee8-f708-11e9-beca-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b629ee8-f708-11e9-beca-bc764e2007e4;
 Fri, 25 Oct 2019 09:16:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l10so1451304wrb.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2019 02:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z24dDP8e4wKIUjS8UhLY486vqtfpCpTJ8Zx6A9S+9Dw=;
 b=Yk8S6YIQxND/0xjry0WeX1RYN+ZWSkUzNSspyjKpjEXwSEdgp9mQCm5LXP4abA2Uoe
 OHSJkr7QbCy7U8tp60D4d86ptOedua7DVFiB3eeqJIC+jjNJVEXp8TTgqXRg6QfNESMF
 Dx09KayN8Q465ZdqFidiRs9qMXsPFKJ1b4MfbY3MWslrNeGCeluM3EhSmFrfAK8HedbG
 MCWQbgekbqIbfC4OHjylZ0LXo9XP+lZQktFCpC5jzMDc//Wdw0zmbcAKZm/jYZm9lNsF
 +ZT9wo5D2nPqpaTvcAZCVuNVNjjL79+ZU7TjOMfNiTTFEAj7ch6AIIbGGNcYR9XKDiqh
 wftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=z24dDP8e4wKIUjS8UhLY486vqtfpCpTJ8Zx6A9S+9Dw=;
 b=L5opP31rmDNuRKlihve5e8Q11Q4OQsTkxCECdCSD1ny6ZzN4veo3bRwJYJ1+xRjfWX
 i/0x6uH8xshPuESBVivj2tU4f/wNZz1TAmzd64QDHHt5IIIO/oyb/tOH2NUwm2gGYdUl
 /fqPqTQT70Rqt+zaaaIEZKpG3dqiKjtZbyB5Z59VBSbjNCgMVDDSyzYPLzhMwTDV8hjY
 CMEbnBZeA3V8ea0/HgCAKLugZjWhHbkUMPS9Hti4biiTlnPzT7p1g0JGD929uslhgAFt
 y3ba6d82OKNtxt2ZmPVmWOrHV9yix+9n+A0/lA+CEIRJK8OVSTi7z4WcvxR3+y+1zPxY
 f8Tw==
X-Gm-Message-State: APjAAAWw8sq2V+n/iMP9WJPrnOHhyBymgl5qrQvB2jYC2DFpbmlSZMSX
 VfbJqDdafS2TKohSwuATRqi/SNMU/Dg=
X-Google-Smtp-Source: APXvYqz/9QhCeteCwSy8LLjlrzPw+8rYGz+7qpLb4shLwRHxp30P5nlRUvObwNTpcKRhcQw6V7mLGw==
X-Received: by 2002:adf:e446:: with SMTP id t6mr1939628wrm.7.1571995006715;
 Fri, 25 Oct 2019 02:16:46 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id b62sm1873283wmc.13.2019.10.25.02.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 02:16:46 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri, 25 Oct 2019 10:16:15 +0100
Message-Id: <20191025091618.10153-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025091618.10153-1-liuwe@microsoft.com>
References: <20191025091618.10153-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next 4/7] x86: add a comment regarding the
 location of hypervisor_probe
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc2V0dXAuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMK
aW5kZXggY2Y1YTdiOGUxZS4uNGFhMGFmNWExMiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3Nl
dHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTc2NCw2ICs3NjQsMTAgQEAgdm9p
ZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAgICAg
KiBhbGxvY2luZyBhbnkgeGVuaGVhcCBzdHJ1Y3R1cmVzIHdhbnRlZCBpbiBsb3dlciBtZW1vcnku
ICovCiAgICAga2V4ZWNfZWFybHlfY2FsY3VsYXRpb25zKCk7CiAKKyAgICAvKgorICAgICAqIFRo
ZSBwcm9iaW5nIGhhcyB0byBiZSBkb25lIF9iZWZvcmVfIGluaXRpYWxpc2luZyBjb25zb2xlLAor
ICAgICAqIG90aGVyd2lzZSB3ZSBjb3VsZG4ndCBzZXQgdXAgWGVuJ3MgUFYgY29uc29sZSBjb3Jy
ZWN0bHkuCisgICAgICovCiAgICAgcnVubmluZ19vbl9oeXBlcnZpc29yID0gaHlwZXJ2aXNvcl9w
cm9iZSgpOwogCiAgICAgcGFyc2VfdmlkZW9faW5mbygpOwotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
