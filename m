Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D32849853
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 12:04:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675936.1051636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwlZ-0007AF-I2; Mon, 05 Feb 2024 11:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675936.1051636; Mon, 05 Feb 2024 11:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwlZ-00077g-E8; Mon, 05 Feb 2024 11:03:57 +0000
Received: by outflank-mailman (input) for mailman id 675936;
 Mon, 05 Feb 2024 11:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWwlY-00075h-2M
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 11:03:56 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40fd76d9-c416-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 12:03:55 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fc22f372cso32611295e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 03:03:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c500800b0040fd162944fsm6859582wmr.35.2024.02.05.03.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 03:03:54 -0800 (PST)
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
X-Inumbo-ID: 40fd76d9-c416-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707131035; x=1707735835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bsP4/6DK9onXjg/QyVKo8/M3vS3DN9Ae4cLk5QBN9lY=;
        b=aZ4SB3pdjH8Fc9j/lAJ5KVzZhR1HBEaXz9XuEe84V0PdsEaRpjIk7QfgFs1+sKVbqL
         H7ZCz2D1oyMwKATjAc4vRO0Hqcicy8EwzmtPwv5x9ts5zpc9OHF2WK5jXV/GInx+PB9b
         MePgPmf0E5iyCCKiTYwWokksjrA3j9fxFIQXHBwmj0i7tyuVAebRxptkKMBo73jrdIpH
         pGkZc4uw+F4dA4incZdgDo9/OsJx9ny2Aajjx8AUNOLKzX1z0kZEKoT+rjK/R/gZo9fF
         Ff/iSzDljYKeYdK/08x83/iaA3DZ4eSpgVzvYVJjhpcdQEvb9A6e5XKWenHlE2QjhKl5
         FzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707131035; x=1707735835;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsP4/6DK9onXjg/QyVKo8/M3vS3DN9Ae4cLk5QBN9lY=;
        b=bLen14K6jqrN2JCIaRTfJEGzB6kdaz4/3JxhCZDkv892kvzqK4w6ubeoo5nP4yzRys
         HvJ1fwoxZG2yoYJ0IskJtwj1CSfJmD/Ohs5zgJiTelS85LyeCIwMNYcXRs1A5Kw6rdDO
         mss2bVKG0EozQKbFLBc7JA2UhXbwvsth+aFvAVNTXCL5lZYAWXVETx19WmtGLRoxukA3
         GpImTQSVhYDtMI9qQMfIfiJacGFa6nMAdiYOnatDXfTAKzcfektEX3dGvs8l6yYgjad3
         laJ5QTwcraXIFbapWdjPWGpIwuiVc7I5mft48yyHfU6V1mGdpQzxrjkD/VaFeYSJPCMH
         WzKg==
X-Gm-Message-State: AOJu0Yw+aeVWBfIH9hFUf1j9k3K85lTmBofYTKr0B6GYHoc7YoBD9DgG
	WE6HHAPcxuIiQxsiYTnf0JsTwa2JoCU+qnEh4PB9eKw3tBeT845W6d0qeUGHXQJSc7WLYGQRx3k
	=
X-Google-Smtp-Source: AGHT+IE55s07IQQaRh1RDB8AefWOYLW2L5s2DFBXn797p0KxXpT3Q95nwt514Q7W32OlUbh5wYOrfw==
X-Received: by 2002:a05:600c:4ec7:b0:40e:5ed3:ccf4 with SMTP id g7-20020a05600c4ec700b0040e5ed3ccf4mr4517267wmq.16.1707131034678;
        Mon, 05 Feb 2024 03:03:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVE5WJ+iiDOkVCWZTykBJ5YA1suaUNHO5lzMjBbiGOK1Dw/i8PjCk1srnuFfF9vxsRkUq67b52U47WSVaDa92JAJStd0ma541aw80NxF8z2Ujw2WwtFaEgUyQpLKUs4nUm/vBxF9uo0f4XWciRDT4yREzaoZ0zxFd+PL0tL
Message-ID: <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com>
Date: Mon, 5 Feb 2024 12:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] almost fully ignore zero-size flush requests
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
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
In-Reply-To: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Along the line with observations in the context of XSA-448, besides
"op" no field is relevant when the range to be flushed is empty, much
like e.g. the pointers passed to memcpy() are irrelevant (and would
never be "validated") when the passed length is zero. Split the existing
condition validating "op", "offset", and "length", leaving only the "op"
part ahead of the check for length being zero (or no flushing to be
performed).

In the course of splitting also simplify the moved part of the condition
from 3 to 2 conditionals, potentially (depending on the architecture)
requiring one less (conditional) branch.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3528,15 +3528,16 @@ static int _cache_flush(const gnttab_cac
     void *v;
     int ret;
 
-    if ( (cflush->offset >= PAGE_SIZE) ||
-         (cflush->length > PAGE_SIZE) ||
-         (cflush->offset + cflush->length > PAGE_SIZE) ||
-         (cflush->op & ~(GNTTAB_CACHE_INVAL | GNTTAB_CACHE_CLEAN)) )
+    if ( cflush->op & ~(GNTTAB_CACHE_INVAL | GNTTAB_CACHE_CLEAN) )
         return -EINVAL;
 
     if ( cflush->length == 0 || cflush->op == 0 )
         return !*cur_ref ? 0 : -EILSEQ;
 
+    if ( (cflush->offset | cflush->length) > PAGE_SIZE ||
+         cflush->offset + cflush->length > PAGE_SIZE )
+        return -EINVAL;
+
     /* currently unimplemented */
     if ( cflush->op & GNTTAB_CACHE_SOURCE_GREF )
         return -EOPNOTSUPP;


