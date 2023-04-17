Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2698B6E47D8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 14:34:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522076.811242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO3v-0007Rl-30; Mon, 17 Apr 2023 12:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522076.811242; Mon, 17 Apr 2023 12:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poO3u-0007PC-WE; Mon, 17 Apr 2023 12:34:27 +0000
Received: by outflank-mailman (input) for mailman id 522076;
 Mon, 17 Apr 2023 12:34:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=be8F=AI=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1poO3t-0007Hc-Kg
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 12:34:25 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fd6e9e1-dd1c-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 14:34:25 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f176a16c03so1493005e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 05:34:25 -0700 (PDT)
Received: from [192.168.0.165] (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id
 h12-20020adffa8c000000b002d322b9a7f5sm10452463wrr.88.2023.04.17.05.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Apr 2023 05:34:24 -0700 (PDT)
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
X-Inumbo-ID: 2fd6e9e1-dd1c-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681734864; x=1684326864;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jQnz3n1AuRPtCJ1RDVocHpGppB0g/9zbL7gA6j6iNsk=;
        b=jWNACl3Mv8T6RnJ2Tyq1dQTW62FBIGpJNCFkGblaSI2JAcJIVilFP/umFBmbz1w/HH
         r3Nmyfh9lWQRsSoP+uPNvKi9OFgAt4pviDH/9aYuInFEjFUDPs4xscK54uNmOE9AXi5w
         9u/hB0RyE74A/MZBcWu4fP9d8+DYXZHoV8NTHsmSKOVl7QDmMl7s4wrHFkPrl98mUJlB
         IESEaRiefya3Gtgm95mePAcnbg+X88s8w4Dui87ZvlYm4+Mdh314bGeVGm8OhRs0Gp0b
         wlgDQP/Kj08xv57wSi2pHaqfOjNq8JH8BZk2hKcMdmJIcH1FfwHAd14uFUdUethfcmRY
         miyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681734864; x=1684326864;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQnz3n1AuRPtCJ1RDVocHpGppB0g/9zbL7gA6j6iNsk=;
        b=De1VrwAe88AFNkXVZTMr4jn894Ig4Esms2k1BII2b7YuhLc7IyyYgQ8/Hl2lgOTApR
         cU6oIBzRdxfdOpIP06fgaN1L/c8RocAPFdIJKyO7fPQgeHea+HutZPXgFROW2CFksaXJ
         C4UBZM1u0p/Y5ouY31TXOpNd+0PiwkjhkfJ8GQLtPuf9HRVh97pBqYbytTseJ6Gh1+Fz
         dBifV0n5WadL+TjRp4ayXTPHadMdUK6nGpiWmm69I+j33kMyQs/Y3L3rqAkQki1cjUqW
         a6yfw1RzWTLWqLN/9ck0pnifZmefsX/EeLp4LSgzeJ2dX2EQfG9tQjmPy3ekjj3b6CKE
         os3A==
X-Gm-Message-State: AAQBX9fgfZAi5GPFtZvLSHVmjPCE5zXxOVIAAm0de/1mHFsiBha6xnYQ
	DFstHy0A9yQ9h/YzoT5EDvk=
X-Google-Smtp-Source: AKy350ZMoM7ssfA8tZqdPzobXT3XgXokj5MKZKhf3HYCvcgZjxuGt3q+5Ae24ff7S2+r47tuGPVhlg==
X-Received: by 2002:a5d:5409:0:b0:2f8:5d73:dbf0 with SMTP id g9-20020a5d5409000000b002f85d73dbf0mr5397935wrv.27.1681734864568;
        Mon, 17 Apr 2023 05:34:24 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <eea29aa3-b3e7-6579-aef4-74f496e99c66@xen.org>
Date: Mon, 17 Apr 2023 13:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: paul@xen.org
Subject: Re: [PATCH 5/5] hw/xen: Fix broken check for invalid state in
 xs_be_open()
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, xen-devel@lists.xenproject.org
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-6-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230412185102.441523-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/04/2023 19:51, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Coverity points out that if (!s && !s->impl) isn't really what we intended
> to do here. CID 1508131.
> 
> Fixes: 032475127225 ("hw/xen: Add emulated implementation of XenStore operations")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


