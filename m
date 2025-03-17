Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E5A652AD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:18:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916981.1321984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBIl-0008WT-9T; Mon, 17 Mar 2025 14:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916981.1321984; Mon, 17 Mar 2025 14:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBIl-0008UI-6U; Mon, 17 Mar 2025 14:18:47 +0000
Received: by outflank-mailman (input) for mailman id 916981;
 Mon, 17 Mar 2025 14:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuBIk-0008UC-59
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:18:46 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc1cee3e-033a-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 15:18:45 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso2998148f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:18:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df339asm14921666f8f.3.2025.03.17.07.18.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:18:44 -0700 (PDT)
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
X-Inumbo-ID: bc1cee3e-033a-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742221124; x=1742825924; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mEPwodwgyIHkvb8L3pMWj7tPbNKb1JePDQ1Lug35nl4=;
        b=Kxwcvs4/L4Bug9MIVRgEyl7SwkskAGR7KSN5az457J7m8xE/abj0bCwzhWEj+SHFhv
         4eezANmDo+bbuul4wdBEPp9cjzq76pceNujA9BWv3LsVHHBkMeN4JUh3qh4QWKF8/gB0
         0qCnUMjl+qkY1xkltDbU3Z1IuQ27gIYHDbu9Q3VCFb8HnfCFI27x7AUvDzIT+erGss0u
         HB98RxVYE/hobUumvllVPoSXFEwwO53mAMIhcL1UqgHVWnf58T8UbprVIa/c0wXCgbmE
         QBbL3pEDKfxm0nW9DrcfGd3pOOp7jBOJvhDIrqcx3Txu0HOUzEdIYX26Z1D+GwWSVN1X
         fgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742221124; x=1742825924;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEPwodwgyIHkvb8L3pMWj7tPbNKb1JePDQ1Lug35nl4=;
        b=qA15xlzhorFEgAq3hm5Pj5YyL4KCEJuZijJop3h9cve9kK49dI/V3L/U4q0DMcVfjh
         xMVagUCknc0+rlB/oIqBGrsQCx8M6ak8iqy8SdrP+DXo7uOAnG+7WA7XUPa0+5Mp/6Mw
         7TWxvZpEiijDIoyUoWjAw5RcvjK4F+KDS3G74cXjiE75qp9OKHl23nHkCYiZwWk+OUvI
         FX40VoYRPZbtcUGvRL4gx2sFuUhwIz1XiRnq0iHbTJzR9edEMh2KQSjjLFfWZTZATNGB
         kfmIeCw+i1HSxp91IAH8HdQ3CrM8sAUHDTEHkQeXa6eSk6fsTh9I4KMx3OD2XI1/mn1b
         J2SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnBD/py73/pNRXrLXSg2AZx1VS94mPv/HYa2kwnWXxxRGHbFXEnk4qc3/S+PN0oTzshddcCjBgkPU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzB+ub2Jqbp6m1YygQ46/egVM3edFyIbyV0IepQe6OUNgp1p0Z1
	9mlBHBMK6dlkiOBtPiL7JhRz17/LY2By0SOaKu4u2YXKXgJsuOEvFr6Gm1TF0A==
X-Gm-Gg: ASbGncsPBx8KXBnmgjLwiC9aoA2vx+wcQ8fVdt8eQRNJjloWCG/i1blx+VFPsTX6oLn
	koWL5rVTh+xKHI2QfTa0Wz0D11j1mj0/Pt1ghww+7rIQBVSVkQro5D8CqDGtOyrU0kmo/9pZ4RN
	QSSy+/uWB0vCPe1gtSw0kID1Foy3jTgChXoDivwOdG1n7HmW1t8c8AENld4q1b+bRpLC3o/co/m
	t01ZZISe0NHfhutNK2VXU07ZXrYV6wxnMKDwJqShiKjmK9Son1eCNqimSOWdmgnEZbcw+3giXJe
	pzLfCztzOb16qQV9qhsntlYyFTPMOCkZ74S+SB8Tg2ccg5E7Gpm7xuMvTph1QFQKjyShjsPVmrl
	9JsL0bG1tEWRATMVX+H4Q1bb816iufQ==
X-Google-Smtp-Source: AGHT+IHXI1RFDz9nv9Y8LFo8YM2VgIg0eOr6DNM3374r/XaoUCPh6IoKK7QFoib1kHn7LxDMf8B/jg==
X-Received: by 2002:a05:6000:1fa2:b0:38f:483f:8319 with SMTP id ffacd0b85a97d-3971fbd4242mr15569607f8f.51.1742221124359;
        Mon, 17 Mar 2025 07:18:44 -0700 (PDT)
Message-ID: <6d6c2a2b-630c-404e-9257-e353464f2400@suse.com>
Date: Mon, 17 Mar 2025 15:18:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/23] xsm/dummy: Allow XS_PRIV to call get_hvm_param
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-15-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-15-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> This is useful for a combined hardware/xenstore domain that will run
> init-dom0less and xenstored.  init-dom0less calls xc_hvm_param_get() to
> retrieve the xenstore event channel and pfn to configure xenstore for a
> guest.  With a hypervisor-allocated event channel and page, the
> set_hvm_param is not needed, and the normal domid permissions will allow
> xenstored to connect.
> 
> Similarly, a hyperlaunch-ed xenstore stubdom needs to read a domain's
> xenstore event channel out of hvm_param.
> 
> This allows reading but not modifying the guest, so allow the permission.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Since this is exposing the entire param space to Xenstore, what I'm missing
is a security discussion for existing as well as potential future params.
There could well be some that better wouldn't be available for Xenstrore to
fetch.

Jan

