Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D58A5C50A
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 16:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908292.1315428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Fw-0006v2-P0; Tue, 11 Mar 2025 15:10:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908292.1315428; Tue, 11 Mar 2025 15:10:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts1Fw-0006tA-ME; Tue, 11 Mar 2025 15:10:56 +0000
Received: by outflank-mailman (input) for mailman id 908292;
 Tue, 11 Mar 2025 15:10:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts1Fu-0006t0-DS
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 15:10:54 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0397046e-fe8b-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 16:10:49 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-225a28a511eso9117355ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 08:10:49 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28126d69bsm9585406a12.51.2025.03.11.08.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 08:10:47 -0700 (PDT)
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
X-Inumbo-ID: 0397046e-fe8b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741705848; x=1742310648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cQwJl5AaMpNuj13k4T9FN6aD7KIBuzBDEK+lwo9Ext8=;
        b=nFDzTlSGhPMWFqApNH/A01QmZ7QpSwYR1B5iAayzOClosH8EJeq1zMyh+nkshhUlpJ
         eGO/JrSjst1gXYPdRPHO6ejal5/NiJ/Cx5XEVzGzqMHnO4EKeEH/u9+HSwb4+dWW1qIS
         OYCWjGlqWVvR/gXzldmB27BraUj4uVAVs61U+UdD/Goo3/fvKjaTvVpOZbDPpFkBH6/q
         sp+moXX4/OYq6zqmogy4LdWCA5v6jRtSgjVY0mlhllta3278GRP4uAuE589d+17jieU6
         H1+V/eTiLRoLxOaJH/1wH0INy6nmzAlUmOgPeI4G6634FtiT8T28I8VQlw10VFqy3ACW
         XNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741705848; x=1742310648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cQwJl5AaMpNuj13k4T9FN6aD7KIBuzBDEK+lwo9Ext8=;
        b=expgmAOMisou+sSJPwu76WVoxa9IPdAz+aTFNyEyfEjCyMBKH1DtA6Ixz2+Tn4mQYd
         XmisNqT06ArhsGPqJ9zoUWM3caseUXsmNoB+gI+T3rD8GPjQxqmdPVKwq52pr2jQHzg+
         BFII+p27cj0ygkCWW0TpfN0kMnwriQNPvo6QkaMBUMDbvLlq2ZCdcTTPnJmSUQfKv3HE
         EtcAi2vgcpmG1cWCW2xmf1TOcUXWdeMBUxHH1RnP7hKmAOEy+Bj5vx9gW4J9fbGWEyt4
         3h5JZ2riN1b4hTwtKmmIK+nqnmvVSnT80APITikwK18i1tZqTXGjePsbTQGX3h7ggiUA
         2piw==
X-Forwarded-Encrypted: i=1; AJvYcCVMQww4PlmmXK6QElK1E0vhSNg6AnAtWdD39cvAGZc+3Znt70VbdO/oy+Dy89m0QS4kq9wQCsgS17g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxhYtlhJHtajDIDIruGEQjCRmckujFHmGOw7DExO2rZpSdmK3pi
	Q1Ygl3rzmoo/2PjegTPIkPaUqSgEZ761Or5zfS5a5IjuZ6WglA+wxmjvu7QKu0c=
X-Gm-Gg: ASbGncsFq+YG8Q3nGB/MkAwM5/cKCcycqeYA2W2ScezcpeJI5g2Mw3vTwJ0jyd9ya1d
	7mMDW2VpIs63PqtT0/IAOPk1jcLVg0YFQjib+pV70HddpT5mKQFrHm8YiaEpnpnWl65GoXZbtEm
	7ZgMIKAE8ZjjdPukA0DwzSnNiEenqrcuV8AJn16wUDQEJX2Vx07Y0KXzvcC9YpGxws+jQMPPvyl
	cRBx3o5GHSkDGgez+eC7R7LkUi3l9GPiOE8THt5aBCeg4Gzqsh3MtkTkpQrhQug2SGN1siQqwna
	0R0k3VZouDgmdpObxaJCY3YrUTJVCP59HZPYxVPVhn/W6dMPGF5kv817fA==
X-Google-Smtp-Source: AGHT+IEITMrsbR3vHiF3IG5H7RZJtH9+eCZYnI84EngoCoPfv0vimXTB3AzAhTXNWBOwPqkcAjXLsA==
X-Received: by 2002:a05:6a20:7fa1:b0:1ee:dd60:194f with SMTP id adf61e73a8af0-1f544c378b7mr26705105637.26.1741705847979;
        Tue, 11 Mar 2025 08:10:47 -0700 (PDT)
Message-ID: <9706a688-b466-40ca-a6b8-0221b11f749c@linaro.org>
Date: Tue, 11 Mar 2025 08:10:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] exec/exec-all: remove dependency on cpu.h
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
 <20250311040838.3937136-8-pierrick.bouvier@linaro.org>
 <f0c7b0ff-a43a-4203-aba1-2e06a462771e@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <f0c7b0ff-a43a-4203-aba1-2e06a462771e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8xMS8yNSAwMDoyNiwgUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JvdGU6DQo+IE9u
IDExLzMvMjUgMDU6MDgsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6DQo+PiBSZXZpZXdlZC1i
eTogUmljaGFyZCBIZW5kZXJzb24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBQaWVycmljayBCb3V2aWVyIDxwaWVycmljay5ib3V2aWVyQGxp
bmFyby5vcmc+DQo+IA0KPiBNaXNzaW5nIHRoZSAid2h5IiBqdXN0aWZpY2F0aW9uIHdlIGNv
dWxkbid0IGRvIHRoYXQgYmVmb3JlLg0KPiANCj4+IC0tLQ0KPj4gICAgaW5jbHVkZS9leGVj
L2V4ZWMtYWxsLmggfCAxIC0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9leGVjLWFsbC5oIGIvaW5jbHVk
ZS9leGVjL2V4ZWMtYWxsLmgNCj4+IGluZGV4IGRkNWM0MGYyMjMzLi4xOWIwZWRhNDRhNyAx
MDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZXhlYy9leGVjLWFsbC5oDQo+PiArKysgYi9pbmNs
dWRlL2V4ZWMvZXhlYy1hbGwuaA0KPj4gQEAgLTIwLDcgKzIwLDYgQEANCj4+ICAgICNpZm5k
ZWYgRVhFQ19BTExfSA0KPj4gICAgI2RlZmluZSBFWEVDX0FMTF9IDQo+PiAgICANCj4+IC0j
aW5jbHVkZSAiY3B1LmgiDQo+PiAgICAjaWYgZGVmaW5lZChDT05GSUdfVVNFUl9PTkxZKQ0K
Pj4gICAgI2luY2x1ZGUgImV4ZWMvY3B1X2xkc3QuaCINCj4+ICAgICNlbmRpZg0KPiANCg0K
UHJldmlvdXMgY29tbWl0IGlzIG5hbWVkOg0KY29kZWJhc2U6IHByZXBhcmUgdG8gcmVtb3Zl
IGNwdS5oIGZyb20gZXhlYy9leGVjLWFsbC5oDQpTbyBiZWZvcmUgdGhvc2UgY2hhbmdlcywg
aXQncyBub3QgcG9zc2libGUuDQoNCkkgY2FuIHJlcGVhdCB0aGF0IGhlcmUsIG9yIHNxdWFz
aCB0aGUgcGF0Y2hlcyB0b2dldGhlciwgYXMgeW91IHByZWZlci4NCg==

