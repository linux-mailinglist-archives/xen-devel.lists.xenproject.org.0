Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE6FA58DFE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 09:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906185.1313630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYOK-0000Sj-PH; Mon, 10 Mar 2025 08:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906185.1313630; Mon, 10 Mar 2025 08:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYOK-0000Qr-MS; Mon, 10 Mar 2025 08:21:40 +0000
Received: by outflank-mailman (input) for mailman id 906185;
 Mon, 10 Mar 2025 08:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trYOJ-0000Qj-6b
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 08:21:39 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af6a2364-fd88-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 09:21:37 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso22783405e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 01:21:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdff57sm14392229f8f.37.2025.03.10.01.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 01:21:36 -0700 (PDT)
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
X-Inumbo-ID: af6a2364-fd88-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741594897; x=1742199697; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PAOXRVtDKmViZ2OtReao8GU0SFwvput8+4DjsYuV3LI=;
        b=VFWTIzcEiowMRuLknWM6PZhmLqM7fX5obIJ9SRRuYl6p0OeYJpthYf/J2OHqsqYGr8
         Q8Ay2okIeHrFdmRJf4OcKqHJozpbbBBI6LhkDYkwWhvZeKmkqvaF1YT9Gq/IYvE4x9zW
         OrfWa1WEROCoYoxW/Q3WGHZXK4mw3Zkvz5OSaotKJe4zoTRsgwihWubf4+aFoSov8KIx
         /mt9xryMqS1OcZk17RIQhZSlwIuz9JK6Bg9cyCUViXmKg4j0rMYzSn5cFsrnSivT7NBO
         +rRzXTVd4cjLh+Q2gEtbJhcK/X3P1rG0VCye6V/OKgKyvVmw4iiNa1+BqV5Two1u5uGs
         KsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741594897; x=1742199697;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAOXRVtDKmViZ2OtReao8GU0SFwvput8+4DjsYuV3LI=;
        b=oZuwfjztG4KsQOov4nLeseC4SAGjMO9gii0vpJXAnflmaRv/hwqcNshxk0QRVnMhad
         dliKz6sgF2NCM/qkUb2wl0xxQw6uAslOi7nAUl6Wh6Ar1AsEER4UfttHBNAcT8azfXUN
         GPWOXH31xhctDqgFBCQtnODN/2c35GPhzs/bvPooSQX9JJuzwasZLIpZMjld2quVVWhZ
         Xnunm9o6ZH5ejZTuMNSY819bNyKn11YtlqVq5RKx+xc4kXnKKVaU51RCKWJ2Hj6hCd94
         2rqg0XKb8SPGmFpiw2pqp5pnW0ygf6j8Kk+gkFAuX9TkiJtzKiPi+Et8BJKpZMCvgVkA
         9v3A==
X-Forwarded-Encrypted: i=1; AJvYcCWaks9SvLPxyubieVbFU7THnb5Wf/j/GFEekFaw3+fmKNhV+dfjhty7CSw9ii6jEZ+VVrWM1MDjqVA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYSB82x9gfzJ9a85TrmaDyvT+MYMBLgNx0k5IMQgd/laqw43Sc
	2Nbcxafj6rdDBQugEwSRn6J8wVDmhXXnXtj92LAnOF2v8CP/iqaz+resGQwgjg==
X-Gm-Gg: ASbGnct0VWabjRwQVTcTIUW/DcsrWfHA5SaSS7lMNfKy4xZ0jb4mT2lhnpElmo4d7cF
	iEPCFiTQ9xRXPRwFOlfRPU5+PH8wxj+/MyKctUOBx6X3M6XNWNlr/NNMyB2C16180LuUxGyakKO
	SouhqrD+8YSfRjh3wafeHEXTFT8PTRYWxy4ans8ky/NmV01z2aCO/5Hl/gTniokF08L+UgOnCyb
	HalmwLw0qomWWU/mtN1b3RfdfXAHhdFp5337zSME1R3omTIfjl1FNcQ8EHKrbyQlTtamFgQsynL
	VR/ztsmJTNNjHEW9ksS0r5LldwhKkUVlp8BuOBtGnv2J97xH+Ppi5VOz7aOowG29rI9v/1Yzgg/
	Gfr+ZBTN8XbDb0N2sIeKadkA7Rt4E8w==
X-Google-Smtp-Source: AGHT+IHMfbQGl5eHSL3zCi9hExnXwqkeTHGE4ZhGafYKQWhfP+RrPhf5Fw4q/q/tUf5f13I9bvfBOg==
X-Received: by 2002:a5d:5e10:0:b0:391:122c:8ab with SMTP id ffacd0b85a97d-39132d5f36emr5682488f8f.22.1741594896813;
        Mon, 10 Mar 2025 01:21:36 -0700 (PDT)
Message-ID: <a0d2e94b-7d11-4f4c-9941-dfb43af99147@suse.com>
Date: Mon, 10 Mar 2025 09:21:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/23] xen/arm: dom0less seed xenstore grant table entry
To: Juergen Gross <jgross@suse.com>, Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-9-jason.andryuk@amd.com>
 <93fdeea0-495a-40c7-936c-749e75a3d728@suse.com>
 <664ca238-cb5a-491a-b588-a9f300d84199@suse.com>
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
In-Reply-To: <664ca238-cb5a-491a-b588-a9f300d84199@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.03.2025 09:17, Juergen Gross wrote:
> On 10.03.25 09:01, Jan Beulich wrote:
>> On 06.03.2025 23:03, Jason Andryuk wrote:
>>> +    shared_entry_v1(gt, idx).flags = flags;
>>> +    shared_entry_v1(gt, idx).domid = be_domid;
>>> +    shared_entry_v1(gt, idx).frame = frame;
>>> +}
>>
>> In common code there shouldn't be an assumption that gnttab v1 is in use.
> 
> But isn't the grant table in V1 format until the guest potentially switches
> to V2?

Strictly speaking it's in v0 format initially. But yes, I see your point.
Provided this function is made clear that it may only ever be used on a
domain that wasn't started yet (perhaps proven by way of an assertion).

Jan

