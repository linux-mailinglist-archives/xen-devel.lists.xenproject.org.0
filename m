Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4707IgwvH2rhiQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:29:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30527631675
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 21:29:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aHbNLTJX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=gmail.com
Received: from list by lists.xenproject.org with outflank-mailman.1325396.1590881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUnL-0004JZ-S8; Tue, 02 Jun 2026 19:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325396.1590881; Tue, 02 Jun 2026 19:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUUnL-0004Ia-OA; Tue, 02 Jun 2026 19:28:59 +0000
Received: by outflank-mailman (input) for mailman id 1325396;
 Tue, 02 Jun 2026 19:28:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wUUnK-0004IU-Lz
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 19:28:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUUnK-00Ci2G-2x
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 21:28:58 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f2ed3-bab6-0a2a0a5309dd-0a2a4502ae38-36
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:28:58 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a1f2ef9-af86-0a2a45020019-d1558033cc37-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 21:28:58 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-490a7629380so29207815e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 12:28:57 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-148-111.play-internet.pl.
 [109.243.148.111]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b0daefbbsm148836365e9.0.2026.06.02.12.28.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 12:28:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1780428537; x=1781033337; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5mi+/E3iSbj/it8QAr4SFrf7baCNi6gWWFfdMvKv0VU=;
        b=aHbNLTJXcXgHXzCcijEzmfZmidZ6XybF7rDuiRNh0p6qn5L366Q1hS5YT2yNcUQIrI
         H+uIhj+0FTC5Fc6m53yy2/3Q07P0gnPD2X1tkfU4Gx/iNp+CF2fvitk1f5ri1AGWNQLK
         0Eem/8UoSovjLIwZuzWqBpkLU4rW9vNZCdhiUicwyNRe+Cly0eoiyBFV8kJuZT74nbXT
         rXQwzgIN+wRaF3uxJX27gBYxYyWNjGNypnIa3Am5X4dxw1LxHUhqW7STI3AHI6hON1Ks
         putavJ3r3TXHc9NdmQi15sxLsDer15WM7XkGRFSZHkDHdDKXYV7t5EMJYwKurn4Oa8aa
         /K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780428537; x=1781033337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5mi+/E3iSbj/it8QAr4SFrf7baCNi6gWWFfdMvKv0VU=;
        b=bwn5CK0ZCZSltr4O3ZqBaEKMGWS9pikO7Aj3tHYTXwLp7Zrupnrn+zBJu5CiOJBlmM
         fCmwQTJ25W9DRFwgHZV1sNUtbfsNm2nfzvohzSVCZTvXjR2wU83FN+7bhEfPtfSvOvK5
         YYQnwMLK0cNwbX0wJdxzL4oue9QEGN6LWW03mGftjzd9QJTSd8kfTsgac/s7HGs8EukQ
         S/+AT/GnjzMbERxWwyLmt4RN02Q5mL5sLZh7RBq0u1Hv+HqmTFPccd7Srx0bOSzF1Mrk
         D3ldVawvo9YeZbvLCpCcAYlq/2ZaIAcXB09d+62ETyTaJiqb7CpCs1TbFl6akMpjwqSG
         ZDOQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Da2dfnh//YJ+WPvu82NdqYUuvS8n9qk9O4l6mmmSysZoDhnGafksPB8ZhqKeNhc0mjlBoAbZioxM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz6INWuC9wgG67z2U0SJ/3xqBiBBMicw7x9jjbS5wOG9bjmE/dr
	VgPZkOgczYJAOuL/JD7TJsCOCLkEo4tlPQKqL1PshyjSQeXaqX3EOQpl
X-Gm-Gg: Acq92OENAOU+fQNQ/K9coKI8qYB7oev9RfSDxPNYq6jsV0tORuZFlJ8B8y2cAgckG02
	pAXN/tW6366MotEEWgqLYsJLqrZrWHApkMPQ7ODG6IVbSfkKf2DJDZ38f8a1TRRrBQfFVshVWZF
	Z3UStHNLUgQtLWg2viUs+nL2mVLTunAKGo+QdC2RTYr3xbxDJGZmCKxl62+HdPu8cNEVFjTNtBk
	fbmBBCLQDVk+V2dzSrt2u51oQJGvZxkmsD3s849THplGdoIPqFjox4WPwyRBFYFUps++RiNVsZh
	2svKqXYEo4yP7Z7KuJltr/S7qBMuIr3NP8lFRwLqwksFy+iqKN2UNa6ShwBBCQSyAcEa/IzMcoX
	mcTN19CYBxkUtSAoDxaQaA9ojjb3m/Q38t7RCBefKdYxPpi2KzDA7PbNllvXxyI6jMf64LC1M6f
	2FwY4HFwImmAS7paFE0soZHLt6txziwLsYihl/VWi3Umol3+LoOJRQpbxzVNmk86Tc/uvW+JwWn
	RHnD0W++pjzxPD+dNsMrKCe0u8=
X-Received: by 2002:a05:600c:6092:b0:490:b3fe:9732 with SMTP id 5b1f17b1804b1-490b5ec3f9amr3702525e9.16.1780428537400;
        Tue, 02 Jun 2026 12:28:57 -0700 (PDT)
Message-ID: <03871ebf-054a-4c9e-93c5-6131e06ea352@gmail.com>
Date: Tue, 2 Jun 2026 21:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 0/2] Finish fixes for eclair-x86_64-allcode
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20260602174629.2649448-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20260602174629.2649448-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1780428538-81772161-372CA5F7/10/73395122804
X-purgate-type: spam
X-purgate-size: 589
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30527631675



On 6/2/26 7:46 PM, Andrew Cooper wrote:
> Depends on Jan's "[PATCH v3] x86/PV: drop a local variable from
> pv_emulate_gate_op()" which is ready to go in but not committed yet.
> 
> Andrew Cooper (2):
>    x86/shadow: Deviate multi.h as being included multiple times
>    CI: Mark eclair-x86_64-allcode as blocking now that it's clean
> 
>   automation/gitlab-ci/analyze.yaml | 1 -
>   xen/arch/x86/mm/shadow/multi.h    | 1 +
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 

Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


