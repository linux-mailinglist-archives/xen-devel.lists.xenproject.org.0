Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD2EC0240A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149423.1481089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxbu-00072s-Hl; Thu, 23 Oct 2025 15:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149423.1481089; Thu, 23 Oct 2025 15:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxbu-00071T-ED; Thu, 23 Oct 2025 15:52:18 +0000
Received: by outflank-mailman (input) for mailman id 1149423;
 Thu, 23 Oct 2025 15:52:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxbt-0003ZG-Of
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:52:17 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f83bd5e-b028-11f0-980a-7dc792cee155;
 Thu, 23 Oct 2025 17:52:16 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47103b6058fso7644415e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:52:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c428f709sm104727735e9.8.2025.10.23.08.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:52:15 -0700 (PDT)
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
X-Inumbo-ID: 3f83bd5e-b028-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234735; x=1761839535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Edc9JejnVOurqFLHJl7vyGwNsXxDwYwpev1b5zjSyqQ=;
        b=UgS0dPClJt7nMmT3hN4h+Y5IfJ9VZT2jN79tC16hPGvZaDBXsfgLbHi3Z+nEg3iN2U
         WwN8s3weT7wnq2Yxb6XHiFyQMmfjF6KDH07B1a9gvHFQDKZh3KjCrZGq6CC2uVeKcgX+
         qKJhIaxpM9DKqsVHtZZbo2wdszKMdPZrlcg4zA/n/RdhfF87igqUq547SEkeE/XYFfyi
         DUTLjWkus38EtreTG4kKVeCFayq6axK9QHXMPSku3fLZm45Zjvib9y3yq9zhFH7ctbuX
         XECRp+LjtpH8+nMNjiGWkDQ69Ewo2dI5LxWbZFqEXYbIcjQ149bCV1uYc+pvYFlf0s3C
         BoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234735; x=1761839535;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Edc9JejnVOurqFLHJl7vyGwNsXxDwYwpev1b5zjSyqQ=;
        b=rmcVxVtjNx+uX/QB7TzjObtgVaLQjMWHupLvtaaCzEEh6yOHYdZzHlxzc6850H9p6t
         Eftje5NQZ54zwN2AKSYlcua9MuFYnt/IwNtFbv0CmMJe4oBYqGmzQVY57lx0QJNSlDGO
         MyCitwwHM/QzaaQ3yWnZ7yuAdMCyleHWGTbW0LEjFUgSiD9cLqx3qMFLsSG6DiPhzqDN
         bbyr89gsRXGSm/1xV5KGqduf1rMlqtVb6Vbc/TRnADUc8TVJQZ0k6JQdmCYBZzJYdIJo
         ONPd/y7xHncFtN9Zhz74ACBBq+zw1aXfiFoim+b/Ob1X2B5AWyicVaFcd5nuESSCf1mX
         e+Yw==
X-Gm-Message-State: AOJu0YzWpxWhnLIshxpmv+bvaBp4VdBVhxd5QwOXu5YnyD80SuTY1Coj
	I2wYY+gkI1CQmCs9FO2yR5UuUCZba7unXE3kn74dIwwEyoxmaIIDN90FpACXsE6A6Tr9B6eqKU1
	dzjI=
X-Gm-Gg: ASbGncsBoUNMRkNOmIs6kHbyT2btMymg3kSHkNEII9o5Aqz5guWGJ6YHB0V+THQP/1Q
	vgpSKAOAIYMiTdI781yJ+M3v18AmbLF1OoH7fK81VE7KKSepx0psPKsM6Wg0nJBjvGb7Y1bRDVO
	gteVwc3vxZ5q9DjIAHusBYCTeO241Q+JFeIDDogNJ5zvgq2GqT08WELfGuTyd/sW5W38TacbhNW
	1Pj1yGD7ZOG25ZRO6cy/ENnf7qIT51T3zFEY7YnNVHZZBZ8ax3Yofm9IdrJDGRLwRkl5yAV4bGo
	Cw2UOv6G8htfISA3K2+j+lHYcbMHlpDfw6SLIPM+PnnMHT82vs6r9yeW9pm+J2PsPjHN/32L8ee
	AVtaWOVobWT57/uqmbY8n6isoHsJADgACwXaTpDZcgM7/rRy+PJvxyLZOGxUOIMhp+zF+ehKJFp
	3Ay6GEAD2NPvCoJoQ/dmmD2z70/Dkf7mZPMx7PQgOPCYJooXTr9S9HbYsB/AbHy5U5I02g5l4=
X-Google-Smtp-Source: AGHT+IH5gdWl4wMqnzk1J4RYATwheSuNMWvOGJi+6NGUWwBQatZNDjqUztJE5axxCaLk+yZUBVfO6A==
X-Received: by 2002:a05:600c:3f10:b0:46e:6339:79c5 with SMTP id 5b1f17b1804b1-475c3fa1f3emr64243325e9.5.1761234735503;
        Thu, 23 Oct 2025 08:52:15 -0700 (PDT)
Message-ID: <18f2e2b9-94f5-43c1-9801-e7ca7d7a74b0@suse.com>
Date: Thu, 23 Oct 2025 17:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 6/9] x86/HPET: move legacy tick IRQ count adjustment
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
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
In-Reply-To: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
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
@@ -804,13 +804,13 @@ int hpet_broadcast_is_available(void)
 
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


