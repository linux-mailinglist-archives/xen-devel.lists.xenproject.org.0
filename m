Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B219BE1EFA
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:34:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144192.1477646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IUg-00005r-VI; Thu, 16 Oct 2025 07:33:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144192.1477646; Thu, 16 Oct 2025 07:33:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IUg-0008Vy-Qs; Thu, 16 Oct 2025 07:33:50 +0000
Received: by outflank-mailman (input) for mailman id 1144192;
 Thu, 16 Oct 2025 07:33:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9IUf-0008Vq-V6
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:33:49 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74a620b2-aa62-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 09:33:49 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so4496435e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:33:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426e6f03a76sm17261029f8f.36.2025.10.16.00.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:33:48 -0700 (PDT)
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
X-Inumbo-ID: 74a620b2-aa62-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760600028; x=1761204828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=13M+/3VJWIBsfQVB3cpUAfRtGMDjQMAaPR0JB5urI7I=;
        b=KssVAodpTmSbaxlfMRCgZXs0IogyXFJExabr6c734Jr4R+ntH2wvAnYgaVPK8agK2B
         +f3w/Rc7hSo677uXRAdtr6em1qztfEysnRZugdZ6CirM2ssDbZN5b8n9DP7vclm4N5XG
         5VHWno3OgbP/q0w60u5i1iJtzGk46YpcHJnAUyzt3At6O2QFxxH8JJRZy2LDWDzqKkKv
         cehrnG8lAk1vMBXwE2L6+ZGTiF6VaII7nMNbsm9Tr//ZoPx+8kus6XPsIn8/vpIvwQE6
         5ExuvWDhYRqYqeBmuBDAuvpzwfYe9i7V4B5Fl0zJ7Rk1DDmeoGQqjJAo3rq7YFUr6CZD
         Wq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600028; x=1761204828;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13M+/3VJWIBsfQVB3cpUAfRtGMDjQMAaPR0JB5urI7I=;
        b=Gu6/Kx7JGBxYVNkJDFFbTXSGyW63JSkS+8vZ94O6hSAFb3tI8eDgrzOLcQFeHXnWy4
         /FLp5wZckCGsk4UOvfyZbXN2DPMR8563y/kqaBRVb2f4rXw6xqYvfqlOCkmmrBxg5DEH
         QFBXcpACDIGHbAIDF2oiiWyoZvUGkky20ig+OvF3tkFUeOQB7WMcniK9/b2wSNu4k8Fo
         ZChDvucQh/VhLndCDd2xoTqMeYKQqleeaF6xvuFIgv5yuK7INp4IoOSdl5YQ21H352zk
         Y1fO4HgpC+XBcyl9dCNmKWPI8KCVPiiByeZBB9yrj+OnUGx/m3MNzRLn6LQxSk2njPjw
         0EQA==
X-Gm-Message-State: AOJu0Ywjs/GjgtdLjZoZnorn58YYoO5rIDBfBAsw+MZPH9/2IutXNBZP
	ngLvJp8c+sEMrXyZTf4tPLZKKoYD9oatEqDTaQxWJVJrA7sVTK5i3dVxFqxbVurHojDHqewUSz0
	6LOk=
X-Gm-Gg: ASbGnctV3qtIb6IGx7X77NmgvfqYPEoC6LwtbUyyZ6sqedG8QSy++Gctb9OkiqLEpad
	Qnd9AOVOV61i1KReu6pHnhLmiAqrb8kWFxye447L4eJwv5jzQO3DRDU8cdV3eiK4mSwNj6/ZAjc
	2cK+VdmDYFfmSzGmIBw1d7t55+gJ2nPB2ww4o8q55fdpKPWowzGYpcyXF0w/I3Pn80ykS6vkblW
	FyKL3r+uPgSXrFj6lsmKc9kYHtVSqfcDINdYB2J5XKZWXpJS5nPVGFFibzSdXdEHpMXGP/BtYIG
	I8YZOfZCl1EhUon0R1L8qwhV6Q2NXTnVUsIxfttPTcQTsQOfZ9HZRGXKIqWugiah/+pq3u26fgW
	sKa/IklfsGCh9bpqu0Gb7dcuy86XToeNgSwCDy7Xls1ZvqSv4/nwdbgF8XVhOdgNTgr2gaSP5Kd
	lv87f9SESm2LlZCJINqfw+BdseRxs2sKQlTl10to+IkXBCcgMHh6PAuvYzxKJ1Kfe2cNfMqzI=
X-Google-Smtp-Source: AGHT+IGGKtxw8FOpuJTAG3en2jjMRpRrwVESgBykcZnUULvUrUKMyLfwxAsdL0Wx/HXgonGvGRPTcw==
X-Received: by 2002:a05:600d:634d:b0:46e:1f92:49aa with SMTP id 5b1f17b1804b1-46fab65d93cmr142158845e9.15.1760600028569;
        Thu, 16 Oct 2025 00:33:48 -0700 (PDT)
Message-ID: <c6ad1e1a-b008-4c2f-8385-e8bcaa7bffbe@suse.com>
Date: Thu, 16 Oct 2025 09:33:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 07/10] x86/HPET: move legacy tick IRQ count adjustment
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
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
In-Reply-To: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
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
@@ -788,13 +788,13 @@ int hpet_broadcast_is_available(void)
 
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


