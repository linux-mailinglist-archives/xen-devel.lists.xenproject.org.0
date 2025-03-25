Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35ACA6EB37
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 09:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926122.1328975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twzPk-000499-CZ; Tue, 25 Mar 2025 08:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926122.1328975; Tue, 25 Mar 2025 08:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twzPk-00046x-9c; Tue, 25 Mar 2025 08:13:36 +0000
Received: by outflank-mailman (input) for mailman id 926122;
 Tue, 25 Mar 2025 08:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twzPi-00046r-VK
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 08:13:34 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b5aec61-0951-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 09:13:33 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913b539aabso2827197f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 01:13:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f99540bsm12946388f8f.2.2025.03.25.01.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 01:13:32 -0700 (PDT)
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
X-Inumbo-ID: 0b5aec61-0951-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742890413; x=1743495213; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HRMYMwMgetqnIT0/RCtcv9V7w4HqQr5xcBYY/hYcOvY=;
        b=GZEKqyGoYZIrPQgaU3YVUNXn6u6A1U8U+NJ5gGFvU68nguNCyGrHWxQZrOV7rHhTvk
         0BKhbDtvg5pTngaBIv/fK7qEAUNCV5iDOQ3AhqF0BSTADA/PBOcN1HO7hBZriwW2uctQ
         C9b8fXUbeCRV39EZTeBYTyZx4eSAhJAsFdmBEUKPqLFTO9mvgLjGFyFtrzUTk6R6Bavd
         eK9Er0YMn5cDuk+BUHvzE2HzbRhwv/wT4wSlZVOfbr1keJjFnAryTv7hbepkkR1eSnZC
         nAFy6vWnD6vGd7EdGMpd5MdZ+zcQ9QlpfXpIRpL8BDM7PmKjfgK1SEYP0ViZ9JACMmtc
         Oi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742890413; x=1743495213;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRMYMwMgetqnIT0/RCtcv9V7w4HqQr5xcBYY/hYcOvY=;
        b=L5UiBJ1ju62Vmy8rITh4d13Vf3kPs+ET6oaMt7W37Ez3da/MfFWgPQk7GOOFXDWyym
         Vx5tP9j47Eje6o71Rne/QU5sgooy78Xpj98u1ohG2ZJtkmJrtsgG8FKG+/bTEJO0tTdU
         bQ3PV3OCpYnXFbCrpXp778KHHqU3g5SsRfMBdunCQY5Y/Yu/Qbxci9dBs9K/87hUysMp
         gcJKoxA4+Er99BoFDTOKiCZKRT6W0XWhWMB94HrYUJpOX9znRbI+MqW5Dlbb3ejrWvE/
         dJcV1+tTqPSAMFtL+OZCg7JHjaiQZJAXZMY21clsDzD7YK2fzrl+MJ6Qyl+CiV+TP5fl
         5xDQ==
X-Gm-Message-State: AOJu0YxETpw5mCyB6a2uZ76GJqyb+H/snmWkK5TPeu4Hu7ccv4wjSM1R
	HZklYNxEhyKaAh7QpEDSYEgRGKnUWHkralH0TUqEVVn/pzksWhzedtOu6kWhMZzLlKrIVqk/ogg
	=
X-Gm-Gg: ASbGnct7CauvkRtCsBUQRjpWpDxuFoAAN+lLsuT8V85VXXam9CGS23h1ekHrq4Pxg2I
	AFwJVNxeZBCF3ez1jRVU4XAv55AX8nMcq9oRZ4zRIlv18fqpIW7ccmJcKSHiG8WdXvPQYtEr5fe
	SX7p/JVW1SlyecPKivfb1k1V+p43Unx4OEcJ5mj5ePZvqeqGcumVSXB1sD8ENendjta0nV9zUlE
	UTk/nHmJFhmNLz2Y7YNvGDCABgxax2tr/EEG2VDhZGAYOO8pwVV9fuNoMcw6E2x6VddNqIR/dcO
	FAeXO3O9Xnq421nwTMXpWODijTIuTqu5SKjrMH+0HoVa7nL9SuHQyXlcgjfaW89sc3L5qwZVJDl
	ck52nr/qixNpRKYTzq+0mrmezT2NR3w==
X-Google-Smtp-Source: AGHT+IG0Y3FjjsrRMQ+/nW88HE7nKDeO0AQcCcQ0SjZTOceheexlYLSnWjGZKAU0DWH0no9PagKlOA==
X-Received: by 2002:a5d:47a2:0:b0:390:f6aa:4e77 with SMTP id ffacd0b85a97d-3997f90ff68mr14872975f8f.15.1742890413183;
        Tue, 25 Mar 2025 01:13:33 -0700 (PDT)
Message-ID: <552377d2-a2f1-40eb-83dc-fa09931cae6d@suse.com>
Date: Tue, 25 Mar 2025 09:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Ariel Otilibili <Ariel.Otilibili-Anieli@eurecom.fr>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] lib/inflate.c: remove dead code
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

From: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>

This is a follow up from a discussion in Xen:

The if-statement tests that `res` is non-zero; meaning the case zero is
never reached.

Link: https://lore.kernel.org/all/7587b503-b2ca-4476-8dc9-e9683d4ca5f0@suse.com/
Link: https://lkml.kernel.org/r/20241219092615.644642-2-ariel.otilibili-anieli@eurecom.fr
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>
Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 41c761dede6e
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -1164,8 +1164,6 @@ static int __init gunzip(struct gunzip_s
     if ( (res = inflate(s)) )
     {
         switch (res) {
-        case 0:
-            break;
         case 1:
             error("invalid compressed format (err=1)");
             break;

