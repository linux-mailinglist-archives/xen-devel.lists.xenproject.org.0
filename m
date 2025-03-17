Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A25BCA646F9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916382.1321481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6ei-00015p-Fe; Mon, 17 Mar 2025 09:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916382.1321481; Mon, 17 Mar 2025 09:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu6ei-00014A-Cz; Mon, 17 Mar 2025 09:21:08 +0000
Received: by outflank-mailman (input) for mailman id 916382;
 Mon, 17 Mar 2025 09:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Rdq/=WE=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tu6eh-000142-76
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:21:07 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2671d53f-0311-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 10:21:04 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3912d2c89ecso3796041f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 02:21:04 -0700 (PDT)
Received: from [10.223.46.213] (109.21.205.77.rev.sfr.net. [77.205.21.109])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c888152dsm14131479f8f.48.2025.03.17.02.21.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:21:03 -0700 (PDT)
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
X-Inumbo-ID: 2671d53f-0311-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742203264; x=1742808064; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpUsKKtqVCRGopEBPreIzxle1j3+eqS8AQYhEVEoDhg=;
        b=g6i4Ivgh8CyGsdN6TXvN4pDhSRbO8CGw8zK+Fp3i+5V2+ATJkHM/HuYZEbeqZyObAY
         pcwVFVRFZzq9vJgsSzg4fmTT4jDptqUdJJji54GXaIynnCXKIhTSPCZnEEhrwcymsn06
         p8oIzk36FSpJ1ydp7z6n1xaJfZj6HbLBEJRSIqKlHtdV8ND3TgWSGpW8w7ZtnIMVF2Lb
         l4gZZkZU1/hp57nsLoy6/blEiSYB5dPPFFoC5urtAGN0oC50QsehNJBBBxq6fVojbyvd
         UeqOIaCkn7V7V2+S6eB5dLt1OsSiP5wV3BzZtyKQOjVTS+YZ3z9EXnnlv9rEI48Hoddv
         nauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742203264; x=1742808064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpUsKKtqVCRGopEBPreIzxle1j3+eqS8AQYhEVEoDhg=;
        b=mYhtXZX5lk9KX1yToQO/AkH/MdA5hvypBq2Tb65gQel7YGkxACCvrKmY39/ml+i/AN
         e4Aw5Xsa1/8FxQJfzfSxhZVb4IZVSTwFytslC+Ehqnl23DMjwHqLcGuw1dhX5JgUidHs
         4M90icf3gQtEMkZAdb5QYP8UffHTpKDPqWcnI9h7U4Jew5uRUTjgUbS/werxuhKAug45
         U8pt8gWcYon+ZvZjFoVcUvxMpCwyeboo+k9uwR4bv/N8H+/rgVZFKgwodTDwia5YQwSo
         AoFdfYx7oTsdb7F4RlAzOHnRcD7W/69a0fqsn2s6e5pbAXZND6pN8tvtHbfdlWRelH0u
         h4Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWHVvI51pNahMBpXbtXPqdeoBtIACdH0fvdZgaPbrBlTi0jo7bUb6ZYap13nlYq4HITMPh/uPYXUQQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKNHxHn0Ao8MwTvJ8CGzA5hW9vvBG2jBCuh4ldrMuwuL5wciti
	u+AqZXuPpq/EBRYSqCJoag/DCdJouE1OgAJOweBZiHxIDM6Ohqhc6vJKOflLEXQ=
X-Gm-Gg: ASbGnctJ+xp/3R1NOVEklb12cgv5oVe317bfkzT3CIqEt5PaorCXzy6xVBobkqcSpod
	jppxKkdLcQO6z0jmNDPLlj5eX2+kI3WSjlJ7rZCJyae8zTqkqo1bXqTaaln5lLtSRl0Z0dwA3ZG
	hXx9A1G37NxGqR6iTe9pg7vpqt60oZP1oUCdggHiz0tnvvhHQrkhe6lTeNnX73hhJ9jyXqjogCW
	F8UGPNq7YQ/mblbIzU9SMUfc/CUKLgVTQVNJZSkFbY3z+9+5f/K/g2OUiFWPTCWX6dbhduWgAdw
	q6Ve1YtGAgaqFVjjZ9DCiLrKqdy+Wvts3lmGIUbnF6OdDm09l42K9ODjBqegwW7rIsHtGAUEFnv
	a8oui9deA53I=
X-Google-Smtp-Source: AGHT+IGWnfmu1vxKt8DfVr5Wh5yIJXe0q4pEomCwp6mUHJGY4TnJ5r3CTWvfyQ4vsQ6wNtdAUg6E4w==
X-Received: by 2002:adf:a456:0:b0:390:df83:1f5d with SMTP id ffacd0b85a97d-3971f4116ecmr10959222f8f.35.1742203263878;
        Mon, 17 Mar 2025 02:21:03 -0700 (PDT)
Message-ID: <3ce90214-a080-4ae8-86ff-9f8fd20f1733@linaro.org>
Date: Mon, 17 Mar 2025 10:21:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/17] make system memory API available for common code
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, alex.bennee@linaro.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-riscv@nongnu.org,
 manos.pitsidianakis@linaro.org, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
 <5951f731-b936-42eb-b3ff-bc66ef9c9414@linaro.org> <Z9R2mjfaNcsSuQWq@l14>
 <ee814e2f-c461-4cc2-889d-16bb2df44fdf@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <ee814e2f-c461-4cc2-889d-16bb2df44fdf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/3/25 19:39, Pierrick Bouvier wrote:
> On 3/14/25 11:34, Anthony PERARD wrote:
>> On Fri, Mar 14, 2025 at 10:33:08AM -0700, Pierrick Bouvier wrote:
>>> Hi,
>>>
>>> one patch is missing review:
>>> [PATCH v5 12/17] hw/xen: add stubs for various functions.
>>
>> My "Acked-by" wasn't enough? Feel free try change it to "Reviewed-by"
>> instead.
>>
> 
> Those are differents. From what I understand, Reviewed implies Acked, 
> but the opposite is not true. If it was, they would be equivalent.
> Thanks.

IIUC on QEMU Acked-by means "as a maintainer of files modified by
this patch, I don't have objection on my area, as long as someone
else takes the patch". It doesn't mean the patch has been reviewed.

Please correct me if I'm wrong.

Thanks,

Phil.

