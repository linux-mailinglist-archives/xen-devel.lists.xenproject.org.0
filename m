Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D741A60FE3
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 12:25:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914443.1320202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3AW-00086R-Hj; Fri, 14 Mar 2025 11:25:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914443.1320202; Fri, 14 Mar 2025 11:25:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt3AW-00084W-EM; Fri, 14 Mar 2025 11:25:36 +0000
Received: by outflank-mailman (input) for mailman id 914443;
 Fri, 14 Mar 2025 11:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXxa=WB=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tt3AU-00084L-FY
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 11:25:34 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b275c04-00c7-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 12:25:33 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so18961645e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 04:25:33 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdda32fsm14499055e9.4.2025.03.14.04.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 04:25:32 -0700 (PDT)
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
X-Inumbo-ID: 0b275c04-00c7-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741951533; x=1742556333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BztVFSmMh26mVXzxpp7isWIJahsK74R+pWfSWlZ4N2I=;
        b=bViyyv66SZwX4Ls1Jpnkz8kqyZwzBGayhjiIrhDXkfhuwlxNDG6xOXxZceDm25ZK3B
         wdHUXsZHShZ8GEPMeF32cQOaPZ1y0u+THT/vM+rFiALH66ebIiDZlkCNZSHEx2BPXVGg
         i21RfrISsfc2SXLCmXE8ftYhjQQJ3Bw794+us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951533; x=1742556333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BztVFSmMh26mVXzxpp7isWIJahsK74R+pWfSWlZ4N2I=;
        b=DzDhemql1I0IoupbtsAh10jueQm8Wd6QW2ZZ/W2632jJbfWt3BbiUBGa9wY+ql5Rv2
         jeE3+GS9yOAkMDbzOo3qbZIBb0W/rvUhfeXXRBXOLXWvuaJlpbbHB48X+MVpVo7YNf8h
         9Qo/wabQAkY2rx/TdGXdvo19fnI86bmypt9SFKWNAUI4+U6MxQKFQPtxvFJCshmdKTGE
         T11G/ku6J1B18DKY17vGWQLqSc2VPjPkcfUgGyPO8S5b3S1hepkT4Vtq9ohztgXmm0gc
         V/sp430rur6kJ0q2H6pv3DH2qF8go22QbJpxT2iolRc/8DWWWN03Bef+eJ9ARI+VIOjo
         FQhA==
X-Gm-Message-State: AOJu0Yw5IQXNkXsj7Dssle4X2IIfqjF5C/YsQ+l/pnNUO4I46XY69Dt0
	NHwbtK/O4oXC1XNorwdOW1V6TzNB58jDHRZq3odk1/TUPF9CktFKVLB55YICmr8=
X-Gm-Gg: ASbGncsBvkBSB9ktGtrud7cvOhmSwtUg98T70nRoT/OCOZPnQJYm2P+qJXBat06dz82
	KmV2tjLGp0FOdaJER2Oi+0POrxK3rRt3A1R6M05ImK5gGNiu2MvMhORQnConB6rW318FYiTT6Z6
	KoGgrNKMWhVu8DE2ZWHiD3DiatC8GcJsWLqz1sBCbDk0xQJtkY24EYQGZAyJ7umD2ujPccDb/3H
	GA7xlFLUfJ7ncq+BDPF7J+ASl60QySh9WBI+Zv4c8jajot4MM0p6p3JWmos7GxSR56JVvBVgzum
	VROFI4ZLfEnRFKkh5oj8njsDRhkraDgsgR6ON/vcalLSUa02gVRgpLz74h3a4T8TDQV41nK45cU
	8Hzuigb9/ZaPuLHyHIk8=
X-Google-Smtp-Source: AGHT+IF+AMzP66NaxcUNCbiMVli0NpnmBL25N5Nr8JjRCz5KpUYlKc46YDAPpw3gXN8sRDLDTba5yA==
X-Received: by 2002:a05:600c:5128:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-43d1ec73305mr27076605e9.6.1741951533112;
        Fri, 14 Mar 2025 04:25:33 -0700 (PDT)
Message-ID: <d7b6b1ee-76d8-400f-96fd-f72271701861@citrix.com>
Date: Fri, 14 Mar 2025 11:25:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] x86/ioremap: prevent additions against the NULL
 pointer
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20250313153029.93347-1-roger.pau@citrix.com>
 <20250313153029.93347-6-roger.pau@citrix.com>
 <ad26bb49-4025-4190-ba69-c03584cf2229@citrix.com>
 <Z9PsNVbC4leLFMqO@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z9PsNVbC4leLFMqO@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/03/2025 8:43 am, Roger Pau Monné wrote:
> On Thu, Mar 13, 2025 at 05:21:13PM +0000, Andrew Cooper wrote:
>> On 13/03/2025 3:30 pm, Roger Pau Monne wrote:
>>> This was reported by clang UBSAN as:
>>>
>>> UBSAN: Undefined behaviour in arch/x86/mm.c:6297:40
>>> applying zero offset to null pointer
>>> [...]
>>> Xen call trace:
>>>     [<ffff82d040303662>] R common/ubsan/ubsan.c#ubsan_epilogue+0xa/0xc0
>>>     [<ffff82d040304aa3>] F __ubsan_handle_pointer_overflow+0xcb/0x100
>>>     [<ffff82d0406ebbc0>] F ioremap_wc+0xc8/0xe0
>>>     [<ffff82d0406c3728>] F video_init+0xd0/0x180
>>>     [<ffff82d0406ab6f5>] F console_init_preirq+0x3d/0x220
>>>     [<ffff82d0406f1876>] F __start_xen+0x68e/0x5530
>>>     [<ffff82d04020482e>] F __high_start+0x8e/0x90
>>>
>>> Fix bt_ioremap() and ioremap{,_wc}() to not add the offset if the returned
>>> pointer from __vmap() is NULL.
>>>
>>> Fixes: d0d4635d034f ('implement vmap()')
>>> Fixes: f390941a92f1 ('x86/DMI: fix table mapping when one lives above 1Mb')
>>> Fixes: 81d195c6c0e2 ('x86: introduce ioremap_wc()')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, with one style fix.
>>
>> It's unfortunate, because C23 makes this one case (add 0 to NULL
>> pointer) explicitly well defined to avoid corner cases like this.  Oh well.
> Interesting, so they added a new type (nullptr_t) that has a single
> possible value (nullptr), and hence arithmetic operations against it
> always result in nullptr.  That's helpful to prevent this kind of
> bugs.

nullptr_t is unrelated.  That's for _Generic() and friends.

I'm struggling to find the reference to NULL + 0 being made well
defined.  It was in the context of library implementations of memset()/etc.

Nevertheless, we've got to cope with it, given our current -std.

~Andrew

