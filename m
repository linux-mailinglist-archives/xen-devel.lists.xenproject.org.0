Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC92A7D5153
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 15:20:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621948.968921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHK4-0007Dg-Qe; Tue, 24 Oct 2023 13:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621948.968921; Tue, 24 Oct 2023 13:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvHK4-0007BI-N4; Tue, 24 Oct 2023 13:19:52 +0000
Received: by outflank-mailman (input) for mailman id 621948;
 Tue, 24 Oct 2023 13:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+b+W=GG=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qvHK3-0007BC-02
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 13:19:51 +0000
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [2607:f8b0:4864:20::936])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0177b078-7270-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 15:19:48 +0200 (CEST)
Received: by mail-ua1-x936.google.com with SMTP id
 a1e0cc1a2514c-7b67fef3fd4so1204461241.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Oct 2023 06:19:48 -0700 (PDT)
Received: from [192.168.6.66] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 f7-20020ac5c9a7000000b0049d6e5e8610sm1109415vkm.19.2023.10.24.06.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Oct 2023 06:19:45 -0700 (PDT)
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
X-Inumbo-ID: 0177b078-7270-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698153587; x=1698758387; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8uz4/aKpiq6hPOqfpQF/xQFDhJm3XWJwzBC0Qx2lRx0=;
        b=RTL8gF18vWVfZ/p8NmDDGBt8J8DBrPxgbSAV3C6Kq5Mpe14+M0w88df3hQqDxdKyb5
         lmGWXpFBjy0sx4iAKVRoFheEUpBR1wiy2HArcS4fLPFYQ+TEflmipz3adgNDd0QiS6fA
         /bk6QlaOTDnOVHRu24XPo03ndeIAITcFl52/JMMtPaxA6kPCzqULSSm7J5ubOOF0rSMQ
         gcx3DpqRjBJkDxhUIgCZKRrhUmrZjvU86gxOz1S8VBaCBqIAWfyazJeLo8F7QWTFz1V3
         7UFumcYLD7RaOU5tHVpSRNW0QN4x/UESU0aM/pAot1FA4HnYNN/Mp4GfwIoYnaQCEfgF
         3N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698153587; x=1698758387;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uz4/aKpiq6hPOqfpQF/xQFDhJm3XWJwzBC0Qx2lRx0=;
        b=DsZyE/syLShkMasdA727w2567ur0BSQuWrm8yVeIxcmX4MRLF8HNXKrkScNxWqGkZ2
         p7Py7oOmNKhwVDCMKfPMMhSLmJUqQctAOVGECWBDlCTT7z/PtTtihxy883WiFYOR/Sw9
         MXENGOOwy7irhZUR5UOmmTuusqICDURv5HYJ9bY5BZxmPihf5u7uCJYxpNPmQwMKDM0K
         xZJqWm7o2X0H+n3XtHMDnmb5JWasvKVYw4wtj3Eh6bk5TEox7I+TLkQgZF2x/L3mQ1Lv
         KWDm5STYcTf7bs8saUj/VZi1z1z303nXDLvAi9WfXhBpP8+w7vBhdGBRUj+i10tLLulP
         VVZQ==
X-Gm-Message-State: AOJu0YxOZFnKfL6YBIoTHdFtZmpld4P+9e4f2lzpyt79EQpFpeTrN8gg
	ubhuhQHyz0SksoGKnD5gq58=
X-Google-Smtp-Source: AGHT+IGnWoo4jNnLB6831fFx3CoKgHFT0A9Kla2MaDjWE9V1b5hkBs1aVIykQqV5tvtiP+hHD7VG/Q==
X-Received: by 2002:a05:6122:243:b0:4a0:8a35:6686 with SMTP id t3-20020a056122024300b004a08a356686mr7068725vko.11.1698153586115;
        Tue, 24 Oct 2023 06:19:46 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8f51963a-1875-4f11-939e-e7b6c7429da5@xen.org>
Date: Tue, 24 Oct 2023 14:19:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 08/12] hw/xen: do not repeatedly try to create a failing
 backend device
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-block@nongnu.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20231016151909.22133-1-dwmw2@infradead.org>
 <20231016151909.22133-9-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20231016151909.22133-9-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/2023 16:19, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> If xen_backend_device_create() fails to instantiate a device, the XenBus
> code will just keep trying over and over again each time the bus is
> re-enumerated, as long as the backend appears online and in
> XenbusStateInitialising.
> 
> The only thing which prevents the XenBus code from recreating duplicates
> of devices which already exist, is the fact that xen_device_realize()
> sets the backend state to XenbusStateInitWait. If the attempt to create
> the device doesn't get *that* far, that's when it will keep getting
> retried.
> 
> My first thought was to handle errors by setting the backend state to
> XenbusStateClosed, but that doesn't work for XenConsole which wants to
> *ignore* any device of type != "ioemu" completely.
> 
> So, make xen_backend_device_create() *keep* the XenBackendInstance for a
> failed device, and provide a new xen_backend_exists() function to allow
> xen_bus_type_enumerate() to check whether one already exists before
> creating a new one.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/xen/xen-backend.c         | 27 +++++++++++++++++++++------
>   hw/xen/xen-bus.c             |  3 ++-
>   include/hw/xen/xen-backend.h |  1 +
>   3 files changed, 24 insertions(+), 7 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


