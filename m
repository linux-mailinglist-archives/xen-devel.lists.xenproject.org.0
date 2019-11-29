Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3C610D6F7
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:26:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahAy-0001Ib-1G; Fri, 29 Nov 2019 14:23:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=z6ZB=ZV=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iahAw-0001IT-UK
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:23:14 +0000
X-Inumbo-ID: c54d743a-12b3-11ea-83b8-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c54d743a-12b3-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 14:23:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i12so35491365wro.5
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2019 06:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uTWL6k7qrzK0sFXODqeEkCnV/tm849Fs5FSMI5GR33o=;
 b=uchvZS4QTIhftEhMnr2jPqM8328ab3kfveBp6YZqK2ODxgjkH1bQBzSFCyLkbnEymH
 dgzS89YfESeluNM+AoE5CECdQejHsXgfCTPyWZrHVI7DdUDBDhDPAHOKnuluK/DV5QKu
 iulfgLozzt9aZOGZUw6bMelL2UKoav64XdstQplF2iPW9NQxQqeA03jTj7HfYTXRz41Q
 Ap8eob8+agBs02CMZdGuRbiu28jrgR33hhiFzbx/I8OMOYUKoI+XJKAQSXrrOz2Tgg+t
 hYUp3/NhOUorPEndDX8NMuEI9rQcScRlqB9bmhvI1LHvNzAiDpXlvai6TrqKY/Vlr+zi
 t4pA==
X-Gm-Message-State: APjAAAV4tF4sriwfXxqa3eoJKVET+dh4xxBk5W6jo7jrU+uFuyusrsZO
 V05ggmkeG+8Vcfr33/VBdxU=
X-Google-Smtp-Source: APXvYqydIel0GgBr0BAtTR1v3bRR0AW2XIA+L5+08qhtcxgxTO1S3x5PlkHu0zIFIM4rpHCJAoZqpw==
X-Received: by 2002:adf:e312:: with SMTP id b18mr57842053wrj.203.1575037390360; 
 Fri, 29 Nov 2019 06:23:10 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id i10sm13843126wru.16.2019.11.29.06.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2019 06:23:09 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <909ca24b-e673-e786-06b4-c8877288248b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4a78e8a5-c2f7-5b25-f5a0-46a9b4e14238@xen.org>
Date: Fri, 29 Nov 2019 14:23:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <909ca24b-e673-e786-06b4-c8877288248b@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] console: avoid buffer overrun in
 guest_console_write()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyOS8xMS8yMDE5IDE0OjE1LCBKYW4gQmV1bGljaCB3cm90ZToKPiBjb25yaW5nX3B1
dHMoKSBoYXMgYmVlbiByZXF1aXJpbmcgYSBudWwtdGVybWluYXRlZCBzdHJpbmcsIHdoaWNoIHRo
ZQo+IGxvY2FsIGtidWZbXSBkb2Vzbid0IGdldCBzZXQgZm9yIGFueW1vcmUuIEFkZCBhIGxlbmd0
aCBwYXJhbWV0ZXIgdG8gdGhlCj4gZnVuY3Rpb24sIGp1c3QgbGlrZSB3YXMgZG9uZSBmb3Igb3Ro
ZXJzLCB0aHVzIGFsbG93aW5nIGVtYmVkZGVkIG51bCB0bwo+IGFsc28gYmUgcmVhZCB0aHJvdWdo
IFhFTl9TWVNDVExfcmVhZGNvbnNvbGUuCj4gCj4gV2hpbGUgdGhlcmUgZHJvcCBhIHN0cmF5IGNh
c3Q6IEJvdGggb3BlcmFuZHMgb2YgLSBhcmUgYWxyZWFkeSB1aW50MzJfdC4KPiAKPiBGaXhlczog
ZWE2MDFlYzk5OTViICgieGVuL2NvbnNvbGU6IFJld29yayBIWVBFUkNBTExfY29uc29sZV9pbyBp
bnRlcmZhY2UiKQoKU29ycnkgYWdhaW4gOiguCgo+IFJlcG9ydGVkLWJ5OiBKw7xyZ2VuIEdyb8Of
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
