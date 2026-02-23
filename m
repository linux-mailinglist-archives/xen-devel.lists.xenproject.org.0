Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Cz2EXd1nGmwHwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:42:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ECC178EC2
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 16:42:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1239149.1540585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuY4r-00046j-7k; Mon, 23 Feb 2026 15:42:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1239149.1540585; Mon, 23 Feb 2026 15:42:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuY4r-00045F-4r; Mon, 23 Feb 2026 15:42:29 +0000
Received: by outflank-mailman (input) for mailman id 1239149;
 Mon, 23 Feb 2026 15:42:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuY4p-000459-8I
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 15:42:27 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fd0822a-10ce-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 16:42:24 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so41369325e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 07:42:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b75e63sm340781755e9.6.2026.02.23.07.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 07:42:23 -0800 (PST)
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
X-Inumbo-ID: 3fd0822a-10ce-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771861344; x=1772466144; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tD9eJ5RAeRrQ/dt4hNkudm5i+aFsE603xWVin7DgFGU=;
        b=FPMghS2/Tr92W7qVj1aGlJAt2YFBXg3t4en6nEF7ZNSO89FDTWvWGTlPxRt+XXoRJh
         AZs6cpZQAc0MRCxczuGl/mMlm2GZYCHO5d6jHQUket+oK8e7uEQWUCMLZMa43nAwwiY9
         RPA7nszQMhAxxn4YTb90xWDiP7Tl5uV2tmG2wTH3rEIXb+kr/ezj7F/GkdUs7QBwL7+k
         ILrztBjkK0JJGnXb9IRqPW03EVMoh7ZyKGHRjuLEa1kk5LC326sw3Be7khV57wVu/zjV
         jT4l7+ufa9AKoBCC7+OyP4mffKyA3pqbK+9GrXP3UBZlTl+n63u9mnSq8plOE/UDtMEJ
         JwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861344; x=1772466144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tD9eJ5RAeRrQ/dt4hNkudm5i+aFsE603xWVin7DgFGU=;
        b=aTlY5OvL3qHmcdbJqFtT7IvIA0ZDxn7d+PAR96cMB8w2tPw4OL6XhcuUnhCvxV5naR
         YGmjFMwh9E0hJqbfceKNbqRywIchE0yR86YevKlNW3lw8SnLZ4vpf8a2ItryeoAkEA8Z
         Bgoqd8pHT0JvIpOgEsmranfxwcHQ2+3/6JUNX9WAEslyTE8EkYIwJOcXJ0774H3ww7+u
         JxWlEBQtfJOtDzvUSOnYz+hdv4xWs25H9AOl7IYQkxfiUafNYPj+8U7MZYtSzT4ATHbN
         m5Z9BA9YKn6xZ9PZxhSTNWbP1MDqS7bP4G4rCWuc4Iv+6ydZ1gRpmZY4B+n7TetZ+uET
         mvMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2GuEpjb/LDkL6h8ipAfbFqYKXpbsxQAVin83H8+ROLzLl7mPk/JRwn4IkCDWLZKE/AxrZYAVVF5k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiKZvknzXaZbGWttEz4Uh52rbPZ0YNGMSLhVfYXAoLXhNXUMhK
	Lmt0mEhB0PIwBUdq/EDQig/PHbqFFVuFsvxSBhG/gB0KZobpQFtbWOQpmAm+j7TPyQ==
X-Gm-Gg: AZuq6aJex9t5/EGrW4EpirGRwd0HbENYG7D6JRGi4QSTM1sowJrEflz4otlck0C7eEP
	L3EDmfNcIys5ouB+Yosg4qxbiR6Os3JyQHn/u85NtC2bfDZzDnyjnt4fEJN25BUriPHJgAkHHsM
	xqBJJoVbJ3gxk9BuYAcomLWH5+VoH8es+7PXouLcF2D9uofTYWpCf+R6WMuxv8b/NmvR0UC+9kk
	a9FNhQdxXjWZXPRBkcbfIjQKqn3+FTt+7x9nNkMFC1OIR7NqXBgmSVxTsba0YEz5NRwa5dxcMuc
	xnhZdmn7K2cgkzfJKjs5Sx9H1W+cB83vLfzMDeUtsWEUr/rZX+tcN+qI2/SIGoy+wADWeWqYyM7
	xY4GfvsfiglQPZCv+KIYb4OZqU788LApeOGBgQXYPItCA1LSbNF2GQXrHzEKJu0NJOCj22j9k4y
	jsVZ3ngFssatoV/VR0MD/eyElswg8juJFxocRI0BXXwHFXO32v4IOaCcpNzoqgX9Q3QGaqH1OQv
	tzri6lJvpT3DEc=
X-Received: by 2002:a05:600c:1396:b0:477:6d96:b3c8 with SMTP id 5b1f17b1804b1-483adc6aaebmr103396715e9.23.1771861343990;
        Mon, 23 Feb 2026 07:42:23 -0800 (PST)
Message-ID: <c2363613-23d5-484d-a244-bf2f53aa3099@suse.com>
Date: Mon, 23 Feb 2026 16:42:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] tools/tests/x86_emulator: fix 'shifting a negative
 signed value is undefined'
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1771840208.git.edwin.torok@citrix.com>
 <c908071f1c5293e6f87c67a982adb377b0912ccb.1771840208.git.edwin.torok@citrix.com>
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
In-Reply-To: <c908071f1c5293e6f87c67a982adb377b0912ccb.1771840208.git.edwin.torok@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 99ECC178EC2
X-Rspamd-Action: no action

On 23.02.2026 11:04, Edwin Török wrote:
> --- a/tools/tests/x86_emulator/test_x86_emulator.c
> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
> @@ -1161,7 +1161,7 @@ int main(int argc, char **argv)
>      instr[0] = 0x4d; instr[1] = 0x0f; instr[2] = 0xbb; instr[3] = 0x03;
>      regs.eflags = EFLAGS_ALWAYS_SET;
>      regs.rip    = (unsigned long)&instr[0];
> -    regs.r8     = (-1L << 40) + 1;
> +    regs.r8     = (~0ULL << 40) + 1;

While -1 vs ~0 doesn't make a big difference, I think we want to stick to
"register size" here, and hence have only UL as the suffix. Then (happy to
adjust while committing):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

