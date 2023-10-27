Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166E87D931C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 11:09:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624303.972760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwIpv-0007eW-66; Fri, 27 Oct 2023 09:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624303.972760; Fri, 27 Oct 2023 09:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwIpv-0007cR-3T; Fri, 27 Oct 2023 09:08:59 +0000
Received: by outflank-mailman (input) for mailman id 624303;
 Fri, 27 Oct 2023 09:08:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwIpu-0007cL-3W
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 09:08:58 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7576c93d-74a8-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 11:08:57 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4083dbc43cfso12617645e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 02:08:57 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b004068e09a70bsm1109446wmo.31.2023.10.27.02.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 02:08:55 -0700 (PDT)
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
X-Inumbo-ID: 7576c93d-74a8-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698397736; x=1699002536; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xk4l/7iC4UJ4bxYDA1m/0zWstbr1oMvAsUPXmEV1lqw=;
        b=JKecCF3yx7XInHclFLjwUf446cp1xhBEAdjJO6SkZLYagDHBpeYYnkmkDcXthlZVnW
         ROmRTZyR6JHFnjozthQBmhQAqaWwZGqhzdvsZLcpMbhfTqT3VvhoPWiuf7bHvmtoIv7R
         uqYb9DcQaYmyysP/HHLk36d/rO3pnE5s0Fv6XPQd1dTKkq4vYFl5UmbKcVfAK+nbuOZl
         rorwL792+FsZAWC2aO+a4UfZ6Km1xaKhtMJGVshvWtMQ4aMX6u8n9T2ZJM35eYMJyktB
         Jk7ozhwqZW2ovmZirqkQJAgdS92nZucma62E90URixp3QKkRIvuRa1OJl+0evOMdYXZh
         +95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698397736; x=1699002536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xk4l/7iC4UJ4bxYDA1m/0zWstbr1oMvAsUPXmEV1lqw=;
        b=Ln68VDprmi0kYH+kZn7rEaXYKmyn8kcniQQ0MPZOQzerrt7U8z/tWjUiNUBSrxak0l
         iUf8EzmMtcSwrBvUkUM8wlcdAegggKh3XtA2kMesOJ6WJAcu5Gx4ECUQGTgKmZMkrT22
         6ueNJkbq0/1V850hi3FzlR34UwGNeRoIwKOlCjXKHhbnO9JaDhcHUZ5eJa4fMThSAgtm
         A7eOObYCy1mFpM4IhtYpbYLeUZalLUYmIgNY4uQ+krm+q8x2A+agGV8+fLj+KNpY1ZJq
         pU3s7D8959hDYbwjqflBNiarG4uGjniBUFrq8+oOkR1otOw/eflnC28cELY6jRfRr5Kl
         XpVw==
X-Gm-Message-State: AOJu0YzlwjbeRTI7JfiCTpms9mAqkSo8/vgnsIX+zoBeFoOO/ZUucjHu
	dK5lI7JA+YO5RavpdkiuxDI=
X-Google-Smtp-Source: AGHT+IHrQB1bpAc743TK730kpsbJOspNGIhwFQpbDW8MoZPSXg+FX7Yyui8H9QO36a/HiwExPsj/DA==
X-Received: by 2002:a05:600c:4514:b0:408:53d6:10b3 with SMTP id t20-20020a05600c451400b0040853d610b3mr1725341wmo.22.1698397736127;
        Fri, 27 Oct 2023 02:08:56 -0700 (PDT)
Message-ID: <053171c9-fb82-4e19-abda-d41af7b43378@gmail.com>
Date: Fri, 27 Oct 2023 10:08:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 21/28] xen-platform: unplug AHCI disks
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
 <20231025145042.627381-22-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-22-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> To support Xen guests using the Q35 chipset, the unplug protocol needs
> to also remove AHCI disks.
> 
> Make pci_xen_ide_unplug() more generic, iterating over the children
> of the PCI device and destroying the "ide-hd" devices. That works the
> same for both AHCI and IDE, as does the detection of the primary disk
> as unit 0 on the bus named "ide.0".
> 
> Then pci_xen_ide_unplug() can be used for both AHCI and IDE devices.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/xen/xen_platform.c | 68 +++++++++++++++++++++++++-------------
>   1 file changed, 45 insertions(+), 23 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


