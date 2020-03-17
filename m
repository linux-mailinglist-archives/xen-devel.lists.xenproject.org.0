Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA129188875
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 16:00:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEDfx-0008IQ-5N; Tue, 17 Mar 2020 14:58:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5Yf1=5C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jEDfv-0008IJ-Uh
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:58:35 +0000
X-Inumbo-ID: c6808aa2-685f-11ea-a6c1-bc764e2007e4
Received: from mail-ed1-f43.google.com (unknown [209.85.208.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6808aa2-685f-11ea-a6c1-bc764e2007e4;
 Tue, 17 Mar 2020 14:58:35 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id i24so23041753eds.1
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 07:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nrDX6Y9lzc1EMptHhs2tuuw0Rl4hZXr6Dme+dAnCCYM=;
 b=I60yJq/TAKI4PauL/guM3iiO4iY/fSBhRjR+2OTRT/pKCz3itNc1qZa0WakDA/7k+X
 QFbGVaYDoACjoNdBfJ7Z0iMU6pHVNy58kmGLcwlg6xJ1bMayKPFB/Kwjl4YA66gqCoFt
 gcvQBd9de3+o95pEHiW6kBKbCZjpz8axWBSy8DzdfrEQZj75UPDcifaGN9NVb8tfzQr0
 H66fkQAH/GNm8q9Rq2SWKXK7gi3VfHtSwdYf1UbvofXC91LsKL5/39pfu2BqekmQ1ZkG
 EeDd7WGqWdubR8CrwCZHLEzdh3gpjfv4BrkBKiib1iQuQW75aiJREjanHo2ySkmZO6rB
 2ZeQ==
X-Gm-Message-State: ANhLgQ23+iNqeF2iTSWFTp3aakXE8cR5g9hiX+2oyTliAhC7sTWwQyci
 0oQ+luS/TpW+6KIAeiQroDc=
X-Google-Smtp-Source: ADFU+vtsJn9FnHzJtpt1qp9teEWs3b1PWfh1BotOdXrsEtAVzpWrg8HTFx5mPmjbNlFn/762M5Ru7g==
X-Received: by 2002:a17:906:459:: with SMTP id
 e25mr4559287eja.331.1584457114624; 
 Tue, 17 Mar 2020 07:58:34 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-224.amazon.com.
 [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id x62sm209524ede.55.2020.03.17.07.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2020 07:58:34 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c50fc4e8-cb96-74a1-de2b-9e83e609db1c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2914540e-e102-700e-9303-1ff04a80c246@xen.org>
Date: Tue, 17 Mar 2020 14:58:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c50fc4e8-cb96-74a1-de2b-9e83e609db1c@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 0/2] libfdt: eliminate UB pointer validation
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

SGkgSmFuLAoKT24gMTMvMDMvMjAyMCAwNzozMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlIG90
aGVyIGRheSwgaW4gdGhlIGNvbnRleHQgb2Ygd2hhdCBpcyBub3cgY2YzOGI0OTI2ZTJiICgieG1h
bGxvYzoKPiBndWFyZCBhZ2FpbnN0IGludGVnZXIgb3ZlcmZsb3ciKSwgQW5kcmV3IGhhZCBzdWdn
ZXN0ZWQgdG8gbG9vayBpbnRvCj4gdXNpbmcgZ2NjJ3MgX19idWlsdGluXypfb3ZlcmZsb3coKS4g
VGhlIGZ1bmN0aW9ucyBkb24ndCBsZW5kIHRoZW1zZWx2ZXMKPiB0byBiZSB1c2VkIHRoZXJlIHdp
dGggdGhlIGxvZ2ljIGN1cnJlbnRseSBpbiBwbGFjZSAoYWxiZWl0IHdlIG1heSBzdGlsbAo+IHdh
bnQgdG8gY29uc2lkZXIgYWRqdXN0bWVudHMgdGhlcmUpLCBidXQgSSB0aGVuIHdlbnQgb24gdG8g
c2VlIHdoZXRoZXIKPiB3ZSBoYXZlIGFueSBvdGhlciBvdmVyZmxvdyBjaGVja3Mgd2FudGluZyBj
b252ZXJzaW9uLiBPbmUgdGhpbmcgSQo+IG5vdGljZWQgd2FzIHRoYXQgZm9yIHVuc2lnbmVkIGlu
dGVnZXIgYXJpdGhtZXRpYyB0aGUgY29tcGlsZXIgbm9ybWFsbHkKPiBkb2VzIGZpbmUgcmVjb2du
aXppbmcgdGhlIGludGVudCB3aXRob3V0IHVzaW5nIHRoZSBidWlsdGlucy4gQW5kIHdoaWxlCj4g
SSBkaWRuJ3QgdG8gc3BvdCBhbnkgc2lnbmVkIGludGVnZXIgb3ZlcmZsb3cgY2hlY2tzICh3aGlj
aCBsaWtlbHkKPiB3b3VsZCBoYXZlIGJlZW4gVUIgYW55d2F5KSwgSSBkaWQgc3BvdCB0d28gaW4g
bGliZmR0LiBBZnRlciBmaWd1cmluZwo+IG91dCB3aGVyZSBleGFjdGx5IHRoYXQgY29kZSB3YXMg
dGFrZW4gZnJvbSwgSSBzcG90dGVkIGEgZml4IGZvciBvbmUgb2YKPiB0aGUgdHdvIGluIHRoZSB1
cHN0cmVhbSByZXBvLCBhbmQgSSBzdWJtaXR0ZWQgYSBmaXggZm9yIHRoZSBvdGhlciBvbmUKPiB0
aGVyZSBmaXJzdC4gSGVyZSBhcmUgdGhlIGJhY2twb3J0cyB0aGVyZW9mLCBhcyBJIGRvbid0IG15
c2VsZiB3YW50IHRvCj4gZ2V0IGludG8gdGhlIGJ1c2luZXNzIG9mIGJ1bXBpbmcgdGhlIGxpYmZk
dCB2ZXJzaW9uIGluIG91ciByZXBvLgoKT3VyIHZlcnNpb24gb2YgbGliZmR0IGlzIG5vdyA3IHll
YXJzIG9sZC4gV2Ugc2hvdWxkIHByb2JhYmx5IGxvb2sgYXQgCnVwZ3JhZGluZyB0byB0aGUgbGF0
ZXN0IG9uZS4KCkkgd2lsbCBhZGQgaXQgaW4gbXkgVE9ETyBsaXN0LgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
