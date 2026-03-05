Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AILFIXOCqWkd9gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:17:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A8212857
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:17:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246622.1545737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy8Zs-00026P-D7; Thu, 05 Mar 2026 13:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246622.1545737; Thu, 05 Mar 2026 13:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy8Zs-00024x-A3; Thu, 05 Mar 2026 13:17:20 +0000
Received: by outflank-mailman (input) for mailman id 1246622;
 Thu, 05 Mar 2026 13:17:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy8Zr-00024r-4Y
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:17:19 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c965f1-1895-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:17:17 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4837907f535so73166405e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 05:17:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851ad02eeesm31850625e9.19.2026.03.05.05.17.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 05:17:16 -0800 (PST)
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
X-Inumbo-ID: a1c965f1-1895-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772716636; x=1773321436; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qK3hnvp7XcWP7iJlZoXczRJnMIQA61rlvrgs0O3Qjro=;
        b=gKKqwp+mOabgy4sSe+9qrU1Hbao1myN/FSO2a0dOGXI9e5oxy/kPsvNRX7UvYsq2jW
         /WbSCqv42WD8j7B190uLbKvKy/KQnYJqj9E4Rtfcu8iAcZo7mockcUNVgdbqjN/e+Hu6
         sX1kU6vtoS/pKjrYPW7SFNDR6DxGD/IrnDcOibdL4OGqPywefhlMz/7WluMK0sXJcMOv
         04Ob0Vv/dUpmweeZii5WD18fSJy7a7/58zRZA5Wh3HFDmLpphuhr4lpSSum7zyElB37C
         SquYnH6st+JwPVrG3YulAjiVPs7mp7V/Vv43Wx+VbZvD5V5nFkdZ3CCIO+jeaQzgsL+9
         Ppjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772716636; x=1773321436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qK3hnvp7XcWP7iJlZoXczRJnMIQA61rlvrgs0O3Qjro=;
        b=oIy14jx2G2dGL7eGjGXdNDYCqNuMQBCNGTFFNFqrZfi7SiwhIWfMqthLIXk5rnE2ce
         tsNrx/r/+05bhXf8+iDHof0DzRV/v3FXS2l+wTzW2hxB9KyqtTN6tYqqagdUtiw28Ae7
         omd0SfoVKF2XGxW6/iJdzmSd10myXiUoZ3UZFirDpkVbVjuRLkaZNG/dhDiEtT6J8faq
         U558MtmEjaEGKx9gUAValHS+YpWQ/W8gVbcC63JcUXVLxX7XPKu0M+tDuy11aU8OMcLb
         Po4uHTbDfLkwkbEqmjpOXHcStq12U0VoNLhoUCqmriBlHY3VvD1Sky64mmjr4jzu7/Nz
         vi9g==
X-Forwarded-Encrypted: i=1; AJvYcCUFYxTghbtCH1bWZlZ7AZSFTKrgt0XSQPQLEpSIvtGydSwS1uiEjPW8L9e1cXB19BurTbSzfIhxvi8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVO8glfxs5xlJ22JHo6RYj5qzUdP7nwchNJ7+X2lL2uq8SUVnK
	2Rl3A7z9vdbuDDK1Xn/kvIswJQ1ArgF7HbmhvlMUtEvjy791MBTb1Hx1l/yEi40PGg==
X-Gm-Gg: ATEYQzx+lZTdcVh5R05ibQT1E+Khbn0bSJe4Yuq0f7jwZRhsueIb5LKkvclOrTKKqg4
	UYMXrg64NT5FDKkiW92qhNeRXglBRBUuCrnFrgwvORuKIfdBGvXSRzzNm5Tp7BKkqHW5Gm12ijx
	y7SjqquMu5mODulT5lZyJNRx27b0XjcWhTlkq1uuesvONnNUBc7UWZvLRwygRjOxqc15sbBjju6
	ioBltWTRVrO6QAQH3g7od956RWBFAqXmBFXc3oxRRlJSmGYkoTaHCCEuh/Pyp1Uo2KZdBX+Ttvb
	WKswct5iWmuP0GFGU11QK5G23ippuEDR3im7L1YTzdUxAfvEOjQccX8NAkRbYGNZVe/ZxLzdoot
	hTK5bkttnJeBkF27Q5AdottaxfBchA8lK9jsW/IwCL8RSznE17mg4oR9AmYlakGcPwX4Y5FduaQ
	gpU+VMPAeJXWGcQXzLCTj24WxB1k3Jx2eEgsuPFIedolejVWcK+epKs0ikq3Hb++NBp6ID7h+jN
	CujDyazZVT7ydUySbSMcnozCw==
X-Received: by 2002:a05:600c:6098:b0:483:7f4e:fef6 with SMTP id 5b1f17b1804b1-485198899f3mr92595195e9.26.1772716636352;
        Thu, 05 Mar 2026 05:17:16 -0800 (PST)
Message-ID: <6db8d016-974e-4772-b0b5-ff5dd24ba6ba@suse.com>
Date: Thu, 5 Mar 2026 14:17:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] This patch just changes indentation, to make the
 next patch easier to review.
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260305130434.635276-1-julian.vetter@vates.tech>
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
In-Reply-To: <20260305130434.635276-1-julian.vetter@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 285A8212857
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,vates.tech:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 05.03.2026 14:04, Julian Vetter wrote:
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v4:
> - No changes to this patch

Not quite. The original subject (which already wasn't great) has disappeared,
and what previously was the description is now the title.

Jan

