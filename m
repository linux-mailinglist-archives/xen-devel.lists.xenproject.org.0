Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q7NLGOnKHmq0VAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:22:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880FC62DF68
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 14:22:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="BLvDt4P/";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1324888.1590385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUO7l-0008CE-Si; Tue, 02 Jun 2026 12:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324888.1590385; Tue, 02 Jun 2026 12:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUO7l-0008AF-Q4; Tue, 02 Jun 2026 12:21:37 +0000
Received: by outflank-mailman (input) for mailman id 1324888;
 Tue, 02 Jun 2026 12:21:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUO7k-0008A9-Dl
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 12:21:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUO7j-00EPdC-NI
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 14:21:35 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecac3-bab6-0a2a0a5309dd-0a2a450ce134-26
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:21:35 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1ecacf-62f1-0a2a450c0019-d155802cd8f2-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 14:21:35 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-490a7678b2dso21711535e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 05:21:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e0f26csm62443465e9.2.2026.06.02.05.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 05:21:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1780402895; x=1781007695; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhAZ1GA2QP2Btrm3capcnSmVnngO0x/1LA45nrUcl+Q=;
        b=BLvDt4P/ssFdpUdv6sTaDMjC+TqboAY11F7F7dhjM4OE2NcWW886w7k12Bc1LFgC9h
         3uPJOjWC/47BOv8oaMhSDHP8Lb+1FI0gdBSLSa+TWUeAmYqWGDPmS5oKDpqU3P5r4V4F
         Uds7s75ysj0eb0cvZRTCnylvCJWLgKpf3/zVpe4k72tzg/Dhexean8d8xppiiizRqI/C
         v6XwmLBLnKizF7PiZgd5dRUMFEafv1O3BCMAgH37/GdMCPkrzuKRzAwpwMnzSoUdKq3/
         PZ8wrDJugcNG7gwoqGfSlXF0+AjY3y3VnKPw9KpOUxuBVorkixdiuanNHiCC7Z4g+DOm
         lhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402895; x=1781007695;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhAZ1GA2QP2Btrm3capcnSmVnngO0x/1LA45nrUcl+Q=;
        b=fe+Xx+8ZEXjDbRa9cxY1U/4e7FySANbIbezOOGLuavSKBZ58uaEe8sOqYHinZmIp7C
         K73MLbY6Zuauc+oDOmQaXf0MIEID4tK24dKQ+Azg2NuwPH7biCaMIZi5MLXEt+l4e0ll
         BuDsl59MDRLcOM5DjxABwa72mWhTyBq+Z56jRGXUO5BgQ4S8j572eSmueWdF8NBHNXuq
         2myhHYiHW1AcVIwilGXLgBLH9tMgunusx0lzryzomwhZBOUAd8zraInszcGdYrsni9m8
         IA6rPVEK82eKywx1xdNSO9YPnH9TK3ethxqm80vAV9lHmIqtAFE4tdNIUKR1EC4vSTJ1
         OHyg==
X-Forwarded-Encrypted: i=1; AFNElJ8/GWDZlUvVqmR4OHoCJnyn9SCQRHfFEwP+5GaNFKFsGSJCGAbHGoHRt3PHadL4VftE1GepkdureLo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFVtSGIG+TjOOIVzySBTE8Ijrf+FPHP2r8WJ2wEt70cUNTIW/l
	Up2SHqM1uwRvfFg5nit6LmsPTH2ZQazgamnkbMX6znxEr4blurD5A3k17x4/Gd6xlg==
X-Gm-Gg: Acq92OGVelYd0+wc2SpEnV25uqVvUYHyNwa+kZRf2ZDPoi90kCuRWqhrVk6HqjEZAYk
	xN8hlTa5mgr0UTsSkSpqDRt5Hvg5P0eD2Xo2Y8u1CALGzfUyoIvNQ5fA78UtRTV6KXsFRCq6DlO
	5eATqKlkcZ0iWvcppG/BjpJDJx434n1rBehXl41sw3ukWP4aHqQJgikokHdbASlihPZtre4xKjW
	ng4lAkXe7RxnPaIGWasFad3uHQnWsS9z9hDvciuoLyddmQyl7HHFDKr4y2W0+HrTv4r1vVGhz80
	dxBopjPpc/DTl09Kh/sgS3omP5fmLOESeLPAT7pbNa5QaGsMVvtuhzVh4fKvwsVQxBmUYM200pQ
	2T6sdYt0hK8YEqzp2zlIUwEe9hP0ijMXU9Iw7JE+bWt+UXrlwcCgBq/k/a5z6AWBoXBV4zwauz0
	CO5X7PkJPw//Z/TkGfTJUj0kaYwIbPRm47juEOM50PTvXNkhxglMBCkhAWs+vl5XK8ThT0F4Adk
	yVv0JOzOIJR5vZN5PN+3IJZVA==
X-Received: by 2002:a05:600c:a012:b0:490:9d5b:d721 with SMTP id 5b1f17b1804b1-490a292f9dbmr276459985e9.16.1780402894829;
        Tue, 02 Jun 2026 05:21:34 -0700 (PDT)
Message-ID: <37a760e1-bef4-45cb-88f8-1128f49dcbd7@suse.com>
Date: Tue, 2 Jun 2026 14:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] x86/hvm: Add Extended MSI destination ID support
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260427135406.1281424-1-julian.vetter@vates.tech>
 <1780402124.8631fc262581453bbf619ec5b2062170.19e883c7714000701b@vates.tech>
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
In-Reply-To: <1780402124.8631fc262581453bbf619ec5b2062170.19e883c7714000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1780402895-E196DCF5-B7722E85/0/0
X-purgate-type: clean
X-purgate-size: 385
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:anthony.perard@vates.tech,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 880FC62DF68

On 02.06.2026 14:08, Julian Vetter wrote:
> Thank you Teddy for your feedback on the patchset. Jan and Roger do you 
> have any additional remarks on the patchset?

I'm pretty sure I will have, once I find time to actually look at the v4
patches. Right now 4.22 is the priority anyway.

Jan

> Is the new structure what you had in mind Roger?
> 
> Thank you.
> 
> Julian

