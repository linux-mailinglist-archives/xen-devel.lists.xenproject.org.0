Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89265A25F2A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 16:46:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880720.1290800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyeB-00047B-Mm; Mon, 03 Feb 2025 15:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880720.1290800; Mon, 03 Feb 2025 15:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1teyeB-00045e-K5; Mon, 03 Feb 2025 15:46:03 +0000
Received: by outflank-mailman (input) for mailman id 880720;
 Mon, 03 Feb 2025 15:46:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1teyeA-00045Y-Br
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 15:46:02 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7374e28-e245-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 16:46:00 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3863494591bso2325194f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 07:46:00 -0800 (PST)
Received: from [192.168.100.192] (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr.
 [90.112.153.108]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c11b58esm12845673f8f.42.2025.02.03.07.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2025 07:45:57 -0800 (PST)
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
X-Inumbo-ID: f7374e28-e245-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738597559; x=1739202359; darn=lists.xenproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Y4zW+9jDwlnWDmU658reItTyEWXJ9QAZum6Pym1Fm0=;
        b=it5P/YkKHfgxBDAdJo8PEP89pdOmIRv2hOT2UJRQnLRDpyCZxo3bmEsFcYP88f+ssQ
         vAYyj1Br8D3/ncueV7tZ0UTxVR5xXk2C77VMSXN+e4M0aTZp8Csew1PMLxgqy7sZRkTp
         +gpeauC68WGFwikf/WkfjgaSNUifNwRWexAcSBlzehLlQawDJ3Enp+uCxTqJsUoLLDvY
         7ukPjGWPkYvPnIuxQVNDl689UlowgHS0/dr9Pes2MlxwL6CPC7jlxRY8wN538dgQYVLg
         k2+s5MKi0UFQavL085gvjMCm1keZpplfVBQfbNv/FsdgsPcdOzawzANILztjg4YGkMKc
         vLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738597559; x=1739202359;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Y4zW+9jDwlnWDmU658reItTyEWXJ9QAZum6Pym1Fm0=;
        b=ZvECtOrLiQsQlcJFSGEbx2zFIB0qouHG0BknkOL56xvP8CPGZz71xORWli3fLEqXx+
         RjFBrZ6Y4qRFfX2O4wh38vCex2nwGAYc+IMV9Ydl3EqdTa61wINuYGwHBvAyTh4row4J
         V3yGK3b5cVWey6NeHPdZfVV89+eKX/7W+/vEFMY8JbrD77iXsySGgvoWNY9TGskqOolK
         44ZtpL08JsOaapJSOXafjJe85HuE2v5P4mrn1MRLJ5483oRhKq7/AJcWymJjIfJtq6IO
         z6OHiRRajggSM/eQtzYm/OzzphISM++D6QrGDZw1WFnF+rWBbNVTxbiiQhkaWNfXK9nM
         PIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEJ9FtFhsQJYU9ryCqRl0rGw64fgvddWAW7og1IlH9m8SUEfOtvgPUDUjx9t81168XyiPpwZXkh6U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfikF1hwJpVDUG4X2gs5GDAqa4ihf3ck+iTy+s69HCntQNZvGB
	mYm0tb0wwKELWQWxb8Na0PzOcS81QJNkgiIJVWNwCD0PTQgNbi5e
X-Gm-Gg: ASbGncspUt5VnHSSYCPYHSm9tqm6XT0mI+ppQGU/ykUZTzCqmPIeC55YnEYdE6NWhez
	GLjbpaK5S//M9KUSZ0AWIGNmGqLPEozgLjTcsbqJXKjOOq8EuuwKSAUkWfFTy0g1HNwybU1XCaR
	yqKpt2qN4lJuXjE+6FG/iqX499m3anp3TuyKXa8k77cAf3Zzv0rT7Y+fnn8Gq8JiM+QKJNpGpRF
	jEyv66YBLPSas9lwWisXNbgBr1sIl+Ypg8uB7MBcSuAm7ZkhKdRfwQAS8FFOxA/qIln9z9tR5pf
	Ef6DQR1nfybK5az8EIFJBOtHnbMlTNYfzmFromEAorzl8gcWWRhtMHET3Cmfzk65x2pDKvrPEYS
	Q+nA=
X-Google-Smtp-Source: AGHT+IH6VzuD18Lqrcg/tsRFwHvVDwGFvPP/bQGn598nK/ydfLsiJTnCiRutXrUmnISGgYvv8Q+tRg==
X-Received: by 2002:a5d:5f54:0:b0:38c:617c:ee18 with SMTP id ffacd0b85a97d-38c617cf12cmr10789670f8f.34.1738597558114;
        Mon, 03 Feb 2025 07:45:58 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------4YIAkcvgXK1rC0N3UjNA1hzn"
Message-ID: <3a0fbade-c75a-454c-875b-4d8acecf5939@gmail.com>
Date: Mon, 3 Feb 2025 16:45:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/9] asm-generic: move Arm's static-memory.h to
 asm-generic
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1736334615.git.oleksii.kurochko@gmail.com>
 <3f1f3786ee48b01f1a5c7c7573456da72aa1e1d2.1736334615.git.oleksii.kurochko@gmail.com>
 <58f861e2-866d-4c11-9bdb-b4b6c84825af@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <58f861e2-866d-4c11-9bdb-b4b6c84825af@suse.com>

This is a multi-part message in MIME format.
--------------4YIAkcvgXK1rC0N3UjNA1hzn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/27/25 12:19 PM, Jan Beulich wrote:
> On 08.01.2025 12:13, Oleksii Kurochko wrote:
>> Except moving Arm's static-memory.h to asm-generic #ifdef header guard
>> is updated: s/__ASM_STATIC_MEMORY_H_/__ASM_GENERIC_STATIC_MEMORY_H__.
>>
>> Update arm/include/asm/Makefile to use asm-generic version of
>> static-memory.h for Arm.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Here as well as in patch 5 the "why" is again missing. Moving is fine, as
> long as it's clear that this will actually be used by another arch (e.g.
> RISC-V). Whether you have such (immediate or at least near term) plans is
> unclear though, as both features look like relatively advanced ones, and
> hence more basic functionality may want to appear first in RISC-V.

The reason is that suggested generic dom0less solution is using allocate_static_memory() and
assign_static_memory_11() so I decided that it would be better to have stubs for them in
asm-generic header that wrapping by the code by "#ifdef CONFIG_STATIC_MEMORY" the places where
it is used.
But considering the status of RISC-V's Xen downstream and I still don't have cases where CONFIG_STATIC_MEMORY
is used for RISC-V, probably, it would be better just to use wrapping in generic code instead of
stubs.

~ Oleksii

--------------4YIAkcvgXK1rC0N3UjNA1hzn
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/27/25 12:19 PM, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:58f861e2-866d-4c11-9bdb-b4b6c84825af@suse.com">
      <pre wrap="" class="moz-quote-pre">On 08.01.2025 12:13, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Except moving Arm's static-memory.h to asm-generic #ifdef header guard
is updated: s/__ASM_STATIC_MEMORY_H_/__ASM_GENERIC_STATIC_MEMORY_H__.

Update arm/include/asm/Makefile to use asm-generic version of
static-memory.h for Arm.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E" href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Here as well as in patch 5 the "why" is again missing. Moving is fine, as
long as it's clear that this will actually be used by another arch (e.g.
RISC-V). Whether you have such (immediate or at least near term) plans is
unclear though, as both features look like relatively advanced ones, and
hence more basic functionality may want to appear first in RISC-V.</pre>
    </blockquote>
    <pre>The reason is that suggested generic dom0less solution is using allocate_static_memory() and
assign_static_memory_11() so I decided that it would be better to have stubs for them in
asm-generic header that wrapping by the code by "#ifdef CONFIG_STATIC_MEMORY" the places where
it is used.
But considering the status of RISC-V's Xen downstream and I still don't have cases where CONFIG_STATIC_MEMORY
is used for RISC-V, probably, it would be better just to use wrapping in generic code instead of
stubs.

</pre>
    <pre>
~ Oleksii
</pre>
  </body>
</html>

--------------4YIAkcvgXK1rC0N3UjNA1hzn--

