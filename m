Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E56390206E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737196.1143383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdJF-0008Vl-CI; Mon, 10 Jun 2024 11:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737196.1143383; Mon, 10 Jun 2024 11:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdJF-0008Sd-9I; Mon, 10 Jun 2024 11:35:33 +0000
Received: by outflank-mailman (input) for mailman id 737196;
 Mon, 10 Jun 2024 11:35:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGdJE-0008SX-0d
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:35:32 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ad728c7-271d-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 13:35:31 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6f177b78dcso132296166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 04:35:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f29bda0c7sm42166366b.41.2024.06.10.04.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:35:30 -0700 (PDT)
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
X-Inumbo-ID: 8ad728c7-271d-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718019330; x=1718624130; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0SFDPkYnBed/Q2Q5Aa4oXHCXEGjVbxYmaTR8Vh3jjWU=;
        b=aY3meXx7UCnj60sMDozY26oXY0tmNO2y+yDOmWfefTUT46sfhhzlnzsv6w/cdh/vZ/
         5uwJWPaQOXL3bzA4qF4SrtgBfpaFNBwJwi/puIHK/t4vm1ydecpVdH82VSqAmWYhlxJb
         cHMUqVCJcOI9dcwH2LSJNDXb4RFOWqm4eh65t/95BWFCXOQ7GUpQ7A01WIMBtiXmEcFS
         RaLFQuNlGMlI1cweCR558DB+v2druWWM/f17uDd6RqeirGhQMX0xYFAwPkX1ZBwXENzu
         0aJD/u6/DgGDc3Idc19wSvNke9vRDLzo3M4COX6I5ptun5btMmr02ncBLp1SNaYeqCTX
         3qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718019330; x=1718624130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SFDPkYnBed/Q2Q5Aa4oXHCXEGjVbxYmaTR8Vh3jjWU=;
        b=XhhA481HGbf0BRNM4Yd2h3EfurH4CtAYfwoFvYqb82eFVjnqUv5vgXFQlPZ7yZOEG7
         sX1z5f4uGXgzSa6LTyHiP+bKGXh3VpqGBF1MixtFhAUiLfr6C5q3+qPmItMNthMmB989
         RlyEeI4XoNGATEKIsZxAwNxOfKd9YPlIF+Uyv/7iV3y/ClEGxPte7K740fSjCFdL8f3E
         TDjGfN+q/Ui2n7pGUHLHpcRca/cL8QnOls0Qx3nhAvbsgx+NAYaQ+5oBpllh4plPgeJx
         BM9hh2+awjFI33fVYebg2jjjYM6QXMk+k0j0vcavPFBfOTCcWEj7oozjD7MBZmK4++Bg
         ejlg==
X-Forwarded-Encrypted: i=1; AJvYcCW9ojK5Z8e3xVYuCSj/7bM/05HNnSv1g/OolEIG/54hzv3A5F7+NVWTYYCTNDjKQSJf2OPeirbbnmIULCvUZhaK0+jazLAZROd9e0d423M=
X-Gm-Message-State: AOJu0YzBxoQ1FCWdgHfNaekkvRtVUdYu+O3DrWmdOM3VbIb7CWwpsvDR
	ASzRhCd0aKhNrxDJK/spxbtpoRzGdqb5gsFWQq7rORNjdflA5j3sW7nzIRvitA==
X-Google-Smtp-Source: AGHT+IH4YBjSdt4haXOO7+h5t1Y0IDE16FADpoKemfhaCoMcaQQ3omH68oIysITblo9KTqMtb1b/Rg==
X-Received: by 2002:a17:906:3b4d:b0:a6f:1b3a:8898 with SMTP id a640c23a62f3a-a6f1b3a88b6mr191307666b.2.1718019330443;
        Mon, 10 Jun 2024 04:35:30 -0700 (PDT)
Message-ID: <1fe65c97-6aea-452d-99c3-d9da018b33f7@suse.com>
Date: Mon, 10 Jun 2024 13:35:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add me as scheduer maintainer
To: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20240606054745.23555-1-jgross@suse.com>
 <20240606054745.23555-2-jgross@suse.com>
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
In-Reply-To: <20240606054745.23555-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

George, Dario,

On 06.06.2024 07:47, Juergen Gross wrote:
> I've been active in the scheduling code since many years now. Add
> me as a maintainer.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6ba7d2765f..cc40c0be9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -490,6 +490,7 @@ F:	xen/common/sched/rt.c
>  SCHEDULING
>  M:	George Dunlap <george.dunlap@citrix.com>
>  M:	Dario Faggioli <dfaggioli@suse.com>
> +M:	Juergen Gross <jgross@suse.com>
>  S:	Supported
>  F:	xen/common/sched/

no matter what get-maintainers.pl may say for changes here, I think it's
largely on the two of you to approve this addition.

Jan

