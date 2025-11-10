Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA34C476AB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 16:09:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158428.1486751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITVd-00059b-7n; Mon, 10 Nov 2025 15:08:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158428.1486751; Mon, 10 Nov 2025 15:08:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITVd-00057f-4X; Mon, 10 Nov 2025 15:08:45 +0000
Received: by outflank-mailman (input) for mailman id 1158428;
 Mon, 10 Nov 2025 15:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vITVb-00057Z-K4
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 15:08:43 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24e47d8c-be47-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 16:08:42 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-64165cd689eso2685664a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 07:08:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f86ea13sm11518032a12.37.2025.11.10.07.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 07:08:41 -0800 (PST)
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
X-Inumbo-ID: 24e47d8c-be47-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762787321; x=1763392121; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HWO7O0zZXfQpvyBYyTuSJBWkk4NvwcbNkye75F/8MWg=;
        b=GKEQimcsam5upZrQb2zNpJdrX96CzuI0VC3H9Ji7RDJa2yvRAEXJOSYrgEgXGp6ix2
         gsqQHv9jcQPbn1L2/ePHI6057LSoZ82K3O8z9IgzOT4KQp2i12WSesP+GEWSMtRrx07n
         FiiuMiXW2L5vQdCEQz7A/18FzE6N0NWnYw9VK/WIZUTX2YkfE7q4YrhlL7+4ISg3mbJN
         8MgoNrBbw/JoJavw7FvtudwWZ+IK4NzlEyZzEVQDeyi4O1m6FI0oLXSK60NePnOVnBLS
         DjxpIJWXxNCzfWkeoDVlGF/+domSh51OTPbeWlXycEAY/gq01qS9WfN9cXKR+LYRsrEx
         mw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762787321; x=1763392121;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HWO7O0zZXfQpvyBYyTuSJBWkk4NvwcbNkye75F/8MWg=;
        b=gYQKWDDYdNlk8amonE3L6heDLGelyTdzJISNSoyxrZLWAwiyPhd486Vt0lOsBrMt1S
         xydin5LCtM+D6kRpix8zmtbEWyhH2dIj6LVrkAeguQ+kEPaF88nJwuBZVINzeVb22btW
         M4Kqjazcq9v/HSH71fACUahmsU4pu6+xKa3C+YrHwADI5BkJr9nv/muPMdZYZffRK3o4
         bFouZA9bXRDbR7ppLkyfcTB7pdOhSXgw+1q1LrGfRcL7Za/sZiaBvgMfbB9kSzVGyUBK
         fGHzV58Fz6ZKa7r5xL51wkbTLHys7XQgIYJKctPBalzAWGXd0j52wKNNWv2sa/KGzc5W
         +d5w==
X-Gm-Message-State: AOJu0YxgV6kvuDvjVkDych1LpWKGGQFnXcGUOI+vlSF3WHti4r4IcN/1
	yPUkoUpcdfuOLSmULqCROAugdsIXFewODs9t8u0HS3e99uNMAIBhMZahfxoAwY6obt6JfRJCZb9
	AClw=
X-Gm-Gg: ASbGnctMILG3pxMDk7JpfMrlZz4DLktDQph2ZxVzhc6wka1x2e3soFz2LibMX8iVwqE
	Nt9V88osINq2/A4KjSo2Q1rAKEOIr2pXpgdhjEbZ7panpHrmznkoYCuJUSmkF+i2fUgtLSyrcXA
	KwcZgGRffYjH5uWn8vF5XJRFbdS/ydz+wrn9T2K2d1cFLbjunNBscCk2cBajjvHaukBqu/d0CoW
	uK8hlA2TXLGE8LChaE8mgUGol463ou7DomSo4v+gq6YWOYcx5N1h/cUBvGH27rZ+4zLcStZhW6x
	+dxQQUvL+cTzesHcJ3Y+Yvs8WW9pncFEqxn6HYmR7uT9vuiyFnxgJ+VhSIWYf/ta5PZuqklImh7
	8TZxKwNeOfRL9RP3JEUcAlUka6p4aEK7DgkLYI5PWOzz1Eq8BhzwWIf5pjU2vfxn3EZkYMVVu9w
	wd1XH3Y2aTDxDTlE4Sesa5p3E4zkSWbXfwa9C29DFfunVlGpNIzan1RqOBh900RcwdsvGpcojVD
	DU=
X-Google-Smtp-Source: AGHT+IFyAeQEfLuM2tPF0sJKgmSp51UAMkZ2VH6nBA/1X0kw/vi7rhQroApJlkg9zh2Ya2YV1VORcg==
X-Received: by 2002:a05:6402:2794:b0:640:b625:b920 with SMTP id 4fb4d7f45d1cf-64159b67505mr8051908a12.6.1762787321536;
        Mon, 10 Nov 2025 07:08:41 -0800 (PST)
Message-ID: <0aa341eb-5662-487a-a9f6-713932d2f6ca@suse.com>
Date: Mon, 10 Nov 2025 16:08:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: preparations for 4.20.2
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>
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

All,

the release would have been due over the weekend; it slipped my attention. Please
point out backports you find missing from the respective staging branch, but which
you consider relevant.

Jan

