Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C31916082
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 09:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747377.1154769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM13c-0007CV-Hb; Tue, 25 Jun 2024 07:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747377.1154769; Tue, 25 Jun 2024 07:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM13c-0007AE-Eh; Tue, 25 Jun 2024 07:57:40 +0000
Received: by outflank-mailman (input) for mailman id 747377;
 Tue, 25 Jun 2024 07:57:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sC98=N3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sM13b-000799-Q7
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 07:57:39 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 976c1a1d-32c8-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 09:57:38 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ec4eefbaf1so41961121fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 00:57:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-71bb261aa98sm3791408a12.29.2024.06.25.00.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 00:57:37 -0700 (PDT)
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
X-Inumbo-ID: 976c1a1d-32c8-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719302258; x=1719907058; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ByHMlf5bOGP1cI0MHWfLPjmALFk3TR56glL87P/v77s=;
        b=LHrNuR0S1dpvvo6NcLv3sBS2vl2oSiGSUfq7fkmQjtwUoMSnd04D0QJpAmQLxi9o17
         W50l6u8UzAydIQKrusQMd6WDzLQrlKog7/ezUkIcsAyy74i71vLyoMVflEJxqBUEaXjp
         HnmrLkWMX+EHDTXmyzdzW41Z8ZzmatXo/8JTKHZox+4oapdl0IlrcVV3iiLvvAUM29jJ
         iZ6ElVB8oZSjYfLWClvWlPjLl8wWmyNluNTWfr3SRtWomjZ4460ShNsvr9w5dRxPnSUv
         B8I40vUafRg2C36ebTPtnPsUl4gmsjia6b3mbySC16VdKb5rMYu5e8bEW8X3+yyJmEFB
         YAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719302258; x=1719907058;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByHMlf5bOGP1cI0MHWfLPjmALFk3TR56glL87P/v77s=;
        b=u9lN6ol5orGXgHAsiu7zx7O4PdofYVMyb0t40E1Vu+W3E64YdNiYXzPgj94Dzz5l9t
         1S+uVdyJCdmk2smuGAS+9TBEsKY3pGY/jJXi+L8CVZwEICZqNi12hgxQnGJjO1PwFm5j
         vZGxdlIJmjap4oaqt3vKif8atRTChU0o4ANRpjC5stJ7Z3vd4WORbLDOIFeNrN2gzKqy
         R6d/OAyRRDagCdBkf3NM65ZXlkR3gsWfNnBvtmsY0Uhce5ma1s5emNgtRdDUf6rOVKhY
         4a4x7jSaG/4Prlg40hUYHoWqxg+oiXV3gF10Ce8xVxYcEfStz9yiUma9N7Xn+yxvrl7p
         t/Qw==
X-Gm-Message-State: AOJu0Yz9GE/NpxygfLdOeaOOiH7rp0ach2NvwGn/EtIyhNs1dp90E6gF
	7H6QrSYTP5xxr/pANzgOd7PgqLEr8yUUd07vl6SixxPEtKYXlkK9zfD39BTR+fS0kN0GoD1AFj4
	=
X-Google-Smtp-Source: AGHT+IHk8oTHDmsRPeZMfEVLLGgCYxvV5T0QT3q/BoaHankcPIrPsKxlVmzxh1gGiKOIJ5bhe+OMPg==
X-Received: by 2002:a2e:7e0f:0:b0:2ec:56b9:259f with SMTP id 38308e7fff4ca-2ec5b3e24d7mr36295221fa.48.1719302258201;
        Tue, 25 Jun 2024 00:57:38 -0700 (PDT)
Message-ID: <a98ab069-407b-4dee-9052-40ab72890d47@suse.com>
Date: Tue, 25 Jun 2024 09:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.19?] Config.mk: update MiniOS commit
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

Pull in the gcc14 build fix there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Probably nice to reference a gcc14-clean MiniOS tree from what is going
to be 4.19.

--- a/Config.mk
+++ b/Config.mk
@@ -224,7 +224,7 @@ QEMU_UPSTREAM_URL ?= https://xenbits.xen
 QEMU_UPSTREAM_REVISION ?= master
 
 MINIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/mini-os.git
-MINIOS_UPSTREAM_REVISION ?= b6a5b4d72b88e5c4faed01f5a44505de022860fc
+MINIOS_UPSTREAM_REVISION ?= 8b038c7411ae7e823eaf6d15d5efbe037a07197a
 
 SEABIOS_UPSTREAM_URL ?= https://xenbits.xen.org/git-http/seabios.git
 SEABIOS_UPSTREAM_REVISION ?= rel-1.16.3

