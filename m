Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BCD7B7BBD
	for <lists+xen-devel@lfdr.de>; Wed,  4 Oct 2023 11:18:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.612453.952346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qny0k-0007eT-3D; Wed, 04 Oct 2023 09:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 612453.952346; Wed, 04 Oct 2023 09:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qny0k-0007cn-0Z; Wed, 04 Oct 2023 09:17:42 +0000
Received: by outflank-mailman (input) for mailman id 612453;
 Wed, 04 Oct 2023 09:17:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ZP0=FS=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qny0i-0007cf-NM
 for xen-devel@lists.xenproject.org; Wed, 04 Oct 2023 09:17:40 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dabeb42d-6296-11ee-9b0d-b553b5be7939;
 Wed, 04 Oct 2023 11:17:35 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-32320381a07so1871007f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Oct 2023 02:17:35 -0700 (PDT)
Received: from [192.168.69.115] (5ep85-h01-176-173-163-52.dslam.bbox.fr.
 [176.173.163.52]) by smtp.gmail.com with ESMTPSA id
 v11-20020adfedcb000000b0031fd849e797sm3514434wro.105.2023.10.04.02.17.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Oct 2023 02:17:34 -0700 (PDT)
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
X-Inumbo-ID: dabeb42d-6296-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696411054; x=1697015854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Ge25dLyfZqPnHLKJkRxZfdIzoJzl+k+G3DM+FsgNBA=;
        b=yA/0Fb3U0RLjW5wK6cNkuwsHuwDpm72eZ5jW/LmyBXMiugu4lLuTNicek7/VNwpJ8F
         hgsNbXIOYE6awe/RRpK9e5iugNaXl0aEEVy/pxVM2b+0/Qxk+mxMN5WXgxulRKcp3J1q
         vxMNuIafnUdXersxUCQ55lPWW3kExcesh+s8XE3wjDQPruwdkMdDNFPuYui6YcMrA+In
         2xZCyMmeLVXmShZmNWE969nm2wkbtaYY8nYeNJiU0zpClb1cd+Hxm2t0KL3rBhCt46H1
         hZw/tjXC644WpO3Mv2SbByDHj4tZtJU+FRc8HauMJekoqbUEr+0LXr+EBJfG8s22a0pe
         Sikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696411054; x=1697015854;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ge25dLyfZqPnHLKJkRxZfdIzoJzl+k+G3DM+FsgNBA=;
        b=ilsRjcmrfknlR5x+BNSgf0goT5oC2mWLc8nOO25SPLJdOFLP/VpMXyIDGrTfLj7R4k
         Ki3SC+++ij1dumiBHfI8RGt1fOIqMVB5f9wMiacjXYxoVmN8VvcEGRTQ04hUWeL+/5iJ
         z8ce1glTx24qXoagtk048Cl1qlztkty+vjVuZlsOsXiJ+a7CV1EnZi3XTrfZK5VuhIKO
         nEwH4zKw3u7GqdvroA+qI0XA6sIHe+kFDUFga63RyGs0aXphRxVuvYi7XmG1O1HU0I7q
         rOiYmUuJ09i1cpn9AycWNUGcIdObDsoBRnhzfSNY6ctMWzRwGpTyqGYu0PTarz2a74zb
         /cqA==
X-Gm-Message-State: AOJu0YxmTSMEWIICxKr60rSyTXCrxw5BSdhjpiMKN8K9ylZEbie+zMNX
	f8YKY4NxC6htvKYKuU0ZbhIezQ==
X-Google-Smtp-Source: AGHT+IFbxWIy6qhLDZeHwS7GvpzVHTbLuf9DR6vRx/lZ08aaH6xbsi3a+1+KIcqIOVFoeUUzJlcPPQ==
X-Received: by 2002:a5d:544e:0:b0:31f:a256:4bbb with SMTP id w14-20020a5d544e000000b0031fa2564bbbmr1344896wrv.71.1696411054588;
        Wed, 04 Oct 2023 02:17:34 -0700 (PDT)
Message-ID: <a55a4808-6748-fdcc-ab90-829d2a903d03@linaro.org>
Date: Wed, 4 Oct 2023 11:17:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 0/3] sysemu/accel: Simplify sysemu/xen.h
Content-Language: en-US
To: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Cc: Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230905122142.5939-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230905122142.5939-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/9/23 14:21, Philippe Mathieu-Daudé wrote:
> Trivial cleanups which simplify "sysemu/xen.h".
> 
> Philippe Mathieu-Daudé (3):
>    sysemu/xen: Remove unuseful CONFIG_USER_ONLY header guard
>    sysemu/xen: Remove unreachable xen_ram_alloc() code
>    sysemu/xen: Allow elision of xen_hvm_modified_memory()
> 
>   include/exec/ram_addr.h |  8 ++++++--
>   include/sysemu/xen.h    | 24 +++---------------------
>   2 files changed, 9 insertions(+), 23 deletions(-)
> 

ping for trivial patches 1 & 2?

