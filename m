Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544638C4EAD
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 11:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721343.1124704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6opA-0005hp-M3; Tue, 14 May 2024 09:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721343.1124704; Tue, 14 May 2024 09:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6opA-0005fz-IX; Tue, 14 May 2024 09:51:56 +0000
Received: by outflank-mailman (input) for mailman id 721343;
 Tue, 14 May 2024 09:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0FJY=MR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s6op9-0005ft-OC
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 09:51:55 +0000
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [2607:f8b0:4864:20::e2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9835e41c-11d7-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 11:51:54 +0200 (CEST)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-47efc7f2625so1439722137.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 02:51:54 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-43df5b46a26sm66236281cf.80.2024.05.14.02.51.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 02:51:52 -0700 (PDT)
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
X-Inumbo-ID: 9835e41c-11d7-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715680313; x=1716285113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A/S/lX2fSmBt9sPmgcTXAePdsSzUzYBE1ivMHp5kgxc=;
        b=Y+8y9RsDEd3Pjons9r+p1RA6H4WFgVhNha943/Tq3WXUvOE1dZwl9CJq5Q83tyMvDN
         w8RTDGMXGEX+/SrmMaMnwYxuNGT/NlNmJZocKhZyMr09U2zphuAoo3z3IDV+zoTS0pXP
         HF1jap4QZTRQfd/LdWIN3Uh0NbdFjqt/+0vhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715680313; x=1716285113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/S/lX2fSmBt9sPmgcTXAePdsSzUzYBE1ivMHp5kgxc=;
        b=Kernmc4kVj8zFXZRYD0w0eGTntENLXUk6nMt6N6b03rVOq6/PBg5+pZag4zsCDKoRI
         skqZwTQON32glmbOJ21uZa00tBZQiEi/KOqwJd2t84gYVdQMZMaPbVpVCDyFxCDmYrun
         u5RGu5dTDk2W2LzyxRngYOvPFw3rRDad6pjrvSAiGhWYbN5cmmReR3hdW1QNV0MG9UEE
         N+iW5mJOxs2iwhvRTrYRqm/6Z4aYlX/rYAHn2yHZCzNKYH4zZ/gK//nygvRf3LZI9Z3z
         +abPTXL3B1LQLytDgo1+73k2P1HFBMiooVgyrnOwyHioAR4JiA4YM8a3DMlpT3RlLnJm
         4JMg==
X-Forwarded-Encrypted: i=1; AJvYcCWG3PAFTLn1ZrNtJ85iwLBY85VS++nnt8eeiciPlF4jdgxoOOjZl5CN8HK/NnVPwUqJfBCkIMKip7bomF0sMVUjyq77TO3m4+iwu5jX7N8=
X-Gm-Message-State: AOJu0YwGSk+J0DV06EO3SlWdc1BL72eHU4fOxDab/7+Ve6GmgbmJqdWK
	RBU+O/VG86atfOdJx0VeIZHvvQTLln4ulA3Er3bHaWTSHCw7OKynw/1BNyvTI2M=
X-Google-Smtp-Source: AGHT+IF6Xjqu08K5kF3pXYdQkM93xxrKhtg02zJq7iWauAMxe5+7kTz0KHjmy2R3OXeH7XEfh6MM2g==
X-Received: by 2002:a05:6102:d8d:b0:47b:ef4f:edb3 with SMTP id ada2fe7eead31-48077de2bd1mr12216766137.8.1715680313401;
        Tue, 14 May 2024 02:51:53 -0700 (PDT)
Message-ID: <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
Date: Tue, 14 May 2024 10:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2024 10:25 am, Jan Beulich wrote:
> On 03.04.2024 08:16, Jan Beulich wrote:
>> On 02.04.2024 19:06, Andrew Cooper wrote:
>>> The commit makes a claim without any kind of justification.
>> Well, what does "have no business" leave open?
>>
>>> The claim is false, and the commit broke lsevtchn in dom0.
>> Or alternatively lsevtchn was doing something that was never meant to work
>> (from Xen's perspective).
>>
>>>  It is also quite
>>> obvious from XSM_TARGET that it has broken device model stubdoms too.
>> Why would that be "obvious"? What business would a stubdom have to look at
>> Xen's side of an evtchn?
>>
>>> Whether to return information about a xen-owned evtchn is a matter of policy,
>>> and it's not acceptable to short circuit the XSM on the matter.
>> I can certainly accept this as one possible view point. As in so many cases
>> I'm afraid I dislike you putting it as if it was the only possible one.
>>
>> In summary: The supposed justification you claim is missing in the original
>> change is imo also missing here then: What business would any entity in the
>> system have to look at Xen's side of an event channel? Back at the time, 3
>> people agreed that it's "none".
> You've never responded to this reply of mine, or its follow-up. You also
> didn't chime in on the discussion Daniel and I were having. I consider my
> objections unaddressed, and in fact I continue to consider the change to
> be wrong. Therefore it was inappropriate for you to commit it; it needs
> reverting asap. If you're not going to do so, I will.

You tried defending breaking a utility with "well it shouldn't exist then".

You don't have a leg to stand on, and two maintainers of relevant
subsystems here just got tired of bullshit being presented in place of
any credible argument for having done the change in the way you did.

The correct response was "Sorry I broke things.  Lets revert this for
now to unbreak, and I'll see about reworking it to not intentionally
subvert Xen's security mechanism".

As it stands, you're 2-1 outvoted, and wasted any sympathy I may have
had for the principle of the change based on the absurdity of your
arguments.

~Andrew

