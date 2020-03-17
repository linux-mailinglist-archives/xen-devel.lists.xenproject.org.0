Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD7188871
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 16:00:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEDe9-0008CQ-Od; Tue, 17 Mar 2020 14:56:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Yf1=5C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jEDe8-0008CL-DF
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:56:44 +0000
X-Inumbo-ID: 83843f1e-685f-11ea-b962-12813bfff9fa
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83843f1e-685f-11ea-b962-12813bfff9fa;
 Tue, 17 Mar 2020 14:56:43 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id h62so26830476edd.12
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 07:56:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aHfA44SPR7BPWcSvuAk6fasdawP9GUSfRqOMAcxiDn4=;
 b=j7AQpgSDotTI99WM5F0KxQeSjjBUlEuqusDNX9uKE4oY/iCfwFcj/LnUVIatbB103E
 e8tCo0sZ6WD00NAvmusQgR8zJ8W2NlhUBMWHhR7z/7IWoVcm14ceU3TTbognkC0hI/PF
 G++0Tno+1sLO9fu6awKiGxueRK65HpT3ArZ9QS0ssGRxKjhydO4x85ogaBhmRA8Bnrkr
 Bi3EN6vXwxmuAWwMRTL++9WYpMSfq3mDIth1whuer88tr5gXU91E+JiYLDaDBbpnhRhQ
 Nxiw6+E2zFebnvPdLlXIJQcQWfdubYMK8NcJ58ZiXoys9qLzSb9u8jsIYOzVExH3Xt0S
 oZbw==
X-Gm-Message-State: ANhLgQ2DOdaSE2iIGd61UkFSbM+kQlqNLwNQn22ukTnnvb8x/ZVDza+0
 vuCy+75UJuEvwAD1KACESjI=
X-Google-Smtp-Source: ADFU+vu5oOEMJuwuZDmnSQdw13hojoh9AH6/BSGNgy///39Xkbwn/Xc5GaCiUz3jNp9+B7wveC0u2g==
X-Received: by 2002:a05:6402:161a:: with SMTP id
 f26mr5540060edv.264.1584457002311; 
 Tue, 17 Mar 2020 07:56:42 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-232.amazon.com.
 [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id 91sm219269edq.78.2020.03.17.07.56.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 07:56:41 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c50fc4e8-cb96-74a1-de2b-9e83e609db1c@suse.com>
 <36b5d9a8-1f27-fc11-7d3a-a63e80c7329b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5e878039-341c-692e-f04f-ffcfd1bb2a3b@xen.org>
Date: Tue, 17 Mar 2020 14:56:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <36b5d9a8-1f27-fc11-7d3a-a63e80c7329b@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 2/2] libfdt: fix undefined behaviour in
 _fdt_splice()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTMvMDMvMjAyMCAwNzozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQWxvbmcg
dGhlIGxpbmVzIG9mIGNvbW1pdCBkMGIzYWIwYTBmNDYgKCJsaWJmZHQ6IEZpeCB1bmRlZmluZWQg
YmVoYXZpb3VyCj4gaW4gZmR0X29mZnNldF9wdHIoKSIpLCBfZmR0X3NwbGljZSgpIHNpbWlsYXJs
eSBtYXkgbm90IHVzZSBwb2ludGVyCj4gYXJpdGhtZXRpYyB0byBkbyBvdmVyZmxvdyBjaGVja3Mu
Cj4gCj4gW3Vwc3RyZWFtIGNvbW1pdCA3M2Q2ZTllY2I0MTc5YjUxMDQwOGJjNTI2MjQwZjgyOTI2
MmRmMzYxXQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPgoKQ2hlZXJzLAoKPiAK
PiAtLS0gYS94ZW4vY29tbW9uL2xpYmZkdC9mZHRfcncuYwo+ICsrKyBiL3hlbi9jb21tb24vbGli
ZmR0L2ZkdF9ydy5jCj4gQEAgLTg3LDcgKzg3LDcgQEAgc3RhdGljIGludCBfZmR0X3J3X2NoZWNr
X2hlYWRlcih2b2lkICpmZAo+ICAgCQkJcmV0dXJuIGVycjsgXAo+ICAgCX0KPiAgIAo+IC1zdGF0
aWMgaW5saW5lIGludCBfZmR0X2RhdGFfc2l6ZSh2b2lkICpmZHQpCj4gK3N0YXRpYyBpbmxpbmUg
dW5zaWduZWQgaW50IF9mZHRfZGF0YV9zaXplKHZvaWQgKmZkdCkKPiAgIHsKPiAgIAlyZXR1cm4g
ZmR0X29mZl9kdF9zdHJpbmdzKGZkdCkgKyBmZHRfc2l6ZV9kdF9zdHJpbmdzKGZkdCk7Cj4gICB9
Cj4gQEAgLTk1LDEzICs5NSwxNCBAQCBzdGF0aWMgaW5saW5lIGludCBfZmR0X2RhdGFfc2l6ZSh2
b2lkICpmCj4gICBzdGF0aWMgaW50IF9mZHRfc3BsaWNlKHZvaWQgKmZkdCwgdm9pZCAqc3BsaWNl
cG9pbnQsIGludCBvbGRsZW4sIGludCBuZXdsZW4pCj4gICB7Cj4gICAJY2hhciAqcCA9IHNwbGlj
ZXBvaW50Owo+IC0JY2hhciAqZW5kID0gKGNoYXIgKilmZHQgKyBfZmR0X2RhdGFfc2l6ZShmZHQp
Owo+ICsJdW5zaWduZWQgaW50IGRzaXplID0gX2ZkdF9kYXRhX3NpemUoZmR0KTsKPiArCXNpemVf
dCBzb2ZmID0gcCAtIChjaGFyICopZmR0Owo+ICAgCj4gLQlpZiAoKChwICsgb2xkbGVuKSA8IHAp
IHx8ICgocCArIG9sZGxlbikgPiBlbmQpKQo+ICsJaWYgKG9sZGxlbiA8IDAgfHwgc29mZiArIG9s
ZGxlbiA8IHNvZmYgfHwgc29mZiArIG9sZGxlbiA+IGRzaXplKQo+ICAgCQlyZXR1cm4gLUZEVF9F
UlJfQkFET0ZGU0VUOwo+IC0JaWYgKChlbmQgLSBvbGRsZW4gKyBuZXdsZW4pID4gKChjaGFyICop
ZmR0ICsgZmR0X3RvdGFsc2l6ZShmZHQpKSkKPiArCWlmIChkc2l6ZSAtIG9sZGxlbiArIG5ld2xl
biA+IGZkdF90b3RhbHNpemUoZmR0KSkKPiAgIAkJcmV0dXJuIC1GRFRfRVJSX05PU1BBQ0U7Cj4g
LQltZW1tb3ZlKHAgKyBuZXdsZW4sIHAgKyBvbGRsZW4sIGVuZCAtIHAgLSBvbGRsZW4pOwo+ICsJ
bWVtbW92ZShwICsgbmV3bGVuLCBwICsgb2xkbGVuLCAoKGNoYXIgKilmZHQgKyBkc2l6ZSkgLSAo
cCArIG9sZGxlbikpOwo+ICAgCXJldHVybiAwOwo+ICAgfQo+ICAgCj4gCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
