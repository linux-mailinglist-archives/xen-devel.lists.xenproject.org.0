Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923AB941010
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 12:57:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767581.1178255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkXZ-0008RH-9D; Tue, 30 Jul 2024 10:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767581.1178255; Tue, 30 Jul 2024 10:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYkXZ-0008OO-66; Tue, 30 Jul 2024 10:57:13 +0000
Received: by outflank-mailman (input) for mailman id 767581;
 Tue, 30 Jul 2024 10:57:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sYkXY-0007Zv-5W
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 10:57:12 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7834a7a3-4e62-11ef-8776-851b0ebba9a2;
 Tue, 30 Jul 2024 12:57:10 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7aac70e30dso564847266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 03:57:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab2314csm642063366b.14.2024.07.30.03.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 03:57:09 -0700 (PDT)
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
X-Inumbo-ID: 7834a7a3-4e62-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722337030; x=1722941830; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Po8FTiwtDWrNQap1N3UoZT3/Uk5DxNwtOnO6XpY1gU4=;
        b=fvtHnKmEJFdQK+a0LAScnKQPBdg3eEUB1GZDkK1cMcXV0QczpcJ7ki2MtcXXoQTqb6
         xkQVRgkt97KlaBv55UOvxKtL44X3/zSlYv7/64Q8DWW+q9rTFeUG8BJTSsB0VbuciuHE
         htfD2Uz3ptjcVYvFRFeTYzdDFWtOAdiDShJ321IcThWjnjKKv0nnTQaKJBMLzu7GCc3q
         EstyVQD8bdOTlt9s+lyG0LZZ1HW8qnwQFi6esK53X2k4Fel1laEzZSPqJK71fk62ThcL
         wOTf/SO7hTK4Vqlvu68Bodp37Mc2NsC6BKGSdJc0u4Akka6Fuhanw6bAm6EUv2VPG0Sw
         vHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722337030; x=1722941830;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Po8FTiwtDWrNQap1N3UoZT3/Uk5DxNwtOnO6XpY1gU4=;
        b=vfX+S1o8qnMBh4+Xl5mQ/s3kqR6i4RvQ2TYiCR+SK3b6ZHKBLvQXy2Wr67rnaD2L8i
         sg2/qBgRf7HD0/5cT9TPj4JKfy8RBoqvlnEkVlOy2zW6m1+Y/bqrmEvCKU7z/3QJYRw0
         FRJiHBZ2JII5Pqf4NLJVZxog+RzeNbcvxrAS4eti/BI67Uz3+fRvinsuMeg8GPt2Y3+V
         1RQnyNfcJzkLMZbubFUmIGhxYmRyFLtOZdaJsWdCD+czmi5bb1tzQLlISTgDeDm8YW8v
         6QViEoMu1Jqw0koGR5m98iswgAyK+x6M1I1boTnEXnrNoHKn7CqLcBfl9Y8WZjB8jwHN
         fEpg==
X-Gm-Message-State: AOJu0YwsSTOjKJqkhWZfipYQWu+DMziF7m0nYG67doEMXNCifEd7BagE
	THaXs7eYDhtCyP4uqM8SNjr8O2+5O4MSfxElOK3fpiTD0LJKNPCIwSCSyplg5dELkPwAw6wUqYM
	=
X-Google-Smtp-Source: AGHT+IEi712nRbYdEHOSzCpWqfCH4dlIc28CjJ4SDhBKoITbgcPOEjsGb1MrBEiWEdn5bAWXsz6dcw==
X-Received: by 2002:a17:907:9713:b0:a77:bfca:da53 with SMTP id a640c23a62f3a-a7d3ff97f73mr656160766b.30.1722337029597;
        Tue, 30 Jul 2024 03:57:09 -0700 (PDT)
Message-ID: <d7289554-258b-4f75-858b-64005e9ae9be@suse.com>
Date: Tue, 30 Jul 2024 12:57:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] SUPPORT.md: split XSM from Flask
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

XSM is a generic framework, which in particular is also used by SILO.
With this it can't really be experimental: Arm enables SILO by default.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -768,13 +768,20 @@ Compile time disabled for ARM by default
 
     Status, x86: Supported, not security supported
 
-### XSM & FLASK
+### XSM
+
+    Status: Supported
+
+See below for use with FLASK and SILO.  The dummy implementation is covered here
+as well.
+
+### XSM + FLASK
 
     Status: Experimental
 
 Compile time disabled by default.
 
-Also note that using XSM
+Also note that using FLASK
 to delegate various domain control hypercalls
 to particular other domains, rather than only permitting use by dom0,
 is also specifically excluded from security support for many hypercalls.
@@ -787,6 +794,10 @@ Please see XSA-77 for more details.
 The default policy includes FLASK labels and roles for a "typical" Xen-based system
 with dom0, driver domains, stub domains, domUs, and so on.
 
+### XSM + SILO
+
+    Status: Supported
+
 ## Virtual Hardware, Hypervisor
 
 ### x86/Nested PV

