Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F54AD5169
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011434.1389867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIWx-0003DA-Br; Wed, 11 Jun 2025 10:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011434.1389867; Wed, 11 Jun 2025 10:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPIWx-0003B9-8a; Wed, 11 Jun 2025 10:18:03 +0000
Received: by outflank-mailman (input) for mailman id 1011434;
 Wed, 11 Jun 2025 10:18:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5UX=Y2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uPIWv-0003B3-Fd
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:18:01 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59499273-46ad-11f0-b894-0df219b8e170;
 Wed, 11 Jun 2025 12:17:59 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso2932653f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:17:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b08391asm8793097b3a.86.2025.06.11.03.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jun 2025 03:17:58 -0700 (PDT)
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
X-Inumbo-ID: 59499273-46ad-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749637078; x=1750241878; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UEogMPwpERGiAZiPE7KWk2Kd+BF837mTVmLORzshSFI=;
        b=BgcASIa3jr4zwF3Kq7vLYWMlwfYaoMxyc3RRNj86aRJnExVJbq19KjxRONivwwN/Cp
         jMrLBlI5wlG8qtNYQyH8dpqz2zITkuFnder5ZupYKMYKK+Jt2ZQRUGHq3AEH1YORytef
         BQLikatMA9MNAWT6BEC8Ijzzdg14MY8KfEqFaesk1Su+DF/ReSFHEm6zKIRA3lpjYXQw
         XyiJDtUyyQPNrM//gD38P5XAv0KRnup+tw1pJVBOY5dBb5p3ZD+YaB8ophPR4OpUEskC
         UZxmW7kzwnahkSA1VYNtTS/bxzzN4wPNKmW2cwLwTCuwo5b8vhgzFXQ4wX4UYb7XCz2v
         QhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749637078; x=1750241878;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEogMPwpERGiAZiPE7KWk2Kd+BF837mTVmLORzshSFI=;
        b=OdcBMRwubLxz/tZOsqSNeQ09lYyMMSZV97RqHReNv+RgG9+6M6tixtHwgPuqpWeBkP
         YGPQ86tfZCX2xjgNt+hrLvWLPxlMgwBgv3FA6bDXRTBUU9O0JrSW9mcsjoVugrWLn9Tu
         +GikK3xjlM7f2FqiyU99cU6wnvSHTlR/xr1HL+VKK/OQOncP4jyqkGlmRmmpcH0/qY9S
         FPDYlTRzlb8njJU2O+UkImDVzJEP10rkla1a/NLhYsYtE2q7qSD87SBFS8ZsRFiWtsdl
         0dbig4mZ7Rtv4YTfaq3wyPchdtPWFdeykXPbfWVeuBcuYFlIUSKmjRntv/r8trerOw0a
         xz5w==
X-Gm-Message-State: AOJu0Yzuhu5f+Z5l7PKyALU4T9IgWMNU3WhCird3AZ5iVezGtS4Adado
	j27Lpipcs8V3WlbE2TCzBG2HFcqN9iEnG3kdJqn+Ys7w2+crRjgk3LwA611DkMhCkg==
X-Gm-Gg: ASbGncuny5y8oq3cRbT5dNf67CYUi1C3Say2JEZpdfJuPz2dPRRR2Yojg9rItpTjGTr
	6BOGZ2kr+/mxSkyh7kihZl1qA5kv4szrEPXud83kho8mer2bh+42PVGY65QoSnuRn4ZhB32WV87
	k6DTvncFrGE+Gj9R0VICPJ/WPp+vmhm1KMCsYlnVV96jkgen2ocg9ncVq6XzdZ6SmXNOs2fIJXj
	SGKve27yHjOzx7sQq1t4t2d1gI1k5BboW/ov9OD/oDc79jgg0ertm+l9fk4dvN4U6RRqU6uOprb
	eg6eOAM9IA9CSMNB0mCSG7UVZ0NLPwJBSnFNynNwH46/cSk18txQHiPfkFrIgiRPMUHzIgca8Pu
	6ONMwtIXMdBoKvxH0WB/+KeVo9bTwv7wy/mXlsNKdBHVLUqc=
X-Google-Smtp-Source: AGHT+IH9KXz/khCp6/ytJLgv36nIa/8Cp5NKLBNjhtA15GJEfWQcFq/EzwEtfSmmofEQ59m7jiiwuA==
X-Received: by 2002:a05:6000:2409:b0:3a5:2cb5:63fa with SMTP id ffacd0b85a97d-3a558688b57mr2171782f8f.2.1749637078569;
        Wed, 11 Jun 2025 03:17:58 -0700 (PDT)
Message-ID: <e00560de-ed9d-4fd7-a813-147d5f8d71b6@suse.com>
Date: Wed, 11 Jun 2025 12:17:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/HVM: restrict use of pinned cache attributes as
 well as associated flushing
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <78b3ddeb-4317-4d54-ad52-9eb03bdf7942@suse.com>
 <aEa5J_TlSAdS9-m_@macbook.local>
 <6e9e84eb-f98b-4c06-8952-03aecc82c0ea@suse.com>
 <aEgMe1i4Rpmnz8M9@macbook.local>
 <5f8d694f-e712-4869-879f-80b2c4907a45@suse.com>
 <aEgyAaHxC-Um1pNj@macbook.local>
 <3470dcc8-f08a-4a00-8760-b3564d78e638@suse.com>
 <aEhVU3ZsJrBxRyZf@macbook.local>
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
In-Reply-To: <aEhVU3ZsJrBxRyZf@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.06.2025 17:54, Roger Pau Monné wrote:
> On Tue, Jun 10, 2025 at 04:13:40PM +0200, Jan Beulich wrote:
>> On 10.06.2025 15:24, Roger Pau Monné wrote:
>>> IMO the added complexity here is not worth the performance
>>> improvement, not without a clear justification that it's needed.
>>
>> Well, okay, I'll simply consider the patch in this shape rejected then.
>> I don't see much value in wasting further time on it.
> 
> The code is already there, so I think there's value in this patch.
> Did you see my suggestion in the email yo uare replying to about not
> needing to add the is_iommu_enabled(d) || cache_flush_permitted(d)
> checks?

I did, but it didn't look like we were able to come to an agreement.

> With that dropped (if it's indeed OK), I would be fine with Acking the
> patch.

I guess I'll make one more try then, removing the instance where the
setting of the "flush" local is made conditional, but retaining the
-EPERM return path as was.

Jan

