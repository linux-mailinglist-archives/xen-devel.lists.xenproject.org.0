Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /2AOA1P0HmooaAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:18:43 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C194362FAD6
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 17:18:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="O3/K2gQo";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325204.1590701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQsz-0001YP-9q; Tue, 02 Jun 2026 15:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325204.1590701; Tue, 02 Jun 2026 15:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUQsz-0001Va-6m; Tue, 02 Jun 2026 15:18:33 +0000
Received: by outflank-mailman (input) for mailman id 1325204;
 Tue, 02 Jun 2026 15:18:31 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUQsw-0001UB-Ui
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 15:18:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUQsw-003iOB-BX
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 17:18:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef43d-e002-0a2a0a5209dd-0a2a45038df0-16
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:18:30 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1ef446-672d-0a2a45030019-d155802ddc06-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 17:18:30 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4905529b933so90481505e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 08:18:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0e0de7bsm63855895e9.3.2026.06.02.08.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 08:18:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780413510; x=1781018310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GYtoQ47HHvtPQamML1SW4ZLfM+uN2HxTVv+evuobLs=;
        b=O3/K2gQomBcE7NWdJAlXG2GhpI/cgncfetakG9QCBQ7pOB7Yb0SJCEsOZzSQKNoQY2
         tfnvle19sqJtV3CTrXel/0S9Qm/uLZlsz0T8YNOVqXqSh+zgn+uhAE6LpsDnS0IW5h+O
         llhP9XzWAFpe5yMsYoVuj3AKJZCm581XhdQD8KLLePoThrH6fZ+e0UpzXRqW1m6bdTHm
         yEiF1vwR/n0t90ONMMwNmVds171i2agQ6B7pbPOHPCygxoKRRIOabhSX3A3scvjacV8W
         1ofK9fS0QftpCAl8o/YDnMoFJFP3oaVGxL6igD1wfWEHrmjLcbplrZZ5Ffum1FcNIyFe
         SMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780413510; x=1781018310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GYtoQ47HHvtPQamML1SW4ZLfM+uN2HxTVv+evuobLs=;
        b=VDvF6GxsPr+3p3jkv/e+mAiEXYWnzsRTDLpOVuRslMYrYsSt5nY9oYXRCBU59lNEJt
         +GJ5ZKji4iaR3zCzy70ZdZJwaBN6/84rQTFJxuryMELd9sfwvirkJdypEarAZ0lAZpSW
         iRbHcwve1ojXYqCJqyIE/B4bESvF/NrrvmK1j8dH0JeGObqP1xbXhkjZTItcEzRtXfwg
         0HHzi6A13Lfri9fbHWgT5RK6m0Kn1wOA3WGzAsTY8WgRZQ2I1+LaSHhF+F+k51vJ4d5/
         ZZP62vsmd8s1tDeBLaSKZMqsVTwF0O+OaeRFJ9W/H5uEhxP/XJatTLaphHqTdzZeW7Ys
         LHgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+xu+A6e6AS/wlCbkZDzsHSuC/Zg2LlAHARMp6oRhFDTYUFVorouAGrpY2PdDFViDYPOKPM8CnXSEE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNy0x8xQu6zWlBDGX5fcnL9mwbkEFA5z+OuSQWDyrpPJtwhsMX
	yxUbXQNQVmHtmMCgTWGQCtegVmsuLIpdcGm1Y6eEYADH0fFc9CNKLFeg
X-Gm-Gg: Acq92OGbQ+UYbfq0sN7ovpL7WvnTVMKVt5Pw6UDLNPfTRU9ebeehRKhSL166kwG8e61
	D/GvsA0PQWzyTafd68Asr8QqQeXjfjszvYYXFsOiLbGrXEVxPNMscF+0MZWT86/gviBirS1rOjR
	gPx+e1feoBkMnzkTD85Zuo49Yn/bJ3HZspUgv0W897s2HeP1O7hjlBBM9J7kvqEfehCLIdM71U1
	914RVvsKdIOZzbjzxjiqVmf/Sk7RHAF5yeZYxBweE7/IqTCBBSGwnwJwmlAXFvcKm06WsYqQYe3
	EhunwwWmmAATCb8mjQeQMabsSCNGVve7GmbH4eneOqWgPpBxpTnnQoagNJuO6+qfZg3TWHwATPh
	XGtml3hq4Njtkfbmz1Y5E9IdF0Ch19Tn4NdOGs9//RNkS2wL5ZqfFVI7R7icRXUOpKaNYXRwL4M
	HzSGW/9J+LCIhGSFElwatjLRR2PMh92zgQt0SJn7AdZ9Is5mnoy1LpdforZ9y9+SMTkKLnOHNU7
	+GqDiWSoDcVsul+
X-Received: by 2002:a05:600c:1d0f:b0:490:a2dc:1612 with SMTP id 5b1f17b1804b1-490b5058804mr3064695e9.10.1780413509580;
        Tue, 02 Jun 2026 08:18:29 -0700 (PDT)
Message-ID: <9ca49af6-a7d3-4c08-98ea-df864d5da1ca@gmail.com>
Date: Tue, 2 Jun 2026 17:18:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/PV: drop a local variable from
 pv_emulate_gate_op()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <a8a84f5b-05b9-4038-807c-8151cc705583@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a8a84f5b-05b9-4038-807c-8151cc705583@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1780413510-3B360938-99628763/10/73395122804
X-purgate-type: spam
X-purgate-size: 984
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
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
X-Rspamd-Queue-Id: C194362FAD6



On 6/2/26 3:52 PM, Jan Beulich wrote:
> The inner "rc" shadows the function scope one, thus violating Misra C:2012
> rule 5.3 ("An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"). Drop the inner variable, as
> there's no other (later) use of the value it holds.
> 
> No difference in generated code.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Use alternative approach.
> v2: Re-base.
> 
> --- unstable.orig/xen/arch/x86/pv/emul-gate-op.c	2026-06-02 15:15:17.960392177 +0200
> +++ unstable/xen/arch/x86/pv/emul-gate-op.c	2026-06-02 15:40:58.000000000 +0200
> @@ -287,7 +287,6 @@ void pv_emulate_gate_op(struct cpu_user_
>       {
>           unsigned int ss, esp, *stkp;
>           uint32_t value;
> -        int rc;
>   #define push(item) do \
>           { \
>               value = (item); \

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

