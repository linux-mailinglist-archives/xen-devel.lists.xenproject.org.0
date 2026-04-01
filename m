Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPoyAKkizWnOaAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:50:33 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862E937B928
	for <lists+xen-devel@lfdr.de>; Wed, 01 Apr 2026 15:50:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270314.1559014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7vxZ-00015S-2L; Wed, 01 Apr 2026 13:50:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270314.1559014; Wed, 01 Apr 2026 13:50:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7vxY-000141-W3; Wed, 01 Apr 2026 13:50:16 +0000
Received: by outflank-mailman (input) for mailman id 1270314;
 Wed, 01 Apr 2026 13:50:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1w7vxX-00013t-ST
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 13:50:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7vxX-00GDwF-8U
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 15:50:15 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd2295-bab6-0a2a0a5309dd-0a2a4509e6aa-14
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:50:15 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 69cd2297-bf79-0a2a45090019-d155dd31ecb5-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 15:50:15 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43cf5d14d6eso3231214f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 06:50:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa?
 ([2a01:cb15:80df:da00:6d45:ff60:3ad6:d7fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf245f8a3sm38054907f8f.24.2026.04.01.06.50.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 06:50:14 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1775051415; x=1775656215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxHyxqrHvN88qc5owbRsRtQnGxMvq/IHuJE5KUREEAU=;
        b=R2H/WImVVqIes+ZPyszqH5ee7eebBnX2eKWoA4MfwdJKTFB5IjEfvLitdlxKONkDDa
         3psQ4scJSoDWHGAytorLfHec5H6BNZv2orP89TucP1ZBUljEXyQvWfc61dBjFsj9U6pT
         pr2IqHeOG9T9IdJSTaVxs+4DiOGLmpvG/dbm3pcGGGfQp2wB34ZiDoQ6hZv3vfZlPkLe
         +83j2JF0Ii/c5GQxacQGTUfc4KPVVE+SdtHRrZJxprlZdOCGe33PmTkkuNv1jSKhSw0N
         WiykSfZsP78PkFdnSAhCCaBZ8fjkjWm7Fni+C7PW8gszq7JvWPitm2OGn7D7q5lswFmj
         4WIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775051415; x=1775656215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxHyxqrHvN88qc5owbRsRtQnGxMvq/IHuJE5KUREEAU=;
        b=GmcFLunlVqgLk0DihWK95uvLRs6grVY/cgwsCywFuXyhhJCmAVOogLqZf5vk7d2xLf
         x9gqACg8OPOsXq/kG0Qeh39fWl6p/vKgzF7CJDJ8wN/dtHIYX2T2wqIzP7dvAAiWI96D
         UMjXdlFBLGdybjRGGpo3N/buvq79BM/5f1XO8ziTAynWF6r+sl7B1qhVbmO6cbJTzffi
         VzZCgC32JyMSBKtY+Lo8MY2Xdp9NTunXSfxFjImGVJOmIlWBvfwSp0z0PFYfnYIejVVd
         /d+dwKXXEGW8LDZOJPhj4gnPL5gwWNf4JYb5T+FWBZxgab+/EUFFPCccmSz6szS2Lw2M
         18cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVinYwSJgSywY0zkXtkoIfmo6AjfTF7NCuOaNr9gOqc97DaXmtW2q9zf2GFisU4sky6nvbKhdIUPqg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjIQbTCON0t+I9EnMoROdaru4D2X+5a3fTfwlGcsojHODj1LpH
	1nBms+cmELShrmQ5twYHEy9VfBOnPaBeZOR7p6kOeOVCuSCdRsVGdze2
X-Gm-Gg: ATEYQzzL/sfWKFYSEfEoiPZZuJhP0hIjTh2jBIhA8KNM82NJDOIcloQojE8EdNlhvR6
	Y/7KxGCnnjVgdc7zzg0hYGNNFwT8WvA3arOTY9E21aFqi4MTn/dtkuC3nUZiOl+heu68prm8gy0
	l0wrLZpbT3ta6jaLIf9al8A3m4IA+7kn/a/PWf54PRCQ0N1b7ZOZ3QmH60bciOWiQ1rKN8LGJDX
	70qTvEG3mKHjhQQYGyCww6QETZyxdpXmixwd4nTkrdz72Tn2GghBGamhlbNwO6rlfbaGw8c7JbQ
	fWYFixXSFcmM6bVOxj8zypIbTSPT7LcOLwiqRT/mpJGllod7/HV+SwUOA3D/HHDHE5EX1pFYfke
	jUxOEHZHcRfG0emUGH+jCbXyfsJW+TyEhln4vp24iWeymoc6vpGlGVuTSWuXHe+RvGZ8JOWHLnm
	dH4AyfGj+sbauHzBAIqs2hvMlxoSyVqllWmGKBxUDfQbb+fQ/hvGX7Mmxx5hOTB7c7WO0jIdsHg
	PWICYyGlaQ=
X-Received: by 2002:a05:6000:2586:b0:439:b8b2:fad0 with SMTP id ffacd0b85a97d-43d1504958fmr7170561f8f.5.1775051414506;
        Wed, 01 Apr 2026 06:50:14 -0700 (PDT)
Message-ID: <eeadb9f7-83d6-4335-ab72-8efb2ce4360e@gmail.com>
Date: Wed, 1 Apr 2026 15:50:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] xen/riscv: introduce p2m_gpa_bits
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <775374eab7b9868b7cabe6c76fa1b7ac2f8466d8.1774281309.git.oleksii.kurochko@gmail.com>
 <4a0f4313-2694-4986-810c-0f4eac191cef@suse.com>
 <c87ef4d3-abad-4e46-ae86-f078eb4a5f0e@gmail.com>
 <0f20593e-1cad-475a-9bc4-f4f1b38c5087@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <0f20593e-1cad-475a-9bc4-f4f1b38c5087@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1775051415-5455B152-068715B0/10/73395122804
X-purgate-type: spam
X-purgate-size: 1179
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 862E937B928
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/1/26 8:07 AM, Jan Beulich wrote:
>>>> @@ -191,8 +209,13 @@ static void __init gstage_mode_detect(void)
>>>>    
>>>>    void __init guest_mm_init(void)
>>>>    {
>>>> +    unsigned int gpa_bits;
>>>> +    unsigned int paging_levels = default_gstage_mode.paging_levels;
>>> Deriving a global from a default, when ...
>>>
>>>>        gstage_mode_detect();
>>>>    
>>>> +    ASSERT(default_gstage_mode.paging_levels <= max_gstage_mode.paging_levels);
>>> ... the default isn't the maximum possible, isn't going to fly.
>> I didn't get you here.
>>
>> If we want Xen uses Sv39 for G-stage, we want to limit guest's 56-bit
>> GPA to 39-bit GPA, but not the maximum supported by h/w mode for G-stage
>> mode.
> I can only repeat what I thought I had got across already on an earlier
> series of yours: What mode a guest is going to use is going to be a guest
> property. The default mode therefore isn't the only mode that may be used
> at runtime.

I remember that, but i don't really understand what is wrong now with 
the ASSERT(). It should be changed or dropped at all when this property 
you are talking about will be introduced.

~ Oleksii

