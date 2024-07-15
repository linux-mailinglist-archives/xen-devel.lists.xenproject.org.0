Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0815930EB1
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 09:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758685.1168107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTG41-0002QD-4V; Mon, 15 Jul 2024 07:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758685.1168107; Mon, 15 Jul 2024 07:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTG41-0002N7-1p; Mon, 15 Jul 2024 07:24:01 +0000
Received: by outflank-mailman (input) for mailman id 758685;
 Mon, 15 Jul 2024 07:23:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTG3z-0002N1-OO
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 07:23:59 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3373d4f0-427b-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 09:23:58 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77abe5c709so481157766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 00:23:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1fc0bc5092dsm33973225ad.280.2024.07.15.00.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 00:23:57 -0700 (PDT)
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
X-Inumbo-ID: 3373d4f0-427b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721028238; x=1721633038; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IVgjvqUZs2dEciksGBgTdI6Gx2A+tLsiOrzqzVbrx/s=;
        b=M0Ci92K7BEqjlp8yk4NhBxqmFXjcE7KUz2LN6sKdm7w/YmrwTYc98WpVJE+OwYqw9+
         PNsl/coqITiZVCj2kaPWiR08FmtFsV4R9HT1DSJP3+GwfrailU1wnAIoTBKdTNlrm1ov
         vt7dc1wN+ZfQf7UrgmxQVT1vZ+kbYblqGOs9SdqpXlZE+D3T8bSqftKt0NxuH4Q0LVHF
         fc4dq/LSMO6irBCTzAWPyf9Xq9c9vOycjbYefMcQAq4R9PuFOx6tFquGZU6qxoxkZ0Q5
         KDCt07dPiBQJFjD8XeZtusaAESBurOakN1QETIbdkyEDcCaGenXfMW4IyQk+I39WyTI/
         dS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721028238; x=1721633038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVgjvqUZs2dEciksGBgTdI6Gx2A+tLsiOrzqzVbrx/s=;
        b=AlaJfC2FfRBbowiljijNsR8GwTEJJNwHt0aF6jOEDqByiW9/uBt1gu79MmmqGu9lOZ
         qfuDQf9WNgQ1Yu+Jsuo61llj+WkPBjdWwa53zgdxkvJtey9rZo3uhWxlgvOPSbCnngK9
         EJ2SpLWdDXz6s0i0GpsQ4Yy0T/5Y43eDf0577zVmS66OLpTiKylsq2LlkVpDKSxc0G5F
         B6IklPf0Sl9Umokp3zcWOATYqKrJuUjJz6mQJriqIzziqR9/XOEvpXy9awjdXo+sRebw
         VVeKfZNu/0kOCCPX0SvOLbJdQ8ZoReJ9zbPUZ7BGUeCn/bEo5dS8TCuwU/7LsnnAQTT1
         tt9w==
X-Forwarded-Encrypted: i=1; AJvYcCU9P5Nnz2N3Xd1fccDvH/h36m/XJSWdi1O7lnITzyJ2AOR3sUMjkT1oltFwSPzY0wygKB9dMjSIt4CUZEiPG9JVorbzL98OABCKl+EwsXU=
X-Gm-Message-State: AOJu0YzsjXyCA0BFMTsd2r/vOs28m1akUC4FiOIuJyEigVid27VSaW6n
	IlBZccJf7NRZ5Kk4KKae7wZCjYqB52JvTM1W3vC4s2uV/8JegWJ77lknEh+riQ==
X-Google-Smtp-Source: AGHT+IG8N9EPlHVrPD3fBXYB6Ny3+MxsDpa9ucNhaWmdcNRMR1J+CjYNj32Yah7y9SSt3WG1F7Pung==
X-Received: by 2002:a17:906:f8db:b0:a6f:309d:ec23 with SMTP id a640c23a62f3a-a780b89ca05mr1152862966b.72.1721028237898;
        Mon, 15 Jul 2024 00:23:57 -0700 (PDT)
Message-ID: <f1369d5e-5c2e-4866-a593-9656b569c086@suse.com>
Date: Mon, 15 Jul 2024 09:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 17/17] CODING_STYLE: Add a section on header guards
 naming conventions
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
 consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <fdb3811e00b9d6708c18d349a5a5043bb1b49cec.1719829101.git.alessandro.zucchelli@bugseng.com>
 <375074a0-0db7-40ba-9c9f-590b0cbe2409@suse.com>
 <alpine.DEB.2.22.394.2407121528380.3635@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2407121528380.3635@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.07.2024 00:38, Stefano Stabellini wrote:
> On Wed, 3 Jul 2024, Jan Beulich wrote:
>> I further have to note that, as indicated during the earlier discussion,
>> I still cannot see how occasional ambiguity is going to be dealt with.
>> IOW from the rules above two different headers could still end up with
>> the same guard identifier.
> 
> Maybe something like this?
> 
> "In the event of naming collisions, exceptions to the coding style may
> be made at the discretion of the contributor and maintainers."

Hmm, maybe I wasn't clear enough then. My take is that the scheme should
simply not allow for possible collisions. Neither the contributor nor the
reviewer may spot such a collision, and it may therefore take until the
first full scan that one is actually noticed. Which I consider too late
in the process, even if we already were at the point where commits were
checked pre-push.

Jan

