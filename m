Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B1989F56
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 12:29:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807176.1218446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDe3-0007Xz-7y; Mon, 30 Sep 2024 10:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807176.1218446; Mon, 30 Sep 2024 10:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svDe3-0007Vg-4b; Mon, 30 Sep 2024 10:28:47 +0000
Received: by outflank-mailman (input) for mailman id 807176;
 Mon, 30 Sep 2024 10:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svDe1-0007Va-1x
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 10:28:45 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c44c4912-7f16-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 12:28:43 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so483070366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 03:28:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947e3esm510350866b.111.2024.09.30.03.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 03:28:42 -0700 (PDT)
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
X-Inumbo-ID: c44c4912-7f16-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727692122; x=1728296922; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ME4QojNVUiTbPsd9jwESzhxc0Hev6CvJD8k6A3wfRjU=;
        b=bFgg0cALeFwNJBwxUBNzHLMLqncdCBgADhfT6D63GpwaXLpimBqTsW04F+qn0HuamS
         xSG3FZYMbqyhHNtNsklMYwakUTf6UMn6mOMSvZCwKlMxM7WriuEysb3l2WU04GDwafNd
         WctANhKIr81ow3dirny407PyM6xL2NJMIPrmX6bGYJfyjiGjARHdlit9iEwwuOSZlf1P
         z8XDyRfq2rUDIBZGkE+b88BoM0bsZ2Ns0/Pjap6we5zeZ6BPl0yBJrxoGmJTQXMZ9XK6
         UVTEZeZlgZ+qJ3shEGV/2gB45YSUSDWUnjG/wWL3qUVnfonQG+oTedBpLPteLN3305qc
         3QUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727692122; x=1728296922;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ME4QojNVUiTbPsd9jwESzhxc0Hev6CvJD8k6A3wfRjU=;
        b=tYJJYgpl5CwaoYX4hik4L4A/HIP4CCN1iJrpkTiRf8Gr/nGH8inovVH61rEQ8B7TDR
         Qv6JQbJn2eWX+5rSDccXK6P6N9CRHr/d2wvSw9SrpsNmXfCG7oXRzi7IUL1NniEtG3H4
         l+kEeeBKbhfnF2n7FiQrzHxj+Dw2VDpHbsGQndQ0ou4NHsgKdHm5SNwcjoNih99tX/zZ
         ui2vqKE1WHwXXfKwjiDFaHgMZLv8mrqSGm/JnIig1RSQRuga47BQp2CyDc4qodukANmw
         bIkMeut0y0yHcC/9uut7wI+SGVf2GUPXBdFBJhCdUDrno6vE0WGI121J3aVrpd+bW/xt
         AI9w==
X-Gm-Message-State: AOJu0YyVKpfIdiWy9YcCcAl2jcAbLuKFVe6I7py5HNftlLDr5NcN10XS
	CKwGMBYJrrhx5AZcDlmYFQatyrl1I5/YWsTUgg5MCav5ytauy8YtlEyT7PqjqO7RedKL4/q6WLU
	=
X-Google-Smtp-Source: AGHT+IGKDcjMf4WpkwGak0rjb5ve4LVP0WGcsQujx+ppwik35Rmmh1+M2iHOexlGUBf3U96Mxtb08A==
X-Received: by 2002:a17:907:9706:b0:a8d:1774:eb59 with SMTP id a640c23a62f3a-a93c4ab15dcmr1228584066b.54.1727692122413;
        Mon, 30 Sep 2024 03:28:42 -0700 (PDT)
Message-ID: <3b4a324c-dbe6-4647-a73a-afdb94ff2ecd@suse.com>
Date: Mon, 30 Sep 2024 12:28:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] ioreq: don't wrongly claim "success" in
 ioreq_send_buffered()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Returning a literal number is a bad idea anyway when all other returns
use IOREQ_STATUS_* values. The function is dead on Arm, and mapping to
X86EMUL_OKAY is surely wrong on x86.

Fixes: f6bf39f84f82 ("x86/hvm: add support for broadcast of buffered ioreqs...")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Shouldn't IOREQ_READ requests also be rejected here, for the result of
a read not possibly coming from anywhere, yet a (bogus) caller then
assuming some data was actually returned?

ioreq_send_buffered() being built on Arm is a violation of Misra rule
2.1, which apparently Eclair doesn't flag (the rule is marked clean).
---
v2: Use IOREQ_STATUS_UNHANDLED.

--- unstable.orig/xen/common/ioreq.c	2024-09-30 12:22:03.759445625 +0200
+++ unstable/xen/common/ioreq.c	2024-09-30 12:24:06.516408920 +0200
@@ -1175,7 +1175,7 @@ static int ioreq_send_buffered(struct io
         return IOREQ_STATUS_UNHANDLED;
 
     /*
-     * Return 0 for the cases we can't deal with:
+     * Return UNHANDLED for the cases we can't deal with:
      *  - 'addr' is only a 20-bit field, so we cannot address beyond 1MB
      *  - we cannot buffer accesses to guest memory buffers, as the guest
      *    may expect the memory buffer to be synchronously accessed
@@ -1183,7 +1183,7 @@ static int ioreq_send_buffered(struct io
      *    support data_is_ptr we do not waste space for the count field either
      */
     if ( (p->addr > 0xfffffUL) || p->data_is_ptr || (p->count != 1) )
-        return 0;
+        return IOREQ_STATUS_UNHANDLED;
 
     switch ( p->size )
     {

