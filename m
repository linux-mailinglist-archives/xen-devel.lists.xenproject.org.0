Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D5F9457B9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 07:44:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770136.1181062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZl5M-00078O-4q; Fri, 02 Aug 2024 05:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770136.1181062; Fri, 02 Aug 2024 05:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZl5M-00076M-2I; Fri, 02 Aug 2024 05:44:16 +0000
Received: by outflank-mailman (input) for mailman id 770136;
 Fri, 02 Aug 2024 05:44:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=quvz=PB=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZl5L-00076E-0w
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 05:44:15 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f36eeec-5092-11ef-8776-851b0ebba9a2;
 Fri, 02 Aug 2024 07:44:12 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4281faefea9so39700205e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 22:44:12 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428e6e9cd14sm18773995e9.45.2024.08.01.22.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 22:44:11 -0700 (PDT)
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
X-Inumbo-ID: 3f36eeec-5092-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722577452; x=1723182252; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/suS5E/THPwitL/0CNux/d6Wr8slSFy728FjLfghXwk=;
        b=C3oMOHHkgZN7bHbQhd36s2vA2bZ/4vds5ytA5i7aGt5oibXsyyP3TvhaXqJ7FZxrKw
         NmT0uTDraE1494heFM1pUWIokAjBQYyusDtw08/Ad/+r9HvBSrnT03tmBv6jwIKaxqzK
         7y0o6z1pzxj5KDL8gU4TVpghwD26Vj9GIZCzYpwgTow8V+oNxiPRmOq8hs9cfnoCGgGc
         CKJgkbLM0jycTzP8wpoH8bO6CxxYMOcH8n2dTTlucxHbBVCA7SWbCq5tlaBZ/9TCiyir
         NtkegIcOemYiewxKD9Q7wbyAvexPttr8XMok7/6F+tEv3Osoy3nQ8WGDlnDiI6+sEIjQ
         mxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722577452; x=1723182252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/suS5E/THPwitL/0CNux/d6Wr8slSFy728FjLfghXwk=;
        b=fBQ6BM56+TcEz3hGeapaMciP70SuLHUKUZ5EFt1+Xq7Ws/PKNL3ohEB8uq/y5L8bYF
         LV20mNKhuY3dcaERu0R5yaQR4+Ho6gma3aLCi2bM2UpiRASi9GwchgViThwDnQKhZxdZ
         y+FRWTu4AGJXX8IT65JG+SBy8wW3FmbtZ3KCiBwad02j9Lz6USv+/KIzcz1BpgEki06u
         Il7spKnCa6OC8/3z83S+/mtLqAaAmnW6m1MkgEmnZivQoDaE4y1fOxSvoGo2g0m3TV1D
         KPZblrrNR0MRIkc+UKpzuer5x4BLtEIslgF+csNVeDFJOEtY7Q4YVmt9xDBH+jkZNuUj
         lwWQ==
X-Gm-Message-State: AOJu0YyG2JjJgHinqvMm7BuGgsmEeyXhQCoWgVwM7MTQEG43t15KcK+7
	yg/OVlIqSOV8H5Cmi05er4cO6Ahc867RI56kMTGYCYKDWCl9K/LCmhfJdhIbMRo=
X-Google-Smtp-Source: AGHT+IEbwsdCFVcpSof1lHH3nO0h4oFeOaJ4dZlzRZY2FFW9Nakdpxej2wm/Gce4TH5H4U+e9jvGag==
X-Received: by 2002:a05:600c:4f92:b0:426:6e8b:3dc5 with SMTP id 5b1f17b1804b1-428e6b92636mr15226395e9.32.1722577452042;
        Thu, 01 Aug 2024 22:44:12 -0700 (PDT)
Message-ID: <242b327a-9244-411c-8d3e-7b860464f8f6@suse.com>
Date: Fri, 2 Aug 2024 07:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen, pvh: fix unbootable VMs (PVH + KASAN)
To: Alexey Dobriyan <adobriyan@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <a9f505a6-fd31-4cfa-a193-d21638bb14f1@p183>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.08.24 21:16, Alexey Dobriyan wrote:
> Uninstrument arch/x86/platform/pvh/enlighten.c: KASAN is not setup
> _this_ early in the boot process.
> 
> Steps to reproduce:
> 
> 	make allnoconfig
> 	make sure CONFIG_AMD_MEM_ENCRYPT is disabled
> 		AMD_MEM_ENCRYPT independently uninstruments lib/string.o
> 		so PVH boot code calls into uninstrumented memset() and
> 		memcmp() which can make the bug disappear depending on
> 		the compiler.
> 	enable CONFIG_PVH
> 	enable CONFIG_KASAN
> 	enable serial console
> 		this is fun exercise if you never done it from nothing :^)
> 
> 	make
> 
> 	qemu-system-x86_64	\
> 		-enable-kvm	\
> 		-cpu host	\
> 		-smp cpus=1	\
> 		-m 4096		\
> 		-serial stdio	\
> 		-kernel vmlinux \
> 		-append 'console=ttyS0 ignore_loglevel'
> 
> Messages on serial console will easily tell OK kernel from unbootable
> kernel. In bad case qemu hangs in an infinite loop stroboscoping
> "SeaBIOS" message.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

Acked-by: Juergen Gross <jgross@suse.com>


Juergen


