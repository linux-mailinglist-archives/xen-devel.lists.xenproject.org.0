Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EC1A6A293
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 10:28:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921527.1325348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCC5-00078w-Id; Thu, 20 Mar 2025 09:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921527.1325348; Thu, 20 Mar 2025 09:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvCC5-00077M-F4; Thu, 20 Mar 2025 09:28:05 +0000
Received: by outflank-mailman (input) for mailman id 921527;
 Thu, 20 Mar 2025 09:28:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvCC4-0006dm-11
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 09:28:04 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ed253d4-056d-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 10:28:02 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3965c995151so264207f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 02:28:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997d508c1esm438589f8f.93.2025.03.20.02.28.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 02:28:01 -0700 (PDT)
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
X-Inumbo-ID: 9ed253d4-056d-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742462882; x=1743067682; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TDEhA7DZ9wsCfgW9f+m0HXZi4nwIFRLtsU3Cna1jSkc=;
        b=HOSKXGtVRVYuDMhAvnPVTYBmsLzltCt7KdvYGzgWhjAMOKnCI1+ipgIGo7Y12qORJm
         ShAdGgB5eopJeiP25+nSCCk7t/nKZmFp6GuA9gG5mqcGGxwOHbdVRHvSQNpKjpyYOKUT
         87qCUxTlVTpJL0gQNRqCqDKw4BPEzVOXOUYRFd1b+QrGptQurUyOX+5PObvwa9WKiEzA
         sjClxZBODePgBUlRd5y+lPeWvaIlFjzDCkMzsV42sptecW2nnHgkQxEJacSMMP7T5ADa
         gUwIqOzeAMWP5DhPHSDo87qNce3O2VwWCERHOIr8kMW0GTzoSi6xEG8v9D+ABDuGinvG
         Y7GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742462882; x=1743067682;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDEhA7DZ9wsCfgW9f+m0HXZi4nwIFRLtsU3Cna1jSkc=;
        b=mrm+4ht1uUwzF3uT8jJeXlU4kn1pVLdnTxdKS6iq9RiyVi78LuOcmgRSyN0A6qTsN9
         J1kmLS9yEvuOC7xvrtxQM5AivYNDl0p+PcidBmftHPleGEojqwQbGg4QMUxIlGShCy0A
         qq28k3Z5MK4khsL+VR/A2uWslseDHYWmZ3WvU7IlrNKGqgx6/UujB/XUq/P0EsfwyUsj
         NMi1n2LuJRKbMwSrrsAJU3zSCe/0WI3cxkm8Djx1gKoTKsYS4VVKk2iwtmVVEWds1I0H
         pPXx6yp2blft45plKVVizKpfQxO9UiE5SbgWuqxkt5jEvOtLnqfvFWH0lZlBWbiKyGZC
         xn/g==
X-Gm-Message-State: AOJu0Yyv8C/YSoywLKAaA5jDDKXaxfK+ElHMehz3cTJBboc4xBY0ttdv
	mnzxSs8gObUN03ULwdrV8YlyOTpnGDxcOCLOjHx6IQPObxvDnUocCC0Ydl17oXuAkibFT/57Inc
	=
X-Gm-Gg: ASbGncsiHw5A/crwwp0ZSS/YlVhZlzqvvIxfaup3TXPdwXvNxZB2//0APA186dp9o9p
	TUfZmOo/szFhKxVjLOn9XYA5/O/UiDDpEgZ2de8G5cJFCgqjvCQtJa14R6TQvX5GYjm9CgfrbPa
	JOxtM5w9XdyCCk9EspImMOMK6AIkV1j/STTBcz15nuHpGwpyTIgYUla7zkuqmz0lE3VWP62rlSs
	FEZnkfgr9N/hPeSAJrx9P3jzly04VOBorJubEH4jwjWZFS34rYXukpqdDEHkS7k6cFvIQ/owM7R
	4CsmfjDL1fTMIWaw9BHBHLrFLHMmJXaPHPNYXWJ+ux1FZ5dF3oxPHEcDZLC42lytdYIE3Hj0tvm
	AZdKVDMqoiw3WLXpAYoN28Fa8FnYDPQ==
X-Google-Smtp-Source: AGHT+IHpOo2QrLKtozaa1FuNH54R8XMCO3pCkUQe9y8ycYm3yQqAk3wW+/dObFamET+6nzxzTfFrMA==
X-Received: by 2002:a5d:47c8:0:b0:38a:88ac:f115 with SMTP id ffacd0b85a97d-39973af8e00mr4274468f8f.34.1742462881712;
        Thu, 20 Mar 2025 02:28:01 -0700 (PDT)
Message-ID: <b1b94660-da2f-48ad-a1b6-10cb52e559f6@suse.com>
Date: Thu, 20 Mar 2025 10:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] x86/PVH: don't open-code elf_round_up()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jandryuk@gmail.com>
References: <577ddc98-fdbb-48af-9c7e-1a411383516b@suse.com>
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
In-Reply-To: <577ddc98-fdbb-48af-9c7e-1a411383516b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I was wondering whether in elf_round_up() itself we might better use
ROUNDUP().
---
v2: New.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -718,8 +718,7 @@ static int __init pvh_load_kernel(
         extra_space += sizeof(mod) + ROUNDUP(initrd_len, PAGE_SIZE);
 
     if ( cmdline )
-        extra_space += ROUNDUP(strlen(cmdline) + 1,
-                               elf_64bit(&elf) ? 8 : 4);
+        extra_space += elf_round_up(&elf, strlen(cmdline) + 1);
 
     last_addr = find_memory(d, &elf, extra_space);
     if ( last_addr == INVALID_PADDR )
@@ -740,7 +739,7 @@ static int __init pvh_load_kernel(
 
         mod.paddr = last_addr;
         mod.size = initrd_len;
-        last_addr += ROUNDUP(initrd_len, elf_64bit(&elf) ? 8 : 4);
+        last_addr += elf_round_up(&elf, initrd_len);
         if ( initrd->cmdline_pa )
         {
             char *str = __va(initrd->cmdline_pa);
@@ -774,7 +773,7 @@ static int __init pvh_load_kernel(
          * Round up to 32/64 bits (depending on the guest kernel bitness) so
          * the modlist/start_info is aligned.
          */
-        last_addr += ROUNDUP(strlen(cmdline) + 1, elf_64bit(&elf) ? 8 : 4);
+        last_addr += elf_round_up(&elf, strlen(cmdline) + 1);
     }
     if ( initrd != NULL )
     {


