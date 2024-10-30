Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7909B6402
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 14:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828219.1243070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t68hq-0005nk-DI; Wed, 30 Oct 2024 13:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828219.1243070; Wed, 30 Oct 2024 13:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t68hq-0005lJ-Aj; Wed, 30 Oct 2024 13:25:50 +0000
Received: by outflank-mailman (input) for mailman id 828219;
 Wed, 30 Oct 2024 13:25:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LV2z=R2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t68ho-0005lD-Vd
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 13:25:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76b21690-96c2-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 14:25:43 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a0c7abaa6so803112766b.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 06:25:43 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b30f58991sm566740166b.159.2024.10.30.06.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 06:25:42 -0700 (PDT)
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
X-Inumbo-ID: 76b21690-96c2-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc2YjIxNjkwLTk2YzItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjk0NzQzLjI4MDA1Mywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730294743; x=1730899543; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MWwJthBjZktYy30sVgIXSCb27ZHwvzyeYYZ3sA+gfsw=;
        b=gAtb2P0PvbJ1rGCNi1G7Gtev7F60cJa90rfDGAM7SKLrB59+i1WTT9X7NCZoBao4du
         TlifWSpzksUdWnayYImw8w83M3oDvym5caIQBewSfses7VxLMF6v+tHpNaCJwmE0X6AM
         STKX2WNppOXpX+Iz5pEj6qCXBD9kK3EqZrAhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294743; x=1730899543;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWwJthBjZktYy30sVgIXSCb27ZHwvzyeYYZ3sA+gfsw=;
        b=U0jRTXOEmbnxeGLtDVyS8srtzxIgA9TtAXzRZcXqm+JfjTogPS6mxxurdvRQtaWWro
         bgImkyoz/oEdei+RCVN6bsEp4UPLioOE7noc1qAk36oMuwqPrumA3kN6z5X8hiqHX9a4
         MhSnRpSl6Son/awRGoijdcZsItNIHEhk1mt64+0f42lwTo0TRYb/DC1jOiDFgg24Cqfs
         c6mRLT6CvRklZOANRCa7df5h+BaVL8C+AT3jC6gzD+xnHIoSjiNfpjAcmZEQM4sBhAZ/
         ZZ7Ml5SUwMw5gV4BK4KYqP471sz8WEpqn4LMd2NsVh3ZVlRgVGsLLuxoQjjwots637v+
         kAQg==
X-Forwarded-Encrypted: i=1; AJvYcCVz/a6JhxV1uj2BC5+yit44q42OpqmD1n8tGa8caXcnGs0NJ/No7c8FQwfJSWX+UrJDB+qec66mkWE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLNtIMKSeaR79ceyZ+OsXdOaGF7X9FxkIHOQy+q8Cj3ljR+p0U
	XNJTCBRQWLBnJWz7nuRSKdCtjNK7Yak8BC6ohAKMmL99gDDa0TCA0cWjXZhezXg=
X-Google-Smtp-Source: AGHT+IHs1CBHUIRoftbvNpV/DmKHTFA88zVyjWejDUwMVv8uCSPKpM55ZiyUbIcUNkmPW5Q6YUupjA==
X-Received: by 2002:a17:907:7241:b0:a9a:80cc:c972 with SMTP id a640c23a62f3a-a9de5d8691amr1450160166b.27.1730294742580;
        Wed, 30 Oct 2024 06:25:42 -0700 (PDT)
Message-ID: <227db2a2-d36f-453e-8886-b8ef0d5f9616@citrix.com>
Date: Wed, 30 Oct 2024 13:25:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 release schedule
To: oleksii.kurochko@gmail.com, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Community Manager <community.manager@xenproject.org>,
 "committers @ xenproject . org" <committers@xenproject.org>
References: <e470822f190a41b2f1600821b81d7ad158ed33db.camel@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e470822f190a41b2f1600821b81d7ad158ed33db.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 1:02 pm, oleksii.kurochko@gmail.com wrote:
> Hello everyone,
>
> As there were no objections to the proposed release schedule
> (https://lore.kernel.org/xen-devel/CAMacjJxEi6PThwH2=NwG3He8eQn39aiaxZCw3bQF7i4YcmjuNw@mail.gmail.com/
> ), I've updated the wiki with the schedule for Xen 4.20 release
> (https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes), and
> it is now accessible from
> https://xenbits.xen.org/docs/unstable-staging/support-matrix.html.

I have a blocker to raise (against myself...) and no good idea of how to
proceed.

The for_each_bit work has a unexpected bug.

    for_each_bit ( ... )
    {
        if ( ... )
            break;
    }

will fall into an infinite loop.  This is caused by for_each_bit()
hiding a double for() loop, in order to declare two scope-local
variables of different types.

The two variables are one copy of the source expression (really quite
important to keep), and one unsigned int iterator (improved optimisation
capability by not using a wider-scope variable).

Options are (off the top of my head)

1) Always take the iterator from outer scope
2) Iterator always the same type as the source expression
3) Figure out some way of expressing "once" in the outer loop

Or anything else that I've missed.

~Andrew

