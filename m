Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A0AA893DB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:22:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951978.1347579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ZgF-0000Wv-Nx; Tue, 15 Apr 2025 06:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951978.1347579; Tue, 15 Apr 2025 06:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ZgF-0000Ur-Kr; Tue, 15 Apr 2025 06:21:59 +0000
Received: by outflank-mailman (input) for mailman id 951978;
 Tue, 15 Apr 2025 06:21:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4ZgE-0000Ul-6z
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:21:58 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee05ac98-19c1-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 08:21:56 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39c266c1389so3549076f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 23:21:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae97751fsm12998531f8f.41.2025.04.14.23.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 23:21:55 -0700 (PDT)
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
X-Inumbo-ID: ee05ac98-19c1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744698116; x=1745302916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U0WvTMLlZ7ODWafUTkGT1oj4PGSwjmhL5jvwgSbdXn0=;
        b=gXTp8yno1DVuO6HgXx6DxCxXeH4+PtpD27mW1uG+WzSVGpJlHb791K+s1A/c0Mt02Q
         7CWwC1HSOEdHnOk96ggWdz7np+r/C8rr3S7uGOBDeKe0bCdKh2QQ+Ra/0Pelz5THOnz+
         lU9DBoFlO8WPYVilSbXml0wPZe3cKMnfMf1yoZD1pbt0AEGuHzTdit5L29v2YH0cBPK5
         f4be43jF64h2nF0qyLt8UJyidLeUfFquXw47FkQH18EdnHQ7/swDJalUuYRE8cBuLT/W
         XwdFYBYisfEp0xNUcyGr8dEyad4cb5TU0Et2E4f6xxGM4dWXDRlAX9UWa/MOdZYqFbq/
         YQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744698116; x=1745302916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0WvTMLlZ7ODWafUTkGT1oj4PGSwjmhL5jvwgSbdXn0=;
        b=AEecd5FLQBE5hkiZ3mee83qaTZRNAIWZKBwATTgSOVzJgBmQnqjlM88OqglZYrVEqJ
         vBFDRsP46ihfzxE2K81msRIP0HMDRWoDexN/mX7vARKI+PhaU2mQ6pkbXw75deA0Rtic
         /1COx1DxvqppW7j2+GkGryGIVil0md/gazSVLd+SI29MFGFegcIzVzrl/VL+hbTXdrCV
         Yhw0wzAyfEtXFhtdbDh7BXMV2JSQhvo2sASnXBQ2558TPq80ufBCIsQxod92XZ7KAbxb
         0m0vsInI+HknuwZwXzu5YuaSd3buFmfBeMLpLz/uANQOChvG+J4wO5vA2jlebPUS9Smn
         LdDw==
X-Gm-Message-State: AOJu0YzCHrwZIjHbc+5XgOyOfov+QB1jefj/bUbdEGoQRKssZl7a2zyK
	Jsjqa9KVOQ0bDEknItOz9zl/EPCeXFatccUrjLZehm389kTEojm8M/t1n35OZg==
X-Gm-Gg: ASbGncvgXs/fS+2AXn4JOKFzwy6D32pikr4UxPjTsYWNLZSjbZtqImP7ljs3Ox1sVuy
	/o6B1gBHOuZuhJ3fJse/es0BN/HBXgGSIaXSmHHueHTXlK3ma2olSPoA0g3hgp2VVrWK0HTo1UJ
	3U1CadTLfgxhaQj3XNT0G6SYAcGzKavxXFhqY59hAz9TRET+M5AQGDV6SUynnmz21yrthB6RHQd
	p6+0yAyWU4yffRSLFPTZcnB/yUz2gjR2whDyUJO4D9W6ApWvL/Sn4Deexmor5aTb4n1BUswEszT
	UJ+ljtn1fEnOc+GpeGx5G/f4dmS/qEyihWPJUFqjysCEIJGPlzFjGjh2PzfjvGqXXxEV8S2rd4n
	CYxF6AbosIelBwXf1LpHIa1pLDQ==
X-Google-Smtp-Source: AGHT+IEWmXCl+EDyWma54qKl1TOsql6ONjXbcQMfTnlYHIU2vFLdXfjGrsIEK9fuTF4X8cSeaE/bbg==
X-Received: by 2002:a5d:5987:0:b0:39c:dcc:f589 with SMTP id ffacd0b85a97d-39ea51f5b87mr10738153f8f.20.1744698115656;
        Mon, 14 Apr 2025 23:21:55 -0700 (PDT)
Message-ID: <1e86b0e1-fa1d-49b3-8718-db43099772c2@suse.com>
Date: Tue, 15 Apr 2025 08:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/16] x86/hyperlaunch: add domain id parsing to domain
 config
To: Alejandro Vallejo <agarciav@amd.com>
Cc: xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Denis Mukhin <dmkhn@proton.me>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-13-agarciav@amd.com>
 <tRYKTDKcoIBHId12LOD4EHCmAF-AN3V3PmkMqmyIjYCqQJ3TS_0ctt3WMCq1Ez3W7oIGxwU3UsAioyP9T9fMCO78_61AI01oYEknYF_h1_I=@proton.me>
 <D96K8KED132J.3C79EPWZM813D@amd.com>
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
In-Reply-To: <D96K8KED132J.3C79EPWZM813D@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 20:07, Alejandro Vallejo wrote:
> On Wed Apr 9, 2025 at 11:15 PM BST, Denis Mukhin wrote:
>> On Tuesday, April 8th, 2025 at 9:07 AM, Alejandro Vallejo <agarciav@amd.com> wrote:
>>> @@ -233,6 +264,12 @@ static int __init process_domain_node(
>>> return -ENODATA;
>>> }
>>>
>>> + if ( bd->domid == DOMID_INVALID )
>>>
>>> + bd->domid = get_initial_domain_id();
>>>
>>> + else if ( bd->domid != get_initial_domain_id() )
>>>
>>> + printk(XENLOG_WARNING
>>> + "WARN: Booting without initial domid not supported.\n");
>>
>> Drop WARN since the log message is XENLOG_WARNING level already?
> 
> As mentioned elsewhere, the point of those prefixes are to be readable.

This, however, imo is a matter of consistency across the codebase, not just
within hyperlaunch. Plus (again imo) if anything, prefixes that are part of
the log output should contain proper words ("Warning:" or "Error:"), and
they shouldn't needlessly "shout" (i.e. "FATAL:" is okay-ish to be all caps,
but the others aren't).

Jan

