Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DEFBD2BDC
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 13:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142240.1476427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GUa-0002vM-0c; Mon, 13 Oct 2025 11:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142240.1476427; Mon, 13 Oct 2025 11:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8GUZ-0002t4-TQ; Mon, 13 Oct 2025 11:13:27 +0000
Received: by outflank-mailman (input) for mailman id 1142240;
 Mon, 13 Oct 2025 11:13:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v8GUY-0002sy-AG
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 11:13:26 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a30f9a63-a825-11f0-9d15-b5c5bf9af7f9;
 Mon, 13 Oct 2025 13:13:25 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-46e6674caa5so20690915e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 13 Oct 2025 04:13:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489ac60sm183778285e9.16.2025.10.13.04.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Oct 2025 04:13:24 -0700 (PDT)
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
X-Inumbo-ID: a30f9a63-a825-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760354005; x=1760958805; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qQl/jd0GQ5pTzcyZShWKq5cyJHVF7veVFgrmOkqscsI=;
        b=XFvQC0EYOejC2WcS7IzQtaglbLscY095EReHKrkSWBJVKq/sqG86uTXFkyYfwjhsj7
         uvCYfJiv4Ff0hHUNhzW+Jgs/lDLmyD7i1zqypbgtYvqUrxNUrO07/h9Srn8JiiUfgian
         CIwUCcSDDfoW0Vj5AmPDSoumsKB64vBPTgugWHYdCs6UZVf9q1xjxR8Eg38j816A1K3q
         ZB4nkWdvc1JmBahIfrTtoU0GJuG4SVxSfZ9mvvkvYFhuY1LGuKaGsxzTBlfP1WwRAADD
         DImQ5q01LaEc7Q/9zWgXMC8SxlR5wtI+v9JB+WpxovE0o4Y5sI1ApzfzMxF/T7P3udlo
         M2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760354005; x=1760958805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQl/jd0GQ5pTzcyZShWKq5cyJHVF7veVFgrmOkqscsI=;
        b=qo05RUk8EHBcRMJITKH7zByvvLfpAmPYLcqbT+9EcPp1ydsXv/hLnqssKQuKKUwCmq
         o3wVxKg8b2MKXgfpj4XV31vDY5WwYS0FEx5V0kKh0SUAoS+l8SFaoBrAHZL/VHB7KhkF
         2GAhnyvJ8AenWSMgSzUqWucGodZSrfPoGmcIihQXJzcU7WtlY77Rh32bw+vIUlTyVOaY
         WCA9d/z/LzFFSr4/TYoqHBRDVJ3eHzBp1++IdMo9v1KRSU+iN4TNY50CxeqEcp6vZqTN
         Yx8Fz7d927kGSg+yGOtVmE2CVw++q0kM52op0LZo602qAiOqu7po1LoF8SIFqS6oQfee
         g4Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXIUvsH/SK2V7Ve9yW6MFxjy5uqdlT8WWnWoPoScFo5G81cDlQQxV5dcSjInO3k7Bn0ATagbAqfO8o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOgk21RGrjzkYU0MmmcYOJfAMSTw5mKKj+IgS7Z1JlxqLn0P7B
	qYijYqeQrlG9yLsp9EPej/d+65NaoHJ73ktvABYm140npJO2T2HuTznUBvm/3uDcSA==
X-Gm-Gg: ASbGncvFBR065vddfk9IMp8EH9tCB2UoSov/7f356KmgonvHtGvGMfFWkdQzNS4I7Ly
	1E/qBM4IjsDxscjZE12oaSYFne39yBvxYDifp1mv0rLy00+LpmvWd69V0AYipVPtcIyni4K0zBn
	+T6+Y1gcYtQCGBKDc8z5u32QRKj7GxIuCkznWKOanorQohbnKQ1/QGs06RBFRXNlTC7fVsqU98T
	dh10o5rQx5geiFXMqls25pwtcEk258w2d7hqcp6QGcfTM9+YM4rXaENM2fhivEeXLt8isLvzEqm
	6isguIdoKNu9O1v8x9SJlcEybq0PeakvAWoHyngbB3hQBb3nvWMZQMHW/x6aQYU75355lAygPHq
	GYgCuv05T5ExBLBrTNTEnOO9Ddgdj466kLn4Pvsojs+z/14tDXHtP8Za7EqU9zzzoV/LapnBr2L
	WjonS7SxiWv2d+iii2kprrT2kLVQ==
X-Google-Smtp-Source: AGHT+IHsG2ewrxQe/Zu0D+nEM/lwb/aUP9vpx0MRzDvmOg65d9GVzbB2oCuBuT9o/qJyHACEPDk91w==
X-Received: by 2002:a05:600c:2e4b:b0:46f:b42e:e362 with SMTP id 5b1f17b1804b1-46fb42ee3d5mr65359955e9.19.1760354004563;
        Mon, 13 Oct 2025 04:13:24 -0700 (PDT)
Message-ID: <e7cbc215-04c5-4b2a-a40a-48c0ca70ea99@suse.com>
Date: Mon, 13 Oct 2025 13:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/28] xen/domctl: wrap sched_adjust() with
 CONFIG_MGMT_HYPERCALLS
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>, Meng Xu <mengxu@cis.upenn.edu>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org,
 xen-devel@dornerworks.com
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-19-Penny.Zheng@amd.com>
 <b2910a80-5dc0-475b-b49e-7d95560a2550@suse.com>
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
In-Reply-To: <b2910a80-5dc0-475b-b49e-7d95560a2550@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.10.2025 13:03, Jürgen Groß wrote:
> On 13.10.25 12:15, Penny Zheng wrote:
>> Function sched_adjust() is responsible for XEN_DOMCTL_scheduler_op domctl-op,
>> so it could be wrapped with CONFIG_MGMT_HYPERCALLS.
>> Tracing its calling chain, the following functions shall be wrapped with
>> CONFIG_MGMT_HYPERCALLS too:
>> - sched_adjust_dom()
>> - scheduler-specific .adjust() callback
>> - xsm_sysctl_scheduler_op()
>> Otherwise all these functions will become unreachable when MGMT_HYPERCALLS=n,
>> and hence violating Misra rule 2.1.
>>
>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>
> 
> Just one further remark below (not for this patch).
> 
>> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
>> index 4c6e0dc0f9..9dd485646a 100644
>> --- a/xen/include/xsm/xsm.h
>> +++ b/xen/include/xsm/xsm.h
>> @@ -56,8 +56,8 @@ struct xsm_ops {
>>                                   struct xen_domctl_getdomaininfo *info);
>>       int (*domain_create)(struct domain *d, uint32_t ssidref);
>>       int (*getdomaininfo)(struct domain *d);
> 
> As visible in this context .getdomaininfo() is not hidden yet, which
> I think is still true at the end of the series, while I believe it
> should be used by systl/domctl code only.
> 
> Or did I miss something?

As was discussed, getdomaininfo and a few others may need to remain
accessible even with MGMT_HYPERCALLS=n, to be able to at least obtain
and report system state.

Jan

