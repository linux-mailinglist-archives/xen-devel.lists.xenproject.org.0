Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yHDKKazEhGk45QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:26:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DCDF5324
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 17:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222203.1530226 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2B4-0004On-Tc; Thu, 05 Feb 2026 16:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222203.1530226; Thu, 05 Feb 2026 16:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vo2B4-0004N5-Qn; Thu, 05 Feb 2026 16:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1222203;
 Thu, 05 Feb 2026 16:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQ2u=AJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vo2B3-0004Mt-VY
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 16:25:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5953ab60-02af-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 17:25:56 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso10633145e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 08:25:56 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d7a99asm72216505e9.11.2026.02.05.08.25.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 08:25:55 -0800 (PST)
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
X-Inumbo-ID: 5953ab60-02af-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770308756; x=1770913556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQnibJuvEXD4990OC7RL8/XAKNQan2ONKn0EEC28b5Q=;
        b=SRVG0E9w6Xa88vwFIi5g0IfPrB01ylIwreoJsir+fdbjK4IW5FRbriBN8AviHovMUY
         9nTwBwWWppqilIbid5GF/APX7V5wUYHRZIKuQeNQCf2Xpphbw0c9d4Cm2507llFaqLtq
         mzqPtDAz4JcKGu+6ZUyHEEPQgC/CkIveqq3AoFjqNpjtQyTgGW9UOvg6GPvqsJa9RghH
         zYgDQQ/pGYwePTx/D+qVg7V4mGoKqOJS2bXM6oMotPw80HNpTtOKowqUC4Kc2QczrGA2
         tA4ejeKqZR1si2ka5dDW66xUcYNPUOtHsc+zijhdrVv7Fy0tevG1HyPefCJ75EmtP//G
         QjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770308756; x=1770913556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQnibJuvEXD4990OC7RL8/XAKNQan2ONKn0EEC28b5Q=;
        b=RArbnal5mmuSt0ajilYocBE5YFoMtJCKPl/+dfpV0GU0XYzQ1s1VdSBSMKyisCiy47
         Q7oITh0kDeZg1ugUKWG6P7CUiIeBC9im+7HCtMv54quEjoDTiaQPDctf2UTzl6NNLRSN
         chx9+kCzgwkQM+HUrheLoiD6Wou9zm8bmypJpHF3nneY0cA4txphOIIJBvz+0LZik0/6
         GTtt+QffiLJ8WCQFknkX9F+CoIYu48jWgMwNoxeGLhuMff5tRlgfZ5JmebKS1yNTDG9N
         0pCWxbEprhgNYacida5bl6u6hyGA9iTp85cYfilTDajk8DJTDpnymw/3El/qPFvl8RIb
         TvHg==
X-Forwarded-Encrypted: i=1; AJvYcCWUi39cz9FzL51na3RuRKZqJ/9HYuCfLpPiCBnNazGPKAmTwxjP71ZrojRR1naMEq8a0pcJw/mzK+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGiHaAg91OYQMeFpYZL8tYU2Lf5edPhiUF1miVPcToG4CInlqJ
	YqP4pJOJDpz6IT/8+s9n6/L7mOvbePQ0mHPNZT2JcLOTiZ0ECKNu5/DC
X-Gm-Gg: AZuq6aJSRKIgm0WOoRx08+uSgl9mv3+nvy4ZSiiMuBE+P5bBsJu2AUu+MsYyHnd6N/7
	B8EK4aTgmByavAahtdlnk4l40zXYCxt60/vn/yOdLF6OgTA+DYANM8xTJxFRgEimc7ADD9H58t5
	xIo0Xx0I3Hzwnk+UuzGSSAqmf3lcorPRY0k+eFWxVee2lBMEmf93qD2SQLn8Xyx3AwaZLGihM2j
	uGcqPJOL0YWwPXmykzjUEMb3b3mlrpPBsDElxzF4Eton9ojhpWOQWNDatIIM9iEawabdBVkf1yO
	0+V8ZWKWGClSdWetguTAoO+IT+7zdOJREoLEu/1NOAH94iFhSsIpXVzL3XT5P7grVZUpygQgJVm
	uD3alAs+r3ga5nhr+aWQDEczQxxEe+B5lWY0uMAAi9RYkT5kVrkiTM9d2zE0p98aSh0QX+HJmVj
	Y5VrB1p6tvVfCzPTbDInFGTvrspDLLYhWuLSsZV4Uh9k5aPzAJYIkTr+6/p4z4wPI=
X-Received: by 2002:a05:600c:8b30:b0:480:3ad0:93c0 with SMTP id 5b1f17b1804b1-4830e96d513mr93132845e9.23.1770308755992;
        Thu, 05 Feb 2026 08:25:55 -0800 (PST)
Message-ID: <e0c8e096-c215-4872-b9c4-8b238678d761@gmail.com>
Date: Thu, 5 Feb 2026 17:25:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] xen/riscv: implement reprogram_timer() via SBI
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1769099883.git.oleksii.kurochko@gmail.com>
 <732635f43fb80daec332f78d4442b56bf5dfda98.1769099885.git.oleksii.kurochko@gmail.com>
 <bddacebe-e84b-4ba0-959e-be078d613d03@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <bddacebe-e84b-4ba0-959e-be078d613d03@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Romain.Caritey@microchip.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,microchip.com,lists.xenproject.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 42DCDF5324
X-Rspamd-Action: no action


On 2/4/26 11:39 AM, Jan Beulich wrote:
> On 22.01.2026 17:47, Oleksii Kurochko wrote:
>> @@ -40,6 +43,46 @@ static void __init preinit_dt_xen_time(void)
>>       cpu_khz = rate / 1000;
>>   }
>>   
>> +int reprogram_timer(s_time_t timeout)
>> +{
>> +    uint64_t deadline, now;
>> +    int rc;
>> +
>> +    if ( timeout == 0 )
>> +    {
>> +        /* Disable timers */
>> +        csr_clear(CSR_SIE, BIT(IRQ_S_TIMER, UL));
> For here and below: Is it guaranteed that the SIE bit is writable? The privileged
> spec looks to have provisions for the case that it isn't (together with the
> corresponding SIP bit).

My understanding is that yes if S-mode is present.

>
> As to the comment - why plural here, when ...
>
>> +        return 1;
>> +    }
>> +
>> +    deadline = ns_to_ticks(timeout) + boot_clock_cycles;
>> +    now = get_cycles();
>> +    if ( deadline <= now )
>> +        return 0;
>> +
>> +    /* Enable timer */
>> +    csr_set(CSR_SIE, BIT(IRQ_S_TIMER, UL));
> ... it's singular here? Also in both cases, isn't it the timer interrupt you
> enable, not the timer itself?

It is timer interrupt. I will correct the comments.


>
>> +    /*
>> +     * TODO: When the SSTC extension is supported, it would be preferable to
>> +     *       use the supervisor timer registers directly here for better
>> +     *       performance, since an SBI call and context switch would no longer
>> +     *       be required.
> I think you mean a mode switch here, not a context one?

Right, mode switch is better.

~ Oleksii


