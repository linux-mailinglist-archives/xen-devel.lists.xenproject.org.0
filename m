Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id fBG2G53mAWq5mAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 16:24:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1678651011D
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 16:24:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306255.1578313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMRYL-0002fX-BW; Mon, 11 May 2026 14:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306255.1578313; Mon, 11 May 2026 14:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMRYL-0002e1-8n; Mon, 11 May 2026 14:24:13 +0000
Received: by outflank-mailman (input) for mailman id 1306255;
 Mon, 11 May 2026 14:24:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wMRYK-0002dv-Gw
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 14:24:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMRYJ-006jwc-G8
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 16:24:11 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a01e679-5cb7-0a2a0a5109dd-0a2a4505baae-28
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 16:24:11 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a01e68b-aaa8-0a2a45050019-d155802eb863-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 16:24:11 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488a88aeec9so49510335e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 07:24:11 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-69-121.play-internet.pl.
 [109.243.69.121]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e6db171c9sm64927005e9.30.2026.05.11.07.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 May 2026 07:24:10 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1778509451; x=1779114251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Qta2ghmQXIVYNmkq22xRyfJO4b8bpbFrkUtNMm7TrA=;
        b=oRMFq1In4AkblpH5cmYST+HlSBTWVZ8CUAJqmAwOwu+kYOg8RCDK2rNSOkIl7tOIk9
         8T79qJJclruTuW5uBCCtZ5mi6Vkxc/2hfgJR4/jUbRcEeYbVOslD5cCt1KVVq21r5QH2
         dG5ZPGENsmlnIWI0T0x7I9uOL2WpefKq6HyUaaulvXMm4dos3UlZNeqXZx8YJv7UQjX2
         rPZ3MqxJZgUva15wPKnY6Gkk7Ye/A+6lsw1dMz44+LP2q+5jH2gHZjMNNmK9i5kr92W6
         pl6HEwAzGoFsl/I8FW8rmMGvGbj6FLQZDNZY0IQs6rSVBH+2+GqNH+6FZab75e1tr3cA
         +rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778509451; x=1779114251;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Qta2ghmQXIVYNmkq22xRyfJO4b8bpbFrkUtNMm7TrA=;
        b=FXvs2rbc0l7M0Tc9nVGSqhjfzO9WDAuhF6FKeSSY6+gOlpYSE4KBsvsjfm7TV2MOU3
         nctVBoWkcSH8B4IgTeRVM9hcwrO1fVNqWpaOSqo1xivXAyv3A2Zsd++xtDuCh0c5erZy
         Oxrs3DneJO2Ri8HoP9HnDp8kEau7YfPyxt6AkYh/ijuius7C6KBwLp/llRBxFZ6aMpkJ
         xcMLMMfcScmrb7Lgokrb7DFvi8m8RtcOslwqXjDIJ9Gkq5ilKCZIWP9JIcJawR0K34/O
         W/nn2GkApV/YNIe9JlycF7kL7LuzrMoNwAdwPpO5GqVhc85fiPEeRBPpS9Vtgk/KrqRj
         ozwA==
X-Forwarded-Encrypted: i=1; AFNElJ/SRr/RT0dcEcATGcwAkK2290dKgRwfnASDkh9NK0JnT52MpqqjRKx9EZBM/0OpxzvZYuMrS3uMghE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy44HNwq0EWsEcbWzSZ7aTIj/VaSFSv9tYIhNQxZRpC0REkV43E
	sh2cmRtgHSsq/daYlth3NUWhUFaec2tSGjmLUb13d5XVDz8r0uGUtFtA
X-Gm-Gg: Acq92OHLkAEtDxy7iiXQdLBrrxA+pdOMxIjBkKZGIM2mrL35hXAuel+yU4/yrtj6JF/
	yDO+zyURrgkk14Pkx4kfShzAMV7FgvreCKxPQA7bVb1K0JTvC/xKk8QjjQ/1JQo5A0Vz4mpOypK
	ILJ49tuwTMhmrj5NMbJcq9urFeVAtQawC4MYOpQVuYVSbEdF2kMp2YR4ZK/m9R6EdAwsyzkR2js
	tOMyslstQ/cJXc2/wx47rNGZXDRe5VXRAxmWJUmYdqh5mKHnBaqDb05xXzzX/j5ux5ii9EZKmjb
	CBxlQ9BDfDMXEFfYSo9bIIDsF+58TuinkQnlJCD2lF/ps+5GwgWw4D+4ozUpHQgzbTBkwyXjq3o
	7RvlupF9hPb0Ds7noUIN/lhE8UaOSRbMVLj8hq3ycMoIsK3+3CUIfN9dE1u7rVy1Dvx33W1O2x1
	9kyqxwxLi5eHXf5g85b1b+ft30WH3t0POdDY5i2Z4OSbMz3xFPIyGYReRwMBJQptHJLOseIbCQt
	hODdMlGX83ieA==
X-Received: by 2002:a05:600c:4e0d:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48e70700e20mr168329405e9.19.1778509450820;
        Mon, 11 May 2026 07:24:10 -0700 (PDT)
Message-ID: <925577e8-4339-4917-98ef-bbe12a69c100@gmail.com>
Date: Mon, 11 May 2026 16:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Code freeze for 4.22 started on May 11, 2026
To: Jan Beulich <jbeulich@suse.com>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <e21070ac-3a84-4ad7-a4d1-9178d89c1435@gmail.com>
 <2a6117e6-e458-4818-9c22-0c356982eb59@suse.com>
 <58f80bf6-b9e0-42b8-9f84-831a1c546768@gmail.com>
 <4b0f55a1-1e9b-4ce1-b6b6-29b868d57e25@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <4b0f55a1-1e9b-4ce1-b6b6-29b868d57e25@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1778509451-E0063443-5B0516F8/10/73395122804
X-purgate-type: spam
X-purgate-size: 1249
X-Rspamd-Queue-Id: 1678651011D
X-Rspamd-Server: lfdr
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
X-Rspamd-Action: no action



On 5/11/26 3:45 PM, Jan Beulich wrote:
> On 11.05.2026 15:34, Oleksii Kurochko wrote:
>> On 5/11/26 11:41 AM, Jan Beulich wrote:
>>> On 11.05.2026 11:35, Oleksii Kurochko wrote:
>>>> I would like to inform you that Code freeze period is started and will
>>>> be until Fri Jun 05, 2026 (+4 weeks from Feature freeze).
>>>>
>>>> Bugfixes may continue to be accepted by maintainers without R-Ack.
>>>
>>> Gives me context to ask right away: "x86/mwait-idle: sync up with Linux
>>> 7.0-rc" has had a few small adjustments and hence would want re-posting.
>>> Question is: Does that even make sense at this point, i.e. would you
>>> give it a release-ack despite it not all being bug fixes?
>>
>> I don't see any Fixes: tag in the mentioned patch series and also based
>> on cover letter it doesn't really clear what this patch series is fixing.
>>
>> Could you please clarify?
> 
> It is "fixing" us lagging behind the Linux driver that ours was cloned
> from. Plus the series was posted well in time.

It was posted well in time but it wasn't committed before Code freeze 
started.

But considering that it is necessary for new CPUs (as Andrew C. 
mentioned in one of reply) we want to have that in release.

~ Oleksii

