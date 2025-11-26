Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA08C8A718
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 15:50:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172990.1498091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGpZ-0003lW-2k; Wed, 26 Nov 2025 14:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172990.1498091; Wed, 26 Nov 2025 14:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOGpZ-0003jo-09; Wed, 26 Nov 2025 14:49:17 +0000
Received: by outflank-mailman (input) for mailman id 1172990;
 Wed, 26 Nov 2025 14:49:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOGpY-0003ji-0p
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 14:49:16 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1347c6a8-cad7-11f0-9d18-b5c5bf9af7f9;
 Wed, 26 Nov 2025 15:49:14 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47778b23f64so37936015e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 06:49:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790b0cc1d6sm45245295e9.12.2025.11.26.06.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 06:49:13 -0800 (PST)
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
X-Inumbo-ID: 1347c6a8-cad7-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764168553; x=1764773353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=67mm6kxo4oWlPrezm6wwFoWi2BFZ9dX3lWau51tTbUo=;
        b=cvPWx6vv+M0mEz3785OQ1Ds9PxgysbuJercdhit4Uhq+hTGjMZCOci1qimdWH3DgO7
         rkM0hhQqxC0+Cnt5HkXnwIZuPIVAasPNGEmHWzzK9YNfDnU2JhEGP+swxoOVwbKkV3J/
         uzJWdoHYXZg8WpQhsIsJ4D37e4WVuWWrek1ATj+v5HeBX0TL7bwIHhe7VFdG9/FhrJHi
         zd77948rukKeo4XSgxnCbYeIYkSoUSNIm5sAsVI9bXZuKQYEtp5Vami88Bp0loj7kbC8
         y52ssM579O4OVnZJNfuPG9OkbOrQlir30sdBrRobNuP+GsBwpJoCBSggx7fpIji2n+gL
         fHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764168553; x=1764773353;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67mm6kxo4oWlPrezm6wwFoWi2BFZ9dX3lWau51tTbUo=;
        b=DDf5Aq+miSjF7qM0O62Xj2PH7NcJN1Tvm2rc3C41vs9aL72ZjEFxeac0yVgj4t78B2
         7UnxMrq2dIIrVUv53caD71OJwJrTaV7OhLOlBZZxFeIsMOEh4mAIT5dt/o+bPQRzYaXD
         9Lz6XUZCNmTOBZdTqAsrp47fLMFjCIQAxHmRfUh2EYFu4aGdkGQC1p4a0A0N2+2FJhqn
         QojmaVoGdICHuIO/+fPVx0W3xVP//UhGSaB2WjzKuN2revWOeh2OTZnLeKlMzWJwmDvG
         kFO8WKpCY6PiN+N5NGMv5jQbFWWkZh9BO9i5umM0lkczasCxV9HbJSQaZRWDatcM0XZg
         BzOA==
X-Forwarded-Encrypted: i=1; AJvYcCV1FluLmWzwAR0uDztjXjAjif7G1pSO8GaKx0LikVKdWXR84vKKxAGXZ+Kp4jaTtbA0cJ2uFe/ynpA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+keeUIUB24NB2KaZX5UbICVzomixhxe3DWNRyFD7fhKVekn6T
	3erQowP4dFuS3PsCJcifYFnVTaSsifpb4oyvxPXinnpYxlluA7KlqtYZHAj/prDqlQ==
X-Gm-Gg: ASbGncv0vq09smSVQbdEKJJV+H6bHIk6dFtzV7+4769TuIZLXYM0nmFYMB3oR2PV/Sf
	5xGhqp7LoPNGLpnosAvKEwahYT5+zDDVbj9DY1uYtWEvTjdSd3A7wn7fYpR0Jb0TNf1FEIJCGk8
	pNP9fAcjaO2IXAscxFckXd5FISqnIacY1tIJqXOY0I6dLn/g1ijpMufY8IknMPiuN4ml1K6hNWu
	EhCrac1UYP35bEFZAhEjWN+2/IQ+XBsZHT/KVmzCTHhHk1IZAfuHyHq0O/Qzs1/lQ35GxWcfSiu
	wNTn2Ni6U1jUhkQspVK3pzd8lHlo2BHEiFVX3DQvgYRIDLJAIFKIsMGVt6HrM8StrzqGI0ziHqW
	1Byx+/77pEc6wp2GrvhJoK8PWE1Bpna2VPhovpDivDj8Lrq9sFDcZLK4u1tILo7e7Q7UVnn4eb1
	wQdDWdbRKRLsSTfUucXBgp3X+rHQ+hf+cruAAkQ/MObPCGhIATx2BiMZuj+ybKZHWl/UpZEvj0t
	x4=
X-Google-Smtp-Source: AGHT+IEwTt2zr8Caz4bVD/BWLw1eiXfY6bq2f2o+zo+ZHqprsh9SkeTN0TcpzY3VA9doU4CmnmYXtg==
X-Received: by 2002:a05:600c:1f1a:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-477c114f45fmr193065055e9.28.1764168553475;
        Wed, 26 Nov 2025 06:49:13 -0800 (PST)
Message-ID: <175cb547-02d7-435b-93e5-51d643ca1cf0@suse.com>
Date: Wed, 26 Nov 2025 15:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/amd: Stop updating the Zenbleed mitigation
 dynamically
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
 <20251126132220.881028-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251126132220.881028-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 14:22, Andrew Cooper wrote:
> This was potentially helpful when the chickenbit was the only mitigation and
> microcode had not been released, but that was two years ago.
> 
> Zenbleed microcode has been avaialble since December 2023, and the subsequent
> Entrysign signature vulnerability means that firmware updates block OS-loading
> and more OS-loadable microcode will be produced for Zen2.
> 
> i.e. the Zenbleed fix is not going to appear at runtime these days.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
on the basis that people unwilling to update their firmware already accept
being vulnerable. To them this might be a perceived regression, i.e. not
exactly "No practical change", but we kind of accept that possibility.

Jan

