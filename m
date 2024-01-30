Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F07D8430C7
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 00:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673710.1048168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUx6W-0004K7-7k; Tue, 30 Jan 2024 23:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673710.1048168; Tue, 30 Jan 2024 23:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUx6W-0004IK-40; Tue, 30 Jan 2024 23:01:20 +0000
Received: by outflank-mailman (input) for mailman id 673710;
 Tue, 30 Jan 2024 23:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5qC=JI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rUx6V-0004HA-DD
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 23:01:19 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79725164-bfc3-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 00:01:17 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40eac352733so50648475e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 15:01:17 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a05600c46cf00b0040fb0c84c64sm942658wmo.14.2024.01.30.15.01.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 15:01:16 -0800 (PST)
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
X-Inumbo-ID: 79725164-bfc3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706655677; x=1707260477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=th5lMOKS3E7cYz5VLCWL8IVqBYQmofzNDiTHnNrqxfg=;
        b=u5Q46zYmOtO1t96ScYzweInCeX4KbIeza5jhoZLyv8hf6HVqYo3mFKRFeQ7LTMIpLN
         J08DeENF1rYq47bTw3VKhvyt2u9z1ecR43iloVxiEw6xk3edsXSDkmCH7cuHX4nIznD6
         eI+zRDF1nTtN26LQs4Sa5jXphYy/sRn6wGQYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706655677; x=1707260477;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=th5lMOKS3E7cYz5VLCWL8IVqBYQmofzNDiTHnNrqxfg=;
        b=bY3jpe3wLblo+qjrm/EG7fuU4+rjNARH+Kj0viOoAcpkUTVN5iDYj87Zhwzjpi0ZMc
         JkyrUbM1OsRFnWUerdK/Bpob10CXAtApEbMAlSzHhzurOqk/TvJeVuucAtMkABDj7nAX
         HrAPnB94Tb1+gvpyewk5KIgm54a7ur3aoOj/CpctwZrwwGP97Y6skpZ3gZ8UiJztyx4V
         JyI199pde29e2V6+Q4mF+HBowkujaWF6y9164UBX58ysp2eFa1q9KZgiiUtRGcUUVis5
         kccJS+fZcTzzWTyvlORcW3m7SzQ4dsrLeGt0rxzcrMG+pfrs3XZrC9eFBz9FNmdmCGWr
         Ue3w==
X-Gm-Message-State: AOJu0Yz6k/A5p2f6T9Lmaekgzl3GRd9AlaYeJ9AYJdS2iA9Lc0ALJz9u
	QtD01dVkYIlh7bvDtbJpfIGdpBfknUSnEluZRIXjKLl+yHZFB4T08K4dzaIMYgM=
X-Google-Smtp-Source: AGHT+IFdQtyaDQvMkjzLkxYhe+u9q/p07V6BpakM4hvtEzKiMhZ1j4AftNTAmq3apAKRT1UshRXdaQ==
X-Received: by 2002:a05:600c:4fce:b0:40e:fc23:4010 with SMTP id o14-20020a05600c4fce00b0040efc234010mr3553461wmq.12.1706655676833;
        Tue, 30 Jan 2024 15:01:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX07HBbmIwnOmfw258JLKvbr2TBDlie5f2oPNvr22ruXGpDaZMEd+aj9QuOFCzmc56mdwwnC1JMxJ/p2WVoLjd11bi8yULsYItjnju29dolkP4G5p/ci/swJcTBP+4shKQfSbQqQcXqNnQMhuT9Y27CuJa3x7hdYVK7ZT8EeiKmm1gt3Hp/gAPpCm4QtCy2VRuJ6hqFvCAAitauFvmfOTmnnbg3IosD7jPJDskwnflXHRCJ8/opeajYA/ChiYgVvaAKku3TDLSUo5DvmOynD8rAzM7p38AzbMDmzs2WQlwFI4fsNsaZtlc4VUW+M12mQ6j8Zsk3tuqmBDV8NPYys8zy1EeqyEeVD/B9oavRDa2M0G5P2ZGnGEU9mHEYbN+xC0zDS3lcpjrvRqlL9zIAWQ==
Message-ID: <fd912d70-d84c-4515-a421-7c00dcbd8d4c@citrix.com>
Date: Tue, 30 Jan 2024 23:01:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/*/asm-offset: Fix bad copy&paste from x86
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <20240130222808.106006-1-andrew.cooper3@citrix.com>
 <08a1328c-92c7-486f-9134-00aef1c5c1c2@raptorengineering.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <08a1328c-92c7-486f-9134-00aef1c5c1c2@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2024 11:00 pm, Shawn Anastasio wrote:
> Hi Andrew,
>
> On 1/30/24 4:28 PM, Andrew Cooper wrote:
>> All architectures have copy&pasted bad logic from x86.
>>
>> OFFSET() having a trailing semi-colon within the macro expansion can be a
>> problematic pattern.  It's benign in this case, but fix it anyway.
>>
>> Perform style fixes for the other macros, and tame the mess of BLANK()
>> position to be consistent (one BLANK() after each block) so the intermediate
>> form is legible too.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Julien Grall <julien@xen.org>
>> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> CC: Bertrand Marquis <bertrand.marquis@arm.com>
>> CC: Michal Orzel <michal.orzel@amd.com>
>> CC: Bob Eshleman <bobbyeshleman@gmail.com>
>> CC: Alistair Francis <alistair.francis@wdc.com>
>> CC: Connor Davis <connojdavis@gmail.com>
>> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
>>
>> Why does PPC have a local copy of ilog2() here?  Especially as it's not used,
>> and there's a perfectly good one in <xen/bitops.h>
> I believe this was a carryover from before we had asm/bitops.h
> implemented on PPC. Now that we have bitops implemented (and we don't
> define any offsets that use log2 anymore anyways), this is fine to
> remove. Will submit a patch to do so.

Ah - good to know.  Thanks.

> As for the actual contents of this patch,
>
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

and thanks also.

~Andrew

