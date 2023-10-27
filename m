Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC0A7D9406
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 11:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624315.972791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJMP-0008Dm-4V; Fri, 27 Oct 2023 09:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624315.972791; Fri, 27 Oct 2023 09:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwJMP-0008Bc-1m; Fri, 27 Oct 2023 09:42:33 +0000
Received: by outflank-mailman (input) for mailman id 624315;
 Fri, 27 Oct 2023 09:42:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwJMN-0008BU-Hg
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 09:42:31 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 25afef24-74ad-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 11:42:30 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507cee17b00so2711823e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 02:42:30 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 du15-20020a05600c634f00b003fc16ee2864sm1170909wmb.48.2023.10.27.02.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 02:42:29 -0700 (PDT)
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
X-Inumbo-ID: 25afef24-74ad-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698399750; x=1699004550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kiz2KMdg7YL05gR8LgSt7smgQdVxoWMShyrXxPJfs9s=;
        b=jJ2MbQJjd3S+H0ebH64QsgxyBHnI/5mdZYjwuE8BGk43CsH+tx97dNmJ4tRmfYYQfg
         +GUXtKZ1Lr+SBXte3fv5tmZv32+ZBmmTW9Qccp418l1TGwfbieulgCT6bddkccFyozgP
         bFwrnSieG/SIIRQ0J1eImHvGrdHL+nz8P5+z8V2w7w0b+RYzlXoMUvlpcQ+zFhhXmEwW
         BTGonpwWO7UKHqI8nvEwg9zlXvTYBGfqmYKWhJuzvFtXvaOefi6fmAh6urnTcRPcXLwT
         VTfCmLimBPmhHIDbLJD/Gih21kX8V0WdLF3i5RhUbiqjMlPZO5Fnf7j8HHGO9gMvUbiZ
         9CmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698399750; x=1699004550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kiz2KMdg7YL05gR8LgSt7smgQdVxoWMShyrXxPJfs9s=;
        b=qhpTUCl6xBNE4U/38+OocdDc0WrZpjPSiMpfyEM2aWGbDa7eKb3FfOTKanEDj5eKU6
         Hj9lGBUJ2tnndyESvQaZcAkSwnYCvrw240S5Rh4GYgYOoNPA36bK2F5ZerrGl6WJznt9
         NN+um4KLBvdue6vlRh84H74vFtfkKhtwSpixhkporWBYzflc8vy4E84u1mAED50rUG3M
         I6AenBpCrQaUnclViVBO3JoXewSCCIeQVWKtUghuYSNGX7kJfUe87+J8V8zRv1aWoHah
         jm7pWsUclCnkjs0M+RZpZwtaVDfZb9PXimaqTZHRey6GxZDgeGk4wfCu9BHQGeD8LlNf
         rH+w==
X-Gm-Message-State: AOJu0YxL3FBq3fVL+GN1rgfyHR7mw3uP+QeUpJBKcVYrbEcxSJU5ypDF
	qxwEpGzZ2G69VYkbnl/6GLc=
X-Google-Smtp-Source: AGHT+IGhjfQTzfpSI0jSZ3Vaoz7HQMUUZYv6yz0Ojq0M+dEBGy0psEQV6EoLJB1bLce08/1kjOIo9w==
X-Received: by 2002:a05:6512:406:b0:508:1eb0:3d4a with SMTP id u6-20020a056512040600b005081eb03d4amr1422321lfk.22.1698399749812;
        Fri, 27 Oct 2023 02:42:29 -0700 (PDT)
Message-ID: <1ac8c57c-d154-4176-802c-505e4d785a5e@gmail.com>
Date: Fri, 27 Oct 2023 10:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 24/28] net: add qemu_create_nic_bus_devices()
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
 <20231025145042.627381-25-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-25-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> This will instantiate any NICs which live on a given bus type. Each bus
> is allowed *one* substitution (for PCI it's virtio → virtio-net-pci, for
> Xen it's xen → xen-net-device; no point in overengineering it unless we
> actually want more).
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   include/net/net.h |  3 +++
>   net/net.c         | 53 +++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 56 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


