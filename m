Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3BA5FD39
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 18:14:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913172.1319286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsm82-0002Ew-4I; Thu, 13 Mar 2025 17:13:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913172.1319286; Thu, 13 Mar 2025 17:13:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsm82-0002Dm-0x; Thu, 13 Mar 2025 17:13:54 +0000
Received: by outflank-mailman (input) for mailman id 913172;
 Thu, 13 Mar 2025 17:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w2IX=WA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsm80-0002Dg-Gi
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 17:13:52 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86efd778-002e-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 18:13:48 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso807625f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 10:13:50 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb7eb9d7sm2666162f8f.89.2025.03.13.10.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 10:13:49 -0700 (PDT)
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
X-Inumbo-ID: 86efd778-002e-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741886030; x=1742490830; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NzoI5jIqQu53nj85z0Eekd/DR96ze4UuEoDnj8cchg0=;
        b=aOyS9mUwI3zeauWnbco2pu4ybkskJogk4mIwdzRjFFiAUS5RMgZdBD2GLxNMY6LPk9
         bCLolFXzEFHfHmJJUDuWhJAFCKpZKtT7OGvXnCl+6ImR9nTiZzkPE+XuHjReDmdmOs5g
         qz07cTZCFaEvP7BUjSaMhfEFHxWB0QDNhlE3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741886030; x=1742490830;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzoI5jIqQu53nj85z0Eekd/DR96ze4UuEoDnj8cchg0=;
        b=wwRtU8ChwRyfhHNTEsX73cEThQEwPOequwFlBipodRCQCt9ozc3//2XfwAPcO76shY
         H42B9FgVCTwdBHKwEWBcYysY/zH6LDN0af8eKZRDAm90iNGIaAkFWrq7Y4icKxVGUOSS
         aRixOzRwthqmwYWetgrEpNbKq1SGRUJ/qp/G2j2f/xFbxaw38gzQsUobMXcq4jl9zTyt
         m4twNKw9wZYp6j8OFyvvNgY3iv50t98bEER2RRQqYP6eiV33wmntR0eGIqOh2heGlXTk
         1XJGmVbUvjrnN7brbIto991cb/2EDk5UAbgBhaVegGS33n4h00bmhhzBq0x51qx3abFs
         UjBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQJRrNuWh5eKU7dV08x5X7N2k8kJJTiG18FiLwib0p1kOzVSrk4q0p0a9CWAz0MjFSlmZXlZ+xMrM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxpGRLHji2hxzV9bvsQW+E5P9d455Ujafo3j5zGcfpthvZHZcg+
	xuiO1YlS9V6y39jiDJcaCazFO/k7pFzitco+3SsFMmeKnqPVCmbLfdMKM8w8syw=
X-Gm-Gg: ASbGnct0VtphzdPj1KGmD76Z20kcUMHSqoDct5YQ8zGU6cYQj5DP59pOx8bEZIErRpM
	97tXX4E3Vanfb7G2AYzLcXNHrLVBxCbaAwwIlbm/SfVsHT+IVTsgQ3Mic0omZ3vLN11/D9Cq9V7
	yRxqOIH4gxxJ3WVK+kkb9hcwLN/BOOHhFupMNDyb3wlf3GZO7MbsblumFcAvpIfdirP+VCtxchw
	IT9xNrt2qGu190Ik3TkvZgTbh75ebEII+Gk29EbMgGp14fsiMki9y7YvSXAetRNvwbFmgSA1Zyb
	4NlesRoePNgiHoYLP7obBE/4OhnYEt7X/3XiMXua4nqXQMx7KOB2HoZL9yMZu/uiWzXF1FQ+yt8
	ujis3N8A2
X-Google-Smtp-Source: AGHT+IG0Srf1ujjFTyr/9y+iEJp0/meRCke9hBJG23prbd1NxcZcsKqAwakgCC8nTkHYqmOeOruSQg==
X-Received: by 2002:a05:6000:1563:b0:390:f0ff:2bf8 with SMTP id ffacd0b85a97d-396c118e466mr385852f8f.10.1741886029691;
        Thu, 13 Mar 2025 10:13:49 -0700 (PDT)
Message-ID: <ea40ec3a-2f6d-42b5-8e98-ab5f4db5d4b4@citrix.com>
Date: Thu, 13 Mar 2025 17:13:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] symbols: arrange to know where functions end
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
 <51f2cd39-e92f-4745-8053-e51ada22d601@suse.com>
 <aace0fab-ce3f-4b9f-87c7-2daafd8442ba@citrix.com>
 <9bf90547-43de-416e-b064-b54c0e79fc93@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9bf90547-43de-416e-b064-b54c0e79fc93@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/03/2025 4:48 pm, Jan Beulich wrote:
> On 13.03.2025 17:39, Andrew Cooper wrote:
>> On 13/03/2025 1:54 pm, Jan Beulich wrote:
>>> When determining the symbol for a given address (e.g. for the %pS
>>> logging format specifier), so far the size of a symbol (function) was
>>> assumed to be everything until the next symbol. There may be gaps
>>> though, which would better be recognizable in output (often suggesting
>>> something odd is going on).
>> Do you have an example %pS for this new case?
> I haven't encountered one yet, and I wasn't particularly trying to
> make up one.
>
>>> Insert "fake" end symbols in the address table, accompanied by zero-
>>> length type/name entries (to keep lookup reasonably close to how it
>>> was).
>>>
>>> Note however that this, with present GNU binutils, won't work for
>>> xen.efi: The linker loses function sizes (they're not part of a normal
>>> symbol table entry), and hence nm has no way of reporting them.
>> By "present GNU binutils", does this mean that you've got a fix in mind
>> (or in progress), or that it's an open problem to be solved?
> The latter; I can't even tell yet whether this is legitimate to be
> arranged for in a PE executable's symbol table.

In which case, I'd suggest using the phrase "open problem" to make it
clear that there's no fix.

>
>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> Note: Style-wise this is a horrible mix. I'm trying to match styles with
>>>       what's used in the respective functions.
>>>
>>> Older GNU ld retains section symbols, which nm then also lists. Should
>>> we perhaps strip those as we read in nm's output? They don't provide any
>>> useful extra information, as our linker scripts add section start
>>> symbols anyway. (For the purposes here, luckily such section symbols are
>>> at least emitted without size.)
>> Will symbols_lookup() ever produce these?  If not, it might be better to
>> ignore the problem.
>>
>> Taking extra logic to work around a benign issue in older toolchains
>> isn't necessarily ideal.
> Afaict it's unpredictable from Xen's pov. All depends on the order of
> entries after we sorted the table by address. The only criteria the
> tool's compare_value() applies for multiple symbols at the same address
> is to prefer global over local. As long as the first symbol in a section
> is global, we wouldn't see section symbols as lookup result.

Hmm, thinking about it, the global-ness does cause problems.

e.g. we get _stextentry()+x rather than restore_all_guest()+x, and RAG
is more likely than some to show up in a backtrace.

So maybe we should strip section symbols, even the explicit linker ones,
from the symbol table.  I can't offhand think of a case where we want to
look up a symbol by address and get back a section name.

(Feel free to leave this as a todo.  I wasn't intending to scope creep
like this, but it would be a nice to have.)

~Andrew

