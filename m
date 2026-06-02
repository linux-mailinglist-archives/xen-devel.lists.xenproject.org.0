Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOUBJKCqHmq3IwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:04:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41FA62C188
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 12:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324699.1590194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULye-0003Mm-Bw; Tue, 02 Jun 2026 10:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324699.1590194; Tue, 02 Jun 2026 10:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wULye-0003Ko-9M; Tue, 02 Jun 2026 10:04:04 +0000
Received: by outflank-mailman (input) for mailman id 1324699;
 Tue, 02 Jun 2026 10:04:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wULyc-0003Ki-T6
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:04:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wULyc-00BY6K-8K
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:04:02 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eaa91-2eae-0a2a0a5409dd-0a2a4509ee44-4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:04:02 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1eaa92-2497-0a2a45090019-d155dd31a9fa-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:04:02 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so3237838f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 03:04:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a065esm33068791f8f.5.2026.06.02.03.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 03:04:01 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780394641; x=1780999441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vh71FcHGb7GWNlpuZNqLIUu9Rb33rzLG9iSARKDqWXM=;
        b=RsvCJgP/N6MfCMedpNxHO0vY6xapMjOAz+BIoj45lqflUqy6Gmk2jOE2x6yp4+SIoC
         24XrOoNax+DLA+WVBzJUTKElPzo7hJ3OO7fMrTDM6LUK66d/OaH7SsyPrpkWYpiCYWDy
         IFpDZifEz8nzFBvahQTgHGgK5aYvOiuInvqKIwZB5x5vT8u1Ow/SUS/oBzsFPb89qFtr
         JfkVQqTuaRd2ix+xM+QdDnIsu2OYQ0YWeOsMI7SBYtlpzBmKVbz1+9Tf0MBwjEGVazpK
         4xeUylof6pNbxI3VdH5Tzc87VbBeanONGoPpPL1IcuftmTT3eE6G/kgpqQvNfDVDwkaP
         TQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394641; x=1780999441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh71FcHGb7GWNlpuZNqLIUu9Rb33rzLG9iSARKDqWXM=;
        b=CM0rY9fSJr+IyN1KUs7/HXAHph0XUJlV3qLkmZmELFNRumlFax3LI6HT7OOqtBip93
         L0f2FZ6svWAGptCx1hPNfVGNqD3SXo7qaHnj9RXZwM1aZmnKt9Sy4UFrWYpFYTw/JrlX
         z2r2IYXRA3WyIee8JiPD5OmYqG1cazyZufawzOTvOsIgPsXte7qg9nelgytpzJxX0y97
         JC0s9Px215oIfG4P1NL1H3V/MMzudfiKyqeVID/BLBQMphr8v4S9glrzBzHqLrk6YQh8
         Q4yCKMltFQssXXl0SbC0Fhgs2qBeSN9zfzqBNB8tRfi3OcIHMkUBzTFQf/+G1LWbkEKJ
         phJA==
X-Forwarded-Encrypted: i=1; AFNElJ/y0i3cpCsSCnb7RmFhlggxhBtPFov1XSEa1G1dDFLpQtXlfCsop/TzPWfBPpSwnSkyA9o51jKxUMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy54e/wGgg2Bo/nWQ/UopfpZ06ergVJ8zZsXtCJOuUVsJgcfazE
	jCkbzWppt95TbLR3VMdeZRKQJ8nXNEA7vNEoAZkAg6CVW37nyC7eVf08IRT/uaO04g==
X-Gm-Gg: Acq92OFxiUHEhy3CVT+YbqNeBv5uX+c+VmJk4eT4v91cyTXY/9gpqEoDeTm37aAnYnf
	rUoeVC+OCl4M5w0gZJP1cCW4oLDwTByc/nAd4uCFGu3iBoeyckT0S9bGa1jTJce58O1iLh/hFSo
	sNNfzqw55a3wngPxeS0F13sptAjZhvTabLiv+GateFP7fEcI/rtPuQDxgBNjVegPi3xtxcp2Im9
	NfEBOI+CjwcyTkoWHLVGDQu4XwgCeu0n9mtvYNFWL5D+MnMfhTWDJtxftyLAUcPvWIaC6R+pLnZ
	CUq38gjGBk+b6YpOwR7E+AXjSIRiqLXWppJIzrHUuQMglL7H+K2Ca0Op8YnK+Xljj5zBwfZQfpQ
	Yzfo4YBRz8C3Ll5yR4duI+SLv6SCka851BTcqZmQmg6BYIf0B5bGiuaFvIB56lTK6NWFmmSrt1a
	PLyHjxdJBGTQ4I8+Wwa3ESYrI6iSMwq/pedIa2y83SaMpdS38xQNV//F5TnU1H/jTPM0e1i22r/
	qCa7NErh3rK1Bx/P4bHFwJHxg==
X-Received: by 2002:a05:6000:1283:b0:45e:739b:2750 with SMTP id ffacd0b85a97d-46018cf9ed4mr4135318f8f.9.1780394641607;
        Tue, 02 Jun 2026 03:04:01 -0700 (PDT)
Message-ID: <a456446d-3dc2-414d-bc33-b5c50c088741@suse.com>
Date: Tue, 2 Jun 2026 12:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.22] EFI: Fix boot from a device without a file
 system
To: =?UTF-8?Q?Szymon_Aceda=C5=84ski?= <accek@invisiblethingslab.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <79d8684ede3bf1e9abe02a2e5ed966a0ecd5949d.1779726979.git.accek@invisiblethingslab.com>
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
In-Reply-To: <79d8684ede3bf1e9abe02a2e5ed966a0ecd5949d.1779726979.git.accek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1780394642-8957AA53-0014F851/0/0
X-purgate-type: clean
X-purgate-size: 1014
X-Rspamd-Queue-Id: F41FA62C188
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:accek@invisiblethingslab.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,kernel.org,xen.org,arm.com,amd.com,epam.com,apertussolutions.com,vates.tech,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,invisiblethingslab.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 25.05.2026 19:37, Szymon Acedański wrote:
> When netbooting a unified Xen kernel image (via GRUB chainloader),
> the resulting loaded_image->DeviceHandle does not support
> SIMPLE_FILE_SYSTEM_PROTOCOL.
> 
> Instead of crashing via noreturn PrintErrMesg() in get_parent_handle(),
> we defer calling this function until filesystem access is needed.
> This way when booting UKI, get_parent_handle() is not called at all.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Suggested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Signed-off-by: Szymon Acedański <accek@invisiblethingslab.com>
> ---
> Changes in v3:
>  - read_file(): replaced unreachable `if ( !dir_handle )` branch with
>    BUG_ON(!dir_handle), per Marek's suggestion.

Hmm, did either/both of you try out what happens if you use BUG() or BUG_ON()
in pre-ExitBootServices() code? Xen's exception handling isn't hooked up yet.
The crash will likely be rather hard to analyze this way.

Jan

