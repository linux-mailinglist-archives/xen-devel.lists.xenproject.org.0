Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id refCKCPBJ2pf1gIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 09:30:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2065D358
	for <lists+xen-devel@lfdr.de>; Tue, 09 Jun 2026 09:30:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nr1nwJPJ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1332411.1594866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWqtu-0005KK-M7; Tue, 09 Jun 2026 07:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1332411.1594866; Tue, 09 Jun 2026 07:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWqtu-0005Ix-Ie; Tue, 09 Jun 2026 07:29:30 +0000
Received: by outflank-mailman (input) for mailman id 1332411;
 Tue, 09 Jun 2026 07:29:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wWqts-0005Ir-81
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 07:29:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWqtr-00FE3P-Gb
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2026 09:29:27 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27c0cc-2eae-0a2a0a5409dd-0a2a450aaf00-24
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 09:29:27 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a27c0d7-56b3-0a2a450a0019-d155802ad172-3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 09:29:27 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-490ace40f4bso60139315e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jun 2026 00:29:27 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bc3fcf5bsm546387855e9.9.2026.06.09.00.29.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 00:29:26 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780990167; x=1781594967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uBngxOn63HrEbR6jkI3WkuhBsFTvSthFXWdl5ThrYOE=;
        b=nr1nwJPJbMSG5AlbUaOwa31s9NhbbpcdbTNity+KLQwntO8agKwkaNuqxYPhAs7EM2
         g5xowBsZPrlckvmXO3JX1CztbZltTCUc0t4FgQnzj69AKS04IAwd5nVEY0DgV2gFfHaM
         AV1AVOryuVZm+JCPYyc2iWa1ON6g4ji2E8I9NZIDWA28NJjmKOCBG0yg/xy6d2F/zAKi
         w5zZGSyFVxMn0YSAKdJ+6QBixe+XPdNx94Y78CBpEpkN3KwPxjFSXBLpgmSQPjUyYX6d
         u+vyfHWWPbovY5MtI6KCZHXl5Wz3Kt4PBwulN9mABRDzi4WlPoE3reIZWuFZWTGfX/Wp
         n0Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780990167; x=1781594967;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uBngxOn63HrEbR6jkI3WkuhBsFTvSthFXWdl5ThrYOE=;
        b=JEOdmy5XCZS6/NB5Rt5tPSP0+7Hz5suW9YQkYbez20F/lxejPLICLFLywcosRBUUd9
         ZVdiZqwOjtpViKFwI15OuMAQ6ZWN6oAm+dptLb01U/Mk7SZstf8PfqTunDjExqFmCe7E
         Bz3p9lu7zk7rq8hZWYQvFYfUf6NIQvcSCmqY0mMkZdNYD1qzsvomX7g6AE1uLFp8BZCA
         KWeYIi5VsPIRjuQr4O7SBGv2aROWGSFNXw5jGxD3rH37cw1+LziHyl2p6D4qG/mhqc9h
         qRgDqc5MWjF3NmWFhj2YV32CO3u4+06OQbEIUv2UmmHeK0iqkDy7LpeDNbTi0EwK0i2r
         TrlQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jX6mVo3oMzr2RPnV1NnXYnLIL34OhCEJg6TgN8iOMgL3Aa/N/iz2zXgqr1qUFxF3RpvhG9oQNQ6U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfH8ouSGoboufinwcXgjmHqFvKicDteEc13UqkFrZkHVxvQfvc
	ucUIKRLe1U/ZRUHDM5zQWQnGS+3yshAuiuFHgSmEY4jqTeaDcuI+YmhK
X-Gm-Gg: Acq92OGGG+mTyScAWq3uE6E0AzyIeNF/g0f9AqWw11mOWIJolcaUf7cRSvBcSqcWqlo
	XkcA5tg706LueD7NZNckLLP0JOxEDCdxNudghTQHLp0hm1l8UVZ2SWerlxQmCJzcCNAdBjolgsf
	cb0zfbrTpi54EbzcKb/oeYiDsOWDkNWdzuo/0OU65jyFjuYW+jO+rlM8bqXdAK7KVs2l4+b/h8q
	0PhqrMkzR4Dyjs7yY6DvwHWrrA/ixDwe5v5EccMdA1y+UzhgWi+2TrI8zCz71fS8lDRMDgVtLAM
	4EWwuxD8c4mxYdRhVlt6r74ZvZOjqQ2hb2XBGspghBzW4ni2sHaNR58hFbEF7rjWEDDBAy0YmhC
	TuqA8eBzAg9F449PJIBdVsIJ5voJYSa+Z2yemH1Ltf7ls2zTBq32I87H/OEhx9OCibzjnnYtkZ/
	3YsxWsZDqKAS5J61O002ZwKbbQFtrK+e9T/0/8SJAY2ZlFP/yRavnAYu+GI9mXyx47IcTZDEUcI
	cBO2dEcPlKnyCPZ
X-Received: by 2002:a05:600c:6792:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490c25ee920mr318322835e9.24.1780990166659;
        Tue, 09 Jun 2026 00:29:26 -0700 (PDT)
Message-ID: <495ee5d8-d0df-4b6f-8edf-0907bf4f10bf@gmail.com>
Date: Tue, 9 Jun 2026 09:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] xen/x86: Always strip xen.efi
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260608173108.2848469-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1780990167-7DB818B7-56E94317/10/73395122804
X-purgate-type: spam
X-purgate-size: 3430
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,vates.tech:email,suse.com:email];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: F2F2065D358



On 6/8/26 7:31 PM, Andrew Cooper wrote:
> From: Frediano Ziglio <frediano.ziglio@citrix.com>
> 
> xen.efi with debugging symbols is ~45MB, down to ~9.3MB when stripped.
> Multiple firmwares (as seen by QubesOS, Trenchboot, and XenServer) are unable
> to boot xen.efi when debugging symbols are included.
> 
> Either way, having debug symbols by default is abnormal and contrary to how
> the non-EFI path works.
> 
> Produce xen-syms.efi unconditionally, just like xen-syms.  If
> CONFIG_DEBUG_INFO is enabled, these will contain debug symbols, and if not,
> then not.  When xen-syms is processed by mkelf32, the debug symbols are simply
> discarded.  For xen-syms.efi, call $(STRIP) to produce xen.efi.
> 
> Some old versions of binutils ld managed to produce efi files which the
> matching version of strip couldn't process.  This includes Binutils 2.26
> included in Ubuntu 16.04.  Delete the workaround for this bug, and require a
> less broken toolchain.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Frediano Ziglio <frediano.ziglio@citrix.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> 
> For 4.22.  This was posted previously as
> 
>    https://lore.kernel.org/xen-devel/20251208133945.61375-1-frediano.ziglio@citrix.com/T/#u
> 
> but merged the two patches and rewritten the commit message to make it clear
> that failing to strip xen.efi is causing boot failures.
> 
> Previously xen.efi.elf was produced but it's unclear why, and unnecessaerily
> different, so I've dropped it.
> 
> While this does want backporting, it can't be.  Xen 4.21 and older still build
> test with Ubuntu 16.04 and choke
> ---

LGTM to be in 4.22:
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

and ...

>   .gitignore            |  1 +
>   CHANGELOG.md          |  3 +++>   docs/misc/efi.pandoc  |  8 +-------
>   xen/Kconfig.debug     |  9 ++-------
>   xen/Makefile          | 19 -------------------
>   xen/arch/x86/Makefile | 11 ++++-------
>   xen/arch/x86/arch.mk  |  7 -------
>   7 files changed, 11 insertions(+), 47 deletions(-)
> 
> diff --git a/.gitignore b/.gitignore
> index bfc7bdf043c3..49e2c6961768 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -224,6 +224,7 @@ tools/flask/policy/xenpolicy-*
>   xen/xen
>   xen/suppression-list.txt
>   xen/xen-syms
> +xen/xen-syms.efi
>   xen/xen-syms.map
>   xen/xen.*
>   
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 5cf19372a361..71d1e9ab8c69 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>    - On x86:
>      - Enable pf-fixup option by default for PVH dom0.
>      - The libxenguest bzImage loader now uses the system liblz4 library.
> +   - The install-time environment variable INSTALL_EFI_STRIP no longer exists.
> +     xen.efi is always stripped, while the symbols remain available in
> +     xen-syms.efi.

...
  Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com> # CHANGELOG.md

Thanks.

~ Oleksii

