Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D282A7908D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935766.1337157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzydr-0007wI-SC; Wed, 02 Apr 2025 14:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935766.1337157; Wed, 02 Apr 2025 14:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzydr-0007tA-On; Wed, 02 Apr 2025 14:00:31 +0000
Received: by outflank-mailman (input) for mailman id 935766;
 Wed, 02 Apr 2025 14:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzydq-0007t4-BD
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:00:30 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d52bd2ff-0fca-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 16:00:28 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso67742015e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 07:00:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb619132esm21871615e9.32.2025.04.02.07.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 07:00:27 -0700 (PDT)
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
X-Inumbo-ID: d52bd2ff-0fca-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743602428; x=1744207228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aQQDd1gapuOKC8ERRVi4SvfFIF2zEKLTqlaKAIWA6lc=;
        b=FFME+Cu+NUZge2lreisO3+ZiSWA0s56nixzSNr2EptBiW/Vr3NAAd5u1mlfvmwPHZD
         9p8gkoY2bAAczUQ3MDIMqzB+dtjy5tHSPjLl00NxG3TBPl+UpgqfUJ/nUBBsRgXwaS7D
         6eTD0V+VoIkGaxTGTz+iOKYJDDCqYQG/cYkdWFVzJYZ6xUXf5uqoVHMBkLMFb1gwbXVO
         mRsy4pA/Fzv0EexUX4tUyZLhk0mRVafuS5Gh7N5JtTfFIrcAC88LLahVH+e9p+5Ys8nc
         v+e0iiOXdZMm1Y1aOzYsLiGuqZFJDc8M1aALlyNgLvOqg3ynKaincaQ29jfY9bWbtRMu
         VLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602428; x=1744207228;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aQQDd1gapuOKC8ERRVi4SvfFIF2zEKLTqlaKAIWA6lc=;
        b=MIqLQUNCLNZKESzRVzNGBlktRfMDVY6Sd1J5t3Igy+QKyBfr1/7RCP1OKMhr8GVYu4
         11+rtrXmXwZUdAU/7vXRkj47sl8SXqyufLlX7RrYF07HytkIPe/bZ2ypBvd/ERfp55/o
         W3cDU7TaCHaiCv2l/OtwsJH2KVeH7Wp4f2VPIm2kzTpxgNUvwcsxC4LKNkwn158WEPKQ
         ZK3nPn68/Wvh20Hl64ja2yeFhQ6Kj5opFE3a4Ocv11FSv3C+DdG4Erqfu1H2NhIRepdA
         hH4XlMVHEQf7KTcIKTfMMJJPMmUzBu64ZV6jrKQAela0qFo8x1Of3/I7JbpOa3HuZ5af
         jFkg==
X-Gm-Message-State: AOJu0YwRqQ9SCEGLQnHGI4yuZqa7tiEfKIhXU3b286bp7qh9xt33RtRe
	NJw+BX+5wv4b/1ZKJcR1DoRJzIcuXuLgEU078AEDg3+NG8ZXbMj78TmFltZ3l6jnf3YTJqnKtKY
	=
X-Gm-Gg: ASbGncsH1LBvYnc4kdkalj2gJv0vGuFawaUmjn6SyNwrhX+FIgbeHTKYNLqIddNtIiV
	WTpLN7S40X1cDTR8R+IYv3/JlFkz3P2yGHa4EOJIjGlIGe9/26WA3e1ioYgLAhiSjAoSOcEboVx
	0m7yxxz1aYbyEGtKuJ8LXVQhoSU+cxj8XLpZzZdmMiri5D2gRSJmL3AKIFwlbi4w38pfcm1iLJV
	TE3GNG2nbpuTSK6ObwQL/KN8LqJop02oOt1dETMlTlF7/QTpPrSfP6PHYOvQ6obJWnknUn2C3Ui
	h3aKfpc3g3PmW7buas8SF/1jXHqccI8Go8C0l0VjKtFASNNHL2YPebCBui3Ex/UjW4869ubLZha
	RtpBvu1RzIwdXesctbXywr07Q58tKgA==
X-Google-Smtp-Source: AGHT+IF7C52hwri8XqctfZkS5LIAbXhdTYt5qRh8ZJuO7bII2d2p+oH8oXGLZUrSCyGsPzSnsxhO4A==
X-Received: by 2002:a05:600c:42c8:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-43e8ff51423mr84298105e9.26.1743602427814;
        Wed, 02 Apr 2025 07:00:27 -0700 (PDT)
Message-ID: <b7261eaf-b3ce-4b71-aba2-3f40adbbe93e@suse.com>
Date: Wed, 2 Apr 2025 16:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/5] symbols: prefer symbols which have a type
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
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
In-Reply-To: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... and thus typically also a size. Using global vs local is undesirable
in certain situations, e.g. when a "real" symbol is local and at the
same address as a section start/end one (which are all global).

Note that for xen.efi the checking for "Function" is only forward-
looking at this point: The function-ness of symbols (much like their
size) is lost when linking PE/COFF binaries from ELF objects with GNU ld
up to at least 2.44.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I didn't see much reason to also check for "Pointer" and "Array" or any
of the basic types. While nm reports pointers and arrays (but not the
basic types) for PE/COFF, making those up when linker input is ELF would
be impossible without further auxiliary (and non-standard) data in the
ELF symbol table. Transforming STT_FUNC, otoh, is in principle possible.

Implicit from the above: Until GNU ld properly transforms STT_FUNC,
symbol conflicts will be resolved differently for functions. Symbol
conflicts will always be resolved differently for data. xen.efi stack
traces may therefore be less informative than xen-syms ones.
---
v2: New.

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -45,6 +45,7 @@ struct sym_entry {
 	unsigned int addr_idx;
 	unsigned int stream_offset;
 	unsigned char type;
+	bool typed;
 };
 #define SYMBOL_NAME(s) ((char *)(s)->sym + 1)
 
@@ -180,6 +181,9 @@ static int read_symbol(FILE *in, struct
 		s->type = stype; /* As s->sym[0] ends mangled. */
 	}
 	s->sym[0] = stype;
+	s->typed = strcmp(type, "FUNC") == 0 ||
+	           strcmp(type, "OBJECT") == 0 ||
+	           strcmp(type, "Function") == 0;
 	rc = 0;
 
  skip_tail:
@@ -613,6 +617,13 @@ static int compare_value(const void *p1,
 		return -1;
 	if (sym1->addr > sym2->addr)
 		return +1;
+
+	/* Prefer symbols which have a type. */
+	if (sym1->typed && !sym2->typed)
+		return -1;
+	if (sym2->typed && !sym1->typed)
+		return +1;
+
 	/* Prefer global symbols. */
 	if (isupper(*sym1->sym))
 		return -1;


