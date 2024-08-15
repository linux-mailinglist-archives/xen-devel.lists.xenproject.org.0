Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF3953788
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 17:46:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778180.1188218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1secfc-000648-Gk; Thu, 15 Aug 2024 15:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778180.1188218; Thu, 15 Aug 2024 15:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1secfc-00061w-Dg; Thu, 15 Aug 2024 15:45:48 +0000
Received: by outflank-mailman (input) for mailman id 778180;
 Thu, 15 Aug 2024 15:45:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1secfa-00061n-G2
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 15:45:46 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f888297-5b1d-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 17:45:45 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5a10835487fso1637103a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 08:45:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbbe5a74sm1029510a12.16.2024.08.15.08.45.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 08:45:44 -0700 (PDT)
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
X-Inumbo-ID: 6f888297-5b1d-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723736745; x=1724341545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v9UHmhzgadTs0ncnwXKJLRaITtMt8CBWojav1t41wjY=;
        b=fP1TrlZWyQazOfjAabyhoB4nrDgFslqs/ZAhqWbu/cYYEh90Eddfi6DsD1JKtn54F7
         akEtIgg0OZXcm8q0UnqcMnHBmvFK4EWAbi3jhRehAqLLc4DES295HGSVNHzQDjAkD2Oi
         06sVGK7z/1xbj0Rfn1rDA1XsyUBMnDRWWmTyYC0K/U+7CSz6mMlkGCcz1BLCLWSkp1tm
         zEuFnyFE7G+L43YqB0G5g0Ctarto9LMa1aSJti3AfnK/Fugt7OqMQuNvCR85QDroarqt
         Cq2Y2EjdbLfMfHxKMe6P4cLgLr1OfnmXofp9oR7L+lRo2uJ++LweRJMsQceS09rm0H/K
         WPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723736745; x=1724341545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9UHmhzgadTs0ncnwXKJLRaITtMt8CBWojav1t41wjY=;
        b=q7Ho+aNtddLfX2p6isyrkGx/yIMBiyNSUN4wmupbdQAne9UMzQgiZdw3LSioq5GdTw
         EeqEwCQREq4yr6VJLvqW48u9EIDgium2TccUyzUzZVV+F0M71MqD9YTgZS9HfmgsCgsC
         /ums7rhxl2aR27aKKUDZiOzHvFmJIyZ1pG2pNBi885/Xs7p/yhO+AfrgvTukOl8my7XQ
         C7grNvKhZ5X/0dHZfPQNR03M4Gw8nOx/WmODYkMf8xVXBlGpDZ19xU8yQ6BVmPjwsJLC
         hR7D47cjaHyTk6S/G9TR0nU4ElE7VnHcuFXtohRmZzvwjmULAPDJAdJyASLWmNOS+3ne
         380A==
X-Forwarded-Encrypted: i=1; AJvYcCUKQnBRbucbttBNAPqxu/380wE5uz7o/A8/WOF7efMmz6wYKNRbEU6m4uOiQOikD6tcBKu6nddVV2gOU3GOJoRyrB9htHeNDeSv/DqDTzc=
X-Gm-Message-State: AOJu0YxEyPQEHBBqcyDEsUeHVzQ9gCZG4wyyMk7kyPd9kZQkkAdG5A5X
	y8dnp76OTMLUp2kM/oithexTNmJjrvVsUUaxMVfkuLC3q8Jgl/f7J4yYAccXkg==
X-Google-Smtp-Source: AGHT+IEqlwHWKhsOY7A+LLM4puFB9HT/QgSy48V0S5rMNEEzfWLXo1PBdsGkokTHvsILyH3vhKMguw==
X-Received: by 2002:a05:6402:26ce:b0:5a2:6350:75ac with SMTP id 4fb4d7f45d1cf-5bea1c69951mr4596057a12.8.1723736744981;
        Thu, 15 Aug 2024 08:45:44 -0700 (PDT)
Message-ID: <7a5c6c8c-701e-436e-9e76-afc6fa59a886@suse.com>
Date: Thu, 15 Aug 2024 17:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/pv: Address Coverity complaint in
 check_guest_io_breakpoint()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Matthew Barnes <matthew.barnes@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240815131600.4037415-1-andrew.cooper3@citrix.com>
 <20240815131600.4037415-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240815131600.4037415-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.08.2024 15:16, Andrew Cooper wrote:
> Commit 08aacc392d86 ("x86/emul: Fix misaligned IO breakpoint behaviour in PV
> guests") caused a Coverity INTEGER_OVERFLOW complaint based on the reasoning
> that width could be 0.
> 
> It can't, but digging into the code generation, GCC 8 and later (bisected on
> gotbolt) choose to emit a CSWITCH lookup table, and because the range (bottom
> 2 bits clear), it's a 16-entry lookup table.
> 
> So Coverity is correct, given that GCC did emit a (dead) logic path where
> width stayed 0.
> 
> Rewrite the logic.  Introduce x86_bp_width() which compiles to a single basic
> block, which replaces the switch() statement.  Take the opportunity to also
> make start and width be loop-scope variables.
> 
> No practical change, but it should compile better and placate Coverity.
> 
> Fixes: 08aacc392d86 ("x86/emul: Fix misaligned IO breakpoint behaviour in PV guests")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



