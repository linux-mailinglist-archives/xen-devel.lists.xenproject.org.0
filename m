Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A0E121B08
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 21:44:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igxBZ-0006jl-OC; Mon, 16 Dec 2019 20:41:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v9dV=2G=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1igxBY-0006je-3i
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 20:41:44 +0000
X-Inumbo-ID: 73345026-2044-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73345026-2044-11ea-88e7-bc764e2007e4;
 Mon, 16 Dec 2019 20:41:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id b19so721006wmj.4
 for <xen-devel@lists.xenproject.org>; Mon, 16 Dec 2019 12:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4LEUOClJGFBZXXimsbAlWTuczz0gXm2nGBL4FN9Bv/4=;
 b=rLigxVGVqWLFgcB5/polXIvNgY6/uMy0zJAbYNFozF/tzEbL4WmeybK0Mm1Hkft4u+
 MkE/HYaBpPXyetAIdgYWyR7saKJRT1e1sxA8TTu5HdpjasIxuOKwPwrwR9Eos2LHsDjt
 Dw2Dr51//pJKUo+7zwlZLdJp1MUtAqr1IGDEDqM1spEW8tA2LgO0RQuL71UIri3n3Rph
 lxlXpCXw7M/oBW0bKPpn4LV+hhH3E0xF69t6EnRQZxprIMkEF0GxYLnjvM+vFJ6WjbNn
 RvqvQ8Ngp1/6hH1+Harrj93XGFmhTeS1laeFg6WPhhm0QHDuyyi4yCsJZOX71BA9ESd6
 R4ZQ==
X-Gm-Message-State: APjAAAX5kaIEjF1A5BW2s2npX81OnuRMnFd9UifRbjaU7MyEsnyYsPeY
 XDrR2NiiYzPgoWKMsNtX2C4=
X-Google-Smtp-Source: APXvYqxbj7wa/3nG3xbSmpvEUqc+RDkNVQ++hJser00UJyvc40nYH9YoURVBkO0nn1m04737kSMJDA==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr924437wmj.105.1576528894763;
 Mon, 16 Dec 2019 12:41:34 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id f1sm23611224wrp.93.2019.12.16.12.41.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Dec 2019 12:41:34 -0800 (PST)
To: Pavel Tatashin <pasha.tatashin@soleen.com>, jmorris@namei.org,
 sashal@kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com,
 will@kernel.org, steve.capper@arm.com, linux-arm-kernel@lists.infradead.org,
 maz@kernel.org, james.morse@arm.com, vladimir.murzin@arm.com,
 mark.rutland@arm.com, tglx@linutronix.de, gregkh@linuxfoundation.org,
 allison@lohutok.net, info@metux.net, alexios.zavras@intel.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 stefan@agner.ch, yamada.masahiro@socionext.com,
 xen-devel@lists.xenproject.org, linux@armlinux.org.uk,
 andrew.cooper3@citrix.com
References: <20191204232058.2500117-1-pasha.tatashin@soleen.com>
 <20191204232058.2500117-3-pasha.tatashin@soleen.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b3a6359a-e7df-b47b-f50d-31b716fae191@xen.org>
Date: Mon, 16 Dec 2019 20:41:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191204232058.2500117-3-pasha.tatashin@soleen.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v4 2/6] arm/arm64/xen: use C inlines for
 privcmd_call
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpPbiAwNC8xMi8yMDE5IDIzOjIwLCBQYXZlbCBUYXRhc2hpbiB3cm90ZToKPiBwcml2
Y21kX2NhbGwgcmVxdWlyZXMgdG8gZW5hYmxlIGFjY2VzcyB0byB1c2Vyc3BhY2UgZm9yIHRoZQo+
IGR1cmF0aW9uIG9mIHRoZSBoeXBlcmNhbGwuCj4gCj4gQ3VycmVudGx5LCB0aGlzIGlzIGRvbmUg
dmlhIGFzc2VtYmx5IG1hY3Jvcy4gQ2hhbmdlIGl0IHRvIEMKPiBpbmxpbmVzIGluc3RlYWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogUGF2ZWwgVGF0YXNoaW4gPHBhc2hhLnRhdGFzaGluQHNvbGVlbi5j
b20+Cj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KClJldmlld2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
