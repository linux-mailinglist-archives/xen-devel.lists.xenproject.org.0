Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4K5+H/jOgGkuBwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:21:12 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F36CEDEC
	for <lists+xen-devel@lfdr.de>; Mon, 02 Feb 2026 17:21:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1218961.1527849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwfQ-0004MF-Vn; Mon, 02 Feb 2026 16:20:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218961.1527849; Mon, 02 Feb 2026 16:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmwfQ-0004KO-So; Mon, 02 Feb 2026 16:20:48 +0000
Received: by outflank-mailman (input) for mailman id 1218961;
 Mon, 02 Feb 2026 16:20:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bi8a=AG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vmwfO-0004K8-Nn
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 16:20:46 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20793d4f-0053-11f1-b161-2bf370ae4941;
 Mon, 02 Feb 2026 17:20:45 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso39687785e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Feb 2026 08:20:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482e2e3bf18sm99615685e9.19.2026.02.02.08.20.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 08:20:44 -0800 (PST)
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
X-Inumbo-ID: 20793d4f-0053-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770049245; x=1770654045; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FFDbJjK9AOCC9J39bKSLHR59+MqWiOKp8jEBvlZ0yJY=;
        b=Yztx77CXNu+8LYJqEhYMT2sogT8Ah1qhgElt1IB1TlBfdVoY/d0ux2prELuoc9Fy+F
         U8FRL57K5JNPfSKZnnZ5pEugNuZKjPcecqgrDS/9ZG2vSMVj34MckjZYSgemMmsog6B4
         nLwiHnS/EbEd8X8xyVWEGOubMg+Jcz9WDRa+biYDmJwjszKy69tKQ2IWyAGGMuk/8tEh
         VP5mAqvo+baX3i4rqZ5aEtJoQ0MV29btkFuVDqkR22gf2WNXnGkWUcT+zOPHG4wsL3zK
         WyWNM6Mcd0qDRVbMCcbt2e8kxfqoCuIXdLCXXQkZPMI3PF4/d5A04l5RrwMUefnJKi8T
         cNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049245; x=1770654045;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFDbJjK9AOCC9J39bKSLHR59+MqWiOKp8jEBvlZ0yJY=;
        b=igGJboRy8QolqG9bDn1A5Y4qeCJxQNP0PwKq842JZKGpsUSooUU1GWKmCFt+zTA9oJ
         5C6A1nZkZCZPdMdYHW2VSmXQ42qd7vXuhfRmxr8y4GRsYR9oz31PEljBLe7gjYZcCpAj
         7tZI44/lnzxJcrWuLixnuJmkwWKW65FDt+CBNvbbqkecDJEONgfyX7w4XRR/gOFoA7D/
         5XF4hzLOPJ0kcc5ac1v66IJ9EL0nyGpXWOMHu6i6yJb8E3zaMogJ6MPHfv8cjHoIUZC+
         sAC53jKh0zkIPPtaRAVx43VT228PpI8tb16bzjgoV5i+qWdG9aeWH2r7qe2IgkRjqT21
         2CpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+HwpmOVoiOXZLPtaLiiZLqQ8ON+O/viPrBr7onzdyktWKjIrFK+NSuVSbLI1tC4B/zb1eJgcJ+QU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzF0xNODxyrIaJAG/Q5RM5w3o3F0KlmV2T7X+6TZvQDdxcSjbyX
	qKkxMoaAeRecgi0Lcql6MAOFlIsaxHeoCGwGhueMIlTzltL0KrTnpoP9BbUeVtQ3/g==
X-Gm-Gg: AZuq6aJRp7rmAtn99QPf4zlfEKil/Mgl0m5UUo+cViAjNHcb9vlAw56rZoZYpz9wXzb
	mBb/6Dpip//dcAM//KkzcdPTcDVZdHfbBKDy2THmcvCVcEvkVYtpTNtsaadT/4gR4R4rKzWNGzw
	9n6/iBQdN4mZyGtZrsOF9Js80XriAYkX6n00Qb6UDrdWMi2KOhwgr/C4YWDqqZk8gsfuUJC/e8P
	+ZGidXNmDZXldZBzDXTaMXeeec8GcxFsgg4ouqtAiJ4WbApQay5Q9jLxwAwfxRZ9hjpELedNqjU
	aio/AfGzhsiORpgW9nAN6XWC1BU+21OOhKA7akpvJUys15jtqY6ulT7rgUGYmyxobPzj3kuhVwR
	xVpCPrMXC6hS8sKeSv4gHuMNN5s++DP/HE88Q+BSdS1XXbnWJCkqyCqdymWR8uoMeO6J9t40woY
	PfsJmTnXauxgonOGThYyXi5PFNIujkdZYZIeqMi2jG3C9G+K5lVym7wM8sqsfxtlMrvgIDt9nah
	BU=
X-Received: by 2002:a05:600c:4e56:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-482db47cf2dmr173772065e9.22.1770049244840;
        Mon, 02 Feb 2026 08:20:44 -0800 (PST)
Message-ID: <27eefb94-ae13-469c-9b1e-f730a27ab22d@suse.com>
Date: Mon, 2 Feb 2026 17:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: calculate number of synthetic feature and bug
 enumerators
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <70fe3986-ad89-4b42-b158-7e7b2b24ec1e@suse.com>
 <5f42ae1e-7f3f-4e95-a6c3-5a7f39623971@citrix.com>
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
In-Reply-To: <5f42ae1e-7f3f-4e95-a6c3-5a7f39623971@citrix.com>
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E4F36CEDEC
X-Rspamd-Action: no action

On 02.02.2026 16:56, Andrew Cooper wrote:
> On 19/01/2026 3:30 pm, Jan Beulich wrote:
>> Rather than spelling out their amounts (requiring updates when multiples
>> of 32 are crossed), introduce a sentinel each and calculate the two
>> numbers from those.
>>
>> No difference in generated code, albeit debug info size grows quite a bit.
> 
> Presumably because of the substantial increase in preprocessed output?

I wouldn't expect that to matter. My suspicion was that de-duplication might
not work very well there. But I didn't go check, as debug info size really
isn't a primary concern to me.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> This is an alternative to "x86: guard synthetic feature and bug
>> enumerators", bulding upon the expectation that when adding to the end of
>> either list people will notice the sentinel and not forget to update it.
> 
> The extra preprocessing overhead is not ideal, but it's certainly
> preferable to the first version.
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

