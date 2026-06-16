Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mf9kNUZmMWoEigUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:05:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36760690C11
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 17:05:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=MoYBIum+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339369.1600557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVLi-00046R-6T; Tue, 16 Jun 2026 15:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339369.1600557; Tue, 16 Jun 2026 15:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZVLi-00044H-3a; Tue, 16 Jun 2026 15:05:10 +0000
Received: by outflank-mailman (input) for mailman id 1339369;
 Tue, 16 Jun 2026 15:05:08 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZVLf-00043r-VD
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:05:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZVLe-00HJnE-FS
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 17:05:06 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a316600-5cb7-0a2a0a5109dd-0a2a4508ebb4-22
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:05:06 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a316622-63b5-0a2a45080019-d1558033b91c-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 17:05:06 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4923139e940so4755175e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:05:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a58becsm64928405e9.7.2026.06.16.08.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 08:05:04 -0700 (PDT)
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
        d=suse.com; s=google; t=1781622306; x=1782227106; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IUHDRx5sZCfecbVAZ4LTdS/5Dus5Mzc9D7UD7FGHfOE=;
        b=MoYBIum+kd/6waoBH74VOsCYScZVcPbxtsPoH3mq39mPs0zAUFnlrH1CLyoN0JgyZ4
         CppX0pmmLPJ5vvNGLcfqkkhVEdXcmin1P8XYQBshZOiO+ZDiawlioDKhnwcGeU5dmDln
         X2HV/hVPNs2r26itgS4+AE7q4mIJ3kb7UVBDc8IuZPmZY1RY69d3qJI8aYy9wZP/dprq
         yFaF5Lc4uX8Kkp7WgnUNNzYpAC4rzqt3QFVsWVLU9hW6NZbT/ugKW3gu+o72WiZK04sj
         MapwNj1cFTINrHigpvOdOW3FsG4aI4g1RAQdZyVVRLtYXtfkw10WCC3g5/91BFU+Ul8u
         AW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781622306; x=1782227106;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUHDRx5sZCfecbVAZ4LTdS/5Dus5Mzc9D7UD7FGHfOE=;
        b=ioXCDA6Uc94WKOvN1WmstXwpJLyF5PRa081XnxEDjfJIEyKqcEmy5ac0ozyWvzU4BK
         f6blbHPOTo9MXREm5JdjgOAy6eXjx/9V5f5IXc/VcNcquBdXiVncIy8sPYeun/sogFL5
         5FpQlU3nwFaqVzYhIgaU4kA2PPi0i7GKbhorIHPBj6wGPZvKRwZhnwLZxjIRGvAZ3Ksl
         JVabMg250uwQdiiqFkEHPGL5/LYS50r89xZnRfAeC1rldxoFfIUjeLjg4kdBoXZGvtS/
         It4/EdetA033Qmkbek4LomoI+Wn5b1xnprAfl9smXH+RWladpOv0GeqOFyTGtaHKfkYc
         AYDQ==
X-Gm-Message-State: AOJu0YxNrcBCojSZE5I/BFSYZv4b+Y8++EROVAGdvNEo22VKeB4pM7xz
	v9ZTandZJFxcZfNKlWCWTvejcgfQDNtSlpJORmeLlP/FawKiQAq3Jq9as1BApdBfIA==
X-Gm-Gg: Acq92OGW0vAFDWI7/e0dUR7skPkE0Z965wXklzlggnZqtRWp87AjfZGf0Z6E+lmi/p+
	bJ8iKaO3oalzb+JxBxd84g7oa8KeP2NtxSXoTQm8lqVqrhh/sGrwSlB/zK0qxlWhQqlsPpmqdNP
	k7Wu30TA/c26kpKu3gMWG6nuupui62FTuFiUHRNtd4sT0F5yI5Qfq7XAiApdLegvL4DQXm3TVtv
	Do6cfveqtOpW6wyPk4nFTj98ILB1tIhHGyfHkOxa40sBf9TTthiJ2fLHbpTaUa2HDE/GLYtZu6I
	rYihPDWGWSHVHLx8Y9bfckbssYq/mIKp6k/k47jmoL2tfVOmL246WWe6LTVpQlNQ8IYyPr54Gqi
	dLVOCed2Zy/u2+4ZBm9bTCatd2BRXVYJa5UEqNurnbG2+HtGE625N6GVETh+UwplnhPvae+laRX
	2w20LurHIlD2TUjJDFbsBqCiT7pLbFwelLCsCiG1xe5EX+uWy1taJ5e4fJO//WZBiks/7HcrSHr
	fzeNqBinuaVuxM=
X-Received: by 2002:a05:600c:4693:b0:490:d9d0:51c8 with SMTP id 5b1f17b1804b1-490ec504d3bmr308174495e9.18.1781622305641;
        Tue, 16 Jun 2026 08:05:05 -0700 (PDT)
Message-ID: <94c70306-1242-4d5b-bf1b-596acf9c96ab@suse.com>
Date: Tue, 16 Jun 2026 17:05:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA memory
 mitigation
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Frediano Ziglio <frediano.ziglio@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Frediano Ziglio <freddy77@gmail.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-5-frediano.ziglio@citrix.com>
 <ajExivEwb88pcOxT@mail-itl> <4c577b14-30ed-4fac-84fb-45d248e8feeb@citrix.com>
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
In-Reply-To: <4c577b14-30ed-4fac-84fb-45d248e8feeb@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1781622306-B5F6ADB1-B5325BC4/0/0
X-purgate-type: clean
X-purgate-size: 1748
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,cloud.com,citrix.com,vates.tech,invisiblethingslab.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,m:marmarek@invisiblethingslab.com,m:freddy77@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloud.com:email,invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
X-Rspamd-Queue-Id: 36760690C11

On 16.06.2026 16:58, Andrew Cooper wrote:
> On 16/06/2026 12:20 pm, Marek Marczykowski-Górecki wrote:
>> On Tue, Jun 16, 2026 at 11:13:36AM +0100, Frediano Ziglio wrote:
>>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>
>>> Currently .init section is both writeable and executable, split data and code
>>> to have 2 sections satisfying W^X rule.
>>>
>>> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
>>> in the pagetables.
>>>
>>> NX_COMPAT is a requirement from shim-review,
>>> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
>>>
>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>
>> Is that the last piece necessary to satisfy the NX_COMPAT requirement? If
>> so, I suppose a subsequent patch should actually set the
>> IMAGE_DLLCHARACTERISTICS_NX_COMPAT bit (IIUC ld --nxcompat option), right?
> 
> The manpage says:
> 
>        --nxcompat
>        --disable-nxcompat
>            The image is compatible with the Data Execution Prevention. 
> This feature was introduced with MS Windows XP SP2 for i386 PE targets. 
> The option is enabled by default.
> 
> It turns out that Xen is being marked NX_COMPAT even prior to this
> series, which is deeply suspicious as it has an RWX init section.

The defaults used by ld are (imo wrongly) driven by Cygwin's / MinGW's
desires. They apparently assert that all binaries should be NX-compatible,
with merely a way to opt out. There's no dependency on section attributes
afaict.

Jan

