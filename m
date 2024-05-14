Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FF28C55C5
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 14:07:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721451.1124866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qwN-000719-Nc; Tue, 14 May 2024 12:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721451.1124866; Tue, 14 May 2024 12:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qwN-0006xx-KS; Tue, 14 May 2024 12:07:31 +0000
Received: by outflank-mailman (input) for mailman id 721451;
 Tue, 14 May 2024 12:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0FJY=MR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s6qwL-0006xr-J4
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 12:07:29 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88616362-11ea-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 14:07:28 +0200 (CEST)
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-6a0f889877cso18240326d6.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 05:07:28 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1872f8sm52727256d6.55.2024.05.14.05.07.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 05:07:26 -0700 (PDT)
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
X-Inumbo-ID: 88616362-11ea-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715688447; x=1716293247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oZjFV9qxtpZP1OtUKJ3si0WwVe7CzAFYin7mIAjiyKc=;
        b=kI8iRuSskHPiSmjfBvCHE6OEH1Qeft4KwqsXyGQGxobNZI+HL4xpM+WUlMB0e/gBaH
         /8JldORuBYaSVqwfBh1ly79+O9p3Mu0BXRuxT24OpG/U8em+56XsZWPnNyHTYIkMf8h4
         3GR0JawtY60zBV/JV99jB+Rgcw9WJ6QEn5sSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715688447; x=1716293247;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZjFV9qxtpZP1OtUKJ3si0WwVe7CzAFYin7mIAjiyKc=;
        b=nmmk7zQDQujuAhKoZjQ8Y7y0jc+Mw2zmWhlxfyrKPSUWi+hCgJlrP0ktSSTC4tpTEq
         Pu0MBDx2MlGK3hmX7sqqXv/Q/gagDDQT6ttCkybjccDJ/C6TO5C4d7M7XaMxjgsRcE24
         9j0tqJ2+RgR3Fgsmm57uhjV5jlaN0TaTZhdpVU0iBQKIGdNTt62xf/GlZXOAWpZdWpp/
         96XXfW8jKTOw2aY8syXR94rBnenKxRyzKJb66tsiYZgTb0Wd7RdMol2VEWLrbZHDNeG0
         Ew9+sBJiOimWuvnhwfxPOvy5B8wzPQxmaP/kMsvXLThZ7Fhq7JLFj4rxGLzndL2LyNCU
         8I+g==
X-Forwarded-Encrypted: i=1; AJvYcCUCssnFCsFye9Q0J6WBY4RqS+zrpU13rW76NckwMzAwokvbQ21Uiz0c5kR2Icz3r53la2r1fJyJfRVLLaqEyyHlsLj/W9iB/2oNnMCqkUE=
X-Gm-Message-State: AOJu0YxBGKU+xklKe6qoM1YA+6hKKifMRqXnV/5JaxqZGtSLJAe5ShU6
	6Mno9ewNgfokCTc8DNO2D2hYkgDNTKLodBb4ybVqzmR6WR5J7vR3Si/x2XsIujtE13KD5BOcYg0
	N
X-Google-Smtp-Source: AGHT+IHOG4xrsXj7pUxVrWs7S4Hm9PsBNYXXrFMcQ6hJ9EiH8DRWQFEEZ/kntmaJZzo/ciE+NIw7Hg==
X-Received: by 2002:a05:6214:568c:b0:6a0:585d:a4c6 with SMTP id 6a1803df08f44-6a168138c3dmr142118446d6.6.1715688447529;
        Tue, 14 May 2024 05:07:27 -0700 (PDT)
Message-ID: <195184dd-46e3-4bd0-b82b-cf41000e4db1@citrix.com>
Date: Tue, 14 May 2024 13:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] tools/xentop: fix cpu% sort order
To: Leigh Brown <leigh@solinno.co.uk>, xen-devel@lists.xenproject.org,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240514081344.4499-1-leigh@solinno.co.uk>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240514081344.4499-1-leigh@solinno.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2024 9:13 am, Leigh Brown wrote:
> Although using integer comparison to compare doubles kind of
> works, it's annoying to see domains slightly out of order when
> sorting by cpu%.
>
> Add a compare_dbl() function and update compare_cpu_pct() to
> call it.
>
> Signed-off-by: Leigh Brown <leigh@solinno.co.uk>
> ---
>  tools/xentop/xentop.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
> index 545bd5e96d..99199caec9 100644
> --- a/tools/xentop/xentop.c
> +++ b/tools/xentop/xentop.c
> @@ -85,6 +85,7 @@ static void set_delay(const char *value);
>  static void set_prompt(const char *new_prompt, void (*func)(const char *));
>  static int handle_key(int);
>  static int compare(unsigned long long, unsigned long long);
> +static int compare_dbl(double, double);
>  static int compare_domains(xenstat_domain **, xenstat_domain **);
>  static unsigned long long tot_net_bytes( xenstat_domain *, int);
>  static bool tot_vbd_reqs(xenstat_domain *, int, unsigned long long *);
> @@ -422,6 +423,16 @@ static int compare(unsigned long long i1, unsigned long long i2)
>  	return 0;
>  }
>  
> +/* Compares two double precision numbers, returning -1,0,1 for <,=,> */
> +static int compare_dbl(double d1, double d2)
> +{
> +	if(d1 < d2)
> +		return -1;
> +	if(d1 > d2)
> +		return 1;
> +	return 0;
> +}
> +
>  /* Comparison function for use with qsort.  Compares two domains using the
>   * current sort field. */
>  static int compare_domains(xenstat_domain **domain1, xenstat_domain **domain2)
> @@ -523,7 +534,7 @@ static double get_cpu_pct(xenstat_domain *domain)
>  
>  static int compare_cpu_pct(xenstat_domain *domain1, xenstat_domain *domain2)
>  {
> -	return -compare(get_cpu_pct(domain1), get_cpu_pct(domain2));
> +	return -compare_dbl(get_cpu_pct(domain1), get_cpu_pct(domain2));

Oh, we were doing an implicit double->unsigned long long conversion. 
Over the range 0.0 to 100.0, that ought to work as expected.  What kind
of out-of-order are you seeing?

Nevertheless, this should comparison should clearly be done using
doubles.  AFACT, get_cpu_pct() shouldn't ever return a NaN, so I think
this simple form is fine.

Oleksii: This is another bugfix to xentop, and should be considered for
4.19 at this point.

~Andrew

