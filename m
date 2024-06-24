Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1331F91455C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:52:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746301.1153303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfQL-0007pu-JZ; Mon, 24 Jun 2024 08:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746301.1153303; Mon, 24 Jun 2024 08:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfQL-0007nU-GM; Mon, 24 Jun 2024 08:51:41 +0000
Received: by outflank-mailman (input) for mailman id 746301;
 Mon, 24 Jun 2024 08:51:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsRE=N2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sLfQJ-0007nO-S7
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:51:39 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8229cc5-3206-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 10:51:38 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ec17eb4493so55113971fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 01:51:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7065129b9edsm5864862b3a.148.2024.06.24.01.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 01:51:37 -0700 (PDT)
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
X-Inumbo-ID: f8229cc5-3206-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719219098; x=1719823898; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wi867LupThgb/OSaWtfRwuG/utSAs7BJobFFwJezGqM=;
        b=Ijq8J7p7+Rxq2YFGtEnt1toC9Ds9phUv7+RPeeyq+MLyeERYKWGhABti6By/ILtE09
         EgNPUIU5uw7MLXOgaXBXnnbxaRekLreCApGw2ncff7f3dGIQxWSs1KeW9aZgfy8AkbQk
         bG5i3mr8s7hWyfSCvYXHZE67G30Ub2GsdN24GWEc9cRdS5kMpJWwKTW0Yqsruto+IgoJ
         af4vV+ToU/QVFPAO+ihJPFIHwdzPAfrIG2nJBjHJ6QYdz7Y3US+TD0ERb/fvggP34+78
         h00lO91ReJsLGMaty53prXuANkmFV7XSLMoXwjaztU2GtfNv7KrsKvtRX8t94XxTi+LA
         paPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719219098; x=1719823898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi867LupThgb/OSaWtfRwuG/utSAs7BJobFFwJezGqM=;
        b=M4b5gd43HHVjaThUgORal4SZ0IkUdNONoouih4wk95n22STO/SHEXZnAsmwQOzBTMt
         rNduEQx8P9efvUR6ngiR5DtKmwDpiMob/0Y0RDIwPjdfG6WJHcICLn+YkdGfWhbrYUY0
         iNQmFcrVYlpJhNJFDN4qo3VhACDrbs7raB9u4jcg1xNuGkMdJ/PZwRJFq34zQBypbrIo
         1A6btQbK1rc0nl/CkczXm6Qp+fFa9hgBQf3+9T7JBb9v0DauugreHE//5Ig7P/j3aIax
         mS4W8yjithX/HfG21ZQgy+/6tIRWieduShjxwTJOQuwIIybLkgTu1dn4YUBXYXLTbDkD
         YV4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUHTIqYl7EsN+d1Sujzug1rKYA+nhw9cseYiNnxdrJEGWjzbqUJhh1N+jPnm9gB5rOn8SHyCCDcDvXO5NSDTPpnQHrHwMKcko9F5XWtPE=
X-Gm-Message-State: AOJu0YzD+rdOVot1Rxmy/9CLXtJq9Tv7wPKtRcZWzx3dFJOa1oTyZSVc
	GTNfpjXXq2QtFUGQzq5pGKWp3bFOkJVmYFPNuv6eHnL3yFB8QLsM4SrpKDrEFw==
X-Google-Smtp-Source: AGHT+IHM5btsh82TzUth4CA8j+2Sg93KpL/m0mmpW1Cnv762zXqycm6twnzmCq26SwjOAFHAB92BNQ==
X-Received: by 2002:a2e:95c8:0:b0:2ec:596c:b637 with SMTP id 38308e7fff4ca-2ec5b339e01mr31829361fa.49.1719219098104;
        Mon, 24 Jun 2024 01:51:38 -0700 (PDT)
Message-ID: <dfe1eaf1-35d9-4c42-a6de-ace577313559@suse.com>
Date: Mon, 24 Jun 2024 10:51:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v3 2/4] x86/shadow: Introduce sh_trace_gl1e_va()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240621180658.92831-1-andrew.cooper3@citrix.com>
 <20240621180658.92831-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240621180658.92831-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 20:06, Andrew Cooper wrote:
> trace_shadow_fixup() and trace_not_shadow_fault() both write out identical
> trace records.  Reimplement them in terms of a common sh_trace_gl1e_va().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



