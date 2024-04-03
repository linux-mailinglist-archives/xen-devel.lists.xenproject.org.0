Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588468964F7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 08:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700314.1093252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruTy-0002QY-Ex; Wed, 03 Apr 2024 06:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700314.1093252; Wed, 03 Apr 2024 06:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rruTy-0002Nu-An; Wed, 03 Apr 2024 06:52:26 +0000
Received: by outflank-mailman (input) for mailman id 700314;
 Wed, 03 Apr 2024 06:52:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rruTw-0002No-9L
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 06:52:24 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9290006-f186-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 08:52:23 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d8129797fcso40724041fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 23:52:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p18-20020a05600c359200b0041543b57ca2sm20552871wmq.21.2024.04.02.23.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 23:52:22 -0700 (PDT)
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
X-Inumbo-ID: b9290006-f186-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712127143; x=1712731943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3+qUqKB+un59yKLHPEdTo21gCOCZ+f8bVdOltJwjCzM=;
        b=IBXhREWGHVslwoj8kMgyYlxxaixZs5l9gplMTL/DNYaz7U8hvK/jHOlX8PwWgMwHlI
         HxD7nDyiqLkUCfNBKGUmCgHxkDx8Ka21WMfK2+j8dIlh/0zugDwzWyRU/y4yLWK6T3Gc
         gNHPXaHPuA4zmXcOXesRtuXdICoX9nZTraSUO/A+sBp1xeahTqttDWhA1eyTJ4efboKX
         oHnE4AYya/hLQI3+7eUZZHL6ANg6u8E8HSO7C/iopeUS0CoKk39hcRBmJOvLpzp6ZRww
         U2iEU9d78k+99m179gff0OHRtFI1DXDYzsjwO7ECNle8kuiBJ16v3rx5TWw1J/QP94mo
         Ke8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712127143; x=1712731943;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+qUqKB+un59yKLHPEdTo21gCOCZ+f8bVdOltJwjCzM=;
        b=DL1fDrkyh6T5NG/PcibpPSSJGBTbbrwqnM+Fu/yrhRz5Y/R/Qs4hK67KhCIQOrGj+q
         PZhXS+CiuRERrGbFmTuYQ9BJB2VWHE9EdpoM/PmkSvEHHnb/0PT5GE5lsEp3HfOlZcNt
         zx8R6k1LgMqTULCkI5QIQi6fnxpqMPcKzbIPY0UbWVxKbvDiGVn7+HMcRxWXftvAZ/Wd
         5bQ2EF02SWUYOoK8TVvudpGi9Voxv9rS9Vdup6Kc+crFvUoJwwGRPHTZGpUossBuweOW
         ePLw96vwX4tDOcSqVSo5mNvA4yJ3Z4Z84evMt8OtKFAG1po1mUX8ywb4g7P4asUc7Npx
         zhLA==
X-Forwarded-Encrypted: i=1; AJvYcCVXVZBS6ovDf9ImMPZHTiICkHVM9LTLzXZCok2Mv8rMPgvkCGJAF4z/rKCEaoHbDY8h/MaFK7AktsHZjHlnLwjRJ7uM7ch4jHW9bwleN5w=
X-Gm-Message-State: AOJu0YwEA4WUwzaCB/9RwDFt8uMZUOyDcX+H+XBjIm+89g/VsdMYXSh4
	oZhl0ZZUJzN+SH/LRb8yX8K9L4nC4h1qx1RMMEuvDaSum6RRBcz178K5ocd6UQ==
X-Google-Smtp-Source: AGHT+IHtrfeOEVxvU/A0oxGUdrVGFqYvWqvdr9+j7Fh6zTAOk0/wliQPhTKVgyM3FjDY6csjjENrgg==
X-Received: by 2002:a2e:8610:0:b0:2d4:3d86:54e2 with SMTP id a16-20020a2e8610000000b002d43d8654e2mr8984668lji.27.1712127142709;
        Tue, 02 Apr 2024 23:52:22 -0700 (PDT)
Message-ID: <f2b596e6-0aec-4948-ad7a-aa38adaa7dcc@suse.com>
Date: Wed, 3 Apr 2024 08:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 08:16, Jan Beulich wrote:
> On 02.04.2024 19:06, Andrew Cooper wrote:
>> Whether to return information about a xen-owned evtchn is a matter of policy,
>> and it's not acceptable to short circuit the XSM on the matter.
> 
> I can certainly accept this as one possible view point. As in so many cases
> I'm afraid I dislike you putting it as if it was the only possible one.

Further to this: Is there even a way to express the same denial in XSM?
alloc_unbound_xen_event_channel() doesn't specifically "mark" such a
channel, and (yes, it could in principle be open-coded in Flask code)
consumer_is_xen() is private to event_channel.c. I also dare to question
whether in SILO mode status information like this should be available.

Jan

