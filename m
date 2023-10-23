Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 458DA7D2EE3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621173.967361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qural-0005l1-4m; Mon, 23 Oct 2023 09:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621173.967361; Mon, 23 Oct 2023 09:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qural-0005ho-1a; Mon, 23 Oct 2023 09:51:23 +0000
Received: by outflank-mailman (input) for mailman id 621173;
 Mon, 23 Oct 2023 09:51:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1u5b=GF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1quraj-0005hd-FT
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:51:21 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b76cfc02-7189-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 11:51:20 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9c603e235d1so466000666b.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Oct 2023 02:51:20 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 gz11-20020a170906f2cb00b0099cd008c1a4sm6328829ejb.136.2023.10.23.02.51.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Oct 2023 02:51:19 -0700 (PDT)
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
X-Inumbo-ID: b76cfc02-7189-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698054679; x=1698659479; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qS1/FTU1Qy6IAehaP98Z3pjjqQ2nFlGwN8pW+tF98is=;
        b=s5PXMRTYjqinFvu2C7Db5Z6ENHyYHtnxGkwJD+1MoNd7rKVJ8vU843ZjFf4aLUR2aN
         3uxsxMu7miQiEuPRcpR9L2H0cmx0fZ4aoAgAVVNsiQ/uGXe1mEpumLzlDfCcHibn0Rw/
         G0L6O/aHVbTgJC86+V0ELsVUUC1m44u9RxWiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698054679; x=1698659479;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qS1/FTU1Qy6IAehaP98Z3pjjqQ2nFlGwN8pW+tF98is=;
        b=e1UlBbX2GVjoX8Lvovz+J0L7OZi9VFX3lMBm1dzuSzhKUMWHHpVfTaKZDW3aZnPqGy
         W1XLmyYG1Odd/tROerUs3Fi2ddYSi0bCJaehTAuvbvK37gkrFQdD5FtixHvrl61Eyq3d
         /eZWo9x9+Fa3t8FsJFtRpQWIIfu4YK1xD6wGUBzjPZfXXdURbWrTQ+QoM6egWIEEDhI9
         jruQoyWHQ6kvjKiroRyDH0ZKe6KGBhlpni/KCCeV3JBKZA1c6qofJj6UW03chZCncMQc
         qEeIbgzKJhgvI8fTAypCSab7ETdLXayp2LTSR0dOBCXbxGHjrc8evzapxkSwdl98He5p
         KXpA==
X-Gm-Message-State: AOJu0YymBK3EXP8hsBgWIwCltKq7wxVRZ9VlYEgg+9Twd5QU/gDN/SO0
	BWavi/jV5IofvaVYJxV3UTyAFmL/0YbVXMK3f5pkFQ==
X-Google-Smtp-Source: AGHT+IETijhLHL3jhzzb03XOrvGdJ8dg+NrbJaZSRvtQ+cm5Nrf35wTAyS0lrRyo8kTumKLiMz7m9Q==
X-Received: by 2002:a17:906:6a22:b0:9be:d15e:8ca2 with SMTP id qw34-20020a1709066a2200b009bed15e8ca2mr5046123ejc.39.1698054679313;
        Mon, 23 Oct 2023 02:51:19 -0700 (PDT)
Message-ID: <dde471bb-6e66-4dba-ab01-9fd6b031338c@citrix.com>
Date: Mon, 23 Oct 2023 10:51:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.19] xen/xmalloc: XMEM_POOL_POISON improvements
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20231020202649.1802700-1-andrew.cooper3@citrix.com>
 <2f3180d3-883d-466e-a454-762aa16c9e7a@xen.org>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <2f3180d3-883d-466e-a454-762aa16c9e7a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/10/2023 5:52 pm, Julien Grall wrote:
> Hi Andrew,
>
> On 20/10/2023 21:26, Andrew Cooper wrote:
>> When in use, the spew:
>>
>>    (XEN) Assertion '!memchr_inv(b->ptr.buffer + MIN_BLOCK_SIZE,
>> POISON_BYTE, (b->size & BLOCK_SIZE_MASK) - MIN_BLOCK_SIZE)' failed at
>> common/xmalloc_tlsf.c:246
>>
>> is unweidly and meaningless to non-Xen developers.  Therefore:
>>
>>   * Switch to IS_ENABLED().  There's no need for full #ifdef-ary.
>>   * Pull memchr_inv() out into the if(), and provide a better error
>> message.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: George Dunlap <George.Dunlap@eu.citrix.com>
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Wei Liu <wl@xen.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Observations from the debugging of:
>>    https://github.com/Dasharo/dasharo-issues/issues/488
>>
>> There's a further bug.  XMEM_POOL_POISON can be enabled in release
>> builds,
>> where the ASSERT() gets dropped.
>>
>> However, upping to a BUG() can't provide any helpful message out to
>> the user.
>>
>> I tried modifying BUG() to take an optional message, but xen/bug.h needs
>> untangling substantially before that will work, and I don't have time
>> right now.
>
> Do we actually care about the registers values? If not, we can either
> use:
>
> printk(...);
> BUG();
>
> Or
>
> panic(...);
>
> This would allow us to use XMEM_POOL_POISON in prod build before BUG()
> can accept string.

We care about the backtrace, so panic() on it's own isn't good enough.

But printk();BUG(); should be good enough so I'll swap to that.

~Andrew

