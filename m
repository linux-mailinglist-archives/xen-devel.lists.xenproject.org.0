Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMolBiOJe2loFgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:21:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC9B219E
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 17:21:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216824.1526750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUlf-0003wp-M8; Thu, 29 Jan 2026 16:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216824.1526750; Thu, 29 Jan 2026 16:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlUlf-0003u5-J1; Thu, 29 Jan 2026 16:21:15 +0000
Received: by outflank-mailman (input) for mailman id 1216824;
 Thu, 29 Jan 2026 16:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlUle-0003ty-8o
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 16:21:14 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 868ef1a2-fd2e-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 17:21:11 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43590777e22so759738f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 08:21:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e1353ac2sm16663314f8f.38.2026.01.29.08.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 08:21:10 -0800 (PST)
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
X-Inumbo-ID: 868ef1a2-fd2e-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769703671; x=1770308471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vLkucR59sAdtvYrkMLt/05rHLLUs9rTlDgadaY7ykos=;
        b=DXygxX69Goa6aHQLjOk2mY9BezdmBFpmm0i1mEmW9sUVkdBXEwNiDz1zi6KeRfGUkJ
         DuQEfFqfdSSDZLR+BuANEWHjkhLIIk0l2Ohhd1tKFp/E36krwEz3Xp7oiaoHD6EfenJR
         LSJt+SpDYkD21DroxI9tmc+dQ+HbPzv1g8zhE6Igci1j8QkxwPk305pbMVyFWIMyTYAl
         XmBxfntKoFiLougbJ1jMWCQqeYSPZnC1qECfUCwZPa389uPNrsGcBf7k3zmFv1M2i/3k
         UGAb7LDs30Zl1pLG4e3arXaXOo8Y0T+Iji+CtaDY5h/77lXTkefseC4bXhi8ZVBdlLBT
         ry1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769703671; x=1770308471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLkucR59sAdtvYrkMLt/05rHLLUs9rTlDgadaY7ykos=;
        b=cEA6aCsWAv3f/FfhDqBeMvnLWdIqbOc4dsNOx1KJXIuy0hvSH/jIDe8woDxFplYgij
         Wkd2WRHqPUyLTYyyO8cGFKVhbw/61au7zJ0QES7ow4bJLK1Xg+B33/Yz254ibqo6gJYC
         DaCiqhK2LXfjSk4hpa5w9shFlYS6lAPrd5oi9t7lSZ4n/s5t6W44cQ3djVWW2ZbhD+nc
         +s+rMOPXx1plCDMZPwZmhzsjlF7+Ee4s6FmZq7qXkfm5HSGgz35rTE8OflTWC/gKpQR7
         4h1PAmKMNu1QtfXADxkn5RG2ySDn2pDrQu5VBvQE6YSdU/KkzlqGLymaVqvBRM3oiyeQ
         vI2w==
X-Forwarded-Encrypted: i=1; AJvYcCXdwuofFc4FdzRquwdvidlh7HzE/rb9lj+ts8oP+dprZm2rclnYkQeMjSAzdkUvIPjrRCM9iTvoBJc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1oOa+Knd14QYLbi9oES/Kufkvq9M0wMZJtPZbsu6IbEp8a2iZ
	3sCNmjYD0J8VgIWonWUyGChuvI1aJyPAPp60UKNzd4Coz7UllTKYvDRMvsPsNEIMFw==
X-Gm-Gg: AZuq6aKn+8ZQmrwPeAMbko7UJakLs3/MZIzOMw0eY7QO/WGvXaRIZkeLDZT1X1kUTp5
	iZO9g5e5/PZ5Ia4N2cg1i79PnPoSz/18G9mBGkW4FIqEorCSHRrvoBsRa8vQX5SCTEw1atMu9Og
	EKX4QerPWMmXg8j8hp85UxEP7qcNV8avDWQRLnjgkohhnnhif6WLroLfM8drOUXvcrYdyFjiieC
	9C6mNCxeCvUX2bnDKFvxLyc98r4/WK07UUaWGkSgAR8OqwQ0GuXQubsROlfmWfU71QikTbaRILQ
	9Sb0/AZ9iLIEzASg04H+pRw1+GqH4KZHKHAP/+lzm1kcLU046JoRaN0pJQCobdF6iEnfc28lo+n
	RIFz5/kzdmDvOxdm6vlU7bD8sPZ+AKBTPHwrC9k+kN4VGuzWkRdLe+S8yaxcX5xtwdWqSm/XYwJ
	p9NBAsCt8h5w5A6eia6D0JVWqAdJ0c1idxVhnqD+XEoKHS4HUnixrff9dBpVRs+il25vtd+WEnv
	z4=
X-Received: by 2002:a05:6000:2304:b0:435:9cd5:bb2a with SMTP id ffacd0b85a97d-435f3a7449amr228678f8f.24.1769703671192;
        Thu, 29 Jan 2026 08:21:11 -0800 (PST)
Message-ID: <1308a872-dc7f-4e0f-aa9e-e9d05af3d135@suse.com>
Date: Thu, 29 Jan 2026 17:21:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/5] lib/arm: Add I/O memory copy helpers
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com>
 <c1d8b28fffd3380bdf914526f6934a444be5e75c.1769696107.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <c1d8b28fffd3380bdf914526f6934a444be5e75c.1769696107.git.oleksii_moisieiev@epam.com>
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
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7BCC9B219E
X-Rspamd-Action: no action

On 29.01.2026 15:16, Oleksii Moisieiev wrote:
> --- /dev/null
> +++ b/xen/arch/arm/lib/memcpy-fromio.c
> @@ -0,0 +1,56 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#include <xen/io.h>
> +
> +#include <asm/io.h>

Why both, when xen/io.h includes asm/io.h anyway?

> +/*
> + * Arm implementation notes / limitations:
> + * - Uses ordered 8-bit for leading/trailing unaligned bytes and ordered
> + *   32-bit accesses for the aligned bulk; no wider accesses are issued.
> + * - Only suitable for devices that tolerate 8-bit and 32-bit accesses;
> + *   do not use with devices requiring strictly 16-bit or 64-bit accesses.
> + * - MMIO must be mapped with appropriate device attributes to preserve
> + *   ordering; no extra barriers beyond the ordered accessors are added.
> + * - If source or destination is misaligned, leading bytes are copied
> + *   byte-by-byte until both sides are 32-bit aligned,

Which may be never, which in turn may not be obvious to the reader.

> then bulk copy uses
> + *   32-bit accesses.
> + */

It'll be Arm maintainers to judge whether these restrictions are really
going to be acceptable. I think I pointed out more than once that I
think these functions end up being too-narrow-purpose.

Jan

