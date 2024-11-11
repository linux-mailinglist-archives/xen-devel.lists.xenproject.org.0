Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABCF9C4143
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 15:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833942.1249191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVnn-0002IE-Ns; Mon, 11 Nov 2024 14:54:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833942.1249191; Mon, 11 Nov 2024 14:54:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAVnn-0002G5-Ky; Mon, 11 Nov 2024 14:54:03 +0000
Received: by outflank-mailman (input) for mailman id 833942;
 Mon, 11 Nov 2024 14:54:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mW2F=SG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAVnl-0002Ee-Kj
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 14:54:01 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6986e29-a03c-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 15:53:56 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a0c7abaa6so603409566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 06:53:56 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0def47esm596582866b.160.2024.11.11.06.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 06:53:55 -0800 (PST)
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
X-Inumbo-ID: c6986e29-a03c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM2OTg2ZTI5LWEwM2MtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzM2ODM2LjM4MjM4OCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731336836; x=1731941636; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=62OePzVWiS+jVdHXAk+GnxVkdhYxIAP3y8CA54XAhCU=;
        b=FSxXN3tsNTLu4AH7VgI+TnPFh69bKMq5Ot43H5cz4tFd+9iznYVYtWCBDvP8QLzzoj
         AandLRc6D4BHX5Fa2sD8Pcm1ldpJLKhRrWSWh07RlJRf97BGLLhJ/usiHfBXo4DeEbUY
         /bzX7snKMrdFjuUWox1fc55a1BZ2TxEbOcoM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731336836; x=1731941636;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62OePzVWiS+jVdHXAk+GnxVkdhYxIAP3y8CA54XAhCU=;
        b=hlnLzC96hj9rSu6t6QelEiME1CDV3ysSNvFpedjMZS3RA9cKyq+430Mb55twjIPVTc
         ADcPG9wKdV7UwGHnucED2wEAQwRdWjAtDOnnfzj6DvcGG9yirLpgw9/btU1b9paopHl+
         flFmeqhlBpA4VXd9qwCi3tGG1fN8en1OcTmm4/CPe86NUsiqgBYrBTSyQWnZsYVt6zEu
         zeTgqeFI2zmKGjFEc14UwVszw4EZIdcjOgZvHGNWMzlo67yCNwN7a8TVlmW62jD8zdor
         E6GOeKtUbwihAabUS5Dv8u82YvTCvPOfJ0WTdjGMRAkKSm7kO7Mz03MF6xer3GVSd0dJ
         NnBg==
X-Forwarded-Encrypted: i=1; AJvYcCUIyBRyp2RrVcWvDFCJFvsh4KOD08+J73uP61YGZq+SH92gn3Ic9ehhcJpIPcrGZzMZlRECyFQ2LIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywp6Y+Bfwn9Cv3YEW16rKXJyGeqh4DgfNPTeNPpnVfEDD9rqk1w
	5GMgl8tshAg6ctnilb01PageDkLnhPJb/h4uiqKWvRstHHsuYtJHkyCWSCPw0ng=
X-Google-Smtp-Source: AGHT+IEal3SEtM6gA0Gk4Ct+MyzVmPUATv0d497H+ZAhLZmJPnjLdXEgdILvSa8TMRG1+8q6/Ag6uA==
X-Received: by 2002:a17:907:6d24:b0:a9a:9df:5581 with SMTP id a640c23a62f3a-a9eeffeee58mr1286818366b.38.1731336835785;
        Mon, 11 Nov 2024 06:53:55 -0800 (PST)
Message-ID: <1fba70d8-d127-4c39-8bca-29a0b7a739a6@citrix.com>
Date: Mon, 11 Nov 2024 14:53:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.18] tools/libs/evtchn: Drop assert()s referencing
 MiniOS's main_thread
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241111143101.996733-1-andrew.cooper3@citrix.com>
 <36b7aa89-c87d-40a1-b721-9fa21ff9c2cc@suse.com>
 <61ab6fe8-2200-4042-ba1c-e6ad0a000bfc@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <61ab6fe8-2200-4042-ba1c-e6ad0a000bfc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/2024 2:47 pm, Andrew Cooper wrote:
> On 11/11/2024 2:41 pm, Jan Beulich wrote:
>> On 11.11.2024 15:31, Andrew Cooper wrote:
>>> This breaks the build with debug active, as main_thread is not an exposed
>>> symbol.
>>>
>>> This is a minimal version of commit bc4fe94a69d4 ("tools/libs/evtchn: replace
>>> assert()s in stubdom with proper locking").  It leaves MiniOS no worse off
>>> with respect to thread safety.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Juergen Gross <jgross@suse.com>
>>>
>>> Speculative fix.  Gitlab is a little busy right now:
>>>
>>>   https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1536597753
>> Assuming it helps:
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> Testing is still going, but various ones have passed where previously
> they failed, so yes, it is helping.
>
>> Considering that 4.18 pre-dates the export restrictions, I'm a little puzzled
>> though. And indeed a400dd51706867565ed1382b23d3475bb30668c2 is a 4.19 commit;
>> the update of the main tree branch (3c81457aa338) should have used
>> ff13dabd3099687921145a5e3e960ba8337e7488 instead, if I'm not mistaken.
> Oh yes.  I've messed that up.
>
> I'll try again with the correct revision.

With the revision fixed:

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1536629643

(Still busy though.)

~Andrew

