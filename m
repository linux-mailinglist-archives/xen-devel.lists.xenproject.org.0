Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B263AB3403
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 11:51:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981091.1367479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPoy-00037K-6V; Mon, 12 May 2025 09:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981091.1367479; Mon, 12 May 2025 09:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEPoy-00034V-3c; Mon, 12 May 2025 09:51:40 +0000
Received: by outflank-mailman (input) for mailman id 981091;
 Mon, 12 May 2025 09:51:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEPow-00034N-EK
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 09:51:38 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b22a128e-2f16-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 11:51:37 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5fc7edf00b2so5821359a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 02:51:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9cc5022dsm5567033a12.45.2025.05.12.02.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 02:51:36 -0700 (PDT)
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
X-Inumbo-ID: b22a128e-2f16-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747043497; x=1747648297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zMU5lEUqSSOJeAR+XRiSwtI82z7Gp9nCdLB/I58XvSk=;
        b=WDz3Vsl+tFpxAqLkXDo/SeEMv3vztJVt3DfcuPrwestVa8p+ec4VLeIJ6SqPKLj/xb
         LLVJbJZWzRKSmgVZ8SM8y2qPtLr7u9k8kHCNNTLeh2Dz7CF2q+5CFqqrQL5l1qj+r4ir
         F+i9jWoOPulfpQqdTNcSQlm5KUFKoHNaUwko8GWhgpK7YbNmWeCxIyurlKajHa9vfL8Z
         QrbVGQuvQIE64yPDDBi46xYC8xq676Gd9gTLvOlra8rldSzQ27bdSSOoT1865SSq1LA9
         98adjdZWeBjEsGwNRUrE2E52PKiDS+a1blOJQ2MAg+QBsT7a7xdgM5SFkV79G1Rfyizi
         VZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043497; x=1747648297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zMU5lEUqSSOJeAR+XRiSwtI82z7Gp9nCdLB/I58XvSk=;
        b=l+pFcsMZYjXTSz/BAB3vbq7+mmCOmIDLkzqwPlkG+xnHX2mS9A10dweG/gqh2phhgP
         MjqJXRFAynpQDB2lNKrXZHq7cIYAnG4Of84ebQnhw/Qahvyah+MLrSSz5kWG9OLndHBd
         QrHDmlcmvmSWf4H3sxYcj/ow9qDJZfbsWWeJE0kVgHqSXpmFdOy1VwvoheiG6eHkfJSj
         XUc2XGgSIp5lzQ37Mnbkdm9QwN9lt2puby71IdhabT0OC7l7AHFVBfu2kyjh+YBNXSw0
         4x9At67Ee2GkpEBOSWysVRonhM7CW1m3WhIlDJYyrMK0Y/mEgR1weXSVu6tlMVrUeC/x
         XRPg==
X-Forwarded-Encrypted: i=1; AJvYcCWI11Omt6faKI0Eyai+OXUt81BmYu2GOLOZMpKPqaqPw5to1/hTB2dfUNUHDwsAEC6caTZdL20MReg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynJnEPiBm+RJRJXioQxfwVieMcQiZxmWybOHvY7oSUfADozKaE
	Fly/Zw5sQwvZ+hhr4WN87wAyNJd+zzg6IWKTfIENFkwHZVqpUYdPUSHL5ausfQ==
X-Gm-Gg: ASbGncvE6HKSWnjkL0gKLcucMsCqkE47Rl53hsDDTFPzHF83SDh5m8OU1c1SP5f8wl1
	wBWyeohNErhwNqWOBC3Ubqrne3H7JyBTZuHBzm6drHTePc/Gcl/kot2xDv19n32ng4BfblsU/oV
	BnI35F+XqIwmkfHszv4hRSy5g8iOUybOS6QEkr8Pkam9ZhpMShVmqYkyY1D6qP1guKGim1D7MHc
	Za4lSxWAlXRUP9AkpORSppAcuw/6IW0yGfFZ8l0kP/U9QMOS7POzu/Ig6ToeLC8BLl5J+7nbU/X
	n+nI8MUYzG2JNBIy202q0MM+4VKMZI2gRm6Hb6b9HzC09F/Wq7MoLVZnkQJ2GuKf9KN1abUX2RX
	jyQxb8eQMSIvrEkEJ9pu06mJY9sqs4keOYF1A
X-Google-Smtp-Source: AGHT+IELQcBELOUrCWn5bATjs8Tao0Pn8hZ6D7mO4bcr6nQDPByYlu6Y8b2sjd8hCHhOdolnYluezA==
X-Received: by 2002:a05:6402:1d54:b0:5fd:dbf7:b6e0 with SMTP id 4fb4d7f45d1cf-5fddbf7b9a8mr3371589a12.30.1747043496836;
        Mon, 12 May 2025 02:51:36 -0700 (PDT)
Message-ID: <e9f0e66c-a05d-4e95-9446-435d9ca51753@suse.com>
Date: Mon, 12 May 2025 11:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] livepatch: Pass buffer size to list sysctl
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Kevin Lampis <kevin.lampis@cloud.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250508170156.558291-1-ross.lagerwall@citrix.com>
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
In-Reply-To: <20250508170156.558291-1-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.05.2025 19:01, Ross Lagerwall wrote:
> @@ -1328,10 +1327,15 @@ static int livepatch_list(struct xen_sysctl_livepatch_list *list)
>              status.rc = data->rc;
>  
>              name_len = strlen(data->name) + 1;
> -            list->name_total_size += name_len;
> -
>              metadata_len = data->metadata.len;
> -            list->metadata_total_size += metadata_len;
> +
> +            if ( (name_total_copied + name_len) > list->name_total_size ||
> +                 (metadata_total_copied + metadata_len) >
> +                 list->metadata_total_size )
> +            {
> +                rc = -ENOMEM;

-ENOBUFS or maybe -ENOSPC, but certainly not -ENOMEM.

Jan

