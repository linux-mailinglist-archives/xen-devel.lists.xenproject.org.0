Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AEFA84F45
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 23:50:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946442.1344347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zmL-0005hm-Sq; Thu, 10 Apr 2025 21:49:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946442.1344347; Thu, 10 Apr 2025 21:49:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2zmL-0005fi-Pw; Thu, 10 Apr 2025 21:49:45 +0000
Received: by outflank-mailman (input) for mailman id 946442;
 Thu, 10 Apr 2025 21:49:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2zmK-0005fJ-Ck
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 21:49:44 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6003000-1655-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 23:49:43 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43edb40f357so11513475e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 14:49:43 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae979663sm124801f8f.51.2025.04.10.14.49.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 14:49:42 -0700 (PDT)
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
X-Inumbo-ID: b6003000-1655-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744321782; x=1744926582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nMfJln3Sct3YglmkwCjpkNwOf2rm/ISmDcPrPVVbhIc=;
        b=TOQQQlShyivBzb+0l7Mah/SIcuKd3hBtBoqe5aM1oZQFUtwqEuJA4T3PjM5tF5K8nA
         9bFBEpBGQFdFiknYPPbwoXQUDWccQM6rlMjA+jr2jdZ+P5XVQTUTIt4agPnBGsmIobQv
         rwwUEa+DG4qdPeZMg/8WTWSM8gZNOUuJ/c+9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744321782; x=1744926582;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMfJln3Sct3YglmkwCjpkNwOf2rm/ISmDcPrPVVbhIc=;
        b=EiVhQxtQ4rN/xU/TM6vtGxwur8y89IAd5mj6tLwSYw1WojcqKAA6TkeML/QFeOUUZB
         YIKxoH+iMaELL3+nBMoPk97vUKY4P+od+domG5sgf9sXslKi4M8d6u5J+dsYj+fqIeh0
         wiVXzDtFgomddn6MEXTdoQozCPuEFEMMQvumbCzqM0eRKALg13WoA5oCuUGdPOZV4Bxd
         X47027XNtbxSwuVxk0IhhvApXV5wP7PMiL/wlJfpHC73Emb3JuVF4RYzNT36eg1WNOW6
         G0e5qbgOBPfO9Bob6hekhstfziXqiu4uwOq2MGpO1aC43PfA0Fuejr14a4c2wBHYfBV2
         XZzA==
X-Forwarded-Encrypted: i=1; AJvYcCXkm5e5ZlXWAyXYvdX9DeHlNX9QTbjzWWL1CR/64Ht2fJnNHh82sxDSRInDG3rP6XMKH4RPMHT3Tds=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy7vg6jeatKdxQr2k55xVD4/VXMjgNUOumb29aU7uduqEuzPcs6
	SSFDOXygRllpIJMpfWbB+yVwvlXBgGurUltHhytAr0XLeDmUmentcBnPqA/5KDk=
X-Gm-Gg: ASbGncslgJD69TnGGdwHzZ7g0/G17P3QHSbu8507aOUlJ7Ciap39Y/+q8Z8Ggiyy0JV
	FlwZktnnJMHAbMgVE7TDTe/kfvbigjQVnP8bfu2rXYbx/RnCEwA/PbLRAh3DpStkCjuey4wdqPg
	8qSna9qMkzDqybqSAlODOSHkisYXQvmxZ6Gtbe6vBig557W4aFH9yI8AYoSNDaAY7hzStk4JHwe
	e4uou15hNV1TL8kSc1ohLec1Y2Szagm5cZE6EZozCKwYIDgxgXCzf5bAX8uxZcFQkRh9Eklkpyf
	D/hLgFjaVUplIcu8aQMhlb+3pFFE9Z9yqLAD5x3za4LuDtrlS3UEIhPFT9NeLidu51yEk40xbNj
	Fu3rPfg==
X-Google-Smtp-Source: AGHT+IG0D3qgBS6iBIOEF2/q7SVPA7NNrGacp1zU5JG7r47QTlLjskRzJtJPWJ1Ohv5srl4TEVoj5w==
X-Received: by 2002:a05:600c:a04:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43f3a93f257mr1069115e9.8.1744321782582;
        Thu, 10 Apr 2025 14:49:42 -0700 (PDT)
Message-ID: <84c03f50-638b-4df4-af52-8f79bf00dc20@citrix.com>
Date: Thu, 10 Apr 2025 22:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/xen: Fix PVH dom0 xen_hypercall detection
To: Jason Andryuk <jason.andryuk@amd.com>, agarciav@amd.com, jgross@suse.com
Cc: anthony.perard@vates.tech, marmarek@invisiblethingslab.com,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 xen-devel@lists.xenproject.org, Ard Biesheuvel <ardb@kernel.org>
References: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com>
 <20250410195012.363658-1-jason.andryuk@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250410195012.363658-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/04/2025 8:50 pm, Jason Andryuk wrote:
> A Xen PVH dom0 on an AMD processor triple faults early in boot on
> 6.6.86.  CPU detection appears to fail, as the faulting instruction is
> vmcall in xen_hypercall_intel() and not vmmcall in xen_hypercall_amd().
>
> Detection fails because __xen_hypercall_setfunc() returns the full
> kernel mapped address of xen_hypercall_amd() or xen_hypercall_intel() -
> e.g. 0xffffffff815b93f0.  But this is compared against the rip-relative
> xen_hypercall_amd(%rip), which when running from identity mapping, is
> only 0x015b93f0.
>
> Replace the rip-relative address with just loading the actual address to
> restore the proper comparision.
>
> This only seems to affect PVH dom0 boot.  This is probably because the
> XENMEM_memory_map hypercall is issued early on from the identity
> mappings.  With a domU, the memory map is provided via hvm_start_info
> and the hypercall is skipped.  The domU is probably running from the
> kernel high mapping when it issues hypercalls.
>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> I think this sort of address mismatch would be addresed by
> e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")
>
> That could be backported instead, but it depends on a fair number of
> patches.

I've just spoken to Ard, and he thinks that it's standalone.  Should be
ok to backport as a fix.

> Not sure on how getting a patch just into 6.6 would work.  This patch
> could go into upstream Linux though it's not strictly necessary when the
> rip-relative address is a high address.

Do we know which other trees are broken?  I only found 6.6 because I was
messing around with other bits of CI that happen to use 6.6.

~Andrew

