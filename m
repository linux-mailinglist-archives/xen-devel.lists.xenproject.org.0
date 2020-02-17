Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92848161D27
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 23:06:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3oVM-0002nW-J4; Mon, 17 Feb 2020 22:04:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYIl=4F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j3oVL-0002nR-6B
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 22:04:39 +0000
X-Inumbo-ID: 7d1d81ac-51d1-11ea-808d-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d1d81ac-51d1-11ea-808d-12813bfff9fa;
 Mon, 17 Feb 2020 22:04:38 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so815924wmc.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2020 14:04:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X18ZRiPTLAigiIzzKWwDZdaINNpib+w0BPKagwYuHaQ=;
 b=VBbGHjTiS0pnbJ988Xti1FQk+JANaYLDta9kHW7N5qBcQVriiqb2RPBHzTaiLVt7G7
 KDAQFYoRS3EmG2iD2Ht4ykHEsUQCKZ8jyNDtWHOuebF8X7bJNvfUOegaaOmHZqWdGvEn
 zHVcOuMTUtDKlkkizNPVBdYU2M+3G+Q1LyKdO/22yxIgImRFxBuUitadBjiXQbosv6QW
 Qk0ElzbmZruWCOIEGloPLObRTL3Kkt9BAJpykUyUX7CI8lNGZvPgRsXkrUKenIjwgugi
 p0mEB8FsmIqhXCvyORgUzIAXL2QW6Gh9ZFiPoqhBYd30u/irMPK8ny3QA9g+M9jk70/t
 RtOw==
X-Gm-Message-State: APjAAAVg9LNNobekqzPK0vRbqhu81ZP5AY4XMETDdKXYNr3dNu3MKf8d
 LkT2EW1fXk4NHVKsuBoWmvE=
X-Google-Smtp-Source: APXvYqxUgIfN1nqjulUjBeW6q0DQfm2C4cwz3WBSjAlofFCVTCegcn/MfOAsrleG/Z5COZgydTosHQ==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr1009529wme.28.1581977077428; 
 Mon, 17 Feb 2020 14:04:37 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-226.amazon.com.
 [54.240.197.226])
 by smtp.gmail.com with ESMTPSA id j65sm967706wmb.21.2020.02.17.14.04.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 14:04:36 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20200203165812.21089-1-julien@xen.org>
 <81beb0ad-abcd-6413-3b8e-490cd9ab12ee@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c5258389-62ae-dd5b-b405-b60cb452b476@xen.org>
Date: Mon, 17 Feb 2020 22:04:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <81beb0ad-abcd-6413-3b8e-490cd9ab12ee@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/x86: p2m: Don't initialize slot 0 of
 the P2M
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKT24gMDYvMDIvMjAyMCAxMjowOCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBP
biAyLzMvMjAgNDo1OCBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBGcm9tOiBKdWxpZW4gR3Jh
bGwgPGpncmFsbEBhbWF6b24uY29tPgo+Pgo+PiBJdCBpcyBub3QgZW50aXJlbHkgY2xlYXIgd2h5
IHRoZSBzbG90IDAgb2YgZWFjaCBwMm0gc2hvdWxkIGJlIHBvcHVsYXRlZAo+PiB3aXRoIGVtcHR5
IHBhZ2UtdGFibGVzLiBUaGUgY29tbWl0IGludHJvZHVjaW5nIGl0IDc1OWFmOGUzODAwICJbSFZN
XQo+PiBGaXggNjQtYml0IEhWTSBkb21haW4gY3JlYXRpb24uIiBkb2VzIG5vdCBjb250YWluIG1l
YW5pbmdmdWwKPj4gZXhwbGFuYXRpb24gZXhjZXB0IHRoYXQgaXQgd2FzIG5lY2Vzc2FyeSBmb3Ig
c2hhZG93Lgo+Pgo+PiBBcyB3ZSBkb24ndCBzZWVtIHRvIGhhdmUgYSBnb29kIGV4cGxhbmF0aW9u
IHdoeSB0aGlzIGlzIHRoZXJlLCBkcm9wIHRoZQo+PiBjb2RlIGNvbXBsZXRlbHkuCj4+Cj4+IFRo
aXMgd2FzIHRlc3RlZCBieSBzdWNjZXNzZnVsbHkgYm9vdGluZyBhIEhWTSB3aXRoIHNoYWRvdyBl
bmFibGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24u
Y29tPgo+IAo+IFNpbmNlIG5vYm9keSBrbm93cyB3aHkgaXQncyBoZXJlLCBhbmQgaXQgZG9lc24n
dCBsb29rIGxpa2UgaXQgc2hvdWxkCj4gaGF2ZSBhbnkgZWZmZWN0Ogo+IAo+IEFja2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpUaGFuayB5b3UhIEkgaGF2
ZSBub3cgY29tbWl0dGVkIHRoZSBwYXRjaC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
