Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l3i0CPhKMmr3yAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:21:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B269722B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 09:21:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=k4x7bVdQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1339849.1600929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkaI-0005GN-FL; Wed, 17 Jun 2026 07:21:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339849.1600929; Wed, 17 Jun 2026 07:21:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZkaI-0005ER-Ce; Wed, 17 Jun 2026 07:21:14 +0000
Received: by outflank-mailman (input) for mailman id 1339849;
 Wed, 17 Jun 2026 07:21:13 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wZkaH-0005EK-Lj
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 07:21:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZkaG-007oDQ-AM
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 09:21:12 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a324ae8-e002-0a2a0a5209dd-0a2a4501cf50-0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:21:12 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a324ae3-c1f2-0a2a45010019-d1558033e1c7-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 09:21:07 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490b211ee6aso41082555e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 00:21:07 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49233bf0881sm43382825e9.2.2026.06.17.00.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 00:21:06 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1781680867; x=1782285667; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xeB/gI1GE8mLPA+bO7WEC99JJgOHJBSpoTGleDpIX4M=;
        b=k4x7bVdQKFwZXnaVdF8h8dH9WYfYKSqsrNGAD3uf2JvslWo2QUXo1aJ9S30/72AWH4
         y3PODafhhYSj9eLEtPdzFQrOcuJckvON/37EL1Dol+K6Uht975zV0R+GJ2nOsWh/E3f2
         gWVySw7SFu7oeb85VZXjf8WGvTSqe7f7qoEJaHMo7BNyUrAwAx7OoKtWoYkp2z+kFdXo
         38RSUHfD3wnt6qWdD91/9IWbWNnRsBwU8JoNAY8dKNz3bhovzlwvVUrRDk+qjZ2Oy6P2
         7b9YHQrQNJi7wp6DYm8khej5+O1ixL+N4AJT4jQeAl4/v0Z4VSjVpuves22z5/IAs43o
         XN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680867; x=1782285667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xeB/gI1GE8mLPA+bO7WEC99JJgOHJBSpoTGleDpIX4M=;
        b=Ww5WKD0W9gGTr6wW9uZ3jwb26DPefUkkDIHbOKFVr1uMBvdMcd1hcwxZA+SwE4V6H5
         hRI4x71Pq7+80V6e05hUMGZwRIPIgWDegakV27ix8Htp2YmEaeZ6bGI+9lAInL/lKCQm
         5F7EbgbXPXSciTIx9IopJ/OvlStH06eGrP39pQfWRTSls1DRo8/A3T8850J1JMU+fxYk
         4NJzseofvPngwXlet8+0vbTqLBBTlooxkuoN6wjdAZVPXrc9lWCxH+pCjPI6PPAhVdT4
         Bsx9RAdCAlDqUxdM2li5LTFIrVG/OFp76tcxIfTfm1HaSD8LCA2TXVna2kmDUYmx5QHb
         Q1PA==
X-Forwarded-Encrypted: i=1; AFNElJ8JHm2TjnER1gY/iIEgVgg5iZoy9jxzfklsC17MlwigXDe8sUhzbboukPcE5KsKjJo/2KIRKxojIqc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzDm/qAEdXWcdctosHau14Psv+8eT8HZnPtjLavM238T9iYorF
	SJeW2SS5sjN9+E7ha9hYez3D2B28GKZg231bLtPrDOmfSCRmer7bMfPo
X-Gm-Gg: Acq92OHXG+EbC/UFccS0YBUdBuVvz+e+9ixP3m9+XoOixLmc/WJvjfQqXq+aAjrf04S
	UuZJm3a5M+FT5GeSPZCLjXhFLci3/7u0l+Ae0W9gwgJis0WIh8kGnEdoSSndqKxyKc6UkVG5tOD
	Vm0Q5Tt4L1u9V0Uyjv4RetYl47RSKS0evXIKNakUEXhB10y3z3LNSZxoVnf8z07hw33Js+RVNjD
	vr14xg0rU3+1xtKsWB9L2F1HYr5n+XcuM3GGiiKhMpwzMt4B3Vutmh+TJGQV7piEodplJAFiqyb
	YsT9us32U72bV112BgwmHj8DUXn0U6Zepa6lvQjMJidZyRfGsa3QPBSOqxtV1YjRYJTBeX5+lmh
	r0VwhPjgS3kkf1KCvFWlKy4tDLflXvj2KQbCKUVrqx98YIuwqDzrnXhEA00+2NIo9aWneVnRECf
	cwCSjcWhPrEc6GgTxx7+kkMGDZW+ypsyUUPp5WbkIjTbQzONCVShhDIO/SHmjuIq6e/aQ=
X-Received: by 2002:a05:600c:19cb:b0:490:bb45:79f0 with SMTP id 5b1f17b1804b1-492333ba306mr44103435e9.3.1781680867237;
        Wed, 17 Jun 2026 00:21:07 -0700 (PDT)
Message-ID: <376a6bb5-d4b2-48be-a549-f47e19f5447a@gmail.com>
Date: Wed, 17 Jun 2026 09:21:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22?] domctl: correct return value of
 XEN_DOMCTL_[gs]etvcpuaffinity
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <8b7daaa3-418e-4ec7-90a6-775e0a964b76@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8b7daaa3-418e-4ec7-90a6-775e0a964b76@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781680867-AE342FF4-8D531EDA/10/73395122804
X-purgate-type: spam
X-purgate-size: 732
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,s:lists@lfdr.de];
	SUBJECT_HAS_QUESTION(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF3B269722B



On 6/15/26 2:00 PM, Jan Beulich wrote:
> cpumask_to_xenctl_bitmap() may return errors. Clearing the error indicator
> of an earlier such call by a (successful) later call is misleading the
> caller. For "set", keep setting soft affinity if the hard affinity copy-
> back fails; only accumulate respective errors.
> 
> While fiddling with return values, also drop a redundant clearing of
> "ret". This eliminates a Misra C:2012 rule 2.2 ("There shall be no dead
> code") violation.
> 
> Fixes: 6e4ecc6d5884 ("sched: DOMCTL_*vcpuaffinity works with hard and soft affinity")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

