Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 878B6CC1ADB
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187674.1509016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQua-0006oq-7S; Tue, 16 Dec 2025 09:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187674.1509016; Tue, 16 Dec 2025 09:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQua-0006n2-3m; Tue, 16 Dec 2025 09:00:04 +0000
Received: by outflank-mailman (input) for mailman id 1187674;
 Tue, 16 Dec 2025 09:00:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVQuX-0006HB-UL
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:00:01 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ba3239-da5d-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 09:59:59 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-430f57cd471so1240741f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 00:59:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fb38a977esm26912733f8f.12.2025.12.16.00.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 00:59:58 -0800 (PST)
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
X-Inumbo-ID: 99ba3239-da5d-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765875599; x=1766480399; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3M8ozC3JRR+KOHCxSo2Ll0hGU7TXZiWZErP1o5EVc2g=;
        b=gN8ypqsDej16EoWbqq7jfmC7IktuTAkOhVXs+xBHdvpQ6b9KerrnrDJ3CuybhMKcVu
         FkLWR4ct6OYqNywvcJfrFoRHlp6xj7xxG6gDmpDsS64xiQ2+cFpAVerWIVgOuaBsKI46
         KcVlGdGia+5IfxNpOdLEAyD5PHnV0YZ5fW/BUVVWG2I0acjC9rwjKkaWVdBRLeGQVnTf
         Dgc5AcRHs+SvoysN7bcNbxD/rlKyyZ2X5sSiQYBoQ+CZbciySWQhaikkMuGdlNC+pwsJ
         1odJ7DTUta7I3HYPjEVXKj1otkIta+igixpctxpJUyaoNq/Mxno449LS5q01xHYH/kVT
         0I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875599; x=1766480399;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3M8ozC3JRR+KOHCxSo2Ll0hGU7TXZiWZErP1o5EVc2g=;
        b=WM+6UyXuZPmqU6kl1NI/CleW8MeeMPVr+SUuArZ4Vbi7zQCWKod/wlT8qexVrlYVYL
         cMzafE52UV2v8mPl/yFCOMIHAVxqJr5rIoZ5LRzzUJrff6YaI6LtnAf7Wcjdv+a49FFi
         MZjUUIxn2irIxGZ4/s8bcbFQaUQ6Zqt36Km36cglzgJSnvv4vXOR8OCKUJ1u1VHtC96A
         hMyhTFMUBsUMxDiwqzzleKwpB6yRP1+4L5muvjXerlr6S+IWeSd3AfKsqKjz8saa5Q3r
         W/q7sEUbCyF5QrSlnxmrl4gkAQlZZQZF42u7oWV12OsCm5EOCchMJ7IzTGnJbiNcAXjW
         EcfA==
X-Gm-Message-State: AOJu0YwamNd0AbUtFWtQVUnXh9C4v0Sumg6cLIMlm0Xuwi7mExYd9LKM
	ni2XMmaKoeiQIdOxLFc31dLZuzb4uvk6XGawH1aV3zwbHxEM3PRSlVHtvfGeXJrTNJi87KcHB8g
	zE6A=
X-Gm-Gg: AY/fxX5vI7neeD+fU8heS33pu3jo+5Sv3yy4uDVkA7tIISVF1dw1d4HSNtJFGy45jXk
	lmczNX1IY0tvvAHqq/P2uYVLrWNr+ILLfXfHplmA/ksiArRQwVO2/B99sxpIiVS6awY0RdvWz07
	G/9cNyb5En5kVIT086a3E6HjZ2irGoQwmDQxxJlpCQ4nJL9XNDiGaWTTDqJbL60xBhszvAmPeUN
	XPV/dZ4zew3cimk5TOoFEzM29zaC/LBx7ClqdyeLGAUBYcZyDPFyK/iBb9QpuL4jr9WnXrYFYXj
	yhydstmeCzkyN5pbgxKIxb5RLNAYU3tA/dm087d/QQ9GBr+gj91qcxPjv0uxj6icsi/I+mPD8ft
	mMeEjucm4EKe6kTB9VXKhPAq9yS/7sHfHA0TR1bLCj6Xq3iQdONKpu4l0g8DLuHx5NjvHKoEz/h
	12jjILHqhcRNT1lvZdRiG7+ui2z+cFEmWWowXeHfrRm/LRpp6DpEDL4iNNQBaN5pIorgO/6fRAJ
	Z7owaMder9gzg==
X-Google-Smtp-Source: AGHT+IFqTCKNv7wfnLpR5PwMUoEM/cFZNXvABK816Ek/yMTSHE8IGScgH9uPyx9vX7jO0SEzutf2Qw==
X-Received: by 2002:a05:6000:186d:b0:431:5ca:c1b7 with SMTP id ffacd0b85a97d-43105cac2d6mr1531919f8f.23.1765875598973;
        Tue, 16 Dec 2025 00:59:58 -0800 (PST)
Message-ID: <0b15a3fb-6ce4-4bf7-a235-073742fff35d@suse.com>
Date: Tue, 16 Dec 2025 09:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/2] x86/AMD: deal with RDSEED issues
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

Both patches also want 'x86/CPU: extend is_forced_cpu_cap()'s "reach"' in
place.

1: disable RDSEED on Fam17 model 47 stepping 0
2: disable RDSEED on problematic Zen5

Jan

