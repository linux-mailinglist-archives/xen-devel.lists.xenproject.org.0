Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZukoBk8/Vmqg2AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 15:53:19 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEFB7555E0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 15:53:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H27AuHiI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1362399.1614225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjdZD-0003vu-Ma; Tue, 14 Jul 2026 13:52:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362399.1614225; Tue, 14 Jul 2026 13:52:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjdZD-0003uZ-Jg; Tue, 14 Jul 2026 13:52:59 +0000
Received: by outflank-mailman (input) for mailman id 1362399;
 Tue, 14 Jul 2026 13:52:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wjdZC-0003uT-4N
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 13:52:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjdZ8-00HClu-QU
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 15:52:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a563f36-5cb7-0a2a0a5109dd-0a2a450bba3e-0
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 15:52:54 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a563f36-b7e8-0a2a450b0019-d155dd34edec-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 15:52:54 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so968926f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 06:52:54 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f464c9cc3sm8414148f8f.35.2026.07.14.06.52.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2026 06:52:53 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784037174; x=1784641974; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60l1e0O0aoeO6Vx/gH/z0qYyLFtXwx6sJzK99Dd0I2Y=;
        b=H27AuHiI7nTau1idnQdH25/XEm5UtsRGCi+9jeUH8h7fJDYcy94evc91fXJ+x+xhAn
         PyU313jwGQ3qV6P8a6ejTOTRMi3gHjDS5cmMdZXcWrv6dcXufSbTaYwexOMUb+bXuI8L
         xVNnSq2183kwNN6u1Kz3Esg8J6k0Lw4eGxXHEg7sZUBR8Besn1tUnfgv/uYZTF3by/XX
         yeyEJ70FRuumatQmXxRkRuuXIeA16s6yeE5pDsVFCv3LHY5GFWiirKmI2bkGymACBrlY
         ls58PVWRQrGZKBryrkKvSvRcyX5xK4+5frIXWLQvZrS50YGRCnMiDBEY5dYFNmPQmK/9
         QMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037174; x=1784641974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60l1e0O0aoeO6Vx/gH/z0qYyLFtXwx6sJzK99Dd0I2Y=;
        b=L1MP2dS4c6MyBbBmJW0Fos0ZTSmc4BHqXVtimIevT/RYo9oRA2PxDeU3BO1NNBBQrD
         ZGUWZneAFyjDUVbKVytH9fKFNP3z2Nr0rGDGFhZyg2llepIOeQbcWewcmY0HSzqj/+fE
         Nil6rra9PoRk0L7P8PCjS9hycxiriDbAWyjfVeV6ZbycWO+3qKJPATWIbysqMJ66s8fK
         iVotyB+S/KHF2NEvvss0NonCw6eQhQ0S/0Lm8L24EJ2pO9xa36r7CDU5SO7vPlOWzJR6
         IREuwUn3QiWLQmRbGPi7/Uki0DVPCPinkvBxl2wz5dnRO403bGJ7CBUCnbHWTOB1IUI/
         M7jw==
X-Forwarded-Encrypted: i=1; AHgh+RoX1Yt0IcIQ7uJ/uCb9XmsLIfAdA3ZItGY6fYUXIipJV+IqFaqebqwqGA3wVQSv9qB7ISkBq5jsfFI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnlKjng1SDkvvtYe82obgLag1/P/Asv9kUP8cRvm6zGlI4xsSv
	sBbNEJGvv8c+FVETMWzLj26Y1UoAdPE3i4sxNgY+lTa0I74U8a6ioW1E
X-Gm-Gg: AfdE7clJa6T1SrqlGcFrnZFi9LaksKKI+WgT1I4XP0eRDrDbufO8MBueX5do3nrXitu
	HCK+LH2xF6qyBLDEMF5BtLltU+vQtCSUp6WRgLWlP229OvfZWJNqzNeNVF7SUfRXwoeNlOdxzsb
	Q8Vpmdwhqa3rEu1Lza/47Ysy68kY999Z8/8LFYFkt9/24o5NSKdYdPZwO8vejWZLlWHWoQ8kL3f
	9mjKSrGdO8x6j9Hmc8aLar9tcbBegg+EKXloVYPt6KvQJm/grV7F+ozEt8HQtXfuZQJxQIVOvss
	WQLERJbTkNjdzPlzB+jTlQlLUOV9C3N+oZ2YMcKtfVp8nWoxbnnnAaH+0fZC4vj59j3hueByy0N
	vDoAyZej0uyp5sgO/u8BfPuBW1/fYXv6oIUgNkyNdaLgZvRtgiUBvL4/9P0dqjQSauRRwYaUZI8
	keZ8wh779V+UW2xAeNR+FfgQydAbBIfB3dq5xQ8qxkE/Pm4B0LYY4Ta3B8AHOBDGJIqrE=
X-Received: by 2002:a05:600c:8715:b0:493:a96b:fa0b with SMTP id 5b1f17b1804b1-494012e2f40mr102138825e9.24.1784037173834;
        Tue, 14 Jul 2026 06:52:53 -0700 (PDT)
Message-ID: <bbc23afb-5075-460e-a6d3-1e6bc7f7675b@gmail.com>
Date: Tue, 14 Jul 2026 15:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/pv: Only use the guest frame in
 pv_map_ldt_shadow_page()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <20260714133546.1686108-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260714133546.1686108-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1784037174-1B6D29EA-AAD887C6/10/73395122804
X-purgate-type: spam
X-purgate-size: 1934
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,vates.tech:email,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 1EEFB7555E0



On 7/14/26 3:35 PM, Andrew Cooper wrote:
> pv_map_ldt_shadow_page() takes the whole guest PTE, adds _PAGE_RW to it, then
> installs it into Xen's pagetables.  It has had this behaviour ever since LDT
> support was added in 2003.
> 
> However, it allows the guest to control the software available bits and
> cacheability.  This happens to be benign right now, but is bad form.

Considering that w/o the patch guest could control such things ...

> 
> Use only the guest frame, and construct the mapping as regular RW frame, and
> notably includes NX.  This is how the GDT logic already works.
> 
> Fixes: 005c2723972f ("Finished virtualisation of x86 LDT")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Teddy Astie <teddy.astie@vates.tech>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> 
> For 4.22.  The security team have deemed this not an XSA, but it came
> alarmingly close.
> 
> This was found originally in an LLM review of the ASI series, where a real
> vulnerability had been introduced by using one of the software available bits
> to mean "please free this page on unmap".  The LLM did not the issues with
> attributes (the guest could almost load a Shadow Stack mapping, saved only by
> the forced addition of _PAGE_RW), and the cacheability (saved only because of
> how conflicting MTRR and PAT values resolve).
> 
> An interesting commit is 928a6621db20 ("Fix bug in new LDT shadow mapping
> code", 2003) which did restrict to the guest frame only, but without inserting
> _PAGE_PRESENT or any other attributes, so got reverted in the following commit
> 6841936e9256.
> ---
... it makes sense to have that in 4.22 release:

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

