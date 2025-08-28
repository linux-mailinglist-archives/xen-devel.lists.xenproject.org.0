Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B90B39772
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 10:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097795.1452005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYJR-00066W-6l; Thu, 28 Aug 2025 08:48:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097795.1452005; Thu, 28 Aug 2025 08:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urYJR-00064L-46; Thu, 28 Aug 2025 08:48:53 +0000
Received: by outflank-mailman (input) for mailman id 1097795;
 Thu, 28 Aug 2025 08:48:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urYJQ-00064B-6g
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 08:48:52 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1f4034d-83eb-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 10:48:51 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61c7942597fso3653143a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 01:48:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61ceaf6ec7bsm209840a12.17.2025.08.28.01.48.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 01:48:50 -0700 (PDT)
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
X-Inumbo-ID: d1f4034d-83eb-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756370930; x=1756975730; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AUXfFX48DAEakyXfVCtOI1S9lZ6zGyuY1xECWIH7rRg=;
        b=edCugN43TaDAhhSgp4nnFXDT0UqHqxv9R9+s1sQ2Mg8Jy3dokwqXvPw5dq4Ko/WnR6
         cc5vhPS0HlH6WWUgXEInOhNfb8J7vsH4doLk24kjfDqnSux9ft2foYl5OWYVNQwu/AyH
         LUz+TIcMn0auxGHn0Gus68p+vE9lKL7DrdoukhilN+22kwVlMoLQWF1/nBVc2tCy+WaY
         RPBL2eF1dksDLj6MdDPyxYwpqMFho3j7cE0LWTybULchf5hfzUsQHmD5eqsdebNJajFX
         VueTaYKF14pNlFvmq5IK7BNlI/WT3t66uaRWpQxOXYN47tsX0pxGK2tEraDJ//ANiOlM
         sfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756370930; x=1756975730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUXfFX48DAEakyXfVCtOI1S9lZ6zGyuY1xECWIH7rRg=;
        b=V/Au21Fddak2dDWdr1HM/RUO5+GSdVCloux1nmNc1VYMVejLzjoNgAgDDJmAcfWPpv
         oE0VmwK+akemsMnTMU65l7hIgVt8KzS9Iy3ynZG4mKxxGlGFwvyV0NffQZ1SZrqSokDg
         cylLILD5y+sXJv9ZmNUM5VtkM4GUnynoW1pwSMXcsPzl7wrgoO6u5afAadxnf3CO/NG5
         i3x4GaeAjAPRNXnpEv31jpCD9+sGipvgZJPFVp9U0XdrByXmqL8ojsEhrqt94fmac2re
         COighjgj4SMyLj/VV45N84PqiD6BYxeSjmPqAmbzM4T9/qD+Aj0yhXlHIeSNOH2bJrbX
         F83g==
X-Gm-Message-State: AOJu0YxzTVL53tmQly1rJ9+tsBB23ZpxFEE76hN/aMsSCs+koby0fi81
	IHc7YKyPuEkkZZGTNGo5yybVasGFobiTJ0jbg6IpoCxjVyVcd+NlBVV7gsK3ESFBKI0ZA5ga4cl
	Yfp0=
X-Gm-Gg: ASbGncudnHoUVawbxj653E147qWSyu6BGS7XWqPkYVFlJtAguOuyLQ3BK8auvln+BdH
	Ex2BlCXpIh6jXW7qpXYuGrp81DIHu3UQi0en/ceF5MPNnu9yQVxfFv9xVdTwEKB0JL3Nj92kysV
	pSZxzxu00wwfSiDEi+/ILsttcgE8TMVZdnIaHelE61SXDRua3vLxhMbU3LBwh2KmzsCzIAk4ENI
	/FZSnKScaLl22x+OU3RwEtSw08TPUQxtMAZ8whL1HT8NvGyHqXfGSo6GQYjb3qml/DEPpjrSlDq
	Bxbrf/xhZtJ5VAhbCsZHUG33VFcRJ4OIIQ5UFLTGYKsciZJDzSUoo9NfXLOE7dbQJsBnktZlpxR
	BkUEjp/8KRvU9fa0ycO9kqwEnUQMbV03hme0ARU2EQc9L4EQ+xo2Q8449Smnk6SRJhi51mRPDZg
	1RoPPrfvxzbNrmoZdaCw==
X-Google-Smtp-Source: AGHT+IFi17hjAqIQtSfcvgHE49zU/tZKoGL/xD2ybCk39ZycbUkS55Xj2/0kgfCTQ+oXzDE2jEUiug==
X-Received: by 2002:a05:6402:5247:b0:61c:bf9f:fefe with SMTP id 4fb4d7f45d1cf-61cbfa03e42mr3196921a12.10.1756370930549;
        Thu, 28 Aug 2025 01:48:50 -0700 (PDT)
Message-ID: <c011bc78-4ce0-4c43-9638-f03aee41816e@suse.com>
Date: Thu, 28 Aug 2025 10:48:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MCA hypercall with PVH
To: Jason Andryuk <jason.andryuk@amd.com>
References: <318f8ef3-aa52-421b-b9cb-6cd6139e1dd1@amd.com>
Content-Language: en-US
Cc: Xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <318f8ef3-aa52-421b-b9cb-6cd6139e1dd1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 03:22, Jason Andryuk wrote:
> The MCA hypercall, do_mca(), is only available for PV.  That is, it's 
> only added to the hypercall table for PV.  Is there a particular reason 
> it was omitted from PVH, or did PVH dom0 just not exist?

PVH Dom0 didn't exist back at the time, yes, but it's more than this. The
hypercall, in some places, deals with MFNs, which aren't "visible" to PVH
Dom0. IOW enabling it (perhaps just partly) would need to be done with
extra care.

Jan

