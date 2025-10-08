Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F77BC42FB
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 11:47:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139418.1474788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6QlL-0007g4-1t; Wed, 08 Oct 2025 09:47:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139418.1474788; Wed, 08 Oct 2025 09:47:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6QlK-0007fF-Sy; Wed, 08 Oct 2025 09:47:10 +0000
Received: by outflank-mailman (input) for mailman id 1139418;
 Wed, 08 Oct 2025 09:47:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6QlJ-0007f9-JZ
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 09:47:09 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c11e4254-a42b-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 11:47:08 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-afcb7ae6ed0so1194860966b.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 02:47:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486a174a6dsm1621730566b.90.2025.10.08.02.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 02:47:06 -0700 (PDT)
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
X-Inumbo-ID: c11e4254-a42b-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759916827; x=1760521627; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8R14+hIPaV9qvThetEOUX9zsCmgblhPeAQ+hTiFoQMo=;
        b=Wlfj8vhG4J2W0nv68o4GpSQckdIOfgFX5Ki36/78B48HS9OrUiATemqZAi8/dhiMJY
         hLcUJJ3RMMXepRPHPCShG8lNupe4Zs1dri+TkAHjUCTYCOjeNqGa4WhDHvWNrJog99dp
         huJKGtXp2MhWqG/7FYKn1vBtlGjsY8V7SBMCub6VObov01eTpdpoQrgb0IQCvFDtv7Fz
         8hPdFFKNd9Pjc0d0p1YdJQ58Ecrr7yUcZfKUjZG2vX1av3pYdzWM5xIVXAuDWGdD4+dQ
         HdBbmaI3QJgJs/WVn53gYnPrYjE2U5ozyjWzT1VDhvDEk4edVe64KWifhlOnZAJo9zBh
         BZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759916827; x=1760521627;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8R14+hIPaV9qvThetEOUX9zsCmgblhPeAQ+hTiFoQMo=;
        b=HqzfITuL7XUJTl2AvoRJWxlIlYOctuyz1D1NMplFVNVlWpAxuJmknZ5kCJZ/1ygmIs
         hfn6jcO7pGitCM8ZnJvDdkx+ink+iN6clukZU4dc2oxearUD3ANnw+E3N8H9HIW3SgiW
         vzSRx2klJZbHaQ0+cICK85cnKS9awP3nCj0mFmKzsbO+0vs3uu0wA6cxnmWsfyJOlIlD
         44us+u7VEKa4Uhtpt+If7Lh0emTn2xAHDgmTF0Qcf5gE03A2DaNZhM1hLFLDKqT0owT5
         Eu1usU8dPQtcma3EJRmIOy2DbSBoIrGtbYrHd56kcmqnTOIzyto3t8u4U2PoWnSxu7xY
         LupA==
X-Gm-Message-State: AOJu0YxRkptU25kbqF+AaHOOHdZmbVE3F98j4Ou8IoV+v75IgkOjn5pV
	NecbkGFpyod4dIoFmHBVvJWXWgb+bKFszzrkAI9Bhw7i0o4wRr1HuZPCxSuf0dD5+EQL+d6Y5gw
	1v5g=
X-Gm-Gg: ASbGncuZFzjyMGXHTSdduP9kZECosYjgva8O5+HLs9RIRxh0pZ9CbIn85y+i1Hm0tCw
	K88aj7+DJeh07xXj5TncFH4nzARC+P/6KPLtTgcY3QlKamBwpfLgiINONnUgHPufYguQZnx5/WE
	YAVvJPE5MHxDAekRQTzhaAZhLLjTNXzJOmfL0icpaBZSLLF1IaS4enyZ0x2txT7nmuKDURzbrn/
	2ivpmLPWA2ZJQT3XqcT3y3bK6eYu+61abyUY8HWuz8WdEN5qQewBcwyry5FQwIS+YD1rJvKxA9r
	4h3304NrTbu/5YDt05hNEwQeGSGsqhMf4NtCWVM0wC4y7ca5xFYcaGPEobxLR2908s05bz5OVJN
	LzIbVWA0Gfik/R+jiHtPnGY/vyqYzLZ5QQyIQHro+DTz3KywoXLqKCIRFB2IigANq2u5RSDEXh0
	ZR0EVBUbqWAPTsU4z/Obe3T8zNC4ouUgg=
X-Google-Smtp-Source: AGHT+IFQnKJwELUHbHxcThMndDBljkERWF+t/+TbZHsYfoB/7bYTt/a5P35UDKnBAOy69+zrn9NxgQ==
X-Received: by 2002:a17:907:d1c:b0:b2d:d7ba:8e7b with SMTP id a640c23a62f3a-b50aaa9ea3dmr311288866b.23.1759916827452;
        Wed, 08 Oct 2025 02:47:07 -0700 (PDT)
Message-ID: <4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com>
Date: Wed, 8 Oct 2025 11:47:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21] tools/tests: don't pass -E to sed
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
doesn't name -E as a standard option; only Issue 8 [2] does. As there's
nothing "extended" about the expression used, simply drop the -E.

[1] https://pubs.opengroup.org/onlinepubs/9699919799/
[2] https://pubs.opengroup.org/onlinepubs/9799919799/

Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In principle the -e could be dropped too, for being redundant.

Hitting the problem with an older sed pointed out another problem here as
well: The failed invocation left a 0-byte pdx.h, which upon re-invocation
of make was (obviously) deemed up-to-date, thus causing the build to fail
again (until the bad file was actually removed).

--- a/tools/tests/pdx/Makefile
+++ b/tools/tests/pdx/Makefile
@@ -35,7 +35,7 @@ uninstall:
 	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
 
 pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
-	sed -E -e '/^#[[:space:]]*include/d' <$< >$@
+	sed -e '/^#[[:space:]]*include/d' <$< >$@
 
 CFLAGS += -D__XEN_TOOLS__
 CFLAGS += $(APPEND_CFLAGS)

