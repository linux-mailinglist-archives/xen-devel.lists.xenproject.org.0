Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00ECB0936D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 19:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047183.1417637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSaO-000825-EB; Thu, 17 Jul 2025 17:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047183.1417637; Thu, 17 Jul 2025 17:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucSaO-000804-AF; Thu, 17 Jul 2025 17:40:00 +0000
Received: by outflank-mailman (input) for mailman id 1047183;
 Thu, 17 Jul 2025 17:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ObpW=Z6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ucSaM-0007zy-Ds
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 17:39:58 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d99f98a-6335-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 19:39:56 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a50fc7ac4dso581824f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 10:39:56 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d785sm21717421f8f.59.2025.07.17.10.39.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 10:39:55 -0700 (PDT)
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
X-Inumbo-ID: 0d99f98a-6335-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752773996; x=1753378796; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KB2hB2QdkVP87JtQ1Civ2dUt0DHF/Ddn6nmvEedxhag=;
        b=qcI+Pz8Wu1XN74dtjdXVGbuV2a1zUXCmu9ffbWuSrxYtf2yf8PQ9RJNqViXsd/R+gf
         PueaYOsw881WcEtS4cohK1nj8i4Eco4di4zQICGcpmaAsO1RILUfCEnzOkgyJEe9PTbu
         yJSpA30Y4CimoikkRVvdUag3fWuKM23gD0+es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752773996; x=1753378796;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KB2hB2QdkVP87JtQ1Civ2dUt0DHF/Ddn6nmvEedxhag=;
        b=MozPw3X/FKarL2+D9Bv7MR5IRO/SD49WABdTtIa7qclV6GimhEOj4b2rsHvMaB6qD0
         IhlnnlMS53IgJGKbdw88bCSZlZOmfSrHA1S93tLxonQsDl3RjFVZ8MASTyiayHCovhpq
         xz0nSyRUNx4EiwniBsy8e8bvu/nxtk1ncy2AEgl69Amir618DcnlX6rutJg9MXfVN1Vd
         5eGf7r07m+tj6pBYdjIpv8wIanmR8pIAgE3wWVYB9ntYj9Pr+lGjq/BNiSwFZySTsq9R
         qQmE68vUs2VTj9pacaW7k7S34uuVk3G7V9jWpMtAEIVpNDclgknnbhHG5lKL8wtGisvX
         yd8A==
X-Forwarded-Encrypted: i=1; AJvYcCVw5/MiQlnQYKoyId6LX/QBHiVs39/AzsukWtsoB03OUcQNC//4kFF1JF6i9Cyb/JAclRBW3EIrAkg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpIW/jXrkq4foj80NvUl1soaq3osI1NK4i58SJL6QupX+tCFid
	X3tSbKbuMCoBag20p35IZgbgKzWepvqXOWF6Ztvns/OrAcuhFkuts2pAcTb+UcCBb/WOY9J5IfV
	iDeh0yXPULQ==
X-Gm-Gg: ASbGncvnjXxv3Z6loPfEmi/5cbXllR3G2dZmoeiCQt9EojLMz43QUpR9nKvVTBMT5ZO
	F1ajNfefRWQ9kbqrVrcCgGCsM4ppQ0z2aIpx9CJy2bKGnh0eJ7+APjjUVsAbv+jzk6se5v4D9V0
	sS3ujtmOZmYYHtkUbivN1ckt+1013LRy4dPpqq2q6n9kafsxJxVugRnLzSfHQyA0j1D+RxkJUml
	lGWeCpuPa99Y+9PdqLJBRzj6exObXBSc42XChg2xuZjnFlziCxDU0I9lbMKWp/w83sC7j8GuUc6
	aksjriHBQcTrL65DpSSDeCa9PU4ZS4AjNOHRxsUm+8++7Rk5Z8HNSlOoImxS636/5FnSizW5Hhc
	N+3g9FtB1wYnl+STlAa8NcJ6PobtO4ICY1rNv10zNM8eUfXeg7msDu0LtB4s7VQDff2Wf
X-Google-Smtp-Source: AGHT+IFGjuNua/qY40b5+Qm4ySoGjxnzWqh5nSHtwJoHbSyaxJYDoQ1B4AytvjFb5XF//j3n09xHLg==
X-Received: by 2002:a05:6000:64a:b0:3b6:1a2c:2543 with SMTP id ffacd0b85a97d-3b61a2c2743mr201324f8f.6.1752773995581;
        Thu, 17 Jul 2025 10:39:55 -0700 (PDT)
Message-ID: <76026005-efc3-4dab-9195-4fd2da5be1c8@citrix.com>
Date: Thu, 17 Jul 2025 18:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] x86/match-cpu: Introduce X86_MATCH_VFM() and convert
 intel_idle_ids[]
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716173132.2213891-1-andrew.cooper3@citrix.com>
 <20250716173132.2213891-4-andrew.cooper3@citrix.com>
 <f6243e9e-78ae-47c3-8697-e4761f0b394b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f6243e9e-78ae-47c3-8697-e4761f0b394b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/07/2025 8:35 am, Jan Beulich wrote:
> On 16.07.2025 19:31, Andrew Cooper wrote:
>> mwait-idle's ICPU() is the most convenient place to get started.  Introduce
>> X86_MATCH_CPU() and X86_MATCH_VFM() following their Linux counterparts.
>>
>> This involves match-cpu.h including more headers, which in turn allows us to
>> drop a few.
> intel-cpu.h doesn't really need to move, does it? Conceivably there can be users
> of match-cpu.h which don't need the Intel constants. Hence no point in forcing
> them to see those.

There's no point not to.  All users of x86_cpu_id want the Intel names. 
I've already restricted it to only 5 TUs.

Even if we do get some AMD names (and I'm not entirely sure how that
would end up looking), it's just a few defines.

>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> We now have X86_FEATURE_ANY and X86_FEATURE_ALWAYS as aliases of LM.  Given
>> the contexts they're used in, I've left the naming as-is.
> What's wrong with sticking to ALWAYS, which we already have?

For alternatives, something like:

    alternative("", "foo", X86_FEATURE_ALWAYS);

is correct in context.  However:

    X86_MATCH_?(..., X86_FEATURE_ALWAYS, ...);

is borderline grammatically wrong, and ANY is a better name to use.

~Andrew

