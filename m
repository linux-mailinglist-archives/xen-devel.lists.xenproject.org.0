Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B90C58EDD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 17:59:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161935.1489749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJafF-0001Nc-I9; Thu, 13 Nov 2025 16:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161935.1489749; Thu, 13 Nov 2025 16:59:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJafF-0001Lj-EK; Thu, 13 Nov 2025 16:59:17 +0000
Received: by outflank-mailman (input) for mailman id 1161935;
 Thu, 13 Nov 2025 16:59:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJafD-0001LA-LJ
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 16:59:15 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14d7f34d-c0b2-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 17:59:13 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b735b7326e5so94324066b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 08:59:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fb12d55sm198128066b.33.2025.11.13.08.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 08:59:12 -0800 (PST)
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
X-Inumbo-ID: 14d7f34d-c0b2-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763053153; x=1763657953; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o0VvNcjxBxjFprhtCWFDFi8shOLZctGLzT/2KpVDLGE=;
        b=TCcPDZ6vcZIusAkAdx5mw6x3yeMkT8bRd86IHG2jymrjLCHeeQXDuAScIyalHdmIqG
         tzYX7juHVkvWeMWgNznhruvJD+z1BTsMx7spQ+CqsDKBWj7hJ8uxR26vNng1NbmSQyip
         2HpFL0MPXEtlZ+KIdzWwnt4zNUpD5CeCnr1dfZtcdT/ZGMNLSdaNJnuEOLhrfRJP5gnj
         koi9BU46gnkiVx2Ak3SDuOzQWSh0Nagal3iAN1R7oOmAq+rAubQz6xBRuU9XjpFNs/t8
         /NRYfy58ILdDreaUtWezfvenhiDLnWiHCg+Tt5x4VMOkZvRdzbXJeUq94bTvLqKlbFQm
         WtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763053153; x=1763657953;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0VvNcjxBxjFprhtCWFDFi8shOLZctGLzT/2KpVDLGE=;
        b=galc5jFblW+Kga4xaLMamAsqVUjz28uvpzsGub+sw9OPwxuc13/U2mspzxheGWckhA
         DNAYnXX0nOyf4Pp86owgDN3+UfiUfRIl+6iGtszqosNCrncPPSpd18q5jQcLqQkzfAOR
         bJPG9/WjaD14WUuEyUCsDk31PuqjX9dPjgod5g4oEEInZOhaqzpanGwmy9kVRlfLlAJQ
         tAqzFxOphQ+9fpmMt5iYmfzZAZV4U1JRu5qES1xhDZmyB+OPT1hHXpCtzAJf3hApRG1F
         pRlPFt6CyLNXLJNLU0dLLg52z6tQPDQRQX5b0+qMOdbRFmOOX8Syujdt+Oc17C4Nt0aq
         FBRg==
X-Forwarded-Encrypted: i=1; AJvYcCW2PFWseg++e5VER3lvUvdWdbmb9HIwsiRtadiydhyMzhelWFLlZ9QtVRrFzvTJEqKklmFC9bOdScM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YysrXH1R+Ho86NlTbaFi4QvyiqGF9JdHGa0bssQT+zcGQSzXRWF
	D04fodeQKgmicYTvn2WKs3YmEALmQioOPfNnIdefUGSf9rCDnv/sbxjGOyQYDNBi0Q==
X-Gm-Gg: ASbGncvXC1UTLOQGXatLkqRwU/FlFca52RDINncbNERdsbx9OVcFil+JXEwnvEibzI1
	DskRlonCO7LuIuOsEODp/VyqUYmzYFR1Lo33Du34aQ+Bvqwxa6ucUGSluT4ZKHYOV+8IcsQUROd
	5u/ErMxX8cTeDeMu4p86tCAatXXSOK9VMXRh424NZ6Q23hlfa45u0k07MOPGd72jS7QC04hdFdy
	KDPAplQNA6j1t1H5TD0MIbk/v8R1JZMAyzxfAW21JXJvShqAPHeI99pO1ds6MOvjYb/OeBfr/kE
	KhblspQB5Ugun28qVxz3WAmdpPmFkPLg0tXei06L5dDhatpHB2u9HadPK0ID3LI6lRhY2kEcmWX
	Ndae96sXFH7ShrgubR40SchgBkoRRt1DaV3NcuY3CanYkQGBpEcObRXwBGcl8NAeMLrKYFsG61C
	KGbr8Ztl/S1YPL/8Q0pWWzX0VfXk2vTT17T7xvqNtoD1s1DRNbIEv+KmcIYJnPZqrgbN1QM8bLL
	TY=
X-Google-Smtp-Source: AGHT+IEuGV17EDvS6PBAMX5eK7iMTh0aUw4jnzgyk+qZxjlwg/USi1DVtmERL0eFGBNB2+EIVqaVyw==
X-Received: by 2002:a17:907:1c8e:b0:b73:2fdf:21f8 with SMTP id a640c23a62f3a-b73480bc7d1mr423318266b.7.1763053153004;
        Thu, 13 Nov 2025 08:59:13 -0800 (PST)
Message-ID: <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
Date: Thu, 13 Nov 2025 17:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] config: remove unused paths from config/Paths.mk.in
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-5-jgross@suse.com>
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
In-Reply-To: <20251111161959.13667-5-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2025 17:19, Juergen Gross wrote:
> --- a/config/Paths.mk.in
> +++ b/config/Paths.mk.in
> @@ -20,10 +20,7 @@ libexecdir               := @libexecdir@
>  datarootdir              := @datarootdir@
>  mandir                   := @mandir@
>  docdir                   := @docdir@
> -dvidir                   := @dvidir@
>  htmldir                  := @htmldir@
> -pdfdir                   := @pdfdir@

Question is whether we're mistakenly not respecting in particular this one,
for the *.pdf we create. For all the others I agree there's no (present or
potential) use. I notice though that docs/Makefile cleans e.g. *.dvi
nevertheless.

Jan

> -psdir                    := @psdir@
>  includedir               := @includedir@
>  localstatedir            := @localstatedir@
>  sysconfdir               := @sysconfdir@
> @@ -34,8 +31,6 @@ LIBEXEC_LIB              := @LIBEXEC_LIB@
>  LIBEXEC_INC              := @LIBEXEC_INC@
>  
>  SHAREDIR                 := @SHAREDIR@
> -MAN1DIR                  := $(mandir)/man1
> -MAN8DIR                  := $(mandir)/man8
>  
>  XEN_RUN_DIR              := @XEN_RUN_DIR@
>  XEN_LOG_DIR              := @XEN_LOG_DIR@


