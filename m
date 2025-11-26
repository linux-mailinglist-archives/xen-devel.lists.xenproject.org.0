Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56936C8A113
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:41:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172700.1497804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFm2-0004Ce-4L; Wed, 26 Nov 2025 13:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172700.1497804; Wed, 26 Nov 2025 13:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFm2-0004AI-0z; Wed, 26 Nov 2025 13:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1172700;
 Wed, 26 Nov 2025 13:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFm0-00048o-V6
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:41:32 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d4afa28-cacd-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:41:30 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so47585725e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:41:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052cfe70sm40605665e9.10.2025.11.26.05.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:41:29 -0800 (PST)
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
X-Inumbo-ID: 9d4afa28-cacd-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764164490; x=1764769290; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e4UCK8LKYgpYLU3PH9fD9/Im8kkxHi5oJUYbXSHjKS0=;
        b=A3xfaQDE5w2a8GmtCdQnnXJpNnZzRhASW1w1dggq7DuLRldRH5N5z/K0iqoDV+zdGU
         D0NV1P7Yph+VOvqGQyCsebdwNOmyCCz5asl93HsQUKYTYbzKnMrcPqH6lvYI6qRBHQlf
         SQCc+T8ZTNEuxJwPBjCcMAjdiBjo4Z5sozyrPeU/ZxgEgvLliH2lfv+bDb6ozp3tbISS
         RZK1BaHRAaZL+8ocNAg7H2n6ZNPWPDODgGnwkKRmeegA+aDfXVB8W1lTRn2qewY3ypny
         5Myl2H15GXnreJKPuG+ZGDTLibjuKC73xTnOOSPxamGZtTjm4FYuG2jEhNpeV7I8Yq9r
         hsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164490; x=1764769290;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4UCK8LKYgpYLU3PH9fD9/Im8kkxHi5oJUYbXSHjKS0=;
        b=DvgujrxN8HfMysBi2d0dD7Nwm2hppo3j9q3XEihzsH1ZuI+qi3hr0pk7tIypeVDTyK
         +NnfgNIbCv6h+5TgOR0lHPYD++/XqFX0LWaTLDsXeYjfuiGPu5gmwJ+xzkwfWCouEb1v
         h/zhkf9iAl6AlCNvy5+f4H/OJ1jdafAZtd9ypLYRiIw2HfiQIEo6gleO/4T6tUOFqOCK
         2FKAvyJQ3lZNVthnh7RrcMmSWaYCFPeSUOc3pIpQWq7bP9u6ddb2M3SVwG5tKb4uLlfq
         L4vy1w+W4P8bv3dXe/3AE8iWmskKXYtt7+rTz6EhyETyebOMegybsUVNwsgd2aB8ut/Y
         4f6Q==
X-Gm-Message-State: AOJu0Yy9R/mworGMAJfFqzcWtQffG3XpdMkElQJg0kRQdZ4girFgS68D
	LRIkFkbS0JlRnGJ6Qcjoa7WYmxO2xr/xzVXN1JnwyEgZNx6XHhPzkN0KKhmomt4ayr4XtWrk0JN
	m1Ic=
X-Gm-Gg: ASbGnctBGaETlDeXoa+pF9uvzlc3R82s26Gbd0eApe9ARX4quH69eTGp1GIi/JKwJDp
	kZw64hdjWW7UobUIZUf2z6Q59oTFqq+RybhhKFGSyxdb957RS/30rG52j4u0OIpnD8MEapIuSuW
	CvALkhQROswinpdwi1rr+Jfo/DdEmRMuXWLuJvXL12DGSvif9hw6aaoMCx2nTLKaGhB0mpR6jbQ
	t21wsaNKu++tLPplZxJRaeyldORsIemi7StXPgbpI4AWOgl4aMNNq2BbqgdzgNyvw2T0nN98u/H
	H0n5jfAKDNWdkiNv+FN27s753488ec//6EPpQstSoeGQ2AXd0r30PuTE71jrSbls735/t84FHPi
	w1xVWldFuQJ8KmQKFBRlyX3xkdGdSDcQrb/wY4i3wCZPsH7Ankgr02sHhXp6Fb5mKw0/ygJImGn
	BmVM6QVIodNquKBpk+vFl+bqoEdoYlPU+7dv/RMwLuDkJf11IbHD86o+DIVN0UtdKDGxXGIAER5
	dE=
X-Google-Smtp-Source: AGHT+IHs+Huwi03vHObOVsk9b5wyQ0y68NHJho0IS0DBrSB2328RNWF6VLslrsWqpBbQ2pR1MsdWPw==
X-Received: by 2002:a05:600c:1382:b0:475:de68:3c30 with SMTP id 5b1f17b1804b1-47904b103edmr71689765e9.16.1764164489952;
        Wed, 26 Nov 2025 05:41:29 -0800 (PST)
Message-ID: <a7fd7847-a34f-4436-95a3-627d01a64e43@suse.com>
Date: Wed, 26 Nov 2025 14:41:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/8] symbols/arm: re-number intermediate files
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
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

--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -89,16 +89,16 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
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


