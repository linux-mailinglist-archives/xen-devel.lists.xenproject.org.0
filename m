Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32B8C023B8
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149367.1481028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxYR-00033T-TJ; Thu, 23 Oct 2025 15:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149367.1481028; Thu, 23 Oct 2025 15:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxYR-00031h-Pq; Thu, 23 Oct 2025 15:48:43 +0000
Received: by outflank-mailman (input) for mailman id 1149367;
 Thu, 23 Oct 2025 15:48:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxYQ-00031b-0Y
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:48:42 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf4277f7-b027-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 17:48:40 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42701b29a7eso556129f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:48:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4298bd78c69sm2793173f8f.4.2025.10.23.08.48.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:48:40 -0700 (PDT)
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
X-Inumbo-ID: bf4277f7-b027-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234520; x=1761839320; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gfPihCtXdL46vjX4tiPgS10Ir/uaij0i8pZE5giXkjA=;
        b=YiVR5ssg/VWIiK/0C50gPCZ8NOzJhr6NOhC6tRsq04RWyzp79Ej/kYa5hj2kosE4iZ
         caTvoiAEhtmf4O6p2pHDyRMO0hdcWEzAcLFAfq1q1J7RjBm0SdFKLvx6TlNCKx24C6Yx
         5n6E5oIjIrYXviHOffi6DKydVsknZoPOjm6DLchZMpj91bDenvAeIWCQgI7fSCNCoXvt
         8C2S1RI4tLfGesWqIKwOEEUxgueNrT8lWVA9hhzwGYHhFCh0M+nfAOQPfTwJTgTYFKkh
         ysSXnPXV+dj+26Y3SQCzJumwq671OuNntGkFk1jtm9Fn4TI4C7TEbc7319FcYUr9YoTQ
         5chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234520; x=1761839320;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfPihCtXdL46vjX4tiPgS10Ir/uaij0i8pZE5giXkjA=;
        b=Qe7f/X5zZIJ6FV0JIaw/lgHbTAXuk/3QVeZ7q4p9jGnGBx0hsIJfq3Zm2a4Cch4ido
         EBcC+OIcb+0tbzYfdBoDBtjSIC/r13/UDH7lZjd3odTuce0Rwhityq+MFnucxV/VIS4x
         5C+90VK5ogsdAaKp9LImkdYQoeb+yPfBcosoxFtJp+R3wIk+lJmizXoDKo7CPFnKi2Tr
         md41A/W1axbS27yn9S8qjIJvwqC/lecsOme2Or9dxSdiWywCkSH+wN+ZVgCgSx37GulQ
         gLTcab04MQjIwJOaKZDIu+oZhogfXRYka6k0a4m38ldx+PETvfxbXXG+V7sGTiixhnRQ
         5raQ==
X-Gm-Message-State: AOJu0YxuLmjPvRNhDD8mYgkRNV3dIKJlrVWG8Vz2HX5g8wrX1aZIoR+k
	IMoxBEUmVwu713RkybS+iMJsCKbRE/ibEv+ovrr/Hfau2rLOu89xO1jDDdHxXirCz7Q+cFLENrh
	eyjc=
X-Gm-Gg: ASbGnctxK78WV2XtLXLJd0s6zffKWmpJbSKJDWoptdnXwTmcsQU8h+iwO6RLJXjN8sF
	BwqZDWd1Sl4ix9uEqbGm81Xk9YN9e1xYbv7euBpAFfwSMOcVq+l4fG3Sbaux6sdUOmot+EuIeQb
	+2ooCJY8q7PPitMpfSQ9ahXp64KDdQNMcmK8DDp0pshUnPQh3VSMdi2OSToAGQTsLBktWFbm3nr
	4svBYtEK11lcSRtXeFLznRuudiCZuQ+RGe9lmouZwQLRvOIZ8X6tkLQwXwhl7bAOgoRsSkbc3Fe
	SfHGzWIDVNdzvrJg9f1Ot8wP+/NxDmS/dlQU69zrI0EJuc5JGa83f992/cjOFsuvNZX8WUlcHha
	sFjzSsv4dH9f624QhldHFHfEWDajI/1k6xW1vZuDCq3Xc2DqJwZbGd5hK3LCZTh+rCMRx6kpz83
	BkMJD45KxNjASFw0YFRrJhJUjRophwxsuiGghftHUnOFZcG8r9uMaqrzguUk4a
X-Google-Smtp-Source: AGHT+IHrSh/hYXSqvERqrQXNB04WxyfX29UWzd/FpT5aRDKW/RTGsyE/HDPRlcARKmI0A2InnaOSzg==
X-Received: by 2002:a05:6000:26d1:b0:411:3c14:3ad9 with SMTP id ffacd0b85a97d-4285326f9b4mr5512048f8f.21.1761234520228;
        Thu, 23 Oct 2025 08:48:40 -0700 (PDT)
Message-ID: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
Date: Thu, 23 Oct 2025 17:48:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 for-4.21 0/9] x86/HPET: broadcast IRQ and other
 improvements
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Language: en-US
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

While 1db7829e5657 ("x86/hpet: do local APIC EOI after interrupt processing")
helped quite a bit, nested interrupts could still occur. First and foremost
as a result of IRQ migration (where we don't have any control over the vectors
chosen). Hence besides reducing the number of IRQs that can be raised (first
patch), the main goal here is to eliminate the potential for nested IRQs
(patch 2). These patches are imo 4.21 candidates. Patches 3 and onwards likely
aren't important enough anymore at this point of the release cycle, even if
those with a Fixes: tag may end up being backported later on.

v3 has again a fair bit of rework of (not only) the "main" patch. See
individual patches for details.

1: deal with unused channels
2: use single, global, low-priority vector for broadcast IRQ
3: replace handle_hpet_broadcast()'s on-stack cpumask_t
4: avoid indirect call to event handler
5: make another channel flags update atomic
6: move legacy tick IRQ count adjustment
7: reduce hpet_next_event() call sites
8: drop "long timeout" handling from reprogram_hpet_evt_channel()
9: simplify "expire" check a little in reprogram_hpet_evt_channel()

Jan

