Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4F3738BA2
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 18:39:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553001.863301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0rf-0008Dc-HC; Wed, 21 Jun 2023 16:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553001.863301; Wed, 21 Jun 2023 16:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC0rf-0008B6-Dp; Wed, 21 Jun 2023 16:39:27 +0000
Received: by outflank-mailman (input) for mailman id 553001;
 Wed, 21 Jun 2023 16:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YJad=CJ=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1qC0re-00084P-Aa
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 16:39:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2db4c203-1052-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 18:39:24 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-yYGTWd02M9S6HE0sRb2wPQ-1; Wed, 21 Jun 2023 12:39:21 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f9b8e0896aso10373785e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 09:39:21 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:9c00:7978:3030:9d9a:1aef?
 (p200300cbc70b9c00797830309d9a1aef.dip0.t-ipconnect.de.
 [2003:cb:c70b:9c00:7978:3030:9d9a:1aef])
 by smtp.gmail.com with ESMTPSA id
 i15-20020a5d558f000000b0030647d1f34bsm5017228wrv.1.2023.06.21.09.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jun 2023 09:39:19 -0700 (PDT)
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
X-Inumbo-ID: 2db4c203-1052-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687365563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KVdFXpPjlqJPMZZKnR2LLT9rdM+KJEhF4WJQ7uIo7nU=;
	b=QUt4h8AiWF2RVdYXIH6cN6AF8ivwSJz3rgkvwt4Nu+3ndMSocVybLD96ynwX78ED7fKdUc
	wWwpED1J0G8Qog5dzNV+iR/2qT75oP3qrPB26mvWVGQvCX81+20+iPXXIz1I2F4pI1yIN0
	D4exGhwaYiOMidbGohMlNFDDUbOdvJU=
X-MC-Unique: yYGTWd02M9S6HE0sRb2wPQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687365560; x=1689957560;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KVdFXpPjlqJPMZZKnR2LLT9rdM+KJEhF4WJQ7uIo7nU=;
        b=YDykgoZ9ZcQ/atmKhAEWYM8X8kt5CaSUla0Czig12AF2V0h09eKx6pA0V3ywENKGzj
         D0yFGDx/NuPGo6+yPfExdX/HqrP4DqkUe1KVpRFjfvin2kOd4ilZnZZYJB89Gd5Ve3cJ
         b5HfLQGf868p7yHt4XFDQ1c0bIzTFO+/jQX7Q9Rf6eByr8/Tl8wvalwltbpRlSIK2nd4
         hxPMZv58O31j/GkpJrFm0AGpBLQZnm9TxVT7FFFD/eo0az/Zq3FwB7wOjwWM5tTOrpor
         4S+C5KRxWIyFUgakBdAWCweLl+z380PyE47+01vo7X/Ue6EYv25AeN90ijrebscgKyAa
         bjKQ==
X-Gm-Message-State: AC+VfDwpQHuH1pcSNDQPc8Sd8dQUBPwUxlYhG0GZ4F4iHVyj5gBqmbuB
	sCl/zrX+nr63m+JgAm7Z+TIzx2zjrNld/XgDFaeFKeGqvyyJVt3BCGSdUKRO4MfHiZRYjFE1en6
	zGSXhw7sIVnwu1wgBnP2zzAOPOxo=
X-Received: by 2002:a7b:ca54:0:b0:3f9:b552:411a with SMTP id m20-20020a7bca54000000b003f9b552411amr5427635wml.37.1687365560788;
        Wed, 21 Jun 2023 09:39:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4GSgto16JJNYZ2WJ0ZyfCBtJqHKd0lHiSEosjndJQ2v2PTuWkp4Ke7AdNvEObPczZZk7pGDA==
X-Received: by 2002:a7b:ca54:0:b0:3f9:b552:411a with SMTP id m20-20020a7bca54000000b003f9b552411amr5427608wml.37.1687365560432;
        Wed, 21 Jun 2023 09:39:20 -0700 (PDT)
Message-ID: <b13cbcd2-9963-e904-9870-15e911a9fe6e@redhat.com>
Date: Wed, 21 Jun 2023 18:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/1] Q35 Support
To: Joel Upham <jupham125@gmail.com>
Cc: Ani Sinha <anisinha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
 qemu-devel@nongnu.org
References: <cover.1687127946.git.jupham125@gmail.com>
 <272947b9494f00bb4ad3e27c050e99f8b61905b3.1687127946.git.jupham125@gmail.com>
 <02b6a8a8-2da7-2864-0c0e-5ed81a560355@redhat.com>
 <CADPhr0kMXxj1SUQggcNQeXY4wSbLNN1-Amqxo3uGVeBMSJmn-g@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CADPhr0kMXxj1SUQggcNQeXY4wSbLNN1-Amqxo3uGVeBMSJmn-g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.06.23 18:35, Joel Upham wrote:
> Sorry, this was sent in error when I did the git send-email for the 
> folder. This was before I broke each patch down (after looking at the 
> Qemu submission guidance). This is my first time sending a patch in this 
> way, so thanks for the understanding. This patch can be ignored, as they 
> are all covered elsewhere.

We've all been there (messing with git send-email), no need to feel bad :)

-- 
Cheers,

David / dhildenb


