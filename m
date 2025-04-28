Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DD1A9E882
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 08:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970086.1358861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IGf-0003cm-Th; Mon, 28 Apr 2025 06:47:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970086.1358861; Mon, 28 Apr 2025 06:47:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9IGf-0003aA-Pk; Mon, 28 Apr 2025 06:47:05 +0000
Received: by outflank-mailman (input) for mailman id 970086;
 Mon, 28 Apr 2025 06:47:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9IGe-0003a4-5Q
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 06:47:04 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9665176d-23fc-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 08:47:01 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso21876695e9.3
 for <xen-devel@lists.xenproject.org>; Sun, 27 Apr 2025 23:47:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8794sm117636775e9.1.2025.04.27.23.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Apr 2025 23:47:00 -0700 (PDT)
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
X-Inumbo-ID: 9665176d-23fc-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745822820; x=1746427620; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=snKehniRr8gfgMJ+2FEo71p46Wm4wR8+OAy16mVmTik=;
        b=NW5yfeWx0ygV9uS7jSqS1JLd2qEuE8ZEV5dnU8w3KQsDTvXXeGCKVqTkb9i0qdwamb
         ez1ISBtBrettzAny+pUGs8now/Sn7nbU+TBeGQF8M0wxcCVLBGEupGgHKTyzPl/rtnBj
         vh5LXn79TU8HB+GYrYtwnDR1Ht/LSjArets/p0uZkAQHm1F99DNJdQZihSQYvYDIpbUm
         IFm073eFu5HlpnuPh2pgdHZ+AUpV0QFcR3qcIcW2i4yEpSVirc01wdV0pQG32QIEE/fC
         mUytDtaR+72xDsWMsQXtvLOD5CC8mn4zAMaIm+cEpc/m8r/p3Q74yLfG0u2Ncj8Pk51V
         IdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745822820; x=1746427620;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snKehniRr8gfgMJ+2FEo71p46Wm4wR8+OAy16mVmTik=;
        b=Az4E0TbW5Gth/7u2JTkeUI9dao18MwLDXUDg3APJ18pB2Po6chT83hLUma6xKTdAPQ
         6HA/oL78YMS4eROyoeOAtbDkcYJt+fYfTZx5Yuw7h6g8v33GC7vwcvj2XotZ6KxXSYbb
         I8RNHv40LDF4fqnXwcA0/Dq8ehRfDQXZOd1zAQqLbhurmEbU8jfUQ9CQHwEQetcJ2Arq
         HMjfs5vtBedgzSvpjT+DgEUJntWTxaGJ6TvIthN+5QftiDueqfFkbaHDmzO+szm/WhYo
         pSvEBhQIicwxa6IdUHFqOB8V2mvFm/EGtq5Jo6rpOGRZkLqvOEt/wK2VgHBzuVoPsbHO
         NXkg==
X-Gm-Message-State: AOJu0Yy2rYXmWhz06nCj7IV2Z3Xwgi0yZupdniNkl61ngFuMrewnRbad
	Bh96rrpzy3KZllvs3M/QJIjtJZ665N0BLVbTkmaH/96w3NB+Fy1/GSxHUC66ew==
X-Gm-Gg: ASbGnctcx0mpwCdwUUQCWDNwp10Ju2aDBfetpqTUGMMzaZiHvamDYSO8GuC9pNQx1+1
	ued/cNNHpOAM14200yMi8y9IbIxNO2FA0Z81vx+mzMbSA1iHrt37y/ImZvDnMD5mmq/kqD7me2L
	vffudiOK3thvZC608JIjWtnChnXVigxNY8Gxk3M4mIzJtCvYqHa9WI0Cr7w1JJaVRpoAM0+3yWv
	SUkvxD6OdmoBOtbXL6HD2SKDzgTlwqKdHosRN4kdf6FTBsjHX59RvT82Velru0vTd7Gb4CgC01L
	TO8LbTV+XTF4IvYabZst6zMyJuf6Hgo+NJAc2QqlwkHkbbWmfgIrljD3NFlfK+kd8HdIGSpEDRg
	sKp3/JjOcMf6t34ox0XvQl7FKIQ==
X-Google-Smtp-Source: AGHT+IHpHxKRgKd7ZItFmoVV5jTNnKm4f0b3oISApHP2hqp9WZSeHgtV/CoPCZ08N94rzv0nUKtYdA==
X-Received: by 2002:a05:600c:870b:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-440a66b7d39mr97831195e9.30.1745822820616;
        Sun, 27 Apr 2025 23:47:00 -0700 (PDT)
Message-ID: <fe9a99b2-e208-4171-ada0-c244bfab6559@suse.com>
Date: Mon, 28 Apr 2025 08:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/console: cleanup conring management
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, dmukhin@ford.com,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250403000604.169619-1-dmukhin@ford.com>
 <20250403000604.169619-2-dmukhin@ford.com>
 <alpine.DEB.2.22.394.2504251513480.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504251513480.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2025 00:18, Stefano Stabellini wrote:
> On Thu, 3 Apr 2025, dmkhn@proton.me wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> Move console_locks_busted handling inside conring_puts() to remove
>> tasklet code duplication.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> This patch is a good cleanup but makes one functional change: previously
> guest_console_write would always call tasklet_schedule. Now, it only
> calls tasklet_schedule if !console_locks_busted.
> 
> On ARM, we don't call console_force_unlock and never set
> console_locks_busted. It makes no difference.
> 
> On x86, there are a few callers of console_force_unlock, so it would
> make a difference. However, looking at the callers, it seems to me that
> the change is for the better and better aligns the code with the
> intention behind console_force_unlock.

Denis, I see you submitted v2 without any adjustment to the description.
With Stefano having pointed out the aspect, it should have been pretty
clear that such a (kind of hidden) functional change wants justifying.

Furthermore, you added Stefano's R-b without any hint towards the extra
request he had put up above wrt x86.

Jan

