Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mbtNHlZBMWokfgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 14:28:06 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3BE68F4E6
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 14:28:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=IYmQ2X5m;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339172.1600309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZSsm-0002hz-K2; Tue, 16 Jun 2026 12:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339172.1600309; Tue, 16 Jun 2026 12:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZSsm-0002fb-H2; Tue, 16 Jun 2026 12:27:08 +0000
Received: by outflank-mailman (input) for mailman id 1339172;
 Tue, 16 Jun 2026 12:27:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZSsk-0002f9-R0
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:27:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZSsj-00A1bi-FT
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 14:27:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a314118-5cb7-0a2a0a5109dd-0a2a45028f86-6
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 14:27:05 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a314118-af86-0a2a45020019-d1558033bd9a-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 14:27:04 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490b12270b3so27713645e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 05:27:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4a128csm426699925e9.0.2026.06.16.05.27.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 05:27:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1781612824; x=1782217624; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EYMXoJYnhyN4TOcvusH26Mxoa2+OwjqyMFrSeHmyVEE=;
        b=IYmQ2X5mo12l+16s5FpwkBhF//I1XTBYwOsUaF8ET2hUqyA4LvWz6NajHyM4dG6Ve3
         mYL9gn/xb6j4MlhbmBveie3Opu4nkBubPDkfyMOAvHLq6D3P2LcJ5C8c/XeB3AgZYM5y
         B6ihLC+G99+aOYDRt49nGkLOX+6NHFuoXdzwN7fXmb2iOf/JQcCeHKGn8SUB1bw7Kb9U
         dWBZ9W2kCZfaN8zy/+WRkYZLPTYF+dgeKPJDUzH4Ix8ay3QUGdDu6Osn+CSc3/7p/YIX
         hP8GcfKhLTu+J9eUlk5ksoKSDNteZAZVK+6Ae+PIdROZcPhXTzU7x7uPdoXOoXfWxC81
         Tf8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612824; x=1782217624;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYMXoJYnhyN4TOcvusH26Mxoa2+OwjqyMFrSeHmyVEE=;
        b=Q5ztJn+GaWbbZ1RVaCaEMTlCrun6kMsol2GjJ7FQjTYFWIYRDFlyIkETVXTMguLNRc
         vBkMWZEAOWpeSsyed4eukAZeRd8QxFKYEeK6eN3fITQNYo/ZaSuxmTf/2TgU9PeZGI3X
         Fxc0twFKi9LVZxg/b0FwAPG3e0IEPDKNqw4j6DmwdErvTiFpIHBzgk7mX9FudhF5n71g
         YE0LBR6jUeE2ef568XxSYFOnloOQpUc8k5uEiB9sk005dQGXH/jTwX2cLLk00scznkIl
         0gU/R11qDAO+n38WYjTKG8a0xl6xB8jhTdUfngjZk8SHATkVn0InTUypAhxSHpBWw1j2
         x1yA==
X-Forwarded-Encrypted: i=1; AFNElJ9O7dbZ4nNLTbM+ZIMfG5x2qflF8WQ9Mk6Aar6gkER7PoP4JJqK3rVAlNi6z6cYPL5R/UGrp9WC6U0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyB86zVwrlCH5Vst9v/YA07IVP2oSYxW66erH5KhBWBmGKbQyzr
	ccCXk0ztDWlqgMvldQTkpzdGkWqg9CC0CfnhE5CfoWwCzcil/WS2HM/yrr/kkdwvbw==
X-Gm-Gg: Acq92OFO87SFrxdbHYa2hHbtJXXMR9llj16woQ3NT2BGsiuUQHYIkZqfGfmY57zZP3x
	oFQvTa6owGaIV/LZz983n0ucEc/9aLyEagvpWnKgWrjdsVS+UZ8Aj/e10V3MrDWFfamGVo9+XvI
	rcwM9VRnXTx2ylKN6OAW9nPcsGYHgGVPoiE8BvdHv4xznsuwx5aJhWLgIUqxNhJ3hZkcn2A2gB5
	zYI5YmkH0TzKOdQYh7viiMJlKcQ/SPie1d8VXqQvwjteEErI0BGnwxlDIdPHjh4l3SUVC1xThEf
	rgvnj2ZfoTH/rxsIufSv3fmbDLhRreeIrAf28RMNVHzwYbDdWyPvRn15vUN7JbrAl+ArCfI1XlS
	ZStD5C7I3nGEO270jscCxszZTQx9OX+GA/cGWYpsoqI3Fub7ApHa2aIo1eC1i3v6QK9NsFicDh0
	jAMONprWGdmDoLi8pRwRDI3iONZ24rUBbXMv6MN2bJtR75U4Q3myf8ohY0LRcHEEynbj86U4GE1
	Kj9/7ZCA86VIdtt1H2yrnfnJA==
X-Received: by 2002:a05:600c:3144:b0:48f:e3e7:3d39 with SMTP id 5b1f17b1804b1-490ec4d523dmr259306065e9.11.1781612824153;
        Tue, 16 Jun 2026 05:27:04 -0700 (PDT)
Message-ID: <3506eb69-f057-4c0b-8321-03cfcc6dda2a@suse.com>
Date: Tue, 16 Jun 2026 14:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] Align relevant sections to 4KB
To: Frediano Ziglio <freddy77@gmail.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-2-frediano.ziglio@citrix.com>
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
In-Reply-To: <20260616101336.44009-2-frediano.ziglio@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1781612824-81D77161-73DE8CF3/0/0
X-purgate-type: clean
X-purgate-size: 1080
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
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:frediano.ziglio@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
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
X-Rspamd-Queue-Id: CE3BE68F4E6

On 16.06.2026 12:13, Frediano Ziglio wrote:
> From: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> Required by UEFI CA memory mitigation.
> 
> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
> in the pagetables.
> 
> NX_COMPAT is a requirement from shim-review,
> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
> 
> Sections with different permissions must be in separate pages.
> In the case of debug sections they are contiguous and have the same
> permissions so it's not an issue if they are not aligned to the page.

What if .debug_* starts in the middle of a page? Aren't you further
relying on .debug_* to be r/o (i.e. neither X nor W)? (Right now
.reloc is what comes immediately ahead of .debug_*, and that's r/o
as well, so not an issue in practice for now. Yet as indicated, the
description here wants to be usable as a reference when this later
needs extending / revisiting.)

Jan

