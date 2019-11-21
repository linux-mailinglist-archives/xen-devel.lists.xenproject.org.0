Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4811059FE
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:53:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXrYB-0007Kz-6j; Thu, 21 Nov 2019 18:51:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXrY9-0007K7-HP
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:51:29 +0000
X-Inumbo-ID: dbd84f74-0c8f-11ea-b678-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dbd84f74-0c8f-11ea-b678-bc764e2007e4;
 Thu, 21 Nov 2019 18:51:00 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i12so5746535wro.5
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUPue3nJI1BlCj5R+fUwF507OE2ynKQH95Wp7cLyvA0=;
 b=rl9AWJu69RO7Wpww06KuYN/PM5btN7iuOVIeGur8pTn3ThpiikXCLuSUeESpH7pOD+
 YboI4mcouxi6ygjjjew0iRLEscAlj4ySJtLiBoVd4mpNvULxDNf0J8cvUnO3u9cT17AS
 6REDDnrqhkixYFlvbDoAL9DSZn2j3C86McitktZJpeDVaGToYgMLp30CrJm0IUa0/yWB
 22hNGwzP1RyfmK2MuCDxEVH7qyj8gM0bTkLcImbjMUw1uZSKURIQDyBjjuu65DHwmoht
 EQP6Gboli/g/CE13o9Ryz4fju+G6x9cY+NPbXMQb1GB7fJn2ZvBGhRxRsodxYrD9gGn7
 woCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lUPue3nJI1BlCj5R+fUwF507OE2ynKQH95Wp7cLyvA0=;
 b=OrfWP5BQl5xAj0+vO6ORe220U+RUX98bs3ft0bl/qxiCgJf1M0iXoyzO6+QPfPm+Q4
 sp2xRTo3X8SXsTbDDBS+15Kp6CSuB0Z42Ng7nBGL7rPyHv/e1olHqM+52H32TGu612v0
 h0ghmFdAw9yUUwlU7hvdJTj4a9mdoB4psTA4L9RX/gpt4yDOrh/90ogepUMnYFsukDNR
 Zd6Y9N6g326AROTntT+kKt9LFStWSr+f6tT6vtmYxzSWdxELDCiISpCguimLALhFTk26
 dJ1Ypy24KIiCW8JT8RxOyHAKpMIBIvnfOQ8q2tMHUb+a1v+TrWUd0Cldkjdv1B44ToBm
 M+TQ==
X-Gm-Message-State: APjAAAVkms+ZiOCdv6Buw5IQpIyM/vQPpz7O80fkeINhY/U2B3v2Op4d
 Fw+yowT3kQPcFOFMKMwJvBfGcueZZv6WLA==
X-Google-Smtp-Source: APXvYqzBZnQji8OBG2EMtpgCl/T/nh84H5uA+Y6VkGieSstfs7XbTrcHbi3MUg3tYmPmmk4Fb/BFNQ==
X-Received: by 2002:adf:ed4b:: with SMTP id u11mr12050615wro.215.1574362259105; 
 Thu, 21 Nov 2019 10:50:59 -0800 (PST)
Received: from debian.mshome.net (74.162.147.147.dyn.plus.net.
 [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id f24sm535776wmb.37.2019.11.21.10.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:50:58 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 18:50:48 +0000
Message-Id: <20191121185049.16666-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191121185049.16666-1-liuwe@microsoft.com>
References: <20191121185049.16666-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 7/8] x86: be more verbose when running on a
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

QWxzbyByZXBsYWNlIHhlbl9ndWVzdCB3aXRoIHJ1bm5pbmdfb25faHlwZXJ2aXNvciBib29sZWFu
LgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCkNoYW5n
ZXMgaW4gdjQ6CjEuIEFjY2VzcyAtPm5hbWUgZGlyZWN0bHkuCjIuIERyb3AgUm9nZXIncyByZXZp
ZXcgdGFnLgotLS0KIHhlbi9hcmNoL3g4Ni9zZXR1cC5jIHwgNyArKysrKy0tCiAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMKaW5kZXggMTk2MDZkOTA5Yi4u
MTIzNDM2YjM1YSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NldHVwLmMKKysrIGIveGVuL2Fy
Y2gveDg2L3NldHVwLmMKQEAgLTY4OSw2ICs2ODksNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBf
X3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQogICAgIGludCBpLCBqLCBlODIwX3dhcm4g
PSAwLCBieXRlcyA9IDA7CiAgICAgYm9vbCBhY3BpX2Jvb3RfdGFibGVfaW5pdF9kb25lID0gZmFs
c2UsIHJlbG9jYXRlZCA9IGZhbHNlOwogICAgIGludCByZXQ7CisgICAgYm9vbCBydW5uaW5nX29u
X2h5cGVydmlzb3I7CiAgICAgc3RydWN0IG5zMTY1NTBfZGVmYXVsdHMgbnMxNjU1MCA9IHsKICAg
ICAgICAgLmRhdGFfYml0cyA9IDgsCiAgICAgICAgIC5wYXJpdHkgICAgPSAnbicsCkBAIC03NjMs
NyArNzY0LDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9u
ZyBtYmlfcCkKICAgICAgKiBhbGxvY2luZyBhbnkgeGVuaGVhcCBzdHJ1Y3R1cmVzIHdhbnRlZCBp
biBsb3dlciBtZW1vcnkuICovCiAgICAga2V4ZWNfZWFybHlfY2FsY3VsYXRpb25zKCk7CiAKLSAg
ICBoeXBlcnZpc29yX3Byb2JlKCk7CisgICAgcnVubmluZ19vbl9oeXBlcnZpc29yID0gISFoeXBl
cnZpc29yX3Byb2JlKCk7CiAKICAgICBwYXJzZV92aWRlb19pbmZvKCk7CiAKQEAgLTc4OCw2ICs3
ODksOCBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1i
aV9wKQogICAgIHByaW50aygiQ29tbWFuZCBsaW5lOiAlc1xuIiwgY21kbGluZSk7CiAKICAgICBw
cmludGsoIlhlbiBpbWFnZSBsb2FkIGJhc2UgYWRkcmVzczogJSNseFxuIiwgeGVuX3BoeXNfc3Rh
cnQpOworICAgIGlmICggcnVubmluZ19vbl9oeXBlcnZpc29yICkKKyAgICAgICAgcHJpbnRrKCJS
dW5uaW5nIG9uICVzXG4iLCBoeXBlcnZpc29yX3Byb2JlKCktPm5hbWUpOwogCiAjaWZkZWYgQ09O
RklHX1ZJREVPCiAgICAgcHJpbnRrKCJWaWRlbyBpbmZvcm1hdGlvbjpcbiIpOwpAQCAtMTU2OSw3
ICsxNTcyLDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9u
ZyBtYmlfcCkKICAgICAgICAgICAgIG1heF9jcHVzID0gbnJfY3B1X2lkczsKICAgICB9CiAKLSAg
ICBpZiAoIHhlbl9ndWVzdCApCisgICAgaWYgKCBydW5uaW5nX29uX2h5cGVydmlzb3IgKQogICAg
ICAgICBoeXBlcnZpc29yX3NldHVwKCk7CiAKICAgICAvKiBMb3cgbWFwcGluZ3Mgd2VyZSBvbmx5
IG5lZWRlZCBmb3Igc29tZSBCSU9TIHRhYmxlIHBhcnNpbmcuICovCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
