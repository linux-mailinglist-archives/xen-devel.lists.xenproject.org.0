Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8P9MO+2L6Gk6LgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:50:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB49443A74
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 10:50:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290026.1569703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTI4-0001TB-Np; Wed, 22 Apr 2026 08:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290026.1569703; Wed, 22 Apr 2026 08:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFTI4-0001RG-L8; Wed, 22 Apr 2026 08:50:36 +0000
Received: by outflank-mailman (input) for mailman id 1290026;
 Wed, 22 Apr 2026 08:50:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFTI3-0001RA-Do
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 08:50:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFTI2-00EzmT-QV
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 10:50:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e88bd7-2eae-0a2a0a5409dd-0a2a4506ac78-44
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:50:34 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e88bda-7371-0a2a45060019-d155802bc83d-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 10:50:34 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso30782485e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 01:50:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f82bbsm725708545e9.3.2026.04.22.01.50.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 01:50:33 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776847834; x=1777452634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K7yX+GLINpCu4eGgR6SOGfycLZuo//yasWtLNvgdumU=;
        b=V2qp6ETURiXk+QyUjEFbsrb9NSbFNvivBABBJXgQLF8BTif0jHpzkHbMDZ0xDD4Ks1
         Y0gYf9Xl+f7XEWu3mmgzG0qLZpMX7F5lggIJaSfttxAPI18PIwujPXff2mrVI1tJvcwC
         eajwNdyjLPmskX5wjPUsBt+c/j9mgnpez1Lhy23GoE7KI078YYwJMsKT6LDuN9alTk4H
         9SiLt38cM1SeyH5ee/1IjF6Q9GtAU41Wu8wMBhPl71+4L6bkUdlzynSyYwGV/T/rlONy
         VR1R/9yaYl6l8PllNXk0mVHC+IxBsnoNgJiZjS8sWWXGiV+zYT1NEw486FKzlqSSbq+5
         LJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776847834; x=1777452634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7yX+GLINpCu4eGgR6SOGfycLZuo//yasWtLNvgdumU=;
        b=TjeepfyXNl3zJ3+aJsMm7D59qiabE33CgrLAFD0I3T9UHV1mzWIqv4JguDh1yd83Tz
         hb38c6t6HVrNvKI5rRwO4FW4k4V86YDWcgYMrWpRmKe7y+ChLHeSryA0uL3T80UZI8g8
         u0uvjazeWHfTW01kWbPY0qS3TtLHJAn6IOnhTxdSmuGV3XReF/c6MAqTeNUrUWvs5GPH
         b4bVt17sUtAEIP2gMZj6silELWb+OcjLQ6n5pshgqXtQHHyhMXYPFMT/30xK1fuvxM3s
         3yV2lf/Zk/v/LqaQVHf2+bNf6LXaMUVQgyo294HJwZ9lYqsfWQ+8/OptqScrWEnM8ekW
         SLHw==
X-Forwarded-Encrypted: i=1; AFNElJ91RHRMxxRinYcwLW6H4ICFHHxh0wNHpfqnLjeXuicf21aFAFfz7LWKK4drprXA936jz9SKCsiVd64=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKSjB3p5CfmV6WuWgGSsV5KQayge7kLXtOLem3RfEewiieGCVs
	znlsZjSKo+LE3nOLiZylv4Jx3s+b/+7+rRSTdcGopx7sNPw71CkePG2h1oprNhzRmA==
X-Gm-Gg: AeBDieum9pqGHY1gOUSHi3zO4DUswVGLc1XGDQSPh7QM8lKCNxeqAaerrBBenR02KUf
	J2cvDt7xJLKStw4ekgBnyJ1+fKO1VG6GdketeWij+K0TcFC43x+F5XY4MArThliKFfIcr5UVtII
	EvcgKZYk3MlLDIxpx4BmuMJIq4MN8ZTA9PnKykBwavSS2h3KdIoH5c0iJYM9KIKBpT4+kXtMd5f
	AZ83esVxEMQoFBe2YFtu/E7LBvfojtaJnFooAogtcTuqCKjhHY9tKQgX4ld2E5D/geIe25MjhYA
	it6/2Ei1uVWSqLWO3PmAcEyCLEpigCCAZ16pgvnjYmUY15kki6LWjsiOVffTNIysD/vmKxmt11z
	ERbnHTxa+r4JvY+wfDWG5smozYt7F2nxk4C/rbr2yGkOZUsJY1LV0n60SFzrzSmuylXDE27mjs0
	3ybcq42EaJ5GaROQ38AwLmVAQ0QkukN5jfH3nNUZTAO0KG3b/LrkuOwMtieOAeiUYZ/QZKgF1sc
	Wym+au5DqkMZJjjQEzdNZW8tLTIhYu/yqRI
X-Received: by 2002:a05:600c:2d91:b0:48a:5301:bb5c with SMTP id 5b1f17b1804b1-48a5301bc69mr73375085e9.16.1776847834015;
        Wed, 22 Apr 2026 01:50:34 -0700 (PDT)
Message-ID: <85effc67-9c6b-497b-83d8-c809733cbe48@suse.com>
Date: Wed, 22 Apr 2026 10:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vmx: Avoid pausing on HVM_PARAM_IDENT_PT in
 additional cases
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <10315bf1a012edf4821f7386b3142e56b6c23e34.1776332054.git.teddy.astie@vates.tech>
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
In-Reply-To: <10315bf1a012edf4821f7386b3142e56b6c23e34.1776332054.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776847834-52B75D75-5B52AD73/0/0
X-purgate-type: clean
X-purgate-size: 843
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5BB49443A74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16.04.2026 11:36, Teddy Astie wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4237,11 +4237,13 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>              rc = -EINVAL;
>          break;
>      case HVM_PARAM_IDENT_PT:
> +        v = domain_vcpu(d, 0);
> +
>          /*
>           * Only actually required for VT-x lacking unrestricted_guest
>           * capabilities.  Short circuit the pause if possible.
>           */
> -        if ( paging_mode_shadow(d) || !using_vmx() )
> +        if ( paging_mode_shadow(d) || !using_vmx() || !v || vmx_unrestricted_guest(v)  )
>          {
>              d->arch.hvm.params[index] = value;
>              break;

Btw, considering the use in vmx_update_guest_cr(), why not also when
!hvm_paging_enabled(v)?

Jan

