Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE256BC3EE7
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 10:51:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139396.1474767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6PsI-0000lh-QF; Wed, 08 Oct 2025 08:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139396.1474767; Wed, 08 Oct 2025 08:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6PsI-0000jK-Nf; Wed, 08 Oct 2025 08:50:18 +0000
Received: by outflank-mailman (input) for mailman id 1139396;
 Wed, 08 Oct 2025 08:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6PsH-0000jE-N4
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 08:50:17 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cecf2655-a423-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 10:50:15 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-637dbabdb32so14332132a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 01:50:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-637881010ffsm14294977a12.27.2025.10.08.01.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 01:50:13 -0700 (PDT)
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
X-Inumbo-ID: cecf2655-a423-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759913414; x=1760518214; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1sUNXUcXtOQ9nn0J0+4DVsN7GTzPp19+7FogSNXhQ8A=;
        b=HWJEen+qWFT1X05OzY5DHHn+ClcySNY5JutN0ga3mcK5wyh1rgVgwZ2I86Gob/nt8g
         8CikKu61oh2Wmsqw6EaoK+f47fnlfo5TQMkuNlTzMs19vxqplw6MpyM4XbLXl6AopiTq
         iFCOrYx/VGFfpAm+p4WzO9SW07zyVG2okelrGwbDBepxGGdIwB46kkPLinjiWS7xIbmh
         7Hiel01yl/Cbie7+XPl67m9hKuM9hfWoXU30Nyv5mBc7sUl9mADA/Huvs29TYPmixsml
         YtxJP4druZpJAjWSBssTPez88/uIUizf/m8IFAuJ/ZLg3KMURZm5EO2dVdL/g6bT8ZKH
         HrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913414; x=1760518214;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sUNXUcXtOQ9nn0J0+4DVsN7GTzPp19+7FogSNXhQ8A=;
        b=v+4M8tktawZlHXa6/6XkTbdK19RbdZ9Orr8jtNf1KM+8Qk1kOyPjXtDybwUMbwJGX+
         J7cG7PAH6tTp9SRlNpnOeCTJGoBD8qfwfBpQ4S6oOhhKLy8dANBBYtndhGAUCeWFwJ01
         TelYWljV8nm8kG5yvTSf7MVyrYc7uQS9lGVkSvXgSXVDlF7qhhtxHcLQRTejGweM2vfx
         CT+wzh2bjI3mzPqD4Avc+EdsVg099kYcAkdaTA2VKImNGm/lZhgY3v2jkyPw5NaLID3x
         D7vPrYXCFCYCNavZrpbKVhK4Syn3x5xvIas61u68NDdg/h2XmvQALdnXIfZkadxNtUzZ
         fBwg==
X-Forwarded-Encrypted: i=1; AJvYcCVCQETxCOygThybKKmrWEJ513WGnuOw5o6hHsK3kz6qnx6IGHr4R0jCPA/0AOuZH5dFfcBEeSrQXww=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSIhWpRZPUOEY8Q7NaPyXXfhqBUHJP1h2pW6z6H6hBL/6+Grub
	2ygIaeUE/MrBOdsjBPkqtenrhz5xbmdx0ShF3oqeHXW2MgFxFaRRtPXzcglW5EXVPw==
X-Gm-Gg: ASbGnctP5N3u2pELyp9i9uViANrYc2/u08zMz3Fibx8xxPlecuH73tJ9zlqH1eetrce
	x+AvJKg4MyzEtf1vUCK6N3E99rQdYY1ulx+7qX/Dqg5uivhsnobsdlW9creUSfrlHdltVKya6IW
	ddQ3ADCQPjdqPKx+ACB9bo52V2wJWp51t2ljsn7pWc+g9+I4uPmF/FrezEP7LpVwQfRY5cGeMVx
	I9tpLuvjVFomqzdFXGxIScR8kfk+/WMyRupAUzl/rXOZFSlGCuDhWKLB8obRhG4o1/srxEZO1jP
	J8HFiDFCwNfDACs2qQPOd5FSvYNXR8zUkmX/FwVKmeq4lJVbXWsiitzJYQbMXsUwgbinp7CI3Bi
	4cBoIfNge2P2FwKBVlFz2xNG9Z07j6fo1BzQUqtWRlsu2BaeCkDILfkO+vi/2SZApd4dI2SDjAx
	DN0vRHEKrTtohLtneEKaGYQFCOKakcX8k=
X-Google-Smtp-Source: AGHT+IGQCEKmjLTU1gQzJKsQg19DxqtdEyGK5TqvJgwn1AP7KQO5CB0wUh1Vu73acKF9Ka2foetHRA==
X-Received: by 2002:a05:6402:1658:b0:639:5cc3:7a36 with SMTP id 4fb4d7f45d1cf-639d5c520bbmr1709714a12.25.1759913414399;
        Wed, 08 Oct 2025 01:50:14 -0700 (PDT)
Message-ID: <12cfd2a2-296a-4b1f-a831-ac2f3b6fe2b5@suse.com>
Date: Wed, 8 Oct 2025 10:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/22] x86/traps: Introduce FRED entrypoints
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-13-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> Under FRED, there's one entrypoint from Ring 3, and one from Ring 0.
> 
> FRED gives us a good stack (even for SYSCALL/SYSENTER), and a unified event
> frame on the stack, meaing that all software needs to do is spill the GPRs
> with a line of PUSHes.  Introduce PUSH_AND_CLEAR_GPRS and POP_GPRS for this
> purpose.
> 
> Introduce entry_FRED_R0() which to a first appoximation is complete for all
> event handling within Xen.
> 
> entry_FRED_R0() needs deriving from entry_FRED_R3(), so introduce a basic
> handler.  There is more work required to make the return-to-guest path work
> under FRED.
> 
> Also introduce entry_from_{xen,pv}() to be the C level handlers.  By simply
> copying regs->fred_ss.vector into regs->entry_vector, we can reuse all the
> existing fault handlers.
> 
> Extend fatal_trap() to render the event type, including by name, when FRED is
> active.  This is slightly complicated, because X86_ET_OTHER must not use
> vector_name() or SYSCALL and SYSENTER get rendered as #BP and #DB.
> 
> This is sufficient to handle all interrupts and exceptions encountered during
> development, including plenty of Double Faults.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


