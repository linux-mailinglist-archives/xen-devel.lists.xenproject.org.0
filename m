Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFtRGNcY+2mYWgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:32:55 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 100884D954D
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 12:32:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301543.1575817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZYW-0004za-5r; Wed, 06 May 2026 10:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301543.1575817; Wed, 06 May 2026 10:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKZYW-0004yC-22; Wed, 06 May 2026 10:32:40 +0000
Received: by outflank-mailman (input) for mailman id 1301543;
 Wed, 06 May 2026 10:32:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKZYU-0004y6-5F
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:32:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKZYT-00HPHb-IP
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 12:32:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb18c1-e002-0a2a0a5209dd-0a2a4501a0cc-6
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:32:37 +0200
Received: from [209.85.218.48] (helo=mail-ej1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69fb18c5-c1f2-0a2a45010019-d155da30b8ce-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 12:32:37 +0200
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-bc2a455fd55so434809466b.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 03:32:37 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bc55b58f0absm69591266b.20.2026.05.06.03.32.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 03:32:36 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778063557; x=1778668357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=674s1EDjc3odfMCU7/qashpeTBsZFWCI3Re0YZ92NDY=;
        b=n3iMVsILj4Sw3PL7rxop5xb3NxJiPOn6QODuiapeoW1rTmYGPFhh6+e6flfNSWRAhr
         vMw6z4Q4xE4tEcY5nvRgVqZ5/Ji1EG3eKmDKl609HRJvGe8h6tgkvOsfXlJMkvHnHkJF
         kIlSWnFH+gn3+k+7mIRJs2y6uVSLPT+od3Fg61u9mKV4uhkkSWnWLV7LB2sz6vT6MQW0
         pH+EZQXqmf4cw6fSui/NFE4suG+QxXC/9UpvOgFes5Lwt9+yCrw2L4q9i1PFFh7ZtmsD
         9eyvl8Axh2AEpKLjUFpJHxOs+J/PeqxnNlWigrirVLrdUvBzevuehtpLPTgnBVzQiCj0
         IOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063557; x=1778668357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=674s1EDjc3odfMCU7/qashpeTBsZFWCI3Re0YZ92NDY=;
        b=QQSLya2mE/MJURv0xU5EsYvg4P5KUXaeciJf0Z7Y+rpx+2XFnl7MQLpA5l0w74d0Im
         5pzhyLlnV07kvaRsrwPLbbOVtULNjJ/BGOW9v1jJT8RbJ8lWiRE0j/8JpCy2TENY0TOS
         /kNVOJ+SFu1evAf6e5kPk0UVtGPVbKfcEjlmAAvxuJjjwA14cJNLbhi22WT/37BI361p
         rk8Ivw2CG1RtfTnr3eqruQb9e/n2qmMFztAIE5nvFZ0SEPxyjtwNDI6X5cGJqJatYOaX
         x5tYZN4jtR3qS3/vRqMT1JSsLgLH+L4T/8bPmSaTN9Hj/TitEGXnQdrWQpPYPBjFM6ql
         +e7w==
X-Gm-Message-State: AOJu0Yzg4Srqei+/ZpRHsCMRWXI87DDhb1Z3+AL6uRryS7+k9SLBYi/v
	MhxfrKzcBV1R0ma3nR3moHqCGpWRrTFVRLrIxYq7y+dEVbUkI6WYkoU+
X-Gm-Gg: AeBDiet1d7IVieLwoprGlr5wBdDsC0DOyRBciL+XSyurGM7c8WUBav1fn3fL0Xtb2xX
	6gC/VuAL824TQdp+57WtY9Gd3TVfSksna9HgTcvriZDppB8HgrlzD4iyYT+AQ2ELOC/u+OkEhY7
	P6phlvGVfFQnnVBGE9ruww6/gw3epNC6GkOricdLe6cB1iYB46vfq4LUtlIcRzZoAumJkvDPy52
	igN/HxME3CfxPfwkGLnuCvoy1me5eXZ56NjI1T2jd5jCQFm/+/nvUxG06CoWTC36oPPOYZ61Yl4
	PyMESvqDwmo6hlb9JqeeivBvr5Mtppzu2WBmbmz3AdejeTGCWwS0dRE7vqpgeYvvLlpbTvYd7pk
	yeLIaoU6vvALibqWr6dzwSs0Q/WgxwU0bCzOyycXLoSrn8xU+QXNdFJLDE8nsftAtj4k9fCyun6
	+HOvFn9AkY7yLey11MZNYFg84c/Z3q8w508WPJMhkRsqv+ePK0GxHAuxHh+Cds3+5SmcIAs9BBO
	7h1zDb5jws7Xg==
X-Received: by 2002:a17:907:c80d:b0:b98:40a3:aa0c with SMTP id a640c23a62f3a-bc56cc31542mr131636566b.24.1778063556590;
        Wed, 06 May 2026 03:32:36 -0700 (PDT)
Message-ID: <75b7446e-ef11-414e-9106-3ad8678e9966@gmail.com>
Date: Wed, 6 May 2026 12:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] xen: rename p2m_ipa_bits to p2m_gpa_bits
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <fcf48e61d270fd4665f14f43095b3659e528b376.1777303844.git.oleksii.kurochko@gmail.com>
 <A729DA79-3FD0-4290-8D9C-8792A16E1B8C@arm.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <A729DA79-3FD0-4290-8D9C-8792A16E1B8C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778063557-AE143FF4-55A0E1C4/10/73395122804
X-purgate-type: spam
X-purgate-size: 1289
X-Rspamd-Queue-Id: 100884D954D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Bertrand.Marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,arm.com:email];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

Hello Luca,

On 4/29/26 5:15 PM, Luca Fancellu wrote:
> Hi Oleksii,
> 
> I would rephrase “xen: rename p2m_ipa_bits to p2m_gpa_bits” into something like
> “xen/device-tree: use p2m_gpa_bits in common code”, because we are not really
> renaming p2m_ipa_bits, we are only defining an alias.

Make sense. I will rephrase commit message according to your suggestion.

> 
>> On 28 Apr 2026, at 15:33, Oleksii Kurochko <oleksii.kurochko@gmail.com> wrote:
>>
>> The IPA terminology is Arm-specific, so rename p2m_ipa_bits to
>> p2m_gpa_bits to use architecture-neutral naming in
>> xen/common/device-tree/ code.
>>
>> No functional changes.
>>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> Changes in v4:
>> - Nothing changed only rebase.
>> ---
>> Changes in v3:
>> - Introduce #define p2m_gpa_bits p2m_ipa_bits for Arm instead of
>>    renaming of p2m_ipa_bits to p2m_gpa_bits to keep Arm part of
>>    changes clearer and keep using Arm-specific terminolgy inside
>>    Arm code.
>> ---
>> Changes in v2:
>> - New patch.
>> ---
>> ---
> 
> If the maintainer agrees and the title is fixed:
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Thanks.

~ Oleksii

