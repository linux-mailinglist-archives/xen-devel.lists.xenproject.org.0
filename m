Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1CEC53200
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:43:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160140.1488353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCzx-0003cw-6p; Wed, 12 Nov 2025 15:43:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160140.1488353; Wed, 12 Nov 2025 15:43:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCzx-0003a3-3i; Wed, 12 Nov 2025 15:43:05 +0000
Received: by outflank-mailman (input) for mailman id 1160140;
 Wed, 12 Nov 2025 15:43:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJCzv-0003Zv-8s
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:43:03 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45ba9896-bfde-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:43:02 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-640bd9039fbso1796357a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 07:43:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f86ea13sm16131405a12.37.2025.11.12.07.43.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 07:43:01 -0800 (PST)
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
X-Inumbo-ID: 45ba9896-bfde-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762962181; x=1763566981; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SFf8juCkudErh44zooLXSedZjoB2NxiVe5ocYoeq6g=;
        b=QbLWJynL6RyeE/wxueJWfT/itO3eGu4NeoEw/i/jReDoMeLE5S2x1aZkom8BbBLiQQ
         qmKTM9ouDjuz+S13ERM7gI2dSai19At1Wmb7674a7LDpHjqAHQxsrwhNwQ3cItejXVm5
         FjtQDJUlTweD0XP7Oyi+lYz0gpWEWcvYK+pYMpUV4Fxv0/DZNlM0zmcPfAvnQwvH39o5
         hv5+JzZo/dD/iBzpE6bWBonoN3ULAOqZYx2FcCoWcUuoJ0UKPY08oa/T90kSlfK+tbLh
         x7T7no6Km0YAqeOFyM0iM0pmocxVDRFUOk2WpsyPZQVkIlyYuw9jRwe+U53fdgmK3ENU
         engA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962181; x=1763566981;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SFf8juCkudErh44zooLXSedZjoB2NxiVe5ocYoeq6g=;
        b=Pv+zxJEM8rbHht6Ozzkq22O1jLe7I0fsZ85gQFULXrZKZj7UQ2asz0c9IhEfnGsIt0
         JHhWuxogIXXJjvetQnqhASZVaoAGQ9WfgK5PGmqwn0nqF+z0ot0+J+GZwMNHq20/V1S8
         5xuatJ7sratMFlHedJiSwvkmDNlbItDAFI8AApwR8loP+gv8ZW1X0Esw2Ro8RF1pw/zv
         /boupvfVL8xTqSLKdqw3tas8m6e1uj9lLBWtK+6mB0SS2OoYYfRqlxzns4Q7ZDJMNDdM
         iHU6VtvCOs2W5MDgDXa1gsLJyjfGRTwqQI/SpHIGb61cDm0Qrnzl5+V5seK8QEavUHxa
         Ug3w==
X-Gm-Message-State: AOJu0YzF0Dyc66X3iLicB1T9iZLVg16p5nUXKLeFyb5Czkzo0bOlZozB
	PqdY+lXJ3DS7AZQLNl++7VSp2Fn0uFV6N2dV8vVcDx8ZeLwl51YDKgSuWNoH2f7mZtX6FpYNRdU
	/78o=
X-Gm-Gg: ASbGncsm6CrDTQyaho5bS5HfZkyCY2F2PP6jEC20m2F1zF9gdpC1jWyKrE293bwDdlN
	1i7c34Dk8vlnPhb2d0akpHcvNNoV8kfcXMmP/eFYEkwWzI4z7py+FMJnwQ3Eo78pzuj3X7BBG7V
	QQJDgGnV3k/oIS67BjeDBVH4Y5VF96vhdX7Q704IjgCdQy6zwfqX55fEK67pHRKpjNJz5/A91oJ
	nMwWlUdQp6GlpVT/f6QF18aUExg5PXxbCYdN+lG9Dp4S5dsD9XF2reQ9ehqLQqKTZ8igQG+61RW
	aNZAtIm3mkbRdYoVCmAMjBgteJsaolX6UBWJ+MAKpdlo+AeZNSuO1td/TM+lP3D+jgRJ+1/Mn9L
	1hvlwSRDd7M0KIjOGlpXHzVdVCILa51WZbFPqOqnlnPUdMNRu/M4Fl1l0LlaukvLT0rwZuvoT7b
	KJkHV5w7yjwbHqlEzyDnpnQQPmA//IIfNZxFxTyIy8JE2EvkdxpPqy2Mp4utaO1Z3X
X-Google-Smtp-Source: AGHT+IFc0/J/d2hr8fjKhIdErXbuFbWyu/1KJ6vm965wQOHY7XU7H0ofR2KAgmcBjTdUd+9T1F+oLw==
X-Received: by 2002:a05:6402:40c6:b0:640:b1cf:f800 with SMTP id 4fb4d7f45d1cf-6431a39286bmr3055364a12.4.1762962181555;
        Wed, 12 Nov 2025 07:43:01 -0800 (PST)
Message-ID: <88bbddc8-61cb-4284-9b0b-9735a4a8099c@suse.com>
Date: Wed, 12 Nov 2025 16:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/IRQ: use LOCK-free bit setting in init_irq_data()
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

Much like done later in the function, syscall and hypercall vectors can
have their bits set without use of LOCKed accesses.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -450,12 +450,12 @@ int __init init_irq_data(void)
 
 #ifdef CONFIG_PV
     /* Never allocate the Linux/BSD fast-trap vector. */
-    set_bit(LEGACY_SYSCALL_VECTOR, used_vectors);
+    __set_bit(LEGACY_SYSCALL_VECTOR, used_vectors);
 #endif
 
 #ifdef CONFIG_PV32
     /* Never allocate the hypercall vector. */
-    set_bit(HYPERCALL_VECTOR, used_vectors);
+    __set_bit(HYPERCALL_VECTOR, used_vectors);
 #endif
     
     /*

