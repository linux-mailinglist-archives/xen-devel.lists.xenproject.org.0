Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 325D2AE7EAE
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:11:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024611.1400451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUN5t-00021Z-3q; Wed, 25 Jun 2025 10:11:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024611.1400451; Wed, 25 Jun 2025 10:11:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUN5t-000208-1H; Wed, 25 Jun 2025 10:11:05 +0000
Received: by outflank-mailman (input) for mailman id 1024611;
 Wed, 25 Jun 2025 10:11:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uUN5r-0001yh-KJ
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:11:03 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b252b1a5-51ac-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 12:11:01 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so4293122f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 03:11:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d867c0d9sm126764955ad.177.2025.06.25.03.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 03:11:00 -0700 (PDT)
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
X-Inumbo-ID: b252b1a5-51ac-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750846261; x=1751451061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tOKD7SS3i7ofLqEhbd0+VCWuLYRnzbWGbJM7HLdoG88=;
        b=VDHW/Xd4h/Z0FQXiraY/IEm5VfsqNVggiGEkuznZKXdjJH3A7OgnhBuUmWd2m180v4
         2XdhFDJAYHlhJvZbQZnyfN2JqnBGy+W5EKkuY927MkJ9yNfl226eZmjf+Nozs1ysmbj2
         boRBLHzuX0187ZQMhbqXZ8mR23E9qKCJLPdF1zvHDgGm34tVKgbfb1xUHHMaJbB9uzrz
         8nGYgJkqA6IPDhgSa8eLeOBucwF943MtLUe4TnblfjSLMuAvM9r2N5C/FEABeo7mwEcU
         IjKqc2DUoueFTRBBUYMBVNa2+Il3kMZyGy43Ve2lM6Zm088DlRF3+O2E7XcCETfEXnMb
         zVCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846261; x=1751451061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOKD7SS3i7ofLqEhbd0+VCWuLYRnzbWGbJM7HLdoG88=;
        b=l2oP9Jz6ONHQAfVreq6dQbYzN4/hxfHnb4MZ5/3Rw0YfdapLmaIGnPvLH/VMCQkeuh
         RfX5rw9UqNV8xTaAEaWkpU+1GLwEHmXbyUX002W+tV6MjhU4UIRCU0g/X204sZawGkCh
         4683YSjwS5wt58MDohql4sQHE4rYaLc5ulQlim4VgxFxgJl5u+ej+esLNCwU4B8CD/MW
         Mwe7+qtwArLuu0KRZOJeDYQizpGqZsr2+MZKtJRHHIawCLtZgQh8shUgGadzRBv40+Jj
         ym7pN0rdUTgDEhykdeg6Vch7YlDKn5tHZoFzaZtiPjr9YiHIL4fyfsoDpYs4NbMpvDD8
         wJAg==
X-Forwarded-Encrypted: i=1; AJvYcCWEOVU3RM1zixH15RZisHRosGlOFFAkyzuVwpPUq0VyAwWjuxVduslDWepZu1XEA9TEODX89y/eL48=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywq2VMn4LfFTJX9TkkLgisLM7+/got5AgbfCi5Saywbvy4WKhuY
	03JT+2nrzQxC5VB5Q7M9WCngx16GUxTzYYbF2hGiyR0bTOoABsuJoYS0w1juaqsL2g==
X-Gm-Gg: ASbGncsy87Lcmf//veUGBwndkHAWjM0btiKeKIr6Xxyt1QrezaeBGSjl77wg+cMQ0tb
	YiCqmLCUPOBfLDshe7qB9eJN97Zu+HjoS4rWEqQ17Ku41S5sG0aD14FNLxmiGG5NLSHjF5aSmOj
	/g+JVLTHJj5ZxKGgoV0EqGy91+nWXhYr1QmzHSjX5WayUvSaOhoVgyFDX0+it7Pzgpq2X2kMo3b
	VQlKNyLXftAIIoN1LeM2UXyCclyNR/bhkciovDch6XWV7xyoagqOnaE47Nx+ZQSmxvl5ZW33C4j
	q2VHDl0izaeLSryND/2Ni67RPcUdhoWC4W3pWVQ5s+RxEZrxeY5pvqE8JJCN3Xw5uKGTS3nfFEe
	piAeC9c8aihpiCC8JO33irxJk77aFI6Vk/Qs6T3URRPSutgg=
X-Google-Smtp-Source: AGHT+IFTRGOiNdRzKSQme27JWqDxKOu/+FCYWooQW6C2iq/oPQ66OrYZa6CR5R0vvSq3RNS2fhpUwg==
X-Received: by 2002:a05:6000:26d2:b0:3a4:d0fe:42b2 with SMTP id ffacd0b85a97d-3a6ed631f38mr1716511f8f.19.1750846261143;
        Wed, 25 Jun 2025 03:11:01 -0700 (PDT)
Message-ID: <8767478f-aa4b-4be6-b942-c40f0281dee0@suse.com>
Date: Wed, 25 Jun 2025 12:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86/idle: Misc cleanup
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
 <20250624163951.301743-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250624163951.301743-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 18:39, Andrew Cooper wrote:
> Sort includes, and drop trailing whitespace.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


