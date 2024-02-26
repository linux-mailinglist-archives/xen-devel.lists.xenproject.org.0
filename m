Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F5D8671BB
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:45:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685433.1066135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYTf-00039f-Mv; Mon, 26 Feb 2024 10:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685433.1066135; Mon, 26 Feb 2024 10:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYTf-000389-KE; Mon, 26 Feb 2024 10:44:55 +0000
Received: by outflank-mailman (input) for mailman id 685433;
 Mon, 26 Feb 2024 10:44:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reYTd-00037z-L7
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:44:53 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 128ca2d5-d494-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 11:44:52 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so2537903a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 02:44:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a50ea86000000b005661badcccesm44605edo.87.2024.02.26.02.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 02:44:52 -0800 (PST)
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
X-Inumbo-ID: 128ca2d5-d494-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708944292; x=1709549092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SV4cvth6dNGeBZBn9gXoqeVvBbQTC9ZF63evmEgB9hA=;
        b=MPudo0z3LnN5tgQ+S3EDj+RatihKperlWuF4FUli6GYzmzMz8nNkx/tSTIGU+JwIfk
         mndYXrzpMxrWEl4Vx8oAdnFJT85yk09QATeMu7oQC8EIgQBAUc0s+aSLTr2nbFZPPfyJ
         ymlusOEEAKlYS8e4YdWxnrSTSKhuUvQU9QGrutetmHB/YJhPIG8jtyJoTlXU0WSA+Wqr
         JlErmgRcli03Gmf4X67I/Aq0xf79NtMiIkk/Aodvai1I5Rlh0iUmDAvhoetEmkfBoPPn
         CtB21GpdmVEr6fPRsdoGeUh5h4SNQGOpzCFinxdPZdKd1YHtBvVljgRE56dQIp/adkJp
         NTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944292; x=1709549092;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SV4cvth6dNGeBZBn9gXoqeVvBbQTC9ZF63evmEgB9hA=;
        b=UqijV1cg9muUu8DLGhAfSJNUAxTPRfEsjUDVN6fwxIVmVF5UV0DB7IKVUqtnFg8WQc
         uP+3mjjIZ6sYJrqwQfQD874aoBHOLhTU88V5Jn2oRtlDgHoltD8rZCzbuoYowUWG5sT/
         IJmIhQOp7X7h1ZTqyEilY4Xm/C4XjfHRH029WESS0jclP8zunqZHSZ/NO11Be1b4qK6S
         hctMpNAN23JlRXf04009aTS2Std5oasMLJYuZPweLTlPT/7CZXOSK8B0mlP3qCnFWzLy
         zrPuC8PPx54zi92Qy55tg9KCQSQqFMju7Npmcik8EqGmBH4n/N1VNYG8wE9moAsJqOTJ
         3noQ==
X-Gm-Message-State: AOJu0Ywdjbvgq0DbsIcdxAYYLQVZ7dbD13a9IlJBXslyAfDYKBfo8Poc
	uYjJPJxFEw4/unToZhgJdEam2f4HLueNUe8LGvOT2RQIidMUy6uVdvVHNOYPQ1SrpJikLJ7REfc
	=
X-Google-Smtp-Source: AGHT+IH0I8RtAXffz31xuxeoGlz1JfuXlwAua+8YVei1OzZ4Frbb+0Qc59Er7I3BvpwBkyDcOhDJXg==
X-Received: by 2002:aa7:c0da:0:b0:565:cbd9:af39 with SMTP id j26-20020aa7c0da000000b00565cbd9af39mr2643097edp.16.1708944292290;
        Mon, 26 Feb 2024 02:44:52 -0800 (PST)
Message-ID: <e160ebb3-b313-4856-b161-2ac1ab0b61ca@suse.com>
Date: Mon, 26 Feb 2024 11:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] gnttab: almost fully ignore zero-size flush requests
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <94418e0e-1805-4c30-a4a7-4e9cbfaf984e@suse.com>
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
In-Reply-To: <94418e0e-1805-4c30-a4a7-4e9cbfaf984e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Along the line with observations in the context of XSA-448, besides
"op" no field is relevant when the range to be flushed is empty, much
like e.g. the pointers passed to memcpy() are irrelevant (and would
never be "validated") when the passed length is zero. Split the existing
condition validating "op", "offset", and "length", leaving only the "op"
part ahead of the check for length being zero (or no flushing to be
performed).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Undo expression folding.

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3528,15 +3528,17 @@ static int _cache_flush(const gnttab_cac
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
 
+    if ( (cflush->offset >= PAGE_SIZE) ||
+         (cflush->length > PAGE_SIZE) ||
+         cflush->offset + cflush->length > PAGE_SIZE )
+        return -EINVAL;
+
     /* currently unimplemented */
     if ( cflush->op & GNTTAB_CACHE_SOURCE_GREF )
         return -EOPNOTSUPP;


