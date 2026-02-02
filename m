Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJCCHSpYgGkd6gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 08:54:18 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C912AC95EC
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 08:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218394.1527143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmok1-0000aO-JF; Mon, 02 Feb 2026 07:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218394.1527143; Mon, 02 Feb 2026 07:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmok1-0000XW-Fl; Mon, 02 Feb 2026 07:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1218394;
 Mon, 02 Feb 2026 07:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmok0-0000XQ-Bp
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 07:53:00 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c5e922b-000c-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 08:52:56 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-480142406b3so29386085e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 01 Feb 2026 23:52:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce4c3c6sm371250125e9.10.2026.02.01.23.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Feb 2026 23:52:49 -0800 (PST)
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
X-Inumbo-ID: 2c5e922b-000c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770018770; x=1770623570; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hAxPsnW5OcHpfpZvmPZGyTz8YXP5vUl8BglHhtRMf9w=;
        b=Xa8uyWC41Cpqzyk6HWgD07U05EiXMJRCiL7BQxZN+zOQB4JyMeuq77VgqnZEnep+U0
         9ec4Ec/NX/az6lF45Y1okyWu+1KXT2Z+L9m/d3jGL86u9ep9bL6BRftE+jE/2jzY+wR7
         /3qU6Fiyh3usFkNfJFeOB7FWXuvQOLgylQ7+RP8uHcJYSVdTKkl299OJfhvlt+GGF0q9
         dZygJjmigslEcYhYGRdAKzLzbDuWpnCRgVg+6hoKXysCqZceTpp6wmSIqddVDfMrGMs+
         bHXP8+94hQj8lLDgrus6m1YR7UFX8GulEGyHHKRiy2pCMVv7Gl9wKNIkMBzx1bSpBdsd
         Mc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770018770; x=1770623570;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAxPsnW5OcHpfpZvmPZGyTz8YXP5vUl8BglHhtRMf9w=;
        b=uk1yBrc+v5GFI9uMgpKJB8BV+r3UTZpjc4QAf8ZWyM0/dpY21oovE/Ix8v4xu4E6Bi
         qrGu3JZuPMUS/UNr62kL7Zmb20AcLQJgzjfU5Gd5hckQ1Gr4c7BL6muDf7X1aloFexCM
         DD5bi2yoCS4k5zQ+rZhZybTKHUscT/3SBRNHzob5WDB9K5X9QF2K3Qa5uFIkvo4fTV2t
         TAAGn4cVnKvOxKy//5xthqWxMi9L0k2o7vix22MsEA2u3VwL7gTvSbntMlwyWRIOiVB4
         jyE+od+PahgPJWVCYP+vwfyWhOmB+gasvv/ek9WSTj3AP472659BUCTbLsJCJRE8CVBv
         ATpg==
X-Forwarded-Encrypted: i=1; AJvYcCVyJuYzqm4Nv6oat9ELEJPVIHvV/CmFCKYRMok1e9xjjPJ0i54RW0Gy0zmxLCzDRTVvbZUD6J+irxU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYIfq7gK/3TjgqaZyoPIB+YkjVVBpU9z8fvwA+YsnfJnJI+Jfd
	3E46ziSeGQKM7bXa2bjOn4+5Oi+IJCw+pcyywx0sRzmRdf0IaDJGd93FAtmMuDdwsw==
X-Gm-Gg: AZuq6aJ3Yu5lcXgWKv+DnLULNosnvKADX6lLEK32nuFIs3SjUNbvYC9YZRTHSW7ZCVF
	DdlIRRY3lxKiYVKsUfpQ/eMBJSh0DWzHhwDv7GsFbRbGdwIeDiP+lFLDZhFPfGXoKYHfT76QwFq
	dOqcBOAIx5rjuiXf+ACYAPgcBTvmXwwSeJ+OnHcUk/ER8ri0enb4RRU9r8z/kZW2LqRVHCkswbW
	ErG1psulBvhn48kj0b2wta+t3KS7N6QQmkuyMQjimA+D/rLqzCh6f+C9dV/kgdV/z4jmypRN/gA
	zGVt70WAAdgZ2tzppQ2m5Ffjc6+0AXHXOQz7Vx0wyaR+H5Lrz6/MZo6XXh12zeziHwR3SJ+BnNt
	2ytZ+aBi7nBTbt0ouY8Tuf/OrQ06N53IXr6ZvD+p10FjF5EdOVuKgDkOVLrykn1UYegYFfsKvyx
	c7c3/mX0XEf6tBFwnsFBCxAtctf9We1TZXEiP0/4Rt8o4dKlUZCenhWthU4efEmNdBU6DB4P6O1
	0w=
X-Received: by 2002:a05:600c:680a:b0:479:2a09:9262 with SMTP id 5b1f17b1804b1-482db45171cmr133125175e9.9.1770018770346;
        Sun, 01 Feb 2026 23:52:50 -0800 (PST)
Message-ID: <e9b6d1d1-0e72-4e27-9da2-18e2cb14c572@suse.com>
Date: Mon, 2 Feb 2026 08:52:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: add paddings after bitmap section in LLVM
 coverage profile
To: Wentao Zhang <zhangwt1997@gmail.com>
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, samaan.dehghan@gmail.com
References: <aa144043d4e0592fbbeaf0a3d5e9cad6e9226d8a.1763989809.git.samaan.dehghan@gmail.com>
 <71775ef5c267b3888ddf3e4a55bdb5914cf1f890.1766228666.git.zhangwt1997@gmail.com>
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
In-Reply-To: <71775ef5c267b3888ddf3e4a55bdb5914cf1f890.1766228666.git.zhangwt1997@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:zhangwt1997@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:samaan.dehghan@gmail.com,m:samaandehghan@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,xen.org,amd.com,kernel.org,lists.xenproject.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C912AC95EC
X-Rspamd-Action: no action

Since you ping-ed the patch, I'll give some comments, albeit I wouldn't feel
qualified to eventually ack the change.

On 20.12.2025 12:22, Wentao Zhang wrote:
> The layout of LLVM coverage profile is like
> 
>   header
>   data section
>   (padding #1)
>   counter section
>   (padding #2)
>   bitmap section
>   (padding #3)
>   name section
>   (padding #4)
> 
> Padding areas #1 and #2 are always zeroed on 64-bit platforms,

How does zeroing (or not) matter when size is what is of interest?

> but that
> is not the case for padding area #3 and #4. See LLVM docs [1] and
> compiler-rt's own version of "get_size()" [2].
> 
> The implementation in 08c787f "xen: Enable MC/DC coverage for Clang"
> partly considers padding #4 in get_size() but not in dump(). It worked
> because in the header .padding_bytes_after_bitmap_bytes is also
> initialized to zero so a reader may still know how to parse the profile.
> But we should probably not base ourselves on such assumption. Instead
> let's be as close as possible to hosted environment generated profiles,
> i.e. those generated by compiler-rt.
> 
> In this patch, get_size() implementation is mathematically the same but
> changed to reflect the layout somewhat better. For dump(), padding #4 is
> added both in the header and in the payload.

#4 is after the name section as per the description at the top, yet code
you add in dump() is to set / use the .padding_bytes_after_bitmap_bytes
field. That's #3 as per above, though.

> --- a/xen/common/coverage/llvm.c
> +++ b/xen/common/coverage/llvm.c
> @@ -141,11 +141,11 @@ static void cf_check reset_counters(void)
>  
>  static uint32_t cf_check get_size(void)
>  {
> -    uint32_t size = ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - START_DATA +
> -                   END_COUNTERS - START_COUNTERS + END_NAMES - START_NAMES, 8);
> -    if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
> -        size += ROUNDUP(END_BITMAP - START_BITMAP, 8);
> -    return size;
> +    return sizeof(struct llvm_profile_header) +
> +           END_DATA - START_DATA +
> +           END_COUNTERS - START_COUNTERS +
> +           ROUNDUP(END_BITMAP - START_BITMAP, 8) +
> +           ROUNDUP(END_NAMES - START_NAMES, 8);
>  }

Where are these 8-s and ...

> @@ -167,6 +167,7 @@ static int cf_check dump(
>  #if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >= 9
>          .num_bitmap_bytes = END_BITMAP - START_BITMAP,
>          .bitmap_delta = START_BITMAP - START_DATA,
> +        .padding_bytes_after_bitmap_bytes = (-(END_BITMAP - START_BITMAP)) & 7,

... this 7 coming from? All I can find in your [1] reference is "Sections might
be padded to meet specific alignment requirements. For simplicity, header fields
and data sections solely for padding purposes are omitted in the data layout
graph above and the rest of this document." No other hit when searching for "pad"
or "align" in that doc.

Unrelated to your change but relevant for understanding: I also can't seem to be
able to figure out where the various __{start,stop}___llvm_prf_*[] symbols are
coming from. It doesn't look to be our linker script: The LLVM_COV_{RW,RO}_DATA
macros both don't define any symbols. If they did, I would have asked whether
the alignment needs couldn't be accounted for there.

Jan

