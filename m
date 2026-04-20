Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM6YDLRN5mkgugEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 18:00:52 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E8342ED34
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 18:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1286332.1567427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEr2t-0006R9-6i; Mon, 20 Apr 2026 16:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1286332.1567427; Mon, 20 Apr 2026 16:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEr2t-0006Ph-3w; Mon, 20 Apr 2026 16:00:23 +0000
Received: by outflank-mailman (input) for mailman id 1286332;
 Mon, 20 Apr 2026 16:00:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wEr2r-0006Pb-87
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 16:00:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEr2q-000jXH-6z
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 18:00:20 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e64d8f-2eae-0a2a0a5409dd-0a2a450281e0-22
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 18:00:20 +0200
Received: from [209.85.167.46] (helo=mail-lf1-f46.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69e64d93-af86-0a2a45020019-d155a72ed18d-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 18:00:20 +0200
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5a283c44478so5611125e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:00:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a4187e12ebsm3002971e87.50.2026.04.20.09.00.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Apr 2026 09:00:18 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1776700819; x=1777305619; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VA4mtl8GQEP0wBcjI1x/F+/1MqBMKLX7znPGb2tiMbA=;
        b=otpd6BARvFIzlzHIReRCQw9xWnx7S0fBng3pBIwjpp2dV9dumsSGyBVO+g4ycBLw+R
         z5kDbmxHPbAJpQgVtelyUL4w7SlBPhHN18pALlypyHFiWdVaLN2uztufwX+6bdWeREAI
         tJditeIzaF7N95wU9puh3O6tGYxVS1NKboksCtx6AVr8cksmiIWBZMebSVrcaVCCGmlR
         Ar131COzb0Yu++hwGPCOy2rXrOZ8H78ZRWA0HaxwXXhZiLeTuYHmiTyzsLkSareuZTKP
         KgkyB8/JhzLHAHJgMsiorKMAw7Pmx5kVEoObj9jc2FAvmLdUj2fiH4RL3+sCrf1NcdFm
         RsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700819; x=1777305619;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VA4mtl8GQEP0wBcjI1x/F+/1MqBMKLX7znPGb2tiMbA=;
        b=SlF6ScuQOwdA8YWC+qh+VXwrQcHJ0bqwBVBUdtOdkAXCY0heV0jmUon2wMDPjM7bKD
         33wQ8fPKG+swLLXXO+XxtRcAn7suoC6ty6LJnDp/3bQiB9jGiY6Sphbhmrh5WvQXLwkj
         l15LL+oIaaSFvaqfHP7J3aTFXkSJiKm16/V+3ebfcvx5GKh8cHWj7P4AWxGQcuJHYB9F
         Grc4kfl8zTupZIhn3UnIIhT7MPD3a6N7+bpWPikQxF62FOtMYb/l9AE4glg86KGpjkl+
         IevA/rJgWpnLUcq1gE60z6UpeMANlXhLOZ2BPvVMnV08TjoNOWfEMIfgznGjsVeugJnh
         GXtw==
X-Forwarded-Encrypted: i=1; AFNElJ8MIM0d5uSE8j05B8WUipUfvRPtmgQ/FDRxbezExiKuJQtHEjqfz5GjRDpdlOfcezu9OPrEN4WTVEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymfT3CKdbihYmIEpmZwdPHAyFQTAXIUiXVyb7RPABHw4/5aQTH
	7JNJbJnftt7ii/GO4AvthyDYStaS89HQJENWOokrz8Db25YT1E/Hf7j58phfcA==
X-Gm-Gg: AeBDies+Nsu2WUzYGjS6rOtyeTU/pmXMJrIr9JXwq8ZLSKqPcabc/huU07jXtAWfcEO
	qxGg76Wi2WfWyMOXSbYLtm7ATBAoyOBxmBkhvfzWL+HrRWBL5cvFM7P/GdMG9GBPk2eIIIvzB12
	0fWUp5bAPKBCo+rJn8SaTNVlVxNGlxM9w0CPOd3/1eJy+3zEpmh7509a+Yv0zyaCFyAbRVgcgLn
	0SbHooM4wboa8eaFxZUom54pFKg7HU6gqZQgeukNr6lSBV6zX2z4dMyQbGLsptM+5bCt8BYcegz
	95VfhhtEMBFEp40MI7tGQyWfQQuAiPjjWlfc0Ijt726M6hTTZuyPvfH9nuAVCnwu3qp5+eir9QX
	O4oo+Iw27BHmJiWBJ2291TZLffrzgwZlsqrGRuqlpLk4e2ge/cn9HHRrC4shwnKcpzhF/CIL0uv
	PfIOUSSkca4sD9rQAbrbb7p7rra/7eCVr7UO58G4WEBJ5kCoich2bh5oGfZqHbzPWkp1cZrApQV
	NP+H605EeDgog==
X-Received: by 2002:a05:6512:21e6:b0:5a2:ca1d:8ea8 with SMTP id 2adb3069b0e04-5a4172daa15mr3426935e87.25.1776700818974;
        Mon, 20 Apr 2026 09:00:18 -0700 (PDT)
Message-ID: <0ef43bb8-8f0f-4cc8-ba03-c09ae4d88be1@gmail.com>
Date: Mon, 20 Apr 2026 18:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Feature freeze date for Xen 4.22 is Fri May 08, 2026
To: Jan Beulich <jbeulich@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <832ac76c-12da-415d-b598-7865ae0133ad@gmail.com>
 <d4e65920-aa03-4fed-9277-fbb7d295fcb1@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <d4e65920-aa03-4fed-9277-fbb7d295fcb1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1776700820-83961161-6A30189E/10/73395122804
X-purgate-type: spam
X-purgate-size: 868
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	TAGGED_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:community.manager@xenproject.org,m:committers@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D7E8342ED34
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/20/26 5:50 PM, Jan Beulich wrote:
> On 20.04.2026 17:43, Oleksii Kurochko wrote:
>> The feature freeze date for Xen 4.22 is Fri May 08, 2026
>>
>> Patches adding new features must be committed by this date.
>>
>> Straightforward bug fixes may continue to be accepted by maintainers
>> beyond this point. They could go without R-Acked.
>>
>> If you would like your features included in this release, please ensure
>> they are committed by the deadline.
> 
> Among the large amount of stuff which is in flight, have we settled on a
> subset which we want to see make the release?

Not yet.

I think we should either address this during the committers’ and 
maintainers’ call, or we can list the items here and discuss them.

If anyone has items in mind that they would like included in the 
release, please add them here.

~ Oleksii

