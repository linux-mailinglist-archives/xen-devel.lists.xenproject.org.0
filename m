Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 703F17D8F75
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 09:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624235.972618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwH4R-0002Rn-G9; Fri, 27 Oct 2023 07:15:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624235.972618; Fri, 27 Oct 2023 07:15:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwH4R-0002Oa-DH; Fri, 27 Oct 2023 07:15:51 +0000
Received: by outflank-mailman (input) for mailman id 624235;
 Fri, 27 Oct 2023 07:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEfT=GJ=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1qwH4Q-0002OU-2a
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 07:15:50 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6e211bf-7498-11ee-9b0e-b553b5be7939;
 Fri, 27 Oct 2023 09:15:48 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-407da05f05aso12945165e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Oct 2023 00:15:48 -0700 (PDT)
Received: from [192.168.10.177] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a0560001a5400b0032ddc3b88e9sm1145980wry.0.2023.10.27.00.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Oct 2023 00:15:46 -0700 (PDT)
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
X-Inumbo-ID: a6e211bf-7498-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698390947; x=1698995747; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r+vdINcmFGGjA6+x+iJDg46Mk3yJWEt8/WHgQwybeJI=;
        b=jgxB9DFixxTyEHhJTMvV6PYnZK9irWb/dKfGwZWPuS1WUQjqN365PIp2tR+rKHh1s8
         S8xXWsbG1bo97wfKUHyo0WDLxVhbZOSBh6MieLqhTs2O+cJK0Xaqfr3Go8cudkQRkCWL
         Ehjvxz/T6yBM9rDC94gtTJnz+00Wh7HOIZctFrs7hA9wYAFNsbef5MazKtkIxM1bzPw5
         VNejiICCwjED5bLsM9xhg1bSJVLT0X+4sDjVZnb//RKISz+EM/Dv2ReFn2NArR6t94V2
         sG74Q1V/Ko3iKdrBrep4avI2hU7mYCSfC0FoWuG/aftwMVnJVtA3CgQ2CivRGEasdky+
         d5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698390947; x=1698995747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+vdINcmFGGjA6+x+iJDg46Mk3yJWEt8/WHgQwybeJI=;
        b=xUZdJ1t7uktk6S+CyuvBFa9CSQE5bT2VeFBQSpt9liJvNU7VpumS3mWAdRf+VxHMPO
         4aVdis/epR4me12hFbwwPSzTV/TfernTwFl799Wk21u/4zBTs2Q+XM5O4p+c/8EGq4hQ
         s5h+dy/BRAnTAnyICO/cl1QuFkOop1cqmWksmERIhEUrxUkTajJ5FPu5COYewDARJ0/R
         K8pdRYJKPLTpiVaROpxJU2GA2XQR58YaYoZW4DGhZyp1wGeT7r6/fPPNnHyHgyFVrUii
         NnGJFgCkided2iGLYkqPZUqnmhW91yfnzQhDBo7HlnnjCfEQ1GF8edCfJoe2j/sMa9fx
         jEdg==
X-Gm-Message-State: AOJu0YwWMAv51ysBf47ekweX/YwYlw2aDjmrt1SBpJOhXRgeYXEysgiI
	0cIahYiHHiCk2uKYNU4wKhM=
X-Google-Smtp-Source: AGHT+IFLvBaX+jKKJG5b7EuYxKD1+NY+YQPBw4JtamDZDEEoV5ML8tHynkORTdYmyuxI7EF3GYGUzw==
X-Received: by 2002:adf:efc4:0:b0:32d:a310:cc2e with SMTP id i4-20020adfefc4000000b0032da310cc2emr1551939wrp.34.1698390947261;
        Fri, 27 Oct 2023 00:15:47 -0700 (PDT)
Message-ID: <abb048fe-5c73-4d09-8998-e4e54afe47a3@gmail.com>
Date: Fri, 27 Oct 2023 08:15:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v3 05/28] hw/xen: fix XenStore watch delivery to guest
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
 <20231025145042.627381-6-dwmw2@infradead.org>
From: "Durrant, Paul" <xadimgnik@gmail.com>
In-Reply-To: <20231025145042.627381-6-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/10/2023 15:50, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> When fire_watch_cb() found the response buffer empty, it would call
> deliver_watch() to generate the XS_WATCH_EVENT message in the response
> buffer and send an event channel notification to the guest… without
> actually *copying* the response buffer into the ring. So there was
> nothing for the guest to see. The pending response didn't actually get
> processed into the ring until the guest next triggered some activity
> from its side.
> 
> Add the missing call to put_rsp().
> 
> It might have been slightly nicer to call xen_xenstore_event() here,
> which would *almost* have worked. Except for the fact that it calls
> xen_be_evtchn_pending() to check that it really does have an event
> pending (and clear the eventfd for next time). And under Xen it's
> defined that setting that fd to O_NONBLOCK isn't guaranteed to work,
> so the emu implementation follows suit.
> 
> This fixes Xen device hot-unplug.
> 
> Fixes: 0254c4d19df ("hw/xen: Add xenstore wire implementation and implementation stubs")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_xenstore.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


