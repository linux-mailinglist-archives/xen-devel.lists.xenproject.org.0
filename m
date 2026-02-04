Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCe2Inlvg2lqmwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:10:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC11E9F66
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 17:10:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220970.1529372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnfSS-0003z2-Vn; Wed, 04 Feb 2026 16:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220970.1529372; Wed, 04 Feb 2026 16:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnfSS-0003wB-SV; Wed, 04 Feb 2026 16:10:24 +0000
Received: by outflank-mailman (input) for mailman id 1220970;
 Wed, 04 Feb 2026 16:10:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnfSS-0003vu-3Y
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 16:10:24 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d70802-01e4-11f1-b161-2bf370ae4941;
 Wed, 04 Feb 2026 17:10:22 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4806d23e9f1so78165365e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 08:10:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436180659b8sm7008136f8f.43.2026.02.04.08.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 08:10:20 -0800 (PST)
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
X-Inumbo-ID: 01d70802-01e4-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770221421; x=1770826221; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dc7rXZAIKzrI811VASSg2B/nJwVsnLYEzFGg58FlcWE=;
        b=DxvBvqUBaDjRLwn9+jKHTOnnsGZqxMerMEyYQBkCUgS43T2RZ2js8BtEyXLxKItpA9
         YhJmc7IiOm7PzvI+LJ5pXQwQOgrxmHDPVXoo/6XUpdHHwFjMkbDD8h7xyo6owfN0Zk6g
         RmzxYaJlqi4/fghqjF8mXKrqvxFjOFc5MlQf82W2rIQU8wBqWP+CieYAx4pLgWSt+6Bg
         UdLNw2KeOXFibkJoHTs8ONJI61wiMlP8bQNVSnX60NNQrluYNCn5QbOM0N+kBDCPd2uT
         BQn9rwlXauZndPIj4mxVK9411gC7Jmn6noBm8XRwAjyWoPbULGu8oNMQA5AQMm6ziTP3
         trMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770221421; x=1770826221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc7rXZAIKzrI811VASSg2B/nJwVsnLYEzFGg58FlcWE=;
        b=JZmsyXHSxDV0d6wXt9w89ri6WGuOmHJrmF/EH5O32slwjgw/U7xj4AV6dmRz5GUGeW
         jtx7FrzrD17tBXkFDf6rg9bxCRxpq5IWTkCFtLBFXcrq8OM4stk6x2dxI0t2H/SAHnRJ
         lFMuxsnI3xytHbJ8ja+mPhtgRRVmPt5vzt36XnUSozSlpSdubn9l1fmMCSwnzao3SFZu
         MZ7kYiUTKTPXqZbRIuHSFrv9hQ05RaCmCmHV1Xb1Hu/SYRMHs8dl/u78VJIioLTSm6PB
         5VTya1RyosXYSh82RNDPiHnu/OMFWQu1+OCICPFdvXOVpP2jeS0mKqEZB99skJXCBbqA
         ONQw==
X-Forwarded-Encrypted: i=1; AJvYcCX59yzgr4syXDWsuNfeL/EI9xUrZ4Jo7HUvHDPVqp+GRpeK8iDzRsWnjlzsC7aw+kHjWDie5yOooY0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZhQcJGGamq38ziXLWDdGS9wew2hZNUFomqF83MH19ITES6ez4
	1BrCA2NSEbQ0uB/W3VDeACqT7048HsfYE8AAEF5Iwnyi2cBom8ewKifb6qBDpxPxiA==
X-Gm-Gg: AZuq6aISueLV+zqcL5AVEVXrElPuqh3GY+GJc+46rNqJoQPzNAWCZ0U9d7525Jo0MWu
	O7KMfeck+Pi1gwQRzxs9YCAlUNAQRI9r7yGOheeAn4r8MDlF4k3LmTp+5R4z4ottN7qAqmj7Zuf
	1pWB/ELuy46VfVxPvbms0sr6Nk55nNwDPJAZwNGOcgyuqeDzfucYIg20UgqKQe2es20biLVKpUA
	O7wA5ccLgui38F8mPCapsSELOoN0kL/dKqSLeA4YM9gc6alc6sc5h8vZ/KprBtl29HdUSyVXgCr
	v85FiquimjwIiXHz0D/7EmPbwVt5LyiX4fEF8+s/dtbl3SdyRbJ+P+AJXoN8iJkpZfB+BlY4+ia
	bb/rYha/RC7lil3/mpRJqgsyMOQCRD3/L+pNcvKsdqFtpqrZl/8dlp1Joad888wfcMrkOF4zs1l
	aWtEhXJMHwDdPFamPNNBzNZoCrS7c5MDSYVs1xxTgqU5K+Pawd47v9rkvuTzX87YMJOb8W0rNUJ
	9g=
X-Received: by 2002:a05:6000:2481:b0:430:f742:fbb8 with SMTP id ffacd0b85a97d-43617e3c8damr4952438f8f.21.1770221421403;
        Wed, 04 Feb 2026 08:10:21 -0800 (PST)
Message-ID: <0e2ceca5-8ab8-4c52-8a8a-b7dbdca50820@suse.com>
Date: Wed, 4 Feb 2026 17:10:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/boot: Handle better alignment for 32 bit code
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20250114115430.104084-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20250114115430.104084-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0AC11E9F66
X-Rspamd-Action: no action

On 14.01.2025 12:54, Frediano Ziglio wrote:
> Output file didn't have correct alignment.

Coming back to this (as it's still in my "pending" folder), what does the above
mean? In how far was which alignment not correct for what purpose?

> --- a/xen/arch/x86/boot/Makefile
> +++ b/xen/arch/x86/boot/Makefile
> @@ -40,8 +40,12 @@ LD32 := $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT))
>  # are affected by both text_diff and text_gap.  Ensure the sum of gap and diff
>  # is greater than 2^16 so that any 16bit relocations if present in the object
>  # file turns into a build-time error.
> -text_gap := 0x010200
> -text_diff := 0x408020
> +# As gap will affect the output section size it should not be huge to avoid the
> +# creation of huge files.
> +# The sum of gap and diff will affect the possible alignment so should be a
> +# multiple of the possible alignment.
> +text_gap := 0x01c240
> +text_diff := 0x7e3dc0

It remains unclear what "possible alignment" here is. Maybe that's the "up to
2mb" that the description talks about, but when looking at the file later the
description of this change will not be readily available.

> @@ -80,6 +83,7 @@ cmd_combine = \
>                --bin1      $(obj)/built-in-32.base.bin \
>                --bin2      $(obj)/built-in-32.offset.bin \
>                --map       $(obj)/built-in-32.base.map \
> +              --align     $(shell $(OBJDUMP) -h $(obj)/built-in-32.base.o|sed '/text.*2\*\*/ {s/.*2\*\*//;p;}; d') \

I've tried this out manually on $(obj)/built-in-32.o, as $(obj)/built-in-32.base.o
isn't there without applying this patch. I'm observing two matching sections there,
i.e. I wonder whether the regex shouldn't be tightened. Not being fluent with sed
commands, I also wonder whether passing -n to the tool in favor of the d command
might not be better.

> @@ -90,4 +94,4 @@ $(obj)/built-in-32.S: $(obj)/built-in-32.base.bin $(obj)/built-in-32.offset.bin
>                        $(srctree)/tools/combine_two_binaries.py FORCE
>  	$(call if_changed,combine)
>  
> -clean-files := built-in-32.*.bin built-in-32.*.map build32.*.lds
> +clean-files := built-in-32.*.bin built-in-32.*.map built-in-32.*.o build32.*.lds

As before I think this is a separate bugfix anyway.

Jan

