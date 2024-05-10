Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B098C227E
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 12:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719780.1122669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Nrr-000463-HV; Fri, 10 May 2024 10:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719780.1122669; Fri, 10 May 2024 10:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5Nrr-00044D-Ee; Fri, 10 May 2024 10:52:47 +0000
Received: by outflank-mailman (input) for mailman id 719780;
 Fri, 10 May 2024 10:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Xy6=MN=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s5Nrq-000442-2j
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 10:52:46 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ef39b32-0ebb-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 12:52:45 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f5so13128435e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2024 03:52:45 -0700 (PDT)
Received: from [192.168.69.100] (sev93-h02-176-184-17-152.dsl.sta.abo.bbox.fr.
 [176.184.17.152]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41f87d200c6sm93588085e9.23.2024.05.10.03.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 03:52:44 -0700 (PDT)
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
X-Inumbo-ID: 6ef39b32-0ebb-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715338365; x=1715943165; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f7sIFTUuD+KOnWU1gakeh0NFMU6Pja/uxomvMgU9Skw=;
        b=X9TJJv7tV4BtLmuH4ldVqzUyE6DGrh3VTu25Fqm8M410QPXs3orVZBF7IMkAlA8fj1
         m6s5GXIn1e6vrQ9k05S1PQCTETQfj2Q9bnLYKmNNi/o4ArbeGOL95A23o62RFYURBhm9
         yVzyD/z9sWiNPN577W5lnjfw9D2vdGcin/nafzJXuCjog3EM3+VUmOKfhT5v0kJCAfLI
         ju1AkygOrt/oMOI8eLgddMGFabFZXjCPRQnfSUoErJv0rJ5f++NlLYl4/kAGCsDqwZHF
         jmnDtvxYNQNG4PmYjoKaCje+M3SLH+9Q8r4X4971VKUFhXO8Q4DRj0DbXMi8MN6sV2wE
         e5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715338365; x=1715943165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f7sIFTUuD+KOnWU1gakeh0NFMU6Pja/uxomvMgU9Skw=;
        b=rPvI0SwXiwjrC/PTYkdWZBQ1UQ1So/3+SoRDXtNJXbt/66dtcDaLvXbm/GBoS30I+9
         kUtksBE6Y9PcJCIY/PffyjbYtQSlZBm0VAScLt+fs2iLSKm+1AGRKOpm9NsHoEVpfE6F
         5qzXLOmxZLH16+xwz8h6sWSu67pqZyD8w05Va0koSTPd1DjRHOUevCeSWOLWBy81b2AG
         QZRqqA8W7rS1OMA0ZRI/PS/mLEgXokMFpj4VfOH+FGhsWeZ1L0rMg/crKdUrFxAana7z
         QxJOyXg3sNjdCx/p4TOo4bkUaNVoBfalnoj/nu/jggHc0mVhE+I6qOAl03QvQEDYRAjS
         8sRw==
X-Forwarded-Encrypted: i=1; AJvYcCUKbDHF/stjaQ/BL798tndfq3nj0ByaP/5O89Thyo58BmjnD3Bw38/8+qgRy0tQQigPT9x+8SLOfwuWiO7p7ptm+F2RkhsU5tb/Fyzp8GA=
X-Gm-Message-State: AOJu0Yxpp3cTke7Trgu2DuX4LFRVpXIERLojZUdk3FEeaZHvGYlVgOvR
	ftaGL0HM2IofOOeyscPj6ZRmZJq2g6IVybjawr/VS8sX12JWerOH7GmxrJxFswA=
X-Google-Smtp-Source: AGHT+IHuuJHQzBXjTwqPYG6Xft9Ercp9HGQcE/jtvUNQuTmVyJXtzh7vd29oX2VK0Fk1fhEyp1ZyvQ==
X-Received: by 2002:a05:600c:1e13:b0:41b:3e4e:bd99 with SMTP id 5b1f17b1804b1-41feaa390c4mr19037495e9.12.1715338365250;
        Fri, 10 May 2024 03:52:45 -0700 (PDT)
Message-ID: <84c89274-f8a9-4f86-84e9-40a962dc4f77@linaro.org>
Date: Fri, 10 May 2024 12:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] hw/xen: register legacy backends via
 xen_backend_init
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
 <20240510104908.76908-7-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240510104908.76908-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/5/24 12:49, Philippe Mathieu-Daudé wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> It is okay to register legacy backends in the middle of xen_bus_init().
> All that the registration does is record the existence of the backend
> in xenstore.
> 
> This makes it possible to remove them from the build without introducing
> undefined symbols in xen_be_init().  It also removes the need for the
> backend_register callback, whose only purpose is to avoid registering
> nonfunctional backends.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-ID: <20240509170044.190795-8-pbonzini@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/xen/xen-legacy-backend.h | 11 ++---------
>   include/hw/xen/xen_pvdev.h          |  1 -
>   hw/9pfs/xen-9p-backend.c            |  8 +++++++-
>   hw/display/xenfb.c                  |  8 +++++++-
>   hw/usb/xen-usb.c                    | 14 ++++----------
>   hw/xen/xen-legacy-backend.c         | 16 ----------------
>   6 files changed, 20 insertions(+), 38 deletions(-)



