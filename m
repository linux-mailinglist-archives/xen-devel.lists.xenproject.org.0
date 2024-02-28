Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A586B04A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:28:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686611.1068825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJyW-0001cw-PX; Wed, 28 Feb 2024 13:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686611.1068825; Wed, 28 Feb 2024 13:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJyW-0001Zt-LN; Wed, 28 Feb 2024 13:27:56 +0000
Received: by outflank-mailman (input) for mailman id 686611;
 Wed, 28 Feb 2024 13:27:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIhW=KF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rfJyW-0001Zl-0f
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:27:56 +0000
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [2607:f8b0:4864:20::b30])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2db55e91-d63d-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 14:27:55 +0100 (CET)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-dc6d9a8815fso5461187276.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:27:54 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 14-20020ac84e8e000000b0042e93e97957sm2103401qtp.34.2024.02.28.05.27.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 05:27:52 -0800 (PST)
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
X-Inumbo-ID: 2db55e91-d63d-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709126874; x=1709731674; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/x1UVeM+Spn+Uw0ix5uhbhckWEtPjuGgGbqoE9ALHhA=;
        b=RK/mXX+GmostfwdQksKhpNrnJYYQClVpGW8YfkWGp/9q7ST9QshbGImBgk/FHGX0XE
         2SSIz/51y6Tu47LoLXTlRwl3XDSxOiqoKAY3nLG0dL3v2zWApQaPFfLfw1K79sI/JAs9
         JTy9qu8qea2R2zEJ60hzJJI+qhDnDEveEqX8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709126874; x=1709731674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/x1UVeM+Spn+Uw0ix5uhbhckWEtPjuGgGbqoE9ALHhA=;
        b=EU/9bhK+FFvBqxOIQs6M2xvq9c4n9uBvpSzya7Vvc14a6CVxFdYGxkiNDlCL+9z8bx
         b32lGV784PbPsbsm/TKBaHz0wya8GT4suJ15qtTAR9meAugfevg4Z68ZnGFzGIwc3RjO
         Nu+B6x/ZHxoxUBXAuM18NQOqgrLgAkf2EzKxAVemDaA6gTWbJYmq4o5xxpySkCDxEfz4
         9K6zE2gt5ZLxkHbaSr8bHw9xONLD8hq6JuA38KO2huW0eNvQwAdlAj4EqhbftlP4sej5
         MVWM6xzkvunyo8pNuNg4fObZUGyd5uC3hCu83ox/Da85bkSm6808EYXX1EyxBHqXHpX7
         ljqg==
X-Gm-Message-State: AOJu0YwlToZLP//hl3fQ9XypcDKIwsIDr8T6kiadBzEP38epjVohLDs4
	IJzww/2pRvBkQBa3DOZp7NUqWxxwsw4DdogFkxRAZWW83fTFeYiN+6s4xkEVLu0=
X-Google-Smtp-Source: AGHT+IHCjEIULgMEYLdOP0vFGEkvTd5GcPJpU89aTVwslm6VhKqryDBxW2eBjW2dy7sYeelgp+Y2zQ==
X-Received: by 2002:a25:6b11:0:b0:dc6:d738:1fa6 with SMTP id g17-20020a256b11000000b00dc6d7381fa6mr2665967ybc.6.1709126873836;
        Wed, 28 Feb 2024 05:27:53 -0800 (PST)
Message-ID: <2acbc687-26fd-40bd-a74e-f17b2a125082@citrix.com>
Date: Wed, 28 Feb 2024 13:27:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: New Defects reported by Coverity Scan for XenProject
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <65df054dd791_2895d52c84469bd9989838e@prd-scan-dashboard-0.mail>
 <27fad7c4-905b-4181-9882-f383eb194032@citrix.com>
 <d81f78a8-3e04-4fba-95fc-3b602ee3a740@citrix.com>
 <b174757c-8463-4561-ae95-a5791d33080b@suse.com> <Zd80m6-4YNasktjg@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Zd80m6-4YNasktjg@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/02/2024 1:26 pm, Roger Pau Monné wrote:
> On Wed, Feb 28, 2024 at 02:04:23PM +0100, Jan Beulich wrote:
>> On 28.02.2024 13:19, Andrew Cooper wrote:
>>> Take 2, hopefully with Stewart's correct email address this time.
>>>
>>> ~Andrew
>>>
>>> On 28/02/2024 12:17 pm, Andrew Cooper wrote:
>>>> Not sure how well this is going to be formatted, but there's one new and
>>>> potentially interesting issue found by Coverity.
>> To be honest I didn't consider this interesting at all, but instead a false
>> positive due to limited insight that the tool has. But maybe I was wrong
>> and you see something I didn't see? vpci_process_pending() is vCPU-local
>> (run from the guest resume path), and hence there simply are no two threads
>> who want to look at the field. Storing NULL into it is merely a kind of
>> progress indicator, relevant to the given vCPU only.
> Indeed, there's no (intended) way for vpci_process_pending() to be
> executed concurrently against the same vcpu parameter, and hence there
> should be no concurrency hazards.  Setting it to NULL is a mere
> indication there's no further work to be done, and the vCPU can resume
> guest context execution.
>
> defer_map() (the function that queues the work to be done) can only be
> reached as a result of a guest accessing the PCI config space, so if
> the vCPU is not running defer_map() can't be called either for that
> vCPU.

Fine.  So long as someone has looked into it and thinks we're fine.

~Andrew

