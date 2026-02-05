Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0A8QC0eNhGl43QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:29:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75010F27F4
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 13:29:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221881.1529993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnyUO-0005up-Tw; Thu, 05 Feb 2026 12:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221881.1529993; Thu, 05 Feb 2026 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnyUO-0005rk-Qo; Thu, 05 Feb 2026 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 1221881;
 Thu, 05 Feb 2026 12:29:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnyUO-0005rb-8m
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 12:29:40 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 568f0848-028e-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 13:29:38 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-435a517be33so603435f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 04:29:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25d47sm12768796f8f.5.2026.02.05.04.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 04:29:37 -0800 (PST)
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
X-Inumbo-ID: 568f0848-028e-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770294578; x=1770899378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SdwYGtLjUXWh0XRk6hbrZPL5GVOTinEJ2zSbhki0S5M=;
        b=aY18VfTCrDLceH+H5CYc0UAB3vUuvkg3ekGmj6IN91vgBAe0oUqh1o6pl78lv28IuB
         uxTrgN+u4gblxmmBu5upzPGDVBStm7r9tr7wQ1dHsOjFyQVuqZFDvYgFTaEmTsmTUPXh
         cItVXvF9Xs5fAGYEkNB9xCEh3vJsB6iv2mBnJfvxgq/67DrrcMOTVhI+UAWHwvnNh1V5
         BoIreyruu6C9uUPj+ONqi/sn7ohG5qgcl4mqixEPzeV4eMUwXoXH58ogq4mEXZCHRBZt
         +HzXomAIXySk1SwTQI/cucUowgzgzFcKx1QgwUCiuqvZJvfwI91GZEIjQVovdGM6waE0
         DY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770294578; x=1770899378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdwYGtLjUXWh0XRk6hbrZPL5GVOTinEJ2zSbhki0S5M=;
        b=dEgDo0VVEq4nHhJ9WZ8sPoyDn3cKUuw7a7gW1tY2XdUqyMyWJdHfdRqFoefI0i1UFH
         6CaNhVbp31fIFE7hUwmBshioaXtikGZUeEBIUS+LyXTDpXZVgY7oBVJObyn/X54q/QHz
         1adckUxyuK2/h5ZEJmAtv473ACMKgYb89wHmlVyAzvw8FTeKpUTz0R7m2DkF3mToAqk6
         cxTy1vnfMBCTJSg/wh+qePL/h76IHN9omtNiW8uq6dLVyMS+m9OHPZa4bgWhg5dKesnn
         eDoQFryld0pOgnoPwMYj4/UQKB0QEF4Y/6fBO70NH6UHCf3bXAh8Niq5F0dhl2kyK/gm
         MIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJHDGN00iDIti/r81dNUKWkBIEWafob1cqXUho48ewa3DyFHXxjwglSpZ9HWRjwZB9R3XoQ2Zy+50=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7hAUvG7wYf/vxNNK+czMFRXUjgf/U4LoPufeISSxchNHPcvQK
	nd96pcwnLQo4bdsmhoQs5crQLMm9buD+7KyxGgiSu0TTjMXOXnKYp5PywRHeafl8tg==
X-Gm-Gg: AZuq6aLiTRblYWg2LBI6dex/L0mr5y8mRoOb9AWR+Du1UTyZXQ9wjtCg32rHz+V1YLK
	7unEek96s8L5VNAoT7C95/SvsUB60czhTYCQbDzWk+xMsja114G1M4DTJagWwa3qqoe/LNuO4fZ
	cr8TVXThodG7+5XRgN3uj4gf6OjIbPJGVTBZI0BfCt8lYGNm1qe8T2y5yNB8rmag6L8wwMI+gZo
	VCPbT9GXw+T2RpYBzNHNaq25wPX9Tj66eJyBoCOmXCw8T3TCHFGy+4Lj4IjT/YRvDANu7tPixzJ
	6uW13BOs7VIenqskoj2TP22LjC/iWVrypdt11/kvKi8FzAbJX2xNnl6CNV8W7eRVtA5yXEYV+wt
	guNuD5Chx54sT+idZKNdV3Guvu0GDoqAYdy6wuApoAdxWHbWhF3KpZgNTQWuFe4EV2qkyQY4nAu
	hU5kkiq2tyEgYt1vwSYThkpBl+mjR5i/hzthL1fE/eFieaO+DN9e4thdnjEs+6N1OI4YB8sYnSf
	1Y=
X-Received: by 2002:a05:6000:24c3:b0:436:15d3:ed3a with SMTP id ffacd0b85a97d-43617e41e0bmr8965346f8f.17.1770294578092;
        Thu, 05 Feb 2026 04:29:38 -0800 (PST)
Message-ID: <7bf2ee2a-177f-4d7b-9dde-ee43bc4311b8@suse.com>
Date: Thu, 5 Feb 2026 13:29:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Add macOS hypervisor build configuration
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
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
In-Reply-To: <d30deb8fa22291beb64eb179e8e2d55d13ef27dd.1770291000.git.bertrand.marquis@arm.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,darwin.mk:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 75010F27F4
X-Rspamd-Action: no action

On 05.02.2026 12:33, Bertrand Marquis wrote:
> Xen does not currently document how to build the hypervisor on macOS, and
> there is no Darwin configuration for selecting a Homebrew-based GNU
> toolchain. Native builds are not supported; the hypervisor must be
> cross-built with a GNU toolchain and GNU make/sed.
> 
> Add a minimal Darwin.mk which selects the GNU tool definitions used by
> the macOS workflow and point to the build guide for required tools and
> setup. Document the Homebrew cross toolchain and GNU tools needed to
> build the hypervisor on macOS.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  config/Darwin.mk            |  6 ++++
>  docs/misc/build-on-macos.md | 66 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+)
>  create mode 100644 config/Darwin.mk
>  create mode 100644 docs/misc/build-on-macos.md

I'm sorry, I should have paid attention already on the RFC, but: With all
other Pandoc files in this directory being named *.pandoc, do we really want
to have an outlier named *.md there?

> --- /dev/null
> +++ b/config/Darwin.mk
> @@ -0,0 +1,6 @@
> +# Use GNU tool definitions; the macOS workflow relies on Homebrew GNU tools.
> +# See docs/misc/build-on-macos.md for required tools and setup.
> +include $(XEN_ROOT)/config/StdGNU.mk

Given Roger's consideration towards possibly using a more MacOS-native
build arrangement as an alternative, I'm actually not quite sure this should
then be the default mode here. Roger, what are your thoughts?

Jan

