Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A58BEA5C5AB
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:17:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908314.1315448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Ll-000860-Ko; Tue, 11 Mar 2025 15:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908314.1315448; Tue, 11 Mar 2025 15:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Ll-00082s-HK; Tue, 11 Mar 2025 15:16:57 +0000
Received: by outflank-mailman (input) for mailman id 908314;
 Tue, 11 Mar 2025 15:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts1Lk-00082k-Kj
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:16:56 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd29374a-fe8b-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 16:16:54 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-223fd89d036so110449965ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:16:54 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a68b89eesm9616262b3a.104.2025.03.11.08.16.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:16:52 -0700 (PDT)
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
X-Inumbo-ID: dd29374a-fe8b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741706213; x=1742311013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X8LOGG4uU8FOZpUEyBqgQ5KobC97qVpoXve38nvbWcU=;
        b=J0duy1Cj8QSmr1pSx3NSWrXgZZq02Q3htqn2gWldUeb0D/2H7YUNqCtqmnL9Syn9SX
         btuQPIvxKA3ieP7oxBrmO4vu50hc8Wfq2cjM+gYTE3sbIVdVEnE3yWmPP7AyY3tt0zwI
         pWU+JKHKh0yW9pvGIlIzEIFoNmsFe/ypjciy9o3BnqsW2i3d0kkhc+BW3MReWgCkhpWo
         n1PtBVFmb1TvSjMPxYTN7pltL9j2h7fWM0Jjm8d6VU1TrKe/54bdlxoOknGv0+cEsMvh
         ipT89wTiSA04EuNbLEJrsq1wnZw/XJBLxt6ZIkD2qEb46g01T4ABCu0Mu0wqFwN892J/
         t6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706213; x=1742311013;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X8LOGG4uU8FOZpUEyBqgQ5KobC97qVpoXve38nvbWcU=;
        b=OIH1Er/bU7LJYLDJ5Elu5c0fRMS93gFFsqsOIexYUitFZ3GnTyywZKq/HhUssep4AK
         j1zmAZDZK7FuSLH+M7vgDHuijUWNDIDFbqfVYiYDm90Quleg54FSq+IOixZbUcEIZYnD
         rwCYlF+jT5ROAhlHKSUEB8ae5xQ1sMZdI7hOBmV4MXRz3nZD/+WhEWnbkHC3B6En3ABs
         wTxu75rEsgj+W6hqjjbGZbx/BsHDKn8TcFtXDwpSJKZVKb58q/b/FFrpK9ZLX22wjtsw
         bOle86TgnGpM1vNWherOHGkwzNqLlKOPsLCKzM+51h4gwlyQ3Ro79zvN0qxgcK0EIZM7
         ssXw==
X-Forwarded-Encrypted: i=1; AJvYcCXxDN8jX1gz4x6Yd9AK491x3sQD03w1au1UuUzIeVg5E8zrTCvzgYdxOolbK39hZ7Gwv3RNd00tbgg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywn2LO39SOGMG6HQfWq0njgrvFnE5gQjfUpBzqGYaBteHLSb7i9
	ya3Q2SR+m4Ld149h9gO23Z/UXT/kpD1OVmk+0kSCbmQIPtpesdKmXTbg7wPdFyE=
X-Gm-Gg: ASbGncurxIuYP2J1wS5XX+sTUyecIQpy1g+2EhDQzOxIWdXb1veBtgnTvJz4owEL3QK
	Bo6eSZd0SOj57PgfZ5QJUcSlKXGKzfr9btE5l8kyqwSf4Z0qgOJHjlfhcrT+YH7x9FsEa3EKEGz
	G/n1kDEUAmxiJ8EOQ4w62a6DJ5VYDOO4ZKNdTIMthYHH9E1lVUJ+Ycu9w10XAUsAATTvI1zaiI4
	MVRSnLaxDsp/juXA1qE6+2huKvDIlzaMYn/xwo6THqPZ9GmaiMcLNeO7lihaT2J8lD6AQ+2oGOY
	gRyU806cytPtuDsohMbFWo/Jx2h7HD42Hr9JjY1b/f5SnmWRrb4Fl4SzUw==
X-Google-Smtp-Source: AGHT+IEfixA7L2fnS5UNE8FbDPTHCcGVSGrEqusGAVylfXrcSrSOLbWL24c8Jlqg7HqGHL0V+epMxw==
X-Received: by 2002:a17:903:230b:b0:224:f12:3746 with SMTP id d9443c01a7336-22428aaeb0amr227978355ad.30.1741706213011;
        Tue, 11 Mar 2025 08:16:53 -0700 (PDT)
Message-ID: <de156b56-4ed5-4b04-95d4-81fc2953491d@linaro.org>
Date: Tue, 11 Mar 2025 08:16:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/16] exec/ram_addr: call xen_hvm_modified_memory only
 if xen is enabled
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
 <20250311040838.3937136-12-pierrick.bouvier@linaro.org>
 <2aa408e2-a412-4eb6-b589-1bc2f5ac145a@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <2aa408e2-a412-4eb6-b589-1bc2f5ac145a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8xMS8yNSAwMDoyOSwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDExLzMvMjUgMDU6MDgsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBSZXZpZXdlZC1i
eTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmc+DQo+IA0KPiBJIGRpZG4ndCBmb2xsb3cgdGhpcyBkaXJlY3Rpb24gYmVjYXVz
ZSBSaWNoYXJkIGhhZCBhIHByZWZlcmVuY2UNCj4gb24gcmVtb3ZpbmcgdW5uZWNlc3Nhcnkg
aW5saW5lZCBmdW5jdGlvbnM6DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3FlbXUtZGV2
ZWwvOTE1MTIwNWEtMTNkMy00MDFlLWI0MDMtZjkxOTVjZGIxYTQ1QGxpbmFyby5vcmcvDQo+
IA0KDQpUaGUgcGF0Y2ggeW91IG1lbnRpb24gd2FzIG1vdmluZyBjb2RlLCB3aGljaCBjYW4g
YmUgYXJndWFibHkgZGlmZmVyZW50IA0KZnJvbSBzaW1wbHkgZWRpdGluZyBleGlzdGluZyBv
bmUuDQpUaGF0IHNhaWQsIGFuZCBldmVuIHRob3VnaCB0aGUgY29uY2VybiBpcyByZWFsLCBJ
IHdvdWxkIGFwcHJlY2lhdGUgdG8gDQprZWVwIHRoaXMgc2VyaWVzIGZvY3VzZWQgb24gYWNo
aWV2aW5nIHRoZSBnb2FsLCBhbmQgbm90IGRvaW5nIGEgcmVmYWN0b3IgDQpvZiB0aGUgaW52
b2x2ZWQgaGVhZGVycy4NCg0KPj4gLS0tDQo+PiAgICBpbmNsdWRlL2V4ZWMvcmFtX2FkZHIu
aCB8IDggKysrKysrLS0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9yYW1f
YWRkci5oIGIvaW5jbHVkZS9leGVjL3JhbV9hZGRyLmgNCj4+IGluZGV4IDdjMDExZmFkZDEx
Li4wOThmY2NiNTgzNSAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZXhlYy9yYW1fYWRkci5o
DQo+PiArKysgYi9pbmNsdWRlL2V4ZWMvcmFtX2FkZHIuaA0KPj4gQEAgLTM0Miw3ICszNDIs
OSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgY3B1X3BoeXNpY2FsX21lbW9yeV9zZXRfZGlydHlf
cmFuZ2UocmFtX2FkZHJfdCBzdGFydCwNCj4+ICAgICAgICAgICAgfQ0KPj4gICAgICAgIH0N
Cj4+ICAgIA0KPj4gLSAgICB4ZW5faHZtX21vZGlmaWVkX21lbW9yeShzdGFydCwgbGVuZ3Ro
KTsNCj4+ICsgICAgaWYgKHhlbl9lbmFibGVkKCkpIHsNCj4+ICsgICAgICAgIHhlbl9odm1f
bW9kaWZpZWRfbWVtb3J5KHN0YXJ0LCBsZW5ndGgpOw0KPj4gKyAgICB9DQo+PiAgICB9DQo+
IA0KDQo=

