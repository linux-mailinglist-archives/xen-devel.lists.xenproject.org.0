Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F52A6576A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 17:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917371.1322308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuD0v-0008LL-NF; Mon, 17 Mar 2025 16:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917371.1322308; Mon, 17 Mar 2025 16:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuD0v-0008JD-Ke; Mon, 17 Mar 2025 16:08:29 +0000
Received: by outflank-mailman (input) for mailman id 917371;
 Mon, 17 Mar 2025 16:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuD0u-0008Ik-9u
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 16:08:28 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e73fc58-034a-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 17:08:26 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22423adf751so75947665ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 09:08:26 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56ea7c718sm7406992a12.62.2025.03.17.09.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 09:08:24 -0700 (PDT)
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
X-Inumbo-ID: 0e73fc58-034a-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742227705; x=1742832505; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzbTl5nkQKFBnmZRI2ae2XnEho9KAwozFu9d7AODj48=;
        b=h1Szs6Fmc2ZEl3pTHGigpWSH6lwxmtMLnheZ/gbcnJX4vYC0z0XGh4y5y5kTfJbH2U
         mOuCGtZi8C0JeYTUvdS6zYwUFV1b42742a9qFnfdQ1damQzN936u8SEQeh1ykZVk+xN1
         2zWOf2uDlU7CnsyXmeaujcaEvdAFLCl8Rl1hgKzjtYbHHb491ANnVOsNUV6435zTJne8
         atholHhTfD0h9IVQRfLKlZw/xW5MDKqEtJxbEgJxKjz2kk2GyMHfHUMdLaeijm9c5S/e
         HyHKOQvfGJP2j5/mHDkY8uzqjVjFmhL+Zyrf2WeUqmAoIJ/rD3douLoRgTUcks/epCPt
         icug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742227705; x=1742832505;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzbTl5nkQKFBnmZRI2ae2XnEho9KAwozFu9d7AODj48=;
        b=CezN5ftSvfikjObttFvSUdRfN+5GTbIslbUBXZ8t58JtZ+Q0ifTReo50KQbFU2F3pO
         tm4Cz/PR8VRDncwArCdbJBJ6paTUi2XD/34ActzHaOkzD3HNZHZys6FznC7NY4QsFHMe
         E6V4N/BQssJVzayDwOzXYEE3UTzLFjLCCNK9h1cYYQeE59vr/pA31HvWEPukGCligLvT
         0ofQr98sNCBrRt1/VsEGpy85yU+T4F4h6gedKJEzuEYC0NN9GvUdwXWr0cnle3jsea+e
         KTT25UqO9dHu4JE2PgejkaOHFbHkpMzoqWRN8F4fQviqtcUQW0FV9QI/ZCslzxYnYyrV
         9r9A==
X-Forwarded-Encrypted: i=1; AJvYcCXpP7Ij9+1jVfYgmRp10QCP7gpsFaQMMfJb3kHsQ5zX1b7JeGJTEcWfIERdnyuZtBNfGr/JJ4CVs0Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyn0xxkCy+JemRwCRGVcfmyvbRbJ3VYbdDvLlYYkdddXwLdKKYP
	O6q3Ib4wy5f3w80ZiZnb0egTMeAe3JZJ4Qm1uUMNi5bLL8N4lIOr0NNnTyh51g4=
X-Gm-Gg: ASbGnctb9aJXTVlWzeb66F5ub/7u56i0fcKDX0HTQ2XPfIWOIUPOb87bdSZiUW9CPKL
	Yw+TLCbDIdUFx7FjvF+BYgei/S92yfZEVKZ640pmZ1yk6hBWzFhGR8nYRnlPh+xfT9i9rygS+M9
	CkSk45wldZHEqOVN9OQFs8bPSPTAO/bM8/Q/VqS0Bb7Z9HpGTWHpP1h2CxEeuAYrokePgdlSl33
	8552mQntCLJvztuE5HlJaRkQe+tNyQpyC7/a9v05KBnJul2s3kMz9SbdkF2cR67l2r4q9bqmbte
	lRoHRCE7nFHlxq86bLUc/uIBizrYIjLtOs8uDQy6E+RwJ8Yjc7HB6IBdug==
X-Google-Smtp-Source: AGHT+IF6KgkWQt4kB3+J3NVrqV33E3W11zYKhfEgS1LyTWV2K7KDq8lWeWA7BEGG4QAbFg5GBaiRXg==
X-Received: by 2002:a05:6a20:cf8a:b0:1f5:80a3:b006 with SMTP id adf61e73a8af0-1f5c1201c3fmr19005019637.21.1742227704759;
        Mon, 17 Mar 2025 09:08:24 -0700 (PDT)
Message-ID: <7430b4de-284b-46b9-b29d-f018d0639431@linaro.org>
Date: Mon, 17 Mar 2025 09:08:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/17] exec/memory.h: make devend_memop "target
 defines" agnostic
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
 <20250314173139.2122904-6-pierrick.bouvier@linaro.org>
 <d5e2aa98-5b9c-4521-927f-86585b7b2cfa@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <d5e2aa98-5b9c-4521-927f-86585b7b2cfa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8xNy8yNSAwODo0OCwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDE0LzMvMjUgMTg6MzEsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBXaWxsIGFsbG93
IHRvIG1ha2Ugc3lzdGVtL21lbW9yeS5jIGNvbW1vbiBsYXRlci4NCj4+DQo+PiBSZXZpZXdl
ZC1ieTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVy
QGxpbmFyby5vcmc+DQo+PiAtLS0NCj4+ICAgIGluY2x1ZGUvZXhlYy9tZW1vcnkuaCB8IDE2
ICsrKystLS0tLS0tLS0tLS0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2V4ZWMv
bWVtb3J5LmggYi9pbmNsdWRlL2V4ZWMvbWVtb3J5LmgNCj4+IGluZGV4IGRhMjFlOTE1MGI1
Li4wNjkwMjFhYzNmZiAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZXhlYy9tZW1vcnkuaA0K
Pj4gKysrIGIvaW5jbHVkZS9leGVjL21lbW9yeS5oDQo+PiBAQCAtMzEzOCwyNSArMzEzOCwx
NyBAQCBhZGRyZXNzX3NwYWNlX3dyaXRlX2NhY2hlZChNZW1vcnlSZWdpb25DYWNoZSAqY2Fj
aGUsIGh3YWRkciBhZGRyLA0KPj4gICAgTWVtVHhSZXN1bHQgYWRkcmVzc19zcGFjZV9zZXQo
QWRkcmVzc1NwYWNlICphcywgaHdhZGRyIGFkZHIsDQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1aW50OF90IGMsIGh3YWRkciBsZW4sIE1lbVR4QXR0cnMgYXR0cnMp
Ow0KPj4gICAgDQo+PiAtI2lmZGVmIENPTVBJTElOR19QRVJfVEFSR0VUDQo+PiAgICAvKiBl
bnVtIGRldmljZV9lbmRpYW4gdG8gTWVtT3AuICAqLw0KPj4gICAgc3RhdGljIGlubGluZSBN
ZW1PcCBkZXZlbmRfbWVtb3AoZW51bSBkZXZpY2VfZW5kaWFuIGVuZCkNCj4+ICAgIHsNCj4+
ICAgICAgICBRRU1VX0JVSUxEX0JVR19PTihERVZJQ0VfSE9TVF9FTkRJQU4gIT0gREVWSUNF
X0xJVFRMRV9FTkRJQU4gJiYNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBERVZJQ0Vf
SE9TVF9FTkRJQU4gIT0gREVWSUNFX0JJR19FTkRJQU4pOw0KPj4gICAgDQo+PiAtI2lmIEhP
U1RfQklHX0VORElBTiAhPSBUQVJHRVRfQklHX0VORElBTg0KPj4gLSAgICAvKiBTd2FwIGlm
IG5vbi1ob3N0IGVuZGlhbm5lc3Mgb3IgbmF0aXZlICh0YXJnZXQpIGVuZGlhbm5lc3MgKi8N
Cj4+IC0gICAgcmV0dXJuIChlbmQgPT0gREVWSUNFX0hPU1RfRU5ESUFOKSA/IDAgOiBNT19C
U1dBUDsNCj4+IC0jZWxzZQ0KPj4gLSAgICBjb25zdCBpbnQgbm9uX2hvc3RfZW5kaWFubmVz
cyA9DQo+PiAtICAgICAgICBERVZJQ0VfTElUVExFX0VORElBTiBeIERFVklDRV9CSUdfRU5E
SUFOIF4gREVWSUNFX0hPU1RfRU5ESUFOOw0KPj4gLQ0KPj4gLSAgICAvKiBJbiB0aGlzIGNh
c2UsIG5hdGl2ZSAodGFyZ2V0KSBlbmRpYW5uZXNzIG5lZWRzIG5vIHN3YXAuICAqLw0KPj4g
LSAgICByZXR1cm4gKGVuZCA9PSBub25faG9zdF9lbmRpYW5uZXNzKSA/IE1PX0JTV0FQIDog
MDsNCj4+IC0jZW5kaWYNCj4+ICsgICAgYm9vbCBiaWdfZW5kaWFuID0gKGVuZCA9PSBERVZJ
Q0VfTkFUSVZFX0VORElBTg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgPyB0YXJnZXRf
d29yZHNfYmlnZW5kaWFuKCkNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIDogZW5kID09
IERFVklDRV9CSUdfRU5ESUFOKTsNCj4gDQo+IFVubmVjZXNzYXJ5IHBhcmVudGhlc2lzPw0K
PiANCg0KTm90IHN0cmljdGx5IG5lZWRlZCBpbmRlZWQuDQpDb2RlIGlzIHJlZmFjdG9yZWQg
aW4gcGF0Y2ggMTQgYW55d2F5cy4NCg0KPj4gKyAgICByZXR1cm4gYmlnX2VuZGlhbiA/IE1P
X0JFIDogTU9fTEU7DQo+PiAgICB9DQo+PiAtI2VuZGlmIC8qIENPTVBJTElOR19QRVJfVEFS
R0VUICovDQo+PiAgICANCj4+ICAgIC8qDQo+PiAgICAgKiBJbmhpYml0IHRlY2hub2xvZ2ll
cyB0aGF0IHJlcXVpcmUgZGlzY2FyZGluZyBvZiBwYWdlcyBpbiBSQU0gYmxvY2tzLCBlLmcu
LA0KPiANCg0K

