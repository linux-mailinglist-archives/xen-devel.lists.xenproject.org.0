Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6C2AF700F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 12:27:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031950.1405690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXH9y-0005BX-Kf; Thu, 03 Jul 2025 10:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031950.1405690; Thu, 03 Jul 2025 10:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXH9y-00059z-Hy; Thu, 03 Jul 2025 10:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1031950;
 Thu, 03 Jul 2025 10:27:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXH9w-00059p-Tu
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 10:27:16 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 499d8903-57f8-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 12:27:14 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so46344785e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 03:27:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2f0babsm159840505ad.58.2025.07.03.03.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 03:27:13 -0700 (PDT)
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
X-Inumbo-ID: 499d8903-57f8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751538434; x=1752143234; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gJ6gjpdAPzVYk5iLFK/G02ewSgEVN7t3t+C2HH+4V4w=;
        b=fu0gyvGbwQBjQmI3zvUnv/MpchY05H0hTBKk+1rDq9raIL6SfOe9hNud4h92xOTBax
         mJbGL4ErfkeoHhJfTrro+gCaXcpBX35oj0Vsz0KNBOmu0VY4vZjWai640Daq4Gq2S3oj
         VXH0FaTEygOoxuEN7iCbXGHrI1aZvShSUHo93nKoPvBcvfDHofquM4gGSbnfXiNpo5VQ
         EwFZNZCDNHUj/kcSCwtNRC5zumclgJl3SLcVjJDIVM/eo/kqbuafCcm8irWwD5gsLTD3
         VUOWPhTO6A/lSugqje5ZXCK1UJqmCX4ZjZzJ+Jn3zJ0AwJKN4p1yUyFdXKdqnlMxvuiD
         rt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538434; x=1752143234;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJ6gjpdAPzVYk5iLFK/G02ewSgEVN7t3t+C2HH+4V4w=;
        b=ZESGhS6tNyYz1HSTXzfm1zKS7AS4UDzDauWzGHGpaNsqfzNg/YuAbcJb9hrzjTZ/nn
         4URf833rnDBULBkCQP1e38NrqkQzD7PYU7tzOAmhBmsr/Q4SAllkEmOTDoSqyjSD0EmS
         Y7BZmJj9qmskgEtxJLQQJrCmQaiDRAQI6hTogY9CPmqqoT8C6RuTPfp8/5XFl+I9HSIo
         /zDN1bB6XUA8vWXubtpxmF3nIxuyLtGPxqzgeqZKYMprMMu6F1d6voz1i2sZr07AwZeO
         /I4Qwd0vGtm/lft8wAVk2s7kJI1SKmq5tdigLRy/tzQb1oZ9kRn87tDgcZTtfyeguc6O
         1IHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnV1OaDigwpmqNwtM9VXFwuyq+fv4kA4bPIqrJU5Bo59LFgG7L1dL1FTt1Qxc3A+WXPz6aFqPUmz8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZCZBbPbEBUeA2QxuXlEj9I4KHDUF1PFgltB8xY8jmaUBWdSgQ
	NhnnTnJA/NlbMf7CpKEjMMsKQuhTTR+rvluOUfyH2iotQrUlBMGLO5qXTZ14yXTjK7XcQJdIJbl
	ubUM=
X-Gm-Gg: ASbGncucZ0fuhuObhh3hb9CCR2lVgutunAZP+7ZMbcpmBFd3LJ4kc4+zumtXPDzzkbj
	ofAZVLVyJXcnSMbugCI7CPNSsZr6SWn1HihC4jrwKB+Kqkq9qTchEgVLRKLKwmXHV0NCWN8i7CH
	ViZvKLDVp2qWD04QDopuyCjxv+l1Hs8DvsQz5qYlayG3A4UVXH/NZgk9lpQtpPPsgxZbLcICJv+
	xFEvr7J/pRCwCD0qwzV0FxFiVF865mrAfsedMu+mpiyNn/sBHoREpQPmT6f9UjL3wo2L34MM6eu
	VFHJMhYILZF+NjrBj4lUd8Cbim5eIx7XS2IendGyX8CvO41VjUAKvkUncxQrQYBhXSl2fuizGpU
	XB9F7vX2kzZX1bLLNNsnFR3zebL60YcRvVjNeBz3+AGIYtscLxPdg6JeZ4A==
X-Google-Smtp-Source: AGHT+IHMhRQHkwutcXXHn/wCoJdjOJiIM076ojpeHFD9J2LtKFy5SLZaC6S5Pp+fGN+3tLjeuDvUrA==
X-Received: by 2002:a05:6000:4287:b0:3a5:67d5:a400 with SMTP id ffacd0b85a97d-3b1ff9f58fdmr5180887f8f.33.1751538434256;
        Thu, 03 Jul 2025 03:27:14 -0700 (PDT)
Message-ID: <88f20e38-2fdd-4df2-8808-778c63fe45da@suse.com>
Date: Thu, 3 Jul 2025 12:27:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/22] x86/include/asm/intel-txt.h: constants and
 accessors for TXT registers and heap
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=C3=B3wka?=
 <mateusz.mowka@intel.com>, trenchboot-devel@googlegroups.com,
 xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <5da8e6c9fd2d986cd99be35774b850584e4a43ee.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <5da8e6c9fd2d986cd99be35774b850584e4a43ee.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> +#define SLAUNCH_BOOTLOADER_MAGIC             0x4c534254

Seeing how this is used in patch 3 - why does this live here?
According to the use there it's something entirely internal to Xen. It
could therefor be limited in scope to perhaps head.S or the boot/
directory.

Jan

