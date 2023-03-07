Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CBC6AE558
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 16:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507545.781182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZaB-0002W8-NM; Tue, 07 Mar 2023 15:50:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507545.781182; Tue, 07 Mar 2023 15:50:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZZaB-0002UB-Jb; Tue, 07 Mar 2023 15:50:31 +0000
Received: by outflank-mailman (input) for mailman id 507545;
 Tue, 07 Mar 2023 15:50:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZZaA-0002U3-3f
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 15:50:30 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8501fd4-bcff-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 16:50:28 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id v16so12659655wrn.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 07:50:28 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a5d591c000000b002c6e8af1037sm12843317wrd.104.2023.03.07.07.50.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 07:50:27 -0800 (PST)
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
X-Inumbo-ID: c8501fd4-bcff-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678204228;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MWSYRcvhv18kO9UycBowWGj3UGWJGjeRF8hkDLddAnw=;
        b=icBuxwslhLrOMTy5I7vm2T2mpZoTCu95iqLT16VD7FbsgbLnAU7F81ux9RFOlYvk/I
         Bgl/zLKiJLUiA1UtahdZEdvyuie9O2N5icBrwjxpVZM7FC1+VTPEk/I2eafVaplatdXy
         U1yDk6zhh8IPl52f9S1Qe9lrdGH0i8PBfzLhXkWmp13hB57juTr1Pc/HFpysX7Sl/Tjj
         iNRsTj02ZQPbENBh6MjMhXU9p2716zhSY6KAj4CeuyAXCSmprnC+yMKZfxIa4uND1IVn
         DB3F81sgje7wl/uA23wo6wMo8wpDAi0kSlXaCB+/qUH1g7RJoEC+DOsS6aEuwGjSeTFC
         thfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678204228;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWSYRcvhv18kO9UycBowWGj3UGWJGjeRF8hkDLddAnw=;
        b=1sS6/xOlwCrQosZjU3lwDdBQRdVLEzpHSq4jHmAignlcoGEYbTyjeRWb+HWvZbzu5Q
         K5VUFl+zhgzvQxGmLMMsoUjYDy+EahoD/6lv8D2PtyU7w7Jf3SmuWQgSsF1qzF7t3cm7
         gfbc9wsvKCXfALlBpWFu6AvWwCIiIG4y8twChGJTeIQ5DUJ2ZjLLDtWmC15hLFzYoIm2
         g5YoPeN/YDlJGUL84ea4XSho4mfqfB655EPu2wEj4hbiErqeI4N9fpSbbVhqdUKLVuil
         6+gXXJvi6SbSPgQWWOctRkQYgknVFVrOCFjrE4YW772KW9XtM+RNzW8n9p0TxIQmboZr
         gNuQ==
X-Gm-Message-State: AO0yUKWbaC2/W0m+qPLLlQxdEMrfDAhRgSk3+GoKENc6/0INZ4WyGlad
	DZKlXBhWmgSj53DWSg7qaA8=
X-Google-Smtp-Source: AK7set+zBrHtpSx4jAXOTaZMvS0yDMKGWu3x+UAp57CUGBYi9lpfuVY0omqDkZ9fEUGBvzuLj5HpjA==
X-Received: by 2002:adf:dd89:0:b0:2ca:b27:e570 with SMTP id x9-20020adfdd89000000b002ca0b27e570mr9804043wrl.15.1678204227863;
        Tue, 07 Mar 2023 07:50:27 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <fcc36485-5a45-7fbd-e0fc-3904865928b2@xen.org>
Date: Tue, 7 Mar 2023 15:50:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 20/25] hw/xen: Hook up emulated implementation for
 event channel operations
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-21-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-21-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> We provided the backend-facing evtchn functions very early on as part of
> the core Xen platform support, since things like timers and xenstore need
> to use them.
> 
> By what may or may not be an astonishing coincidence, those functions
> just *happen* all to have exactly the right function prototypes to slot
> into the evtchn_backend_ops table and be called by the PV backends.

It is indeed an amazing coincidence :-)

> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/i386/kvm/xen_evtchn.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

Reviewed-by: Paul Durrant <paul@xen.org>

