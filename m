Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B03368B7B48
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 17:15:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714999.1116428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1pCE-0002I0-Ue; Tue, 30 Apr 2024 15:15:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714999.1116428; Tue, 30 Apr 2024 15:15:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1pCE-0002FS-RL; Tue, 30 Apr 2024 15:15:06 +0000
Received: by outflank-mailman (input) for mailman id 714999;
 Tue, 30 Apr 2024 15:15:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q3to=MD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1pCD-0002FK-IN
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 15:15:05 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c035cfd-0704-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 17:15:04 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2e0b2ddc5d1so21682901fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 08:15:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fm18-20020a05600c0c1200b0041b5500e438sm19716818wmb.23.2024.04.30.08.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 08:15:03 -0700 (PDT)
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
X-Inumbo-ID: 6c035cfd-0704-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714490104; x=1715094904; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UL70AKr0PrPC4zUfgNew7bf1wvnvNIh15gOZgY7wUOg=;
        b=RYmmmQtKT+6GloHndZ0VghuOr9rq+72CltJH6W+Q5VgSv93NcAe8gOjS/qk8SRF2y0
         g8jCfznab2VHCN4UgYm2s7aLPXD7SnVgj3k1teuiAbSAqRe4fKJLxi3i7OLen0DdEdcT
         LR0ln4SsBsjzlOW8gVPhzcUbOXSsdHFPMrPgs3/6hyX9rvbn7jrEphRDotsA2W35TKz6
         +pYZW3iDDplax9DQHNo2jxUDLE3AAqmXiBnh98oeqD5XVgyE+oN/bbUDS7Vy0G3kqKMh
         mhANgQjOBbb+JsFDJAzA2KFhvCBc43Kt42c4/zixmGYUFs49DHn5XNTUPQE33Riq+f+x
         Lmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714490104; x=1715094904;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UL70AKr0PrPC4zUfgNew7bf1wvnvNIh15gOZgY7wUOg=;
        b=CMnh+L31QEaUq6KR76lDmOkQbtjb9Q/jcUzaXFWMJI5wOnyvCag+/jGCtnmgGMzLd3
         nIWtjLtKl20inLXFu5vuUDR0KjxU5+PVTJRARnucCtY8zUb706pWX9AtoxBaFynJd2Fq
         WLCZ86/3eNBWgvLijRf7qkGZqvKCGkyJAuttKGasJAWDJOIqqTelSEeCHwQTELnHhdcs
         BerbPjpSMM1xY0/mch0dO+FrTOe7Hge1fD78VpRoEqdEGiI/X03ZBtjwnyf4Z9Zhm6KH
         /zW7aesTij2lQWMgGCzaGhugfBDCfgN++84QPZXOCgoo3gkdgrKM5KrJRWiotA7qdNXy
         62hA==
X-Forwarded-Encrypted: i=1; AJvYcCVVHkoTyMVsy74QWIK6CiSFTELteJoScEm1NP2OHwUkDQdcN5HSDbxKJ2NoLKW1Duo8bmwXOdceW+qsEkA+zOGwf/IOBtWErzFNf8APJfM=
X-Gm-Message-State: AOJu0YzdkKYssn2Dsx9J80hdboiByJGw9RMAS5QgNgFjvfMmiGhBUa4O
	FKYE/yheP/S1vNw1FZykjFuPDDNwdZyE+pYXM/rqbuUfKQsOqxe4mTpEl9wOug==
X-Google-Smtp-Source: AGHT+IHPNszBPa03sTOvQWx9Go6qsR1Q3bs/gFA+mAeYLqrDDIong3nmc1ezlqSdkPR8RBhTeuJiUg==
X-Received: by 2002:a2e:9b14:0:b0:2df:44a1:2987 with SMTP id u20-20020a2e9b14000000b002df44a12987mr23009lji.5.1714490104146;
        Tue, 30 Apr 2024 08:15:04 -0700 (PDT)
Message-ID: <519bcad6-c901-4ac3-a26c-1d0f3b0e43e3@suse.com>
Date: Tue, 30 Apr 2024 17:15:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 3/3] xen/pci: address violations of MISRA C Rule
 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1714487169.git.nicola.vetrini@bugseng.com>
 <df48ce446cf6409eda04460109f3082b39c4f618.1714487169.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <df48ce446cf6409eda04460109f3082b39c4f618.1714487169.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 16:28, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



