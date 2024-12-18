Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F29F6D30
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 19:24:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860716.1272716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNyhP-0006zJ-GZ; Wed, 18 Dec 2024 18:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860716.1272716; Wed, 18 Dec 2024 18:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNyhP-0006xk-Cu; Wed, 18 Dec 2024 18:23:07 +0000
Received: by outflank-mailman (input) for mailman id 860716;
 Wed, 18 Dec 2024 18:23:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNyhN-0006xO-L8
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 18:23:05 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ea3ed7e-bd6d-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 19:23:03 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436249df846so47593145e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 10:23:03 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80473c6sm14892985f8f.80.2024.12.18.10.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2024 10:23:02 -0800 (PST)
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
X-Inumbo-ID: 1ea3ed7e-bd6d-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734546183; x=1735150983; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PrnorXnwpqmWEpMhBImRd1eafu9+696TUxmc4Va37CU=;
        b=czoCpH1RkBW1Z/gTW7dtLWgGA+oLb8o0ifzsFSQ3jXasi0k/allZzzifXnBUKgi4OA
         UhIuNzLYT+oxa33a4cmTWT2NyblqYfFgnV8joD7Lw7+Z+JEnr+/NFYXHnQABoufTiGok
         gBZJUsJ/Jl2XwXZ//KzxVMUS29WqJp7Q6G1Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546183; x=1735150983;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrnorXnwpqmWEpMhBImRd1eafu9+696TUxmc4Va37CU=;
        b=KeCx+LNjj3k4D908LW3VhZ9QZGbKenjvRWt6xKp6JNvVrR6QmqX/cepDxPzrOPjW8k
         Plh7kmBvhCmsf6qF0I1U5+Y9zMGarK66xD7GlGJ9GE1WJdBbktSOKjnLQ8hw/8bcSowe
         7skchNKiv+9VInk13LoyNxuNovTqdMRG35E6/1q0QgknBWnF5+hF6tPYKM5svyPAoKEA
         btAqg64ZpHruokywgQzfA0SVzx3xt5YyZbpMNsp2+MEPDfdj3WbrTJ3w18Dt/0nX8dba
         9yi4kireBBRhVLvvULgHHUXTcIPOvc6PAwZEh6O9SAvnBQo1JuokuZLjrbdgX+sfQ6PS
         Ateg==
X-Gm-Message-State: AOJu0YyI0ds7ZF+6vVq/XjCAnQpankJ5Ku+rXLDBxAvnDT/G5qQdC6Dk
	nes1+Kxjhxwapo08SBJ/dL15/hGCuFnn9u0NTg8ARxy+WkQIAt2KK+HZZTQLsZA=
X-Gm-Gg: ASbGncsAKMu125lxXr2YYwfAk1dIicabZWc2oWEE88cBPlpVmPhPR2qghMh4fRzEZt8
	WirBCxKkh5K0Mxslq/8v1zu0dlJAIWWmhRthAgfTqj6OEe4obPyh7jdcpEZAxdrIfWckmkn9ldY
	2PepwtKDCPrbFyubyq6KXBMnujlRTG91GMF8N6cn4UeopuGVgeDxscKuBs8fyvboRHJvUnGa/Me
	vjgd6TKif3wyoptsy4/8derkp7pm4JMRPRI8zzj+4nR1H1eJUfsxfdC/mS35A1a6nlK3iM3EcM/
	T5deAQ8cWzsIL0DFJlPi
X-Google-Smtp-Source: AGHT+IFKNfmczvTldmk/mLbelf9YoamougVEF6g+xmKT8yCQavS/iSuM6lb4KTCjNxN93ESRYOrGhA==
X-Received: by 2002:a05:6000:460b:b0:386:2e8c:e277 with SMTP id ffacd0b85a97d-38a19b48f11mr637909f8f.55.1734546182964;
        Wed, 18 Dec 2024 10:23:02 -0800 (PST)
Message-ID: <ab1fc081-3ff6-4062-9f99-23786d42130c@citrix.com>
Date: Wed, 18 Dec 2024 18:23:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/xg: increase LZMA_BLOCK_SIZE for uncompressing the
 kernel
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
References: <20241008213225.728922-1-marmarek@invisiblethingslab.com>
 <Z2MNQTDM3N22ceWy@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z2MNQTDM3N22ceWy@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/12/2024 5:58 pm, Roger Pau Monné wrote:
> On Tue, Oct 08, 2024 at 11:32:23PM +0200, Marek Marczykowski-Górecki wrote:
>> Linux 6.12-rc2 fails to decompress with the current 128MiB, contrary to
>> the code comment. It results in a failure like this:
>>
>>     domainbuilder: detail: xc_dom_kernel_file: filename="/var/lib/qubes/vm-kernels/6.12-rc2-1.1.fc37/vmlinuz"
>>     domainbuilder: detail: xc_dom_malloc_filemap    : 12104 kB
>>     domainbuilder: detail: xc_dom_module_file: filename="/var/lib/qubes/vm-kernels/6.12-rc2-1.1.fc37/initramfs"
>>     domainbuilder: detail: xc_dom_malloc_filemap    : 7711 kB
>>     domainbuilder: detail: xc_dom_boot_xen_init: ver 4.19, caps xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm-3.0-x86_64
>>     domainbuilder: detail: xc_dom_parse_image: called
>>     domainbuilder: detail: xc_dom_find_loader: trying multiboot-binary loader ...
>>     domainbuilder: detail: loader probe failed
>>     domainbuilder: detail: xc_dom_find_loader: trying HVM-generic loader ...
>>     domainbuilder: detail: loader probe failed
>>     domainbuilder: detail: xc_dom_find_loader: trying Linux bzImage loader ...
>>     domainbuilder: detail: _xc_try_lzma_decode: XZ decompression error: Memory usage limit reached
>>     xc: error: panic: xg_dom_bzimageloader.c:761: xc_dom_probe_bzimage_kernel unable to XZ decompress kernel: Invalid kernel
>>     domainbuilder: detail: loader probe failed
>>     domainbuilder: detail: xc_dom_find_loader: trying ELF-generic loader ...
>>     domainbuilder: detail: loader probe failed
>>     xc: error: panic: xg_dom_core.c:689: xc_dom_find_loader: no loader found: Invalid kernel
>>     libxl: error: libxl_dom.c:566:libxl__build_dom: xc_dom_parse_image failed
>>
>> The important part: XZ decompression error: Memory usage limit reached
>>
>> This looks to be related to the following change in Linux:
>> 8653c909922743bceb4800e5cc26087208c9e0e6 ("xz: use 128 MiB dictionary and force single-threaded mode")
>>
>> Fix this by increasing the block size to 256MiB. And remove the
>> misleading comment (from lack of better ideas).
>>
>> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>
> I assumed I already RB this, but it seems not.
>
> Could we get an Ack from the tools or libs maintainer for this to go
> in?  It's not the best solution, but we need to get this sorted in
> time for 4.20, and backport to stable branches.

I agree.  This isn't great, but it's far better than doing nothing, and
there's no other viable alternative proposed.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

~Andrew

