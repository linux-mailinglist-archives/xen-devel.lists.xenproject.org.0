Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A53C8D5DBD
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 11:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733484.1139752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyFx-0004H3-J4; Fri, 31 May 2024 09:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733484.1139752; Fri, 31 May 2024 09:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCyFx-0004Eh-GB; Fri, 31 May 2024 09:09:01 +0000
Received: by outflank-mailman (input) for mailman id 733484;
 Fri, 31 May 2024 09:09:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Umgu=NC=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1sCyFw-0004Eb-D0
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 09:09:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a8dcdfe-1f2d-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 11:08:59 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-420180b5922so23362575e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 May 2024 02:08:59 -0700 (PDT)
Received: from [192.168.3.251] (54-240-197-236.amazon.com. [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b85c628sm18926505e9.25.2024.05.31.02.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 02:08:58 -0700 (PDT)
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
X-Inumbo-ID: 6a8dcdfe-1f2d-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717146539; x=1717751339; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X7W3xI7fAUh+NEJTD6wipxw0E8s8MOWy9REBP0vU0L0=;
        b=OJERIiF7+Z/CCnyFtoAuXgDF8DUrpd1QHwsvwSfewNSO37PPDxWvul7Jt/r2zXkSvj
         tImuDTTEXAFlBTlvdoEg5tubnP2ilKbUq1yvya4yagg8cL4389BtQVKI3Bq4N5awT0qi
         D+Tu2pUNmk68sYabwAMd8Da3bzImJ7Ru2Gm3HY+Z/Y5n7NaeYA2Rb75fK7mzD4XCni/v
         aCMKQ+rmLv+AhGBBdVDV+gnMEgjgt98N6CbJBhB3ImkS3WQIzrkSCynVTkqfPQvLqnnQ
         J8BdZMTKUibQP/mzDkByaD4w/rSHZhp5yHy0t/EaXZ44CCB2z4Ufd6mH42fg6fMGaNkU
         ejog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717146539; x=1717751339;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7W3xI7fAUh+NEJTD6wipxw0E8s8MOWy9REBP0vU0L0=;
        b=eeJjnrr3uPwlkL8TUsV9/uxcHQ+bayr57Mo3Mhq0x25zA0HVnFbNfXDetjoLy2uYIS
         NkXDm2oIGCP38FhpUe+cxqQNe5Xw0hNFDDN+r4cjp5Z6YRYu0VXGrPFHQQxCpwX5Pmpx
         ISYmumy4eHENxSaJmAr9M9bQncLSuZlwdfp861zkB6dc9aXBO0Q9JauYI3s81EZPVBmm
         s6WvQtQBAvQZbmMi4KWH5ck5y7f97nUqbbqiglwkuO97ZGPJj38ngkr4CubZZJYljgdR
         33gSBP233sIYYiT1GGNj4iizGynKjULdKtE2sGGMNbZFg37G//tOn3INaOo4vn8qX3Di
         pGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5O4u8UdFOG7N7iyphjEYO8p7UehwqWmeq4KhxCj4ySlvpnEPTXjUWzwzSfmhOt9yCkqu6dMLPJ8o+FV6OopBFYbpzjG2YqCWJQiPCFCs=
X-Gm-Message-State: AOJu0YxAEYZ0uwc8lBFfI6zhgg7q+bqeW5EfA/Sq4hdOOJd9c2YOFoHu
	nRjonG8ahbWxMNYn602k7GwsRMEjgIS40aFZjWop3/NIhciBCib3
X-Google-Smtp-Source: AGHT+IHbCCui6ZKB/GXsi4frRAPCbIqN2s04w/9+nqMtxHLIvrzvqQlWWxzQN+FYwKi/P3fUX1a+oQ==
X-Received: by 2002:a05:600c:3106:b0:420:28c7:7260 with SMTP id 5b1f17b1804b1-4212e075761mr12383245e9.21.1717146538559;
        Fri, 31 May 2024 02:08:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <fb3dca59-bacf-4457-b1cc-d751750de161@xen.org>
Date: Fri, 31 May 2024 10:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 1/7] hw/xen: Remove declarations left over in
 'xen-legacy-backend.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
 <20240510104908.76908-2-philmd@linaro.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20240510104908.76908-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/05/2024 11:49, Philippe Mathieu-Daudé wrote:
> 'xen_blkdev_ops' was removed in commit 19f87870ba ("xen: remove
> the legacy 'xen_disk' backend"), 'xen_netdev_ops' in commit
> 25967ff69f ("hw/xen: update Xen PV NIC to XenDevice model") and
> 'xen_console_ops' in commit 9b77374690 ("hw/xen: update Xen
> console to XenDevice model"). Remove them.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/xen/xen-legacy-backend.h | 3 ---
>   1 file changed, 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


