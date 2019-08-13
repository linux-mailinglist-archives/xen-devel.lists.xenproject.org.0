Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED0E8B12D
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 09:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxRHq-0000gT-C9; Tue, 13 Aug 2019 07:32:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ybod=WJ=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hxRHo-0000g5-RH
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 07:32:04 +0000
X-Inumbo-ID: 7199fbbc-bd9c-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7199fbbc-bd9c-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 07:32:03 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id c9so76017898lfh.4
 for <xen-devel@lists.xenproject.org>; Tue, 13 Aug 2019 00:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=vxu83LzGun/cvg+At2wTJfRfSpQASHRNUqO+Ng51ie8=;
 b=sXp80xqW3Rlpc3D+XtVSptkkayCz9E57QP8m8AIDRPT+Yt/VNcLGPv4C73rrlTWeAl
 OfAZuMyMDyfiKVgWn9f0YL/IueFXoHkfPcrtbQSTBzFYrxVz4T6HqPgWu/DJGgo1I5WY
 U5kBxz/wCf4ENAaKc/GYZVIVEXDr3Bc6tbMmWDeEjaHO/xv8Xcleb/efIskcETAUBDid
 9yRTDUCEhKu0I6qCpV4Eq1+hLZ9mPxUorsPqbLh+smqPXdqQYumxyDOCLIPhh8b3j+So
 W01UNLnOwelGIkWozq2avHKCEK58nGg4AvzwCWZ4UJFXbGL9OgOZWnLMxR48bEh354cR
 5maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=vxu83LzGun/cvg+At2wTJfRfSpQASHRNUqO+Ng51ie8=;
 b=bhJd4ysPfFkzv5w6QviMudG/2w7ornZ54VC7swqBMHhLo0Nund8a8bg3e9aKYTgvSi
 dJMFniXpQRcNK9kdgQxE0uj5/y7UQDNIt8jsw+Gt1MoUtgcKjzqVvpcfftw7LL74QaYL
 nDS1YVij2NmD2kpYb9SpMwjknZiv1aQzqJnvDPV7blrB2ybE47T+Pnhf/TSZ3CDdYaR2
 0atiP1lOIG5ToBByVhkYcbFpULLChARFep0dTFxQUTLvkCmERxymQS06cfK+WRWEIDyI
 fqCaAwkAyYJ0vq36F/ldDM/j1rlhnLTezP0nQCZVuvqJb7Wsd2aP1pqR9l32k/Jw7faC
 EBvA==
X-Gm-Message-State: APjAAAUl6r/g2pwNrAyWc/EbVfuHktckLm8u/HNrTlZLGz8Prm+Xf/aP
 3eoKxYGZuQmjLTkZIxekQ1F8WSTU
X-Google-Smtp-Source: APXvYqyxKF3rXH4VHIfBOMLXFGVC72dhGFu+jR0IZAyJ29q6Vs2uMqPd2n5EUKqEtsqKjD1scZd+YA==
X-Received: by 2002:ac2:5976:: with SMTP id h22mr21755605lfp.79.1565681522140; 
 Tue, 13 Aug 2019 00:32:02 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t4sm23424123ljh.9.2019.08.13.00.32.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Aug 2019 00:32:01 -0700 (PDT)
To: Nishka Dasgupta <nishkadg.linux@gmail.com>,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org
References: <20190813062712.24993-1-nishkadg.linux@gmail.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <f370930a-6c1c-ef4f-9fc1-0848985b9765@gmail.com>
Date: Tue, 13 Aug 2019 10:32:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813062712.24993-1-nishkadg.linux@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] drm/xen-front: Make structure fb_funcs
 constant
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDgvMTMvMTkgOToyNyBBTSwgTmlzaGthIERhc2d1cHRhIHdyb3RlOgo+IFN0YXRpYyBzdHJ1
Y3R1cmUgZmJfZnVuY3MsIG9mIHR5cGUgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzLCBpcyB1c2VkIG9u
bHkKPiB3aGVuIGl0IGlzIHBhc3NlZCB0byBkcm1fZ2VtX2ZiX2NyZWF0ZV93aXRoX2Z1bmNzKCkg
YXMgaXRzIGxhc3QKPiBhcmd1bWVudC4gZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9mdW5jcyBkb2Vz
IG5vdCBtb2RpZnkgaXRzIGxzdCBhcmd1bWVudAo+IChmYl9mdW5jcykgYW5kIGhlbmNlIGZiX2Z1
bmNzIGlzIG5ldmVyIG1vZGlmaWVkLiBUaGVyZWZvcmUgbWFrZSBmYl9mdW5jcwo+IGNvbnN0YW50
IHRvIHByb3RlY3QgaXQgZnJvbSBmdXJ0aGVyIG1vZGlmaWNhdGlvbi4KPiBJc3N1ZSBmb3VuZCB3
aXRoIENvY2NpbmVsbGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hr
YWRnLmxpbnV4QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2Ry
bV9mcm9udF9rbXMuYwo+IGluZGV4IGMyOTU1ZDM3NTM5NC4uNGE5ODRmNDU1NTVlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYwo+IEBAIC00NSw3ICs0NSw3IEBA
IHN0YXRpYyB2b2lkIGZiX2Rlc3Ryb3koc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIpCj4gICAJ
ZHJtX2dlbV9mYl9kZXN0cm95KGZiKTsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgc3RydWN0IGRybV9m
cmFtZWJ1ZmZlcl9mdW5jcyBmYl9mdW5jcyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
ZnJhbWVidWZmZXJfZnVuY3MgZmJfZnVuY3MgPSB7Cj4gICAJLmRlc3Ryb3kgPSBmYl9kZXN0cm95
LAo+ICAgfTsKPiAgIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
