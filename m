Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8916BCC6A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 18:26:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCnad-0006BV-Rg; Tue, 24 Sep 2019 16:22:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7zL=XT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCnac-0006BQ-8o
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 16:22:58 +0000
X-Inumbo-ID: 91522c98-dee7-11e9-8628-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by localhost (Halon) with ESMTPS
 id 91522c98-dee7-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 16:22:57 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id l21so2542193lje.4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 09:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=z0sSJaZ6tKn2AAu9OqE1LROUwq6R4Z2z21nj6FSNBck=;
 b=Kvs9s6EI5AJASclBqv4HbSr7TY26aaQ5AfssQwnY9/92KbX58lPwBkrTCghkhv1HSi
 YTfgWosUADjnnRrzwEdZUg2nji1yJ0bt2sICy8zEqUudtT/xOGbbRNJZDt1bdmupKu3T
 bxUweMbMXE/vfjkDsBtXgg13p4LzXYmOb7uItzZoVwIdFuQZSIHnf1+0J97Zo/y+Jcj7
 edXhsIp6k1jaR+qyovDzw9WLDUtX5696dMP8HNsTzhIegEYM4Z8HjQbCrhJ3Ikl+mkTZ
 08MNvSR9+Sgn9BCae4HeHDT7qC5Rvj5LYNtrkL1It9tZ3aYlZpAyHWgfEZF2arPJxUpw
 +N0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=z0sSJaZ6tKn2AAu9OqE1LROUwq6R4Z2z21nj6FSNBck=;
 b=QBE3LkS+WRfaPtkT6J8LmLUW0byls2rI2LLlwIvb/Os01pam1HlkbOpll9wN+Q+MkD
 5cSyrYODgj/hKIvWefEk6ZPE+Vu/EKmj/4EkU/gY1/3qZXgmUxChN7x7OeR7Bor2ygjf
 70ogd9r0PBst8IO8mrFeR69eDErJJn7ESOCS9uqdwaICLGyZBU2bQadTdrrnOIgdw5ZW
 Okj/PcKKztmwIU60fjjyZFEBYQREN1c1f3WapO+D6/05qki7e9ArdqkqINuUIsRxhkBt
 gn+6hVwnmZXUd99Guc6rlgxnIsoJqyt0yofoBfFviagZ02EiGZ9skmHMjr3NMJqUiHXi
 DoJQ==
X-Gm-Message-State: APjAAAXf/iQ/gwLNGmRSCG9l6ACavgW94TkJ1ag0yPfa6lVZ6zPnGV95
 5FFJLiCbz6ZHWXosihgQfmo=
X-Google-Smtp-Source: APXvYqx7usG7pCg3Ai62IIPcP4OE9+5NF6ljAQtMoOxt/bTeRYa5A3gwgaD5JONTFqnwLLJtBy+4fA==
X-Received: by 2002:a2e:924f:: with SMTP id v15mr2549847ljg.199.1569342176402; 
 Tue, 24 Sep 2019 09:22:56 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id s26sm562749lfc.60.2019.09.24.09.22.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Sep 2019 09:22:55 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
 <1569339027-19484-8-git-send-email-olekstysh@gmail.com>
 <27781495-c097-f0a3-6c75-d8cb2aa6f523@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a16bf417-5e85-46e8-0ec4-167323384c8b@gmail.com>
Date: Tue, 24 Sep 2019 19:22:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <27781495-c097-f0a3-6c75-d8cb2aa6f523@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI0LjA5LjE5IDE4OjU3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+Cj4gT24gOS8yNC8xOSA0OjMwIFBNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToKPj4g
QEAgLTEyNjMsMTUgKzEyNjQsMjIgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX2RldmljZShz
dHJ1Y3QgZG9tYWluIAo+PiAqZCwgc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsCj4+IMKgwqDC
oMKgwqAgZHRfZHByaW50aygiJXMgcGFzc3Rocm91Z2ggPSAlZCBuaXJxID0gJWQgbmFkZHIgPSAl
dVxuIiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHRfbm9kZV9mdWxsX25h
bWUoZGV2KSwgbmVlZF9tYXBwaW5nLCBuaXJxLCBuYWRkcik7Cj4+IMKgIC3CoMKgwqAgaWYgKCBk
dF9kZXZpY2VfaXNfcHJvdGVjdGVkKGRldikgJiYgbmVlZF9tYXBwaW5nICkKPj4gK8KgwqDCoCBp
ZiAoIG5lZWRfbWFwcGluZyApCj4+IMKgwqDCoMKgwqAgewo+PiAtwqDCoMKgwqDCoMKgwqAgZHRf
ZHByaW50aygiJXMgc2V0dXAgaW9tbXVcbiIsIGR0X25vZGVfZnVsbF9uYW1lKGRldikpOwo+PiAt
wqDCoMKgwqDCoMKgwqAgcmVzID0gaW9tbXVfYXNzaWduX2R0X2RldmljZShkLCBkZXYpOwo+PiAt
wqDCoMKgwqDCoMKgwqAgaWYgKCByZXMgKQo+PiAtwqDCoMKgwqDCoMKgwqAgewo+PiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwcmludGsoWEVOTE9HX0VSUiAiRmFpbGVkIHRvIHNldHVwIHRoZSBJ
T01NVSBmb3IgJXNcbiIsCj4+ICvCoMKgwqDCoMKgwqDCoCBkdF9kcHJpbnRrKCJDaGVjayBpZiAl
cyBpcyBiZWhpbmQgdGhlIElPTU1VIGFuZCBhZGQgaXRcbiIsCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHRfbm9kZV9mdWxsX25hbWUoZGV2KSk7Cj4+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXM7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIGlv
bW11X2FkZF9kdF9kZXZpY2UoZGV2KTsKPgo+IFJldHVybiB2YWx1ZSBzaG91bGQgYWx3YXlzIGJl
IGNoZWNrZWQgb3IgZXhwbGFpbiB3aHkgdGhpcyBpcyBub3QgZG9uZS4KClllcywgSSB3aWxsIGFk
ZCBhIGNoZWNrLiBUaGUgcG9zaXRpdmUgcmVzdWx0IGZvciB1cyBpcyBub24tbmVnYXRpdmUgCihl
aXRoZXIgImRldmljZSBpcyBwcm90ZWN0ZWQiIG9yICJkZXZpY2UgZG9lc24ndCBuZWVkIHRvIGJl
IHByb3RlY3RlZCIpLgoKCj4KPgo+IFsuLi5dCj4KPj4gwqAgaW50IGlvbW11X2RvX2R0X2RvbWN0
bChzdHJ1Y3QgeGVuX2RvbWN0bCAqZG9tY3RsLCBzdHJ1Y3QgZG9tYWluICpkLAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgWEVOX0dVRVNUX0hBTkRM
RV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQo+PiDCoCB7Cj4+IEBAIC0xNzcsNiArMjQx
LDEzIEBAIGludCBpb21tdV9kb19kdF9kb21jdGwoc3RydWN0IHhlbl9kb21jdGwgCj4+ICpkb21j
dGwsIHN0cnVjdCBkb21haW4gKmQsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+PiDCoCArwqDCoMKgwqDCoMKgwqAgaW9tbXVfYWRk
X2R0X2RldmljZShkZXYpOwo+Cj4gU2FtZSBoZXJlLgoKWWVzLCBJIHRoaW5rLCB3ZSBkb24ndCBu
ZWVkIHRvIGNoZWNrIGZvciByZXR1cm4gdmFsdWUsIGJlY2F1c2UgdGhlIG9ubHkgCm9uZSBwb3Np
dGl2ZSByZXN1bHQgImhlcmUiIGlzIHRoZSBmYWN0IHRoYXQgImRldmljZSBpcyBwcm90ZWN0ZWQi
ICh3aGljaCAKaXMgY2hlY2tlZCBiZWxvdykuCgpXaGF0IGlzIG1vcmUsIGlmIHdlIGFkZCBhIGNo
ZWNrIGZvciB0aGUgcmV0dXJuIHZhbHVlIHRvIGJlIHN0cmljdGx5IDAsIAp3ZSB3aWxsIGdldCBh
biBlcnJvciBhZnRlciBndWVzdCdzIHJlYm9vdCAoc2luY2UgaW9tbXVfYWRkX2R0X2RldmljZSgp
IAp3aWxsIHJldHVybiAtRUVYSVNUKS4KClNvLCBJIHdpbGwgYWRkIGEgY29tbWVudCBleHBsYWlu
aW5nIHdoeSB3ZSBkb24ndCBjaGVjay4gV2hhdCBkbyB5b3UgdGhpbms/CgoKPgo+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKCAhZHRfZGV2aWNlX2lzX3Byb3RlY3RlZChkZXYpICkKPj4gK8KgwqDCoMKg
wqDCoMKgIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVJTlZBTDsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4KPiBUaGlz
IGlzIGFscmVhZHkgY2hlY2tlZCBpbiBpb21tdV9hc3NpZ25fZHRfZGV2aWNlKCkuCgpXaWxsIGRy
b3AgaGVyZS4KCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
