Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBSJC2h4BWoaXgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 09:23:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E053ED60
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2026 09:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308687.1580064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNQPW-0003hF-I4; Thu, 14 May 2026 07:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308687.1580064; Thu, 14 May 2026 07:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNQPW-0003eI-FI; Thu, 14 May 2026 07:23:10 +0000
Received: by outflank-mailman (input) for mailman id 1308687;
 Thu, 14 May 2026 07:23:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wNQPV-0003eC-79
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 07:23:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNQPU-00CT8O-Gg
 for xen-devel@lists.xenproject.org; Thu, 14 May 2026 09:23:08 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a05782e-bab6-0a2a0a5309dd-0a2a4504cc26-38
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 09:23:08 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a05785c-1dec-0a2a45040019-d155802ee8a9-3
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 09:23:08 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so67186115e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 May 2026 00:23:08 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fd64da1absm72610615e9.14.2026.05.14.00.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 00:23:07 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778743388; x=1779348188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBFTQsx8f1UsLchLKiSDobVzI6t4xMbQ9YQuVhMXA18=;
        b=knGYy3mTuDzZJwZWCxoobzzG8tSl3T5xP6UqrdrLpRwvLz++dUDaXsScn3YLZotdjq
         uBRRgqpafJae1ZY87/fEi4++f3wGseB+P59rzcgt+HVVewTCH9v3el5HUgfpfoIZcgTI
         B4NVeC12HwUYfOaMdavzaUGBHg/j7GOtm7JLBePWUei4xYfq2Zchi7LwdYCusK5nl//x
         lSJwqS1sXTg4aMbt3YI/POhYEfFxSk3agEs51Y5lcLiVkLnfnO5X26RF7qGJ1cmUMVzZ
         1O8wzJxooX3MDBjwKOxtcFV8s5mhtYAbMUTpqM91ayAJIc4ZG+6XUavjtKCuRX13HtI+
         BRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778743388; x=1779348188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dBFTQsx8f1UsLchLKiSDobVzI6t4xMbQ9YQuVhMXA18=;
        b=fj/iaD7hx6bGiPmDPVfsBfn2Qo5DshMPm/+3dNUjxER/KOrHwHtTwQ9m8vSjhyeNh0
         i1lI/7j1R1SoGOQz/x0sgDL1/6SbMKkFbphz2Apeu07sWCoqp6pvFZqeM4Sj2QEsmT32
         /WIg9uoHZHq+6TJTyBNdWvbw4MFjv+46OoYCNdxGI1Sr/BBIARg4Iz1JlDiFNOK2GkX5
         MXvPswlcF30X+IvNfBjbdo7KRy/vvwoeNCXKuQoPSj34i8pIGTDaBVPxk+KTY6P3o/7Q
         Jmc8iCwtsDO8P/K7kGOI7pJ/hWoakIjNhiAQmTNBMR+vydU420TsREi+n6J67UAd9iG5
         k1QA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZgLvPTdX6jDuF5LlPeZF2nG/B0u+707S8MIIAOV2Arg206sHNdeCGqyhyLTRTlprZQOibYsx6BiY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+HLc5NTKAw4oFSAmoEULSLvpMO06jaLvnt+CrzwKwPILh9tkj
	ACY8+MCNJMEC34sYcUSpYw7Zm+2qJNp7wR96HqUGdEY3fobWHf7oLLzS
X-Gm-Gg: Acq92OFv0WTvu2jaX+GKy1uSWWWcyMdqEc7vSdzpWmyWAdNGWTiRdfTrf0wljzR+SAH
	Cslahaoz9Eofkbs3kVT4JmOatjWdmrQ0TSmhlfxODmy3zCvpWmtf32On6+BilQT4WcDWGoCDMJt
	a/TQyLzgy5lyWlJRGSXxx0QJXCNfU4a1V7VEMiYFqwp5fN35N0cBXPqgb/pp5FHNehZlurJcAWF
	XkbZZu5syXYkYDk6YUgd9dRBwFUSd42FGfoIrf9QF3T293bmj0LTbTyGslTkMRGbU/lMas1e/Qy
	ByUmqMZBXWDerO2GNChe7L/lC+sLagKk1YfWmUQErm/4MNrlEKGx+U0ikKU9ZE9MlXInsAKs/MX
	6/cIELvJV1EFWwOBoElaK8ZvufRVWi32MwTTZ2m14h7azxXeHM8+9j7q0BlUzq3snI9eAcxaYeD
	JBt8cMeGIC7Fu1JvUnwjP+40ZK6kZs0iXkkJooirdVKT9XeMjznkNT8euRYnLcSIR7AptTNjlEa
	08=
X-Received: by 2002:a05:600c:45c8:b0:48a:7965:b92a with SMTP id 5b1f17b1804b1-48fcea0fa4amr92996315e9.26.1778743387661;
        Thu, 14 May 2026 00:23:07 -0700 (PDT)
Message-ID: <dafc0bf9-e02d-4b89-9731-48570f118e2e@gmail.com>
Date: Thu, 14 May 2026 09:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tests/paging-mempool: Testing for P2M relocation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20260512155540.1733403-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260512155540.1733403-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1778743388-29B7B3FF-D6B74900/10/73395122804
X-purgate-type: spam
X-purgate-size: 508
X-Rspamd-Queue-Id: D31E053ED60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action



On 5/12/26 5:55 PM, Andrew Cooper wrote:
> Andrew Cooper (2):
>    tests/paging-mempool: Misc cleanup
>    tests/paging-mempool: Extend to test P2M relocation
> 
>   tools/tests/paging-mempool/Makefile           |   4 +
>   .../paging-mempool/test-paging-mempool.c      | 222 +++++++++++++++++-
>   xen/common/memory.c                           |   2 +-
>   3 files changed, 223 insertions(+), 5 deletions(-)
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii


