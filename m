Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FvyJIzveGkCuAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 18:02:04 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9BE981D6
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 18:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1215088.1525340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkmRc-0008LT-L8; Tue, 27 Jan 2026 17:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1215088.1525340; Tue, 27 Jan 2026 17:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkmRc-0008Ie-IG; Tue, 27 Jan 2026 17:01:36 +0000
Received: by outflank-mailman (input) for mailman id 1215088;
 Tue, 27 Jan 2026 17:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkmRa-0008IY-SO
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 17:01:34 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3d421d1-fba1-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 18:01:31 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42fb4eeb482so4048664f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 09:01:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10edfccsm108541f8f.17.2026.01.27.09.01.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 09:01:30 -0800 (PST)
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
X-Inumbo-ID: d3d421d1-fba1-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769533290; x=1770138090; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1JCsxWW78A37DUn0wWBZdLPK8yHg0Uo5kslgabp20d4=;
        b=GYXyLv7c5Sc5ij+7WiH/gzGV0VDqwR5ZVLL7rLshNfmcqoP/ffAA6y4bylJ5RToaHe
         6eM1yIy2HQrE39rNtK4Z7nHb+zou9zPwifXUnFyElcTgHO1UuTYVeqxdR6R/60eR9yvY
         OksDZtfY6Z1x3M/rC85wPtBxK5xiMPDHSHSQY1On9oOL0XRmdUj7xCIhPDtesbCE9TEG
         Dm1AhOOi+TsNk1d8j/MHekgVUUcqEQpSjMO8jagNZOL22SuyT0NnR3+z2NIJUgw+fZas
         oXnkpYmvBxaKKfrH0RFE+V7uX46e8o7HPK+8xn31mVSb2dU1tRyzmszXGhVUvvxHoRUN
         2SyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769533290; x=1770138090;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1JCsxWW78A37DUn0wWBZdLPK8yHg0Uo5kslgabp20d4=;
        b=k0K4fy2YMY++4mSck9DEHdb3s86GDqoLjNIcP+/46meY5JXB9VZmIm+/kxejmLGMGx
         W2CW9pg6bj7+5VjX5hu81RUO75GbHHjcAtffDwFCpNX/ipTXU1Watk0oHdIV7KJZ/k6q
         ARAKSuryhopuO7a/7Vo6y1aqTgiacSvTR+/MoQdxEry3vvN3di4VOTWZ9v68FfeUoXDx
         jBmnMb3oO567zzEhOTdoMgu8BultA7+WHLW7KhfHpAO4GxjBtMfbnL4d63FOTium1qt+
         nh6LOoXlw9Ke0rkaPt5SGJocPDepFPJMXtpQbmAntxw3akmj4C/X8o3CPo945Km53AZR
         Ml4A==
X-Forwarded-Encrypted: i=1; AJvYcCWw78QAi3N45BD+ay8CRFM6pOqrMfjeN72NXl8+cM3ihyuci7zUOoGdhtcfqa/VE55cgP5fdLLFg4Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzSFsznfnExRzjVXO7fFqKCnFINgcC7K1jspTPdNaZWOaRi8MlQ
	dAx+n1ZTrtAtEq26p3JnJz5nRL8m32Iat55dl1cnEgBElcU3I1IrA5pM2bXJOkWz1g==
X-Gm-Gg: AZuq6aINPFxqHYfg4oIbovJQuDo4t0vSOY5/PlKcpsdUcXGWIEfewPRbp7/R7aPHfj+
	rP3UXZGRLqoyPRm49d5v5HxIDWn3tnHPXKgrx8pqNUMMzRBTCK+KO08Yx9gpPo3+iD8x5eyIiSv
	5sWuNdXtanYM0LQNHbvhHXot8ESO4nZHuLnnRL6jp5Ivmxq2ZbHSl07c4+UUiaPdG4fM+eNR/0G
	tXvePhYe+7Rbn7a1MiubyofgYNrabWxaSlAacawc1h6S0MuAThwxZvhENwwBhDCCGdEYOul/D82
	4zK7THFTH7wJXnK2I0ARkI2UT0g+S0gVp5HR4jNuD1waG165qDJc9o7ee1bDJh3KFxHWIFZM4TD
	jwdzNuymuaUybCePiOmp8kkOBYSEZV8Oa2rppC+ikXD6DyOmpqzP7EkgVa9ZZcLvOM1ug7MXPYU
	1mP1VYbjCZ5hAQ6pR5mC2KfFluu/EjzmcrjUoayrJm6uSNsNpRr0FIY/BEu9/rchq8BosqVqViG
	IU=
X-Received: by 2002:a05:6000:2209:b0:432:a9db:f99c with SMTP id ffacd0b85a97d-435dd0b68bfmr3604219f8f.31.1769533290524;
        Tue, 27 Jan 2026 09:01:30 -0800 (PST)
Message-ID: <18aee854-2e08-4a45-9df7-1c622136afde@suse.com>
Date: Tue, 27 Jan 2026 18:01:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/treewide: More typeof() -> auto conversions
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260127101841.2213758-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260127101841.2213758-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[andrew.cooper3.citrix.com:query timed out];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8E9BE981D6
X-Rspamd-Action: no action

On 27.01.2026 11:18, Andrew Cooper wrote:
> All of these are simple cases of using typeof() to avoid multiple parameter
> evaluation.  Using auto avoids multiple textural expansion also.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


