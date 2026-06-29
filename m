Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rl2MKVh6Qmqw8AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 15:59:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5126DBA97
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 15:59:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=cHHVZ+kT;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347543.1605378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCWO-0003nE-PX; Mon, 29 Jun 2026 13:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347543.1605378; Mon, 29 Jun 2026 13:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weCWO-0003ky-Ll; Mon, 29 Jun 2026 13:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1347543;
 Mon, 29 Jun 2026 13:59:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weCWM-0003kc-PW
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 13:59:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weCWL-00EUer-Vq
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 15:59:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a427a44-e002-0a2a0a5209dd-0a2a45069c82-6
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 15:59:33 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a427a3e-08de-0a2a45060019-d1558035cd98-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 15:59:26 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4939a809b24so17302115e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 06:59:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46fccca2781sm25106431f8f.6.2026.06.29.06.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 06:59:25 -0700 (PDT)
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
        d=suse.com; s=google; t=1782741566; x=1783346366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TPq30F26DglOYifH133fEaqDBp9d1Y6CQhm8mCQ+dhU=;
        b=cHHVZ+kTBpVMzTGlZxaI3YVKBL1/+fqGlGrk12GlXIFod6p0K5p/yXxe8WOCMw1Zpe
         8aHRrPJo4Y7G7pbjE+wqxhJblcaV81hHwgqhyrmKog2vDVPxPTF5iAD3iTkq0N4UGQ+U
         EvVG1iWREKDN26JI4963mxVmKiTcTEcZvhsTU2kO6/gnNHyRX9Z5Md2orBfcWLvEvnMS
         BEpZbefjJ92aHSCWUmrBkGSG0If8UnPnk5A4hsw/pzgAgDxfaTumN8fZp4by26qcPbht
         LpSecUxVTlP1dDfcKkv6xol9Zj/0+YqgOAaSsKR/mwRiEhgl8Rtpg9d/jl67W0M9WAQu
         JjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741566; x=1783346366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPq30F26DglOYifH133fEaqDBp9d1Y6CQhm8mCQ+dhU=;
        b=i2wCUozuz+EIOnd14S8JW7yS+kSAXXglIMXeuM0D/Li6hSc801jiEUIgLdk4QJzn8K
         fiIJWAygrXzI1daKzDhHYc3dErkWekSpMFV3XDAJ3l3teKQ1/v4sgTffrkbvvfoDFW6D
         u64qenlEnblou6FJDYElyGsvBLPxvM93LEBon1PHcWe7Yb/sB+pAIJ2A7vNJExPe8+RO
         tk52BKZYu/duQx483aF0WoNxprZ183YV/5FncsCMK2b7shgeLixtUJajh2nnrlqKtACI
         AQy6xasvxCR7gI2cyaqbYap4zydhsO/HZmJvNZl7SE6iPkqBzh5vC1mF0DJVUXgBkumT
         p/LA==
X-Forwarded-Encrypted: i=1; AFNElJ9r79GqT9v3mT76w9iDN8bE6sPunqQkXr1kVZFEtHSMWu+P5Tp7uA+kqzDeadZL4Ob2cTyHTbwzhBI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyq3tnG2DuK4CoWvEu3H5gDOWg0XKsQvzgOIjUpLgYUUI46lwTV
	jPMqBxgVycZJznSvrABLTT3iKwXQ9iSZ9kukvUJw8drcJGpIxMjL9+Gfx7leJ2SP6Q==
X-Gm-Gg: AfdE7ckGJDuQoTkXmLVksYaW2KicicRGPDugJHd9YbFXZepewoUdR4nJNEdS0l7CPZD
	yFSjhrDR0Rg+uaXlDcoWQMnNwAncAqF/YKi1QRPUw9eKvB2reAkIEqWQofJsY06qnZFwK/YULvG
	2UzMvSiekkDqMHe30kSX8GVgqpyIyAjg+OMP4F14z/o0jkbR8IG6i9a1Y078V9/zvi0yRkA8mT2
	4mcyPJxei3kMksRm5rko0NaGsj/QGiBusDPNMcaKLO0u3OABdMNtaGn1yI9Zpl/F6p2Cd5wXMXs
	3NpgbiK/KS81ZifmHB++3IJMj6fYlS0Eagy+HdM2rLlabbQOQj3JyZ+sleUG1S5JV7qK+UljZKl
	aluobpzkOWaFm0+gLJifUYgSMygbfmP3g+f4vZ7J7W/dEZ/mZPGdfEibelsTWOO8XBVp7wQBdvz
	HOuOFeBe86LGXYPUKMdTusxsRRMFWsCp/dLscCSHaPsWGGdMSKdJ1r1FwkqJ0pV84S3dHANb1vs
	ko1
X-Received: by 2002:a05:600c:8109:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-492667ca5fbmr259564845e9.0.1782741566174;
        Mon, 29 Jun 2026 06:59:26 -0700 (PDT)
Message-ID: <103263ef-3f09-498e-a901-2d5379f8ca5b@suse.com>
Date: Mon, 29 Jun 2026 15:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] x86/boot: Exclude not used string
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20260626123645.229375-1-frediano.ziglio@citrix.com>
 <20260626123645.229375-6-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260626123645.229375-6-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782741566-4233E68D-745437A4/0/0
X-purgate-type: clean
X-purgate-size: 225
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@citrix.com,m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0B5126DBA97

On 26.06.2026 14:36, Frediano Ziglio wrote:
> If CONFIG_REQUIRE_NX is not enabled the string is not used.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


