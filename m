Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D2A77477
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 08:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933488.1335428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzV6G-0003BR-Dn; Tue, 01 Apr 2025 06:27:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933488.1335428; Tue, 01 Apr 2025 06:27:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzV6G-00038f-B5; Tue, 01 Apr 2025 06:27:52 +0000
Received: by outflank-mailman (input) for mailman id 933488;
 Tue, 01 Apr 2025 06:27:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WxAi=WT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzV6F-00038Z-5R
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 06:27:51 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f3b8f9d-0ec2-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 08:27:50 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso35661245e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 23:27:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82efeacasm188888795e9.23.2025.03.31.23.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 23:27:49 -0700 (PDT)
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
X-Inumbo-ID: 6f3b8f9d-0ec2-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743488870; x=1744093670; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyiVXcj2WknUIQ7FL1t41LRlfv1Xo+TrnUPacs9oCSQ=;
        b=DTNp1Y+1GajR+BTgvnKgLMdjeHF6H9Buwrhd6BpFdMqgVzJgNdUJr7zaj9gAWckShw
         WBh2/+lwHgMMx95puBIQn++WOtQ+tCLp5rF5tdZwroGXWtL8IBOIZjFJeGwGkk5J+80m
         Efl1pz+xisGc5gNuPbA26VQpH36ftUkGIs4T4zc0rlVcF3PWt++ldfjmoeu3T4PDOgHS
         wOl9hMcwHi5Gudiy/AJwYBhywhLDaP6BQdib6LsK9A9Q6+mYt9dhYAjGFMfKYGQhD8Nv
         FUTd6tF8WL+DJulfWGLCydkBsmv09RNrUnyawEebw5sWy2CNVdpbmI+kZqXbpeez946g
         UtWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743488870; x=1744093670;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyiVXcj2WknUIQ7FL1t41LRlfv1Xo+TrnUPacs9oCSQ=;
        b=t/eyBZB8aEp8zwem7Khd5yZJeHRxZqaqQsEL1r0EaPHVEl45/26blof5kkijNzfHyF
         Ko5pQNIkktN3RK+2hlfFa5c2FTTWvlH4Cr3OX4lSHqh19YpbVXlLfA1Suf02CHDM97me
         44EvR4NJFgcPdJpD0qMhAjyMb7u2PNrrREyO9tIGvAZUXP5MjkET6h3NTT+hE4VOyMG5
         ggHlzkQ9737L58+DchHoyoiLahcgGNZ+gFQeDt6K0WG0Dj5he3BGEWdYl3FAPdNCna9M
         ZyHSGxwHkgIWcrOHM560bhatpR5PFbQnMet4ENliGKDnwHZI/VEPJHfwDCBAFmIPXDbW
         N9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1URVjg9r+TaMHc6tckqaeOlDPUp2dtY//5CmsWlNMouH/xZuR2r2e/DgkNYXeFV7HUdz1WFDEk08=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwrHpRHfBksxJXv545Z02DXAT38fmqjbdITvU4spGN2PI3IBwh8
	3Urqd0hbrNMEm6S7weBj6srgN02V8Fj5lHQZ2NK2vPhXY02FWwXNRki4oV1eTg==
X-Gm-Gg: ASbGnctd3A0USioFQwUDX5QnrJaR8dO9HR+n75/KRMxPSFh5muSqyPdNzBUfCkKPIWX
	8Lzk+oP+DFR8jjetPDnGvM3QJnLENYoKAGE7e8yjgZHBCRS276/G/TQ81W4QgIBq1YJeF55v8am
	evVPe+FtNYZaO+3wOeKLhGWAzmqG60Upyd6qrD3EMP/xqNPtG8GVYlchT01XalIpGk1Tq1gl7/F
	N04hI5zzKm9l6hkqObwblLeS/fzJlXtL/p88sfk3XXIBUbiq224/0GZ3rAsqqx9nSNgm+wt/F0e
	bdG73WXQANNd8yV4tjvyxijq17nKFzNzcHWmofqCH6mRMvsRzUFTM071OjI7KjWQZhTIsCxFDL2
	BQwLWqQdVxSEGab2jtNB8Jel5nGNLRQ==
X-Google-Smtp-Source: AGHT+IH/Sn9gkF7r2JapXxbpMlrd8teGBj/LhxQctumb59yAfBY8J5npWpPfHi4ZvUjL59gwc33N7A==
X-Received: by 2002:a05:600c:229a:b0:43d:fa58:8377 with SMTP id 5b1f17b1804b1-43dfa588414mr65765245e9.32.1743488869697;
        Mon, 31 Mar 2025 23:27:49 -0700 (PDT)
Message-ID: <f29b792c-49ec-4b05-81b0-d1b925f272b4@suse.com>
Date: Tue, 1 Apr 2025 08:27:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] xen: gcov: add support for gcc 14
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250401011744.2267367-1-volodymyr_babchuk@epam.com>
 <20250401011744.2267367-2-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20250401011744.2267367-2-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 03:17, Volodymyr Babchuk wrote:
> gcc 14 (with patch "Add condition coverage (MC/DC)") introduced 9th
> gcov counter. Also this version can call new merge function
> __gcov_merge_ior(), so we need a new stub for it.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Any reason this got re-posted, when it was committed already?

Jan

