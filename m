Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D96BDCE724
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:17:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUim-0007Yn-25; Mon, 07 Oct 2019 15:14:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUik-0007Xn-Pa
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:14:46 +0000
X-Inumbo-ID: 09b4cb14-e915-11e9-80e3-bc764e2007e4
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 09b4cb14-e915-11e9-80e3-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:37 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id z67so12870762qkb.12
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Mq8gnqYu6RvzZZ4Dv6t9X9maxsR1srlDfTSM9jGW7Q=;
 b=OpENF7qEKrFeEL7WT8v2ehLIoWRAW4kbstAzmOhZDIkQLqowecFAWJNVjvFA9x/wBP
 rdpQKS2S8nWQWe1Sv2/GgvMSMx7mhdAPvU5QoW2+3dSNOica3IvbMkozUCS5R0+AatWQ
 uAeX0LAJ7JDxOuv7lHiL7laP3RjUCr+6rXLeoovJpNQ4lKRGfn+Knb9Hyrcm/3oeEiLs
 oEinaMfIoc90cJWzGkr7xIazAR2guWfbwV6DXDqLPN10Yq/zQB3FUSyLwlBb9DYDeVr/
 y6HgI5LzHYqJ5aXUPcveczl7d4o2I+dNPtno6EgoRLtE2N1j7CLWJEfMMnImopaOrBnX
 5jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Mq8gnqYu6RvzZZ4Dv6t9X9maxsR1srlDfTSM9jGW7Q=;
 b=E338YNQl9pppEG6r/E0rQYPg3jojtduckRLnE+5qiHxf3BAj/NoAzUHqeG6P9uV+nB
 muDPvfq+eKHQk7Cmt5VNnLhyxYieWX3n+6fabTlgsl8pxY2ytHLXl+y/rcrVxBUv2P+0
 cA8pxYJS1Px2ujDrWtB5j+tI+e0XklAT3HMGazph2HTGz/ZdkMSZJnjblscGv6iB1HIW
 /K77ABwNAkTiii8SGmI0L5FEo/rzjkyn/b3wg6s/tuuZB/kZCbWnhoEa2ofxk3rD8fGo
 KjxgzGIUfykzif9z9b4DD1487G4UYjPPDX1m/99g6BScMeN+bShx+hTZ51UFzXFXuI/v
 1GdQ==
X-Gm-Message-State: APjAAAUrDe/kvOA+5Udj9Eo6b5i6zzJJM2Z/BJGn/7tyZZI7+ufFWndm
 UTfnjiZ0ycZXlfU3DcdQabu2Wz08
X-Google-Smtp-Source: APXvYqymMQd3lnDTI8TCz1bPudeUNG910LHgtmoYO81IRZjlnQwbP5r7aAjrPVJZircRkQhGw1iBaQ==
X-Received: by 2002:a05:620a:1307:: with SMTP id
 o7mr24107875qkj.165.1570461217065; 
 Mon, 07 Oct 2019 08:13:37 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:36 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:13:05 -0400
Message-Id: <006339543b7f837eee549482a20e8521e6f8ec4b.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 18/24] golang/xenlight: implement array C to Go
 marshaling
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+Ci0tLQpDYzogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKIHRvb2xzL2dv
bGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5ICAgICAgIHwgIDM5ICsrLQogdG9vbHMvZ29sYW5n
L3hlbmxpZ2h0L3hlbmxpZ2h0X2hlbHBlcnMuZ28gfCAzMDAgKysrKysrKysrKysrKysrKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAzMzggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5IGIvdG9vbHMvZ29s
YW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkKaW5kZXggZWNlY2FhZmQ3Mi4uMmI2MjBmMGFlOSAx
MDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkKKysrIGIvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkKQEAgLTI1Nyw3ICsyNTcsNyBAQCBkZWYg
eGVubGlnaHRfZ29sYW5nX2RlZmluZV9mcm9tX0ModHkgPSBOb25lLCB0eXBlbmFtZSA9IE5vbmUs
IG5lc3RlZCA9IEZhbHNlKToKICAgICBmb3IgZiBpbiB0eS5maWVsZHM6CiAgICAgICAgIGlmIGYu
dHlwZS50eXBlbmFtZSBpcyBub3QgTm9uZToKICAgICAgICAgICAgIGlmIGlzaW5zdGFuY2UoZi50
eXBlLCBpZGwuQXJyYXkpOgotICAgICAgICAgICAgICAgICMgVE9ETworICAgICAgICAgICAgICAg
IHMgKz0geGVubGlnaHRfZ29sYW5nX2FycmF5X2Zyb21fQyhmKQogICAgICAgICAgICAgICAgIGNv
bnRpbnVlCiAKICAgICAgICAgICAgIGdvdHlwZW5hbWUgPSB4ZW5saWdodF9nb2xhbmdfZm10X25h
bWUoZi50eXBlLnR5cGVuYW1lKQpAQCAtNDIwLDYgKzQyMCw0MyBAQCBkZWYgeGVubGlnaHRfZ29s
YW5nX3VuaW9uX2ZpZWxkc19mcm9tX0ModHkgPSBOb25lKToKIAogICAgIHJldHVybiBzCiAKK2Rl
ZiB4ZW5saWdodF9nb2xhbmdfYXJyYXlfZnJvbV9DKHR5ID0gTm9uZSk6CisgICAgIiIiCisgICAg
Q29udmVydCBDIGFycmF5IHRvIEdvIHNsaWNlIHVzaW5nIHRoZSBtZXRob2QKKyAgICBkZXNjcmli
ZWQgaGVyZToKKworICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9nb2xhbmcvZ28vd2lraS9jZ28jdHVy
bmluZy1jLWFycmF5cy1pbnRvLWdvLXNsaWNlcworICAgICIiIgorICAgIHMgPSAnJworCisgICAg
Z290eXBlbmFtZSA9IHhlbmxpZ2h0X2dvbGFuZ19mbXRfbmFtZSh0eS50eXBlLmVsZW1fdHlwZS50
eXBlbmFtZSkKKyAgICBnb25hbWUgICAgID0geGVubGlnaHRfZ29sYW5nX2ZtdF9uYW1lKHR5Lm5h
bWUpCisgICAgY3R5cGVuYW1lICA9IHR5LnR5cGUuZWxlbV90eXBlLnR5cGVuYW1lCisgICAgY25h
bWUgICAgICA9IHR5Lm5hbWUKKyAgICBjc2xpY2UgICAgID0gJ2N7fScuZm9ybWF0KGdvbmFtZSkK
KyAgICBjbGVudmFyICAgID0gdHkudHlwZS5sZW52YXIubmFtZQorICAgIGdvbGVudmFyICAgPSB4
ZW5saWdodF9nb2xhbmdfZm10X25hbWUoY2xlbnZhcixleHBvcnRlZD1GYWxzZSkKKworICAgIHMg
Kz0gJ3t9IDo9IGludCh4Yy57fSlcbicuZm9ybWF0KGdvbGVudmFyLCBjbGVudmFyKQorICAgIHMg
Kz0gJ3t9IDo9ICcuZm9ybWF0KGNzbGljZSkKKyAgICBzICs9JygqWzE8PDI4XUMue30pKHVuc2Fm
ZS5Qb2ludGVyKHhjLnt9KSlbOnt9Ont9XVxuJy5mb3JtYXQoY3R5cGVuYW1lLCBjbmFtZSwKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnb2xlbnZhciwgZ29sZW52YXIpCisgICAgcyArPSAneC57fSA9IG1ha2UoW117fSwge30p
XG4nLmZvcm1hdChnb25hbWUsIGdvdHlwZW5hbWUsIGdvbGVudmFyKQorICAgIHMgKz0gJ2ZvciBp
LCB2IDo9IHJhbmdlIHt9IHt7XG4nLmZvcm1hdChjc2xpY2UpCisKKyAgICBpc19lbnVtID0gaXNp
bnN0YW5jZSh0eS50eXBlLmVsZW1fdHlwZSxpZGwuRW51bWVyYXRpb24pCisgICAgaWYgZ290eXBl
bmFtZSBpbiBnb19idWlsdGluX3R5cGVzIG9yIGlzX2VudW06CisgICAgICAgIHMgKz0gJ3gue31b
aV0gPSB7fSh2KVxuJy5mb3JtYXQoZ29uYW1lLCBnb3R5cGVuYW1lKQorICAgIGVsc2U6CisgICAg
ICAgIHMgKz0gJ3ZhciBlIHt9XG4nLmZvcm1hdChnb3R5cGVuYW1lKQorICAgICAgICBzICs9ICdp
ZiBlcnIgOj0gZS5mcm9tQygmdik7IGVyciAhPSBuaWwge1xuJworICAgICAgICBzICs9ICdyZXR1
cm4gZXJyIH1cbicKKyAgICAgICAgcyArPSAneC57fVtpXSA9IGVcbicuZm9ybWF0KGdvbmFtZSkK
KworICAgIHMgKz0gJ31cbicKKworICAgIHJldHVybiBzCisKIGRlZiB4ZW5saWdodF9nb2xhbmdf
Zm10X25hbWUobmFtZSwgZXhwb3J0ZWQgPSBUcnVlKToKICAgICAiIiIKICAgICBUYWtlIGEgZ2l2
ZW4gdHlwZSBuYW1lIGFuZCByZXR1cm4gYW4KZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5s
aWdodC94ZW5saWdodF9oZWxwZXJzLmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0
X2hlbHBlcnMuZ28KaW5kZXggYjhhYmVmODA2OC4uMmNkYzFiYmRjOSAxMDA2NDQKLS0tIGEvdG9v
bHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0X2hlbHBlcnMuZ28KKysrIGIvdG9vbHMvZ29sYW5n
L3hlbmxpZ2h0L3hlbmxpZ2h0X2hlbHBlcnMuZ28KQEAgLTM4Miw2ICszODIsMTYgQEAgZnVuYyAo
eCAqU2NoZWRQYXJhbXMpIGZyb21DKHhjICpDLmxpYnhsX3NjaGVkX3BhcmFtcykgZXJyb3Igewog
CiBmdW5jICh4ICpWY3B1U2NoZWRQYXJhbXMpIGZyb21DKHhjICpDLmxpYnhsX3ZjcHVfc2NoZWRf
cGFyYW1zKSBlcnJvciB7CiAJeC5TY2hlZCA9IFNjaGVkdWxlcih4Yy5zY2hlZCkKKwludW1WY3B1
cyA6PSBpbnQoeGMubnVtX3ZjcHVzKQorCWNWY3B1cyA6PSAoKlsxIDw8IDI4XUMubGlieGxfc2No
ZWRfcGFyYW1zKSh1bnNhZmUuUG9pbnRlcih4Yy52Y3B1cykpWzpudW1WY3B1czpudW1WY3B1c10K
Kwl4LlZjcHVzID0gbWFrZShbXVNjaGVkUGFyYW1zLCBudW1WY3B1cykKKwlmb3IgaSwgdiA6PSBy
YW5nZSBjVmNwdXMgeworCQl2YXIgZSBTY2hlZFBhcmFtcworCQlpZiBlcnIgOj0gZS5mcm9tQygm
dik7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCXguVmNwdXNbaV0gPSBlCisJ
fQogCXJldHVybiBuaWwKIH0KIApAQCAtMzk5LDYgKzQwOSwxMiBAQCBmdW5jICh4ICpEb21haW5T
Y2hlZFBhcmFtcykgZnJvbUMoeGMgKkMubGlieGxfZG9tYWluX3NjaGVkX3BhcmFtcykgZXJyb3Ig
ewogCiBmdW5jICh4ICpWbm9kZUluZm8pIGZyb21DKHhjICpDLmxpYnhsX3Zub2RlX2luZm8pIGVy
cm9yIHsKIAl4Lk1lbWtiID0gdWludDY0KHhjLm1lbWtiKQorCW51bURpc3RhbmNlcyA6PSBpbnQo
eGMubnVtX2Rpc3RhbmNlcykKKwljRGlzdGFuY2VzIDo9ICgqWzEgPDwgMjhdQy51aW50MzJfdCko
dW5zYWZlLlBvaW50ZXIoeGMuZGlzdGFuY2VzKSlbOm51bURpc3RhbmNlczpudW1EaXN0YW5jZXNd
CisJeC5EaXN0YW5jZXMgPSBtYWtlKFtddWludDMyLCBudW1EaXN0YW5jZXMpCisJZm9yIGksIHYg
Oj0gcmFuZ2UgY0Rpc3RhbmNlcyB7CisJCXguRGlzdGFuY2VzW2ldID0gdWludDMyKHYpCisJfQog
CXguUG5vZGUgPSB1aW50MzIoeGMucG5vZGUpCiAJdmFyIGJpdG1hcFZjcHVzIEJpdG1hcAogCWlm
IGVyciA6PSBiaXRtYXBWY3B1cy5mcm9tQygmeGMudmNwdXMpOyBlcnIgIT0gbmlsIHsKQEAgLTQz
MSw2ICs0NDcsMjYgQEAgZnVuYyAoeCAqRG9tYWluQnVpbGRJbmZvKSBmcm9tQyh4YyAqQy5saWJ4
bF9kb21haW5fYnVpbGRfaW5mbykgZXJyb3IgewogCQlyZXR1cm4gZXJyCiAJfQogCXguTm9kZW1h
cCA9IGJpdG1hcE5vZGVtYXAKKwludW1WY3B1SGFyZEFmZmluaXR5IDo9IGludCh4Yy5udW1fdmNw
dV9oYXJkX2FmZmluaXR5KQorCWNWY3B1SGFyZEFmZmluaXR5IDo9ICgqWzEgPDwgMjhdQy5saWJ4
bF9iaXRtYXApKHVuc2FmZS5Qb2ludGVyKHhjLnZjcHVfaGFyZF9hZmZpbml0eSkpWzpudW1WY3B1
SGFyZEFmZmluaXR5Om51bVZjcHVIYXJkQWZmaW5pdHldCisJeC5WY3B1SGFyZEFmZmluaXR5ID0g
bWFrZShbXUJpdG1hcCwgbnVtVmNwdUhhcmRBZmZpbml0eSkKKwlmb3IgaSwgdiA6PSByYW5nZSBj
VmNwdUhhcmRBZmZpbml0eSB7CisJCXZhciBlIEJpdG1hcAorCQlpZiBlcnIgOj0gZS5mcm9tQygm
dik7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCXguVmNwdUhhcmRBZmZpbml0
eVtpXSA9IGUKKwl9CisJbnVtVmNwdVNvZnRBZmZpbml0eSA6PSBpbnQoeGMubnVtX3ZjcHVfc29m
dF9hZmZpbml0eSkKKwljVmNwdVNvZnRBZmZpbml0eSA6PSAoKlsxIDw8IDI4XUMubGlieGxfYml0
bWFwKSh1bnNhZmUuUG9pbnRlcih4Yy52Y3B1X3NvZnRfYWZmaW5pdHkpKVs6bnVtVmNwdVNvZnRB
ZmZpbml0eTpudW1WY3B1U29mdEFmZmluaXR5XQorCXguVmNwdVNvZnRBZmZpbml0eSA9IG1ha2Uo
W11CaXRtYXAsIG51bVZjcHVTb2Z0QWZmaW5pdHkpCisJZm9yIGksIHYgOj0gcmFuZ2UgY1ZjcHVT
b2Z0QWZmaW5pdHkgeworCQl2YXIgZSBCaXRtYXAKKwkJaWYgZXJyIDo9IGUuZnJvbUMoJnYpOyBl
cnIgIT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQl4LlZjcHVTb2Z0QWZmaW5pdHlbaV0g
PSBlCisJfQogCXZhciBkZWZib29sTnVtYVBsYWNlbWVudCBEZWZib29sCiAJaWYgZXJyIDo9IGRl
ZmJvb2xOdW1hUGxhY2VtZW50LmZyb21DKCZ4Yy5udW1hX3BsYWNlbWVudCk7IGVyciAhPSBuaWwg
ewogCQlyZXR1cm4gZXJyCkBAIC00NjAsNiArNDk2LDE2IEBAIGZ1bmMgKHggKkRvbWFpbkJ1aWxk
SW5mbykgZnJvbUMoeGMgKkMubGlieGxfZG9tYWluX2J1aWxkX2luZm8pIGVycm9yIHsKIAl9CiAJ
eC5DcHVpZCA9IGNwdWlkUG9saWN5TGlzdENwdWlkCiAJeC5CbGtkZXZTdGFydCA9IEMuR29TdHJp
bmcoeGMuYmxrZGV2X3N0YXJ0KQorCW51bVZudW1hTm9kZXMgOj0gaW50KHhjLm51bV92bnVtYV9u
b2RlcykKKwljVm51bWFOb2RlcyA6PSAoKlsxIDw8IDI4XUMubGlieGxfdm5vZGVfaW5mbykodW5z
YWZlLlBvaW50ZXIoeGMudm51bWFfbm9kZXMpKVs6bnVtVm51bWFOb2RlczpudW1WbnVtYU5vZGVz
XQorCXguVm51bWFOb2RlcyA9IG1ha2UoW11Wbm9kZUluZm8sIG51bVZudW1hTm9kZXMpCisJZm9y
IGksIHYgOj0gcmFuZ2UgY1ZudW1hTm9kZXMgeworCQl2YXIgZSBWbm9kZUluZm8KKwkJaWYgZXJy
IDo9IGUuZnJvbUMoJnYpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQl4LlZu
dW1hTm9kZXNbaV0gPSBlCisJfQogCXguTWF4R3JhbnRGcmFtZXMgPSB1aW50MzIoeGMubWF4X2dy
YW50X2ZyYW1lcykKIAl4Lk1heE1hcHRyYWNrRnJhbWVzID0gdWludDMyKHhjLm1heF9tYXB0cmFj
a19mcmFtZXMpCiAJeC5EZXZpY2VNb2RlbFZlcnNpb24gPSBEZXZpY2VNb2RlbFZlcnNpb24oeGMu
ZGV2aWNlX21vZGVsX3ZlcnNpb24pCkBAIC00OTIsNiArNTM4LDMyIEBAIGZ1bmMgKHggKkRvbWFp
bkJ1aWxkSW5mbykgZnJvbUMoeGMgKkMubGlieGxfZG9tYWluX2J1aWxkX2luZm8pIGVycm9yIHsK
IAkJcmV0dXJuIGVycgogCX0KIAl4LlNjaGVkUGFyYW1zID0gZG9tYWluU2NoZWRQYXJhbXNTY2hl
ZFBhcmFtcworCW51bUlvcG9ydHMgOj0gaW50KHhjLm51bV9pb3BvcnRzKQorCWNJb3BvcnRzIDo9
ICgqWzEgPDwgMjhdQy5saWJ4bF9pb3BvcnRfcmFuZ2UpKHVuc2FmZS5Qb2ludGVyKHhjLmlvcG9y
dHMpKVs6bnVtSW9wb3J0czpudW1Jb3BvcnRzXQorCXguSW9wb3J0cyA9IG1ha2UoW11Jb3BvcnRS
YW5nZSwgbnVtSW9wb3J0cykKKwlmb3IgaSwgdiA6PSByYW5nZSBjSW9wb3J0cyB7CisJCXZhciBl
IElvcG9ydFJhbmdlCisJCWlmIGVyciA6PSBlLmZyb21DKCZ2KTsgZXJyICE9IG5pbCB7CisJCQly
ZXR1cm4gZXJyCisJCX0KKwkJeC5Jb3BvcnRzW2ldID0gZQorCX0KKwludW1JcnFzIDo9IGludCh4
Yy5udW1faXJxcykKKwljSXJxcyA6PSAoKlsxIDw8IDI4XUMudWludDMyX3QpKHVuc2FmZS5Qb2lu
dGVyKHhjLmlycXMpKVs6bnVtSXJxczpudW1JcnFzXQorCXguSXJxcyA9IG1ha2UoW111aW50MzIs
IG51bUlycXMpCisJZm9yIGksIHYgOj0gcmFuZ2UgY0lycXMgeworCQl4LklycXNbaV0gPSB1aW50
MzIodikKKwl9CisJbnVtSW9tZW0gOj0gaW50KHhjLm51bV9pb21lbSkKKwljSW9tZW0gOj0gKCpb
MSA8PCAyOF1DLmxpYnhsX2lvbWVtX3JhbmdlKSh1bnNhZmUuUG9pbnRlcih4Yy5pb21lbSkpWzpu
dW1Jb21lbTpudW1Jb21lbV0KKwl4LklvbWVtID0gbWFrZShbXUlvbWVtUmFuZ2UsIG51bUlvbWVt
KQorCWZvciBpLCB2IDo9IHJhbmdlIGNJb21lbSB7CisJCXZhciBlIElvbWVtUmFuZ2UKKwkJaWYg
ZXJyIDo9IGUuZnJvbUMoJnYpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQl4
LklvbWVtW2ldID0gZQorCX0KIAl2YXIgZGVmYm9vbENsYWltTW9kZSBEZWZib29sCiAJaWYgZXJy
IDo9IGRlZmJvb2xDbGFpbU1vZGUuZnJvbUMoJnhjLmNsYWltX21vZGUpOyBlcnIgIT0gbmlsIHsK
IAkJcmV0dXJuIGVycgpAQCAtOTgyLDEwICsxMDU0LDMyIEBAIGZ1bmMgKHggKkRldmljZVZkaXNw
bCkgZnJvbUMoeGMgKkMubGlieGxfZGV2aWNlX3ZkaXNwbCkgZXJyb3IgewogCXguQmFja2VuZERv
bW5hbWUgPSBDLkdvU3RyaW5nKHhjLmJhY2tlbmRfZG9tbmFtZSkKIAl4LkRldmlkID0gRGV2aWQo
eGMuZGV2aWQpCiAJeC5CZUFsbG9jID0gYm9vbCh4Yy5iZV9hbGxvYykKKwludW1Db25uZWN0b3Jz
IDo9IGludCh4Yy5udW1fY29ubmVjdG9ycykKKwljQ29ubmVjdG9ycyA6PSAoKlsxIDw8IDI4XUMu
bGlieGxfY29ubmVjdG9yX3BhcmFtKSh1bnNhZmUuUG9pbnRlcih4Yy5jb25uZWN0b3JzKSlbOm51
bUNvbm5lY3RvcnM6bnVtQ29ubmVjdG9yc10KKwl4LkNvbm5lY3RvcnMgPSBtYWtlKFtdQ29ubmVj
dG9yUGFyYW0sIG51bUNvbm5lY3RvcnMpCisJZm9yIGksIHYgOj0gcmFuZ2UgY0Nvbm5lY3RvcnMg
eworCQl2YXIgZSBDb25uZWN0b3JQYXJhbQorCQlpZiBlcnIgOj0gZS5mcm9tQygmdik7IGVyciAh
PSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCXguQ29ubmVjdG9yc1tpXSA9IGUKKwl9CiAJ
cmV0dXJuIG5pbAogfQogCiBmdW5jICh4ICpWc25kUGFyYW1zKSBmcm9tQyh4YyAqQy5saWJ4bF92
c25kX3BhcmFtcykgZXJyb3IgeworCW51bVNhbXBsZVJhdGVzIDo9IGludCh4Yy5udW1fc2FtcGxl
X3JhdGVzKQorCWNTYW1wbGVSYXRlcyA6PSAoKlsxIDw8IDI4XUMudWludDMyX3QpKHVuc2FmZS5Q
b2ludGVyKHhjLnNhbXBsZV9yYXRlcykpWzpudW1TYW1wbGVSYXRlczpudW1TYW1wbGVSYXRlc10K
Kwl4LlNhbXBsZVJhdGVzID0gbWFrZShbXXVpbnQzMiwgbnVtU2FtcGxlUmF0ZXMpCisJZm9yIGks
IHYgOj0gcmFuZ2UgY1NhbXBsZVJhdGVzIHsKKwkJeC5TYW1wbGVSYXRlc1tpXSA9IHVpbnQzMih2
KQorCX0KKwludW1TYW1wbGVGb3JtYXRzIDo9IGludCh4Yy5udW1fc2FtcGxlX2Zvcm1hdHMpCisJ
Y1NhbXBsZUZvcm1hdHMgOj0gKCpbMSA8PCAyOF1DLmxpYnhsX3ZzbmRfcGNtX2Zvcm1hdCkodW5z
YWZlLlBvaW50ZXIoeGMuc2FtcGxlX2Zvcm1hdHMpKVs6bnVtU2FtcGxlRm9ybWF0czpudW1TYW1w
bGVGb3JtYXRzXQorCXguU2FtcGxlRm9ybWF0cyA9IG1ha2UoW11Wc25kUGNtRm9ybWF0LCBudW1T
YW1wbGVGb3JtYXRzKQorCWZvciBpLCB2IDo9IHJhbmdlIGNTYW1wbGVGb3JtYXRzIHsKKwkJeC5T
YW1wbGVGb3JtYXRzW2ldID0gVnNuZFBjbUZvcm1hdCh2KQorCX0KIAl4LkNoYW5uZWxzTWluID0g
dWludDMyKHhjLmNoYW5uZWxzX21pbikKIAl4LkNoYW5uZWxzTWF4ID0gdWludDMyKHhjLmNoYW5u
ZWxzX21heCkKIAl4LkJ1ZmZlclNpemUgPSB1aW50MzIoeGMuYnVmZmVyX3NpemUpCkBAIC0xMDEw
LDYgKzExMDQsMTYgQEAgZnVuYyAoeCAqVnNuZFBjbSkgZnJvbUMoeGMgKkMubGlieGxfdnNuZF9w
Y20pIGVycm9yIHsKIAkJcmV0dXJuIGVycgogCX0KIAl4LlBhcmFtcyA9IHZzbmRQYXJhbXNQYXJh
bXMKKwludW1Wc25kU3RyZWFtcyA6PSBpbnQoeGMubnVtX3ZzbmRfc3RyZWFtcykKKwljU3RyZWFt
cyA6PSAoKlsxIDw8IDI4XUMubGlieGxfdnNuZF9zdHJlYW0pKHVuc2FmZS5Qb2ludGVyKHhjLnN0
cmVhbXMpKVs6bnVtVnNuZFN0cmVhbXM6bnVtVnNuZFN0cmVhbXNdCisJeC5TdHJlYW1zID0gbWFr
ZShbXVZzbmRTdHJlYW0sIG51bVZzbmRTdHJlYW1zKQorCWZvciBpLCB2IDo9IHJhbmdlIGNTdHJl
YW1zIHsKKwkJdmFyIGUgVnNuZFN0cmVhbQorCQlpZiBlcnIgOj0gZS5mcm9tQygmdik7IGVyciAh
PSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCXguU3RyZWFtc1tpXSA9IGUKKwl9CiAJcmV0
dXJuIG5pbAogfQogCkBAIC0xMDI0LDYgKzExMjgsMTYgQEAgZnVuYyAoeCAqRGV2aWNlVnNuZCkg
ZnJvbUMoeGMgKkMubGlieGxfZGV2aWNlX3ZzbmQpIGVycm9yIHsKIAkJcmV0dXJuIGVycgogCX0K
IAl4LlBhcmFtcyA9IHZzbmRQYXJhbXNQYXJhbXMKKwludW1Wc25kUGNtcyA6PSBpbnQoeGMubnVt
X3ZzbmRfcGNtcykKKwljUGNtcyA6PSAoKlsxIDw8IDI4XUMubGlieGxfdnNuZF9wY20pKHVuc2Fm
ZS5Qb2ludGVyKHhjLnBjbXMpKVs6bnVtVnNuZFBjbXM6bnVtVnNuZFBjbXNdCisJeC5QY21zID0g
bWFrZShbXVZzbmRQY20sIG51bVZzbmRQY21zKQorCWZvciBpLCB2IDo9IHJhbmdlIGNQY21zIHsK
KwkJdmFyIGUgVnNuZFBjbQorCQlpZiBlcnIgOj0gZS5mcm9tQygmdik7IGVyciAhPSBuaWwgewor
CQkJcmV0dXJuIGVycgorCQl9CisJCXguUGNtc1tpXSA9IGUKKwl9CiAJcmV0dXJuIG5pbAogfQog
CkBAIC0xMDM4LDYgKzExNTIsMTU2IEBAIGZ1bmMgKHggKkRvbWFpbkNvbmZpZykgZnJvbUMoeGMg
KkMubGlieGxfZG9tYWluX2NvbmZpZykgZXJyb3IgewogCQlyZXR1cm4gZXJyCiAJfQogCXguQklu
Zm8gPSBkb21haW5CdWlsZEluZm9CSW5mbworCW51bURpc2tzIDo9IGludCh4Yy5udW1fZGlza3Mp
CisJY0Rpc2tzIDo9ICgqWzEgPDwgMjhdQy5saWJ4bF9kZXZpY2VfZGlzaykodW5zYWZlLlBvaW50
ZXIoeGMuZGlza3MpKVs6bnVtRGlza3M6bnVtRGlza3NdCisJeC5EaXNrcyA9IG1ha2UoW11EZXZp
Y2VEaXNrLCBudW1EaXNrcykKKwlmb3IgaSwgdiA6PSByYW5nZSBjRGlza3MgeworCQl2YXIgZSBE
ZXZpY2VEaXNrCisJCWlmIGVyciA6PSBlLmZyb21DKCZ2KTsgZXJyICE9IG5pbCB7CisJCQlyZXR1
cm4gZXJyCisJCX0KKwkJeC5EaXNrc1tpXSA9IGUKKwl9CisJbnVtTmljcyA6PSBpbnQoeGMubnVt
X25pY3MpCisJY05pY3MgOj0gKCpbMSA8PCAyOF1DLmxpYnhsX2RldmljZV9uaWMpKHVuc2FmZS5Q
b2ludGVyKHhjLm5pY3MpKVs6bnVtTmljczpudW1OaWNzXQorCXguTmljcyA9IG1ha2UoW11EZXZp
Y2VOaWMsIG51bU5pY3MpCisJZm9yIGksIHYgOj0gcmFuZ2UgY05pY3MgeworCQl2YXIgZSBEZXZp
Y2VOaWMKKwkJaWYgZXJyIDo9IGUuZnJvbUMoJnYpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVybiBl
cnIKKwkJfQorCQl4Lk5pY3NbaV0gPSBlCisJfQorCW51bVBjaWRldnMgOj0gaW50KHhjLm51bV9w
Y2lkZXZzKQorCWNQY2lkZXZzIDo9ICgqWzEgPDwgMjhdQy5saWJ4bF9kZXZpY2VfcGNpKSh1bnNh
ZmUuUG9pbnRlcih4Yy5wY2lkZXZzKSlbOm51bVBjaWRldnM6bnVtUGNpZGV2c10KKwl4LlBjaWRl
dnMgPSBtYWtlKFtdRGV2aWNlUGNpLCBudW1QY2lkZXZzKQorCWZvciBpLCB2IDo9IHJhbmdlIGNQ
Y2lkZXZzIHsKKwkJdmFyIGUgRGV2aWNlUGNpCisJCWlmIGVyciA6PSBlLmZyb21DKCZ2KTsgZXJy
ICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJeC5QY2lkZXZzW2ldID0gZQorCX0KKwlu
dW1SZG1zIDo9IGludCh4Yy5udW1fcmRtcykKKwljUmRtcyA6PSAoKlsxIDw8IDI4XUMubGlieGxf
ZGV2aWNlX3JkbSkodW5zYWZlLlBvaW50ZXIoeGMucmRtcykpWzpudW1SZG1zOm51bVJkbXNdCisJ
eC5SZG1zID0gbWFrZShbXURldmljZVJkbSwgbnVtUmRtcykKKwlmb3IgaSwgdiA6PSByYW5nZSBj
UmRtcyB7CisJCXZhciBlIERldmljZVJkbQorCQlpZiBlcnIgOj0gZS5mcm9tQygmdik7IGVyciAh
PSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCXguUmRtc1tpXSA9IGUKKwl9CisJbnVtRHRk
ZXZzIDo9IGludCh4Yy5udW1fZHRkZXZzKQorCWNEdGRldnMgOj0gKCpbMSA8PCAyOF1DLmxpYnhs
X2RldmljZV9kdGRldikodW5zYWZlLlBvaW50ZXIoeGMuZHRkZXZzKSlbOm51bUR0ZGV2czpudW1E
dGRldnNdCisJeC5EdGRldnMgPSBtYWtlKFtdRGV2aWNlRHRkZXYsIG51bUR0ZGV2cykKKwlmb3Ig
aSwgdiA6PSByYW5nZSBjRHRkZXZzIHsKKwkJdmFyIGUgRGV2aWNlRHRkZXYKKwkJaWYgZXJyIDo9
IGUuZnJvbUMoJnYpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQl4LkR0ZGV2
c1tpXSA9IGUKKwl9CisJbnVtVmZicyA6PSBpbnQoeGMubnVtX3ZmYnMpCisJY1ZmYnMgOj0gKCpb
MSA8PCAyOF1DLmxpYnhsX2RldmljZV92ZmIpKHVuc2FmZS5Qb2ludGVyKHhjLnZmYnMpKVs6bnVt
VmZiczpudW1WZmJzXQorCXguVmZicyA9IG1ha2UoW11EZXZpY2VWZmIsIG51bVZmYnMpCisJZm9y
IGksIHYgOj0gcmFuZ2UgY1ZmYnMgeworCQl2YXIgZSBEZXZpY2VWZmIKKwkJaWYgZXJyIDo9IGUu
ZnJvbUMoJnYpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQl4LlZmYnNbaV0g
PSBlCisJfQorCW51bVZrYnMgOj0gaW50KHhjLm51bV92a2JzKQorCWNWa2JzIDo9ICgqWzEgPDwg
MjhdQy5saWJ4bF9kZXZpY2VfdmtiKSh1bnNhZmUuUG9pbnRlcih4Yy52a2JzKSlbOm51bVZrYnM6
bnVtVmtic10KKwl4LlZrYnMgPSBtYWtlKFtdRGV2aWNlVmtiLCBudW1Wa2JzKQorCWZvciBpLCB2
IDo9IHJhbmdlIGNWa2JzIHsKKwkJdmFyIGUgRGV2aWNlVmtiCisJCWlmIGVyciA6PSBlLmZyb21D
KCZ2KTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJeC5Wa2JzW2ldID0gZQor
CX0KKwludW1WdHBtcyA6PSBpbnQoeGMubnVtX3Z0cG1zKQorCWNWdHBtcyA6PSAoKlsxIDw8IDI4
XUMubGlieGxfZGV2aWNlX3Z0cG0pKHVuc2FmZS5Qb2ludGVyKHhjLnZ0cG1zKSlbOm51bVZ0cG1z
Om51bVZ0cG1zXQorCXguVnRwbXMgPSBtYWtlKFtdRGV2aWNlVnRwbSwgbnVtVnRwbXMpCisJZm9y
IGksIHYgOj0gcmFuZ2UgY1Z0cG1zIHsKKwkJdmFyIGUgRGV2aWNlVnRwbQorCQlpZiBlcnIgOj0g
ZS5mcm9tQygmdik7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCXguVnRwbXNb
aV0gPSBlCisJfQorCW51bVA5UyA6PSBpbnQoeGMubnVtX3A5cykKKwljUDlTIDo9ICgqWzEgPDwg
MjhdQy5saWJ4bF9kZXZpY2VfcDkpKHVuc2FmZS5Qb2ludGVyKHhjLnA5cykpWzpudW1QOVM6bnVt
UDlTXQorCXguUDlTID0gbWFrZShbXURldmljZVA5LCBudW1QOVMpCisJZm9yIGksIHYgOj0gcmFu
Z2UgY1A5UyB7CisJCXZhciBlIERldmljZVA5CisJCWlmIGVyciA6PSBlLmZyb21DKCZ2KTsgZXJy
ICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJeC5QOVNbaV0gPSBlCisJfQorCW51bVB2
Y2FsbHNpZnMgOj0gaW50KHhjLm51bV9wdmNhbGxzaWZzKQorCWNQdmNhbGxzaWZzIDo9ICgqWzEg
PDwgMjhdQy5saWJ4bF9kZXZpY2VfcHZjYWxsc2lmKSh1bnNhZmUuUG9pbnRlcih4Yy5wdmNhbGxz
aWZzKSlbOm51bVB2Y2FsbHNpZnM6bnVtUHZjYWxsc2lmc10KKwl4LlB2Y2FsbHNpZnMgPSBtYWtl
KFtdRGV2aWNlUHZjYWxsc2lmLCBudW1QdmNhbGxzaWZzKQorCWZvciBpLCB2IDo9IHJhbmdlIGNQ
dmNhbGxzaWZzIHsKKwkJdmFyIGUgRGV2aWNlUHZjYWxsc2lmCisJCWlmIGVyciA6PSBlLmZyb21D
KCZ2KTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJeC5QdmNhbGxzaWZzW2ld
ID0gZQorCX0KKwludW1WZGlzcGxzIDo9IGludCh4Yy5udW1fdmRpc3BscykKKwljVmRpc3BscyA6
PSAoKlsxIDw8IDI4XUMubGlieGxfZGV2aWNlX3ZkaXNwbCkodW5zYWZlLlBvaW50ZXIoeGMudmRp
c3BscykpWzpudW1WZGlzcGxzOm51bVZkaXNwbHNdCisJeC5WZGlzcGxzID0gbWFrZShbXURldmlj
ZVZkaXNwbCwgbnVtVmRpc3BscykKKwlmb3IgaSwgdiA6PSByYW5nZSBjVmRpc3BscyB7CisJCXZh
ciBlIERldmljZVZkaXNwbAorCQlpZiBlcnIgOj0gZS5mcm9tQygmdik7IGVyciAhPSBuaWwgewor
CQkJcmV0dXJuIGVycgorCQl9CisJCXguVmRpc3Bsc1tpXSA9IGUKKwl9CisJbnVtVnNuZHMgOj0g
aW50KHhjLm51bV92c25kcykKKwljVnNuZHMgOj0gKCpbMSA8PCAyOF1DLmxpYnhsX2RldmljZV92
c25kKSh1bnNhZmUuUG9pbnRlcih4Yy52c25kcykpWzpudW1Wc25kczpudW1Wc25kc10KKwl4LlZz
bmRzID0gbWFrZShbXURldmljZVZzbmQsIG51bVZzbmRzKQorCWZvciBpLCB2IDo9IHJhbmdlIGNW
c25kcyB7CisJCXZhciBlIERldmljZVZzbmQKKwkJaWYgZXJyIDo9IGUuZnJvbUMoJnYpOyBlcnIg
IT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQl4LlZzbmRzW2ldID0gZQorCX0KKwludW1D
aGFubmVscyA6PSBpbnQoeGMubnVtX2NoYW5uZWxzKQorCWNDaGFubmVscyA6PSAoKlsxIDw8IDI4
XUMubGlieGxfZGV2aWNlX2NoYW5uZWwpKHVuc2FmZS5Qb2ludGVyKHhjLmNoYW5uZWxzKSlbOm51
bUNoYW5uZWxzOm51bUNoYW5uZWxzXQorCXguQ2hhbm5lbHMgPSBtYWtlKFtdRGV2aWNlQ2hhbm5l
bCwgbnVtQ2hhbm5lbHMpCisJZm9yIGksIHYgOj0gcmFuZ2UgY0NoYW5uZWxzIHsKKwkJdmFyIGUg
RGV2aWNlQ2hhbm5lbAorCQlpZiBlcnIgOj0gZS5mcm9tQygmdik7IGVyciAhPSBuaWwgeworCQkJ
cmV0dXJuIGVycgorCQl9CisJCXguQ2hhbm5lbHNbaV0gPSBlCisJfQorCW51bVVzYmN0cmxzIDo9
IGludCh4Yy5udW1fdXNiY3RybHMpCisJY1VzYmN0cmxzIDo9ICgqWzEgPDwgMjhdQy5saWJ4bF9k
ZXZpY2VfdXNiY3RybCkodW5zYWZlLlBvaW50ZXIoeGMudXNiY3RybHMpKVs6bnVtVXNiY3RybHM6
bnVtVXNiY3RybHNdCisJeC5Vc2JjdHJscyA9IG1ha2UoW11EZXZpY2VVc2JjdHJsLCBudW1Vc2Jj
dHJscykKKwlmb3IgaSwgdiA6PSByYW5nZSBjVXNiY3RybHMgeworCQl2YXIgZSBEZXZpY2VVc2Jj
dHJsCisJCWlmIGVyciA6PSBlLmZyb21DKCZ2KTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJy
CisJCX0KKwkJeC5Vc2JjdHJsc1tpXSA9IGUKKwl9CisJbnVtVXNiZGV2cyA6PSBpbnQoeGMubnVt
X3VzYmRldnMpCisJY1VzYmRldnMgOj0gKCpbMSA8PCAyOF1DLmxpYnhsX2RldmljZV91c2JkZXYp
KHVuc2FmZS5Qb2ludGVyKHhjLnVzYmRldnMpKVs6bnVtVXNiZGV2czpudW1Vc2JkZXZzXQorCXgu
VXNiZGV2cyA9IG1ha2UoW11EZXZpY2VVc2JkZXYsIG51bVVzYmRldnMpCisJZm9yIGksIHYgOj0g
cmFuZ2UgY1VzYmRldnMgeworCQl2YXIgZSBEZXZpY2VVc2JkZXYKKwkJaWYgZXJyIDo9IGUuZnJv
bUMoJnYpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQl4LlVzYmRldnNbaV0g
PSBlCisJfQogCXguT25Qb3dlcm9mZiA9IEFjdGlvbk9uU2h1dGRvd24oeGMub25fcG93ZXJvZmYp
CiAJeC5PblJlYm9vdCA9IEFjdGlvbk9uU2h1dGRvd24oeGMub25fcmVib290KQogCXguT25XYXRj
aGRvZyA9IEFjdGlvbk9uU2h1dGRvd24oeGMub25fd2F0Y2hkb2cpCkBAIC0xMTcxLDYgKzE0MzUs
MTYgQEAgZnVuYyAoeCAqVmRpc3BsaW5mbykgZnJvbUMoeGMgKkMubGlieGxfdmRpc3BsaW5mbykg
ZXJyb3IgewogCXguRGV2aWQgPSBEZXZpZCh4Yy5kZXZpZCkKIAl4LlN0YXRlID0gaW50KHhjLnN0
YXRlKQogCXguQmVBbGxvYyA9IGJvb2woeGMuYmVfYWxsb2MpCisJbnVtQ29ubmVjdG9ycyA6PSBp
bnQoeGMubnVtX2Nvbm5lY3RvcnMpCisJY0Nvbm5lY3RvcnMgOj0gKCpbMSA8PCAyOF1DLmxpYnhs
X2Nvbm5lY3RvcmluZm8pKHVuc2FmZS5Qb2ludGVyKHhjLmNvbm5lY3RvcnMpKVs6bnVtQ29ubmVj
dG9yczpudW1Db25uZWN0b3JzXQorCXguQ29ubmVjdG9ycyA9IG1ha2UoW11Db25uZWN0b3JpbmZv
LCBudW1Db25uZWN0b3JzKQorCWZvciBpLCB2IDo9IHJhbmdlIGNDb25uZWN0b3JzIHsKKwkJdmFy
IGUgQ29ubmVjdG9yaW5mbworCQlpZiBlcnIgOj0gZS5mcm9tQygmdik7IGVyciAhPSBuaWwgewor
CQkJcmV0dXJuIGVycgorCQl9CisJCXguQ29ubmVjdG9yc1tpXSA9IGUKKwl9CiAJcmV0dXJuIG5p
bAogfQogCkBAIC0xMTgxLDYgKzE0NTUsMTYgQEAgZnVuYyAoeCAqU3RyZWFtaW5mbykgZnJvbUMo
eGMgKkMubGlieGxfc3RyZWFtaW5mbykgZXJyb3IgewogfQogCiBmdW5jICh4ICpQY21pbmZvKSBm
cm9tQyh4YyAqQy5saWJ4bF9wY21pbmZvKSBlcnJvciB7CisJbnVtVnNuZFN0cmVhbXMgOj0gaW50
KHhjLm51bV92c25kX3N0cmVhbXMpCisJY1N0cmVhbXMgOj0gKCpbMSA8PCAyOF1DLmxpYnhsX3N0
cmVhbWluZm8pKHVuc2FmZS5Qb2ludGVyKHhjLnN0cmVhbXMpKVs6bnVtVnNuZFN0cmVhbXM6bnVt
VnNuZFN0cmVhbXNdCisJeC5TdHJlYW1zID0gbWFrZShbXVN0cmVhbWluZm8sIG51bVZzbmRTdHJl
YW1zKQorCWZvciBpLCB2IDo9IHJhbmdlIGNTdHJlYW1zIHsKKwkJdmFyIGUgU3RyZWFtaW5mbwor
CQlpZiBlcnIgOj0gZS5mcm9tQygmdik7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9
CisJCXguU3RyZWFtc1tpXSA9IGUKKwl9CiAJcmV0dXJuIG5pbAogfQogCkBAIC0xMTkxLDYgKzE0
NzUsMTYgQEAgZnVuYyAoeCAqVnNuZGluZm8pIGZyb21DKHhjICpDLmxpYnhsX3ZzbmRpbmZvKSBl
cnJvciB7CiAJeC5Gcm9udGVuZElkID0gdWludDMyKHhjLmZyb250ZW5kX2lkKQogCXguRGV2aWQg
PSBEZXZpZCh4Yy5kZXZpZCkKIAl4LlN0YXRlID0gaW50KHhjLnN0YXRlKQorCW51bVZzbmRQY21z
IDo9IGludCh4Yy5udW1fdnNuZF9wY21zKQorCWNQY21zIDo9ICgqWzEgPDwgMjhdQy5saWJ4bF9w
Y21pbmZvKSh1bnNhZmUuUG9pbnRlcih4Yy5wY21zKSlbOm51bVZzbmRQY21zOm51bVZzbmRQY21z
XQorCXguUGNtcyA9IG1ha2UoW11QY21pbmZvLCBudW1Wc25kUGNtcykKKwlmb3IgaSwgdiA6PSBy
YW5nZSBjUGNtcyB7CisJCXZhciBlIFBjbWluZm8KKwkJaWYgZXJyIDo9IGUuZnJvbUMoJnYpOyBl
cnIgIT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQl4LlBjbXNbaV0gPSBlCisJfQogCXJl
dHVybiBuaWwKIH0KIApAQCAtMTIwOSw2ICsxNTAzLDEyIEBAIGZ1bmMgKHggKlZrYmluZm8pIGZy
b21DKHhjICpDLmxpYnhsX3ZrYmluZm8pIGVycm9yIHsKIGZ1bmMgKHggKk51bWFpbmZvKSBmcm9t
Qyh4YyAqQy5saWJ4bF9udW1haW5mbykgZXJyb3IgewogCXguU2l6ZSA9IHVpbnQ2NCh4Yy5zaXpl
KQogCXguRnJlZSA9IHVpbnQ2NCh4Yy5mcmVlKQorCW51bURpc3RzIDo9IGludCh4Yy5udW1fZGlz
dHMpCisJY0Rpc3RzIDo9ICgqWzEgPDwgMjhdQy51aW50MzJfdCkodW5zYWZlLlBvaW50ZXIoeGMu
ZGlzdHMpKVs6bnVtRGlzdHM6bnVtRGlzdHNdCisJeC5EaXN0cyA9IG1ha2UoW111aW50MzIsIG51
bURpc3RzKQorCWZvciBpLCB2IDo9IHJhbmdlIGNEaXN0cyB7CisJCXguRGlzdHNbaV0gPSB1aW50
MzIodikKKwl9CiAJcmV0dXJuIG5pbAogfQogCi0tIAoyLjE5LjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
