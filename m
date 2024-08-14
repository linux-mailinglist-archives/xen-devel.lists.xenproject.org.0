Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545769515B6
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 09:44:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.776781.1186951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se8g3-0008Ta-5O; Wed, 14 Aug 2024 07:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 776781.1186951; Wed, 14 Aug 2024 07:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1se8g3-0008RN-1O; Wed, 14 Aug 2024 07:44:15 +0000
Received: by outflank-mailman (input) for mailman id 776781;
 Wed, 14 Aug 2024 07:44:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1se8g1-0008Q9-Pq
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 07:44:13 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffbac252-5a10-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 09:44:12 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6135eso1065187a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 00:44:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bd1a601dfdsm3591917a12.83.2024.08.14.00.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 00:44:12 -0700 (PDT)
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
X-Inumbo-ID: ffbac252-5a10-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723621452; x=1724226252; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=R1wvKf6AjB5NsuELrr485XrHZsWeVGAqsKXNC7ny5v4=;
        b=QWUd8+dHOVIe5al/xaSGhlXw8dROZmnam20fVttttt03j+FzQW5mrpN3URvz9Aa3C1
         F1BZTu+Qob1krQVU43TPQD3F6W0ViCmd0LujMcfX4PLlUOogB4uxMLVAar2S+T4b7Kgy
         jpzJ4fsmdoj0rI+eAcrLPxD1yd9D7DDsKaSt4WHGe0YGqUkLuRWnh5+TulxqRyHgaR+b
         KAEY0evaPy7DNDSaN/+qWkF58lWP78IZVx3DO+R9nAzFCKi8nXfwKC1UbIghSnp9TF7b
         2gpZn4oK7H52QFFq87oVG2Xi4seIPz5vzLDk5Zg8tNL7n8eHqX0BOTiNzKGUalGor8rZ
         m0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723621452; x=1724226252;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R1wvKf6AjB5NsuELrr485XrHZsWeVGAqsKXNC7ny5v4=;
        b=La+AGjfoBQajH+xKMr4Y/yICCgRwm8kLIhgupkz1ZZENO1k57ehx2TpwNEhkBGRuQL
         VJ/CfnGmOrNd/sL5pbBbN3ecnunWp8XBVtt3/INucYN9e9Qk0Jlhqdvad2CMtqpaaAV8
         OlYWn+TNWZkjXEps0K+RxPCUvU2nHuomPfMf+JtPnb1lOrgHHmbp8oE6+rb5Hg7Rl56D
         SRS3D2MldjSI52QtEBIEtFSgx1LqHnnSTYkeuay3pvZz+R8ysCU/emRO8ggr+BVr/1H6
         cp3put3sizn3KIoN0NiLR4iVKiCfy95xoc8JjMlKImIN9kBVuJ4lM7pVYroFeMiqE3eB
         z0OQ==
X-Gm-Message-State: AOJu0YxQQliiBC7LHdZ7Az/prgKVgyZUY+vWgL9ZuStmpXyuby1S3/Gs
	lYBxxnqjd0lhzV1e9WBhmz2GMrMzfYa/vN54s3rWdUN5aSxkA40rSjg3otBjC/XPBL085QivOOk
	=
X-Google-Smtp-Source: AGHT+IHVwzLkxbtm5iznwSA+MDN9soiS9AlQ6W14u0vx3DDvGfftbXuZ8bad3/aZaYHbWX5Rr9AxPw==
X-Received: by 2002:a05:6402:1d55:b0:585:5697:b882 with SMTP id 4fb4d7f45d1cf-5bd4616ac6amr4977691a12.3.1723621452242;
        Wed, 14 Aug 2024 00:44:12 -0700 (PDT)
Message-ID: <c648bfe1-6ab0-4429-ab8a-b452ad2359ff@suse.com>
Date: Wed, 14 Aug 2024 09:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] SUPPORT.md: split XSM from Flask
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>
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

XSM is a generic framework, which in particular is also used by SILO.
With this it can't really be experimental: Arm mandates SILO for having
a security supported configuration.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Add explanations. Another terminology adjustment.
v2: Terminology adjustments. Stronger description.

--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -769,13 +769,21 @@ Compile time disabled for ARM by default
 
     Status, x86: Supported, not security supported
 
-### XSM & FLASK
+### XSM (Xen Security Module) Framework
+
+XSM is a security policy framework.  The dummy implementation is covered by this
+statement, and implements a policy whereby dom0 is all powerful.  See below for
+alternative modules (FLASK, SILO).
+
+    Status: Supported
+
+### FLASK XSM Module
 
     Status: Experimental
 
 Compile time disabled by default.
 
-Also note that using XSM
+Also note that using FLASK
 to delegate various domain control hypercalls
 to particular other domains, rather than only permitting use by dom0,
 is also specifically excluded from security support for many hypercalls.
@@ -788,6 +796,13 @@ Please see XSA-77 for more details.
 The default policy includes FLASK labels and roles for a "typical" Xen-based system
 with dom0, driver domains, stub domains, domUs, and so on.
 
+### SILO XSM Module
+
+SILO implements a policy whereby DomU-s can only communicate with Dom0, yet not
+with each other.
+
+    Status: Supported
+
 ## Virtual Hardware, Hypervisor
 
 ### x86/Nested PV

