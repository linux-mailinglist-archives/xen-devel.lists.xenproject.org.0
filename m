Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38481A663E9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 01:35:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918373.1323071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKvf-0006Q1-Rz; Tue, 18 Mar 2025 00:35:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918373.1323071; Tue, 18 Mar 2025 00:35:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuKvf-0006Ny-OX; Tue, 18 Mar 2025 00:35:35 +0000
Received: by outflank-mailman (input) for mailman id 918373;
 Tue, 18 Mar 2025 00:35:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0H9a=WF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tuKve-0006Ns-Ve
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 00:35:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e420325e-0390-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 01:35:28 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cef035a3bso19341115e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 17:35:28 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318aa1sm16936875f8f.64.2025.03.17.17.35.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 17:35:27 -0700 (PDT)
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
X-Inumbo-ID: e420325e-0390-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742258128; x=1742862928; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0CWsgzYiVl0nbp0v3mUtB2WMNFcPU8v6pDNMTlhXAn0=;
        b=YONiZ3XoJ6rGl8Byr2uZAHy3sbQH9rB0XvGKYfAoxliTKLpYoGffVtNASer2ZS9dMJ
         tuplbaUMsyCODwB3DZ4GXgK0+iFdR7HO3Lhg3OhkctgxnZFzyeyd98PECqY/esfSEi3v
         tL/zNnTnKlPkOt82Fenp62eM61STkzHGAaaqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742258128; x=1742862928;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0CWsgzYiVl0nbp0v3mUtB2WMNFcPU8v6pDNMTlhXAn0=;
        b=i+MRl4/NuQz/R+P2JgsoRIfTzDyWlrSK9enL64prc+NdO+LysPSX7XOvn9nyaAUHvg
         9rSuwfKuFVHj+v/DQtXEc1z2lzrGxyi9drKhLPdTzYh8cFhL5Ps2+dKDhVIKGCDK4Rs4
         Uty7PDPfDpyjukAOeyF8H1QT2eMsDnRQBprKVYw8FegzRugZ58ch0MO8SaKi/OkSUurF
         mzeweT9iQAjwq0jTpe0qqUWmrv5xbYNCszZ6P4iPD395+QKQ/euco/ILe1uwLM/hzZ8h
         Q4SVKgzY8/n30b22IjL4bz6qWFNj4wk8wfkV5KAbP1akTKNEmJEcGXgg4nEe6gYRqtQ5
         yOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJLZ+nn35rcBglCGvrzZouClYgN1rHmb+y1dItfBTf9uSAxGWpp4cKGadpV4epUK2mGcIwptGCHcA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwohFZhf2GyG5Azl4rm5MhzgJgQ+njU8etdN0UMBObvXGW9ul+j
	BhUjBFHRW1KuXP7WHrYuJs0YEfpO+iSwhM1H4u2DI8BBYmgrhCJk8tj0E7nuB+E=
X-Gm-Gg: ASbGnctMER1KAdvlhmcXGLHpiDs4k3lTIp6Yd//6KzHt5YhDhbQNyCCv+WWufvdVPHb
	p+OM0/06zSnFLUI7pXp+QrkVF60DgPKp2jMNgN3Y4npda4TLRjMJJDZzW8TKfPJmmfiMQGhTG6H
	BtsrJVikdF2ZSzr+09Ec9qrYmTI898cYb7eMU4tz/hYb/KSReneKXBItFQlWQbp144+bsXnJ93M
	D25ockmfx2fs1dheXkMK/2IR0vSfhQFCtrcGo91Equ8zOwuJG/XsdAE3r7xUtpWQArIpx5vm1V/
	Vvqxv3HLoKMIxL4DrDkZraAfNAe7PZbfQ2L47PqZH8UaQ+pK43PLIVv7eao7llgrX6yqawuXBVO
	6W4ZDy7oY/dUrGu6WPWg=
X-Google-Smtp-Source: AGHT+IFf+DzwTK2rSjpT8FBghklLjuq/LqqFqdaOq72RCOqx8Rbzp3arCcRW+Og34S2TfdL1BMO+eQ==
X-Received: by 2002:a05:600c:1389:b0:43d:8ea:8d80 with SMTP id 5b1f17b1804b1-43d3b951a1amr2565025e9.5.1742258128161;
        Mon, 17 Mar 2025 17:35:28 -0700 (PDT)
Message-ID: <1854625e-c1d4-4c2b-b219-31a6d48f5e47@citrix.com>
Date: Tue, 18 Mar 2025 00:35:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] analysis of runtime xenheap memory allocations
To: Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Michal Orzel <michal.orzel@amd.com>, VictorM.Lira@amd.com,
 Carlo Nonato <carlo.nonato@minervasys.tech>,
 Alex Zuepke <alex.zuepke@minervasys.tech>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, jgross@suse.com,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <53e85609-dba4-4fd2-972c-8c2746074c4a@minervasys.tech>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <53e85609-dba4-4fd2-972c-8c2746074c4a@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 6:48 pm, Andrea Bastoni wrote:
> Hi,
>
> In the last months we have been working with Stefano's team in AMD at tools to
> facilitate the analysis of "anonymous" memory allocations performed at "runtime"
> from the shared Xen heap.
>
> - Anonymous here means: allocations that insist on the common Xen heap pool
>   (i.e., not on a per-domain heap pool).
> - Runtime here means: system_state >= SYS_STATE_active.
>
> TL;DR: A set of patches print a warning stack when anonymous allocations are
> detected at runtime. Scripts help to parse the stack traces that can be checked
> to evaluate how problematic certain allocations paths can be or how difficult it
> could be to update them. A full example of the results is e.g., in [1], and the
> Readme-details in [2]. Below in the email more details and some commented stack
> traces.
>
> Feedback, especially on the paths that are currently marked as "UNDECIDED"
> is very welcome.
>
> [1]: https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/1674833972/parsed/x86_64/xilinx-hyperlaunch-x86_64-gcc-debug-virtio-pci-net
> [2]: https://gitlab.com/minervasys/public/xen/-/blob/minerva/warn/minerva_analysis/README.md

Hello,

A few observations.

As you note, assigning ownership to current->domain is usually the wrong
thing.  Setting PGC_allocated however is worse; you've created a
security vulnerability where guests can free memory that Xen things is
private to it.

Similarly, you can't interchange xenheap and domheap like that.  It will
work on small systems, but not on large ones.  Nevertheless, it's an ok
start for debugging.

Ages ago, I tried to make a start on this problem,
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen.git;a=shortlog;h=refs/heads/xen-fault-ttl
simply by counting the number of xmalloc()'s to the domain with with
they were logically associated.  It's stalled because the
fault-injection test found a refcounting bug and there isn't even an
agreement on whether it's a bug or not, or how to fix it.


I'm struggling to follow the analysis on
https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/9207014172 
However, it appears to be a mix of reports between arm64 and x86_64
jobs, and they need separating to get a clearer picture.

The bottom of each stack trace appears to be doubled.  Is that intentional?

Part of the problem is that xmalloc() isn't separated from
{xen,dom}heap, despite the former being layered on top of the latter. 
All *heap pages are going to a multiple of 4k as that's the allocation
unit.  It will probably be better to terminate at _xmalloc() and ignore
the call down into alloc_domheap_page().  Importantly, _malloc
allocating another 4k page isn't strictly related to the caller, when
it's doing so to replenish it's free pool.


The 1-byte allocations are silly.  bitmap_to_xenctl_bitmap() is buggy
for trying to cater to an endianness case we simply don't support. 
There's no memory allocation needed at all.  There are patches to
resolve this from aaages back, blocked on a request to fix up other
endian helpers in the meantime.

evtchn_fifo_init_control() seems to show up a lot, and seems to be the
only dynamic allocation triggered by the guest itself.  It's reasonably
large, but probably ought to be allocated up front.  event_fifo is
pretty ubiquitous these days.  I'm not sure where the alternative sizes
come from; they ought to all be 392 bytes.

I'm concerned by the xfree() in efi_runtime_call() seeing as there's no
associated allocation that I can see.


Finally, it's not just anonymous allocations you need to worry about. 
Even ones out of the p2m memory pool are still fatal at the point of
exhaustion, and can cause safety issues.

~Andrew

