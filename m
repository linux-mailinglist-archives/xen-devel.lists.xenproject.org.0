Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D52CB0DF7F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 16:51:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052798.1421578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEKd-0003OM-9C; Tue, 22 Jul 2025 14:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052798.1421578; Tue, 22 Jul 2025 14:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEKd-0003M5-69; Tue, 22 Jul 2025 14:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1052798;
 Tue, 22 Jul 2025 14:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueEKb-0003JY-4o
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 14:51:01 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48137cb7-670b-11f0-a31d-13f23c93f187;
 Tue, 22 Jul 2025 16:51:00 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so51160035e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 07:51:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb155d8esm7880898b3a.95.2025.07.22.07.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:50:59 -0700 (PDT)
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
X-Inumbo-ID: 48137cb7-670b-11f0-a31d-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753195859; x=1753800659; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9LeW9mm+sqqYXB10NFo999YEDrNg2CAUgDH0G6/3m30=;
        b=ZYe66TN1yDkig/V/VebQtbYFD8uO55FpXW0S3z7hIfYUUcsPbwCC4UnG2Ck1KGNv+U
         l2+7HyoSIXWY1VkqloZZiyWjoOtt75YE03R1Xdrk7F9s1SZNX27a5/m0a4kRtVy9vE+b
         0oSJU2VuPndTIIDQZJLFd8XPBaR1mVvEGLrSQvBTQ9Bq3DCitt4moS93ZdX7E5VDTrnF
         zzorRRJMBPXSeIBkEgDXYqq7yI4iK99PlpAk00gz5fNcLuRhxLjcSrAeAkuDECih66IX
         uZnUbcYEHUwF/EZiShVRN2wl3U5+e1jUkDFCE1YUBGb08mg08Ft+wgqXQbnRllrnRVOn
         SnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753195859; x=1753800659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LeW9mm+sqqYXB10NFo999YEDrNg2CAUgDH0G6/3m30=;
        b=VIbcu4TnELS6rfzNl5Q/XbPVrpJZPWiWmkVaUknjFUk0zjnIAI+/DGsX0LC5qsHZrJ
         aMsmKEZzifQ/WCf84VtnGOWlaZX3OWFHuznR7RpBtwVqw16CRsohozLQ7AqZKTGfqs5b
         7sVtrDL1cIbv9BA8Cw3gjj/de5UUqbFZJZGiqetAXISV+6EDesoGDW5r+W4hdMP0AjJ7
         yhKIbYZCBv9gkT19LxV5ydVcosiWL0n79/5EoiYO6QJNjAx2y+XMJY91IA3r+3aSv04B
         l1hO2IJgjWuoll1UPDJPNARftnqXKHD3o/+ZT8p+bbi0B+vXwwpOZ+pF1l6prkXm0oIk
         cyjA==
X-Forwarded-Encrypted: i=1; AJvYcCVK9onvkUgemNigXAZ9T0pvqeMNvKgEwlvvTNFSReoRsFkJGe0Pn5AhLjMpOA8l9ZW+QnqxNz3Tx+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEF4DAtfDhNcuHv/tcJg2P86kjWpjSCJs52u0mQ9LWsMnVWE/u
	1t8pxipxtULLC/WhMQiaFQL3nKYguIHoft75nxM7BcvgKG6/IC3hJ3b8KC5LdqwGSA==
X-Gm-Gg: ASbGncsE560+u2vTizwJ6TqdQ1PJNWUjIzQzOmcOoMpdNHGQScG/mmuTwKVbXIfCzL+
	OqKfbj1QXP14vW9t1dvnd5oc/9Iu0JAYQyDkphUiqd83tHwirhagU8yBiW8W2fD0sFIf/2UUvkk
	q82FBMhAK21VhvI1DAE65Jqw0L9ypTQ3IJ3wUZjYCEhjjmbidUwUutSWDnyY5j1n1trJLBXkEXg
	9GQ+SjnJ91daGLwyUDGrjLPNf0HdGROXdi9LMR5MZGHbNamLqkkQ5fyH/Eg5n/WjJlIOSnuu/Gn
	g5s1c29PtY9TKEunTmB30YfhhztHOMQ37teIVlwY0GY7CLu1Vk0gPeyXr40PrgDZ2xvuNKxqzrS
	pqn9d5+22oSo2ye8rhweiHURpCHUlVGjOpo8bYq8uRtxPH6F8ZT7a0qcWKdSYYeV/GMloxlDYJH
	E6oSCXjOI=
X-Google-Smtp-Source: AGHT+IE8hU+jvQGO8JjFvVmtUMKwEPj4A63bM5V9JBkSgulLFgvZcQdKMT0J2DjPcMai7UjKbr4q2w==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:e238:6496 with SMTP id ffacd0b85a97d-3b7634e4deemr2986370f8f.18.1753195859437;
        Tue, 22 Jul 2025 07:50:59 -0700 (PDT)
Message-ID: <2e86538f-aaf0-4b8e-acc5-1ca864d4fa5d@suse.com>
Date: Tue, 22 Jul 2025 16:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/9] x86/p2m: Short-circuit p2m_is_altp2m() when
 CONFIG_ALTP2M=n
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1752691429.git.w1benny@gmail.com>
 <4da736fc96d0d8ee717156957b3e8aa9aec92797.1752691429.git.w1benny@gmail.com>
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
In-Reply-To: <4da736fc96d0d8ee717156957b3e8aa9aec92797.1752691429.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.07.2025 22:15, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> Wrap the p2m_is_altp2m() check with IS_ENABLED(CONFIG_ALTP2M) to allow the
> compiler to short-circuit the condition at build time when ALTP2M is disabled.
> 
> Signed-off-by: Petr Beneš <w1benny@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


