Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OB/9Dxr0M2raJgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 15:35:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5426A09A2
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 15:35:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=YLnXOa4c;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1341185.1601696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waCsx-0001xz-MH; Thu, 18 Jun 2026 13:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341185.1601696; Thu, 18 Jun 2026 13:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waCsx-0001vd-Ij; Thu, 18 Jun 2026 13:34:23 +0000
Received: by outflank-mailman (input) for mailman id 1341185;
 Thu, 18 Jun 2026 13:34:22 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1waCsv-0001vU-UT
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 13:34:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waCsu-004Cga-OR
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 15:34:20 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a33f3d4-bab6-0a2a0a5309dd-0a2a450ac944-34
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 15:34:20 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a33f3dc-93a5-0a2a450a0019-d155dd30ddbd-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 15:34:20 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-45ef779c1c2so761357f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 06:34:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26f1cdsm65866714f8f.11.2026.06.18.06.34.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 06:34:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781789660; x=1782394460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zd2wI4707PnIvtBCYLcVEyiMf/ibHw6tggtbvJmeoxQ=;
        b=YLnXOa4cjw4fb0WFqK5z1GugtjhnjRNWUZzCEBqV7yGw8+gWc0PfEeL4+wTNtODRC4
         gWvKfygKLjmQD+xDqgAeFpvSnK46nq0cNsBhvsY0eSBqUuRFq6K5lZ5YpiIws8FHdq6L
         LqhqJxdhMG7ViODcDJTRIJ0MJfsuibnmznsbGYscn35AFQ3Y9AsZuD7HiMb7RvzYgmw6
         j0avDBFQOVIv+giHJDiomc6glmfrPluAz4NJvkC4wGhR9wgmQa3E6ace2Hkb5h/L/xCc
         VTbX62M6F2UYSnigncAeCtGW6lZ/R/cCAbUtZuuftkLfGP6mTum4eE/weYUbplqH7APY
         jHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789660; x=1782394460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zd2wI4707PnIvtBCYLcVEyiMf/ibHw6tggtbvJmeoxQ=;
        b=Y/KbUmfTZLbjKEmxQthVhDkF8pP9XxCPxaRZxNqLVUt7sOuw7TeG6jIiYpupdTA+yQ
         prEO8ManjjIfndQn6KzjF+Q3aiyhJhRuqAJ5uOmYQsIexVGnZoZ5CCVlwcvAI5/Tk9eB
         cZzNhBcJVe9k3C6q1FlKGDXViLV8PpACvVDbCg7Zu7uY0hA3J2WP6LrMli4TJhMjp7IX
         gsxo5IaszrXrNV+Xj7RNBNJmvsu6953Cvi5L+GGfgveYIte/RIIR2W36g8h51iVwdLYB
         FUxDxCa6hrr/4Hn+YyvgqUS0rRCJeICEfh5g4Rv6a4qyZJFg3Sa/yrBYBEgCtco53OmU
         tLrg==
X-Forwarded-Encrypted: i=1; AFNElJ8z824ripkniHWFY9zgwh8XXdLwPR/A2AHVjYW6My6t3/XeMCOIqTY4DfHsqCw9fJZtwlOq/Xpx29I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyfZA+JwLJgwGv2tBci5U0PN/09nY+OC5oytM7pYzdYtK9ifA1z
	+lskYWrw9MxeGUicUv6BvxO6do0dzvjUfUjZDpjtOnSsfe65tY1ikNGV2pJDpw==
X-Gm-Gg: AfdE7ck5uITMdwHNhwwnhPVE2aelTa0TQ13OKBSfW2H400MY1QCAZK0pGj+DGm3mxlN
	vBJofAKSUKNL3asloo5WWLGHHl5MJKUDqnKo30V4a/r+PHYXAb//AzMOOQp0FlewNlOdvbqyAW9
	dXP4QQrFM0lynzDIljIXlg/gDC2wYU2iD79UWZs3Itmj7O7X5V8du/SVCvpUp1HsJLpPZzDQSn0
	Co5iK8abgfIgJnhnNmE7hIUcbovcpdAtyuA5dLcoaVXWMAjMhxSfacZqdVQ80tpFnac7OfUa8YE
	wCnUm5fTnGO6vH/JMuqRXa5b6F61r2KcCyGczGw0uWO0uhAqssL9CFtJ7RHcpmOor2QAPZ5lZlp
	9WUAxAUEfAqxBO4AVwLz++buSIRlXbNle2WsydxFRaHVVeH5R+omLRgfklH5D3QaCEl56Ale+La
	xrzzBMUgkFjZ8n63op9pZ5SDO3EouVBd3IUrBUAPag7AWbf1Z9u+YeV44j23acs7v+U9M=
X-Received: by 2002:a05:6000:4e3:b0:461:a169:f965 with SMTP id ffacd0b85a97d-462389d4b5cmr10310013f8f.34.1781789659872;
        Thu, 18 Jun 2026 06:34:19 -0700 (PDT)
Message-ID: <b349ed39-1101-4fc1-8d16-d8c34922719d@gmail.com>
Date: Thu, 18 Jun 2026 15:34:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1781789660-2D5F0DB8-957773EC/10/73395122804
X-purgate-type: spam
X-purgate-size: 674
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE5426A09A2



On 6/18/26 1:32 PM, Jan Beulich wrote:
> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
> hypervisors.
> 
> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
> those for xsm_page_offline() (where the hook pointer field already is
> suitably guarded).
> 
> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Release-Acked-by: Oleskii Kurochko <oleskii.kurochko@gmail.com>

~ Oleksii

