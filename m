Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628128302BD
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 10:49:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668326.1040427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2XI-0000Yb-Fv; Wed, 17 Jan 2024 09:48:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668326.1040427; Wed, 17 Jan 2024 09:48:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2XI-0000WH-CA; Wed, 17 Jan 2024 09:48:40 +0000
Received: by outflank-mailman (input) for mailman id 668326;
 Wed, 17 Jan 2024 09:48:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQ2XG-0000GL-4o
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 09:48:38 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9592069f-b51d-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 10:48:36 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40e8cf57d03so1021995e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 01:48:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c1c1100b0040c46719966sm25793590wms.25.2024.01.17.01.48.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 01:48:35 -0800 (PST)
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
X-Inumbo-ID: 9592069f-b51d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705484916; x=1706089716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9AeZxYgcXWdukIKJMsfb62BEeokrAbqbADDujzYqQyI=;
        b=GOhChJ86cfaLoUvKPZIf5wT9ufH8Rs+nnGL/EgpvfiKEtC2DI3uwsM8IjLsQRAgvT0
         Dv4axNwthfab9NBg5zfdt/LXgVFHcOMfs/94/xYW2gnXvIf63ZmAMEqcIXRnOAuAxs3e
         h21slZ/Sh62YoWIChxMA77i7zGjRKi+ebIpZVw9afaOrpHPYfmRyGLEHsfjDee7PVT/Y
         KQpUJGExfBhNYz+wDXPC7AlOrktOPZG6qlxJyBL8VXsIEDAzsVQRtJris7YvcSUWn6Ol
         yMxlnQvQ1YWZmO+35ZmQR/CYCDS/5xOQXz5ky2Ef29NcDe7EnsmQl6VjB2VZ4pHFjwC/
         Z1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705484916; x=1706089716;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9AeZxYgcXWdukIKJMsfb62BEeokrAbqbADDujzYqQyI=;
        b=wOggsNx4HLy3zWf0gn34v0wps34655N9ZhUH/AjrCc1pYu/md+H8jArpYmR6gci7vA
         TuYhS3C34MDhyX7YDCK6ANz4sm6bENChk5J4RtJeuf1uJXmhh4kgC+dDNhIq2BtIP4qE
         vNBL21d7dM9hndZVaH7gnz5VLBA9H+gMZLhAPv0xTYy94WWNYjI2rRjRbvX1ACkvDSuL
         UCQhXiPQV4UpyeLevutFpNdolbEYxLEBpU1pRZMvrPzHtbP9uLynpxZsPmVcY7eqIp/h
         ad6nGzbpOx9hNWcutxA7VPhISjSXCiLO9K69j/oGR/7zvXH0oKzeDfUNo8+lJxXIqq/7
         VZYw==
X-Gm-Message-State: AOJu0Yx0xJetK+zwvleFXSOqYTP4SLMxn8R/cptUzLaUyqexTzs57wu8
	+e538GbgYW13UIQE2pNyNQ4ZJ9b4rym2JA9VaVXPCF644A==
X-Google-Smtp-Source: AGHT+IGbRYDkdCjbUvpp75I9fKf0QqnPUL+QcCoPmUVweSN9jHDfQpIPKDchVl675kUNdxtfQDLaeg==
X-Received: by 2002:a05:600c:705:b0:40d:8ff4:ea02 with SMTP id i5-20020a05600c070500b0040d8ff4ea02mr5032784wmn.86.1705484915886;
        Wed, 17 Jan 2024 01:48:35 -0800 (PST)
Message-ID: <bab76b76-1f79-4fb2-9c56-2ce000b2055c@suse.com>
Date: Wed, 17 Jan 2024 10:48:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: finish genapic conversion to altcall
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7da816ba-f5bd-491c-a6a8-b750e3ff2222@suse.com>
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
In-Reply-To: <7da816ba-f5bd-491c-a6a8-b750e3ff2222@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2024 17:10, Jan Beulich wrote:
> Even functions used on infrequently executed paths want converting: This
> way all pre-filled struct cpufreq_driver instances can become
> __initconst_cf_clobber, thus allowing to eliminate another 15 ENDBR
> during the 2nd phase of alternatives patching.
> 
> For acpi-cpufreq's optionally populated .get hook make sure alternatives
> patching can actually see the pointer. See also the code comment.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Sadly it was only after pushing that I noticed the stray "genapic" in the
title here.

Jan

