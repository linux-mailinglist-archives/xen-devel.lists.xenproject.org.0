Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 318107F213B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 00:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637385.993135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5DNK-0005j4-UM; Mon, 20 Nov 2023 23:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637385.993135; Mon, 20 Nov 2023 23:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5DNK-0005g6-RA; Mon, 20 Nov 2023 23:08:18 +0000
Received: by outflank-mailman (input) for mailman id 637385;
 Mon, 20 Nov 2023 23:08:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6jYu=HB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5DNK-0005g0-75
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 23:08:18 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afc38ee5-87f9-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 00:08:16 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-32d895584f1so3526195f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 20 Nov 2023 15:08:16 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 d16-20020adfe2d0000000b003316a2aedadsm12087799wrj.36.2023.11.20.15.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Nov 2023 15:08:15 -0800 (PST)
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
X-Inumbo-ID: afc38ee5-87f9-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700521695; x=1701126495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ha5D/Q/yqNUz9A/aVWSCNPq+91m0UVj1KOw/S8qoB0U=;
        b=cBQUi19l+6IalwmAPR9BE9SME67GH7Qt7uaRgumOFe9bjW02WJFA+pTX64ogeFvMx5
         nKMWtqZ5ev2el1ayKoO8TxjEYiDeJFNbuthR1E6aWEUt6T8GYlNdYTk10rwqH5GtrXWp
         cs3DHRtrQx0gCu/pkxSmoh8cfBPSOEP1rzc5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700521695; x=1701126495;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha5D/Q/yqNUz9A/aVWSCNPq+91m0UVj1KOw/S8qoB0U=;
        b=XX1pJGKGtmw9sOwzBruaAhZgfdjC+faYeUigq/99itb7o9qU/7qgAbxmXAXVftmYOS
         XaEoAwlyLN0kmej6jFQjwmWWdcL6xtqTSOiwjbJymeJt1/7bhpe2L21YwPUkzUkc+yVj
         LJdZAUdNP+aJEZES8m7Jr3qw5AysUKHz+zzEkbLg9dI1mTC9cH5qd2hSVBle5n6LeL4z
         h1MmPMEV8rnTjtZxbcpyK3DGTAWblp11jXVcPGUIrepfqtoSKtxn+iSAs4eZRWCYQL9U
         PUgQ4VbPpDVXMrQtkKDbW+l0LhV9FnIF2uvD0E+wKF7HO4esewLssSGmvVIYnK9POm/+
         Xljw==
X-Gm-Message-State: AOJu0Yxm5Xx+iFCasln/HQBkZNk2tsGRa70qMoiUeArRtqdIulaVn6bt
	NHr+QvWNPTCdLCs9Wxow0DEsKA==
X-Google-Smtp-Source: AGHT+IE1VH/lv5w6GrhWph1C3WD85a6JVx5U5hWWFtpBK5xo12wD2fIMRiJSqHphCIIIidMX1gknpA==
X-Received: by 2002:a5d:5f90:0:b0:32d:967d:1baf with SMTP id dr16-20020a5d5f90000000b0032d967d1bafmr6301554wrb.1.1700521695582;
        Mon, 20 Nov 2023 15:08:15 -0800 (PST)
Message-ID: <df193960-b808-46fc-9361-b3850c249833@citrix.com>
Date: Mon, 20 Nov 2023 23:08:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Remaining violations of MISRA Rule 7.4
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen Devel <xen-devel@lists.xenproject.org>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jbeulich <jbeulich@suse.com>, Roger Pau <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Consulting <consulting@bugseng.com>
References: <21761f2a6633a08ceb2b70a46013486a@bugseng.com>
 <bdb7efb1-b8b2-4426-a46d-e8f5afdba0f6@citrix.com>
 <edd14ce515721eebf5a897ae0e5b61c4@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <edd14ce515721eebf5a897ae0e5b61c4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/11/2023 4:40 pm, Nicola Vetrini wrote:
>> I've just rebased and pushed the residual from the past work (although I
>> missed the ARM EFI fix.)
>>
>> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=commitdiff;h=0f06bab762f5201f3e00aaaee704c3c01f516b51
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1065699873
>>
>> I'm going to make a firm request that we fix this by activating
>> -Wwrite-strings Xen wide, because that's by far and away the best way to
>> stop regressions creeping back in.
>>
>> In start_xen(), basically whatever goes.  All that's doing is processing
>> of one command line into another, and your version looks a bit neater
>> than mine.
>>
>> The name.s cases (it's duplicated in x86 and ARM) are more tricky.  The
>> compiler warning can be silenced by swapping name.s for name.cs but I
>> have no idea whether Eclair can see through that piece of blatent lying.
>>
>> ~Andrew
>
> Just to avoid any misunderstanding: do you have the intention of
> evaluating and then perhaps integrate the fixes that at the moment
> block the introduction of -Wwrite-strings and then respin your patch,
> or should I do something specifically?
>

Hopefully you'll find
https://lore.kernel.org/xen-devel/20231120224912.1421916-1-andrew.cooper3@citrix.com/T/#u
to your liking.

~Andrew

