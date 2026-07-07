Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NKKjJBK8TGquowEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:42:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A2719436
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 10:42:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ShKOYCrr;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356098.1610754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1O6-0005aA-Kd; Tue, 07 Jul 2026 08:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356098.1610754; Tue, 07 Jul 2026 08:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh1O6-0005XS-Gz; Tue, 07 Jul 2026 08:42:42 +0000
Received: by outflank-mailman (input) for mailman id 1356098;
 Tue, 07 Jul 2026 08:42:41 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh1O5-0005XM-KJ
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 08:42:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh1O5-00CWdJ-0o
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 10:42:41 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4cbbf3-2eae-0a2a0a5409dd-0a2a4501d21a-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:42:40 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4cbc00-400f-0a2a45010019-d155dd33c969-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 10:42:40 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-4703bc0a99aso2140433f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 01:42:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b0cesm32351928f8f.22.2026.07.07.01.42.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 01:42:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1783413760; x=1784018560; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=33srYHAgtAZ5OP9oP4Ikaa1rXcLuMVWWuKsdD9qT87g=;
        b=ShKOYCrrECO36jAOtiuJVg6MqTpJmf75WW6e4oXJuzWIsCfdRFRiCKuXYabO9oiZfR
         mIz5wSDIUF/EbWYbUt6S1CORjzLKglY+hQqGyCd6dmzdP8s1l6Wq6fjTFxzi8LWElNkw
         wNWMsdy2CWWGG87eYV6Kqm+RQ3PpdPUYquHC8RTeW9I5Zp7LW35moDZ/cAzdXQXa+xlm
         Vk2aWmvib+gUmmyUFJlW5MqFm/kRt216vtCLpvu2T3B0/Gy8TlEMgVJlFyKu2bjPFC3m
         i7+XWkdqCYajStl6glBC5fUmP2/zchKANJ0ycDAg8VSItXX3Yfp8++jY1mRO68GnXabL
         aCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413760; x=1784018560;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33srYHAgtAZ5OP9oP4Ikaa1rXcLuMVWWuKsdD9qT87g=;
        b=ce651kGlV1h07u4HAiq6+5fbSia2I1wnraQyDYiPQ2JZHPKSdrqCnD2rq3DkDvWpW2
         W2Va+yJL6SrPhmRZeJpGjv7Fsz5946TCGftLb7YOZt3HR9PGgR3D7vILAx+szNvgexeu
         1yMbnvRgitqyBYnJPgP/gQ3sXz8kvsHOpBDNJ0hhJ74zyvoKqO8vaX355JY7CSeZjSBi
         mLGJw0+zxN/OFxL3bVPjr2uAdcvMkOjSOoD8WqIX6PEcq7tkQfKHaG/9DMdqE6ARFgWQ
         9o1CyWZTBJe3rQptJOcQr/2D7eipI6r1tNwL5d8kJ/rtutD3CUEx9VcezTYlYFwlWQF2
         NWfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpT97OX/jSHCG/kNTcuwEaHjROdRC+UW0KJOprJKFYxBrrvU8X93oNGDMoCv4ejzX4MVFguO9ppnZY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYlbo4NQv4Fy5MfecimzfNla9tabmghffhLbnhHSJ331TqbNDq
	kSDOVuQ/7PZJHRxo8hAfZUZGRfFFQxrqYOhTg2YXPRSQNBskdqaWe42BYR/rYBTAxg==
X-Gm-Gg: AfdE7cmlTSh24pOovoLUPdDAzLRdRVw7SYXMs4ptLhDRp6ePvb6VkDQGuMzrMKapTIj
	Vb/lccwl3hw8Tq+tDIJQoD6V6ZTjCgsDOXsf81qmRtn0/HiozYohVq7IZq0ZIDgXe0nEN6fXqg3
	g/J67XdWOAO9Iinjw5d7rzqTEqdBHEV8kpr3fD8PkI8CtdA5zppMwhgHqztovhh3M5w2gMa9e7X
	7DaNnkOxEkwcV0I8Furhwt0wby/2GL6mSby/vyY4IRt4tThM55gD8m6eODUm0L7ezj0zTrPI2t+
	2J+1SXyyP3r2gGa0d1QiR/ng9oTiZEW1xm5S1tEJyNWc20KKDcgtrVVZqVTZi2NfOi8bFBXsvrL
	IiZydEARcbiJYWsASGMvILImLZ0hxbewC0ZQxejVjwZvttAshAUoPKOLViUMYGPsJ3NvVsgP3Lf
	QdHwEuf8RhJ7RX4RiPJnqfqFMVMeiV7MWukywiACRgZihsgqwVEK70QqKvNkKSenixYZpSZ3D/0
	kj7
X-Received: by 2002:adf:e5cb:0:b0:475:f0f0:9efb with SMTP id ffacd0b85a97d-47de66cb332mr3518798f8f.50.1783413760271;
        Tue, 07 Jul 2026 01:42:40 -0700 (PDT)
Message-ID: <d3acd616-6ef8-4cb3-a1c0-b8955e0dc958@suse.com>
Date: Tue, 7 Jul 2026 10:42:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] stubdom: remove support for building in 32-bit mode
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 xen-devel@lists.xenproject.org
References: <20260707083459.226297-1-jgross@suse.com>
 <20260707083459.226297-3-jgross@suse.com>
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
In-Reply-To: <20260707083459.226297-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1783413760-FF0C41E0-3FE71942/0/0
X-purgate-type: clean
X-purgate-size: 516
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:samuel.thibault@ens-lyon.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:dkim,suse.com:mid];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 945A2719436

On 07.07.2026 10:34, Juergen Gross wrote:
> --- a/Makefile
> +++ b/Makefile
> @@ -146,9 +146,6 @@ install-tools: install-tools-public-headers
>  .PHONY: install-stubdom
>  install-stubdom: mini-os-dir install-tools-public-headers
>  	$(MAKE) -C stubdom install
> -ifeq (x86_64,$(XEN_TARGET_ARCH))
> -	XEN_TARGET_ARCH=x86_32 $(MAKE) -C stubdom install-grub-if-enabled
> -endif

Doesn't this belong in patch 1, together with the build-stubdom: rule
adjustment? Or does that other hunk belong here?

Jan

