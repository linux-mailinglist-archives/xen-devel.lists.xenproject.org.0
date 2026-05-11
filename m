Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOuwNTPbAWoDlgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:35:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E6350F093
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 15:35:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306187.1578250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQmV-0000SE-HK; Mon, 11 May 2026 13:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306187.1578250; Mon, 11 May 2026 13:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMQmV-0000Pu-ET; Mon, 11 May 2026 13:34:47 +0000
Received: by outflank-mailman (input) for mailman id 1306187;
 Mon, 11 May 2026 13:34:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMQmT-0000Po-9d
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 13:34:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMQmS-00DGQ6-Hb
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 15:34:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a01dae8-2eae-0a2a0a5409dd-0a2a4505d4fc-48
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:34:44 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a01daf3-aaa8-0a2a45050019-d155802cd44f-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 15:34:44 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48e6db3ff7eso13281705e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 06:34:43 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548eb75c29sm25228969f8f.9.2026.05.11.06.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 06:34:42 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778506483; x=1779111283; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZyfSKtemJ4B5/1Xkw7Iua6vD+OSBFh12dJNY7eKBuDY=;
        b=aUmSeOLD9OT8K85s4rNsKT14lzL0TK9PfVBpW3kP4nTskAXg6uryz+I72vF637U4J4
         CwngBNnMu8Xsm2A5/MvOrNqEzeML6NWrFGyuuU5khu7DbUIy3haIIYUAnB0pLi766CIV
         squCQLXMV8AfXrQtnvr4cY+cq6XWyGgeHtqjNlW8jLgxW2/9DWRmWhendY/C5+wRqEuE
         AoBgwhzSAkOmsixh3O57mgC4rWjCnznZJIaNp5mrKj0ymTjKH8DTZJ/hhP66SFuB8tZA
         sutb2IK2yI7DGjkJO92I5qN+zs4wX6eDoDxvFkx8K2gZNyRbnyCmO6nCB6Nw0RkJ8krn
         FD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506483; x=1779111283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZyfSKtemJ4B5/1Xkw7Iua6vD+OSBFh12dJNY7eKBuDY=;
        b=o/8tZOQRQgYdnp63y421xd8FXwsIS9ACybBaA9p108c8fojlscVaQuzl/I9IZQzN6q
         o5NHkZzzSMDpVglCw/hrZcsvCL368gU10JyQejgLV06aGo3E6bqg16g3UYby7J+8gYMQ
         ITJdXUkLM/VU5Fg4yH7jtCjBGs4fDq78JwMwiHOf2V3iYjgF5ksThYjIBDIJqr3ntu6B
         JK+Ey9zBF5DvtDhmtVLME37Xa2X2NHODBCdYP8IqiKxbe7dEEYOJiByY5xU97DLm3Y3F
         hqFyQcvtmYwu2sL+1S6mAhL52gFsTSPLrGqaKgRlFht3MoFuzUHRlhKIZwBYevornejc
         mKRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3z+9QdeFUdC4s1gT7lmfmCUP9lxTPnl6oWXIk2ZbA/wrB4XxyDJSmiDqHvVZQiWAA6tG4v7XEQwU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGIy2OSQUy9gfZ0bq4ATJT6lHAXhF0cBljW1gzvhTioV4qLd2q
	W1VgGXIodLlvLqBRygZowQcRJIVghKRWEoX0v+6shb0+CplNyElMkVatHBjb/A==
X-Gm-Gg: Acq92OEcConok5LKyzqqoa7Boh9/mRtGEKANVNu57auAgKINwlradcPti+Zz+hdP5Pc
	Hs9mm8smG4aG7qhkZW3kTa1E0MeQGUb0D+3walGLqXHxVlMz/r+lsblP8qVCjq5XUHhSp+tL/iA
	G9E8y483vhts7K4K2Djt5JaQBwhkRUE/RnzHeM+8eec4A2P63lVSycFJJYeeDZvgjmxIJb7wXaL
	auQD6MsxSTyGrEC6dq6FIKC2nonCzCJSUZHyWPBHQNkSWd7O2q7FSkKnpAxl1QCJnBRjnjFR2F8
	u0Bu4ccloajLaD4gxiyjriZEIxNmo+ofpEWs4oBCmh1e/A08Ik0AkFOwBUlvmmrIKmb1M5VEost
	qJxJccZ2335PxI6YEOFnlba+VyW5ZbpKVAV2aK0hs+S3Cv3sOFeVh3PG7mG3/wuWrDb20foPkQa
	rUJfOLTjhFtOdfNYxy6VO+g+6+jE5Wk6ou2sPnCGB9bBJCZcRjWfkCLJQV6kIAf1XrArzNw7HKM
	e5JSMCYVdehUw==
X-Received: by 2002:a05:600c:1d18:b0:489:149a:f9e6 with SMTP id 5b1f17b1804b1-48e51f46dcfmr359798425e9.28.1778506483229;
        Mon, 11 May 2026 06:34:43 -0700 (PDT)
Message-ID: <58f80bf6-b9e0-42b8-9f84-831a1c546768@gmail.com>
Date: Mon, 11 May 2026 15:34:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Code freeze for 4.22 started on May 11, 2026
To: Jan Beulich <jbeulich@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
 <2a6117e6-e458-4818-9c22-0c356982eb59@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <2a6117e6-e458-4818-9c22-0c356982eb59@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1778506484-E318B443-D976BE08/10/73395122804
X-purgate-type: spam
X-purgate-size: 788
X-Rspamd-Queue-Id: 90E6350F093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:community.manager@xenproject.org,m:committers@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/11/26 11:41 AM, Jan Beulich wrote:
> On 11.05.2026 11:35, Oleksii Kurochko wrote:
>> I would like to inform you that Code freeze period is started and will
>> be until Fri Jun 05, 2026 (+4 weeks from Feature freeze).
>>
>> Bugfixes may continue to be accepted by maintainers without R-Ack.
> 
> Gives me context to ask right away: "x86/mwait-idle: sync up with Linux
> 7.0-rc" has had a few small adjustments and hence would want re-posting.
> Question is: Does that even make sense at this point, i.e. would you
> give it a release-ack despite it not all being bug fixes?

I don't see any Fixes: tag in the mentioned patch series and also based 
on cover letter it doesn't really clear what this patch series is fixing.

Could you please clarify?

~ Oleksii


