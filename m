Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOD8MUmBymkI9gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:57:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CC235C6D8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 15:57:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267676.1557127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7D75-0001Do-Jn; Mon, 30 Mar 2026 13:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267676.1557127; Mon, 30 Mar 2026 13:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7D75-0001Al-GV; Mon, 30 Mar 2026 13:57:07 +0000
Received: by outflank-mailman (input) for mailman id 1267676;
 Mon, 30 Mar 2026 13:57:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w7D74-0001Af-Cd
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 13:57:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7D73-004K7O-9c
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 15:57:05 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca811d-2eae-0a2a0a5409dd-0a2a4501c69c-32
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:57:05 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca8130-6400-0a2a45010019-d1558031f146-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 15:57:05 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso59793375e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 06:57:05 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4872717c3dcsm80351265e9.28.2026.03.30.06.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 06:57:03 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774879024; x=1775483824; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/aDwDJsyV35jLE5E99dr4Y4PR6FRHOO0zqMwc0HlNA=;
        b=rxyBeGkgseI6zAGvVhrIjmHxKgEtOMWT57wy1SYkSZQY+CTADnN8Ei2GuYjg6HKBgj
         lw+C9OrJ3MfhPl0SYusGcPA8ZJFd4A8ClckfM7Ccu7H1SwSq5XmvbOPx1/f8xy774VV7
         LwuVaBEpMWYVKge14cwnyGGPfqpcMlvHjvv+nnDfBFN6qwCjXdnjSwuwp1gaAlJA/qeQ
         ElQCH4iydGNiCX42+DX4hg4XK4maDbNYmijxzRoxpKZqBiQLgZvZHq/d+ksk1cCZv5t5
         sxD1UZSnyaD05Wog4RtDlO2QEO/EoJ5HALKGaM23TTQz/yoJzrZManGX8oNQ6px+eV7E
         qMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774879024; x=1775483824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q/aDwDJsyV35jLE5E99dr4Y4PR6FRHOO0zqMwc0HlNA=;
        b=RyUNSf8pjp7TS275tO9ysBPBCo4BikCtJQtOcR4+M5VsbFPHgfK+6Hd38KVyhF776D
         x2DsdB3zhWMepcuY9tIOrznarP/0zHOBEMkAk4eb600tqrbW0iNXVPF3kIcgDuxU2ahD
         dSKDA4gnirQVegFVu8yWCnyTQsTUPEWXoOQ8Ge4L6Dj3aDWSK12pT448nfj8h0Rvjwdz
         fBD5Ml+VLve+g63yWBIT2vr+vaLj9o+9qC+sBsNT/rbP2CDbhrxGG4d5SPvnKY/RdSGT
         5Xz2GAyFV9ds/K40zriPJz44/i89yDOxx+25b5NpZTV46508OBoleRvB1yMaKX7XGDgg
         dflw==
X-Forwarded-Encrypted: i=1; AJvYcCWU72Xr+IjRowGtU89xtM38CJbEKgFOOvzRhDdB5kvHUyDPg9xvdpbuzhpwu6EcCTb4psFTLnCjWkQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIQQfAo21Mpzf1ZXJIrwz6M18ar2FqeLNLeKpnUfVka7Vq/4bU
	keyP9xSX9+D1COETIb9bwhrpQ9A8wiYj1JMqOPLrZunb4GUZmXUtzTET
X-Gm-Gg: ATEYQzyU2RxtDBzSV/WOFhzL5vHu2dWtlDQhRcSlMIe64rcf1+a6WQbiUWQJRJTfORs
	oD7ZnMw9HAmVQqOL3Li/40dPr9PtUmge7z/juKQzsYS8Y3FfXZec4CirV8VlHuy95Whopg8oTIP
	tQLhsO1h8MTGseF/D/96+KbfocNTIcnaslcEd7Mmy2iZbY1R/gxRkvGvJN/+hA4EW+86/HyY69V
	NqQAnWSHVqQ64zFEwtwMHf021f3A0/rSwaDPv/7GztK31fA6ytoXGFgJJmk09jD4Lzr1fr25CSr
	DmVo1fRBRvgcVgP11JvrbE3PhEypdnwOkBstJmcBif4o8ZBzU/vJ2gnnxZm8oZtNJgbYpAHLWUY
	/GEgQBP4FNs8oIM00g2TBhvt5UTaAq/lwkuGH3UBffVgsiknVoAX2k5fpFYyK3d0FkST2JFfc3F
	cjy3cxJrFx8fvTOXOse8+2fBnD0aXzyyCeK+6N9Ebq7P2wPA+w0iua1bvJC2ue34d9xQ9HIG2bJ
	Pw=
X-Received: by 2002:a05:600c:3b27:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-48727d5a252mr217347885e9.7.1774879024269;
        Mon, 30 Mar 2026 06:57:04 -0700 (PDT)
Message-ID: <20d15829-f2b4-4ab8-836d-4a6e9a6a1b47@gmail.com>
Date: Mon, 30 Mar 2026 15:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] make ioremap_attr() common
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <81e4f7e0-df57-4a5b-b16d-fe668682d94c@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <81e4f7e0-df57-4a5b-b16d-fe668682d94c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1774879025-8E2F8DF3-923CFF8D/0/0
X-purgate-type: clean
X-purgate-size: 1156
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com,raptorengineering.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:tpearson@raptorengineering.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 73CC235C6D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/19/26 4:51 PM, Jan Beulich wrote:
> This core backing function is uniform; what varies across architectures
> are the attributes passed and hence the wrappers around it. Yet of course
> extra checking or special handling may be needed per arch, so introduce a
> suitable hook. Permit such a hook to return both adjusted and un-adjusted
> (for the page offset) pointers.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Declarations (or inline counterparts) aren't being moved around, to avoid
> the need to touch source files using the functions. Quite possibly they
> want to consistently go into xen/io.h and asm/io.h.
> 
> Of course ioremap.c could also go into lib/.
> 
> For RISC-V the wrappers likely should become inline functions?
These wrappers are implemented not as static inline function or macros 
as it will require to include asm/page.h into asm/io.h what will lead to 
compilation issue.

I am okay to leave them in the way they are implemented now.

For other part of the changes, everything looks okay to me:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

