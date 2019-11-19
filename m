Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B92A0101B05
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWyTb-0008JX-AC; Tue, 19 Nov 2019 08:03:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+7wY=ZL=gmail.com=mingo.kernel.org@srs-us1.protection.inumbo.net>)
 id 1iWyTZ-0008JS-AT
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 08:03:05 +0000
X-Inumbo-ID: 02ed2f24-0aa3-11ea-b678-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02ed2f24-0aa3-11ea-b678-bc764e2007e4;
 Tue, 19 Nov 2019 08:03:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n1so22570351wra.10
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2019 00:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=otPQZRH+6W8OTih5WuGva2Q7E16vhxS8EaPb5+O6FFQ=;
 b=GN9yVJq7y2o4d00cNPKdV9KiYLC08L3bWhwTnQxtB0/q3EIszLWfgc2HIuIERhlBmb
 oDyGypURAy+C8tEHoqB2s+fsLqIyQzcBp0snBpGXzO9K8F5pb4735ATZme0c2MMOHfL/
 QsQ86oturWcKf2WczTnCRV6ypPIaDu1E54y4jC03se4HtCAtCk9uWHBO9CJ1jYIjR84Z
 hAbkqeWONMi1YTJAKZ56HqW1dBu4hOZKr3i+8Hx9pb6wYE40FHt/QTkEuEzONxI7JMom
 OvPmnB+QKSpJ1ek7Fbr9tNgyb02cHf0JszmAEbLVAVPFT5rSc2ztfkDPpoTuNZkps61B
 TO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=otPQZRH+6W8OTih5WuGva2Q7E16vhxS8EaPb5+O6FFQ=;
 b=DxatygpSYKuaWT4ssJW0v8cBUH18y0tHba0j7920tI95EIn8SQ0cuCPXBj00SGaZKH
 IcabEVqotQqvQNVjtwWsfHqzQTMq7vqvffKpMMFNehSDF5RgSRyPIofsyQOLLD+pwfbZ
 nBVT6wlvoDD9THgqtEKd48uNtiBZ5S6ku4lBwbQVJL1dT6QStHe8xc+e8vQlA8XV665x
 HOTRlEsv0smoiuuVgUOo0K6SWbSkH6zhqu0mDiT/5OdlrJzDcg/jkjmeLP6T+odgs+yG
 31kBvN9ZpZK3L3vvQI/s1IApEfXfhUioPSgIK35VFjOtaRqLqYM1611H93j7Y0Y8IREX
 LLUw==
X-Gm-Message-State: APjAAAVOQ0f+40TpFvblWrATJ1Uj0musssPMEfOxUe8u31ycI42O3SXH
 0Xbqt199ebUC4aEtJlfr4Qc=
X-Google-Smtp-Source: APXvYqyMuw3e4XtFLD8GIGjVGoR20VkgXKGYP1wIg3s6IxpKh8248ANFBfHyz8BEBXiaxPePOGpfLw==
X-Received: by 2002:adf:e506:: with SMTP id j6mr36254546wrm.19.1574150582918; 
 Tue, 19 Nov 2019 00:03:02 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
 by smtp.gmail.com with ESMTPSA id 5sm2063976wmk.48.2019.11.19.00.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 00:03:02 -0800 (PST)
Date: Tue, 19 Nov 2019 09:03:00 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191119080300.GA56452@gmail.com>
References: <0fad341f-b7f5-f859-d55d-f0084ee7087e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fad341f-b7f5-f859-d55d-f0084ee7087e@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v3] x86/stackframe/32: repair 32-bit Xen PV
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>, Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CiogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKCj4gT25jZSBhZ2FpbiBS
UEwgY2hlY2tzIGhhdmUgYmVlbiBpbnRyb2R1Y2VkIHdoaWNoIGRvbid0IGFjY291bnQgZm9yIGEK
PiAzMi1iaXQga2VybmVsIGxpdmluZyBpbiByaW5nIDEgd2hlbiBydW5uaW5nIGluIGEgUFYgWGVu
IGRvbWFpbi4gVGhlCj4gY2FzZSBpbiBGSVhVUF9GUkFNRSBoYXMgYmVlbiBwcmV2ZW50aW5nIGJv
b3QuIEFkanVzdCBCVUdfSUZfV1JPTkdfQ1IzCj4gYXMgd2VsbCB0byBndWFyZCBhZ2FpbnN0IGZ1
dHVyZSB1c2VzIG9mIHRoZSBtYWNybyBvbiBhIGNvZGUgcGF0aAo+IHJlYWNoYWJsZSB3aGVuIHJ1
bm5pbmcgaW4gUFYgbW9kZSB1bmRlciBYZW47IEkgaGF2ZSB0byBhZG1pdCB0aGF0IEkKPiBzdG9w
cGVkIGF0IGEgY2VydGFpbiBwb2ludCB0cnlpbmcgdG8gZmlndXJlIG91dCB3aGV0aGVyIHRoZXJl
IGFyZQo+IHByZXNlbnQgb25lcy4KPiAKPiBGaXhlczogM2M4OGM2OTJjMjg3ICgieDg2L3N0YWNr
ZnJhbWUvMzI6IFByb3ZpZGUgY29uc2lzdGVudCBwdF9yZWdzIikKPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gdjM6IE1vdmUgVVNFUl9TRUdN
RU5UX1JQTF9NQVNLIGRlZmluaXRpb24gdG8gc2VnbWVudC5oLiBGdXJ0aGVyIGV4cGxhaW4KPiAg
ICAgdGhlIEJVR19JRl9XUk9OR19DUjMgYWRqdXN0bWVudC4KPiB2MjogQXZvaWQgI2lmZGVmIGFu
ZCBhbHRlciBjb21tZW50IGFsb25nIHRoZSBsaW5lcyBvZiBBbmR5J3Mgc3VnZ2VzdGlvbi4KClNp
bmNlIHRoZSBicmVha2FnZSB3YXMgaW50cm9kdWNlZCBpbiB2NS4zLCBJJ3ZlIGFkZGVkIGEgQ2M6
IHN0YWJsZSBsaW5lLgoKVGhhbmtzLAoKCUluZ28KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
