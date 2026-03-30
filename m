Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OftMWGHymn09gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:23:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695FC35CBF5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 16:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267698.1557145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DVo-0005va-Pj; Mon, 30 Mar 2026 14:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267698.1557145; Mon, 30 Mar 2026 14:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7DVo-0005sy-M0; Mon, 30 Mar 2026 14:22:40 +0000
Received: by outflank-mailman (input) for mailman id 1267698;
 Mon, 30 Mar 2026 14:22:39 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <oleksii.kurochko@gmail.com>) id 1w7DVn-0005ss-AL
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:22:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7DVm-004QRG-FI
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 16:22:38 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca8727-e002-0a2a0a5209dd-0a2a4507d050-16
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:22:38 +0200
Received: from [209.85.208.173] (helo=mail-lj1-f173.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69ca872e-fd74-0a2a45070019-d155d0adb089-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 16:22:38 +0200
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-38704f70ea3so43320821fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 07:22:38 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38c836d3f54sm14277501fa.7.2026.03.30.07.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 07:22:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774880558; x=1775485358; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oOWcZKiBKZzgHreVScVA78cQA+fuwJEoOD1DWxJ8gcM=;
        b=TN8YxNiM3c+voomAGY2fm2CB8y+Av4t7IN/4vjdf7KOmsVKGavazM0GIEsUPjP0Ka5
         K1qdUkV/XxJN0qMDMr5KaIfbsAdvA1wvEl+VDPPHWxbQKDEhlokxnotM9E4sHFU1szDr
         mFajFxfsg3YNfjZJHgjM2sDmCZtLFCMWdvkZgVgqVaCWBDCJOsTM0VcbKkvEfPGH2PTM
         cKDCdKh6W93cI3i1DRc8Z+YvQ+8Ft0Rv+vR+0ZL+XnM7F+DXy5s3zuPfvo+zu9nJkw2q
         SLDM0DW/EAYGZmuFCVeoz3/8W6zPlA+ZaiPLAJ9cKW0qlSgMRkCR9FS8k2x7qZ5hvQp6
         WR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880558; x=1775485358;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOWcZKiBKZzgHreVScVA78cQA+fuwJEoOD1DWxJ8gcM=;
        b=QNRwMIhRg32cteNQMUbbVdI4aQIaYYwPjEsNmhosGpMb58x3N0A2ORk+fbUNirxOXd
         oP/QKr46CxUBOiuk2kbgahn5N4/AiVExFpvELIcZkrR241oaCg4aPNRumkXkqqcYX8DS
         lHqZrfHEJUdgJXwPVGIYcMHbO5s+6qWaeZ/Br42JlPQLaVKWuojFWrl9vhX9PRVHEzLe
         GeKL4eu2GsF68NoQJdqWBQlKt5S4rAzTApWWbCFu6Ckwt25No+jexfJL9QtN1MIOpo5P
         2gmtfQ5xbYOhH20v0NGmvx9juNfq8kY2L4k3QNQ8XG2Bpmof9KxpLxP2E63pQ3f+vz6L
         HNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVceJyTVF4B0xTrY8JFoI8ZNS8WLAd/C+MQU6CIRDl2Ud/31QwHYY8q1q9p584bptDIiYrhZZhMjA4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz5YfrUjGvWp0Ve+W0UbdRyH1G9SGrU0Tf7KaHCcBPXluqXJkGK
	1TROm/jfGKyOwGQccCJorUeQlIty3CoxCZRzvigbVMdCfGKefupH5zst
X-Gm-Gg: ATEYQzye6aXtSjC5+/ESzTcdXp05oY3NkHs+UyAWtV0QnmHgvA+DLvEbBYZS26QFDuy
	4KFxMNNtOAcVTcm7lrH+gJ3R3+ThB4bmdH54GstXXAglFXUtdX9THSEBUXf4ortGN7paVmDo9sX
	kPSV2U8g11LAwnMlpzLRuheIke3seIiXfdqSwQDnnvwXQWxkeTnhcpwgCSN7sOiCBitc9hqbPTG
	fhPkEztJ+8b2eNvSduLhXbCDZzcmhAU3B4kiz/WA4YuKdSq0T8xdRWgX3QcNj9IhbWV8+7QyJJD
	8dQemIJh3WYARRxhnWhAb7zTE3xQQcN7QzG4iLvtU1EyJRE6rDWInmWQtUQgZ18dBx1MrOL7WA3
	nmpzgril73xTrfpVe5SdD1N5xM/7L+GGgz92f9e8XgtUyv40g/Rw9Kceg0Fjr7zCTQQXY+r/Pnj
	tBPa7yzY9PPQ/H/wgQmI/kYWXuHcj2/nvglBFVrPnTk4MGlCTY2Mo1eZ6gY6UhjibWSSOayrt4u
	f0=
X-Received: by 2002:a05:651c:41d4:b0:38a:5584:cea2 with SMTP id 38308e7fff4ca-38c73106e37mr36312661fa.3.1774880557283;
        Mon, 30 Mar 2026 07:22:37 -0700 (PDT)
Message-ID: <3bf90b33-c028-4f45-bda0-9d1bd5386c02@gmail.com>
Date: Mon, 30 Mar 2026 16:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] make ioremap_wc() x86 only (for the time being)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <20adacfa-06ce-4508-916d-f15d8f17788f@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20adacfa-06ce-4508-916d-f15d8f17788f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774880558-57AA5303-464E3FDD/0/0
X-purgate-type: clean
X-purgate-size: 979
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 695FC35CBF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 2/19/26 4:53 PM, Jan Beulich wrote:
> Its use in domain building is questionable: Already at the point both uses
> were introduced, ioremap_cache() existed. I can't see why kernel and
> initrd would need mapping WC, when at the same time other similar mappings
> (in common/device-tree/) are done WB.
> 
> With those uses replaced, neither Arm nor RISC-V have a need for the
> function anymore.
> 

It is okay for RISC-V, but for Arm, IIRC, likely it was done because 
guest might start with cache disabled and PAGE_HYPERVISOR_WC on Arm uses 
"Normal Non-cacheable" what could lead to that guest won't see some part 
of kernel and/or initrd as it could be in a cache and won't be flushed 
to RAM.

But probably I misremembered something and 
clean_and_invalidate_dcache_va_range() or something similar should be 
called before guest is laucned.

For RISC-V part,
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


