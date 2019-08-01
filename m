Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CDB7E27C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 20:43:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htG0P-0008AD-MX; Thu, 01 Aug 2019 18:40:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q0EE=V5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1htG0N-0008A8-LE
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 18:40:47 +0000
X-Inumbo-ID: df9938ef-b48b-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id df9938ef-b48b-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 18:40:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z28so16167330ljn.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 11:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=gR2mGQQ34H3nzm1gmIiUClsfy2ekO9UEOqgfDya7W+4=;
 b=jRssm3Vh5EJyGpH8SiNwO3FW2qpI4MS6ADXdf6JaNiPqnBzTmoOJg7k0iqdYFe4ewg
 3sj4AdT+iYKceRzj+4p6+BmUBnYDwGWo5RdngFhgjtGTxFUzarnukKqJG+Hb5t6tvsFA
 EZS3HY/TwSdG4HAfwtPw2EKE175UweBP5ys9zZDxMR229H9oFbECFuu900XdeKOMy1sV
 OcW0eGh6LBmCxTkgiSai1hcXK6IOGoIT6QukZcztPYEPlTwd5B8PbMWdjt28hTZB7h29
 N1T70Ka4c50BLiY2j6OW6SRRmkL7uFCqpRabcnTtq07Gp9MbgPDII5BtR6IaEiwGOu0j
 m/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gR2mGQQ34H3nzm1gmIiUClsfy2ekO9UEOqgfDya7W+4=;
 b=ST0ZMgfWH+1LbHJABbRNtSBCr+HUjNHkUAzIE+q0YHZOyPrCCnlDbkYIoF61hHlJz2
 +4vH97lzNsktsZJ2+i+RU1y5ozvfEGrqEL7Ydl0ZPkYjNK2tEG3CDiBAVRk4DhVCqSRS
 Ibzib/gEE3LrdJfoXtPitwclOh6L/k3F2nwCmdutuxCsvIUPn8nds91JpUf5q/Qokb5B
 5JI/fIqABQHAGafFEQKTSimoufe4kfvxq9/IyEnVJ1tQrqdPByrT2bNLXgwSX9SzwP2f
 /DaB4cbYxkrLtMnECJxhgdv3Z+kKViCHq8vxblWaJZ+EA+cBNOg1ilBYpK7k80fDPxT5
 FM2g==
X-Gm-Message-State: APjAAAUOzDSRX5nOvoXEallge+U5FU5yFCmQaVxdKDdwT2GtdtkELzTX
 SZQA0lsDDtDteJJwGwkenXim96aCXCA=
X-Google-Smtp-Source: APXvYqxEl0WeHYZiaIzDWHS+7hADnbRLFQALxXmLkAn6jWwjltN1iarBNohvAN7RajmDhqw4rQqxbw==
X-Received: by 2002:a2e:a0d6:: with SMTP id f22mr43571470ljm.182.1564684844857; 
 Thu, 01 Aug 2019 11:40:44 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id r17sm14857389ljc.85.2019.08.01.11.40.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Aug 2019 11:40:44 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <eba016be-a084-5a6b-f47f-cede44199f7a@gmail.com>
 <20190801141434.lkwslwmkujfn5vef@Air-de-Roger>
 <afe06b62-dfdb-6a15-2e48-463f1685e9e3@gmail.com>
 <4fd1f35c-ae72-0ea3-eb95-b3f5091bed1d@suse.com>
 <5e9ddd34-30d4-118a-ed76-89a11e3c7adf@gmail.com>
 <3c42f553-7030-2dd4-cb85-319bd81495ff@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <0ba3a0e9-1e22-660d-7978-c4857f3c0dc4@gmail.com>
Date: Thu, 1 Aug 2019 21:40:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3c42f553-7030-2dd4-cb85-319bd81495ff@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [Question] Proper location for Linux error code
 (-EPROBE_DEFER) in Xen
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLjA4LjE5IDE4OjQ2LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwMS4wOC4yMDE5IDE2
OjU0LCBPbGVrc2FuZHIgd3JvdGU6Cj4+IE9uIDAxLjA4LjE5IDE3OjM0LCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+IE9uIDAxLjA4LjIwMTkgMTY6MzEsIE9sZWtzYW5kciB3cm90ZToKPj4+PiAgwqAg
wqBUaGlzIGlzIG5lZWRlZCBmb3IgdGhlIHVwY29taW5nIFYyIG9mIHRoZSBJUE1NVSBkcml2ZXIg
KEFSTSkgWzFdIHdoaWNoIG1heSByZXF1ZXN0Cj4+Pj4gIMKgIMKgZGVmZXJyZWQgcHJvYmluZyAo
cmV0dXJucyAtRVBST0JFX0RFRkVSKSBkZXBlbmRpbmcgb24gd2hhdCBkZXZpY2Ugd2lsbCBiZSBw
cm9iZWQgdGhlIGZpcnN0Cj4+Pj4gIMKgIMKgKFJvb3QgZGV2aWNlIG11c3QgYmUgcmVnaXN0ZXJl
ZCBiZWZvcmUgQ2FjaGUgZGV2aWNlcy4gSWYgbm90IHRoZSBjYXNlLAo+Pj4+ICDCoCDCoGRyaXZl
ciB3aWxsIGRlbnkgZnVydGhlciBDYWNoZSBkZXZpY2UgcHJvYmVzIHVudGlsIFJvb3QgZGV2aWNl
IGlzIHJlZ2lzdGVyZWQpLgo+Pj4+Cj4+Pj4gQXMgd2UgY2FuJ3QgZ3VhcmFudGVlIGEgZml4ZWQg
cHJlLWRlZmluZWQgb3JkZXIgZm9yIHRoZSBkZXZpY2Ugbm9kZXMgaW4gRFQsIHdlIG5lZWQgdG8g
YmUgcmVhZHkgZm9yIHRoZSBzaXR1YXRpb24gd2hlcmUgZGV2aWNlcyBiZWluZyBwcm9iZWQKPj4+
PiBpbiAiYW55IiBvcmRlci4gU28sIGZyYW1ld29yayAoZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0v
aW9tbXUuYykgd2lsbCBiZSBtb2RpZmllZCBhIGJpdCB0byBiZSBhYmxlIHRvIGhhbmRsZSAtRVBS
T0JFX0RFRkVSIHJldHVybmluZyBieSBkcml2ZXIuCj4+PiBJJ20gc3VyZSB0aGlzIGNhbiBiZSBo
YWQgd2l0aG91dCBpbnRyb2R1Y2luZyBhIG5ldyBlcnJvciBjb2RlLgo+PiBCeSByZXVzaW5nIGV4
aXN0aW5nIG9uZSAoRUFHQUlOIGNvbWVzIHRvIG1pbmQpPwo+IEZvciBleGFtcGxlLiBPciBieSB1
c2luZyBzb21lIHBvc2l0aXZlIHZhbHVlIGluc3RlYWQgb2YgdGhlIChuZWdhdGl2ZSkKPiBlcnJu
by5oIG9uZXMuCgpBY3R1YWxseSwgd2h5IG5vdD8gVGhhbmsgeW91LgoKV2UgY291bGQgZmluZCBj
b21tb24gZ3JvdW5kIG9uIHdoYXQgZHJpdmVyJ3MgaW5pdCBjYWxsYmFjayBzaG91bGQgcmV0dXJu
IAppZiBkcml2ZXIgd2FudHMgdG8gcmVxdWVzdCBkZWZlcnJlZCBwcm9iaW5nIGFuZCBkb2N1bWVu
dCB0aGlzIGJlaGF2aW9yIAppbiBkZXZpY2VfaW5pdCB1c2FnZS4KSSB3b3VsZCB1c2UgRUFHQUlO
LCBidXQgSSBhbSBvcGVuIHRvIG90aGVyIG9wdGlvbnMgaGVyZS4KCkp1bGllbiwgd2hhdCBkbyB5
b3UgdGhpbms/CgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
