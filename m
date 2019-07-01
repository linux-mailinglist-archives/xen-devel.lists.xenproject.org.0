Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7CA5B455
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 07:49:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhp8k-0006nG-LW; Mon, 01 Jul 2019 05:46:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jn5k=U6=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1hhp8i-0006nB-Sn
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 05:46:08 +0000
X-Inumbo-ID: 84e7ba03-9bc3-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 84e7ba03-9bc3-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 05:46:07 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id p17so11739922ljg.1
 for <xen-devel@lists.xenproject.org>; Sun, 30 Jun 2019 22:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8yYaeGYH1lk4dhqKXsvPRW0fUGxbl4jEGeDfKa2Ty6Y=;
 b=kfh5vicc77Conm69He5+G8+PaZuy/aFnTfW7eGf/0g7by8v+gTDKKa3E0WWlj69uu5
 xcSMYJhYj+K+94FeYJGSkPWVpC4WMpWgxUmu+NyOxZYY1+dfW9U4Mi4l+CGMbzF4Jctb
 3iBKTJAGhcDfRwEwkkp0m9jC1QQf1O0Q40g5kLxOvAS52UpwPlVOiwZ9Z82ZGbLISm/J
 i7/lBRwJkWMYEESXHHM3il3VcBySiIlyxHLJYq4Z2iE9sdgBueKyM3Rt6c0E3ac2HSSN
 2juMxi+rr3EHPPfx/X1onWMfWZmBfYyr9c4njFBxxIkLofQwY5uKm5hTiIyLfZef6KKB
 ox7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=8yYaeGYH1lk4dhqKXsvPRW0fUGxbl4jEGeDfKa2Ty6Y=;
 b=SBdlP603p666sQ+2lSTijfaFRSq+qiAMfwNniKp/Pa4fzaaA5FKbfGwp4Xr4Xnbbg4
 MRc+WKE0Qjfs4pj7MXQtVoEj2/IKcUWftR7+sxBK1Z5hPXnBRflfrnKHhyP82XI3M3mo
 IqaWsb5h/cFOgQOa4Lo26Rgy4dSf1FdxuueSF48GMnxQAmooVXWFKPEhhjEoI4G4DyPR
 bLAfHic1gywtsk9k3hwSz3cdT92nlciwfpzP18fAP2SBtM+jXdta4t8X4ctVF5unQoKF
 s69KGtomKed9nVf4Cwgw4YR6X+GK34nrO6xwkRS48cjIScvrS95yL9OJsrueAr9O2aTj
 Cszg==
X-Gm-Message-State: APjAAAU0ZiWQ4jZZMY3/2WNSPIfn2d/QxKzO0vGD1EJ/8tVACNve85f5
 8jrormZnE1Tlckk9DpZxCbYaPaqy1p4=
X-Google-Smtp-Source: APXvYqz6tnhd9uDkTCwEyyQMlwXFBa/szeO/kbZD0HykwS+epBivubnP5CszJLpw3z7J7a1pcp4Jgg==
X-Received: by 2002:a2e:89ca:: with SMTP id c10mr12904311ljk.106.1561959965169; 
 Sun, 30 Jun 2019 22:46:05 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 w15sm3395418ljh.0.2019.06.30.22.46.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 Jun 2019 22:46:04 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>, Colin King <colin.king@canonical.com>
References: <20190627165853.21864-1-colin.king@canonical.com>
 <s5hv9wq6qrg.wl-tiwai@suse.de>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <de93db15-c85f-3108-22c3-75b89a3a2e59@gmail.com>
Date: Mon, 1 Jul 2019 08:46:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <s5hv9wq6qrg.wl-tiwai@suse.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ALSA: xen-front: fix unintention integer
 overflow on left shifts
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
Cc: alsa-devel@alsa-project.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNi8yOC8xOSAxMTo0NiBBTSwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+IE9uIFRodSwgMjcgSnVu
IDIwMTkgMTg6NTg6NTMgKzAyMDAsCj4gQ29saW4gS2luZyB3cm90ZToKPj4gRnJvbTogQ29saW4g
SWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4KPj4gU2hpZnRpbmcgdGhlIGlu
dGVnZXIgdmFsdWUgMSBpcyBldmFsdWF0ZWQgdXNpbmcgMzItYml0Cj4+IGFyaXRobWV0aWMgYW5k
IHRoZW4gdXNlZCBpbiBhbiBleHByZXNzaW9uIHRoYXQgZXhwZWN0cyBhIDY0LWJpdAo+PiB2YWx1
ZSwgc28gdGhlcmUgaXMgcG90ZW50aWFsbHkgYW4gaW50ZWdlciBvdmVyZmxvdy4gRml4IHRoaXMK
Pj4gYnkgdXNpbmcgdGhlIEJJVF9VTEwgbWFjcm8gdG8gcGVyZm9ybSB0aGUgc2hpZnQuCj4+Cj4+
IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJVbmludGVudGlvbmFsIGludGVnZXIgb3ZlcmZsb3ciKQo+
PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
PgpUaGFuayB5b3UgZm9yIHlvdSBwYXRjaCwKT2xla3NhbmRyCj4gVGhlIGZpeCBpcyBjb3JyZWN0
LCBidXQgbHVja2lseSB3ZSBkaWRuJ3QgaGl0IHRoZSBpbnRlZ2VyIG92ZXJmbG93LCBhcwo+IGFs
bCBwYXNzZWQgdmFsdWVzIGFyZSBsZXNzIHRoYW4gMzJiaXQuCj4KPiBJbiBhbnl3YXksIGFwcGxp
ZWQgbm93LiAgVGhhbmtzLgo+Cj4KPiBUYWthc2hpCj4KPj4gLS0tCj4+ICAgc291bmQveGVuL3hl
bl9zbmRfZnJvbnRfYWxzYS5jIHwgNCArKy0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3NvdW5kL3hlbi94ZW5f
c25kX2Zyb250X2Fsc2EuYyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2Fsc2EuYwo+PiBpbmRl
eCBiMTRhYjUxMmMyY2UuLmUwMTYzMTk1OWVkOCAxMDA2NDQKPj4gLS0tIGEvc291bmQveGVuL3hl
bl9zbmRfZnJvbnRfYWxzYS5jCj4+ICsrKyBiL3NvdW5kL3hlbi94ZW5fc25kX2Zyb250X2Fsc2Eu
Ywo+PiBAQCAtMTk2LDcgKzE5Niw3IEBAIHN0YXRpYyB1NjQgdG9fc25kaWZfZm9ybWF0c19tYXNr
KHU2NCBhbHNhX2Zvcm1hdHMpCj4+ICAgCW1hc2sgPSAwOwo+PiAgIAlmb3IgKGkgPSAwOyBpIDwg
QVJSQVlfU0laRShBTFNBX1NORElGX0ZPUk1BVFMpOyBpKyspCj4+ICAgCQlpZiAocGNtX2Zvcm1h
dF90b19iaXRzKEFMU0FfU05ESUZfRk9STUFUU1tpXS5hbHNhKSAmIGFsc2FfZm9ybWF0cykKPj4g
LQkJCW1hc2sgfD0gMSA8PCBBTFNBX1NORElGX0ZPUk1BVFNbaV0uc25kaWY7Cj4+ICsJCQltYXNr
IHw9IEJJVF9VTEwoQUxTQV9TTkRJRl9GT1JNQVRTW2ldLnNuZGlmKTsKPj4gICAKPj4gICAJcmV0
dXJuIG1hc2s7Cj4+ICAgfQo+PiBAQCAtMjA4LDcgKzIwOCw3IEBAIHN0YXRpYyB1NjQgdG9fYWxz
YV9mb3JtYXRzX21hc2sodTY0IHNuZGlmX2Zvcm1hdHMpCj4+ICAgCj4+ICAgCW1hc2sgPSAwOwo+
PiAgIAlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShBTFNBX1NORElGX0ZPUk1BVFMpOyBpKysp
Cj4+IC0JCWlmICgxIDw8IEFMU0FfU05ESUZfRk9STUFUU1tpXS5zbmRpZiAmIHNuZGlmX2Zvcm1h
dHMpCj4+ICsJCWlmIChCSVRfVUxMKEFMU0FfU05ESUZfRk9STUFUU1tpXS5zbmRpZikgJiBzbmRp
Zl9mb3JtYXRzKQo+PiAgIAkJCW1hc2sgfD0gcGNtX2Zvcm1hdF90b19iaXRzKEFMU0FfU05ESUZf
Rk9STUFUU1tpXS5hbHNhKTsKPj4gICAKPj4gICAJcmV0dXJuIG1hc2s7Cj4+IC0tIAo+PiAyLjIw
LjEKPj4KPj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IFhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
