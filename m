Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCA16E8BDE
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 09:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523914.814328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppP7Y-0005eS-F0; Thu, 20 Apr 2023 07:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523914.814328; Thu, 20 Apr 2023 07:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppP7Y-0005cH-BZ; Thu, 20 Apr 2023 07:54:24 +0000
Received: by outflank-mailman (input) for mailman id 523914;
 Thu, 20 Apr 2023 07:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AMeW=AL=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1ppP7W-0005c9-Hr
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 07:54:22 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dfe138a-df50-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 09:54:19 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f17fdb520dso4547835e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Apr 2023 00:54:19 -0700 (PDT)
Received: from [192.168.6.46] (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a056000008200b002f53fa16239sm1196264wrx.103.2023.04.20.00.54.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 00:54:18 -0700 (PDT)
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
X-Inumbo-ID: 8dfe138a-df50-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681977259; x=1684569259;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlMZGzABfYVwgRPwdO0lLnSJgoIp6XmXJrdTz3/kXaA=;
        b=ECc9asmq2Lz+YurUvhjRkiSwU5CCV5r6VG4FSRg7bkfEYkNji8piCScs8/i3C1Z5Ug
         Eu7Sut11pXOaas2NyhGS+3Xpd1keubuzuajHS3qEwv5k4Ddaz0PqQONRZgK5CodzBu1+
         dzlZQcAx1ldrB9dNXBdBk1//D9hkIIuOvVNOI6I4njYdS9gYrXWUmwMecbCa7z4LOhHe
         TtMRy4PdPFI968J2aEavPPsCIJCLZnGL6KzSyG7RqaVkv0VNMj1xT3xpoYnJBovrmSer
         kE10BeCndvKj5q3/T4ylpDchCZAw41ICzhEguxZy4jbdqDPU3exJNIIZ84DEHlFvT7sY
         RWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681977259; x=1684569259;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlMZGzABfYVwgRPwdO0lLnSJgoIp6XmXJrdTz3/kXaA=;
        b=fcVG9wi4+wJosa2WbN66fL25D7B0ZTZJlJC9xtWWLdQ4o3tAPlqqpMccegsyz6JcMU
         BoEB9KU3ymYHFefI3oZdPmIth8LJlQIW0TU1Q7RD/MnKCe2b08T/7Og9jTfJnGV8meCP
         dwk35l2g6Pw9EytGmMQ/TN5oS2vZnY5pb3D3lok44xlVbN550Ldrm1DKQ/CifRp14CyI
         9/CMfy1nqMgwAXdTDGrSvAMubC8EktqmjgP2kfmka+qDDSAaVyPiqrehQ+M6FdZOIPrR
         AR4BZRKziq2ZQV/wHHS2M6DvTk2Ubp8zK+Du3y3M/k1qXyFnF1VNBr4BJQ0+SNjco8mH
         5NvA==
X-Gm-Message-State: AAQBX9eU4/rC+kfi2fp3YrHF6PP4wz77k//dPpLmRqh/XNCUOKtHs0k8
	l1rutdD96YRTHMjAHXc2okM=
X-Google-Smtp-Source: AKy350YwSxaMZK3BIhAnKSE4ARMe4QpMbE9h4JdhWydGxfvL57OHI8B911smipOAj0mZNoxRya3sKg==
X-Received: by 2002:adf:e886:0:b0:2f9:94ae:99f8 with SMTP id d6-20020adfe886000000b002f994ae99f8mr617299wrm.14.1681977258895;
        Thu, 20 Apr 2023 00:54:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2e7ce635-a3f6-ebf4-6866-51b78c736265@xen.org>
Date: Thu, 20 Apr 2023 08:54:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 08/16] hw/xen: do not use
 aio_set_fd_handler(is_external=true) in xen_xenstore
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Fam Zheng <fam@euphon.net>,
 Julia Suvorova <jusual@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, qemu-block@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Lieven <pl@kamp.de>, eesposit@redhat.com,
 Aarushi Mehta <mehta.aaru20@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Xie Yongji <xieyongji@bytedance.com>, David Woodhouse <dwmw2@infradead.org>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20230419172817.272758-1-stefanha@redhat.com>
 <20230419172817.272758-9-stefanha@redhat.com>
Organization: Xen Project
In-Reply-To: <20230419172817.272758-9-stefanha@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2023 18:28, Stefan Hajnoczi wrote:
> There is no need to suspend activity between aio_disable_external() and
> aio_enable_external(), which is mainly used for the block layer's drain
> operation.
> 
> This is part of ongoing work to remove the aio_disable_external() API.
> 
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>   hw/i386/kvm/xen_xenstore.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


