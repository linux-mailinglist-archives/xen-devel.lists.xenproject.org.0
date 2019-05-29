Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E332E3FD
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 20:01:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW2qg-00024n-7t; Wed, 29 May 2019 17:58:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qhBv=T5=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hW2qe-00024i-Nf
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:58:48 +0000
X-Inumbo-ID: 67b5db61-823b-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 67b5db61-823b-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 17:58:47 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u27so2822988lfg.10
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2019 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BupX1ggpM7RQguwqP0vnrWGELAx5LUeDskzS2D3BGrg=;
 b=KREb0w6NIRmgzoiFgBVrvf2IjJnyO8CaCyjXIM9evQ0mYojRl2Y/TDac7iZclh8AGJ
 wmKRqJPuGbN5ESbY61WZQxG0Yy0YJA17UxBnYbs+Oik76Zg39i7cPI/A/qo1/FY1mdRM
 EcyIoIcIcjpX2mth4H0cjIfcp2Lw6X5eHm++7lE7nBWPqVCXU8AVQ53sTr6X7Y6QjHFi
 CxFyjiGZOxJc4NcC0UiVCun5Th7tZTXB/lRex+psWByuyHkYJJ4G3VVGpr2u5XdncLq1
 cw8Hci3G/XPuRSyVF2Tgf3H5vmxHMzaMwS9HInBlERCWZ/5/tz5fZxJWVmTrfZfV2g1J
 /FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=BupX1ggpM7RQguwqP0vnrWGELAx5LUeDskzS2D3BGrg=;
 b=npprWb+wiQNc4QJRP5TGGjgHzjuvOMtHUYIVagCAClGesyIZgUPYWYfPp72EhEn+U3
 J/o66DB5qYz1pZFDZEKjS+yJcrTaNpTf8SEYSpULFj0+ivl7z5Kjnlq1duD8eYCUNfmE
 /NJs6lw8HMgRLbNJosXl550jqQziHBcEzmcJgPZv5h1qvt0+YyC64UOmnN3eJ8Tnn+z5
 Gxd/5EcCRIMZEbtwmxdM6adYhz0u8YK5dH+u3oHzTtzTdSu0QbaebyBkRtYZHve6nXI0
 UK5ZqVteFcgxXbDMYK4XyrOiWRTxNXs+RTQPRpibKiHYQB/M+4y41Vjqg2uD4wi400h7
 oKwA==
X-Gm-Message-State: APjAAAXSFE1zFVV7QLFALBC6T1YOHfTA9gxicyPas7WMco3rBWsKIheR
 a3DttiGganClIePsArQSYAI=
X-Google-Smtp-Source: APXvYqzp9QO2ZSqB80+LTo0i8kKOCK+GOChIA2erQcFwo7uw64ixXkJlroA3/4xg/lzAty/M7uMcTA==
X-Received: by 2002:ac2:4899:: with SMTP id x25mr1422638lfc.44.1559152726088; 
 Wed, 29 May 2019 10:58:46 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id c17sm54539lfi.93.2019.05.29.10.58.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 10:58:45 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
References: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
 <1558460254-7127-3-git-send-email-olekstysh@gmail.com>
 <a35d398b-d2e9-9c80-8ac2-923a82c68019@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <fbb40b64-c23b-be02-2c56-f0e0bf47324b@gmail.com>
Date: Wed, 29 May 2019 20:58:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a35d398b-d2e9-9c80-8ac2-923a82c68019@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V1 2/2] xen/device-tree: Add ability to
 handle nodes with interrupts-extended prop
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDI5LjA1LjE5IDIwOjQ0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGksIEp1bGllbgoKCj4KPiBPbiAyMS8wNS8yMDE5IDE4OjM3LCBPbGVrc2FuZHIgVHlzaGNoZW5r
byB3cm90ZToKPj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hl
bmtvQGVwYW0uY29tPgo+Pgo+PiBUaGUgImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnR5IGlz
IGEgc3BlY2lhbCBmb3JtIGZvciB1c2Ugd2hlbgo+PiBhIG5vZGUgbmVlZHMgdG8gcmVmZXJlbmNl
IG11bHRpcGxlIGludGVycnVwdCBwYXJlbnRzLiA+Cj4+IEFjY29yZGluZyB0byB0aGU6Cj4KPiBO
SVQ6IHMvdGhlLy8KPgo+PiBMaW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvaW50ZXJydXB0cy50eHQgCj4+Cj4+Cj4+IEJ1dCwgdGhlcmUg
YXJlIGNhc2VzIHdoZW4gImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnR5IGlzIHVzZWQgZm9y
Cj4+ICJvdXRzaWRlIC9zb2Mgbm9kZSIgd2l0aCBhIHNpbmdsZSBpbnRlcnJ1cHQgcGFyZW50IGFz
IGFuIGVxdWl2YWxlbnQgb2YKPj4gcGFpcnMgKCJpbnRlcnJ1cHQtcGFyZW50IiArICJpbnRlcnJ1
cHRzIikuCj4+Cj4+IFRoZSBnb29kIGV4YW1wbGUgaGVyZSBpcyBBUkNIIHRpbWVyIG5vZGUgZm9y
IFItQ2FyIEdlbjMvR2VuMiBmYW1pbHksCj4KPiBOSVQ6IHMvVGhlL0EvIEkgdGhpbmsKPgo+PiB3
aGljaCBpcyBtYW5kYXRvcnkgZGV2aWNlIGZvciBYZW4gdXNhZ2Ugb24gQVJNLiBBbmQgd2l0aG91
dCBhYmlsaXR5Cj4+IHRvIGhhbmRsZSBzdWNoIG5vZGVzLCBYZW4gZmFpbHMgdG8gb3BlcmF0ZS4K
Pj4KPj4gU28sIHRoaXMgcGF0Y2ggYWRkcyByZXF1aXJlZCBzdXBwb3J0IGZvciBYZW4gdG8gYmUg
YWJsZSB0byBoYW5kbGUKPj4gbm9kZXMgd2l0aCB0aGF0IHByb3BlcnR5Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+Cj4KPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKVGhhbmsgeW91ISBJIGFzc3VtZSB5b3UgbWVhbnQgUmV2aWV3ZWQtYnk6IEp1bGll
biBHcmFsbCAKPGp1bGllbi5ncmFsbEBhcm0uY29tPiApCgpTaGFsbCBJIHNlbmQgbmV3IHZlcnNp
b24gd2l0aCBwcm9wb3NlZCBjaGFuZ2VzPwoKCj4KPiBJIHdpbGwgZ2l2ZSBhbiBvcHBvcnR1bml0
eSB0byBTdGVmYW5vIHRvIHJldmlldyBpdC4gSWYgSSBkb24ndCBoZWFyIAo+IGFueXRoaW5nIGJ5
IE1vbmRheSwgSSB3aWxsIG1lcmdlIGl0Lgo+Cj4gVGhhbmsgeW91IQo+Cj4gQ2hlZXJzLAo+Ci0t
IApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
