Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KxjEK6L6PGo1vQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 11:53:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 487F66C46A9
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 11:53:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="aeUlE4/5";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1345402.1604267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcglx-0007wV-RR; Thu, 25 Jun 2026 09:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345402.1604267; Thu, 25 Jun 2026 09:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcglx-0007tl-Or; Thu, 25 Jun 2026 09:53:25 +0000
Received: by outflank-mailman (input) for mailman id 1345402;
 Thu, 25 Jun 2026 09:53:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wcglw-0007tf-0C
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 09:53:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcglv-001HHd-9R
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 11:53:23 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3cfa8d-2eae-0a2a0a5409dd-0a2a4503dd44-26
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 11:53:23 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a3cfa92-ec1a-0a2a45030019-d155dd31cd2e-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 11:53:23 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-46cdc80779bso1299159f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 02:53:22 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c2279b85csm13830274f8f.28.2026.06.25.02.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jun 2026 02:53:20 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1782381202; x=1782986002; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rpf4AZ5Q7gbseslvmotJFMp1iyDAC9uIac9iObv6SPU=;
        b=aeUlE4/59zocaS/6sDHDfF60IhaJPFjemTEwymErwRZwij5HsynhAmAGQqxUA3OViq
         XcChhCkDsMAarwwnmo2ppWtkYi/N5U0Af1UWA/t9rwbZZ3M6+7jNFAtPmWbIIB0LM+cu
         ara6FaAfN35do4DtYS9Qnakmbr9uYr/gLfkJOyfd85D5CMsd7p/MoATC8/EDAr+/OltQ
         LgLtts3fXuW/zkO0iS7dsFodDXlADzRU8fCaeNK+Dz/nVqeryaSWF5tpW1blVhpB4afX
         kyHXZzUy/57ZCPBrORoAPa7QC7F5IUSsvm6DJtK/ZxOTYkyRmT1xjWjlJ5tq8H1TmvXD
         bY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782381202; x=1782986002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rpf4AZ5Q7gbseslvmotJFMp1iyDAC9uIac9iObv6SPU=;
        b=ne1eHS4+mExNigpXAOt97lHdrOSH99fjYzTQMDZ9+okYzEhmD17w+JKVOAoAU3xNyR
         1PeMLYw6nMJRupWEZidflkK4lljMBG0ULf2u9WhYie8i2CFkqkOwDbRxw4BkNr/vxQyt
         5rk+fWVUZhhN/+XUdFcSM4y4PFsrwdi0lSO2pS1w2MO+cP1m/ePLViCeLrGWCgrIPSRc
         0Uoc59sVZIFRqnBtBTTUP81nHlC+egY2vo4sKaKUytDELrTNnfn/PZyiKsNhAO90Lqw7
         nspMgNFf0Ju4AXaGNgls+teb6hWpR6ElVNgkpQnSMChkhFQM9V3dIdKG5Q6IwH/5njYT
         S/qA==
X-Forwarded-Encrypted: i=1; AHgh+RqkfXial3EmYcyPMmWo/b9735B/zW8cE6Zn0EdKUX8QU0UtuhRaGOXhz9c7BtinJmEKNVSccOxr53M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxF3J1/o9ELrmS9tSkiZueS1m2rhMyL9rjmaZ3uiD4oxmvdToPY
	fR5PwYyoggUdiq7vPQzdobRAJdvnAbnnPga47xTcH/UiC/KdgKLVLptc
X-Gm-Gg: AfdE7cl1OOVniOVaFE6aEL3jMTvih1ONtNlvH7tSp1Qhb7hBouMoVhKd3hozIrw6AuJ
	cjji7wRU/1+L9ea2wiWD5IgwOcgUnXFu3sBRtp8B8kh/6tf6PjjaceAOCy8CWyi6HfKB5bYJm/s
	piwiMJDXDXJLaFi/wb3DoAJtqIkYoEDCToWI7fiuOsuYdMY9ESoK9tzAWFiE4HIcA9xX2bV9bZ6
	6mHn5ubO1tSB6OtQMaoKGP9VxpPMjhw8CBI3/7PMqDQVRgK2/UzcIpf9HjOLroaQ/OayEY18BhL
	IQN0H6ZsODXZ/RSNDRA5HnI3LRTDiasfBkqbai2hHtdo/tIHoHnh937jeseLWbfBtYRdklQt437
	LzUYGEkLYaNo8Kn2VWExX2CX08AXBExndT2HHxkbKqJHPcZILU4PgBsANN9ttpB+if6HhMFte78
	TeURnS9KM5FswOK3diAocxRlyN19gSO88gEnRnzFOD+6BSeIMT5+TQPY5j0QZcdaBzR8RvpQnaA
	xImqA==
X-Received: by 2002:a05:6000:430b:b0:452:11f9:bc40 with SMTP id ffacd0b85a97d-46dbf3035a8mr2708619f8f.2.1782381201538;
        Thu, 25 Jun 2026 02:53:21 -0700 (PDT)
Message-ID: <53950c10-8708-4122-8976-5eeb943ed2a3@gmail.com>
Date: Thu, 25 Jun 2026 11:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/fred: Send an EVENT_CHECK IPI on exit from NMI
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260624142338.653064-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260624142338.653064-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1782381203-BCF835D1-CF64A74C/10/73395122804
X-purgate-type: spam
X-purgate-size: 1171
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,citrix.com:email,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 487F66C46A9



On 6/24/26 4:23 PM, Andrew Cooper wrote:
> Returning from an NMI which hits guest context needs special casing in FRED
> mode just like it does in IDT mode.
> 
> Break nmi_exit_to_guest() out of handle_ist_exception(), and use it in
> entry_FRED_R3() also.
> 
> Expand the comment a little, and invert the conditional jump to
> compat_restore_all_guest() to avoid needing an #else clause for CONFIG_PV32.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> Slightly RFC, not tested yet.  (My AMD system takes an eternity to reboot)

I would like to have a test on hardware to verify that it doesn't break 
something else. With that:

> 
> For 4.22.  Found during testing of FRED.  The consqeuence is that we can end
> up scheduling while still in NMI context, after which things like the watchdog
> and other diagnostics don't work properly.
> ---

  Relase-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

