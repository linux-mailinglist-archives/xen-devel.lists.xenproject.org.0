Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6944FC8A143
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:43:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172719.1497823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFnn-0005Rt-KH; Wed, 26 Nov 2025 13:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172719.1497823; Wed, 26 Nov 2025 13:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFnn-0005Px-HM; Wed, 26 Nov 2025 13:43:23 +0000
Received: by outflank-mailman (input) for mailman id 1172719;
 Wed, 26 Nov 2025 13:43:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFnm-0005Pn-De
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:43:22 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dea84592-cacd-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:43:20 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so59035435e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:43:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f34fe8sm40612726f8f.15.2025.11.26.05.43.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:43:19 -0800 (PST)
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
X-Inumbo-ID: dea84592-cacd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764164600; x=1764769400; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kW4u+DhlyiKzZcaPDyVYTZpsE+za95Xh2fLD/1x9t1g=;
        b=OJVsiUmMsvC4wP7YGVc7pa+Or2dmmaUT4avOO6Knjac0pEZ+JSNMbEIOpmwyEaezyx
         QVZ0DrO6QKfI+b6imINaNFtiwXoVrNpw/ekq7HzKpzFAYkPpdAXaCHC/zYvDIJ14qHrO
         5YnmUzk1jxWIow8I02Rtzle8tvD+xrNez90FOjH1NxWyOEDAFQpCbKAx9eir0mtfZGy2
         K0ST8IaLdUFVo0Rnb6NeRpVNDkW4DpIjGq1dI8Bd5Uos+/Wc0BAZuZd6yuySufQNLt8G
         8WhjEboV8m+Mf0ab/87sEuLbqxTzqsXzSARjTg8WRXj65U5LcHxk8fONhzSCCosp6GgR
         UolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164600; x=1764769400;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW4u+DhlyiKzZcaPDyVYTZpsE+za95Xh2fLD/1x9t1g=;
        b=wjuNJRCOe1fe9E6YS6/LA4CAUyJPJ+vruJAPIL15O0xnMwvInP/aTtbMsQhKGQ1CqS
         6/in+BBTwp8t3Y6WvasTAFc06Fmp1pDxVmjALPHOtKrQdUaFy3ikpwrxz9UtsAwu2pyt
         +y0KaK5ahLfFcG3P1aXUqfDU06D6IR+jRndZLGL3DqD2Dm+BBH8IAC/scbUHIi68Ub71
         05EHAzwSomMn4DYGD7u36M6tn6k0S+dXAsHWjIEhL+b//Ggi+h6eO+hh49c1895McZjQ
         kTSMDEvrdkWPYybC6eM9YIyJmOwh9BROb9BQeHxo3/6Fu0+GxrUXV/mSF90HYlISx+Gw
         d08g==
X-Gm-Message-State: AOJu0YyKIZbefiedm0TwiR3RQgtfZ3BeUZjUIa391i5QN7y6aPwcspVC
	aQzQESsRnKGd+67YvyJ0h9CeQcM2pPsIxFSPVVT+Dms5y7M/IsIl41e2hfNM1xb/i1as6RNONMf
	OfXQ=
X-Gm-Gg: ASbGnctm9TI3E2UhKGrOdCuKWs3j4QT9i7BHsmld48xi1Cj3O124AL3X+G1CUkmidql
	ahaG5Ihlpk16cYdQhG/gsNJ3bVOknN5t6nWIwht5FpjJbtwLlvKMtsYxniRGAsmyOIKIfMx0P3D
	ZXk48Wkm874M+B8UtT3UUNR2YDox/+ry0vexsqOkdeYaDoCIfYWaagBLGAm05C8ks6uPw3YkbQG
	i2Xl97vh8VqAmlhJ6Qz2xLAn2tU8TeBm6brcWrsEMWhCD6QE3z8IJprn+lyuhVqwPVYF0QQom4w
	mGNiPeyFPBb37w6zDOpveWHhsHJcJLCr2JWUlPUF95W2rWEYDDQYlKkssyERl0hG9zOXqi7WtgX
	OVN913tQ/8mGl14JOtU6YiKr7xuxzivaGUS3awG4LnGANvXEfXTxgt6sFZ/+BcMBpDyK4vMG/li
	wH6nMIT3mZMwPDvmafPxE3YXADZ1/KYGyh9POIAeuWJ4gOn3EuBqNJ9xeF8jsu5fYqoONn4Zxdz
	7TRBMH/sn37KQ==
X-Google-Smtp-Source: AGHT+IH1T4F8xR4Q94C5mcqfF6rHEGQeFKPfIr5xZ4OdfYZrhS/YaJ66f6169A2XbNqLfoKHvXJyBg==
X-Received: by 2002:a05:6000:40dd:b0:42b:39fb:e87f with SMTP id ffacd0b85a97d-42e0f350357mr7285685f8f.49.1764164599611;
        Wed, 26 Nov 2025 05:43:19 -0800 (PST)
Message-ID: <b915451d-62c9-4128-807a-42b908dbaef4@suse.com>
Date: Wed, 26 Nov 2025 14:43:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/8] symbols/ppc: re-number intermediate files
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Timothy Pearson <tpearson@raptorengineering.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
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
In-Reply-To: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In preparation to do away with symbols-dummy, re-number the assembly and
object files used, for the numbers to match the next passes real output.
This is to make 0 available to use for what now is handled by
symbols-dummy.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -16,16 +16,16 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 	    $(objtree)/common/symbols-dummy.o -o $(dot-target).0
 	$(NM) -pa --format=sysv $(dot-target).0 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).0.S
-	$(MAKE) $(build)=$(@D) $(dot-target).0.o
+		> $(dot-target).1.S
+	$(MAKE) $(build)=$(@D) $(dot-target).1.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< \
-	    $(dot-target).0.o -o $(dot-target).1
+	    $(dot-target).1.o -o $(dot-target).1
 	$(NM) -pa --format=sysv $(dot-target).1 \
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
-		> $(dot-target).1.S
-	$(MAKE) $(build)=$(@D) $(dot-target).1.o
+		> $(dot-target).2.S
+	$(MAKE) $(build)=$(@D) $(dot-target).2.o
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
-	    $(dot-target).1.o -o $@
+	    $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
 		| $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		> $@.map


