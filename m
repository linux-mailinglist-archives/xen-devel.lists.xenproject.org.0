Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CFA7D8F97
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:20:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624239.972628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwH8s-0003so-0r; Fri, 27 Oct 2023 07:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624239.972628; Fri, 27 Oct 2023 07:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwH8r-0003qC-Ta; Fri, 27 Oct 2023 07:20:25 +0000
Received: by outflank-mailman (input) for mailman id 624239;
 Fri, 27 Oct 2023 07:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwH8q-0003q6-4C
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:20:24 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a4bf348-7499-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 09:20:22 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32d9552d765so1279541f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 00:20:22 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-227.amazon.com. [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a5d534d000000b0032d9548240fsm1114969wrv.82.2023.10.27.00.20.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 00:20:21 -0700 (PDT)
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
X-Inumbo-ID: 4a4bf348-7499-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698391221; x=1698996021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GiaZXgzc6McjQsGUPYikXLbeJ+i8MopBoPjQmhJQfo4=;
        b=Ptr+S/V5BjHsD6ZW64k0EgHZFM5YRhbN+r+lNZWPPE5E+Fq/+nK04uf63b5c0Zkh63
         X2Pgz2ETUobqpX/TyKpyoQ8eQDVN9fpJLm2kkmIGsGfW55Hip8Pv6vqzJK696SXCV8DW
         hIU6VEa5RnMuGIoHdy+hFk099kFlrHQbuGhTeAA805/n9J0zTff5Ha5QmUbxpPJNJQg9
         du9lcuoKQxvaT+PewLQ9MJtEKheHsG6hHwbHk/+kXMfeK2yZfhj4T6xoSAsJWXGxD75f
         MAYgh7nRsVXS8AUxxjk8pYKi+VrLJIfbsSmlcTKB9GIL36dj7TYk5iYuWO/MiVOwWAuV
         PHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698391221; x=1698996021;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GiaZXgzc6McjQsGUPYikXLbeJ+i8MopBoPjQmhJQfo4=;
        b=w16zndyj/vBvqIbs3HXurgUXH/AnoMtF4fIHXUYehrzANnzEqSXCoNRZaGFM9mOEAT
         pzCQ1EyjcIEEtgZE5miHP1WXIkQ5ih7qUz60CjOyOoPWX/+EueyvWn7G5+gJ6a6tvdED
         hLT6wjKPWFJ/Ke6+inA8w374zl5Tpi7X2vkWvsotH94CklrM2IyzCwNGBT81bQtX91Oc
         QvZGNcfaGvn5ALNvt7DKw61Y+zcanrK/bGzHzPeKyYCkgfC4uYQ69nZm9Av6xo83AFuf
         UB9rTbRj89VTkWoGSv9+ESYHU5eLVaP2HBuU4aTMcjKJRHeTWtaFis1Mt7fmhVTjvFE8
         kqtg==
X-Gm-Message-State: AOJu0Yy4SoTJYx9+Tyd3/OxGVQbCQCoezcfRVB83lrTREi4tiMwNbFz0
	YrO0NAtzmDof0PqPdgcGrIU=
X-Google-Smtp-Source: AGHT+IF4ESb9Dtm5knfUhlBl2xjFSwSZ+UZKmlwz+qng/KTBk8Cd66OauspRUmQDrVkZd9/qUpk6wg==
X-Received: by 2002:a5d:4c42:0:b0:31f:a62d:264 with SMTP id n2-20020a5d4c42000000b0031fa62d0264mr1433744wrt.37.1698391221555;
        Fri, 27 Oct 2023 00:20:21 -0700 (PDT)
Message-ID: <94b54185-7ae6-48f9-976c-f4213a3643d0@gmail.com>
Date: Fri, 27 Oct 2023 08:20:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 06/28] hw/xen: take iothread mutex in
 xen_evtchn_reset_op()
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
 <20231025145042.627381-7-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-7-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The xen_evtchn_soft_reset() function requires the iothread mutex, but is
> also called for the EVTCHNOP_reset hypercall. Ensure the mutex is taken
> in that case.
> 
> Fixes: a15b10978fe6 ("hw/xen: Implement EVTCHNOP_reset")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


