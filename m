Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F2AC02419
	for <lists+xen-devel@lfdr.de>; Thu, 23 Oct 2025 17:53:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149434.1481099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxd2-0007kN-TW; Thu, 23 Oct 2025 15:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149434.1481099; Thu, 23 Oct 2025 15:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBxd2-0007hZ-QK; Thu, 23 Oct 2025 15:53:28 +0000
Received: by outflank-mailman (input) for mailman id 1149434;
 Thu, 23 Oct 2025 15:53:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U0PU=5A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBxd1-0007hQ-BD
 for xen-devel@lists.xenproject.org; Thu, 23 Oct 2025 15:53:27 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 696c909a-b028-11f0-9d15-b5c5bf9af7f9;
 Thu, 23 Oct 2025 17:53:26 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47117e75258so7729415e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 08:53:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c4281314sm103700925e9.4.2025.10.23.08.53.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 08:53:25 -0700 (PDT)
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
X-Inumbo-ID: 696c909a-b028-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761234806; x=1761839606; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfju5TuSYr1gnKBFs17R38Pvw/Jb2fzNTTH63D/Pa3U=;
        b=eBy4ZJit/ANNGxvUnlT9DNIEip8yiLFna+IZJKj0mS5k8gDU8I0FoBmQYAHN977b2c
         qv1eqvRSvNbgxKZbIPtRGDsjv7xeIPfe0cF+Li89eHqx9ste80G4oc41jAH3RuxXzZEx
         TZICiXIIGSwJzdhE7RZPcF6xD+9mMPie5kicm1PmNplg9EBYDMgD13H6KuNo/Y/4wqDL
         6T0V2N5tUXajq1HCtQWz7esFWKeXgQEqVEbDaUgOI3tcaO5Adpefl/rwpAv+49nSIl/E
         jssEEhbdu71e8FQPaQelp4RrTui41+1ffm/rrHUoYUeD+SIiI26F5QQZGjDNEJWPv6k3
         bB0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234806; x=1761839606;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yfju5TuSYr1gnKBFs17R38Pvw/Jb2fzNTTH63D/Pa3U=;
        b=dgATLl03eYsTSizBivoOSpoCd7P8OiRlwaR0TURVzTi4weZ2XTRVgytfDIccvjteoD
         9G7M6gT1IHN27MTynkBRPr6zuMMpJcEBqOF2gQ6iaDQnIsy0wytXqQEHPgm0BH6M6BG3
         ShiqHVvog6EjY3ZsmlH+8ywJWfOilMWBzRnoiTU+oQUv5QYszb0CIXn+SYMDOUFgGXDb
         YWilnzEJkDc6oX5pQW1INQkiIGZJYc1/BrL9gylUfrXw1R2oVMArP79n/CYVz6fdXvwi
         knHw9hkjtRu3iLpPNyfancFAIPmrlzgG1fxSCdI3l4naZ/imDovkPxjyYxntnaPuNvjr
         aI/Q==
X-Gm-Message-State: AOJu0YzgMteBUGgjeRcMSBu6TqRZ1HTTW0cqkXywjvlFdnnssaPGaTTe
	N86wJeOk1RL08qtSs0SL9rpA2z0a9+Ptc8ezbTm9UnFMG0hy/lYEZ5ONAA3N4KOAEdvlAwwNxof
	jrpM=
X-Gm-Gg: ASbGnctBhNRDb+bsBbE9QTgkq1oEh16R0IWoyezl/pUrbhB8Xz0Z3b52KAv3KPK3krE
	2fFA/0NHZjSl1KAYH7F7KmzhjCKpkc4WGuXuvrGfGoreQTgdgy0vPH/5mVLsRtL9SvZUcFtevp6
	QtXwJDG6kKgRyF5KlVEQXwzEHa6jlDiZItAgyhBhjoKLioxwLEbBAno9aK/5L8yNzMPgEUE85+K
	RdLt41CwglLCZmErB3DPHRqAmlkwjAX+yYCYf2WraILEqGMbtQ9kQlHmrTkw2sPa6uIo+uAiD2M
	bGgwp2JC2xHwnuWDVuWK4uxcB59S9E7AM+AB/3cjRGtc1chl4MtPxGq/9lKSjUqNFkjv/fIkzyM
	mZJJbJ9RGW51RdAIf55YgVP5QIT1KgVU3p+GyTQHfshNrUfykCrj+ioVNsQSMhJmXw0BSCKP4Q3
	VK7XDL3ua3KW8atIQkQmXCauzzzAHGuj1HmIOT+TN/tPJX+fEmwwaGXkz/stPT
X-Google-Smtp-Source: AGHT+IHeklUfRModfDEmbNU6EzqivzIwOReNcO1R1E45nwegGH4IqjeeVfWLsrm4xTPEWX7N8fLelA==
X-Received: by 2002:a05:600c:4695:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-475caf92922mr21227715e9.7.1761234805771;
        Thu, 23 Oct 2025 08:53:25 -0700 (PDT)
Message-ID: <f6783786-6cc1-4baf-bcdf-ab8d0a78266a@suse.com>
Date: Thu, 23 Oct 2025 17:53:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 9/9] x86/HPET: simplify "expire" check a little in
 reprogram_hpet_evt_channel()
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

When this was added, the log message was updated correctly, but the zero
case was needlessly checked separately: hpet_broadcast_enter() had a zero
check added at the same time, while handle_hpet_broadcast() can't possibly
pass 0 here anyway.

Fixes: 7145897cfb81 ("cpuidle: Fix for timer_deadline==0 case")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -147,10 +147,10 @@ static int reprogram_hpet_evt_channel(
     int64_t delta;
     int ret;
 
-    if ( (ch->flags & HPET_EVT_DISABLE) || (expire == 0) )
+    if ( ch->flags & HPET_EVT_DISABLE )
         return 0;
 
-    if ( unlikely(expire < 0) )
+    if ( unlikely(expire <= 0) )
     {
         printk(KERN_DEBUG "reprogram: expire <= 0\n");
         return -ETIME;


