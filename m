Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CD2A3414E
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:07:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887614.1297081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZrw-0000c0-It; Thu, 13 Feb 2025 14:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887614.1297081; Thu, 13 Feb 2025 14:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiZrw-0000aJ-GB; Thu, 13 Feb 2025 14:07:08 +0000
Received: by outflank-mailman (input) for mailman id 887614;
 Thu, 13 Feb 2025 14:07:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tiZrv-0000aA-4r
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:07:07 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdf7c6e9-ea13-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 15:07:05 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4395b367329so5971015e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:07:05 -0800 (PST)
Received: from [10.81.43.157] ([46.149.103.9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b84bcsm51984885e9.40.2025.02.13.06.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:07:04 -0800 (PST)
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
X-Inumbo-ID: cdf7c6e9-ea13-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739455625; x=1740060425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uMGKozZbmksH6NcYyZ3sQe0C0IObT9sTguRPL9ibJEU=;
        b=ST4xjPFh4w33wiPWw24ga7rL6PO0/UZN/0C1gqGcjd2Q3jOjDzBy/9AHkEZ+LGW3KS
         IKV6S1fFglUUDjU6Xx8bBxETO2lqp9J9UoEf6KV/jHl2FVAw6rJxTPHTxZj3eDNS4OeT
         gp9mzRUHbeYLECLAVJh2C9mW2naxKU4iiHnTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739455625; x=1740060425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMGKozZbmksH6NcYyZ3sQe0C0IObT9sTguRPL9ibJEU=;
        b=IyFWYOczw7KEUeVea6GOn20TS6hIQbzru4pd2EhWaubu+HyjkyCI7iw06w1j2ddL6d
         KXnPg6EcU1EzVnKEHhPsE2f6Z+NViLXpfuZniCquLPPe7cWjhiRsjJ5IYNf3iaLp0JA/
         rggJRyyFAEZgC2PYIZKAvyPWsMIkVd2kQXrJzVUCL60CTYN3ti7DILL1WV7fk8EqiHFQ
         HTgUjTiXtf1cAOgZLJEl5Fu5i0NTq+VJMlu024N89qxsqQn6XGmrJWQoWU3thzfM68pi
         /fmqs+ZVVeEXrCXeXJFIcfmqCZzma285qGBkKnFY4xdKUCAU1fDJ5CpW4R1edQTugdYD
         Ca9Q==
X-Gm-Message-State: AOJu0YzBwwMzk+L/A0WTKqcw/+DcxLRYU1I6/57pjqDp5UiEeAaMmign
	UUbhmRNMWxCRa5qb3t7jpYZecj0QiIsDVbypLBieG31YEit42BZ53+LL/cmkhEQ=
X-Gm-Gg: ASbGncvt+jpL7siukvYSuyIoKC8J/rrqqQzMdciIJcYg6emK35Nh1rsTLT6dM94j4D4
	MpnddNdargF1SDeXKY4+T7ZUmhUbuf5LPAD4kaC/GNp3dlNmCviC5dRz7ImmPSwHHJRgHT8HEKZ
	AnT8D6aH7l7sKfPxi7zRB8NOZOgcm3L4kH8ZCiGOzWIdXN4xXtfzfFEcApGrlgxQQsWwhxFXSuv
	tlMXqlHWhdkZKduSkz84mo5aafwrm1aoocXdxsAaltSTJSLE+a9EdHflpMH0pi9g6/WV3uOoSqy
	rGvYrR4CJNDWv6wWbOejVUQf
X-Google-Smtp-Source: AGHT+IHTtn8Ygrd8tvhp3u/nsPmsHUp1YVUTFiUOrmPXJXuvl8ZEEpVTHeC68a51nGu9Lv4vyKtdtg==
X-Received: by 2002:a05:600c:8509:b0:439:3d72:8705 with SMTP id 5b1f17b1804b1-439601a0681mr40484115e9.20.1739455624549;
        Thu, 13 Feb 2025 06:07:04 -0800 (PST)
Message-ID: <e692db7a-c457-445e-befa-96702b512b13@citrix.com>
Date: Thu, 13 Feb 2025 14:07:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 for-4.20(?) 0/4] Add/enable stack protector
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
References: <20250114042553.1624831-1-volodymyr_babchuk@epam.com>
 <5b6b1ad2-c0cd-454c-aa7c-b6de37ab39df@citrix.com> <87pljmymos.fsf@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <87pljmymos.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 1:54 pm, Volodymyr Babchuk wrote:
> Hi Andrew,
>
> Andrew Cooper <andrew.cooper3@citrix.com> writes:
>
>> On 14/01/2025 4:25 am, Volodymyr Babchuk wrote:
>>> Volodymyr Babchuk (4):
>>>   common: remove -fno-stack-protector from EMBEDDED_EXTRA_CFLAGS
>>>   xen: common: add ability to enable stack protector
>>>   xen: arm: enable stack protector feature
>>>   CHANGELOG.md: Mention stack-protector feature
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> There's one minor formatting error which can be fixed on commit.
>>
>> ~Andrew
> Thanks for the review. I noticed that this series is not committed. Is
> there anything else required from my side?
>

You need an ARM Ack on patch 3.  [EDIT], no you don't, my R-by is good
enough.

And at this point at rc4, you'll need to persuade Oleksii to take it for
4.20.

Personally I think it's low risk and worthwhile to take for 4.20, and it
was technically completed in time - it just fell between the cracks.

~Andrew

