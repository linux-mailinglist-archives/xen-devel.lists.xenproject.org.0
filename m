Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DEFB10AEA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 15:07:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055994.1424220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uevfR-0002ic-8q; Thu, 24 Jul 2025 13:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055994.1424220; Thu, 24 Jul 2025 13:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uevfR-0002ff-5X; Thu, 24 Jul 2025 13:07:25 +0000
Received: by outflank-mailman (input) for mailman id 1055994;
 Thu, 24 Jul 2025 13:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uevfP-0002fZ-TP
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 13:07:23 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22f8cae4-688f-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 15:07:22 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-455fdfb5d04so5406665e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 06:07:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4587054e37dsm19509105e9.14.2025.07.24.06.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 06:07:21 -0700 (PDT)
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
X-Inumbo-ID: 22f8cae4-688f-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753362442; x=1753967242; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VsQKaSWRCn+6F4GOurcyG7O2FAQ62rGUNrvSAj3Bhk8=;
        b=MjgCaTaGtG/PTJ/0rrvQcw2YbUL/xfxej2bn3rGXKrjZwN48woy4Atjdd/YzrWNAEV
         IK2K3zebCmKEEkY6/FmHTXFDnx6wCTTVk9GfCgqBytaKW1oZ/YTjnOorQo3FcBXMpkXv
         OdztrRQ/s5wxPln70EFhzbFFSo+YXlS9moY32AQTjc8euWd3YU/Djkh+Ktmua3iR72uM
         Axd7380JROdMxxGqRRcO+3a+3rPJ1fydKR9TuMrSxOmufHpGJquNehGPY1qYOOEYw2GF
         ZzZKAewIe6wv/mxxrH6yUWSHN8gvkSXTwBt2BWWTeaqkbsAdDf6U65UW84F2c934ZStR
         5+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753362442; x=1753967242;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsQKaSWRCn+6F4GOurcyG7O2FAQ62rGUNrvSAj3Bhk8=;
        b=sODzJyf4B58MwlsMsBfa0yUCSLVrbqdgt9eFI22mreqQsU+neLWgAtJQcFKSRrEeAu
         6YiItvH2b+OBQxspoQRTLTzMAKWoQL/10Qz/w6qzeknRavrktsa6Ld39qrassHsuQ2N6
         8pAaRePOI+sQYHMbD1blieftnrS2Viy5p/h+JRfcS+JIUYeeYvoVkXjuE/b8gXz1qkF9
         yyBZe95/zZ+UZNaz5aGZGkzJm8U7v4eiz4KIXNFE63P53Q1xF4XSWQZdLApyq8ME7ekj
         7fJcmY1Wl52t0vtdY2k/LFseNfEFhSsY/8AZzno861wxDM0PiBSfltUxvMHuGYqSQs7g
         R+8A==
X-Gm-Message-State: AOJu0YxTS6/xwAHtTVXZIMm9sdxC0Fv0hJG83rqYhHBh5EF3oSX/lxl/
	Fadh9PymCBj7hVwd4jMGGL630ImLCZokjnsASSloDgp8Z1KN4dVDO/n3todylTlrzjH8M7syNJG
	u9lo=
X-Gm-Gg: ASbGncvaUJJvYJ+JZHFROfzVRL41GMU3hAnhqGU3l6pGJJsE2jo6xU5eMA5/7m4dq/r
	U1Q/f98MyWE0B9vPxsAy5MWtDR0i7kSbUv/FzIZrTf0xt/Tt/eIWFH02sitF+TdWmT8gFPniLaN
	F41W0A5sexcXFRLmzlnMeaoTTdqsGmbIdzM0ERlW5GRJx7U7iNiADARH1Fho0zxQK3SKKbAg5wY
	9dlsu5w5xWexS8+t8i/2Hax85d35t6MPe1pI7p6gln882BzSxbIDNYiiS2szKxkTK1X4EHCJNDG
	QlIVaS6WpRv4vs1mc91CEOAymKX/e8xRee4qTEq222McZVsHNOlGKrqnApQcqY8uYmuDCcuPaAb
	9BvNzuykjRSGAWFqlG1rGhJfg935E3JCDfxFuSFAQyg1ZCyRkSSDc4P/pfWM4p/guOQnHyWletX
	x6L6spPc8=
X-Google-Smtp-Source: AGHT+IGwIcd68jHx5rczieAq5UEumIEh1/Hw8OhBoxU1K0ve0kWL84x6kuVUs1tgQgvrBqWHgNTA0Q==
X-Received: by 2002:a05:6000:240e:b0:3a5:85cb:e9f3 with SMTP id ffacd0b85a97d-3b768eb0580mr5764291f8f.12.1753362441720;
        Thu, 24 Jul 2025 06:07:21 -0700 (PDT)
Message-ID: <72da6f86-edfe-406b-bb0c-6825a48ec3e8@suse.com>
Date: Thu, 24 Jul 2025 15:07:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/AMD: disable RDSEED on Fam17 model 47 stepping 0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3dd4cddd-2dd7-4337-be89-b775a4b04824@suse.com>
Content-Language: en-US
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
In-Reply-To: <3dd4cddd-2dd7-4337-be89-b775a4b04824@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2025 14:56, Jan Beulich wrote:
> This particular variant has an error that causes RDSEED to always return
> 0xffffffff, while RDRAND works correctly.
> 
> Inspired by Linux commit 5b937a1ed64ebeba8876e398110a5790ad77407c
> ("x86/rdrand: Disable RDSEED on AMD Cyan Skillfish").
> 
> Like for RDRAND, permit a command line override to be used to keep
> RDSEED enabled.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Considering how it is described, I didn't think probing RDSEED (like we
> do for RDRAND) would be necessary.
> 
> Am I going too far in also updating cpuidmask_defaults here, or is us
> not doing so for the RDRAND disabling actually an oversight?
> 
> Using warning_add() may not be quite appropriate, as we don't really
> mean the admin to possibly override this with "cpuid=rdseed" (that's
> only a last resort, in case the issue is yet more limited in scope). But
> mere printk() would feel like hiding the information in the middle of
> lots of other output.

And, other than presumably intended judging from the RDRAND logic, passing
"cpuid=no-rdseed" doesn't prevent the warning. That's - aiui - because the
clearing of forced-cleared features happens only afterwards. Apparently we
would need yet another predicate is_cleared_cpu_cap(). Or have
is_forced_cpu_cap() check both forced_caps[] and cleared_caps[]. (As per
present uses doing the latter would be okay, but I'm not sure whether
checking both in the same predicate would be a good idea going forward.)

Jan

