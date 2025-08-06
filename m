Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2546DB1C46B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 12:37:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071582.1435012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbW3-0002Pv-EN; Wed, 06 Aug 2025 10:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071582.1435012; Wed, 06 Aug 2025 10:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujbW3-0002NB-B4; Wed, 06 Aug 2025 10:37:03 +0000
Received: by outflank-mailman (input) for mailman id 1071582;
 Wed, 06 Aug 2025 10:37:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z+Xv=2S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujbW2-0002N5-8n
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 10:37:02 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47669c7a-72b1-11f0-b898-0df219b8e170;
 Wed, 06 Aug 2025 12:36:58 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-61592ff5df8so8465758a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 03:36:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0771basm1064222066b.29.2025.08.06.03.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Aug 2025 03:36:57 -0700 (PDT)
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
X-Inumbo-ID: 47669c7a-72b1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754476618; x=1755081418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kmdMqJ0LFEmB9pgD8g7lCOC7MqbwsQT9iTvZA8taJvc=;
        b=SDatAIsrTy494nZ+WMSze+MfKEj0rEw4Uast0GWz6aK9CUq5MM2Q7hPhjdy9G6VAGj
         q7hMSRtDxtW4FrExEqQmoKaOr/ALJFDdfhTBqndJyW/NXSIuHKAJ8aQvHMj/AZKmKxb7
         7A/dWYQTApYpt89rT7zBhadJOTvQpjFs8/Hrfu767BG3+N14ORxjKJV88zm1KFj0+QpG
         avmXEBNKFD/9sRAd880ZyNHWpQ7biXYvxHfYVJom5/oTUz5KFt/3W2YFssUqAFhInoop
         xjjkU0hSq15oBQfWmsWrrRwXIXQKoBm6BLxZQkjw5HAr4Iaty+WSy/Qo2Nuo4ALmhoeT
         g0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754476618; x=1755081418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmdMqJ0LFEmB9pgD8g7lCOC7MqbwsQT9iTvZA8taJvc=;
        b=ZE9qUEgDUI8NJyQ7Esv49wW75RdAUj2L+Y7mPom7MJZ412XJSxkqvheVwxI5BXkT+g
         fBZQE8KYNFjwbY8fivXdpi7EwKFikC4Rsdx/aHbySVAcaJ0mug9+Q+iEp0sdvJE5z36S
         fwxaXeC3DgMbreyADfdzCizA84K7voPmlVk/eeyjs8Qk5wCNQZf3bbkROtZE/JRx/hz0
         Us1N8Y+Gg49Dgj8nuVtcfruzkGGbXfGCeR+Hp5N2f0wDAf6BR9u7wFfus5316aCjf8hG
         TYqEJQYtDpYqYZVG+LVZghKexyrQRl3kFdBfjYfe3BeOQRc8TpTaJGoHslhUg071liLT
         mOJg==
X-Forwarded-Encrypted: i=1; AJvYcCWhzjQau/iiMkGJN7pKVcC0D3k9+6pxBP308j/C7HmTPEKWofrfE39QlfydAQ3R3hmais93tzGn2bI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxTJSy/Ub6PtuLlyJhIzpo3HzAjgZP4y/aJSb700SMYdzcfKUq/
	SH8haecpNYNDoVVHBBwOMm6/eZLV3gWllCd66SJhO8P4Ne802FAlqvvIkGtSH/QC1A==
X-Gm-Gg: ASbGncv7bDTMAAdcT+h6LDQbftZYWLA3JzPBfJutGSMkVfUtoHmzIeE0NWNwipA1KwB
	beTXeWCjQKZ0fij3Hn0DlQwgIgkcp0YsIqUccbF+uMTB64X4qqS94pwaHLyraPjlGtWEsMgsBEA
	mssKsx+ZgGDimlksPqban6LQYcOX6Jf4dZRnyp6/DpBmsv/Eea3bd9XQEZP1/NCKGWGeUkjWDmY
	fPyaVBmWJPEUjZRizoTI0/R5Qu9NpTUGPp4lPO6bLfnLzG0BtjSZhnofgKqmi/gZO9TX5JFhxOB
	7c57H0po/WJW+9GCj+H/uhvNWRsIlPVyBSpD2gMxFHVV2fvnT+cm2L7oGTM2TVlwGEce09/hVIS
	Xv4ucut9DzMOSe8Bn9FNCRXoPG1hTokUp+daLal+OEmxKj9k4Ei71Od9lVpS/mHwk6CZRqSKcYU
	uS37Ho+60=
X-Google-Smtp-Source: AGHT+IHdgGqOhQJNYmXRXCPKn9s1N9oUbZ4Lgxw8lcg2wdJO6G4qA1/7RNzY9tTOnb6k0aielllBsA==
X-Received: by 2002:a17:907:3c92:b0:ae3:cb50:2c6b with SMTP id a640c23a62f3a-af9903e8a15mr242047066b.38.1754476617498;
        Wed, 06 Aug 2025 03:36:57 -0700 (PDT)
Message-ID: <f971f8a8-487e-4b9f-8c75-80ebfe70c3b6@suse.com>
Date: Wed, 6 Aug 2025 12:36:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: S3 regression related to XSA-471 patches
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <aJMtPLNqQFbGg5cs@mail-itl>
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
In-Reply-To: <aJMtPLNqQFbGg5cs@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.08.2025 12:23, Marek Marczykowski-Górecki wrote:
> We've got several reports that S3 reliability recently regressed. We
> identified it's definitely related to XSA-471 patches, and bisection
> points at "x86/idle: Remove broken MWAIT implementation". I don't have
> reliable reproduction steps, so I'm not 100% sure if it's really this
> patch, or maybe an earlier one - but it's definitely already broken at
> this point in the series. Most reports are about Xen 4.17 (as that's
> what stable Qubes OS version currently use), but I think I've seen
> somebody reporting the issue on 4.19 too (but I don't have clear
> evidence, especially if it's the same issue).

At the time we've been discussing the explicit raising of TIMER_SOFTIRQ
in mwait_idle_with_hints() a lot. If it was now truly missing, that imo
shouldn't cause problems only after resume, but then it may have covered
for some omission during resume. As a far-fetched experiment, could you
try putting that back (including the calculation of the "expires" local
variable)?

Jan

