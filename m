Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E92A9657E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 12:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962413.1353618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7AZn-0006fj-Tw; Tue, 22 Apr 2025 10:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962413.1353618; Tue, 22 Apr 2025 10:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7AZn-0006bF-RC; Tue, 22 Apr 2025 10:10:03 +0000
Received: by outflank-mailman (input) for mailman id 962413;
 Tue, 22 Apr 2025 10:10:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7AZm-00064Z-6o
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 10:10:02 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1f49a17-1f61-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 12:09:58 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so4181246f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 03:09:58 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5ccc97sm169821825e9.25.2025.04.22.03.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 03:09:57 -0700 (PDT)
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
X-Inumbo-ID: f1f49a17-1f61-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745316597; x=1745921397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1LTdCQlie2f1sx5yNyLtBh71A/ooQFxi1kwFBLZZzic=;
        b=YbV0G1493+zlQhSBa/2fJO5dm53YcKDJKhCg/RbP/b7Hm5WjkodvFCBZ2jTaKe6f8/
         5RnuviW5qMbN4ThUn+3S41gHYF+1H3jQ6G+BSlVWCiOx06odnUHUJc+zzmtJP9YLe/Fj
         9auLkp/wUIiELN3hGIN8ZI5pzOBn4W0T8wEJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316597; x=1745921397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LTdCQlie2f1sx5yNyLtBh71A/ooQFxi1kwFBLZZzic=;
        b=LgGj1F9jcVoHK4UjpjcYGgSEER3NPAKL4+dpfYwBFF9JFaYt4707s2NYEB+NTN8sv0
         kn4OXmyZJO+Dr7k3suH8XoL2pi/NeZLFr/mNi6IKcyLzOoWlr4kF6AsDWSu3qYM5qO91
         5OYDb1PqBndj9YB36CFfTcLSjbCDnPLSaJyu0rOc0H7GrrvgNGicVQAh/vA9tS56YYMF
         NyoWWAcrTub+Ce+DmhYVg3eACXEPMVuYTb0NjmF58m4en0rwV5WIC8XTk9fhFV/CEP5B
         mo41DgGAvJEJAOUXskDBKwleSgSeMqza49Iqb9CGKF03YDTfZirX2PmE4370z+odS4ni
         f9OA==
X-Gm-Message-State: AOJu0Yyfh9wnRsprs3eSI3Lx917mU5QZbrAqcFMsrX6yYp0nOURze5Xd
	hbrZ72PT4bkqh6yUiAUONrtGcv3S/QLe6IBkzs3QMhD8zorIC4pLsDRRogx1Yy4=
X-Gm-Gg: ASbGnctXmmCXF0BurtXi8O3WUNBXwwImTKU6xSn7ueWkx09eMQfk9a/+GKvz2EoUrr/
	iPqmxn7tLK4IMQG/NdWjfn6FyLvU5PZzKmY68bH/2ELBNgKI5HkDlotVaMm0+Bnni5RtbBgc07s
	SOy077d1Q9kTfWDP8DVgA6Q3L/8R3oGExrBv+1ItagZpMYuWLYh5ct5MPQaguuqSOoW7KeCxUnb
	YacJf7Sbcsk7t4Xmd4WW0VIyo9LRWzYWi7Tey7ti1K3M4sk0RDVnFxNMI4iQLFgI/4RdoJlxJPt
	bEdRFAgDZF7pwwiuO6XEGKhUjgQ75VJgdCQhYT4Xg8xCYEyLDwBIEw==
X-Google-Smtp-Source: AGHT+IGJE0m6+MjRWi1ZnFfCU5JAuGfQpzWnc448tKUMbLsvTIDKjnyjTOw378wiR6/ASkDsNFON0g==
X-Received: by 2002:a05:6000:43cc:20b0:39f:c05:c220 with SMTP id ffacd0b85a97d-39f0c05c2camr3332030f8f.22.1745316597621;
        Tue, 22 Apr 2025 03:09:57 -0700 (PDT)
Message-ID: <2657a0bb-7f89-435c-b743-a8d66d0a7c18@citrix.com>
Date: Tue, 22 Apr 2025 11:09:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/intel: workaround several MONITOR/MWAIT errata
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250417161913.14661-1-roger.pau@citrix.com>
 <463cd02d-febc-4878-90b5-9272f91b9033@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <463cd02d-febc-4878-90b5-9272f91b9033@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/04/2025 9:26 am, Jan Beulich wrote:
> On 17.04.2025 18:19, Roger Pau Monne wrote:
>> @@ -380,6 +380,43 @@ static void probe_c3_errata(const struct cpuinfo_x86 *c)
>>      }
>>  }
>>  
>> +/*
>> + * APL30: One use of the MONITOR/MWAIT instruction pair is to allow a logical
>> + * processor to wait in a sleep state until a store to the armed address range
>> + * occurs. Due to this erratum, stores to the armed address range may not
>> + * trigger MWAIT to resume execution.
>> + *
>> + * ICX143: Under complex microarchitectural conditions, a monitor that is armed
>> + * with the MWAIT instruction may not be triggered, leading to a processor
>> + * hang.
>> + *
>> + * LNL030: Problem P-cores may not exit power state Core C6 on monitor hit.
> I didn't manage to spot all three spec updates; none of these have a ucode fix,
> hence permitting the workaround to be avoided?
>
> Since CPX is 3rd Gen Xeon Scalable just like ICX is, I'm surprised that one's
> unaffected. The most recent spec update there is a year old than ICX'es, so
> may simply be too old to include the erratum?

CPX being "3rd generation" is especially creative marketing.  It's
literally another stepping of SKX/CLX with some extra AVX512
instructions, so is an entire "tock" away from ICX.

> Sunny Cove is used by further Icelake models - they're known to be unaffected?

ICX143 is specific to the server design.  It doesn't affect the client
design.

~Andrew

