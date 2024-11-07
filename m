Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9800C9C0D5A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 18:54:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832142.1247546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t96hz-0005MU-9t; Thu, 07 Nov 2024 17:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832142.1247546; Thu, 07 Nov 2024 17:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t96hz-0005Je-6R; Thu, 07 Nov 2024 17:54:15 +0000
Received: by outflank-mailman (input) for mailman id 832142;
 Thu, 07 Nov 2024 17:54:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cd42=SC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t96hx-0005JY-10
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 17:54:13 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49176ad8-9d31-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 18:54:07 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9a4031f69fso214626266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 09:54:07 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a17b64sm125570866b.39.2024.11.07.09.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 09:54:06 -0800 (PST)
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
X-Inumbo-ID: 49176ad8-9d31-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ5MTc2YWQ4LTlkMzEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDAyMDQ3Ljk0MjM0OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731002047; x=1731606847; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ouFh+uwxQya7zFRHd/ppWV5/JAsH5GlDDv9E4Dq4I+w=;
        b=pB1jENt/Y/AvHXC0BlupryQSeCkZliioqTemjTLg+g8GoRu94lbcBp7wJ2VjN8H7Pf
         xY1abL9m1DLYT4HyzHM9hy7IhfzwjfqQbNzfb8m1yfg1SbMTMpK8tbBdTGsjba08xn7y
         vXkqjalU/CD4FqeJNzPcvsy6at1D4mBYAc+90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731002047; x=1731606847;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ouFh+uwxQya7zFRHd/ppWV5/JAsH5GlDDv9E4Dq4I+w=;
        b=bOxLSuANXoeB2PUIxALx2689hqeXbeyyRZmVKAeY7W6hhsGygniS170v+vmLodcxCc
         9qjJ72BziuwZvygXp/XFDyvfHCWjIBmcZMhs7DennDM1Xtw48RzUarPsCyASnxXw4hYG
         /YvquQIWCDLJFw5BizVCGr7/rk8tOHW0N99OqGAuMpFo2GCrDIxpFYlI4kbH0dWoTZTP
         /GktyO8FhH6T7Y5FdL8chyDPVFMowV+V4nyZ/FA4AhsgMdF7rliXL5hxmNgr3Byko/bu
         ddcPk2BoSwskNgMFxoG0LsgowWu8bEihwLb1OVAjxuyTNvaJvjGFr7+xypuSZKj2yZCs
         W+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVjzVCdIyUXMABUjCgyXyCDhQoYRZWrBx7zrobZ3ncdfJlpIZF5Azt88YaVqxdJrOrSsd0PWRpflpk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynTP5Iun6FHwnSwur0QFsgn+XvMEeju3Z5T1DXOp2fSFOx1lPb
	ZC8CHRdtAO8Ff3bYrg7VsuIxpy6/6gLI7GuviAQVW89BZlf/kzNVlHOX3fPM6uA=
X-Google-Smtp-Source: AGHT+IEo1DlSsBRdQI2Jzyq1eCOq4EFIj3ncqvGkdZW/VB0Sq3Y2xb+RomP0GhwndXt5nj9CQQ1pQA==
X-Received: by 2002:a17:907:7245:b0:a99:f8e2:edec with SMTP id a640c23a62f3a-a9de5d6f21cmr4480182366b.21.1731002047247;
        Thu, 07 Nov 2024 09:54:07 -0800 (PST)
Message-ID: <0579d685-392a-4707-af8c-49445d8e4000@citrix.com>
Date: Thu, 7 Nov 2024 17:54:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TEST_ARTIFACTS PATCH v1] scripts: add lzo to the x86_64 alpine
 rootfs
To: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org
Cc: Victor Lira <victorm.lira@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241107142012.2593333-1-javi.merino@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241107142012.2593333-1-javi.merino@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2024 2:19 pm, Javi Merino wrote:
> In the qemu-alpine-x86_64-gcc test, we want to test libxenguest built
> with all libraries.  If we add lzo-dev to the alpine:3.18 container,
> libxenguest is linked against it.  However, as the initrd in the
> test-artifacts does not contain lzo, the qemu-alpine-x86_64-gcc gitlab
> CI job fails with:
>
>   + bash /etc/init.d/xencommons start
>   Starting /usr/local/sbin/xenstored...
>   /etc/xen/scripts/launch-xenstore: line 90: echo: write error: Invalid argument
>   Setting domain 0 name, domid and JSON config...
>   Error loading shared library liblzo2.so.2: No such file or directory (needed by /usr/local/lib/libxenguest.so.4.20)
>   Error relocating /usr/local/lib/libxenguest.so.4.20: __lzo_init_v2: symbol not found
>   Error relocating /usr/local/lib/libxenguest.so.4.20: lzo1x_decompress_safe: symbol not found
>   Starting xenconsoled...
>   Starting QEMU as disk backend for dom0
>   + xl list
>   Error loading shared library liblzo2.so.2: No such file or directory (needed by /usr/local/lib/libxenguest.so.4.20)
>   Error relocating /usr/local/lib/libxenguest.so.4.20: __lzo_init_v2: symbol not found
>   Error relocating /usr/local/lib/libxenguest.so.4.20: lzo1x_decompress_safe: symbol not found
>   + xl create -c /root/test.cfg
>   Error loading shared library liblzo2.so.2: No such file or directory (needed by /usr/local/lib/libxenguest.so.4.20)
>   Error relocating /usr/local/lib/libxenguest.so.4.20: __lzo_init_v2: symbol not found
>   Error relocating /usr/local/lib/libxenguest.so.4.20: lzo1x_decompress_safe: symbol not found
>    *   Execution of "/etc/local.d/xen.start" failed.
>
> Add lzo to the initrd that becomes the rootfs to install liblzo2.so.2 .
>
> Signed-off-by: Javi Merino <javi.merino@cloud.com>

Ah - this is a good example of the problem I opined about in
https://lore.kernel.org/xen-devel/86a60aec-f259-41be-92a0-ce66ce24f4ae@citrix.com/T/#u

For now, I'll take this and use it as a test of whether I can drive the
new test-artefacts repo.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

