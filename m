Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8634517A882
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 16:05:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9s16-0004gS-QU; Thu, 05 Mar 2020 15:02:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OfCS=4W=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j9s15-0004gL-4A
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:02:27 +0000
X-Inumbo-ID: 531d9d28-5ef2-11ea-a5ec-12813bfff9fa
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 531d9d28-5ef2-11ea-a5ec-12813bfff9fa;
 Thu, 05 Mar 2020 15:02:26 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id cq8so6438396edb.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2020 07:02:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4DjCyJXYI7V8mhe79Ns18Z6hgMJSj40N2oVr5PpRQb4=;
 b=OfrrAtdOBxQk/k1N+ao8USS0iQjmnRRxBiskfxxJeHtpr51bkVaeLAru9ru89vK/eq
 XILeX/2+3Tjn2RH6tIcK9VqoRYI0INP7CAVRJYerPYlHGkNZLljrdMcpVzWp6B4RyfeD
 qAvWGTd9Aqc8e/IKwDKeqzEfYBeqWpJuD5hX48KQ64ogBXYO5nbFMWyRmqpHhysdg391
 buulxbk3dhIeg6riLjQ9aSAx7wGHi2QdCdVTFIGLkqe689hoY3TsCW1/C+WsXiCrSjIE
 TZ1wkNSAFylK/COkvDdK+bpmVUrNECEyfj8oxLR+66KRHcLajlcVkza3cdyeCHcb+azD
 c43w==
X-Gm-Message-State: ANhLgQ1qBUmrn5q59fasuXRxWOKee6cuz1LVI+QqiMlSx7pi7t8JH9J/
 hYlSgwQmEB1i6MlLyx96mJE=
X-Google-Smtp-Source: ADFU+vuCoG0nj2jDBjrXdnJVcPtKdiwtoZT3JFY5ZiEbTThR34QxxYVrvSKLYCm80yGu7wcoNmrRiQ==
X-Received: by 2002:a17:906:34db:: with SMTP id
 h27mr5292882ejb.111.1583420545250; 
 Thu, 05 Mar 2020 07:02:25 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id m5sm1898830ede.10.2020.03.05.07.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2020 07:02:24 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-8-anthony.perard@citrix.com>
 <155c8c7d-df12-5177-45ab-1dd2a6bc9b45@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e194bb44-9d71-070e-7ef7-47dd1a21c56e@xen.org>
Date: Thu, 5 Mar 2020 15:02:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <155c8c7d-df12-5177-45ab-1dd2a6bc9b45@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 07/23] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMDMvMjAyMCAwOToyNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYu
MDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IFRoaXMgaXMgcGFydCBvZiB1
cGdyYWRpbmcgb3VyIGJ1aWxkIHN5c3RlbSBhbmQgaW1wb3J0IG1vcmUgb2YgTGludXgncwo+PiBv
bmUuCj4+Cj4+IEluIExpbnV4LCBzdWJkaXIteSBpbiBNYWtlZmlsZXMgaXMgb25seSB1c2VkIHRv
IGRlc2NlbmQgaW50bwo+PiBzdWJkaXJlY3Rvcnkgd2hlbiB0aGVyZSBhcmUgbm8gb2JqZWN0IHRv
IGJ1aWxkLCBYZW4gZG9lc24ndCBoYXZlIHRoYXQKPj4gYW5kIGFsbCBzdWJkaXIgaGF2ZSBvYmpl
Y3QgdG8gYmUgaW5jbHVkZWQgaW4gdGhlIGZpbmFsIGJpbmFyeS4KPj4KPj4gVG8gYWxsb3cgdGhl
IG5ldyBzeW50YXgsIHRoZSAib2JqLXkiIGFuZCAic3ViZGlyLSoiIGNhbGN1bGF0aW9uIGluCj4+
IFJ1bGVzLm1rIGlzIGNoYW5nZWQgYW5kIHBhcnRpYWxseSBpbXBvcnRlZCBmcm9tIExpbnV4J3Mg
S2J1aWxkLgo+Pgo+PiBUaGUgY29tbWFuZCB1c2VkIHRvIG1vZGlmeSB0aGUgTWFrZWZpbGUgd2Fz
Ogo+PiAgICAgIHNlZCAtaSAtciAncyNec3ViZGlyLSguKikjb2JqLVwxLyM7JyAqKi9NYWtlZmls
ZQo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT4KPj4gLS0tCj4+Cj4+IE5vdGVzOgo+PiAgICAgIHYzOgo+PiAgICAgIC0gbm8gbW9y
ZSB0YWJzCj4+ICAgICAgLSByZXNodWZmbGUgdmFyaWFibGUsIGFuZCByZW1vdmUgX19zdWJkaXIt
eQo+Pgo+PiAgIHhlbi9SdWxlcy5tayAgICAgICAgICAgICAgICAgICAgICAgICB8IDE5ICsrKysr
KysrLS0tLS0tLS0tLS0KPj4gICB4ZW4vYXJjaC9hcm0vTWFrZWZpbGUgICAgICAgICAgICAgICAg
fCAxNCArKysrKysrLS0tLS0tLQo+PiAgIHhlbi9hcmNoL2FybS9hcm0zMi9NYWtlZmlsZSAgICAg
ICAgICB8ICAyICstCj4+ICAgeGVuL2FyY2gvYXJtL2FybTY0L01ha2VmaWxlICAgICAgICAgIHwg
IDIgKy0KPiAKPiBKdWxpZW4sIFN0ZWZhbm8gLSBhbnkgY2hhbmNlIG9mIGdldHRpbmcgYW4gYWNr
IGhlcmU/CgpTdGV3YXJ0IHBvaW50ZWQgb25lIGJ1aWxkIGlzc3VlIG9uIEFybSBpbiB0aGUgY292
ZXIgbGV0dGVyLiBJIGFtIG5vdCAKc3VyZSB3aGVyZSB0aGUgYnVnIGxpZXMsIHNvIEkgd291bGQg
bGlrZSB0byBob2xkIG9mZiBteSBhY2sgdW50aWwgCnNvbWVvbmUgZmlndXJlIG91dCB3aGF0J3Mg
Z29pbmcgb24uCgo+IAo+PiAgIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgICAgICAgICAgICB8
IDE4ICsrKysrKysrKy0tLS0tLS0tLQo+PiAgIHhlbi9hcmNoL3g4Ni9hY3BpL01ha2VmaWxlICAg
ICAgICAgICB8ICAyICstCj4+ICAgeGVuL2FyY2gveDg2L2NwdS9NYWtlZmlsZSAgICAgICAgICAg
IHwgIDQgKystLQo+PiAgIHhlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSAgICAgICAgICB8ICA0
ICsrLS0KPj4gICB4ZW4vYXJjaC94ODYvaHZtL01ha2VmaWxlICAgICAgICAgICAgfCAgNiArKyst
LS0KPj4gICB4ZW4vYXJjaC94ODYvbW0vTWFrZWZpbGUgICAgICAgICAgICAgfCAgNCArKy0tCj4+
ICAgeGVuL2FyY2gveDg2L3g4Nl82NC9NYWtlZmlsZSAgICAgICAgIHwgIDIgKy0KPj4gICB4ZW4v
Y29tbW9uL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCj4+ICAgeGVu
L2RyaXZlcnMvTWFrZWZpbGUgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKy0tLS0tLS0KPj4g
ICB4ZW4vZHJpdmVycy9hY3BpL01ha2VmaWxlICAgICAgICAgICAgfCAgNiArKystLS0KPj4gICB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9NYWtlZmlsZSAgICAgfCAgOCArKysrLS0tLQo+PiAgIHhl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9NYWtlZmlsZSB8ICAyICstCj4gCj4gS2V2aW4sIGhv
dyBhYm91dCB0aGlzIG9uZT8KPiAKPj4gICB4ZW4vbGliL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgfCAgMiArLQo+PiAgIHhlbi94c20vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8
ICAyICstCj4+ICAgeGVuL3hzbS9mbGFzay9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgIDIgKy0K
PiAKPiBEYW5pZWwsIGhvdyBhYm91dCB0aGVzZT8KPiAKPiBJIGd1ZXNzIHRoZSBsYXR0ZXIgdHdv
IGFyZSBzbWFsbCBlbm91Z2ggdG8gc2tpcCBmdXJ0aGVyIHdhaXRpbmcgZm9yCj4gYWNrcyBvbmNl
IHRoZSBBcm0gb25lIHdvdWxkIGJlIGluIHBsYWNlLiBHZXR0aW5nIHRoaXMgcGF0Y2ggaW4KPiB3
b3VsZCB1bmJsb2NrIGEgZmFpciBwYXJ0IG9mIHRoZSByZW1haW5kZXIgb2YgdGhpcyBzZXJpZXMu
Cj4gCj4gSmFuCj4gCgpDaGVlcnMsCgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
