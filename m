Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90836376B21
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 22:28:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124128.234279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf73b-0008A8-Rd; Fri, 07 May 2021 20:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124128.234279; Fri, 07 May 2021 20:26:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf73b-00087q-O1; Fri, 07 May 2021 20:26:43 +0000
Received: by outflank-mailman (input) for mailman id 124128;
 Fri, 07 May 2021 20:26:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V6aH=KC=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lf73Z-00087k-N2
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 20:26:41 +0000
Received: from mail-pl1-x62f.google.com (unknown [2607:f8b0:4864:20::62f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7fdc60c9-78f8-47b2-9a41-cbb64a31350f;
 Fri, 07 May 2021 20:26:40 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id b21so5897405plz.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 May 2021 13:26:40 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::1? ([2601:1c2:4f80:d230::1])
 by smtp.gmail.com with ESMTPSA id o5sm5415079pgq.58.2021.05.07.13.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 13:26:38 -0700 (PDT)
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
X-Inumbo-ID: 7fdc60c9-78f8-47b2-9a41-cbb64a31350f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t3qc2EvHl2iWZFO6wdqraQk+x5uhiKnWa7rVn4z+toU=;
        b=DT5Y/jI/dmaJ5ZCtoWGTGV6zQvTZv4sryfDVpZaXxfVO6zGwgSQMnd6f6jJ/HYepTX
         IByef+IPw7vVDsRgJt4WXY1CpGoNsDU5AtM4G8GfJEBzgf/UasOvlSo7Ct7RPt3+uq2K
         oFzXGeczBlO610OdHZmAX0dApc+lb9Al1LEtNMhbzxmyftJqZcr3gpia2uvxxuG8GUu0
         4kmCe+7YpqBIx3AdCIXR+9ke4B/yPl85OA5KAgu9JshYt2u+h16CjR+JG4CC/h1aMnNa
         bPeWo3qM4+hYuFWiX+0fiocLFqDWYKwFQ713/HKllBXT0CrcXLQ+z9Po79VIZyWePOxo
         5tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=t3qc2EvHl2iWZFO6wdqraQk+x5uhiKnWa7rVn4z+toU=;
        b=brMhHUSzL4f2KgDb8ZMaRekXpuJ/wl20W+cJUGbqQWD5eiJ1C6Z/9Chs5J2Tt+1qM4
         6RZVy4r9OWQ2zqq4rydC4HxBJc9E17cKDX9+GhozMFZWXHx++1qy58TbDY4HSKdpyCQv
         ikWplkaqAD87vv3dN2mNIbuiQiet10jVAIrqaoqqnQ8rD4DmNTk/C+7rc4IXKKMifqqx
         s+MqAwiVK2EJkP+fk4SDdzZjsmzMiKIyNKmou8i+1A1gRjU0LZ+mk4V30rJAzcAZG6OJ
         kbLT/g9Liyz6RpzzEvePC12/hS213zs4HnH0A3XN94lMrtYqukYQgplyM9rYUg09PdXU
         JF0A==
X-Gm-Message-State: AOAM532gP8GoS0RkPK4ZTSs2QyR3EweW/Pd8/I5ABOrX0zU7KoJ3vFHl
	INc1KPmia3O3fpM6yDI8Cbc2n1d5eSV+HD0V
X-Google-Smtp-Source: ABdhPJzbVW31Ad/zoYaoV5MLgGRT4Cc0nAr0mgRyM/bxkIkRjn0/w85KjIBYtvVUsThlY5b7fXncLA==
X-Received: by 2002:a17:902:b68c:b029:e6:bb9f:7577 with SMTP id c12-20020a170902b68cb02900e6bb9f7577mr11794708pls.0.1620419199049;
        Fri, 07 May 2021 13:26:39 -0700 (PDT)
Subject: Re: [PATCH v3 2/5] xen/x86: manually build xen.mb.efi binary
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel Kiper <daniel.kiper@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1611273359.git.bobbyeshleman@gmail.com>
 <28d5536a2f7691e8f79d55f1470fa89ce4fae93d.1611273359.git.bobbyeshleman@gmail.com>
 <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <74ea104d-3826-d80d-3af5-f444d065c73f@gmail.com>
Date: Fri, 7 May 2021 13:26:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <3c621726-31c4-6a79-a020-88c59644111b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Jan,

I mulled over your feedback and I think I can now see your reservations
with this series.

I'm wondering if the long-term goal of using the xen mb1/mb2 binary as the
basis for creating a EFI loadable mb1/mb2 payload is actually the wrong
approach.

After all, I do not see a feasible way to maintain the comprehensive
sectioning, the proper reloc table, the proper debug directory, etc...
that is found in the current xen.efi using the approach in this series,
which would mean maintaining a third binary forever.

What is your intuition WRT the idea that instead of trying add a PE/COFF hdr
in front of Xen's mb2 bin, we instead go the route of introducing valid mb2
entry points into xen.efi?

At the end of the day, our goal is just to have a binary that meets these
requirements:

* Is verifiable with shim (PE/COFF)
* May boot on BIOS platforms via grub2
* May boot on EFI platforms via grub2 or EFI loader

Thanks

-- 
Bobby Eshleman
SE at Vates SAS

