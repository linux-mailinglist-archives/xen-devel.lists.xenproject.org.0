Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF50A45FCA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 13:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896510.1305252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGuc-00029y-Ja; Wed, 26 Feb 2025 12:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896510.1305252; Wed, 26 Feb 2025 12:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGuc-00026S-Fl; Wed, 26 Feb 2025 12:53:18 +0000
Received: by outflank-mailman (input) for mailman id 896510;
 Wed, 26 Feb 2025 12:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnGub-00021N-4X
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 12:53:17 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a507602a-f440-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 13:53:15 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso4014047f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 04:53:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba52bc54sm21596905e9.5.2025.02.26.04.53.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 04:53:14 -0800 (PST)
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
X-Inumbo-ID: a507602a-f440-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740574395; x=1741179195; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf0Z1KE7YfIXt4PpykkUhVby1xb/rEwBGs/nUitjkFw=;
        b=CJbMZb1q5+mq+KDZCA0RrKBJ7iAHSwwEKbK9JytZCC+PVUOGVSTsWE+nPDHjjdnj7p
         U1YPo/HDZDygrakacQ8k4pcbZL1TAK8sBI+T93BAOmloTwcli4Xpoe93tGqEYzj5IA4R
         sJ+FeuQ8GfDpHFJ3GdmwojUKAU/h/duz5rh+jQki115S03PwF0e25wAP2IrlJ9btxeq7
         gYhVn8wdT26N30QI91kgHMSDOgCsbWF/F1hq9QKVEjS0uN2ZDacgg4ov4BZOyg2KYRDu
         Kp3a2+XYJEoVNDhWj3DpgfPyLV2fk36xINq1c/mxBFai/P2mFnuoW1WMS3mDITpwLLIV
         FHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740574395; x=1741179195;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf0Z1KE7YfIXt4PpykkUhVby1xb/rEwBGs/nUitjkFw=;
        b=hx9xSEsa57WJoC4qecPJxUQ66mdZDRXdODwYKlO/2sDnw2bQLmEf3/6nPdIrNR/O8C
         zl8B5+lOXbWwnAk0uKhWN/9fLfRB4CbccdeGTSNDO/SFiMYLuSDQvLcfHTfFNHVuJ1TX
         c1yt0lzIDjfT/gbHBt5pGa5dRGI+P7nWN+rEvfNxltuqptqq0h7whorJ/Pwt24Iygv8K
         RIj6ESA+SOHv8SOWvY1RtXmpD8H1NOPBeK7ZprY4fP3g3ZkyR8aGnMRjUlkoMsOoNyqA
         okjj12V027tsjGnnhtZGv+M9xLNfdYuUi34osraO3vsDXLM2MeeI9PVoGXZ9vD1gHRBO
         LJ8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDWvGsheHuUULcsDj+aJWKBnSdo8Z6VYQqpdOkPt2Q7t8v3Hgyl0RQ9sE8Zr74UANv2G3ViGWzsxE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzx+BA9uT1HKHN7LajL3e6wumszZ0fJaP56BCHejYOQ6lzEPEO3
	cDQdrejMXPKuo8Hu3+SxfDWaM3qsmXEJZq2ExkjliVyulQoPMoAI0UvY3qX5fA==
X-Gm-Gg: ASbGncv5RuM1hm5RFuoQmrkWZXMCWOuxXrGkiRCVw+qiHjm3eiUD+SplfqG23/vazZv
	mEK5PqPymmZ0VVNznHGeUXq3nMWr4aRzUTDlTwHhhUiBrH6eYsBcizvr2vPuw8OQbxAyMAcPXuJ
	ojCXZyk/ZDmzjuYRVrlKMw8Q5kYBZMgzmvx/YDXyhC4uqJFGzE3dZjuOk9jPhSE1wMeJzEuK3wN
	mjtkfOoRaTVk+q4KK4K8e2k2Wzntdw5QHaky0dwLjdyQ0JPMPuweXTxhBZW7pzuKgKaIc4kmnJE
	9yYUUzV0hfJD1q+4BL/SUZzk4qFtnd1jvmTGvfuLND4kA6LZIHdS0sYITR1ei8VxssEViFHMh5h
	IjebJO/2mTDw=
X-Google-Smtp-Source: AGHT+IE7AUQ3uL5ah3lgDzra0oKQjTDpqZw+R7iqlO0f8ugPrpTJHiH1njBEy5Sp1rwIlRW+xqxAsQ==
X-Received: by 2002:a05:6000:1fad:b0:390:dfbb:640 with SMTP id ffacd0b85a97d-390dfbb06dbmr115612f8f.45.1740574395153;
        Wed, 26 Feb 2025 04:53:15 -0800 (PST)
Message-ID: <51550031-77f0-44c0-89f5-2a1a53384794@suse.com>
Date: Wed, 26 Feb 2025 13:53:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] x86/traps: Convert pv_trap_init() to being an
 initcall
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-9-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250224160509.1117847-9-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 17:05, Andrew Cooper wrote:
> With most of pv_trap_init() being done at build time, opening of NMI_SOFTIRQ
> can be a regular initcall, simplifying trap_init().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



