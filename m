Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2O1kB4365WlwpwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 12:06:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 418A2429296
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 12:06:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285602.1566594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wElVg-0006su-Jv; Mon, 20 Apr 2026 10:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285602.1566594; Mon, 20 Apr 2026 10:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wElVg-0006pq-Ge; Mon, 20 Apr 2026 10:05:44 +0000
Received: by outflank-mailman (input) for mailman id 1285602;
 Mon, 20 Apr 2026 10:05:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wElVf-0006pk-F6
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 10:05:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wElVe-003FMC-Ns
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 12:05:42 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5fa71-bab6-0a2a0a5309dd-0a2a4506a47c-26
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 12:05:42 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e5fa76-7371-0a2a45060019-d1558033d801-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 12:05:42 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso6796945e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 03:05:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm284534505e9.10.2026.04.20.03.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 03:05:41 -0700 (PDT)
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
        d=suse.com; s=google; t=1776679542; x=1777284342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gLanjUjHV3ThrtMCQIjBhFVG8lrvikrTuJvZy0AtwPI=;
        b=aW9OL1CYsPDU+KMdHr3lPoF+S11aDaRIvr89zwK774v+HZPybD4WoLvjyS/RmJVmSb
         yU36GfJoBd5/vU8Uv7bwmi+NiKFFIu19OP+qV/mkcM7jFCKUd77zJX3+vp8NieOOhz59
         yQ1FH6BzPQvs7lcHT7aIxEnigTLvUD+xqdLc5/HBpDTWk7z+bh/6LNckZYY0mNcH3vgX
         7UaMIn98sHeQQa2gtatjllQ00NvyfR9/CiLkmEuiJLx7S1SzOBRCnKlUbq1yLY7ISkP0
         rbPZE+3hpP/4Bh+9hb6ABwMw0fMPbAAKaYj7Xge42xClR3lLcveWPGS2RURa+3dsmuVM
         pnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776679542; x=1777284342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLanjUjHV3ThrtMCQIjBhFVG8lrvikrTuJvZy0AtwPI=;
        b=H5uL4mEd0FjyTTs5WLZIQCYHybgcunsWf0FzzhjN9+eYpZ2z80ut8Ds97xubU/jAZc
         msOVDnmbdq80QaGm0UbIwpYaNWSnlMe8cT4IdQJRybhQ29EvDY2lKEWkEGcrD5tGfXwo
         3PEWaMB2IJS51QTlBU4qrz3QDyJhDrBPxpcq3hd1D1/UkpkPr4FLnmCl3E86YeeXRTDF
         LHUqbNADWyMkMKjNynuyEhQ3r1e3YLEWSCdMpTiUrV4unLWv3i3opyYTUPj0jKLMXXmi
         gTL3sF5FMBuQW9M9T4VrLUEDDvejWGZc9KRktiZBZSPT7kD4krtePKuX4MdK92ET+soK
         DS3A==
X-Forwarded-Encrypted: i=1; AFNElJ9Hmfqw1o7pa/+/Kw2UmHWrnaVq0Dxs7R7Qtr2tOv5AUwZVQ4eF0PAbscvGamNRovtS+WU+nUvgOzg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDH5GmTl6OgVC/tHw6Uq9WpjLJo7tZuBHIvcszy27Wmsrxe6NJ
	kFGdsUd4LaT7pmtXoxdrhNMGLs2gZcn/S7S/A3a5o6N5r3IgXDsPQn8Tb74RKhbw+A==
X-Gm-Gg: AeBDieubjvmqogytKhglb/5F/dqaXDa1tD/N5nkgNFxy2cgh/wNx45jJSoR15Lv2s/7
	zis5gOktksD6efDyZ8QhecSpKQIw9SBibrx/A3AiRpXTo7TYVehRhd/Z6V85zLSoxQEpo+oD5AY
	vFC8qSXr7YyDPKlSXoPu8La6kIps17L9QvHUJ7jnG9VPr5yr/37ZBcbWWjv0cVM96uk2WLkSPuA
	K36fKSFs6V4oXghxBB8Q+r+DVSYvx1OIz8ekfqzCgIYy1LVcy375GR8N/DAf9h5w9Jvem5O/+mn
	OyJIZgPkLGxVDs2iB+WZbw7aAHT9etoV0VQsHIx0CdCafhC+0rEl05+1t/XPhVHUzdCQd1bjoYD
	JODlV86GU6JKVokUqaZGHn+c6dgiVW3AbXuBsWfjY1MiIYy6SGoqE7eIHAPcdYYzqef22yqVJi5
	ZTujdKHRvRXs65EzVDqJlFIJwB/8MtMUQ61zWeenb3ow2hRliK4UvWIIq48aPb/pcwF5NpgjxIy
	8XgDFJ46WOtekkS6hDtiJA5Yg==
X-Received: by 2002:a05:600c:a31a:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488fb785b7emr126008305e9.26.1776679541896;
        Mon, 20 Apr 2026 03:05:41 -0700 (PDT)
Message-ID: <5e60e29e-70c5-448c-b300-0ceb5e92962c@suse.com>
Date: Mon, 20 Apr 2026 12:05:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] Support multiple ioreq pages
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260420093820.825969-1-julian.vetter@vates.tech>
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
In-Reply-To: <20260420093820.825969-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776679542-91985D75-A50AC07D/0/0
X-purgate-type: clean
X-purgate-size: 1113
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 418A2429296
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.04.2026 11:38, Julian Vetter wrote:
> Hello Jan,
> thank you again for your thorough feedback. I have addressed your
> comments. I just have one remaining issue. For the temporary MFNs array
> I now use a static array, i.e., mfns[IOREQ_NR_PAGES_MAX], with a
> IOREQ_NR_PAGES_MAX = DIV_ROUND_UP(HVM_MAX_VCPUS, PAGE_SIZE / sizeof(ioreq_t)).
> Is this appropriate?

Whether using a static array is appropriate I can't tell after merely
having read this cover letter.

> Or should I leave the HVM_MAX_VCPUS out of this and
> instead use a fixed constant value? Also for now I haven't taken the
> path to permanently store the MFNs as you suggested. I'm not sure, but I
> don't think it's really necessary. Since this array will rarely exceed
> the size of 2 or 3.

How do you know? The array will need to be large enough to cope with
anything the hypervisor was configured for.

Until we actually raise the vCPU-s limit, using HVM_MAX_VCPUS for the
size calculation looks okay to me. All uses of that constant will need
looking at / adjusting anyway during that subsequent effort.

Jan

