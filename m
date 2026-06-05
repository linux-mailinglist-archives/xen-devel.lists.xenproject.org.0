Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AbV/IjCCImpsZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:00:48 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E629664638A
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 10:00:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=cqA6eSNV;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1329170.1593373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPTl-0007NK-RD; Fri, 05 Jun 2026 08:00:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1329170.1593373; Fri, 05 Jun 2026 08:00:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVPTl-0007KH-Np; Fri, 05 Jun 2026 08:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1329170;
 Fri, 05 Jun 2026 08:00:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wVPTj-0007Iu-HD
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 08:00:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVPTi-009xqs-OL
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 10:00:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a22821e-bab6-0a2a0a5309dd-0a2a450b8a28-2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:00:30 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a22821d-212f-0a2a450b0019-d1558032ed7c-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 10:00:29 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-490ac357c55so18812455e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:00:29 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490c2cbb4cbsm22050565e9.0.2026.06.05.01.00.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2026 01:00:27 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780646429; x=1781251229; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UUIgKMdJzZjG8nMM46/RRL/F98krsFxVeLEZOnvM3aM=;
        b=cqA6eSNVNP3MF7i8EC03xTaknXx9413Dctq+3GnEgM82mo7yVTEXlxLMQm8KNV6yOF
         /XM6UPcpMe3I0Z6iNuAvccHvyGl0YSQf6PN/i9PBgc5KSOcOJKzlGMkSOmMzQ6L3vZLK
         pZQCxMWFXddl95gRSJC706gEu38A7dKOFmBauSYzZt5m1aOK8xfettek9XB6HfDbG3wn
         FAlyVktjjvNzlG1Fflp9zpBAcmtaDaWwJjoHNyi+P9EIJ1jTbu48p7sc91Fr3xdZqL4r
         gXNJCS5EMTaDWZeGgZPitN5oRv2moMqfv+HZxHJTAZXtbqsuhbf7lIyiooNFwDg3aII8
         BwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780646429; x=1781251229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUIgKMdJzZjG8nMM46/RRL/F98krsFxVeLEZOnvM3aM=;
        b=dQ33tvtTwzqfNfDizNa0sCEEPVodW6IASHNduzM5Xv8tKBNznx+H8XEPPUl0gVAkGe
         WvrYM34WlZMTCe5d51mR8/ctCOwgSgiO50wUDbR8u/qgQIeEszqkMGoCyvJIpstxmYTz
         xTqYIuYoDCeKSWwNFXnyXX6Fm9qoPNdAtW08BxOTobHBD7EUI9dmWxd+wb+H67JP0RyX
         ufkuk2SmyghPdum7TCnkzpd24l4L8WdWlBm+Fnf+05kgxZbKOdgjy/cBeI5N1+Eu8LP1
         PNIiOPAbZZa+ZwLeA1HzjO/WG55JFNXRSM+1HNrQngPs/dOIKayK49JXwh5RH3wvnIht
         KH+g==
X-Forwarded-Encrypted: i=1; AFNElJ/VsxwuUxp1MjwUJ07clFXpY4+H8LWvVomPb/HNkgoYijFxhZUndDEP5DkkfvbjR9/LfmZYdidxphE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJMBjmZemmImrGHqBpheEx1mMtYgkPLDwtWOZ9kJ57Tf44XNRZ
	kUqA8N5AVIbWzkjgD3fBRduO8IpipT7vF9w0iTSynYgjgo/YNf1AJeSw
X-Gm-Gg: Acq92OGDMoZeU7tQL/XL6h1yPMO0H/FVFqw8uS5Ov0wAgSZMOksE9arY+A18XwbEJdP
	jFLxSlJEXCSA1hP9CI7umExH8T0b9PEkIbdPfQ4ZvivD/fYyWdNMCXdwz9GxTFGXQFjWN6tYKDJ
	nLJ7mjLayZ8m3xGoq4nsmgPjWC5Ev0l3aK2D38g4u3qaJw2fQ4MgVkWKqIqpUdNdcbaPTv0GI0B
	CrjPYvKJCjaSTPsdoH0e7UgbV7wNSJ3O87Tnu62xs5IY3/dobyh4ihgzTmqvG8JzqIGuQfTV42Z
	Fs429l38+2U4AlFWvoVzwX73Q0zm9L+k3qEMH8PmunHUjiVPMq/Le6L7GrMEs63RGtm9xzHBpDA
	Yu7TSweDQ9tBdkmhakYXWESH10ZeIwa8kNj8nBG/JwsbnhrJvk+AfTH4AKOQ2ntoFEdCnTYLLQB
	8X1TyqyA7tmGghxRagt6apWxKdQIYG+q788PkiMXXG+Y4VEwrZQTkbTUVBtsxDJGGPfr3KAwbxE
	6l6Uqhhf8uUqqsY
X-Received: by 2002:a05:600c:3e15:b0:490:adb6:793d with SMTP id 5b1f17b1804b1-490c25f67d9mr34868665e9.26.1780646428303;
        Fri, 05 Jun 2026 01:00:28 -0700 (PDT)
Message-ID: <6e35fc10-5281-4015-a5ad-78f8697aee95@gmail.com>
Date: Fri, 5 Jun 2026 10:00:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v2 0/2] xen/arm: validate hwdom first bank boot
 placement
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1780602987.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cover.1780602987.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1780646429-2007BF3B-9AF86386/10/73395122804
X-purgate-type: spam
X-purgate-size: 1867
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchew.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,epam.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E629664638A

Hello Mykola,

On 6/5/26 7:19 AM, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>

Just out of curiosity, is it okay that the email address listed here 
differs from the one you're using to send patches? (By the way, nice 
email address ;))

> 
> With LLC coloring enabled, the hardware domain memory is allocated by
> allocate_hwdom_memory() instead of relying on the fixed direct-map
> layout. Since de99f3263555 ("device-tree: Improve hwdom memory
> allocation for DMA"), the allocator prefers lower host regions, but the
> first-bank filter still only enforces the old 128MB heuristic.
> 
> A low candidate bank can satisfy that heuristic while still being
> unsuitable for the Arm kernel/DTB/initrd placement rules. Split the Arm
> placement logic into reusable helpers first, then validate the candidate
> hardware-domain bank 0 against those helpers before allocating it.
> 
> Changes in v2:
> - Split the previous single patch into a behavior-preserving Arm
>    placement refactoring and a separate hardware-domain first-bank fix.
> - Rename find_module_placement() and place_modules() to use DTB/initrd
>    terminology.
> - Pass ramend to find_dtb_initrd_placement().
> - Update the stale tools/libs/guest/xg_dom_arm.c reference.
> 
> Link to v1:
>    https://patchew.org/Xen/4f862bb2dc323914b8120b0f16af7516140cf42b.1780065103.git.mykola._5Fkvach@epam.com/
> 

I would like to clarify whether my understanding is correct.

With LLC coloring enabled on ARM, the allocator could assign the 
hardware domain a bank 0 that passes the size check but is unsuitable 
for kernel/DTB/initrd placement. As a result, the hardware domain may 
fail to boot or could silently corrupt memory if the images are placed 
in an incorrect location.

Is my understanding correct?

Thanks in advance.

~ Oleksii


