Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFXBGvmermm2GwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 11:20:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1E8236EFD
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 11:20:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249211.1546710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzXid-0005HX-Su; Mon, 09 Mar 2026 10:20:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249211.1546710; Mon, 09 Mar 2026 10:20:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzXid-0005Ef-Pq; Mon, 09 Mar 2026 10:20:11 +0000
Received: by outflank-mailman (input) for mailman id 1249211;
 Mon, 09 Mar 2026 10:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TKtW=BJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzXic-0005EZ-Jc
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 10:20:10 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b56890d-1ba1-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 11:20:06 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-439b78b638eso8627926f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 03:20:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852ad0ce60sm391471295e9.12.2026.03.09.03.20.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 03:20:05 -0700 (PDT)
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
X-Inumbo-ID: 8b56890d-1ba1-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773051606; x=1773656406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F2pCmSLQMzsaxAIlAFDiSmlwjrvfzsVeQwbG2dyIc88=;
        b=G2QtNvD/vAJkWvbDFpaOG1kQHEuoi+bzUH+NIiOwEcggn6CVazkycaznD4HWxlMM9V
         RUvV2BsSbkPmbtoz+fGZA5cMuTI3MGX0bY4NCrDk0JQx6+Xz1x4S65E/z4WaEK2v9SlD
         /jVka2fUPOHHRm8wilZR/vfhiEBf5/hsh3bNpCQBEs0Bfp3L+PyKxBG9L0TovZ90Nhi/
         R4TM6zaxfqC5TIcZLycYfG+N4kIewsYb1o5GFIEkL4COQrWHYbL9+EvyblyHeaFRSW4+
         ZXy9ErUPn9s2iSVkyFWlekFK+dAPCzhri6Kx/g46rPiNfq1HUG8vyVVUMd9Kng/TD+lf
         DwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773051606; x=1773656406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2pCmSLQMzsaxAIlAFDiSmlwjrvfzsVeQwbG2dyIc88=;
        b=kA5nMvz+vs6AVFnVt16xSYvJ0t4nlWZXKsa04TG5w1/ivoELwF+WrOUz/8X1c54zGa
         x5TRiTEQrYGaXfg8D6225k6Yn37lchJ2mRA3FVP8wMY4wqK4pNJm7JXidkJ4CkpcfSHG
         /tz/4/+9KncPchdxlIrHFQzv5LDO6zH2lJ86dmo8BxaS5lYJGn1YwTXkf7CRkfMZWsYv
         RZCCSnwweX02u3NlG50FFPIvf0ADPUdGq1wjXGRmmp2aRBLJZ3RxBZcA9NWgnBxcMHlz
         ycGBiQSvJp9mLy9sHix3me3rIJK+/ZGdnJw8qGl4sU8bs+E4tvD3sESrYOz6HJzDqkro
         iNig==
X-Forwarded-Encrypted: i=1; AJvYcCXUH3UMnNIFc2uUGyjbA0xeDg/3u/Rz+TTRzEmiZRGhjkeSk4oBJgCUiINDxwhnamRDvHa0kj5306E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWdQPG7nzgtGnAQvpPZOVXRB496Yw8tU0Tfdybsc9haBxrVmXt
	g8NlQd+Ws1ZPPVPCDIy8sNZEG5pY65l7f6b1TTBDz9etmm0rqS0ZXUGaLiri+/BnCA==
X-Gm-Gg: ATEYQzz3FPhhsffSt0MVTj6dcR3wKC0Wx3a3ySdDqKNqjCDhYS0tBH0fmR8IiciNb8Q
	tAIusMvfn3Yf9+BTYnbIrkQHCqvjgRlwFLhQWBFhiQ/GUPejeh2RPmASbf2NE85svkbtEcC+ncL
	ZPNrlbyBQ7yd/D4J23ewQeoAVBejhckrp1jCCoa2RJOrTAoHLuOaU6qNektAJ9ZwRSHPRgbjJdc
	HWl+JYQVnnbd+/pMXJDbHCSchaCPENyeF7NVSnRsuhd2SKbSO2EcRXsBVg+jfm7+fShD63lZOih
	xCw8T8cw493j5mX3SlZurq2Ee5EiQmnq9FNETtos41WXmjdCQtJZfuyCSYPSjUYdopy5DAO6ESP
	A5bZn+OPdevvGJr3H1iueNm/y5WEzmiikesTihX13k/NBVLANJSJbDGrmAJRpaTkpwKMNc49QaU
	0bJEGo8Z/DwZP7UQtBVWL4cbdiPLxQK9v5i6NAGQcTgTtjSJN9E6r8jdG3f1ANhsGr0P7ivhn4+
	mU0mugWYhmQPI4=
X-Received: by 2002:a05:600c:1e86:b0:483:5310:dc67 with SMTP id 5b1f17b1804b1-4852695b81cmr181327035e9.20.1773051606075;
        Mon, 09 Mar 2026 03:20:06 -0700 (PDT)
Message-ID: <39057e2b-5d1e-41ff-b5d3-0e5aa4745d15@suse.com>
Date: Mon, 9 Mar 2026 11:20:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] tools/tests/x86_emulator: avoid duplicate symbol
 error with clang: use -O0
To: Edwin Torok <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1772813802.git.edwin.torok@citrix.com>
 <a4a29c95b06a0352889bb6c032c19be6e4cf8288.1772813802.git.edwin.torok@citrix.com>
 <49d22b35-f5d8-4992-a32a-bb3f7c3e5ad2@suse.com>
 <5B5A0A1C-B7EA-47F2-8CF9-3000CF4414F1@citrix.com>
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
In-Reply-To: <5B5A0A1C-B7EA-47F2-8CF9-3000CF4414F1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BB1E8236EFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 09.03.2026 10:49, Edwin Torok wrote:
>> On 9 Mar 2026, at 07:47, Jan Beulich <jbeulich@suse.com> wrote:
>> There's
>> one other question though: Isn't -O0 the default? Where would any other
>> optimization setting come from in HOSTCFLAGS? Ah, I see ./Config.mk does
>> this, for an unclear to me reason.
> 
> One possible reason I’d enable optimisations (even for non-performance critical code) is to get better warnings.
> I looked this up, and I see it is actually documented in the GCC manual:
> "The effectiveness of some warnings depends on optimizations also being enabled.
> For example, -Wsuggest-final-types is more effective with link-time optimization. 
> Some other warnings may not be issued at all unless optimization is enabled.
> While optimization in general improves the efficacy of warnings about control and data-flow problems,
> in some cases it may also cause false positives.”
> 
> In fact warnings rely on optimisations even more than I thought, didn’t know about link time optimisations having an effect
> (from the example that warning is only relevant for C++ for now)
> 
> I can see why in general a compiler would decide to implement it that way (if you run an analysis to get more accurate
> information for showing warnings then you might as well use it to emit better code), but I wish that wasn’t the case. 
> E.g. you may want to use a low optimisation level to get better debugging, without giving up on the better warnings.
> The only way to do that currently is to build it twice (or rely on a CI that builds with different flags).
> 
> If you want to change it I’d suggest setting it at least to -Og, which is recommended over O0:
> "In contrast to -O0, this enables -fvar-tracking-assignments and -fvar-tracking which handle debug information in the prologue and epilogue of functions better than -O0."

And did you check that -Og works for the purposes here? I'd indeed prefer to
use that, if we can.

>> Perhaps that would want mentioning
>> here then as well.
> 
> How about:
> 
> # The default HOSTCFLAGS from $(XEN_ROOT)/Config.mk would set
> # a non-zero optimisation level
> 
> I’d avoid mentioning -O2, in case that changes.

Of course.

Jan

