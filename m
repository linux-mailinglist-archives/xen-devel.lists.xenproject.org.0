Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3037ED09E4A
	for <lists+xen-devel@lfdr.de>; Fri, 09 Jan 2026 13:43:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1198715.1515557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veBq3-0001BN-9S; Fri, 09 Jan 2026 12:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1198715.1515557; Fri, 09 Jan 2026 12:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1veBq3-00018U-6a; Fri, 09 Jan 2026 12:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1198715;
 Fri, 09 Jan 2026 12:43:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1veBq2-00018O-AI
 for xen-devel@lists.xenproject.org; Fri, 09 Jan 2026 12:43:34 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce9c1993-ed58-11f0-b15e-2bf370ae4941;
 Fri, 09 Jan 2026 13:43:33 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so32925055e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Jan 2026 04:43:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d865e3dfasm60900445e9.2.2026.01.09.04.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 04:43:32 -0800 (PST)
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
X-Inumbo-ID: ce9c1993-ed58-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767962612; x=1768567412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yZRvtd/m/5Q+hq2CsSefDSu82I5hnUU0ayplgVRq1o8=;
        b=KgNkIMadiTPi/EaEZEYRp36p9D7icOnC0/afUDVOV8VMe3HVjGHz1zePYDzVfedaEE
         i3FnK9U8KNXWgpsOIImemSxcNLzxZCJaNlvupciOoUmnf90qfQLpv4u37ftlK3cN0RSq
         GvZTjcH0NDa54INOosl4VF9qSKPCKm/FkKgnMFRCKBsOSXsZQ/c/D+bTUEm3uZyEES3n
         zyeCsOn8DrcRRUrPcHoUufklS8D0tuFxuV48U1QdiGMtMWjquso1WuYM3Ww2KOa1dyr7
         pAWxT1SyPhiPY2b59cgwgTChnO7N2qNNMvmE0erpUFxHoWDW+vZbVxDF3mvvnpntdGDm
         ApFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767962612; x=1768567412;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZRvtd/m/5Q+hq2CsSefDSu82I5hnUU0ayplgVRq1o8=;
        b=jotTZ9M8JrNA1vT1tz7Jlppddgp5jyylNibWymS6GGgqfgUiwudqt8u/GtN7fbrTR5
         OWLWaEyzflG6ubNxT7sXju52EnvcEu1wjnmqf0Ge3xhOJqV52zRfmVNxwSx2zboAspnO
         GxdhpCoSEJWybQvsp4SaVozkt5XAqU+iPyv12Y9J373obKMFf/VtDlwQ1jajvFv8gsmp
         A8AK/lATfVixbCFTEpmT6u1VGVhXJgGokA6tnLALbgA76Oj1VMZ69VzheJZ1E1kNRng4
         UeVBWCxLekGV8n/9HXyT577gYu3d1C7LP+LmYSAg4pV/VOgYTUH1mwLKQeMKNpceKzwR
         laQA==
X-Forwarded-Encrypted: i=1; AJvYcCXMGa+uhxyP78Qh4dMYcywP65KepbbBEHhBFaL6kJRfCgBlCQF861Dy07mDv9XTEu+s93K8JrCfQi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8SO97S3vPDidjAyRek03prIiG2XOB3dgHaxYeDwKhAtc3ocgZ
	7RG6zdTLt2d/Cq5YFJdSc0xvZABT83JY1HxXq+ocIYZaeBej1i/s02Dca6PUNyK7yQ==
X-Gm-Gg: AY/fxX4ZmXOdgfhhGcN5j5117ObDjSOWFIYbcxG07Z7ssNdAtqM6cN7r4DJlkfwrcby
	Ftx119N7qHTp75jO6pCXDz8cbnkvHsv/pm1S4U7QVe0jbBj4zFK+keA0ox1TtrH+7slurc60fxV
	TxFCo16ExoqgSuSw/DqFc3yzR3PiTA8vb7znRRDZTunCy2sbqkLYF/PxkiPpGDEUXwRiovJozjF
	DrDyZC7tfQMhVvx/Pf7pZj1Bq/Tl1f/lQunpzwcOyjg9/s+rEC5fqqvEt3WtJqGvcVe8daM2UGR
	zDR0jChp9yry11s5wUdrYFoalCCwM9GMNk7yfC7CPUP3fk2Hi6oATB2h8CcIZ/iCiDvWqmKoj2a
	jqkOVnA6dAtj9+wsI19xUZjQzHCopXthqWBGMXO+iX2viydG9iPsIDdkUYT+Uwquvy/GjBb5Ufe
	IHxLUkvNyK2743CD4AsgSFYDhPKw05m+/AX65U2afR0krQtDSTdrjw/hiHG/JjLOVsoM59RhS+o
	OM=
X-Google-Smtp-Source: AGHT+IExfTw56uD5o8AWOhLZLu/NhV/9YxUAhBquT1hK0AzdRTcDFMpdiVqO8gb9eX8JmdKcGlSWMg==
X-Received: by 2002:a05:600c:8715:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-47d84b1f839mr114354225e9.12.1767962612308;
        Fri, 09 Jan 2026 04:43:32 -0800 (PST)
Message-ID: <7f73f21f-0c89-4c51-97d8-9d5d5a9d0e70@suse.com>
Date: Fri, 9 Jan 2026 13:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: fix incorrect return value for has_if_pschange_mc
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: roger.pau@citrix.com, Kevin Lampis <kevin.lampis@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260109114330.2361144-1-kevin.lampis@citrix.com>
 <ac8f6210-e49f-44a5-9e91-f6e1ae77f967@citrix.com>
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
In-Reply-To: <ac8f6210-e49f-44a5-9e91-f6e1ae77f967@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2026 12:48, Andrew Cooper wrote:
> On 09/01/2026 11:43 am, Kevin Lampis wrote:
>> A return value is missing from this function leading to safe CPUs being
>> marked as vulnerable.
> 
> It's not really a return value that's missing. It's just that the Atom
> block used to fall through into the Phi block to get to it's return
> false, and this was accidentally dropped with the Phi removal.
> Fixes: 85191cf32180 ("x86: drop Xeon Phi support")

Hmm, I indeed screwed up there. However, the fact that there were two
blocks of case labels with a blank line between them made them visually
non-fall-through. Hence why I keep asking that blank lines only be
inserted for non-fall-through situations. In the case here the comments
would already have served as sufficient separation of the two groups.

Jan

