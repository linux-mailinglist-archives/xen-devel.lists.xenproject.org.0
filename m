Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2ECBF0CFF
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:24:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146170.1478637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnze-0005iJ-BI; Mon, 20 Oct 2025 11:24:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146170.1478637; Mon, 20 Oct 2025 11:24:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAnze-0005gp-7r; Mon, 20 Oct 2025 11:24:02 +0000
Received: by outflank-mailman (input) for mailman id 1146170;
 Mon, 20 Oct 2025 11:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnzc-0005gi-DN
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:24:00 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 455a51ac-ada7-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 13:23:58 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4710022571cso35607365e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:23:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00ce586sm14983938f8f.49.2025.10.20.04.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:23:57 -0700 (PDT)
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
X-Inumbo-ID: 455a51ac-ada7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959438; x=1761564238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/zKwOgFsJ+escWGS1RH8zYddiH3sUvl+3amT5w/Xcic=;
        b=dtDCwUMIK9rKyDzc4bC+C2XtyCPyUNnx/GeJZBs0o3mHns67bOT9+Fd0iCRRSE5oik
         Lglo/kHrEEYiATdebTmUUTZg822BtxW6F7ajGu9G5tE71/C3dWQkTGCnHXazoByGZWyY
         yF815Zbju7KXjhngIkhg2mht8m1Ipw7MYNQorp+FqAQwzbdn4wsiIOoN1NUJTTosBURe
         iVSGYv4pHb11XhsxzEAJamhhyG8xcdCr2oOf7E19jqipdL5SXaFu39hPYA6wmfxOxpJQ
         MLyQNmNpoJu7RVTj908EfnxO6taHiQ8cSWgSjYobnEI+726NLVXVdBTG10hnzdX26YSt
         VPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959438; x=1761564238;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zKwOgFsJ+escWGS1RH8zYddiH3sUvl+3amT5w/Xcic=;
        b=m+VtmFJsaaKqT+lSer/tzRJKH7TsLpCwlc0UMU2Wu9szmsxrGtIaRa3YFsCpSPKc21
         R9k78fRjtv0CmZkWgK7Lj5gEgPoljaZbx1j2upzKOg6IuVK3YGjbDc2cX5+sJNPgtPGi
         0nCYYONT26xgmyv6yG9iCereUT4QgQkUjg5Nq6SeLNenzsUxljh/+ps0iv9MKHzLNMGe
         47sWtyjkvNAfkNX/xgoAzf96KqiRCFdEG40DkTFwn21qXhYtn5bJVb0n5Q/oE5NVkpgZ
         3Bd/wrYvjLq3Hz8GglJDVqzBPkAP0DKhoiaK8rINzz3Y5IGGr3dVeDXzMTkrFZGlZEDl
         lQ9A==
X-Forwarded-Encrypted: i=1; AJvYcCWKVsssaun4927jtdDmDcn1KotAg1A0uA4+XkTNX63fGtMDRJkjSDV9zz/ouZXURItfT7Ky2At45YA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrGLAPlVvrsNz3cHhGgGKXiwbVICebcVaSQBH769RGmnzCtX+2
	PBGYH++ZME6W6pXeks3b0hN+MzXrusJ/chyBif3oRo3SqJe9xhwdf7JPcUtUKzxO/A==
X-Gm-Gg: ASbGncv5Sq8GaFIfF/Ut14Kpt3oGMxZK4Smfb4wKxf0uDzw7gafD2kXH3v9cnuIOtRu
	hQez4TAPGDCzEdHtXw/0WjyYDGwrJm+3cUiqWhOyERdV9l/oww2sbSghB8nXPn10KC+N7GntUVZ
	Fw5bbnznvwIrCr3onJlphpsTHHJyOJOV/FD7YjyPpXprrP+okxXHDrZRvlrENgys4CsLYzzAubP
	st4MQznvSCXbN3Fs1ZCJkDjm3pUlGOBuFfJZnSuHFtPVqmu9npp6opNig6f5alTZfezRAjxQmcE
	7myqkQuA0HHL/gfhgFK22Lgz2nGdmRUIDKI73de2R0LJ2MfQMDciwvyY4Qrf/9xGJb/+0co6ti7
	EunKjo5bQY+Qa9sfEAly+wWPQEOLMQ5aRyzXGbMBGwgVnLN9vFrnpZ13cFaGrrzh5IBNIu8eAXD
	T281IKIUeeCoqq3ZW7314puJbrzXJXVO3Q9eZwDQCcTPSRfJJHZLTTWp3oirA2
X-Google-Smtp-Source: AGHT+IHCMT8pkREDRh8vcsOLrEwgx8WBTUiIFazGz6CHpUZcsCDm5Wltl6b23+TLwQe9PYUepbk0ZA==
X-Received: by 2002:a05:600c:354a:b0:471:152a:e566 with SMTP id 5b1f17b1804b1-4711787a2d8mr65059285e9.13.1760959437881;
        Mon, 20 Oct 2025 04:23:57 -0700 (PDT)
Message-ID: <204b0382-5a7a-460d-99c3-075ed742b105@suse.com>
Date: Mon, 20 Oct 2025 13:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 3/9] x86/HPET: replace
 handle_hpet_broadcast()'s on-stack cpumask_t
From: Jan Beulich <jbeulich@suse.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c357cb79-a10d-4d81-9695-9d16a4080595@suse.com>
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
In-Reply-To: <c357cb79-a10d-4d81-9695-9d16a4080595@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 13:19, Jan Beulich wrote:
> With large NR_CPUS on-stack cpumask_t variables are problematic. Now that
> the IRQ handler can't be invoked in a nested manner anymore, we can
> instead use a per-CPU variable. While we can't use scratch_cpumask in code
> invoked from IRQ handlers, simply amend that one with a HPET-special form.
> (Note that only one of the two IRQ handling functions can come into play
> at any one time.)
> 
> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

While the cover letter (intentionally) says otherwise, I decided to leave the
4.21 tag in place here: We may want to consider this one, as making the
original problem less severe (leaving patch 2 out of the picture).

Jan

