Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E8BF0D2C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146197.1478667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo1q-00079G-5v; Mon, 20 Oct 2025 11:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146197.1478667; Mon, 20 Oct 2025 11:26:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo1q-00077a-0Y; Mon, 20 Oct 2025 11:26:18 +0000
Received: by outflank-mailman (input) for mailman id 1146197;
 Mon, 20 Oct 2025 11:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnwI-0001y1-2l
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:20:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb3dacea-ada6-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 13:20:33 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-471191ac79dso34219125e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:20:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4714fb1b668sm160551465e9.0.2025.10.20.04.20.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:20:32 -0700 (PDT)
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
X-Inumbo-ID: cb3dacea-ada6-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959233; x=1761564033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gZ3R8cULpQMQwOc+UqUj9nrwmmhaEMKCYifki/vLVNU=;
        b=DceKL+9YLPjkm+el3qQR0zM0kdrAAILTW7+s99QFuTdkECgcvCUqCnXuOS1YKFmAPz
         yVODD3cuJutIbU4IOBXUpF4qVJ0dSDLxslOvxFdsXOd6POfFx2KQwRraFRXghJlNKrOI
         RT5Zck581EgKzeK6uFCDHVzmtC9blw5PeWqKN+pX+AsBSBgUXQFBMKDaRi7kVscKTS5m
         WeLUUe2wWn91Flqh83DicYEh7TXyFs7AMf1b8Sekbfw8mZurZ/pUk8v9B6V7DUEwPmMm
         RActOaAw1Oym0yFJqOVafdYxFHdnvEkWjIYDX5k7hBhYsJQWuq3L7vCND2+UVOP6v9u5
         XHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959233; x=1761564033;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZ3R8cULpQMQwOc+UqUj9nrwmmhaEMKCYifki/vLVNU=;
        b=FBuFaqSTZeiGy5kNFYIO1oqSxMI7rzGh3Q65M1yfKvV+kxmH7Quyno36AGeog5V6Lm
         k8ONaylJFIlmHJMTWeSZ307DfKZunBhHlCwbGbJkdH76VXnlOsIPhlPOSuLRlYDJnKT2
         gQX4itjCfTZMf7y8FxfXS9ZrK0U/7TIxl4rtJN2JHovwnn6Eh2qT7E3yihanUN3fAIpn
         Bq4Y5CR80/vhcpF+S2vxtA7yPUCczhEjgR9OE1K/WZcEOTY3NioF3vGrsm5t62aTNTYW
         pmoCDRmoqpz+FWT/3cfocOdnKUxvq6zNiJriIyt5noI3YvZLHesDA+8a0yxxfkr1iPMY
         tDiA==
X-Gm-Message-State: AOJu0YwcAJrx2STC82MfxipS8Qt8cHCSDCOzI60NtIVlRHTWONW/Rx7y
	Me3mtAL36q9UIFoEpFYKE3CdK93VImSzSDk7kjJBoPFmlIKOhacsoHlSWoM9XSo7AkGfJN5z9TS
	Acng=
X-Gm-Gg: ASbGncvNiFe0mFBECcDOlRDYxzAkqAp3Ai/lDizyV+w5zKRA/l50HpToyvqsofzfXuV
	sbxZfL3LkmFmcpD8uWZn2gkPb/IanlEzR+CfIRQGM1BjGh1ckWfnp0oxQ/XmR3hyQKdY0eNJGfV
	kIaKRIhLvS2Wx/0U9nJ7ZW48EmQPcd7a50Qfbg4/HAYo0d01OKa4OaMQcvqe+6EhEBC4jAJ+FEm
	4Ee6hvZqsJoSENkfv5yJ1CthkyJkopARGuHrKFEK5tYx9xONr+DeNMTYoeM3Nsntp3Xn9RpYK9S
	ssrJeh2N+KQo5d4GlrJRzPsDJJ2fczefTjDGS9vbTOwdnqfzUBK394SDrwvEPgoPi6sqhLiCHvM
	1PYohOXKT5PxfvHMWBLX7b0yvI1dEffVwZ+P4aJ4V0H6EjFmUmeF0iCGOBkLyYFqfxcQqYNzhms
	A6BZD/O2NXbZrHRTCMDS9nrnpJgjAW0eADXRu4/Zr7vqJjQ3EMAE7bYhvPwvIF5JK6NZz+z5g=
X-Google-Smtp-Source: AGHT+IEi0i5z6/lAoElAu4dVvd6h16qlzj2i2NBbrigFv4RURjPUaGqDEzcD3w8BLdN8pnmTaMGhjw==
X-Received: by 2002:a05:600c:3b0a:b0:46e:4499:ba30 with SMTP id 5b1f17b1804b1-47117917a33mr109948755e9.30.1760959233050;
        Mon, 20 Oct 2025 04:20:33 -0700 (PDT)
Message-ID: <4cdeac0d-8f73-44cf-a78e-8e3490047dd6@suse.com>
Date: Mon, 20 Oct 2025 13:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 6/9] x86/HPET: move legacy tick IRQ count adjustment
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
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
In-Reply-To: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If already we play with the IRQ count, we should do so only if we actually
"consume" the interrupt; normal timer IRQs should not have any adjustment
done.

Fixes: 353533232730 ("cpuidle: fix the menu governor to enhance IO performance")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
_Why_ we do these adjustments (also elsewhere) I don't reeally know.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -802,13 +802,13 @@ int hpet_broadcast_is_available(void)
 
 int hpet_legacy_irq_tick(void)
 {
-    this_cpu(irq_count)--;
-
     if ( !hpet_events ||
          (hpet_events->flags & (HPET_EVT_DISABLE|HPET_EVT_LEGACY)) !=
          HPET_EVT_LEGACY )
         return 0;
 
+    this_cpu(irq_count)--;
+
     handle_hpet_broadcast(hpet_events);
 
     return 1;


