Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF58CB6487
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 16:12:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184212.1506713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiKp-0004IV-9K; Thu, 11 Dec 2025 15:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184212.1506713; Thu, 11 Dec 2025 15:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTiKp-0004FU-6U; Thu, 11 Dec 2025 15:12:03 +0000
Received: by outflank-mailman (input) for mailman id 1184212;
 Thu, 11 Dec 2025 15:12:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTiKo-0004FH-1E
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 15:12:02 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb25fa2d-d6a3-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 16:11:56 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42e2b80ab25so122117f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 07:11:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a9b9sm6635315f8f.35.2025.12.11.07.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 07:11:54 -0800 (PST)
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
X-Inumbo-ID: bb25fa2d-d6a3-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765465915; x=1766070715; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ia6UJ3o+/01uClJbT4N8qtOQvah5/qXYZk9kkwy2Ibw=;
        b=X/PkuG59zDVnwoUor8f56DqAoWqDjpIiqvA46yQ5VVoyWK97CuMNL8wMOFb5mc/YGj
         ccYmlq148t6qfaoX3s5AsLQncmDiAERpzwDR2CQqk9zflJ34UcQXw3nfHCa1/jkwjTVm
         o4SgAozS9uK8urOZiRX51AU/BphvidxBVlzYL/XW1CxqXNlQW8TL2d+xkZmFUGnku65W
         DFnP+rSSC1EY/5OogqwImGcpKx0XsZ4uBwVodgcjEXsmNisY9NBhI00SIdZbFO8orgD9
         LQrc3aUsVUEYfKFSXO6fIJ11b3ID72sicabe4Csmy/XQiXdq6j/9EQLazuA3b6QydmUF
         +2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765465915; x=1766070715;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia6UJ3o+/01uClJbT4N8qtOQvah5/qXYZk9kkwy2Ibw=;
        b=a1WX3zZeWFt0rGSQ995S0hyfLNABgrS/iEEdmid5BDlAv0RTBizK1rdpUsZ8FOeiDa
         IjzrmBt/Rvwb0Ub2F0Bfl/flfnXbcoqQCZ8JYZqc1REgIx8X1PdB7zXMNfCiiuPN37G9
         fyGJ6I1ikTnlUxF7lBefrvooHWHIfOHCkSc3H+HpwrfQZwwNm3gJDT1ceW9WtslbeSRu
         /I/lp8u3JnenpRLCY6I/K0Nucolf+09SZJabSbw8JJ3b+WKL+mshxbaib+AO2EPF2J1m
         uEnZUYaxDo2V2OR7o7Kc992Bj2Ke9BbD30TSWekdY5RTOxHC3yvSSLMPZjw4DWbA3mGf
         t6Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWpdb4A9ZvVh/FKSj1+pCpCgdN2rbehtIepDotw16bNUWSiQqRol2KLFIAmCnoILpkaaDbh+eewd+k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAu88wT/7KbMxaviC91acatLQQuQeTcUSfAMIVEfd+A+2ogE43
	q5zN7rgm32pFhGbKivwfke2Gatzujwq21h4ZrJnVY+uSFPi+sKVdKPTjyE0/gdi1jA==
X-Gm-Gg: AY/fxX48QRAKUx/nmlFjOfk1CArEi59krY5y1vBxnx3rF4eWZsPAYAValzwmcWN2rvL
	O8vV3iGhkUp3g6+tIONUQvvFHqJJy7DaYA5eaq23Saj7THze06gAHrV/z6iaNE2DhH0vAxdd2qL
	NLEYGBkX68qZ2mubXQzy54G/Obx/0zLiuX6bZXUGwXt82p3eeQKPaFfCY6qUDZOlonStSb0D3ZX
	5keH5lWpiIETZlAWFZLb90KJK8/OQPO1IcymI5KYINzyFE0tuqU7AJrhJSLRQOuNIYSOT3UwngJ
	+6xiF/+hmjAntrw01fcnr31Pj4v5EqBpWqz752KY5A7YEIsJPolWkxxSN62eOxQS2JUwB961pAQ
	wWSjOmUUxgx6wBNb7jpufcUW+nS88Xm0YFVhafxyAVHbQAMEnLRP5FpEGDqJuCDOxf77vlELhXQ
	gfKQi4xUAGOeGqU2M5FsggwhMyh27pAbSWU/mWil96HkJ4X0liig98k87bTkjbSws/CzxwgC/Mp
	+A=
X-Google-Smtp-Source: AGHT+IEhTXZeXDEVeWJ8Z0IURn6tacublJUxgScK5Qh36cagGZyCJ30A++0BvpWAyDy9ItCAvvteCA==
X-Received: by 2002:a05:6000:26cd:b0:42b:3cd2:e9bb with SMTP id ffacd0b85a97d-42fa3af89c6mr7222967f8f.32.1765465915050;
        Thu, 11 Dec 2025 07:11:55 -0800 (PST)
Message-ID: <5083ca7b-38ce-444a-80fd-bb4733e46ee5@suse.com>
Date: Thu, 11 Dec 2025 16:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
 <46fb3196-f5b0-4f45-899d-0f0fc80d02b2@suse.com>
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
In-Reply-To: <46fb3196-f5b0-4f45-899d-0f0fc80d02b2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2025 15:26, Jan Beulich wrote:
> On 21.11.2025 14:23, Juergen Gross wrote:
>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -159,6 +159,19 @@ define move-if-changed
>>  	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>>  endef
>>  
>> +PATH_FILES := Paths
>> +INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
>> +
>> +include $(INC_FILES)
> 
> And now a failing build tells me why by a gut feeling I didn't like this.
> Being placed here, it affects the hypervisor build as well. The hypervisor
> build, in its _install rule, uses $(DEBUG_DIR), first in
> 
> 	[ -d "$(D)$(DEBUG_DIR)" ] || $(INSTALL_DIR) $(D)$(DEBUG_DIR)
> 
> $(D) is an absolute directory (shorthand for $(DESTDIR)). $(DEBUG_DIR) as
> set by Paths.mk is, too. Both point into the build tree. The two simply
> shouldn't be glued together.
> 
> Note that the earlier
> 
> 	[ -d $(D)$(BOOT_DIR) ] || $(INSTALL_DIR) $(D)$(BOOT_DIR)
> 
> continues to be working fine, as BOOT_DIR continues to be controlled by
> config/StdGNU.mk. Its DEBUG_DIR isn't taking effect anymore, when for the
> hypervisor build it should.
> 
> And of course behavior now differs between building xen/ in a tree where
> tools/ was built before vs in an otherwise clean tree.

Below is what I'm testing as a workaround, but I'm neither sure it's
reasonable to do something like this upstream, nor am I fully convinced of
its correctness just yet. The shim build looks to be working fine, which
is where I was concerned the most.

Jan

--- a/Config.mk
+++ b/Config.mk
@@ -191,7 +191,9 @@ endef
 PATH_FILES := Paths.mk
 INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f))
 
+ifndef XEN_FULLVERSION
 -include $(INC_FILES)
+endif
 
 BUILD_MAKE_VARS = $(foreach f, $(PATH_FILES), $(shell awk '$$2 == ":=" { print $$1; }' $(XEN_ROOT)/config/$(f).in))
 


