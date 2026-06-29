Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3ihcC9tJQmo84AkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:32:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 012546D8EE1
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2026 12:32:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=fKa89Bkk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1347446.1605297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we9HU-0000k3-UD; Mon, 29 Jun 2026 10:32:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347446.1605297; Mon, 29 Jun 2026 10:32:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1we9HU-0000hs-Qh; Mon, 29 Jun 2026 10:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1347446;
 Mon, 29 Jun 2026 10:31:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1we9HT-0000hj-MA
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 10:31:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1we9HS-001OZH-GF
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 12:31:58 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a42498d-5cb7-0a2a0a5109dd-0a2a4504e32a-34
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:31:58 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a42499e-a01d-0a2a45040019-d155dd2bd032-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 12:31:58 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-47248615e4dso1406495f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 03:31:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46fe25429d5sm28539384f8f.7.2026.06.29.03.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 03:31:57 -0700 (PDT)
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
        d=suse.com; s=google; t=1782729118; x=1783333918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hpSRzTKTDIjEaGwtVFd9ANaMT/aKCinIkS/ujotWWH4=;
        b=fKa89Bkkc5cNhC86xqXoqE4PVey2Zf9DAUbKe51a9ujWX0DA1Lkxk0P1iWm9JJl2qJ
         5p3Eq1d7vqblE7MrZQ0iqHi1skSwUEKgWnd4RS2D7M3USRtkeRBLdyvrXMfAcw2bkSY4
         e5M/5/qbhxUDmkwxWpJX+EKpA4b6nfGLcsF+3gyt/o74FDqCc1iu78Jxj65TdIfloDw7
         QN7N+UvjlDFu7W+vm49D2K3XyiSWHuQ3upWrF9gwuiHizq30hGHlUhy0LTDP6vDbv1Bb
         iOir5mhGuiJikVdC4RnFnfHCvK2wMA7oy0Yu8zWiAExw5DOjSbxeHtT32ZBQo5Gs9+o7
         HSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782729118; x=1783333918;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpSRzTKTDIjEaGwtVFd9ANaMT/aKCinIkS/ujotWWH4=;
        b=Rg6Ab63+lhVxjY4NTdTKqZHYNpE5+rclxMF92myOKcsUNu6stjc3XdEtkpcMKtauTD
         GlYnm8EUfdvN1Q1sUOSMoAu1OasITCXUyBmPpL0k5drzdUCP6LXdtaI7sFCofHn91rVN
         Zlw/mLyHbcxaOnGHtW0uLaU7S6tn5SjiatuqRQqbtlQtbYxwXfZmR0NDaRpwHx35YgyY
         SU18McGdQO2UiIglQKdzBen6d+eQiHU+S9mCQKIR7SpP/iwwyooHrSm9xS0pkUrmGgtQ
         1yn6lXtZQ9Rpsb3ockncmfODOrnCAfr4hf0pwJVAA4Zu7nbu44LN84Fk2TH4McLPauDX
         otfg==
X-Forwarded-Encrypted: i=1; AHgh+RrTZcGa2gjk6bKQwS2zoDhE84ZKRx7bm8tLmTjn+mGs02HnzHlWJzLvOmQn0wnewA2igwpeBuHVul4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz1Pq7P0eCX66QPuz1UVgFUGAjEj6hw04HMfysuxxwntgXeHMeh
	7cG86ytT+BAuc1hoZEr+Ew9tTJBydtGuhdtvMS9JnyKeJnj1N1IFMrAVP9Hy0CaFdQ==
X-Gm-Gg: AfdE7clIkjwlJOkp6FmJ2EIqMDh15c9yjdKBvdK1R8YB/oefcsv5Fw/IJy/x3J6YsTH
	CF2fxa451l6MM18CowXAuQX/If4ue2tj1wLV2simvf7WAQD639WTfLTKVG80owaxZTkDu3VVsMk
	6iFJ2QEkjfg9QlS2nIjtNnLTVzP2FOlUUbNXsDA9jPH8jlLSbJWx2px9UQFg9K6YfwPQxMI15R0
	3Wuw6lLe8Nn9eJFPFSEAjcToWYGmHXVY5IvBjzrjqDOFnKVkdYdhnX/LgXhl26cN9mCQKfzjZbe
	VqpviuHO5O2CVUBKABRruCcmcF3G/pHaGdwLIEoZGaraESipGs6B3TdIjChPuCc0j9uavGwDCdl
	F7tL3pcEn3+z6P73fpIpNnB5JpGjbz9vd26a8N6Ihi5UNhy5vxlIdBWrxFIeaJFJ7pWaq0/WG5t
	LuckA53yGUhIJpn+shey6V/IEOz9gC2XI3xr95AmsHTC2IdAT2Loh2HYXbjY6YwU+rwtS1pjCdM
	nppEzMqlf6grBI=
X-Received: by 2002:a05:6000:2903:b0:472:55a:ef89 with SMTP id ffacd0b85a97d-472055af37amr10093848f8f.27.1782729117701;
        Mon, 29 Jun 2026 03:31:57 -0700 (PDT)
Message-ID: <d965a04d-c66b-4c7c-8ce7-c1da029a6b7e@suse.com>
Date: Mon, 29 Jun 2026 12:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 3/4] xen/irq: handle IRQ being disabled while
 executing its handler
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260629094531.55555-1-roger.pau@citrix.com>
 <20260629094531.55555-4-roger.pau@citrix.com>
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
In-Reply-To: <20260629094531.55555-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1782729118-ADF351CC-D443BB7A/0/0
X-purgate-type: clean
X-purgate-size: 897
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,citrix.com,vates.tech,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 012546D8EE1

On 29.06.2026 11:45, Roger Pau Monne wrote:
> It's possible for IRQ_DISABLED to be set while running the handler
> execution loop in do_IRQ().  Such disabling can be done by the handler
> itself, or from a remote CPU.

I don't think the handler itself can legitimately call any of the functions
setting IRQ_DISABLED.

> Check for IRQ_DISABLED not being set in the loop condition, as to not
> execute the handler if the IRQ has been disabled.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Preferably with the description adjusted (or it being pointed out what I may
be overlooking):
Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> I wanted to add a fixes tag, but this has been broken since forever, and
> hence I should add:
> 
> Fixes: 4676bbf96dc8 ("bitkeeper revision 1.2 (3ddb79c9KusG02eh7i-uXkgY0IksKA)")
> 
> Which is pointless IMO.

+1

Jan

