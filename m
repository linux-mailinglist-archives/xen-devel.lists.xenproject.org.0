Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8B4A715EF
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 12:39:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927656.1330379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP6t-0004f8-Ne; Wed, 26 Mar 2025 11:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927656.1330379; Wed, 26 Mar 2025 11:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txP6t-0004cN-KE; Wed, 26 Mar 2025 11:39:51 +0000
Received: by outflank-mailman (input) for mailman id 927656;
 Wed, 26 Mar 2025 11:39:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txP6r-0004Y0-RK
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 11:39:49 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 063c521e-0a37-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 12:39:49 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso45098535e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 04:39:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fd28a46sm181439635e9.24.2025.03.26.04.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 04:39:48 -0700 (PDT)
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
X-Inumbo-ID: 063c521e-0a37-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742989189; x=1743593989; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/+vHhqPqauyzLbCnHOg4CDiwRpy3lLMT3fuy/6hifM=;
        b=fQmq69NkhFJ45XA6TpelPqMAVEw/3U5peSCDonPNHLZAnrlEROwebno2rofVKI41uA
         eChrye5lujFn3jF0HK9Eoxj5QoRR5WyI8pYREPACAjAQ/77eRrX6oNQT7H4beEZObbjn
         8geCF8/y0P1HAb9xyZ4NZ6bwJw1A14qdXscMz5InFqTeXSV7TInmuGAPGwpQ7Jt9Ku+c
         jMjgtXjL+Oxkx0MdScg1pwYKotqNuWD48YwO65/iqPcwADmhIgf2qkzfrSGhO87bXD4I
         yVJRd65xiSO/C9wnUO7a0dDdEHUv0/r3UXyywGdplE4IOOh6QkR0ps+BWx3kbNcZbo1T
         8n2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989189; x=1743593989;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/+vHhqPqauyzLbCnHOg4CDiwRpy3lLMT3fuy/6hifM=;
        b=tBVAjBWJS7tZ1v7mnfiUU/S2j8bOmw/bBuAR3dckHoY+DREUJncOdyLAxmWIgbGCYd
         eszG9QFL/wMmjKEJ4Peew9kJ+MEBDSq6Be7K+q7lGf7Rk7V2EaLXihEL/X/IshQ9w4yq
         UzJHet5DmJ8mKjWtGy2Tz+IqZoMtdFtiHyH+v0PraY7gy0eTxFVRD6YKxScV4x+xAHmu
         Aan8hKoBi922f7bjmT4pdJ6hG+hcdvkiDpP6NJSwuOfjc+gOrkFKyWWn27oJoIdV5aSU
         EeQPFJhvYfQ9MJ6tyLluFss3bCMmNZamsCUlRDwx8HIGh5IicC4PC5xtc1iGAnR/ufgU
         SR6Q==
X-Gm-Message-State: AOJu0YzxfS7i6/ZqP6+j63JQOipjiP2qP4BmXPgfULIT4iCmcp2ZEHhJ
	4o0W1P0YLr5nya5vXjG1JBvsxPbf3NVHaU7gAflYyVE/k3RSb3FM9I3askJjlLdvpq8yA4saiME
	=
X-Gm-Gg: ASbGncueWipE0zqtCUYjh8Rg4KMSSz+6+/UeQ4bqCLQqflV6bdzgo2YxOGkTV0SuCSD
	wq6Fl/SPvN4rmfI6DnzgefiuSiOPxlMiNwqmnIv1tquBt6VJNzP+pmwc5Pp6y1mJ7cL5QWu/yY4
	nyvlVXBoeMCrwHifzms540B2gZKgZ/QpR0Wx6Qcd39EG6eOGrMyjOqcpORQ2rDpCc5xQ9i/+0K4
	IihZDOZyWIgimGjNp8I3dW8agx9HqObVTtC3q7QLBGmlr3pclswmCpMSXbHSivL3zzwm6WyfHwr
	SvbKTSB7D063q6tZC3m8tUzjqomm/YCAExjcQbJwZoismjfeiq6AAqzs2BXeIPrcv57xshlVnAK
	cdF485peHvkhj/ZX8U2O0iXG7LsJv0g==
X-Google-Smtp-Source: AGHT+IE5PBs172wf9orGVNUEmtpOqTZRuW09j191tqDHjJEAe3ltZWiA5/xpAnDIjce/Xm301TpvAA==
X-Received: by 2002:a05:600c:1e04:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-43d62c6121dmr119223905e9.9.1742989188801;
        Wed, 26 Mar 2025 04:39:48 -0700 (PDT)
Message-ID: <fa6d6ca6-d133-4a9e-9da4-42b0c0b50437@suse.com>
Date: Wed, 26 Mar 2025 12:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] Arm/domctl: correct XEN_DOMCTL_vuart_op error return value
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

copy_to_guest() returns the number of bytes not copied; that's not what
the function should return to its caller though. Convert to returning
-EFAULT instead.

Fixes: 86039f2e8c20 ("xen/arm: vpl011: Add a new domctl API to initialize vpl011")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -172,8 +172,8 @@ long arch_do_domctl(struct xen_domctl *d
             break;
         }
 
-        if ( !rc )
-            rc = copy_to_guest(u_domctl, domctl, 1);
+        if ( !rc && copy_to_guest(u_domctl, domctl, 1) )
+            rc = -EFAULT;
 
         return rc;
     }

