Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4B413047C
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2020 22:04:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inqY6-0003GM-4K; Sat, 04 Jan 2020 21:01:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vM5p=2Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1inqY4-0003Fv-FA
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 21:01:28 +0000
X-Inumbo-ID: 5be6861e-2f35-11ea-88e7-bc764e2007e4
Received: from mail-yw1-xc31.google.com (unknown [2607:f8b0:4864:20::c31])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5be6861e-2f35-11ea-88e7-bc764e2007e4;
 Sat, 04 Jan 2020 21:01:21 +0000 (UTC)
Received: by mail-yw1-xc31.google.com with SMTP id u139so20160307ywf.13
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jan 2020 13:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=WLNFmL0WSVUZ7z1EzU2LXnJlAFRuH/CV8Dxe1XOC58k=;
 b=rfFBJm+OJWPj2Uj3kChcTfKPzO9XeLfsRUDyKN3dhnc0Y3sJ8kxWjBHEpNNNmuHjfM
 hy+R63JY3G35qK/CsBqGBJPdghjK0/VQsnBSI8jDJTTinUZoACtJDcyrf2g5vB6gjoKd
 Z3pti90WH7g6NZxZpOlq/faGb1klLLFjJwIzeB/d28Q4hM9YyhrMyjjxhGEXF3o8U3HB
 +YozR//3gEVuESvbTpkIYJe483gfinjwp+FZnzOyS2mUpdDIjZZqPoEpLOrNmlXI8UVR
 w21MZaI3jazkbLedQnLkdXshx44WJBuTzm+uDCDtuYZHB4W0NR97/Tx2hPOVlErdjiNc
 GTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=WLNFmL0WSVUZ7z1EzU2LXnJlAFRuH/CV8Dxe1XOC58k=;
 b=FF5+oZG4celfjtlQ6y3sxdaOVv2b39aRYetYhys3oG4xEwXiEg4Zs2W8qgo9synXie
 hlhivk8pMVVFDrnGABUicTaMZmqxwAaw+WyyuphjSRM2GcvKtkcZwrlmsuoTxhxRok5V
 MZZdD0wRm8r3qwDkmpx0AQxaSbxY8bX49vEruWUn9oLvC5j7FCQy7pz4v0KVMqNjswEL
 E0JVszbyC9gHxWVM1H7D2192ZJ28et1ZJJr+LyjcQe+IiicvikPSG/5W7QqhL3JTN45b
 JqXEhtzOngJ8HfNWXMcRfzgjQz86TyU9mu772npOzHAzmhnRdT2WO1pKZ3MklgI5oSsM
 MA0g==
X-Gm-Message-State: APjAAAX+x5zBLxJGNHgFh+VODBOC0sCZHp2ddHeY25frIkF4UoEsmyF+
 BhH9/cakZRxJiOeXyXvC7ZYGHost
X-Google-Smtp-Source: APXvYqwjMQ7wCqHQYBmqjm39zVXGf4hwqKfN8CKVYxhfYEvnznwL/dI/8sb2FKwIh6eHTGyzw4nYSg==
X-Received: by 2002:a81:1744:: with SMTP id 65mr68848146ywx.110.1578171680113; 
 Sat, 04 Jan 2020 13:01:20 -0800 (PST)
Received: from four.lan (cpe-67-241-56-252.twcny.res.rr.com. [67.241.56.252])
 by smtp.gmail.com with ESMTPSA id
 r10sm26366714ywr.97.2020.01.04.13.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2020 13:01:19 -0800 (PST)
From: Nick Rosbrook <rosbrookn@gmail.com>
X-Google-Original-From: Nick Rosbrook <rosbrookn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Date: Sat,  4 Jan 2020 16:00:52 -0500
Message-Id: <52678cf50a54609dc453df47ffb4fa0429c69bbd.1578170151.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578170151.git.rosbrookn@ainfosec.com>
References: <cover.1578170151.git.rosbrookn@ainfosec.com>
In-Reply-To: <cover.1578170151.git.rosbrookn@ainfosec.com>
References: <cover.1578170151.git.rosbrookn@ainfosec.com>
Subject: [Xen-devel] [PATCH v5 2/3] golang/xenlight: implement keyed union
 Go to C marshaling
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgdGhlIEMgdW5pb24gY2Fubm90IGJlIGRpcmVjdGx5IHBvcHVsYXRlZCwgcG9wdWxhdGUg
dGhlIGZpZWxkcyBvZiB0aGUKY29ycmVzcG9uZGluZyBDIHN0cnVjdCBkZWZpbmVkIGluIHRoZSBj
Z28gcHJlYW1ibGUsIGFuZCB0aGVuIGNvcHkgdGhhdApzdHJ1Y3QgYXMgYnl0ZXMgaW50byB0aGUg
Ynl0ZSBzbGljZSB0aGF0IEdvIHVzZXMgYXMgdGhlIHVuaW9uLgoKU2lnbmVkLW9mZi1ieTogTmlj
ayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjU6Ci0g
TWFrZSB1c2Ugb2YgeGVubGlnaHRfZ29sYW5nX2NvbnZlcnRfdG9fQyB0byBjb252ZXJ0IGZpZWxk
cy4KLSBSZW1vdmUgZGlzcG9zZV9mbiBmcm9tIHBhcmFtZXRlciBsaXN0IGluIHhlbmxpZ2h0X2dv
bGFuZ191bmlvbl90b19DCiAgc2luY2UgaXQncyBubyBsb25nZXIgbmVlZGVkLgotLS0KIHRvb2xz
L2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5ICB8ICA3OSArKysrKystCiB0b29scy9nb2xh
bmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28gfCAyOTQgKysrKysrKysrKysrKysrKysrKysrKysr
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDM2NiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2dvbGFuZy94ZW5saWdodC9nZW5nb3R5cGVzLnB5IGIvdG9vbHMv
Z29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkKaW5kZXggMTVhYTRiZTIyMC4uOGFiNjc2OGU2
MSAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkKKysrIGIv
dG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2dlbmdvdHlwZXMucHkKQEAgLTQ2NCwxNSArNDY0LDE1IEBA
IGRlZiB4ZW5saWdodF9nb2xhbmdfZGVmaW5lX3RvX0ModHkgPSBOb25lLCB0eXBlbmFtZSA9IE5v
bmUsIG5lc3RlZCA9IEZhbHNlKToKICAgICAgICAgICAgICAgICBib2R5ICs9IHhlbmxpZ2h0X2dv
bGFuZ19jb252ZXJ0X3RvX0MobmYsIG91dGVyX25hbWU9Zi5uYW1lKQogCiAgICAgICAgIGVsaWYg
aXNpbnN0YW5jZShmLnR5cGUsIGlkbC5LZXllZFVuaW9uKToKLSAgICAgICAgICAgICMgVE9ETwot
ICAgICAgICAgICAgcGFzcworICAgICAgICAgICAgYm9keSArPSB4ZW5saWdodF9nb2xhbmdfdW5p
b25fdG9fQyhmLnR5cGUsIGYubmFtZSwgdHkudHlwZW5hbWUpCiAKICAgICAgICAgZWxzZToKICAg
ICAgICAgICAgIHJhaXNlIEV4Y2VwdGlvbigndHlwZSB7fSBub3Qgc3VwcG9ydGVkJy5mb3JtYXQo
Zi50eXBlKSkKIAogICAgIHJldHVybiBmdW5jLmZvcm1hdChnb25hbWUsIGNuYW1lLCBib2R5KQog
Ci1kZWYgeGVubGlnaHRfZ29sYW5nX2NvbnZlcnRfdG9fQyh0eSA9IE5vbmUsIG91dGVyX25hbWUg
PSBOb25lKToKK2RlZiB4ZW5saWdodF9nb2xhbmdfY29udmVydF90b19DKHR5ID0gTm9uZSwgb3V0
ZXJfbmFtZSA9IE5vbmUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3Zhcm5h
bWUgPSBOb25lLCBjdmFybmFtZSA9IE5vbmUpOgogICAgICIiIgogICAgIFJldHVybnMgYSBsaW5l
IG9mIEdvIGNvZGUgdGhhdCBjb252ZXJ0cyB0aGUgR28gdHlwZSByZXByZXNlbnRlZAogICAgIGJ5
IHR5IHRvIGl0cyBjb3JyZXNwb25kaW5nIEdvIHR5cGUuCkBAIC00ODIsNiArNDgyLDE0IEBAIGRl
ZiB4ZW5saWdodF9nb2xhbmdfY29udmVydF90b19DKHR5ID0gTm9uZSwgb3V0ZXJfbmFtZSA9IE5v
bmUpOgogICAgICIiIgogICAgIHMgPSAnJwogCisgICAgIyBVc2UgJ3hjJyBhcyB0aGUgbmFtZSBm
b3IgdGhlIEMgdmFyaWFibGUgdW5sZXNzIG90aGVyd2lzZSBzcGVjaWZpZWQuCisgICAgaWYgY3Zh
cm5hbWUgaXMgTm9uZToKKyAgICAgICAgY3Zhcm5hbWUgPSAneGMnCisKKyAgICAjIFVzZSAneCcg
YXMgdGhlIG5hbWUgZm9yIHRoZSBHbyB2YXJpYWJsZSB1bmxlc3Mgb3RoZXJ3aXNlIHNwZWNpZmll
ZC4KKyAgICBpZiBnb3Zhcm5hbWUgaXMgTm9uZToKKyAgICAgICAgZ292YXJuYW1lID0gJ3gnCisK
ICAgICBnb3R5cGVuYW1lID0geGVubGlnaHRfZ29sYW5nX2ZtdF9uYW1lKHR5LnR5cGUudHlwZW5h
bWUpCiAgICAgY3R5cGVuYW1lICA9IHR5LnR5cGUudHlwZW5hbWUKICAgICBnb25hbWUgICAgID0g
eGVubGlnaHRfZ29sYW5nX2ZtdF9uYW1lKHR5Lm5hbWUpCkBAIC01MDIsMTYgKzUxMCw3MyBAQCBk
ZWYgeGVubGlnaHRfZ29sYW5nX2NvbnZlcnRfdG9fQyh0eSA9IE5vbmUsIG91dGVyX25hbWUgPSBO
b25lKToKICAgICAgICAgICAgICAgICAgICBnb3R5cGVuYW1lIGluIGdvX2J1aWx0aW5fdHlwZXMp
CiAKICAgICBpZiBub3QgaXNfY2FzdGFibGU6Ci0gICAgICAgIHMgKz0gJ2lmIGVyciA6PSB4Lnt9
LnRvQygmeGMue30pOyBlcnIgIT0gbmlsIHt7XG4nLmZvcm1hdChnb25hbWUsY25hbWUpCisgICAg
ICAgIHMgKz0gJ2lmIGVyciA6PSB7fS57fS50b0MoJnt9Lnt9KTsgZXJyICE9IG5pbCB7e1xuJy5m
b3JtYXQoZ292YXJuYW1lLGdvbmFtZSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdmFybmFtZSxjbmFtZSkKICAgICAg
ICAgcyArPSAncmV0dXJuIGVyclxufVxuJwogCiAgICAgZWxpZiBnb3R5cGVuYW1lID09ICdzdHJp
bmcnOgogICAgICAgICAjIFVzZSB0aGUgY2dvIGhlbHBlciBmb3IgY29udmVydGluZyBDIHN0cmlu
Z3MuCi0gICAgICAgIHMgKz0gJ2lmIHgue30gIT0gIiIge3tcbicuZm9ybWF0KGdvbmFtZSkKLSAg
ICAgICAgcyArPSAneGMue30gPSBDLkNTdHJpbmcoeC57fSl9fVxuJy5mb3JtYXQoY25hbWUsZ29u
YW1lKQorICAgICAgICBzICs9ICdpZiB7fS57fSAhPSAiIiB7e1xuJy5mb3JtYXQoZ292YXJuYW1l
LGdvbmFtZSkKKyAgICAgICAgcyArPSAne30ue30gPSBDLkNTdHJpbmcoe30ue30pfX1cbicuZm9y
bWF0KGN2YXJuYW1lLGNuYW1lLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ292YXJuYW1lLGdvbmFtZSkKIAogICAgIGVsc2U6Ci0gICAgICAgIHMg
Kz0gJ3hjLnt9ID0gQy57fSh4Lnt9KVxuJy5mb3JtYXQoY25hbWUsY3R5cGVuYW1lLGdvbmFtZSkK
KyAgICAgICAgcyArPSAne30ue30gPSBDLnt9KHt9Lnt9KVxuJy5mb3JtYXQoY3Zhcm5hbWUsY25h
bWUsY3R5cGVuYW1lLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBnb3Zhcm5hbWUsZ29uYW1lKQorCisgICAgcmV0dXJuIHMKKworZGVmIHhlbmxpZ2h0X2dvbGFu
Z191bmlvbl90b19DKHR5ID0gTm9uZSwgdW5pb25fbmFtZSA9ICcnLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0cnVjdF9uYW1lID0gJycpOgorICAgIGtleW5hbWUgICA9IHR5Lmtl
eXZhci5uYW1lCisgICAgZ29rZXluYW1lID0geGVubGlnaHRfZ29sYW5nX2ZtdF9uYW1lKGtleW5h
bWUpCisgICAga2V5dHlwZSAgID0gdHkua2V5dmFyLnR5cGUudHlwZW5hbWUKKyAgICBnb2tleXR5
cGUgPSB4ZW5saWdodF9nb2xhbmdfZm10X25hbWUoa2V5dHlwZSkKKworICAgIGludGVyZmFjZV9u
YW1lID0gJ3t9X3t9X3VuaW9uJy5mb3JtYXQoc3RydWN0X25hbWUsIGtleW5hbWUpCisgICAgaW50
ZXJmYWNlX25hbWUgPSB4ZW5saWdodF9nb2xhbmdfZm10X25hbWUoaW50ZXJmYWNlX25hbWUsIGV4
cG9ydGVkPUZhbHNlKQorCisgICAgY2dvX2tleW5hbWUgPSBrZXluYW1lCisgICAgaWYgY2dvX2tl
eW5hbWUgaW4gZ29fa2V5d29yZHM6CisgICAgICAgIGNnb19rZXluYW1lID0gJ18nICsgY2dvX2tl
eW5hbWUKKworCisgICAgcyA9ICd4Yy57fSA9IEMue30oeC57fSlcbicuZm9ybWF0KGNnb19rZXlu
YW1lLGtleXR5cGUsZ29rZXluYW1lKQorICAgIHMgKz0gJ3N3aXRjaCB4Lnt9e3tcbicuZm9ybWF0
KGdva2V5bmFtZSkKKworICAgICMgQ3JlYXRlIHN3aXRjaCBzdGF0ZW1lbnQgdG8gZGV0ZXJtaW5l
IGhvdyB0byBwb3B1bGF0ZSB0aGUgQyB1bmlvbi4KKyAgICBmb3IgZiBpbiB0eS5maWVsZHM6Cisg
ICAgICAgIGtleV92YWwgPSAne31fe30nLmZvcm1hdChrZXl0eXBlLCBmLm5hbWUpCisgICAgICAg
IGtleV92YWwgPSB4ZW5saWdodF9nb2xhbmdfZm10X25hbWUoa2V5X3ZhbCkKKyAgICAgICAgaWYg
Zi50eXBlIGlzIE5vbmU6CisgICAgICAgICAgICBjb250aW51ZQorCisgICAgICAgIHMgKz0gJ2Nh
c2Uge306XG4nLmZvcm1hdChrZXlfdmFsKQorICAgICAgICBjZ290eXBlID0gJ3t9X3t9X3VuaW9u
X3t9Jy5mb3JtYXQoc3RydWN0X25hbWUsa2V5bmFtZSxmLm5hbWUpCisgICAgICAgIGdvdHlwZSAg
PSB4ZW5saWdodF9nb2xhbmdfZm10X25hbWUoY2dvdHlwZSkKKworICAgICAgICBmaWVsZF9uYW1l
ID0geGVubGlnaHRfZ29sYW5nX2ZtdF9uYW1lKCd7fV91bmlvbicuZm9ybWF0KGtleW5hbWUpKQor
ICAgICAgICBzICs9ICd0bXAsIG9rIDo9IHgue30uKHt9KVxuJy5mb3JtYXQoZmllbGRfbmFtZSxn
b3R5cGUpCisgICAgICAgIHMgKz0gJ2lmICFvayB7XG4nCisgICAgICAgIHMgKz0gJ3JldHVybiBl
cnJvcnMuTmV3KCJ3cm9uZyB0eXBlIGZvciB1bmlvbiBrZXkge30iKVxuJy5mb3JtYXQoa2V5bmFt
ZSkKKyAgICAgICAgcyArPSAnfVxuJworCisgICAgICAgIHMgKz0gJ3ZhciB7fSBDLnt9XG4nLmZv
cm1hdChmLm5hbWUsY2dvdHlwZSkKKyAgICAgICAgZm9yIHVmIGluIGYudHlwZS5maWVsZHM6Cisg
ICAgICAgICAgICBzICs9IHhlbmxpZ2h0X2dvbGFuZ19jb252ZXJ0X3RvX0ModWYsY3Zhcm5hbWU9
Zi5uYW1lLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dmFybmFtZT0ndG1wJykKKworICAgICAgICAjIFRoZSB1bmlvbiBpcyBzdGlsbCByZXByZXNlbnRl
ZCBhcyBHbyBbXWJ5dGUuCisgICAgICAgIHMgKz0gJ3t9Qnl0ZXMgOj0gQy5Hb0J5dGVzKHVuc2Fm
ZS5Qb2ludGVyKCZ7fSksQy5zaXplb2Zfe30pXG4nLmZvcm1hdChmLm5hbWUsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmLm5hbWUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjZ290eXBlKQorICAgICAg
ICBzICs9ICdjb3B5KHhjLnt9WzpdLHt9Qnl0ZXMpXG4nLmZvcm1hdCh1bmlvbl9uYW1lLGYubmFt
ZSkKKworICAgICMgRW5kIHN3aXRjaCBzdGF0ZW1lbnQKKyAgICBzICs9ICdkZWZhdWx0OlxuJwor
ICAgIGVycl9zdHJpbmcgPSAnImludmFsaWQgdW5pb24ga2V5IFwnJXZcJyIsIHgue30nLmZvcm1h
dChnb2tleW5hbWUpCisgICAgcyArPSAncmV0dXJuIGZtdC5FcnJvcmYoe30pJy5mb3JtYXQoZXJy
X3N0cmluZykKKyAgICBzICs9ICd9XG4nCiAKICAgICByZXR1cm4gcwogCmRpZmYgLS1naXQgYS90
b29scy9nb2xhbmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28gYi90b29scy9nb2xhbmcveGVubGln
aHQvaGVscGVycy5nZW4uZ28KaW5kZXggMzBjZDFhOWIzZi4uMGJmMmIwZGRlZiAxMDA2NDQKLS0t
IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L2hlbHBlcnMuZ2VuLmdvCisrKyBiL3Rvb2xzL2dvbGFu
Zy94ZW5saWdodC9oZWxwZXJzLmdlbi5nbwpAQCAtMzgxLDYgKzM4MSwyMiBAQCBmdW5jICh4ICpD
aGFubmVsaW5mbykgdG9DKHhjICpDLmxpYnhsX2NoYW5uZWxpbmZvKSAoZXJyIGVycm9yKSB7CiAJ
eGMuc3RhdGUgPSBDLmludCh4LlN0YXRlKQogCXhjLmV2dGNoID0gQy5pbnQoeC5FdnRjaCkKIAl4
Yy5ycmVmID0gQy5pbnQoeC5ScmVmKQorCXhjLmNvbm5lY3Rpb24gPSBDLmxpYnhsX2NoYW5uZWxf
Y29ubmVjdGlvbih4LkNvbm5lY3Rpb24pCisJc3dpdGNoIHguQ29ubmVjdGlvbiB7CisJY2FzZSBD
aGFubmVsQ29ubmVjdGlvblB0eToKKwkJdG1wLCBvayA6PSB4LkNvbm5lY3Rpb25Vbmlvbi4oQ2hh
bm5lbGluZm9Db25uZWN0aW9uVW5pb25QdHkpCisJCWlmICFvayB7CisJCQlyZXR1cm4gZXJyb3Jz
Lk5ldygid3JvbmcgdHlwZSBmb3IgdW5pb24ga2V5IGNvbm5lY3Rpb24iKQorCQl9CisJCXZhciBw
dHkgQy5saWJ4bF9jaGFubmVsaW5mb19jb25uZWN0aW9uX3VuaW9uX3B0eQorCQlpZiB0bXAuUGF0
aCAhPSAiIiB7CisJCQlwdHkucGF0aCA9IEMuQ1N0cmluZyh0bXAuUGF0aCkKKwkJfQorCQlwdHlC
eXRlcyA6PSBDLkdvQnl0ZXModW5zYWZlLlBvaW50ZXIoJnB0eSksIEMuc2l6ZW9mX2xpYnhsX2No
YW5uZWxpbmZvX2Nvbm5lY3Rpb25fdW5pb25fcHR5KQorCQljb3B5KHhjLnVbOl0sIHB0eUJ5dGVz
KQorCWRlZmF1bHQ6CisJCXJldHVybiBmbXQuRXJyb3JmKCJpbnZhbGlkIHVuaW9uIGtleSAnJXYn
IiwgeC5Db25uZWN0aW9uKQorCX0KIAogCXJldHVybiBuaWwKIH0KQEAgLTExMjQsNiArMTE0MCwx
ODkgQEAgZnVuYyAoeCAqRG9tYWluQnVpbGRJbmZvKSB0b0MoeGMgKkMubGlieGxfZG9tYWluX2J1
aWxkX2luZm8pIChlcnIgZXJyb3IpIHsKIAkJcmV0dXJuIGVycgogCX0KIAl4Yy50ZWUgPSBDLmxp
YnhsX3RlZV90eXBlKHguVGVlKQorCXhjLl90eXBlID0gQy5saWJ4bF9kb21haW5fdHlwZSh4LlR5
cGUpCisJc3dpdGNoIHguVHlwZSB7CisJY2FzZSBEb21haW5UeXBlSHZtOgorCQl0bXAsIG9rIDo9
IHguVHlwZVVuaW9uLihEb21haW5CdWlsZEluZm9UeXBlVW5pb25Idm0pCisJCWlmICFvayB7CisJ
CQlyZXR1cm4gZXJyb3JzLk5ldygid3JvbmcgdHlwZSBmb3IgdW5pb24ga2V5IHR5cGUiKQorCQl9
CisJCXZhciBodm0gQy5saWJ4bF9kb21haW5fYnVpbGRfaW5mb190eXBlX3VuaW9uX2h2bQorCQlp
ZiB0bXAuRmlybXdhcmUgIT0gIiIgeworCQkJaHZtLmZpcm13YXJlID0gQy5DU3RyaW5nKHRtcC5G
aXJtd2FyZSkKKwkJfQorCQlodm0uYmlvcyA9IEMubGlieGxfYmlvc190eXBlKHRtcC5CaW9zKQor
CQlpZiBlcnIgOj0gdG1wLlBhZS50b0MoJmh2bS5wYWUpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVy
biBlcnIKKwkJfQorCQlpZiBlcnIgOj0gdG1wLkFwaWMudG9DKCZodm0uYXBpYyk7IGVyciAhPSBu
aWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCWlmIGVyciA6PSB0bXAuQWNwaS50b0MoJmh2bS5h
Y3BpKTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJaWYgZXJyIDo9IHRtcC5B
Y3BpUzMudG9DKCZodm0uYWNwaV9zMyk7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9
CisJCWlmIGVyciA6PSB0bXAuQWNwaVM0LnRvQygmaHZtLmFjcGlfczQpOyBlcnIgIT0gbmlsIHsK
KwkJCXJldHVybiBlcnIKKwkJfQorCQlpZiBlcnIgOj0gdG1wLkFjcGlMYXB0b3BTbGF0ZS50b0Mo
Jmh2bS5hY3BpX2xhcHRvcF9zbGF0ZSk7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9
CisJCWlmIGVyciA6PSB0bXAuTngudG9DKCZodm0ubngpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVy
biBlcnIKKwkJfQorCQlpZiBlcnIgOj0gdG1wLlZpcmlkaWFuLnRvQygmaHZtLnZpcmlkaWFuKTsg
ZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJaWYgZXJyIDo9IHRtcC5WaXJpZGlh
bkVuYWJsZS50b0MoJmh2bS52aXJpZGlhbl9lbmFibGUpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVy
biBlcnIKKwkJfQorCQlpZiBlcnIgOj0gdG1wLlZpcmlkaWFuRGlzYWJsZS50b0MoJmh2bS52aXJp
ZGlhbl9kaXNhYmxlKTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJaWYgdG1w
LlRpbWVvZmZzZXQgIT0gIiIgeworCQkJaHZtLnRpbWVvZmZzZXQgPSBDLkNTdHJpbmcodG1wLlRp
bWVvZmZzZXQpCisJCX0KKwkJaWYgZXJyIDo9IHRtcC5IcGV0LnRvQygmaHZtLmhwZXQpOyBlcnIg
IT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQlpZiBlcnIgOj0gdG1wLlZwdEFsaWduLnRv
QygmaHZtLnZwdF9hbGlnbik7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCWh2
bS5tbWlvX2hvbGVfbWVta2IgPSBDLnVpbnQ2NF90KHRtcC5NbWlvSG9sZU1lbWtiKQorCQlodm0u
dGltZXJfbW9kZSA9IEMubGlieGxfdGltZXJfbW9kZSh0bXAuVGltZXJNb2RlKQorCQlpZiBlcnIg
Oj0gdG1wLk5lc3RlZEh2bS50b0MoJmh2bS5uZXN0ZWRfaHZtKTsgZXJyICE9IG5pbCB7CisJCQly
ZXR1cm4gZXJyCisJCX0KKwkJaWYgZXJyIDo9IHRtcC5BbHRwMk0udG9DKCZodm0uYWx0cDJtKTsg
ZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJaWYgdG1wLlN5c3RlbUZpcm13YXJl
ICE9ICIiIHsKKwkJCWh2bS5zeXN0ZW1fZmlybXdhcmUgPSBDLkNTdHJpbmcodG1wLlN5c3RlbUZp
cm13YXJlKQorCQl9CisJCWlmIHRtcC5TbWJpb3NGaXJtd2FyZSAhPSAiIiB7CisJCQlodm0uc21i
aW9zX2Zpcm13YXJlID0gQy5DU3RyaW5nKHRtcC5TbWJpb3NGaXJtd2FyZSkKKwkJfQorCQlpZiB0
bXAuQWNwaUZpcm13YXJlICE9ICIiIHsKKwkJCWh2bS5hY3BpX2Zpcm13YXJlID0gQy5DU3RyaW5n
KHRtcC5BY3BpRmlybXdhcmUpCisJCX0KKwkJaHZtLmhkdHlwZSA9IEMubGlieGxfaGR0eXBlKHRt
cC5IZHR5cGUpCisJCWlmIGVyciA6PSB0bXAuTm9ncmFwaGljLnRvQygmaHZtLm5vZ3JhcGhpYyk7
IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCWlmIGVyciA6PSB0bXAuVmdhLnRv
QygmaHZtLnZnYSk7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCWlmIGVyciA6
PSB0bXAuVm5jLnRvQygmaHZtLnZuYyk7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9
CisJCWlmIHRtcC5LZXltYXAgIT0gIiIgeworCQkJaHZtLmtleW1hcCA9IEMuQ1N0cmluZyh0bXAu
S2V5bWFwKQorCQl9CisJCWlmIGVyciA6PSB0bXAuU2RsLnRvQygmaHZtLnNkbCk7IGVyciAhPSBu
aWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCWlmIGVyciA6PSB0bXAuU3BpY2UudG9DKCZodm0u
c3BpY2UpOyBlcnIgIT0gbmlsIHsKKwkJCXJldHVybiBlcnIKKwkJfQorCQlpZiBlcnIgOj0gdG1w
LkdmeFBhc3N0aHJ1LnRvQygmaHZtLmdmeF9wYXNzdGhydSk7IGVyciAhPSBuaWwgeworCQkJcmV0
dXJuIGVycgorCQl9CisJCWh2bS5nZnhfcGFzc3RocnVfa2luZCA9IEMubGlieGxfZ2Z4X3Bhc3N0
aHJ1X2tpbmQodG1wLkdmeFBhc3N0aHJ1S2luZCkKKwkJaWYgdG1wLlNlcmlhbCAhPSAiIiB7CisJ
CQlodm0uc2VyaWFsID0gQy5DU3RyaW5nKHRtcC5TZXJpYWwpCisJCX0KKwkJaWYgdG1wLkJvb3Qg
IT0gIiIgeworCQkJaHZtLmJvb3QgPSBDLkNTdHJpbmcodG1wLkJvb3QpCisJCX0KKwkJaWYgZXJy
IDo9IHRtcC5Vc2IudG9DKCZodm0udXNiKTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJ
CX0KKwkJaHZtLnVzYnZlcnNpb24gPSBDLmludCh0bXAuVXNidmVyc2lvbikKKwkJaWYgdG1wLlVz
YmRldmljZSAhPSAiIiB7CisJCQlodm0udXNiZGV2aWNlID0gQy5DU3RyaW5nKHRtcC5Vc2JkZXZp
Y2UpCisJCX0KKwkJaWYgZXJyIDo9IHRtcC5Wa2JEZXZpY2UudG9DKCZodm0udmtiX2RldmljZSk7
IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCWlmIHRtcC5Tb3VuZGh3ICE9ICIi
IHsKKwkJCWh2bS5zb3VuZGh3ID0gQy5DU3RyaW5nKHRtcC5Tb3VuZGh3KQorCQl9CisJCWlmIGVy
ciA6PSB0bXAuWGVuUGxhdGZvcm1QY2kudG9DKCZodm0ueGVuX3BsYXRmb3JtX3BjaSk7IGVyciAh
PSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9CisJCWlmIGVyciA6PSB0bXAuVXNiZGV2aWNlTGlz
dC50b0MoJmh2bS51c2JkZXZpY2VfbGlzdCk7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgor
CQl9CisJCWh2bS52ZW5kb3JfZGV2aWNlID0gQy5saWJ4bF92ZW5kb3JfZGV2aWNlKHRtcC5WZW5k
b3JEZXZpY2UpCisJCWlmIGVyciA6PSB0bXAuTXNWbUdlbmlkLnRvQygmaHZtLm1zX3ZtX2dlbmlk
KTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJaWYgZXJyIDo9IHRtcC5TZXJp
YWxMaXN0LnRvQygmaHZtLnNlcmlhbF9saXN0KTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJy
CisJCX0KKwkJaWYgZXJyIDo9IHRtcC5SZG0udG9DKCZodm0ucmRtKTsgZXJyICE9IG5pbCB7CisJ
CQlyZXR1cm4gZXJyCisJCX0KKwkJaHZtLnJkbV9tZW1fYm91bmRhcnlfbWVta2IgPSBDLnVpbnQ2
NF90KHRtcC5SZG1NZW1Cb3VuZGFyeU1lbWtiKQorCQlodm0ubWNhX2NhcHMgPSBDLnVpbnQ2NF90
KHRtcC5NY2FDYXBzKQorCQlodm1CeXRlcyA6PSBDLkdvQnl0ZXModW5zYWZlLlBvaW50ZXIoJmh2
bSksIEMuc2l6ZW9mX2xpYnhsX2RvbWFpbl9idWlsZF9pbmZvX3R5cGVfdW5pb25faHZtKQorCQlj
b3B5KHhjLnVbOl0sIGh2bUJ5dGVzKQorCWNhc2UgRG9tYWluVHlwZVB2OgorCQl0bXAsIG9rIDo9
IHguVHlwZVVuaW9uLihEb21haW5CdWlsZEluZm9UeXBlVW5pb25QdikKKwkJaWYgIW9rIHsKKwkJ
CXJldHVybiBlcnJvcnMuTmV3KCJ3cm9uZyB0eXBlIGZvciB1bmlvbiBrZXkgdHlwZSIpCisJCX0K
KwkJdmFyIHB2IEMubGlieGxfZG9tYWluX2J1aWxkX2luZm9fdHlwZV91bmlvbl9wdgorCQlpZiB0
bXAuS2VybmVsICE9ICIiIHsKKwkJCXB2Lmtlcm5lbCA9IEMuQ1N0cmluZyh0bXAuS2VybmVsKQor
CQl9CisJCXB2LnNsYWNrX21lbWtiID0gQy51aW50NjRfdCh0bXAuU2xhY2tNZW1rYikKKwkJaWYg
dG1wLkJvb3Rsb2FkZXIgIT0gIiIgeworCQkJcHYuYm9vdGxvYWRlciA9IEMuQ1N0cmluZyh0bXAu
Qm9vdGxvYWRlcikKKwkJfQorCQlpZiBlcnIgOj0gdG1wLkJvb3Rsb2FkZXJBcmdzLnRvQygmcHYu
Ym9vdGxvYWRlcl9hcmdzKTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJaWYg
dG1wLkNtZGxpbmUgIT0gIiIgeworCQkJcHYuY21kbGluZSA9IEMuQ1N0cmluZyh0bXAuQ21kbGlu
ZSkKKwkJfQorCQlpZiB0bXAuUmFtZGlzayAhPSAiIiB7CisJCQlwdi5yYW1kaXNrID0gQy5DU3Ry
aW5nKHRtcC5SYW1kaXNrKQorCQl9CisJCWlmIHRtcC5GZWF0dXJlcyAhPSAiIiB7CisJCQlwdi5m
ZWF0dXJlcyA9IEMuQ1N0cmluZyh0bXAuRmVhdHVyZXMpCisJCX0KKwkJaWYgZXJyIDo9IHRtcC5F
ODIwSG9zdC50b0MoJnB2LmU4MjBfaG9zdCk7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgor
CQl9CisJCXB2Qnl0ZXMgOj0gQy5Hb0J5dGVzKHVuc2FmZS5Qb2ludGVyKCZwdiksIEMuc2l6ZW9m
X2xpYnhsX2RvbWFpbl9idWlsZF9pbmZvX3R5cGVfdW5pb25fcHYpCisJCWNvcHkoeGMudVs6XSwg
cHZCeXRlcykKKwljYXNlIERvbWFpblR5cGVQdmg6CisJCXRtcCwgb2sgOj0geC5UeXBlVW5pb24u
KERvbWFpbkJ1aWxkSW5mb1R5cGVVbmlvblB2aCkKKwkJaWYgIW9rIHsKKwkJCXJldHVybiBlcnJv
cnMuTmV3KCJ3cm9uZyB0eXBlIGZvciB1bmlvbiBrZXkgdHlwZSIpCisJCX0KKwkJdmFyIHB2aCBD
LmxpYnhsX2RvbWFpbl9idWlsZF9pbmZvX3R5cGVfdW5pb25fcHZoCisJCWlmIGVyciA6PSB0bXAu
UHZzaGltLnRvQygmcHZoLnB2c2hpbSk7IGVyciAhPSBuaWwgeworCQkJcmV0dXJuIGVycgorCQl9
CisJCWlmIHRtcC5QdnNoaW1QYXRoICE9ICIiIHsKKwkJCXB2aC5wdnNoaW1fcGF0aCA9IEMuQ1N0
cmluZyh0bXAuUHZzaGltUGF0aCkKKwkJfQorCQlpZiB0bXAuUHZzaGltQ21kbGluZSAhPSAiIiB7
CisJCQlwdmgucHZzaGltX2NtZGxpbmUgPSBDLkNTdHJpbmcodG1wLlB2c2hpbUNtZGxpbmUpCisJ
CX0KKwkJaWYgdG1wLlB2c2hpbUV4dHJhICE9ICIiIHsKKwkJCXB2aC5wdnNoaW1fZXh0cmEgPSBD
LkNTdHJpbmcodG1wLlB2c2hpbUV4dHJhKQorCQl9CisJCXB2aEJ5dGVzIDo9IEMuR29CeXRlcyh1
bnNhZmUuUG9pbnRlcigmcHZoKSwgQy5zaXplb2ZfbGlieGxfZG9tYWluX2J1aWxkX2luZm9fdHlw
ZV91bmlvbl9wdmgpCisJCWNvcHkoeGMudVs6XSwgcHZoQnl0ZXMpCisJZGVmYXVsdDoKKwkJcmV0
dXJuIGZtdC5FcnJvcmYoImludmFsaWQgdW5pb24ga2V5ICcldiciLCB4LlR5cGUpCisJfQogCXhj
LmFyY2hfYXJtLmdpY192ZXJzaW9uID0gQy5saWJ4bF9naWNfdmVyc2lvbih4LkFyY2hBcm0uR2lj
VmVyc2lvbikKIAl4Yy5hcmNoX2FybS52dWFydCA9IEMubGlieGxfdnVhcnRfdHlwZSh4LkFyY2hB
cm0uVnVhcnQpCiAJeGMuYWx0cDJtID0gQy5saWJ4bF9hbHRwMm1fbW9kZSh4LkFsdHAyTSkKQEAg
LTE2ODksNiArMTg4OCwyMSBAQCBmdW5jICh4ICpEZXZpY2VVc2JkZXYpIHRvQyh4YyAqQy5saWJ4
bF9kZXZpY2VfdXNiZGV2KSAoZXJyIGVycm9yKSB7CiAKIAl4Yy5jdHJsID0gQy5saWJ4bF9kZXZp
ZCh4LkN0cmwpCiAJeGMucG9ydCA9IEMuaW50KHguUG9ydCkKKwl4Yy5fdHlwZSA9IEMubGlieGxf
dXNiZGV2X3R5cGUoeC5UeXBlKQorCXN3aXRjaCB4LlR5cGUgeworCWNhc2UgVXNiZGV2VHlwZUhv
c3RkZXY6CisJCXRtcCwgb2sgOj0geC5UeXBlVW5pb24uKERldmljZVVzYmRldlR5cGVVbmlvbkhv
c3RkZXYpCisJCWlmICFvayB7CisJCQlyZXR1cm4gZXJyb3JzLk5ldygid3JvbmcgdHlwZSBmb3Ig
dW5pb24ga2V5IHR5cGUiKQorCQl9CisJCXZhciBob3N0ZGV2IEMubGlieGxfZGV2aWNlX3VzYmRl
dl90eXBlX3VuaW9uX2hvc3RkZXYKKwkJaG9zdGRldi5ob3N0YnVzID0gQy51aW50OF90KHRtcC5I
b3N0YnVzKQorCQlob3N0ZGV2Lmhvc3RhZGRyID0gQy51aW50OF90KHRtcC5Ib3N0YWRkcikKKwkJ
aG9zdGRldkJ5dGVzIDo9IEMuR29CeXRlcyh1bnNhZmUuUG9pbnRlcigmaG9zdGRldiksIEMuc2l6
ZW9mX2xpYnhsX2RldmljZV91c2JkZXZfdHlwZV91bmlvbl9ob3N0ZGV2KQorCQljb3B5KHhjLnVb
Ol0sIGhvc3RkZXZCeXRlcykKKwlkZWZhdWx0OgorCQlyZXR1cm4gZm10LkVycm9yZigiaW52YWxp
ZCB1bmlvbiBrZXkgJyV2JyIsIHguVHlwZSkKKwl9CiAKIAlyZXR1cm4gbmlsCiB9CkBAIC0xODQ4
LDYgKzIwNjIsMjIgQEAgZnVuYyAoeCAqRGV2aWNlQ2hhbm5lbCkgdG9DKHhjICpDLmxpYnhsX2Rl
dmljZV9jaGFubmVsKSAoZXJyIGVycm9yKSB7CiAJaWYgeC5OYW1lICE9ICIiIHsKIAkJeGMubmFt
ZSA9IEMuQ1N0cmluZyh4Lk5hbWUpCiAJfQorCXhjLmNvbm5lY3Rpb24gPSBDLmxpYnhsX2NoYW5u
ZWxfY29ubmVjdGlvbih4LkNvbm5lY3Rpb24pCisJc3dpdGNoIHguQ29ubmVjdGlvbiB7CisJY2Fz
ZSBDaGFubmVsQ29ubmVjdGlvblNvY2tldDoKKwkJdG1wLCBvayA6PSB4LkNvbm5lY3Rpb25Vbmlv
bi4oRGV2aWNlQ2hhbm5lbENvbm5lY3Rpb25VbmlvblNvY2tldCkKKwkJaWYgIW9rIHsKKwkJCXJl
dHVybiBlcnJvcnMuTmV3KCJ3cm9uZyB0eXBlIGZvciB1bmlvbiBrZXkgY29ubmVjdGlvbiIpCisJ
CX0KKwkJdmFyIHNvY2tldCBDLmxpYnhsX2RldmljZV9jaGFubmVsX2Nvbm5lY3Rpb25fdW5pb25f
c29ja2V0CisJCWlmIHRtcC5QYXRoICE9ICIiIHsKKwkJCXNvY2tldC5wYXRoID0gQy5DU3RyaW5n
KHRtcC5QYXRoKQorCQl9CisJCXNvY2tldEJ5dGVzIDo9IEMuR29CeXRlcyh1bnNhZmUuUG9pbnRl
cigmc29ja2V0KSwgQy5zaXplb2ZfbGlieGxfZGV2aWNlX2NoYW5uZWxfY29ubmVjdGlvbl91bmlv
bl9zb2NrZXQpCisJCWNvcHkoeGMudVs6XSwgc29ja2V0Qnl0ZXMpCisJZGVmYXVsdDoKKwkJcmV0
dXJuIGZtdC5FcnJvcmYoImludmFsaWQgdW5pb24ga2V5ICcldiciLCB4LkNvbm5lY3Rpb24pCisJ
fQogCiAJcmV0dXJuIG5pbAogfQpAQCAtMjkxMSw2ICszMTQxLDQzIEBAIGZ1bmMgKHggKkV2ZW50
KSB0b0MoeGMgKkMubGlieGxfZXZlbnQpIChlcnIgZXJyb3IpIHsKIAkJcmV0dXJuIGVycgogCX0K
IAl4Yy5mb3JfdXNlciA9IEMudWludDY0X3QoeC5Gb3JVc2VyKQorCXhjLl90eXBlID0gQy5saWJ4
bF9ldmVudF90eXBlKHguVHlwZSkKKwlzd2l0Y2ggeC5UeXBlIHsKKwljYXNlIEV2ZW50VHlwZURv
bWFpblNodXRkb3duOgorCQl0bXAsIG9rIDo9IHguVHlwZVVuaW9uLihFdmVudFR5cGVVbmlvbkRv
bWFpblNodXRkb3duKQorCQlpZiAhb2sgeworCQkJcmV0dXJuIGVycm9ycy5OZXcoIndyb25nIHR5
cGUgZm9yIHVuaW9uIGtleSB0eXBlIikKKwkJfQorCQl2YXIgZG9tYWluX3NodXRkb3duIEMubGli
eGxfZXZlbnRfdHlwZV91bmlvbl9kb21haW5fc2h1dGRvd24KKwkJZG9tYWluX3NodXRkb3duLnNo
dXRkb3duX3JlYXNvbiA9IEMudWludDhfdCh0bXAuU2h1dGRvd25SZWFzb24pCisJCWRvbWFpbl9z
aHV0ZG93bkJ5dGVzIDo9IEMuR29CeXRlcyh1bnNhZmUuUG9pbnRlcigmZG9tYWluX3NodXRkb3du
KSwgQy5zaXplb2ZfbGlieGxfZXZlbnRfdHlwZV91bmlvbl9kb21haW5fc2h1dGRvd24pCisJCWNv
cHkoeGMudVs6XSwgZG9tYWluX3NodXRkb3duQnl0ZXMpCisJY2FzZSBFdmVudFR5cGVEaXNrRWpl
Y3Q6CisJCXRtcCwgb2sgOj0geC5UeXBlVW5pb24uKEV2ZW50VHlwZVVuaW9uRGlza0VqZWN0KQor
CQlpZiAhb2sgeworCQkJcmV0dXJuIGVycm9ycy5OZXcoIndyb25nIHR5cGUgZm9yIHVuaW9uIGtl
eSB0eXBlIikKKwkJfQorCQl2YXIgZGlza19lamVjdCBDLmxpYnhsX2V2ZW50X3R5cGVfdW5pb25f
ZGlza19lamVjdAorCQlpZiB0bXAuVmRldiAhPSAiIiB7CisJCQlkaXNrX2VqZWN0LnZkZXYgPSBD
LkNTdHJpbmcodG1wLlZkZXYpCisJCX0KKwkJaWYgZXJyIDo9IHRtcC5EaXNrLnRvQygmZGlza19l
amVjdC5kaXNrKTsgZXJyICE9IG5pbCB7CisJCQlyZXR1cm4gZXJyCisJCX0KKwkJZGlza19lamVj
dEJ5dGVzIDo9IEMuR29CeXRlcyh1bnNhZmUuUG9pbnRlcigmZGlza19lamVjdCksIEMuc2l6ZW9m
X2xpYnhsX2V2ZW50X3R5cGVfdW5pb25fZGlza19lamVjdCkKKwkJY29weSh4Yy51WzpdLCBkaXNr
X2VqZWN0Qnl0ZXMpCisJY2FzZSBFdmVudFR5cGVPcGVyYXRpb25Db21wbGV0ZToKKwkJdG1wLCBv
ayA6PSB4LlR5cGVVbmlvbi4oRXZlbnRUeXBlVW5pb25PcGVyYXRpb25Db21wbGV0ZSkKKwkJaWYg
IW9rIHsKKwkJCXJldHVybiBlcnJvcnMuTmV3KCJ3cm9uZyB0eXBlIGZvciB1bmlvbiBrZXkgdHlw
ZSIpCisJCX0KKwkJdmFyIG9wZXJhdGlvbl9jb21wbGV0ZSBDLmxpYnhsX2V2ZW50X3R5cGVfdW5p
b25fb3BlcmF0aW9uX2NvbXBsZXRlCisJCW9wZXJhdGlvbl9jb21wbGV0ZS5yYyA9IEMuaW50KHRt
cC5SYykKKwkJb3BlcmF0aW9uX2NvbXBsZXRlQnl0ZXMgOj0gQy5Hb0J5dGVzKHVuc2FmZS5Qb2lu
dGVyKCZvcGVyYXRpb25fY29tcGxldGUpLCBDLnNpemVvZl9saWJ4bF9ldmVudF90eXBlX3VuaW9u
X29wZXJhdGlvbl9jb21wbGV0ZSkKKwkJY29weSh4Yy51WzpdLCBvcGVyYXRpb25fY29tcGxldGVC
eXRlcykKKwlkZWZhdWx0OgorCQlyZXR1cm4gZm10LkVycm9yZigiaW52YWxpZCB1bmlvbiBrZXkg
JyV2JyIsIHguVHlwZSkKKwl9CiAKIAlyZXR1cm4gbmlsCiB9CkBAIC0yOTk0LDYgKzMyNjEsMzMg
QEAgZnVuYyAoeCAqUHNySHdJbmZvKSB0b0MoeGMgKkMubGlieGxfcHNyX2h3X2luZm8pIChlcnIg
ZXJyb3IpIHsKIAl9KCkKIAogCXhjLmlkID0gQy51aW50MzJfdCh4LklkKQorCXhjLl90eXBlID0g
Qy5saWJ4bF9wc3JfZmVhdF90eXBlKHguVHlwZSkKKwlzd2l0Y2ggeC5UeXBlIHsKKwljYXNlIFBz
ckZlYXRUeXBlQ2F0OgorCQl0bXAsIG9rIDo9IHguVHlwZVVuaW9uLihQc3JId0luZm9UeXBlVW5p
b25DYXQpCisJCWlmICFvayB7CisJCQlyZXR1cm4gZXJyb3JzLk5ldygid3JvbmcgdHlwZSBmb3Ig
dW5pb24ga2V5IHR5cGUiKQorCQl9CisJCXZhciBjYXQgQy5saWJ4bF9wc3JfaHdfaW5mb190eXBl
X3VuaW9uX2NhdAorCQljYXQuY29zX21heCA9IEMudWludDMyX3QodG1wLkNvc01heCkKKwkJY2F0
LmNibV9sZW4gPSBDLnVpbnQzMl90KHRtcC5DYm1MZW4pCisJCWNhdC5jZHBfZW5hYmxlZCA9IEMu
Ym9vbCh0bXAuQ2RwRW5hYmxlZCkKKwkJY2F0Qnl0ZXMgOj0gQy5Hb0J5dGVzKHVuc2FmZS5Qb2lu
dGVyKCZjYXQpLCBDLnNpemVvZl9saWJ4bF9wc3JfaHdfaW5mb190eXBlX3VuaW9uX2NhdCkKKwkJ
Y29weSh4Yy51WzpdLCBjYXRCeXRlcykKKwljYXNlIFBzckZlYXRUeXBlTWJhOgorCQl0bXAsIG9r
IDo9IHguVHlwZVVuaW9uLihQc3JId0luZm9UeXBlVW5pb25NYmEpCisJCWlmICFvayB7CisJCQly
ZXR1cm4gZXJyb3JzLk5ldygid3JvbmcgdHlwZSBmb3IgdW5pb24ga2V5IHR5cGUiKQorCQl9CisJ
CXZhciBtYmEgQy5saWJ4bF9wc3JfaHdfaW5mb190eXBlX3VuaW9uX21iYQorCQltYmEuY29zX21h
eCA9IEMudWludDMyX3QodG1wLkNvc01heCkKKwkJbWJhLnRocnRsX21heCA9IEMudWludDMyX3Qo
dG1wLlRocnRsTWF4KQorCQltYmEubGluZWFyID0gQy5ib29sKHRtcC5MaW5lYXIpCisJCW1iYUJ5
dGVzIDo9IEMuR29CeXRlcyh1bnNhZmUuUG9pbnRlcigmbWJhKSwgQy5zaXplb2ZfbGlieGxfcHNy
X2h3X2luZm9fdHlwZV91bmlvbl9tYmEpCisJCWNvcHkoeGMudVs6XSwgbWJhQnl0ZXMpCisJZGVm
YXVsdDoKKwkJcmV0dXJuIGZtdC5FcnJvcmYoImludmFsaWQgdW5pb24ga2V5ICcldiciLCB4LlR5
cGUpCisJfQogCiAJcmV0dXJuIG5pbAogfQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
