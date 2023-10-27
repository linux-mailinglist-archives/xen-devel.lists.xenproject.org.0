Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E47D943E
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 11:52:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624328.972821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJVu-0003mB-Iw; Fri, 27 Oct 2023 09:52:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624328.972821; Fri, 27 Oct 2023 09:52:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJVu-0003iv-Fh; Fri, 27 Oct 2023 09:52:22 +0000
Received: by outflank-mailman (input) for mailman id 624328;
 Fri, 27 Oct 2023 09:52:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwJVt-0003in-5m
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 09:52:21 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 851af42d-74ae-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 11:52:20 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so15391515e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 02:52:20 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b003fee53feab5sm1212290wmb.10.2023.10.27.02.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 02:52:18 -0700 (PDT)
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
X-Inumbo-ID: 851af42d-74ae-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698400339; x=1699005139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2yiE3kmnMlzeuIC0wQ9aeOyHGBx7Hm50hNBXLvo1oLI=;
        b=E9nwJGA8XMHkocVFPjQDyUQNAb6OYL0tDHDayJ67KBUNnYe8dibPp27RMm3SkU2Mbo
         8vy/j6oVQ/v1ATfG8xgKMpQq2Fjhe2YJYwa90Rnmx+XHcVZ8Prpq/rBd5/fXBh6CQZc1
         g5cgo9w0Qw6/DIofMjHT1kNCzPOVmmVilzEiSZU1fOb70319c/xxh1vMt0i5t5E8kVN4
         tCD+70+kNtZxoauwRtAikDPTAnAPvIB4TQCD906SS+07z3wXCd9/ZYaLSP1ZIvOQ3Y6g
         DhYdXcO0T3k7a0RvJMexwWL2PWuBs169ndE4QkD81h27HFAWyvyYXRvpzZXlkzIk6U6X
         Ny5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698400339; x=1699005139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2yiE3kmnMlzeuIC0wQ9aeOyHGBx7Hm50hNBXLvo1oLI=;
        b=ZAVBIfwn4jybSwVmAfx00F1XlSJBzqbsk9gRMVWWMgbr4IH4upzl6i90lN+fLIEEhd
         Pn9aJ8pKRWBndj9NVVX8AO+jTSlSNZRf5f8vFSP+Ka/PvknOw7Qhe3gGD7UecWId0R46
         qXu+mYEAZ/jZNrhtCbuWx/8LzVpcL0avmSsr9hxDJuU0sBs1Xf4Bs6if2JnVJj+bAjx1
         ij3rfTb18UvoBSPw2nsHEFmHtfu8Zk86AITE4h7iOlViIgJaZ0oM3hCRoRjh1n8GL6x4
         f2Dgt0QM/RMEqCXE0VTQ/505xreV8Vrbl1m1lt8jfZbWf0TvSURIONqFo3h4kofFPgJP
         1kEA==
X-Gm-Message-State: AOJu0YxGbAdbrZPn2kgRULTwHcq9sv11w2irxpg3s0VGhD202aKCII6E
	cQB1JjBeNTdCfp3BnmVKbww=
X-Google-Smtp-Source: AGHT+IEuLWOC6r1FV8oQb3wkYtxJ/Wfx1Om4s2yzSuMliOYSNXtiWemTUbczcZfVgloepcRrPb3iTw==
X-Received: by 2002:a05:600c:4ecd:b0:403:31a:77b9 with SMTP id g13-20020a05600c4ecd00b00403031a77b9mr1829515wmq.37.1698400339330;
        Fri, 27 Oct 2023 02:52:19 -0700 (PDT)
Message-ID: <88aad170-24f2-4ec6-b43c-ac87dde81255@gmail.com>
Date: Fri, 27 Oct 2023 10:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 27/28] hw/xen: use qemu_create_nic_bus_devices() to
 instantiate Xen NICs
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Bernhard Beschow <shentey@gmail.com>, Joel Upham <jupham125@gmail.com>
References: <20231025145042.627381-1-dwmw2@infradead.org>
 <20231025145042.627381-28-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-28-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When instantiating XenBus itself, for each NIC which is configured with
> either the model unspecified, or set to to "xen" or "xen-net-device",
> create a corresponding xen-net-device for it.
> 
> Now we can launch emulated Xen guests with '-nic user', and this fixes
> the setup for Xen PV guests, which was previously broken in various
> ways and never actually managed to peer with the netdev.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-bus.c                    |  4 ++++
>   hw/xen/xen_devconfig.c              | 25 -------------------------
>   hw/xenpv/xen_machine_pv.c           |  9 ---------
>   include/hw/xen/xen-legacy-backend.h |  1 -
>   4 files changed, 4 insertions(+), 35 deletions(-)
> 

Yay! I've been wanting this for years but ETIME.

Reviewed-by: Paul Durrant <paul@xen.org>



