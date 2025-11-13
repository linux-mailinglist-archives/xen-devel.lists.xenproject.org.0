Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9A2C58BFF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 17:33:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161905.1489729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJaGW-0005fV-8t; Thu, 13 Nov 2025 16:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161905.1489729; Thu, 13 Nov 2025 16:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJaGW-0005dK-5Z; Thu, 13 Nov 2025 16:33:44 +0000
Received: by outflank-mailman (input) for mailman id 1161905;
 Thu, 13 Nov 2025 16:33:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJaGU-0005d1-JS
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 16:33:42 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 832f910d-c0ae-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 17:33:40 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-63b9da57cecso1536997a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 08:33:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a4cbd18sm1737288a12.35.2025.11.13.08.33.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 08:33:39 -0800 (PST)
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
X-Inumbo-ID: 832f910d-c0ae-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763051620; x=1763656420; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CPobIyLR5ER/prJiVLVTFEyyhSEvwjFrinkdSwH5Daw=;
        b=HSx90eAePF3R8MDcY4lVAi4OTKq32JNKS/9OFBnhA7psVchRbV0js6araoew8AmrmW
         pLrC/NRFGuJeOHrBqleSzVe58mEuv+iLMo/PIPz3GY7s+XcGVy7gdx7DL0Sd9gjHt5nO
         j2O8AntV993CyBMV8itz5WoPN56oXnd8mcjC/KmVA/kKCFyPyv/REOL/v6Zl91wHfxq5
         0rfhriXI1KlAAZWXeL6eB7I8romCjpq2Nz9RMejg4YG3p3NvRb8wK2MKhDnBUxmS0Co9
         ZEjbzZ1yDky6sh7BPKLNcc0MGznTt2hAQUrGESR5PK7ajOcKwSS3KZBgU3hzm61h5xPS
         DC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763051620; x=1763656420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPobIyLR5ER/prJiVLVTFEyyhSEvwjFrinkdSwH5Daw=;
        b=Jt7Il6fhE++xYFWqdO5yqpk2IlrOWjg9Ek6Poo2+XlnU1VUSsfV+cg8czvittKTTma
         fzVq8WZVce61u5sk0gCdZ3YT56Yp4ADxoIFPH6x2WxoV0+vnsLcY1rbNMwdwvFAuHLk/
         HGoBs8sRFQ8IS4U6TH8E2WU1+dX5FH8k6Nn7nyKcRK5WdI1VzABpGscl4WchExJuIk5Z
         H99KC5ILNN/s1gPU0zVWxzfXbT0tXyWDDdZcMX9BQTjAmpSlGtzhApv+AEy4kFHTesbX
         VyM2S/Ly0Qir4ZpMGsNDNBnmWgha27HVNjbBA/KDSx3ANwXQi0cyacqH48Cdkav/p6Rc
         YC4A==
X-Gm-Message-State: AOJu0Ywg4T10EilKgcHNb2/a5C0xbHCDqZ4Q3s/UK4fsKTKTfRTbJks8
	QC63FIzgy/5s8N90ZxOLpUifsMb+hHD+jO8ml/0NZvTmNigwhhMGmmZes0YCo55h8wt12ICDaui
	s0TU=
X-Gm-Gg: ASbGncsyOYABuxRMwYMLFPS9+I9+kAlXFgDTbGvGc9yObZEY3ZwEIfVfsmlutDmYcLb
	KJu64yttTmrt/qIsjDKQsdCRGL1dMOEIL3yNAknLSswb5gw9ITnsBnyzV6MYMlsANpESMbbi3qq
	UFl8QTZ6uQ4QcBz0CpLqAAg0Ur7t0fnEkxMu3OecFZBntwK3yF+RxAORx/xzmpPsNVrf4XzJ+DR
	33FNGdLcFF5HrHYbxIa1I5+YdsexrHXGb51jvDnAhyZ5U7SbBmJ1szWjRnPNsOGqroZrtBIaOch
	eIyW9pNvu7JzScS1KWsPCRYZCjj40q7q1nYpewN9UwcCPycE/LgC9xrV1csWiBmLaBhQcEbiH9q
	hFqbpRVl8GdGAmbTbwkcZSKq2v2ITEw9n4A1/vMYexozuRuol7kEnfGUI3ukihTUsLN/+aeASSd
	f1AGoQy+w/HIWMNKZp60kXUS7kONP++2GeLUGjQDYrLvNQf+FncTO6AlPr581hKJqG5Vb2EZenD
	6M=
X-Google-Smtp-Source: AGHT+IF5YkhcelQBvEOqv7eSnsdw97EkwT1t8PDRAPyIdUAy6/y3JJ6BHd/zG1kh+pEZzIG50MTzxQ==
X-Received: by 2002:a05:6402:5351:20b0:641:2c5d:81a6 with SMTP id 4fb4d7f45d1cf-6431a577324mr5011445a12.33.1763051620136;
        Thu, 13 Nov 2025 08:33:40 -0800 (PST)
Message-ID: <71f80a69-a8b6-4836-a5ca-3ee291258401@suse.com>
Date: Thu, 13 Nov 2025 17:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] mktarball: Use root/root for internal ownership
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20251113162048.224485-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <20251113162048.224485-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 17:20, Andrew Cooper wrote:
> ... rather than leaking whomever created the tarball.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> 
> And backport to 4.17 as there's still one more release to do there.

Fine with me:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

