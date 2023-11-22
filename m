Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE2B7F4DB7
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 18:03:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638928.995913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qdI-00012l-PK; Wed, 22 Nov 2023 17:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638928.995913; Wed, 22 Nov 2023 17:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qdI-00010o-Mo; Wed, 22 Nov 2023 17:03:24 +0000
Received: by outflank-mailman (input) for mailman id 638928;
 Wed, 22 Nov 2023 17:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aeb/=HD=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1r5qdH-00010i-M8
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 17:03:23 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a89efc4-8959-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 18:03:21 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2c871890c12so64180531fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 09:03:21 -0800 (PST)
Received: from [10.95.134.92] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c4fc700b003fefaf299b6sm24729wmq.38.2023.11.22.09.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 09:03:20 -0800 (PST)
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
X-Inumbo-ID: 0a89efc4-8959-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700672601; x=1701277401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kEtUeZ8IRcomJX3U5boVELiXEWRp5E8uCIfp4rw0dVo=;
        b=CYf+5yHVXOi1JGzJCrBtDAahj5q8022leGp42TsKauw4BTdAfPlwt+fJQnkrVb52mV
         9a8W5fJln5lZU6FTG3gFnUUZocB8r3yVU00sRBoLzGzFcvf0yot/7glF5pJlW9u8gLh2
         uz9/ENDds4CNl+O/aPVORM9sTlAFPwH24X2dYoVXOu6CLZ0HV/fQMxnS0WTlNFMdTEJT
         aq0+Ick8f5awImu5koOz9wV5JduFImdMRbeoFtMfj+jmpaoFS+ZYLzb6Gyqo7kxUbdlY
         vfuCWnTY/8MYGx6QIhRJcWD6fvb3P5CWpB+sMJDvF6xt/uwl4EQ34/2czOkXv7Mu8Wae
         n6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700672601; x=1701277401;
        h=content-transfer-encoding:in-reply-to:organization:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kEtUeZ8IRcomJX3U5boVELiXEWRp5E8uCIfp4rw0dVo=;
        b=r0ndtUlPj24Jh24eGdCeaw+D5Kdh34j5rYmiMBOajsbXuxHLaAuH4VCns/Qhbj1usf
         CkKhd9qOcn29HMRrzosJIcxwjZLgpZMqsOQOAR5Ae3T+0uCNvSssLPuQU+TZ1IfBfLI3
         zjEIVHQXUkRZdiIgifIX3VqpI3uRLmxViEHFnkCF/8sautOiEGwBrBI2Ob/2pLcLi+fQ
         Vd5rSiYlhuv49kFirpsC0zYIQM8a9uAxYP09GuCe2y2axhZBujlFC3q4Ci8sp4Epm26j
         kq15A8y/c+m1UXM8uNldljzmGfvJ/NhP5tNwpTSu4u6qbeF1VwpniCzQgrr64xd/jGEo
         PUyQ==
X-Gm-Message-State: AOJu0YwujeMCsUeQSrj1jiquhdjI5ZsTuE3k7i57YTrBDsGR4uW/kVGh
	CMsJ9KknWzDpXB1GKe58VJ4=
X-Google-Smtp-Source: AGHT+IGVFrYCPl+0WYrNSHYpgKmNNL26tpHJL5ZgVWSHvOaQgH6SJCnZv7LvHlPBLONBP4Vyt6XHeQ==
X-Received: by 2002:a2e:3a11:0:b0:2c5:3139:2d04 with SMTP id h17-20020a2e3a11000000b002c531392d04mr2181461lja.47.1700672601055;
        Wed, 22 Nov 2023 09:03:21 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <02fcd3c2-afe2-43f4-8a15-7caa85a147f5@xen.org>
Date: Wed, 22 Nov 2023 17:03:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] xen: backends: touch some XenStore nodes only if
 device...
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
References: <20231121221023.419901-1-volodymyr_babchuk@epam.com>
 <20231121221023.419901-3-volodymyr_babchuk@epam.com>
Reply-To: paul@xen.org
Organization: Xen Project
In-Reply-To: <20231121221023.419901-3-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2023 22:10, Volodymyr Babchuk wrote:
> was created by QEMU
> 
> Xen PV devices in QEMU can be created in two ways: either by QEMU
> itself, if they were passed via command line, or by Xen toolstack. In
> the latter case, QEMU scans XenStore entries and configures devices
> accordingly.
> 
> In the second case we don't want QEMU to write/delete front-end
> entries for two reasons: it might have no access to those entries if
> it is running in un-privileged domain and it is just incorrect to
> overwrite entries already provided by Xen toolstack, because toolstack
> manages those nodes. For example, it might read backend- or frontend-
> state to be sure that they are both disconnected and it is safe to
> destroy a domain.
> 
> This patch checks presence of xendev->backend to check if Xen PV
> device is acting as a backend (i.e. it was configured by Xen

Technally *all* XenDevice objects are backends.

> toolstack) to decide if it should touch frontend entries in XenStore.
> Also, when we need to remove XenStore entries during device teardown
> only if they weren't created by Xen toolstack. If they were created by
> toolstack, then it is toolstack's job to do proper clean-up.
> 


