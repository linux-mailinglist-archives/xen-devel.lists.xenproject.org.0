Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CD4B19D35
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 10:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068887.1432749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiq92-0008VW-F8; Mon, 04 Aug 2025 08:02:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068887.1432749; Mon, 04 Aug 2025 08:02:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiq92-0008TC-CD; Mon, 04 Aug 2025 08:02:08 +0000
Received: by outflank-mailman (input) for mailman id 1068887;
 Mon, 04 Aug 2025 08:02:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uiq91-0008T6-9O
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 08:02:07 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f0206b1-7109-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 10:02:04 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-615460d9897so4641335a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 01:02:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2c265sm6424723a12.26.2025.08.04.01.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 01:02:03 -0700 (PDT)
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
X-Inumbo-ID: 4f0206b1-7109-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754294524; x=1754899324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dtDDZ55iqJVKdgNl++fZQZljnsNij71/Adudn60Elas=;
        b=I1FGHIKF/E+5Qiskf/yLtQf2H7l/w4H9KR+MsnTE7SJ5HBzqZx9zb9q9nU7lyw6Kz6
         vVeA7GIoFP5vlCUA5NMbp2nZ6KCH5GksKsyf4CTTvEncM682JFYvACMJQXCN/rdSPTHj
         1Q1CA6bk0JojDhE4LdFYV3UfvbG5gtUewlaAUb2niPUUYuialQCuIhEu8HPsxSTGlujA
         cSbmL0pOtlZLtShWE2pNNLvF/igyxp0fbZehYvetHxu37UFkWc00tDsnm7vqugpske5y
         xqGmt9R26aiWwAcdndVNPqufN1reJbbRZx0rJsRAWMF/zwCRMG5BiQeGlg6FtaNAX64I
         0w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754294524; x=1754899324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtDDZ55iqJVKdgNl++fZQZljnsNij71/Adudn60Elas=;
        b=vJuaaRPdFPkEP1jGg1F/ULiOMxBIpJtUtniLC3oDZ5QHem+67dUBOKkMDRTIzzOYvb
         iJm84DqjSrCvC4Ibza5ReHSfXVZ3QgAG3SxtrW/B42ZTJEBil0/6mye6iZl0+9rYK5s0
         U1ZlKcPyYcBCkp0r6Y3FJhyrxldQoZhGK4SEL8ZqV7JtKZOmRmYpbrXBWjIAimBuXnVH
         OTXKJNuv183I4zYCDwrohxWzbxtUg28jvfRH49Hwgv2XsJpQIGOkPjvZU9Qp0aCoqLpV
         6aaO2nLk2jza5jtDbpQ6Se2FhXP45tozomqt5XT0romp/x+fAQx+vFVQDeJukT+TUzTp
         EBnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj8lstZq1HiQlGEKsm6PrYTAP6kvlo9sHafJ6XJJ/V5aWJuxzctsP4B7gtCypj/n1HRUShDP+B6hQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlPNDy71+RcWts2icxMJrKgVuz+EGq0ms9jvHpoWTBIf82shwl
	UIHiHLcMZHl7zYparqWhEpWHLyUMJvC2j6Zob5ipw+ESQwpI5k4WDX7SJjeYU+n+vA==
X-Gm-Gg: ASbGncsBhOUxxQeL/QfW5fDzuUkvBcFBiTcrff1rQE1eH70R42ztQNnsdgMBh4o+eKi
	1k1EfW644FsT57lSiJ14S+5jmjG+YZMwD0h7vwJF9lQn1qX5xZ5HfngXA+bY1i6vaUzW/78DL8w
	ytoz1ZOyYE+R1xZkPpafDV7Nu3uj5JmFZMhnNx/qJCGvVKmrArbhCRZbvSA4cR4hLYrlPwrP8VN
	OFthedCaw70lVGeqxRPfRBYfy8TZucPc+rk908MqAx8Kncyje52XFkUPDYwhxblYKQZ4/23OLDj
	NAM37DM0FiSNS7AGW5gvoDnm+crdSElc/pbmPPnbdDa+1F3FivhuxfRC59Bc01PCHR705j00KzD
	8/lxYeedkCyO7S17Fyba7BVFzq0BiOj4rS8IAwr5RpLEDZ79AP/Tn2CX18ivPKJilXdlYeTo3/+
	4z/l7YX1I=
X-Google-Smtp-Source: AGHT+IFkqYGJQI+Tv4NBRLRPKsHgfsZRDNGiIYIxPQhzchtaAhKpn5ugLm/Fu6o+xnjvHNf+b6M8Hw==
X-Received: by 2002:a05:6402:2755:b0:607:116e:108d with SMTP id 4fb4d7f45d1cf-615e6f58258mr6554375a12.21.1754294523753;
        Mon, 04 Aug 2025 01:02:03 -0700 (PDT)
Message-ID: <9d71cc11-884d-4924-9de9-e3396801158a@suse.com>
Date: Mon, 4 Aug 2025 10:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Next steps for MISRA C Rule 17.7 in XEN
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6d622813-1617-4af3-876e-52a551518f68@epam.com>
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
In-Reply-To: <6d622813-1617-4af3-876e-52a551518f68@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.08.2025 19:48, Dmytro Prokopchuk1 wrote:
> There are a lot of MISRA C R17.7 violations in the XEN.
> This rule states: "The value returned by a function having non-void 
> return type shall be used".
> 
> Actually, need to decide how to deal with these violations.
> Quick analyze shown that there are different cases in XEN code base.

Long ago, when we discussed the rules in a mainly abstract way, there already
was quite a bit of discussion around this. Stefano - I wonder if you had
taken (and have kept) notes back at the time?

Jan

