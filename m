Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CC717F755
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 13:23:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBdrm-0005sN-Ae; Tue, 10 Mar 2020 12:20:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HhRS=43=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jBdrl-0005sH-6i
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 12:20:09 +0000
X-Inumbo-ID: 7b0ceeee-62c9-11ea-b34e-bc764e2007e4
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b0ceeee-62c9-11ea-b34e-bc764e2007e4;
 Tue, 10 Mar 2020 12:20:08 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b23so8005143edx.4
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2020 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=LQH6jWPv5s7wzZs+P1ZNyLLZu7s09JPeww7FMK6I0YM=;
 b=TaWj2s9BJK8GpFtRyk20I/LcdnyqeDeq2hIHBti25Mpp5RGi6pKF95r+Q9RtSkhOmK
 RbPnBLxm9Zf6/jvc9gO8Xb75sL/dqU7V7Vw9C+RzAtcKwdeTcR75hBiY9TRqkhyxaoJw
 bbhfqhudJ4KlK9tU0yqO4LWDZyJAfmLl4cu3qg518MCHBiyF0yHUGl8HaMtPlXg/c7nG
 sW7JupqBWlRND0B8Xc8Ka/VBFI28T9/Gk7wyE+sklYfLp+bLgK3Jgf3Ub2XkoRkRnoaL
 a4i2K1RKI13w8B0wACBkX3XGxGakgtcEEQyvNxE3VL67pIEDzYZz2kRJJzxz4upNsZ8U
 7zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=LQH6jWPv5s7wzZs+P1ZNyLLZu7s09JPeww7FMK6I0YM=;
 b=E8N1d8DuBJx5Ct7+KULKISFEw8YNH2YovZohcezkZnniqwCiFSH0iTxWUh7lE5sCRA
 YJyfqM+2nUn6g/LfPHUjYLZ7fMxxMVApBbBH+u/Tq974Kc2S3DViC3hoHClDrREuZU7z
 W23mAah9PkFXFXXItEj8qKm4WyQy8J6mZWe4/uFkPLROi3/fEfk2OnGKJed8JL+psWBA
 8IDQy+uGbrJKyJsKxEZvhYvwo1IiTcDcazJ8UTjgqGOLW6sF6CI3HTRRcxHfTD4Wr0T3
 giRU1MzE8ulC8RO6CQGBCpLZeHHJUCzLlg2JhqmLJ+Avz1UTFGWBrd9WQdOzyWgcGTDN
 4DAw==
X-Gm-Message-State: ANhLgQ2QSa7uJ4QFYEKg8LmgN9KLFoQL53l2hPsb3eu569FJy81uJ+R2
 Q+ysp/k54LG/tUEcLxmVmYo=
X-Google-Smtp-Source: ADFU+vuy8KdiDXd+K0sVUwTQ7qdvtzH+Ncunirc4Dcvy9cSJBQDzsqQtMnziOo83TjZr+xbAt75EVw==
X-Received: by 2002:a17:906:4005:: with SMTP id
 v5mr18631051ejj.74.1583842807715; 
 Tue, 10 Mar 2020 05:20:07 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id p10sm3557494edu.59.2020.03.10.05.20.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Mar 2020 05:20:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <a8fc7299-4632-b32a-939d-b2e8354cf296@suse.com>
 <d1c4f00d-3bcd-b6f1-cd4e-24870ad248cc@suse.com>
 <000b01d5f6ca$49cf80a0$dd6e81e0$@xen.org>
 <e18a0f06-d954-683b-9ca0-0fb1aed62064@suse.com>
In-Reply-To: <e18a0f06-d954-683b-9ca0-0fb1aed62064@suse.com>
Date: Tue, 10 Mar 2020 12:20:06 -0000
Message-ID: <000d01d5f6d6$3c45f6b0$b4d1e410$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIwGZkq90C1TSWQGzHpu7p2ZALtpgH9ErYyAZpG/bYBg/kVrqdknX4w
Content-Language: en-gb
Subject: Re: [Xen-devel] [PATCH v2 2/5] IOMMU: iommu_intpost is x86/HVM-only
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
Reply-To: paul@xen.org
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Julien Grall' <julien@xen.org>,
 'Wei Liu' <wl@xen.org>, 'Konrad Wilk' <konrad.wilk@oracle.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMCBNYXJjaCAyMDIwIDExOjAyCj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7ICdLZXZpbiBUaWFuJyA8a2V2
aW4udGlhbkBpbnRlbC5jb20+OyAnU3RlZmFubyBTdGFiZWxsaW5pJwo+IDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPjsgJ0p1bGllbiBHcmFsbCcgPGp1bGllbkB4ZW4ub3JnPjsgJ1dlaSBMaXUnIDx3
bEB4ZW4ub3JnPjsgJ0tvbnJhZCBXaWxrJwo+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgJ0dl
b3JnZSBEdW5sYXAnIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+OyAnQW5kcmV3IENvb3Bl
cicKPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47ICdJYW4gSmFja3NvbicgPGlhbi5qYWNr
c29uQGNpdHJpeC5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzVdIElPTU1VOiBpb21t
dV9pbnRwb3N0IGlzIHg4Ni9IVk0tb25seQo+IAo+IE9uIDEwLjAzLjIwMjAgMTE6NTQsIFBhdWwg
RHVycmFudCB3cm90ZToKPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4+IEZyb206
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+PiBTZW50OiAwOSBNYXJjaCAyMDIw
IDEwOjQzCj4gPj4KPiA+PiBAQCAtNDg2LDggKzQ4MCwxMCBAQCBpbnQgX19pbml0IGlvbW11X3Nl
dHVwKHZvaWQpCj4gPj4gICAgICAgICAgcGFuaWMoIkNvdWxkbid0IGVuYWJsZSAlcyBhbmQgaW9t
bXU9cmVxdWlyZWQvZm9yY2VcbiIsCj4gPj4gICAgICAgICAgICAgICAgIWlvbW11X2VuYWJsZWQg
PyAiSU9NTVUiIDogIkludGVycnVwdCBSZW1hcHBpbmciKTsKPiA+Pgo+ID4+ICsjaWZuZGVmIGlv
bW11X2ludHBvc3QKPiA+PiAgICAgIGlmICggIWlvbW11X2ludHJlbWFwICkKPiA+PiAgICAgICAg
ICBpb21tdV9pbnRwb3N0ID0gMDsKPiA+Cj4gPiBOaXQ6IDAgLT4gZmFsc2UKPiAKPiBIbW0sIEkn
bSBub3QgdG91Y2hpbmcgdGhpcyBsaW5lLCBhbmQgdGhlIGdvYWwgb2YgdGhlIHBhdGNoIGlzbid0
Cj4gdG8gKGFsc28pIHN3aXRjaCBfYWxsXyBhc3NpZ25tZW50cyB0byB0aGUgdmFyaWFibGUuCgpZ
ZXMsIGJ1dCBpdCBpcyBpbiBjb250ZXh0IGFuZCB5b3Ugbm9ybWFsbHkgYXNrIGZvciBmaXgtdXBz
IHdoZXJlIHRoZXkgYXJlIGluIGNvbnRleHQuIEluIHRoaXMgY2FzZSBpdOKAmXMgYSBwcmV0dHkg
dHJpdmlhbCBhZGRpdGlvbiB0byB0aGUgcGF0Y2guCgo+IFRoZXJlIGlzIGF0Cj4gbGVhc3Qgb25l
IG1vcmUgKGluIHZtY3MuYyksIGFuZCBkb2luZyB0aGUgYWRqdXN0bWVudCBoZXJlIChhcwo+IGJl
aW5nIG5vdCBvdGhlcndpc2UgbW90aXZhdGVkLCBlLmcuIGJlY2F1c2Ugb2YgdG91Y2hpbmcgdGhl
IGxpbmUKPiBhbnl3YXkpIHdvdWxkIHRoZW4sIGZvciBjb25zaXN0ZW5jeSwgc2VlbSB0byBjYWxs
IGZvciBjb3JyZWN0aW5nCj4gdGhhdCBvdGhlciBpbnN0YW5jZSB0b28uCgpObywgSSdtIG5vdCBz
dWdnZXN0aW5nIGEgd2hvbGVzYWxlIGNvbnZlcnNpb24gKGFsdGhvdWdoIEknbSBub3QgYWdhaW5z
dCBpdCkuLi4ganVzdCB0aWR5aW5nIGFzIHdlIGdvLgoKPiBUaGlzLCBob3dldmVyLCB3b3VsZCBz
ZWVtIHRvbyB1bnJlbGF0ZWQKPiBhIGNoYW5nZSB0byBtYWtlIGhlcmUgZm9yIG15IHRhc3RlLiBI
ZW5jZSAuLi4KPiAKPiA+IFdpdGggdGhhdCBmaXhlZC4uLgo+ID4KPiA+IFJldmlld2VkLWJ5OiBQ
YXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KPiAKPiAuLi4gcGxlYXNlIGNsYXJpZnkgd2hldGhl
ciBJIG1heSBsZWF2ZSB0aGUgbGluZSB1bnRvdWNoZWQuCgpTaW5jZSBpdCdzIGluIGNvbnRleHQg
SSdkIHByZWZlciBpdCBmaXhlZCwgYnV0IEknbSBub3QgZ29pbmcgdG8gaW5zaXN0IHNvIHlvdSBj
YW4ga2VlcCB0aGUgUi1iLgoKICBQYXVsCgo+IAo+IEphbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
