Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7B12D030
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 14:18:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilutr-0004Hu-Tg; Mon, 30 Dec 2019 13:15:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ggqA=2U=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ilutr-0004Ho-0F
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 13:15:59 +0000
X-Inumbo-ID: 7f9ae330-2b06-11ea-a914-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f9ae330-2b06-11ea-a914-bc764e2007e4;
 Mon, 30 Dec 2019 13:15:50 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id cy15so32562466edb.4
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 05:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XNgC+Ro/fQkILxnfGcbrHPJklftXf1qQupLnVTuzEtk=;
 b=svARDcIuXQJ9WrPd89donVteJz5O0cu400+w+JhrhFLQqZt5aIIjy8QZsV2/oRrsMv
 XY/AlRfH5lWVieZ93RCFawNhe8zbj2SiWw/OtOlVU1DXLlYCCOXk16m0Ni6hRSN7zvSI
 kfF7mHTz1kwD2a+bKBykyMXpMxbuifJfd1DLYxlvm9K7FnEZj51xlUdhJZfv85ErYe28
 7ifZL+GrW2uPYdhrWf9k6JNNxdz3qbhaPuF+jHRt8GQz/SdXi7VhkgKxReEHK0dWJrqK
 mSzaQ7PNCloJysCZTdlSIpiIL+TNW10YtIbazFKLkZZI4CB3573vD2na/51EWmWS0urn
 mc3A==
X-Gm-Message-State: APjAAAWUh08Wta3HATkL3DMfmJw0xCMEK7bHzQQG0zjqFF1jpj59EQb5
 O1NFRUoH4Cusw9yDsiGReIY=
X-Google-Smtp-Source: APXvYqwQS23QS2FmdnYP7y2E7yTdk9xqFsUOG3tBtkXLNw2X9sh0tqMh2fX687yyRI0AB8SGM/1nyQ==
X-Received: by 2002:a17:906:3519:: with SMTP id
 r25mr72331362eja.47.1577711749549; 
 Mon, 30 Dec 2019 05:15:49 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id q13sm5344266edn.2.2019.12.30.05.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Dec 2019 05:15:49 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191227134516.15530-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b190ca53-3541-438f-7a61-723a51e0d57d@xen.org>
Date: Mon, 30 Dec 2019 13:15:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20191227134516.15530-1-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Reposition build_pre() logic
 between architectures
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMjcvMTIvMjAxOSAxMzo0NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBU
aGUgY2FsbCB0byB4Y19kb21haW5fZGlzYWJsZV9taWdyYXRlKCkgaXMgbWFkZSBvbmx5IGZyb20g
eDg2LCB3aGlsZSBpdHMKPiBoYW5kbGluZyBpbiBYZW4gaXMgY29tbW9uLiAgTW92ZSBpdCB0byB0
aGUgbGlieGxfX2J1aWxkX3ByZSgpLgo+IAo+IGh2bV9zZXRfY29uZl9wYXJhbXMoKSwgaHZtX3Nl
dF92aXJpZGlhbl9mZWF0dXJlcygpLAo+IGh2bV9zZXRfbWNhX2NhcGFiaWxpdGllcygpLCBhbmQg
dGhlIGFsdHAybSBsb2dpYyBpcyBhbGwgaW4gY29tbW9uCj4gY29kZSAocGFydHMgaWZkZWYnZCkg
YnV0IGRlc3BpdGUgdGhpcywgaXMgYWxsIGFjdHVhbGx5IHg4NiBzcGVjaWZpYy4KCldoaWxlIGFs
dHAybSBpcyBvbmx5IHN1cHBvcnRlZCBvbiB4ODYsIHRoZSBjb25jZXB0IGlzIG5vdCB4ODYtc3Bl
Y2lmaWMuIApJIGFtIGFjdHVhbGx5IGF3YXJlIG9mIHBlb3BsZSB1c2luZyBhbHRwMm0gb24gQXJt
LCBhbHRob3VnaHQgdGhlIHN1cHBvcnQgCmlzIG5vdCB1cHN0cmVhbSB5ZXQuCgo+IAo+IE1vdmUg
aXQgaW50byB4ODYgc3BlY2lmaWMgY29kZSwgYW5kIGZvbGQgYWxsIG9mIHRoZSB4Y19odm1fcGFy
YW1fc2V0KCkgY2FsbHMKPiB0b2dldGhlciBpbnRvIGh2bV9zZXRfY29uZl9wYXJhbXMoKSBpbiBh
IGZhciBtb3JlIGNvaGVyZW50IHdheS4KPiAKPiBGaW5hbGx5IC0gZW5zdXJlIHRoYXQgYWxsIGh5
cGVyY2FsbHMgaGF2ZSB0aGVpciByZXR1cm4gdmFsdWVzIGNoZWNrZWQuCj4gCj4gTm8gcHJhY3Rp
Y2FsIGNoYW5nZSBpbiBjb25zdHJ1Y3RlZCBkb21haW5zLiAgRmV3ZXIgdXNlbGVzcyBoeXBlcmNh
bGxzIG5vdyB0bwo+IGNvbnN0cnVjdCBhbiBBUk0gZ3Vlc3QuCgpJIHRoaW5rIGl0IHdvdWxkIGJl
IGJlc3QgdG8ga2VlcCBhbnl0aGluZyB0aGF0IHdlIGtub3cgY2FuIGJlIHVzZWQgb24gCmFybSAo
b3IgbmV3IGFyY2hpdGVjdHVyZSkgaW4gY29tbW9uIGNvZGUuIEkgYW0gdGhpbmtpbmcgYWJvdXQg
CiJuZXN0ZWRodm0iIGFuZCAiYWx0cDJtIi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
