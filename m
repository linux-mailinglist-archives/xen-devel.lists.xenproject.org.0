Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3BBCD6B84
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:53:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192297.1511603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXjAB-0001Fl-A3; Mon, 22 Dec 2025 16:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192297.1511603; Mon, 22 Dec 2025 16:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXjAB-0001De-6Z; Mon, 22 Dec 2025 16:53:39 +0000
Received: by outflank-mailman (input) for mailman id 1192297;
 Mon, 22 Dec 2025 16:53:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXjA9-000115-Vf
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:53:37 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1bd1f42-df56-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 17:53:36 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso32831145e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:53:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be26a81b6sm256333345e9.0.2025.12.22.08.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 08:53:35 -0800 (PST)
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
X-Inumbo-ID: c1bd1f42-df56-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766422415; x=1767027215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OsI4gloEQwSNKupVpgjb2Rjg/GFGEQhJx0eZpnb+0kY=;
        b=Kvj0gE52rfDUjh5Q08Y4to8rdew5zYeR98U/RzVKLz0ZB5Jn8ikPbd8D7enn6a6Sbt
         284QOLcRibV+U96uzWUUrMhTZYXrL0nFcxO+F8Yr7l0fMPWH8hVeNEJ4LuSSHpqO17J9
         yLbqjBI5tuJqHkMHe5bCSusc4c4Mp/BCYZeTWPpPT4kjYhvQjJeDQa7rTg4chwy8TLp0
         hFejHo0F+LoSHMWKfWouYa7bAqAJA3zXnXxGGEz1b00KlSXxE1sPHqfmLIqbge9VKA62
         08nKLQhHTaKnCsJOurmDnW7AzBPfDtO+2Mie0JdnEXsKKaUdpeiD+JNdilofNFetBEdZ
         C2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422415; x=1767027215;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsI4gloEQwSNKupVpgjb2Rjg/GFGEQhJx0eZpnb+0kY=;
        b=lvzAQXdJrLbboN46I6DZXf8mHN4vloqgX1e/nLk+UiVjDOwJJZz//B94g19yhxzFwy
         TScICS/ZpVptTkXkTX0H/KO1XIU1A45R8PNteimairMO/vaiaOwGwEYlzjN7wah9WFMN
         MqQ6XY4KnyeVGxs0z58yuiyx/eWnMjdmXo7NHI95cW4yOIgFAIXLPIhzAFSoTBqBbyCT
         8xUf6NhyEHzQUfuAm2JcaKgoib+WNaKxzewQJhFJQkYQg3xGcJ81coXEUBWBgsoMDGb8
         gEBrupIOiM2Zieoa8IXBcFbcgoV8Sj3icyvkIABEcz3260nxPYLmui5Jc5E3GVt6Fonw
         VVmw==
X-Gm-Message-State: AOJu0Yw/yZDVq5mbFD59k0xKQsDKJn5NOZrkDMCpgRZTfcZ1wWVAj/0d
	3mOx5v/YHBf3hema4azy1F2VrWbua/MQnf5ED0hVfq021WoEQqWNZf42aS1M2Bc1zhz5HqPCz4T
	21xg=
X-Gm-Gg: AY/fxX5oaQMhmjOOvQ3CssXX3bI2qBTcJjjebugdmQHgJ88FugK/5nvJ2oI4Vq5IjJ3
	+Z79KMTfD4OvVWSP8TqForF2Dh+vgdxIp5RkWBcFD/XeWoaQFlGyEd8OBNMVu/nAgP7sqHhLTAN
	L1tAw7SS0hWPXcfJ3/Zbs4FlYGIITMxs2/GNH80x1Ccu0CDWrpDl7z0jzGcr3Qh5aazapiqOmYm
	Cmv5m29ScCjGBm7v213mSwXzux4YcVzeSTvC7fcSlpOfnmgFdAD9RpU9Cf4hdfClzHMDB0JalSR
	i7ytWX3o4Gf51OpJ8tBU3h/DAVmxZIuDkxDNZg5Su2pe7ZxhNGjKxZhYkRTk2AQG1QADoeSpXeF
	17pP4EHa3BL/7ZCOmE1XG7RM7ZH2h6APNDii07L1h5bqNZZ7GYjJF0SL0UvewoeaB5zg7mxs6OA
	wvO9ElgtWeGTzw/61ysb3N7Dh6mjCtpOM0M3iISNer2WTHelCZNkgs4az1snvDCgr44G/PdVYFe
	w0=
X-Google-Smtp-Source: AGHT+IF2lC4cnqGNcq2rVKk1AV+Bn5JYXNhVRLxThywUFL+h8Cas2G9mfgXMxfXU/ehzBirTEr+WXw==
X-Received: by 2002:a05:600c:8b11:b0:479:13e9:3d64 with SMTP id 5b1f17b1804b1-47d2d273999mr45505925e9.15.1766422415444;
        Mon, 22 Dec 2025 08:53:35 -0800 (PST)
Message-ID: <c3fcc1a5-6479-400b-b65d-35d7d7233b4a@suse.com>
Date: Mon, 22 Dec 2025 17:53:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/cpu-policy: enable build of fuzzing harness by
 default
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
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
In-Reply-To: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... on x86, to make sure its bit-rotting can be limited at least a little.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/fuzz/Makefile
+++ b/tools/fuzz/Makefile
@@ -4,6 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 SUBDIRS-y :=
 SUBDIRS-y += libelf
 SUBDIRS-y += x86_instruction_emulator
+SUBDIRS-$(CONFIG_X86_64) += cpu-policy
 
 .PHONY: all clean distclean install uninstall
 all clean distclean install uninstall: %: subdirs-%


