Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1942A893C4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 08:17:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951950.1347560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Zc5-0005Kh-1P; Tue, 15 Apr 2025 06:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951950.1347560; Tue, 15 Apr 2025 06:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Zc4-0005Ib-Ul; Tue, 15 Apr 2025 06:17:40 +0000
Received: by outflank-mailman (input) for mailman id 951950;
 Tue, 15 Apr 2025 06:17:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4Zc2-0004mw-Uo
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 06:17:38 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 539c4c5b-19c1-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 08:17:37 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso51145815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 23:17:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c05asm12923546f8f.26.2025.04.14.23.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 23:17:36 -0700 (PDT)
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
X-Inumbo-ID: 539c4c5b-19c1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744697856; x=1745302656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LT+uYDWoZLHJWXbLNqpr+7CFPWW48Foa4LcV1ZbmmP8=;
        b=MwLvndDOiWNb/zlTCEpHPlcMJXX6jYIZ5sdg+CUFygz9Z9HhTS0Vc8f/lfNI1Nt8Z1
         b2PH/XdE/7xx2Zsok6oYLJuw0roU5MoBkVno2eG9594X1sNaWdNXyAZMhPPvVwgZ5d31
         A5haBu29JeqJCAme9Fsw13YROn64FNx+Y7CTvSHjQOqTObO8FhQgrwSZC4AEEy75uRee
         AU5jUmWwCWlTfH1lv+sUEs8S1WJb8AOB11g3Ima5hM0jyTuk2tnMMY9pdIzgzU+xoMzK
         PL7fKPbk/p20IKX50xaA/e4QMf0hPuZx1qQLo3/31omq+6HfL9ImdRWV77nOXLk4FHs4
         DqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744697856; x=1745302656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LT+uYDWoZLHJWXbLNqpr+7CFPWW48Foa4LcV1ZbmmP8=;
        b=LvcYsw5yiL+ITo857XquKXxX3uIczkzYoNXShPeXlmVEqvqXaNiimzbhqZX7X7E3r7
         aiTUf6T0CwQ3c99GTIAnS1JVqzyGkYNCtEc28Que08eHiLNBXFqlB8gykSTUw/7B+Z/Q
         SaO8SqTzNnb8lnCZrIBKQXvMevM0zldU7963qko1NrO+EiuGiqBdWV3QXycMfwsTTW4a
         Jj9NPdTLBwLZgsINe8v13cV1HT8cLfFwzc6+6EKCmhAwzJcGzyYLhczXUfWskrRyK2N1
         LJLQ5fCuSERx2M5eta1Rq0ly0elqpvlvEdYFrkj/DmMl5sN6IpXn5uSPKBwmps74ulyh
         gRZg==
X-Forwarded-Encrypted: i=1; AJvYcCVaGOLzRTBCu7wVZeXwRz5tmfBpVwujL/y1FwpPsxDIvWJRe0XZPJprx6+4UqKtOcqK7vz8eoQMoFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybLxR3h3TJI1oDQl3IP2eLM7RkUJyJEzkuw24m7u2Ad5B5wfHx
	YVP9byHrJNKKc+ZestbJfAnge6pWIdXr9D97/GAZXG9i6L2ceRPiWCZ8zQshrA==
X-Gm-Gg: ASbGncvipewyb8I8ZLp6vNfyWAGjT8kLpPZb190hBs4Sg4r0ysQuZSDo28BLkcn0a91
	KcT5njzxPkq5V4br+e2Ml2pZQUeI3vN5BUBWP3k+ff13H1PhqU7+cwDRjNZVsSIo4votvkoXu5e
	jNQEavuZrVjfGp4/ExhmFW3D55dHCqdKtqhWE1+SqJlr6c8sYRwejPCvn7EULqlt7frdrXYKaKF
	68OSEze9xRcieeMShN/7vBX6ptJ96z1X0v5KJ4DUKxb868scqL7DXsNrUT7o3EfLE/i9bJ7orFD
	61iEU0JDN6nmi3QDFXxBGwlE4mbWhelN5yiNNFDOqAgm+WD++yWdU6Noftf/HegKuz1hV71Bcdx
	q0/20evXpy/tKd2DAgoabSD2Auw==
X-Google-Smtp-Source: AGHT+IFXImdgCtUgbqED6CdlV2m36z+YGvRnffysknQgPaX3lmNRGWoSluEYc/sY37y7aOzzHyZdBg==
X-Received: by 2002:a05:600c:1d83:b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-43f3a9afdeamr150603665e9.31.1744697856642;
        Mon, 14 Apr 2025 23:17:36 -0700 (PDT)
Message-ID: <60363eb4-cb35-4077-b964-0c321c495a19@suse.com>
Date: Tue, 15 Apr 2025 08:17:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/16] x86/hyperlaunch: locate dom0 initrd with
 hyperlaunch
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-12-agarciav@amd.com>
 <b3018b0d-e0e8-440e-9f02-363a7bd0378f@suse.com>
 <D96IXRWYOGUM.Z5A9K2NCCBQY@amd.com> <D96JE0Q8U026.2FWWHTWUUMTPE@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <D96JE0Q8U026.2FWWHTWUUMTPE@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 19:27, Alejandro Vallejo wrote:
> On Mon Apr 14, 2025 at 6:06 PM BST, Alejandro Vallejo wrote:
>> On Thu Apr 10, 2025 at 12:34 PM BST, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>
>>>> +            printk("  ramdisk: boot module %d\n", idx);
>>>> +            bi->mods[idx].type = BOOTMOD_RAMDISK;
>>>> +            bd->module = &bi->mods[idx];
>>>
>>> The field's named "module" now, but that now ends up inconsistent with
>>> naming used elsewhere, as is pretty noticeable here.
>>
>> Well, yes. It is confusing. Also, the DTB is called multiboot,ramdisk,
>> because multiboot,module is already used to detect what nodes are
>> expressed as multiboot,modules. I'm considering going back and calling
>> them ramdisk again. If anything, to avoid the ambiguity between
>> domain modules and multiboot modules. e.g: a kernel is a multiboot
>> module, but not a domain module.
> 
> Particularly when misc/arm/device-tree/booting.txt already states that
> the initrd for dom0 ought to be provided with the "multiboot,ramdisk"
> string in the "compatible" prop.  Deviating from that is just going to
> make it far more annoying to unify arm and x86 in the future.  And
> calling those ramdisks anything but ramdisk internally is just plain
> confusing (as evidenced in the current series).

Yet the limitation of this is quite obvious: How would you express
multiple such items? Have many "ramdisk"s? Even if some of them serve
an entirely different purpose? See how Linux has gone to tuck together
multiple CPIOs, as they can have only one thing called "ramdisk"
(which, aiui, now no longer truly is).

> So... how frontally opposed would you be to restoring the ramdisk
> nomenclature? Also, for ease of rebasing future patches it'd be far
> nicer to go back to ramdisk rather than reinventing some new name.

Well, I fear I wouldn't ack such a patch. If everyone else agrees
that "ramdisk" is the best of all names (or at least getting close),
I'd perhaps mumble over, but let it go in.

(Only partly as a joke: If we dislike "module", how about "blob" or
some such?)

Jan

