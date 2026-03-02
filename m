Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gL5nDi5fpWlc+QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 10:58:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1881D5D4F
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 10:58:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244055.1543524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx024-00079y-CW; Mon, 02 Mar 2026 09:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244055.1543524; Mon, 02 Mar 2026 09:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx024-00077U-8V; Mon, 02 Mar 2026 09:57:44 +0000
Received: by outflank-mailman (input) for mailman id 1244055;
 Mon, 02 Mar 2026 09:57:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx01t-00071G-TK
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 09:57:41 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3510c92a-161e-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 10:57:22 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso34804125e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 01:57:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcb4f8bsm309877465e9.4.2026.03.02.01.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 01:57:21 -0800 (PST)
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
X-Inumbo-ID: 3510c92a-161e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772445441; x=1773050241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rlfLkU5zFNa46IcsgJeGs4KnjPnmVvVatz5QByV8OIc=;
        b=DdL/M6RSrkeQRB5UDcFFprbWzaojCzKUlcDNVPz2MUv18rAS5P3w9PFHjHMxSEQcHo
         MbNP9ERyVCUcKpM3aHB1E+HWnjmgq/fFKMpng6rukG3W8xQYwWJc7lzRkaxlSfaf2zHB
         29S6bAvPi/bm+d5D00frTsiG5gGjZJ70wxO5UmdpEjGl3vQRs6eBDK4Dz7c4M2e9FJYs
         RmZq7xEli9R4cTxh0ykWu3uyqvxdCqYJDpUGG+fgE9szl+9F+UfwgdMmk+INik04O3a/
         MTPt9YgJczvkuaJTVane/lfgS4JQ4L1PkVjOJ+6Ip1MOZe68aHDbZgw4c93ipBpVBoPV
         2bzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772445441; x=1773050241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlfLkU5zFNa46IcsgJeGs4KnjPnmVvVatz5QByV8OIc=;
        b=jpI5ecgr7yoXP7VIavVI9xzIuqxeJOG09xVlt/WjAnK4fRBD3wCmiBg60fdG5V42dN
         /JMrcWOg9rM6SXG0Eon5YEBguIhUQAhhQcjK9/sYvtpE0hcVKXLB36s8LyhI4MowcD3I
         +Tmp/tR/g1gdid/o5MjAW+nIONsQK/3Srz0x6tKCNLLer+pbGzeliAgDfzipJJqtEZRz
         0JEkbChir24uhDFDCJEKKiCIUuRJfyUkpWDWNdQAsONRLfE4+hdw5mReb405bNdqtz4x
         TPICkjZVj8qHUD88UT6kxz8JbqlLIIslIkdZkYulpK7qQD8/fdBAJvJRGr46txQlYF5I
         DGoA==
X-Gm-Message-State: AOJu0Yz3PtZSdxBsiYu+X7+g91cvke/gvpNe2I9z03gju+zNJ7Ddho3d
	nXATPFDYTv5vnM7r8yXTn23upxbbhFbKBUFw5BnRlO8zc9++P1cAmd9Js6zaQb765A==
X-Gm-Gg: ATEYQzxLqdtt0SwuETbJRzMSsW9RlC/0dvzTT1zJM41QLJPGXx+SlVfkots6mSry6yF
	ZV2U6WySX2ZI0iGXiyWlkqphyuzQlw+ObIffdzRyHZYxOSEass7kh1O7iWytGJqDxd/qXwIIeBu
	8R0OhQBNI8aIXChJ7EzLQLlK4QCk5FBsmZrF8M2r96ihsc/kK86E2N/j0oXfr0wjV15sYCm+Alg
	VgVjgmCxds2XoDDzFuOqflqeRryx3l/syVYGzZSD7HADWsMWmmV00OUZIqasRYeckqVAZ4o0ext
	HI/DxywzPIXMULDZ5aWYEfR2R5qwQVLxC4+GSwKdiMHN907N6yjYpnvtyjF46uuz28lYtjMI7iV
	Q3CoGvAW7YEqNMO3hJzfaSJ1COU4f+Gbboun4yZ5LokVoki4PgBAt2RwuV/9WnQ9WToCTwoyWzp
	v2dOnkwN1BtUJZydoysykj5oAxNCMgZTkGGVVQTSxmLszNPX+oDNzxFSQFN8IptQPFxBBJTNnXo
	Y2+574WjhbXqz0=
X-Received: by 2002:a05:600c:5394:b0:483:8e43:6def with SMTP id 5b1f17b1804b1-483c9bf46b7mr199465045e9.28.1772445441451;
        Mon, 02 Mar 2026 01:57:21 -0800 (PST)
Message-ID: <ee815d76-1178-4620-9376-5a0533cbfcc6@suse.com>
Date: Mon, 2 Mar 2026 10:57:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/cpufreq: fix usages of align_timer() in the
 on-demand governor
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20260227073259.1200-1-roger.pau@citrix.com>
 <20260227073259.1200-3-roger.pau@citrix.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20260227073259.1200-3-roger.pau@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DD1881D5D4F
X-Rspamd-Action: no action

On 27.02.2026 08:32, Roger Pau Monne wrote:
> The first parameter passed to align_timer() is the timer expiration, not
> the current time.  Adjust the calls to align_timer() in the on-demand
> governor to pass the expected timer expiration as the first parameter.
> 
> Fixes: af74e3a15a83 ("cpufreq: align dbs timer for better package C state residency")
> Fixes: 382b95f627a9 ("Fix cpufreq HW-ALL coordination handle")
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


