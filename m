Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19E8849851
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 12:03:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675934.1051626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwl9-0006g8-9S; Mon, 05 Feb 2024 11:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675934.1051626; Mon, 05 Feb 2024 11:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWwl9-0006eZ-5J; Mon, 05 Feb 2024 11:03:31 +0000
Received: by outflank-mailman (input) for mailman id 675934;
 Mon, 05 Feb 2024 11:03:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWwl7-0006eH-GH
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 11:03:29 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3063a019-c416-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 12:03:27 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2cf4d2175b2so47748451fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 03:03:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n8-20020a05600c500800b0040fd162944fsm6859582wmr.35.2024.02.05.03.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 03:03:26 -0800 (PST)
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
X-Inumbo-ID: 3063a019-c416-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707131007; x=1707735807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qQnuT178TRlW0ncotS0NtNaqASxlSbwyqI0Oiy5iAaw=;
        b=RT7X4dPqXiOzCDIg1dsTI2F/db9kpvikuFcNR+4poG4f+7MB58XIzzDA234H1lnQHq
         kOzvrQ+d+SdxxU3JQnHEDcGmwfkLfp3lCKPkSBdkbmkMOuJdx97na4WosON5JeND+9PC
         GOlwQHvJ7XMZ2C45zDFWRLWBS3O26Doc2kUkjLdkrmUH5/QO/eycNJCBr0BLOE8TlUvJ
         3OMZAk5CY21WcncZ8GXG2haVpgSVLMEUnE4i72P0mVJaEOazGpyEbeYe7FYVVL2rwvX7
         77kKqGIY5hUvoRk2xcX2rphf5RWSBsPrYkED3PDYR/aLTtfOQkMZA1Ict6B6+e0cItwK
         CGNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707131007; x=1707735807;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQnuT178TRlW0ncotS0NtNaqASxlSbwyqI0Oiy5iAaw=;
        b=d3iRGH1PXdb0l/B8xMAMYX/4HUrfa1Z9D49XLD9khn1IrGn3zLO1is3GftXFgQSnAj
         +XKL7Oqlw5IV5R4qkpEcNBpUJzPcqkhVVVw1yo/cOma2jJTPz8b4qwXpDqom1gLlPfUB
         spYKgfNA0Cg6AOGTp3nZp3qKWheyfHFfdNv6qHzBsnEl2mFtLfGj5ta2z2uaDjBceHmm
         IhfroP0hI7n1Wp5CMWa/gabhBB9c5XSNPmz4dG/AIWIABa/83atKY0MibqfKRYFS/s4Z
         Rrbd6SUFXoM5T7QGEGPMbHkjW52GENaWJAZR41TIhVStZfyGU+Wu/H7ipLc31KPCIZcs
         H1wA==
X-Gm-Message-State: AOJu0YwFFuNmhtM37tFZUzdm8ETNKN3kq3iRQXkCJhwMYZqfdA32/BEw
	23cdh7STVQUYmMfDib3Gwkj8dAH6InnV5LcRoDrsad7np7A07HM2Nn2FN8zv82DMtMvdqB1tJ1A
	=
X-Google-Smtp-Source: AGHT+IEX+Xb1nJ4GIZ5yrhUdDAX/Ds+MeoIxYHNvhJWpN+FsxmZuvqOAjgil9esX3O9SdAD0jO6WNg==
X-Received: by 2002:a05:6512:783:b0:511:546c:1f14 with SMTP id x3-20020a056512078300b00511546c1f14mr770910lfr.63.1707131007135;
        Mon, 05 Feb 2024 03:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXDMB1RGsEUkeHRLVavpaWfRbrLd8Toqzzn8e1+D4q+0FGcU8N0tC2gBCw0as+r8UIdv/fHpDkySDW+L1hO5Zi+aZMtumWZSx0fI7w0VFoc+FxnyPvDQfofbLCBZAb+gyO7W7EQcwImPnFZcyBuhiF1o1cMHHZug7OL7451
Message-ID: <a73f9ba8-8914-4c41-be55-a57c93c571f0@suse.com>
Date: Mon, 5 Feb 2024 12:03:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] gnttab: fully ignore zero-size copy requests
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

Along the line with observations in the context of XSA-448, no field in
struct gnttab_copy_ptr is relevant when no data is to be copied, much
like e.g. the pointers passed to memcpy() are irrelevant (and would
never be "validated") when the passed length is zero.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -3061,6 +3061,9 @@ static int gnttab_copy_one(const struct
 {
     int rc;
 
+    if ( unlikely(!op->len) )
+        return GNTST_okay;
+
     if ( !src->domain || op->source.domid != src->ptr.domid ||
          !dest->domain || op->dest.domid != dest->ptr.domid )
     {


