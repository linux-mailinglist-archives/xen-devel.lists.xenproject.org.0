Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57898A6575F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:07:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917341.1322288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCzu-00076i-6J; Mon, 17 Mar 2025 16:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917341.1322288; Mon, 17 Mar 2025 16:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuCzu-00073j-30; Mon, 17 Mar 2025 16:07:26 +0000
Received: by outflank-mailman (input) for mailman id 917341;
 Mon, 17 Mar 2025 16:07:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuCzt-00073Q-9Q
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:07:25 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8eddf4e-0349-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 17:07:23 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ff64550991so2717213a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:07:23 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30153519fefsm6256238a91.12.2025.03.17.09.07.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:07:21 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e8eddf4e-0349-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742227642; x=1742832442; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBROt8Wvg39oI6RJKUKBStbr1ifb9ytbzgO6Y+lRt3Q=;
        b=AthWKC3j3ZyhnvAwBBR51P2urNmEFhHYGU+BNqBHhJoIE+Xn1lBcPnScHKGx+c8gG6
         HuVbFS8AugRP4kq1XHjFPAgDYk8uzk1KVArztsjMgaQFfvw66LXT5ufZVG0dj3SryUJ6
         WW/BGzMH0+Y/GdrgQUqBmk9KnDKkxDVdkYoe9hmdQ7Tk1gU4vCuuHSZxDsxrVjzkbFeZ
         wPrhWLmC3Z4B8MnDZmihAkL6mDOhe9oTesOj8hM/b2U/LqPk/Y1G3Pl2/LBCW1DMzz8f
         K0U0NXXtWY1g5IUnYyuKn27Hlxvc2rsnE18fwTotmAEmyiPB7E8tuaRh7d6Skk9A6e+e
         08Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227642; x=1742832442;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBROt8Wvg39oI6RJKUKBStbr1ifb9ytbzgO6Y+lRt3Q=;
        b=WloQ2raYzhgieJr2Fpc0SyqoFhTaGkKvUWxgiP0n6uHCQCNfXrgGmcASkwtJimuJxU
         nf7h+T31Lhqpq+T6XX1qApXD9kp7qCWhtN23ZABq/w+vib8kAcADnFG6sIYFTziNhuZT
         aYyfou1EqMPWVvcebUULPTwhMhPaXkoEpppKf5duAVjRE8yqkJ44y6JbVXQMExX58/gE
         Ky2H8RDQc586//vLEhOaEfmavLUXoiD4vXhvPD+92Fl1oAzRGABCvqfvFIcy68vbQ+e1
         0ptyUiCQxSVWEhXtjWvGMAzDMzqw2yV1XiRckaRqP1osmZMeh8FbFVL+Tu88hZX7eXyo
         Lo5A==
X-Forwarded-Encrypted: i=1; AJvYcCVaCKqGYfHObvW3qxuUdBRN9cmsMDwjN39qSEigxFNwIy/v/JySGZA8oYb9W2RS7bnvhghjWHF1t9o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAdDWsyFEGxzq5ChtZ8H2ZjZ4yt2a1CklwgorAUKVEKX4/IklM
	I/xNPaRjXMJ6mxNaB76ZpCdHs+i/0OM1tVhmRhTKZsJvoJCtZ4YavxpeqZTi0GY=
X-Gm-Gg: ASbGncuDd7e8gyu7B/5QLtFVupvJVqyjxpZ8JXhSCWihs9F5Oc67e1z66LGHsa4od9d
	Gg5hfP3HWHJipWBvjGZfWNVdLkCSYNiMHk/6/26KfZJxf7WDTbwfnyQe50r+Az7iqEfPzBTNcEZ
	/8RFBVpkSwMJ/2YWOLB0qO8RkIqduveNS8N6m4XJs5J4OqaJpxwcdSb2oih9HJBDAPjVZBWUKEK
	LSx9JCtBnVMzM023ljAtoXigrsiorBdyP+rYgobcmpfX96jAvhLFsmGuAdVrJ0tMW1/92TYyl71
	/K2u1xY9eWHcmk7vKerAiMpegzEjvBSYoNI8l74K0AWUtDbLp97iBNsdNQ==
X-Google-Smtp-Source: AGHT+IGu7JBcnuWnMPBuU7hiTo93qu/WDWnwnWY6VP9EN/eE9EF8eTD0WKyIrv4I/zgNLAfNvjqk7A==
X-Received: by 2002:a17:90a:fc43:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-30151d3e018mr16040542a91.25.1742227641697;
        Mon, 17 Mar 2025 09:07:21 -0700 (PDT)
Message-ID: <edc3bc03-b34f-4bed-be0d-b0fb776a115b@linaro.org>
Date: Mon, 17 Mar 2025 09:07:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/17] exec/ram_addr: call xen_hvm_modified_memory only
 if xen is enabled
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Peter Xu <peterx@redhat.com>,
 alex.bennee@linaro.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anthony PERARD <anthony@xenproject.org>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <20250314173139.2122904-12-pierrick.bouvier@linaro.org>
 <ad7cdcaf-46d6-460f-8593-a9b74c600784@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <ad7cdcaf-46d6-460f-8593-a9b74c600784@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8xNy8yNSAwODo1MCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDE0LzMvMjUgMTg6MzEsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBSZXZpZXdlZC1i
eTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmc+DQo+PiAtLS0NCj4+ICAgIGluY2x1ZGUvZXhlYy9yYW1fYWRkci5oIHwgOCAr
KysrKystLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgg
Yi9pbmNsdWRlL2V4ZWMvcmFtX2FkZHIuaA0KPj4gaW5kZXggZjVkNTc0MjYxYTMuLjkyZTg3
MDhhZjc2IDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgNCj4+ICsr
KyBiL2luY2x1ZGUvZXhlYy9yYW1fYWRkci5oDQo+PiBAQCAtMzM5LDcgKzMzOSw5IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBjcHVfcGh5c2ljYWxfbWVtb3J5X3NldF9kaXJ0eV9yYW5nZShy
YW1fYWRkcl90IHN0YXJ0LA0KPj4gICAgICAgICAgICB9DQo+PiAgICAgICAgfQ0KPj4gICAg
DQo+PiAtICAgIHhlbl9odm1fbW9kaWZpZWRfbWVtb3J5KHN0YXJ0LCBsZW5ndGgpOw0KPj4g
KyAgICBpZiAoeGVuX2VuYWJsZWQoKSkgew0KPj4gKyAgICAgICAgeGVuX2h2bV9tb2RpZmll
ZF9tZW1vcnkoc3RhcnQsIGxlbmd0aCk7DQo+IA0KPiBQbGVhc2UgcmVtb3ZlIHRoZSBzdHVi
IGFsdG9nZXRoZXIuDQo+DQoNCldlIGNhbiBldmVudHVhbGx5IGlmZGVmIHRoaXMgY29kZSB1
bmRlciBDT05GSUdfWEVOLCBidXQgaXQgbWF5IHN0aWxsIGJlIA0KYXZhaWxhYmxlIG9yIG5v
dC4gVGhlIG1hdGNoaW5nIHN0dWIgZm9yIHhlbl9odm1fbW9kaWZpZWRfbWVtb3J5KCkgd2ls
bCANCmFzc2VydCBpbiBjYXNlIGl0IGlzIHJlYWNoZWQuDQoNCldoaWNoIGNoYW5nZSB3b3Vs
ZCB5b3UgZXhwZWN0IHByZWNpc2VseT8NCg0KPj4gKyAgICB9DQo+PiAgICB9DQoNCg==

