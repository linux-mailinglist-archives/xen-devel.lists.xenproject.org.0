Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE6AA7440F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 07:42:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930155.1332828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3QY-0008UR-Ur; Fri, 28 Mar 2025 06:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930155.1332828; Fri, 28 Mar 2025 06:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3QY-0008ST-RS; Fri, 28 Mar 2025 06:42:50 +0000
Received: by outflank-mailman (input) for mailman id 930155;
 Fri, 28 Mar 2025 06:42:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ty3QW-0008SJ-Ri
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 06:42:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9fd985c-0b9f-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 07:42:43 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so14017885e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 23:42:43 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8ff02f91sm17442935e9.29.2025.03.27.23.42.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Mar 2025 23:42:42 -0700 (PDT)
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
X-Inumbo-ID: d9fd985c-0b9f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743144163; x=1743748963; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BzxHs+Wro57eKQjF2Vr/UdyCRbsM9rSJzv087/W/Q10=;
        b=sw/RECEPOc+YR2/wy18l1EloipjWDsJIvo6bO+5sgq5z4UKA9Ghbpaontnv78mBlcr
         sSBKecl4DrKebWt3VQ32OZeOWQN9ZHAjr1A63ff4ZfojsYMu/oiOxy6nDnsJfm3yAKwx
         QjGMFYwtwapk3nwKnOIfg3XG5E1S11iWX6Lvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743144163; x=1743748963;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzxHs+Wro57eKQjF2Vr/UdyCRbsM9rSJzv087/W/Q10=;
        b=lcXPgMAK/LgGgnMQ9qEWsM02zghDZjHLG5SvAPPUjkfO7co5RDPvex81ZVMeEVQ47C
         14ZRT9vdBqexLcOghrPVFjkuByv8hob973z5O+/BoJRQIi/R74irwJcj+GeLGjFaHy/Q
         xrHOJPH+KdMV7DrvP6eBUE7VdPGX7Fv3vNgIDLNncbc1xOdTk1N8mSQtVyGHhSdGYHjp
         EPgBN44jBjHFdIksvsiFX1Zwxhy3Z/MXS1ShrUjqJ0VAy4QlwzUHGuW/fhEqtfyKDx5X
         i7+bqUod8skOPCCK96rbL6AiuYUxNrYfWbfr2EcjPMeucZlRrWvcJ4/qKWpvdP+h9obq
         0A0w==
X-Forwarded-Encrypted: i=1; AJvYcCVid2YmiLjUL+s7DTcEp1LZqo/xUXuLZokT6Mqd7p/bWwyVIAF+QWrW+ys+ZFegwFZoIU2Kensgz5o=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxqj5NXptaKJKhGzkCSDD5/Dl7NuLZwrpKbelqUY9w2bUuuY4o7
	R6TQL3WMj3rcSL+1FoeyaWOd0/QGvBCijq2WNbjlrIL2o1SOhvquc/0yGoSXOtc=
X-Gm-Gg: ASbGncvIwpo7uA2FsOASZNjFHeLo/qAYefMaricn+9s/MjYWDKKQVrUQA2L+mO7DLez
	cDS+dec/Tsa4vKssCVF/EZw4YfYTV1HC9Y0T+AO6s5nxPcJ53YlbNK8zwLGpHktHQ7h3ZRSjiuR
	5PvPZR1/tkn1r2605OFiFhq85slqJxOEHKCuLQWZ163GEml1jEF8E2zpb7bEoO9zJA7OQosE3HV
	rXAaXdl9wiN8GxoFacG8hlHso4WWIfhKHoWfn3hKZGywT9YUbKECsa/dUAP0MLM/pRSSxctzYUp
	OKj6ETTSRvCIc3kXdA6Bd51aKIkcl0gLycOBDEIKhRm1qvGMHhDTrjvD2nJ0i+V/TU65qzQmZDE
	q/wkhH+QYYA==
X-Google-Smtp-Source: AGHT+IFzdg398dDSZY8x7tED1owFpp+ZtrPRomKTwCuWU8MXb/52vwB4laCDNNhC4pyb61WjqpgMVA==
X-Received: by 2002:a05:600c:3106:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-43d84fb498fmr52843455e9.17.1743144162853;
        Thu, 27 Mar 2025 23:42:42 -0700 (PDT)
Message-ID: <8d98ba26-b358-407a-9f59-b7c08d1f09fd@citrix.com>
Date: Fri, 28 Mar 2025 06:42:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen: gcov: add support for gcc 14.1
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250327004044.2014048-1-volodymyr_babchuk@epam.com>
 <20250327004044.2014048-2-volodymyr_babchuk@epam.com>
 <b56cd8e5-d17a-46a3-8584-cf69113c145a@suse.com> <87iknugmgu.fsf@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <87iknugmgu.fsf@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/03/2025 10:03 pm, Volodymyr Babchuk wrote:
> Hi Jan,
>
> Jan Beulich <jbeulich@suse.com> writes:
>
>> On 27.03.2025 01:40, Volodymyr Babchuk wrote:
>>> GCC 14.1 has 9 gcov counters and also can call new merge function
>>> __gcov_merge_ior(), so we need a new stub for it.
>>>
>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> As to the title - what about 14.2.0? Or the soon to appear 14.3.0? I recommend
>> to say just 14.
>>
> According to GCC changelog, it was added in GCC 14.1. And yesterday they
> added another counter... So probably 14.3 will have 10 counters in total.

Do you have links?

I'd expect that to mean that GCC 15 will have 10 counters, not GCC 14.3.

>
>>> --- a/xen/common/coverage/gcc_4_7.c
>>> +++ b/xen/common/coverage/gcc_4_7.c
>>> @@ -28,8 +28,10 @@
>>>  #define GCOV_COUNTERS 10
>>>  #elif GCC_VERSION < 100000
>>>  #define GCOV_COUNTERS 9
>>> -#else
>>> +#elif GCC_VERSION < 140100
>> The situation is a little less clear here because the development window is
>> fuzzy to cover. Nevertheless with all other conditionals here using only a
>> major version, with subversion being 0, I think the same should go for 14.
>> Unless of course there is a good reason to be inconsistent.
> As I said, 9nth counter was added in GCC 14.1, GCC 14.0 had less counters.

In GCC's numbering scheme, .0 is the dev window and .1 is the release.

The 9th counter will have appeared somewhere in the dev window, but
that's all GCC 14 as far as we're concerned.

~Andrew

