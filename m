Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8BFC88536
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 07:54:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172304.1497387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO9PV-0001GE-6q; Wed, 26 Nov 2025 06:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172304.1497387; Wed, 26 Nov 2025 06:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vO9PV-0001Dv-4D; Wed, 26 Nov 2025 06:53:53 +0000
Received: by outflank-mailman (input) for mailman id 1172304;
 Wed, 26 Nov 2025 06:53:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vO9PT-0001Dp-JW
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 06:53:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8f1dab3-ca94-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 07:53:48 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so59709405e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 22:53:48 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52?
 (p200300cab70c6a15dd939ad410e5cb52.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a15:dd93:9ad4:10e5:cb52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790ae05feesm26146885e9.15.2025.11.25.22.53.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 22:53:47 -0800 (PST)
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
X-Inumbo-ID: a8f1dab3-ca94-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764140028; x=1764744828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rlZPsYlhMpcnplZMBTt5WYxemDnRN/Jxv37GOLG8RpU=;
        b=J1xmThIwgZkQIkB515ws3IbWpbKlOEyrFWRf3UiaPrelbiWls0cv9LlYcO8xMDUNm8
         140iHF8V0BvX0P1NW/XEFxSzv3j39xZi4HbBywzxsFd2hO73fMwrp0i9Ea2NHTmDn9yc
         VO4wmO6p4aLlm25ZwO5cSKveHNm/UiBq7rxgB4ut0h1gqUTMt3ZipAFFm2Vf33a5oONG
         aREok7qWWamZMVsyqOsx20jweTNW/aTHSvvnYpnaK0NQS1bCb/eLIFJDh1X56KSonygT
         tubUiAqgZpk6larAZ6wdqUNpW4CfF9Ealvnt4UOU29YMH2iGdBd/ffPB0cv3g+RBLyx4
         ldew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764140028; x=1764744828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlZPsYlhMpcnplZMBTt5WYxemDnRN/Jxv37GOLG8RpU=;
        b=UmOCb+V/Ek7d3f7dEMqpwm0BRuw5ayNYA/wXdoZpuWWMY0iXRfhVDPfnMWP7DeqvHs
         HEzd2l9MFKgJsi/pNA/v1mVRXYpwnTz0tYSle1xirUlNubC0v2MYOIQOPKTixJHv5jMh
         Xdpr03pFD89ol7BLO52Ww1H43bWZjUY+8MGN0MDCUgTTugWMmJJ0ayHnqFQ5qHv95kNW
         U1LBu+b1f+BiVLRofvc9pJ8aAPZEWzyxi3Bvo6HBAHVug0h3yzzvj9fGeSPf0qbIJ1f9
         MvRSBI/85B6fRqNbPYZVFQgS10Q+ArmGwf/wvXAxui5q/3bgPz1q/+2oPJo9C2JE1AMb
         HFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYVg/W0gw4KSe36uJt/EfE3m6eryec+rQgWWtl0Paciy9HMzPpekSUlA1JliEzflXtz/cgqDIASx4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxG37MizGVZMoXjG4hfjewAHhaDRBjq43PqxyHu9DlA/wkt2coz
	4q1pjAPd15RM8PciulkFxQSpCRmWgOP8impkdBNml+OALBGrzM2OM7t+iMQS/0VLiw==
X-Gm-Gg: ASbGncsltl/uukKmlXWiRimNnj5zb6oEWpYcVH2xHTV+rRbGNHOO8cEMpqaSzvNq8rZ
	Hqnr3rjkfcA/cU514NDi5dMeJl+bT94STM4yS8ygoOCouh5z+UUztkY07Vq/BlFaT7/GZlOmBdh
	jm6XPBviECt3n8hJFDkTJd+8mAspFmA0n7o1qrJKwtDkTlE374Rwxzs9DcDlDAJhALsAICrSCHt
	J0O2pmzT4Bb0m7ODTYgxDk3CBrFcyBeEzEIyjIjRSp2IRzqliqWfKlxsHZP415WXEQzW2iG3FCj
	hd27Lpi9Rvsax9eotjzvnszkAyJMzLIOOUtZbBUC9SEVfOVhCmxUtNojEaHloxxpC4Z1prWaPxf
	Jn9ayqdQyr1yDIQPlGYMIKtlTsKjJrFq+c2/nxPdlO07pw/mrvbLCBouO7vGbWqBSVwDj0wY0n2
	Q1JAY7RQClxSpWPXY6ZlsC41PqbIka54owNpdBCmHNBZKiSiHw0NtGrwBQyh91cPJwylfye7D6E
	woK46FfB5qG1Q9UQ3JxGzhBwIFGvbyj8SpfzezppkTlEKb6
X-Google-Smtp-Source: AGHT+IE+GPanNrHDUolXz/DU4XoI3IvPZW0CGrl1VSHK+VDAgzQaJw3ybx4PsZoxyX3kcDVhYg+mfg==
X-Received: by 2002:a05:600c:5489:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-477c112400amr157009535e9.26.1764140028260;
        Tue, 25 Nov 2025 22:53:48 -0800 (PST)
Message-ID: <c7a44091-caf0-4346-9f03-d7741eeee592@suse.com>
Date: Wed, 26 Nov 2025 07:53:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vhpet: Fix sanitization of legacy IRQ route
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251125165252.1491-1-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20251125165252.1491-1-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2025 17:52, Tu Dinh wrote:
> When setting a timer's config register, timer_sanitize_int_route will
> always reset the IRQ route value to what's valid corresponding to the
> !HPET_CFG_LEGACY case. This is applied even if the HPET is set to
> HPET_CFG_LEGACY.
> 
> When some operating systems (e.g. Windows) try to write to a timer
> config, they will verify and rewrite the register if the values don't
> match what they expect. This causes an unnecessary write to HPET_Tn_CFG.
> 
> Note, the HPET specification states that for the Tn_INT_ROUTE_CNF field:
> 
> "If the value is not supported by this prarticular timer, then the value
> read back will not match what is written. [...] If the LegacyReplacement
> Route bit is set, then Timers 0 and 1 will have a different routing, and
> this bit field has no effect for those two timers."
> 
> Therefore, Xen should not reset timer_int_route if legacy mode is
> enabled, regardless of what's in there.
> 
> Fixes: ec40d3fe2147 ("x86/vhpet: check that the set interrupt route is valid")
> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


