Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEn2C+tqjGm+nQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:41:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F22123ECC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 12:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227388.1533783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8af-0001qH-4K; Wed, 11 Feb 2026 11:41:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227388.1533783; Wed, 11 Feb 2026 11:41:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq8af-0001oX-1M; Wed, 11 Feb 2026 11:41:05 +0000
Received: by outflank-mailman (input) for mailman id 1227388;
 Wed, 11 Feb 2026 11:41:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0Hh8=AP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vq8ad-0001oR-F3
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 11:41:03 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89cc534e-073e-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 12:41:00 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43638a33157so1610777f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 03:41:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e544e2sm4668103f8f.32.2026.02.11.03.40.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 03:40:59 -0800 (PST)
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
X-Inumbo-ID: 89cc534e-073e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770810060; x=1771414860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bv+YzuMU5uYAE7PhG4mt5S3suWk8wBewRlIb9clqRUY=;
        b=WfVIR1aXbkEWarehrmM8wx+cEYc95A/15gVAqPukNb8siE9w/rzoZequMv7vX+xfin
         bPWr+2MVdglv4j1JRumbre4oVt1Pok2wRSgr26902EipHQXT2kMo/WsswvWZ3ZU5XVkh
         27vF0HGDu6OWzdBVJ2go4mkK1k6JJq6e0NIPN+mfa6h4tDqpOSV15nYLOtleWFx11rxJ
         hpUUY3BM0zA0C93vUG3VopxJU/cj1kzHqxDaWZCYaKhLn+Y3MPTUIxDdldFiKauEIgXA
         RiRyQl9sFWjc2gRKOuiIytsn7X5STJoqakoQp56qm1xbGrqvvPRQOL2TE4j5SKHD3eqa
         cEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770810060; x=1771414860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bv+YzuMU5uYAE7PhG4mt5S3suWk8wBewRlIb9clqRUY=;
        b=LNIlwoC1iIEh86iU1mv/mXFVVB5Me8hB22hlVh4MIj78zLhYgzvr1Gz2oJhYuE0I+b
         ev2D/tjYAT1Vn9uHiR3sX/k4OxmCeihANQbIt2gA4OjUrw5hw1rXdyXRf2SXiEEmn56C
         31cVEIrl9or7AF9axnzWipKMpIcrm9K+vAeyuaTqT+jHgqkg80LNa9CA+VHRgIDcRI/c
         q8UhwvxBi2q6PNap0YyouRuEEKsobLvX7ZY3VKVixS4fkcYSWJG3C5AQCdy3UKX61glu
         DkYWo7eNoGOHpGkWBv5PxrJRKgMbmoSFcQVnhhXgYODA9rdZmgXZMZDWwWmGGypKESAM
         B/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSwcmo+cbSdkQf90dsl0CYEvSQ5gf00F+Dfp00geZriItGD0SMalClwMl6CDMPls+8SIKgals/4n0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweS1NHLHOb8rj+KvA02ATzaBIP4WyUoIVck1Py94XGEcM6Otk7
	qm/FFxUJJchjWcmGN2stXz3djNN9HHbms1fH1tg6vcRp+YVAeB1ISAy74b0wncMWaA==
X-Gm-Gg: AZuq6aL8RKIphiz9PeBKy1LPDoSlZZJ5hBQ5wOeyAZ+NzQtsN/m4Zj0vH4dq30sEN/i
	KCHTE5wEvqG5rfnIj0G6znscEBO3JBQSAo7YldMuOck0PpnXhzldzeLY0OLzd+WRqA0jwov0yIu
	Tr6gOweMizk/9MF5nSM24I8VavgTzD2AAzPqi/8mQNFhHsUUH39cFRydm1eIxjhb4hgmHgIET91
	p2biL8o/6XY0YtFp9DqKuW/G62VP50itxRf3Fp4q3TlmahkZ87On3S65U7dZF3eTA2xYKc7RThg
	K8qu5u/lNJDUzPcMRdgbLNdvP/YC58EHXNmIymqCJXosdSE3dbZirl+LF+6KiQCrh/dNxYPa2RG
	VYF2MwZcppGk2cIuAbkav3bemBMpPssgnidyajcpXFfhufrevRLps0zE/mpXjsyNlS3VgFgzRLe
	dIpczvfcog/5Zb4pEga4b3iWukVtwicuK6gL4qbcjs6P74eizkScSJ0xAgjkC9RTFXjoTOQDO5+
	AH5aqZNfrq7uVE=
X-Received: by 2002:a05:6000:26cb:b0:431:3a5:d9c1 with SMTP id ffacd0b85a97d-4362934c4efmr26822090f8f.30.1770810060160;
        Wed, 11 Feb 2026 03:41:00 -0800 (PST)
Message-ID: <35bdb10b-d39d-4e67-9ed8-c0b85ca5bd54@suse.com>
Date: Wed, 11 Feb 2026 12:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] xen/tools: remove usages of `stat -s` in
 check-endbr.sh
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20260211104638.7938-1-roger.pau@citrix.com>
 <20260211104638.7938-3-roger.pau@citrix.com>
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
In-Reply-To: <20260211104638.7938-3-roger.pau@citrix.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim,suse.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 90F22123ECC
X-Rspamd-Action: no action

On 11.02.2026 11:46, Roger Pau Monne wrote:
> The `-s` option to stat is not POSIX compatible, and hence prevents the
> check-endbr.sh script from running reliably.
> 
> The first instance of `stat -s` can be removed by fetching the section size
> from the output of objdump itself, which the script already parses to get
> the VMA values.

In both paragraphs, s/-s/-c/ ?

> The other two instances can be replaced by counting the lines in the
> respective files.  Those files contain list of addresses, so the size in
> bytes is not strictly needed, we can count the number of lines instead.

Hmm, indeed, just that ...

> --- a/xen/tools/check-endbr.sh
> +++ b/xen/tools/check-endbr.sh
> @@ -92,14 +92,15 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
>  #    check nevertheless.
>  #
>  eval $(${OBJDUMP} -j .text $1 -h |
> -    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
> +    $AWK '$2 == ".text" {printf "bin_sz=%s\nvma_hi=%s\nvma_lo=%s\n", "0x" $3, substr($4, 1, 9), substr($4, 10, 16)}')
>  
> -${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
> -
> -bin_sz=$(stat -c '%s' $TEXT_BIN)
> +# Convert objdump hex reported .text size to decimal
> +bin_sz=$(printf %u $bin_sz)

(Alternatively without this line, but ...

>  [ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&

[ "$(($bin_sz))" -ge $(((1 << 28) - $vma_lo)) ] &&

?)

>      { echo "$MSG_PFX Error: .text offsets must not exceed 256M" >&2; exit 1; }
>  
> +${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
> +
>  # instruction:    hex:           oct:
>  # endbr64         f3 0f 1e fa    363 017 036 372
>  # endbr32         f3 0f 1e fb    363 017 036 373
> @@ -116,8 +117,8 @@ fi | $AWK -F':' '{printf "%s%07x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' >
>  wait
>  
>  # Sanity check $VALID and $ALL, in case the string parsing bitrots
> -val_sz=$(stat -c '%s' $VALID)
> -all_sz=$(stat -c '%s' $ALL)
> +val_sz=$(wc -l < $VALID)
> +all_sz=$(wc -l < $ALL)
>  [ "$val_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty valid-addrs" >&2; exit 1; }
>  [ "$all_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty all-addrs" >&2; exit 1; }
>  [ "$all_sz" -lt "$val_sz" ] && { echo "$MSG_PFX Error: More valid-addrs than all-addrs" >&2; exit 1; }

... the variables' _sz suffixes then end up a little misleading. Not sure
in how far we care. Perhaps not enough to warrant the bigger churn:
Reviewed-by: Jan Beulich <jbeulich@suse.com>
(with the description adjustment).

Jan

