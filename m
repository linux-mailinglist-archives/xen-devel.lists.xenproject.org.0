Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A533CA69A11
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 21:15:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921123.1325117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuzp3-0005UQ-Pr; Wed, 19 Mar 2025 20:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921123.1325117; Wed, 19 Mar 2025 20:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuzp3-0005Rs-NH; Wed, 19 Mar 2025 20:15:29 +0000
Received: by outflank-mailman (input) for mailman id 921123;
 Wed, 19 Mar 2025 20:15:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/Ds=WG=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuzp2-0005Rm-MI
 for xen-devel@lists.xenproject.org; Wed, 19 Mar 2025 20:15:28 +0000
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e571a07d-04fe-11f0-9ea0-5ba50f476ded;
 Wed, 19 Mar 2025 21:15:27 +0100 (CET)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3011737dda0so87773a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Mar 2025 13:15:27 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf5b80b5sm2116351a91.38.2025.03.19.13.15.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 13:15:25 -0700 (PDT)
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
X-Inumbo-ID: e571a07d-04fe-11f0-9ea0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742415326; x=1743020126; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jjJvlOnU49s+Zbb8733WbLiCItr7uaYdoO51OudCE6k=;
        b=StbmPQZgnaFHQmcz19sxbSAzwC4Bqko1Nr2Djedeo4lK/oNiBSBrRCI7ydFukovl/7
         gF03JMoO/L9LeaXKhhw3J4MRvk22hZNwJusnKrNmWX0LcHNyqG7Zzb2ezHEJ6968cIEl
         tffsCFAkbBgxRJ53CEdjQdaCd6XWnPvr6pa23yq6a10LXjpcJP6MQLNZGk07DvD8Cskw
         M4O3+LRmFhxbgx3AjOva2295QHhA9uoB6zTyfVqpb+m/sugfxltcRFH7n9ZqVkheXM1L
         rFVGMfYsY/WJZ9fM8lALddYcVdFTTX9NkhNqJ6N1vYcpgMBlaffsGA+7ulVyJLdfHvPF
         DqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742415326; x=1743020126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjJvlOnU49s+Zbb8733WbLiCItr7uaYdoO51OudCE6k=;
        b=nYAY7zrWJR16VlnNhC55LDg7Gms6zKKkbzjWPIwtgLQeTHxW8PDTiZHaY3rz2To/u5
         2WQ9pKmcH5016xqGOhpIzt7KZ1w5kN+5nrFe0DQZsTv8KvQpeqLVFvtuIutwmGystpJC
         zYGodRxO5dolNQIfpyIq2TdjLUz6cnUJupYqHlqsQcPuK6LfBVGG849npLsqxrzRZUE0
         nq9RQGWxFeFXO/SN4Q9wCAl5wqoIaKgDQUzZp+U0q3Oe3KUv/YWlgDvteZ2Q/z95DEaX
         7G1ti5LMcCrVp/iguYnXRbZ1HcP03OnhdRxCDgZdOd1Hoh84JuNFHq829M9W53WtbWwD
         Ylbg==
X-Forwarded-Encrypted: i=1; AJvYcCUjxOpRgcgSSNge/usfj9LOxnWo7uqF7GrdgzW9uBXZGzlEyVaLKorhvksLmg0OHX+TlszT64fRa3g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4dUq4imxRAEzVMOWFNdDTCvd4d7MFoZZFsrT3T8HpungOn9Hf
	z2NbA0Ayn4yyVcEodF5Bnn7+F7gXIgx3cZ0UXmn5EHBgNOPTnkDVuf46X70yWJY=
X-Gm-Gg: ASbGncsdmzRxBRRjlPnWrtH5qp8xqwPQ5e10iO+JESpXA4KPAiG3znEqEL0MmAy2ADI
	VlQTNZROB/fM7rBEW6aptl7fuFgymzZhAEzu3g1Sa7kzi9KIxqwADcXz/WYR/4uuewSbDlJrSH8
	+NoFhhatVuhDTK/eUBboM9F2xYj0jVBBzjThtQicHjDXoHyTlHxyOLovfWxyt6dqtl2ZvSmz9Fx
	4Xml7HkxPv7Exmzc0s+WkFwKlFeVR1IFekODSzFXI29vSGuqCMla6ANyPVNZmhsBmQ3JPbldz+1
	5AbEMRnmwBZdsQLaqcnk4oBIvNbBamLFQzY48pvPY2hspgKN42IfrCH6QQ==
X-Google-Smtp-Source: AGHT+IG/qfPdy626hThIYa/RsoZd8+ixXNZ5S+14ncTQSUR3/THRotw28A4RHNR31RiMxmmch69q8w==
X-Received: by 2002:a17:90b:1a88:b0:2ff:7331:18bc with SMTP id 98e67ed59e1d1-301be202b7fmr5479737a91.26.1742415325934;
        Wed, 19 Mar 2025 13:15:25 -0700 (PDT)
Message-ID: <9c48029e-1921-447e-8b38-4b171dce1210@linaro.org>
Date: Wed, 19 Mar 2025 13:15:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/18] system/xen: remove inline stubs
Content-Language: en-US
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: qemu-devel@nongnu.org, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, David Hildenbrand <david@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-riscv@nongnu.org,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 manos.pitsidianakis@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>, kvm@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Xu <peterx@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
 <20250317183417.285700-14-pierrick.bouvier@linaro.org> <Z9rNBFsWR39czUGQ@l14>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <Z9rNBFsWR39czUGQ@l14>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMy8xOS8yNSAwNjo1NiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQo+IE9uIE1vbiwgTWFy
IDE3LCAyMDI1IGF0IDExOjM0OjEyQU0gLTA3MDAsIFBpZXJyaWNrIEJvdXZpZXIgd3JvdGU6
DQo+PiBSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5h
cm8ub3JnPg0KPj4gU2lnbmVkLW9mZi1ieTogUGllcnJpY2sgQm91dmllciA8cGllcnJpY2su
Ym91dmllckBsaW5hcm8ub3JnPg0KPiANCg0KVGhpcyB3YXMgYSBiYWQgY29weS1wYXN0ZSwg
dGhhbmtzLg0KDQo+IFJldmlld2VkLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAdmF0ZXMudGVjaD4NCj4gDQo+IFRoYW5rcywNCj4gDQoNCg==

