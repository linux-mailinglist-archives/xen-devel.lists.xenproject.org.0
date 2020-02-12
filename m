Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AAA15B27C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 22:08:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1zCD-0003jv-Oj; Wed, 12 Feb 2020 21:05:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/HXa=4A=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j1zCC-0003jq-1r
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 21:05:20 +0000
X-Inumbo-ID: 5e47e727-4ddb-11ea-b7eb-12813bfff9fa
Received: from mail-qk1-f196.google.com (unknown [209.85.222.196])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5e47e727-4ddb-11ea-b7eb-12813bfff9fa;
 Wed, 12 Feb 2020 21:05:18 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id p7so3520857qkh.10
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2020 13:05:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5qIPuBtzinTBw1MB1jbjadhPqAhosPkxN7R13rA7ug8=;
 b=rKmk0+PpDmv6d1pUgcwC4Vw0mAQWamEIO6eNGF3nZMH9ErKjI/1sM823h2T5lnowwM
 Mu6zUbUhQenekM6QLdGLCFlJVA9P+tQEUYdc9+rK09ea3sG2yQY93NQPZOwcM0oNTMdJ
 5QoMkrXcxEnNpVxEEloVOfPiidRFbt41ELyYWXaLAjURdtN5QYCDH25ydiN4ta3HuR0/
 yOAUxtOyhW43jkLRNVljMuAAu+lqsAu3gL30rnQLHSclfeygMouXT5k0GsEBMqB+mChc
 /ez7TFo05q+KwC0wevSSHbf789si9mAn+mhpwKqPzKxVlji0vHfdAYugO6qkS+3pQH23
 UHbQ==
X-Gm-Message-State: APjAAAXCP+EJlkIQE4b5mI83CG7kRGN1/wY7PBWH1csdsaCiQMwB7vbY
 YBv9gBz5t7iEx5qxp+fOHxU=
X-Google-Smtp-Source: APXvYqxy4Fqyy34F0/NsA7u6zG4PV2q0EdWAYSNAOziNgE3Dh+HHZ2nTkk94df+7s/9mLhNpZrC6aA==
X-Received: by 2002:a05:620a:1383:: with SMTP id
 k3mr8226578qki.252.1581541517699; 
 Wed, 12 Feb 2020 13:05:17 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id 69sm27754qkg.133.2020.02.12.13.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 13:05:16 -0800 (PST)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20200212164949.56434-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <72a1c94b-fd3b-3d47-4963-d92c6293000c@xen.org>
Date: Wed, 12 Feb 2020 22:05:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200212164949.56434-1-roger.pau@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 0/3] x86: fixes/improvements for scratch
 cpumask
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi8wMi8yMDIwIDE3OjQ5LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gSGVsbG8sCgpI
aSBSb2dlciwKCj4gQ29tbWl0Ogo+IAo+IDU1MDBkMjY1YTJhOGZhNjNkNjBjMDhiZWI1NDlkZThl
YzgyZmY3YTUKPiB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRoYW5k
IHdoZW4gcG9zc2libGUKClRoZXJlIGlzIGEgbW9yZSBzdWJ0bGUgcHJvYmxlbSBpbnRyb2R1Y2Vk
IGJ5IHRoaXMgcGF0Y2guIEkgdGhvdWdodCBJIAp3b3VsZCBtZW50aW9uIGl0IGhlcmUganVzdCBp
biBjYXNlIHRoaXMgYWZmZWN0IHRoZSBhcHByb2FjaCB5b3UgaGF2ZSAKY2hvc2VuIGluIHRoaXMg
c2VyaWVzLgoKZ2V0X2NwdV9tYXBzKCkgaXMgdXNlZCBieSBzdG9wX21hY2hpbmVfcnVuKCkgdG8g
c2VyaWFsaXplIHRoZSBjYWxsZXJzLiAKSWYgdGhlIGxhdHRlciBmYWlscyB0byBhY3F1aXJlIHRo
ZSBsb2NrLCBpdCB3aWxsIGJhaWwgb3V0LiAKVW5mb3J0dW5hdGVseSwgcmN1X2JhcnJpZXIoKSBp
cyBpbXBsZW1lbnRlZCB1c2luZyBzdG9wX21hY2hpbmVfcnVuKCkgYW5kIAp3aWxsIGJlIHR1cm5l
ZCB0byBwcmV0dHkgbXVjaCBhIE5PUCBpZiB0aGUgbGF0dGVyIGZhaWxzIChlLmcgdGhlIGxvY2sg
CmNhbm5vdCBiZSBhY3F1aXJlZCkuCgpUaGlzIG1lYW5zIHRoYXQgdGhlIHJjdV9iYXJyaWVyKCkg
d2lsbCBub3QgZG8gdGhlIGV4cGVjdGVkIGpvYiBhbmQgCnBvdGVudGlhbGx5IGludHJvZHVjZSB1
bmtub3duIGlzc3VlcyAoZS5nIHVzZS1hZnRlci1mcmVlLi4uKS4KCkJlZm9yZSB5b3VyIHBhdGNo
LCBpdCB3b3VsZCBoYXZlIGJlZW4gcHJldHR5IGhhcmQgdG8gaGl0IHRoZSBwcm9ibGVtIAphYm92
ZS4gQWZ0ZXIsIHlvdSBjYW4gcmFjZSBtb3JlIGVhc2lseSB3aXRoIHJjdV9iYXJyaWVyKCkgYXMg
c2VuZGluZyBJUEkgCmlzIHByZXR0eSBjb21tb24uCgpTYWRseSwgSSBkb24ndCBoYXZlIGEgc3Vn
Z2VzdGlvbiB5ZXQgaG93IHRvIGZpeCB0aGlzIHByb2JsZW0uCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
