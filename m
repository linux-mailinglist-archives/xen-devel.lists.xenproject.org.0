Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1793948B7A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 10:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772563.1183005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbFjv-0005Gf-Oz; Tue, 06 Aug 2024 08:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772563.1183005; Tue, 06 Aug 2024 08:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbFjv-0005EC-Lz; Tue, 06 Aug 2024 08:40:19 +0000
Received: by outflank-mailman (input) for mailman id 772563;
 Tue, 06 Aug 2024 08:40:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kFQN=PF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sbFju-0005E6-Eh
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 08:40:18 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80f440f4-53cf-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 10:40:16 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5b9d48d1456so953333a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 01:40:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b83b82c16dsm5762194a12.76.2024.08.06.01.40.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Aug 2024 01:40:14 -0700 (PDT)
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
X-Inumbo-ID: 80f440f4-53cf-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722933616; x=1723538416; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkisf6jKS1KBlAD8Y7IQ5SHgqiPRA1qETu3BaY5rjXQ=;
        b=RRlTRRyUkoa/XMPH3zRRJC/lHzLyVzqF9nfV5GBRjUyO+gVNnUNzsdK+Z7VfpvZOZW
         31A95s6d0skrlU80e/xdR6pHaZJA5c400k5nI6l29UU+LzL332mYTuoOJ+nmTt4LxPHZ
         lJHdKrYqwnRbG7wEg/WY9rZ6RmQD9KZ0Kj7J9M77sTPwF3Cy5p75J+0imyB+o2Ttvxtp
         tA3Y9hc621Pic0PQ8rmZ7prcI8jEX/5SQSV9RB8jPSXunvRX+yz5asp+GeAs3L5xhBtW
         ZIyPTkKnlssqznwwny6h8wP6eZJwxkB3lTogRzl7yUDdaq5ioaSwwppHgCvf4i0TYRLu
         08PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722933616; x=1723538416;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qkisf6jKS1KBlAD8Y7IQ5SHgqiPRA1qETu3BaY5rjXQ=;
        b=HaBkDs/zfcXXIhG4hD35ejathCc5f5JtmyK4/8YAPJcNhIRXJFJRuQHzcwDv9XhqW1
         TJqRGN9SasuZZQ9F6g8jCQFPQPlVAb65yyt7Q/LyCNZmy4clPBt6nu4bbK+WJqhmsqFi
         E9aP6oXx0nppeBfhzZvJ6BtHBYj6mTP9tla9Xst7b/nqvaQ9CJSjEa2Je85ZbbyhjgX5
         geepeKRiv6MutqdHgZwu37mf0p1dEM2MqNnOtqdOFFBcrt1YtjkdsL66OUykrRckoK70
         MZumE0vTN88rpQ1HiHevd0KDc1HQ8yq2XynkiEHINluhWoB+ZHq1vl+7MVZx9AZUs+X5
         gHpg==
X-Gm-Message-State: AOJu0Yx45rXRmOGW+eg9biLSDLhXrvh5VDec9uCYtbcTq5IDEyF511FZ
	6a1VOW+FR8zAzXNrlppNeXIVcPK83WYnsSQ0Q2aDs6NWgj5cV2YMu4j87JYAMml4p5+iNS+D2xQ
	=
X-Google-Smtp-Source: AGHT+IHLl/hRXVYdwQxx+Y2CTKXIa4SvbyLpy/Ov1B+knkc7lTeRU9sd6MloV7lTBnxq+dNjbTewhQ==
X-Received: by 2002:aa7:d3cd:0:b0:5af:384e:bc0f with SMTP id 4fb4d7f45d1cf-5b80cea2fc8mr11985285a12.16.1722933615609;
        Tue, 06 Aug 2024 01:40:15 -0700 (PDT)
Message-ID: <ad3b9873-b478-4448-8395-498399040324@suse.com>
Date: Tue, 6 Aug 2024 10:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] libxl/disk: avoid aliasing of abs()
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

Tool chains with -Wshadow enabled by default won't like the function
parameter name "abs", for aliasing stdlib.h's abs(). Rename the
parameter to what other similar functions use.

Fixes: a18b50614d97 ("libxl: Enable stubdom cdrom changing")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/libs/light/libxl_disk.c
+++ b/tools/libs/light/libxl_disk.c
@@ -935,7 +935,7 @@ static void cdrom_insert_stubdom_disk_ad
                                              libxl__ao_device *aodev);
 static void cdrom_insert_stubdom_query_fdset(libxl__egc *egc,
                                              libxl__ev_time *ev,
-                                             const struct timeval *abs,
+                                             const struct timeval *requested_abs,
                                              int rc);
 static void cdrom_insert_stubdom_parse_fdset(libxl__egc *egc,
                                              libxl__ev_qmp *qmp,
@@ -1259,7 +1259,7 @@ static void cdrom_insert_stubdom_disk_ad
 
 static void cdrom_insert_stubdom_query_fdset(libxl__egc *egc,
                                              libxl__ev_time *ev,
-                                             const struct timeval *abs,
+                                             const struct timeval *requested_abs,
                                              int rc)
 {
     EGC_GC;

