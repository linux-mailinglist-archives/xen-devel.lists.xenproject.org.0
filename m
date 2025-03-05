Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE1CA4F9A8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:14:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901920.1309910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkpn-0004ZI-61; Wed, 05 Mar 2025 09:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901920.1309910; Wed, 05 Mar 2025 09:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpkpn-0004XX-2h; Wed, 05 Mar 2025 09:14:35 +0000
Received: by outflank-mailman (input) for mailman id 901920;
 Wed, 05 Mar 2025 09:14:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2gZc=VY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tpkpl-0004XL-U5
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:14:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f6101a9-f9a2-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:14:32 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43bd5644de8so2504335e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:14:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e4796517sm20107667f8f.5.2025.03.05.01.14.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 01:14:30 -0800 (PST)
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
X-Inumbo-ID: 3f6101a9-f9a2-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741166071; x=1741770871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gl9jSiB7evpe8ejmAOLUI0imnKWEgep+b1ZE6Io+mN8=;
        b=cypdZq2ZNamYFnpXKFU9vstO4RuC7t8vYpsQzVugezWFFaDKIpf+VTby79bs65aaMw
         8UW6qdhNQXU+yst7SAyBU9tkPBLDhDqXpjn1q10BUXQh6uzGyHTsmrBvFuqFyLqzCP41
         FZ+iF2XepdZ1WGw/79Rz8vscCMBv+MTOiCywHAt1NCF2ScjtCe5xysyyqZt0OV0En0PI
         r8frDpEL963iKvegBlpCggzuydpCe8N1XjUdDX4I5bUVBIJ97n/yVuVeOyzLXS//e7Nx
         MNHqPMx/aAnpajn/r0pmR+kgTroQ0/yNHaMmLZV3WOfKZiJ1GXqcQGTmhcxEbsKdCdMa
         du7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741166071; x=1741770871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gl9jSiB7evpe8ejmAOLUI0imnKWEgep+b1ZE6Io+mN8=;
        b=Pg/Y06fTCG80U7xe738QZQoZ5K4daLYIdurNXQUd128AUfLRl1NiEYicm6dzG6O6BA
         BXBIDVk1h15utSGS3c+MFGWsbCb4XT6F7EFzg+HAtB3nZJaIGNCDrsPPIl1pJFmtZWXs
         xOP2sZdKiVoal9i0mIhscn4GZUCdgN8WQXjYVxYaEvc9AM0EI1g1vKuf7MmbsLDJoXsv
         a4yLEZMzPAxzyTQ7X7ZKKZxDNdqPPsBFJn2d4Srcp4cgtkmcbUzIQX06igsFLQLUJKt4
         ri7WYYOZzHPzSboy3j0dGL1lQTbQHwn/0NlFM8zRf2+sTSNuzjaJIwBqZancYRfwesDL
         eWAw==
X-Gm-Message-State: AOJu0Ywt3EM2NF3K6RQqZg4Jos0W7+Ct/+3qN4M5WZ33NBG2szYZppS4
	81foX4hQpiuYSG0hDGLPm0ZYZEHrIvWQXmeQBgwYbwrfEsc8j3t9nqJYO5iMlUWjXQFybki2GD8
	=
X-Gm-Gg: ASbGncsHolRpmMwUc+ocRqTHqa1w8XWsl4XJk0YtMTkxMWHTZoFwcIgZzwY+qAvEvao
	4b8px+d9IbgVqenFYfqMtn/LTKUNBuADtd2OlMrVy4CoSnf/L6Xg9gmQJjBCCe4oFZBizb7S697
	cTyCL64czF0ILz4PgrM1NKRm+Bbvmt8ksyozygsud8XipZAiso5OHj7PFoDlfWcRxLI3l3t5V9P
	F3CN1nmhcPUoYcoUH3ift+V+cB++MhnHyd3E6iSeZ2pM/BNiCJImHYy/7lpIynBzcdCqKBpWmMT
	F9PrepeenwWih+d9bbvjdyUoCbwbUcLc0ownImpl/HtyyUkZu8RBzvkXpVQBQU9kNR8vDbSZMFL
	2W77zGgjP36pyfYXmxxOdWvYSyBBb7g==
X-Google-Smtp-Source: AGHT+IHBfq20PBP2dtkvSFOcOZu3Tq1rwLWCB4cQNsQQjg/3YlZkXp0mSlL/b9+yapE+gJTc2TA0sQ==
X-Received: by 2002:a05:600c:4ed2:b0:439:9d75:9e92 with SMTP id 5b1f17b1804b1-43bd29d239bmr13733335e9.28.1741166071134;
        Wed, 05 Mar 2025 01:14:31 -0800 (PST)
Message-ID: <41e7c2ff-ee66-4269-9771-fc274e7a051d@suse.com>
Date: Wed, 5 Mar 2025 10:14:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/public: remove some unused defines from xs_wire.h
To: Juergen Gross <jgross@suse.com>
References: <20250305085646.26472-1-jgross@suse.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20250305085646.26472-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.03.2025 09:56, Juergen Gross wrote:
> xs_wire.h contains some defines XS_WRITE_* which seem to be leftovers
> from some decades ago. They haven't been used in the Xen tree since at
> least Xen 2.0 and they make no sense anyway.
> 
> Remove them, as they seem not to be related to any Xen interface we
> have today.

How sure are you/we that there are no out-of-tree uses of them? They
aren't in e.g. a __XEN_TOOLS__ protected region after all. (I don't
mind their removal, but in public headers I think we need to be
double careful.)

Jan

