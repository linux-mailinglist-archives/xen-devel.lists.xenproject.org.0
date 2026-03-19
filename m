Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJUwHNDAu2n1ngIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:24:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED02C890B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 10:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256828.1551300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39bq-0007FJ-J4; Thu, 19 Mar 2026 09:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256828.1551300; Thu, 19 Mar 2026 09:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w39bq-0007DF-GM; Thu, 19 Mar 2026 09:24:06 +0000
Received: by outflank-mailman (input) for mailman id 1256828;
 Thu, 19 Mar 2026 09:24:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w39bp-0007D9-GN
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 09:24:05 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea52899-2375-11f1-b164-2bf370ae4941;
 Thu, 19 Mar 2026 10:24:03 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439cd6b09f8so481469f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 02:24:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b518985f6sm15971232f8f.25.2026.03.19.02.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 02:24:02 -0700 (PDT)
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
X-Inumbo-ID: 5ea52899-2375-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773912243; x=1774517043; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ETS9axMZ69u2y6opvi1e7W18NpRWVWLkA7t9NSxMuj0=;
        b=JVXA+mEo1MbfXlusSUaqN8mhnV5pABY0Mlk8jRGCWRzhpkCamNId5iL5j+2yQpP++y
         FzW1h3yJ1evxJeCJli/9i6T1CgLonC78DMT7XkpZHV92YAK+zX53CskA3P7Qyrikit6v
         MTycC/G5hShdIOIyhpMqD5xqvk2jrnkATgEVAiKaL/qElHioImD1yEH5Xx/CWIIy0NW7
         y1OK0t29EV7lscN+Tp5NFrO7q7TFnqMETpfRq9Jsi/rriUVAZeEZbxWeCnKudahhvFXj
         bCALZ1wYzV8KWDrYtsEF/wBTD3uYAQJjirBW7TSl6ES6yShoQ1A3/x35+SW+W2GZSc0P
         n5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773912243; x=1774517043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETS9axMZ69u2y6opvi1e7W18NpRWVWLkA7t9NSxMuj0=;
        b=EaHa/+pqnfhubdvpg/uD5CajJMDHrvh/6z7AWb7ddJ8jfreR5o4eN71+XrxYOCnNVE
         mdt4uvC8Xyb8T4wdAYsx8/DtQRIdG9tWLotFSEPxvZg/Ryg+9b7b2zkgr6iimBNCqHKR
         4fe4MMetuMj4oSJM4M0iplSnGQIx6Zst7X5OHwDLr3cxxp5Hv197aWG2QU7BwXfH+CPh
         qRJRLI2NFx/A/kQUp6+hamD2tWxwZTZVWASvaH6PzWjR6KaPqNQFbvEyRb1X7xOVC5bA
         ut+6dZZy+wFTIIsLcZ9hH6ZMMCl1pcriPpRnWkdOuGcwHoibBbfdHig9Nkrvmj5TnVg6
         jQTg==
X-Forwarded-Encrypted: i=1; AJvYcCUeoGvWI/qhuTGPLjPZ7zgYUiIw7rQZqyeBLsdBtN/ZBqlO4wuIpCSsBJS2biHOSbo85x/4vyUuQ8E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtPLKP7yP76I6JJqeFuH8vraJ3K66xLVTckpo+2Cn78+hXilni
	vNBYlV2NRNTND3o7ruXACTKNVgf3od+cTpTzFu5GCmbxqDfmzU2uY5luP9A+UTFU99zmLs3Z1jd
	TEYk=
X-Gm-Gg: ATEYQzyHa8qCKaoMsYFCQhPuRtI6ho/53YcbMbPO0BSoJWmSjUJnQbtGlQoHxO+wZTd
	dU5UaxFoomtAaRVkHJfIjIDY5Uy6bnNenMINX405b73DitPWGxGuW1RKDq0ODWik3z3cLMXbP4T
	NmIObuFtHRZmEvOBCbobOuCRN249UEjtNzlFiYRWK48A74dHxtPb5h4o9bOUxoX8+oaL3Lce3NO
	7RxqsZ5DKiZA3VXFzlkANBguM+i6hhIV/3kYG7b8n9SW6RpEa9xZzOLlq8w3gDPFcQZUBvrySJ/
	YnoLgFK/twwyKPWdGfp1REtH9Z9CQS6L0nQfDpYEvk5ZHPfcnFLTMuiCiuRiJjRwA8FNe4KyIrK
	5O1f3i5wRUs0hrFgn/ffnkaVq4ajmZbDwk9PaNJLPnybCPvc74FvB246XSgHOhkaCUzcSaMn4QB
	hS7CQ8l/vhiVvNJ+OrwjQUwHHtP2yK4kIEPuvzyOgxMBXLK/BtZkVufHr9muf3gvni8k9YqJipM
	2dxmw4otF2gmIU=
X-Received: by 2002:a05:6000:2c03:b0:439:bcb8:54b7 with SMTP id ffacd0b85a97d-43b527a6266mr11518043f8f.15.1773912242605;
        Thu, 19 Mar 2026 02:24:02 -0700 (PDT)
Message-ID: <24885daa-5801-4e5b-9d16-bac70bab4f0a@suse.com>
Date: Thu, 19 Mar 2026 10:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v3 6/7] x86: Remove x86 prefixed names from x86/cpu/
 files
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
 <20260313163630.1073019-7-kevin.lampis@citrix.com>
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
In-Reply-To: <20260313163630.1073019-7-kevin.lampis@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 20ED02C890B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.03.2026 17:36, Kevin Lampis wrote:
> struct cpuinfo_x86
>   .x86        => .family
>   .x86_vendor => .vendor
>   .x86_model  => .model
>   .x86_mask   => .stepping
> 
> No functional change.
> 
> This work is part of making Xen safe for Intel family 18/19.
> 
> Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
> ---
> Changes in v2:
> - Switch uint8_t to unsigned int in vpmu_arch_initialise()
> - Switch int to unsigned int in vpmu_init()
> - Remove XXX comments
> 
> Changes in v3:
> - No changes

With that - where did the ack go?

Jan

