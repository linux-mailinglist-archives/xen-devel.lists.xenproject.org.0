Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6E5A5C558
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908303.1315437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Il-0007Wg-69; Tue, 11 Mar 2025 15:13:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908303.1315437; Tue, 11 Mar 2025 15:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Il-0007UG-3K; Tue, 11 Mar 2025 15:13:51 +0000
Received: by outflank-mailman (input) for mailman id 908303;
 Tue, 11 Mar 2025 15:13:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts1Ik-0007UA-6F
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:13:50 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eb26724-fe8b-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 16:13:49 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-22401f4d35aso100406775ad.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:13:49 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736cb466a6csm5505816b3a.165.2025.03.11.08.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:13:47 -0700 (PDT)
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
X-Inumbo-ID: 6eb26724-fe8b-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741706028; x=1742310828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86STdfu7sbDSkiwCii3eDdimSERy6/v6Vuyj4krzCSs=;
        b=wEJCeV2ARs29RrMTUo8sOyxnQM5w542bFfWw727wklWR8ti0iPY/ez8nM9tbHoTWZO
         AD+1+qgjNhtg6VcEBZcGIIYM5kerAYFdHuHonxMkbBRC0U7OX0gCmQvr2qVhkzCTP/0j
         9yKAdbS2Llr9pROXwTxyswuU7n7UcDhFkFgYzkFn+JgO7VVnvnatUUsZ8Fn9St7ZkDNB
         C9U1gv88ZtF8w2r8LvxMjxd1n2d/8Xi1pW5nsDG6mk4041aRd6AFWF+bXF9tmH1qsHDy
         h7AV9ZtaHK9RQKU+xBECNfc15W6rWQRoNXlXXBeIBavYXA65VqYemo9R3+Ah31ZEifEL
         BrHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706028; x=1742310828;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86STdfu7sbDSkiwCii3eDdimSERy6/v6Vuyj4krzCSs=;
        b=OzOE5HmNtNEHp5t2pLBHvIHJPkWTufQVyI7T5ixW2anloZ0ndbieTCmDFXqXbu+bj2
         KOPaWU4BZer8HZA5rEKedgJcmeOWeTOwGPMuMphXH5Za6EqXWQUYIo+EHa5HVfHjKUZc
         j16pgIBo4vtQUFql1idQQMT6Nj6xeJNV1zlxFZvqZ5ElyFj8ZVtyLQx0tAyemuQgRoCR
         dbgNCShmZZMd1bBSXYqHJU/JJan0RQ8Qp9pJ7++JTRBc7mFjiO+M7LXK4oRwJk8dzAHC
         ZPyxd6gU2hJZxAgfd3+fxYgYSb8ekN8S+Rmf1adeWxDBbuT00H9TxCWfonm1D1mqFfcJ
         CCNg==
X-Forwarded-Encrypted: i=1; AJvYcCX1hM22ig7HQe8x1bdvrWLN+ruhzi0M5MZIpni1uqhNcOYe8+mxaC3bnGc1DmAR/uMw38foYcxCK8I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzXzfm5zEh5v0bzXxV9X1kP6MQcmh+ZSfcYRNpf0PoC/XUkk8qT
	SD8VLwhYuvOs9Gqd0TDWI9BH2k1UHmNdsUhJFdbNrtCod3wTGvCrhvJNSjYOq9w=
X-Gm-Gg: ASbGnctKpjEb/DLi/UnRjsPRBXxJZokbM8CEkeMWYkZ482AZJmOOJSedYbxUDkUhzE5
	5IaNeVWpIFjKGvJzqppA8dfqVHlndcDrs3Uq4Cnacyf8wAQsWyi5a/p9iJRc8qzVcRkRc7kZjyu
	QK4MB3NLEbM/3/DFgRNd0+OZM6xVWutxXYgdZ06rP2bUj3Cp7ONjfH+G0d0dgwxhaOq1jN9jSkT
	Tr2TymOOC/JittlRTg7V7v+GRQtdPrA9b063I2squEKpdy3sKnlmSb69XOMpVYhvEwsukJLQDsC
	I3wCevo+sBJ5/nAwlCp+eKR6MTGpG7szOEbB3jKolUXYaNO1JHFRfjEOAg==
X-Google-Smtp-Source: AGHT+IEZ5MBTaCdyWT08MqOAa8+LxkV8QowtXuqs/UZhCfCdiX14jnvavHT21U00/SV+pE0VLr2heQ==
X-Received: by 2002:a05:6a00:10d5:b0:736:47a5:e268 with SMTP id d2e1a72fcca58-736eb7b363bmr5355533b3a.1.1741706027670;
        Tue, 11 Mar 2025 08:13:47 -0700 (PDT)
Message-ID: <72e938d4-fb4e-4be4-9a34-7b0321ee2554@linaro.org>
Date: Tue, 11 Mar 2025 08:13:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/16] exec/memory-internal: remove dependency on cpu.h
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-9-pierrick.bouvier@linaro.org>
 <9f92a783-3826-4a06-9944-0e0ec5faccc9@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <9f92a783-3826-4a06-9944-0e0ec5faccc9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8xMS8yNSAwMDoyNiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDExLzMvMjUgMDU6MDgsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBSZXZpZXdlZC1i
eTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmc+DQo+IA0KPiBNaXNzaW5nIHRoZSAid2h5IiBqdXN0aWZpY2F0aW9uIHdlIGNv
dWxkbid0IGRvIHRoYXQgYmVmb3JlLg0KPiANCj4+IC0tLQ0KPj4gICAgaW5jbHVkZS9leGVj
L21lbW9yeS1pbnRlcm5hbC5oIHwgMiAtLQ0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9tZW1vcnktaW50
ZXJuYWwuaCBiL2luY2x1ZGUvZXhlYy9tZW1vcnktaW50ZXJuYWwuaA0KPj4gaW5kZXggMTAw
YzEyMzdhYzIuLmI3MjlmM2IyNWFkIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9leGVjL21l
bW9yeS1pbnRlcm5hbC5oDQo+PiArKysgYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LWludGVybmFs
LmgNCj4+IEBAIC0yMCw4ICsyMCw2IEBADQo+PiAgICAjaWZuZGVmIE1FTU9SWV9JTlRFUk5B
TF9IDQo+PiAgICAjZGVmaW5lIE1FTU9SWV9JTlRFUk5BTF9IDQo+PiAgICANCj4+IC0jaW5j
bHVkZSAiY3B1LmgiDQo+PiAtDQo+PiAgICAjaWZuZGVmIENPTkZJR19VU0VSX09OTFkNCj4+
ICAgIHN0YXRpYyBpbmxpbmUgQWRkcmVzc1NwYWNlRGlzcGF0Y2ggKmZsYXR2aWV3X3RvX2Rp
c3BhdGNoKEZsYXRWaWV3ICpmdikNCj4+ICAgIHsNCj4gDQoNCk5vIGRpcmVjdCBkZXBlbmRl
bmN5LCBidXQgd2hlbiBhIGNvbW1vbiBjb2RlIHdpbGwgaW5jbHVkZSB0aGF0IChsaWtlIA0K
c3lzdGVtL21lbW9yeS5jKSwgd2UgY2FuJ3QgaGF2ZSBhIGRlcGVuZGVuY3kgb24gY3B1Lmgg
YW55bW9yZS4NCkkgY2FuIHJlb3JkZXIgb3Igc3F1YXNoIGNvbW1pdHMgaWYgeW91IHByZWZl
ci4NCg==

