Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4117F81675A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 08:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655671.1023371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF81c-0003PZ-0V; Mon, 18 Dec 2023 07:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655671.1023371; Mon, 18 Dec 2023 07:26:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rF81b-0003Nt-U1; Mon, 18 Dec 2023 07:26:51 +0000
Received: by outflank-mailman (input) for mailman id 655671;
 Mon, 18 Dec 2023 07:26:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rF81a-0003Nn-0D
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 07:26:50 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdad3821-9d76-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 08:26:48 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33663adf953so667671f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 17 Dec 2023 23:26:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b12-20020adff90c000000b00333359b522dsm25988829wrr.77.2023.12.17.23.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Dec 2023 23:26:47 -0800 (PST)
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
X-Inumbo-ID: cdad3821-9d76-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702884407; x=1703489207; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q8AOVAk5scbBIpfOBk6d8oH+qpZdZEmZB2qz/ZMRz64=;
        b=dcxLntYZMgBOW/jqevXuZXutCwZcU3eJ+Sqw3G+WtyhVxRxy7vzOz6+MRZjyksFLQF
         C/NjCtGxYqElQ4aAaYVETtpD4ThhJSm138pHzRx0wONzL/ek1y19WFN4Mx5W/FUXolJw
         QNNdamKQxqE0ygTCocnab0nUvKqnefmMN0VJwM3i7gsXPF6lHwjSQzVphCgNZP986LXS
         3w9fU8a2AvZuHJFnszonD82nbQXKkoGhAFHogM3IUQKF7H1hEgRZaeST4TKCn+xish0i
         JWxYIBFC9VMHZG2IdGLNLRqX1Lgk6QEY0YR+B0TK5pU7JhRARYY1SWAqiwM2hTdfTqBD
         C2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702884407; x=1703489207;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8AOVAk5scbBIpfOBk6d8oH+qpZdZEmZB2qz/ZMRz64=;
        b=KCoE9B6SrxqvyMQJ3R2hZfQ8fnpQOd+nhyJHwhiBoWEZ8u4Gqxa+SnPkoqv4puJJBx
         zceW59vpjgFnhPJzisnoVKAmU749MiIQO1Ru0Qu7bnHPg/dX6bE/VOVzxWFbob4yWWu/
         4KpBXmWzvTKFDkZ1QHODE9Ti7lfy/flA4OkiWFcIoGiD463XjcY0tewUypa75usqPxW4
         rVEwKYZhtlj98ZAfRetvM0YdYOZNVvcuf3rq4QFRXt40+tfFngxcS23EV7QZ0Qw5yJnW
         cil77bl1ZILNdCKAtAFY1CWdrw2C+DrU0fdYNVF6N/M2SXkBD4q6V38zpVcb0u7jaDm8
         NXlQ==
X-Gm-Message-State: AOJu0YwIslTPVKPrh1o4KIEYqXglZWQQGJFpITpYxQPRuX0aG0dzpO8Z
	H8VmLbF/5/phgAWSfjmm2g9AaQkxJeif7fDBUqjR
X-Google-Smtp-Source: AGHT+IHHkuuNmjkpR3/Pv8AFMigkMIERk0E6658I/57u6RL59SuPfHg3T6qgfQPaq6wyk3nz+y0RQw==
X-Received: by 2002:a5d:4b02:0:b0:336:6693:6e74 with SMTP id v2-20020a5d4b02000000b0033666936e74mr790853wrq.119.1702884407375;
        Sun, 17 Dec 2023 23:26:47 -0800 (PST)
Message-ID: <89d77714-df09-4d0b-bc7d-7d773f8d4f4b@suse.com>
Date: Mon, 18 Dec 2023 08:26:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86/HVM: limit upcall vector related verbosity
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

Avoid logging all-identical messages for every vCPU, but make sure to
log unusual events like the vector differing from vCPU 0's (note that
the respective condition also makes sure vCPU 0 itself will have the
vector setting logged), or it changing after it was once set. (Arguably
a downside is that some vCPU not having its vector set would no longer
be recognizable from the logs. But I think that's tolerable as
sufficiently unlikely outside of people actively fiddling with related
code.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Add comment.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -4129,7 +4129,15 @@ static int hvmop_set_evtchn_upcall_vecto
     if ( (v = domain_vcpu(d, op.vcpu)) == NULL )
         return -ENOENT;
 
-    printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, op.vector);
+    /*
+     * Avoid logging all-identical messages for every vCPU, but make sure to
+     * log unusual events like the vector differing from vCPU 0's, or it
+     * changing after it was once set
+     */
+    if ( op.vector != d->vcpu[0]->arch.hvm.evtchn_upcall_vector ||
+         (v->arch.hvm.evtchn_upcall_vector &&
+          op.vector != v->arch.hvm.evtchn_upcall_vector) )
+        printk(XENLOG_G_INFO "%pv: upcall vector %02x\n", v, op.vector);
 
     v->arch.hvm.evtchn_upcall_vector = op.vector;
     hvm_assert_evtchn_irq(v);

