Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B157C6E0E5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 11:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165757.1492448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLflJ-0003Fj-63; Wed, 19 Nov 2025 10:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165757.1492448; Wed, 19 Nov 2025 10:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLflJ-0003Do-2U; Wed, 19 Nov 2025 10:50:09 +0000
Received: by outflank-mailman (input) for mailman id 1165757;
 Wed, 19 Nov 2025 10:50:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nJND=53=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLflH-0003Dg-HS
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 10:50:07 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 829b57e2-c535-11f0-9d18-b5c5bf9af7f9;
 Wed, 19 Nov 2025 11:50:06 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6419b7b4b80so9776895a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Nov 2025 02:50:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3d8775sm14817729a12.5.2025.11.19.02.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Nov 2025 02:50:05 -0800 (PST)
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
X-Inumbo-ID: 829b57e2-c535-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763549406; x=1764154206; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lK2Mi18t8Rxkch5T8qqE7ShIv2l4kzNr0A0IpujOPGk=;
        b=K5O31HBQ17SzlA1lvKm5VpuWR/ElRaNkBU/R5fhT6QmUJ8P4YQ98vRhLVX4IoFRn3P
         M/WLso7/FdhSM6wIYqEwov+eKbubPdcTSxv1RGZrnQ12NvTHbrCXdbQy4I38IuVAyFub
         5xqklwconi6ScAHazeKXlwEo+xp72JlTikUaM4LypOhwKe7OUZLF+8JRY6QZMj1IlFBd
         kfTbnLY6QOnsdPoRXdggyTxs8QsWmtsV9wa3DTIQpxJJr44ODbJtGE3SA3KmgdfB7owK
         s4mmK/tq/JnIbNDvY4z5XdsYhXlrDP6cXTL/7NGUwTHuoZF9h1xDitONu+htx2L6wTTo
         zeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549406; x=1764154206;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lK2Mi18t8Rxkch5T8qqE7ShIv2l4kzNr0A0IpujOPGk=;
        b=Ewr9ZZNO9N88M1bvrXSYQlwv2SHRfbXVjgCvcnqDfcRFuEG8T/RTz3Fkd99VA31VWV
         5V3XJoTTk8VX5jh90PEjNxST/fc4gJjvbgp0yh5uKK8d3N1+bBGwWwWuh9/sqA1ZHDei
         KeT1d4lHbD5ZM04Nub8j8kZzeH4qAiic1HPupJkZQqG/ls/38gpQjGx5GSrbhQKdgjog
         LyxQcUyBLlmdo1WSVPzmMd31YCETng7RE2ToZgIylRMDZ9yZ3eBlU8dAKuekTqu/7VCu
         9OFrBhJKVgVRbwqFFmdII7GvgjNe25ZWmFjgwaFqgXRmfhIzA7H73Np0j0qQyZDfTSfS
         oddw==
X-Gm-Message-State: AOJu0YyrYSmGM66/XnRgcnWPD+qopxsSPn3N9uqUKGa54XA2GS9Jr+n7
	aZ90al25uAynihGmPuSG7efvpFF2UDMJQF1EtNj/oG4zldFlqlTzGZStzfpHjaDjSwzClTzgrRw
	lwmY=
X-Gm-Gg: ASbGncsl/C1mwmN0EYZGgvIiodkGRjK5nlJVs6/FRMRo2l5AE3blL48RXrb3/bCiBh2
	R/hjj/zRTT8KNOyaZ3iBpSBHL/kbXnkWz4LM2QIR1r26ffNj8UPaDdUEX6vJyokjJ0SgDWp2D4S
	57fCV8OMtRALfo36Bi9pZMvSUhzROJQBA1pbwq1hjdtJKQRcINeEDhmddbzz/8dwfoE7wF5B/vq
	P4K7+jf8SCoaHs5SE+Sn3NgmwWRcrFbRmVW3/YvEwoXTljbc9W285Xe1MAbCl79NPFKTDMYch47
	F1CTkh2zTuQ5aPEOdDBMSQPGMeQMw9nbVFhVw4gE5u1BX96GGuMPNL/F3sz7MHXtB9mi6NNEvku
	VsI0XLStHXsl0uFABldNlO7LU6ArfC0bCZTBYM0PP3tBE+iQ6Chi2MKQkQhpJ659cRY9DThJxPT
	VmqesBZiuIFwySA0Wp4mCNjjJsAj/+twSIyi7Q3y8Xy5aWfkattUaAz63NDKiEn7VbhVlg0Y1BS
	mMuv526lL4oymp/lK16O+9v
X-Google-Smtp-Source: AGHT+IEqxxpjSt+O5RXVgWwMrFHFihOSiWNxj4fki2yqblLF5mxuS/pdeObbIjugdfN80OhHk8I2mg==
X-Received: by 2002:a05:6402:518a:b0:641:27d8:ec3f with SMTP id 4fb4d7f45d1cf-64350eac3e6mr17397428a12.29.1763549405864;
        Wed, 19 Nov 2025 02:50:05 -0800 (PST)
Message-ID: <5ccf9000-9847-40de-838e-cb181633b098@suse.com>
Date: Wed, 19 Nov 2025 11:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] x86/guest: move allocation of Xen upcall vector to init
 code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
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
In-Reply-To: <fbc9a2f8-170a-4645-8836-c90c42ad726f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's no need to do this every time init_evtchn() is called. Just do it
once when setting up CPU0. Drop the assertion as well, as
alloc_hipriority_vector() (called by alloc_direct_apic_vector()) uses more
restrictive BUG_ON() anyway. Then evtchn_upcall_vector can also validly
become ro-after-init, just that it needs to move out of init_evtchn().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -233,16 +233,12 @@ static void cf_check xen_evtchn_upcall(v
     ack_APIC_irq();
 }
 
+static uint8_t __ro_after_init evtchn_upcall_vector;
+
 static int init_evtchn(void)
 {
-    static uint8_t evtchn_upcall_vector;
     int rc;
 
-    if ( !evtchn_upcall_vector )
-        alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
-
-    ASSERT(evtchn_upcall_vector);
-
     rc = xen_hypercall_set_evtchn_upcall_vector(this_cpu(vcpu_id),
                                                 evtchn_upcall_vector);
     if ( rc )
@@ -293,6 +289,8 @@ static void __init cf_check setup(void)
                XEN_LEGACY_MAX_VCPUS);
     }
 
+    alloc_direct_apic_vector(&evtchn_upcall_vector, xen_evtchn_upcall);
+
     BUG_ON(init_evtchn());
 }
 


