Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AC8D127AB
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 13:12:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200182.1516173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGmW-0005WS-Mf; Mon, 12 Jan 2026 12:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200182.1516173; Mon, 12 Jan 2026 12:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfGmW-0005Ud-Jv; Mon, 12 Jan 2026 12:12:24 +0000
Received: by outflank-mailman (input) for mailman id 1200182;
 Mon, 12 Jan 2026 12:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfGmU-0005UX-TK
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 12:12:22 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1cb3853-efaf-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 13:12:20 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so46728165e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 04:12:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8718c610sm129136875e9.15.2026.01.12.04.12.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 04:12:19 -0800 (PST)
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
X-Inumbo-ID: f1cb3853-efaf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768219940; x=1768824740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7MvvYEpsg7S+kbCm6tGaQfySBW5tRxWaL/bNIa6EYVc=;
        b=bw9BYdCsUrlLcA3RAywaf0Yu2x8abFXjwtHWZzM6U2iTOdvk/1YUMUSRtn4uShRWAt
         UYMzQMvU2l3K7McqIS8CAwBOyM8BBIBvlw9HmIDX4758HxvQ5UDAMDHb1dbM1WodYIsA
         3RN8A6MMGtAZ0vQFplLBdD1kXm1Nqb+KXxiNLbvHYwkXgMfkgvczJ/YVZSamhiIAL38c
         IMMyGJt0ypsvEq7ZpFfMOfL0kGk4Yy6UrlVyFAY6tCGhN5npz3bs0p2MckA8pVd2Mhe0
         hYGG5ZoP0pPVViHjbL4cLxWba6P7WBJHMh1DoIDoSyZeHbIYtGDLalI7o8LbEJ+HEjv8
         SasQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219940; x=1768824740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MvvYEpsg7S+kbCm6tGaQfySBW5tRxWaL/bNIa6EYVc=;
        b=twrjRUOVfosAF4BNiTGo1DJ7FzUIEsZVCVcK9zzXeQvwadsG4iVxdIAtm1zj+Sfm/g
         8qboHHqOE+ZrNzu81tZYjbwe99x5jLIK0tC3HmMh75MQp1z/ev2UXPFadcXpT4qf+oJD
         d0QgO+SoJfmQEAVAVI8G481ADZQB1qeuiF/7+bhTxQ2l3zRq11HNMuxP9lSalxC7ngwf
         1IEzJmvDPIpwN4oEFSkj4lHQCng0J9EHLOHXtvjMNHde/yRdoll9PD4us6twAiUm3nhQ
         hx+PXhsP0VZ5MQ8GrpeGcztKn3K+bGdSuQG92w6mt7NI3Z3AFfiulY+Cv2vpqanir0hb
         haig==
X-Forwarded-Encrypted: i=1; AJvYcCW2kx3B0b4C2rTp2WJjWJXAT1OpbEY9CnecwQ618ML1ztF2wkQRLAHN6mJhCzMJ9fL6czcwEDCehM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwZJA9HJ1pze/ygLEhTjgOsBkRXaWg6w+UDzVj/6C8NGnvu7Rj
	Sh2HaYZKTWzNvhwrLJjBMWREy4AjJdlL6Xf+ASoTIOqcvvFcKeHZaTV1omPZOElEVw==
X-Gm-Gg: AY/fxX77ZPGAbD6oLR1ODXnvCTud7pZs5pWOu92XCj0oVnzItu/JhKL1g8Tec4E6Ki3
	Qr04wwmlBOdXRzAI+bVmAdmvvphxI5gykLHp+2BzjL/gjRbbVbsz0Q5NBwKlbEqZEOUkvmmDTrI
	FbfmNHu2tOxxgLS0vIj83LeKHCV804JEK3CTiiYBL5luWN7auAbVtYb/8cy1IMdKA0Aj81z7Nyp
	RB8yRq5colhuu+bJRnkmoJS/Y79OLl2N2pVbd3j7kQMY0Db7Ldh0rfG5fwYT172TcrwuABu9iDe
	iflZR5QVOueWI5UPGwEsO0EYx+SiSWI2Ir21t9/B3nElny9jCQT1KIXAekre2V96GM7j9lgXgyR
	NDGv6ane/25IOSG9PIqfdWiPv+g4V9DCAr8oOupYRJLJIr7Wcchz0RbmEknbF59sC0TLo6I06eb
	36uIMB4Tvn+HVCvNNJfZD24aDhaCy27KAuNtjqkFLFx5AEMeokJvrsm9UF9a03pax2bkCDgGKnk
	/0=
X-Google-Smtp-Source: AGHT+IHeQKBkCPaoEmii6uAHSnaxtq5wgRndx1dwx/xm7FGQRGK8vuVVemZ//tK01uB1rZQwFIJeeQ==
X-Received: by 2002:a05:600c:4fc3:b0:479:3a2a:94e7 with SMTP id 5b1f17b1804b1-47d84b2cd24mr220653675e9.10.1768219939924;
        Mon, 12 Jan 2026 04:12:19 -0800 (PST)
Message-ID: <f822a6d7-09cc-4107-9e08-25063595fa02@suse.com>
Date: Mon, 12 Jan 2026 13:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altp2m: altp2m_get_effective_entry() should honor
 ap2m->default_access
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas@tklengyel.com>
References: <dbab519006501b3971fa913310a06755a14c4548.1767982955.git.w1benny@gmail.com>
 <ec57461b-dde6-413d-a825-3538f46a1209@suse.com>
 <1916d0a7-ff9a-49f1-8564-2767226fca9c@citrix.com>
 <f0dcc4e7-3053-4386-a162-579ecf68240f@suse.com>
 <CAKBKdXg-KRMOf3T+gAiPiRvtjnFJ0sn8aZ-6L+dQvmZsKmRibA@mail.gmail.com>
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
In-Reply-To: <CAKBKdXg-KRMOf3T+gAiPiRvtjnFJ0sn8aZ-6L+dQvmZsKmRibA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.01.2026 13:09, Petr Beneš wrote:
> On Mon, Jan 12, 2026 at 12:24 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 12.01.2026 12:18, Andrew Cooper wrote:
>>> On 12/01/2026 11:09 am, Jan Beulich wrote:
>>>> We relatively recently introduced Amends:, which
>>>> may be a suitable fit here.
> 
> So, what should be my next steps? Should I re-send the patch where I
> Cc Tamas, use 12-char hashes and replace Fixes with Amends?

I'd give Tamas a little bit of time to possibly comment, which might then
save one round of re-submission.

Jan

