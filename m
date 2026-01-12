Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A03F7D12370
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 12:17:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200100.1516104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFuk-0002Io-Bj; Mon, 12 Jan 2026 11:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200100.1516104; Mon, 12 Jan 2026 11:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfFuk-0002HI-8y; Mon, 12 Jan 2026 11:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1200100;
 Mon, 12 Jan 2026 11:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfFui-0002HA-U5
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 11:16:48 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f1a59a5-efa8-11f0-b15e-2bf370ae4941;
 Mon, 12 Jan 2026 12:16:47 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-43277900fb4so2149775f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 03:16:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5feaf8sm38518550f8f.39.2026.01.12.03.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:16:46 -0800 (PST)
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
X-Inumbo-ID: 2f1a59a5-efa8-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768216607; x=1768821407; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QOdR60esiavkJ9vN4GBJxy2Nm6qULhfC+ajga9F0Mlo=;
        b=dPLytwKFTPSg/TNnVb/w7T2S3pGW2zoI6BJWd1f0o3klr2FzhGMbj1XtuzcM+U+Z3u
         KMal3T/XEDk0fl5RFKqGdvWthCoMs1oHePGw/wNR1FLUOholQYzAA4BdK8D5jlkdggcE
         oTw89NAOlx6YHD88rPOaFDJ5dCpvlLUKE4tQ0jJT3Xu2l1sxxKTbyDpGhPYhzdQER37z
         sj417zYCMwJPa09BUmzCmlWfEchz6ZgEdwdzqZ8ZpyHSdLBj/ZqnjIvxcvkUwTdveBen
         nEBhN4MYj/giid7KLhgEAvG9VpOk8fq1U2Ast+GPvjNTEz1RO/0tirvTHfA5f5R+rrYX
         9XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768216607; x=1768821407;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOdR60esiavkJ9vN4GBJxy2Nm6qULhfC+ajga9F0Mlo=;
        b=AhxLwqZ5gmcn7t4UiYIjbCEfRg0qtFoYambhVTkae9+0w1LavIksiHPxB3yp/yNxrZ
         xOhH9vRoV/ZSBFz0oZEmKgVwGuzrggBG9ZGqqG67tDz7CVJLsfrg5pQ/N8I2g+zclK3g
         KXtyZCKZcio3s9uedByohIOfui1wTzwJPZpN6whY8wv4beYfNgRQbLRdG2xUs1/K2CqW
         MGMGzLpBFx3+CWxEzOOfDxz5DGHEqkz77/OKxn6OlHVwxDIFaI1Pdc4KorrAQmPXp+QZ
         8h87WqCWIPL4wEieClh7+YfRzov6IW9ct+Q9vxZ7zkttU+Dj7iavwLSAu8VPPwd9t5+2
         0hKA==
X-Forwarded-Encrypted: i=1; AJvYcCWCTTKzFa9fNwkaCmM419oOllT1XGQJ1r2jIKkduLUD1a4WVLzokBnBcdJr8QyHrBD4Nd0CkRjjH5c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwK2wANPWkFjoSWhWScoC1+F/781ZlCKyJpV1NeKOZjRlFOFACq
	Dq3YdyMoRJ8KoLbTDZGJQmeDN+zTevMwEynDbHoL3w6s+9DKWm8jHFZTbdt8BK7ZRA==
X-Gm-Gg: AY/fxX41QEO6ZD3cZ/aVFQ3Qn5sXJ2UmmCGVdrmdIfVnWzo1RO48cw3iff41u91HUHX
	YUPlQ+X1N/Xb+++j1GCxRNL/FgUsRmlihoLiITP3lTM3L5kFSib+vgF9xPb/Q/CsIMMyBgCZC5X
	GrB9k+jVyeJx5lzVUpHT5138j2HyOxEtkyf+zjlLiUBOlgSToe36uh2W3XbCXZwy3cp0UMvP4bC
	slg3EgIMw50qNcNA/KN1obF6N6B3eR6BjiuvQY7CJRcv68ANNBzPvG14hNMq+IWDkpOZvZHpTuM
	utLL37dqPrTtSTLrRBrwTwPV/MCVSSFruB1stemcOQQKmfP3wIkbuWYdoi8NjacIQr5mBmBT3A9
	beQT/33dJiiGiSg7owkChZ0ZUHPJykpM/nWOmLOP46q19gYwMVbVZ8r3eSOUsy4s2++XJ3hAlFq
	lgwF5v/gUZQ7jj9KIIOKjnZ1YlIrLDhRW68QnBFX4/lhjlGjA3u3L8xf82th+9xHNHt9oDXHHvG
	kzwMh2xAOm0wg==
X-Google-Smtp-Source: AGHT+IGlHb658LVo76iKA7O1iDQnJyY05JmTpoaoPyxSCZKIawAnrCVyRZkKbwBOZXX/I+DG50G1ng==
X-Received: by 2002:a05:6000:438a:b0:430:fdc8:8bd6 with SMTP id ffacd0b85a97d-432c37792edmr21420932f8f.31.1768216606687;
        Mon, 12 Jan 2026 03:16:46 -0800 (PST)
Message-ID: <2badbc33-f78c-47d9-acef-9383a5aa3387@suse.com>
Date: Mon, 12 Jan 2026 12:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] tests: fixup domid make fragment
To: dmukhin@xen.org
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20260111041145.553673-1-dmukhin@ford.com>
 <20260111041145.553673-2-dmukhin@ford.com>
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
In-Reply-To: <20260111041145.553673-2-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2026 05:11, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> There can be multiple test harnesses per one test target (e.g. harness.h
> and harness2.h). Account for that by further parametrizing existing
> emit-harness-nested-rule().

Multiple harnesses within a single dir imo likely would share headers, but
use different .c files. Also, why would dependencies on headers need
recording at all? The Makefile includes $(DEPS_INCLUDE), so all dependency
concerns should be covered (or else the generic machinery would need
fixing). Imo all of this wants simplifying (dropping?) rather than further
complicating.

Jan

