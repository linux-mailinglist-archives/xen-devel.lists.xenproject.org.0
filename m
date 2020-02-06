Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188D1542EB
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 12:18:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izf9P-0007fB-HE; Thu, 06 Feb 2020 11:16:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VSBF=32=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1izf9N-0007f0-9w
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 11:16:49 +0000
X-Inumbo-ID: 2a1a79a4-48d2-11ea-af37-12813bfff9fa
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a1a79a4-48d2-11ea-af37-12813bfff9fa;
 Thu, 06 Feb 2020 11:16:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id p9so5880349wmc.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 03:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L3TjmEDbBxfTzLYSfJO13COPLeqBH2B7A8eek6+1C8I=;
 b=qORprRKAAgiMjBIZiDWt8H3+CjUSRol5BRdHOBfTJSS0txq18p8TNx6adv4L+syadS
 iV6Om1CPb6M+8KSyGmwnSoAhM+P97ZWuCyWwLcz/3PAVM5YFftpyZlYtsAOgdL74MYKy
 lzSA8p5oioF/4csDm9OSJq/MJIO8Gxbp3URTUU+uvgqcbondt8LDrxoyplyB5FPlWre/
 LoVpV1i7Yt4KYenHEH55hWgoPJ4i0S7CzWE5emrlrbAmqflXuVEnkkH6qj/GQKRIKYty
 gbe/H5sr8jtiDUedKLtnEK27gI1SDY0Ihj7jtn7b8EqQ4TlsF91l+vmO6WR/IBOizBCe
 VMWg==
X-Gm-Message-State: APjAAAUIbbGwU+53qAPfENGxvQoAkjL6yp2AEXSS4VcIxfBTUZ9ZlpFM
 0dTZ5mKzeT0n9uSVXZSix3FXXpVBC5A=
X-Google-Smtp-Source: APXvYqxNpIf0HRFAPqOPTgaclyubpP0CgdqM1X9iwL2ASyDoPDhOMcu4n4lDUoIyyPsiNM430qpVVA==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr3887613wml.44.1580987807159;
 Thu, 06 Feb 2020 03:16:47 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id r1sm3701914wrx.11.2020.02.06.03.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 03:16:46 -0800 (PST)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200206103833.15355-1-julien@xen.org>
 <d30a9c1b478c4e3a8b082fa625c8989a@EX13D32EUC003.ant.amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0fb52abc-1a41-ab91-9c74-6f0913092a02@xen.org>
Date: Thu, 6 Feb 2020 11:16:45 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d30a9c1b478c4e3a8b082fa625c8989a@EX13D32EUC003.ant.amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] xen/mm: Avoid assuming the page is inuse
 in assign_pages()
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
Cc: "Grall, Julien" <jgrall@amazon.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF1bCwKCk9uIDA2LzAyLzIwMjAgMTA6NTIsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhl
bi5vcmc+Cj4+IFNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjAgMTA6MzkKPj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzoganVsaWVuQHhlbi5vcmc7IER1cnJhbnQsIFBhdWwg
PHBkdXJyYW50QGFtYXpvbi5jby51az47IEdyYWxsLCBKdWxpZW4KPj4gPGpncmFsbEBhbWF6b24u
Y29tPgo+PiBTdWJqZWN0OiBbUEFUQ0ggdjJdIHhlbi9tbTogQXZvaWQgYXNzdW1pbmcgdGhlIHBh
Z2UgaXMgaW51c2UgaW4KPj4gYXNzaWduX3BhZ2VzKCkKPj4KPj4gRnJvbTogSnVsaWVuIEdyYWxs
IDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4KPj4gQXQgdGhlIG1vbWVudCwgYXNzaWduX3BhZ2VzKCkg
b24gdGhlIHBhZ2UgdG8gYmUgaW51c2UgKFBHQ19zdGF0ZV9pbnVzZSkKPj4gYW5kIHRoZSBzdGF0
ZSB2YWx1ZSB0byBiZSAwLgo+Pgo+PiBIb3dldmVyLCB0aGUgY29kZSBtYXkgcmFjZSB3aXRoIHRo
ZSBwYWdlIG9mZmxpbmluZyBjb2RlIChzZWUKPj4gb2ZmbGluZV9wYWdlKCkpLiBEZXBlbmRpbmcg
b24gdGhlIG9yZGVyaW5nLCB0aGUgcGFnZSBtYXkgYmUgaW4gb2ZmbGluaW5nCj4+IHN0YXRlIChQ
R0Nfc3RhdGVfb2ZmbGluaW5nKSBiZWZvcmUgaXQgaXMgYXNzaWduZWQgdG8gYSBkb21haW4uCj4+
Cj4+IE9uIGRlYnVnIGJ1aWxkLCB0aGlzIG1heSByZXN1bHQgdG8gaGl0IHRoZSBhc3NlcnQgb3Ig
anVzdCBjbG9iYmVyIHRoZQo+PiBzdGF0ZS4gT24gbm9uLWRlYnVnIGJ1aWxkLCB0aGUgc3RhdGUg
d2lsbCBnZXQgY2xvYmJlcmVkLgo+Pgo+PiBJbmNpZGVudGFsbHkgdGhlIGZsYWcgUEdDX2Jyb2tl
biB3aWxsIGdldCBjbG9iYmVyZWQgYXMgd2VsbC4KPj4KPj4gR3JhYiB0aGUgaGVhcF9sb2NrIHRv
IHByZXZlbnQgYSByYWNlIHdpdGggb2ZmbGluZV9wYWdlKCkgYW5kIGtlZXAgdGhlCj4+IHN0YXRl
IGFuZCBicm9rZW4gZmxhZyBhcm91bmQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVGhpcyBzZWVtcyBsaWtlIGEgcmVhc29uYWJsZSBj
aGFuZ2UuIEkgZ3Vlc3MgaGF2aW5nIGFzc2lnbl9wYWdlcygpIHRha2UgdGhlIGdsb2JhbCBsb2Nr
IGlzIG5vIG1vcmUgcHJvYmxlbSB0aGFuIGl0cyBleGlzdGluZyBjYWxsIHRvIGRvbWFpbl9hZGp1
c3RfdG90X3BhZ2VzKCkgd2hpY2ggYWxzbyB0YWtlcyB0aGUgc2FtZSBsb2NrLgoKVGhhdCdzIG15
IHVuZGVyc3RhbmRpbmcuIFN1bW1hcml6aW5nIG91ciBkaXNjdXNzaW9uIElSTCBmb3IgdGhlIG90
aGVyLCAKaXQgaXMgbm90IGNsZWFyIHdoZXRoZXIgdGhlIGxvY2sgaXMgZW5vdWdoIGhlcmUuCgog
RnJvbSBteSB1bmRlcnN0YW5kaW5nIHRoZSBzZXF1ZW5jZQoKcGdbaV0uY291bnRfaW5mbyAmPSAu
Li47CnBnW2ldLmNvdW50X2luZm8gfD0gLi4uOwoKY291bGQgcmVzdWx0IHRvIG11bHRpcGxlIHJl
YWQvd3JpdGUgZnJvbSB0aGUgY29tcGlsZXIuIFdlIGNvdWxkIHVzZSBhIApzaW5nbGUgYXNzaWdu
bWVudCwgYnV0IEkgc3RpbGwgZG9uJ3QgdGhpbmsgdGhpcyBwcmV2ZW50IHRoZSBjb21waWxlciB0
byAKYmUgdXNlIG11bHRpcGxlIHJlYWQvd3JpdGUuCgpUaGUgY29uY2VybiB3b3VsZCBiZSBhIHJh
Y2Ugd2l0aCBnZXRfcGFnZV9vd25lcl9hbmRfcmVmZXJlbmNlKCkuIElmIDEgaXMgCnNldCBiZWZv
cmUgdGhlIHJlc3Qgb2YgdGhlIGJpdHMsIHRoZW4geW91IG1heSBiZSBhYmxlIHRvIGdldCB0aGUg
cGFnZS4KClNvIEkgbWlnaHQgd2FudCB0byB1c2Ugd3JpdGVfYXRvbWljKCkgYmVsb3cuIEFueSBv
cGluaW9uPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
