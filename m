Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61AF1576E9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 13:56:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j18Zl-0004KT-Gv; Mon, 10 Feb 2020 12:54:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jbPx=36=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j18Zj-0004KO-Gc
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 12:54:07 +0000
X-Inumbo-ID: 6c2ea01a-4c04-11ea-b4b8-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6c2ea01a-4c04-11ea-b4b8-12813bfff9fa;
 Mon, 10 Feb 2020 12:54:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id c84so151380wme.4
 for <xen-devel@lists.xenproject.org>; Mon, 10 Feb 2020 04:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=azEsV084XPRbiqwRi2j9+pl9JVXgmHOa8j5Fd1259jo=;
 b=TJaUqfBEj971er7DuWNrg4o8Mf7SEQ+I+ooP79IIoJRzHwDY5g9BrhTFLQ/kUAgnOw
 pQP1nPhGnnjAQ5XpgcYfS3bY67GfbREBaSHrkW8aDCXV9oegMI2al7GC+/P78Y2bZejQ
 cdziTOWBC5OjuSlnU8jp4kcJGrWtAZhol+2TOOgTmfCgpXreOZPMWqZrYsgyoPTTTL6r
 QmJWxmSSvf+Gk3EU9RkgBQ/9IOMc0IoIYc94a85IL4PL5BdOM/SaXDkwkIGnM4RlurIQ
 p+538avtIt5CAbtJ9BOMTvbNw2czcVwQuhT8SZF6Z9k8l7E0abWAgRnAyz/SzP7rEqwN
 R0fQ==
X-Gm-Message-State: APjAAAXdKYTdn4jCXuCsxiq5SqMCn5wfzuRFmVHOhxG4c5k/0qZJqQkr
 JSf9bIbaAZK+xQpU3iSNTco=
X-Google-Smtp-Source: APXvYqy5vRuv+Ehy50UjC2pCrdV4h/kL5/mOEzRQ6uMZZT8UzKFUyZ/lZYSS95fDQtSt7eeQXA3Tbg==
X-Received: by 2002:a7b:c0d9:: with SMTP id s25mr14898161wmh.98.1581339246351; 
 Mon, 10 Feb 2020 04:54:06 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id k8sm402052wrq.67.2020.02.10.04.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2020 04:54:05 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>
References: <20200204173455.22020-1-roger.pau@citrix.com>
 <20200204173455.22020-3-roger.pau@citrix.com>
 <3d067f06-a054-bbe1-916e-ef43e2527f45@suse.com>
 <20200205132144.GS4679@Air-de-Roger>
 <775b8691-068d-2af9-1b59-d66233708595@suse.com>
 <69d410bd-2397-537d-6507-4c710d166396@xen.org>
 <1354b838-e30f-10dd-edbe-064fb159ef7e@suse.com>
 <0542d37e-8128-b94c-19ac-8506bf0d1b8a@xen.org>
 <58391072-5196-62e7-a09b-bc45993b50ef@suse.com>
 <4d6e9d92-d0cf-6f4e-0fe1-8cba69c72300@xen.org>
 <17344a8c-b5f5-ee48-a89d-8d5c0070e81f@suse.com>
 <910276d6-a55d-87d2-cb92-055c53b9898c@xen.org>
 <979c25c4-09c2-755e-51f9-ca644358b096@suse.com>
 <87208524-5c30-48cf-fe7a-e5d77a26414b@xen.org>
 <ea8e70a3-83d2-0491-115c-fbf18bd1d705@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <22c23ea7-e8ee-d09f-6702-888e364f76f0@xen.org>
Date: Mon, 10 Feb 2020 12:54:04 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <ea8e70a3-83d2-0491-115c-fbf18bd1d705@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8wMi8yMDIwIDEyOjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxMC4wMi4yMDIw
IDEzOjIxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBPbiAxMC8wMi8yMDIwIDEx
OjU5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDEwLjAyLjIwMjAgMTI6MDAsIEp1bGllbiBH
cmFsbCB3cm90ZToKPj4+PiBPbiAxMC8wMi8yMDIwIDEwOjI4LCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+Pj4gT24gMTAuMDIuMjAyMCAxMDo0NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4gUGxl
YXNlIHN1Z2dlc3QgYSBuZXcgbmFtZSBmb3IgQklUX1dPUkQoKSBhbmQgd2UgY2FuIHJlcHVycG9z
ZSBpdC4gU28KPj4+Pj4+IGZhciwgSSBoYXZlIG5vIGlkZWEgaG93IHRvIHJlbmFtZSBpdC4KPj4+
Pj4KPj4+Pj4gX0JJVF9XT1JEKCkgaWYgeW91L3dlIHdlcmUgdG8gYWNjZXB0IHRoZSBuYW1lIHNw
YWNlIHZpb2xhdGlvbiwgb3IKPj4+Pj4gQklUTUFQX1dPUkQoKT8KPj4+Pgo+Pj4+IEJJVE1BUF9X
T1JEKCkgaXMgbWlzbGVhZGluZyBhcyBiaXRtYXAgYXJlIHVzaW5nIHVuc2lnbmVkIGxvbmcuIFNv
IG15Cj4+Pj4gcHJlZmVyZW5jZSBpcyBfQklUX1dPUkQoKS4KPj4+Pgo+Pj4+IEFub3RoZXIgYWx0
ZXJuYXRpdmUgd291bGQgYmUgQVRPTUlDX1dPUkQoKS4KPj4+Cj4+PiBFeGNlcHQgdGhhdCB0aGVy
ZSBhcmUgYWxzbyBub24tYXRvbWljIGJpdG1hcCBvcGVyYXRpb25zLCBJIGRvbid0IHJlYWxseQo+
Pj4gY2FyZSBhYm91dCB0aGUgbmFtZSBhcyBsb25nIGFzIGl0J3Mgbm90IEJJVF9XT1JEKCkgKG9y
IGFueXRoaW5nIGVsc2UKPj4+IHRoYXQncyBsaWtlbHkgdG8gY29sbGlkZSB3aXRoIG90aGVyIHN0
dWZmLgo+Pgo+PiBJIGFtIGFmcmFpZCB3ZSBhcmUgZGlzYWdyZWluZyBvbiB3aGF0IGlzIGNvbGxp
ZGluZyB3aXRoIHdoYXQgaGVyZS4gVGhlCj4+IG5hbWluZyBvbiBBcm0gaGFzIGJlZW4gbGlrZSB0
aGF0IGZvciB0aGUgcGFzdCBmZXcgeWVhcnMuIFdoaWxlIHRoaXMgbWF5Cj4+IG5vdCBoYXZlIGJl
ZW4gdGhlIGJlc3QgY2hvaWNlLCB0aGlzIGlzIHlvdXIgc3VnZ2VzdGlvbiBjb2xsaWRpbmcgd2l0
aAo+PiB3aGF0IGlzIGV4aXN0aW5nLgo+IAo+IEl0IGlzIGEgcGxhaW4gaW1wb3J0IGZyb20gTGlu
dXggd2hpY2ggaGFzIHR1cm5lZCBvdXQgaW1wb3NzaWJsZQo+IGJlY2F1c2Ugb2YgdGhlIGNoYW5n
ZSB0aGF0IHdhcyBkb25lIGF0IHNvbWUgcG9pbnQgdG8gQXJtIGNvZGUKPiB3aGljaCwgSSBndWVz
cywgYWxzbyBvcmlnaW5hbGx5IGNhbWUgZnJvbSBMaW51eC4gVGhlcmUncyBubyBuZXcKPiBuYW1p
bmcgSSd2ZSBiZWVuIHN1Z2dlc3RpbmcgaGVyZSBhdCBhbGwuCgpXZSBuZXZlciBjbGFpbWVkIHdl
IHdvdWxkIGJlIGZ1bGx5IGNvbXBhdGlibGUgd2l0aCBMaW51eCBhbmQgSSBkb24ndCAKdGhpbmsg
d2UgY291bGQgZXZlcnkgY2xhaW0gaXQuIFBhcnRpY3VsYXJseSwgdGhlIGJpdG9wIG9wZXJhdGlv
bnMgYXJlIApkaWZmZXJlbnQgZ2l2ZW4gTGludXggYml0b3BzIGFyZSBiYXNlZCBvbiB1bnNpZ25l
ZCBsb25nLgoKVGhlIGJpdG9wIGRpZCBpbmRlZWQgY2FtZSBmcm9tIExpbnV4IG9yaWdpbmFsbHks
IGhvd2V2ZXIgd2UgaGFkIHRvIGFkYXB0IAp0aGVtIGJlY2F1c2UgTGludXggQXJtdjggYml0b3Ag
d2FzIGV4cGVjdGluZyA4LWJ5dGUgYWxpZ25lZC4gVGhpcyBkb2VzIApub3QgaG9sZCBvbiBYZW4u
Cgo+IAo+PiBJIGFtIG5vdCBlbnRpcmVseSBmdXNzZWQgYWJvdXQgdGhlIG5hbWVzcGFjZSB2aW9s
YXRpb24sIGFsdGhvdWdoIEkgdGhpbmsKPj4gdGhlIG5hbWUgaXMgcG90ZW50aWFsbHkgbWlzbGVh
ZGluZy4gWWV0LCBJIHdvdWxkIGJlIGhhcHB5IHRvIHVzZQo+PiBfQklUX1dPUkQoKSBhcyB0aGlz
IGlzIHRoZSBiZXN0IG9mIGl0IHNvIGZhci4KPj4KPj4gV2hpbGUgdGhpcyBpcyBjb2RlIGZhbGxz
IHVuZGVyIEFybSBtYWludGFpbmVyc2hpcCwgSSBhbSBzdGlsbCBoYXBweSB0bwo+PiBjb25zaWRl
ciBvdGhlciBuYW1pbmcuIEJ1dCBhdCB0aGlzIHBvaW50LCB5b3Ugc2hvdWxkIGJlIHRoZSBvbmUg
c3VnZ2VzdGluZy4KPiAKPiBCSVRfVU5JVCgpIG9yIEJJVE9QX1VOSVQoKSBvciBCSVRPUF9XT1JE
KCk/CgpCSVRPUF9XT1JEKCkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
