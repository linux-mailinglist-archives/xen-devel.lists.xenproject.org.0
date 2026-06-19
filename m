Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Pu6LKCriNGoKjQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 08:31:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D326A41D6
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 08:31:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Ck6pA6ql;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341713.1601983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSkW-0000pP-O8; Fri, 19 Jun 2026 06:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341713.1601983; Fri, 19 Jun 2026 06:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waSkW-0000nA-L3; Fri, 19 Jun 2026 06:30:44 +0000
Received: by outflank-mailman (input) for mailman id 1341713;
 Fri, 19 Jun 2026 06:30:42 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waSkU-0000mz-Qb
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 06:30:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waSkU-00ESX4-0m
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 08:30:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a34e207-5cb7-0a2a0a5109dd-0a2a450188c6-30
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:30:41 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a34e211-e031-0a2a45010019-d155802cb4bb-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 08:30:41 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso21930885e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 23:30:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923ff821aasm44804995e9.12.2026.06.18.23.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 23:30:40 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781850641; x=1782455441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb9HBU+iwe98KKhLGO8M5bAsJ4BmR1MklTOVn9NABS4=;
        b=Ck6pA6ql5wAKUVciH+UebIZJayAd3mHVGL93ZkRpV7zO1R9WT5wG1ts0nwdsEDChJU
         WTmULKmuMQTLAYC307WIuj5wE7b1/SO0Dh3uIA9KyS5tqh6vqg/YkXDy5r+JwBMfvqdd
         Rh0P94mujhj+Ll3qcm9IM+mKHs1JiEh5NWLqIylSQ0F0W7YJ5Vkv+Y/A0uGp0oJd+l0l
         WvTE2Rp9rq5NPwmYaCtwChf6cb8U76yWhpgSkma5TbL5SxU3pErAZLLI8gp1kc0Xggx2
         WdVY7o9AhPD3BD+uenlG9d836wK9f2jCN9F3x8oBV8L47y6RgpRo58cTKjEdV0A+k8oL
         eNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781850641; x=1782455441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xb9HBU+iwe98KKhLGO8M5bAsJ4BmR1MklTOVn9NABS4=;
        b=hu/xIe0nsecTTvdHPmQ5LKtFVPcX11BJPVNVGLhdezojW24uMHmjffOYR9UtIjChPt
         RQTAOTZBJ2y2DPMD0bGz7XPhEnbcQuz+/WAX1TDsYKxlmCsLW3VlLyF31O/bo2TEe/Dq
         DabxzsDeow37Rx1lIGaf+M+h7gYLNLIypN3PmKxeJ7/xQxMyBuQBloGyaUX2YJekN4m9
         4MyB3SvtUSmGwR8HS0P8HXsa5vhRgv/NYkCPy2STUNvCugXkKYRE3+awWKbWZe1op1Vt
         eH3eWutzp5wyxT8Tz7IOjrLCczSNW/LOE0my2fkp/eiCqAFYpskOHPabpI/OuuUc2LUR
         c1Mg==
X-Forwarded-Encrypted: i=1; AFNElJ+hbb0AvQWZECHwb1HuK7KpCGTZhdRAVHSA+VsEHeBFOQx2oT/8SLlVTzmm4DaxI1+PuGSGkSREC2I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnjauEGhwrFz2wkGZdhy3lGUGFx7Gvx0NYBhpbI1qwKy56OF3P
	XTQOFoZgFG30uvpRLhpiQJxk4QINxnBN7FxwnWnsAbxmprK+dYY3SyT2GC90h8ZHuA==
X-Gm-Gg: AfdE7cna8E1R4nO//CotzuxR8jdRPk+oWywqGHDhRyHdE24u6VjVfU3ptlYw23wQN88
	NYVcp7qgMAL5m3V/cfLkVCNVw+ees2BLxwripQhVkSBmAekzm5YZwIfZrc4EzqUeZ3OrD+hEhyl
	6UGoI9egkp/kHr43R7j60cZf7zLqla/6rTSoplAlORN4lqBj8XLV35bkSt4fyUwLmryXUKkmt7l
	CcPnZNDUj1d72S3FxXd2z6c+Fq28kpJr1YVxw78ER6GGq6zZsCNMUn3nxYlnPCDXs74iCiz+fb5
	h2PsqrOftIukZR9qklfw0ymZwQ0wp66MtLGqcepCdT4aj1iY2BBY2Ix29ZMkErNwE0OjpKaMex0
	Dzo3DsOkETGgcMtYd94Vjeek8dWqdNuLAQlq0G6rCOlMdbmPbHgxyA5uvtPkln9SStKKOxBc1G8
	DAtlTjwZpU2pkwmb5oxQVlcJDKPSEW+lFOQIIPKIijHxMbFCyGfSf05TiX8NjENVfqh1veGqih7
	oJ5
X-Received: by 2002:a05:600c:4755:b0:492:25a1:e2f9 with SMTP id 5b1f17b1804b1-4924257c2bcmr15421535e9.26.1781850641443;
        Thu, 18 Jun 2026 23:30:41 -0700 (PDT)
Message-ID: <146adb19-5424-4daa-8680-a638d6f327c1@suse.com>
Date: Fri, 19 Jun 2026 08:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/15] pci: Allow ommiting func when parsing with
 parse_pci_sbdf()
To: Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794553.8631fc262581453bbf619ec5b2062170.19edb3b3fcc000701b@vates.tech>
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
In-Reply-To: <1781794553.8631fc262581453bbf619ec5b2062170.19edb3b3fcc000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781850641-CE9ADE30-ACF2DB0F/0/0
X-purgate-type: clean
X-purgate-size: 419
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1D326A41D6

On 18.06.2026 16:50, Teddy Astie wrote:
> Allow parsing PCI SBDF with the function part omitted (i.e XXXX:YY:ZZ),
> in such case, the parsed PCI function is zero.
> 
> That allows us to now use parse_pci_sbdf() in parse_phantom_dev().

Well, yes, but everywhere else the func-less will now also be accepted.
Like omitting (defaulting) the segment this behavior really needs to be
caller controlled imo.

Jan

