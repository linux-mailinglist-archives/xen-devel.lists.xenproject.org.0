Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B747ED31B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 21:46:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633858.988991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3MlI-0007Lr-8n; Wed, 15 Nov 2023 20:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633858.988991; Wed, 15 Nov 2023 20:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3MlI-0007Ja-5K; Wed, 15 Nov 2023 20:45:24 +0000
Received: by outflank-mailman (input) for mailman id 633858;
 Wed, 15 Nov 2023 20:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vbX4=G4=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r3MlG-0007J3-0X
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 20:45:22 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3f0242d-83f7-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 21:45:20 +0100 (CET)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-66d76904928so433986d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 Nov 2023 12:45:20 -0800 (PST)
Received: from [172.20.0.103] ([12.191.197.195])
 by smtp.gmail.com with ESMTPSA id
 ki10-20020a05622a770a00b00418189b689csm3459337qtb.10.2023.11.15.12.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Nov 2023 12:45:18 -0800 (PST)
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
X-Inumbo-ID: e3f0242d-83f7-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700081119; x=1700685919; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bY+5CSehvVBGtwgNuboXUV3/1/gJ/dZP7ytCrDrqtfQ=;
        b=jBN3pB8mwAS0tI6uYITuQpwx3FqehopnWSjqkysecuW0wNgFXlRjEOQnPM14NC/Ygc
         lQ4NR5FuJem/2Gsusxnr/laQulzns91jjSOPSKi1eEnwcMnB1OUZQc1czQpeFldNdcEW
         u1T9lEK0D2IlGUK3rlXnGCM6QkSOfCECl3pfw3RS6ZMBi5J0NFxSG0fH28imwOwYnxU4
         qxKXdFtQ9e55BSGPYeSoVS5+5oyYMixZxr0Jf1hvrWOmasbJV+hS7PB1GvRkMGLuFi+J
         m59LsEgYq0a9H9s7SZ9oYFx6nA7LdQPI4GaHiDTEO29H1zJbCWtoxRIz/X/uJ41ZpLCY
         4S5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700081119; x=1700685919;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bY+5CSehvVBGtwgNuboXUV3/1/gJ/dZP7ytCrDrqtfQ=;
        b=KBAmp0S+bYaSNAJPBr1ZlUsfUCBCgtlAXwSkI5NyEI2j/owwanY4esBhKdo95DipvA
         FXo2zHYIcA2N3spnSj+YTXR65T2COSDMnhA5YTUgA1n1PFmBWz9Qpc0yMXVBtkKPU/1Z
         dLMwos5/AYbhpVoO/YFOkteZJdSvIHiVPwPuVgITOokro14wpccYolEfjomBSbBZmXRw
         heTRA8ymGkn4ipzlkw8QLgMxtK//o+CAuwA6gHLF7evmHa4/QAr/iGuRFaJtipxEgUny
         lEPo7DIcWPcLxVwKWAvwJmmw3WaxxL/614gXQgMimMwDAwCXffrwFbDhOHlN3wD/S0fg
         mUHg==
X-Gm-Message-State: AOJu0YwB3oefMZhNu79/01yku8u3VBjq/aG+18iocxFOcRuc1aZVPwwn
	qlYjGB1KLmOXSpD9FVMziF8=
X-Google-Smtp-Source: AGHT+IFgPcfE9Xh25SpD1WU5BPRKZgmYrNpCNYZXXrb4uiJ+zbf5znm3WLPnO37uQtF4D2nqSDLRFw==
X-Received: by 2002:a05:6214:1306:b0:66f:ba6e:73e8 with SMTP id pn6-20020a056214130600b0066fba6e73e8mr9414369qvb.41.1700081119356;
        Wed, 15 Nov 2023 12:45:19 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <1388a0c0-cfc2-4957-9bce-08499e9ac84d@xen.org>
Date: Wed, 15 Nov 2023 15:45:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH 3/3] hw/xen: clean up xen_block_find_free_vdev() to avoid
 Coverity false positive
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org,
 qemu-block@nongnu.org
References: <20231115172723.1161679-1-dwmw2@infradead.org>
 <20231115172723.1161679-4-dwmw2@infradead.org>
Content-Language: en-US
Organization: Xen Project
In-Reply-To: <20231115172723.1161679-4-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/11/2023 12:24, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> Coverity couldn't see that nr_existing was always going to be zero when
> qemu_xen_xs_directory() returned NULL in the ENOENT case (CID 1523906).
> 
> Perhaps more to the point, neither could Peter at first glance. Improve
> the code to hopefully make it clearer to Coverity and human reviewers
> alike.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   hw/block/xen-block.c | 24 +++++++++++++++++++++---
>   1 file changed, 21 insertions(+), 3 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


