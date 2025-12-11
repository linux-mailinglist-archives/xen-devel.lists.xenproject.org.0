Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2577CB62E5
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 15:27:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184165.1506683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vThd0-0004pb-EV; Thu, 11 Dec 2025 14:26:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184165.1506683; Thu, 11 Dec 2025 14:26:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vThd0-0004n5-Ba; Thu, 11 Dec 2025 14:26:46 +0000
Received: by outflank-mailman (input) for mailman id 1184165;
 Thu, 11 Dec 2025 14:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vThcy-0004lX-PT
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 14:26:44 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a6bda6f-d69d-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 15:26:43 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42e2d5e119fso91589f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 06:26:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a841sm6258770f8f.30.2025.12.11.06.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 06:26:42 -0800 (PST)
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
X-Inumbo-ID: 6a6bda6f-d69d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765463203; x=1766068003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fZp4IiWKF7UaTWegob4jF7jLgKPaDI3vdCpnzKVE20g=;
        b=dy73qHFpfczJwsF/638ANwLb/WDcvuM/r+r66158USehWyDmwP6lyJT4/DPfUoe2ui
         MaekhLDwO4miuLa4odDIpCCTx5jxcJudQ1XLKiG4LzOwl6bmoMmWYRuX8WE7lY9tG3b5
         h5xDvvGET2vsYnHh37oo+8dEGGwkhMt67pyiWCw28uHXCTFLm3n38+fLM0t4wyP9nt6t
         UPROFxUD0g9u3IhEQgaUupWiZddvruoyaYBJ5CR2d1Cl6w6CnSLE8H6XsSkGz2quMo0G
         Hamaji+VbZ/Zv7dhGIjFkTDCPuVU/dy3e5uN8V8dBk6ikdRFCzl/I5YM5fRusUVcYdOI
         2NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765463203; x=1766068003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fZp4IiWKF7UaTWegob4jF7jLgKPaDI3vdCpnzKVE20g=;
        b=FVJn2/dvoc+SipVVU7ixBV8rJM5tu0NMxJUWtle6eahCmlT+fd0W9LHsDdUZ4iBxp4
         4oMNgIiAIzKHhaVvYRY7GGQ0g7u1eZ8utmb+c6ugYOkXdZbFV1uXVy/IZW7k7JxPTHCO
         0+xl+JPxwsyg+kD3ZAPa8kGWHpu6WtTeXoVFIFU4l7q71IFQ6pBQKfK8sIP1DTH70Yci
         P+9mcaPEMUxcEaLlPyzZX0/W+PE4Mxeua1kq4CXRlUmSUT+s2bqnqefGKu5FmIGb+H3E
         td3E5R2W+gMypf6Q0udc7VWCe9MWUOXWbUrOVevcYTN3yWxIKzQspf/2+SGeCaFNY/0n
         8mhA==
X-Forwarded-Encrypted: i=1; AJvYcCXlaeWYEKTSSiVacBvycYwSBgxAZQAMB8beDhwCAYvTcwjTWheQgLzunJGH0t/qXuj5LmfW0M2ssno=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyULCGggog3eGbEzejGPOr9tigYnjrvdpoAaWyNG5hjV8Rhmck1
	MvwMMQtosD/fMCeSX+KCZkFeWgN6uAyOayx28oeoeV2OOPD+If65sZJc5TO48nmFvQ==
X-Gm-Gg: AY/fxX5WiOhB3i+eroHO/NWs0UIRoAR/PRjkdVMVai3Ygxe/iNHQknO+OrwqEGkKwxJ
	ncDRQB8b/1iIWECaTBkpk8oLYWgmkHVGwImUscKZN1rGE4OwX7xCO/2sB9pjJhg45Pd9XuA8zNC
	g/ZzQ9Ru+1agtUklLnd6uAY7t8iDCScEYc4zOqI3yRosnWCGi/zrRL9Orgy1z82o9xHcBB8JBzN
	XXpgIvmSc+RbdkwbJaV8is2WxIrdVTYiqUtNJ1KcjJ2GfAvSzlBtLvOdhaoxPeBhMFs8fqVIv6A
	ZRmhrsOsPN1Re9dhghXycpWACsHApSICVqhAlQX8GvsaQZXs+tK0Szza1mWsJLhEZmBlU1Cj+V3
	ttg3JsGnF+agGuBbjYBDARU17M5TpbtI93V0z8Gmr954K5JwJlS+qX4d1+SnS/136425uhetvB7
	VCxMSnfnUfmJbFAKrhlLn+0+rh0dqSd5CciEgcP1HNWONNyUMFWuQiwp/3/v9R1v8g5BHtp/+h5
	S4=
X-Google-Smtp-Source: AGHT+IEcsR+trNkRfiyWRvaIWyq8s4+r5BCw9DywXXEXV1RoIv6lMeLcrviM3zvLZiXZaK+xTOEtQQ==
X-Received: by 2002:a05:6000:2389:b0:42b:3bfc:d5dd with SMTP id ffacd0b85a97d-42fa3b1ec40mr7293752f8f.54.1765463202690;
        Thu, 11 Dec 2025 06:26:42 -0800 (PST)
Message-ID: <46fb3196-f5b0-4f45-899d-0f0fc80d02b2@suse.com>
Date: Thu, 11 Dec 2025 15:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] build: add make macro for making file from file.in
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251121132332.23514-1-jgross@suse.com>
 <20251121132332.23514-2-jgross@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20251121132332.23514-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2025 14:23, Juergen Gross wrote:
> --- a/Config.mk
> +++ b/Config.mk
> @@ -159,6 +159,19 @@ define move-if-changed
>  	if ! cmp -s $(1) $(2); then mv -f $(1) $(2); else rm -f $(1); fi
>  endef
>  
> +PATH_FILES := Paths
> +INC_FILES = $(foreach f, $(PATH_FILES), $(XEN_ROOT)/config/$(f).mk)
> +
> +include $(INC_FILES)

And now a failing build tells me why by a gut feeling I didn't like this.
Being placed here, it affects the hypervisor build as well. The hypervisor
build, in its _install rule, uses $(DEBUG_DIR), first in

	[ -d "$(D)$(DEBUG_DIR)" ] || $(INSTALL_DIR) $(D)$(DEBUG_DIR)

$(D) is an absolute directory (shorthand for $(DESTDIR)). $(DEBUG_DIR) as
set by Paths.mk is, too. Both point into the build tree. The two simply
shouldn't be glued together.

Note that the earlier

	[ -d $(D)$(BOOT_DIR) ] || $(INSTALL_DIR) $(D)$(BOOT_DIR)

continues to be working fine, as BOOT_DIR continues to be controlled by
config/StdGNU.mk. Its DEBUG_DIR isn't taking effect anymore, when for the
hypervisor build it should.

And of course behavior now differs between building xen/ in a tree where
tools/ was built before vs in an otherwise clean tree.

Jan

